;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module stm8s_flash
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _asm_val
	.globl _asm_addr
	.globl _write_byte_address
	.globl _read_byte_address
	.globl _FLASH_Unlock
	.globl _FLASH_Lock
	.globl _FLASH_DeInit
	.globl _FLASH_ITConfig
	.globl _FLASH_EraseByte
	.globl _FLASH_ProgramByte
	.globl _FLASH_ReadByte
	.globl _FLASH_ProgramWord
	.globl _FLASH_ProgramOptionByte
	.globl _FLASH_EraseOptionByte
	.globl _FLASH_ReadOptionByte
	.globl _FLASH_SetLowPowerMode
	.globl _FLASH_SetProgrammingTime
	.globl _FLASH_GetLowPowerMode
	.globl _FLASH_GetProgrammingTime
	.globl _FLASH_GetBootSize
	.globl _FLASH_GetFlagStatus
	.globl _FLASH_WaitForLastOperation
	.globl _FLASH_EraseBlock
	.globl _FLASH_ProgramBlock
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
_asm_addr::
	.ds 4
_asm_val::
	.ds 1
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
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 107: void write_byte_address(uint16_t Address, uint8_t Data)
;	-----------------------------------------
;	 function write_byte_address
;	-----------------------------------------
_write_byte_address:
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 110: asm_addr = Address;
	ldw	y, (0x03, sp)
	clrw	x
	ldw	_asm_addr+2, y
	ldw	_asm_addr+0, x
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 111: asm_val  = Data;
	ld	a, (0x05, sp)
	ld	_asm_val+0, a
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 117: __endasm;
	ld	a,_asm_val
	ldf	[_asm_addr+1].e,a
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 119: }
	ret
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 129: uint8_t read_byte_address(uint32_t Address)
;	-----------------------------------------
;	 function read_byte_address
;	-----------------------------------------
_read_byte_address:
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 132: asm_addr = Address;
	ldw	x, (0x05, sp)
	ldw	y, (0x03, sp)
	ldw	_asm_addr+2, x
	ldw	_asm_addr+0, y
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 138: __endasm;
	ldf	a,[_asm_addr+1].e
	ld	_asm_val,a
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 141: return(asm_val);
	ld	a, _asm_val+0
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 143: }
	ret
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 163: void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
;	-----------------------------------------
;	 function FLASH_Unlock
;	-----------------------------------------
_FLASH_Unlock:
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 169: if(FLASH_MemType == FLASH_MEMTYPE_PROG)
	ld	a, (0x03, sp)
	cp	a, #0xfd
	jrne	00102$
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 171: FLASH->PUKR = FLASH_RASS_KEY1;
	mov	0x5062+0, #0x56
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 172: FLASH->PUKR = FLASH_RASS_KEY2;
	mov	0x5062+0, #0xae
	ret
00102$:
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 177: FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
	mov	0x5064+0, #0xae
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 178: FLASH->DUKR = FLASH_RASS_KEY1;
	mov	0x5064+0, #0x56
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 180: }
	ret
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 188: void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
;	-----------------------------------------
;	 function FLASH_Lock
;	-----------------------------------------
_FLASH_Lock:
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 194: FLASH->IAPSR &= (uint8_t)FLASH_MemType;
	ld	a, 0x505f
	and	a, (0x03, sp)
	ld	0x505f, a
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 195: }
	ret
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 202: void FLASH_DeInit(void)
;	-----------------------------------------
;	 function FLASH_DeInit
;	-----------------------------------------
_FLASH_DeInit:
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 204: FLASH->CR1 = FLASH_CR1_RESET_VALUE;
	mov	0x505a+0, #0x00
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 205: FLASH->CR2 = FLASH_CR2_RESET_VALUE;
	mov	0x505b+0, #0x00
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 206: FLASH->NCR2 = FLASH_NCR2_RESET_VALUE;
	mov	0x505c+0, #0xff
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 207: FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_DUL);
	bres	20575, #3
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 208: FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_PUL);
	bres	20575, #1
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 209: (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
	ld	a, 0x505f
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 210: }
	ret
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 218: void FLASH_ITConfig(FunctionalState NewState)
;	-----------------------------------------
;	 function FLASH_ITConfig
;	-----------------------------------------
_FLASH_ITConfig:
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 225: FLASH->CR1 |= FLASH_CR1_IE; /* Enables the interrupt sources */
	ld	a, 0x505a
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 223: if(NewState != DISABLE)
	tnz	(0x03, sp)
	jreq	00102$
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 225: FLASH->CR1 |= FLASH_CR1_IE; /* Enables the interrupt sources */
	or	a, #0x02
	ld	0x505a, a
	ret
