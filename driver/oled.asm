;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module oled
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _Hzk
	.globl _F8X16
	.globl _oled_pow
	.globl _GPIO_WriteLow
	.globl _GPIO_WriteHigh
	.globl _GPIO_Init
	.globl _delay_ms
	.globl _OLED_WR_Byte
	.globl _OLED_Set_Pos
	.globl _OLED_Display_On
	.globl _OLED_Display_Off
	.globl _OLED_Clear
	.globl _OLED_ShowChar
	.globl _OLED_ShowNum
	.globl _OLED_ShowString
	.globl _OLED_ShowCHinese
	.globl _OLED_DrawBMP
	.globl _OLED_Init
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
;	driver/oled.c: 45: void delay_ms(unsigned int ms)
;	-----------------------------------------
;	 function delay_ms
;	-----------------------------------------
_delay_ms:
	sub	sp, #2
;	driver/oled.c: 48: while(ms)
	ldw	y, (0x05, sp)
	ldw	(0x01, sp), y
00104$:
	ldw	x, (0x01, sp)
	jreq	00106$
;	driver/oled.c: 51: while(a--);
	ldw	x, #0x0708
00101$:
	ldw	y, x
	decw	x
	tnzw	y
	jrne	00101$
;	driver/oled.c: 52: ms--;
	ldw	x, (0x01, sp)
	decw	x
	ldw	(0x01, sp), x
	jra	00104$
00106$:
;	driver/oled.c: 54: return;
;	driver/oled.c: 55: }
	addw	sp, #2
	ret
;	driver/oled.c: 77: void OLED_WR_Byte(u8 dat,u8 cmd)
;	-----------------------------------------
;	 function OLED_WR_Byte
;	-----------------------------------------
_OLED_WR_Byte:
	push	a
;	driver/oled.c: 80: if(cmd)
	tnz	(0x05, sp)
	jreq	00102$
;	driver/oled.c: 81: OLED_DC_Set();
	push	#0x10
	push	#0x0a
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
	jra	00103$
00102$:
;	driver/oled.c: 83: OLED_DC_Clr();
	push	#0x10
	push	#0x0a
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
00103$:
;	driver/oled.c: 84: OLED_CS_Clr();
	push	#0x20
	push	#0x0a
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	driver/oled.c: 85: for(i=0;i<8;i++)
	clr	(0x01, sp)
00108$:
;	driver/oled.c: 87: OLED_SCLK_Clr();
	push	#0x02
	push	#0x0a
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	driver/oled.c: 88: if(dat&0x80)
	ld	a, (0x04, sp)
	jrpl	00105$
;	driver/oled.c: 90: OLED_SDIN_Set();
	push	#0x04
	push	#0x0a
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
	jra	00106$
00105$:
;	driver/oled.c: 93: OLED_SDIN_Clr();
	push	#0x04
	push	#0x0a
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
00106$:
;	driver/oled.c: 94: OLED_SCLK_Set();
	push	#0x02
	push	#0x0a
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
;	driver/oled.c: 95: dat<<=1;
	sll	(0x04, sp)
;	driver/oled.c: 85: for(i=0;i<8;i++)
	inc	(0x01, sp)
	ld	a, (0x01, sp)
	cp	a, #0x08
	jrc	00108$
;	driver/oled.c: 97: OLED_CS_Set();
	push	#0x20
	push	#0x0a
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
;	driver/oled.c: 98: OLED_DC_Set();
	push	#0x10
	push	#0x0a
	push	#0x50
	call	_GPIO_WriteHigh
;	driver/oled.c: 99: }
	addw	sp, #4
	ret
;	driver/oled.c: 101: void OLED_Set_Pos(unsigned char x, unsigned char y)
;	-----------------------------------------
;	 function OLED_Set_Pos
;	-----------------------------------------
_OLED_Set_Pos:
	sub	sp, #2
;	driver/oled.c: 103: OLED_WR_Byte(0xb0+y,OLED_CMD);
	ld	a, (0x06, sp)
	add	a, #0xb0
	push	#0x00
	push	a
	call	_OLED_WR_Byte
	addw	sp, #2
;	driver/oled.c: 104: OLED_WR_Byte(((x&0xf0)>>4)|0x10,OLED_CMD);
	ld	a, (0x05, sp)
	clr	(0x01, sp)
	push	a
	and	a, #0xf0
	ld	xl, a
	clr	a
	ld	xh, a
	pop	a
	sraw	x
	sraw	x
	sraw	x
	sraw	x
	push	a
	ld	a, xl
	or	a, #0x10
	ld	xl, a
	push	#0x00
	pushw	x
	addw	sp, #1
	call	_OLED_WR_Byte
	addw	sp, #2
	pop	a
;	driver/oled.c: 105: OLED_WR_Byte((x&0x0f)|0x01,OLED_CMD);
	and	a, #0x0f
	ld	xh, a
	clr	a
	rlwa	x
	or	a, #0x01
	push	#0x00
	push	a
	call	_OLED_WR_Byte
;	driver/oled.c: 106: }
	addw	sp, #4
	ret
