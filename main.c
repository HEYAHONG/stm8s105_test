/**
  ******************************************************************************
  * @file    Project/main.c
  * @author  MCD Application Team
  * @version V2.3.0
  * @date    16-June-2017
  * @brief   Main program body
   ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; COPYRIGHT 2014 STMicroelectronics</center></h2>
  *
  * Licensed under MCD-ST Liberty SW License Agreement V2, (the "License");
  * You may not use this file except in compliance with the License.
  * You may obtain a copy of the License at:
  *
  *        http://www.st.com/software_license_agreement_liberty_v2
  *
  * Unless required by applicable law or agreed to in writing, software
  * distributed under the License is distributed on an "AS IS" BASIS,
  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  * See the License for the specific language governing permissions and
  * limitations under the License.
  *
  ******************************************************************************
  */


/* Includes ------------------------------------------------------------------*/
#include "stm8s.h"
#include "stm8s_gpio.h"
#include "stm8s_itc.h"
#include "stm8s_uart2.h"
#include "oled.h"
#include "bmp.h"
#include "adc.h"
#include "stdio.h"
/* Private defines -----------------------------------------------------------*/
/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/
#define LED_GPIO_PORT  (GPIOE)
#define LED_GPIO_PINS  (GPIO_PIN_5)
void Delay(uint16_t nCount)
{
  /* Decrement nCount value */
  while (nCount != 0)
  {
    nCount--;
  }
}
void Init_UART2(void)
{
	UART2_DeInit();
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


void main(void)
{

/* Initialize I/Os in Output Mode */
  GPIO_Init(LED_GPIO_PORT, (GPIO_Pin_TypeDef)LED_GPIO_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
//Initialize UART1
 Init_UART2();
 OLED_Init();
 OLED_Clear();
 enableInterrupts(); //使能中断

 OLED_ShowString(0,0,"STM8 Started!");
 printf("STM8 Started!\r\n");
  /* Infinite loop */
  while (1)
  {
  /* Toggles LEDs */
    u8  temp[10];
    sprintf(temp,"%4d",ReadADC());
    printf("%s",temp);
    OLED_ShowString(0,2,temp);
    GPIO_WriteReverse(LED_GPIO_PORT, (GPIO_Pin_TypeDef)LED_GPIO_PINS);
    Delay(0xffff);
  }

}

#ifdef USE_FULL_ASSERT

/**
  * @brief  Reports the name of the source file and the source line number
  *   where the assert_param error has occurred.
  * @param file: pointer to the source file name
  * @param line: assert_param error line source number
  * @retval : None
  */
void assert_failed(u8* file, u32 line)
{
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */

  /* Infinite loop */
  while (1)
  {
  }
}
#endif


/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
