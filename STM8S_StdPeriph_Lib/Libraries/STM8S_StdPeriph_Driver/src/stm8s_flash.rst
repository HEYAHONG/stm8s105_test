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
      000092                         39 _asm_addr::
      000092                         40 	.ds 4
      000096                         41 _asm_val::
      000096                         42 	.ds 1
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
      00A7E4                         80 _write_byte_address:
                                     81 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 110: asm_addr = Address;
      00A7E4 16 03            [ 2]   82 	ldw	y, (0x03, sp)
      00A7E6 5F               [ 1]   83 	clrw	x
      00A7E7 90 CF 00 94      [ 2]   84 	ldw	_asm_addr+2, y
      00A7EB CF 00 92         [ 2]   85 	ldw	_asm_addr+0, x
                                     86 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 111: asm_val  = Data;
      00A7EE 7B 05            [ 1]   87 	ld	a, (0x05, sp)
      00A7F0 C7 00 96         [ 1]   88 	ld	_asm_val+0, a
                                     89 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 117: __endasm;
      00A7F3 C6 00 96         [ 1]   90 	ld	a,_asm_val
      00A7F6 92 BD 00 93      [ 4]   91 	ldf	[_asm_addr+1].e,a
                                     92 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 119: }
      00A7FA 81               [ 4]   93 	ret
                                     94 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 129: uint8_t read_byte_address(uint32_t Address)
                                     95 ;	-----------------------------------------
                                     96 ;	 function read_byte_address
                                     97 ;	-----------------------------------------
      00A7FB                         98 _read_byte_address:
                                     99 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 132: asm_addr = Address;
      00A7FB 1E 05            [ 2]  100 	ldw	x, (0x05, sp)
      00A7FD 16 03            [ 2]  101 	ldw	y, (0x03, sp)
      00A7FF CF 00 94         [ 2]  102 	ldw	_asm_addr+2, x
      00A802 90 CF 00 92      [ 2]  103 	ldw	_asm_addr+0, y
                                    104 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 138: __endasm;
      00A806 92 BC 00 93      [ 5]  105 	ldf	a,[_asm_addr+1].e
      00A80A C7 00 96         [ 1]  106 	ld	_asm_val,a
                                    107 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 141: return(asm_val);
      00A80D C6 00 96         [ 1]  108 	ld	a, _asm_val+0
                                    109 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 143: }
      00A810 81               [ 4]  110 	ret
                                    111 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 163: void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
                                    112 ;	-----------------------------------------
                                    113 ;	 function FLASH_Unlock
                                    114 ;	-----------------------------------------
      00A811                        115 _FLASH_Unlock:
                                    116 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 169: if(FLASH_MemType == FLASH_MEMTYPE_PROG)
      00A811 7B 03            [ 1]  117 	ld	a, (0x03, sp)
      00A813 A1 FD            [ 1]  118 	cp	a, #0xfd
      00A815 26 09            [ 1]  119 	jrne	00102$
                                    120 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 171: FLASH->PUKR = FLASH_RASS_KEY1;
      00A817 35 56 50 62      [ 1]  121 	mov	0x5062+0, #0x56
                                    122 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 172: FLASH->PUKR = FLASH_RASS_KEY2;
      00A81B 35 AE 50 62      [ 1]  123 	mov	0x5062+0, #0xae
      00A81F 81               [ 4]  124 	ret
      00A820                        125 00102$:
                                    126 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 177: FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
      00A820 35 AE 50 64      [ 1]  127 	mov	0x5064+0, #0xae
                                    128 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 178: FLASH->DUKR = FLASH_RASS_KEY1;
      00A824 35 56 50 64      [ 1]  129 	mov	0x5064+0, #0x56
                                    130 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 180: }
      00A828 81               [ 4]  131 	ret
                                    132 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 188: void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
                                    133 ;	-----------------------------------------
                                    134 ;	 function FLASH_Lock
                                    135 ;	-----------------------------------------
      00A829                        136 _FLASH_Lock:
                                    137 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 194: FLASH->IAPSR &= (uint8_t)FLASH_MemType;
      00A829 C6 50 5F         [ 1]  138 	ld	a, 0x505f
      00A82C 14 03            [ 1]  139 	and	a, (0x03, sp)
      00A82E C7 50 5F         [ 1]  140 	ld	0x505f, a
                                    141 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 195: }
      00A831 81               [ 4]  142 	ret
                                    143 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 202: void FLASH_DeInit(void)
                                    144 ;	-----------------------------------------
                                    145 ;	 function FLASH_DeInit
                                    146 ;	-----------------------------------------
      00A832                        147 _FLASH_DeInit:
                                    148 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 204: FLASH->CR1 = FLASH_CR1_RESET_VALUE;
      00A832 35 00 50 5A      [ 1]  149 	mov	0x505a+0, #0x00
                                    150 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 205: FLASH->CR2 = FLASH_CR2_RESET_VALUE;
      00A836 35 00 50 5B      [ 1]  151 	mov	0x505b+0, #0x00
                                    152 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 206: FLASH->NCR2 = FLASH_NCR2_RESET_VALUE;
      00A83A 35 FF 50 5C      [ 1]  153 	mov	0x505c+0, #0xff
                                    154 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 207: FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_DUL);
      00A83E 72 17 50 5F      [ 1]  155 	bres	20575, #3
                                    156 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 208: FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_PUL);
      00A842 72 13 50 5F      [ 1]  157 	bres	20575, #1
                                    158 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 209: (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
      00A846 C6 50 5F         [ 1]  159 	ld	a, 0x505f
                                    160 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 210: }
      00A849 81               [ 4]  161 	ret
                                    162 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 218: void FLASH_ITConfig(FunctionalState NewState)
                                    163 ;	-----------------------------------------
                                    164 ;	 function FLASH_ITConfig
                                    165 ;	-----------------------------------------
      00A84A                        166 _FLASH_ITConfig:
                                    167 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 225: FLASH->CR1 |= FLASH_CR1_IE; /* Enables the interrupt sources */
      00A84A C6 50 5A         [ 1]  168 	ld	a, 0x505a
                                    169 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 223: if(NewState != DISABLE)
      00A84D 0D 03            [ 1]  170 	tnz	(0x03, sp)
      00A84F 27 06            [ 1]  171 	jreq	00102$
                                    172 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 225: FLASH->CR1 |= FLASH_CR1_IE; /* Enables the interrupt sources */
      00A851 AA 02            [ 1]  173 	or	a, #0x02
      00A853 C7 50 5A         [ 1]  174 	ld	0x505a, a
      00A856 81               [ 4]  175 	ret
      00A857                        176 00102$:
                                    177 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 229: FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE); /* Disables the interrupt sources */
      00A857 A4 FD            [ 1]  178 	and	a, #0xfd
      00A859 C7 50 5A         [ 1]  179 	ld	0x505a, a
                                    180 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 231: }
      00A85C 81               [ 4]  181 	ret
                                    182 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 240: void FLASH_EraseByte(uint32_t Address)
                                    183 ;	-----------------------------------------
                                    184 ;	 function FLASH_EraseByte
                                    185 ;	-----------------------------------------
      00A85D                        186 _FLASH_EraseByte:
                                    187 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 249: write_byte_address(Address, FLASH_CLEAR_BYTE);    // SDCC patch: required for far pointers
      00A85D 1E 05            [ 2]  188 	ldw	x, (0x05, sp)
      00A85F 4B 00            [ 1]  189 	push	#0x00
      00A861 89               [ 2]  190 	pushw	x
      00A862 CD A7 E4         [ 4]  191 	call	_write_byte_address
      00A865 5B 03            [ 2]  192 	addw	sp, #3
                                    193 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 252: }
      00A867 81               [ 4]  194 	ret
                                    195 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 262: void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
                                    196 ;	-----------------------------------------
                                    197 ;	 function FLASH_ProgramByte
                                    198 ;	-----------------------------------------
      00A868                        199 _FLASH_ProgramByte:
                                    200 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 271: write_byte_address(Address, Data);    // SDCC patch: required for far pointers
      00A868 1E 05            [ 2]  201 	ldw	x, (0x05, sp)
      00A86A 7B 07            [ 1]  202 	ld	a, (0x07, sp)
      00A86C 88               [ 1]  203 	push	a
      00A86D 89               [ 2]  204 	pushw	x
      00A86E CD A7 E4         [ 4]  205 	call	_write_byte_address
      00A871 5B 03            [ 2]  206 	addw	sp, #3
                                    207 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 274: }
      00A873 81               [ 4]  208 	ret
                                    209 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 283: uint8_t FLASH_ReadByte(uint32_t Address)
                                    210 ;	-----------------------------------------
                                    211 ;	 function FLASH_ReadByte
                                    212 ;	-----------------------------------------
      00A874                        213 _FLASH_ReadByte:
                                    214 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 292: return(read_byte_address(Address));    // SDCC patch: required for far pointers
      00A874 1E 05            [ 2]  215 	ldw	x, (0x05, sp)
      00A876 89               [ 2]  216 	pushw	x
      00A877 1E 05            [ 2]  217 	ldw	x, (0x05, sp)
      00A879 89               [ 2]  218 	pushw	x
      00A87A CD A7 FB         [ 4]  219 	call	_read_byte_address
      00A87D 5B 04            [ 2]  220 	addw	sp, #4
                                    221 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 294: }
      00A87F 81               [ 4]  222 	ret
                                    223 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 304: void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
                                    224 ;	-----------------------------------------
                                    225 ;	 function FLASH_ProgramWord
                                    226 ;	-----------------------------------------
      00A880                        227 _FLASH_ProgramWord:
      00A880 52 04            [ 2]  228 	sub	sp, #4
                                    229 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 310: FLASH->CR2 |= FLASH_CR2_WPRG;
      00A882 72 1C 50 5B      [ 1]  230 	bset	20571, #6
                                    231 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 311: FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NWPRG);
      00A886 72 1D 50 5C      [ 1]  232 	bres	20572, #6
                                    233 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 323: write_byte_address(Address    , *((uint8_t*)(&Data)));    // SDCC patch: required for far pointers
      00A88A 96               [ 1]  234 	ldw	x, sp
      00A88B 1C 00 0B         [ 2]  235 	addw	x, #11
      00A88E 1F 03            [ 2]  236 	ldw	(0x03, sp), x
      00A890 F6               [ 1]  237 	ld	a, (x)
      00A891 16 09            [ 2]  238 	ldw	y, (0x09, sp)
      00A893 17 01            [ 2]  239 	ldw	(0x01, sp), y
      00A895 88               [ 1]  240 	push	a
      00A896 1E 02            [ 2]  241 	ldw	x, (0x02, sp)
      00A898 89               [ 2]  242 	pushw	x
      00A899 CD A7 E4         [ 4]  243 	call	_write_byte_address
      00A89C 5B 03            [ 2]  244 	addw	sp, #3
                                    245 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 324: write_byte_address(Address + 1, *((uint8_t*)(&Data)+1));
      00A89E 1E 03            [ 2]  246 	ldw	x, (0x03, sp)
      00A8A0 E6 01            [ 1]  247 	ld	a, (0x1, x)
      00A8A2 1E 01            [ 2]  248 	ldw	x, (0x01, sp)
      00A8A4 5C               [ 1]  249 	incw	x
      00A8A5 88               [ 1]  250 	push	a
      00A8A6 89               [ 2]  251 	pushw	x
      00A8A7 CD A7 E4         [ 4]  252 	call	_write_byte_address
      00A8AA 5B 03            [ 2]  253 	addw	sp, #3
                                    254 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 325: write_byte_address(Address + 2, *((uint8_t*)(&Data)+2));
      00A8AC 1E 03            [ 2]  255 	ldw	x, (0x03, sp)
      00A8AE E6 02            [ 1]  256 	ld	a, (0x2, x)
      00A8B0 1E 01            [ 2]  257 	ldw	x, (0x01, sp)
      00A8B2 5C               [ 1]  258 	incw	x
      00A8B3 5C               [ 1]  259 	incw	x
      00A8B4 88               [ 1]  260 	push	a
      00A8B5 89               [ 2]  261 	pushw	x
      00A8B6 CD A7 E4         [ 4]  262 	call	_write_byte_address
      00A8B9 5B 03            [ 2]  263 	addw	sp, #3
                                    264 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 326: write_byte_address(Address + 3, *((uint8_t*)(&Data)+3));
      00A8BB 1E 03            [ 2]  265 	ldw	x, (0x03, sp)
      00A8BD E6 03            [ 1]  266 	ld	a, (0x3, x)
      00A8BF 1E 01            [ 2]  267 	ldw	x, (0x01, sp)
      00A8C1 1C 00 03         [ 2]  268 	addw	x, #0x0003
      00A8C4 88               [ 1]  269 	push	a
      00A8C5 89               [ 2]  270 	pushw	x
      00A8C6 CD A7 E4         [ 4]  271 	call	_write_byte_address
                                    272 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 328: }
      00A8C9 5B 07            [ 2]  273 	addw	sp, #7
      00A8CB 81               [ 4]  274 	ret
                                    275 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 336: void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
                                    276 ;	-----------------------------------------
                                    277 ;	 function FLASH_ProgramOptionByte
                                    278 ;	-----------------------------------------
      00A8CC                        279 _FLASH_ProgramOptionByte:
                                    280 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 342: FLASH->CR2 |= FLASH_CR2_OPT;
      00A8CC 72 1E 50 5B      [ 1]  281 	bset	20571, #7
                                    282 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 343: FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
      00A8D0 C6 50 5C         [ 1]  283 	ld	a, 0x505c
      00A8D3 A4 7F            [ 1]  284 	and	a, #0x7f
      00A8D5 C7 50 5C         [ 1]  285 	ld	0x505c, a
                                    286 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 349: *((NEAR uint8_t*)Address) = Data;
      00A8D8 1E 03            [ 2]  287 	ldw	x, (0x03, sp)
                                    288 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 346: if(Address == 0x4800)
      00A8DA 89               [ 2]  289 	pushw	x
      00A8DB 1E 05            [ 2]  290 	ldw	x, (0x05, sp)
      00A8DD A3 48 00         [ 2]  291 	cpw	x, #0x4800
      00A8E0 85               [ 2]  292 	popw	x
      00A8E1 26 05            [ 1]  293 	jrne	00102$
                                    294 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 349: *((NEAR uint8_t*)Address) = Data;
      00A8E3 7B 05            [ 1]  295 	ld	a, (0x05, sp)
      00A8E5 F7               [ 1]  296 	ld	(x), a
      00A8E6 20 0A            [ 2]  297 	jra	00103$
      00A8E8                        298 00102$:
                                    299 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 354: *((NEAR uint8_t*)Address) = Data;
      00A8E8 7B 05            [ 1]  300 	ld	a, (0x05, sp)
      00A8EA F7               [ 1]  301 	ld	(x), a
                                    302 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 355: *((NEAR uint8_t*)((uint16_t)(Address + 1))) = (uint8_t)(~Data);
      00A8EB 1E 03            [ 2]  303 	ldw	x, (0x03, sp)
      00A8ED 5C               [ 1]  304 	incw	x
      00A8EE 7B 05            [ 1]  305 	ld	a, (0x05, sp)
      00A8F0 43               [ 1]  306 	cpl	a
      00A8F1 F7               [ 1]  307 	ld	(x), a
      00A8F2                        308 00103$:
                                    309 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 357: FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
      00A8F2 4B FD            [ 1]  310 	push	#0xfd
      00A8F4 CD A9 CE         [ 4]  311 	call	_FLASH_WaitForLastOperation
      00A8F7 84               [ 1]  312 	pop	a
                                    313 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 360: FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
      00A8F8 72 1F 50 5B      [ 1]  314 	bres	20571, #7
                                    315 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 361: FLASH->NCR2 |= FLASH_NCR2_NOPT;
      00A8FC 72 1E 50 5C      [ 1]  316 	bset	20572, #7
                                    317 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 362: }
      00A900 81               [ 4]  318 	ret
                                    319 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 369: void FLASH_EraseOptionByte(uint16_t Address)
                                    320 ;	-----------------------------------------
                                    321 ;	 function FLASH_EraseOptionByte
                                    322 ;	-----------------------------------------
      00A901                        323 _FLASH_EraseOptionByte:
                                    324 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 375: FLASH->CR2 |= FLASH_CR2_OPT;
      00A901 72 1E 50 5B      [ 1]  325 	bset	20571, #7
                                    326 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 376: FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
      00A905 C6 50 5C         [ 1]  327 	ld	a, 0x505c
      00A908 A4 7F            [ 1]  328 	and	a, #0x7f
      00A90A C7 50 5C         [ 1]  329 	ld	0x505c, a
                                    330 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 382: *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
      00A90D 16 03            [ 2]  331 	ldw	y, (0x03, sp)
                                    332 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 379: if(Address == 0x4800)
      00A90F 1E 03            [ 2]  333 	ldw	x, (0x03, sp)
      00A911 A3 48 00         [ 2]  334 	cpw	x, #0x4800
      00A914 26 04            [ 1]  335 	jrne	00102$
                                    336 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 382: *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
      00A916 90 7F            [ 1]  337 	clr	(y)
      00A918 20 08            [ 2]  338 	jra	00103$
      00A91A                        339 00102$:
                                    340 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 387: *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
      00A91A 90 7F            [ 1]  341 	clr	(y)
                                    342 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 388: *((NEAR uint8_t*)((uint16_t)(Address + (uint16_t)1 ))) = FLASH_SET_BYTE;
      00A91C 1E 03            [ 2]  343 	ldw	x, (0x03, sp)
      00A91E 5C               [ 1]  344 	incw	x
      00A91F A6 FF            [ 1]  345 	ld	a, #0xff
      00A921 F7               [ 1]  346 	ld	(x), a
      00A922                        347 00103$:
                                    348 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 390: FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
      00A922 4B FD            [ 1]  349 	push	#0xfd
      00A924 CD A9 CE         [ 4]  350 	call	_FLASH_WaitForLastOperation
      00A927 84               [ 1]  351 	pop	a
                                    352 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 393: FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
      00A928 72 1F 50 5B      [ 1]  353 	bres	20571, #7
                                    354 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 394: FLASH->NCR2 |= FLASH_NCR2_NOPT;
      00A92C 72 1E 50 5C      [ 1]  355 	bset	20572, #7
                                    356 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 395: }
      00A930 81               [ 4]  357 	ret
                                    358 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 402: uint16_t FLASH_ReadOptionByte(uint16_t Address)
                                    359 ;	-----------------------------------------
                                    360 ;	 function FLASH_ReadOptionByte
                                    361 ;	-----------------------------------------
      00A931                        362 _FLASH_ReadOptionByte:
      00A931 52 07            [ 2]  363 	sub	sp, #7
                                    364 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 410: value_optbyte = *((NEAR uint8_t*)Address); /* Read option byte */
      00A933 1E 0A            [ 2]  365 	ldw	x, (0x0a, sp)
      00A935 F6               [ 1]  366 	ld	a, (x)
      00A936 6B 03            [ 1]  367 	ld	(0x03, sp), a
                                    368 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 411: value_optbyte_complement = *(((NEAR uint8_t*)Address) + 1); /* Read option byte complement */
      00A938 E6 01            [ 1]  369 	ld	a, (0x1, x)
      00A93A 6B 02            [ 1]  370 	ld	(0x02, sp), a
                                    371 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 416: res_value =	 value_optbyte;
      00A93C 90 5F            [ 1]  372 	clrw	y
      00A93E 7B 03            [ 1]  373 	ld	a, (0x03, sp)
      00A940 90 97            [ 1]  374 	ld	yl, a
                                    375 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 414: if(Address == 0x4800)	 
      00A942 1E 0A            [ 2]  376 	ldw	x, (0x0a, sp)
      00A944 A3 48 00         [ 2]  377 	cpw	x, #0x4800
      00A947 26 03            [ 1]  378 	jrne	00105$
                                    379 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 416: res_value =	 value_optbyte;
      00A949 93               [ 1]  380 	ldw	x, y
      00A94A 20 1E            [ 2]  381 	jra	00106$
      00A94C                        382 00105$:
                                    383 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 420: if(value_optbyte == (uint8_t)(~value_optbyte_complement))
      00A94C 7B 02            [ 1]  384 	ld	a, (0x02, sp)
      00A94E 43               [ 1]  385 	cpl	a
      00A94F 6B 01            [ 1]  386 	ld	(0x01, sp), a
      00A951 7B 03            [ 1]  387 	ld	a, (0x03, sp)
      00A953 11 01            [ 1]  388 	cp	a, (0x01, sp)
      00A955 26 10            [ 1]  389 	jrne	00102$
                                    390 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 422: res_value = (uint16_t)((uint16_t)value_optbyte << 8);
      00A957 4F               [ 1]  391 	clr	a
      00A958 6B 05            [ 1]  392 	ld	(0x05, sp), a
                                    393 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 423: res_value = res_value | (uint16_t)value_optbyte_complement;
      00A95A 7B 02            [ 1]  394 	ld	a, (0x02, sp)
      00A95C 0F 06            [ 1]  395 	clr	(0x06, sp)
      00A95E 1A 05            [ 1]  396 	or	a, (0x05, sp)
      00A960 97               [ 1]  397 	ld	xl, a
      00A961 90 9F            [ 1]  398 	ld	a, yl
      00A963 1A 06            [ 1]  399 	or	a, (0x06, sp)
      00A965 95               [ 1]  400 	ld	xh, a
                                    401 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 427: res_value = FLASH_OPTIONBYTE_ERROR;
      00A966 BC                     402 	.byte 0xbc
      00A967                        403 00102$:
      00A967 AE 55 55         [ 2]  404 	ldw	x, #0x5555
      00A96A                        405 00106$:
                                    406 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 430: return(res_value);
                                    407 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 431: }
      00A96A 5B 07            [ 2]  408 	addw	sp, #7
      00A96C 81               [ 4]  409 	ret
                                    410 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 439: void FLASH_SetLowPowerMode(FLASH_LPMode_TypeDef FLASH_LPMode)
                                    411 ;	-----------------------------------------
                                    412 ;	 function FLASH_SetLowPowerMode
                                    413 ;	-----------------------------------------
      00A96D                        414 _FLASH_SetLowPowerMode:
                                    415 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 445: FLASH->CR1 &= (uint8_t)(~(FLASH_CR1_HALT | FLASH_CR1_AHALT)); 
      00A96D C6 50 5A         [ 1]  416 	ld	a, 0x505a
      00A970 A4 F3            [ 1]  417 	and	a, #0xf3
      00A972 C7 50 5A         [ 1]  418 	ld	0x505a, a
                                    419 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 448: FLASH->CR1 |= (uint8_t)FLASH_LPMode; 
      00A975 C6 50 5A         [ 1]  420 	ld	a, 0x505a
      00A978 1A 03            [ 1]  421 	or	a, (0x03, sp)
      00A97A C7 50 5A         [ 1]  422 	ld	0x505a, a
                                    423 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 449: }
      00A97D 81               [ 4]  424 	ret
                                    425 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 457: void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
                                    426 ;	-----------------------------------------
                                    427 ;	 function FLASH_SetProgrammingTime
                                    428 ;	-----------------------------------------
      00A97E                        429 _FLASH_SetProgrammingTime:
                                    430 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 462: FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
      00A97E C6 50 5A         [ 1]  431 	ld	a, 0x505a
      00A981 A4 FE            [ 1]  432 	and	a, #0xfe
      00A983 C7 50 5A         [ 1]  433 	ld	0x505a, a
                                    434 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 463: FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
      00A986 C6 50 5A         [ 1]  435 	ld	a, 0x505a
      00A989 1A 03            [ 1]  436 	or	a, (0x03, sp)
      00A98B C7 50 5A         [ 1]  437 	ld	0x505a, a
                                    438 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 464: }
      00A98E 81               [ 4]  439 	ret
                                    440 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 471: FLASH_LPMode_TypeDef FLASH_GetLowPowerMode(void)
                                    441 ;	-----------------------------------------
                                    442 ;	 function FLASH_GetLowPowerMode
                                    443 ;	-----------------------------------------
      00A98F                        444 _FLASH_GetLowPowerMode:
                                    445 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 473: return((FLASH_LPMode_TypeDef)(FLASH->CR1 & (uint8_t)(FLASH_CR1_HALT | FLASH_CR1_AHALT)));
      00A98F C6 50 5A         [ 1]  446 	ld	a, 0x505a
      00A992 A4 0C            [ 1]  447 	and	a, #0x0c
                                    448 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 474: }
      00A994 81               [ 4]  449 	ret
                                    450 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 481: FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
                                    451 ;	-----------------------------------------
                                    452 ;	 function FLASH_GetProgrammingTime
                                    453 ;	-----------------------------------------
      00A995                        454 _FLASH_GetProgrammingTime:
                                    455 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 483: return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
      00A995 C6 50 5A         [ 1]  456 	ld	a, 0x505a
      00A998 A4 01            [ 1]  457 	and	a, #0x01
                                    458 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 484: }
      00A99A 81               [ 4]  459 	ret
                                    460 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 491: uint32_t FLASH_GetBootSize(void)
                                    461 ;	-----------------------------------------
                                    462 ;	 function FLASH_GetBootSize
                                    463 ;	-----------------------------------------
      00A99B                        464 _FLASH_GetBootSize:
      00A99B 52 04            [ 2]  465 	sub	sp, #4
                                    466 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 496: temp = (uint32_t)((uint32_t)FLASH->FPR * (uint32_t)512);
      00A99D C6 50 5D         [ 1]  467 	ld	a, 0x505d
      00A9A0 5F               [ 1]  468 	clrw	x
      00A9A1 0F 04            [ 1]  469 	clr	(0x04, sp)
      00A9A3 08 04            [ 1]  470 	sll	(0x04, sp)
      00A9A5 49               [ 1]  471 	rlc	a
      00A9A6 59               [ 2]  472 	rlcw	x
      00A9A7 90 95            [ 1]  473 	ld	yh, a
      00A9A9 7B 04            [ 1]  474 	ld	a, (0x04, sp)
      00A9AB 90 97            [ 1]  475 	ld	yl, a
                                    476 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 499: if(FLASH->FPR == 0xFF)
      00A9AD C6 50 5D         [ 1]  477 	ld	a, 0x505d
      00A9B0 4C               [ 1]  478 	inc	a
      00A9B1 26 0B            [ 1]  479 	jrne	00102$
                                    480 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 501: temp += 512;
      00A9B3 72 A9 02 00      [ 2]  481 	addw	y, #0x0200
      00A9B7 9F               [ 1]  482 	ld	a, xl
      00A9B8 A9 00            [ 1]  483 	adc	a, #0x00
      00A9BA 02               [ 1]  484 	rlwa	x
      00A9BB A9 00            [ 1]  485 	adc	a, #0x00
      00A9BD 95               [ 1]  486 	ld	xh, a
      00A9BE                        487 00102$:
                                    488 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 505: return(temp);
      00A9BE 51               [ 1]  489 	exgw	x, y
                                    490 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 506: }
      00A9BF 5B 04            [ 2]  491 	addw	sp, #4
      00A9C1 81               [ 4]  492 	ret
                                    493 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 516: FlagStatus FLASH_GetFlagStatus(FLASH_Flag_TypeDef FLASH_FLAG)
                                    494 ;	-----------------------------------------
                                    495 ;	 function FLASH_GetFlagStatus
                                    496 ;	-----------------------------------------
      00A9C2                        497 _FLASH_GetFlagStatus:
                                    498 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 523: if((FLASH->IAPSR & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
      00A9C2 C6 50 5F         [ 1]  499 	ld	a, 0x505f
      00A9C5 14 03            [ 1]  500 	and	a, (0x03, sp)
      00A9C7 27 03            [ 1]  501 	jreq	00102$
                                    502 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 525: status = SET; /* FLASH_FLAG is set */
      00A9C9 A6 01            [ 1]  503 	ld	a, #0x01
      00A9CB 81               [ 4]  504 	ret
      00A9CC                        505 00102$:
                                    506 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 529: status = RESET; /* FLASH_FLAG is reset*/
      00A9CC 4F               [ 1]  507 	clr	a
                                    508 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 533: return status;
                                    509 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 534: }
      00A9CD 81               [ 4]  510 	ret
                                    511 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 648: IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType)) 
                                    512 ;	-----------------------------------------
                                    513 ;	 function FLASH_WaitForLastOperation
                                    514 ;	-----------------------------------------
      00A9CE                        515 _FLASH_WaitForLastOperation:
                                    516 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 650: uint8_t flagstatus = 0x00;
      00A9CE 4F               [ 1]  517 	clr	a
                                    518 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 656: if(FLASH_MemType == FLASH_MEMTYPE_PROG)
      00A9CF 88               [ 1]  519 	push	a
      00A9D0 7B 04            [ 1]  520 	ld	a, (0x04, sp)
      00A9D2 A1 FD            [ 1]  521 	cp	a, #0xfd
      00A9D4 84               [ 1]  522 	pop	a
      00A9D5 26 10            [ 1]  523 	jrne	00121$
                                    524 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 658: while((flagstatus == 0x00) && (timeout != 0x00))
      00A9D7 5F               [ 1]  525 	clrw	x
      00A9D8 5A               [ 2]  526 	decw	x
      00A9D9                        527 00102$:
      00A9D9 4D               [ 1]  528 	tnz	a
      00A9DA 26 1B            [ 1]  529 	jrne	00111$
      00A9DC 5D               [ 2]  530 	tnzw	x
      00A9DD 27 18            [ 1]  531 	jreq	00111$
                                    532 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 660: flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_EOP |
      00A9DF C6 50 5F         [ 1]  533 	ld	a, 0x505f
      00A9E2 A4 05            [ 1]  534 	and	a, #0x05
                                    535 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 662: timeout--;
      00A9E4 5A               [ 2]  536 	decw	x
      00A9E5 20 F2            [ 2]  537 	jra	00102$
                                    538 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 667: while((flagstatus == 0x00) && (timeout != 0x00))
      00A9E7                        539 00121$:
      00A9E7 5F               [ 1]  540 	clrw	x
      00A9E8 5A               [ 2]  541 	decw	x
      00A9E9                        542 00106$:
      00A9E9 4D               [ 1]  543 	tnz	a
      00A9EA 26 0B            [ 1]  544 	jrne	00124$
      00A9EC 5D               [ 2]  545 	tnzw	x
      00A9ED 27 08            [ 1]  546 	jreq	00124$
                                    547 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 669: flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_HVOFF |
      00A9EF C6 50 5F         [ 1]  548 	ld	a, 0x505f
      00A9F2 A4 41            [ 1]  549 	and	a, #0x41
                                    550 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 671: timeout--;
      00A9F4 5A               [ 2]  551 	decw	x
      00A9F5 20 F2            [ 2]  552 	jra	00106$
                                    553 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 687: return((FLASH_Status_TypeDef)flagstatus);
                                    554 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 671: timeout--;
      00A9F7                        555 00124$:
      00A9F7                        556 00111$:
                                    557 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 682: if(timeout == 0x00 )
      00A9F7 5D               [ 2]  558 	tnzw	x
      00A9F8 27 01            [ 1]  559 	jreq	00164$
      00A9FA 81               [ 4]  560 	ret
      00A9FB                        561 00164$:
                                    562 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 684: flagstatus = FLASH_STATUS_TIMEOUT;
      00A9FB A6 02            [ 1]  563 	ld	a, #0x02
                                    564 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 687: return((FLASH_Status_TypeDef)flagstatus);
                                    565 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 688: }
      00A9FD 81               [ 4]  566 	ret
                                    567 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 697: IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
                                    568 ;	-----------------------------------------
                                    569 ;	 function FLASH_EraseBlock
                                    570 ;	-----------------------------------------
      00A9FE                        571 _FLASH_EraseBlock:
      00A9FE 52 06            [ 2]  572 	sub	sp, #6
                                    573 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 710: if(FLASH_MemType == FLASH_MEMTYPE_PROG)
      00AA00 7B 0B            [ 1]  574 	ld	a, (0x0b, sp)
      00AA02 A1 FD            [ 1]  575 	cp	a, #0xfd
      00AA04 26 09            [ 1]  576 	jrne	00102$
                                    577 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 713: startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
      00AA06 AE 80 00         [ 2]  578 	ldw	x, #0x8000
      00AA09 1F 03            [ 2]  579 	ldw	(0x03, sp), x
      00AA0B 0F 01            [ 1]  580 	clr	(0x01, sp)
      00AA0D 20 07            [ 2]  581 	jra	00103$
      00AA0F                        582 00102$:
                                    583 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 718: startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
      00AA0F AE 40 00         [ 2]  584 	ldw	x, #0x4000
      00AA12 1F 03            [ 2]  585 	ldw	(0x03, sp), x
      00AA14 0F 01            [ 1]  586 	clr	(0x01, sp)
      00AA16                        587 00103$:
                                    588 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 726: pwFlash = (PointerAttr uint32_t *)(MemoryAddressCast)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
      00AA16 1E 09            [ 2]  589 	ldw	x, (0x09, sp)
      00AA18 58               [ 2]  590 	sllw	x
      00AA19 58               [ 2]  591 	sllw	x
      00AA1A 58               [ 2]  592 	sllw	x
      00AA1B 58               [ 2]  593 	sllw	x
      00AA1C 58               [ 2]  594 	sllw	x
      00AA1D 58               [ 2]  595 	sllw	x
      00AA1E 58               [ 2]  596 	sllw	x
      00AA1F 1F 05            [ 2]  597 	ldw	(0x05, sp), x
      00AA21 72 FB 03         [ 2]  598 	addw	x, (0x03, sp)
                                    599 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 730: FLASH->CR2 |= FLASH_CR2_ERASE;
      00AA24 72 1A 50 5B      [ 1]  600 	bset	20571, #5
                                    601 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 731: FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NERASE);
      00AA28 72 1B 50 5C      [ 1]  602 	bres	20572, #5
                                    603 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 735: *pwFlash = (uint32_t)0;
      00AA2C 6F 03            [ 1]  604 	clr	(0x3, x)
      00AA2E 6F 02            [ 1]  605 	clr	(0x2, x)
      00AA30 6F 01            [ 1]  606 	clr	(0x1, x)
      00AA32 7F               [ 1]  607 	clr	(x)
                                    608 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 743: }
      00AA33 5B 06            [ 2]  609 	addw	sp, #6
      00AA35 81               [ 4]  610 	ret
                                    611 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 754: IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType, 
                                    612 ;	-----------------------------------------
                                    613 ;	 function FLASH_ProgramBlock
                                    614 ;	-----------------------------------------
      00AA36                        615 _FLASH_ProgramBlock:
      00AA36 52 0E            [ 2]  616 	sub	sp, #14
                                    617 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 763: if(FLASH_MemType == FLASH_MEMTYPE_PROG)
      00AA38 7B 13            [ 1]  618 	ld	a, (0x13, sp)
      00AA3A A1 FD            [ 1]  619 	cp	a, #0xfd
      00AA3C 26 09            [ 1]  620 	jrne	00102$
                                    621 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 766: startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
      00AA3E 0F 08            [ 1]  622 	clr	(0x08, sp)
      00AA40 A6 80            [ 1]  623 	ld	a, #0x80
      00AA42 5F               [ 1]  624 	clrw	x
      00AA43 1F 05            [ 2]  625 	ldw	(0x05, sp), x
      00AA45 20 07            [ 2]  626 	jra	00103$
      00AA47                        627 00102$:
                                    628 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 771: startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
      00AA47 0F 08            [ 1]  629 	clr	(0x08, sp)
      00AA49 A6 40            [ 1]  630 	ld	a, #0x40
      00AA4B 5F               [ 1]  631 	clrw	x
      00AA4C 1F 05            [ 2]  632 	ldw	(0x05, sp), x
      00AA4E                        633 00103$:
                                    634 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 775: startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
      00AA4E 16 11            [ 2]  635 	ldw	y, (0x11, sp)
      00AA50 5F               [ 1]  636 	clrw	x
      00AA51 88               [ 1]  637 	push	a
      00AA52 A6 07            [ 1]  638 	ld	a, #0x07
      00AA54                        639 00131$:
      00AA54 90 58            [ 2]  640 	sllw	y
      00AA56 59               [ 2]  641 	rlcw	x
      00AA57 4A               [ 1]  642 	dec	a
      00AA58 26 FA            [ 1]  643 	jrne	00131$
      00AA5A 17 04            [ 2]  644 	ldw	(0x04, sp), y
      00AA5C 84               [ 1]  645 	pop	a
      00AA5D 90 95            [ 1]  646 	ld	yh, a
      00AA5F 61               [ 1]  647 	exg	a, yl
      00AA60 7B 08            [ 1]  648 	ld	a, (0x08, sp)
      00AA62 61               [ 1]  649 	exg	a, yl
      00AA63 72 F9 03         [ 2]  650 	addw	y, (0x03, sp)
      00AA66 9F               [ 1]  651 	ld	a, xl
      00AA67 19 06            [ 1]  652 	adc	a, (0x06, sp)
      00AA69 02               [ 1]  653 	rlwa	x
      00AA6A 19 05            [ 1]  654 	adc	a, (0x05, sp)
      00AA6C 95               [ 1]  655 	ld	xh, a
      00AA6D 17 0B            [ 2]  656 	ldw	(0x0b, sp), y
      00AA6F 1F 09            [ 2]  657 	ldw	(0x09, sp), x
                                    658 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 781: FLASH->CR2 |= FLASH_CR2_PRG;
      00AA71 C6 50 5B         [ 1]  659 	ld	a, 0x505b
                                    660 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 778: if(FLASH_ProgMode == FLASH_PROGRAMMODE_STANDARD)
      00AA74 0D 14            [ 1]  661 	tnz	(0x14, sp)
      00AA76 26 0B            [ 1]  662 	jrne	00105$
                                    663 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 781: FLASH->CR2 |= FLASH_CR2_PRG;
      00AA78 AA 01            [ 1]  664 	or	a, #0x01
      00AA7A C7 50 5B         [ 1]  665 	ld	0x505b, a
                                    666 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 782: FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NPRG);
      00AA7D 72 11 50 5C      [ 1]  667 	bres	20572, #0
      00AA81 20 09            [ 2]  668 	jra	00114$
      00AA83                        669 00105$:
                                    670 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 787: FLASH->CR2 |= FLASH_CR2_FPRG;
      00AA83 AA 10            [ 1]  671 	or	a, #0x10
      00AA85 C7 50 5B         [ 1]  672 	ld	0x505b, a
                                    673 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 788: FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NFPRG);
      00AA88 72 19 50 5C      [ 1]  674 	bres	20572, #4
                                    675 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 792: for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
      00AA8C                        676 00114$:
      00AA8C 5F               [ 1]  677 	clrw	x
      00AA8D 1F 0D            [ 2]  678 	ldw	(0x0d, sp), x
      00AA8F                        679 00108$:
                                    680 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 797: write_byte_address(startaddress + Count, ((uint8_t)(Buffer[Count])));    // SDCC patch: required for far pointers
      00AA8F 1E 15            [ 2]  681 	ldw	x, (0x15, sp)
      00AA91 72 FB 0D         [ 2]  682 	addw	x, (0x0d, sp)
      00AA94 F6               [ 1]  683 	ld	a, (x)
      00AA95 1E 0B            [ 2]  684 	ldw	x, (0x0b, sp)
      00AA97 72 FB 0D         [ 2]  685 	addw	x, (0x0d, sp)
      00AA9A 88               [ 1]  686 	push	a
      00AA9B 89               [ 2]  687 	pushw	x
      00AA9C CD A7 E4         [ 4]  688 	call	_write_byte_address
      00AA9F 5B 03            [ 2]  689 	addw	sp, #3
                                    690 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 792: for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
      00AAA1 1E 0D            [ 2]  691 	ldw	x, (0x0d, sp)
      00AAA3 5C               [ 1]  692 	incw	x
      00AAA4 1F 0D            [ 2]  693 	ldw	(0x0d, sp), x
      00AAA6 A3 00 80         [ 2]  694 	cpw	x, #0x0080
      00AAA9 25 E4            [ 1]  695 	jrc	00108$
                                    696 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_flash.c: 800: }
      00AAAB 5B 0E            [ 2]  697 	addw	sp, #14
      00AAAD 81               [ 4]  698 	ret
                                    699 	.area CODE
                                    700 	.area CONST
                                    701 	.area INITIALIZER
                                    702 	.area CABS (ABS)
