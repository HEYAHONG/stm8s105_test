;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module uart
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _putchar
	.globl _UART2_GetFlagStatus
	.globl _UART2_SendData8
	.globl _UART2_ITConfig
	.globl _UART2_Cmd
	.globl _UART2_Init
	.globl _UART2_DeInit
	.globl _ITC_SetSoftwarePriority
	.globl _GPIO_Init
	.globl _Init_UART2
	.globl _UART2_Send_Char
	.globl _UART2_Send_STR
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
;	driver/uart.c: 4: void Init_UART2(void)
;	-----------------------------------------
;	 function Init_UART2
;	-----------------------------------------
_Init_UART2:
;	driver/uart.c: 6: UART2_DeInit();
	call	_UART2_DeInit
;	driver/uart.c: 7: GPIO_Init(GPIOD, GPIO_PIN_5, GPIO_MODE_OUT_OD_LOW_FAST);
	push	#0xa0
	push	#0x20
	push	#0x0f
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	driver/uart.c: 8: GPIO_Init(GPIOD, GPIO_PIN_6, GPIO_MODE_IN_PU_NO_IT);
	push	#0x40
	push	#0x40
	push	#0x0f
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	driver/uart.c: 10: UART2_Init((u32)9600, UART2_WORDLENGTH_8D, UART2_STOPBITS_1,
	push	#0x0c
	push	#0x80
	push	#0x00
	push	#0x00
	push	#0x00
	push	#0x80
	push	#0x25
	clrw	x
	pushw	x
	call	_UART2_Init
	addw	sp, #9
;	driver/uart.c: 13: UART2_ITConfig(UART2_IT_RXNE, ENABLE);
	push	#0x01
	push	#0x55
	push	#0x02
	call	_UART2_ITConfig
	addw	sp, #3
;	driver/uart.c: 14: ITC_SetSoftwarePriority(ITC_IRQ_UART2_RX, ITC_PRIORITYLEVEL_3);
	push	#0x03
	push	#0x15
	call	_ITC_SetSoftwarePriority
	addw	sp, #2
;	driver/uart.c: 15: UART2_Cmd(ENABLE);
	push	#0x01
	call	_UART2_Cmd
	pop	a
;	driver/uart.c: 16: }
	ret
;	driver/uart.c: 18: void UART2_Send_Char(uint8_t dat)
;	-----------------------------------------
;	 function UART2_Send_Char
;	-----------------------------------------
_UART2_Send_Char:
;	driver/uart.c: 20: while(( UART2_GetFlagStatus(UART2_FLAG_TXE)==RESET));
00101$:
	push	#0x80
	push	#0x00
	call	_UART2_GetFlagStatus
	addw	sp, #2
	tnz	a
	jreq	00101$
;	driver/uart.c: 22: UART2_SendData8(dat);
	ld	a, (0x03, sp)
	push	a
	call	_UART2_SendData8
	pop	a
;	driver/uart.c: 24: }
	ret
;	driver/uart.c: 26: void UART2_Send_STR(unsigned char * src)
;	-----------------------------------------
;	 function UART2_Send_STR
;	-----------------------------------------
_UART2_Send_STR:
;	driver/uart.c: 28: while(*src !='\0')
	ldw	x, (0x03, sp)
00101$:
	ld	a, (x)
	jrne	00117$
	ret
00117$:
;	driver/uart.c: 30: UART2_Send_Char(*src++);
	incw	x
	pushw	x
	push	a
	call	_UART2_Send_Char
	pop	a
	popw	x
	jra	00101$
;	driver/uart.c: 32: }
	ret
;	driver/uart.c: 33: int putchar(int dat) //support printf function
;	-----------------------------------------
;	 function putchar
;	-----------------------------------------
_putchar:
;	driver/uart.c: 40: return 0;
	clrw	x
;	driver/uart.c: 41: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
