#include <stdio.h>
#include <stdlib.h>
#include <cuda_runtime.h>

__global__ void mykernel(void) {
    int col_index = threadIdx.x + blockIdx.x * blockDim.x;
    int row_index = threadIdx.y + blockIdx.y * blockDim.y;
    // system("pause");
    printf("hello from (%d,%d) \n",row_index,col_index);
}

int main(void) {
    dim3 grid(2,3);
    dim3 block(3,5);
    mykernel<<<grid, block>>>();
    // synchronize the device
    cudaDeviceSynchronize();
}   