#include "stm8s.h"
#include "stm8s_adc1.h"
#include "stm8s_gpio.h"

#ifndef ADC_H__
#define ADC_H__
//使用ADC采集YL-69土壤湿度传感器的值，包括一个模拟输出和数字输出
typedef struct  {
u16 Ain;
BitStatus Din;
} ADC_DATA ;
#define ADC_GPIO  GPIOB
#define ADC_PIN  GPIO_PIN_0
#define ADC_CHANEL   ADC1_CHANNEL_0
#define ADC_SCHMITTTRIG   ADC1_SCHMITTTRIG_CHANNEL0

BitStatus ReadDin();
u16 ReadADC();
void extend_board_init();//扩展板控制线初始化
void extend_board_channel_change();//切换通道
extern u8 pos;
#endif
