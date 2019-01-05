#include "stm8s.h"
#include "stm8s_gpio.h"
#include "stm8s_itc.h"
#include "stm8s_uart2.h"

#ifndef UART_H__
#define UART_H__
void Init_UART2(void);
void UART2_Send_STR(unsigned char * src);
void UART2_Send_Char(uint8_t dat);

#endif