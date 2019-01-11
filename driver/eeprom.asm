;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module eeprom
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _FLASH_WaitForLastOperation
	.globl _FLASH_GetFlagStatus
	.globl _FLASH_ReadByte
	.globl _FLASH_ProgramByte
	.globl _FLASH_Lock
	.globl _FLASH_Unlock
	.globl _eeprom_read
	.globl _eeprom_write
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
;	driver/eeprom.c: 4: u8 eeprom_read(u32 num) {
;	-----------------------------------------
;	 function eeprom_read
;	-----------------------------------------
_eeprom_read:
;	driver/eeprom.c: 5: return FLASH_ReadByte(ADDR_OFFSET+num);
	ldw	y, (0x05, sp)
	addw	y, #0x4000
	ld	a, (0x04, sp)
	adc	a, #0x00
	ld	xl, a
	ld	a, (0x03, sp)
	adc	a, #0x00
	ld	xh, a
	pushw	y
	pushw	x
	call	_FLASH_ReadByte
	addw	sp, #4
;	driver/eeprom.c: 6: }
	ret
;	driver/eeprom.c: 8: u8 eeprom_write(u32 num,u8 data){
;	-----------------------------------------
;	 function eeprom_write
;	-----------------------------------------
_eeprom_write:
;	driver/eeprom.c: 10: FLASH_Unlock(FLASH_MEMTYPE_DATA);
	push	#0xf7
	call	_FLASH_Unlock
	pop	a
;	driver/eeprom.c: 11: while (FLASH_GetFlagStatus(FLASH_FLAG_DUL) == RESET); //等待解锁标志位置位
00101$:
	push	#0x08
	call	_FLASH_GetFlagStatus
	addw	sp, #1
	tnz	a
	jreq	00101$
;	driver/eeprom.c: 12: FLASH_ProgramByte(ADDR_OFFSET+num,data);
	ldw	y, (0x05, sp)
	addw	y, #0x4000
	ld	a, (0x04, sp)
	adc	a, #0x00
	ld	xl, a
	ld	a, (0x03, sp)
	adc	a, #0x00
	ld	xh, a
	ld	a, (0x07, sp)
	push	a
	pushw	y
	pushw	x
	call	_FLASH_ProgramByte
	addw	sp, #5
;	driver/eeprom.c: 13: FLASH_WaitForLastOperation(FLASH_MEMTYPE_DATA);
	push	#0xf7
	call	_FLASH_WaitForLastOperation
	pop	a
;	driver/eeprom.c: 14: FLASH_Lock(FLASH_MEMTYPE_DATA);
	push	#0xf7
	call	_FLASH_Lock
	pop	a
;	driver/eeprom.c: 16: return eeprom_read(num);
	ldw	x, (0x05, sp)
	pushw	x
	ldw	x, (0x05, sp)
	pushw	x
	call	_eeprom_read
	addw	sp, #4
;	driver/eeprom.c: 17: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
