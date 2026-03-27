#ifdef GALAX_MODEL_GPU

#include <cmath>
#include <iostream>

#include "Model_GPU.hpp"
#include "kernel.cuh"


inline bool cuda_malloc(void ** __restrict__ devPtr, size_t size)
{
	cudaError_t cudaStatus;
	cudaStatus = cudaMalloc(devPtr, size);
	if (cudaStatus != cudaSuccess)
	{
		std::cout << "error: unable to allocate buffer" << std::endl;
		return false;
	}
	return true;
}

inline bool cuda_memcpy(void * __restrict__ dst, const void * __restrict__ src, size_t count, enum cudaMemcpyKind kind)
{
	cudaError_t cudaStatus;
	cudaStatus = cudaMemcpy(dst, src, count, kind);
	if (cudaStatus != cudaSuccess)
	{
		std::cout << "error: unable to copy buffer" << std::endl;
		return false;
	}
	return true;
}

void update_position_gpu(float4* __restrict__ positionsMassGPU, float4* __restrict__ velocitiesGPU, float4* __restrict__ accelerationsGPU, int n_particles)
{
	update_position_cu(positionsMassGPU, velocitiesGPU, accelerationsGPU, n_particles);
	cudaError_t cudaStatus;
	cudaStatus = cudaDeviceSynchronize();
	if (cudaStatus != cudaSuccess)
		std::cout << "error: unable to synchronize threads" << std::endl;
}


Model_GPU
::Model_GPU(const Initstate& initstate, Particles& particles)
: Model(initstate, particles),
	positionsf3(n_particles),
	positionsMassf4(n_particles),
	velocitiesf4(n_particles),
	accelerationsf4(n_particles),
	last_kernel_ms(0.0f),
	last_gflops_est(0.0),
	has_last_gpu_metrics(false)
{
	// init cuda
	cudaError_t cudaStatus;

	cudaStatus = cudaSetDevice(0);
	if (cudaStatus != cudaSuccess)
		std::cout << "error: unable to setup cuda device" << std::endl;

	for (int i = 0; i < n_particles; i++)
	{
		positionsf3[i].x = initstate.positionsx [i];
		positionsf3[i].y = initstate.positionsy [i];
		positionsf3[i].z = initstate.positionsz [i];
		positionsMassf4[i].x = initstate.positionsx [i];
		positionsMassf4[i].y = initstate.positionsy [i];
		positionsMassf4[i].z = initstate.positionsz [i];
		positionsMassf4[i].w = initstate.masses[i];
		velocitiesf4[i].x = initstate.velocitiesx[i];
		velocitiesf4[i].y = initstate.velocitiesy[i];
		velocitiesf4[i].z = initstate.velocitiesz[i];
		velocitiesf4[i].w = 0.0f;
		accelerationsf4[i].x = 0;
		accelerationsf4[i].y = 0;
		accelerationsf4[i].z = 0;
		accelerationsf4[i].w = 0.0f;
	}

	cuda_malloc((void**)&positionsMassGPU, n_particles * sizeof(float4));
	cuda_malloc((void**)&velocitiesGPU, n_particles * sizeof(float4));
	cuda_malloc((void**)&accelerationsGPU, n_particles * sizeof(float4));

	cuda_memcpy(positionsMassGPU, positionsMassf4.data(), n_particles * sizeof(float4), cudaMemcpyHostToDevice);
	cuda_memcpy(velocitiesGPU, velocitiesf4.data(), n_particles * sizeof(float4), cudaMemcpyHostToDevice);
	cuda_memcpy(accelerationsGPU, accelerationsf4.data(), n_particles * sizeof(float4), cudaMemcpyHostToDevice);
}

Model_GPU
::~Model_GPU()
{
	cudaFree(positionsMassGPU);
	cudaFree(velocitiesGPU);
	cudaFree(accelerationsGPU);
}

void Model_GPU
::step()
{
	update_position_gpu(positionsMassGPU, velocitiesGPU, accelerationsGPU, n_particles);
	if (get_last_gpu_metrics_cu(&last_kernel_ms, &last_gflops_est))
	{
		has_last_gpu_metrics = true;
	}
	cuda_memcpy(positionsMassf4.data(), positionsMassGPU, n_particles * sizeof(float4), cudaMemcpyDeviceToHost);
	for (int i = 0; i < n_particles; i++)
	{
		positionsf3[i].x = positionsMassf4[i].x;
		positionsf3[i].y = positionsMassf4[i].y;
		positionsf3[i].z = positionsMassf4[i].z;
		particles.x[i] = positionsf3[i].x;
		particles.y[i] = positionsf3[i].y;
		particles.z[i] = positionsf3[i].z;
	}
}


bool Model_GPU
::get_last_gpu_metrics(float& kernel_ms, double& gflops_est) const
{
	if (!has_last_gpu_metrics)
	{
		return false;
	}

	kernel_ms = last_kernel_ms;
	gflops_est = last_gflops_est;
	return true;
}

#endif // GALAX_MODEL_GPU
