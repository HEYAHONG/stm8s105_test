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
	.globl __delay_5us
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
;	driver/dht12.c: 3: void i2c_init()
;	-----------------------------------------
;	 function i2c_init
;	-----------------------------------------
_i2c_init:
;	driver/dht12.c: 5: GPIO_Init(GPIOB,GPIO_PIN_4,GPIO_MODE_OUT_OD_LOW_FAST);
	push	#0xa0
	push	#0x10
	push	#0x05
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	driver/dht12.c: 6: GPIO_Init(GPIOB,GPIO_PIN_5,GPIO_MODE_OUT_OD_LOW_FAST);
	push	#0xa0
	push	#0x20
	push	#0x05
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	driver/dht12.c: 7: }
	ret
;	driver/dht12.c: 8: void i2c_deinit() 
;	-----------------------------------------
;	 function i2c_deinit
;	-----------------------------------------
_i2c_deinit:
;	driver/dht12.c: 10: GPIO_Init(GPIOB,GPIO_PIN_4, GPIO_MODE_IN_FL_NO_IT);
	push	#0x00
	push	#0x10
	push	#0x05
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	driver/dht12.c: 11: GPIO_Init(GPIOB,GPIO_PIN_5, GPIO_MODE_IN_FL_NO_IT);
	push	#0x00
	push	#0x20
	push	#0x05
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	driver/dht12.c: 12: }
	ret
;	driver/dht12.c: 14: void _delay_5us(unsigned int xx)
;	-----------------------------------------
;	 function _delay_5us
;	-----------------------------------------
__delay_5us:
	sub	sp, #4
;	driver/dht12.c: 16: unsigned int yy = 0;
	ldw	y, (0x07, sp)
	ldw	(0x03, sp), y
00107$:
;	driver/dht12.c: 17: for(;xx>0;xx--)
	ldw	x, (0x03, sp)
	jreq	00109$
;	driver/dht12.c: 19: for(yy = 0;yy<1;yy++)
	clrw	x
	incw	x
00105$:
;	driver/dht12.c: 20: nop();
	nop
	decw	x
;	driver/dht12.c: 19: for(yy = 0;yy<1;yy++)
	ldw	(0x01, sp), x
	ldw	y, x
	jrne	00105$
;	driver/dht12.c: 17: for(;xx>0;xx--)
	ldw	x, (0x03, sp)
	decw	x
	ldw	(0x03, sp), x
	jra	00107$
00109$:
;	driver/dht12.c: 32: }
	addw	sp, #4
	ret
;	driver/dht12.c: 60: void I2CDataInOut(bool InOut)  
;	-----------------------------------------
;	 function I2CDataInOut
;	-----------------------------------------
_I2CDataInOut:
;	driver/dht12.c: 64: if(InOut)  
	tnz	(0x03, sp)
	jreq	00102$
;	driver/dht12.c: 68: GPIO_Init(I2C_PORT,I2CSDA,GPIO_MODE_IN_FL_NO_IT);  
	push	#0x00
	push	#0x20
	push	#0x05
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
	ret
00102$:
;	driver/dht12.c: 76: GPIO_Init(I2C_PORT,I2CSDA,GPIO_MODE_OUT_PP_LOW_FAST);  
	push	#0xe0
	push	#0x20
	push	#0x05
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	driver/dht12.c: 80: }  
	ret
;	driver/dht12.c: 92: void I2C_Start (void)  
;	-----------------------------------------
;	 function I2C_Start
;	-----------------------------------------
_I2C_Start:
;	driver/dht12.c: 95: I2CDataInOut(I2CDataOut);
	push	#0x00
	call	_I2CDataInOut
	pop	a
;	driver/dht12.c: 97: GPIO_WriteHigh(I2C_PORT, I2CSDA);  
	push	#0x20
	push	#0x05
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
;	driver/dht12.c: 99: _delay_5us(5);  
	push	#0x05
	push	#0x00
	call	__delay_5us
	addw	sp, #2
;	driver/dht12.c: 101: GPIO_WriteHigh(I2C_PORT, I2CSCL);  
	push	#0x10
	push	#0x05
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
;	driver/dht12.c: 103: _delay_5us(5);  
	push	#0x05
	push	#0x00
	call	__delay_5us
	addw	sp, #2
