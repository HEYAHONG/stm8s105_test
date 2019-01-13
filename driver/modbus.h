#include "stm8s.h"
#ifndef  MODBUS_H__
#define  MODBUS_H__
//CRC16计算，用于兼容modbus
u16 CRC16(u8 *arr_buff,u8 len);
//状态标志，0～7  表示下一个接收的数据在接收缓冲的位置.超过7表示其它含义（如接收完成）
extern u8  modbus_status;
//接收发送缓冲数组,只实现03和06功能，代码接收和发送均是8字节（加校验位）
extern u8 modbus_buff[8];

void modbus_process(); //处理modbus
// 不进行CRC校验，用于调试。不用可注释
//#define NOCRC
#endif