00102$:
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 229: FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE); /* Disables the interrupt sources */
	and	a, #0xfd
	ld	0x505a, a
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 231: }
	ret
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 240: void FLASH_EraseByte(uint32_t Address)
;	-----------------------------------------
;	 function FLASH_EraseByte
;	-----------------------------------------
_FLASH_EraseByte:
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 249: write_byte_address(Address, FLASH_CLEAR_BYTE);    // SDCC patch: required for far pointers
	ldw	x, (0x05, sp)
	push	#0x00
	pushw	x
	call	_write_byte_address
	addw	sp, #3
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 252: }
	ret
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 262: void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
;	-----------------------------------------
;	 function FLASH_ProgramByte
;	-----------------------------------------
_FLASH_ProgramByte:
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 271: write_byte_address(Address, Data);    // SDCC patch: required for far pointers
	ldw	x, (0x05, sp)
	ld	a, (0x07, sp)
	push	a
	pushw	x
	call	_write_byte_address
	addw	sp, #3
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 274: }
	ret
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 283: uint8_t FLASH_ReadByte(uint32_t Address)
;	-----------------------------------------
;	 function FLASH_ReadByte
;	-----------------------------------------
_FLASH_ReadByte:
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 292: return(read_byte_address(Address));    // SDCC patch: required for far pointers
	ldw	x, (0x05, sp)
	pushw	x
	ldw	x, (0x05, sp)
	pushw	x
	call	_read_byte_address
	addw	sp, #4
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 294: }
	ret
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 304: void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
;	-----------------------------------------
;	 function FLASH_ProgramWord
;	-----------------------------------------
_FLASH_ProgramWord:
	sub	sp, #4
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 310: FLASH->CR2 |= FLASH_CR2_WPRG;
	bset	20571, #6
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 311: FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NWPRG);
	bres	20572, #6
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 323: write_byte_address(Address    , *((uint8_t*)(&Data)));    // SDCC patch: required for far pointers
	ldw	x, sp
	addw	x, #11
	ldw	(0x03, sp), x
	ld	a, (x)
	ldw	y, (0x09, sp)
	ldw	(0x01, sp), y
	push	a
	ldw	x, (0x02, sp)
	pushw	x
	call	_write_byte_address
	addw	sp, #3
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 324: write_byte_address(Address + 1, *((uint8_t*)(&Data)+1));
	ldw	x, (0x03, sp)
	ld	a, (0x1, x)
	ldw	x, (0x01, sp)
	incw	x
	push	a
	pushw	x
	call	_write_byte_address
	addw	sp, #3
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 325: write_byte_address(Address + 2, *((uint8_t*)(&Data)+2));
	ldw	x, (0x03, sp)
	ld	a, (0x2, x)
	ldw	x, (0x01, sp)
	incw	x
	incw	x
	push	a
	pushw	x
	call	_write_byte_address
	addw	sp, #3
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 326: write_byte_address(Address + 3, *((uint8_t*)(&Data)+3));
	ldw	x, (0x03, sp)
	ld	a, (0x3, x)
	ldw	x, (0x01, sp)
	addw	x, #0x0003
	push	a
	pushw	x
	call	_write_byte_address
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 328: }
	addw	sp, #7
	ret
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 336: void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
;	-----------------------------------------
;	 function FLASH_ProgramOptionByte
;	-----------------------------------------
_FLASH_ProgramOptionByte:
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 342: FLASH->CR2 |= FLASH_CR2_OPT;
	bset	20571, #7
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 343: FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
	ld	a, 0x505c
	and	a, #0x7f
	ld	0x505c, a
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 349: *((NEAR uint8_t*)Address) = Data;
	ldw	x, (0x03, sp)
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 346: if(Address == 0x4800)
	pushw	x
	ldw	x, (0x05, sp)
	cpw	x, #0x4800
	popw	x
	jrne	00102$
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 349: *((NEAR uint8_t*)Address) = Data;
	ld	a, (0x05, sp)
	ld	(x), a
	jra	00103$
