#include <iostream>
#include <vector>
#include <fstream>
#include <sstream>
#include <cstdlib>
#include <ctime>
#include <string.h>
#include <cuda_runtime.h>
// #include <windows.h>
#include "nvml.h"

int main(int argc, char* argv[])
{
    nvmlReturn_t result0;
    unsigned int device_count;
    result0 = nvmlInit();

    result0 = nvmlDeviceGetCount(&device_count);
    if (NVML_SUCCESS != result0)
    {
        std::cout << "Failed to query device count: " << nvmlErrorString(result0);
        return -1;
    }
    std::cout << "Found" << device_count <<" device" << std::endl;
    std::stringstream availGPUTxt;

    for (int i=0; i<device_count; i++)
    {
        nvmlDevice_t device;
        nvmlPciInfo_t pci;
        result0 = nvmlDeviceGetHandleByIndex(i, &device);
        if (NVML_SUCCESS != result0)
        {
            std::cout << "Failed to get device count: " << nvmlErrorString(result0);
            return -1;
        }

        char name[NVML_DEVICE_NAME_BUFFER_SIZE];
        result0 = nvmlDeviceGetName(device, name, NVML_DEVICE_NAME_BUFFER_SIZE);
        if (NVML_SUCCESS != result0)
        {
            std::cout << "Failed to get device name: " << nvmlErrorString(result0);
            return -1;
        }

        nvmlUtilization_t utilization;
        result0 = nvmlDeviceGetUtilizationRates(device, &utilization);
        if (NVML_SUCCESS != result0)
        {
            std::cout << "Failed to get utilization rates: " << nvmlErrorString(result0);
            return -1;
        }

        nvmlMemory_t memory;
        result0 = nvmlDeviceGetMemoryInfo(device, &memory);
        if (NVML_SUCCESS != result0)
        {
            std::cout << "Failed to get memory info: " << nvmlErrorString(result0);
            return -1;
        }

        availGPUTxt << "-----------------------------------------------------------" << std::endl;
        availGPUTxt << "CUDA NVML" << std::endl;
        availGPUTxt << "第" << i << "块显卡" << std::endl;
        availGPUTxt << "GPU name:" << name << std::endl;
        availGPUTxt << "----- 使用率: -----" << std::endl;
        availGPUTxt << "GPU使用率:" << utilization.gpu << std::endl;
        availGPUTxt << "显存使用率:" << utilization.memory << std::endl;
         // Byte->KB->MB->GB
        availGPUTxt << "全部可用显存:" << (float)(memory.total)/1024.0f/1024.0f/1024.0f << "GB" << std::endl;
        availGPUTxt << "剩余可用显存:" << (float)(memory.free)/1024.0f/1024.0f/1024.0f << "GB" << std::endl;
        availGPUTxt << "-----------------------------------------------------------" << std::endl;
    }
    
    std::string fileFitBetaName = "E:\\test\\availGPUTest.txt";
    std::ofstream fileFitBetaInfo(fileFitBetaName, std::ios::out|std::ios::binary|std::ios::ate);
    fileFitBetaInfo.write((char*)availGPUTxt.str().c_str(), (int)availGPUTxt.str().length());
    fileFitBetaInfo.close();

    return 0;
}
