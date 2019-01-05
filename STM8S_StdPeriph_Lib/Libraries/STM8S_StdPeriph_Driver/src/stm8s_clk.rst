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
      00962E                         76 _CLK_DeInit:
                                     77 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 74: CLK->ICKR = CLK_ICKR_RESET_VALUE;
      00962E 35 01 50 C0      [ 1]   78 	mov	0x50c0+0, #0x01
                                     79 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 75: CLK->ECKR = CLK_ECKR_RESET_VALUE;
      009632 35 00 50 C1      [ 1]   80 	mov	0x50c1+0, #0x00
                                     81 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 76: CLK->SWR  = CLK_SWR_RESET_VALUE;
      009636 35 E1 50 C4      [ 1]   82 	mov	0x50c4+0, #0xe1
                                     83 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 77: CLK->SWCR = CLK_SWCR_RESET_VALUE;
      00963A 35 00 50 C5      [ 1]   84 	mov	0x50c5+0, #0x00
                                     85 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 78: CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
      00963E 35 18 50 C6      [ 1]   86 	mov	0x50c6+0, #0x18
                                     87 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 79: CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
      009642 35 FF 50 C7      [ 1]   88 	mov	0x50c7+0, #0xff
                                     89 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 80: CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
      009646 35 FF 50 CA      [ 1]   90 	mov	0x50ca+0, #0xff
                                     91 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 81: CLK->CSSR = CLK_CSSR_RESET_VALUE;
      00964A 35 00 50 C8      [ 1]   92 	mov	0x50c8+0, #0x00
                                     93 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 82: CLK->CCOR = CLK_CCOR_RESET_VALUE;
      00964E 35 00 50 C9      [ 1]   94 	mov	0x50c9+0, #0x00
                                     95 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 83: while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
      009652                         96 00101$:
      009652 C6 50 C9         [ 1]   97 	ld	a, 0x50c9
      009655 44               [ 1]   98 	srl	a
      009656 25 FA            [ 1]   99 	jrc	00101$
                                    100 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 85: CLK->CCOR = CLK_CCOR_RESET_VALUE;
      009658 35 00 50 C9      [ 1]  101 	mov	0x50c9+0, #0x00
                                    102 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 86: CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
      00965C 35 00 50 CC      [ 1]  103 	mov	0x50cc+0, #0x00
                                    104 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 87: CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
      009660 35 00 50 CD      [ 1]  105 	mov	0x50cd+0, #0x00
                                    106 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 88: }
      009664 81               [ 4]  107 	ret
                                    108 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 99: void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
                                    109 ;	-----------------------------------------
                                    110 ;	 function CLK_FastHaltWakeUpCmd
                                    111 ;	-----------------------------------------
      009665                        112 _CLK_FastHaltWakeUpCmd:
                                    113 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 107: CLK->ICKR |= CLK_ICKR_FHWU;
      009665 C6 50 C0         [ 1]  114 	ld	a, 0x50c0
                                    115 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 104: if (NewState != DISABLE)
      009668 0D 03            [ 1]  116 	tnz	(0x03, sp)
      00966A 27 06            [ 1]  117 	jreq	00102$
                                    118 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 107: CLK->ICKR |= CLK_ICKR_FHWU;
      00966C AA 04            [ 1]  119 	or	a, #0x04
      00966E C7 50 C0         [ 1]  120 	ld	0x50c0, a
      009671 81               [ 4]  121 	ret
      009672                        122 00102$:
                                    123 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 112: CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
      009672 A4 FB            [ 1]  124 	and	a, #0xfb
      009674 C7 50 C0         [ 1]  125 	ld	0x50c0, a
                                    126 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 114: }
      009677 81               [ 4]  127 	ret
                                    128 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 121: void CLK_HSECmd(FunctionalState NewState)
                                    129 ;	-----------------------------------------
                                    130 ;	 function CLK_HSECmd
                                    131 ;	-----------------------------------------
      009678                        132 _CLK_HSECmd:
                                    133 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 129: CLK->ECKR |= CLK_ECKR_HSEEN;
      009678 C6 50 C1         [ 1]  134 	ld	a, 0x50c1
                                    135 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 126: if (NewState != DISABLE)
      00967B 0D 03            [ 1]  136 	tnz	(0x03, sp)
      00967D 27 06            [ 1]  137 	jreq	00102$
                                    138 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 129: CLK->ECKR |= CLK_ECKR_HSEEN;
      00967F AA 01            [ 1]  139 	or	a, #0x01
      009681 C7 50 C1         [ 1]  140 	ld	0x50c1, a
      009684 81               [ 4]  141 	ret
      009685                        142 00102$:
                                    143 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 134: CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
      009685 A4 FE            [ 1]  144 	and	a, #0xfe
      009687 C7 50 C1         [ 1]  145 	ld	0x50c1, a
                                    146 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 136: }
      00968A 81               [ 4]  147 	ret
                                    148 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 143: void CLK_HSICmd(FunctionalState NewState)
                                    149 ;	-----------------------------------------
                                    150 ;	 function CLK_HSICmd
                                    151 ;	-----------------------------------------
      00968B                        152 _CLK_HSICmd:
                                    153 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 151: CLK->ICKR |= CLK_ICKR_HSIEN;
      00968B C6 50 C0         [ 1]  154 	ld	a, 0x50c0
                                    155 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 148: if (NewState != DISABLE)
      00968E 0D 03            [ 1]  156 	tnz	(0x03, sp)
      009690 27 06            [ 1]  157 	jreq	00102$
                                    158 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 151: CLK->ICKR |= CLK_ICKR_HSIEN;
      009692 AA 01            [ 1]  159 	or	a, #0x01
      009694 C7 50 C0         [ 1]  160 	ld	0x50c0, a
      009697 81               [ 4]  161 	ret
      009698                        162 00102$:
                                    163 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 156: CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
      009698 A4 FE            [ 1]  164 	and	a, #0xfe
      00969A C7 50 C0         [ 1]  165 	ld	0x50c0, a
                                    166 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 158: }
      00969D 81               [ 4]  167 	ret
                                    168 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 166: void CLK_LSICmd(FunctionalState NewState)
                                    169 ;	-----------------------------------------
                                    170 ;	 function CLK_LSICmd
                                    171 ;	-----------------------------------------
      00969E                        172 _CLK_LSICmd:
                                    173 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 174: CLK->ICKR |= CLK_ICKR_LSIEN;
      00969E C6 50 C0         [ 1]  174 	ld	a, 0x50c0
                                    175 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 171: if (NewState != DISABLE)
      0096A1 0D 03            [ 1]  176 	tnz	(0x03, sp)
      0096A3 27 06            [ 1]  177 	jreq	00102$
                                    178 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 174: CLK->ICKR |= CLK_ICKR_LSIEN;
      0096A5 AA 08            [ 1]  179 	or	a, #0x08
      0096A7 C7 50 C0         [ 1]  180 	ld	0x50c0, a
      0096AA 81               [ 4]  181 	ret
      0096AB                        182 00102$:
                                    183 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 179: CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
      0096AB A4 F7            [ 1]  184 	and	a, #0xf7
      0096AD C7 50 C0         [ 1]  185 	ld	0x50c0, a
                                    186 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 181: }
      0096B0 81               [ 4]  187 	ret
                                    188 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 189: void CLK_CCOCmd(FunctionalState NewState)
                                    189 ;	-----------------------------------------
                                    190 ;	 function CLK_CCOCmd
                                    191 ;	-----------------------------------------
      0096B1                        192 _CLK_CCOCmd:
                                    193 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 197: CLK->CCOR |= CLK_CCOR_CCOEN;
      0096B1 C6 50 C9         [ 1]  194 	ld	a, 0x50c9
                                    195 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 194: if (NewState != DISABLE)
      0096B4 0D 03            [ 1]  196 	tnz	(0x03, sp)
      0096B6 27 06            [ 1]  197 	jreq	00102$
                                    198 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 197: CLK->CCOR |= CLK_CCOR_CCOEN;
      0096B8 AA 01            [ 1]  199 	or	a, #0x01
      0096BA C7 50 C9         [ 1]  200 	ld	0x50c9, a
      0096BD 81               [ 4]  201 	ret
      0096BE                        202 00102$:
                                    203 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 202: CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
      0096BE A4 FE            [ 1]  204 	and	a, #0xfe
      0096C0 C7 50 C9         [ 1]  205 	ld	0x50c9, a
                                    206 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 204: }
      0096C3 81               [ 4]  207 	ret
                                    208 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 213: void CLK_ClockSwitchCmd(FunctionalState NewState)
                                    209 ;	-----------------------------------------
                                    210 ;	 function CLK_ClockSwitchCmd
                                    211 ;	-----------------------------------------
      0096C4                        212 _CLK_ClockSwitchCmd:
                                    213 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 221: CLK->SWCR |= CLK_SWCR_SWEN;
      0096C4 C6 50 C5         [ 1]  214 	ld	a, 0x50c5
                                    215 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 218: if (NewState != DISABLE )
      0096C7 0D 03            [ 1]  216 	tnz	(0x03, sp)
      0096C9 27 06            [ 1]  217 	jreq	00102$
                                    218 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 221: CLK->SWCR |= CLK_SWCR_SWEN;
      0096CB AA 02            [ 1]  219 	or	a, #0x02
      0096CD C7 50 C5         [ 1]  220 	ld	0x50c5, a
      0096D0 81               [ 4]  221 	ret
      0096D1                        222 00102$:
                                    223 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 226: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
      0096D1 A4 FD            [ 1]  224 	and	a, #0xfd
      0096D3 C7 50 C5         [ 1]  225 	ld	0x50c5, a
                                    226 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 228: }
      0096D6 81               [ 4]  227 	ret
                                    228 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 238: void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
                                    229 ;	-----------------------------------------
                                    230 ;	 function CLK_SlowActiveHaltWakeUpCmd
                                    231 ;	-----------------------------------------
      0096D7                        232 _CLK_SlowActiveHaltWakeUpCmd:
                                    233 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 246: CLK->ICKR |= CLK_ICKR_SWUAH;
      0096D7 C6 50 C0         [ 1]  234 	ld	a, 0x50c0
                                    235 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 243: if (NewState != DISABLE)
      0096DA 0D 03            [ 1]  236 	tnz	(0x03, sp)
      0096DC 27 06            [ 1]  237 	jreq	00102$
                                    238 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 246: CLK->ICKR |= CLK_ICKR_SWUAH;
      0096DE AA 20            [ 1]  239 	or	a, #0x20
      0096E0 C7 50 C0         [ 1]  240 	ld	0x50c0, a
      0096E3 81               [ 4]  241 	ret
      0096E4                        242 00102$:
                                    243 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 251: CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
      0096E4 A4 DF            [ 1]  244 	and	a, #0xdf
      0096E6 C7 50 C0         [ 1]  245 	ld	0x50c0, a
                                    246 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 253: }
      0096E9 81               [ 4]  247 	ret
                                    248 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 263: void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
                                    249 ;	-----------------------------------------
                                    250 ;	 function CLK_PeripheralClockConfig
                                    251 ;	-----------------------------------------
      0096EA                        252 _CLK_PeripheralClockConfig:
      0096EA 52 02            [ 2]  253 	sub	sp, #2
                                    254 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 274: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      0096EC 7B 05            [ 1]  255 	ld	a, (0x05, sp)
      0096EE A4 0F            [ 1]  256 	and	a, #0x0f
      0096F0 88               [ 1]  257 	push	a
      0096F1 A6 01            [ 1]  258 	ld	a, #0x01
      0096F3 6B 03            [ 1]  259 	ld	(0x03, sp), a
      0096F5 84               [ 1]  260 	pop	a
      0096F6 4D               [ 1]  261 	tnz	a
      0096F7 27 05            [ 1]  262 	jreq	00128$
      0096F9                        263 00127$:
      0096F9 08 02            [ 1]  264 	sll	(0x02, sp)
      0096FB 4A               [ 1]  265 	dec	a
      0096FC 26 FB            [ 1]  266 	jrne	00127$
      0096FE                        267 00128$:
                                    268 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 279: CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      0096FE 7B 02            [ 1]  269 	ld	a, (0x02, sp)
      009700 43               [ 1]  270 	cpl	a
      009701 6B 01            [ 1]  271 	ld	(0x01, sp), a
                                    272 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 269: if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
      009703 7B 05            [ 1]  273 	ld	a, (0x05, sp)
      009705 A5 10            [ 1]  274 	bcp	a, #0x10
      009707 26 15            [ 1]  275 	jrne	00108$
                                    276 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 274: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      009709 C6 50 C7         [ 1]  277 	ld	a, 0x50c7
                                    278 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 271: if (NewState != DISABLE)
      00970C 0D 06            [ 1]  279 	tnz	(0x06, sp)
      00970E 27 07            [ 1]  280 	jreq	00102$
                                    281 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 274: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      009710 1A 02            [ 1]  282 	or	a, (0x02, sp)
      009712 C7 50 C7         [ 1]  283 	ld	0x50c7, a
      009715 20 1A            [ 2]  284 	jra	00110$
      009717                        285 00102$:
                                    286 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 279: CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      009717 14 01            [ 1]  287 	and	a, (0x01, sp)
      009719 C7 50 C7         [ 1]  288 	ld	0x50c7, a
      00971C 20 13            [ 2]  289 	jra	00110$
      00971E                        290 00108$:
                                    291 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 287: CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      00971E C6 50 CA         [ 1]  292 	ld	a, 0x50ca
                                    293 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 284: if (NewState != DISABLE)
      009721 0D 06            [ 1]  294 	tnz	(0x06, sp)
      009723 27 07            [ 1]  295 	jreq	00105$
                                    296 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 287: CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      009725 1A 02            [ 1]  297 	or	a, (0x02, sp)
      009727 C7 50 CA         [ 1]  298 	ld	0x50ca, a
      00972A 20 05            [ 2]  299 	jra	00110$
      00972C                        300 00105$:
                                    301 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 292: CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      00972C 14 01            [ 1]  302 	and	a, (0x01, sp)
      00972E C7 50 CA         [ 1]  303 	ld	0x50ca, a
      009731                        304 00110$:
                                    305 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 295: }
      009731 5B 02            [ 2]  306 	addw	sp, #2
      009733 81               [ 4]  307 	ret
                                    308 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 309: ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
                                    309 ;	-----------------------------------------
                                    310 ;	 function CLK_ClockSwitchConfig
                                    311 ;	-----------------------------------------
      009734                        312 _CLK_ClockSwitchConfig:
                                    313 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 322: clock_master = (CLK_Source_TypeDef)CLK->CMSR;
      009734 C6 50 C3         [ 1]  314 	ld	a, 0x50c3
      009737 90 97            [ 1]  315 	ld	yl, a
                                    316 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 328: CLK->SWCR |= CLK_SWCR_SWEN;
      009739 C6 50 C5         [ 1]  317 	ld	a, 0x50c5
                                    318 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 325: if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
      00973C 88               [ 1]  319 	push	a
      00973D 7B 04            [ 1]  320 	ld	a, (0x04, sp)
      00973F 4A               [ 1]  321 	dec	a
      009740 84               [ 1]  322 	pop	a
      009741 26 38            [ 1]  323 	jrne	00122$
                                    324 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 328: CLK->SWCR |= CLK_SWCR_SWEN;
      009743 AA 02            [ 1]  325 	or	a, #0x02
      009745 C7 50 C5         [ 1]  326 	ld	0x50c5, a
      009748 C6 50 C5         [ 1]  327 	ld	a, 0x50c5
                                    328 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 331: if (ITState != DISABLE)
      00974B 0D 05            [ 1]  329 	tnz	(0x05, sp)
      00974D 27 07            [ 1]  330 	jreq	00102$
                                    331 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 333: CLK->SWCR |= CLK_SWCR_SWIEN;
      00974F AA 04            [ 1]  332 	or	a, #0x04
      009751 C7 50 C5         [ 1]  333 	ld	0x50c5, a
      009754 20 05            [ 2]  334 	jra	00103$
      009756                        335 00102$:
                                    336 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 337: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
      009756 A4 FB            [ 1]  337 	and	a, #0xfb
      009758 C7 50 C5         [ 1]  338 	ld	0x50c5, a
      00975B                        339 00103$:
                                    340 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 341: CLK->SWR = (uint8_t)CLK_NewClock;
      00975B AE 50 C4         [ 2]  341 	ldw	x, #0x50c4
      00975E 7B 04            [ 1]  342 	ld	a, (0x04, sp)
      009760 F7               [ 1]  343 	ld	(x), a
                                    344 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 344: while((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
      009761 5F               [ 1]  345 	clrw	x
      009762 5A               [ 2]  346 	decw	x
      009763                        347 00105$:
      009763 C6 50 C5         [ 1]  348 	ld	a, 0x50c5
      009766 44               [ 1]  349 	srl	a
      009767 24 06            [ 1]  350 	jrnc	00107$
      009769 5D               [ 2]  351 	tnzw	x
      00976A 27 03            [ 1]  352 	jreq	00107$
                                    353 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 346: DownCounter--;
      00976C 5A               [ 2]  354 	decw	x
      00976D 20 F4            [ 2]  355 	jra	00105$
      00976F                        356 00107$:
                                    357 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 349: if(DownCounter != 0)
      00976F 5D               [ 2]  358 	tnzw	x
      009770 27 05            [ 1]  359 	jreq	00109$
                                    360 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 351: Swif = SUCCESS;
      009772 A6 01            [ 1]  361 	ld	a, #0x01
      009774 97               [ 1]  362 	ld	xl, a
      009775 20 37            [ 2]  363 	jra	00123$
      009777                        364 00109$:
                                    365 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 355: Swif = ERROR;
      009777 4F               [ 1]  366 	clr	a
      009778 97               [ 1]  367 	ld	xl, a
      009779 20 33            [ 2]  368 	jra	00123$
      00977B                        369 00122$:
                                    370 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 361: if (ITState != DISABLE)
      00977B 0D 05            [ 1]  371 	tnz	(0x05, sp)
      00977D 27 07            [ 1]  372 	jreq	00112$
                                    373 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 363: CLK->SWCR |= CLK_SWCR_SWIEN;
      00977F AA 04            [ 1]  374 	or	a, #0x04
      009781 C7 50 C5         [ 1]  375 	ld	0x50c5, a
      009784 20 05            [ 2]  376 	jra	00113$
      009786                        377 00112$:
                                    378 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 367: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
      009786 A4 FB            [ 1]  379 	and	a, #0xfb
      009788 C7 50 C5         [ 1]  380 	ld	0x50c5, a
      00978B                        381 00113$:
                                    382 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 371: CLK->SWR = (uint8_t)CLK_NewClock;
      00978B AE 50 C4         [ 2]  383 	ldw	x, #0x50c4
      00978E 7B 04            [ 1]  384 	ld	a, (0x04, sp)
      009790 F7               [ 1]  385 	ld	(x), a
                                    386 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 374: while((((CLK->SWCR & CLK_SWCR_SWIF) != 0 ) && (DownCounter != 0)))
      009791 5F               [ 1]  387 	clrw	x
      009792 5A               [ 2]  388 	decw	x
      009793                        389 00115$:
      009793 C6 50 C5         [ 1]  390 	ld	a, 0x50c5
      009796 A5 08            [ 1]  391 	bcp	a, #0x08
      009798 27 06            [ 1]  392 	jreq	00117$
      00979A 5D               [ 2]  393 	tnzw	x
      00979B 27 03            [ 1]  394 	jreq	00117$
                                    395 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 376: DownCounter--;
      00979D 5A               [ 2]  396 	decw	x
      00979E 20 F3            [ 2]  397 	jra	00115$
      0097A0                        398 00117$:
                                    399 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 379: if(DownCounter != 0)
      0097A0 5D               [ 2]  400 	tnzw	x
      0097A1 27 09            [ 1]  401 	jreq	00119$
                                    402 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 382: CLK->SWCR |= CLK_SWCR_SWEN;
      0097A3 72 12 50 C5      [ 1]  403 	bset	20677, #1
                                    404 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 383: Swif = SUCCESS;
      0097A7 A6 01            [ 1]  405 	ld	a, #0x01
      0097A9 97               [ 1]  406 	ld	xl, a
      0097AA 20 02            [ 2]  407 	jra	00123$
      0097AC                        408 00119$:
                                    409 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 387: Swif = ERROR;
      0097AC 4F               [ 1]  410 	clr	a
      0097AD 97               [ 1]  411 	ld	xl, a
      0097AE                        412 00123$:
                                    413 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 390: if(Swif != ERROR)
      0097AE 9F               [ 1]  414 	ld	a, xl
      0097AF 4D               [ 1]  415 	tnz	a
      0097B0 27 2E            [ 1]  416 	jreq	00136$
                                    417 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 393: if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
      0097B2 0D 06            [ 1]  418 	tnz	(0x06, sp)
      0097B4 26 0C            [ 1]  419 	jrne	00132$
      0097B6 90 9F            [ 1]  420 	ld	a, yl
      0097B8 A1 E1            [ 1]  421 	cp	a, #0xe1
      0097BA 26 06            [ 1]  422 	jrne	00132$
                                    423 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 395: CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
      0097BC 72 11 50 C0      [ 1]  424 	bres	20672, #0
      0097C0 20 1E            [ 2]  425 	jra	00136$
      0097C2                        426 00132$:
                                    427 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 397: else if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
      0097C2 0D 06            [ 1]  428 	tnz	(0x06, sp)
      0097C4 26 0C            [ 1]  429 	jrne	00128$
      0097C6 90 9F            [ 1]  430 	ld	a, yl
      0097C8 A1 D2            [ 1]  431 	cp	a, #0xd2
      0097CA 26 06            [ 1]  432 	jrne	00128$
                                    433 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 399: CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
      0097CC 72 17 50 C0      [ 1]  434 	bres	20672, #3
      0097D0 20 0E            [ 2]  435 	jra	00136$
      0097D2                        436 00128$:
                                    437 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 401: else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
      0097D2 0D 06            [ 1]  438 	tnz	(0x06, sp)
      0097D4 26 0A            [ 1]  439 	jrne	00136$
      0097D6 90 9F            [ 1]  440 	ld	a, yl
      0097D8 A1 B4            [ 1]  441 	cp	a, #0xb4
      0097DA 26 04            [ 1]  442 	jrne	00136$
                                    443 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 403: CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
      0097DC 72 11 50 C1      [ 1]  444 	bres	20673, #0
      0097E0                        445 00136$:
                                    446 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 406: return(Swif);
      0097E0 9F               [ 1]  447 	ld	a, xl
                                    448 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 407: }
      0097E1 81               [ 4]  449 	ret
                                    450 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 415: void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
                                    451 ;	-----------------------------------------
                                    452 ;	 function CLK_HSIPrescalerConfig
                                    453 ;	-----------------------------------------
      0097E2                        454 _CLK_HSIPrescalerConfig:
                                    455 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 421: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
      0097E2 C6 50 C6         [ 1]  456 	ld	a, 0x50c6
      0097E5 A4 E7            [ 1]  457 	and	a, #0xe7
      0097E7 C7 50 C6         [ 1]  458 	ld	0x50c6, a
                                    459 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 424: CLK->CKDIVR |= (uint8_t)HSIPrescaler;
      0097EA C6 50 C6         [ 1]  460 	ld	a, 0x50c6
      0097ED 1A 03            [ 1]  461 	or	a, (0x03, sp)
      0097EF C7 50 C6         [ 1]  462 	ld	0x50c6, a
                                    463 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 425: }
      0097F2 81               [ 4]  464 	ret
                                    465 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 436: void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
                                    466 ;	-----------------------------------------
                                    467 ;	 function CLK_CCOConfig
                                    468 ;	-----------------------------------------
      0097F3                        469 _CLK_CCOConfig:
                                    470 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 442: CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
      0097F3 C6 50 C9         [ 1]  471 	ld	a, 0x50c9
      0097F6 A4 E1            [ 1]  472 	and	a, #0xe1
      0097F8 C7 50 C9         [ 1]  473 	ld	0x50c9, a
                                    474 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 445: CLK->CCOR |= (uint8_t)CLK_CCO;
      0097FB C6 50 C9         [ 1]  475 	ld	a, 0x50c9
      0097FE 1A 03            [ 1]  476 	or	a, (0x03, sp)
      009800 C7 50 C9         [ 1]  477 	ld	0x50c9, a
                                    478 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 448: CLK->CCOR |= CLK_CCOR_CCOEN;
      009803 72 10 50 C9      [ 1]  479 	bset	20681, #0
                                    480 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 449: }
      009807 81               [ 4]  481 	ret
                                    482 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 459: void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
                                    483 ;	-----------------------------------------
                                    484 ;	 function CLK_ITConfig
                                    485 ;	-----------------------------------------
      009808                        486 _CLK_ITConfig:
      009808 88               [ 1]  487 	push	a
                                    488 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 467: switch (CLK_IT)
      009809 7B 04            [ 1]  489 	ld	a, (0x04, sp)
      00980B A0 0C            [ 1]  490 	sub	a, #0x0c
      00980D 26 04            [ 1]  491 	jrne	00140$
      00980F 4C               [ 1]  492 	inc	a
      009810 6B 01            [ 1]  493 	ld	(0x01, sp), a
      009812 C1                     494 	.byte 0xc1
      009813                        495 00140$:
      009813 0F 01            [ 1]  496 	clr	(0x01, sp)
      009815                        497 00141$:
      009815 7B 04            [ 1]  498 	ld	a, (0x04, sp)
      009817 A0 1C            [ 1]  499 	sub	a, #0x1c
      009819 26 02            [ 1]  500 	jrne	00143$
      00981B 4C               [ 1]  501 	inc	a
      00981C 21                     502 	.byte 0x21
      00981D                        503 00143$:
      00981D 4F               [ 1]  504 	clr	a
      00981E                        505 00144$:
                                    506 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 465: if (NewState != DISABLE)
      00981E 0D 05            [ 1]  507 	tnz	(0x05, sp)
      009820 27 13            [ 1]  508 	jreq	00110$
                                    509 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 467: switch (CLK_IT)
      009822 0D 01            [ 1]  510 	tnz	(0x01, sp)
      009824 26 09            [ 1]  511 	jrne	00102$
      009826 4D               [ 1]  512 	tnz	a
      009827 27 1D            [ 1]  513 	jreq	00112$
                                    514 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 470: CLK->SWCR |= CLK_SWCR_SWIEN;
      009829 72 14 50 C5      [ 1]  515 	bset	20677, #2
                                    516 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 471: break;
      00982D 20 17            [ 2]  517 	jra	00112$
                                    518 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 472: case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
      00982F                        519 00102$:
                                    520 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 473: CLK->CSSR |= CLK_CSSR_CSSDIE;
      00982F 72 14 50 C8      [ 1]  521 	bset	20680, #2
                                    522 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 474: break;
      009833 20 11            [ 2]  523 	jra	00112$
                                    524 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 477: }
      009835                        525 00110$:
                                    526 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 481: switch (CLK_IT)
      009835 0D 01            [ 1]  527 	tnz	(0x01, sp)
      009837 26 09            [ 1]  528 	jrne	00106$
      009839 4D               [ 1]  529 	tnz	a
      00983A 27 0A            [ 1]  530 	jreq	00112$
                                    531 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 484: CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
      00983C 72 15 50 C5      [ 1]  532 	bres	20677, #2
                                    533 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 485: break;
      009840 20 04            [ 2]  534 	jra	00112$
                                    535 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 486: case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
      009842                        536 00106$:
                                    537 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 487: CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
      009842 72 15 50 C8      [ 1]  538 	bres	20680, #2
                                    539 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 491: }
      009846                        540 00112$:
                                    541 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 493: }
      009846 84               [ 1]  542 	pop	a
      009847 81               [ 4]  543 	ret
                                    544 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 500: void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
                                    545 ;	-----------------------------------------
                                    546 ;	 function CLK_SYSCLKConfig
                                    547 ;	-----------------------------------------
      009848                        548 _CLK_SYSCLKConfig:
      009848 52 02            [ 2]  549 	sub	sp, #2
                                    550 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 507: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
      00984A C6 50 C6         [ 1]  551 	ld	a, 0x50c6
                                    552 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 505: if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
      00984D 0D 05            [ 1]  553 	tnz	(0x05, sp)
      00984F 2B 15            [ 1]  554 	jrmi	00102$
                                    555 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 507: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
      009851 A4 E7            [ 1]  556 	and	a, #0xe7
      009853 C7 50 C6         [ 1]  557 	ld	0x50c6, a
                                    558 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 508: CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
      009856 C6 50 C6         [ 1]  559 	ld	a, 0x50c6
      009859 6B 02            [ 1]  560 	ld	(0x02, sp), a
      00985B 7B 05            [ 1]  561 	ld	a, (0x05, sp)
      00985D A4 18            [ 1]  562 	and	a, #0x18
      00985F 1A 02            [ 1]  563 	or	a, (0x02, sp)
      009861 C7 50 C6         [ 1]  564 	ld	0x50c6, a
      009864 20 13            [ 2]  565 	jra	00104$
      009866                        566 00102$:
                                    567 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 512: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
      009866 A4 F8            [ 1]  568 	and	a, #0xf8
      009868 C7 50 C6         [ 1]  569 	ld	0x50c6, a
                                    570 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 513: CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
      00986B C6 50 C6         [ 1]  571 	ld	a, 0x50c6
      00986E 6B 01            [ 1]  572 	ld	(0x01, sp), a
      009870 7B 05            [ 1]  573 	ld	a, (0x05, sp)
      009872 A4 07            [ 1]  574 	and	a, #0x07
      009874 1A 01            [ 1]  575 	or	a, (0x01, sp)
      009876 C7 50 C6         [ 1]  576 	ld	0x50c6, a
      009879                        577 00104$:
                                    578 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 515: }
      009879 5B 02            [ 2]  579 	addw	sp, #2
      00987B 81               [ 4]  580 	ret
                                    581 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 523: void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
                                    582 ;	-----------------------------------------
                                    583 ;	 function CLK_SWIMConfig
                                    584 ;	-----------------------------------------
      00987C                        585 _CLK_SWIMConfig:
                                    586 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 531: CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
      00987C C6 50 CD         [ 1]  587 	ld	a, 0x50cd
                                    588 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 528: if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
      00987F 0D 03            [ 1]  589 	tnz	(0x03, sp)
      009881 27 06            [ 1]  590 	jreq	00102$
                                    591 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 531: CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
      009883 AA 01            [ 1]  592 	or	a, #0x01
      009885 C7 50 CD         [ 1]  593 	ld	0x50cd, a
      009888 81               [ 4]  594 	ret
      009889                        595 00102$:
                                    596 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 536: CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
      009889 A4 FE            [ 1]  597 	and	a, #0xfe
      00988B C7 50 CD         [ 1]  598 	ld	0x50cd, a
                                    599 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 538: }
      00988E 81               [ 4]  600 	ret
                                    601 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 547: void CLK_ClockSecuritySystemEnable(void)
                                    602 ;	-----------------------------------------
                                    603 ;	 function CLK_ClockSecuritySystemEnable
                                    604 ;	-----------------------------------------
      00988F                        605 _CLK_ClockSecuritySystemEnable:
                                    606 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 550: CLK->CSSR |= CLK_CSSR_CSSEN;
      00988F 72 10 50 C8      [ 1]  607 	bset	20680, #0
                                    608 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 551: }
      009893 81               [ 4]  609 	ret
                                    610 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 559: CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
                                    611 ;	-----------------------------------------
                                    612 ;	 function CLK_GetSYSCLKSource
                                    613 ;	-----------------------------------------
      009894                        614 _CLK_GetSYSCLKSource:
                                    615 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 561: return((CLK_Source_TypeDef)CLK->CMSR);
      009894 C6 50 C3         [ 1]  616 	ld	a, 0x50c3
                                    617 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 562: }
      009897 81               [ 4]  618 	ret
                                    619 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 570: uint32_t CLK_GetClockFreq(void)
                                    620 ;	-----------------------------------------
                                    621 ;	 function CLK_GetClockFreq
                                    622 ;	-----------------------------------------
      009898                        623 _CLK_GetClockFreq:
      009898 52 05            [ 2]  624 	sub	sp, #5
                                    625 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 577: clocksource = (CLK_Source_TypeDef)CLK->CMSR;
      00989A C6 50 C3         [ 1]  626 	ld	a, 0x50c3
      00989D 6B 01            [ 1]  627 	ld	(0x01, sp), a
                                    628 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 579: if (clocksource == CLK_SOURCE_HSI)
      00989F 7B 01            [ 1]  629 	ld	a, (0x01, sp)
      0098A1 A1 E1            [ 1]  630 	cp	a, #0xe1
      0098A3 26 26            [ 1]  631 	jrne	00105$
                                    632 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 581: tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
      0098A5 C6 50 C6         [ 1]  633 	ld	a, 0x50c6
      0098A8 A4 18            [ 1]  634 	and	a, #0x18
                                    635 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 582: tmp = (uint8_t)(tmp >> 3);
      0098AA 44               [ 1]  636 	srl	a
      0098AB 44               [ 1]  637 	srl	a
      0098AC 44               [ 1]  638 	srl	a
                                    639 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 583: presc = HSIDivFactor[tmp];
      0098AD 5F               [ 1]  640 	clrw	x
      0098AE 97               [ 1]  641 	ld	xl, a
      0098AF 1C 86 42         [ 2]  642 	addw	x, #_HSIDivFactor
      0098B2 F6               [ 1]  643 	ld	a, (x)
                                    644 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 584: clockfrequency = HSI_VALUE / presc;
      0098B3 5F               [ 1]  645 	clrw	x
      0098B4 97               [ 1]  646 	ld	xl, a
      0098B5 90 5F            [ 1]  647 	clrw	y
      0098B7 89               [ 2]  648 	pushw	x
      0098B8 90 89            [ 2]  649 	pushw	y
      0098BA 4B 00            [ 1]  650 	push	#0x00
      0098BC 4B 24            [ 1]  651 	push	#0x24
      0098BE 4B F4            [ 1]  652 	push	#0xf4
      0098C0 4B 00            [ 1]  653 	push	#0x00
      0098C2 CD 9A 2A         [ 4]  654 	call	__divulong
      0098C5 5B 08            [ 2]  655 	addw	sp, #8
      0098C7 1F 04            [ 2]  656 	ldw	(0x04, sp), x
      0098C9 20 1A            [ 2]  657 	jra	00106$
      0098CB                        658 00105$:
                                    659 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 586: else if ( clocksource == CLK_SOURCE_LSI)
      0098CB 7B 01            [ 1]  660 	ld	a, (0x01, sp)
      0098CD A1 D2            [ 1]  661 	cp	a, #0xd2
      0098CF 26 0B            [ 1]  662 	jrne	00102$
                                    663 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 588: clockfrequency = LSI_VALUE;
      0098D1 AE F4 00         [ 2]  664 	ldw	x, #0xf400
      0098D4 1F 04            [ 2]  665 	ldw	(0x04, sp), x
      0098D6 90 AE 00 01      [ 2]  666 	ldw	y, #0x0001
      0098DA 20 09            [ 2]  667 	jra	00106$
      0098DC                        668 00102$:
                                    669 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 592: clockfrequency = HSE_VALUE;
      0098DC AE 24 00         [ 2]  670 	ldw	x, #0x2400
      0098DF 1F 04            [ 2]  671 	ldw	(0x04, sp), x
      0098E1 90 AE 00 F4      [ 2]  672 	ldw	y, #0x00f4
      0098E5                        673 00106$:
                                    674 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 595: return((uint32_t)clockfrequency);
      0098E5 1E 04            [ 2]  675 	ldw	x, (0x04, sp)
                                    676 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 596: }
      0098E7 5B 05            [ 2]  677 	addw	sp, #5
      0098E9 81               [ 4]  678 	ret
                                    679 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 605: void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
                                    680 ;	-----------------------------------------
                                    681 ;	 function CLK_AdjustHSICalibrationValue
                                    682 ;	-----------------------------------------
      0098EA                        683 _CLK_AdjustHSICalibrationValue:
                                    684 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 611: CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
      0098EA C6 50 CC         [ 1]  685 	ld	a, 0x50cc
      0098ED A4 F8            [ 1]  686 	and	a, #0xf8
      0098EF 1A 03            [ 1]  687 	or	a, (0x03, sp)
      0098F1 C7 50 CC         [ 1]  688 	ld	0x50cc, a
                                    689 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 612: }
      0098F4 81               [ 4]  690 	ret
                                    691 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 623: void CLK_SYSCLKEmergencyClear(void)
                                    692 ;	-----------------------------------------
                                    693 ;	 function CLK_SYSCLKEmergencyClear
                                    694 ;	-----------------------------------------
      0098F5                        695 _CLK_SYSCLKEmergencyClear:
                                    696 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 625: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
      0098F5 72 11 50 C5      [ 1]  697 	bres	20677, #0
                                    698 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 626: }
      0098F9 81               [ 4]  699 	ret
                                    700 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 635: FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
                                    701 ;	-----------------------------------------
                                    702 ;	 function CLK_GetFlagStatus
                                    703 ;	-----------------------------------------
      0098FA                        704 _CLK_GetFlagStatus:
      0098FA 88               [ 1]  705 	push	a
                                    706 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 645: statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
      0098FB 4F               [ 1]  707 	clr	a
      0098FC 97               [ 1]  708 	ld	xl, a
      0098FD 7B 04            [ 1]  709 	ld	a, (0x04, sp)
      0098FF 95               [ 1]  710 	ld	xh, a
                                    711 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 648: if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
      009900 A3 01 00         [ 2]  712 	cpw	x, #0x0100
      009903 26 05            [ 1]  713 	jrne	00111$
                                    714 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 650: tmpreg = CLK->ICKR;
      009905 C6 50 C0         [ 1]  715 	ld	a, 0x50c0
      009908 20 21            [ 2]  716 	jra	00112$
      00990A                        717 00111$:
                                    718 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 652: else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
      00990A A3 02 00         [ 2]  719 	cpw	x, #0x0200
      00990D 26 05            [ 1]  720 	jrne	00108$
                                    721 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 654: tmpreg = CLK->ECKR;
      00990F C6 50 C1         [ 1]  722 	ld	a, 0x50c1
      009912 20 17            [ 2]  723 	jra	00112$
      009914                        724 00108$:
                                    725 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 656: else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
      009914 A3 03 00         [ 2]  726 	cpw	x, #0x0300
      009917 26 05            [ 1]  727 	jrne	00105$
                                    728 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 658: tmpreg = CLK->SWCR;
      009919 C6 50 C5         [ 1]  729 	ld	a, 0x50c5
      00991C 20 0D            [ 2]  730 	jra	00112$
      00991E                        731 00105$:
                                    732 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 660: else if (statusreg == 0x0400) /* The flag to check is in CSS register */
      00991E A3 04 00         [ 2]  733 	cpw	x, #0x0400
      009921 26 05            [ 1]  734 	jrne	00102$
                                    735 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 662: tmpreg = CLK->CSSR;
      009923 C6 50 C8         [ 1]  736 	ld	a, 0x50c8
      009926 20 03            [ 2]  737 	jra	00112$
      009928                        738 00102$:
                                    739 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 666: tmpreg = CLK->CCOR;
      009928 C6 50 C9         [ 1]  740 	ld	a, 0x50c9
      00992B                        741 00112$:
                                    742 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 669: if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
      00992B 88               [ 1]  743 	push	a
      00992C 7B 06            [ 1]  744 	ld	a, (0x06, sp)
      00992E 6B 02            [ 1]  745 	ld	(0x02, sp), a
      009930 84               [ 1]  746 	pop	a
      009931 14 01            [ 1]  747 	and	a, (0x01, sp)
      009933 27 03            [ 1]  748 	jreq	00114$
                                    749 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 671: bitstatus = SET;
      009935 A6 01            [ 1]  750 	ld	a, #0x01
                                    751 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 675: bitstatus = RESET;
      009937 21                     752 	.byte 0x21
      009938                        753 00114$:
      009938 4F               [ 1]  754 	clr	a
      009939                        755 00115$:
                                    756 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 679: return((FlagStatus)bitstatus);
                                    757 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 680: }
      009939 5B 01            [ 2]  758 	addw	sp, #1
      00993B 81               [ 4]  759 	ret
                                    760 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 688: ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
                                    761 ;	-----------------------------------------
                                    762 ;	 function CLK_GetITStatus
                                    763 ;	-----------------------------------------
      00993C                        764 _CLK_GetITStatus:
                                    765 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 695: if (CLK_IT == CLK_IT_SWIF)
      00993C 7B 03            [ 1]  766 	ld	a, (0x03, sp)
      00993E A1 1C            [ 1]  767 	cp	a, #0x1c
      009940 26 0D            [ 1]  768 	jrne	00108$
                                    769 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 698: if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
      009942 C6 50 C5         [ 1]  770 	ld	a, 0x50c5
      009945 14 03            [ 1]  771 	and	a, (0x03, sp)
                                    772 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 700: bitstatus = SET;
      009947 A0 0C            [ 1]  773 	sub	a, #0x0c
      009949 26 02            [ 1]  774 	jrne	00102$
      00994B 4C               [ 1]  775 	inc	a
      00994C 81               [ 4]  776 	ret
      00994D                        777 00102$:
                                    778 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 704: bitstatus = RESET;
      00994D 4F               [ 1]  779 	clr	a
      00994E 81               [ 4]  780 	ret
      00994F                        781 00108$:
                                    782 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 710: if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
      00994F C6 50 C8         [ 1]  783 	ld	a, 0x50c8
      009952 14 03            [ 1]  784 	and	a, (0x03, sp)
                                    785 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 712: bitstatus = SET;
      009954 A0 0C            [ 1]  786 	sub	a, #0x0c
      009956 26 02            [ 1]  787 	jrne	00105$
      009958 4C               [ 1]  788 	inc	a
      009959 81               [ 4]  789 	ret
      00995A                        790 00105$:
                                    791 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 716: bitstatus = RESET;
      00995A 4F               [ 1]  792 	clr	a
                                    793 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 721: return bitstatus;
                                    794 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 722: }
      00995B 81               [ 4]  795 	ret
                                    796 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 730: void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
                                    797 ;	-----------------------------------------
                                    798 ;	 function CLK_ClearITPendingBit
                                    799 ;	-----------------------------------------
      00995C                        800 _CLK_ClearITPendingBit:
                                    801 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 735: if (CLK_IT == (uint8_t)CLK_IT_CSSD)
      00995C 7B 03            [ 1]  802 	ld	a, (0x03, sp)
      00995E A1 0C            [ 1]  803 	cp	a, #0x0c
      009960 26 05            [ 1]  804 	jrne	00102$
                                    805 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 738: CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
      009962 72 17 50 C8      [ 1]  806 	bres	20680, #3
      009966 81               [ 4]  807 	ret
      009967                        808 00102$:
                                    809 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 743: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
      009967 72 17 50 C5      [ 1]  810 	bres	20677, #3
                                    811 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 746: }
      00996B 81               [ 4]  812 	ret
                                    813 	.area CODE
                                    814 	.area CONST
      008642                        815 _HSIDivFactor:
      008642 01                     816 	.db #0x01	; 1
      008643 02                     817 	.db #0x02	; 2
      008644 04                     818 	.db #0x04	; 4
      008645 08                     819 	.db #0x08	; 8
                                    820 	.area INITIALIZER
                                    821 	.area CABS (ABS)