00102$:
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 354: *((NEAR uint8_t*)Address) = Data;
	ld	a, (0x05, sp)
	ld	(x), a
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 355: *((NEAR uint8_t*)((uint16_t)(Address + 1))) = (uint8_t)(~Data);
	ldw	x, (0x03, sp)
	incw	x
	ld	a, (0x05, sp)
	cpl	a
	ld	(x), a
00103$:
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 357: FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
	push	#0xfd
	call	_FLASH_WaitForLastOperation
	pop	a
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 360: FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
	bres	20571, #7
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 361: FLASH->NCR2 |= FLASH_NCR2_NOPT;
	bset	20572, #7
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 362: }
	ret
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 369: void FLASH_EraseOptionByte(uint16_t Address)
;	-----------------------------------------
;	 function FLASH_EraseOptionByte
;	-----------------------------------------
_FLASH_EraseOptionByte:
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 375: FLASH->CR2 |= FLASH_CR2_OPT;
	bset	20571, #7
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 376: FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
	ld	a, 0x505c
	and	a, #0x7f
	ld	0x505c, a
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 382: *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
	ldw	y, (0x03, sp)
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 379: if(Address == 0x4800)
	ldw	x, (0x03, sp)
	cpw	x, #0x4800
	jrne	00102$
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 382: *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
	clr	(y)
	jra	00103$
00102$:
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 387: *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
	clr	(y)
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 388: *((NEAR uint8_t*)((uint16_t)(Address + (uint16_t)1 ))) = FLASH_SET_BYTE;
	ldw	x, (0x03, sp)
	incw	x
	ld	a, #0xff
	ld	(x), a
00103$:
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 390: FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
	push	#0xfd
	call	_FLASH_WaitForLastOperation
	pop	a
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 393: FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
	bres	20571, #7
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 394: FLASH->NCR2 |= FLASH_NCR2_NOPT;
	bset	20572, #7
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 395: }
	ret
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 402: uint16_t FLASH_ReadOptionByte(uint16_t Address)
;	-----------------------------------------
;	 function FLASH_ReadOptionByte
;	-----------------------------------------
_FLASH_ReadOptionByte:
	sub	sp, #7
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 410: value_optbyte = *((NEAR uint8_t*)Address); /* Read option byte */
	ldw	x, (0x0a, sp)
	ld	a, (x)
	ld	(0x02, sp), a
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 411: value_optbyte_complement = *(((NEAR uint8_t*)Address) + 1); /* Read option byte complement */
	ld	a, (0x1, x)
	ld	(0x01, sp), a
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 416: res_value =	 value_optbyte;
	clrw	y
	ld	a, (0x02, sp)
	ld	yl, a
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 414: if(Address == 0x4800)	 
	ldw	x, (0x0a, sp)
	cpw	x, #0x4800
	jrne	00105$
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 416: res_value =	 value_optbyte;
	ldw	x, y
	jra	00106$
00105$:
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 420: if(value_optbyte == (uint8_t)(~value_optbyte_complement))
	ld	a, (0x01, sp)
	cpl	a
	ld	(0x03, sp), a
	ld	a, (0x02, sp)
	cp	a, (0x03, sp)
	jrne	00102$
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 422: res_value = (uint16_t)((uint16_t)value_optbyte << 8);
	clr	a
	ld	(0x07, sp), a
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 423: res_value = res_value | (uint16_t)value_optbyte_complement;
	ld	a, (0x01, sp)
	clr	(0x04, sp)
	or	a, (0x07, sp)
	ld	xl, a
	ld	a, yl
	or	a, (0x04, sp)
	ld	xh, a
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 427: res_value = FLASH_OPTIONBYTE_ERROR;
	.byte 0xbc
00102$:
	ldw	x, #0x5555
