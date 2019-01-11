#include "driver_common.h"
void driver_init()
{

//Initialize UART
 Init_UART2();
 OLED_Init();
 ds1302_active();
 key_init();
 OLED_Clear();
 enableInterrupts(); 
}
