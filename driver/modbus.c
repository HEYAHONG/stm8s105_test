#include "modbus.h"
#include "driver_common.h"
//状态标志，0～7  表示下一个接收的数据在接收缓冲的位置.超过7表示其它含义（如接收完成）
u8  modbus_status=0;
//接收发送缓冲数组,只实现03(单寄存器)和06功能，代码接收和发送均是8字节（加校验位）
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
void modbus_send(u8 cnt)
{
u8 i=0;
for(i=0;i<cnt;i++)
{
 while(( UART2_GetFlagStatus(UART2_FLAG_TXE)==RESET));
  UART2_SendData8(modbus_buff[i]);
}
}

void modbus_virtual_write(u32 address,u8 data)//虚拟地址写
{
switch(address)
{
case 1030:
    ds_time.hour=data;ds1302_write_time(&ds_time);break;
case 1031:
    ds_time.minute=data;ds1302_write_time(&ds_time);break;
case 1032:
    ds_time.second=data;ds1302_write_time(&ds_time);break;
case 1070:
    if(data) beep_on(); else beep_off();break;
case 1080:
    if(data) relay_on(); else relay_off();break;
}
}
void modbus_virtual_read(u32 address)//虚拟地址读取
{
switch(address)
{
case 1030:
    modbus_buff[4]=ds_time.hour;break;
case 1031:
    modbus_buff[4]=ds_time.minute;break;
case 1032:
    modbus_buff[4]=ds_time.second;break;
case 1040:
    modbus_buff[4]=(adc_data.Ain&0xff00)>>8;break;
case 1041:
    modbus_buff[4]=adc_data.Ain&0xff;break;
case 1042:
    modbus_buff[4]=adc_data.Din;break;
case 1050:
    modbus_buff[4]=dh_data.W;break;
case 1051:
    modbus_buff[4]=dh_data.W1;break;
case 1052:
    modbus_buff[4]=dh_data.T;break;
case 1053:
    modbus_buff[4]=dh_data.T1;break;
case 1054:
    modbus_buff[4]=dh_data.sum;break;
case 1060:
    modbus_buff[4]=keycount[0];break;
case 1061:
    modbus_buff[4]=keycount[1];break;
case 1062:
    modbus_buff[4]=keycount[2];break;
case 1063:
    modbus_buff[4]=keycount[3];break;
case 1064:
    modbus_buff[4]=keycount[4];break;
case 1070:
    modbus_buff[4]=beep_read();break;
case 1080:
    modbus_buff[4]=relay_read();break;

}

}

void modbus_process()
{

#ifndef NOCRC
// 校验
if(CRC16(modbus_buff,6)!=(((u16)modbus_buff[6])+(u16)(modbus_buff[7])*256))
return;
#endif

if(modbus_buff[0]==0)//从站地址为0时仅支持06代码（单寄存器）
{
if(modbus_buff[1]==06)// 写单个寄存器（8位）
	{
	u32 address=0;
         address=(u32)modbus_buff[3]+modbus_buff[2]*256;
	if(address <1024) eeprom_write(address,modbus_buff[5]);
        }
return;
}

if(modbus_buff[0]==eeprom_read(0)) //当地址为本机地址时
{
if(modbus_buff[1]==06) // 写单个寄存器
	{
	u32 address=0;
         address=(u32)modbus_buff[3]+modbus_buff[2]*256;
	if(address <1024) eeprom_write(address,modbus_buff[5]);
	modbus_virtual_write(address,modbus_buff[5]);
	{//添加校验
	u16 crc=CRC16(modbus_buff,6);
	modbus_buff[6]=crc&0xff;
	modbus_buff[7]=crc>>8;
	}
	//发送数据
	modbus_send(8);
	}


if(modbus_buff[1]==03) // 读单个寄存器
	{
	u32 address=0;
         address=(u32)modbus_buff[3]+modbus_buff[2]*256;
	if(address <1024) {
							modbus_buff[4]=eeprom_read(address);

						}
	modbus_virtual_read(address);
	modbus_buff[3]=0;
    modbus_buff[2]=2;// 字节数
	{//添加校验
	u16 crc=CRC16(modbus_buff,5);
	modbus_buff[5]=crc&0xff;
	modbus_buff[6]=crc>>8;
	}
	//发送数据
	modbus_send(7);
	}
}
}



