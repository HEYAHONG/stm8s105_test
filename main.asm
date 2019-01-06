;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module main
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _Delay
	.globl _puts
	.globl _sprintf
	.globl _printf
	.globl _ReadADC
	.globl _ReadDHT12
	.globl _ds1302_read_time
	.globl _ds1302_check
	.globl _ds1302_port_init
	.globl _ds1302_port_deinit
	.globl _ds1302_active
	.globl _Init_UART2
	.globl _OLED_ShowString
	.globl _OLED_Clear
	.globl _OLED_Init
	.globl _GPIO_ReadInputPin
	.globl _GPIO_WriteReverse
	.globl _GPIO_Init
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
_main_count_196608_387:
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
;--------------------------------------------------------
; Stack segment in internal ram 
;--------------------------------------------------------
	.area	SSEG
__start__stack:
	.ds	1

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
; interrupt vector 
;--------------------------------------------------------
	.area HOME
__interrupt_vect:
	int s_GSINIT ; reset
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
__sdcc_gs_init_startup:
__sdcc_init_data:
; stm8_genXINIT() start
	ldw x, #l_DATA
	jreq	00002$
00001$:
	clr (s_DATA - 1, x)
	decw x
	jrne	00001$
00002$:
	ldw	x, #l_INITIALIZER
	jreq	00004$
00003$:
	ld	a, (s_INITIALIZER - 1, x)
	ld	(s_INITIALIZED - 1, x), a
	decw	x
	jrne	00003$
00004$:
; stm8_genXINIT() end
;	main.c: 98: static u8 count=0;
	clr	_main_count_196608_387+0
	.area GSFINAL
	jp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
__sdcc_program_startup:
	jp	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	main.c: 47: void Delay(uint16_t nCount)
;	-----------------------------------------
;	 function Delay
;	-----------------------------------------
_Delay:
;	main.c: 50: while (nCount != 0)
	ldw	x, (0x03, sp)
00101$:
	tnzw	x
	jrne	00117$
	ret
00117$:
;	main.c: 52: nCount--;
	decw	x
	jra	00101$
;	main.c: 54: }
	ret
