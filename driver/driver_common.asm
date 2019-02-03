;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module driver_common
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _OLED_Clear
	.globl _OLED_Init
	.globl _beep_init
	.globl _Init_UART2
	.globl _key_init
	.globl _ds1302_read_time
	.globl _ds1302_active
	.globl _ReadDHT12
	.globl _ReadADC
	.globl _ReadDin
	.globl _adc_data
	.globl _dh_data
	.globl _ds_time
	.globl _driver_init
	.globl _driver_loop
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
_ds_time::
	.ds 7
_dh_data::
	.ds 5
_last_read_dh_time:
	.ds 1
_adc_data::
	.ds 3
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
;	driver/driver_common.c: 4: key_init();
	call	_key_init
;	driver/driver_common.c: 5: beep_init();
	call	_beep_init
;	driver/driver_common.c: 7: Init_UART2();
	call	_Init_UART2
;	driver/driver_common.c: 8: OLED_Init();
	call	_OLED_Init
;	driver/driver_common.c: 9: OLED_Clear();
	call	_OLED_Clear
;	driver/driver_common.c: 10: ds1302_active();
	call	_ds1302_active
;	driver/driver_common.c: 11: enableInterrupts(); 
	rim
;	driver/driver_common.c: 12: }
	ret
;	driver/driver_common.c: 21: void driver_loop()
;	-----------------------------------------
;	 function driver_loop
;	-----------------------------------------
_driver_loop:
	sub	sp, #6
;	driver/driver_common.c: 23: ds1302_read_time(&ds_time);
	push	#<_ds_time
	push	#(_ds_time >> 8)
	call	_ds1302_read_time
	addw	sp, #2
;	driver/driver_common.c: 26: if(ds_time.second/3 != last_read_dh_time/3)
	ldw	x, #_ds_time+6
	ldw	(0x03, sp), x
	ld	a, (x)
	clrw	x
	ld	xl, a
	push	#0x03
	push	#0x00
	pushw	x
	call	__divsint
	addw	sp, #4
	ldw	(0x01, sp), x
	clrw	x
	ld	a, _last_read_dh_time+0
	ld	xl, a
	push	#0x03
	push	#0x00
	pushw	x
	call	__divsint
	addw	sp, #4
	ldw	(0x05, sp), x
	ldw	x, (0x01, sp)
	cpw	x, (0x05, sp)
	jreq	00102$
;	driver/driver_common.c: 28: ReadDHT12(&dh_data);
	push	#<_dh_data
	push	#(_dh_data >> 8)
	call	_ReadDHT12
	addw	sp, #2
;	driver/driver_common.c: 29: last_read_dh_time=ds_time.second;
	ldw	x, (0x03, sp)
	ld	a, (x)
	ld	_last_read_dh_time+0, a
00102$:
;	driver/driver_common.c: 33: adc_data.Ain=ReadADC();
	call	_ReadADC
	ldw	y, #_adc_data
	ldw	(y), x
;	driver/driver_common.c: 34: adc_data.Din=ReadDin();
	ldw	x, #_adc_data+2
	pushw	x
	call	_ReadDin
	popw	x
	ld	(x), a
;	driver/driver_common.c: 35: }
	addw	sp, #6
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
