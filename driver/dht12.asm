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
;	driver/dht12.c: 39: void i2c_init()
;	-----------------------------------------
;	 function i2c_init
;	-----------------------------------------
_i2c_init:
;	driver/dht12.c: 41: GPIO_Init(GPIOB,GPIO_PIN_4,GPIO_MODE_OUT_OD_LOW_FAST);
	push	#0xa0
	push	#0x10
	push	#0x05
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	driver/dht12.c: 42: GPIO_Init(GPIOB,GPIO_PIN_5,GPIO_MODE_OUT_OD_LOW_FAST);
	push	#0xa0
	push	#0x20
	push	#0x05
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	driver/dht12.c: 43: }
	ret
;	driver/dht12.c: 44: void i2c_deinit() 
;	-----------------------------------------
;	 function i2c_deinit
;	-----------------------------------------
_i2c_deinit:
;	driver/dht12.c: 47: GPIO_Init(GPIOB,GPIO_PIN_4, GPIO_MODE_IN_FL_NO_IT);
	push	#0x00
	push	#0x10
	push	#0x05
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	driver/dht12.c: 48: GPIO_Init(GPIOB,GPIO_PIN_5, GPIO_MODE_IN_FL_NO_IT);
	push	#0x00
	push	#0x20
	push	#0x05
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	driver/dht12.c: 49: }
	ret
;	driver/dht12.c: 64: void I2CDataInOut(bool InOut)  
;	-----------------------------------------
;	 function I2CDataInOut
;	-----------------------------------------
_I2CDataInOut:
;	driver/dht12.c: 68: if(InOut)  
	tnz	(0x03, sp)
	jreq	00102$
;	driver/dht12.c: 72: GPIO_Init(I2C_PORT,I2CSDA,GPIO_MODE_IN_FL_NO_IT);  
	push	#0x00
	push	#0x20
	push	#0x05
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
	ret
00102$:
;	driver/dht12.c: 80: GPIO_Init(I2C_PORT,I2CSDA,GPIO_MODE_OUT_PP_LOW_FAST);  
	push	#0xe0
	push	#0x20
	push	#0x05
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	driver/dht12.c: 84: }  
	ret
;	driver/dht12.c: 96: void I2C_Start (void)  
;	-----------------------------------------
;	 function I2C_Start
;	-----------------------------------------
_I2C_Start:
;	driver/dht12.c: 99: I2CDataInOut(I2CDataOut);
	push	#0x00
	call	_I2CDataInOut
	pop	a
;	driver/dht12.c: 101: GPIO_WriteHigh(I2C_PORT, I2CSDA);  
	push	#0x20
	push	#0x05
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
;	driver/dht12.c: 105: GPIO_WriteHigh(I2C_PORT, I2CSCL);  
	push	#0x10
	push	#0x05
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
;	driver/dht12.c: 109: GPIO_WriteLow(I2C_PORT, I2CSDA);  
	push	#0x20
	push	#0x05
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	driver/dht12.c: 112: GPIO_WriteLow(I2C_PORT, I2CSCL);    
	push	#0x10
	push	#0x05
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	driver/dht12.c: 113: }  
	ret
;	driver/dht12.c: 123: void I2C_Stop (void)  
;	-----------------------------------------
;	 function I2C_Stop
;	-----------------------------------------
_I2C_Stop:
;	driver/dht12.c: 126: I2CDataInOut(I2CDataOut);
	push	#0x00
	call	_I2CDataInOut
	pop	a
;	driver/dht12.c: 127: GPIO_WriteLow(I2C_PORT, I2CSCL); 
	push	#0x10
	push	#0x05
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	driver/dht12.c: 129: GPIO_WriteLow(I2C_PORT, I2CSDA);  
	push	#0x20
	push	#0x05
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	driver/dht12.c: 133: GPIO_WriteHigh(I2C_PORT, I2CSCL);  
	push	#0x10
	push	#0x05
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
;	driver/dht12.c: 137: GPIO_WriteHigh(I2C_PORT, I2CSDA);  
	push	#0x20
	push	#0x05
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
;	driver/dht12.c: 139: }  
	ret
;	driver/dht12.c: 153: void I2C_Rack(void)  
;	-----------------------------------------
;	 function I2C_Rack
;	-----------------------------------------
_I2C_Rack:
;	driver/dht12.c: 156: I2CDataInOut(I2CDataOut);
	push	#0x00
	call	_I2CDataInOut
	pop	a