;	driver/oled.c: 108: void OLED_Display_On(void)
;	-----------------------------------------
;	 function OLED_Display_On
;	-----------------------------------------
_OLED_Display_On:
;	driver/oled.c: 110: OLED_WR_Byte(0X8D,OLED_CMD);  //SET DCDC命令
	push	#0x00
	push	#0x8d
	call	_OLED_WR_Byte
	addw	sp, #2
;	driver/oled.c: 111: OLED_WR_Byte(0X14,OLED_CMD);  //DCDC ON
	push	#0x00
	push	#0x14
	call	_OLED_WR_Byte
	addw	sp, #2
;	driver/oled.c: 112: OLED_WR_Byte(0XAF,OLED_CMD);  //DISPLAY ON
	push	#0x00
	push	#0xaf
	call	_OLED_WR_Byte
	addw	sp, #2
;	driver/oled.c: 113: }
	ret
;	driver/oled.c: 115: void OLED_Display_Off(void)
;	-----------------------------------------
;	 function OLED_Display_Off
;	-----------------------------------------
_OLED_Display_Off:
;	driver/oled.c: 117: OLED_WR_Byte(0X8D,OLED_CMD);  //SET DCDC命令
	push	#0x00
	push	#0x8d
	call	_OLED_WR_Byte
	addw	sp, #2
;	driver/oled.c: 118: OLED_WR_Byte(0X10,OLED_CMD);  //DCDC OFF
	push	#0x00
	push	#0x10
	call	_OLED_WR_Byte
	addw	sp, #2
;	driver/oled.c: 119: OLED_WR_Byte(0XAE,OLED_CMD);  //DISPLAY OFF
	push	#0x00
	push	#0xae
	call	_OLED_WR_Byte
	addw	sp, #2
;	driver/oled.c: 120: }
	ret
;	driver/oled.c: 122: void OLED_Clear(void)
;	-----------------------------------------
;	 function OLED_Clear
;	-----------------------------------------
_OLED_Clear:
	push	a
;	driver/oled.c: 125: for(i=0;i<8;i++)
	clr	(0x01, sp)
00105$:
;	driver/oled.c: 127: OLED_WR_Byte (0xb0+i,OLED_CMD);    //设置页地址（0~7）
	ld	a, (0x01, sp)
	add	a, #0xb0
	push	#0x00
	push	a
	call	_OLED_WR_Byte
	addw	sp, #2
;	driver/oled.c: 128: OLED_WR_Byte (0x00,OLED_CMD);      //设置显示位置—列低地址
	push	#0x00
	push	#0x00
	call	_OLED_WR_Byte
	addw	sp, #2
;	driver/oled.c: 129: OLED_WR_Byte (0x10,OLED_CMD);      //设置显示位置—列高地址
	push	#0x00
	push	#0x10
	call	_OLED_WR_Byte
	addw	sp, #2
;	driver/oled.c: 130: for(n=0;n<128;n++)OLED_WR_Byte(0,OLED_DATA);
	clr	a
00103$:
	push	a
	push	#0x01
	push	#0x00
	call	_OLED_WR_Byte
	addw	sp, #2
	pop	a
	inc	a
	cp	a, #0x80
	jrc	00103$
;	driver/oled.c: 125: for(i=0;i<8;i++)
	inc	(0x01, sp)
	ld	a, (0x01, sp)
	cp	a, #0x08
	jrc	00105$
;	driver/oled.c: 132: }
	pop	a
	ret
;	driver/oled.c: 140: void OLED_ShowChar(u8 x,u8 y,u8 chr)
;	-----------------------------------------
;	 function OLED_ShowChar
;	-----------------------------------------
_OLED_ShowChar:
	sub	sp, #4
;	driver/oled.c: 143: c=chr-' ';//得到偏移后的值
	ld	a, (0x09, sp)
	sub	a, #0x20
	ld	(0x04, sp), a
;	driver/oled.c: 144: if(x>Max_Column-1){x=0;y=y+2;}
	ld	a, (0x07, sp)
	cp	a, #0x7f
	jrule	00105$
	clr	(0x07, sp)
	ld	a, (0x08, sp)
	add	a, #0x02
	ld	(0x08, sp), a
;	driver/oled.c: 145: if(SIZE ==16)
00105$:
;	driver/oled.c: 147: OLED_Set_Pos(x,y);
	ld	a, (0x08, sp)
	push	a
	ld	a, (0x08, sp)
	push	a
	call	_OLED_Set_Pos
	addw	sp, #2
;	driver/oled.c: 148: for(i=0;i<8;i++)
	clr	(0x03, sp)
00108$:
;	driver/oled.c: 149: OLED_WR_Byte(F8X16[c*16+i],OLED_DATA);
	clrw	x
	ld	a, (0x04, sp)
	ld	xl, a
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	ldw	(0x01, sp), x
	clrw	x
	ld	a, (0x03, sp)
	ld	xl, a
	addw	x, (0x01, sp)
	addw	x, #_F8X16
	ld	a, (x)
	push	#0x01
	push	a
	call	_OLED_WR_Byte
	addw	sp, #2
