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
      0096DA                         80 _write_byte_address:
                                     81 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 110: asm_addr = Address;
      0096DA 16 03            [ 2]   82 	ldw	y, (0x03, sp)
      0096DC 5F               [ 1]   83 	clrw	x
      0096DD 90 CF 00 04      [ 2]   84 	ldw	_asm_addr+2, y
      0096E1 CF 00 02         [ 2]   85 	ldw	_asm_addr+0, x
                                     86 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 111: asm_val  = Data;
      0096E4 7B 05            [ 1]   87 	ld	a, (0x05, sp)
      0096E6 C7 00 06         [ 1]   88 	ld	_asm_val+0, a
                                     89 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 117: __endasm;
      0096E9 C6 00 06         [ 1]   90 	ld	a,_asm_val
      0096EC 92 BD 00 03      [ 4]   91 	ldf	[_asm_addr+1].e,a
                                     92 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 119: }
      0096F0 81               [ 4]   93 	ret
                                     94 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 129: uint8_t read_byte_address(uint32_t Address)
                                     95 ;	-----------------------------------------
                                     96 ;	 function read_byte_address
                                     97 ;	-----------------------------------------
      0096F1                         98 _read_byte_address:
                                     99 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 132: asm_addr = Address;
      0096F1 1E 05            [ 2]  100 	ldw	x, (0x05, sp)
      0096F3 16 03            [ 2]  101 	ldw	y, (0x03, sp)
      0096F5 CF 00 04         [ 2]  102 	ldw	_asm_addr+2, x
      0096F8 90 CF 00 02      [ 2]  103 	ldw	_asm_addr+0, y
                                    104 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 138: __endasm;
      0096FC 92 BC 00 03      [ 5]  105 	ldf	a,[_asm_addr+1].e
      009700 C7 00 06         [ 1]  106 	ld	_asm_val,a
                                    107 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 141: return(asm_val);
      009703 C6 00 06         [ 1]  108 	ld	a, _asm_val+0
                                    109 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 143: }
      009706 81               [ 4]  110 	ret
                                    111 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 163: void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
                                    112 ;	-----------------------------------------
                                    113 ;	 function FLASH_Unlock
                                    114 ;	-----------------------------------------
      009707                        115 _FLASH_Unlock:
                                    116 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 169: if(FLASH_MemType == FLASH_MEMTYPE_PROG)
      009707 7B 03            [ 1]  117 	ld	a, (0x03, sp)
      009709 A1 FD            [ 1]  118 	cp	a, #0xfd
      00970B 26 09            [ 1]  119 	jrne	00102$
                                    120 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 171: FLASH->PUKR = FLASH_RASS_KEY1;
      00970D 35 56 50 62      [ 1]  121 	mov	0x5062+0, #0x56
                                    122 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 172: FLASH->PUKR = FLASH_RASS_KEY2;
      009711 35 AE 50 62      [ 1]  123 	mov	0x5062+0, #0xae
      009715 81               [ 4]  124 	ret
      009716                        125 00102$:
                                    126 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 177: FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
      009716 35 AE 50 64      [ 1]  127 	mov	0x5064+0, #0xae
                                    128 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 178: FLASH->DUKR = FLASH_RASS_KEY1;
      00971A 35 56 50 64      [ 1]  129 	mov	0x5064+0, #0x56
                                    130 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 180: }
      00971E 81               [ 4]  131 	ret
                                    132 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 188: void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
                                    133 ;	-----------------------------------------
                                    134 ;	 function FLASH_Lock
                                    135 ;	-----------------------------------------
      00971F                        136 _FLASH_Lock:
                                    137 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 194: FLASH->IAPSR &= (uint8_t)FLASH_MemType;
      00971F C6 50 5F         [ 1]  138 	ld	a, 0x505f
      009722 14 03            [ 1]  139 	and	a, (0x03, sp)
      009724 C7 50 5F         [ 1]  140 	ld	0x505f, a
                                    141 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 195: }
      009727 81               [ 4]  142 	ret
                                    143 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 202: void FLASH_DeInit(void)
                                    144 ;	-----------------------------------------
                                    145 ;	 function FLASH_DeInit
                                    146 ;	-----------------------------------------
      009728                        147 _FLASH_DeInit:
                                    148 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 204: FLASH->CR1 = FLASH_CR1_RESET_VALUE;
      009728 35 00 50 5A      [ 1]  149 	mov	0x505a+0, #0x00
                                    150 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 205: FLASH->CR2 = FLASH_CR2_RESET_VALUE;
      00972C 35 00 50 5B      [ 1]  151 	mov	0x505b+0, #0x00
                                    152 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 206: FLASH->NCR2 = FLASH_NCR2_RESET_VALUE;
      009730 35 FF 50 5C      [ 1]  153 	mov	0x505c+0, #0xff
                                    154 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 207: FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_DUL);
      009734 72 17 50 5F      [ 1]  155 	bres	20575, #3
                                    156 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 208: FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_PUL);
      009738 72 13 50 5F      [ 1]  157 	bres	20575, #1
                                    158 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 209: (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
      00973C C6 50 5F         [ 1]  159 	ld	a, 0x505f
                                    160 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 210: }
      00973F 81               [ 4]  161 	ret
                                    162 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 218: void FLASH_ITConfig(FunctionalState NewState)
                                    163 ;	-----------------------------------------
                                    164 ;	 function FLASH_ITConfig
                                    165 ;	-----------------------------------------
      009740                        166 _FLASH_ITConfig:
                                    167 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 225: FLASH->CR1 |= FLASH_CR1_IE; /* Enables the interrupt sources */
      009740 C6 50 5A         [ 1]  168 	ld	a, 0x505a
                                    169 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 223: if(NewState != DISABLE)
      009743 0D 03            [ 1]  170 	tnz	(0x03, sp)
      009745 27 06            [ 1]  171 	jreq	00102$
                                    172 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 225: FLASH->CR1 |= FLASH_CR1_IE; /* Enables the interrupt sources */
      009747 AA 02            [ 1]  173 	or	a, #0x02
      009749 C7 50 5A         [ 1]  174 	ld	0x505a, a
      00974C 81               [ 4]  175 	ret
      00974D                        176 00102$:
                                    177 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 229: FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE); /* Disables the interrupt sources */
      00974D A4 FD            [ 1]  178 	and	a, #0xfd
      00974F C7 50 5A         [ 1]  179 	ld	0x505a, a
                                    180 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 231: }
      009752 81               [ 4]  181 	ret
                                    182 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 240: void FLASH_EraseByte(uint32_t Address)
                                    183 ;	-----------------------------------------
                                    184 ;	 function FLASH_EraseByte
                                    185 ;	-----------------------------------------
      009753                        186 _FLASH_EraseByte:
                                    187 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 249: write_byte_address(Address, FLASH_CLEAR_BYTE);    // SDCC patch: required for far pointers
      009753 1E 05            [ 2]  188 	ldw	x, (0x05, sp)
      009755 4B 00            [ 1]  189 	push	#0x00
      009757 89               [ 2]  190 	pushw	x
      009758 CD 96 DA         [ 4]  191 	call	_write_byte_address
      00975B 5B 03            [ 2]  192 	addw	sp, #3
                                    193 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 252: }
      00975D 81               [ 4]  194 	ret
                                    195 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 262: void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
                                    196 ;	-----------------------------------------
                                    197 ;	 function FLASH_ProgramByte
                                    198 ;	-----------------------------------------
      00975E                        199 _FLASH_ProgramByte:
                                    200 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 271: write_byte_address(Address, Data);    // SDCC patch: required for far pointers
      00975E 1E 05            [ 2]  201 	ldw	x, (0x05, sp)
      009760 7B 07            [ 1]  202 	ld	a, (0x07, sp)
      009762 88               [ 1]  203 	push	a
      009763 89               [ 2]  204 	pushw	x
      009764 CD 96 DA         [ 4]  205 	call	_write_byte_address
      009767 5B 03            [ 2]  206 	addw	sp, #3
                                    207 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 274: }
      009769 81               [ 4]  208 	ret
                                    209 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 283: uint8_t FLASH_ReadByte(uint32_t Address)
                                    210 ;	-----------------------------------------
                                    211 ;	 function FLASH_ReadByte
                                    212 ;	-----------------------------------------
      00976A                        213 _FLASH_ReadByte:
                                    214 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 292: return(read_byte_address(Address));    // SDCC patch: required for far pointers
      00976A 1E 05            [ 2]  215 	ldw	x, (0x05, sp)
      00976C 89               [ 2]  216 	pushw	x
      00976D 1E 05            [ 2]  217 	ldw	x, (0x05, sp)
      00976F 89               [ 2]  218 	pushw	x
      009770 CD 96 F1         [ 4]  219 	call	_read_byte_address
      009773 5B 04            [ 2]  220 	addw	sp, #4
                                    221 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 294: }
      009775 81               [ 4]  222 	ret
                                    223 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 304: void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
                                    224 ;	-----------------------------------------
                                    225 ;	 function FLASH_ProgramWord
                                    226 ;	-----------------------------------------
      009776                        227 _FLASH_ProgramWord:
      009776 52 04            [ 2]  228 	sub	sp, #4
                                    229 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 310: FLASH->CR2 |= FLASH_CR2_WPRG;
      009778 72 1C 50 5B      [ 1]  230 	bset	20571, #6
                                    231 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 311: FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NWPRG);
      00977C 72 1D 50 5C      [ 1]  232 	bres	20572, #6
                                    233 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 323: write_byte_address(Address    , *((uint8_t*)(&Data)));    // SDCC patch: required for far pointers
      009780 96               [ 1]  234 	ldw	x, sp
      009781 1C 00 0B         [ 2]  235 	addw	x, #11
      009784 1F 03            [ 2]  236 	ldw	(0x03, sp), x
      009786 F6               [ 1]  237 	ld	a, (x)
      009787 16 09            [ 2]  238 	ldw	y, (0x09, sp)
      009789 17 01            [ 2]  239 	ldw	(0x01, sp), y
      00978B 88               [ 1]  240 	push	a
      00978C 1E 02            [ 2]  241 	ldw	x, (0x02, sp)
      00978E 89               [ 2]  242 	pushw	x
      00978F CD 96 DA         [ 4]  243 	call	_write_byte_address
      009792 5B 03            [ 2]  244 	addw	sp, #3
                                    245 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 324: write_byte_address(Address + 1, *((uint8_t*)(&Data)+1));
      009794 1E 03            [ 2]  246 	ldw	x, (0x03, sp)
      009796 E6 01            [ 1]  247 	ld	a, (0x1, x)
      009798 1E 01            [ 2]  248 	ldw	x, (0x01, sp)
      00979A 5C               [ 1]  249 	incw	x
      00979B 88               [ 1]  250 	push	a
      00979C 89               [ 2]  251 	pushw	x
      00979D CD 96 DA         [ 4]  252 	call	_write_byte_address
      0097A0 5B 03            [ 2]  253 	addw	sp, #3
                                    254 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 325: write_byte_address(Address + 2, *((uint8_t*)(&Data)+2));
      0097A2 1E 03            [ 2]  255 	ldw	x, (0x03, sp)
      0097A4 E6 02            [ 1]  256 	ld	a, (0x2, x)
      0097A6 1E 01            [ 2]  257 	ldw	x, (0x01, sp)
      0097A8 5C               [ 1]  258 	incw	x
      0097A9 5C               [ 1]  259 	incw	x
      0097AA 88               [ 1]  260 	push	a
      0097AB 89               [ 2]  261 	pushw	x
      0097AC CD 96 DA         [ 4]  262 	call	_write_byte_address
      0097AF 5B 03            [ 2]  263 	addw	sp, #3
                                    264 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 326: write_byte_address(Address + 3, *((uint8_t*)(&Data)+3));
      0097B1 1E 03            [ 2]  265 	ldw	x, (0x03, sp)
      0097B3 E6 03            [ 1]  266 	ld	a, (0x3, x)
      0097B5 1E 01            [ 2]  267 	ldw	x, (0x01, sp)
      0097B7 1C 00 03         [ 2]  268 	addw	x, #0x0003
      0097BA 88               [ 1]  269 	push	a
      0097BB 89               [ 2]  270 	pushw	x
      0097BC CD 96 DA         [ 4]  271 	call	_write_byte_address
                                    272 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 328: }
      0097BF 5B 07            [ 2]  273 	addw	sp, #7
      0097C1 81               [ 4]  274 	ret
                                    275 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 336: void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
                                    276 ;	-----------------------------------------
                                    277 ;	 function FLASH_ProgramOptionByte
                                    278 ;	-----------------------------------------
      0097C2                        279 _FLASH_ProgramOptionByte:
                                    280 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 342: FLASH->CR2 |= FLASH_CR2_OPT;
      0097C2 72 1E 50 5B      [ 1]  281 	bset	20571, #7
                                    282 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 343: FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
      0097C6 C6 50 5C         [ 1]  283 	ld	a, 0x505c
      0097C9 A4 7F            [ 1]  284 	and	a, #0x7f
      0097CB C7 50 5C         [ 1]  285 	ld	0x505c, a
                                    286 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 349: *((NEAR uint8_t*)Address) = Data;
      0097CE 1E 03            [ 2]  287 	ldw	x, (0x03, sp)
                                    288 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 346: if(Address == 0x4800)
      0097D0 89               [ 2]  289 	pushw	x
      0097D1 1E 05            [ 2]  290 	ldw	x, (0x05, sp)
      0097D3 A3 48 00         [ 2]  291 	cpw	x, #0x4800
      0097D6 85               [ 2]  292 	popw	x
      0097D7 26 05            [ 1]  293 	jrne	00102$
                                    294 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 349: *((NEAR uint8_t*)Address) = Data;
      0097D9 7B 05            [ 1]  295 	ld	a, (0x05, sp)
      0097DB F7               [ 1]  296 	ld	(x), a
      0097DC 20 0A            [ 2]  297 	jra	00103$
      0097DE                        298 00102$:
                                    299 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 354: *((NEAR uint8_t*)Address) = Data;
      0097DE 7B 05            [ 1]  300 	ld	a, (0x05, sp)
      0097E0 F7               [ 1]  301 	ld	(x), a
                                    302 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 355: *((NEAR uint8_t*)((uint16_t)(Address + 1))) = (uint8_t)(~Data);
      0097E1 1E 03            [ 2]  303 	ldw	x, (0x03, sp)
      0097E3 5C               [ 1]  304 	incw	x
      0097E4 7B 05            [ 1]  305 	ld	a, (0x05, sp)
      0097E6 43               [ 1]  306 	cpl	a
      0097E7 F7               [ 1]  307 	ld	(x), a
      0097E8                        308 00103$:
                                    309 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 357: FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
      0097E8 4B FD            [ 1]  310 	push	#0xfd
      0097EA CD 98 C4         [ 4]  311 	call	_FLASH_WaitForLastOperation
      0097ED 84               [ 1]  312 	pop	a
                                    313 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 360: FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
      0097EE 72 1F 50 5B      [ 1]  314 	bres	20571, #7
                                    315 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 361: FLASH->NCR2 |= FLASH_NCR2_NOPT;
      0097F2 72 1E 50 5C      [ 1]  316 	bset	20572, #7
                                    317 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 362: }
      0097F6 81               [ 4]  318 	ret
                                    319 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 369: void FLASH_EraseOptionByte(uint16_t Address)
                                    320 ;	-----------------------------------------
                                    321 ;	 function FLASH_EraseOptionByte
                                    322 ;	-----------------------------------------
      0097F7                        323 _FLASH_EraseOptionByte:
                                    324 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 375: FLASH->CR2 |= FLASH_CR2_OPT;
      0097F7 72 1E 50 5B      [ 1]  325 	bset	20571, #7
                                    326 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 376: FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
      0097FB C6 50 5C         [ 1]  327 	ld	a, 0x505c
      0097FE A4 7F            [ 1]  328 	and	a, #0x7f
      009800 C7 50 5C         [ 1]  329 	ld	0x505c, a
                                    330 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 382: *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
      009803 16 03            [ 2]  331 	ldw	y, (0x03, sp)
                                    332 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 379: if(Address == 0x4800)
      009805 1E 03            [ 2]  333 	ldw	x, (0x03, sp)
      009807 A3 48 00         [ 2]  334 	cpw	x, #0x4800
      00980A 26 04            [ 1]  335 	jrne	00102$
                                    336 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 382: *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
      00980C 90 7F            [ 1]  337 	clr	(y)
      00980E 20 08            [ 2]  338 	jra	00103$
      009810                        339 00102$:
                                    340 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 387: *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
      009810 90 7F            [ 1]  341 	clr	(y)
                                    342 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 388: *((NEAR uint8_t*)((uint16_t)(Address + (uint16_t)1 ))) = FLASH_SET_BYTE;
      009812 1E 03            [ 2]  343 	ldw	x, (0x03, sp)
      009814 5C               [ 1]  344 	incw	x
      009815 A6 FF            [ 1]  345 	ld	a, #0xff
      009817 F7               [ 1]  346 	ld	(x), a
      009818                        347 00103$:
                                    348 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 390: FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
      009818 4B FD            [ 1]  349 	push	#0xfd
      00981A CD 98 C4         [ 4]  350 	call	_FLASH_WaitForLastOperation
      00981D 84               [ 1]  351 	pop	a
                                    352 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 393: FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
      00981E 72 1F 50 5B      [ 1]  353 	bres	20571, #7
                                    354 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 394: FLASH->NCR2 |= FLASH_NCR2_NOPT;
      009822 72 1E 50 5C      [ 1]  355 	bset	20572, #7
                                    356 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 395: }
      009826 81               [ 4]  357 	ret
                                    358 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 402: uint16_t FLASH_ReadOptionByte(uint16_t Address)
                                    359 ;	-----------------------------------------
                                    360 ;	 function FLASH_ReadOptionByte
                                    361 ;	-----------------------------------------
      009827                        362 _FLASH_ReadOptionByte:
      009827 52 07            [ 2]  363 	sub	sp, #7
                                    364 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 410: value_optbyte = *((NEAR uint8_t*)Address); /* Read option byte */
      009829 1E 0A            [ 2]  365 	ldw	x, (0x0a, sp)
      00982B F6               [ 1]  366 	ld	a, (x)
      00982C 6B 02            [ 1]  367 	ld	(0x02, sp), a
                                    368 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 411: value_optbyte_complement = *(((NEAR uint8_t*)Address) + 1); /* Read option byte complement */
      00982E E6 01            [ 1]  369 	ld	a, (0x1, x)
      009830 6B 01            [ 1]  370 	ld	(0x01, sp), a
                                    371 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 416: res_value =	 value_optbyte;
      009832 90 5F            [ 1]  372 	clrw	y
      009834 7B 02            [ 1]  373 	ld	a, (0x02, sp)
      009836 90 97            [ 1]  374 	ld	yl, a
                                    375 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 414: if(Address == 0x4800)	 
      009838 1E 0A            [ 2]  376 	ldw	x, (0x0a, sp)
      00983A A3 48 00         [ 2]  377 	cpw	x, #0x4800
      00983D 26 03            [ 1]  378 	jrne	00105$
                                    379 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 416: res_value =	 value_optbyte;
      00983F 93               [ 1]  380 	ldw	x, y
      009840 20 1E            [ 2]  381 	jra	00106$
      009842                        382 00105$:
                                    383 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 420: if(value_optbyte == (uint8_t)(~value_optbyte_complement))
      009842 7B 01            [ 1]  384 	ld	a, (0x01, sp)
      009844 43               [ 1]  385 	cpl	a
      009845 6B 03            [ 1]  386 	ld	(0x03, sp), a
      009847 7B 02            [ 1]  387 	ld	a, (0x02, sp)
      009849 11 03            [ 1]  388 	cp	a, (0x03, sp)
      00984B 26 10            [ 1]  389 	jrne	00102$
                                    390 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 422: res_value = (uint16_t)((uint16_t)value_optbyte << 8);
      00984D 4F               [ 1]  391 	clr	a
      00984E 6B 07            [ 1]  392 	ld	(0x07, sp), a
                                    393 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 423: res_value = res_value | (uint16_t)value_optbyte_complement;
      009850 7B 01            [ 1]  394 	ld	a, (0x01, sp)
      009852 0F 04            [ 1]  395 	clr	(0x04, sp)
      009854 1A 07            [ 1]  396 	or	a, (0x07, sp)
      009856 97               [ 1]  397 	ld	xl, a
      009857 90 9F            [ 1]  398 	ld	a, yl
      009859 1A 04            [ 1]  399 	or	a, (0x04, sp)
      00985B 95               [ 1]  400 	ld	xh, a
                                    401 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 427: res_value = FLASH_OPTIONBYTE_ERROR;
      00985C BC                     402 	.byte 0xbc
      00985D                        403 00102$:
      00985D AE 55 55         [ 2]  404 	ldw	x, #0x5555
      009860                        405 00106$:
                                    406 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 430: return(res_value);
                                    407 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 431: }
      009860 5B 07            [ 2]  408 	addw	sp, #7
      009862 81               [ 4]  409 	ret
                                    410 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 439: void FLASH_SetLowPowerMode(FLASH_LPMode_TypeDef FLASH_LPMode)
                                    411 ;	-----------------------------------------
                                    412 ;	 function FLASH_SetLowPowerMode
                                    413 ;	-----------------------------------------
      009863                        414 _FLASH_SetLowPowerMode:
                                    415 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 445: FLASH->CR1 &= (uint8_t)(~(FLASH_CR1_HALT | FLASH_CR1_AHALT)); 
      009863 C6 50 5A         [ 1]  416 	ld	a, 0x505a
      009866 A4 F3            [ 1]  417 	and	a, #0xf3
      009868 C7 50 5A         [ 1]  418 	ld	0x505a, a
                                    419 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 448: FLASH->CR1 |= (uint8_t)FLASH_LPMode; 
      00986B C6 50 5A         [ 1]  420 	ld	a, 0x505a
      00986E 1A 03            [ 1]  421 	or	a, (0x03, sp)
      009870 C7 50 5A         [ 1]  422 	ld	0x505a, a
                                    423 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 449: }
      009873 81               [ 4]  424 	ret
                                    425 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 457: void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
                                    426 ;	-----------------------------------------
                                    427 ;	 function FLASH_SetProgrammingTime
                                    428 ;	-----------------------------------------
      009874                        429 _FLASH_SetProgrammingTime:
                                    430 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 462: FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
      009874 C6 50 5A         [ 1]  431 	ld	a, 0x505a
      009877 A4 FE            [ 1]  432 	and	a, #0xfe
      009879 C7 50 5A         [ 1]  433 	ld	0x505a, a
                                    434 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 463: FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
      00987C C6 50 5A         [ 1]  435 	ld	a, 0x505a
      00987F 1A 03            [ 1]  436 	or	a, (0x03, sp)
      009881 C7 50 5A         [ 1]  437 	ld	0x505a, a
                                    438 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 464: }
      009884 81               [ 4]  439 	ret
                                    440 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 471: FLASH_LPMode_TypeDef FLASH_GetLowPowerMode(void)
                                    441 ;	-----------------------------------------
                                    442 ;	 function FLASH_GetLowPowerMode
                                    443 ;	-----------------------------------------
      009885                        444 _FLASH_GetLowPowerMode:
                                    445 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 473: return((FLASH_LPMode_TypeDef)(FLASH->CR1 & (uint8_t)(FLASH_CR1_HALT | FLASH_CR1_AHALT)));
      009885 C6 50 5A         [ 1]  446 	ld	a, 0x505a
      009888 A4 0C            [ 1]  447 	and	a, #0x0c
                                    448 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 474: }
      00988A 81               [ 4]  449 	ret
                                    450 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 481: FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
                                    451 ;	-----------------------------------------
                                    452 ;	 function FLASH_GetProgrammingTime
                                    453 ;	-----------------------------------------
      00988B                        454 _FLASH_GetProgrammingTime:
                                    455 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 483: return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
      00988B C6 50 5A         [ 1]  456 	ld	a, 0x505a
      00988E A4 01            [ 1]  457 	and	a, #0x01
                                    458 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 484: }
      009890 81               [ 4]  459 	ret
                                    460 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 491: uint32_t FLASH_GetBootSize(void)
                                    461 ;	-----------------------------------------
                                    462 ;	 function FLASH_GetBootSize
                                    463 ;	-----------------------------------------
      009891                        464 _FLASH_GetBootSize:
      009891 52 04            [ 2]  465 	sub	sp, #4
                                    466 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 496: temp = (uint32_t)((uint32_t)FLASH->FPR * (uint32_t)512);
      009893 C6 50 5D         [ 1]  467 	ld	a, 0x505d
      009896 5F               [ 1]  468 	clrw	x
      009897 0F 04            [ 1]  469 	clr	(0x04, sp)
      009899 08 04            [ 1]  470 	sll	(0x04, sp)
      00989B 49               [ 1]  471 	rlc	a
      00989C 59               [ 2]  472 	rlcw	x
      00989D 90 95            [ 1]  473 	ld	yh, a
      00989F 7B 04            [ 1]  474 	ld	a, (0x04, sp)
      0098A1 90 97            [ 1]  475 	ld	yl, a
                                    476 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 499: if(FLASH->FPR == 0xFF)
      0098A3 C6 50 5D         [ 1]  477 	ld	a, 0x505d
      0098A6 4C               [ 1]  478 	inc	a
      0098A7 26 0B            [ 1]  479 	jrne	00102$
                                    480 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 501: temp += 512;
      0098A9 72 A9 02 00      [ 2]  481 	addw	y, #0x0200
      0098AD 9F               [ 1]  482 	ld	a, xl
      0098AE A9 00            [ 1]  483 	adc	a, #0x00
      0098B0 02               [ 1]  484 	rlwa	x
      0098B1 A9 00            [ 1]  485 	adc	a, #0x00
      0098B3 95               [ 1]  486 	ld	xh, a
      0098B4                        487 00102$:
                                    488 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 505: return(temp);
      0098B4 51               [ 1]  489 	exgw	x, y
                                    490 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 506: }
      0098B5 5B 04            [ 2]  491 	addw	sp, #4
      0098B7 81               [ 4]  492 	ret
                                    493 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 516: FlagStatus FLASH_GetFlagStatus(FLASH_Flag_TypeDef FLASH_FLAG)
                                    494 ;	-----------------------------------------
                                    495 ;	 function FLASH_GetFlagStatus
                                    496 ;	-----------------------------------------
      0098B8                        497 _FLASH_GetFlagStatus:
                                    498 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 523: if((FLASH->IAPSR & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
      0098B8 C6 50 5F         [ 1]  499 	ld	a, 0x505f
      0098BB 14 03            [ 1]  500 	and	a, (0x03, sp)
      0098BD 27 03            [ 1]  501 	jreq	00102$
                                    502 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 525: status = SET; /* FLASH_FLAG is set */
      0098BF A6 01            [ 1]  503 	ld	a, #0x01
      0098C1 81               [ 4]  504 	ret
      0098C2                        505 00102$:
                                    506 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 529: status = RESET; /* FLASH_FLAG is reset*/
      0098C2 4F               [ 1]  507 	clr	a
                                    508 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 533: return status;
                                    509 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 534: }
      0098C3 81               [ 4]  510 	ret
                                    511 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 648: IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType)) 
                                    512 ;	-----------------------------------------
                                    513 ;	 function FLASH_WaitForLastOperation
                                    514 ;	-----------------------------------------
      0098C4                        515 _FLASH_WaitForLastOperation:
                                    516 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 650: uint8_t flagstatus = 0x00;
      0098C4 4F               [ 1]  517 	clr	a
                                    518 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 656: if(FLASH_MemType == FLASH_MEMTYPE_PROG)
      0098C5 88               [ 1]  519 	push	a
      0098C6 7B 04            [ 1]  520 	ld	a, (0x04, sp)
      0098C8 A1 FD            [ 1]  521 	cp	a, #0xfd
      0098CA 84               [ 1]  522 	pop	a
      0098CB 26 10            [ 1]  523 	jrne	00121$
                                    524 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 658: while((flagstatus == 0x00) && (timeout != 0x00))
      0098CD 5F               [ 1]  525 	clrw	x
      0098CE 5A               [ 2]  526 	decw	x
      0098CF                        527 00102$:
      0098CF 4D               [ 1]  528 	tnz	a
      0098D0 26 1B            [ 1]  529 	jrne	00111$
      0098D2 5D               [ 2]  530 	tnzw	x
      0098D3 27 18            [ 1]  531 	jreq	00111$
                                    532 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 660: flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_EOP |
      0098D5 C6 50 5F         [ 1]  533 	ld	a, 0x505f
      0098D8 A4 05            [ 1]  534 	and	a, #0x05
                                    535 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 662: timeout--;
      0098DA 5A               [ 2]  536 	decw	x
      0098DB 20 F2            [ 2]  537 	jra	00102$
                                    538 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 667: while((flagstatus == 0x00) && (timeout != 0x00))
      0098DD                        539 00121$:
      0098DD 5F               [ 1]  540 	clrw	x
      0098DE 5A               [ 2]  541 	decw	x
      0098DF                        542 00106$:
      0098DF 4D               [ 1]  543 	tnz	a
      0098E0 26 0B            [ 1]  544 	jrne	00124$
      0098E2 5D               [ 2]  545 	tnzw	x
      0098E3 27 08            [ 1]  546 	jreq	00124$
                                    547 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 669: flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_HVOFF |
      0098E5 C6 50 5F         [ 1]  548 	ld	a, 0x505f
      0098E8 A4 41            [ 1]  549 	and	a, #0x41
                                    550 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 671: timeout--;
      0098EA 5A               [ 2]  551 	decw	x
      0098EB 20 F2            [ 2]  552 	jra	00106$
                                    553 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 687: return((FLASH_Status_TypeDef)flagstatus);
                                    554 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 671: timeout--;
      0098ED                        555 00124$:
      0098ED                        556 00111$:
                                    557 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 682: if(timeout == 0x00 )
      0098ED 5D               [ 2]  558 	tnzw	x
      0098EE 27 01            [ 1]  559 	jreq	00164$
      0098F0 81               [ 4]  560 	ret
      0098F1                        561 00164$:
                                    562 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 684: flagstatus = FLASH_STATUS_TIMEOUT;
      0098F1 A6 02            [ 1]  563 	ld	a, #0x02
                                    564 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 687: return((FLASH_Status_TypeDef)flagstatus);
                                    565 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 688: }
      0098F3 81               [ 4]  566 	ret
                                    567 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 697: IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
                                    568 ;	-----------------------------------------
                                    569 ;	 function FLASH_EraseBlock
                                    570 ;	-----------------------------------------
      0098F4                        571 _FLASH_EraseBlock:
      0098F4 52 06            [ 2]  572 	sub	sp, #6
                                    573 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 710: if(FLASH_MemType == FLASH_MEMTYPE_PROG)
      0098F6 7B 0B            [ 1]  574 	ld	a, (0x0b, sp)
      0098F8 A1 FD            [ 1]  575 	cp	a, #0xfd
      0098FA 26 09            [ 1]  576 	jrne	00102$
                                    577 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 713: startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
      0098FC AE 80 00         [ 2]  578 	ldw	x, #0x8000
      0098FF 1F 05            [ 2]  579 	ldw	(0x05, sp), x
      009901 0F 03            [ 1]  580 	clr	(0x03, sp)
      009903 20 07            [ 2]  581 	jra	00103$
      009905                        582 00102$:
                                    583 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 718: startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
      009905 AE 40 00         [ 2]  584 	ldw	x, #0x4000
      009908 1F 05            [ 2]  585 	ldw	(0x05, sp), x
      00990A 0F 03            [ 1]  586 	clr	(0x03, sp)
      00990C                        587 00103$:
                                    588 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 726: pwFlash = (PointerAttr uint32_t *)(MemoryAddressCast)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
      00990C 1E 09            [ 2]  589 	ldw	x, (0x09, sp)
      00990E 58               [ 2]  590 	sllw	x
      00990F 58               [ 2]  591 	sllw	x
      009910 58               [ 2]  592 	sllw	x
      009911 58               [ 2]  593 	sllw	x
      009912 58               [ 2]  594 	sllw	x
      009913 58               [ 2]  595 	sllw	x
      009914 58               [ 2]  596 	sllw	x
      009915 1F 01            [ 2]  597 	ldw	(0x01, sp), x
      009917 72 FB 05         [ 2]  598 	addw	x, (0x05, sp)
                                    599 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 730: FLASH->CR2 |= FLASH_CR2_ERASE;
      00991A 72 1A 50 5B      [ 1]  600 	bset	20571, #5
                                    601 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 731: FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NERASE);
      00991E 72 1B 50 5C      [ 1]  602 	bres	20572, #5
                                    603 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 735: *pwFlash = (uint32_t)0;
      009922 6F 03            [ 1]  604 	clr	(0x3, x)
      009924 6F 02            [ 1]  605 	clr	(0x2, x)
      009926 6F 01            [ 1]  606 	clr	(0x1, x)
      009928 7F               [ 1]  607 	clr	(x)
                                    608 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 743: }
      009929 5B 06            [ 2]  609 	addw	sp, #6
      00992B 81               [ 4]  610 	ret
                                    611 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 754: IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType, 
                                    612 ;	-----------------------------------------
                                    613 ;	 function FLASH_ProgramBlock
                                    614 ;	-----------------------------------------
      00992C                        615 _FLASH_ProgramBlock:
      00992C 52 0E            [ 2]  616 	sub	sp, #14
                                    617 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 763: if(FLASH_MemType == FLASH_MEMTYPE_PROG)
      00992E 7B 13            [ 1]  618 	ld	a, (0x13, sp)
      009930 A1 FD            [ 1]  619 	cp	a, #0xfd
      009932 26 09            [ 1]  620 	jrne	00102$
                                    621 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 766: startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
      009934 0F 08            [ 1]  622 	clr	(0x08, sp)
      009936 A6 80            [ 1]  623 	ld	a, #0x80
      009938 5F               [ 1]  624 	clrw	x
      009939 1F 05            [ 2]  625 	ldw	(0x05, sp), x
      00993B 20 07            [ 2]  626 	jra	00103$
      00993D                        627 00102$:
                                    628 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 771: startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
      00993D 0F 08            [ 1]  629 	clr	(0x08, sp)
      00993F A6 40            [ 1]  630 	ld	a, #0x40
      009941 5F               [ 1]  631 	clrw	x
      009942 1F 05            [ 2]  632 	ldw	(0x05, sp), x
      009944                        633 00103$:
                                    634 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 775: startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
      009944 16 11            [ 2]  635 	ldw	y, (0x11, sp)
      009946 5F               [ 1]  636 	clrw	x
      009947 88               [ 1]  637 	push	a
      009948 A6 07            [ 1]  638 	ld	a, #0x07
      00994A                        639 00131$:
      00994A 90 58            [ 2]  640 	sllw	y
      00994C 59               [ 2]  641 	rlcw	x
      00994D 4A               [ 1]  642 	dec	a
      00994E 26 FA            [ 1]  643 	jrne	00131$
      009950 17 04            [ 2]  644 	ldw	(0x04, sp), y
      009952 84               [ 1]  645 	pop	a
      009953 90 95            [ 1]  646 	ld	yh, a
      009955 61               [ 1]  647 	exg	a, yl
      009956 7B 08            [ 1]  648 	ld	a, (0x08, sp)
      009958 61               [ 1]  649 	exg	a, yl
      009959 72 F9 03         [ 2]  650 	addw	y, (0x03, sp)
      00995C 9F               [ 1]  651 	ld	a, xl
      00995D 19 06            [ 1]  652 	adc	a, (0x06, sp)
      00995F 02               [ 1]  653 	rlwa	x
      009960 19 05            [ 1]  654 	adc	a, (0x05, sp)
      009962 95               [ 1]  655 	ld	xh, a
      009963 17 0B            [ 2]  656 	ldw	(0x0b, sp), y
      009965 1F 09            [ 2]  657 	ldw	(0x09, sp), x
                                    658 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 781: FLASH->CR2 |= FLASH_CR2_PRG;
      009967 C6 50 5B         [ 1]  659 	ld	a, 0x505b
                                    660 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 778: if(FLASH_ProgMode == FLASH_PROGRAMMODE_STANDARD)
      00996A 0D 14            [ 1]  661 	tnz	(0x14, sp)
      00996C 26 0B            [ 1]  662 	jrne	00105$
                                    663 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 781: FLASH->CR2 |= FLASH_CR2_PRG;
      00996E AA 01            [ 1]  664 	or	a, #0x01
      009970 C7 50 5B         [ 1]  665 	ld	0x505b, a
                                    666 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 782: FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NPRG);
      009973 72 11 50 5C      [ 1]  667 	bres	20572, #0
      009977 20 09            [ 2]  668 	jra	00114$
      009979                        669 00105$:
                                    670 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 787: FLASH->CR2 |= FLASH_CR2_FPRG;
      009979 AA 10            [ 1]  671 	or	a, #0x10
      00997B C7 50 5B         [ 1]  672 	ld	0x505b, a
                                    673 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 788: FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NFPRG);
      00997E 72 19 50 5C      [ 1]  674 	bres	20572, #4
                                    675 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 792: for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
      009982                        676 00114$:
      009982 5F               [ 1]  677 	clrw	x
      009983 1F 0D            [ 2]  678 	ldw	(0x0d, sp), x
      009985                        679 00108$:
                                    680 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 797: write_byte_address(startaddress + Count, ((uint8_t)(Buffer[Count])));    // SDCC patch: required for far pointers
      009985 1E 15            [ 2]  681 	ldw	x, (0x15, sp)
      009987 72 FB 0D         [ 2]  682 	addw	x, (0x0d, sp)
      00998A F6               [ 1]  683 	ld	a, (x)
      00998B 1E 0B            [ 2]  684 	ldw	x, (0x0b, sp)
      00998D 72 FB 0D         [ 2]  685 	addw	x, (0x0d, sp)
      009990 88               [ 1]  686 	push	a
      009991 89               [ 2]  687 	pushw	x
      009992 CD 96 DA         [ 4]  688 	call	_write_byte_address
      009995 5B 03            [ 2]  689 	addw	sp, #3
                                    690 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 792: for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
      009997 1E 0D            [ 2]  691 	ldw	x, (0x0d, sp)
      009999 5C               [ 1]  692 	incw	x
      00999A 1F 0D            [ 2]  693 	ldw	(0x0d, sp), x
      00999C A3 00 80         [ 2]  694 	cpw	x, #0x0080
      00999F 25 E4            [ 1]  695 	jrc	00108$
                                    696 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 800: }
      0099A1 5B 0E            [ 2]  697 	addw	sp, #14
      0099A3 81               [ 4]  698 	ret
                                    699 	.area CODE
                                    700 	.area CONST
                                    701 	.area INITIALIZER
                                    702 	.area CABS (ABS)
