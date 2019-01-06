;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module dht12
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _i2c_read
	.globl _I2C_Read
	.globl _RcvByte
	.globl _SendByte
	.globl _I2C_nAck
	.globl _I2C_Rack
	.globl _I2C_Stop
	.globl _I2C_Start
	.globl _I2CDataInOut
	.globl _i2c_deinit
	.globl _i2c_init
	.globl _GPIO_ReadInputPin
	.globl _GPIO_WriteLow
	.globl _GPIO_WriteHigh
	.globl _GPIO_Init
	.globl _ReadDHT12
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area DABS (ABS)

; default segment ordering for linker
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area CONST
	.area INITIALIZER
	.area CODE

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	driver/dht12.c: 38: void i2c_init()
;	-----------------------------------------
;	 function i2c_init
;	-----------------------------------------
_i2c_init:
;	driver/dht12.c: 40: GPIO_Init(GPIOB,GPIO_PIN_4,GPIO_MODE_OUT_OD_LOW_FAST);
	push	#0xa0
	push	#0x10
	push	#0x05
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	driver/dht12.c: 41: GPIO_Init(GPIOB,GPIO_PIN_5,GPIO_MODE_OUT_OD_LOW_FAST);
	push	#0xa0
	push	#0x20
	push	#0x05
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	driver/dht12.c: 42: }
	ret
;	driver/dht12.c: 43: void i2c_deinit() 
;	-----------------------------------------
;	 function i2c_deinit
;	-----------------------------------------
_i2c_deinit:
;	driver/dht12.c: 46: GPIO_Init(GPIOB,GPIO_PIN_4, GPIO_MODE_IN_FL_NO_IT);
	push	#0x00
	push	#0x10
	push	#0x05
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	driver/dht12.c: 47: GPIO_Init(GPIOB,GPIO_PIN_5, GPIO_MODE_IN_FL_NO_IT);
	push	#0x00
	push	#0x20
	push	#0x05
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	driver/dht12.c: 48: }
	ret
;	driver/dht12.c: 63: void I2CDataInOut(bool InOut)  
;	-----------------------------------------
;	 function I2CDataInOut
;	-----------------------------------------
_I2CDataInOut:
;	driver/dht12.c: 67: if(InOut)  
	tnz	(0x03, sp)
	jreq	00102$
;	driver/dht12.c: 71: GPIO_Init(I2C_PORT,I2CSDA,GPIO_MODE_IN_FL_NO_IT);  
	push	#0x00
	push	#0x20
	push	#0x05
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
	ret
00102$:
;	driver/dht12.c: 79: GPIO_Init(I2C_PORT,I2CSDA,GPIO_MODE_OUT_PP_LOW_FAST);  
	push	#0xe0
	push	#0x20
	push	#0x05
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	driver/dht12.c: 83: }  
	ret
;	driver/dht12.c: 95: void I2C_Start (void)  
;	-----------------------------------------
;	 function I2C_Start
;	-----------------------------------------
_I2C_Start:
;	driver/dht12.c: 98: I2CDataInOut(I2CDataOut);
	push	#0x00
	call	_I2CDataInOut
	pop	a
;	driver/dht12.c: 100: GPIO_WriteHigh(I2C_PORT, I2CSDA);  
	push	#0x20
	push	#0x05
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
;	driver/dht12.c: 104: GPIO_WriteHigh(I2C_PORT, I2CSCL);  
	push	#0x10
	push	#0x05
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
;	driver/dht12.c: 108: GPIO_WriteLow(I2C_PORT, I2CSDA);  
	push	#0x20
	push	#0x05
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	driver/dht12.c: 111: GPIO_WriteLow(I2C_PORT, I2CSCL);    
	push	#0x10
	push	#0x05
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	driver/dht12.c: 112: }  
	ret