;	driver/oled.c: 148: for(i=0;i<8;i++)
	inc	(0x03, sp)
	ld	a, (0x03, sp)
	cp	a, #0x08
	jrc	00108$
;	driver/oled.c: 150: OLED_Set_Pos(x,y+1);
	ld	a, (0x08, sp)
	inc	a
	push	a
	ld	a, (0x08, sp)
	push	a
	call	_OLED_Set_Pos
	addw	sp, #2
;	driver/oled.c: 151: for(i=0;i<8;i++)
	clr	(0x03, sp)
00110$:
;	driver/oled.c: 152: OLED_WR_Byte(F8X16[c*16+i+8],OLED_DATA);
	clrw	x
	ld	a, (0x03, sp)
	ld	xl, a
	addw	x, (0x01, sp)
	addw	x, #0x0008
	addw	x, #_F8X16
	ld	a, (x)
	push	#0x01
	push	a
	call	_OLED_WR_Byte
	addw	sp, #2
;	driver/oled.c: 151: for(i=0;i<8;i++)
	inc	(0x03, sp)
	ld	a, (0x03, sp)
	cp	a, #0x08
	jrc	00110$
;	driver/oled.c: 155: OLED_Set_Pos(x,y+1);
;	driver/oled.c: 161: }
	addw	sp, #4
	ret
;	driver/oled.c: 163: u32 oled_pow(u8 m,u8 n)
;	-----------------------------------------
;	 function oled_pow
;	-----------------------------------------
_oled_pow:
	sub	sp, #9
;	driver/oled.c: 165: u32 result=1;
	clrw	x
	incw	x
	clr	(0x03, sp)
	clr	(0x02, sp)
;	driver/oled.c: 166: while(n--)result*=m;
	ld	a, (0x0d, sp)
	ld	(0x01, sp), a
00101$:
	ld	a, (0x01, sp)
	dec	(0x01, sp)
	tnz	a
	jreq	00103$
	ld	a, (0x0c, sp)
	ld	(0x09, sp), a
	clrw	y
	clr	(0x06, sp)
	ld	a, (0x09, sp)
	push	a
	pushw	y
	ld	a, (0x09, sp)
	push	a
	pushw	x
	ldw	x, (0x08, sp)
	pushw	x
	call	__mullong
	addw	sp, #8
	ldw	(0x02, sp), y
	jra	00101$
00103$:
;	driver/oled.c: 167: return result;
	ldw	y, (0x02, sp)
;	driver/oled.c: 168: }
	addw	sp, #9
	ret
;	driver/oled.c: 175: void OLED_ShowNum(u8 x,u8 y,u32 num,u8 len,u8 size2)
;	-----------------------------------------
;	 function OLED_ShowNum
;	-----------------------------------------
_OLED_ShowNum:
	sub	sp, #7
;	driver/oled.c: 178: u8 enshow=0;
	clr	(0x05, sp)
;	driver/oled.c: 179: for(t=0;t<len;t++)
	clr	(0x07, sp)
00110$:
	ld	a, (0x07, sp)
	cp	a, (0x10, sp)
	jrc	00139$
	jp	00111$
00139$:
;	driver/oled.c: 181: temp=(num/oled_pow(10,len-t-1))%10;
	ld	a, (0x10, sp)
	sub	a, (0x07, sp)
	dec	a
	push	a
	push	#0x0a
	call	_oled_pow
	addw	sp, #2
	pushw	x
	pushw	y
	ldw	x, (0x12, sp)
	pushw	x
	ldw	x, (0x12, sp)
	pushw	x
	call	__divulong
	addw	sp, #8
	push	#0x0a
	push	#0x00
	push	#0x00
	push	#0x00
	pushw	x
	pushw	y
	call	__modulong
	addw	sp, #8
	ld	a, xl
	ld	(0x06, sp), a
;	driver/oled.c: 186: OLED_ShowChar(x+(size2/2)*t,y,' ');
	clrw	x
	ld	a, (0x11, sp)
	ld	xl, a
	ld	a, (0x07, sp)
	ld	(0x04, sp), a
	ld	a, (0x0a, sp)
	ld	(0x03, sp), a
	push	#0x02
	push	#0x00
	pushw	x
	call	__divsint
	addw	sp, #4
	ld	a, (0x04, sp)
	mul	x, a
	ld	a, xl
	add	a, (0x03, sp)
	ld	yl, a
;	driver/oled.c: 182: if(enshow==0&&t<(len-1))
	tnz	(0x05, sp)
	jrne	00105$
	clrw	x
	ld	a, (0x10, sp)
	ld	xl, a
	decw	x
	ldw	(0x01, sp), x
	clrw	x
	ld	a, (0x07, sp)
	ld	xl, a
	cpw	x, (0x01, sp)
	jrsge	00105$
;	driver/oled.c: 184: if(temp==0)
	tnz	(0x06, sp)
	jrne	00102$
;	driver/oled.c: 186: OLED_ShowChar(x+(size2/2)*t,y,' ');
	push	#0x20
	ld	a, (0x0c, sp)
	push	a
	ld	a, yl
	push	a
	call	_OLED_ShowChar
	addw	sp, #3
