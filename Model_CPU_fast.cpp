#ifdef GALAX_MODEL_CPU_FAST
#include <cmath>
#include "Model_CPU_fast.hpp"
#include <xsimd/xsimd.hpp>
#include <omp.h>
#include <array>
#include <algorithm>
#include <iostream>  // to verify if data aligned or not
#include <vector>

namespace xs = xsimd;
using b_type = xs::batch<float, xs::avx2>;  // AVX2 has registers of 256 bits, allowing 8 floats to be treated at a time

Model_CPU_fast
::Model_CPU_fast(const Initstate& initstate, Particles& particles)
: Model_CPU(initstate, particles)
{
	// --- Aligned verification ---
    // uintptr_t address = reinterpret_cast<uintptr_t>(particles.x.data());

    // if (address % 32 == 0) {
    //     std::cout << "[CHECK] Dados de Partículas ALINHADOS (32 bytes)." << std::endl;
    // } else {
    //     std::cout << "[WARNING] Dados DESALINHADOS! Offset: " << (address % 32) << std::endl;
    //     std::cout << "Considere usar xsimd::default_allocator no std::vector." << std::endl;
    // }

	// uintptr_t address = reinterpret_cast<uintptr_t>(particles.x.data());
    // if (address % 32 == 0) {
    //     std::cout << "[OK] Aligned!" << std::endl;
    // } else {
    //     std::cout << "[ATTENTION] Desaligned! Offset: " << (address % 32) << std::endl;
    // }
}



void Model_CPU_fast::step()
{
    const int N = n_particles;
    const int BS = b_type::size;

    std::fill(accelerationsx.begin(), accelerationsx.end(), 0.0f);
    std::fill(accelerationsy.begin(), accelerationsy.end(), 0.0f);
    std::fill(accelerationsz.begin(), accelerationsz.end(), 0.0f);

    #pragma omp parallel for schedule(dynamic, 16)
    for (int i = 0; i < N; ++i)
    {
        const float xi = particles.x[i];
        const float yi = particles.y[i];
        const float zi = particles.z[i];

        b_type accx_v(0.0f);
        b_type accy_v(0.0f);
        b_type accz_v(0.0f);

        const b_type xi_b(xi);
        const b_type yi_b(yi);
        const b_type zi_b(zi);

        //FULL BLOCKS (SIMD)
		// The limit N - BS ensures we always have 8 elements to load
        for (int j=0;; j <= N - BS; j += BS)
        {
            const b_type xj = b_type::load_aligned(&particles.x[j]);
            const b_type yj = b_type::load_aligned(&particles.y[j]);
            const b_type zj = b_type::load_aligned(&particles.z[j]);
            const b_type mj = b_type::load_aligned(&initstate.masses[j]);

            const b_type dx = xj - xi_b;
            const b_type dy = yj - yi_b;
            const b_type dz = zj - zi_b;
            const b_type d2 = dx * dx + dy * dy + dz * dz;

            // Precision of 10^-5: sqrt + division (slower than rsqrt, but more precise)
			const b_type inv_d = b_type(1.0f) / xs::sqrt(d2);
            const b_type f = xs::select(d2 < b_type(1.0f), 
                                        b_type(10.0f), 
                                        b_type(10.0f) * inv_d * inv_d * inv_d);

            const b_type common = f * mj;
            accx_v = xs::fma(dx, common, accx_v);
            accy_v = xs::fma(dy, common, accy_v);
            accz_v = xs::fma(dz, common, accz_v);
        }

        // Horizontal reduction to convert the 8-float vector into a single summed float
        float tx = xs::hadd(accx_v);
        float ty = xs::hadd(accy_v);
        float tz = xs::hadd(accz_v);


		//"REMAINDER" (SCALAR)
		// If N is not a multiple of 8, j finishes before N.
		// Pprocess what is left (0 to 7 particles) without SIMD.
        for (int j=0; j < N; ++j)
        {
            const float dx = particles.x[j] - xi;
            const float dy = particles.y[j] - yi;
            const float dz = particles.z[j] - zi;
            const float d2 = dx * dx + dy * dy + dz * dz;
            float f;
            if (d2 < 1.0f) f = 10.0f;
            else {
                float d = std::sqrt(d2);
                f = 10.0f / (d * d * d);
            }
            tx += dx * f * initstate.masses[j];
            ty += dy * f * initstate.masses[j];
            tz += dz * f * initstate.masses[j];
        }

        // Save the final result (SIMD + remainder)
        accelerationsx[i] = tx;
        accelerationsy[i] = ty;
        accelerationsz[i] = tz;
    }

    // Update velocities and positions (vectorized)
    #pragma omp parallel for schedule(static)
    for (int i = 0; i < N; i += BS)
    {
        const int rem = std::min(BS, N - i);
        if (rem == BS)
        {
            b_type vx = b_type::load_aligned(&velocitiesx[i]);
            b_type vy = b_type::load_aligned(&velocitiesy[i]);
            b_type vz = b_type::load_aligned(&velocitiesz[i]);
            const b_type ax = b_type::load_aligned(&accelerationsx[i]);
            const b_type ay = b_type::load_aligned(&accelerationsy[i]);
            const b_type az = b_type::load_aligned(&accelerationsz[i]);

            vx = xs::fma(ax, b_type(2.0f), vx);
            vy = xs::fma(ay, b_type(2.0f), vy);
            vz = xs::fma(az, b_type(2.0f), vz);
            vx.store_aligned(&velocitiesx[i]);
            vy.store_aligned(&velocitiesy[i]);
            vz.store_aligned(&velocitiesz[i]);

            b_type px = b_type::load_aligned(&particles.x[i]);
            b_type py = b_type::load_aligned(&particles.y[i]);
            b_type pz = b_type::load_aligned(&particles.z[i]);
            px = xs::fma(vx, b_type(0.1f), px);
            py = xs::fma(vy, b_type(0.1f), py);
            pz = xs::fma(vz, b_type(0.1f), pz);
            px.store_aligned(&particles.x[i]);
            py.store_aligned(&particles.y[i]);
            pz.store_aligned(&particles.z[i]);
        }
        else
        {
            for (int k = i; k < N; ++k)
            {
                velocitiesx[k] += accelerationsx[k] * 2.0f;
                velocitiesy[k] += accelerationsy[k] * 2.0f;
                velocitiesz[k] += accelerationsz[k] * 2.0f;
                particles.x[k] += velocitiesx[k] * 0.1f;
                particles.y[k] += velocitiesy[k] * 0.1f;
                particles.z[k] += velocitiesz[k] * 0.1f;
            }
        }
    }
}

#endif // GALAX_MODEL_CPU_FAST