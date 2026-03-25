#ifndef PARTICLES_HPP_
#define PARTICLES_HPP_

#include <xsimd/xsimd.hpp>
#include <vector>

template <typename T>
using aligned_vector = std::vector<T, xsimd::default_allocator<T>>;

struct Particles
{
	// std::vector<float> x;
	// std::vector<float> y;
	// std::vector<float> z;

	// Aligned
	aligned_vector<float> x;
    aligned_vector<float> y;
    aligned_vector<float> z;

	Particles(const int n_particles);
};

#endif // PARTICLES_HPP_
