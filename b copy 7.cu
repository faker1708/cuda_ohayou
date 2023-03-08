#include <cuda_runtime.h>
#include<nvml.h>
#include <device_launch_parameters.h>
#include<stdio.h>

int main(){
	cudaError_t cudaStatus;
	int num;
	cudaDeviceProp prop;
	cudaStatus = cudaGetDeviceCount(&num);
	printf("deviceCount := %d\n",num);
	for(int i=0;i<num;i++){
		cudaGetDeviceProperties(&prop,i);
		printf("name:%s\n",prop.name);
		printf("totalGlobalMem:%d\n",prop.totalGlobalMem);
		printf("totalGlobalMem:%d\n",prop.totalGlobalMem/1024);
		printf("totalGlobalMem:%d\n",prop.totalGlobalMem/1024/1024);
		printf("totalGlobalMem:%d\n",prop.totalGlobalMem/1024/1024/1024);
		printf("multiProcessorCount:%d\n",prop.multiProcessorCount);
		printf("maxThreadsPerBlock:%d\n",prop.maxThreadsPerBlock);
		printf("major:%d,minor:%d\n",prop.major,prop.minor);
        // printf("%d\n",prop.DeviceGetTemperature);
	}

	return 0;
}