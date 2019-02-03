;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module beep
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _GPIO_ReadInputPin
	.globl _GPIO_WriteLow
	.globl _GPIO_WriteHigh
	.globl _GPIO_Init
	.globl _beep_init
	.globl _beep_read
	.globl _beep_on
	.globl _beep_off
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
;	driver/beep.c: 2: void beep_init()
;	-----------------------------------------
;	 function beep_init
;	-----------------------------------------
_beep_init:
;	driver/beep.c: 4: GPIO_Init(GPIOD, GPIO_PIN_7, GPIO_MODE_OUT_OD_LOW_SLOW);
	push	#0x80
	push	#0x80
	push	#0x0f
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	driver/beep.c: 5: }
	ret
;	driver/beep.c: 7: BitStatus beep_read()
;	-----------------------------------------
;	 function beep_read
;	-----------------------------------------
_beep_read:
;	driver/beep.c: 9: return GPIO_ReadInputPin(GPIOD,GPIO_PIN_7);
	push	#0x80
	push	#0x0f
	push	#0x50
	call	_GPIO_ReadInputPin
	addw	sp, #3
;	driver/beep.c: 10: }
	ret
;	driver/beep.c: 11: void beep_on()
;	-----------------------------------------
;	 function beep_on
;	-----------------------------------------
_beep_on:
;	driver/beep.c: 13: GPIO_Init(GPIOD, GPIO_PIN_7, GPIO_MODE_OUT_PP_HIGH_SLOW);
	push	#0xd0
	push	#0x80
	push	#0x0f
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	driver/beep.c: 14: GPIO_WriteHigh(GPIOD,GPIO_PIN_7);
	push	#0x80
	push	#0x0f
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
;	driver/beep.c: 15: }
	ret
;	driver/beep.c: 16: void beep_off()
;	-----------------------------------------
;	 function beep_off
;	-----------------------------------------
_beep_off:
;	driver/beep.c: 18: GPIO_Init(GPIOD, GPIO_PIN_7, GPIO_MODE_OUT_PP_LOW_SLOW);
	push	#0xc0
	push	#0x80
	push	#0x0f
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	driver/beep.c: 19: GPIO_WriteLow(GPIOD,GPIO_PIN_7);
	push	#0x80
	push	#0x0f
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	driver/beep.c: 20: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
