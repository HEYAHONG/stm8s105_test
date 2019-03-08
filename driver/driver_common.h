#ifndef DRIVER_COMMON_H__
#define DRIVER_COMMON_H__

//包含所有驱动头文件
#include "relay.h"
#include "adc.h"
#include "dht12.h"
#include "ds1302.h"
#include "eeprom.h"
#include "key.h"
#include   "uart.h"
#include   "modbus.h"
#include "beep.h"
#include   "oled.h"
#include  "iwdg.h"
#include "time2.h"
// 将UART用作DEBUG，即printf的输出到串口。不用时取消注释
//#define UART_DEBUG

//驱动初始化
void driver_init();
//驱动循环执行, 用于从外部设备更新数据
void driver_loop();
// 实时时间
extern DS1302_TIME  ds_time;
//实时温湿度
extern  DHT12_DATA dh_data;
//ADC 采集值( YL-69的模拟输出和数字输出)
extern  ADC_DATA adc_data;
#endif
