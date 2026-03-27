#ifdef GALAX_MODEL_GPU


#include "cuda.h"
#include "kernel.cuh"

namespace
{
float g_last_kernel_ms = 0.0f;
double g_last_gflops_est = 0.0;
bool g_has_last_metrics = false;
}



__global__ void compute_acc(const float4 * __restrict__ positionsMassGPU, const float4 * __restrict__ velocitiesGPU, float4 * __restrict__ accelerationsGPU, int n_particles)
{
   __shared__ float4 tile[128];


   unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
   if (i >= static_cast<unsigned int>(n_particles))
   {
       return;
   }


   (void)velocitiesGPU;


   float3 acceleration = make_float3(0.0f, 0.0f, 0.0f);
   float4 posMass_i = positionsMassGPU[i];

   // Tiling: process particles in blocks loaded into shared memory
   for (int tile_idx = 0; tile_idx < n_particles; tile_idx += blockDim.x)
   {
       // Load tile into shared memory
       int j_global = tile_idx + threadIdx.x;
       if (j_global < n_particles)
       {
           tile[threadIdx.x] = positionsMassGPU[j_global];
       }
       __syncthreads();


       // Process interactions with current tile
       #pragma unroll(32)
       for (int k = 0; k < blockDim.x && (tile_idx + k) < n_particles; ++k)
       {
           if (static_cast<unsigned int>(tile_idx + k) == i)
           {
               continue;
           }


           const float diffx = tile[k].x - posMass_i.x;
           const float diffy = tile[k].y - posMass_i.y;
           const float diffz = tile[k].z - posMass_i.z;
          
           float dij2 = diffx * diffx + diffy * diffy + diffz * diffz;


           const float inv_dij = rsqrtf(fmaxf(dij2, 1.0f));
           const float dij = 10.0f * inv_dij * inv_dij * inv_dij; 
          
           const float mass_j = tile[k].w;


           acceleration.x += diffx * dij * mass_j;
           acceleration.y += diffy * dij * mass_j;
           acceleration.z += diffz * dij * mass_j;
       }
       __syncthreads();
   }
  
   accelerationsGPU[i] = make_float4(acceleration.x, acceleration.y, acceleration.z, 0.0f);
}


__global__ void maj_pos(float4 * __restrict__ positionsMassGPU, float4 * __restrict__ velocitiesGPU, const float4 * __restrict__ accelerationsGPU, int n_particles)
{
   unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
   if (i >= static_cast<unsigned int>(n_particles))
   {
       return;
   }


   float4 velocity = velocitiesGPU[i];
   const float4 acceleration = accelerationsGPU[i];


   velocity.x += acceleration.x * 2.0f;
   velocity.y += acceleration.y * 2.0f;
   velocity.z += acceleration.z * 2.0f;


   positionsMassGPU[i].x += velocity.x * 0.1f;
   positionsMassGPU[i].y += velocity.y * 0.1f;
   positionsMassGPU[i].z += velocity.z * 0.1f;


   velocitiesGPU[i] = velocity;


}


void update_position_cu(float4* __restrict__ positionsMassGPU, float4* __restrict__ velocitiesGPU, float4* __restrict__ accelerationsGPU, int n_particles)
{
   int nthreads = 128;
   int nblocks =  (n_particles + (nthreads -1)) / nthreads;

   static cudaEvent_t start_event = nullptr;
   static cudaEvent_t stop_event = nullptr;
   static bool events_initialized = false;
   static unsigned int step_count = 0;


   if (!events_initialized)
   {
       cudaEventCreate(&start_event);
       cudaEventCreate(&stop_event);
       events_initialized = true;
   }


   cudaEventRecord(start_event);


   compute_acc<<<nblocks, nthreads>>>(positionsMassGPU, velocitiesGPU, accelerationsGPU, n_particles);
   maj_pos    <<<nblocks, nthreads>>>(positionsMassGPU, velocitiesGPU, accelerationsGPU, n_particles);

   cudaEventRecord(stop_event);
   cudaEventSynchronize(stop_event);


   float kernel_ms = 0.0f;
   cudaEventElapsedTime(&kernel_ms, start_event, stop_event);


   ++step_count;
   if ((step_count % 120) == 0 && kernel_ms > 0.0f)
   {
       const double n = static_cast<double>(n_particles);
       const double pair_interactions = n * (n - 1.0);
       const double flop_count_sp_est = 22.0 * pair_interactions + 12.0 * n;
       const double gflops_est = flop_count_sp_est / (static_cast<double>(kernel_ms) * 1.0e6);


       g_last_kernel_ms = kernel_ms;
       g_last_gflops_est = gflops_est;
       g_has_last_metrics = true;
}

}


bool get_last_gpu_metrics_cu(float* kernel_ms, double* gflops_est)
{
    if (kernel_ms == nullptr || gflops_est == nullptr || !g_has_last_metrics)
    {
        return false;
    }

    *kernel_ms = g_last_kernel_ms;
    *gflops_est = g_last_gflops_est;
    return true;
}



#endif // GALAX_MODEL_GPU