;	driver/oled.c: 187: continue;
	jra	00107$
00102$:
;	driver/oled.c: 188: }else enshow=1;
	ld	a, #0x01
	ld	(0x05, sp), a
00105$:
;	driver/oled.c: 191: OLED_ShowChar(x+(size2/2)*t,y,temp+'0');
	ld	a, (0x06, sp)
	add	a, #0x30
	push	a
	ld	a, (0x0c, sp)
	push	a
	ld	a, yl
	push	a
	call	_OLED_ShowChar
	addw	sp, #3
00107$:
;	driver/oled.c: 179: for(t=0;t<len;t++)
	inc	(0x07, sp)
	jp	00110$
00111$:
;	driver/oled.c: 193: }
	addw	sp, #7
	ret
;	driver/oled.c: 195: void OLED_ShowString(u8 x,u8 y,u8 *chr)
;	-----------------------------------------
;	 function OLED_ShowString
;	-----------------------------------------
_OLED_ShowString:
	push	a
;	driver/oled.c: 198: while (chr[j]!='\0')
	clr	(0x01, sp)
00103$:
	clrw	x
	ld	a, (0x01, sp)
	ld	xl, a
	addw	x, (0x06, sp)
	ld	a, (x)
	jreq	00106$
;	driver/oled.c: 199: {		OLED_ShowChar(x,y,chr[j]);
	push	a
	ld	a, (0x06, sp)
	push	a
	ld	a, (0x06, sp)
	push	a
	call	_OLED_ShowChar
	addw	sp, #3
;	driver/oled.c: 200: x+=8;
	ld	a, (0x04, sp)
	add	a, #0x08
	ld	(0x04, sp), a
;	driver/oled.c: 201: if(x>120){x=0;y+=2;}
	ld	a, (0x04, sp)
	cp	a, #0x78
	jrule	00102$
	clr	(0x04, sp)
	ld	a, (0x05, sp)
	add	a, #0x02
	ld	(0x05, sp), a
00102$:
;	driver/oled.c: 202: j++;
	inc	(0x01, sp)
	jra	00103$
00106$:
;	driver/oled.c: 204: }
	pop	a
	ret
;	driver/oled.c: 206: void OLED_ShowCHinese(u8 x,u8 y,u8 no)
;	-----------------------------------------
;	 function OLED_ShowCHinese
;	-----------------------------------------
_OLED_ShowCHinese:
	sub	sp, #6
;	driver/oled.c: 208: u8 t,adder=0;
	clr	(0x06, sp)
;	driver/oled.c: 209: OLED_Set_Pos(x,y);
	ld	a, (0x0a, sp)
	push	a
	ld	a, (0x0a, sp)
	push	a
	call	_OLED_Set_Pos
	addw	sp, #2
;	driver/oled.c: 210: for(t=0;t<16;t++)
	clr	(0x05, sp)
00103$:
;	driver/oled.c: 212: OLED_WR_Byte(Hzk[2*no][t],OLED_DATA);
	clrw	x
	ld	a, (0x0b, sp)
	ld	xl, a
	sllw	x
	ldw	(0x03, sp), x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	addw	x, #_Hzk
	ld	a, xl
	add	a, (0x05, sp)
	rlwa	x
	adc	a, #0x00
	ld	xh, a
	ld	a, (x)
	push	#0x01
	push	a
	call	_OLED_WR_Byte
	addw	sp, #2
;	driver/oled.c: 213: adder+=1;
	inc	(0x06, sp)
;	driver/oled.c: 210: for(t=0;t<16;t++)
	inc	(0x05, sp)
	ld	a, (0x05, sp)
	cp	a, #0x10
	jrc	00103$
;	driver/oled.c: 215: OLED_Set_Pos(x,y+1);
	ld	a, (0x0a, sp)
	inc	a
	push	a
	ld	a, (0x0a, sp)
	push	a
	call	_OLED_Set_Pos
	addw	sp, #2
;	driver/oled.c: 216: for(t=0;t<16;t++)
	ldw	x, (0x03, sp)
	incw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	addw	x, #_Hzk
	ldw	(0x01, sp), x
	clr	(0x05, sp)
00105$:
;	driver/oled.c: 218: OLED_WR_Byte(Hzk[2*no+1][t],OLED_DATA);
	clrw	x
	ld	a, (0x05, sp)
	ld	xl, a
	addw	x, (0x01, sp)
	ld	a, (x)
	push	#0x01
	push	a
	call	_OLED_WR_Byte
	addw	sp, #2
;	driver/oled.c: 219: adder+=1;
	inc	(0x06, sp)
;	driver/oled.c: 216: for(t=0;t<16;t++)
	inc	(0x05, sp)
	ld	a, (0x05, sp)
	cp	a, #0x10
	jrc	00105$
;	driver/oled.c: 221: }
	addw	sp, #6
	ret
;	driver/oled.c: 223: void OLED_DrawBMP(unsigned char x0, unsigned char y0,unsigned char x1, unsigned char y1,unsigned char BMP[])
;	-----------------------------------------
;	 function OLED_DrawBMP
;	-----------------------------------------
_OLED_DrawBMP:
	sub	sp, #2
