#include "driver_common.h"
#include "adc.h"

u16 ReadADC()
{

ADC1_DeInit();
ADC1_ClearFlag(ADC1_FLAG_EOC);//软件清除

GPIO_Init(ADC_GPIO,ADC_PIN,GPIO_MODE_IN_FL_NO_IT);//AIN4 IO设置为悬浮输入

  ADC1_PrescalerConfig(ADC1_PRESSEL_FCPU_D2);//预分频2

  ADC1_ExternalTriggerConfig(ADC1_EXTTRIG_TIM,DISABLE);//不使用外部触发

 // ADC1_SchmittTriggerConfig(ADC_SCHMITTTRIG,DISABLE);

  //禁止AIN2 AIN4的施密特触发器，降低IO静态功耗

  //PD5,PD6上的通道如果施密特方式禁用会导致串口无法收发数据！

  

   ADC1_ConversionConfig(ADC1_CONVERSIONMODE_SINGLE,//单次转换

                        ADC_CHANEL,//只能选择一个通道！

                        ADC1_ALIGN_RIGHT);//右对齐

    ADC1_Cmd(ENABLE);//开启ADC
   ADC1_StartConversion();
    while(!ADC1_GetFlagStatus(ADC1_FLAG_EOC));//等待转换完成

    ADC1_ClearFlag(ADC1_FLAG_EOC);//软件清除
    u16 ret=ADC1_GetConversionValue();//从ADC_DR中读取ADC值
    ADC1_DeInit();
    return ret;

}

BitStatus ReadDin()
{
GPIO_Init(GPIOF, GPIO_PIN_4, GPIO_MODE_IN_FL_NO_IT);
return  GPIO_ReadInputPin(GPIOF,GPIO_PIN_4);
}
