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
	.globl _GPIO_WriteLow
	.globl _GPIO_WriteHigh
	.globl _GPIO_Init
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
_main_count_196608_389:
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
	int _TRAP_IRQHandler ; trap
	int _TLI_IRQHandler ; int0
	int _AWU_IRQHandler ; int1
	int _CLK_IRQHandler ; int2
	int _EXTI_PORTA_IRQHandler ; int3
	int _EXTI_PORTB_IRQHandler ; int4
	int _EXTI_PORTC_IRQHandler ; int5
	int _EXTI_PORTD_IRQHandler ; int6
	int _EXTI_PORTE_IRQHandler ; int7
	int 0x000000 ; int8
	int 0x000000 ; int9
	int _SPI_IRQHandler ; int10
	int _TIM1_UPD_OVF_TRG_BRK_IRQHandler ; int11
	int _TIM1_CAP_COM_IRQHandler ; int12
	int _TIM2_UPD_OVF_BRK_IRQHandler ; int13
	int _TIM2_CAP_COM_IRQHandler ; int14
	int 0x000000 ; int15
	int 0x000000 ; int16
	int 0x000000 ; int17
	int 0x000000 ; int18
	int _I2C_IRQHandler ; int19
	int _UART2_TX_IRQHandler ; int20
	int _UART2_RX_IRQHandler ; int21
	int _ADC1_IRQHandler ; int22
	int _TIM4_UPD_OVF_IRQHandler ; int23
	int _EEPROM_EEC_IRQHandler ; int24
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
;	main.c: 105: static u8 count=0;
	clr	_main_count_196608_389+0
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
	sub	sp, #62
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
;	main.c: 74: GPIO_Init(GPIOD, GPIO_PIN_7, GPIO_MODE_OUT_PP_LOW_FAST);
	push	#0xe0
	push	#0x80
	push	#0x0f
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	main.c: 75: GPIO_WriteHigh(GPIOD,GPIO_PIN_7);
	push	#0x80
	push	#0x0f
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
;	main.c: 76: Delay(0xffff);
	push	#0xff
	push	#0xff
	call	_Delay
	addw	sp, #2
;	main.c: 77: GPIO_WriteLow(GPIOD,GPIO_PIN_7);
	push	#0x80
	push	#0x0f
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	main.c: 81: while (1)
00106$:
;	main.c: 85: sprintf(temp,"V:%4d,S:%1d",ReadADC(),GPIO_ReadInputPin(GPIOF,GPIO_PIN_4)==RESET?0:1);
	push	#0x10
	push	#0x19
	push	#0x50
	call	_GPIO_ReadInputPin
	addw	sp, #3
	tnz	a
	jrne	00110$
	clrw	x
	ldw	(0x31, sp), x
	jra	00111$
00110$:
	ldw	x, #0x0001
	ldw	(0x31, sp), x
00111$:
	call	_ReadADC
	ldw	y, sp
	addw	y, #16
	ldw	(0x27, sp), y
	ld	a, (0x32, sp)
	push	a
	ld	a, (0x32, sp)
	push	a
	pushw	x
	push	#<___str_3
	push	#(___str_3 >> 8)
	pushw	y
	call	_sprintf
	addw	sp, #8
;	main.c: 86: printf("%s",temp);
	ldw	x, (0x27, sp)
	pushw	x
	push	#<___str_4
	push	#(___str_4 >> 8)
	call	_printf
	addw	sp, #4
;	main.c: 87: printf("\r\n");
	push	#<___str_6
	push	#(___str_6 >> 8)
	call	_puts
	addw	sp, #2
;	main.c: 88: OLED_ShowString(0,2,temp);
	ldw	x, (0x27, sp)
	pushw	x
	push	#0x02
	push	#0x00
	call	_OLED_ShowString
	addw	sp, #4
;	main.c: 91: ds1302_port_init();
	call	_ds1302_port_init
;	main.c: 92: if(ds1302_check())
	call	_ds1302_check
	ld	(0x22, sp), a
	jrne	00133$
	jp	00102$
00133$:
;	main.c: 96: ds1302_read_time(&ds_time);
	ldw	x, sp
	addw	x, #9
	ldw	(0x2d, sp), x
	pushw	x
	call	_ds1302_read_time
	addw	sp, #2
