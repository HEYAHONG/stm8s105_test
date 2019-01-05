#include "uart.h"

void Init_UART2(void)
{
	UART2_DeInit();
        GPIO_Init(GPIOD, GPIO_PIN_5, GPIO_MODE_OUT_OD_LOW_FAST);
        GPIO_Init(GPIOD, GPIO_PIN_6, GPIO_MODE_IN_FL_NO_IT);
        
	UART2_Init((u32)115200, UART2_WORDLENGTH_8D, UART2_STOPBITS_1,
UART2_PARITY_NO, UART2_SYNCMODE_CLOCK_DISABLE, UART2_MODE_TXRX_ENABLE);

        UART2_ITConfig(UART2_IT_RXNE_OR, ENABLE);

	UART2_Cmd(ENABLE);
}

void UART2_Send_Char(uint8_t dat)
{
  while(( UART2_GetFlagStatus(UART2_FLAG_TXE)==RESET));

		UART2_SendData8(dat);

}

void UART2_Send_STR(unsigned char * src)
{
while(*src !='\0')
{
UART2_Send_Char(*src++);
}
}
int putchar(int dat) //support printf function
{
  while(( UART2_GetFlagStatus(UART2_FLAG_TXE)==RESET));

                UART2_SendData8((u8)dat);
return 0;
}