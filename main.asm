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
	.globl _UART2_Send_STR
	.globl _UART2_Send_Char
	.globl _Init_UART2
	.globl _Delay
	.globl _puts
	.globl _sprintf
	.globl _printf
	.globl _ReadADC
	.globl _OLED_ShowString
	.globl _OLED_Clear
	.globl _OLED_Init
	.globl _UART2_GetFlagStatus
	.globl _UART2_SendData8
	.globl _UART2_ITConfig
	.globl _UART2_Cmd
	.globl _UART2_Init
	.globl _UART2_DeInit
	.globl _GPIO_WriteReverse
	.globl _GPIO_Init
	.globl _putchar
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
;	main.c: 43: void Delay(uint16_t nCount)
;	-----------------------------------------
;	 function Delay
;	-----------------------------------------
_Delay:
;	main.c: 46: while (nCount != 0)
	ldw	x, (0x03, sp)
00101$:
	tnzw	x
	jrne	00117$
	ret
00117$:
;	main.c: 48: nCount--;
	decw	x
	jra	00101$
;	main.c: 50: }
	ret
;	main.c: 51: void Init_UART2(void)
;	-----------------------------------------
;	 function Init_UART2
;	-----------------------------------------
_Init_UART2:
;	main.c: 53: UART2_DeInit();
	call	_UART2_DeInit
;	main.c: 54: UART2_Init((u32)115200, UART2_WORDLENGTH_8D, UART2_STOPBITS_1,
	push	#0x0c
	push	#0x80
	push	#0x00
	push	#0x00
	push	#0x00
	push	#0x00
	push	#0xc2
	push	#0x01
	push	#0x00
	call	_UART2_Init
	addw	sp, #9
;	main.c: 57: UART2_ITConfig(UART2_IT_RXNE_OR, ENABLE);
	push	#0x01
	push	#0x05
	push	#0x02
	call	_UART2_ITConfig
	addw	sp, #3
;	main.c: 59: UART2_Cmd(ENABLE);
	push	#0x01
	call	_UART2_Cmd
	pop	a
;	main.c: 60: }
	ret
;	main.c: 62: void UART2_Send_Char(uint8_t dat)
;	-----------------------------------------
;	 function UART2_Send_Char
;	-----------------------------------------
_UART2_Send_Char:
;	main.c: 64: while(( UART2_GetFlagStatus(UART2_FLAG_TXE)==RESET));
00101$:
	push	#0x80
	push	#0x00
	call	_UART2_GetFlagStatus
	addw	sp, #2
	tnz	a
	jreq	00101$
;	main.c: 66: UART2_SendData8(dat);
	ld	a, (0x03, sp)
	push	a
	call	_UART2_SendData8
	pop	a
;	main.c: 68: }
	ret
;	main.c: 70: void UART2_Send_STR(unsigned char * src)
;	-----------------------------------------
;	 function UART2_Send_STR
;	-----------------------------------------
_UART2_Send_STR:
;	main.c: 72: while(*src !='\0')
	ldw	x, (0x03, sp)
00101$:
	ld	a, (x)
	jrne	00117$
	ret
00117$:
;	main.c: 74: UART2_Send_Char(*src++);
	incw	x
	pushw	x
	push	a
	call	_UART2_Send_Char
	pop	a
	popw	x
	jra	00101$
;	main.c: 76: }
	ret
;	main.c: 77: int putchar(int dat) //support printf function
;	-----------------------------------------
;	 function putchar
;	-----------------------------------------
_putchar:
;	main.c: 79: while(( UART2_GetFlagStatus(UART2_FLAG_TXE)==RESET));
00101$:
	push	#0x80
	push	#0x00
	call	_UART2_GetFlagStatus
	addw	sp, #2
	tnz	a
	jreq	00101$
;	main.c: 81: UART2_SendData8((u8)dat);
	ld	a, (0x04, sp)
	push	a
	call	_UART2_SendData8
	pop	a
;	main.c: 82: return 0;
	clrw	x
;	main.c: 83: }
	ret
;	main.c: 86: void main(void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
	sub	sp, #12
;	main.c: 90: GPIO_Init(LED_GPIO_PORT, (GPIO_Pin_TypeDef)LED_GPIO_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
	push	#0xe0
	push	#0x20
	push	#0x14
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	main.c: 92: Init_UART2();
	call	_Init_UART2
;	main.c: 93: OLED_Init();
	call	_OLED_Init
;	main.c: 94: OLED_Clear();
	call	_OLED_Clear
;	main.c: 95: enableInterrupts(); //使能中断
	rim
;	main.c: 97: OLED_ShowString(0,0,"STM8 Started!");
	push	#<___str_0
	push	#(___str_0 >> 8)
	push	#0x00
	push	#0x00
	call	_OLED_ShowString
	addw	sp, #4
;	main.c: 98: printf("STM8 Started!\r\n");
	push	#<___str_2
	push	#(___str_2 >> 8)
	call	_puts
	addw	sp, #2
;	main.c: 100: while (1)
00102$:
;	main.c: 104: sprintf(temp,"%4d",ReadADC());
	call	_ReadADC
	ldw	y, sp
	incw	y
	ldw	(0x0b, sp), y
	pushw	x
	push	#<___str_3
	push	#(___str_3 >> 8)
	pushw	y
	call	_sprintf
	addw	sp, #6
;	main.c: 105: printf("%s",temp);
	ldw	x, (0x0b, sp)
	pushw	x
	push	#<___str_4
	push	#(___str_4 >> 8)
	call	_printf
	addw	sp, #4
;	main.c: 106: OLED_ShowString(0,2,temp);
	ldw	x, (0x0b, sp)
	pushw	x
	push	#0x02
	push	#0x00
	call	_OLED_ShowString
	addw	sp, #4
;	main.c: 107: GPIO_WriteReverse(LED_GPIO_PORT, (GPIO_Pin_TypeDef)LED_GPIO_PINS);
	push	#0x20
	push	#0x14
	push	#0x50
	call	_GPIO_WriteReverse
	addw	sp, #3
;	main.c: 108: Delay(0xffff);
	push	#0xff
	push	#0xff
	call	_Delay
	addw	sp, #2
	jra	00102$
;	main.c: 111: }
	addw	sp, #12
	ret
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
	.ascii "%4d"
	.db 0x00
___str_4:
	.ascii "%s"
	.db 0x00
	.area INITIALIZER
	.area CABS (ABS)