;	driver/dht12.c: 105: GPIO_WriteLow(I2C_PORT, I2CSDA);  
	push	#0x20
	push	#0x05
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	driver/dht12.c: 107: _delay_5us(5);  
	push	#0x05
	push	#0x00
	call	__delay_5us
	addw	sp, #2
;	driver/dht12.c: 108: GPIO_WriteLow(I2C_PORT, I2CSCL);    
	push	#0x10
	push	#0x05
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	driver/dht12.c: 109: }  
	ret
;	driver/dht12.c: 119: void I2C_Stop (void)  
;	-----------------------------------------
;	 function I2C_Stop
;	-----------------------------------------
_I2C_Stop:
;	driver/dht12.c: 122: I2CDataInOut(I2CDataOut);
	push	#0x00
	call	_I2CDataInOut
	pop	a
;	driver/dht12.c: 123: GPIO_WriteLow(I2C_PORT, I2CSCL); 
	push	#0x10
	push	#0x05
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	driver/dht12.c: 124: _delay_5us(5);   
	push	#0x05
	push	#0x00
	call	__delay_5us
	addw	sp, #2
;	driver/dht12.c: 125: GPIO_WriteLow(I2C_PORT, I2CSDA);  
	push	#0x20
	push	#0x05
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	driver/dht12.c: 127: _delay_5us(5);  
	push	#0x05
	push	#0x00
	call	__delay_5us
	addw	sp, #2
;	driver/dht12.c: 129: GPIO_WriteHigh(I2C_PORT, I2CSCL);  
	push	#0x10
	push	#0x05
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
;	driver/dht12.c: 131: _delay_5us(5);  
	push	#0x05
	push	#0x00
	call	__delay_5us
	addw	sp, #2
;	driver/dht12.c: 133: GPIO_WriteHigh(I2C_PORT, I2CSDA);  
	push	#0x20
	push	#0x05
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
;	driver/dht12.c: 135: }  
	ret
;	driver/dht12.c: 149: void I2C_Rack(void)  
;	-----------------------------------------
;	 function I2C_Rack
;	-----------------------------------------
_I2C_Rack:
;	driver/dht12.c: 152: I2CDataInOut(I2CDataOut);
	push	#0x00
	call	_I2CDataInOut
	pop	a
;	driver/dht12.c: 154: GPIO_WriteLow(I2C_PORT, I2CSDA);  
	push	#0x20
	push	#0x05
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	driver/dht12.c: 156: _delay_5us(5);  
	push	#0x05
	push	#0x00
	call	__delay_5us
	addw	sp, #2
;	driver/dht12.c: 158: GPIO_WriteHigh(I2C_PORT, I2CSCL);  
	push	#0x10
	push	#0x05
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
;	driver/dht12.c: 160: _delay_5us(5);  
	push	#0x05
	push	#0x00
	call	__delay_5us
	addw	sp, #2
;	driver/dht12.c: 162: GPIO_WriteLow(I2C_PORT, I2CSCL);  
	push	#0x10
	push	#0x05
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	driver/dht12.c: 164: _delay_5us(5);  
	push	#0x05
	push	#0x00
	call	__delay_5us
	addw	sp, #2
;	driver/dht12.c: 166: }  
	ret
;	driver/dht12.c: 181: void I2C_nAck (void)  
;	-----------------------------------------
;	 function I2C_nAck
;	-----------------------------------------
_I2C_nAck:
;	driver/dht12.c: 184: I2CDataInOut(I2CDataOut);
	push	#0x00
	call	_I2CDataInOut
	pop	a
;	driver/dht12.c: 187: GPIO_WriteHigh(I2C_PORT, I2CSDA);  
	push	#0x20
	push	#0x05
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
;	driver/dht12.c: 189: _delay_5us(5);  
	push	#0x05
	push	#0x00
	call	__delay_5us
	addw	sp, #2
;	driver/dht12.c: 191: GPIO_WriteHigh(I2C_PORT, I2CSCL);  
	push	#0x10
	push	#0x05
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
;	driver/dht12.c: 193: _delay_5us(5);  
	push	#0x05
	push	#0x00
	call	__delay_5us
	addw	sp, #2
;	driver/dht12.c: 195: GPIO_WriteLow(I2C_PORT, I2CSCL);  
	push	#0x10
	push	#0x05
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	driver/dht12.c: 197: _delay_5us(5);  
	push	#0x05
	push	#0x00
	call	__delay_5us
	addw	sp, #2
