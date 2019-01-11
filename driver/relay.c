#include "relay.h"
BitStatus  relay_read()
{
return GPIO_ReadInputPin(GPIOE,GPIO_PIN_5);
}
void relay_on()
{
GPIO_Init(GPIOE,GPIO_PIN_5, GPIO_MODE_OUT_PP_HIGH_SLOW);
GPIO_WriteHigh(GPIOE,GPIO_PIN_5);
}
void relay_off()
{
GPIO_Init(GPIOE,GPIO_PIN_5, GPIO_MODE_OUT_PP_LOW_SLOW);
GPIO_WriteLow(GPIOE,GPIO_PIN_5);
}