;	driver/oled.c: 225: unsigned int j=0;
	clrw	x
;	driver/oled.c: 230: for(y=y0;y<y1;y++)
	ld	a, (0x06, sp)
	ld	(0x01, sp), a
00110$:
	ld	a, (0x01, sp)
	cp	a, (0x08, sp)
	jrnc	00112$
;	driver/oled.c: 232: OLED_Set_Pos(x0,y);
	pushw	x
	ld	a, (0x03, sp)
	push	a
	ld	a, (0x08, sp)
	push	a
	call	_OLED_Set_Pos
	addw	sp, #2
	popw	x
;	driver/oled.c: 233: for(x=x0;x<x1;x++)
	ld	a, (0x05, sp)
	ld	(0x02, sp), a
00107$:
	ld	a, (0x02, sp)
	cp	a, (0x07, sp)
	jrnc	00119$
;	driver/oled.c: 235: OLED_WR_Byte(BMP[j++],OLED_DATA);
	ldw	y, x
	incw	x
	addw	y, (0x09, sp)
	ld	a, (y)
	pushw	x
	push	#0x01
	push	a
	call	_OLED_WR_Byte
	addw	sp, #2
	popw	x
;	driver/oled.c: 233: for(x=x0;x<x1;x++)
	inc	(0x02, sp)
	jra	00107$
00119$:
;	driver/oled.c: 230: for(y=y0;y<y1;y++)
	inc	(0x01, sp)
	jra	00110$
00112$:
;	driver/oled.c: 238: }
	addw	sp, #2
	ret
