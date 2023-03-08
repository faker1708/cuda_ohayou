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
    printf("检查是否能申请到那么多显存，这个程序感觉没啥用。算了。中止。\n")

    float* a;
    for(int i = 0;i<=6-1;i++){
        cudaMalloc((void**)&a,1<<30);

    }
    for(int i = 0;i<=4-1;i++){
        cudaMalloc((void**)&a,1<<30);

    }
    for(int i = 0;i<=1024-1;i++){
    
        cudaMalloc((void**)&a,(1)<<20);
    }

    // cudaMalloc((void**)&a,(1)* 1<<20);
    sleep(1000);
}