#ifdef GALAX_MODEL_GPU

#ifndef MODEL_GPU_HPP_
#define MODEL_GPU_HPP_

#include "../Model.hpp"

#include <cuda_runtime.h>
#include "kernel.cuh"

class Model_GPU : public Model
{
private:

	std::vector<float3> positionsf3;
	std::vector<float4> positionsMassf4;
	std::vector<float4> velocitiesf4;
	std::vector<float4> accelerationsf4;

	float4* positionsMassGPU;
	float4* velocitiesGPU;
	float4* accelerationsGPU;

	float last_kernel_ms;
	double last_gflops_est;
	bool has_last_gpu_metrics;

public:
	Model_GPU(const Initstate& initstate, Particles& particles);

	virtual ~Model_GPU();

	virtual void step();
	bool get_last_gpu_metrics(float& kernel_ms, double& gflops_est) const;
};
#endif // MODEL_GPU_HPP_

#endif // GALAX_MODEL_GPU