;	main.c: 97: sprintf(temp,"%2d/%2d/%2d",ds_time.hour/16*10+ds_time.hour%16,ds_time.minute/16*10+ds_time.minute%16,ds_time.second/16*10+ds_time.second%16);
	ldw	x, (0x2d, sp)
	ld	a, (0x6, x)
	ld	(0x30, sp), a
	clr	(0x2f, sp)
	push	#0x10
	push	#0x00
	ldw	x, (0x31, sp)
	pushw	x
	call	__divsint
	addw	sp, #4
	pushw	x
	sllw	x
	sllw	x
	addw	x, (1, sp)
	sllw	x
	addw	sp, #2
	ldw	(0x39, sp), x
	push	#0x10
	push	#0x00
	ldw	x, (0x31, sp)
	pushw	x
	call	__modsint
	addw	sp, #4
	addw	x, (0x39, sp)
	ldw	(0x29, sp), x
	ldw	x, (0x2d, sp)
	ld	a, (0x5, x)
	ld	(0x2c, sp), a
	clr	(0x2b, sp)
	push	#0x10
	push	#0x00
	ldw	x, (0x2d, sp)
	pushw	x
	call	__divsint
	addw	sp, #4
	pushw	x
	sllw	x
	sllw	x
	addw	x, (1, sp)
	sllw	x
	addw	sp, #2
	ldw	(0x1a, sp), x
	push	#0x10
	push	#0x00
	ldw	x, (0x2d, sp)
	pushw	x
	call	__modsint
	addw	sp, #4
	addw	x, (0x1a, sp)
	ldw	(0x23, sp), x
	ldw	x, (0x2d, sp)
	ld	a, (0x4, x)
	ld	(0x26, sp), a
	clr	(0x25, sp)
	push	#0x10
	push	#0x00
	ldw	x, (0x27, sp)
	pushw	x
	call	__divsint
	addw	sp, #4
	pushw	x
	sllw	x
	sllw	x
	addw	x, (1, sp)
	sllw	x
	addw	sp, #2
	ldw	(0x3d, sp), x
	push	#0x10
	push	#0x00
	ldw	x, (0x27, sp)
	pushw	x
	call	__modsint
	addw	sp, #4
	addw	x, (0x3d, sp)
	exgw	x, y
	ldw	x, sp
	addw	x, #16
	ldw	(0x3b, sp), x
	ld	a, (0x2a, sp)
	push	a
	ld	a, (0x2a, sp)
	push	a
	ld	a, (0x26, sp)
	push	a
	ld	a, (0x26, sp)
	push	a
	pushw	y
	push	#<___str_7
	push	#(___str_7 >> 8)
	pushw	x
	call	_sprintf
	addw	sp, #10
;	main.c: 98: printf("%s",temp);
	ldw	x, (0x3b, sp)
	pushw	x
	push	#<___str_4
	push	#(___str_4 >> 8)
	call	_printf
	addw	sp, #4
;	main.c: 99: printf("\r\n");
	push	#<___str_6
	push	#(___str_6 >> 8)
	call	_puts
	addw	sp, #2
;	main.c: 100: OLED_ShowString(0,4,temp);
	ldw	x, (0x3b, sp)
	pushw	x
	push	#0x04
	push	#0x00
	call	_OLED_ShowString
	addw	sp, #4
00102$:
;	main.c: 102: ds1302_port_deinit();
	call	_ds1302_port_deinit
;	main.c: 107: if(count>=2)
	ld	a, _main_count_196608_389+0
	cp	a, #0x02
	jrnc	00134$
	jp	00104$
00134$:
;	main.c: 111: ReadDHT12(&data);
	ldw	y, sp
	addw	y, #21
	ldw	x, y
	pushw	y
	pushw	x
	call	_ReadDHT12
	addw	sp, #2
	popw	y
;	main.c: 112: sprintf(temp,"%2d.%1dC/%2d.%1d%%/%3d",data.T,data.T1,data.W,data.W1,data.sum);
	ldw	x, y
	ld	a, (0x4, x)
	ld	(0x21, sp), a
	clr	(0x20, sp)
	ldw	x, y
	ld	a, (0x3, x)
	ld	(0x1f, sp), a
	clr	(0x1e, sp)
	ldw	x, y
	ld	a, (0x2, x)
	ld	(0x1d, sp), a
	clr	(0x1c, sp)
	ldw	x, y
	ld	a, (0x1, x)
	ld	(0x38, sp), a
	clr	(0x37, sp)
	ld	a, (y)
	clr	(0x35, sp)
	ldw	x, sp
	incw	x
	ldw	(0x33, sp), x
	ldw	y, x
	ldw	x, (0x20, sp)
	pushw	x
	ldw	x, (0x20, sp)
	pushw	x
	ldw	x, (0x20, sp)
	pushw	x
	ldw	x, (0x3d, sp)
	pushw	x
	push	a
	ld	a, (0x3e, sp)
	push	a
	push	#<___str_9
	push	#(___str_9 >> 8)
	pushw	y
	call	_sprintf
	addw	sp, #14
;	main.c: 113: printf("%s",temp);
	ldw	x, (0x33, sp)
	pushw	x
	push	#<___str_4
	push	#(___str_4 >> 8)
	call	_printf
	addw	sp, #4
;	main.c: 114: printf("\r\n");
	push	#<___str_6
	push	#(___str_6 >> 8)
	call	_puts
	addw	sp, #2
;	main.c: 115: OLED_ShowString(0,6,temp);
	ldw	x, (0x33, sp)
	pushw	x
	push	#0x06
	push	#0x00
	call	_OLED_ShowString
	addw	sp, #4
;	main.c: 116: count=0;
	clr	_main_count_196608_389+0
00104$:
;	main.c: 119: count++;
	inc	_main_count_196608_389+0
;	main.c: 121: GPIO_WriteReverse(LED_GPIO_PORT, (GPIO_Pin_TypeDef)LED_GPIO_PINS);
	push	#0x20
	push	#0x14
	push	#0x50
	call	_GPIO_WriteReverse
	addw	sp, #3
;	main.c: 122: Delay(0xffff);
	push	#0xff
	push	#0xff
	call	_Delay
	addw	sp, #2
;	main.c: 125: }
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