;	main.c: 58: void main(void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
	sub	sp, #58
;	main.c: 62: GPIO_Init(LED_GPIO_PORT, (GPIO_Pin_TypeDef)LED_GPIO_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
	push	#0xe0
	push	#0x20
	push	#0x14
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	main.c: 63: GPIO_Init(GPIOF,GPIO_PIN_4, GPIO_MODE_IN_FL_NO_IT);
	push	#0x00
	push	#0x10
	push	#0x19
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	main.c: 65: Init_UART2();
	call	_Init_UART2
;	main.c: 66: OLED_Init();
	call	_OLED_Init
;	main.c: 67: ds1302_active();
	call	_ds1302_active
;	main.c: 68: OLED_Clear();
	call	_OLED_Clear
;	main.c: 69: enableInterrupts(); //使能中断
	rim
;	main.c: 71: OLED_ShowString(0,0,"STM8 Started!");
	push	#<___str_0
	push	#(___str_0 >> 8)
	push	#0x00
	push	#0x00
	call	_OLED_ShowString
	addw	sp, #4
;	main.c: 72: printf("STM8 Started!\r\n");
	push	#<___str_2
	push	#(___str_2 >> 8)
	call	_puts
	addw	sp, #2
;	main.c: 74: while (1)
00106$:
;	main.c: 78: sprintf(temp,"V:%4d,S:%1d",ReadADC(),GPIO_ReadInputPin(GPIOF,GPIO_PIN_4)==RESET?0:1);
	push	#0x10
	push	#0x19
	push	#0x50
	call	_GPIO_ReadInputPin
	addw	sp, #3
	tnz	a
	jrne	00110$
	clrw	x
	ldw	(0x2f, sp), x
	jra	00111$
00110$:
	ldw	x, #0x0001
	ldw	(0x2f, sp), x
00111$:
	call	_ReadADC
	ldw	y, sp
	addw	y, #16
	ldw	(0x2b, sp), y
	ld	a, (0x30, sp)
	push	a
	ld	a, (0x30, sp)
	push	a
	pushw	x
	push	#<___str_3
	push	#(___str_3 >> 8)
	pushw	y
	call	_sprintf
	addw	sp, #8
;	main.c: 79: printf("%s",temp);
	ldw	x, (0x2b, sp)
	pushw	x
	push	#<___str_4
	push	#(___str_4 >> 8)
	call	_printf
	addw	sp, #4
;	main.c: 80: printf("\r\n");
	push	#<___str_6
	push	#(___str_6 >> 8)
	call	_puts
	addw	sp, #2
;	main.c: 81: OLED_ShowString(0,2,temp);
	ldw	x, (0x2b, sp)
	pushw	x
	push	#0x02
	push	#0x00
	call	_OLED_ShowString
	addw	sp, #4
;	main.c: 84: ds1302_port_init();
	call	_ds1302_port_init
;	main.c: 85: if(ds1302_check())
	call	_ds1302_check
	ld	(0x26, sp), a
	jrne	00133$
	jp	00102$
00133$:
;	main.c: 89: ds1302_read_time(&ds_time);
	ldw	x, sp
	addw	x, #9
	ldw	(0x2d, sp), x
	pushw	x
	call	_ds1302_read_time
	addw	sp, #2
;	main.c: 90: sprintf(temp,"%2d/%2d/%2d",ds_time.hour,ds_time.minute/16*10+ds_time.minute%16,ds_time.second/16*10+ds_time.second%16);
	ldw	x, (0x2d, sp)
	ld	a, (0x6, x)
	ld	(0x1b, sp), a
	clr	(0x1a, sp)
	push	#0x10
	push	#0x00
	ldw	x, (0x1c, sp)
	pushw	x
	call	__divsint
	addw	sp, #4
	pushw	x
	sllw	x
	sllw	x
	addw	x, (1, sp)
	sllw	x
	addw	sp, #2
	ldw	(0x37, sp), x
	push	#0x10
	push	#0x00
	ldw	x, (0x1c, sp)
	pushw	x
	call	__modsint
	addw	sp, #4
	addw	x, (0x37, sp)
	ldw	(0x27, sp), x
	ldw	x, (0x2d, sp)
	ld	a, (0x5, x)
	ld	(0x3a, sp), a
	clr	(0x39, sp)
	push	#0x10
	push	#0x00
	ldw	x, (0x3b, sp)
	pushw	x
	call	__divsint
	addw	sp, #4
	pushw	x
	sllw	x
	sllw	x
	addw	x, (1, sp)
	sllw	x
	addw	sp, #2
	ldw	(0x29, sp), x
	push	#0x10
	push	#0x00
	ldw	x, (0x3b, sp)
	pushw	x
	call	__modsint
	addw	sp, #4
	addw	x, (0x29, sp)
	ldw	y, (0x2d, sp)
	ld	a, (0x4, y)
	ld	(0x25, sp), a
	clr	(0x24, sp)
	ldw	y, sp
	addw	y, #16
	ldw	(0x35, sp), y
	ld	a, (0x28, sp)
	push	a
	ld	a, (0x28, sp)
	push	a
	pushw	x
	ldw	x, (0x28, sp)
	pushw	x
	push	#<___str_7
	push	#(___str_7 >> 8)
	pushw	y
	call	_sprintf
	addw	sp, #10
;	main.c: 91: printf("%s",temp);
	ldw	x, (0x35, sp)
	pushw	x
	push	#<___str_4
	push	#(___str_4 >> 8)
	call	_printf
	addw	sp, #4
;	main.c: 92: printf("\r\n");
	push	#<___str_6
	push	#(___str_6 >> 8)
	call	_puts
	addw	sp, #2
;	main.c: 93: OLED_ShowString(0,4,temp);
	ldw	x, (0x35, sp)
	pushw	x
	push	#0x04
	push	#0x00
	call	_OLED_ShowString
	addw	sp, #4
00102$:
;	main.c: 95: ds1302_port_deinit();
	call	_ds1302_port_deinit
;	main.c: 100: if(count>=4)
	ld	a, _main_count_196608_387+0
	cp	a, #0x04
	jrnc	00134$
	jp	00104$
00134$:
;	main.c: 104: ReadDHT12(&data);
	ldw	y, sp
	addw	y, #21
	ldw	x, y
	pushw	y
	pushw	x
	call	_ReadDHT12
	addw	sp, #2
	popw	y
;	main.c: 105: sprintf(temp,"%2d.%1dC/%2d.%1d%%/%3d",data.T,data.T1,data.W,data.W1,data.sum);
	ldw	x, y
	ld	a, (0x4, x)
	ld	(0x34, sp), a
	clr	(0x33, sp)
	ldw	x, y
	ld	a, (0x3, x)
	ld	(0x32, sp), a
	clr	(0x31, sp)
	ldw	x, y
	ld	a, (0x2, x)
	ld	(0x23, sp), a
	clr	(0x22, sp)
	ldw	x, y
	ld	a, (0x1, x)
	ld	(0x21, sp), a
	clr	(0x20, sp)
	ld	a, (y)
	clr	(0x1e, sp)
	ldw	x, sp
	incw	x
	ldw	(0x1c, sp), x
	ldw	y, x
	ldw	x, (0x33, sp)
	pushw	x
	ldw	x, (0x33, sp)
	pushw	x
	ldw	x, (0x26, sp)
	pushw	x
	ldw	x, (0x26, sp)
	pushw	x
	push	a
	ld	a, (0x27, sp)
	push	a
	push	#<___str_9
	push	#(___str_9 >> 8)
	pushw	y
	call	_sprintf
	addw	sp, #14
;	main.c: 106: printf("%s",temp);
	ldw	x, (0x1c, sp)
	pushw	x
	push	#<___str_4
	push	#(___str_4 >> 8)
	call	_printf
	addw	sp, #4
;	main.c: 107: printf("\r\n");
	push	#<___str_6
	push	#(___str_6 >> 8)
	call	_puts
	addw	sp, #2
;	main.c: 108: OLED_ShowString(0,6,temp);
	ldw	x, (0x1c, sp)
	pushw	x
	push	#0x06
	push	#0x00
	call	_OLED_ShowString
	addw	sp, #4
;	main.c: 109: count=0;
	clr	_main_count_196608_387+0
00104$:
;	main.c: 112: count++;
	inc	_main_count_196608_387+0
;	main.c: 114: GPIO_WriteReverse(LED_GPIO_PORT, (GPIO_Pin_TypeDef)LED_GPIO_PINS);
	push	#0x20
	push	#0x14
	push	#0x50
	call	_GPIO_WriteReverse
	addw	sp, #3
;	main.c: 115: Delay(0xffff);
	push	#0xff
	push	#0xff
	call	_Delay
	addw	sp, #2
;	main.c: 118: }
	jp	00106$
	.area CODE
	.area CONST
___str_0:
	.ascii "STM8 Started!"
	.db 0x00
___str_2:
	.ascii "STM8 Started!"
	.db 0x0d
	.db 0x00
___str_3:
	.ascii "V:%4d,S:%1d"
	.db 0x00
___str_4:
	.ascii "%s"
	.db 0x00
___str_6:
	.db 0x0d
	.db 0x00
___str_7:
	.ascii "%2d/%2d/%2d"
	.db 0x00
___str_9:
	.ascii "%2d.%1dC/%2d.%1d%%/%3d"
	.db 0x00
	.area INITIALIZER
	.area CABS (ABS)
