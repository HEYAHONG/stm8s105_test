#include "driver_common.h"
#include "uart.h"

void Init_UART2(void)
{
	UART2_DeInit();
        GPIO_Init(GPIOD, GPIO_PIN_5, GPIO_MODE_OUT_PP_LOW_FAST);
        GPIO_Init(GPIOD, GPIO_PIN_6, GPIO_MODE_IN_FL_NO_IT);

	UART2_Init((u32)9600, UART2_WORDLENGTH_8D, UART2_STOPBITS_1,
UART2_PARITY_NO, UART2_SYNCMODE_CLOCK_DISABLE, UART2_MODE_TXRX_ENABLE);

        UART2_ITConfig(UART2_IT_RXNE, ENABLE);
	ITC_SetSoftwarePriority(ITC_IRQ_UART2_RX, ITC_PRIORITYLEVEL_3);
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
#ifdef UART_DEBUG
  while(( UART2_GetFlagStatus(UART2_FLAG_TXE)==RESET));

                UART2_SendData8((u8)dat);
#endif
return 0;
}

void UART2_Init_Send()
{
//³õÊ¼»¯BT-08BÀ¶ÑÀÀ¶ÑÀÍ¸´«Ä£¿é
UART2_Send_STR("AT\r\n");
UART2_Send_STR("AT+NAMEHYH\r\n");
UART2_Send_STR("AT+PIN1122\r\n");
}