;	driver/dht12.c: 122: void I2C_Stop (void)  
;	-----------------------------------------
;	 function I2C_Stop
;	-----------------------------------------
_I2C_Stop:
;	driver/dht12.c: 125: I2CDataInOut(I2CDataOut);
	push	#0x00
	call	_I2CDataInOut
	pop	a
;	driver/dht12.c: 126: GPIO_WriteLow(I2C_PORT, I2CSCL); 
	push	#0x10
	push	#0x05
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	driver/dht12.c: 128: GPIO_WriteLow(I2C_PORT, I2CSDA);  
	push	#0x20
	push	#0x05
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	driver/dht12.c: 132: GPIO_WriteHigh(I2C_PORT, I2CSCL);  
	push	#0x10
	push	#0x05
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
;	driver/dht12.c: 136: GPIO_WriteHigh(I2C_PORT, I2CSDA);  
	push	#0x20
	push	#0x05
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
;	driver/dht12.c: 138: }  
	ret
;	driver/dht12.c: 152: void I2C_Rack(void)  
;	-----------------------------------------
;	 function I2C_Rack
;	-----------------------------------------
_I2C_Rack:
;	driver/dht12.c: 155: I2CDataInOut(I2CDataOut);
	push	#0x00
	call	_I2CDataInOut
	pop	a
;	driver/dht12.c: 157: GPIO_WriteLow(I2C_PORT, I2CSDA);  
	push	#0x20
	push	#0x05
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	driver/dht12.c: 160: GPIO_WriteLow(I2C_PORT, I2CSCL);  
	push	#0x10
	push	#0x05
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	driver/dht12.c: 162: GPIO_WriteHigh(I2C_PORT, I2CSCL);  
	push	#0x10
	push	#0x05
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
;	driver/dht12.c: 166: GPIO_WriteLow(I2C_PORT, I2CSCL);  
	push	#0x10
	push	#0x05
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	driver/dht12.c: 170: }  
	ret
;	driver/dht12.c: 185: void I2C_nAck (void)  
;	-----------------------------------------
;	 function I2C_nAck
;	-----------------------------------------
_I2C_nAck:
;	driver/dht12.c: 188: I2CDataInOut(I2CDataOut);
	push	#0x00
	call	_I2CDataInOut
	pop	a
;	driver/dht12.c: 191: GPIO_WriteHigh(I2C_PORT, I2CSDA);  
	push	#0x20
	push	#0x05
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
;	driver/dht12.c: 195: GPIO_WriteLow(I2C_PORT, I2CSCL); 
	push	#0x10
	push	#0x05
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	driver/dht12.c: 197: GPIO_WriteHigh(I2C_PORT, I2CSCL);  
	push	#0x10
	push	#0x05
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
;	driver/dht12.c: 201: GPIO_WriteLow(I2C_PORT, I2CSCL);  
	push	#0x10
	push	#0x05
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	driver/dht12.c: 205: }  
	ret
;	driver/dht12.c: 215: bool SendByte(UCHAR I2cData)  
;	-----------------------------------------
;	 function SendByte
;	-----------------------------------------
_SendByte:
	sub	sp, #3
;	driver/dht12.c: 224: for(i=0; i<8; i++)  
	clr	(0x03, sp)
00112$:
;	driver/dht12.c: 228: GPIO_WriteLow(I2C_PORT, I2CSCL);  
	push	#0x10
	push	#0x05
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	driver/dht12.c: 232: if(I2cData & 0x80)  
	ld	a, (0x06, sp)
	jrpl	00102$
;	driver/dht12.c: 234: {GPIO_WriteHigh(I2C_PORT, I2CSDA);}  
	push	#0x20
	push	#0x05
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
	jra	00103$
00102$:
;	driver/dht12.c: 238: {GPIO_WriteLow(I2C_PORT, I2CSDA);}  
	push	#0x20
	push	#0x05
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
00103$:
;	driver/dht12.c: 240: GPIO_WriteHigh(I2C_PORT, I2CSCL);  
	push	#0x10
	push	#0x05
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
;	driver/dht12.c: 244: I2cData <<= 1;  
	sll	(0x06, sp)
