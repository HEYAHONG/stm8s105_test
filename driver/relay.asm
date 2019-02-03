;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module relay
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _GPIO_ReadInputPin
	.globl _GPIO_WriteLow
	.globl _GPIO_WriteHigh
	.globl _GPIO_Init
	.globl _relay_read
	.globl _relay_on
	.globl _relay_off
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
;	driver/relay.c: 2: BitStatus  relay_read()
;	-----------------------------------------
;	 function relay_read
;	-----------------------------------------
_relay_read:
;	driver/relay.c: 4: return GPIO_ReadInputPin(GPIOE,GPIO_PIN_5);
	push	#0x20
	push	#0x14
	push	#0x50
	call	_GPIO_ReadInputPin
	addw	sp, #3
;	driver/relay.c: 5: }
	ret
;	driver/relay.c: 6: void relay_on()
;	-----------------------------------------
;	 function relay_on
;	-----------------------------------------
_relay_on:
;	driver/relay.c: 8: GPIO_Init(GPIOE,GPIO_PIN_5, GPIO_MODE_OUT_PP_HIGH_SLOW);
	push	#0xd0
	push	#0x20
	push	#0x14
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	driver/relay.c: 9: GPIO_WriteHigh(GPIOE,GPIO_PIN_5);
	push	#0x20
	push	#0x14
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
;	driver/relay.c: 10: }
	ret
;	driver/relay.c: 11: void relay_off()
;	-----------------------------------------
;	 function relay_off
;	-----------------------------------------
_relay_off:
;	driver/relay.c: 13: GPIO_Init(GPIOE,GPIO_PIN_5, GPIO_MODE_OUT_PP_LOW_SLOW);
	push	#0xc0
	push	#0x20
	push	#0x14
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	driver/relay.c: 14: GPIO_WriteLow(GPIOE,GPIO_PIN_5);
	push	#0x20
	push	#0x14
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	driver/relay.c: 15: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
