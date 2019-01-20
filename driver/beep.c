#include "beep.h"
void beep_init()
{
GPIO_Init(GPIOD, GPIO_PIN_7, GPIO_MODE_OUT_OD_LOW_SLOW);
}

BitStatus beep_read()
{
return GPIO_ReadInputPin(GPIOD,GPIO_PIN_7);
}
void beep_on()
{
GPIO_Init(GPIOD, GPIO_PIN_7, GPIO_MODE_OUT_PP_HIGH_SLOW);
GPIO_WriteHigh(GPIOD,GPIO_PIN_7);
}
void beep_off()
{
GPIO_Init(GPIOD, GPIO_PIN_7, GPIO_MODE_OUT_PP_LOW_SLOW);
GPIO_WriteLow(GPIOD,GPIO_PIN_7);
}
