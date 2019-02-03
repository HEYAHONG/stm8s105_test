;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module ds1302
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _ds1302_read
	.globl _ds1302_write
	.globl _ds1302_read_byte
	.globl _ds1302_write_byte
	.globl _write_IO
	.globl _read_IO
	.globl _GPIO_ReadInputPin
	.globl _GPIO_WriteLow
	.globl _GPIO_WriteHigh
	.globl _GPIO_Init
	.globl _ds1302_port_deinit
	.globl _ds1302_port_init
	.globl _ds1302_read_time
	.globl _ds1302_write_time
	.globl _ds1302_active
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
;	driver/ds1302.c: 28: void ds1302_port_deinit(void)
;	-----------------------------------------
;	 function ds1302_port_deinit
;	-----------------------------------------
_ds1302_port_deinit:
;	driver/ds1302.c: 30: GPIO_Init(DS1302_PORT,DS1302_CLK_PIN, GPIO_Mode_In_FL_No_IT);//RTC_CLK
	push	#0x40
	push	#0x08
	push	#0x05
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	driver/ds1302.c: 31: GPIO_Init(DS1302_PORT_RST,DS1302_RST_PIN, GPIO_Mode_In_FL_No_IT);//        
	push	#0x40
	push	#0x02
	push	#0x05
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	driver/ds1302.c: 32: GPIO_Init(DS1302_PORT,DS1302_IO_PIN, GPIO_Mode_In_FL_No_IT);      //RTC_DATA   
	push	#0x40
	push	#0x04
	push	#0x05
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	driver/ds1302.c: 34: }
	ret
;	driver/ds1302.c: 36: void ds1302_port_init(void)
;	-----------------------------------------
;	 function ds1302_port_init
;	-----------------------------------------
_ds1302_port_init:
;	driver/ds1302.c: 38: GPIO_Init(DS1302_PORT,DS1302_CLK_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);//RTC_CLK
	push	#0xf0
	push	#0x08
	push	#0x05
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	driver/ds1302.c: 39: GPIO_Init(DS1302_PORT_RST,DS1302_RST_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);//        
	push	#0xf0
	push	#0x02
	push	#0x05
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	driver/ds1302.c: 40: GPIO_Init(DS1302_PORT,DS1302_IO_PIN, GPIO_MODE_IN_PU_NO_IT);      //RTC_DATA   
	push	#0x40
	push	#0x04
	push	#0x05
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	driver/ds1302.c: 42: GPIO_LOW(DS1302_PORT_RST,DS1302_RST_PIN); 
	push	#0x02
	push	#0x05
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	driver/ds1302.c: 43: GPIO_LOW(DS1302_PORT,DS1302_CLK_PIN); 
	push	#0x08
	push	#0x05
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	driver/ds1302.c: 47: }
	ret
;	driver/ds1302.c: 49: void read_IO(void){
;	-----------------------------------------
;	 function read_IO
;	-----------------------------------------
_read_IO:
;	driver/ds1302.c: 50: GPIO_Init(DS1302_PORT,DS1302_IO_PIN, GPIO_MODE_IN_PU_NO_IT);   //RTC_DATA        
	push	#0x40
	push	#0x04
	push	#0x05
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	driver/ds1302.c: 51: }
	ret
;	driver/ds1302.c: 53: void write_IO(void){ 
;	-----------------------------------------
;	 function write_IO
;	-----------------------------------------
_write_IO:
;	driver/ds1302.c: 54: GPIO_Init(DS1302_PORT,DS1302_IO_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);//RTC_DATA
	push	#0xf0
	push	#0x04
	push	#0x05
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	driver/ds1302.c: 55: }
	ret
;	driver/ds1302.c: 58: void ds1302_write_byte(unsigned char temp) 
;	-----------------------------------------
;	 function ds1302_write_byte
;	-----------------------------------------
_ds1302_write_byte:
	push	a
;	driver/ds1302.c: 61: for (i=0;i<8;i++)     
	clr	(0x01, sp)
