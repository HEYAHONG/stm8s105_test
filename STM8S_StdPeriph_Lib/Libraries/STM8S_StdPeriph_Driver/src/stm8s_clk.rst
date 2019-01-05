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
      009849                         76 _CLK_DeInit:
                                     77 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 74: CLK->ICKR = CLK_ICKR_RESET_VALUE;
      009849 35 01 50 C0      [ 1]   78 	mov	0x50c0+0, #0x01
                                     79 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 75: CLK->ECKR = CLK_ECKR_RESET_VALUE;
      00984D 35 00 50 C1      [ 1]   80 	mov	0x50c1+0, #0x00
                                     81 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 76: CLK->SWR  = CLK_SWR_RESET_VALUE;
      009851 35 E1 50 C4      [ 1]   82 	mov	0x50c4+0, #0xe1
                                     83 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 77: CLK->SWCR = CLK_SWCR_RESET_VALUE;
      009855 35 00 50 C5      [ 1]   84 	mov	0x50c5+0, #0x00
                                     85 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 78: CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
      009859 35 18 50 C6      [ 1]   86 	mov	0x50c6+0, #0x18
                                     87 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 79: CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
      00985D 35 FF 50 C7      [ 1]   88 	mov	0x50c7+0, #0xff
                                     89 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 80: CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
      009861 35 FF 50 CA      [ 1]   90 	mov	0x50ca+0, #0xff
                                     91 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 81: CLK->CSSR = CLK_CSSR_RESET_VALUE;
      009865 35 00 50 C8      [ 1]   92 	mov	0x50c8+0, #0x00
                                     93 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 82: CLK->CCOR = CLK_CCOR_RESET_VALUE;
      009869 35 00 50 C9      [ 1]   94 	mov	0x50c9+0, #0x00
                                     95 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 83: while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
      00986D                         96 00101$:
      00986D C6 50 C9         [ 1]   97 	ld	a, 0x50c9
      009870 44               [ 1]   98 	srl	a
      009871 25 FA            [ 1]   99 	jrc	00101$
                                    100 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 85: CLK->CCOR = CLK_CCOR_RESET_VALUE;
      009873 35 00 50 C9      [ 1]  101 	mov	0x50c9+0, #0x00
                                    102 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 86: CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
      009877 35 00 50 CC      [ 1]  103 	mov	0x50cc+0, #0x00
                                    104 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 87: CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
      00987B 35 00 50 CD      [ 1]  105 	mov	0x50cd+0, #0x00
                                    106 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 88: }
      00987F 81               [ 4]  107 	ret
                                    108 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 99: void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
                                    109 ;	-----------------------------------------
                                    110 ;	 function CLK_FastHaltWakeUpCmd
                                    111 ;	-----------------------------------------
      009880                        112 _CLK_FastHaltWakeUpCmd:
                                    113 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 107: CLK->ICKR |= CLK_ICKR_FHWU;
      009880 C6 50 C0         [ 1]  114 	ld	a, 0x50c0
                                    115 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 104: if (NewState != DISABLE)
      009883 0D 03            [ 1]  116 	tnz	(0x03, sp)
      009885 27 06            [ 1]  117 	jreq	00102$
                                    118 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 107: CLK->ICKR |= CLK_ICKR_FHWU;
      009887 AA 04            [ 1]  119 	or	a, #0x04
      009889 C7 50 C0         [ 1]  120 	ld	0x50c0, a
      00988C 81               [ 4]  121 	ret
      00988D                        122 00102$:
                                    123 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 112: CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
      00988D A4 FB            [ 1]  124 	and	a, #0xfb
      00988F C7 50 C0         [ 1]  125 	ld	0x50c0, a
                                    126 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 114: }
      009892 81               [ 4]  127 	ret
                                    128 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 121: void CLK_HSECmd(FunctionalState NewState)
                                    129 ;	-----------------------------------------
                                    130 ;	 function CLK_HSECmd
                                    131 ;	-----------------------------------------
      009893                        132 _CLK_HSECmd:
                                    133 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 129: CLK->ECKR |= CLK_ECKR_HSEEN;
      009893 C6 50 C1         [ 1]  134 	ld	a, 0x50c1
                                    135 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 126: if (NewState != DISABLE)
      009896 0D 03            [ 1]  136 	tnz	(0x03, sp)
      009898 27 06            [ 1]  137 	jreq	00102$
                                    138 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 129: CLK->ECKR |= CLK_ECKR_HSEEN;
      00989A AA 01            [ 1]  139 	or	a, #0x01
      00989C C7 50 C1         [ 1]  140 	ld	0x50c1, a
      00989F 81               [ 4]  141 	ret
      0098A0                        142 00102$:
                                    143 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 134: CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
      0098A0 A4 FE            [ 1]  144 	and	a, #0xfe
      0098A2 C7 50 C1         [ 1]  145 	ld	0x50c1, a
                                    146 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 136: }
      0098A5 81               [ 4]  147 	ret
                                    148 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 143: void CLK_HSICmd(FunctionalState NewState)
                                    149 ;	-----------------------------------------
                                    150 ;	 function CLK_HSICmd
                                    151 ;	-----------------------------------------
      0098A6                        152 _CLK_HSICmd:
                                    153 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 151: CLK->ICKR |= CLK_ICKR_HSIEN;
      0098A6 C6 50 C0         [ 1]  154 	ld	a, 0x50c0
                                    155 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 148: if (NewState != DISABLE)
      0098A9 0D 03            [ 1]  156 	tnz	(0x03, sp)
      0098AB 27 06            [ 1]  157 	jreq	00102$
                                    158 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 151: CLK->ICKR |= CLK_ICKR_HSIEN;
      0098AD AA 01            [ 1]  159 	or	a, #0x01
      0098AF C7 50 C0         [ 1]  160 	ld	0x50c0, a
      0098B2 81               [ 4]  161 	ret
      0098B3                        162 00102$:
                                    163 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 156: CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
      0098B3 A4 FE            [ 1]  164 	and	a, #0xfe
      0098B5 C7 50 C0         [ 1]  165 	ld	0x50c0, a
                                    166 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 158: }
      0098B8 81               [ 4]  167 	ret
                                    168 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 166: void CLK_LSICmd(FunctionalState NewState)
                                    169 ;	-----------------------------------------
                                    170 ;	 function CLK_LSICmd
                                    171 ;	-----------------------------------------
      0098B9                        172 _CLK_LSICmd:
                                    173 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 174: CLK->ICKR |= CLK_ICKR_LSIEN;
      0098B9 C6 50 C0         [ 1]  174 	ld	a, 0x50c0
                                    175 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 171: if (NewState != DISABLE)
      0098BC 0D 03            [ 1]  176 	tnz	(0x03, sp)
      0098BE 27 06            [ 1]  177 	jreq	00102$
                                    178 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 174: CLK->ICKR |= CLK_ICKR_LSIEN;
      0098C0 AA 08            [ 1]  179 	or	a, #0x08
      0098C2 C7 50 C0         [ 1]  180 	ld	0x50c0, a
      0098C5 81               [ 4]  181 	ret
      0098C6                        182 00102$:
                                    183 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 179: CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
      0098C6 A4 F7            [ 1]  184 	and	a, #0xf7
      0098C8 C7 50 C0         [ 1]  185 	ld	0x50c0, a
                                    186 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 181: }
      0098CB 81               [ 4]  187 	ret
                                    188 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 189: void CLK_CCOCmd(FunctionalState NewState)
                                    189 ;	-----------------------------------------
                                    190 ;	 function CLK_CCOCmd
                                    191 ;	-----------------------------------------
      0098CC                        192 _CLK_CCOCmd:
                                    193 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 197: CLK->CCOR |= CLK_CCOR_CCOEN;
      0098CC C6 50 C9         [ 1]  194 	ld	a, 0x50c9
                                    195 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 194: if (NewState != DISABLE)
      0098CF 0D 03            [ 1]  196 	tnz	(0x03, sp)
      0098D1 27 06            [ 1]  197 	jreq	00102$
                                    198 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 197: CLK->CCOR |= CLK_CCOR_CCOEN;
      0098D3 AA 01            [ 1]  199 	or	a, #0x01
      0098D5 C7 50 C9         [ 1]  200 	ld	0x50c9, a
      0098D8 81               [ 4]  201 	ret
      0098D9                        202 00102$:
                                    203 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 202: CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
      0098D9 A4 FE            [ 1]  204 	and	a, #0xfe
      0098DB C7 50 C9         [ 1]  205 	ld	0x50c9, a
                                    206 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 204: }
      0098DE 81               [ 4]  207 	ret
                                    208 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 213: void CLK_ClockSwitchCmd(FunctionalState NewState)
                                    209 ;	-----------------------------------------
                                    210 ;	 function CLK_ClockSwitchCmd
                                    211 ;	-----------------------------------------
      0098DF                        212 _CLK_ClockSwitchCmd:
                                    213 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 221: CLK->SWCR |= CLK_SWCR_SWEN;
      0098DF C6 50 C5         [ 1]  214 	ld	a, 0x50c5
                                    215 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 218: if (NewState != DISABLE )
      0098E2 0D 03            [ 1]  216 	tnz	(0x03, sp)
      0098E4 27 06            [ 1]  217 	jreq	00102$
                                    218 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 221: CLK->SWCR |= CLK_SWCR_SWEN;
      0098E6 AA 02            [ 1]  219 	or	a, #0x02
      0098E8 C7 50 C5         [ 1]  220 	ld	0x50c5, a
      0098EB 81               [ 4]  221 	ret
      0098EC                        222 00102$:
                                    223 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 226: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
      0098EC A4 FD            [ 1]  224 	and	a, #0xfd
      0098EE C7 50 C5         [ 1]  225 	ld	0x50c5, a
                                    226 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 228: }
      0098F1 81               [ 4]  227 	ret
                                    228 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 238: void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
                                    229 ;	-----------------------------------------
                                    230 ;	 function CLK_SlowActiveHaltWakeUpCmd
                                    231 ;	-----------------------------------------
      0098F2                        232 _CLK_SlowActiveHaltWakeUpCmd:
                                    233 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 246: CLK->ICKR |= CLK_ICKR_SWUAH;
      0098F2 C6 50 C0         [ 1]  234 	ld	a, 0x50c0
                                    235 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 243: if (NewState != DISABLE)
      0098F5 0D 03            [ 1]  236 	tnz	(0x03, sp)
      0098F7 27 06            [ 1]  237 	jreq	00102$
                                    238 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 246: CLK->ICKR |= CLK_ICKR_SWUAH;
      0098F9 AA 20            [ 1]  239 	or	a, #0x20
      0098FB C7 50 C0         [ 1]  240 	ld	0x50c0, a
      0098FE 81               [ 4]  241 	ret
      0098FF                        242 00102$:
                                    243 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 251: CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
      0098FF A4 DF            [ 1]  244 	and	a, #0xdf
      009901 C7 50 C0         [ 1]  245 	ld	0x50c0, a
                                    246 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 253: }
      009904 81               [ 4]  247 	ret
                                    248 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 263: void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
                                    249 ;	-----------------------------------------
                                    250 ;	 function CLK_PeripheralClockConfig
                                    251 ;	-----------------------------------------
      009905                        252 _CLK_PeripheralClockConfig:
      009905 52 02            [ 2]  253 	sub	sp, #2
                                    254 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 274: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      009907 7B 05            [ 1]  255 	ld	a, (0x05, sp)
      009909 A4 0F            [ 1]  256 	and	a, #0x0f
      00990B 88               [ 1]  257 	push	a
      00990C A6 01            [ 1]  258 	ld	a, #0x01
      00990E 6B 03            [ 1]  259 	ld	(0x03, sp), a
      009910 84               [ 1]  260 	pop	a
      009911 4D               [ 1]  261 	tnz	a
      009912 27 05            [ 1]  262 	jreq	00128$
      009914                        263 00127$:
      009914 08 02            [ 1]  264 	sll	(0x02, sp)
      009916 4A               [ 1]  265 	dec	a
      009917 26 FB            [ 1]  266 	jrne	00127$
      009919                        267 00128$:
                                    268 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 279: CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      009919 7B 02            [ 1]  269 	ld	a, (0x02, sp)
      00991B 43               [ 1]  270 	cpl	a
      00991C 6B 01            [ 1]  271 	ld	(0x01, sp), a
                                    272 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 269: if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
      00991E 7B 05            [ 1]  273 	ld	a, (0x05, sp)
      009920 A5 10            [ 1]  274 	bcp	a, #0x10
      009922 26 15            [ 1]  275 	jrne	00108$
                                    276 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 274: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      009924 C6 50 C7         [ 1]  277 	ld	a, 0x50c7
                                    278 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 271: if (NewState != DISABLE)
      009927 0D 06            [ 1]  279 	tnz	(0x06, sp)
      009929 27 07            [ 1]  280 	jreq	00102$
                                    281 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 274: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      00992B 1A 02            [ 1]  282 	or	a, (0x02, sp)
      00992D C7 50 C7         [ 1]  283 	ld	0x50c7, a
      009930 20 1A            [ 2]  284 	jra	00110$
      009932                        285 00102$:
                                    286 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 279: CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      009932 14 01            [ 1]  287 	and	a, (0x01, sp)
      009934 C7 50 C7         [ 1]  288 	ld	0x50c7, a
      009937 20 13            [ 2]  289 	jra	00110$
      009939                        290 00108$:
                                    291 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 287: CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      009939 C6 50 CA         [ 1]  292 	ld	a, 0x50ca
                                    293 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 284: if (NewState != DISABLE)
      00993C 0D 06            [ 1]  294 	tnz	(0x06, sp)
      00993E 27 07            [ 1]  295 	jreq	00105$
                                    296 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 287: CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      009940 1A 02            [ 1]  297 	or	a, (0x02, sp)
      009942 C7 50 CA         [ 1]  298 	ld	0x50ca, a
      009945 20 05            [ 2]  299 	jra	00110$
      009947                        300 00105$:
                                    301 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 292: CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      009947 14 01            [ 1]  302 	and	a, (0x01, sp)
      009949 C7 50 CA         [ 1]  303 	ld	0x50ca, a
      00994C                        304 00110$:
                                    305 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 295: }
      00994C 5B 02            [ 2]  306 	addw	sp, #2
      00994E 81               [ 4]  307 	ret
                                    308 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 309: ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
                                    309 ;	-----------------------------------------
                                    310 ;	 function CLK_ClockSwitchConfig
                                    311 ;	-----------------------------------------
      00994F                        312 _CLK_ClockSwitchConfig:
                                    313 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 322: clock_master = (CLK_Source_TypeDef)CLK->CMSR;
      00994F C6 50 C3         [ 1]  314 	ld	a, 0x50c3
      009952 90 97            [ 1]  315 	ld	yl, a
                                    316 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 328: CLK->SWCR |= CLK_SWCR_SWEN;
      009954 C6 50 C5         [ 1]  317 	ld	a, 0x50c5
                                    318 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 325: if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
      009957 88               [ 1]  319 	push	a
      009958 7B 04            [ 1]  320 	ld	a, (0x04, sp)
      00995A 4A               [ 1]  321 	dec	a
      00995B 84               [ 1]  322 	pop	a
      00995C 26 38            [ 1]  323 	jrne	00122$
                                    324 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 328: CLK->SWCR |= CLK_SWCR_SWEN;
      00995E AA 02            [ 1]  325 	or	a, #0x02
      009960 C7 50 C5         [ 1]  326 	ld	0x50c5, a
      009963 C6 50 C5         [ 1]  327 	ld	a, 0x50c5
                                    328 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 331: if (ITState != DISABLE)
      009966 0D 05            [ 1]  329 	tnz	(0x05, sp)
      009968 27 07            [ 1]  330 	jreq	00102$
                                    331 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 333: CLK->SWCR |= CLK_SWCR_SWIEN;
      00996A AA 04            [ 1]  332 	or	a, #0x04
      00996C C7 50 C5         [ 1]  333 	ld	0x50c5, a
      00996F 20 05            [ 2]  334 	jra	00103$
      009971                        335 00102$:
                                    336 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 337: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
      009971 A4 FB            [ 1]  337 	and	a, #0xfb
      009973 C7 50 C5         [ 1]  338 	ld	0x50c5, a
      009976                        339 00103$:
                                    340 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 341: CLK->SWR = (uint8_t)CLK_NewClock;
      009976 AE 50 C4         [ 2]  341 	ldw	x, #0x50c4
      009979 7B 04            [ 1]  342 	ld	a, (0x04, sp)
      00997B F7               [ 1]  343 	ld	(x), a
                                    344 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 344: while((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
      00997C 5F               [ 1]  345 	clrw	x
      00997D 5A               [ 2]  346 	decw	x
      00997E                        347 00105$:
      00997E C6 50 C5         [ 1]  348 	ld	a, 0x50c5
      009981 44               [ 1]  349 	srl	a
      009982 24 06            [ 1]  350 	jrnc	00107$
      009984 5D               [ 2]  351 	tnzw	x
      009985 27 03            [ 1]  352 	jreq	00107$
                                    353 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 346: DownCounter--;
      009987 5A               [ 2]  354 	decw	x
      009988 20 F4            [ 2]  355 	jra	00105$
      00998A                        356 00107$:
                                    357 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 349: if(DownCounter != 0)
      00998A 5D               [ 2]  358 	tnzw	x
      00998B 27 05            [ 1]  359 	jreq	00109$
                                    360 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 351: Swif = SUCCESS;
      00998D A6 01            [ 1]  361 	ld	a, #0x01
      00998F 97               [ 1]  362 	ld	xl, a
      009990 20 37            [ 2]  363 	jra	00123$
      009992                        364 00109$:
                                    365 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 355: Swif = ERROR;
      009992 4F               [ 1]  366 	clr	a
      009993 97               [ 1]  367 	ld	xl, a
      009994 20 33            [ 2]  368 	jra	00123$
      009996                        369 00122$:
                                    370 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 361: if (ITState != DISABLE)
      009996 0D 05            [ 1]  371 	tnz	(0x05, sp)
      009998 27 07            [ 1]  372 	jreq	00112$
                                    373 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 363: CLK->SWCR |= CLK_SWCR_SWIEN;
      00999A AA 04            [ 1]  374 	or	a, #0x04
      00999C C7 50 C5         [ 1]  375 	ld	0x50c5, a
      00999F 20 05            [ 2]  376 	jra	00113$
      0099A1                        377 00112$:
                                    378 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 367: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
      0099A1 A4 FB            [ 1]  379 	and	a, #0xfb
      0099A3 C7 50 C5         [ 1]  380 	ld	0x50c5, a
      0099A6                        381 00113$:
                                    382 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 371: CLK->SWR = (uint8_t)CLK_NewClock;
      0099A6 AE 50 C4         [ 2]  383 	ldw	x, #0x50c4
      0099A9 7B 04            [ 1]  384 	ld	a, (0x04, sp)
      0099AB F7               [ 1]  385 	ld	(x), a
                                    386 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 374: while((((CLK->SWCR & CLK_SWCR_SWIF) != 0 ) && (DownCounter != 0)))
      0099AC 5F               [ 1]  387 	clrw	x
      0099AD 5A               [ 2]  388 	decw	x
      0099AE                        389 00115$:
      0099AE C6 50 C5         [ 1]  390 	ld	a, 0x50c5
      0099B1 A5 08            [ 1]  391 	bcp	a, #0x08
      0099B3 27 06            [ 1]  392 	jreq	00117$
      0099B5 5D               [ 2]  393 	tnzw	x
      0099B6 27 03            [ 1]  394 	jreq	00117$
                                    395 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 376: DownCounter--;
      0099B8 5A               [ 2]  396 	decw	x
      0099B9 20 F3            [ 2]  397 	jra	00115$
      0099BB                        398 00117$:
                                    399 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 379: if(DownCounter != 0)
      0099BB 5D               [ 2]  400 	tnzw	x
      0099BC 27 09            [ 1]  401 	jreq	00119$
                                    402 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 382: CLK->SWCR |= CLK_SWCR_SWEN;
      0099BE 72 12 50 C5      [ 1]  403 	bset	20677, #1
                                    404 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 383: Swif = SUCCESS;
      0099C2 A6 01            [ 1]  405 	ld	a, #0x01
      0099C4 97               [ 1]  406 	ld	xl, a
      0099C5 20 02            [ 2]  407 	jra	00123$
      0099C7                        408 00119$:
                                    409 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 387: Swif = ERROR;
      0099C7 4F               [ 1]  410 	clr	a
      0099C8 97               [ 1]  411 	ld	xl, a
      0099C9                        412 00123$:
                                    413 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 390: if(Swif != ERROR)
      0099C9 9F               [ 1]  414 	ld	a, xl
      0099CA 4D               [ 1]  415 	tnz	a
      0099CB 27 2E            [ 1]  416 	jreq	00136$
                                    417 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 393: if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
      0099CD 0D 06            [ 1]  418 	tnz	(0x06, sp)
      0099CF 26 0C            [ 1]  419 	jrne	00132$
      0099D1 90 9F            [ 1]  420 	ld	a, yl
      0099D3 A1 E1            [ 1]  421 	cp	a, #0xe1
      0099D5 26 06            [ 1]  422 	jrne	00132$
                                    423 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 395: CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
      0099D7 72 11 50 C0      [ 1]  424 	bres	20672, #0
      0099DB 20 1E            [ 2]  425 	jra	00136$
      0099DD                        426 00132$:
                                    427 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 397: else if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
      0099DD 0D 06            [ 1]  428 	tnz	(0x06, sp)
      0099DF 26 0C            [ 1]  429 	jrne	00128$
      0099E1 90 9F            [ 1]  430 	ld	a, yl
      0099E3 A1 D2            [ 1]  431 	cp	a, #0xd2
      0099E5 26 06            [ 1]  432 	jrne	00128$
                                    433 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 399: CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
      0099E7 72 17 50 C0      [ 1]  434 	bres	20672, #3
      0099EB 20 0E            [ 2]  435 	jra	00136$
      0099ED                        436 00128$:
                                    437 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 401: else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
      0099ED 0D 06            [ 1]  438 	tnz	(0x06, sp)
      0099EF 26 0A            [ 1]  439 	jrne	00136$
      0099F1 90 9F            [ 1]  440 	ld	a, yl
      0099F3 A1 B4            [ 1]  441 	cp	a, #0xb4
      0099F5 26 04            [ 1]  442 	jrne	00136$
                                    443 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 403: CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
      0099F7 72 11 50 C1      [ 1]  444 	bres	20673, #0
      0099FB                        445 00136$:
                                    446 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 406: return(Swif);
      0099FB 9F               [ 1]  447 	ld	a, xl
                                    448 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 407: }
      0099FC 81               [ 4]  449 	ret
                                    450 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 415: void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
                                    451 ;	-----------------------------------------
                                    452 ;	 function CLK_HSIPrescalerConfig
                                    453 ;	-----------------------------------------
      0099FD                        454 _CLK_HSIPrescalerConfig:
                                    455 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 421: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
      0099FD C6 50 C6         [ 1]  456 	ld	a, 0x50c6
      009A00 A4 E7            [ 1]  457 	and	a, #0xe7
      009A02 C7 50 C6         [ 1]  458 	ld	0x50c6, a
                                    459 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 424: CLK->CKDIVR |= (uint8_t)HSIPrescaler;
      009A05 C6 50 C6         [ 1]  460 	ld	a, 0x50c6
      009A08 1A 03            [ 1]  461 	or	a, (0x03, sp)
      009A0A C7 50 C6         [ 1]  462 	ld	0x50c6, a
                                    463 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 425: }
      009A0D 81               [ 4]  464 	ret
                                    465 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 436: void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
                                    466 ;	-----------------------------------------
                                    467 ;	 function CLK_CCOConfig
                                    468 ;	-----------------------------------------
      009A0E                        469 _CLK_CCOConfig:
                                    470 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 442: CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
      009A0E C6 50 C9         [ 1]  471 	ld	a, 0x50c9
      009A11 A4 E1            [ 1]  472 	and	a, #0xe1
      009A13 C7 50 C9         [ 1]  473 	ld	0x50c9, a
                                    474 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 445: CLK->CCOR |= (uint8_t)CLK_CCO;
      009A16 C6 50 C9         [ 1]  475 	ld	a, 0x50c9
      009A19 1A 03            [ 1]  476 	or	a, (0x03, sp)
      009A1B C7 50 C9         [ 1]  477 	ld	0x50c9, a
                                    478 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 448: CLK->CCOR |= CLK_CCOR_CCOEN;
      009A1E 72 10 50 C9      [ 1]  479 	bset	20681, #0
                                    480 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 449: }
      009A22 81               [ 4]  481 	ret
                                    482 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 459: void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
                                    483 ;	-----------------------------------------
                                    484 ;	 function CLK_ITConfig
                                    485 ;	-----------------------------------------
      009A23                        486 _CLK_ITConfig:
      009A23 88               [ 1]  487 	push	a
                                    488 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 467: switch (CLK_IT)
      009A24 7B 04            [ 1]  489 	ld	a, (0x04, sp)
      009A26 A0 0C            [ 1]  490 	sub	a, #0x0c
      009A28 26 04            [ 1]  491 	jrne	00140$
      009A2A 4C               [ 1]  492 	inc	a
      009A2B 6B 01            [ 1]  493 	ld	(0x01, sp), a
      009A2D C1                     494 	.byte 0xc1
      009A2E                        495 00140$:
      009A2E 0F 01            [ 1]  496 	clr	(0x01, sp)
      009A30                        497 00141$:
      009A30 7B 04            [ 1]  498 	ld	a, (0x04, sp)
      009A32 A0 1C            [ 1]  499 	sub	a, #0x1c
      009A34 26 02            [ 1]  500 	jrne	00143$
      009A36 4C               [ 1]  501 	inc	a
      009A37 21                     502 	.byte 0x21
      009A38                        503 00143$:
      009A38 4F               [ 1]  504 	clr	a
      009A39                        505 00144$:
                                    506 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 465: if (NewState != DISABLE)
      009A39 0D 05            [ 1]  507 	tnz	(0x05, sp)
      009A3B 27 13            [ 1]  508 	jreq	00110$
                                    509 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 467: switch (CLK_IT)
      009A3D 0D 01            [ 1]  510 	tnz	(0x01, sp)
      009A3F 26 09            [ 1]  511 	jrne	00102$
      009A41 4D               [ 1]  512 	tnz	a
      009A42 27 1D            [ 1]  513 	jreq	00112$
                                    514 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 470: CLK->SWCR |= CLK_SWCR_SWIEN;
      009A44 72 14 50 C5      [ 1]  515 	bset	20677, #2
                                    516 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 471: break;
      009A48 20 17            [ 2]  517 	jra	00112$
                                    518 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 472: case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
      009A4A                        519 00102$:
                                    520 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 473: CLK->CSSR |= CLK_CSSR_CSSDIE;
      009A4A 72 14 50 C8      [ 1]  521 	bset	20680, #2
                                    522 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 474: break;
      009A4E 20 11            [ 2]  523 	jra	00112$
                                    524 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 477: }
      009A50                        525 00110$:
                                    526 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 481: switch (CLK_IT)
      009A50 0D 01            [ 1]  527 	tnz	(0x01, sp)
      009A52 26 09            [ 1]  528 	jrne	00106$
      009A54 4D               [ 1]  529 	tnz	a
      009A55 27 0A            [ 1]  530 	jreq	00112$
                                    531 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 484: CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
      009A57 72 15 50 C5      [ 1]  532 	bres	20677, #2
                                    533 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 485: break;
      009A5B 20 04            [ 2]  534 	jra	00112$
                                    535 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 486: case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
      009A5D                        536 00106$:
                                    537 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 487: CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
      009A5D 72 15 50 C8      [ 1]  538 	bres	20680, #2
                                    539 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 491: }
      009A61                        540 00112$:
                                    541 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 493: }
      009A61 84               [ 1]  542 	pop	a
      009A62 81               [ 4]  543 	ret
                                    544 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 500: void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
                                    545 ;	-----------------------------------------
                                    546 ;	 function CLK_SYSCLKConfig
                                    547 ;	-----------------------------------------
      009A63                        548 _CLK_SYSCLKConfig:
      009A63 52 02            [ 2]  549 	sub	sp, #2
                                    550 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 507: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
      009A65 C6 50 C6         [ 1]  551 	ld	a, 0x50c6
                                    552 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 505: if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
      009A68 0D 05            [ 1]  553 	tnz	(0x05, sp)
      009A6A 2B 15            [ 1]  554 	jrmi	00102$
                                    555 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 507: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
      009A6C A4 E7            [ 1]  556 	and	a, #0xe7
      009A6E C7 50 C6         [ 1]  557 	ld	0x50c6, a
                                    558 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 508: CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
      009A71 C6 50 C6         [ 1]  559 	ld	a, 0x50c6
      009A74 6B 02            [ 1]  560 	ld	(0x02, sp), a
      009A76 7B 05            [ 1]  561 	ld	a, (0x05, sp)
      009A78 A4 18            [ 1]  562 	and	a, #0x18
      009A7A 1A 02            [ 1]  563 	or	a, (0x02, sp)
      009A7C C7 50 C6         [ 1]  564 	ld	0x50c6, a
      009A7F 20 13            [ 2]  565 	jra	00104$
      009A81                        566 00102$:
                                    567 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 512: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
      009A81 A4 F8            [ 1]  568 	and	a, #0xf8
      009A83 C7 50 C6         [ 1]  569 	ld	0x50c6, a
                                    570 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 513: CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
      009A86 C6 50 C6         [ 1]  571 	ld	a, 0x50c6
      009A89 6B 01            [ 1]  572 	ld	(0x01, sp), a
      009A8B 7B 05            [ 1]  573 	ld	a, (0x05, sp)
      009A8D A4 07            [ 1]  574 	and	a, #0x07
      009A8F 1A 01            [ 1]  575 	or	a, (0x01, sp)
      009A91 C7 50 C6         [ 1]  576 	ld	0x50c6, a
      009A94                        577 00104$:
                                    578 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 515: }
      009A94 5B 02            [ 2]  579 	addw	sp, #2
      009A96 81               [ 4]  580 	ret
                                    581 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 523: void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
                                    582 ;	-----------------------------------------
                                    583 ;	 function CLK_SWIMConfig
                                    584 ;	-----------------------------------------
      009A97                        585 _CLK_SWIMConfig:
                                    586 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 531: CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
      009A97 C6 50 CD         [ 1]  587 	ld	a, 0x50cd
                                    588 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 528: if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
      009A9A 0D 03            [ 1]  589 	tnz	(0x03, sp)
      009A9C 27 06            [ 1]  590 	jreq	00102$
                                    591 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 531: CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
      009A9E AA 01            [ 1]  592 	or	a, #0x01
      009AA0 C7 50 CD         [ 1]  593 	ld	0x50cd, a
      009AA3 81               [ 4]  594 	ret
      009AA4                        595 00102$:
                                    596 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 536: CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
      009AA4 A4 FE            [ 1]  597 	and	a, #0xfe
      009AA6 C7 50 CD         [ 1]  598 	ld	0x50cd, a
                                    599 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 538: }
      009AA9 81               [ 4]  600 	ret
                                    601 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 547: void CLK_ClockSecuritySystemEnable(void)
                                    602 ;	-----------------------------------------
                                    603 ;	 function CLK_ClockSecuritySystemEnable
                                    604 ;	-----------------------------------------
      009AAA                        605 _CLK_ClockSecuritySystemEnable:
                                    606 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 550: CLK->CSSR |= CLK_CSSR_CSSEN;
      009AAA 72 10 50 C8      [ 1]  607 	bset	20680, #0
                                    608 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 551: }
      009AAE 81               [ 4]  609 	ret
                                    610 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 559: CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
                                    611 ;	-----------------------------------------
                                    612 ;	 function CLK_GetSYSCLKSource
                                    613 ;	-----------------------------------------
      009AAF                        614 _CLK_GetSYSCLKSource:
                                    615 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 561: return((CLK_Source_TypeDef)CLK->CMSR);
      009AAF C6 50 C3         [ 1]  616 	ld	a, 0x50c3
                                    617 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 562: }
      009AB2 81               [ 4]  618 	ret
                                    619 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 570: uint32_t CLK_GetClockFreq(void)
                                    620 ;	-----------------------------------------
                                    621 ;	 function CLK_GetClockFreq
                                    622 ;	-----------------------------------------
      009AB3                        623 _CLK_GetClockFreq:
      009AB3 52 05            [ 2]  624 	sub	sp, #5
                                    625 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 577: clocksource = (CLK_Source_TypeDef)CLK->CMSR;
      009AB5 C6 50 C3         [ 1]  626 	ld	a, 0x50c3
      009AB8 6B 01            [ 1]  627 	ld	(0x01, sp), a
                                    628 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 579: if (clocksource == CLK_SOURCE_HSI)
      009ABA 7B 01            [ 1]  629 	ld	a, (0x01, sp)
      009ABC A1 E1            [ 1]  630 	cp	a, #0xe1
      009ABE 26 26            [ 1]  631 	jrne	00105$
                                    632 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 581: tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
      009AC0 C6 50 C6         [ 1]  633 	ld	a, 0x50c6
      009AC3 A4 18            [ 1]  634 	and	a, #0x18
                                    635 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 582: tmp = (uint8_t)(tmp >> 3);
      009AC5 44               [ 1]  636 	srl	a
      009AC6 44               [ 1]  637 	srl	a
      009AC7 44               [ 1]  638 	srl	a
                                    639 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 583: presc = HSIDivFactor[tmp];
      009AC8 5F               [ 1]  640 	clrw	x
      009AC9 97               [ 1]  641 	ld	xl, a
      009ACA 1C 87 F8         [ 2]  642 	addw	x, #_HSIDivFactor
      009ACD F6               [ 1]  643 	ld	a, (x)
                                    644 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 584: clockfrequency = HSI_VALUE / presc;
      009ACE 5F               [ 1]  645 	clrw	x
      009ACF 97               [ 1]  646 	ld	xl, a
      009AD0 90 5F            [ 1]  647 	clrw	y
      009AD2 89               [ 2]  648 	pushw	x
      009AD3 90 89            [ 2]  649 	pushw	y
      009AD5 4B 00            [ 1]  650 	push	#0x00
      009AD7 4B 24            [ 1]  651 	push	#0x24
      009AD9 4B F4            [ 1]  652 	push	#0xf4
      009ADB 4B 00            [ 1]  653 	push	#0x00
      009ADD CD 9C 45         [ 4]  654 	call	__divulong
      009AE0 5B 08            [ 2]  655 	addw	sp, #8
      009AE2 1F 04            [ 2]  656 	ldw	(0x04, sp), x
      009AE4 20 1A            [ 2]  657 	jra	00106$
      009AE6                        658 00105$:
                                    659 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 586: else if ( clocksource == CLK_SOURCE_LSI)
      009AE6 7B 01            [ 1]  660 	ld	a, (0x01, sp)
      009AE8 A1 D2            [ 1]  661 	cp	a, #0xd2
      009AEA 26 0B            [ 1]  662 	jrne	00102$
                                    663 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 588: clockfrequency = LSI_VALUE;
      009AEC AE F4 00         [ 2]  664 	ldw	x, #0xf400
      009AEF 1F 04            [ 2]  665 	ldw	(0x04, sp), x
      009AF1 90 AE 00 01      [ 2]  666 	ldw	y, #0x0001
      009AF5 20 09            [ 2]  667 	jra	00106$
      009AF7                        668 00102$:
                                    669 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 592: clockfrequency = HSE_VALUE;
      009AF7 AE 24 00         [ 2]  670 	ldw	x, #0x2400
      009AFA 1F 04            [ 2]  671 	ldw	(0x04, sp), x
      009AFC 90 AE 00 F4      [ 2]  672 	ldw	y, #0x00f4
      009B00                        673 00106$:
                                    674 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 595: return((uint32_t)clockfrequency);
      009B00 1E 04            [ 2]  675 	ldw	x, (0x04, sp)
                                    676 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 596: }
      009B02 5B 05            [ 2]  677 	addw	sp, #5
      009B04 81               [ 4]  678 	ret
                                    679 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 605: void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
                                    680 ;	-----------------------------------------
                                    681 ;	 function CLK_AdjustHSICalibrationValue
                                    682 ;	-----------------------------------------
      009B05                        683 _CLK_AdjustHSICalibrationValue:
                                    684 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 611: CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
      009B05 C6 50 CC         [ 1]  685 	ld	a, 0x50cc
      009B08 A4 F8            [ 1]  686 	and	a, #0xf8
      009B0A 1A 03            [ 1]  687 	or	a, (0x03, sp)
      009B0C C7 50 CC         [ 1]  688 	ld	0x50cc, a
                                    689 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 612: }
      009B0F 81               [ 4]  690 	ret
                                    691 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 623: void CLK_SYSCLKEmergencyClear(void)
                                    692 ;	-----------------------------------------
                                    693 ;	 function CLK_SYSCLKEmergencyClear
                                    694 ;	-----------------------------------------
      009B10                        695 _CLK_SYSCLKEmergencyClear:
                                    696 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 625: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
      009B10 72 11 50 C5      [ 1]  697 	bres	20677, #0
                                    698 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 626: }
      009B14 81               [ 4]  699 	ret
                                    700 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 635: FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
                                    701 ;	-----------------------------------------
                                    702 ;	 function CLK_GetFlagStatus
                                    703 ;	-----------------------------------------
      009B15                        704 _CLK_GetFlagStatus:
      009B15 88               [ 1]  705 	push	a
                                    706 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 645: statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
      009B16 4F               [ 1]  707 	clr	a
      009B17 97               [ 1]  708 	ld	xl, a
      009B18 7B 04            [ 1]  709 	ld	a, (0x04, sp)
      009B1A 95               [ 1]  710 	ld	xh, a
                                    711 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 648: if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
      009B1B A3 01 00         [ 2]  712 	cpw	x, #0x0100
      009B1E 26 05            [ 1]  713 	jrne	00111$
                                    714 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 650: tmpreg = CLK->ICKR;
      009B20 C6 50 C0         [ 1]  715 	ld	a, 0x50c0
      009B23 20 21            [ 2]  716 	jra	00112$
      009B25                        717 00111$:
                                    718 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 652: else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
      009B25 A3 02 00         [ 2]  719 	cpw	x, #0x0200
      009B28 26 05            [ 1]  720 	jrne	00108$
                                    721 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 654: tmpreg = CLK->ECKR;
      009B2A C6 50 C1         [ 1]  722 	ld	a, 0x50c1
      009B2D 20 17            [ 2]  723 	jra	00112$
      009B2F                        724 00108$:
                                    725 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 656: else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
      009B2F A3 03 00         [ 2]  726 	cpw	x, #0x0300
      009B32 26 05            [ 1]  727 	jrne	00105$
                                    728 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 658: tmpreg = CLK->SWCR;
      009B34 C6 50 C5         [ 1]  729 	ld	a, 0x50c5
      009B37 20 0D            [ 2]  730 	jra	00112$
      009B39                        731 00105$:
                                    732 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 660: else if (statusreg == 0x0400) /* The flag to check is in CSS register */
      009B39 A3 04 00         [ 2]  733 	cpw	x, #0x0400
      009B3C 26 05            [ 1]  734 	jrne	00102$
                                    735 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 662: tmpreg = CLK->CSSR;
      009B3E C6 50 C8         [ 1]  736 	ld	a, 0x50c8
      009B41 20 03            [ 2]  737 	jra	00112$
      009B43                        738 00102$:
                                    739 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 666: tmpreg = CLK->CCOR;
      009B43 C6 50 C9         [ 1]  740 	ld	a, 0x50c9
      009B46                        741 00112$:
                                    742 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 669: if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
      009B46 88               [ 1]  743 	push	a
      009B47 7B 06            [ 1]  744 	ld	a, (0x06, sp)
      009B49 6B 02            [ 1]  745 	ld	(0x02, sp), a
      009B4B 84               [ 1]  746 	pop	a
      009B4C 14 01            [ 1]  747 	and	a, (0x01, sp)
      009B4E 27 03            [ 1]  748 	jreq	00114$
                                    749 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 671: bitstatus = SET;
      009B50 A6 01            [ 1]  750 	ld	a, #0x01
                                    751 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 675: bitstatus = RESET;
      009B52 21                     752 	.byte 0x21
      009B53                        753 00114$:
      009B53 4F               [ 1]  754 	clr	a
      009B54                        755 00115$:
                                    756 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 679: return((FlagStatus)bitstatus);
                                    757 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 680: }
      009B54 5B 01            [ 2]  758 	addw	sp, #1
      009B56 81               [ 4]  759 	ret
                                    760 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 688: ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
                                    761 ;	-----------------------------------------
                                    762 ;	 function CLK_GetITStatus
                                    763 ;	-----------------------------------------
      009B57                        764 _CLK_GetITStatus:
                                    765 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 695: if (CLK_IT == CLK_IT_SWIF)
      009B57 7B 03            [ 1]  766 	ld	a, (0x03, sp)
      009B59 A1 1C            [ 1]  767 	cp	a, #0x1c
      009B5B 26 0D            [ 1]  768 	jrne	00108$
                                    769 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 698: if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
      009B5D C6 50 C5         [ 1]  770 	ld	a, 0x50c5
      009B60 14 03            [ 1]  771 	and	a, (0x03, sp)
                                    772 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 700: bitstatus = SET;
      009B62 A0 0C            [ 1]  773 	sub	a, #0x0c
      009B64 26 02            [ 1]  774 	jrne	00102$
      009B66 4C               [ 1]  775 	inc	a
      009B67 81               [ 4]  776 	ret
      009B68                        777 00102$:
                                    778 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 704: bitstatus = RESET;
      009B68 4F               [ 1]  779 	clr	a
      009B69 81               [ 4]  780 	ret
      009B6A                        781 00108$:
                                    782 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 710: if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
      009B6A C6 50 C8         [ 1]  783 	ld	a, 0x50c8
      009B6D 14 03            [ 1]  784 	and	a, (0x03, sp)
                                    785 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 712: bitstatus = SET;
      009B6F A0 0C            [ 1]  786 	sub	a, #0x0c
      009B71 26 02            [ 1]  787 	jrne	00105$
      009B73 4C               [ 1]  788 	inc	a
      009B74 81               [ 4]  789 	ret
      009B75                        790 00105$:
                                    791 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 716: bitstatus = RESET;
      009B75 4F               [ 1]  792 	clr	a
                                    793 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 721: return bitstatus;
                                    794 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 722: }
      009B76 81               [ 4]  795 	ret
                                    796 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 730: void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
                                    797 ;	-----------------------------------------
                                    798 ;	 function CLK_ClearITPendingBit
                                    799 ;	-----------------------------------------
      009B77                        800 _CLK_ClearITPendingBit:
                                    801 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 735: if (CLK_IT == (uint8_t)CLK_IT_CSSD)
      009B77 7B 03            [ 1]  802 	ld	a, (0x03, sp)
      009B79 A1 0C            [ 1]  803 	cp	a, #0x0c
      009B7B 26 05            [ 1]  804 	jrne	00102$
                                    805 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 738: CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
      009B7D 72 17 50 C8      [ 1]  806 	bres	20680, #3
      009B81 81               [ 4]  807 	ret
      009B82                        808 00102$:
                                    809 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 743: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
      009B82 72 17 50 C5      [ 1]  810 	bres	20677, #3
                                    811 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_clk.c: 746: }
      009B86 81               [ 4]  812 	ret
                                    813 	.area CODE
                                    814 	.area CONST
      0087F8                        815 _HSIDivFactor:
      0087F8 01                     816 	.db #0x01	; 1
      0087F9 02                     817 	.db #0x02	; 2
      0087FA 04                     818 	.db #0x04	; 4
      0087FB 08                     819 	.db #0x08	; 8
                                    820 	.area INITIALIZER
                                    821 	.area CABS (ABS)
