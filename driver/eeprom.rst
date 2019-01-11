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
      009569                         60 _eeprom_read:
                                     61 ;	driver/eeprom.c: 5: return FLASH_ReadByte(ADDR_OFFSET+num);
      009569 16 05            [ 2]   62 	ldw	y, (0x05, sp)
      00956B 72 A9 40 00      [ 2]   63 	addw	y, #0x4000
      00956F 7B 04            [ 1]   64 	ld	a, (0x04, sp)
      009571 A9 00            [ 1]   65 	adc	a, #0x00
      009573 97               [ 1]   66 	ld	xl, a
      009574 7B 03            [ 1]   67 	ld	a, (0x03, sp)
      009576 A9 00            [ 1]   68 	adc	a, #0x00
      009578 95               [ 1]   69 	ld	xh, a
      009579 90 89            [ 2]   70 	pushw	y
      00957B 89               [ 2]   71 	pushw	x
      00957C CD 97 79         [ 4]   72 	call	_FLASH_ReadByte
      00957F 5B 04            [ 2]   73 	addw	sp, #4
                                     74 ;	driver/eeprom.c: 6: }
      009581 81               [ 4]   75 	ret
                                     76 ;	driver/eeprom.c: 8: u8 eeprom_write(u32 num,u8 data){
                                     77 ;	-----------------------------------------
                                     78 ;	 function eeprom_write
                                     79 ;	-----------------------------------------
      009582                         80 _eeprom_write:
                                     81 ;	driver/eeprom.c: 10: FLASH_Unlock(FLASH_MEMTYPE_DATA);
      009582 4B F7            [ 1]   82 	push	#0xf7
      009584 CD 97 16         [ 4]   83 	call	_FLASH_Unlock
      009587 84               [ 1]   84 	pop	a
                                     85 ;	driver/eeprom.c: 11: while (FLASH_GetFlagStatus(FLASH_FLAG_DUL) == RESET); //等待解锁标志位置位
      009588                         86 00101$:
      009588 4B 08            [ 1]   87 	push	#0x08
      00958A CD 98 C7         [ 4]   88 	call	_FLASH_GetFlagStatus
      00958D 5B 01            [ 2]   89 	addw	sp, #1
      00958F 4D               [ 1]   90 	tnz	a
      009590 27 F6            [ 1]   91 	jreq	00101$
                                     92 ;	driver/eeprom.c: 12: FLASH_ProgramByte(ADDR_OFFSET+num,data);
      009592 16 05            [ 2]   93 	ldw	y, (0x05, sp)
      009594 72 A9 40 00      [ 2]   94 	addw	y, #0x4000
      009598 7B 04            [ 1]   95 	ld	a, (0x04, sp)
      00959A A9 00            [ 1]   96 	adc	a, #0x00
      00959C 97               [ 1]   97 	ld	xl, a
      00959D 7B 03            [ 1]   98 	ld	a, (0x03, sp)
      00959F A9 00            [ 1]   99 	adc	a, #0x00
      0095A1 95               [ 1]  100 	ld	xh, a
      0095A2 7B 07            [ 1]  101 	ld	a, (0x07, sp)
      0095A4 88               [ 1]  102 	push	a
      0095A5 90 89            [ 2]  103 	pushw	y
      0095A7 89               [ 2]  104 	pushw	x
      0095A8 CD 97 6D         [ 4]  105 	call	_FLASH_ProgramByte
      0095AB 5B 05            [ 2]  106 	addw	sp, #5
                                    107 ;	driver/eeprom.c: 13: FLASH_WaitForLastOperation(FLASH_MEMTYPE_DATA);
      0095AD 4B F7            [ 1]  108 	push	#0xf7
      0095AF CD 98 D3         [ 4]  109 	call	_FLASH_WaitForLastOperation
      0095B2 84               [ 1]  110 	pop	a
                                    111 ;	driver/eeprom.c: 14: FLASH_Lock(FLASH_MEMTYPE_DATA);
      0095B3 4B F7            [ 1]  112 	push	#0xf7
      0095B5 CD 97 2E         [ 4]  113 	call	_FLASH_Lock
      0095B8 84               [ 1]  114 	pop	a
                                    115 ;	driver/eeprom.c: 16: return eeprom_read(num);
      0095B9 1E 05            [ 2]  116 	ldw	x, (0x05, sp)
      0095BB 89               [ 2]  117 	pushw	x
      0095BC 1E 05            [ 2]  118 	ldw	x, (0x05, sp)
      0095BE 89               [ 2]  119 	pushw	x
      0095BF CD 95 69         [ 4]  120 	call	_eeprom_read
      0095C2 5B 04            [ 2]  121 	addw	sp, #4
                                    122 ;	driver/eeprom.c: 17: }
      0095C4 81               [ 4]  123 	ret
                                    124 	.area CODE
                                    125 	.area CONST
                                    126 	.area INITIALIZER
                                    127 	.area CABS (ABS)