;	driver/dht12.c: 158: GPIO_WriteLow(I2C_PORT, I2CSDA);  
	push	#0x20
	push	#0x05
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	driver/dht12.c: 161: GPIO_WriteLow(I2C_PORT, I2CSCL);  
	push	#0x10
	push	#0x05
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	driver/dht12.c: 163: GPIO_WriteHigh(I2C_PORT, I2CSCL);  
	push	#0x10
	push	#0x05
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
;	driver/dht12.c: 167: GPIO_WriteLow(I2C_PORT, I2CSCL);  
	push	#0x10
	push	#0x05
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	driver/dht12.c: 171: }  
	ret
;	driver/dht12.c: 186: void I2C_nAck (void)  
;	-----------------------------------------
;	 function I2C_nAck
;	-----------------------------------------
_I2C_nAck:
;	driver/dht12.c: 189: I2CDataInOut(I2CDataOut);
	push	#0x00
	call	_I2CDataInOut
	pop	a
;	driver/dht12.c: 192: GPIO_WriteHigh(I2C_PORT, I2CSDA);  
	push	#0x20
	push	#0x05
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
;	driver/dht12.c: 196: GPIO_WriteLow(I2C_PORT, I2CSCL); 
	push	#0x10
	push	#0x05
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	driver/dht12.c: 198: GPIO_WriteHigh(I2C_PORT, I2CSCL);  
	push	#0x10
	push	#0x05
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
;	driver/dht12.c: 202: GPIO_WriteLow(I2C_PORT, I2CSCL);  
	push	#0x10
	push	#0x05
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	driver/dht12.c: 206: }  
	ret
;	driver/dht12.c: 216: bool SendByte(UCHAR I2cData)  
;	-----------------------------------------
;	 function SendByte
;	-----------------------------------------
_SendByte:
	sub	sp, #3
;	driver/dht12.c: 225: for(i=0; i<8; i++)  
	clr	(0x03, sp)
00112$:
;	driver/dht12.c: 229: GPIO_WriteLow(I2C_PORT, I2CSCL);  
	push	#0x10
	push	#0x05
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	driver/dht12.c: 233: if(I2cData & 0x80)  
	ld	a, (0x06, sp)
	jrpl	00102$
;	driver/dht12.c: 235: {GPIO_WriteHigh(I2C_PORT, I2CSDA);}  
	push	#0x20
	push	#0x05
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
	jra	00103$
00102$:
;	driver/dht12.c: 239: {GPIO_WriteLow(I2C_PORT, I2CSDA);}  
	push	#0x20
	push	#0x05
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
00103$:
;	driver/dht12.c: 241: GPIO_WriteHigh(I2C_PORT, I2CSCL);  
	push	#0x10
	push	#0x05
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
;	driver/dht12.c: 245: I2cData <<= 1;  
	sll	(0x06, sp)
;	driver/dht12.c: 225: for(i=0; i<8; i++)  
	inc	(0x03, sp)
	ld	a, (0x03, sp)
	cp	a, #0x08
	jrc	00112$
;	driver/dht12.c: 249: GPIO_WriteLow(I2C_PORT, I2CSCL);  
	push	#0x10
	push	#0x05
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	driver/dht12.c: 251: GPIO_WriteHigh(I2C_PORT, I2CSDA);//发送完一字节，接收应答  
	push	#0x20
	push	#0x05
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
;	driver/dht12.c: 255: I2CDataInOut(I2CDataIn);  
	push	#0x01
	call	_I2CDataInOut
	pop	a
;	driver/dht12.c: 258: GPIO_WriteHigh(I2C_PORT, I2CSCL);  
	push	#0x10
	push	#0x05
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
;	driver/dht12.c: 280: while(GPIO_ReadInputPin(I2C_PORT,I2CSDA) &&count--)
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
;	driver/dht12.c: 281: {nop();nop();};
	nop
	nop
	jra	00106$
00108$:
;	driver/dht12.c: 282: GPIO_WriteLow(I2C_PORT, I2CSCL);
	push	#0x10
	push	#0x05
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	driver/dht12.c: 287: I2CDataInOut(I2CDataOut);  
	push	#0x00
	call	_I2CDataInOut
	pop	a
;	driver/dht12.c: 288: if(count)
	ldw	x, (0x01, sp)
	jreq	00110$
;	driver/dht12.c: 291: I2CStatus = I2C_CRR;  
	ld	a, #0x01
;	driver/dht12.c: 299: I2CStatus = I2C_ERR;  
	.byte 0x21