;	driver/dht12.c: 224: for(i=0; i<8; i++)  
	inc	(0x03, sp)
	ld	a, (0x03, sp)
	cp	a, #0x08
	jrc	00112$
;	driver/dht12.c: 248: GPIO_WriteLow(I2C_PORT, I2CSCL);  
	push	#0x10
	push	#0x05
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	driver/dht12.c: 250: GPIO_WriteHigh(I2C_PORT, I2CSDA);//发送完一字节，接收应答  
	push	#0x20
	push	#0x05
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
;	driver/dht12.c: 254: I2CDataInOut(I2CDataIn);  
	push	#0x01
	call	_I2CDataInOut
	pop	a
;	driver/dht12.c: 257: GPIO_WriteHigh(I2C_PORT, I2CSCL);  
	push	#0x10
	push	#0x05
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
;	driver/dht12.c: 279: while(GPIO_ReadInputPin(I2C_PORT,I2CSDA) &&count--)
	ldw	x, #0x03e8
	ldw	(0x01, sp), x
00106$:
	push	#0x20
	push	#0x05
	push	#0x50
	call	_GPIO_ReadInputPin
	addw	sp, #3
	tnz	a
	jreq	00108$
	ldw	x, (0x01, sp)
	ldw	y, (0x01, sp)
	decw	y
	ldw	(0x01, sp), y
	tnzw	x
	jreq	00108$
;	driver/dht12.c: 280: {nop();nop();};
	nop
	nop
	jra	00106$
00108$:
;	driver/dht12.c: 281: GPIO_WriteLow(I2C_PORT, I2CSCL);
	push	#0x10
	push	#0x05
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	driver/dht12.c: 286: I2CDataInOut(I2CDataOut);  
	push	#0x00
	call	_I2CDataInOut
	pop	a
;	driver/dht12.c: 287: if(count)
	ldw	x, (0x01, sp)
	jreq	00110$
;	driver/dht12.c: 290: I2CStatus = I2C_CRR;  
	ld	a, #0x01
;	driver/dht12.c: 298: I2CStatus = I2C_ERR;  
	.byte 0x21
00110$:
	clr	a
00111$:
;	driver/dht12.c: 301: return I2CStatus;  
;	driver/dht12.c: 303: }  
	addw	sp, #3
	ret
;	driver/dht12.c: 318: UCHAR RcvByte(void)  
;	-----------------------------------------
;	 function RcvByte
;	-----------------------------------------
_RcvByte:
	sub	sp, #2
;	driver/dht12.c: 324: UCHAR ReadByte=0;  
	clr	(0x02, sp)
;	driver/dht12.c: 326: GPIO_WriteHigh(I2C_PORT, I2CSDA);  
	push	#0x20
	push	#0x05
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
;	driver/dht12.c: 329: I2CDataInOut(I2CDataIn);  
	push	#0x01
	call	_I2CDataInOut
	pop	a
;	driver/dht12.c: 333: for(i=0; i<8; i++)  
	clr	(0x01, sp)
00104$:
;	driver/dht12.c: 337: ReadByte <<= 1;  
	ld	a, (0x02, sp)
	sll	a
	ld	(0x02, sp), a
;	driver/dht12.c: 339: GPIO_WriteLow(I2C_PORT, I2CSCL);  
	push	#0x10
	push	#0x05
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	driver/dht12.c: 343: GPIO_WriteHigh(I2C_PORT, I2CSCL);  
	push	#0x10
	push	#0x05
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
;	driver/dht12.c: 348: if(GPIO_ReadInputPin(I2C_PORT,I2CSDA) !=RESET)  
	push	#0x20
	push	#0x05
	push	#0x50
	call	_GPIO_ReadInputPin
	addw	sp, #3
	tnz	a
	jreq	00105$
