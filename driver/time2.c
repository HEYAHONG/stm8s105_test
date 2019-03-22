#include "time2.h"
u32 modbus_timer=0,dht12_timer=60000,ds_1302_timer=0,adc_timer=60000;
void Tim2_Init(void)
{
  TIM2_DeInit();
  TIM2_TimeBaseInit(TIM2_PRESCALER_16,1000);
  TIM2_ITConfig(TIM2_IT_UPDATE , ENABLE);//中断配置与使能函数
  TIM2_ARRPreloadConfig(ENABLE);//使能数值自动重装载功能
  TIM2_Cmd(ENABLE);//开定时器
}
