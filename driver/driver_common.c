#include "driver_common.h"
void driver_init()
{
ds1302_active();
 key_init();
 beep_init();
//Initialize UART
 Init_UART2();
 OLED_Init();
 OLED_Clear();
 enableInterrupts(); 
}