;	driver/dht12.c: 350: {ReadByte |= 0x01;}  
	ld	a, (0x02, sp)
	or	a, #0x01
	ld	(0x02, sp), a
00105$:
;	driver/dht12.c: 333: for(i=0; i<8; i++)  
	inc	(0x01, sp)
	ld	a, (0x01, sp)
	cp	a, #0x08
	jrc	00104$
;	driver/dht12.c: 356: GPIO_WriteLow(I2C_PORT, I2CSCL);  
	push	#0x10
	push	#0x05
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	driver/dht12.c: 358: I2CDataInOut(I2CDataOut);  
	push	#0x00
	call	_I2CDataInOut
	pop	a
;	driver/dht12.c: 362: return ReadByte;  
	ld	a, (0x02, sp)
;	driver/dht12.c: 364: }  
	addw	sp, #2
	ret
;	driver/dht12.c: 383: bool I2C_Read(UCHAR wrDAdr,UCHAR wordAdr,UCHAR *pRdDat,UCHAR num)  
;	-----------------------------------------
;	 function I2C_Read
;	-----------------------------------------
_I2C_Read:
	sub	sp, #9
;	driver/dht12.c: 393: rdDAdr = wrDAdr+1; //读器件地址为写地址加1  
	ld	a, (0x0c, sp)
	inc	a
	ld	(0x08, sp), a
;	driver/dht12.c: 395: I2C_Start();  /*启动I2C*/  
	call	_I2C_Start
;	driver/dht12.c: 399: I2CAck = SendByte(wrDAdr); /*发写器件地址*/  
	ld	a, (0x0c, sp)
	push	a
	call	_SendByte
	addw	sp, #1
;	driver/dht12.c: 401: if(!I2CAck)  
	ld	(0x03, sp), a
	jrne	00102$
;	driver/dht12.c: 405: return I2C_ERR;  
	clr	a
	jra	00113$
00102$:
;	driver/dht12.c: 409: I2CAck = SendByte(wordAdr); /*发寄存器地址*/  
	ld	a, (0x0d, sp)
	push	a
	call	_SendByte
	addw	sp, #1
;	driver/dht12.c: 411: if(!I2CAck)  
	tnz	a
	jrne	00104$
;	driver/dht12.c: 415: return I2C_ERR;  
	clr	a
	jra	00113$
00104$:
;	driver/dht12.c: 419: I2C_Start();   /*重启I2C*/  
	call	_I2C_Start
;	driver/dht12.c: 421: I2CAck = SendByte(rdDAdr); /*发读器件地址*/  
	ld	a, (0x08, sp)
	push	a
	call	_SendByte
	addw	sp, #1
;	driver/dht12.c: 423: if(!I2CAck)  
	tnz	a
	jrne	00119$
;	driver/dht12.c: 427: return I2C_ERR;  
	clr	a
	jra	00113$
;	driver/dht12.c: 433: for(i=0;i<num-1;i++)  
00119$:
	clr	(0x09, sp)
00111$:
	clrw	x
	ld	a, (0x10, sp)
	ld	xl, a
	decw	x
	ldw	(0x01, sp), x
	ld	a, (0x09, sp)
	ld	(0x07, sp), a
	clr	(0x06, sp)
;	driver/dht12.c: 437: *(pRdDat+i) = RcvByte();  
	clrw	x
	ld	a, (0x09, sp)
	ld	xl, a
	addw	x, (0x0e, sp)
	ldw	(0x04, sp), x
;	driver/dht12.c: 433: for(i=0;i<num-1;i++)  
	ldw	x, (0x06, sp)
	cpw	x, (0x01, sp)
	jrsge	00107$
;	driver/dht12.c: 437: *(pRdDat+i) = RcvByte();  
	call	_RcvByte
	ldw	x, (0x04, sp)
	ld	(x), a
;	driver/dht12.c: 439: I2C_Rack();  
	call	_I2C_Rack
