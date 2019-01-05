#ifndef DS1302_H
#define DS1302_H
#include "stm8s.h"
#include "stm8s_gpio.h"


//相关宏定义修正
#define GPIO_Mode_Out_PP_High_Fast GPIO_MODE_OUT_PP_HIGH_FAST
#define GPIO_Mode_In_FL_No_IT  GPIO_MODE_IN_PU_NO_IT
#define  GPIO_Mode_Out_OD_HiZ_Fast  GPIO_MODE_OUT_OD_HIZ_FAST
#define GPIO_LOW   GPIO_WriteLow
#define GPIO_HIGH   GPIO_WriteHigh
#define GPIO_ReadInputDataBit GPIO_ReadInputPin
 
//DS1302相关PIN 
#define DS1302_PORT       GPIOB
#define DS1302_PORT_RST   GPIOB
 
#define DS1302_RST_PIN  GPIO_PIN_1
#define DS1302_IO_PIN   GPIO_PIN_2
#define DS1302_CLK_PIN  GPIO_PIN_3
 
#define DS1302_SEC_REG 0x80 
#define DS1302_MIN_REG 0x82 
#define DS1302_HR_REG 0x84 
#define DS1302_DATE_REG 0x86 
#define DS1302_MONTH_REG 0x88 
#define DS1302_DAY_REG 0x8a 
#define DS1302_YEAR_REG 0x8c 
#define DS1302_CONTROL_REG 0x8e 
#define DS1302_CHARGER_REG 0x90 
#define DS1302_CLKBURST_REG 0xbe 
 
#define DS1302_RAM_REG 0xc0 
 
typedef struct _DS1302_TIME
{
  unsigned char year;
  unsigned char month;
  unsigned char day;
  unsigned char week;
  unsigned char hour;
  unsigned char minute;
  unsigned char second;
  
}DS1302_TIME;
extern void ds1302_port_deinit(void);
extern void ds1302_port_init(void);
extern unsigned char ds1302_check(void);
extern void ds1302_write_time(DS1302_TIME* time);
extern void ds1302_read_time(DS1302_TIME* time);
extern void ds1302_write_ram(unsigned char ram_num,unsigned char dat);
extern unsigned char  ds1302_read_ram(unsigned char ram_num); 
#endif