00110$:
	clr	a
00111$:
;	driver/dht12.c: 302: return I2CStatus;  
;	driver/dht12.c: 304: }  
	addw	sp, #3
	ret
;	driver/dht12.c: 319: UCHAR RcvByte(void)  
;	-----------------------------------------
;	 function RcvByte
;	-----------------------------------------
_RcvByte:
	sub	sp, #2
;	driver/dht12.c: 325: UCHAR ReadByte=0;  
	clr	(0x01, sp)
;	driver/dht12.c: 327: GPIO_WriteHigh(I2C_PORT, I2CSDA);  
	push	#0x20
	push	#0x05
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
;	driver/dht12.c: 330: I2CDataInOut(I2CDataIn);  
	push	#0x01
	call	_I2CDataInOut
	pop	a
;	driver/dht12.c: 334: for(i=0; i<8; i++)  
	clr	(0x02, sp)
00104$:
;	driver/dht12.c: 338: ReadByte <<= 1;  
	ld	a, (0x01, sp)
	sll	a
	ld	(0x01, sp), a
;	driver/dht12.c: 340: GPIO_WriteLow(I2C_PORT, I2CSCL);  
	push	#0x10
	push	#0x05
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	driver/dht12.c: 344: GPIO_WriteHigh(I2C_PORT, I2CSCL);  
	push	#0x10
	push	#0x05
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
;	driver/dht12.c: 349: if(GPIO_ReadInputPin(I2C_PORT,I2CSDA) !=RESET)  
	push	#0x20
	push	#0x05
	push	#0x50
	call	_GPIO_ReadInputPin
	addw	sp, #3
	tnz	a
	jreq	00105$
;	driver/dht12.c: 351: {ReadByte |= 0x01;}  
	ld	a, (0x01, sp)
	or	a, #0x01
	ld	(0x01, sp), a
00105$:
;	driver/dht12.c: 334: for(i=0; i<8; i++)  
	inc	(0x02, sp)
	ld	a, (0x02, sp)
	cp	a, #0x08
	jrc	00104$
;	driver/dht12.c: 357: GPIO_WriteLow(I2C_PORT, I2CSCL);  
	push	#0x10
	push	#0x05
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	driver/dht12.c: 359: I2CDataInOut(I2CDataOut);  
	push	#0x00
	call	_I2CDataInOut
	pop	a
;	driver/dht12.c: 363: return ReadByte;  
	ld	a, (0x01, sp)
;	driver/dht12.c: 365: }  
	addw	sp, #2
	ret
;	driver/dht12.c: 384: bool I2C_Read(UCHAR wrDAdr,UCHAR wordAdr,UCHAR *pRdDat,UCHAR num)  
;	-----------------------------------------
;	 function I2C_Read
;	-----------------------------------------
_I2C_Read:
	sub	sp, #9
;	driver/dht12.c: 394: rdDAdr = wrDAdr+1; //读器件地址为写地址加1  
	ld	a, (0x0c, sp)
	inc	a
	ld	(0x08, sp), a
;	driver/dht12.c: 396: I2C_Start();  /*启动I2C*/  
	call	_I2C_Start
;	driver/dht12.c: 400: I2CAck = SendByte(wrDAdr); /*发写器件地址*/  
	ld	a, (0x0c, sp)
	push	a
	call	_SendByte
	addw	sp, #1
;	driver/dht12.c: 402: if(!I2CAck)  
	ld	(0x07, sp), a
	jrne	00102$
;	driver/dht12.c: 406: return I2C_ERR;  
	clr	a
	jra	00113$
00102$:
;	driver/dht12.c: 410: I2CAck = SendByte(wordAdr); /*发寄存器地址*/  
	ld	a, (0x0d, sp)
	push	a
	call	_SendByte
	addw	sp, #1
;	driver/dht12.c: 412: if(!I2CAck)  
	tnz	a
	jrne	00104$
;	driver/dht12.c: 416: return I2C_ERR;  
	clr	a
	jra	00113$
00104$:
;	driver/dht12.c: 420: I2C_Start();   /*重启I2C*/  
	call	_I2C_Start
;	driver/dht12.c: 422: I2CAck = SendByte(rdDAdr); /*发读器件地址*/  
	ld	a, (0x08, sp)
	push	a
	call	_SendByte
	addw	sp, #1
;	driver/dht12.c: 424: if(!I2CAck)  
	tnz	a
	jrne	00119$