;	driver/dht12.c: 433: for(i=0;i<num-1;i++)  
	inc	(0x09, sp)
	jra	00111$
00107$:
;	driver/dht12.c: 443: if(i==num-1)  
	ldw	x, (0x06, sp)
	cpw	x, (0x01, sp)
	jrne	00109$
;	driver/dht12.c: 447: *(pRdDat+i) = RcvByte();  
	call	_RcvByte
	ldw	x, (0x04, sp)
	ld	(x), a
;	driver/dht12.c: 449: I2C_Rack();
	call	_I2C_Rack
;	driver/dht12.c: 450: RcvByte();
	call	_RcvByte
;	driver/dht12.c: 452: I2C_nAck();  
	call	_I2C_nAck
00109$:
;	driver/dht12.c: 456: I2C_Stop();  
	call	_I2C_Stop
;	driver/dht12.c: 457: return I2C_CRR;  
	ld	a, #0x01
00113$:
;	driver/dht12.c: 459: }  
	addw	sp, #9
	ret
;	driver/dht12.c: 541: u8 i2c_read(u8 dev_addr,u8 Addr)
;	-----------------------------------------
;	 function i2c_read
;	-----------------------------------------
_i2c_read:
	push	a
;	driver/dht12.c: 544: if(I2C_Read(dev_addr,Addr,&temp,1))
	ldw	x, sp
	incw	x
	push	#0x01
	pushw	x
	ld	a, (0x08, sp)
	push	a
	ld	a, (0x08, sp)
	push	a
	call	_I2C_Read
	addw	sp, #5
	tnz	a
	jreq	00102$
;	driver/dht12.c: 545: return temp;
	ld	a, (0x01, sp)
;	driver/dht12.c: 546: else return 0;
	.byte 0x21
00102$:
	clr	a
00104$:
;	driver/dht12.c: 547: }
	addw	sp, #1
	ret
;	driver/dht12.c: 549: void ReadDHT12(DHT12_DATA *data) 
;	-----------------------------------------
;	 function ReadDHT12
;	-----------------------------------------
_ReadDHT12:
	sub	sp, #2
;	driver/dht12.c: 551: i2c_init();
	call	_i2c_init
;	driver/dht12.c: 552: data->W=i2c_read(0xB8,0x00);
	ldw	y, (0x05, sp)
	ldw	(0x01, sp), y
	ldw	x, y
	incw	x
	incw	x
	pushw	x
	push	#0x00
	push	#0xb8
	call	_i2c_read
	addw	sp, #2
	popw	x
	ld	(x), a
;	driver/dht12.c: 553: data->W1=i2c_read(0xB8,0x01);
	ldw	x, (0x01, sp)
	addw	x, #0x0003
	pushw	x
	push	#0x01
	push	#0xb8
	call	_i2c_read
	addw	sp, #2
	popw	x
	ld	(x), a
;	driver/dht12.c: 554: data->T=i2c_read(0xB8,0x02);
	push	#0x02
	push	#0xb8
	call	_i2c_read
	addw	sp, #2
	ldw	x, (0x01, sp)
	ld	(x), a
;	driver/dht12.c: 555: data->T1=i2c_read(0xB8,0x03);
	ldw	x, (0x01, sp)
	incw	x
	pushw	x
	push	#0x03
	push	#0xb8
	call	_i2c_read
	addw	sp, #2
	popw	x
	ld	(x), a
;	driver/dht12.c: 556: data->sum=i2c_read(0xB8,0x04);
	ldw	x, (0x01, sp)
	addw	x, #0x0004
	pushw	x
	push	#0x04
	push	#0xb8
	call	_i2c_read
	addw	sp, #2
	popw	x
	ld	(x), a
;	driver/dht12.c: 557: i2c_deinit();
	call	_i2c_deinit
;	driver/dht12.c: 558: }
	addw	sp, #2
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