00106$:
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 430: return(res_value);
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 431: }
	addw	sp, #7
	ret
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 439: void FLASH_SetLowPowerMode(FLASH_LPMode_TypeDef FLASH_LPMode)
;	-----------------------------------------
;	 function FLASH_SetLowPowerMode
;	-----------------------------------------
_FLASH_SetLowPowerMode:
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 445: FLASH->CR1 &= (uint8_t)(~(FLASH_CR1_HALT | FLASH_CR1_AHALT)); 
	ld	a, 0x505a
	and	a, #0xf3
	ld	0x505a, a
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 448: FLASH->CR1 |= (uint8_t)FLASH_LPMode; 
	ld	a, 0x505a
	or	a, (0x03, sp)
	ld	0x505a, a
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 449: }
	ret
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 457: void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
;	-----------------------------------------
;	 function FLASH_SetProgrammingTime
;	-----------------------------------------
_FLASH_SetProgrammingTime:
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 462: FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
	ld	a, 0x505a
	and	a, #0xfe
	ld	0x505a, a
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 463: FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
	ld	a, 0x505a
	or	a, (0x03, sp)
	ld	0x505a, a
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 464: }
	ret
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 471: FLASH_LPMode_TypeDef FLASH_GetLowPowerMode(void)
;	-----------------------------------------
;	 function FLASH_GetLowPowerMode
;	-----------------------------------------
_FLASH_GetLowPowerMode:
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 473: return((FLASH_LPMode_TypeDef)(FLASH->CR1 & (uint8_t)(FLASH_CR1_HALT | FLASH_CR1_AHALT)));
	ld	a, 0x505a
	and	a, #0x0c
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 474: }
	ret
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 481: FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
;	-----------------------------------------
;	 function FLASH_GetProgrammingTime
;	-----------------------------------------
_FLASH_GetProgrammingTime:
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 483: return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
	ld	a, 0x505a
	and	a, #0x01
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 484: }
	ret
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 491: uint32_t FLASH_GetBootSize(void)
;	-----------------------------------------
;	 function FLASH_GetBootSize
;	-----------------------------------------
_FLASH_GetBootSize:
	sub	sp, #4
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 496: temp = (uint32_t)((uint32_t)FLASH->FPR * (uint32_t)512);
	ld	a, 0x505d
	clrw	x
	clr	(0x04, sp)
	sll	(0x04, sp)
	rlc	a
	rlcw	x
	ld	yh, a
	ld	a, (0x04, sp)
	ld	yl, a
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 499: if(FLASH->FPR == 0xFF)
	ld	a, 0x505d
	inc	a
	jrne	00102$
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 501: temp += 512;
	addw	y, #0x0200
	ld	a, xl
	adc	a, #0x00
	rlwa	x
	adc	a, #0x00
	ld	xh, a
00102$:
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 505: return(temp);
	exgw	x, y
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 506: }
	addw	sp, #4
	ret
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 516: FlagStatus FLASH_GetFlagStatus(FLASH_Flag_TypeDef FLASH_FLAG)
;	-----------------------------------------
;	 function FLASH_GetFlagStatus
;	-----------------------------------------
_FLASH_GetFlagStatus:
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 523: if((FLASH->IAPSR & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
	ld	a, 0x505f
	and	a, (0x03, sp)
	jreq	00102$
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 525: status = SET; /* FLASH_FLAG is set */
	ld	a, #0x01
	ret
00102$:
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 529: status = RESET; /* FLASH_FLAG is reset*/
	clr	a
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 533: return status;
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 534: }
	ret
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 648: IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType)) 
;	-----------------------------------------
;	 function FLASH_WaitForLastOperation
;	-----------------------------------------
_FLASH_WaitForLastOperation:
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 650: uint8_t flagstatus = 0x00;
	clr	a
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 656: if(FLASH_MemType == FLASH_MEMTYPE_PROG)
	push	a
	ld	a, (0x04, sp)
	cp	a, #0xfd
	pop	a
	jrne	00121$
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 658: while((flagstatus == 0x00) && (timeout != 0x00))
	clrw	x
	decw	x
00102$:
	tnz	a
	jrne	00111$
	tnzw	x
	jreq	00111$
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 660: flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_EOP |
	ld	a, 0x505f
	and	a, #0x05
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 662: timeout--;
	decw	x
	jra	00102$
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 667: while((flagstatus == 0x00) && (timeout != 0x00))
00121$:
	clrw	x
	decw	x
00106$:
	tnz	a
	jrne	00124$
	tnzw	x
	jreq	00124$
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 669: flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_HVOFF |
	ld	a, 0x505f
	and	a, #0x41
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 671: timeout--;
	decw	x
	jra	00106$
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 687: return((FLASH_Status_TypeDef)flagstatus);
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 671: timeout--;
00124$:
00111$:
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 682: if(timeout == 0x00 )
	tnzw	x
	jreq	00164$
	ret
