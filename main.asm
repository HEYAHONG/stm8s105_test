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
	.globl _ds1302_read_time
	.globl _ds1302_check
	.globl _ds1302_port_init
	.globl _ds1302_port_deinit
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
;	main.c: 46: void Delay(uint16_t nCount)
;	-----------------------------------------
;	 function Delay
;	-----------------------------------------
_Delay:
;	main.c: 49: while (nCount != 0)
	ldw	x, (0x03, sp)
00101$:
	tnzw	x
	jrne	00117$
	ret
00117$:
;	main.c: 51: nCount--;
	decw	x
	jra	00101$
;	main.c: 53: }
	ret
;	main.c: 57: void main(void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
	sub	sp, #39
;	main.c: 61: GPIO_Init(LED_GPIO_PORT, (GPIO_Pin_TypeDef)LED_GPIO_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
	push	#0xe0
	push	#0x20
	push	#0x14
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	main.c: 62: GPIO_Init(GPIOF,GPIO_PIN_4, GPIO_MODE_IN_FL_NO_IT);
	push	#0x00
	push	#0x10
	push	#0x19
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	main.c: 64: Init_UART2();
	call	_Init_UART2
;	main.c: 65: OLED_Init();
	call	_OLED_Init
;	main.c: 66: OLED_Clear();
	call	_OLED_Clear
;	main.c: 67: enableInterrupts(); //使能中断
	rim
;	main.c: 69: OLED_ShowString(0,0,"STM8 Started!");
	push	#<___str_0
	push	#(___str_0 >> 8)
	push	#0x00
	push	#0x00
	call	_OLED_ShowString
	addw	sp, #4
;	main.c: 70: printf("STM8 Started!\r\n");
	push	#<___str_2
	push	#(___str_2 >> 8)
	call	_puts
	addw	sp, #2
;	main.c: 72: while (1)
00104$:
;	main.c: 76: sprintf(temp,"V:%4d,S:%1d",ReadADC(),GPIO_ReadInputPin(GPIOF,GPIO_PIN_4)==RESET?0:1);
	push	#0x10
	push	#0x19
	push	#0x50
	call	_GPIO_ReadInputPin
	addw	sp, #3
	tnz	a
	jrne	00108$
	clrw	x
	ldw	(0x1e, sp), x
	jra	00109$
00108$:
	ldw	x, #0x0001
	ldw	(0x1e, sp), x
00109$:
	call	_ReadADC
	ldw	y, sp
	addw	y, #8
	ldw	(0x20, sp), y
	ld	a, (0x1f, sp)
	push	a
	ld	a, (0x1f, sp)
	push	a
	pushw	x
	push	#<___str_3
	push	#(___str_3 >> 8)
	pushw	y
	call	_sprintf
	addw	sp, #8
;	main.c: 77: printf("%s",temp);
	ldw	x, (0x20, sp)
	pushw	x
	push	#<___str_4
	push	#(___str_4 >> 8)
	call	_printf
	addw	sp, #4
;	main.c: 78: printf("\r\n");
	push	#<___str_6
	push	#(___str_6 >> 8)
	call	_puts
	addw	sp, #2
;	main.c: 79: OLED_ShowString(0,2,temp);
	ldw	x, (0x20, sp)
	pushw	x
	push	#0x02
	push	#0x00
	call	_OLED_ShowString
	addw	sp, #4
;	main.c: 82: ds1302_port_init();
	call	_ds1302_port_init
;	main.c: 83: if(ds1302_check())
	call	_ds1302_check
	tnz	a
	jrne	00126$
	jp	00102$
00126$:
;	main.c: 87: ds1302_read_time(&ds_time);
	ldw	x, sp
	incw	x
	ldw	(0x26, sp), x
	pushw	x
	call	_ds1302_read_time
	addw	sp, #2
;	main.c: 88: sprintf(temp,"%2d/%2d/%2d",ds_time.hour,ds_time.minute/16*10+ds_time.minute%16,ds_time.second/16*10+ds_time.second%16);
	ldw	x, (0x26, sp)
	ld	a, (0x6, x)
	ld	(0x1d, sp), a
	clr	(0x1c, sp)
	push	#0x10
	push	#0x00
	ldw	x, (0x1e, sp)
	pushw	x
	call	__divsint
	addw	sp, #4
	pushw	x
	sllw	x
	sllw	x
	addw	x, (1, sp)
	sllw	x
	addw	sp, #2
	ldw	(0x22, sp), x
	push	#0x10
	push	#0x00
	ldw	x, (0x1e, sp)
	pushw	x
	call	__modsint
	addw	sp, #4
	addw	x, (0x22, sp)
	ldw	(0x24, sp), x
	ldw	x, (0x26, sp)
	ld	a, (0x5, x)
	ld	(0x19, sp), a
	clr	(0x18, sp)
	push	#0x10
	push	#0x00
	ldw	x, (0x1a, sp)
	pushw	x
	call	__divsint
	addw	sp, #4
	pushw	x
	sllw	x
	sllw	x
	addw	x, (1, sp)
	sllw	x
	addw	sp, #2
	ldw	(0x16, sp), x
	push	#0x10
	push	#0x00
	ldw	x, (0x1a, sp)
	pushw	x
	call	__modsint
	addw	sp, #4
	addw	x, (0x16, sp)
	ldw	(0x14, sp), x
	ldw	x, (0x26, sp)
	ld	a, (0x4, x)
	clr	(0x12, sp)
	ldw	x, sp
	addw	x, #8
	ldw	(0x1a, sp), x
	ldw	y, x
	ldw	x, (0x24, sp)
	pushw	x
	ldw	x, (0x16, sp)
	pushw	x
	push	a
	ld	a, (0x17, sp)
	push	a
	push	#<___str_7
	push	#(___str_7 >> 8)
	pushw	y
	call	_sprintf
	addw	sp, #10
;	main.c: 89: printf("%s",temp);
	ldw	x, (0x1a, sp)
	pushw	x
	push	#<___str_4
	push	#(___str_4 >> 8)
	call	_printf
	addw	sp, #4
;	main.c: 90: printf("\r\n");
	push	#<___str_6
	push	#(___str_6 >> 8)
	call	_puts
	addw	sp, #2
;	main.c: 91: OLED_ShowString(0,4,temp);
	ldw	x, (0x1a, sp)
	pushw	x
	push	#0x04
	push	#0x00
	call	_OLED_ShowString
	addw	sp, #4
00102$:
;	main.c: 93: ds1302_port_deinit();
	call	_ds1302_port_deinit
;	main.c: 95: GPIO_WriteReverse(LED_GPIO_PORT, (GPIO_Pin_TypeDef)LED_GPIO_PINS);
	push	#0x20
	push	#0x14
	push	#0x50
	call	_GPIO_WriteReverse
	addw	sp, #3
;	main.c: 96: Delay(0xffff);
	push	#0xff
	push	#0xff
	call	_Delay
	addw	sp, #2
;	main.c: 99: }
	jp	00104$
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
	.area INITIALIZER
	.area CABS (ABS)
