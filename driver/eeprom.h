#include "stm8s.h"
#include "stm8s_flash.h"
#ifndef EEPROM_H__
#define EEPROM_H__
//EEPROM 基地址
#define ADDR_OFFSET 0x4000
//stm8s105共1024字节eeprom，num的范围为0～1023.

u8 eeprom_read(u32 num);

u8 eeprom_write(u32 num,u8 data);

#endif