00164$:
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 684: flagstatus = FLASH_STATUS_TIMEOUT;
	ld	a, #0x02
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 687: return((FLASH_Status_TypeDef)flagstatus);
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 688: }
	ret
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 697: IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
;	-----------------------------------------
;	 function FLASH_EraseBlock
;	-----------------------------------------
_FLASH_EraseBlock:
	sub	sp, #6
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 710: if(FLASH_MemType == FLASH_MEMTYPE_PROG)
	ld	a, (0x0b, sp)
	cp	a, #0xfd
	jrne	00102$
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 713: startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
	ldw	x, #0x8000
	ldw	(0x05, sp), x
	clr	(0x03, sp)
	jra	00103$
00102$:
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 718: startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
	ldw	x, #0x4000
	ldw	(0x05, sp), x
	clr	(0x03, sp)
00103$:
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 726: pwFlash = (PointerAttr uint32_t *)(MemoryAddressCast)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
	ldw	x, (0x09, sp)
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	ldw	(0x01, sp), x
	addw	x, (0x05, sp)
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 730: FLASH->CR2 |= FLASH_CR2_ERASE;
	bset	20571, #5
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 731: FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NERASE);
	bres	20572, #5
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 735: *pwFlash = (uint32_t)0;
	clr	(0x3, x)
	clr	(0x2, x)
	clr	(0x1, x)
	clr	(x)
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 743: }
	addw	sp, #6
	ret
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 754: IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType, 
;	-----------------------------------------
;	 function FLASH_ProgramBlock
;	-----------------------------------------
_FLASH_ProgramBlock:
	sub	sp, #14
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 763: if(FLASH_MemType == FLASH_MEMTYPE_PROG)
	ld	a, (0x13, sp)
	cp	a, #0xfd
	jrne	00102$
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 766: startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
	clr	(0x08, sp)
	ld	a, #0x80
	clrw	x
	ldw	(0x05, sp), x
	jra	00103$
00102$:
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 771: startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
	clr	(0x08, sp)
	ld	a, #0x40
	clrw	x
	ldw	(0x05, sp), x
00103$:
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 775: startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
	ldw	y, (0x11, sp)
	clrw	x
	push	a
	ld	a, #0x07
00131$:
	sllw	y
	rlcw	x
	dec	a
	jrne	00131$
	ldw	(0x04, sp), y
	pop	a
	ld	yh, a
	exg	a, yl
	ld	a, (0x08, sp)
	exg	a, yl
	addw	y, (0x03, sp)
	ld	a, xl
	adc	a, (0x06, sp)
	rlwa	x
	adc	a, (0x05, sp)
	ld	xh, a
	ldw	(0x0b, sp), y
	ldw	(0x09, sp), x
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 781: FLASH->CR2 |= FLASH_CR2_PRG;
	ld	a, 0x505b
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 778: if(FLASH_ProgMode == FLASH_PROGRAMMODE_STANDARD)
	tnz	(0x14, sp)
	jrne	00105$
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 781: FLASH->CR2 |= FLASH_CR2_PRG;
	or	a, #0x01
	ld	0x505b, a
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 782: FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NPRG);
	bres	20572, #0
	jra	00114$
00105$:
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 787: FLASH->CR2 |= FLASH_CR2_FPRG;
	or	a, #0x10
	ld	0x505b, a
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 788: FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NFPRG);
	bres	20572, #4
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 792: for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
00114$:
	clrw	x
	ldw	(0x0d, sp), x
00108$:
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 797: write_byte_address(startaddress + Count, ((uint8_t)(Buffer[Count])));    // SDCC patch: required for far pointers
	ldw	x, (0x15, sp)
	addw	x, (0x0d, sp)
	ld	a, (x)
	ldw	x, (0x0b, sp)
	addw	x, (0x0d, sp)
	push	a
	pushw	x
	call	_write_byte_address
	addw	sp, #3
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 792: for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
	ldw	x, (0x0d, sp)
	incw	x
	ldw	(0x0d, sp), x
	cpw	x, #0x0080
	jrc	00108$
;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 800: }
	addw	sp, #14
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
