#include "stm8s.h"
#include "stm8s_gpio.h"
#include "stm8s_itc.h"
#include "stm8s_uart2.h"

#ifndef UART_H__
#define UART_H__
void Init_UART2(void);
void UART2_Send_STR(unsigned char * src);
void UART2_Send_Char(uint8_t dat);
void UART2_Init_Send();//初始化串口，如果是使用透传模块，需要先发送一些信息初始化透传模块。比如串口蓝牙的初始化。
#endif