00105$:
;	driver/ds1302.c: 63: GPIO_LOW(DS1302_PORT,DS1302_CLK_PIN);
	push	#0x08
	push	#0x05
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	driver/ds1302.c: 65: if(temp&0x01) {
	ld	a, (0x04, sp)
	srl	a
	jrnc	00102$
;	driver/ds1302.c: 66: GPIO_HIGH(DS1302_PORT,DS1302_IO_PIN); 
	push	#0x04
	push	#0x05
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
	jra	00103$
00102$:
;	driver/ds1302.c: 68: GPIO_LOW(DS1302_PORT,DS1302_IO_PIN);
	push	#0x04
	push	#0x05
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
00103$:
;	driver/ds1302.c: 70: temp>>=1; 
	srl	(0x04, sp)
;	driver/ds1302.c: 72: GPIO_HIGH(DS1302_PORT,DS1302_CLK_PIN); 
	push	#0x08
	push	#0x05
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
;	driver/ds1302.c: 61: for (i=0;i<8;i++)     
	inc	(0x01, sp)
	ld	a, (0x01, sp)
	cp	a, #0x08
	jrc	00105$
;	driver/ds1302.c: 75: }  
	pop	a
	ret
;	driver/ds1302.c: 76: unsigned char ds1302_read_byte(void) 
;	-----------------------------------------
;	 function ds1302_read_byte
;	-----------------------------------------
_ds1302_read_byte:
	sub	sp, #2
;	driver/ds1302.c: 78: unsigned char i,temp=0;
	clr	(0x01, sp)
;	driver/ds1302.c: 79: for (i=0;i<8;i++) 		
	clr	(0x02, sp)
00104$:
;	driver/ds1302.c: 81: GPIO_LOW(DS1302_PORT,DS1302_CLK_PIN);
	push	#0x08
	push	#0x05
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	driver/ds1302.c: 82: temp>>=1;
	ld	a, (0x01, sp)
	srl	a
	ld	(0x01, sp), a
;	driver/ds1302.c: 83: if(GPIO_ReadInputDataBit(DS1302_PORT,DS1302_IO_PIN))
	push	#0x04
	push	#0x05
	push	#0x50
	call	_GPIO_ReadInputPin
	addw	sp, #3
	tnz	a
	jreq	00102$
;	driver/ds1302.c: 85: temp|=0x80;	
	ld	a, (0x01, sp)
	or	a, #0x80
	ld	(0x01, sp), a
00102$:
;	driver/ds1302.c: 88: GPIO_HIGH(DS1302_PORT,DS1302_CLK_PIN); 
	push	#0x08
	push	#0x05
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
;	driver/ds1302.c: 79: for (i=0;i<8;i++) 		
	inc	(0x02, sp)
	ld	a, (0x02, sp)
	cp	a, #0x08
	jrc	00104$
;	driver/ds1302.c: 92: return temp;
	ld	a, (0x01, sp)
;	driver/ds1302.c: 93: } 
	addw	sp, #2
	ret
;	driver/ds1302.c: 95: void ds1302_write( unsigned char address,unsigned char dat )     
;	-----------------------------------------
;	 function ds1302_write
;	-----------------------------------------
_ds1302_write:
;	driver/ds1302.c: 97: write_IO();
	call	_write_IO
;	driver/ds1302.c: 98: GPIO_LOW(DS1302_PORT_RST,DS1302_RST_PIN);   //写地址，写数据 RST保持高电平
	push	#0x02
	push	#0x05
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	driver/ds1302.c: 99: GPIO_LOW(DS1302_PORT,DS1302_CLK_PIN);
	push	#0x08
	push	#0x05
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	driver/ds1302.c: 100: GPIO_HIGH(DS1302_PORT_RST,DS1302_RST_PIN);
	push	#0x02
	push	#0x05
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
;	driver/ds1302.c: 101: ds1302_write_byte(address);	
	ld	a, (0x03, sp)
	push	a
	call	_ds1302_write_byte
	pop	a
;	driver/ds1302.c: 102: ds1302_write_byte(dat);		
	ld	a, (0x04, sp)
	push	a
	call	_ds1302_write_byte
	pop	a
;	driver/ds1302.c: 103: GPIO_LOW(DS1302_PORT_RST,DS1302_RST_PIN);
	push	#0x02
	push	#0x05
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	driver/ds1302.c: 105: }
	ret
;	driver/ds1302.c: 107: unsigned char ds1302_read( unsigned char address )
;	-----------------------------------------
;	 function ds1302_read
;	-----------------------------------------
_ds1302_read:
;	driver/ds1302.c: 110: write_IO();
	call	_write_IO
