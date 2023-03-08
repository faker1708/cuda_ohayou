#include <stdio.h>
#include <stdlib.h>
#include <cuda_runtime.h>

/**
 * @brief print device properties
 * 
 * @param prop 
 */
void showDeviceProp(cudaDeviceProp &prop) {
    printf("Device name: %s\n", prop.name);
    printf("  Compute capability: %d.%d\n", prop.major, prop.minor);
    printf("  Clock rate: %d\n", prop.clockRate);
    printf("  Memory clock rate: %d\n", prop.memoryClockRate);
    printf("  Memory bus width: %d\n", prop.memoryBusWidth);
    printf("  Peak memory bandwidth: %d\n", prop.memoryBusWidth);
    printf("  Total global memory: %lu\n", prop.totalGlobalMem);
    printf("  Total shared memory per block: %lu\n", prop.sharedMemPerBlock);
    printf("  Total registers per block: %d\n", prop.regsPerBlock);
    printf("  Warp size: %d\n", prop.warpSize);
    printf("  Maximum memory pitch: %lu\n", prop.memPitch);
    printf("  Maximum threads per block: %d\n", prop.maxThreadsPerBlock);
    printf("  Maximum dimension of block: %d x %d x %d\n", prop.maxThreadsDim[0], prop.maxThreadsDim[1], prop.maxThreadsDim[2]);
    printf("  Maximum dimension of grid: %d x %d x %d\n", prop.maxGridSize[0], prop.maxGridSize[1], prop.maxGridSize[2]);
    printf("  Maximum memory alloc size: %lu\n", prop.totalConstMem);
    printf("  Texture alignment: %lu\n", prop.textureAlignment);
    printf("  Concurrent copy and execution: %s\n", prop.deviceOverlap ? "Yes" : "No");
    printf("  Number of multiprocessors: %d\n", prop.multiProcessorCount);
    printf("  Kernel execution timeout: %s\n", prop.kernelExecTimeoutEnabled ? "Yes" : "No");
    printf("  Integrated GPU sharing Host Memory: %s\n", prop.integrated ? "Yes" : "No");
}

int main() {
    int num_devices;
    cudaDeviceProp properties;
    cudaGetDeviceCount(&num_devices);
    printf("%d CUDA devices found\n", num_devices);
    for (int i = 0; i < num_devices; i++) {
        cudaGetDeviceProperties(&properties, i);
        printf("Device %d: \"%s\"\n", i, properties.name);
        showDeviceProp(properties);
    }

    return 0;
}