;	driver/dht12.c: 199: }  
	ret
;	driver/dht12.c: 209: bool SendByte(UCHAR I2cData)  
;	-----------------------------------------
;	 function SendByte
;	-----------------------------------------
_SendByte:
	sub	sp, #3
;	driver/dht12.c: 218: for(i=0; i<8; i++)  
	clr	(0x03, sp)
00112$:
;	driver/dht12.c: 222: GPIO_WriteLow(I2C_PORT, I2CSCL);  
	push	#0x10
	push	#0x05
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	driver/dht12.c: 224: _delay_5us(5);  
	push	#0x05
	push	#0x00
	call	__delay_5us
	addw	sp, #2
;	driver/dht12.c: 226: if(I2cData & 0x80)  
	ld	a, (0x06, sp)
	jrpl	00102$
;	driver/dht12.c: 228: {GPIO_WriteHigh(I2C_PORT, I2CSDA);}  
	push	#0x20
	push	#0x05
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
	jra	00103$
00102$:
;	driver/dht12.c: 232: {GPIO_WriteLow(I2C_PORT, I2CSDA);}  
	push	#0x20
	push	#0x05
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
00103$:
;	driver/dht12.c: 234: GPIO_WriteHigh(I2C_PORT, I2CSCL);  
	push	#0x10
	push	#0x05
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
;	driver/dht12.c: 236: _delay_5us(5);  
	push	#0x05
	push	#0x00
	call	__delay_5us
	addw	sp, #2
;	driver/dht12.c: 238: I2cData <<= 1;  
	sll	(0x06, sp)
;	driver/dht12.c: 218: for(i=0; i<8; i++)  
	inc	(0x03, sp)
	ld	a, (0x03, sp)
	cp	a, #0x08
	jrc	00112$
;	driver/dht12.c: 242: GPIO_WriteLow(I2C_PORT, I2CSCL);  
	push	#0x10
	push	#0x05
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	driver/dht12.c: 244: GPIO_WriteHigh(I2C_PORT, I2CSDA);//发送完一字节，接收应答  
	push	#0x20
	push	#0x05
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
;	driver/dht12.c: 248: I2CDataInOut(I2CDataIn);  
	push	#0x01
	call	_I2CDataInOut
	pop	a
;	driver/dht12.c: 251: GPIO_WriteHigh(I2C_PORT, I2CSCL);  
	push	#0x10
	push	#0x05
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
;	driver/dht12.c: 273: while(GPIO_ReadInputPin(I2C_PORT,I2CSDA) &&count--)
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
;	driver/dht12.c: 274: {nop();nop();};
	nop
	nop
	jra	00106$
00108$:
;	driver/dht12.c: 275: GPIO_WriteLow(I2C_PORT, I2CSCL);
	push	#0x10
	push	#0x05
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	driver/dht12.c: 280: I2CDataInOut(I2CDataOut);  
	push	#0x00
	call	_I2CDataInOut
	pop	a
;	driver/dht12.c: 281: if(count)
	ldw	x, (0x01, sp)
	jreq	00110$
;	driver/dht12.c: 284: I2CStatus = I2C_CRR;  
	ld	a, #0x01
;	driver/dht12.c: 292: I2CStatus = I2C_ERR;  
	.byte 0x21
00110$:
	clr	a
00111$:
;	driver/dht12.c: 295: return I2CStatus;  
;	driver/dht12.c: 297: }  
	addw	sp, #3
	ret
;	driver/dht12.c: 312: UCHAR RcvByte(void)  
;	-----------------------------------------
;	 function RcvByte
;	-----------------------------------------
_RcvByte:
	sub	sp, #2
;	driver/dht12.c: 318: UCHAR ReadByte=0;  
	clr	(0x02, sp)
;	driver/dht12.c: 320: GPIO_WriteHigh(I2C_PORT, I2CSDA);  
	push	#0x20
	push	#0x05
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
;	driver/dht12.c: 323: I2CDataInOut(I2CDataIn);  
	push	#0x01
	call	_I2CDataInOut
	pop	a
;	driver/dht12.c: 325: _delay_5us(10);  
	push	#0x0a
	push	#0x00
	call	__delay_5us
	addw	sp, #2
;	driver/dht12.c: 327: for(i=0; i<8; i++)  
	clr	(0x01, sp)