;	driver/ds1302.c: 111: GPIO_LOW(DS1302_PORT_RST,DS1302_RST_PIN);
	push	#0x02
	push	#0x05
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	driver/ds1302.c: 112: GPIO_LOW(DS1302_PORT,DS1302_CLK_PIN);
	push	#0x08
	push	#0x05
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	driver/ds1302.c: 113: GPIO_HIGH(DS1302_PORT_RST,DS1302_RST_PIN);
	push	#0x02
	push	#0x05
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
;	driver/ds1302.c: 114: ds1302_write_byte(address|0x01);  //读标志：地址最后一位为1
	ld	a, (0x03, sp)
	or	a, #0x01
	push	a
	call	_ds1302_write_byte
	pop	a
;	driver/ds1302.c: 115: read_IO();
	call	_read_IO
;	driver/ds1302.c: 116: ret = ds1302_read_byte();
	call	_ds1302_read_byte
;	driver/ds1302.c: 117: GPIO_LOW(DS1302_PORT_RST,DS1302_RST_PIN);
	push	a
	push	#0x02
	push	#0x05
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
	pop	a
;	driver/ds1302.c: 118: return (ret);		
;	driver/ds1302.c: 119: }	
	ret
;	driver/ds1302.c: 134: void ds1302_read_time(DS1302_TIME* time) 
;	-----------------------------------------
;	 function ds1302_read_time
;	-----------------------------------------
_ds1302_read_time:
	sub	sp, #2
;	driver/ds1302.c: 136: ds1302_port_init();
	call	_ds1302_port_init
;	driver/ds1302.c: 137: time->year=ds1302_read(DS1302_YEAR_REG); //年 
	ldw	y, (0x05, sp)
	ldw	(0x01, sp), y
	push	#0x8c
	call	_ds1302_read
	addw	sp, #1
	ldw	x, (0x01, sp)
	ld	(x), a
;	driver/ds1302.c: 138: time->month=ds1302_read(DS1302_MONTH_REG);//月 
	ldw	x, (0x01, sp)
	incw	x
	pushw	x
	push	#0x88
	call	_ds1302_read
	addw	sp, #1
	popw	x
	ld	(x), a
;	driver/ds1302.c: 139: time->day=ds1302_read(DS1302_DATE_REG); //日 
	ldw	x, (0x01, sp)
	incw	x
	incw	x
	pushw	x
	push	#0x86
	call	_ds1302_read
	addw	sp, #1
	popw	x
	ld	(x), a
;	driver/ds1302.c: 140: time->week=ds1302_read(DS1302_DAY_REG); //周 
	ldw	x, (0x01, sp)
	addw	x, #0x0003
	pushw	x
	push	#0x8a
	call	_ds1302_read
	addw	sp, #1
	popw	x
	ld	(x), a
;	driver/ds1302.c: 141: time->hour=ds1302_read(DS1302_HR_REG); //时 
	ldw	x, (0x01, sp)
	addw	x, #0x0004
	pushw	x
	push	#0x84
	call	_ds1302_read
	addw	sp, #1
	popw	x
	ld	(x), a
;	driver/ds1302.c: 142: time->minute=ds1302_read(DS1302_MIN_REG); //分 
	ldw	x, (0x01, sp)
	addw	x, #0x0005
	pushw	x
	push	#0x82
	call	_ds1302_read
	addw	sp, #1
	popw	x
	ld	(x), a
;	driver/ds1302.c: 143: time->second=ds1302_read(DS1302_SEC_REG); //秒 
	ldw	x, (0x01, sp)
	addw	x, #0x0006
	pushw	x
	push	#0x80
	call	_ds1302_read
	addw	sp, #1
	popw	x
	ld	(x), a
;	driver/ds1302.c: 144: ds1302_port_deinit();
	call	_ds1302_port_deinit
;	driver/ds1302.c: 145: } 
	addw	sp, #2
	ret
;	driver/ds1302.c: 146: void ds1302_write_time(DS1302_TIME* time) 
;	-----------------------------------------
;	 function ds1302_write_time
;	-----------------------------------------
_ds1302_write_time:
	sub	sp, #2
;	driver/ds1302.c: 148: ds1302_port_init();
	call	_ds1302_port_init
;	driver/ds1302.c: 149: ds1302_write(DS1302_CONTROL_REG,0x00); //关闭写保护 
	push	#0x00
	push	#0x8e
	call	_ds1302_write
	addw	sp, #2
;	driver/ds1302.c: 150: ds1302_write(DS1302_SEC_REG,0x80); //暂停 
	push	#0x80
	push	#0x80
	call	_ds1302_write
	addw	sp, #2
