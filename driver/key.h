#ifndef KEY_H__
#define KEY_H__
#include "stm8s.h"
#include "stm8s_gpio.h"
#include "stm8s_exti.h"

// 按键引脚PD0～PD4被按下的次数
extern u8 keycount[5];

void key_init();

// 输入参数0～4
BitStatus key_read(u8 num);


#endif