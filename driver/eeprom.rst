                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.8.0 #10562 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module eeprom
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _FLASH_WaitForLastOperation
                                     12 	.globl _FLASH_GetFlagStatus
                                     13 	.globl _FLASH_ReadByte
                                     14 	.globl _FLASH_ProgramByte
                                     15 	.globl _FLASH_Lock
                                     16 	.globl _FLASH_Unlock
                                     17 	.globl _eeprom_read
                                     18 	.globl _eeprom_write
                                     19 ;--------------------------------------------------------
                                     20 ; ram data
                                     21 ;--------------------------------------------------------
                                     22 	.area DATA
                                     23 ;--------------------------------------------------------
                                     24 ; ram data
                                     25 ;--------------------------------------------------------
                                     26 	.area INITIALIZED
                                     27 ;--------------------------------------------------------
                                     28 ; absolute external ram data
                                     29 ;--------------------------------------------------------
                                     30 	.area DABS (ABS)
                                     31 
                                     32 ; default segment ordering for linker
                                     33 	.area HOME
                                     34 	.area GSINIT
                                     35 	.area GSFINAL
                                     36 	.area CONST
                                     37 	.area INITIALIZER
                                     38 	.area CODE
                                     39 
                                     40 ;--------------------------------------------------------
                                     41 ; global & static initialisations
                                     42 ;--------------------------------------------------------
                                     43 	.area HOME
                                     44 	.area GSINIT
                                     45 	.area GSFINAL
                                     46 	.area GSINIT
                                     47 ;--------------------------------------------------------
                                     48 ; Home
                                     49 ;--------------------------------------------------------
                                     50 	.area HOME
                                     51 	.area HOME
                                     52 ;--------------------------------------------------------
                                     53 ; code
                                     54 ;--------------------------------------------------------
                                     55 	.area CODE
                                     56 ;	driver/eeprom.c: 4: u8 eeprom_read(u32 num) {
                                     57 ;	-----------------------------------------
                                     58 ;	 function eeprom_read
                                     59 ;	-----------------------------------------
      008F0E                         60 _eeprom_read:
                                     61 ;	driver/eeprom.c: 5: return FLASH_ReadByte(ADDR_OFFSET+num);
      008F0E 16 05            [ 2]   62 	ldw	y, (0x05, sp)
      008F10 72 A9 40 00      [ 2]   63 	addw	y, #0x4000
      008F14 7B 04            [ 1]   64 	ld	a, (0x04, sp)
      008F16 A9 00            [ 1]   65 	adc	a, #0x00
      008F18 97               [ 1]   66 	ld	xl, a
      008F19 7B 03            [ 1]   67 	ld	a, (0x03, sp)
      008F1B A9 00            [ 1]   68 	adc	a, #0x00
      008F1D 95               [ 1]   69 	ld	xh, a
      008F1E 90 89            [ 2]   70 	pushw	y
      008F20 89               [ 2]   71 	pushw	x
      008F21 CD A8 74         [ 4]   72 	call	_FLASH_ReadByte
      008F24 5B 04            [ 2]   73 	addw	sp, #4
                                     74 ;	driver/eeprom.c: 6: }
      008F26 81               [ 4]   75 	ret
                                     76 ;	driver/eeprom.c: 8: u8 eeprom_write(u32 num,u8 data){
                                     77 ;	-----------------------------------------
                                     78 ;	 function eeprom_write
                                     79 ;	-----------------------------------------
      008F27                         80 _eeprom_write:
                                     81 ;	driver/eeprom.c: 10: FLASH_Unlock(FLASH_MEMTYPE_DATA);
      008F27 4B F7            [ 1]   82 	push	#0xf7
      008F29 CD A8 11         [ 4]   83 	call	_FLASH_Unlock
      008F2C 84               [ 1]   84 	pop	a
                                     85 ;	driver/eeprom.c: 11: while (FLASH_GetFlagStatus(FLASH_FLAG_DUL) == RESET); //等待解锁标志位置位
      008F2D                         86 00101$:
      008F2D 4B 08            [ 1]   87 	push	#0x08
      008F2F CD A9 C2         [ 4]   88 	call	_FLASH_GetFlagStatus
      008F32 5B 01            [ 2]   89 	addw	sp, #1
      008F34 4D               [ 1]   90 	tnz	a
      008F35 27 F6            [ 1]   91 	jreq	00101$
                                     92 ;	driver/eeprom.c: 12: FLASH_ProgramByte(ADDR_OFFSET+num,data);
      008F37 16 05            [ 2]   93 	ldw	y, (0x05, sp)
      008F39 72 A9 40 00      [ 2]   94 	addw	y, #0x4000
      008F3D 7B 04            [ 1]   95 	ld	a, (0x04, sp)
      008F3F A9 00            [ 1]   96 	adc	a, #0x00
      008F41 97               [ 1]   97 	ld	xl, a
      008F42 7B 03            [ 1]   98 	ld	a, (0x03, sp)
      008F44 A9 00            [ 1]   99 	adc	a, #0x00
      008F46 95               [ 1]  100 	ld	xh, a
      008F47 7B 07            [ 1]  101 	ld	a, (0x07, sp)
      008F49 88               [ 1]  102 	push	a
      008F4A 90 89            [ 2]  103 	pushw	y
      008F4C 89               [ 2]  104 	pushw	x
      008F4D CD A8 68         [ 4]  105 	call	_FLASH_ProgramByte
      008F50 5B 05            [ 2]  106 	addw	sp, #5
                                    107 ;	driver/eeprom.c: 13: FLASH_WaitForLastOperation(FLASH_MEMTYPE_DATA);
      008F52 4B F7            [ 1]  108 	push	#0xf7
      008F54 CD A9 CE         [ 4]  109 	call	_FLASH_WaitForLastOperation
      008F57 84               [ 1]  110 	pop	a
                                    111 ;	driver/eeprom.c: 14: FLASH_Lock(FLASH_MEMTYPE_DATA);
      008F58 4B F7            [ 1]  112 	push	#0xf7
      008F5A CD A8 29         [ 4]  113 	call	_FLASH_Lock
      008F5D 84               [ 1]  114 	pop	a
                                    115 ;	driver/eeprom.c: 16: return eeprom_read(num);
      008F5E 1E 05            [ 2]  116 	ldw	x, (0x05, sp)
      008F60 89               [ 2]  117 	pushw	x
      008F61 1E 05            [ 2]  118 	ldw	x, (0x05, sp)
      008F63 89               [ 2]  119 	pushw	x
      008F64 CD 8F 0E         [ 4]  120 	call	_eeprom_read
      008F67 5B 04            [ 2]  121 	addw	sp, #4
                                    122 ;	driver/eeprom.c: 17: }
      008F69 81               [ 4]  123 	ret
                                    124 	.area CODE
                                    125 	.area CONST
                                    126 	.area INITIALIZER
                                    127 	.area CABS (ABS)
