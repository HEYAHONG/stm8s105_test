#include "driver_common.h"
#include "stm8s.h"
#include "stm8s_gpio.h"

#ifndef BEEP_H__
#define BEEP_H__
void beep_init();
void beep_on();
void beep_off();

#endif