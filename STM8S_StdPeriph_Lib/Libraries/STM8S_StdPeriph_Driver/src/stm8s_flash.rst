                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.8.0 #10562 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_flash
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _asm_val
                                     12 	.globl _asm_addr
                                     13 	.globl _write_byte_address
                                     14 	.globl _read_byte_address
                                     15 	.globl _FLASH_Unlock
                                     16 	.globl _FLASH_Lock
                                     17 	.globl _FLASH_DeInit
                                     18 	.globl _FLASH_ITConfig
                                     19 	.globl _FLASH_EraseByte
                                     20 	.globl _FLASH_ProgramByte
                                     21 	.globl _FLASH_ReadByte
                                     22 	.globl _FLASH_ProgramWord
                                     23 	.globl _FLASH_ProgramOptionByte
                                     24 	.globl _FLASH_EraseOptionByte
                                     25 	.globl _FLASH_ReadOptionByte
                                     26 	.globl _FLASH_SetLowPowerMode
                                     27 	.globl _FLASH_SetProgrammingTime
                                     28 	.globl _FLASH_GetLowPowerMode
                                     29 	.globl _FLASH_GetProgrammingTime
                                     30 	.globl _FLASH_GetBootSize
                                     31 	.globl _FLASH_GetFlagStatus
                                     32 	.globl _FLASH_WaitForLastOperation
                                     33 	.globl _FLASH_EraseBlock
                                     34 	.globl _FLASH_ProgramBlock
                                     35 ;--------------------------------------------------------
                                     36 ; ram data
                                     37 ;--------------------------------------------------------
                                     38 	.area DATA
      000002                         39 _asm_addr::
      000002                         40 	.ds 4
      000006                         41 _asm_val::
      000006                         42 	.ds 1
                                     43 ;--------------------------------------------------------
                                     44 ; ram data
                                     45 ;--------------------------------------------------------
                                     46 	.area INITIALIZED
                                     47 ;--------------------------------------------------------
                                     48 ; absolute external ram data
                                     49 ;--------------------------------------------------------
                                     50 	.area DABS (ABS)
                                     51 
                                     52 ; default segment ordering for linker
                                     53 	.area HOME
                                     54 	.area GSINIT
                                     55 	.area GSFINAL
                                     56 	.area CONST
                                     57 	.area INITIALIZER
                                     58 	.area CODE
                                     59 
                                     60 ;--------------------------------------------------------
                                     61 ; global & static initialisations
                                     62 ;--------------------------------------------------------
                                     63 	.area HOME
                                     64 	.area GSINIT
                                     65 	.area GSFINAL
                                     66 	.area GSINIT
                                     67 ;--------------------------------------------------------
                                     68 ; Home
                                     69 ;--------------------------------------------------------
                                     70 	.area HOME
                                     71 	.area HOME
                                     72 ;--------------------------------------------------------
                                     73 ; code
                                     74 ;--------------------------------------------------------
                                     75 	.area CODE
                                     76 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 107: void write_byte_address(uint16_t Address, uint8_t Data)
                                     77 ;	-----------------------------------------
                                     78 ;	 function write_byte_address
                                     79 ;	-----------------------------------------
      0096E9                         80 _write_byte_address:
                                     81 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 110: asm_addr = Address;
      0096E9 16 03            [ 2]   82 	ldw	y, (0x03, sp)
      0096EB 5F               [ 1]   83 	clrw	x
      0096EC 90 CF 00 04      [ 2]   84 	ldw	_asm_addr+2, y
      0096F0 CF 00 02         [ 2]   85 	ldw	_asm_addr+0, x
                                     86 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 111: asm_val  = Data;
      0096F3 7B 05            [ 1]   87 	ld	a, (0x05, sp)
      0096F5 C7 00 06         [ 1]   88 	ld	_asm_val+0, a
                                     89 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 117: __endasm;
      0096F8 C6 00 06         [ 1]   90 	ld	a,_asm_val
      0096FB 92 BD 00 03      [ 4]   91 	ldf	[_asm_addr+1].e,a
                                     92 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 119: }
      0096FF 81               [ 4]   93 	ret
                                     94 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 129: uint8_t read_byte_address(uint32_t Address)
                                     95 ;	-----------------------------------------
                                     96 ;	 function read_byte_address
                                     97 ;	-----------------------------------------
      009700                         98 _read_byte_address:
                                     99 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 132: asm_addr = Address;
      009700 1E 05            [ 2]  100 	ldw	x, (0x05, sp)
      009702 16 03            [ 2]  101 	ldw	y, (0x03, sp)
      009704 CF 00 04         [ 2]  102 	ldw	_asm_addr+2, x
      009707 90 CF 00 02      [ 2]  103 	ldw	_asm_addr+0, y
                                    104 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 138: __endasm;
      00970B 92 BC 00 03      [ 5]  105 	ldf	a,[_asm_addr+1].e
      00970F C7 00 06         [ 1]  106 	ld	_asm_val,a
                                    107 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 141: return(asm_val);
      009712 C6 00 06         [ 1]  108 	ld	a, _asm_val+0
                                    109 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 143: }
      009715 81               [ 4]  110 	ret
                                    111 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 163: void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
                                    112 ;	-----------------------------------------
                                    113 ;	 function FLASH_Unlock
                                    114 ;	-----------------------------------------
      009716                        115 _FLASH_Unlock:
                                    116 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 169: if(FLASH_MemType == FLASH_MEMTYPE_PROG)
      009716 7B 03            [ 1]  117 	ld	a, (0x03, sp)
      009718 A1 FD            [ 1]  118 	cp	a, #0xfd
      00971A 26 09            [ 1]  119 	jrne	00102$
                                    120 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 171: FLASH->PUKR = FLASH_RASS_KEY1;
      00971C 35 56 50 62      [ 1]  121 	mov	0x5062+0, #0x56
                                    122 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 172: FLASH->PUKR = FLASH_RASS_KEY2;
      009720 35 AE 50 62      [ 1]  123 	mov	0x5062+0, #0xae
      009724 81               [ 4]  124 	ret
      009725                        125 00102$:
                                    126 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 177: FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
      009725 35 AE 50 64      [ 1]  127 	mov	0x5064+0, #0xae
                                    128 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 178: FLASH->DUKR = FLASH_RASS_KEY1;
      009729 35 56 50 64      [ 1]  129 	mov	0x5064+0, #0x56
                                    130 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 180: }
      00972D 81               [ 4]  131 	ret
                                    132 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 188: void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
                                    133 ;	-----------------------------------------
                                    134 ;	 function FLASH_Lock
                                    135 ;	-----------------------------------------
      00972E                        136 _FLASH_Lock:
                                    137 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 194: FLASH->IAPSR &= (uint8_t)FLASH_MemType;
      00972E C6 50 5F         [ 1]  138 	ld	a, 0x505f
      009731 14 03            [ 1]  139 	and	a, (0x03, sp)
      009733 C7 50 5F         [ 1]  140 	ld	0x505f, a
                                    141 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 195: }
      009736 81               [ 4]  142 	ret
                                    143 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 202: void FLASH_DeInit(void)
                                    144 ;	-----------------------------------------
                                    145 ;	 function FLASH_DeInit
                                    146 ;	-----------------------------------------
      009737                        147 _FLASH_DeInit:
                                    148 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 204: FLASH->CR1 = FLASH_CR1_RESET_VALUE;
      009737 35 00 50 5A      [ 1]  149 	mov	0x505a+0, #0x00
                                    150 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 205: FLASH->CR2 = FLASH_CR2_RESET_VALUE;
      00973B 35 00 50 5B      [ 1]  151 	mov	0x505b+0, #0x00
                                    152 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 206: FLASH->NCR2 = FLASH_NCR2_RESET_VALUE;
      00973F 35 FF 50 5C      [ 1]  153 	mov	0x505c+0, #0xff
                                    154 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 207: FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_DUL);
      009743 72 17 50 5F      [ 1]  155 	bres	20575, #3
                                    156 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 208: FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_PUL);
      009747 72 13 50 5F      [ 1]  157 	bres	20575, #1
                                    158 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 209: (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
      00974B C6 50 5F         [ 1]  159 	ld	a, 0x505f
                                    160 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 210: }
      00974E 81               [ 4]  161 	ret
                                    162 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 218: void FLASH_ITConfig(FunctionalState NewState)
                                    163 ;	-----------------------------------------
                                    164 ;	 function FLASH_ITConfig
                                    165 ;	-----------------------------------------
      00974F                        166 _FLASH_ITConfig:
                                    167 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 225: FLASH->CR1 |= FLASH_CR1_IE; /* Enables the interrupt sources */
      00974F C6 50 5A         [ 1]  168 	ld	a, 0x505a
                                    169 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 223: if(NewState != DISABLE)
      009752 0D 03            [ 1]  170 	tnz	(0x03, sp)
      009754 27 06            [ 1]  171 	jreq	00102$
                                    172 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 225: FLASH->CR1 |= FLASH_CR1_IE; /* Enables the interrupt sources */
      009756 AA 02            [ 1]  173 	or	a, #0x02
      009758 C7 50 5A         [ 1]  174 	ld	0x505a, a
      00975B 81               [ 4]  175 	ret
      00975C                        176 00102$:
                                    177 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 229: FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE); /* Disables the interrupt sources */
      00975C A4 FD            [ 1]  178 	and	a, #0xfd
      00975E C7 50 5A         [ 1]  179 	ld	0x505a, a
                                    180 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 231: }
      009761 81               [ 4]  181 	ret
                                    182 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 240: void FLASH_EraseByte(uint32_t Address)
                                    183 ;	-----------------------------------------
                                    184 ;	 function FLASH_EraseByte
                                    185 ;	-----------------------------------------
      009762                        186 _FLASH_EraseByte:
                                    187 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 249: write_byte_address(Address, FLASH_CLEAR_BYTE);    // SDCC patch: required for far pointers
      009762 1E 05            [ 2]  188 	ldw	x, (0x05, sp)
      009764 4B 00            [ 1]  189 	push	#0x00
      009766 89               [ 2]  190 	pushw	x
      009767 CD 96 E9         [ 4]  191 	call	_write_byte_address
      00976A 5B 03            [ 2]  192 	addw	sp, #3
                                    193 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 252: }
      00976C 81               [ 4]  194 	ret
                                    195 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 262: void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
                                    196 ;	-----------------------------------------
                                    197 ;	 function FLASH_ProgramByte
                                    198 ;	-----------------------------------------
      00976D                        199 _FLASH_ProgramByte:
                                    200 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 271: write_byte_address(Address, Data);    // SDCC patch: required for far pointers
      00976D 1E 05            [ 2]  201 	ldw	x, (0x05, sp)
      00976F 7B 07            [ 1]  202 	ld	a, (0x07, sp)
      009771 88               [ 1]  203 	push	a
      009772 89               [ 2]  204 	pushw	x
      009773 CD 96 E9         [ 4]  205 	call	_write_byte_address
      009776 5B 03            [ 2]  206 	addw	sp, #3
                                    207 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 274: }
      009778 81               [ 4]  208 	ret
                                    209 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 283: uint8_t FLASH_ReadByte(uint32_t Address)
                                    210 ;	-----------------------------------------
                                    211 ;	 function FLASH_ReadByte
                                    212 ;	-----------------------------------------
      009779                        213 _FLASH_ReadByte:
                                    214 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 292: return(read_byte_address(Address));    // SDCC patch: required for far pointers
      009779 1E 05            [ 2]  215 	ldw	x, (0x05, sp)
      00977B 89               [ 2]  216 	pushw	x
      00977C 1E 05            [ 2]  217 	ldw	x, (0x05, sp)
      00977E 89               [ 2]  218 	pushw	x
      00977F CD 97 00         [ 4]  219 	call	_read_byte_address
      009782 5B 04            [ 2]  220 	addw	sp, #4
                                    221 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 294: }
      009784 81               [ 4]  222 	ret
                                    223 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 304: void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
                                    224 ;	-----------------------------------------
                                    225 ;	 function FLASH_ProgramWord
                                    226 ;	-----------------------------------------
      009785                        227 _FLASH_ProgramWord:
      009785 52 04            [ 2]  228 	sub	sp, #4
                                    229 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 310: FLASH->CR2 |= FLASH_CR2_WPRG;
      009787 72 1C 50 5B      [ 1]  230 	bset	20571, #6
                                    231 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 311: FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NWPRG);
      00978B 72 1D 50 5C      [ 1]  232 	bres	20572, #6
                                    233 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 323: write_byte_address(Address    , *((uint8_t*)(&Data)));    // SDCC patch: required for far pointers
      00978F 96               [ 1]  234 	ldw	x, sp
      009790 1C 00 0B         [ 2]  235 	addw	x, #11
      009793 1F 03            [ 2]  236 	ldw	(0x03, sp), x
      009795 F6               [ 1]  237 	ld	a, (x)
      009796 16 09            [ 2]  238 	ldw	y, (0x09, sp)
      009798 17 01            [ 2]  239 	ldw	(0x01, sp), y
      00979A 88               [ 1]  240 	push	a
      00979B 1E 02            [ 2]  241 	ldw	x, (0x02, sp)
      00979D 89               [ 2]  242 	pushw	x
      00979E CD 96 E9         [ 4]  243 	call	_write_byte_address
      0097A1 5B 03            [ 2]  244 	addw	sp, #3
                                    245 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 324: write_byte_address(Address + 1, *((uint8_t*)(&Data)+1));
      0097A3 1E 03            [ 2]  246 	ldw	x, (0x03, sp)
      0097A5 E6 01            [ 1]  247 	ld	a, (0x1, x)
      0097A7 1E 01            [ 2]  248 	ldw	x, (0x01, sp)
      0097A9 5C               [ 1]  249 	incw	x
      0097AA 88               [ 1]  250 	push	a
      0097AB 89               [ 2]  251 	pushw	x
      0097AC CD 96 E9         [ 4]  252 	call	_write_byte_address
      0097AF 5B 03            [ 2]  253 	addw	sp, #3
                                    254 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 325: write_byte_address(Address + 2, *((uint8_t*)(&Data)+2));
      0097B1 1E 03            [ 2]  255 	ldw	x, (0x03, sp)
      0097B3 E6 02            [ 1]  256 	ld	a, (0x2, x)
      0097B5 1E 01            [ 2]  257 	ldw	x, (0x01, sp)
      0097B7 5C               [ 1]  258 	incw	x
      0097B8 5C               [ 1]  259 	incw	x
      0097B9 88               [ 1]  260 	push	a
      0097BA 89               [ 2]  261 	pushw	x
      0097BB CD 96 E9         [ 4]  262 	call	_write_byte_address
      0097BE 5B 03            [ 2]  263 	addw	sp, #3
                                    264 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 326: write_byte_address(Address + 3, *((uint8_t*)(&Data)+3));
      0097C0 1E 03            [ 2]  265 	ldw	x, (0x03, sp)
      0097C2 E6 03            [ 1]  266 	ld	a, (0x3, x)
      0097C4 1E 01            [ 2]  267 	ldw	x, (0x01, sp)
      0097C6 1C 00 03         [ 2]  268 	addw	x, #0x0003
      0097C9 88               [ 1]  269 	push	a
      0097CA 89               [ 2]  270 	pushw	x
      0097CB CD 96 E9         [ 4]  271 	call	_write_byte_address
                                    272 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 328: }
      0097CE 5B 07            [ 2]  273 	addw	sp, #7
      0097D0 81               [ 4]  274 	ret
                                    275 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 336: void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
                                    276 ;	-----------------------------------------
                                    277 ;	 function FLASH_ProgramOptionByte
                                    278 ;	-----------------------------------------
      0097D1                        279 _FLASH_ProgramOptionByte:
                                    280 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 342: FLASH->CR2 |= FLASH_CR2_OPT;
      0097D1 72 1E 50 5B      [ 1]  281 	bset	20571, #7
                                    282 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 343: FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
      0097D5 C6 50 5C         [ 1]  283 	ld	a, 0x505c
      0097D8 A4 7F            [ 1]  284 	and	a, #0x7f
      0097DA C7 50 5C         [ 1]  285 	ld	0x505c, a
                                    286 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 349: *((NEAR uint8_t*)Address) = Data;
      0097DD 1E 03            [ 2]  287 	ldw	x, (0x03, sp)
                                    288 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 346: if(Address == 0x4800)
      0097DF 89               [ 2]  289 	pushw	x
      0097E0 1E 05            [ 2]  290 	ldw	x, (0x05, sp)
      0097E2 A3 48 00         [ 2]  291 	cpw	x, #0x4800
      0097E5 85               [ 2]  292 	popw	x
      0097E6 26 05            [ 1]  293 	jrne	00102$
                                    294 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 349: *((NEAR uint8_t*)Address) = Data;
      0097E8 7B 05            [ 1]  295 	ld	a, (0x05, sp)
      0097EA F7               [ 1]  296 	ld	(x), a
      0097EB 20 0A            [ 2]  297 	jra	00103$
      0097ED                        298 00102$:
                                    299 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 354: *((NEAR uint8_t*)Address) = Data;
      0097ED 7B 05            [ 1]  300 	ld	a, (0x05, sp)
      0097EF F7               [ 1]  301 	ld	(x), a
                                    302 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 355: *((NEAR uint8_t*)((uint16_t)(Address + 1))) = (uint8_t)(~Data);
      0097F0 1E 03            [ 2]  303 	ldw	x, (0x03, sp)
      0097F2 5C               [ 1]  304 	incw	x
      0097F3 7B 05            [ 1]  305 	ld	a, (0x05, sp)
      0097F5 43               [ 1]  306 	cpl	a
      0097F6 F7               [ 1]  307 	ld	(x), a
      0097F7                        308 00103$:
                                    309 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 357: FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
      0097F7 4B FD            [ 1]  310 	push	#0xfd
      0097F9 CD 98 D3         [ 4]  311 	call	_FLASH_WaitForLastOperation
      0097FC 84               [ 1]  312 	pop	a
                                    313 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 360: FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
      0097FD 72 1F 50 5B      [ 1]  314 	bres	20571, #7
                                    315 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 361: FLASH->NCR2 |= FLASH_NCR2_NOPT;
      009801 72 1E 50 5C      [ 1]  316 	bset	20572, #7
                                    317 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 362: }
      009805 81               [ 4]  318 	ret
                                    319 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 369: void FLASH_EraseOptionByte(uint16_t Address)
                                    320 ;	-----------------------------------------
                                    321 ;	 function FLASH_EraseOptionByte
                                    322 ;	-----------------------------------------
      009806                        323 _FLASH_EraseOptionByte:
                                    324 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 375: FLASH->CR2 |= FLASH_CR2_OPT;
      009806 72 1E 50 5B      [ 1]  325 	bset	20571, #7
                                    326 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 376: FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
      00980A C6 50 5C         [ 1]  327 	ld	a, 0x505c
      00980D A4 7F            [ 1]  328 	and	a, #0x7f
      00980F C7 50 5C         [ 1]  329 	ld	0x505c, a
                                    330 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 382: *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
      009812 16 03            [ 2]  331 	ldw	y, (0x03, sp)
                                    332 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 379: if(Address == 0x4800)
      009814 1E 03            [ 2]  333 	ldw	x, (0x03, sp)
      009816 A3 48 00         [ 2]  334 	cpw	x, #0x4800
      009819 26 04            [ 1]  335 	jrne	00102$
                                    336 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 382: *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
      00981B 90 7F            [ 1]  337 	clr	(y)
      00981D 20 08            [ 2]  338 	jra	00103$
      00981F                        339 00102$:
                                    340 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 387: *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
      00981F 90 7F            [ 1]  341 	clr	(y)
                                    342 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 388: *((NEAR uint8_t*)((uint16_t)(Address + (uint16_t)1 ))) = FLASH_SET_BYTE;
      009821 1E 03            [ 2]  343 	ldw	x, (0x03, sp)
      009823 5C               [ 1]  344 	incw	x
      009824 A6 FF            [ 1]  345 	ld	a, #0xff
      009826 F7               [ 1]  346 	ld	(x), a
      009827                        347 00103$:
                                    348 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 390: FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
      009827 4B FD            [ 1]  349 	push	#0xfd
      009829 CD 98 D3         [ 4]  350 	call	_FLASH_WaitForLastOperation
      00982C 84               [ 1]  351 	pop	a
                                    352 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 393: FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
      00982D 72 1F 50 5B      [ 1]  353 	bres	20571, #7
                                    354 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 394: FLASH->NCR2 |= FLASH_NCR2_NOPT;
      009831 72 1E 50 5C      [ 1]  355 	bset	20572, #7
                                    356 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 395: }
      009835 81               [ 4]  357 	ret
                                    358 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 402: uint16_t FLASH_ReadOptionByte(uint16_t Address)
                                    359 ;	-----------------------------------------
                                    360 ;	 function FLASH_ReadOptionByte
                                    361 ;	-----------------------------------------
      009836                        362 _FLASH_ReadOptionByte:
      009836 52 07            [ 2]  363 	sub	sp, #7
                                    364 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 410: value_optbyte = *((NEAR uint8_t*)Address); /* Read option byte */
      009838 1E 0A            [ 2]  365 	ldw	x, (0x0a, sp)
      00983A F6               [ 1]  366 	ld	a, (x)
      00983B 6B 02            [ 1]  367 	ld	(0x02, sp), a
                                    368 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 411: value_optbyte_complement = *(((NEAR uint8_t*)Address) + 1); /* Read option byte complement */
      00983D E6 01            [ 1]  369 	ld	a, (0x1, x)
      00983F 6B 01            [ 1]  370 	ld	(0x01, sp), a
                                    371 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 416: res_value =	 value_optbyte;
      009841 90 5F            [ 1]  372 	clrw	y
      009843 7B 02            [ 1]  373 	ld	a, (0x02, sp)
      009845 90 97            [ 1]  374 	ld	yl, a
                                    375 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 414: if(Address == 0x4800)	 
      009847 1E 0A            [ 2]  376 	ldw	x, (0x0a, sp)
      009849 A3 48 00         [ 2]  377 	cpw	x, #0x4800
      00984C 26 03            [ 1]  378 	jrne	00105$
                                    379 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 416: res_value =	 value_optbyte;
      00984E 93               [ 1]  380 	ldw	x, y
      00984F 20 1E            [ 2]  381 	jra	00106$
      009851                        382 00105$:
                                    383 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 420: if(value_optbyte == (uint8_t)(~value_optbyte_complement))
      009851 7B 01            [ 1]  384 	ld	a, (0x01, sp)
      009853 43               [ 1]  385 	cpl	a
      009854 6B 03            [ 1]  386 	ld	(0x03, sp), a
      009856 7B 02            [ 1]  387 	ld	a, (0x02, sp)
      009858 11 03            [ 1]  388 	cp	a, (0x03, sp)
      00985A 26 10            [ 1]  389 	jrne	00102$
                                    390 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 422: res_value = (uint16_t)((uint16_t)value_optbyte << 8);
      00985C 4F               [ 1]  391 	clr	a
      00985D 6B 07            [ 1]  392 	ld	(0x07, sp), a
                                    393 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 423: res_value = res_value | (uint16_t)value_optbyte_complement;
      00985F 7B 01            [ 1]  394 	ld	a, (0x01, sp)
      009861 0F 04            [ 1]  395 	clr	(0x04, sp)
      009863 1A 07            [ 1]  396 	or	a, (0x07, sp)
      009865 97               [ 1]  397 	ld	xl, a
      009866 90 9F            [ 1]  398 	ld	a, yl
      009868 1A 04            [ 1]  399 	or	a, (0x04, sp)
      00986A 95               [ 1]  400 	ld	xh, a
                                    401 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 427: res_value = FLASH_OPTIONBYTE_ERROR;
      00986B BC                     402 	.byte 0xbc
      00986C                        403 00102$:
      00986C AE 55 55         [ 2]  404 	ldw	x, #0x5555
      00986F                        405 00106$:
                                    406 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 430: return(res_value);
                                    407 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 431: }
      00986F 5B 07            [ 2]  408 	addw	sp, #7
      009871 81               [ 4]  409 	ret
                                    410 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 439: void FLASH_SetLowPowerMode(FLASH_LPMode_TypeDef FLASH_LPMode)
                                    411 ;	-----------------------------------------
                                    412 ;	 function FLASH_SetLowPowerMode
                                    413 ;	-----------------------------------------
      009872                        414 _FLASH_SetLowPowerMode:
                                    415 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 445: FLASH->CR1 &= (uint8_t)(~(FLASH_CR1_HALT | FLASH_CR1_AHALT)); 
      009872 C6 50 5A         [ 1]  416 	ld	a, 0x505a
      009875 A4 F3            [ 1]  417 	and	a, #0xf3
      009877 C7 50 5A         [ 1]  418 	ld	0x505a, a
                                    419 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 448: FLASH->CR1 |= (uint8_t)FLASH_LPMode; 
      00987A C6 50 5A         [ 1]  420 	ld	a, 0x505a
      00987D 1A 03            [ 1]  421 	or	a, (0x03, sp)
      00987F C7 50 5A         [ 1]  422 	ld	0x505a, a
                                    423 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 449: }
      009882 81               [ 4]  424 	ret
                                    425 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 457: void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
                                    426 ;	-----------------------------------------
                                    427 ;	 function FLASH_SetProgrammingTime
                                    428 ;	-----------------------------------------
      009883                        429 _FLASH_SetProgrammingTime:
                                    430 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 462: FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
      009883 C6 50 5A         [ 1]  431 	ld	a, 0x505a
      009886 A4 FE            [ 1]  432 	and	a, #0xfe
      009888 C7 50 5A         [ 1]  433 	ld	0x505a, a
                                    434 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 463: FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
      00988B C6 50 5A         [ 1]  435 	ld	a, 0x505a
      00988E 1A 03            [ 1]  436 	or	a, (0x03, sp)
      009890 C7 50 5A         [ 1]  437 	ld	0x505a, a
                                    438 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 464: }
      009893 81               [ 4]  439 	ret
                                    440 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 471: FLASH_LPMode_TypeDef FLASH_GetLowPowerMode(void)
                                    441 ;	-----------------------------------------
                                    442 ;	 function FLASH_GetLowPowerMode
                                    443 ;	-----------------------------------------
      009894                        444 _FLASH_GetLowPowerMode:
                                    445 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 473: return((FLASH_LPMode_TypeDef)(FLASH->CR1 & (uint8_t)(FLASH_CR1_HALT | FLASH_CR1_AHALT)));
      009894 C6 50 5A         [ 1]  446 	ld	a, 0x505a
      009897 A4 0C            [ 1]  447 	and	a, #0x0c
                                    448 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 474: }
      009899 81               [ 4]  449 	ret
                                    450 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 481: FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
                                    451 ;	-----------------------------------------
                                    452 ;	 function FLASH_GetProgrammingTime
                                    453 ;	-----------------------------------------
      00989A                        454 _FLASH_GetProgrammingTime:
                                    455 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 483: return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
      00989A C6 50 5A         [ 1]  456 	ld	a, 0x505a
      00989D A4 01            [ 1]  457 	and	a, #0x01
                                    458 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 484: }
      00989F 81               [ 4]  459 	ret
                                    460 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 491: uint32_t FLASH_GetBootSize(void)
                                    461 ;	-----------------------------------------
                                    462 ;	 function FLASH_GetBootSize
                                    463 ;	-----------------------------------------
      0098A0                        464 _FLASH_GetBootSize:
      0098A0 52 04            [ 2]  465 	sub	sp, #4
                                    466 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 496: temp = (uint32_t)((uint32_t)FLASH->FPR * (uint32_t)512);
      0098A2 C6 50 5D         [ 1]  467 	ld	a, 0x505d
      0098A5 5F               [ 1]  468 	clrw	x
      0098A6 0F 04            [ 1]  469 	clr	(0x04, sp)
      0098A8 08 04            [ 1]  470 	sll	(0x04, sp)
      0098AA 49               [ 1]  471 	rlc	a
      0098AB 59               [ 2]  472 	rlcw	x
      0098AC 90 95            [ 1]  473 	ld	yh, a
      0098AE 7B 04            [ 1]  474 	ld	a, (0x04, sp)
      0098B0 90 97            [ 1]  475 	ld	yl, a
                                    476 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 499: if(FLASH->FPR == 0xFF)
      0098B2 C6 50 5D         [ 1]  477 	ld	a, 0x505d
      0098B5 4C               [ 1]  478 	inc	a
      0098B6 26 0B            [ 1]  479 	jrne	00102$
                                    480 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 501: temp += 512;
      0098B8 72 A9 02 00      [ 2]  481 	addw	y, #0x0200
      0098BC 9F               [ 1]  482 	ld	a, xl
      0098BD A9 00            [ 1]  483 	adc	a, #0x00
      0098BF 02               [ 1]  484 	rlwa	x
      0098C0 A9 00            [ 1]  485 	adc	a, #0x00
      0098C2 95               [ 1]  486 	ld	xh, a
      0098C3                        487 00102$:
                                    488 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 505: return(temp);
      0098C3 51               [ 1]  489 	exgw	x, y
                                    490 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 506: }
      0098C4 5B 04            [ 2]  491 	addw	sp, #4
      0098C6 81               [ 4]  492 	ret
                                    493 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 516: FlagStatus FLASH_GetFlagStatus(FLASH_Flag_TypeDef FLASH_FLAG)
                                    494 ;	-----------------------------------------
                                    495 ;	 function FLASH_GetFlagStatus
                                    496 ;	-----------------------------------------
      0098C7                        497 _FLASH_GetFlagStatus:
                                    498 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 523: if((FLASH->IAPSR & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
      0098C7 C6 50 5F         [ 1]  499 	ld	a, 0x505f
      0098CA 14 03            [ 1]  500 	and	a, (0x03, sp)
      0098CC 27 03            [ 1]  501 	jreq	00102$
                                    502 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 525: status = SET; /* FLASH_FLAG is set */
      0098CE A6 01            [ 1]  503 	ld	a, #0x01
      0098D0 81               [ 4]  504 	ret
      0098D1                        505 00102$:
                                    506 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 529: status = RESET; /* FLASH_FLAG is reset*/
      0098D1 4F               [ 1]  507 	clr	a
                                    508 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 533: return status;
                                    509 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 534: }
      0098D2 81               [ 4]  510 	ret
                                    511 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 648: IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType)) 
                                    512 ;	-----------------------------------------
                                    513 ;	 function FLASH_WaitForLastOperation
                                    514 ;	-----------------------------------------
      0098D3                        515 _FLASH_WaitForLastOperation:
                                    516 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 650: uint8_t flagstatus = 0x00;
      0098D3 4F               [ 1]  517 	clr	a
                                    518 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 656: if(FLASH_MemType == FLASH_MEMTYPE_PROG)
      0098D4 88               [ 1]  519 	push	a
      0098D5 7B 04            [ 1]  520 	ld	a, (0x04, sp)
      0098D7 A1 FD            [ 1]  521 	cp	a, #0xfd
      0098D9 84               [ 1]  522 	pop	a
      0098DA 26 10            [ 1]  523 	jrne	00121$
                                    524 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 658: while((flagstatus == 0x00) && (timeout != 0x00))
      0098DC 5F               [ 1]  525 	clrw	x
      0098DD 5A               [ 2]  526 	decw	x
      0098DE                        527 00102$:
      0098DE 4D               [ 1]  528 	tnz	a
      0098DF 26 1B            [ 1]  529 	jrne	00111$
      0098E1 5D               [ 2]  530 	tnzw	x
      0098E2 27 18            [ 1]  531 	jreq	00111$
                                    532 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 660: flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_EOP |
      0098E4 C6 50 5F         [ 1]  533 	ld	a, 0x505f
      0098E7 A4 05            [ 1]  534 	and	a, #0x05
                                    535 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 662: timeout--;
      0098E9 5A               [ 2]  536 	decw	x
      0098EA 20 F2            [ 2]  537 	jra	00102$
                                    538 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 667: while((flagstatus == 0x00) && (timeout != 0x00))
      0098EC                        539 00121$:
      0098EC 5F               [ 1]  540 	clrw	x
      0098ED 5A               [ 2]  541 	decw	x
      0098EE                        542 00106$:
      0098EE 4D               [ 1]  543 	tnz	a
      0098EF 26 0B            [ 1]  544 	jrne	00124$
      0098F1 5D               [ 2]  545 	tnzw	x
      0098F2 27 08            [ 1]  546 	jreq	00124$
                                    547 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 669: flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_HVOFF |
      0098F4 C6 50 5F         [ 1]  548 	ld	a, 0x505f
      0098F7 A4 41            [ 1]  549 	and	a, #0x41
                                    550 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 671: timeout--;
      0098F9 5A               [ 2]  551 	decw	x
      0098FA 20 F2            [ 2]  552 	jra	00106$
                                    553 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 687: return((FLASH_Status_TypeDef)flagstatus);
                                    554 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 671: timeout--;
      0098FC                        555 00124$:
      0098FC                        556 00111$:
                                    557 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 682: if(timeout == 0x00 )
      0098FC 5D               [ 2]  558 	tnzw	x
      0098FD 27 01            [ 1]  559 	jreq	00164$
      0098FF 81               [ 4]  560 	ret
      009900                        561 00164$:
                                    562 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 684: flagstatus = FLASH_STATUS_TIMEOUT;
      009900 A6 02            [ 1]  563 	ld	a, #0x02
                                    564 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 687: return((FLASH_Status_TypeDef)flagstatus);
                                    565 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 688: }
      009902 81               [ 4]  566 	ret
                                    567 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 697: IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
                                    568 ;	-----------------------------------------
                                    569 ;	 function FLASH_EraseBlock
                                    570 ;	-----------------------------------------
      009903                        571 _FLASH_EraseBlock:
      009903 52 06            [ 2]  572 	sub	sp, #6
                                    573 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 710: if(FLASH_MemType == FLASH_MEMTYPE_PROG)
      009905 7B 0B            [ 1]  574 	ld	a, (0x0b, sp)
      009907 A1 FD            [ 1]  575 	cp	a, #0xfd
      009909 26 09            [ 1]  576 	jrne	00102$
                                    577 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 713: startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
      00990B AE 80 00         [ 2]  578 	ldw	x, #0x8000
      00990E 1F 05            [ 2]  579 	ldw	(0x05, sp), x
      009910 0F 03            [ 1]  580 	clr	(0x03, sp)
      009912 20 07            [ 2]  581 	jra	00103$
      009914                        582 00102$:
                                    583 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 718: startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
      009914 AE 40 00         [ 2]  584 	ldw	x, #0x4000
      009917 1F 05            [ 2]  585 	ldw	(0x05, sp), x
      009919 0F 03            [ 1]  586 	clr	(0x03, sp)
      00991B                        587 00103$:
                                    588 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 726: pwFlash = (PointerAttr uint32_t *)(MemoryAddressCast)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
      00991B 1E 09            [ 2]  589 	ldw	x, (0x09, sp)
      00991D 58               [ 2]  590 	sllw	x
      00991E 58               [ 2]  591 	sllw	x
      00991F 58               [ 2]  592 	sllw	x
      009920 58               [ 2]  593 	sllw	x
      009921 58               [ 2]  594 	sllw	x
      009922 58               [ 2]  595 	sllw	x
      009923 58               [ 2]  596 	sllw	x
      009924 1F 01            [ 2]  597 	ldw	(0x01, sp), x
      009926 72 FB 05         [ 2]  598 	addw	x, (0x05, sp)
                                    599 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 730: FLASH->CR2 |= FLASH_CR2_ERASE;
      009929 72 1A 50 5B      [ 1]  600 	bset	20571, #5
                                    601 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 731: FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NERASE);
      00992D 72 1B 50 5C      [ 1]  602 	bres	20572, #5
                                    603 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 735: *pwFlash = (uint32_t)0;
      009931 6F 03            [ 1]  604 	clr	(0x3, x)
      009933 6F 02            [ 1]  605 	clr	(0x2, x)
      009935 6F 01            [ 1]  606 	clr	(0x1, x)
      009937 7F               [ 1]  607 	clr	(x)
                                    608 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 743: }
      009938 5B 06            [ 2]  609 	addw	sp, #6
      00993A 81               [ 4]  610 	ret
                                    611 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 754: IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType, 
                                    612 ;	-----------------------------------------
                                    613 ;	 function FLASH_ProgramBlock
                                    614 ;	-----------------------------------------
      00993B                        615 _FLASH_ProgramBlock:
      00993B 52 0E            [ 2]  616 	sub	sp, #14
                                    617 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 763: if(FLASH_MemType == FLASH_MEMTYPE_PROG)
      00993D 7B 13            [ 1]  618 	ld	a, (0x13, sp)
      00993F A1 FD            [ 1]  619 	cp	a, #0xfd
      009941 26 09            [ 1]  620 	jrne	00102$
                                    621 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 766: startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
      009943 0F 08            [ 1]  622 	clr	(0x08, sp)
      009945 A6 80            [ 1]  623 	ld	a, #0x80
      009947 5F               [ 1]  624 	clrw	x
      009948 1F 05            [ 2]  625 	ldw	(0x05, sp), x
      00994A 20 07            [ 2]  626 	jra	00103$
      00994C                        627 00102$:
                                    628 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 771: startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
      00994C 0F 08            [ 1]  629 	clr	(0x08, sp)
      00994E A6 40            [ 1]  630 	ld	a, #0x40
      009950 5F               [ 1]  631 	clrw	x
      009951 1F 05            [ 2]  632 	ldw	(0x05, sp), x
      009953                        633 00103$:
                                    634 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 775: startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
      009953 16 11            [ 2]  635 	ldw	y, (0x11, sp)
      009955 5F               [ 1]  636 	clrw	x
      009956 88               [ 1]  637 	push	a
      009957 A6 07            [ 1]  638 	ld	a, #0x07
      009959                        639 00131$:
      009959 90 58            [ 2]  640 	sllw	y
      00995B 59               [ 2]  641 	rlcw	x
      00995C 4A               [ 1]  642 	dec	a
      00995D 26 FA            [ 1]  643 	jrne	00131$
      00995F 17 04            [ 2]  644 	ldw	(0x04, sp), y
      009961 84               [ 1]  645 	pop	a
      009962 90 95            [ 1]  646 	ld	yh, a
      009964 61               [ 1]  647 	exg	a, yl
      009965 7B 08            [ 1]  648 	ld	a, (0x08, sp)
      009967 61               [ 1]  649 	exg	a, yl
      009968 72 F9 03         [ 2]  650 	addw	y, (0x03, sp)
      00996B 9F               [ 1]  651 	ld	a, xl
      00996C 19 06            [ 1]  652 	adc	a, (0x06, sp)
      00996E 02               [ 1]  653 	rlwa	x
      00996F 19 05            [ 1]  654 	adc	a, (0x05, sp)
      009971 95               [ 1]  655 	ld	xh, a
      009972 17 0B            [ 2]  656 	ldw	(0x0b, sp), y
      009974 1F 09            [ 2]  657 	ldw	(0x09, sp), x
                                    658 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 781: FLASH->CR2 |= FLASH_CR2_PRG;
      009976 C6 50 5B         [ 1]  659 	ld	a, 0x505b
                                    660 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 778: if(FLASH_ProgMode == FLASH_PROGRAMMODE_STANDARD)
      009979 0D 14            [ 1]  661 	tnz	(0x14, sp)
      00997B 26 0B            [ 1]  662 	jrne	00105$
                                    663 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 781: FLASH->CR2 |= FLASH_CR2_PRG;
      00997D AA 01            [ 1]  664 	or	a, #0x01
      00997F C7 50 5B         [ 1]  665 	ld	0x505b, a
                                    666 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 782: FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NPRG);
      009982 72 11 50 5C      [ 1]  667 	bres	20572, #0
      009986 20 09            [ 2]  668 	jra	00114$
      009988                        669 00105$:
                                    670 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 787: FLASH->CR2 |= FLASH_CR2_FPRG;
      009988 AA 10            [ 1]  671 	or	a, #0x10
      00998A C7 50 5B         [ 1]  672 	ld	0x505b, a
                                    673 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 788: FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NFPRG);
      00998D 72 19 50 5C      [ 1]  674 	bres	20572, #4
                                    675 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 792: for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
      009991                        676 00114$:
      009991 5F               [ 1]  677 	clrw	x
      009992 1F 0D            [ 2]  678 	ldw	(0x0d, sp), x
      009994                        679 00108$:
                                    680 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 797: write_byte_address(startaddress + Count, ((uint8_t)(Buffer[Count])));    // SDCC patch: required for far pointers
      009994 1E 15            [ 2]  681 	ldw	x, (0x15, sp)
      009996 72 FB 0D         [ 2]  682 	addw	x, (0x0d, sp)
      009999 F6               [ 1]  683 	ld	a, (x)
      00999A 1E 0B            [ 2]  684 	ldw	x, (0x0b, sp)
      00999C 72 FB 0D         [ 2]  685 	addw	x, (0x0d, sp)
      00999F 88               [ 1]  686 	push	a
      0099A0 89               [ 2]  687 	pushw	x
      0099A1 CD 96 E9         [ 4]  688 	call	_write_byte_address
      0099A4 5B 03            [ 2]  689 	addw	sp, #3
                                    690 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 792: for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
      0099A6 1E 0D            [ 2]  691 	ldw	x, (0x0d, sp)
      0099A8 5C               [ 1]  692 	incw	x
      0099A9 1F 0D            [ 2]  693 	ldw	(0x0d, sp), x
      0099AB A3 00 80         [ 2]  694 	cpw	x, #0x0080
      0099AE 25 E4            [ 1]  695 	jrc	00108$
                                    696 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 800: }
      0099B0 5B 0E            [ 2]  697 	addw	sp, #14
      0099B2 81               [ 4]  698 	ret
                                    699 	.area CODE
                                    700 	.area CONST
                                    701 	.area INITIALIZER
                                    702 	.area CABS (ABS)
