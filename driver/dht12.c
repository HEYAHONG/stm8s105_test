#include "dht12.h"

void i2c_init()
{
GPIO_Init(GPIOB,GPIO_PIN_4,GPIO_MODE_OUT_OD_LOW_FAST);
GPIO_Init(GPIOB,GPIO_PIN_5,GPIO_MODE_OUT_OD_LOW_FAST);
}
void i2c_deinit() 
{
GPIO_Init(GPIOB,GPIO_PIN_4, GPIO_MODE_IN_FL_NO_IT);
GPIO_Init(GPIOB,GPIO_PIN_5, GPIO_MODE_IN_FL_NO_IT);
}

void _delay_5us(unsigned int xx)
{
         unsigned int yy = 0;
        for(;xx>0;xx--)
{
        for(yy = 0;yy<1;yy++)
        nop();
}
/*
for(yy = 0;yy<1;yy++)
        nop();
        nop();
        nop();
        nop();
        nop();
        nop();
        nop();
*/
}


#define I2C_ERR   0  
  
#define I2C_CRR   1  
  
#define  I2CDataIn  1  
  
#define  I2CDataOut 0  
  
#define I2C_PORT  (GPIOB)  
  
#define I2CSCL   (GPIO_PIN_4)  
  
#define I2CSDA   (GPIO_PIN_5)  

#define UCHAR unsigned char
  
  
//***************************************************************  
  
// I2C Data input/output  
  
// 0-Output, 1-Input  
  
//***************************************************************  
  
void I2CDataInOut(bool InOut)  
  
{  
  
if(InOut)  
  
  {  
  
  GPIO_Init(I2C_PORT,I2CSDA,GPIO_MODE_IN_FL_NO_IT);  
  
  }  
  
else  
  
  {  
  
  GPIO_Init(I2C_PORT,I2CSDA,GPIO_MODE_OUT_PP_LOW_FAST);  
  
  }  
  
}  
  
//***************************************************************  
  
//  Send start condition  
  
//  ensure data is high then issue a start condition  
  
//  see also i2c_Start() macro  
  
//***************************************************************  
  
void I2C_Start (void)  
  
{  
 I2CDataInOut(I2CDataOut);

GPIO_WriteHigh(I2C_PORT, I2CSDA);  
  
_delay_5us(5);  
  
GPIO_WriteHigh(I2C_PORT, I2CSCL);  
  
_delay_5us(5);  
  
GPIO_WriteLow(I2C_PORT, I2CSDA);  
  
_delay_5us(5);  
GPIO_WriteLow(I2C_PORT, I2CSCL);    
}  
  
//***************************************************************  
  
//   Send stop condition  
  
//   data low-high while clock high  
  
//***************************************************************  
  
void I2C_Stop (void)  
  
{  
I2CDataInOut(I2CDataOut);
GPIO_WriteLow(I2C_PORT, I2CSCL); 
 _delay_5us(5);   
GPIO_WriteLow(I2C_PORT, I2CSDA);  
  
_delay_5us(5);  
  
GPIO_WriteHigh(I2C_PORT, I2CSCL);  
  
_delay_5us(5);  
  
GPIO_WriteHigh(I2C_PORT, I2CSDA);  
  
}  
  
//***************************************************************  
  
//ROUTINE NAME : I2C_Ack  
  
//INPUT/OUTPUT : None.  
  
//DESCRIPTION  : Acknoledge generation from now.  
  
//COMMENTS     : Transfer sequence = DATA, ACK.  
  
//***************************************************************  
  
void I2C_Rack(void)  
  
{  
 I2CDataInOut(I2CDataOut);

GPIO_WriteLow(I2C_PORT, I2CSDA);  
  
_delay_5us(5);  
  
GPIO_WriteHigh(I2C_PORT, I2CSCL);  
  
_delay_5us(5);  
  
GPIO_WriteLow(I2C_PORT, I2CSCL);  
  
_delay_5us(5);  
  
}  
  
  
//***************************************************************  
  
