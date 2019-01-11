#ifndef DRIVER_COMMON_H__
#define DRIVER_COMMON_H__

//包含所有驱动头文件
#include "adc.h"
#include "dht12.h"
#include "ds1302.h"
#include "eeprom.h"
#include "key.h"
#include   "uart.h"
#include "beep.h"
#include   "oled.h"
// 将UART用作DEBUG，即printf的输出到串口。不用时取消注释
//#define UART_DEBUG

void driver_init();
#endif