00104$:
;	driver/dht12.c: 331: ReadByte <<= 1;  
	ld	a, (0x02, sp)
	sll	a
	ld	(0x02, sp), a
;	driver/dht12.c: 333: GPIO_WriteLow(I2C_PORT, I2CSCL);  
	push	#0x10
	push	#0x05
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	driver/dht12.c: 335: _delay_5us(5);  
	push	#0x05
	push	#0x00
	call	__delay_5us
	addw	sp, #2
;	driver/dht12.c: 337: GPIO_WriteHigh(I2C_PORT, I2CSCL);  
	push	#0x10
	push	#0x05
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
;	driver/dht12.c: 339: _delay_5us(10);  
	push	#0x0a
	push	#0x00
	call	__delay_5us
	addw	sp, #2
;	driver/dht12.c: 342: if(GPIO_ReadInputPin(I2C_PORT,I2CSDA) !=RESET)  
	push	#0x20
	push	#0x05
	push	#0x50
	call	_GPIO_ReadInputPin
	addw	sp, #3
	tnz	a
	jreq	00102$
;	driver/dht12.c: 344: {ReadByte |= 0x01;}  
	ld	a, (0x02, sp)
	or	a, #0x01
	ld	(0x02, sp), a
00102$:
;	driver/dht12.c: 346: _delay_5us(10);  
	push	#0x0a
	push	#0x00
	call	__delay_5us
	addw	sp, #2
;	driver/dht12.c: 327: for(i=0; i<8; i++)  
	inc	(0x01, sp)
	ld	a, (0x01, sp)
	cp	a, #0x08
	jrc	00104$
;	driver/dht12.c: 350: GPIO_WriteLow(I2C_PORT, I2CSCL);  
	push	#0x10
	push	#0x05
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	driver/dht12.c: 352: I2CDataInOut(I2CDataOut);  
	push	#0x00
	call	_I2CDataInOut
	pop	a
;	driver/dht12.c: 354: _delay_5us(10);  
	push	#0x0a
	push	#0x00
	call	__delay_5us
	addw	sp, #2
;	driver/dht12.c: 356: return ReadByte;  
	ld	a, (0x02, sp)
;	driver/dht12.c: 358: }  
	addw	sp, #2
	ret
;	driver/dht12.c: 377: bool I2C_Read(UCHAR wrDAdr,UCHAR wordAdr,UCHAR *pRdDat,UCHAR num)  
;	-----------------------------------------
;	 function I2C_Read
;	-----------------------------------------
_I2C_Read:
	sub	sp, #9
;	driver/dht12.c: 387: rdDAdr = wrDAdr+1; //读器件地址为写地址加1  
	ld	a, (0x0c, sp)
	inc	a
	ld	(0x09, sp), a
;	driver/dht12.c: 389: I2C_Start();  /*启动I2C*/  
	call	_I2C_Start
;	driver/dht12.c: 391: _delay_5us(5);  
	push	#0x05
	push	#0x00
	call	__delay_5us
	addw	sp, #2
;	driver/dht12.c: 393: I2CAck = SendByte(wrDAdr); /*发写器件地址*/  
	ld	a, (0x0c, sp)
	push	a
	call	_SendByte
	addw	sp, #1
;	driver/dht12.c: 395: if(!I2CAck)  
	ld	(0x08, sp), a
	jrne	00102$
;	driver/dht12.c: 399: return I2C_ERR;  
	clr	a
	jra	00113$
00102$:
;	driver/dht12.c: 403: I2CAck = SendByte(wordAdr); /*发寄存器地址*/  
	ld	a, (0x0d, sp)
	push	a
	call	_SendByte
	addw	sp, #1
;	driver/dht12.c: 405: if(!I2CAck)  
	tnz	a
	jrne	00104$
;	driver/dht12.c: 409: return I2C_ERR;  
	clr	a
	jra	00113$
00104$:
;	driver/dht12.c: 413: I2C_Start();   /*重启I2C*/  
	call	_I2C_Start
;	driver/dht12.c: 415: I2CAck = SendByte(rdDAdr); /*发读器件地址*/  
	ld	a, (0x09, sp)
	push	a
	call	_SendByte
	addw	sp, #1
;	driver/dht12.c: 417: if(!I2CAck)  
	tnz	a
	jrne	00106$
;	driver/dht12.c: 421: return I2C_ERR;  
	clr	a
	jra	00113$
