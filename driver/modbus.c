#include "modbus.h"
#include "driver_common.h"
//状态标志，0～7  表示下一个接收的数据在接收缓冲的位置.超过7表示其它含义（如接收完成）
u8  modbus_status=0;
//接收发送缓冲数组,只实现03和06功能，代码接收和发送均是8字节（加校验位）
u8   modbus_buff[8];

u16 CRC16(u8 *arr_buff,u8 len)
{
u16 crc=0xFFFF;
 u8 i, j;
 for ( j=0; j<len;j++)
 {
   crc=crc ^*arr_buff++;
   for ( i=0; i<8; i++)
  {
       if( ( crc&0x0001) >0)
       {
           crc=crc>>1;
           crc=crc^ 0xa001;
        }
      else
          crc=crc>>1;
   }
 }
return ( crc);
}
void modbus_send()
{
u8 i=0;
for(i=0;i<8;i++)
{
 while(( UART2_GetFlagStatus(UART2_FLAG_TXE)==RESET));
  UART2_SendData8(modbus_buff[i]);
}
}
void modbus_process()
{



//发送数据
modbus_send();
}
