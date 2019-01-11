#include "stm8s.h"
#include "stm8s_adc1.h"
#include "stm8s_gpio.h"

#ifndef ADC_H__
#define ADC_H__

#define ADC_GPIO  GPIOB
#define ADC_PIN  GPIO_PIN_0
#define ADC_CHANEL   ADC1_CHANNEL_0
#define ADC_SCHMITTTRIG   ADC1_SCHMITTTRIG_CHANNEL0
BitStatus ReadDin();
u16 ReadADC();
#endif
