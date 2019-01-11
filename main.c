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
#include "stm8s_clk.h"

//#include "oled.h"
//#include "bmp.h"
//#include "uart.h"
//#include "ds1302.h"
//#include "dht12.h"
//#include "key.h"
//#include "adc.h"
//#include "eeprom.h"
#include "driver_common.h"
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



void main(void)
{

/* Initialize I/Os in Output Mode */
  GPIO_Init(LED_GPIO_PORT, (GPIO_Pin_TypeDef)LED_GPIO_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
  GPIO_Init(GPIOF,GPIO_PIN_4, GPIO_MODE_IN_FL_NO_IT);
 driver_init(); //驱动初始化
//Initialize UART
 //Init_UART2();
// OLED_Init();
//ds1302_active();
 //key_init();
 //OLED_Clear();
// eeprom_write(10,108);
// enableInterrupts(); //使能中断

 OLED_ShowString(0,0,"STM8 Started!");
 printf("STM8 Started!\r\n");
  {//测试峰鸣器（PD7）
	GPIO_Init(GPIOD, GPIO_PIN_7, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_WriteHigh(GPIOD,GPIO_PIN_7);
	Delay(0xffff);
	GPIO_WriteLow(GPIOD,GPIO_PIN_7);

  }
  /* Infinite loop */
  while (1)
  {
  /* Toggles LEDs */
   { u8  temp[10];
    sprintf(temp,"V:%4d,S:%1d %d",ReadADC(),GPIO_ReadInputPin(GPIOF,GPIO_PIN_4)==RESET?0:1,eeprom_read(10));
    printf("%s",temp);
    printf("\r\n");
    OLED_ShowString(0,2,temp);
    }
    {
   // ds1302_port_init();
    //if(ds1302_check())
    {
    u8  temp[10];
    DS1302_TIME  ds_time;
    ds1302_read_time(&ds_time);
    sprintf(temp,"%2d/%2d/%2d",ds_time.hour/16*10+ds_time.hour%16,ds_time.minute/16*10+ds_time.minute%16,ds_time.second/16*10+ds_time.second%16);
    printf("%s",temp);
    printf("\r\n");
    OLED_ShowString(0,4,temp);
    }
   // ds1302_port_deinit();
   }
   {
    static u8 count=0;

    if(count>=2)
    {
    DHT12_DATA data;
    unsigned char temp[20];
    ReadDHT12(&data);
    sprintf(temp,"%2d.%1dC/%2d.%1d%%/%3d",data.T,data.T1,data.W,data.W1,data.sum);
    printf("%s",temp);
    printf("\r\n");
    OLED_ShowString(0,6,temp);
    count=0;
    
   }
    count++;
    }
    {
    u8  temp[20];
    sprintf(temp,"%2d/%2d/%2d/%2d/%2d",keycount[0],keycount[1],keycount[2],keycount[3],keycount[4]);
    printf("%s",temp);
    printf("\r\n");
    OLED_ShowString(0,0,temp);
    }
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