//ROUTINE NAME : I2C_nAck  
  
//INPUT/OUTPUT : None.  
  
//DESCRIPTION  : Non acknoledge generation from now.  
  
//COMMENTS     : Transfer sequence = DATA, NACK.  
  
//***************************************************************  
  
void I2C_nAck (void)  
  
{ 
 I2CDataInOut(I2CDataOut);

  
GPIO_WriteHigh(I2C_PORT, I2CSDA);  
  
_delay_5us(5);  
  
GPIO_WriteHigh(I2C_PORT, I2CSCL);  
  
_delay_5us(5);  
  
GPIO_WriteLow(I2C_PORT, I2CSCL);  
  
_delay_5us(5);  
  
}  
  
//***************************************************************  
  
//  Send a byte to the slave 写一个数据没有应答  
  
//  return I2C_ERR OR I2C_CRR  
  
//***************************************************************  
  
bool SendByte(UCHAR I2cData)  
  
{  
  
UCHAR i;  
  
bool I2CStatus;  
  
  
for(i=0; i<8; i++)  
  
  {  
  
  GPIO_WriteLow(I2C_PORT, I2CSCL);  
  
  _delay_5us(5);  
  
  if(I2cData & 0x80)  
  
   {GPIO_WriteHigh(I2C_PORT, I2CSDA);}  
  
  else  
  
   {GPIO_WriteLow(I2C_PORT, I2CSDA);}  
  
  GPIO_WriteHigh(I2C_PORT, I2CSCL);  
  
 _delay_5us(5);  
  
  I2cData <<= 1;  
  
  }  
  
  GPIO_WriteLow(I2C_PORT, I2CSCL);  
  
  GPIO_WriteHigh(I2C_PORT, I2CSDA);//发送完一字节，接收应答  
  
    
  
  I2CDataInOut(I2CDataIn);  
  
  
  GPIO_WriteHigh(I2C_PORT, I2CSCL);  
  
 // _delay_5us(10);  

/*  
  if(GPIO_ReadInputPin(I2C_PORT,I2CSDA) == RESET)  
  
   {  
  
   I2CStatus = I2C_CRR;  
  
   }  
  
  else  
  
   {  
  
   I2CStatus = I2C_ERR;  
  
   }  
  */
u16 count=1000;
while(GPIO_ReadInputPin(I2C_PORT,I2CSDA) &&count--)
{nop();nop();};
 GPIO_WriteLow(I2C_PORT, I2CSCL);



  
  I2CDataInOut(I2CDataOut);  
  if(count)
	 {  
  
   I2CStatus = I2C_CRR;  
  
   }  
  
  else  
  
   {  
  
   I2CStatus = I2C_ERR;  
  
   }  
  return I2CStatus;  
  
}  
  
  
//***************************************************************  
  
//ROUTINE NAME : I2Cm_RxData  
  
//INPUT/OUTPUT : Last byte to receive flag (active high)/Received data byte.  
  
//DESCRIPTION  : Receive a data byte.  
  
//COMMENTS     : Transfer sequence = DATA, ACK, EV7...  
  
//***************************************************************  
  
UCHAR RcvByte(void)  
  
{     
  
    UCHAR i;  
  
    UCHAR ReadByte=0;  
  
   GPIO_WriteHigh(I2C_PORT, I2CSDA);  
  
  
I2CDataInOut(I2CDataIn);  
  
_delay_5us(10);  
  
for(i=0; i<8; i++)  
  
  {  
  
   ReadByte <<= 1;  
  
   GPIO_WriteLow(I2C_PORT, I2CSCL);  
  
   _delay_5us(5);  
  
   GPIO_WriteHigh(I2C_PORT, I2CSCL);  
  
   _delay_5us(10);  
  
  
   if(GPIO_ReadInputPin(I2C_PORT,I2CSDA) !=RESET)  
  
    {ReadByte |= 0x01;}  
  
  _delay_5us(10);  
  
  }    
  
GPIO_WriteLow(I2C_PORT, I2CSCL);  
  
I2CDataInOut(I2CDataOut);  
  
_delay_5us(10);  
  
   return ReadByte;  
  
}  
  
  
/*******************************************************  
  
  读N个数据，参数：?  
  
   wrDAdr: write device-address 写器件地址??  
  
   wordAdr: word address 读数据的寄存器地址??  
  
   rdDAdr: read device-address 读器件地址  
  
   *pRdDat: p->read data 读数据指针  
  
   num: number 需要读数据的个数  
  
*******************************************************/  
  