;	driver/dht12.c: 428: return I2C_ERR;  
	clr	a
	jra	00113$
;	driver/dht12.c: 434: for(i=0;i<num-1;i++)  
00119$:
	clr	(0x09, sp)
00111$:
	clrw	x
	ld	a, (0x10, sp)
	ld	xl, a
	decw	x
	ldw	(0x05, sp), x
	ld	a, (0x09, sp)
	ld	(0x04, sp), a
	clr	(0x03, sp)
;	driver/dht12.c: 438: *(pRdDat+i) = RcvByte();  
	clrw	x
	ld	a, (0x09, sp)
	ld	xl, a
	addw	x, (0x0e, sp)
	ldw	(0x01, sp), x
;	driver/dht12.c: 434: for(i=0;i<num-1;i++)  
	ldw	x, (0x03, sp)
	cpw	x, (0x05, sp)
	jrsge	00107$
;	driver/dht12.c: 438: *(pRdDat+i) = RcvByte();  
	call	_RcvByte
	ldw	x, (0x01, sp)
	ld	(x), a
;	driver/dht12.c: 440: I2C_Rack();  
	call	_I2C_Rack
;	driver/dht12.c: 434: for(i=0;i<num-1;i++)  
	inc	(0x09, sp)
	jra	00111$
00107$:
;	driver/dht12.c: 444: if(i==num-1)  
	ldw	x, (0x03, sp)
	cpw	x, (0x05, sp)
	jrne	00109$
;	driver/dht12.c: 448: *(pRdDat+i) = RcvByte();  
	call	_RcvByte
	ldw	x, (0x01, sp)
	ld	(x), a
;	driver/dht12.c: 450: I2C_Rack();
	call	_I2C_Rack
;	driver/dht12.c: 451: RcvByte();
	call	_RcvByte
;	driver/dht12.c: 453: I2C_nAck();  
	call	_I2C_nAck
00109$:
;	driver/dht12.c: 457: I2C_Stop();  
	call	_I2C_Stop
;	driver/dht12.c: 458: return I2C_CRR;  
	ld	a, #0x01
00113$:
;	driver/dht12.c: 460: }  
	addw	sp, #9
	ret
;	driver/dht12.c: 542: u8 i2c_read(u8 dev_addr,u8 Addr)
;	-----------------------------------------
;	 function i2c_read
;	-----------------------------------------
_i2c_read:
	push	a
;	driver/dht12.c: 545: if(I2C_Read(dev_addr,Addr,&temp,1))
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
;	driver/dht12.c: 546: return temp;
	ld	a, (0x01, sp)
;	driver/dht12.c: 547: else return 0;
	.byte 0x21
00102$:
	clr	a
00104$:
;	driver/dht12.c: 548: }
	addw	sp, #1
	ret
;	driver/dht12.c: 550: void ReadDHT12(DHT12_DATA *data) 
;	-----------------------------------------
;	 function ReadDHT12
;	-----------------------------------------
_ReadDHT12:
	sub	sp, #2
;	driver/dht12.c: 552: i2c_init();
	call	_i2c_init
;	driver/dht12.c: 553: data->W=i2c_read(0xB8,0x00);
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
;	driver/dht12.c: 554: data->W1=i2c_read(0xB8,0x01);
	ldw	x, (0x01, sp)
	addw	x, #0x0003
	pushw	x
	push	#0x01
	push	#0xb8
	call	_i2c_read
	addw	sp, #2
	popw	x
	ld	(x), a
;	driver/dht12.c: 555: data->T=i2c_read(0xB8,0x02);
	push	#0x02
	push	#0xb8
	call	_i2c_read
	addw	sp, #2
	ldw	x, (0x01, sp)
	ld	(x), a
;	driver/dht12.c: 556: data->T1=i2c_read(0xB8,0x03);
	ldw	x, (0x01, sp)
	incw	x
	pushw	x
	push	#0x03
	push	#0xb8
	call	_i2c_read
	addw	sp, #2
	popw	x
	ld	(x), a
;	driver/dht12.c: 557: data->sum=i2c_read(0xB8,0x04);
	ldw	x, (0x01, sp)
	addw	x, #0x0004
	pushw	x
	push	#0x04
	push	#0xb8
	call	_i2c_read
	addw	sp, #2
	popw	x
	ld	(x), a
;	driver/dht12.c: 558: i2c_deinit();
	call	_i2c_deinit
;	driver/dht12.c: 559: }
	addw	sp, #2
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