;	driver/oled.c: 242: void OLED_Init(void)
;	-----------------------------------------
;	 function OLED_Init
;	-----------------------------------------
_OLED_Init:
;	driver/oled.c: 244: GPIO_Init(OLED_SCLK_PORT, (GPIO_Pin_TypeDef)OLED_SCLK_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
	push	#0xe0
	push	#0x02
	push	#0x0a
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	driver/oled.c: 245: GPIO_Init(OLED_SDIN_PORT, (GPIO_Pin_TypeDef)OLED_SDIN_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
	push	#0xe0
	push	#0x04
	push	#0x0a
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	driver/oled.c: 246: GPIO_Init(OLED_RST_PORT, (GPIO_Pin_TypeDef)OLED_RST_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
	push	#0xe0
	push	#0x08
	push	#0x0a
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	driver/oled.c: 247: GPIO_Init(OLED_DC_PORT, (GPIO_Pin_TypeDef)OLED_DC_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
	push	#0xe0
	push	#0x10
	push	#0x0a
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	driver/oled.c: 248: GPIO_Init(OLED_CS_PORT, (GPIO_Pin_TypeDef)OLED_CS_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
	push	#0xe0
	push	#0x20
	push	#0x0a
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	driver/oled.c: 251: OLED_RST_Set();
	push	#0x08
	push	#0x0a
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
;	driver/oled.c: 252: delay_ms(100);
	push	#0x64
	push	#0x00
	call	_delay_ms
	addw	sp, #2
;	driver/oled.c: 253: OLED_RST_Clr();
	push	#0x08
	push	#0x0a
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	driver/oled.c: 254: delay_ms(100);
	push	#0x64
	push	#0x00
	call	_delay_ms
	addw	sp, #2
;	driver/oled.c: 255: OLED_RST_Set();
	push	#0x08
	push	#0x0a
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
;	driver/oled.c: 287: OLED_WR_Byte(0xAE,OLED_CMD);//--turn off oled panel
	push	#0x00
	push	#0xae
	call	_OLED_WR_Byte
	addw	sp, #2
;	driver/oled.c: 288: OLED_WR_Byte(0x00,OLED_CMD);//---set low column address
	push	#0x00
	push	#0x00
	call	_OLED_WR_Byte
	addw	sp, #2
;	driver/oled.c: 289: OLED_WR_Byte(0x10,OLED_CMD);//---set high column address
	push	#0x00
	push	#0x10
	call	_OLED_WR_Byte
	addw	sp, #2
;	driver/oled.c: 290: OLED_WR_Byte(0x40,OLED_CMD);//--set start line address  Set Mapping RAM Display Start Line (0x00~0x3F)
	push	#0x00
	push	#0x40
	call	_OLED_WR_Byte
	addw	sp, #2
;	driver/oled.c: 291: OLED_WR_Byte(0x81,OLED_CMD);//--set contrast control register
	push	#0x00
	push	#0x81
	call	_OLED_WR_Byte
	addw	sp, #2
;	driver/oled.c: 292: OLED_WR_Byte(0xCF,OLED_CMD); // Set SEG Output Current Brightness
	push	#0x00
	push	#0xcf
	call	_OLED_WR_Byte
	addw	sp, #2
;	driver/oled.c: 293: OLED_WR_Byte(0xA1,OLED_CMD);//--Set SEG/Column Mapping     0xa0左右反置 0xa1正常
	push	#0x00
	push	#0xa1
	call	_OLED_WR_Byte
	addw	sp, #2
;	driver/oled.c: 294: OLED_WR_Byte(0xC8,OLED_CMD);//Set COM/Row Scan Direction   0xc0上下反置 0xc8正常
	push	#0x00
	push	#0xc8
	call	_OLED_WR_Byte
	addw	sp, #2
;	driver/oled.c: 295: OLED_WR_Byte(0xA6,OLED_CMD);//--set normal display
	push	#0x00
	push	#0xa6
	call	_OLED_WR_Byte
	addw	sp, #2
;	driver/oled.c: 296: OLED_WR_Byte(0xA8,OLED_CMD);//--set multiplex ratio(1 to 64)
	push	#0x00
	push	#0xa8
	call	_OLED_WR_Byte
	addw	sp, #2
;	driver/oled.c: 297: OLED_WR_Byte(0x3f,OLED_CMD);//--1/64 duty
	push	#0x00
	push	#0x3f
	call	_OLED_WR_Byte
	addw	sp, #2
;	driver/oled.c: 298: OLED_WR_Byte(0xD3,OLED_CMD);//-set display offset	Shift Mapping RAM Counter (0x00~0x3F)
	push	#0x00
	push	#0xd3
	call	_OLED_WR_Byte
	addw	sp, #2
;	driver/oled.c: 299: OLED_WR_Byte(0x00,OLED_CMD);//-not offset
	push	#0x00
	push	#0x00
	call	_OLED_WR_Byte
	addw	sp, #2
;	driver/oled.c: 300: OLED_WR_Byte(0xd5,OLED_CMD);//--set display clock divide ratio/oscillator frequency
	push	#0x00
	push	#0xd5
	call	_OLED_WR_Byte
	addw	sp, #2
;	driver/oled.c: 301: OLED_WR_Byte(0x80,OLED_CMD);//--set divide ratio, Set Clock as 100 Frames/Sec
	push	#0x00
	push	#0x80
	call	_OLED_WR_Byte
	addw	sp, #2
;	driver/oled.c: 302: OLED_WR_Byte(0xD9,OLED_CMD);//--set pre-charge period
	push	#0x00
	push	#0xd9
	call	_OLED_WR_Byte
	addw	sp, #2
;	driver/oled.c: 303: OLED_WR_Byte(0xF1,OLED_CMD);//Set Pre-Charge as 15 Clocks & Discharge as 1 Clock
	push	#0x00
	push	#0xf1
	call	_OLED_WR_Byte
	addw	sp, #2
;	driver/oled.c: 304: OLED_WR_Byte(0xDA,OLED_CMD);//--set com pins hardware configuration
	push	#0x00
	push	#0xda
	call	_OLED_WR_Byte
	addw	sp, #2
;	driver/oled.c: 305: OLED_WR_Byte(0x12,OLED_CMD);
	push	#0x00
	push	#0x12
	call	_OLED_WR_Byte
	addw	sp, #2
;	driver/oled.c: 306: OLED_WR_Byte(0xDB,OLED_CMD);//--set vcomh
	push	#0x00
	push	#0xdb
	call	_OLED_WR_Byte
	addw	sp, #2
;	driver/oled.c: 307: OLED_WR_Byte(0x40,OLED_CMD);//Set VCOM Deselect Level
	push	#0x00
	push	#0x40
	call	_OLED_WR_Byte
	addw	sp, #2
;	driver/oled.c: 308: OLED_WR_Byte(0x20,OLED_CMD);//-Set Page Addressing Mode (0x00/0x01/0x02)
	push	#0x00
	push	#0x20
	call	_OLED_WR_Byte
	addw	sp, #2
;	driver/oled.c: 309: OLED_WR_Byte(0x02,OLED_CMD);//
	push	#0x00
	push	#0x02
	call	_OLED_WR_Byte
	addw	sp, #2
;	driver/oled.c: 310: OLED_WR_Byte(0x8D,OLED_CMD);//--set Charge Pump enable/disable
	push	#0x00
	push	#0x8d
	call	_OLED_WR_Byte
	addw	sp, #2
;	driver/oled.c: 311: OLED_WR_Byte(0x14,OLED_CMD);//--set(0x10) disable
	push	#0x00
	push	#0x14
	call	_OLED_WR_Byte
	addw	sp, #2
;	driver/oled.c: 312: OLED_WR_Byte(0xA4,OLED_CMD);// Disable Entire Display On (0xa4/0xa5)
	push	#0x00
	push	#0xa4
	call	_OLED_WR_Byte
	addw	sp, #2
;	driver/oled.c: 313: OLED_WR_Byte(0xA6,OLED_CMD);// Disable Inverse Display On (0xa6/a7)
	push	#0x00
	push	#0xa6
	call	_OLED_WR_Byte
	addw	sp, #2
;	driver/oled.c: 314: OLED_WR_Byte(0xAF,OLED_CMD);//--turn on oled panel
	push	#0x00
	push	#0xaf
	call	_OLED_WR_Byte
	addw	sp, #2
;	driver/oled.c: 316: OLED_WR_Byte(0xAF,OLED_CMD); /*display ON*/
	push	#0x00
	push	#0xaf
	call	_OLED_WR_Byte
	addw	sp, #2
;	driver/oled.c: 317: OLED_Clear();
	call	_OLED_Clear
;	driver/oled.c: 318: OLED_Set_Pos(0,0);
	push	#0x00
	push	#0x00
	call	_OLED_Set_Pos
	addw	sp, #2
;	driver/oled.c: 319: }
	ret
	.area CODE
	.area CONST
_F8X16:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x33	; 51	'3'
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x0c	; 12
	.db #0x06	; 6
	.db #0x10	; 16
	.db #0x0c	; 12
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x78	; 120	'x'
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x78	; 120	'x'
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x3f	; 63
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x3f	; 63
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0x88	; 136
	.db #0xfc	; 252
	.db #0x08	; 8
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x20	; 32
	.db #0xff	; 255
	.db #0x21	; 33
	.db #0x1e	; 30
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x08	; 8
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x21	; 33
	.db #0x1c	; 28
	.db #0x03	; 3
	.db #0x1e	; 30
	.db #0x21	; 33
	.db #0x1e	; 30
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x08	; 8
	.db #0x88	; 136
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1e	; 30
	.db #0x21	; 33
	.db #0x23	; 35
	.db #0x24	; 36
	.db #0x19	; 25
	.db #0x27	; 39
	.db #0x21	; 33
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x16	; 22
	.db #0x0e	; 14
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x18	; 24
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x18	; 24
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x18	; 24
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x20	; 32
	.db #0x18	; 24
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0xf0	; 240
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x0f	; 15
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x1f	; 31
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0xb0	; 176
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x60	; 96
	.db #0x18	; 24
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x60	; 96
	.db #0x18	; 24
	.db #0x06	; 6
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x88	; 136
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x28	; 40
	.db #0x24	; 36
	.db #0x22	; 34
	.db #0x21	; 33
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x08	; 8
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x48	; 72	'H'
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x11	; 17
	.db #0x0e	; 14
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x3f	; 63
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x08	; 8
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x19	; 25
	.db #0x21	; 33
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x11	; 17
	.db #0x0e	; 14
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x10	; 16
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x11	; 17
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x11	; 17
	.db #0x0e	; 14
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0xc8	; 200
	.db #0x38	; 56	'8'
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0x88	; 136
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x88	; 136
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1c	; 28
	.db #0x22	; 34
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0x22	; 34
	.db #0x1c	; 28
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x31	; 49	'1'
	.db #0x22	; 34
	.db #0x22	; 34
	.db #0x11	; 17
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x60	; 96
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0x48	; 72	'H'
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x36	; 54	'6'
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x30	; 48	'0'
	.db #0xc8	; 200
	.db #0x28	; 40
	.db #0xe8	; 232
	.db #0x10	; 16
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x18	; 24
	.db #0x27	; 39
	.db #0x24	; 36
	.db #0x23	; 35
	.db #0x14	; 20
	.db #0x0b	; 11
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x38	; 56	'8'
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x3c	; 60
	.db #0x23	; 35
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x27	; 39
	.db #0x38	; 56	'8'
	.db #0x20	; 32
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x11	; 17
	.db #0x0e	; 14
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x30	; 48	'0'
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x18	; 24
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0xe8	; 232
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x23	; 35
	.db #0x20	; 32
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0xe8	; 232
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x30	; 48	'0'
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x18	; 24
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x22	; 34
	.db #0x1e	; 30
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0x08	; 8
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x21	; 33
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x21	; 33
	.db #0x3f	; 63
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0x88	; 136
	.db #0xc0	; 192
	.db #0x28	; 40
	.db #0x18	; 24
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x20	; 32
	.db #0x01	; 1
	.db #0x26	; 38
	.db #0x38	; 56	'8'
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0x30	; 48	'0'
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0x08	; 8
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x18	; 24
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x21	; 33
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x18	; 24
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x38	; 56	'8'
	.db #0x50	; 80	'P'
	.db #0x4f	; 79	'O'
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x0c	; 12
	.db #0x30	; 48	'0'
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0x88	; 136
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x20	; 32
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0x22	; 34
	.db #0x1c	; 28
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x78	; 120	'x'
	.db #0x88	; 136
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc8	; 200
	.db #0x38	; 56	'8'
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x38	; 56	'8'
	.db #0x0e	; 14
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x3c	; 60
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x3c	; 60
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x18	; 24
	.db #0x68	; 104	'h'
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x68	; 104	'h'
	.db #0x18	; 24
	.db #0x08	; 8
	.db #0x20	; 32
	.db #0x30	; 48	'0'
	.db #0x2c	; 44
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x2c	; 44
	.db #0x30	; 48	'0'
	.db #0x20	; 32
	.db #0x08	; 8
	.db #0x38	; 56	'8'
	.db #0xc8	; 200
	.db #0x00	; 0
	.db #0xc8	; 200
	.db #0x38	; 56	'8'
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0xc8	; 200
	.db #0x38	; 56	'8'
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x38	; 56	'8'
	.db #0x26	; 38
	.db #0x21	; 33
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x30	; 48	'0'
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x06	; 6
	.db #0x38	; 56	'8'
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x19	; 25
	.db #0x24	; 36
	.db #0x22	; 34
	.db #0x22	; 34
	.db #0x22	; 34
	.db #0x3f	; 63
	.db #0x20	; 32
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x11	; 17
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x11	; 17
	.db #0x0e	; 14
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0e	; 14
	.db #0x11	; 17
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x11	; 17
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x88	; 136
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0e	; 14
	.db #0x11	; 17
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x3f	; 63
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x22	; 34
	.db #0x22	; 34
	.db #0x22	; 34
	.db #0x22	; 34
	.db #0x13	; 19
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xf0	; 240
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x6b	; 107	'k'
	.db #0x94	; 148
	.db #0x94	; 148
	.db #0x94	; 148
	.db #0x93	; 147
	.db #0x60	; 96
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x21	; 33
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x98	; 152
	.db #0x98	; 152
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x98	; 152
	.db #0x98	; 152
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x24	; 36
	.db #0x02	; 2
	.db #0x2d	; 45
	.db #0x30	; 48	'0'
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x21	; 33
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0xa1	; 161
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x11	; 17
	.db #0x0e	; 14
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0e	; 14
	.db #0x11	; 17
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0xa0	; 160
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x21	; 33
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x33	; 51	'3'
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x19	; 25
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xe0	; 224
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x3f	; 63
	.db #0x20	; 32
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x0e	; 14
	.db #0x30	; 48	'0'
	.db #0x08	; 8
	.db #0x06	; 6
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x0f	; 15
	.db #0x30	; 48	'0'
	.db #0x0c	; 12
	.db #0x03	; 3
	.db #0x0c	; 12
	.db #0x30	; 48	'0'
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x31	; 49	'1'
	.db #0x2e	; 46
	.db #0x0e	; 14
	.db #0x31	; 49	'1'
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x81	; 129
	.db #0x8e	; 142
	.db #0x70	; 112	'p'
	.db #0x18	; 24
	.db #0x06	; 6
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x21	; 33
	.db #0x30	; 48	'0'
	.db #0x2c	; 44
	.db #0x22	; 34
	.db #0x21	; 33
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x7c	; 124
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x7c	; 124
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_Hzk:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0xff	; 255
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0xff	; 255
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x5f	; 95
	.db #0x55	; 85	'U'
	.db #0x55	; 85	'U'
	.db #0x55	; 85	'U'
	.db #0x75	; 117	'u'
	.db #0x55	; 85	'U'
	.db #0x55	; 85	'U'
	.db #0x55	; 85	'U'
	.db #0x5f	; 95
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x00	; 0
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x20	; 32
	.db #0x0f	; 15
	.db #0x09	; 9
	.db #0x49	; 73	'I'
	.db #0x89	; 137
	.db #0x79	; 121	'y'
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x0f	; 15
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x02	; 2
	.db #0x42	; 66	'B'
	.db #0x4a	; 74	'J'
	.db #0xca	; 202
	.db #0x4a	; 74	'J'
	.db #0x4a	; 74	'J'
	.db #0xca	; 202
	.db #0x4a	; 74	'J'
	.db #0x4a	; 74	'J'
	.db #0x42	; 66	'B'
	.db #0x02	; 2
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0x00	; 0
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x40	; 64
	.db #0x50	; 80	'P'
	.db #0x4c	; 76	'L'
	.db #0x43	; 67	'C'
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x4f	; 79	'O'
	.db #0x50	; 80	'P'
	.db #0x50	; 80	'P'
	.db #0x5c	; 92
	.db #0x40	; 64
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0xff	; 255
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x7f	; 127
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x9f	; 159
	.db #0x80	; 128
	.db #0xf0	; 240
	.db #0x00	; 0
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db #0x80	; 128
	.db #0x82	; 130
	.db #0x82	; 130
	.db #0x82	; 130
	.db #0x82	; 130
	.db #0x82	; 130
	.db #0x82	; 130
	.db #0xe2	; 226
	.db #0xa2	; 162
	.db #0x92	; 146
	.db #0x8a	; 138
	.db #0x86	; 134
	.db #0x82	; 130
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0xa4	; 164
	.db #0xfe	; 254
	.db #0xa3	; 163
	.db #0x22	; 34
	.db #0x00	; 0
	.db #0x22	; 34
	.db #0xcc	; 204
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db #0x08	; 8
	.db #0x06	; 6
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0xff	; 255
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x00	; 0
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0xff	; 255
	.db #0x10	; 16
	.db #0x90	; 144
	.db #0x08	; 8
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0xff	; 255
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x08	; 8
	.db #0x00	; 0
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db #0x04	; 4
	.db #0x44	; 68	'D'
	.db #0x82	; 130
	.db #0x7f	; 127
	.db #0x01	; 1
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0x43	; 67	'C'
	.db #0x2c	; 44
	.db #0x10	; 16
	.db #0x28	; 40
	.db #0x46	; 70	'F'
	.db #0x81	; 129
	.db #0x80	; 128
	.db #0x00	; 0
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.area INITIALIZER
	.area CABS (ABS)