bool I2C_Read(UCHAR wrDAdr,UCHAR wordAdr,UCHAR *pRdDat,UCHAR num)  
  
{  
  
bool I2CAck;  
  
UCHAR i=0;  
  
UCHAR rdDAdr;  
  
rdDAdr = wrDAdr+1; //读器件地址为写地址加1  
  
I2C_Start();  /*启动I2C*/  
  
_delay_5us(5);  
  
I2CAck = SendByte(wrDAdr); /*发写器件地址*/  
  
if(!I2CAck)  
  
  {  
  
   return I2C_ERR;  
  
  }  
  
I2CAck = SendByte(wordAdr); /*发寄存器地址*/  
  
if(!I2CAck)  
  
  {  
  
   return I2C_ERR;  
  
  }  
  
I2C_Start();   /*重启I2C*/  
  
  I2CAck = SendByte(rdDAdr); /*发读器件地址*/  
  
if(!I2CAck)  
  
  {  
  
   return I2C_ERR;  
  
  }  
  
_delay_5us(5);  
  
for(i=0;i<num-1;i++)  
  
  {  
  
  *(pRdDat+i) = RcvByte();  
  
  I2C_Rack();  
  
   }  
  
if(i==num-1)  
  
  {  
  
  *(pRdDat+i) = RcvByte();  
  
  I2C_nAck();  
  
  }  
  
I2C_Stop();  
  
return I2C_CRR;  
  
}  
  
#if 0
/******************************************************* 
 
写N个数据,前N-1个要应答,最后一个不要应答 
 
wrDAdr: write device-address 写器件地址?? 
 
  wordAdr: word address 写数据的寄存器地址? 
 
  *pWrDat: p->write data 写数据指针 
 
  num: number  需要写入的数据个数 
 
*******************************************************/  
  
bool I2C_Write(UCHAR wrDAdr,UCHAR wordAdr,UCHAR *pWrDat,UCHAR num)  
  
{  
  
bool I2CAck;  
  
unsigned char i;  
  
  
I2C_Start();      /*启动I2C*/  
  
_delay_5us(5);  
  
I2CAck = SendByte(wrDAdr); /*发写器件地址*/  
  
if(!I2CAck)  
  
  {  
  
   return I2C_ERR;  
  
  }  
  
I2CAck = SendByte(wordAdr);  /*发要写的寄存器地址*/  
  
if(!I2CAck)  
  
  {  
  
   return I2C_ERR;  
  
  }  
  
for(i=0;i<num-1;i++)  
  
  {  
  
  I2CAck = SendByte(*(pWrDat+i));  
  
  if(!I2CAck)  
  
   {return I2C_ERR;}  
  
  }  
  
if(i==num-1)  
  
  {  
  
  I2CAck = SendByte(*(pWrDat+num-1));  
  
  if(!I2CAck)  
  
   {return I2C_ERR;}  
  
  }  
  
I2C_Stop();  
  
return I2CAck;  
  
}
#endif

   
u8 i2c_read(u8 dev_addr,u8 Addr)
{
u8 temp;
if(I2C_Read(dev_addr,Addr,&temp,1))
return temp;
else return 0;
}

void ReadDHT12(DHT12_DATA *data) 
{
i2c_init();
data->W=i2c_read(0xB8,0x00);
data->W1=i2c_read(0xB8,0x01);
data->T=i2c_read(0xB8,0x02);
data->T1=i2c_read(0xB8,0x03);
data->sum=i2c_read(0xB8,0x04);
i2c_deinit();
}
