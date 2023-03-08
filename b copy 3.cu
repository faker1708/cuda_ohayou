#include <stdio.h>
#include <stdlib.h>
#include <cuda_runtime.h>
#include <unistd.h> // sleep

__global__ void add()
{
    
    // sleep(1000);
}

int main(){
    printf("cuda test\n");
    float* a;
    for(int i = 0;i<=11-1;i++){
        cudaMalloc((void**)&a,1<<30);

    }
    sleep(1000);
}