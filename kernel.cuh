#ifdef GALAX_MODEL_GPU

#ifndef __KERNEL_CUH__
#define __KERNEL_CUH__

#include <stdio.h>

void update_position_cu(float4* __restrict__ positionsMassGPU, float4* __restrict__ velocitiesGPU, float4* __restrict__ accelerationsGPU, int n_particles);
bool get_last_gpu_metrics_cu(float* kernel_ms, double* gflops_est);
#endif

#endif // GALAX_MODEL_GPU
