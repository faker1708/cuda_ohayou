#include <cuda_runtime.h>
#include<nvml.h>
int main(){

    
    unsigned int device_count;


     nvmlDeviceGetCount(&device_count);
    //  nvmlDeviceGetCount_v2(&device_count);
}