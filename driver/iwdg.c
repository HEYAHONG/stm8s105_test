#include "iwdg.h"
void WitchDog_init()//初始化
{
  IWDG_Enable();//启动独立看门狗
  IWDG_WriteAccessCmd(IWDG_WriteAccess_Enable);//允许操作独立看门狗
  IWDG_SetPrescaler(IWDG_Prescaler_256);//看门狗预分频
  IWDG_SetReload((uint8_t)0xff);//设置看门狗复位时间
  
}
void WitchDog_reset()//喂狗
{
      IWDG_ReloadCounter();//看门狗复位 正常使用时不想发生看门狗复位，就执行
}
