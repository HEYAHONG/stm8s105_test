#include "driver_common.h"
#include "stm8s.h"
#include "stm8s_gpio.h"

#ifndef RELAY_H__
#define RELAY_H__
BitStatus  relay_read();
void relay_on();
void relay_off();

#endif