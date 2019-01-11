#include "beep.h"
void beep_init()
{
GPIO_Init(GPIOD, GPIO_PIN_7, GPIO_MODE_IN_FL_NO_IT);
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