;	driver/ds1302.c: 151: ds1302_write(DS1302_CHARGER_REG,0xa9); //涓流充电 
	push	#0xa9
	push	#0x90
	call	_ds1302_write
	addw	sp, #2
;	driver/ds1302.c: 153: ds1302_write(DS1302_SEC_REG, 0x00);           // 启动振荡器
	push	#0x00
	push	#0x80
	call	_ds1302_write
	addw	sp, #2
;	driver/ds1302.c: 154: ds1302_write(DS1302_YEAR_REG,time->year); //年 
	ldw	y, (0x05, sp)
	ldw	(0x01, sp), y
	ldw	x, y
	ld	a, (x)
	push	a
	push	#0x8c
	call	_ds1302_write
	addw	sp, #2
;	driver/ds1302.c: 155: ds1302_write(DS1302_MONTH_REG,time->month); //月 
	ldw	x, (0x01, sp)
	ld	a, (0x1, x)
	push	a
	push	#0x88
	call	_ds1302_write
	addw	sp, #2
;	driver/ds1302.c: 156: ds1302_write(DS1302_DATE_REG,time->day); //日 
	ldw	x, (0x01, sp)
	ld	a, (0x2, x)
	push	a
	push	#0x86
	call	_ds1302_write
	addw	sp, #2
;	driver/ds1302.c: 157: ds1302_write(DS1302_DAY_REG,time->week); //周 
	ldw	x, (0x01, sp)
	ld	a, (0x3, x)
	push	a
	push	#0x8a
	call	_ds1302_write
	addw	sp, #2
;	driver/ds1302.c: 158: ds1302_write(DS1302_HR_REG,time->hour); //时 
	ldw	x, (0x01, sp)
	ld	a, (0x4, x)
	push	a
	push	#0x84
	call	_ds1302_write
	addw	sp, #2
;	driver/ds1302.c: 159: ds1302_write(DS1302_MIN_REG,time->minute); //分 
	ldw	x, (0x01, sp)
	ld	a, (0x5, x)
	push	a
	push	#0x82
	call	_ds1302_write
	addw	sp, #2
;	driver/ds1302.c: 160: ds1302_write(DS1302_SEC_REG,time->second); //秒 
	ldw	x, (0x01, sp)
	ld	a, (0x6, x)
	push	a
	push	#0x80
	call	_ds1302_write
	addw	sp, #2
;	driver/ds1302.c: 161: ds1302_write(DS1302_CONTROL_REG,0x80); //打开写保护 
	push	#0x80
	push	#0x8e
	call	_ds1302_write
	addw	sp, #2
;	driver/ds1302.c: 162: ds1302_port_deinit();
	call	_ds1302_port_deinit
;	driver/ds1302.c: 163: }
	addw	sp, #2
	ret
;	driver/ds1302.c: 180: void ds1302_active()
;	-----------------------------------------
;	 function ds1302_active
;	-----------------------------------------
_ds1302_active:
;	driver/ds1302.c: 182: ds1302_port_init();
	call	_ds1302_port_init
;	driver/ds1302.c: 183: ds1302_write(DS1302_CONTROL_REG,0x00); //关闭写保护
	push	#0x00
	push	#0x8e
	call	_ds1302_write
	addw	sp, #2
;	driver/ds1302.c: 184: ds1302_write(DS1302_SEC_REG,ds1302_read(DS1302_SEC_REG) & 0x7f); 
	push	#0x80
	call	_ds1302_read
	addw	sp, #1
	and	a, #0x7f
	push	a
	push	#0x80
	call	_ds1302_write
	addw	sp, #2
;	driver/ds1302.c: 185: ds1302_write(DS1302_HR_REG,ds1302_read(DS1302_HR_REG)&0x7f);
	push	#0x84
	call	_ds1302_read
	addw	sp, #1
	and	a, #0x7f
	push	a
	push	#0x84
	call	_ds1302_write
	addw	sp, #2
;	driver/ds1302.c: 186: ds1302_write(DS1302_CONTROL_REG,0x80); //打开写保护
	push	#0x80
	push	#0x8e
	call	_ds1302_write
	addw	sp, #2
;	driver/ds1302.c: 187: ds1302_port_deinit();
;	driver/ds1302.c: 188: }
	jp	_ds1302_port_deinit
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
