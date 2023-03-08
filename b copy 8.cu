#include<stdio.h>


#include<nvml.h>


int main(){

    printf("ohayou nvml\n");
    nvmlInit_v2();
    // nvmlDeviceGetCount ();

    unsigned int device_count;

    unsigned int result;

    result = nvmlDeviceGetCount_v2(&device_count);
    if (NVML_SUCCESS != result)
    {
        printf("cannot use nvml\n");
        // printf("Failed to query device count: %s\n", nvmlErrorString(result));
        // goto Error;
    }


    printf("nvml.h\n");
}