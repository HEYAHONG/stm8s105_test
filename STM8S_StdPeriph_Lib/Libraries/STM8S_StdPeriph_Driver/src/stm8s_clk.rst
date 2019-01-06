                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.8.0 #10562 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_clk
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _HSIDivFactor
                                     12 	.globl _CLK_DeInit
                                     13 	.globl _CLK_FastHaltWakeUpCmd
                                     14 	.globl _CLK_HSECmd
                                     15 	.globl _CLK_HSICmd
                                     16 	.globl _CLK_LSICmd
                                     17 	.globl _CLK_CCOCmd
                                     18 	.globl _CLK_ClockSwitchCmd
                                     19 	.globl _CLK_SlowActiveHaltWakeUpCmd
                                     20 	.globl _CLK_PeripheralClockConfig
                                     21 	.globl _CLK_ClockSwitchConfig
                                     22 	.globl _CLK_HSIPrescalerConfig
                                     23 	.globl _CLK_CCOConfig
                                     24 	.globl _CLK_ITConfig
                                     25 	.globl _CLK_SYSCLKConfig
                                     26 	.globl _CLK_SWIMConfig
                                     27 	.globl _CLK_ClockSecuritySystemEnable
                                     28 	.globl _CLK_GetSYSCLKSource
                                     29 	.globl _CLK_GetClockFreq
                                     30 	.globl _CLK_AdjustHSICalibrationValue
                                     31 	.globl _CLK_SYSCLKEmergencyClear
                                     32 	.globl _CLK_GetFlagStatus
                                     33 	.globl _CLK_GetITStatus
                                     34 	.globl _CLK_ClearITPendingBit
                                     35 ;--------------------------------------------------------
                                     36 ; ram data
                                     37 ;--------------------------------------------------------
                                     38 	.area DATA
                                     39 ;--------------------------------------------------------
                                     40 ; ram data
                                     41 ;--------------------------------------------------------
                                     42 	.area INITIALIZED
                                     43 ;--------------------------------------------------------
                                     44 ; absolute external ram data
                                     45 ;--------------------------------------------------------
                                     46 	.area DABS (ABS)
                                     47 
                                     48 ; default segment ordering for linker
                                     49 	.area HOME
                                     50 	.area GSINIT
                                     51 	.area GSFINAL
                                     52 	.area CONST
                                     53 	.area INITIALIZER
                                     54 	.area CODE
                                     55 
                                     56 ;--------------------------------------------------------
                                     57 ; global & static initialisations
                                     58 ;--------------------------------------------------------
                                     59 	.area HOME
                                     60 	.area GSINIT
                                     61 	.area GSFINAL
                                     62 	.area GSINIT
                                     63 ;--------------------------------------------------------
                                     64 ; Home
                                     65 ;--------------------------------------------------------
                                     66 	.area HOME
                                     67 	.area HOME
                                     68 ;--------------------------------------------------------
                                     69 ; code
                                     70 ;--------------------------------------------------------
                                     71 	.area CODE
                                     72 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 72: void CLK_DeInit(void)
                                     73 ;	-----------------------------------------
                                     74 ;	 function CLK_DeInit
                                     75 ;	-----------------------------------------
      009EB0                         76 _CLK_DeInit:
                                     77 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 74: CLK->ICKR = CLK_ICKR_RESET_VALUE;
      009EB0 35 01 50 C0      [ 1]   78 	mov	0x50c0+0, #0x01
                                     79 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 75: CLK->ECKR = CLK_ECKR_RESET_VALUE;
      009EB4 35 00 50 C1      [ 1]   80 	mov	0x50c1+0, #0x00
                                     81 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 76: CLK->SWR  = CLK_SWR_RESET_VALUE;
      009EB8 35 E1 50 C4      [ 1]   82 	mov	0x50c4+0, #0xe1
                                     83 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 77: CLK->SWCR = CLK_SWCR_RESET_VALUE;
      009EBC 35 00 50 C5      [ 1]   84 	mov	0x50c5+0, #0x00
                                     85 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 78: CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
      009EC0 35 18 50 C6      [ 1]   86 	mov	0x50c6+0, #0x18
                                     87 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 79: CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
      009EC4 35 FF 50 C7      [ 1]   88 	mov	0x50c7+0, #0xff
                                     89 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 80: CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
      009EC8 35 FF 50 CA      [ 1]   90 	mov	0x50ca+0, #0xff
                                     91 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 81: CLK->CSSR = CLK_CSSR_RESET_VALUE;
      009ECC 35 00 50 C8      [ 1]   92 	mov	0x50c8+0, #0x00
                                     93 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 82: CLK->CCOR = CLK_CCOR_RESET_VALUE;
      009ED0 35 00 50 C9      [ 1]   94 	mov	0x50c9+0, #0x00
                                     95 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 83: while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
      009ED4                         96 00101$:
      009ED4 C6 50 C9         [ 1]   97 	ld	a, 0x50c9
      009ED7 44               [ 1]   98 	srl	a
      009ED8 25 FA            [ 1]   99 	jrc	00101$
                                    100 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 85: CLK->CCOR = CLK_CCOR_RESET_VALUE;
      009EDA 35 00 50 C9      [ 1]  101 	mov	0x50c9+0, #0x00
                                    102 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 86: CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
      009EDE 35 00 50 CC      [ 1]  103 	mov	0x50cc+0, #0x00
                                    104 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 87: CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
      009EE2 35 00 50 CD      [ 1]  105 	mov	0x50cd+0, #0x00
                                    106 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 88: }
      009EE6 81               [ 4]  107 	ret
                                    108 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 99: void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
                                    109 ;	-----------------------------------------
                                    110 ;	 function CLK_FastHaltWakeUpCmd
                                    111 ;	-----------------------------------------
      009EE7                        112 _CLK_FastHaltWakeUpCmd:
                                    113 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 107: CLK->ICKR |= CLK_ICKR_FHWU;
      009EE7 C6 50 C0         [ 1]  114 	ld	a, 0x50c0
                                    115 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 104: if (NewState != DISABLE)
      009EEA 0D 03            [ 1]  116 	tnz	(0x03, sp)
      009EEC 27 06            [ 1]  117 	jreq	00102$
                                    118 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 107: CLK->ICKR |= CLK_ICKR_FHWU;
      009EEE AA 04            [ 1]  119 	or	a, #0x04
      009EF0 C7 50 C0         [ 1]  120 	ld	0x50c0, a
      009EF3 81               [ 4]  121 	ret
      009EF4                        122 00102$:
                                    123 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 112: CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
      009EF4 A4 FB            [ 1]  124 	and	a, #0xfb
      009EF6 C7 50 C0         [ 1]  125 	ld	0x50c0, a
                                    126 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 114: }
      009EF9 81               [ 4]  127 	ret
                                    128 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 121: void CLK_HSECmd(FunctionalState NewState)
                                    129 ;	-----------------------------------------
                                    130 ;	 function CLK_HSECmd
                                    131 ;	-----------------------------------------
      009EFA                        132 _CLK_HSECmd:
                                    133 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 129: CLK->ECKR |= CLK_ECKR_HSEEN;
      009EFA C6 50 C1         [ 1]  134 	ld	a, 0x50c1
                                    135 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 126: if (NewState != DISABLE)
      009EFD 0D 03            [ 1]  136 	tnz	(0x03, sp)
      009EFF 27 06            [ 1]  137 	jreq	00102$
                                    138 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 129: CLK->ECKR |= CLK_ECKR_HSEEN;
      009F01 AA 01            [ 1]  139 	or	a, #0x01
      009F03 C7 50 C1         [ 1]  140 	ld	0x50c1, a
      009F06 81               [ 4]  141 	ret
      009F07                        142 00102$:
                                    143 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 134: CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
      009F07 A4 FE            [ 1]  144 	and	a, #0xfe
      009F09 C7 50 C1         [ 1]  145 	ld	0x50c1, a
                                    146 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 136: }
      009F0C 81               [ 4]  147 	ret
                                    148 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 143: void CLK_HSICmd(FunctionalState NewState)
                                    149 ;	-----------------------------------------
                                    150 ;	 function CLK_HSICmd
                                    151 ;	-----------------------------------------
      009F0D                        152 _CLK_HSICmd:
                                    153 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 151: CLK->ICKR |= CLK_ICKR_HSIEN;
      009F0D C6 50 C0         [ 1]  154 	ld	a, 0x50c0
                                    155 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 148: if (NewState != DISABLE)
      009F10 0D 03            [ 1]  156 	tnz	(0x03, sp)
      009F12 27 06            [ 1]  157 	jreq	00102$
                                    158 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 151: CLK->ICKR |= CLK_ICKR_HSIEN;
      009F14 AA 01            [ 1]  159 	or	a, #0x01
      009F16 C7 50 C0         [ 1]  160 	ld	0x50c0, a
      009F19 81               [ 4]  161 	ret
      009F1A                        162 00102$:
                                    163 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 156: CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
      009F1A A4 FE            [ 1]  164 	and	a, #0xfe
      009F1C C7 50 C0         [ 1]  165 	ld	0x50c0, a
                                    166 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 158: }
      009F1F 81               [ 4]  167 	ret
                                    168 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 166: void CLK_LSICmd(FunctionalState NewState)
                                    169 ;	-----------------------------------------
                                    170 ;	 function CLK_LSICmd
                                    171 ;	-----------------------------------------
      009F20                        172 _CLK_LSICmd:
                                    173 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 174: CLK->ICKR |= CLK_ICKR_LSIEN;
      009F20 C6 50 C0         [ 1]  174 	ld	a, 0x50c0
                                    175 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 171: if (NewState != DISABLE)
      009F23 0D 03            [ 1]  176 	tnz	(0x03, sp)
      009F25 27 06            [ 1]  177 	jreq	00102$
                                    178 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 174: CLK->ICKR |= CLK_ICKR_LSIEN;
      009F27 AA 08            [ 1]  179 	or	a, #0x08
      009F29 C7 50 C0         [ 1]  180 	ld	0x50c0, a
      009F2C 81               [ 4]  181 	ret
      009F2D                        182 00102$:
                                    183 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 179: CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
      009F2D A4 F7            [ 1]  184 	and	a, #0xf7
      009F2F C7 50 C0         [ 1]  185 	ld	0x50c0, a
                                    186 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 181: }
      009F32 81               [ 4]  187 	ret
                                    188 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 189: void CLK_CCOCmd(FunctionalState NewState)
                                    189 ;	-----------------------------------------
                                    190 ;	 function CLK_CCOCmd
                                    191 ;	-----------------------------------------
      009F33                        192 _CLK_CCOCmd:
                                    193 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 197: CLK->CCOR |= CLK_CCOR_CCOEN;
      009F33 C6 50 C9         [ 1]  194 	ld	a, 0x50c9
                                    195 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 194: if (NewState != DISABLE)
      009F36 0D 03            [ 1]  196 	tnz	(0x03, sp)
      009F38 27 06            [ 1]  197 	jreq	00102$
                                    198 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 197: CLK->CCOR |= CLK_CCOR_CCOEN;
      009F3A AA 01            [ 1]  199 	or	a, #0x01
      009F3C C7 50 C9         [ 1]  200 	ld	0x50c9, a
      009F3F 81               [ 4]  201 	ret
      009F40                        202 00102$:
                                    203 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 202: CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
      009F40 A4 FE            [ 1]  204 	and	a, #0xfe
      009F42 C7 50 C9         [ 1]  205 	ld	0x50c9, a
                                    206 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 204: }
      009F45 81               [ 4]  207 	ret
                                    208 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 213: void CLK_ClockSwitchCmd(FunctionalState NewState)
                                    209 ;	-----------------------------------------
                                    210 ;	 function CLK_ClockSwitchCmd
                                    211 ;	-----------------------------------------
      009F46                        212 _CLK_ClockSwitchCmd:
                                    213 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 221: CLK->SWCR |= CLK_SWCR_SWEN;
      009F46 C6 50 C5         [ 1]  214 	ld	a, 0x50c5
                                    215 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 218: if (NewState != DISABLE )
      009F49 0D 03            [ 1]  216 	tnz	(0x03, sp)
      009F4B 27 06            [ 1]  217 	jreq	00102$
                                    218 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 221: CLK->SWCR |= CLK_SWCR_SWEN;
      009F4D AA 02            [ 1]  219 	or	a, #0x02
      009F4F C7 50 C5         [ 1]  220 	ld	0x50c5, a
      009F52 81               [ 4]  221 	ret
      009F53                        222 00102$:
                                    223 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 226: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
      009F53 A4 FD            [ 1]  224 	and	a, #0xfd
      009F55 C7 50 C5         [ 1]  225 	ld	0x50c5, a
                                    226 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 228: }
      009F58 81               [ 4]  227 	ret
                                    228 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 238: void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
                                    229 ;	-----------------------------------------
                                    230 ;	 function CLK_SlowActiveHaltWakeUpCmd
                                    231 ;	-----------------------------------------
      009F59                        232 _CLK_SlowActiveHaltWakeUpCmd:
                                    233 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 246: CLK->ICKR |= CLK_ICKR_SWUAH;
      009F59 C6 50 C0         [ 1]  234 	ld	a, 0x50c0
                                    235 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 243: if (NewState != DISABLE)
      009F5C 0D 03            [ 1]  236 	tnz	(0x03, sp)
      009F5E 27 06            [ 1]  237 	jreq	00102$
                                    238 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 246: CLK->ICKR |= CLK_ICKR_SWUAH;
      009F60 AA 20            [ 1]  239 	or	a, #0x20
      009F62 C7 50 C0         [ 1]  240 	ld	0x50c0, a
      009F65 81               [ 4]  241 	ret
      009F66                        242 00102$:
                                    243 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 251: CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
      009F66 A4 DF            [ 1]  244 	and	a, #0xdf
      009F68 C7 50 C0         [ 1]  245 	ld	0x50c0, a
                                    246 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 253: }
      009F6B 81               [ 4]  247 	ret
                                    248 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 263: void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
                                    249 ;	-----------------------------------------
                                    250 ;	 function CLK_PeripheralClockConfig
                                    251 ;	-----------------------------------------
      009F6C                        252 _CLK_PeripheralClockConfig:
      009F6C 52 02            [ 2]  253 	sub	sp, #2
                                    254 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 274: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      009F6E 7B 05            [ 1]  255 	ld	a, (0x05, sp)
      009F70 A4 0F            [ 1]  256 	and	a, #0x0f
      009F72 88               [ 1]  257 	push	a
      009F73 A6 01            [ 1]  258 	ld	a, #0x01
      009F75 6B 03            [ 1]  259 	ld	(0x03, sp), a
      009F77 84               [ 1]  260 	pop	a
      009F78 4D               [ 1]  261 	tnz	a
      009F79 27 05            [ 1]  262 	jreq	00128$
      009F7B                        263 00127$:
      009F7B 08 02            [ 1]  264 	sll	(0x02, sp)
      009F7D 4A               [ 1]  265 	dec	a
      009F7E 26 FB            [ 1]  266 	jrne	00127$
      009F80                        267 00128$:
                                    268 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 279: CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      009F80 7B 02            [ 1]  269 	ld	a, (0x02, sp)
      009F82 43               [ 1]  270 	cpl	a
      009F83 6B 01            [ 1]  271 	ld	(0x01, sp), a
                                    272 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 269: if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
      009F85 7B 05            [ 1]  273 	ld	a, (0x05, sp)
      009F87 A5 10            [ 1]  274 	bcp	a, #0x10
      009F89 26 15            [ 1]  275 	jrne	00108$
                                    276 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 274: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      009F8B C6 50 C7         [ 1]  277 	ld	a, 0x50c7
                                    278 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 271: if (NewState != DISABLE)
      009F8E 0D 06            [ 1]  279 	tnz	(0x06, sp)
      009F90 27 07            [ 1]  280 	jreq	00102$
                                    281 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 274: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      009F92 1A 02            [ 1]  282 	or	a, (0x02, sp)
      009F94 C7 50 C7         [ 1]  283 	ld	0x50c7, a
      009F97 20 1A            [ 2]  284 	jra	00110$
      009F99                        285 00102$:
                                    286 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 279: CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      009F99 14 01            [ 1]  287 	and	a, (0x01, sp)
      009F9B C7 50 C7         [ 1]  288 	ld	0x50c7, a
      009F9E 20 13            [ 2]  289 	jra	00110$
      009FA0                        290 00108$:
                                    291 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 287: CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      009FA0 C6 50 CA         [ 1]  292 	ld	a, 0x50ca
                                    293 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 284: if (NewState != DISABLE)
      009FA3 0D 06            [ 1]  294 	tnz	(0x06, sp)
      009FA5 27 07            [ 1]  295 	jreq	00105$
                                    296 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 287: CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      009FA7 1A 02            [ 1]  297 	or	a, (0x02, sp)
      009FA9 C7 50 CA         [ 1]  298 	ld	0x50ca, a
      009FAC 20 05            [ 2]  299 	jra	00110$
      009FAE                        300 00105$:
                                    301 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 292: CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      009FAE 14 01            [ 1]  302 	and	a, (0x01, sp)
      009FB0 C7 50 CA         [ 1]  303 	ld	0x50ca, a
      009FB3                        304 00110$:
                                    305 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 295: }
      009FB3 5B 02            [ 2]  306 	addw	sp, #2
      009FB5 81               [ 4]  307 	ret
                                    308 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 309: ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
                                    309 ;	-----------------------------------------
                                    310 ;	 function CLK_ClockSwitchConfig
                                    311 ;	-----------------------------------------
      009FB6                        312 _CLK_ClockSwitchConfig:
                                    313 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 322: clock_master = (CLK_Source_TypeDef)CLK->CMSR;
      009FB6 C6 50 C3         [ 1]  314 	ld	a, 0x50c3
      009FB9 90 97            [ 1]  315 	ld	yl, a
                                    316 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 328: CLK->SWCR |= CLK_SWCR_SWEN;
      009FBB C6 50 C5         [ 1]  317 	ld	a, 0x50c5
                                    318 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 325: if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
      009FBE 88               [ 1]  319 	push	a
      009FBF 7B 04            [ 1]  320 	ld	a, (0x04, sp)
      009FC1 4A               [ 1]  321 	dec	a
      009FC2 84               [ 1]  322 	pop	a
      009FC3 26 38            [ 1]  323 	jrne	00122$
                                    324 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 328: CLK->SWCR |= CLK_SWCR_SWEN;
      009FC5 AA 02            [ 1]  325 	or	a, #0x02
      009FC7 C7 50 C5         [ 1]  326 	ld	0x50c5, a
      009FCA C6 50 C5         [ 1]  327 	ld	a, 0x50c5
                                    328 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 331: if (ITState != DISABLE)
      009FCD 0D 05            [ 1]  329 	tnz	(0x05, sp)
      009FCF 27 07            [ 1]  330 	jreq	00102$
                                    331 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 333: CLK->SWCR |= CLK_SWCR_SWIEN;
      009FD1 AA 04            [ 1]  332 	or	a, #0x04
      009FD3 C7 50 C5         [ 1]  333 	ld	0x50c5, a
      009FD6 20 05            [ 2]  334 	jra	00103$
      009FD8                        335 00102$:
                                    336 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 337: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
      009FD8 A4 FB            [ 1]  337 	and	a, #0xfb
      009FDA C7 50 C5         [ 1]  338 	ld	0x50c5, a
      009FDD                        339 00103$:
                                    340 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 341: CLK->SWR = (uint8_t)CLK_NewClock;
      009FDD AE 50 C4         [ 2]  341 	ldw	x, #0x50c4
      009FE0 7B 04            [ 1]  342 	ld	a, (0x04, sp)
      009FE2 F7               [ 1]  343 	ld	(x), a
                                    344 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 344: while((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
      009FE3 5F               [ 1]  345 	clrw	x
      009FE4 5A               [ 2]  346 	decw	x
      009FE5                        347 00105$:
      009FE5 C6 50 C5         [ 1]  348 	ld	a, 0x50c5
      009FE8 44               [ 1]  349 	srl	a
      009FE9 24 06            [ 1]  350 	jrnc	00107$
      009FEB 5D               [ 2]  351 	tnzw	x
      009FEC 27 03            [ 1]  352 	jreq	00107$
                                    353 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 346: DownCounter--;
      009FEE 5A               [ 2]  354 	decw	x
      009FEF 20 F4            [ 2]  355 	jra	00105$
      009FF1                        356 00107$:
                                    357 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 349: if(DownCounter != 0)
      009FF1 5D               [ 2]  358 	tnzw	x
      009FF2 27 05            [ 1]  359 	jreq	00109$
                                    360 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 351: Swif = SUCCESS;
      009FF4 A6 01            [ 1]  361 	ld	a, #0x01
      009FF6 97               [ 1]  362 	ld	xl, a
      009FF7 20 37            [ 2]  363 	jra	00123$
      009FF9                        364 00109$:
                                    365 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 355: Swif = ERROR;
      009FF9 4F               [ 1]  366 	clr	a
      009FFA 97               [ 1]  367 	ld	xl, a
      009FFB 20 33            [ 2]  368 	jra	00123$
      009FFD                        369 00122$:
                                    370 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 361: if (ITState != DISABLE)
      009FFD 0D 05            [ 1]  371 	tnz	(0x05, sp)
      009FFF 27 07            [ 1]  372 	jreq	00112$
                                    373 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 363: CLK->SWCR |= CLK_SWCR_SWIEN;
      00A001 AA 04            [ 1]  374 	or	a, #0x04
      00A003 C7 50 C5         [ 1]  375 	ld	0x50c5, a
      00A006 20 05            [ 2]  376 	jra	00113$
      00A008                        377 00112$:
                                    378 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 367: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
      00A008 A4 FB            [ 1]  379 	and	a, #0xfb
      00A00A C7 50 C5         [ 1]  380 	ld	0x50c5, a
      00A00D                        381 00113$:
                                    382 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 371: CLK->SWR = (uint8_t)CLK_NewClock;
      00A00D AE 50 C4         [ 2]  383 	ldw	x, #0x50c4
      00A010 7B 04            [ 1]  384 	ld	a, (0x04, sp)
      00A012 F7               [ 1]  385 	ld	(x), a
                                    386 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 374: while((((CLK->SWCR & CLK_SWCR_SWIF) != 0 ) && (DownCounter != 0)))
      00A013 5F               [ 1]  387 	clrw	x
      00A014 5A               [ 2]  388 	decw	x
      00A015                        389 00115$:
      00A015 C6 50 C5         [ 1]  390 	ld	a, 0x50c5
      00A018 A5 08            [ 1]  391 	bcp	a, #0x08
      00A01A 27 06            [ 1]  392 	jreq	00117$
      00A01C 5D               [ 2]  393 	tnzw	x
      00A01D 27 03            [ 1]  394 	jreq	00117$
                                    395 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 376: DownCounter--;
      00A01F 5A               [ 2]  396 	decw	x
      00A020 20 F3            [ 2]  397 	jra	00115$
      00A022                        398 00117$:
                                    399 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 379: if(DownCounter != 0)
      00A022 5D               [ 2]  400 	tnzw	x
      00A023 27 09            [ 1]  401 	jreq	00119$
                                    402 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 382: CLK->SWCR |= CLK_SWCR_SWEN;
      00A025 72 12 50 C5      [ 1]  403 	bset	20677, #1
                                    404 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 383: Swif = SUCCESS;
      00A029 A6 01            [ 1]  405 	ld	a, #0x01
      00A02B 97               [ 1]  406 	ld	xl, a
      00A02C 20 02            [ 2]  407 	jra	00123$
      00A02E                        408 00119$:
                                    409 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 387: Swif = ERROR;
      00A02E 4F               [ 1]  410 	clr	a
      00A02F 97               [ 1]  411 	ld	xl, a
      00A030                        412 00123$:
                                    413 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 390: if(Swif != ERROR)
      00A030 9F               [ 1]  414 	ld	a, xl
      00A031 4D               [ 1]  415 	tnz	a
      00A032 27 2E            [ 1]  416 	jreq	00136$
                                    417 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 393: if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
      00A034 0D 06            [ 1]  418 	tnz	(0x06, sp)
      00A036 26 0C            [ 1]  419 	jrne	00132$
      00A038 90 9F            [ 1]  420 	ld	a, yl
      00A03A A1 E1            [ 1]  421 	cp	a, #0xe1
      00A03C 26 06            [ 1]  422 	jrne	00132$
                                    423 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 395: CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
      00A03E 72 11 50 C0      [ 1]  424 	bres	20672, #0
      00A042 20 1E            [ 2]  425 	jra	00136$
      00A044                        426 00132$:
                                    427 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 397: else if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
      00A044 0D 06            [ 1]  428 	tnz	(0x06, sp)
      00A046 26 0C            [ 1]  429 	jrne	00128$
      00A048 90 9F            [ 1]  430 	ld	a, yl
      00A04A A1 D2            [ 1]  431 	cp	a, #0xd2
      00A04C 26 06            [ 1]  432 	jrne	00128$
                                    433 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 399: CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
      00A04E 72 17 50 C0      [ 1]  434 	bres	20672, #3
      00A052 20 0E            [ 2]  435 	jra	00136$
      00A054                        436 00128$:
                                    437 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 401: else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
      00A054 0D 06            [ 1]  438 	tnz	(0x06, sp)
      00A056 26 0A            [ 1]  439 	jrne	00136$
      00A058 90 9F            [ 1]  440 	ld	a, yl
      00A05A A1 B4            [ 1]  441 	cp	a, #0xb4
      00A05C 26 04            [ 1]  442 	jrne	00136$
                                    443 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 403: CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
      00A05E 72 11 50 C1      [ 1]  444 	bres	20673, #0
      00A062                        445 00136$:
                                    446 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 406: return(Swif);
      00A062 9F               [ 1]  447 	ld	a, xl
                                    448 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 407: }
      00A063 81               [ 4]  449 	ret
                                    450 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 415: void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
                                    451 ;	-----------------------------------------
                                    452 ;	 function CLK_HSIPrescalerConfig
                                    453 ;	-----------------------------------------
      00A064                        454 _CLK_HSIPrescalerConfig:
                                    455 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 421: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
      00A064 C6 50 C6         [ 1]  456 	ld	a, 0x50c6
      00A067 A4 E7            [ 1]  457 	and	a, #0xe7
      00A069 C7 50 C6         [ 1]  458 	ld	0x50c6, a
                                    459 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 424: CLK->CKDIVR |= (uint8_t)HSIPrescaler;
      00A06C C6 50 C6         [ 1]  460 	ld	a, 0x50c6
      00A06F 1A 03            [ 1]  461 	or	a, (0x03, sp)
      00A071 C7 50 C6         [ 1]  462 	ld	0x50c6, a
                                    463 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 425: }
      00A074 81               [ 4]  464 	ret
                                    465 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 436: void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
                                    466 ;	-----------------------------------------
                                    467 ;	 function CLK_CCOConfig
                                    468 ;	-----------------------------------------
      00A075                        469 _CLK_CCOConfig:
                                    470 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 442: CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
      00A075 C6 50 C9         [ 1]  471 	ld	a, 0x50c9
      00A078 A4 E1            [ 1]  472 	and	a, #0xe1
      00A07A C7 50 C9         [ 1]  473 	ld	0x50c9, a
                                    474 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 445: CLK->CCOR |= (uint8_t)CLK_CCO;
      00A07D C6 50 C9         [ 1]  475 	ld	a, 0x50c9
      00A080 1A 03            [ 1]  476 	or	a, (0x03, sp)
      00A082 C7 50 C9         [ 1]  477 	ld	0x50c9, a
                                    478 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 448: CLK->CCOR |= CLK_CCOR_CCOEN;
      00A085 72 10 50 C9      [ 1]  479 	bset	20681, #0
                                    480 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 449: }
      00A089 81               [ 4]  481 	ret
                                    482 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 459: void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
                                    483 ;	-----------------------------------------
                                    484 ;	 function CLK_ITConfig
                                    485 ;	-----------------------------------------
      00A08A                        486 _CLK_ITConfig:
      00A08A 88               [ 1]  487 	push	a
                                    488 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 467: switch (CLK_IT)
      00A08B 7B 04            [ 1]  489 	ld	a, (0x04, sp)
      00A08D A0 0C            [ 1]  490 	sub	a, #0x0c
      00A08F 26 04            [ 1]  491 	jrne	00140$
      00A091 4C               [ 1]  492 	inc	a
      00A092 6B 01            [ 1]  493 	ld	(0x01, sp), a
      00A094 C1                     494 	.byte 0xc1
      00A095                        495 00140$:
      00A095 0F 01            [ 1]  496 	clr	(0x01, sp)
      00A097                        497 00141$:
      00A097 7B 04            [ 1]  498 	ld	a, (0x04, sp)
      00A099 A0 1C            [ 1]  499 	sub	a, #0x1c
      00A09B 26 02            [ 1]  500 	jrne	00143$
      00A09D 4C               [ 1]  501 	inc	a
      00A09E 21                     502 	.byte 0x21
      00A09F                        503 00143$:
      00A09F 4F               [ 1]  504 	clr	a
      00A0A0                        505 00144$:
                                    506 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 465: if (NewState != DISABLE)
      00A0A0 0D 05            [ 1]  507 	tnz	(0x05, sp)
      00A0A2 27 13            [ 1]  508 	jreq	00110$
                                    509 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 467: switch (CLK_IT)
      00A0A4 0D 01            [ 1]  510 	tnz	(0x01, sp)
      00A0A6 26 09            [ 1]  511 	jrne	00102$
      00A0A8 4D               [ 1]  512 	tnz	a
      00A0A9 27 1D            [ 1]  513 	jreq	00112$
                                    514 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 470: CLK->SWCR |= CLK_SWCR_SWIEN;
      00A0AB 72 14 50 C5      [ 1]  515 	bset	20677, #2
                                    516 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 471: break;
      00A0AF 20 17            [ 2]  517 	jra	00112$
                                    518 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 472: case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
      00A0B1                        519 00102$:
                                    520 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 473: CLK->CSSR |= CLK_CSSR_CSSDIE;
      00A0B1 72 14 50 C8      [ 1]  521 	bset	20680, #2
                                    522 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 474: break;
      00A0B5 20 11            [ 2]  523 	jra	00112$
                                    524 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 477: }
      00A0B7                        525 00110$:
                                    526 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 481: switch (CLK_IT)
      00A0B7 0D 01            [ 1]  527 	tnz	(0x01, sp)
      00A0B9 26 09            [ 1]  528 	jrne	00106$
      00A0BB 4D               [ 1]  529 	tnz	a
      00A0BC 27 0A            [ 1]  530 	jreq	00112$
                                    531 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 484: CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
      00A0BE 72 15 50 C5      [ 1]  532 	bres	20677, #2
                                    533 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 485: break;
      00A0C2 20 04            [ 2]  534 	jra	00112$
                                    535 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 486: case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
      00A0C4                        536 00106$:
                                    537 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 487: CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
      00A0C4 72 15 50 C8      [ 1]  538 	bres	20680, #2
                                    539 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 491: }
      00A0C8                        540 00112$:
                                    541 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 493: }
      00A0C8 84               [ 1]  542 	pop	a
      00A0C9 81               [ 4]  543 	ret
                                    544 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 500: void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
                                    545 ;	-----------------------------------------
                                    546 ;	 function CLK_SYSCLKConfig
                                    547 ;	-----------------------------------------
      00A0CA                        548 _CLK_SYSCLKConfig:
      00A0CA 52 02            [ 2]  549 	sub	sp, #2
                                    550 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 507: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
      00A0CC C6 50 C6         [ 1]  551 	ld	a, 0x50c6
                                    552 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 505: if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
      00A0CF 0D 05            [ 1]  553 	tnz	(0x05, sp)
      00A0D1 2B 15            [ 1]  554 	jrmi	00102$
                                    555 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 507: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
      00A0D3 A4 E7            [ 1]  556 	and	a, #0xe7
      00A0D5 C7 50 C6         [ 1]  557 	ld	0x50c6, a
                                    558 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 508: CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
      00A0D8 C6 50 C6         [ 1]  559 	ld	a, 0x50c6
      00A0DB 6B 02            [ 1]  560 	ld	(0x02, sp), a
      00A0DD 7B 05            [ 1]  561 	ld	a, (0x05, sp)
      00A0DF A4 18            [ 1]  562 	and	a, #0x18
      00A0E1 1A 02            [ 1]  563 	or	a, (0x02, sp)
      00A0E3 C7 50 C6         [ 1]  564 	ld	0x50c6, a
      00A0E6 20 13            [ 2]  565 	jra	00104$
      00A0E8                        566 00102$:
                                    567 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 512: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
      00A0E8 A4 F8            [ 1]  568 	and	a, #0xf8
      00A0EA C7 50 C6         [ 1]  569 	ld	0x50c6, a
                                    570 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 513: CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
      00A0ED C6 50 C6         [ 1]  571 	ld	a, 0x50c6
      00A0F0 6B 01            [ 1]  572 	ld	(0x01, sp), a
      00A0F2 7B 05            [ 1]  573 	ld	a, (0x05, sp)
      00A0F4 A4 07            [ 1]  574 	and	a, #0x07
      00A0F6 1A 01            [ 1]  575 	or	a, (0x01, sp)
      00A0F8 C7 50 C6         [ 1]  576 	ld	0x50c6, a
      00A0FB                        577 00104$:
                                    578 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 515: }
      00A0FB 5B 02            [ 2]  579 	addw	sp, #2
      00A0FD 81               [ 4]  580 	ret
                                    581 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 523: void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
                                    582 ;	-----------------------------------------
                                    583 ;	 function CLK_SWIMConfig
                                    584 ;	-----------------------------------------
      00A0FE                        585 _CLK_SWIMConfig:
                                    586 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 531: CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
      00A0FE C6 50 CD         [ 1]  587 	ld	a, 0x50cd
                                    588 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 528: if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
      00A101 0D 03            [ 1]  589 	tnz	(0x03, sp)
      00A103 27 06            [ 1]  590 	jreq	00102$
                                    591 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 531: CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
      00A105 AA 01            [ 1]  592 	or	a, #0x01
      00A107 C7 50 CD         [ 1]  593 	ld	0x50cd, a
      00A10A 81               [ 4]  594 	ret
      00A10B                        595 00102$:
                                    596 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 536: CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
      00A10B A4 FE            [ 1]  597 	and	a, #0xfe
      00A10D C7 50 CD         [ 1]  598 	ld	0x50cd, a
                                    599 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 538: }
      00A110 81               [ 4]  600 	ret
                                    601 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 547: void CLK_ClockSecuritySystemEnable(void)
                                    602 ;	-----------------------------------------
                                    603 ;	 function CLK_ClockSecuritySystemEnable
                                    604 ;	-----------------------------------------
      00A111                        605 _CLK_ClockSecuritySystemEnable:
                                    606 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 550: CLK->CSSR |= CLK_CSSR_CSSEN;
      00A111 72 10 50 C8      [ 1]  607 	bset	20680, #0
                                    608 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 551: }
      00A115 81               [ 4]  609 	ret
                                    610 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 559: CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
                                    611 ;	-----------------------------------------
                                    612 ;	 function CLK_GetSYSCLKSource
                                    613 ;	-----------------------------------------
      00A116                        614 _CLK_GetSYSCLKSource:
                                    615 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 561: return((CLK_Source_TypeDef)CLK->CMSR);
      00A116 C6 50 C3         [ 1]  616 	ld	a, 0x50c3
                                    617 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 562: }
      00A119 81               [ 4]  618 	ret
                                    619 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 570: uint32_t CLK_GetClockFreq(void)
                                    620 ;	-----------------------------------------
                                    621 ;	 function CLK_GetClockFreq
                                    622 ;	-----------------------------------------
      00A11A                        623 _CLK_GetClockFreq:
      00A11A 52 05            [ 2]  624 	sub	sp, #5
                                    625 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 577: clocksource = (CLK_Source_TypeDef)CLK->CMSR;
      00A11C C6 50 C3         [ 1]  626 	ld	a, 0x50c3
      00A11F 6B 01            [ 1]  627 	ld	(0x01, sp), a
                                    628 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 579: if (clocksource == CLK_SOURCE_HSI)
      00A121 7B 01            [ 1]  629 	ld	a, (0x01, sp)
      00A123 A1 E1            [ 1]  630 	cp	a, #0xe1
      00A125 26 26            [ 1]  631 	jrne	00105$
                                    632 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 581: tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
      00A127 C6 50 C6         [ 1]  633 	ld	a, 0x50c6
      00A12A A4 18            [ 1]  634 	and	a, #0x18
                                    635 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 582: tmp = (uint8_t)(tmp >> 3);
      00A12C 44               [ 1]  636 	srl	a
      00A12D 44               [ 1]  637 	srl	a
      00A12E 44               [ 1]  638 	srl	a
                                    639 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 583: presc = HSIDivFactor[tmp];
      00A12F 5F               [ 1]  640 	clrw	x
      00A130 97               [ 1]  641 	ld	xl, a
      00A131 1C 86 69         [ 2]  642 	addw	x, #_HSIDivFactor
      00A134 F6               [ 1]  643 	ld	a, (x)
                                    644 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 584: clockfrequency = HSI_VALUE / presc;
      00A135 5F               [ 1]  645 	clrw	x
      00A136 97               [ 1]  646 	ld	xl, a
      00A137 90 5F            [ 1]  647 	clrw	y
      00A139 89               [ 2]  648 	pushw	x
      00A13A 90 89            [ 2]  649 	pushw	y
      00A13C 4B 00            [ 1]  650 	push	#0x00
      00A13E 4B 24            [ 1]  651 	push	#0x24
      00A140 4B F4            [ 1]  652 	push	#0xf4
      00A142 4B 00            [ 1]  653 	push	#0x00
      00A144 CD A2 AC         [ 4]  654 	call	__divulong
      00A147 5B 08            [ 2]  655 	addw	sp, #8
      00A149 1F 04            [ 2]  656 	ldw	(0x04, sp), x
      00A14B 20 1A            [ 2]  657 	jra	00106$
      00A14D                        658 00105$:
                                    659 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 586: else if ( clocksource == CLK_SOURCE_LSI)
      00A14D 7B 01            [ 1]  660 	ld	a, (0x01, sp)
      00A14F A1 D2            [ 1]  661 	cp	a, #0xd2
      00A151 26 0B            [ 1]  662 	jrne	00102$
                                    663 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 588: clockfrequency = LSI_VALUE;
      00A153 AE F4 00         [ 2]  664 	ldw	x, #0xf400
      00A156 1F 04            [ 2]  665 	ldw	(0x04, sp), x
      00A158 90 AE 00 01      [ 2]  666 	ldw	y, #0x0001
      00A15C 20 09            [ 2]  667 	jra	00106$
      00A15E                        668 00102$:
                                    669 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 592: clockfrequency = HSE_VALUE;
      00A15E AE 24 00         [ 2]  670 	ldw	x, #0x2400
      00A161 1F 04            [ 2]  671 	ldw	(0x04, sp), x
      00A163 90 AE 00 F4      [ 2]  672 	ldw	y, #0x00f4
      00A167                        673 00106$:
                                    674 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 595: return((uint32_t)clockfrequency);
      00A167 1E 04            [ 2]  675 	ldw	x, (0x04, sp)
                                    676 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 596: }
      00A169 5B 05            [ 2]  677 	addw	sp, #5
      00A16B 81               [ 4]  678 	ret
                                    679 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 605: void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
                                    680 ;	-----------------------------------------
                                    681 ;	 function CLK_AdjustHSICalibrationValue
                                    682 ;	-----------------------------------------
      00A16C                        683 _CLK_AdjustHSICalibrationValue:
                                    684 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 611: CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
      00A16C C6 50 CC         [ 1]  685 	ld	a, 0x50cc
      00A16F A4 F8            [ 1]  686 	and	a, #0xf8
      00A171 1A 03            [ 1]  687 	or	a, (0x03, sp)
      00A173 C7 50 CC         [ 1]  688 	ld	0x50cc, a
                                    689 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 612: }
      00A176 81               [ 4]  690 	ret
                                    691 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 623: void CLK_SYSCLKEmergencyClear(void)
                                    692 ;	-----------------------------------------
                                    693 ;	 function CLK_SYSCLKEmergencyClear
                                    694 ;	-----------------------------------------
      00A177                        695 _CLK_SYSCLKEmergencyClear:
                                    696 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 625: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
      00A177 72 11 50 C5      [ 1]  697 	bres	20677, #0
                                    698 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 626: }
      00A17B 81               [ 4]  699 	ret
                                    700 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 635: FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
                                    701 ;	-----------------------------------------
                                    702 ;	 function CLK_GetFlagStatus
                                    703 ;	-----------------------------------------
      00A17C                        704 _CLK_GetFlagStatus:
      00A17C 88               [ 1]  705 	push	a
                                    706 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 645: statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
      00A17D 4F               [ 1]  707 	clr	a
      00A17E 97               [ 1]  708 	ld	xl, a
      00A17F 7B 04            [ 1]  709 	ld	a, (0x04, sp)
      00A181 95               [ 1]  710 	ld	xh, a
                                    711 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 648: if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
      00A182 A3 01 00         [ 2]  712 	cpw	x, #0x0100
      00A185 26 05            [ 1]  713 	jrne	00111$
                                    714 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 650: tmpreg = CLK->ICKR;
      00A187 C6 50 C0         [ 1]  715 	ld	a, 0x50c0
      00A18A 20 21            [ 2]  716 	jra	00112$
      00A18C                        717 00111$:
                                    718 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 652: else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
      00A18C A3 02 00         [ 2]  719 	cpw	x, #0x0200
      00A18F 26 05            [ 1]  720 	jrne	00108$
                                    721 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 654: tmpreg = CLK->ECKR;
      00A191 C6 50 C1         [ 1]  722 	ld	a, 0x50c1
      00A194 20 17            [ 2]  723 	jra	00112$
      00A196                        724 00108$:
                                    725 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 656: else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
      00A196 A3 03 00         [ 2]  726 	cpw	x, #0x0300
      00A199 26 05            [ 1]  727 	jrne	00105$
                                    728 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 658: tmpreg = CLK->SWCR;
      00A19B C6 50 C5         [ 1]  729 	ld	a, 0x50c5
      00A19E 20 0D            [ 2]  730 	jra	00112$
      00A1A0                        731 00105$:
                                    732 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 660: else if (statusreg == 0x0400) /* The flag to check is in CSS register */
      00A1A0 A3 04 00         [ 2]  733 	cpw	x, #0x0400
      00A1A3 26 05            [ 1]  734 	jrne	00102$
                                    735 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 662: tmpreg = CLK->CSSR;
      00A1A5 C6 50 C8         [ 1]  736 	ld	a, 0x50c8
      00A1A8 20 03            [ 2]  737 	jra	00112$
      00A1AA                        738 00102$:
                                    739 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 666: tmpreg = CLK->CCOR;
      00A1AA C6 50 C9         [ 1]  740 	ld	a, 0x50c9
      00A1AD                        741 00112$:
                                    742 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 669: if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
      00A1AD 88               [ 1]  743 	push	a
      00A1AE 7B 06            [ 1]  744 	ld	a, (0x06, sp)
      00A1B0 6B 02            [ 1]  745 	ld	(0x02, sp), a
      00A1B2 84               [ 1]  746 	pop	a
      00A1B3 14 01            [ 1]  747 	and	a, (0x01, sp)
      00A1B5 27 03            [ 1]  748 	jreq	00114$
                                    749 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 671: bitstatus = SET;
      00A1B7 A6 01            [ 1]  750 	ld	a, #0x01
                                    751 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 675: bitstatus = RESET;
      00A1B9 21                     752 	.byte 0x21
      00A1BA                        753 00114$:
      00A1BA 4F               [ 1]  754 	clr	a
      00A1BB                        755 00115$:
                                    756 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 679: return((FlagStatus)bitstatus);
                                    757 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 680: }
      00A1BB 5B 01            [ 2]  758 	addw	sp, #1
      00A1BD 81               [ 4]  759 	ret
                                    760 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 688: ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
                                    761 ;	-----------------------------------------
                                    762 ;	 function CLK_GetITStatus
                                    763 ;	-----------------------------------------
      00A1BE                        764 _CLK_GetITStatus:
                                    765 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 695: if (CLK_IT == CLK_IT_SWIF)
      00A1BE 7B 03            [ 1]  766 	ld	a, (0x03, sp)
      00A1C0 A1 1C            [ 1]  767 	cp	a, #0x1c
      00A1C2 26 0D            [ 1]  768 	jrne	00108$
                                    769 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 698: if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
      00A1C4 C6 50 C5         [ 1]  770 	ld	a, 0x50c5
      00A1C7 14 03            [ 1]  771 	and	a, (0x03, sp)
                                    772 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 700: bitstatus = SET;
      00A1C9 A0 0C            [ 1]  773 	sub	a, #0x0c
      00A1CB 26 02            [ 1]  774 	jrne	00102$
      00A1CD 4C               [ 1]  775 	inc	a
      00A1CE 81               [ 4]  776 	ret
      00A1CF                        777 00102$:
                                    778 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 704: bitstatus = RESET;
      00A1CF 4F               [ 1]  779 	clr	a
      00A1D0 81               [ 4]  780 	ret
      00A1D1                        781 00108$:
                                    782 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 710: if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
      00A1D1 C6 50 C8         [ 1]  783 	ld	a, 0x50c8
      00A1D4 14 03            [ 1]  784 	and	a, (0x03, sp)
                                    785 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 712: bitstatus = SET;
      00A1D6 A0 0C            [ 1]  786 	sub	a, #0x0c
      00A1D8 26 02            [ 1]  787 	jrne	00105$
      00A1DA 4C               [ 1]  788 	inc	a
      00A1DB 81               [ 4]  789 	ret
      00A1DC                        790 00105$:
                                    791 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 716: bitstatus = RESET;
      00A1DC 4F               [ 1]  792 	clr	a
                                    793 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 721: return bitstatus;
                                    794 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 722: }
      00A1DD 81               [ 4]  795 	ret
                                    796 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 730: void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
                                    797 ;	-----------------------------------------
                                    798 ;	 function CLK_ClearITPendingBit
                                    799 ;	-----------------------------------------
      00A1DE                        800 _CLK_ClearITPendingBit:
                                    801 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 735: if (CLK_IT == (uint8_t)CLK_IT_CSSD)
      00A1DE 7B 03            [ 1]  802 	ld	a, (0x03, sp)
      00A1E0 A1 0C            [ 1]  803 	cp	a, #0x0c
      00A1E2 26 05            [ 1]  804 	jrne	00102$
                                    805 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 738: CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
      00A1E4 72 17 50 C8      [ 1]  806 	bres	20680, #3
      00A1E8 81               [ 4]  807 	ret
      00A1E9                        808 00102$:
                                    809 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 743: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
      00A1E9 72 17 50 C5      [ 1]  810 	bres	20677, #3
                                    811 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 746: }
      00A1ED 81               [ 4]  812 	ret
                                    813 	.area CODE
                                    814 	.area CONST
      008669                        815 _HSIDivFactor:
      008669 01                     816 	.db #0x01	; 1
      00866A 02                     817 	.db #0x02	; 2
      00866B 04                     818 	.db #0x04	; 4
      00866C 08                     819 	.db #0x08	; 8
                                    820 	.area INITIALIZER
                                    821 	.area CABS (ABS)
