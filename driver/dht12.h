#include "stm8s.h"
#include "stm8s_i2c.h"
#ifndef DHT12_H__
#define DHT12_H__

typedef struct _DHT12_DATA
{
u8   T;
u8   T1;
u8    W;
u8   W1;
u8 sum;
} DHT12_DATA;
void ReadDHT12(DHT12_DATA *data);
#endif