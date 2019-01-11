#include "driver_common.h"
#include "key.h"
u8 keycount[5]={0,0,0,0,0};
void key_init()
{
GPIO_Init(GPIOD,GPIO_PIN_0,GPIO_MODE_IN_PU_IT);
GPIO_Init(GPIOD,GPIO_PIN_1,GPIO_MODE_IN_PU_IT);
GPIO_Init(GPIOD,GPIO_PIN_2,GPIO_MODE_IN_PU_IT);
GPIO_Init(GPIOD,GPIO_PIN_3,GPIO_MODE_IN_PU_IT);
GPIO_Init(GPIOD,GPIO_PIN_4,GPIO_MODE_IN_PU_IT);
EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOD,EXTI_SENSITIVITY_FALL_ONLY);
EXTI_SetTLISensitivity(EXTI_TLISENSITIVITY_FALL_ONLY);
}
BitStatus key_read(u8 num)
{

return GPIO_ReadInputPin(GPIOD,GPIO_PIN_0 << num);

}