00106$:
;	driver/dht12.c: 425: _delay_5us(5);  
	push	#0x05
	push	#0x00
	call	__delay_5us
	addw	sp, #2
;	driver/dht12.c: 427: for(i=0;i<num-1;i++)  
	clr	(0x03, sp)
00111$:
	clrw	x
	ld	a, (0x10, sp)
	ld	xl, a
	decw	x
	ldw	(0x06, sp), x
	ld	a, (0x03, sp)
	ld	(0x05, sp), a
	clr	(0x04, sp)
;	driver/dht12.c: 431: *(pRdDat+i) = RcvByte();  
	clrw	x
	ld	a, (0x03, sp)
	ld	xl, a
	addw	x, (0x0e, sp)
	ldw	(0x01, sp), x
;	driver/dht12.c: 427: for(i=0;i<num-1;i++)  
	ldw	x, (0x04, sp)
	cpw	x, (0x06, sp)
	jrsge	00107$
;	driver/dht12.c: 431: *(pRdDat+i) = RcvByte();  
	call	_RcvByte
	ldw	x, (0x01, sp)
	ld	(x), a
;	driver/dht12.c: 433: I2C_Rack();  
	call	_I2C_Rack
;	driver/dht12.c: 427: for(i=0;i<num-1;i++)  
	inc	(0x03, sp)
	jra	00111$
00107$:
;	driver/dht12.c: 437: if(i==num-1)  
	ldw	x, (0x04, sp)
	cpw	x, (0x06, sp)
	jrne	00109$
;	driver/dht12.c: 441: *(pRdDat+i) = RcvByte();  
	call	_RcvByte
	ldw	x, (0x01, sp)
	ld	(x), a
;	driver/dht12.c: 443: I2C_nAck();  
	call	_I2C_nAck
00109$:
;	driver/dht12.c: 447: I2C_Stop();  
	call	_I2C_Stop
;	driver/dht12.c: 449: return I2C_CRR;  
	ld	a, #0x01
00113$:
;	driver/dht12.c: 451: }  
	addw	sp, #9
	ret
;	driver/dht12.c: 533: u8 i2c_read(u8 dev_addr,u8 Addr)
;	-----------------------------------------
;	 function i2c_read
;	-----------------------------------------
_i2c_read:
	push	a
;	driver/dht12.c: 536: if(I2C_Read(dev_addr,Addr,&temp,1))
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
;	driver/dht12.c: 537: return temp;
	ld	a, (0x01, sp)
;	driver/dht12.c: 538: else return 0;
	.byte 0x21
00102$:
	clr	a
00104$:
;	driver/dht12.c: 539: }
	addw	sp, #1
	ret
;	driver/dht12.c: 541: void ReadDHT12(DHT12_DATA *data) 
;	-----------------------------------------
;	 function ReadDHT12
;	-----------------------------------------
_ReadDHT12:
	sub	sp, #2
;	driver/dht12.c: 543: i2c_init();
	call	_i2c_init
;	driver/dht12.c: 544: data->W=i2c_read(0xB8,0x00);
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
;	driver/dht12.c: 545: data->W1=i2c_read(0xB8,0x01);
	ldw	x, (0x01, sp)
	addw	x, #0x0003
	pushw	x
	push	#0x01
	push	#0xb8
	call	_i2c_read
	addw	sp, #2
	popw	x
	ld	(x), a
;	driver/dht12.c: 546: data->T=i2c_read(0xB8,0x02);
	push	#0x02
	push	#0xb8
	call	_i2c_read
	addw	sp, #2
	ldw	x, (0x01, sp)
	ld	(x), a
;	driver/dht12.c: 547: data->T1=i2c_read(0xB8,0x03);
	ldw	x, (0x01, sp)
	incw	x
	pushw	x
	push	#0x03
	push	#0xb8
	call	_i2c_read
	addw	sp, #2
	popw	x
	ld	(x), a
;	driver/dht12.c: 548: data->sum=i2c_read(0xB8,0x04);
	ldw	x, (0x01, sp)
	addw	x, #0x0004
	pushw	x
	push	#0x04
	push	#0xb8
	call	_i2c_read
	addw	sp, #2
	popw	x
	ld	(x), a
;	driver/dht12.c: 549: i2c_deinit();
	call	_i2c_deinit
;	driver/dht12.c: 550: }
	addw	sp, #2
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
