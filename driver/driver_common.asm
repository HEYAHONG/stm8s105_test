;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module driver_common
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _Init_UART2
	.globl _OLED_Clear
	.globl _OLED_Init
	.globl _key_init
	.globl _ds1302_active
	.globl _driver_init
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
;	driver/driver_common.c: 2: void driver_init()
;	-----------------------------------------
;	 function driver_init
;	-----------------------------------------
_driver_init:
;	driver/driver_common.c: 6: Init_UART2();
	call	_Init_UART2
;	driver/driver_common.c: 7: OLED_Init();
	call	_OLED_Init
;	driver/driver_common.c: 8: ds1302_active();
	call	_ds1302_active
;	driver/driver_common.c: 9: key_init();
	call	_key_init
;	driver/driver_common.c: 10: OLED_Clear();
	call	_OLED_Clear
;	driver/driver_common.c: 11: enableInterrupts(); 
	rim
;	driver/driver_common.c: 12: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
