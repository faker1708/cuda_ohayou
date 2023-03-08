import pynvml
import time
 
while 1:
    pynvml.nvmlInit() # 初始化
 
    # 获取GPU i的handle，后续通过handle来处理
    handle = pynvml.nvmlDeviceGetHandleByIndex(0)
  
    gpuTemperature = pynvml.nvmlDeviceGetTemperature(handle, 0) #读取温度
    print("温度：", gpuTemperature, "摄氏度")
    time.sleep(5) # 每5s测一次温度
 
    if gpuTemperature>90:
        print("温度超过90了！")
        break
 
    #最后关闭管理工具
    pynvml.nvmlShutdown() 