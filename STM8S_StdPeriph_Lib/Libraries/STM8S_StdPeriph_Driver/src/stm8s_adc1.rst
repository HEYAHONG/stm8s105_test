                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.8.0 #10562 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_adc1
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _ADC1_DeInit
                                     12 	.globl _ADC1_Init
                                     13 	.globl _ADC1_Cmd
                                     14 	.globl _ADC1_ScanModeCmd
                                     15 	.globl _ADC1_DataBufferCmd
                                     16 	.globl _ADC1_ITConfig
                                     17 	.globl _ADC1_PrescalerConfig
                                     18 	.globl _ADC1_SchmittTriggerConfig
                                     19 	.globl _ADC1_ConversionConfig
                                     20 	.globl _ADC1_ExternalTriggerConfig
                                     21 	.globl _ADC1_StartConversion
                                     22 	.globl _ADC1_GetConversionValue
                                     23 	.globl _ADC1_AWDChannelConfig
                                     24 	.globl _ADC1_SetHighThreshold
                                     25 	.globl _ADC1_SetLowThreshold
                                     26 	.globl _ADC1_GetBufferValue
                                     27 	.globl _ADC1_GetAWDChannelStatus
                                     28 	.globl _ADC1_GetFlagStatus
                                     29 	.globl _ADC1_ClearFlag
                                     30 	.globl _ADC1_GetITStatus
                                     31 	.globl _ADC1_ClearITPendingBit
                                     32 ;--------------------------------------------------------
                                     33 ; ram data
                                     34 ;--------------------------------------------------------
                                     35 	.area DATA
                                     36 ;--------------------------------------------------------
                                     37 ; ram data
                                     38 ;--------------------------------------------------------
                                     39 	.area INITIALIZED
                                     40 ;--------------------------------------------------------
                                     41 ; absolute external ram data
                                     42 ;--------------------------------------------------------
                                     43 	.area DABS (ABS)
                                     44 
                                     45 ; default segment ordering for linker
                                     46 	.area HOME
                                     47 	.area GSINIT
                                     48 	.area GSFINAL
                                     49 	.area CONST
                                     50 	.area INITIALIZER
                                     51 	.area CODE
                                     52 
                                     53 ;--------------------------------------------------------
                                     54 ; global & static initialisations
                                     55 ;--------------------------------------------------------
                                     56 	.area HOME
                                     57 	.area GSINIT
                                     58 	.area GSFINAL
                                     59 	.area GSINIT
                                     60 ;--------------------------------------------------------
                                     61 ; Home
                                     62 ;--------------------------------------------------------
                                     63 	.area HOME
                                     64 	.area HOME
                                     65 ;--------------------------------------------------------
                                     66 ; code
                                     67 ;--------------------------------------------------------
                                     68 	.area CODE
                                     69 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 52: void ADC1_DeInit(void)
                                     70 ;	-----------------------------------------
                                     71 ;	 function ADC1_DeInit
                                     72 ;	-----------------------------------------
      008CD1                         73 _ADC1_DeInit:
                                     74 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 54: ADC1->CSR  = ADC1_CSR_RESET_VALUE;
      008CD1 35 00 54 00      [ 1]   75 	mov	0x5400+0, #0x00
                                     76 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 55: ADC1->CR1  = ADC1_CR1_RESET_VALUE;
      008CD5 35 00 54 01      [ 1]   77 	mov	0x5401+0, #0x00
                                     78 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 56: ADC1->CR2  = ADC1_CR2_RESET_VALUE;
      008CD9 35 00 54 02      [ 1]   79 	mov	0x5402+0, #0x00
                                     80 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 57: ADC1->CR3  = ADC1_CR3_RESET_VALUE;
      008CDD 35 00 54 03      [ 1]   81 	mov	0x5403+0, #0x00
                                     82 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 58: ADC1->TDRH = ADC1_TDRH_RESET_VALUE;
      008CE1 35 00 54 06      [ 1]   83 	mov	0x5406+0, #0x00
                                     84 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 59: ADC1->TDRL = ADC1_TDRL_RESET_VALUE;
      008CE5 35 00 54 07      [ 1]   85 	mov	0x5407+0, #0x00
                                     86 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 60: ADC1->HTRH = ADC1_HTRH_RESET_VALUE;
      008CE9 35 FF 54 08      [ 1]   87 	mov	0x5408+0, #0xff
                                     88 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 61: ADC1->HTRL = ADC1_HTRL_RESET_VALUE;
      008CED 35 03 54 09      [ 1]   89 	mov	0x5409+0, #0x03
                                     90 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 62: ADC1->LTRH = ADC1_LTRH_RESET_VALUE;
      008CF1 35 00 54 0A      [ 1]   91 	mov	0x540a+0, #0x00
                                     92 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 63: ADC1->LTRL = ADC1_LTRL_RESET_VALUE;
      008CF5 35 00 54 0B      [ 1]   93 	mov	0x540b+0, #0x00
                                     94 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 64: ADC1->AWCRH = ADC1_AWCRH_RESET_VALUE;
      008CF9 35 00 54 0E      [ 1]   95 	mov	0x540e+0, #0x00
                                     96 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 65: ADC1->AWCRL = ADC1_AWCRL_RESET_VALUE;
      008CFD 35 00 54 0F      [ 1]   97 	mov	0x540f+0, #0x00
                                     98 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 66: }
      008D01 81               [ 4]   99 	ret
                                    100 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 88: void ADC1_Init(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_PresSel_TypeDef ADC1_PrescalerSelection, ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState ADC1_ExtTriggerState, ADC1_Align_TypeDef ADC1_Align, ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState ADC1_SchmittTriggerState)
                                    101 ;	-----------------------------------------
                                    102 ;	 function ADC1_Init
                                    103 ;	-----------------------------------------
      008D02                        104 _ADC1_Init:
                                    105 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 103: ADC1_ConversionConfig(ADC1_ConversionMode, ADC1_Channel, ADC1_Align);
      008D02 7B 08            [ 1]  106 	ld	a, (0x08, sp)
      008D04 88               [ 1]  107 	push	a
      008D05 7B 05            [ 1]  108 	ld	a, (0x05, sp)
      008D07 88               [ 1]  109 	push	a
      008D08 7B 05            [ 1]  110 	ld	a, (0x05, sp)
      008D0A 88               [ 1]  111 	push	a
      008D0B CD 8E 18         [ 4]  112 	call	_ADC1_ConversionConfig
      008D0E 5B 03            [ 2]  113 	addw	sp, #3
                                    114 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 105: ADC1_PrescalerConfig(ADC1_PrescalerSelection);
      008D10 7B 05            [ 1]  115 	ld	a, (0x05, sp)
      008D12 88               [ 1]  116 	push	a
      008D13 CD 8D 89         [ 4]  117 	call	_ADC1_PrescalerConfig
      008D16 84               [ 1]  118 	pop	a
                                    119 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 110: ADC1_ExternalTriggerConfig(ADC1_ExtTrigger, ADC1_ExtTriggerState);
      008D17 7B 07            [ 1]  120 	ld	a, (0x07, sp)
      008D19 88               [ 1]  121 	push	a
      008D1A 7B 07            [ 1]  122 	ld	a, (0x07, sp)
      008D1C 88               [ 1]  123 	push	a
      008D1D CD 8E 4B         [ 4]  124 	call	_ADC1_ExternalTriggerConfig
      008D20 5B 02            [ 2]  125 	addw	sp, #2
                                    126 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 115: ADC1_SchmittTriggerConfig(ADC1_SchmittTriggerChannel, ADC1_SchmittTriggerState);
      008D22 7B 0A            [ 1]  127 	ld	a, (0x0a, sp)
      008D24 88               [ 1]  128 	push	a
      008D25 7B 0A            [ 1]  129 	ld	a, (0x0a, sp)
      008D27 88               [ 1]  130 	push	a
      008D28 CD 8D 9A         [ 4]  131 	call	_ADC1_SchmittTriggerConfig
      008D2B 5B 02            [ 2]  132 	addw	sp, #2
                                    133 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 118: ADC1->CR1 |= ADC1_CR1_ADON;
      008D2D 72 10 54 01      [ 1]  134 	bset	21505, #0
                                    135 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 119: }
      008D31 81               [ 4]  136 	ret
                                    137 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 126: void ADC1_Cmd(FunctionalState NewState)
                                    138 ;	-----------------------------------------
                                    139 ;	 function ADC1_Cmd
                                    140 ;	-----------------------------------------
      008D32                        141 _ADC1_Cmd:
                                    142 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 133: ADC1->CR1 |= ADC1_CR1_ADON;
      008D32 C6 54 01         [ 1]  143 	ld	a, 0x5401
                                    144 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 131: if (NewState != DISABLE)
      008D35 0D 03            [ 1]  145 	tnz	(0x03, sp)
      008D37 27 06            [ 1]  146 	jreq	00102$
                                    147 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 133: ADC1->CR1 |= ADC1_CR1_ADON;
      008D39 AA 01            [ 1]  148 	or	a, #0x01
      008D3B C7 54 01         [ 1]  149 	ld	0x5401, a
      008D3E 81               [ 4]  150 	ret
      008D3F                        151 00102$:
                                    152 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 137: ADC1->CR1 &= (uint8_t)(~ADC1_CR1_ADON);
      008D3F A4 FE            [ 1]  153 	and	a, #0xfe
      008D41 C7 54 01         [ 1]  154 	ld	0x5401, a
                                    155 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 139: }
      008D44 81               [ 4]  156 	ret
                                    157 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 146: void ADC1_ScanModeCmd(FunctionalState NewState)
                                    158 ;	-----------------------------------------
                                    159 ;	 function ADC1_ScanModeCmd
                                    160 ;	-----------------------------------------
      008D45                        161 _ADC1_ScanModeCmd:
                                    162 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 153: ADC1->CR2 |= ADC1_CR2_SCAN;
      008D45 C6 54 02         [ 1]  163 	ld	a, 0x5402
                                    164 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 151: if (NewState != DISABLE)
      008D48 0D 03            [ 1]  165 	tnz	(0x03, sp)
      008D4A 27 06            [ 1]  166 	jreq	00102$
                                    167 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 153: ADC1->CR2 |= ADC1_CR2_SCAN;
      008D4C AA 02            [ 1]  168 	or	a, #0x02
      008D4E C7 54 02         [ 1]  169 	ld	0x5402, a
      008D51 81               [ 4]  170 	ret
      008D52                        171 00102$:
                                    172 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 157: ADC1->CR2 &= (uint8_t)(~ADC1_CR2_SCAN);
      008D52 A4 FD            [ 1]  173 	and	a, #0xfd
      008D54 C7 54 02         [ 1]  174 	ld	0x5402, a
                                    175 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 159: }
      008D57 81               [ 4]  176 	ret
                                    177 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 166: void ADC1_DataBufferCmd(FunctionalState NewState)
                                    178 ;	-----------------------------------------
                                    179 ;	 function ADC1_DataBufferCmd
                                    180 ;	-----------------------------------------
      008D58                        181 _ADC1_DataBufferCmd:
                                    182 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 173: ADC1->CR3 |= ADC1_CR3_DBUF;
      008D58 C6 54 03         [ 1]  183 	ld	a, 0x5403
                                    184 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 171: if (NewState != DISABLE)
      008D5B 0D 03            [ 1]  185 	tnz	(0x03, sp)
      008D5D 27 06            [ 1]  186 	jreq	00102$
                                    187 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 173: ADC1->CR3 |= ADC1_CR3_DBUF;
      008D5F AA 80            [ 1]  188 	or	a, #0x80
      008D61 C7 54 03         [ 1]  189 	ld	0x5403, a
      008D64 81               [ 4]  190 	ret
      008D65                        191 00102$:
                                    192 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 177: ADC1->CR3 &= (uint8_t)(~ADC1_CR3_DBUF);
      008D65 A4 7F            [ 1]  193 	and	a, #0x7f
      008D67 C7 54 03         [ 1]  194 	ld	0x5403, a
                                    195 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 179: }
      008D6A 81               [ 4]  196 	ret
                                    197 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 190: void ADC1_ITConfig(ADC1_IT_TypeDef ADC1_IT, FunctionalState NewState)
                                    198 ;	-----------------------------------------
                                    199 ;	 function ADC1_ITConfig
                                    200 ;	-----------------------------------------
      008D6B                        201 _ADC1_ITConfig:
      008D6B 88               [ 1]  202 	push	a
                                    203 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 199: ADC1->CSR |= (uint8_t)ADC1_IT;
      008D6C C6 54 00         [ 1]  204 	ld	a, 0x5400
      008D6F 6B 01            [ 1]  205 	ld	(0x01, sp), a
                                    206 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 196: if (NewState != DISABLE)
      008D71 0D 06            [ 1]  207 	tnz	(0x06, sp)
      008D73 27 09            [ 1]  208 	jreq	00102$
                                    209 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 199: ADC1->CSR |= (uint8_t)ADC1_IT;
      008D75 7B 05            [ 1]  210 	ld	a, (0x05, sp)
      008D77 1A 01            [ 1]  211 	or	a, (0x01, sp)
      008D79 C7 54 00         [ 1]  212 	ld	0x5400, a
      008D7C 20 09            [ 2]  213 	jra	00104$
      008D7E                        214 00102$:
                                    215 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 204: ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ADC1_IT);
      008D7E 1E 04            [ 2]  216 	ldw	x, (0x04, sp)
      008D80 53               [ 2]  217 	cplw	x
      008D81 9F               [ 1]  218 	ld	a, xl
      008D82 14 01            [ 1]  219 	and	a, (0x01, sp)
      008D84 C7 54 00         [ 1]  220 	ld	0x5400, a
      008D87                        221 00104$:
                                    222 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 206: }
      008D87 84               [ 1]  223 	pop	a
      008D88 81               [ 4]  224 	ret
                                    225 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 214: void ADC1_PrescalerConfig(ADC1_PresSel_TypeDef ADC1_Prescaler)
                                    226 ;	-----------------------------------------
                                    227 ;	 function ADC1_PrescalerConfig
                                    228 ;	-----------------------------------------
      008D89                        229 _ADC1_PrescalerConfig:
                                    230 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 220: ADC1->CR1 &= (uint8_t)(~ADC1_CR1_SPSEL);
      008D89 C6 54 01         [ 1]  231 	ld	a, 0x5401
      008D8C A4 8F            [ 1]  232 	and	a, #0x8f
      008D8E C7 54 01         [ 1]  233 	ld	0x5401, a
                                    234 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 222: ADC1->CR1 |= (uint8_t)(ADC1_Prescaler);
      008D91 C6 54 01         [ 1]  235 	ld	a, 0x5401
      008D94 1A 03            [ 1]  236 	or	a, (0x03, sp)
      008D96 C7 54 01         [ 1]  237 	ld	0x5401, a
                                    238 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 223: }
      008D99 81               [ 4]  239 	ret
                                    240 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 233: void ADC1_SchmittTriggerConfig(ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState NewState)
                                    241 ;	-----------------------------------------
                                    242 ;	 function ADC1_SchmittTriggerConfig
                                    243 ;	-----------------------------------------
      008D9A                        244 _ADC1_SchmittTriggerConfig:
      008D9A 52 02            [ 2]  245 	sub	sp, #2
                                    246 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 239: if (ADC1_SchmittTriggerChannel == ADC1_SCHMITTTRIG_ALL)
      008D9C 7B 05            [ 1]  247 	ld	a, (0x05, sp)
      008D9E 4C               [ 1]  248 	inc	a
      008D9F 26 21            [ 1]  249 	jrne	00114$
                                    250 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 243: ADC1->TDRL &= (uint8_t)0x0;
      008DA1 C6 54 07         [ 1]  251 	ld	a, 0x5407
                                    252 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 241: if (NewState != DISABLE)
      008DA4 0D 06            [ 1]  253 	tnz	(0x06, sp)
      008DA6 27 0D            [ 1]  254 	jreq	00102$
                                    255 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 243: ADC1->TDRL &= (uint8_t)0x0;
      008DA8 35 00 54 07      [ 1]  256 	mov	0x5407+0, #0x00
                                    257 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 244: ADC1->TDRH &= (uint8_t)0x0;
      008DAC C6 54 06         [ 1]  258 	ld	a, 0x5406
      008DAF 35 00 54 06      [ 1]  259 	mov	0x5406+0, #0x00
      008DB3 20 60            [ 2]  260 	jra	00116$
      008DB5                        261 00102$:
                                    262 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 248: ADC1->TDRL |= (uint8_t)0xFF;
      008DB5 35 FF 54 07      [ 1]  263 	mov	0x5407+0, #0xff
                                    264 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 249: ADC1->TDRH |= (uint8_t)0xFF;
      008DB9 C6 54 06         [ 1]  265 	ld	a, 0x5406
      008DBC 35 FF 54 06      [ 1]  266 	mov	0x5406+0, #0xff
      008DC0 20 53            [ 2]  267 	jra	00116$
      008DC2                        268 00114$:
                                    269 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 252: else if (ADC1_SchmittTriggerChannel < ADC1_SCHMITTTRIG_CHANNEL8)
      008DC2 7B 05            [ 1]  270 	ld	a, (0x05, sp)
      008DC4 A1 08            [ 1]  271 	cp	a, #0x08
      008DC6 24 25            [ 1]  272 	jrnc	00111$
                                    273 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 243: ADC1->TDRL &= (uint8_t)0x0;
      008DC8 C6 54 07         [ 1]  274 	ld	a, 0x5407
      008DCB 6B 01            [ 1]  275 	ld	(0x01, sp), a
                                    276 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 256: ADC1->TDRL &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel));
      008DCD A6 01            [ 1]  277 	ld	a, #0x01
      008DCF 88               [ 1]  278 	push	a
      008DD0 7B 06            [ 1]  279 	ld	a, (0x06, sp)
      008DD2 27 05            [ 1]  280 	jreq	00149$
      008DD4                        281 00148$:
      008DD4 08 01            [ 1]  282 	sll	(1, sp)
      008DD6 4A               [ 1]  283 	dec	a
      008DD7 26 FB            [ 1]  284 	jrne	00148$
      008DD9                        285 00149$:
      008DD9 84               [ 1]  286 	pop	a
                                    287 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 254: if (NewState != DISABLE)
      008DDA 0D 06            [ 1]  288 	tnz	(0x06, sp)
      008DDC 27 08            [ 1]  289 	jreq	00105$
                                    290 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 256: ADC1->TDRL &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel));
      008DDE 43               [ 1]  291 	cpl	a
      008DDF 14 01            [ 1]  292 	and	a, (0x01, sp)
      008DE1 C7 54 07         [ 1]  293 	ld	0x5407, a
      008DE4 20 2F            [ 2]  294 	jra	00116$
      008DE6                        295 00105$:
                                    296 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 260: ADC1->TDRL |= (uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel);
      008DE6 1A 01            [ 1]  297 	or	a, (0x01, sp)
      008DE8 C7 54 07         [ 1]  298 	ld	0x5407, a
      008DEB 20 28            [ 2]  299 	jra	00116$
      008DED                        300 00111$:
                                    301 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 244: ADC1->TDRH &= (uint8_t)0x0;
      008DED C6 54 06         [ 1]  302 	ld	a, 0x5406
      008DF0 6B 02            [ 1]  303 	ld	(0x02, sp), a
                                    304 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 267: ADC1->TDRH &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8)));
      008DF2 7B 05            [ 1]  305 	ld	a, (0x05, sp)
      008DF4 A0 08            [ 1]  306 	sub	a, #0x08
      008DF6 97               [ 1]  307 	ld	xl, a
      008DF7 A6 01            [ 1]  308 	ld	a, #0x01
      008DF9 88               [ 1]  309 	push	a
      008DFA 9F               [ 1]  310 	ld	a, xl
      008DFB 4D               [ 1]  311 	tnz	a
      008DFC 27 05            [ 1]  312 	jreq	00152$
      008DFE                        313 00151$:
      008DFE 08 01            [ 1]  314 	sll	(1, sp)
      008E00 4A               [ 1]  315 	dec	a
      008E01 26 FB            [ 1]  316 	jrne	00151$
      008E03                        317 00152$:
      008E03 84               [ 1]  318 	pop	a
                                    319 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 265: if (NewState != DISABLE)
      008E04 0D 06            [ 1]  320 	tnz	(0x06, sp)
      008E06 27 08            [ 1]  321 	jreq	00108$
                                    322 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 267: ADC1->TDRH &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8)));
      008E08 43               [ 1]  323 	cpl	a
      008E09 14 02            [ 1]  324 	and	a, (0x02, sp)
      008E0B C7 54 06         [ 1]  325 	ld	0x5406, a
      008E0E 20 05            [ 2]  326 	jra	00116$
      008E10                        327 00108$:
                                    328 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 271: ADC1->TDRH |= (uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8));
      008E10 1A 02            [ 1]  329 	or	a, (0x02, sp)
      008E12 C7 54 06         [ 1]  330 	ld	0x5406, a
      008E15                        331 00116$:
                                    332 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 274: }
      008E15 5B 02            [ 2]  333 	addw	sp, #2
      008E17 81               [ 4]  334 	ret
                                    335 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 286: void ADC1_ConversionConfig(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_Align_TypeDef ADC1_Align)
                                    336 ;	-----------------------------------------
                                    337 ;	 function ADC1_ConversionConfig
                                    338 ;	-----------------------------------------
      008E18                        339 _ADC1_ConversionConfig:
                                    340 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 294: ADC1->CR2 &= (uint8_t)(~ADC1_CR2_ALIGN);
      008E18 72 17 54 02      [ 1]  341 	bres	21506, #3
                                    342 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 296: ADC1->CR2 |= (uint8_t)(ADC1_Align);
      008E1C C6 54 02         [ 1]  343 	ld	a, 0x5402
      008E1F 1A 05            [ 1]  344 	or	a, (0x05, sp)
      008E21 C7 54 02         [ 1]  345 	ld	0x5402, a
                                    346 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 301: ADC1->CR1 |= ADC1_CR1_CONT;
      008E24 C6 54 01         [ 1]  347 	ld	a, 0x5401
                                    348 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 298: if (ADC1_ConversionMode == ADC1_CONVERSIONMODE_CONTINUOUS)
      008E27 88               [ 1]  349 	push	a
      008E28 7B 04            [ 1]  350 	ld	a, (0x04, sp)
      008E2A 4A               [ 1]  351 	dec	a
      008E2B 84               [ 1]  352 	pop	a
      008E2C 26 07            [ 1]  353 	jrne	00102$
                                    354 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 301: ADC1->CR1 |= ADC1_CR1_CONT;
      008E2E AA 02            [ 1]  355 	or	a, #0x02
      008E30 C7 54 01         [ 1]  356 	ld	0x5401, a
      008E33 20 05            [ 2]  357 	jra	00103$
      008E35                        358 00102$:
                                    359 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 306: ADC1->CR1 &= (uint8_t)(~ADC1_CR1_CONT);
      008E35 A4 FD            [ 1]  360 	and	a, #0xfd
      008E37 C7 54 01         [ 1]  361 	ld	0x5401, a
      008E3A                        362 00103$:
                                    363 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 310: ADC1->CSR &= (uint8_t)(~ADC1_CSR_CH);
      008E3A C6 54 00         [ 1]  364 	ld	a, 0x5400
      008E3D A4 F0            [ 1]  365 	and	a, #0xf0
      008E3F C7 54 00         [ 1]  366 	ld	0x5400, a
                                    367 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 312: ADC1->CSR |= (uint8_t)(ADC1_Channel);
      008E42 C6 54 00         [ 1]  368 	ld	a, 0x5400
      008E45 1A 04            [ 1]  369 	or	a, (0x04, sp)
      008E47 C7 54 00         [ 1]  370 	ld	0x5400, a
                                    371 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 313: }
      008E4A 81               [ 4]  372 	ret
                                    373 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 325: void ADC1_ExternalTriggerConfig(ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState NewState)
                                    374 ;	-----------------------------------------
                                    375 ;	 function ADC1_ExternalTriggerConfig
                                    376 ;	-----------------------------------------
      008E4B                        377 _ADC1_ExternalTriggerConfig:
                                    378 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 332: ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTSEL);
      008E4B C6 54 02         [ 1]  379 	ld	a, 0x5402
      008E4E A4 CF            [ 1]  380 	and	a, #0xcf
      008E50 C7 54 02         [ 1]  381 	ld	0x5402, a
      008E53 C6 54 02         [ 1]  382 	ld	a, 0x5402
                                    383 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 334: if (NewState != DISABLE)
      008E56 0D 04            [ 1]  384 	tnz	(0x04, sp)
      008E58 27 07            [ 1]  385 	jreq	00102$
                                    386 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 337: ADC1->CR2 |= (uint8_t)(ADC1_CR2_EXTTRIG);
      008E5A AA 40            [ 1]  387 	or	a, #0x40
      008E5C C7 54 02         [ 1]  388 	ld	0x5402, a
      008E5F 20 05            [ 2]  389 	jra	00103$
      008E61                        390 00102$:
                                    391 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 342: ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTTRIG);
      008E61 A4 BF            [ 1]  392 	and	a, #0xbf
      008E63 C7 54 02         [ 1]  393 	ld	0x5402, a
      008E66                        394 00103$:
                                    395 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 346: ADC1->CR2 |= (uint8_t)(ADC1_ExtTrigger);
      008E66 C6 54 02         [ 1]  396 	ld	a, 0x5402
      008E69 1A 03            [ 1]  397 	or	a, (0x03, sp)
      008E6B C7 54 02         [ 1]  398 	ld	0x5402, a
                                    399 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 347: }
      008E6E 81               [ 4]  400 	ret
                                    401 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 358: void ADC1_StartConversion(void)
                                    402 ;	-----------------------------------------
                                    403 ;	 function ADC1_StartConversion
                                    404 ;	-----------------------------------------
      008E6F                        405 _ADC1_StartConversion:
                                    406 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 360: ADC1->CR1 |= ADC1_CR1_ADON;
      008E6F 72 10 54 01      [ 1]  407 	bset	21505, #0
                                    408 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 361: }
      008E73 81               [ 4]  409 	ret
                                    410 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 370: uint16_t ADC1_GetConversionValue(void)
                                    411 ;	-----------------------------------------
                                    412 ;	 function ADC1_GetConversionValue
                                    413 ;	-----------------------------------------
      008E74                        414 _ADC1_GetConversionValue:
      008E74 52 08            [ 2]  415 	sub	sp, #8
                                    416 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 375: if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
      008E76 C6 54 02         [ 1]  417 	ld	a, 0x5402
      008E79 A5 08            [ 1]  418 	bcp	a, #0x08
      008E7B 27 15            [ 1]  419 	jreq	00102$
                                    420 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 378: templ = ADC1->DRL;
      008E7D C6 54 05         [ 1]  421 	ld	a, 0x5405
      008E80 97               [ 1]  422 	ld	xl, a
                                    423 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 380: temph = ADC1->DRH;
      008E81 C6 54 04         [ 1]  424 	ld	a, 0x5404
                                    425 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 382: temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
      008E84 0F 04            [ 1]  426 	clr	(0x04, sp)
      008E86 0F 01            [ 1]  427 	clr	(0x01, sp)
      008E88 1A 01            [ 1]  428 	or	a, (0x01, sp)
      008E8A 01               [ 1]  429 	rrwa	x
      008E8B 1A 04            [ 1]  430 	or	a, (0x04, sp)
      008E8D 97               [ 1]  431 	ld	xl, a
      008E8E 1F 07            [ 2]  432 	ldw	(0x07, sp), x
      008E90 20 1D            [ 2]  433 	jra	00103$
      008E92                        434 00102$:
                                    435 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 387: temph = ADC1->DRH;
      008E92 C6 54 04         [ 1]  436 	ld	a, 0x5404
      008E95 5F               [ 1]  437 	clrw	x
      008E96 97               [ 1]  438 	ld	xl, a
      008E97 51               [ 1]  439 	exgw	x, y
                                    440 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 389: templ = ADC1->DRL;
      008E98 C6 54 05         [ 1]  441 	ld	a, 0x5405
                                    442 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 391: temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)((uint16_t)temph << 8));
      008E9B 5F               [ 1]  443 	clrw	x
      008E9C 97               [ 1]  444 	ld	xl, a
      008E9D 58               [ 2]  445 	sllw	x
      008E9E 58               [ 2]  446 	sllw	x
      008E9F 58               [ 2]  447 	sllw	x
      008EA0 58               [ 2]  448 	sllw	x
      008EA1 58               [ 2]  449 	sllw	x
      008EA2 58               [ 2]  450 	sllw	x
      008EA3 1F 05            [ 2]  451 	ldw	(0x05, sp), x
      008EA5 7B 06            [ 1]  452 	ld	a, (0x06, sp)
      008EA7 97               [ 1]  453 	ld	xl, a
      008EA8 90 9F            [ 1]  454 	ld	a, yl
      008EAA 1A 05            [ 1]  455 	or	a, (0x05, sp)
      008EAC 95               [ 1]  456 	ld	xh, a
      008EAD 1F 07            [ 2]  457 	ldw	(0x07, sp), x
      008EAF                        458 00103$:
                                    459 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 394: return ((uint16_t)temph);
      008EAF 1E 07            [ 2]  460 	ldw	x, (0x07, sp)
                                    461 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 395: }
      008EB1 5B 08            [ 2]  462 	addw	sp, #8
      008EB3 81               [ 4]  463 	ret
                                    464 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 405: void ADC1_AWDChannelConfig(ADC1_Channel_TypeDef Channel, FunctionalState NewState)
                                    465 ;	-----------------------------------------
                                    466 ;	 function ADC1_AWDChannelConfig
                                    467 ;	-----------------------------------------
      008EB4                        468 _ADC1_AWDChannelConfig:
      008EB4 52 02            [ 2]  469 	sub	sp, #2
                                    470 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 411: if (Channel < (uint8_t)8)
      008EB6 7B 05            [ 1]  471 	ld	a, (0x05, sp)
      008EB8 A1 08            [ 1]  472 	cp	a, #0x08
      008EBA 24 25            [ 1]  473 	jrnc	00108$
                                    474 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 415: ADC1->AWCRL |= (uint8_t)((uint8_t)1 << Channel);
      008EBC C6 54 0F         [ 1]  475 	ld	a, 0x540f
      008EBF 6B 02            [ 1]  476 	ld	(0x02, sp), a
      008EC1 A6 01            [ 1]  477 	ld	a, #0x01
      008EC3 88               [ 1]  478 	push	a
      008EC4 7B 06            [ 1]  479 	ld	a, (0x06, sp)
      008EC6 27 05            [ 1]  480 	jreq	00129$
      008EC8                        481 00128$:
      008EC8 08 01            [ 1]  482 	sll	(1, sp)
      008ECA 4A               [ 1]  483 	dec	a
      008ECB 26 FB            [ 1]  484 	jrne	00128$
      008ECD                        485 00129$:
      008ECD 84               [ 1]  486 	pop	a
                                    487 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 413: if (NewState != DISABLE)
      008ECE 0D 06            [ 1]  488 	tnz	(0x06, sp)
      008ED0 27 07            [ 1]  489 	jreq	00102$
                                    490 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 415: ADC1->AWCRL |= (uint8_t)((uint8_t)1 << Channel);
      008ED2 1A 02            [ 1]  491 	or	a, (0x02, sp)
      008ED4 C7 54 0F         [ 1]  492 	ld	0x540f, a
      008ED7 20 30            [ 2]  493 	jra	00110$
      008ED9                        494 00102$:
                                    495 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 419: ADC1->AWCRL &= (uint8_t)~(uint8_t)((uint8_t)1 << Channel);
      008ED9 43               [ 1]  496 	cpl	a
      008EDA 14 02            [ 1]  497 	and	a, (0x02, sp)
      008EDC C7 54 0F         [ 1]  498 	ld	0x540f, a
      008EDF 20 28            [ 2]  499 	jra	00110$
      008EE1                        500 00108$:
                                    501 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 426: ADC1->AWCRH |= (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8));
      008EE1 C6 54 0E         [ 1]  502 	ld	a, 0x540e
      008EE4 6B 01            [ 1]  503 	ld	(0x01, sp), a
      008EE6 7B 05            [ 1]  504 	ld	a, (0x05, sp)
      008EE8 A0 08            [ 1]  505 	sub	a, #0x08
      008EEA 97               [ 1]  506 	ld	xl, a
      008EEB A6 01            [ 1]  507 	ld	a, #0x01
      008EED 88               [ 1]  508 	push	a
      008EEE 9F               [ 1]  509 	ld	a, xl
      008EEF 4D               [ 1]  510 	tnz	a
      008EF0 27 05            [ 1]  511 	jreq	00132$
      008EF2                        512 00131$:
      008EF2 08 01            [ 1]  513 	sll	(1, sp)
      008EF4 4A               [ 1]  514 	dec	a
      008EF5 26 FB            [ 1]  515 	jrne	00131$
      008EF7                        516 00132$:
      008EF7 84               [ 1]  517 	pop	a
                                    518 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 424: if (NewState != DISABLE)
      008EF8 0D 06            [ 1]  519 	tnz	(0x06, sp)
      008EFA 27 07            [ 1]  520 	jreq	00105$
                                    521 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 426: ADC1->AWCRH |= (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8));
      008EFC 1A 01            [ 1]  522 	or	a, (0x01, sp)
      008EFE C7 54 0E         [ 1]  523 	ld	0x540e, a
      008F01 20 06            [ 2]  524 	jra	00110$
      008F03                        525 00105$:
                                    526 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 430: ADC1->AWCRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (uint8_t)(Channel - (uint8_t)8));
      008F03 43               [ 1]  527 	cpl	a
      008F04 14 01            [ 1]  528 	and	a, (0x01, sp)
      008F06 C7 54 0E         [ 1]  529 	ld	0x540e, a
      008F09                        530 00110$:
                                    531 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 433: }
      008F09 5B 02            [ 2]  532 	addw	sp, #2
      008F0B 81               [ 4]  533 	ret
                                    534 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 441: void ADC1_SetHighThreshold(uint16_t Threshold)
                                    535 ;	-----------------------------------------
                                    536 ;	 function ADC1_SetHighThreshold
                                    537 ;	-----------------------------------------
      008F0C                        538 _ADC1_SetHighThreshold:
                                    539 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 443: ADC1->HTRH = (uint8_t)(Threshold >> (uint8_t)2);
      008F0C 1E 03            [ 2]  540 	ldw	x, (0x03, sp)
      008F0E 54               [ 2]  541 	srlw	x
      008F0F 54               [ 2]  542 	srlw	x
      008F10 9F               [ 1]  543 	ld	a, xl
      008F11 C7 54 08         [ 1]  544 	ld	0x5408, a
                                    545 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 444: ADC1->HTRL = (uint8_t)Threshold;
      008F14 7B 04            [ 1]  546 	ld	a, (0x04, sp)
      008F16 C7 54 09         [ 1]  547 	ld	0x5409, a
                                    548 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 445: }
      008F19 81               [ 4]  549 	ret
                                    550 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 453: void ADC1_SetLowThreshold(uint16_t Threshold)
                                    551 ;	-----------------------------------------
                                    552 ;	 function ADC1_SetLowThreshold
                                    553 ;	-----------------------------------------
      008F1A                        554 _ADC1_SetLowThreshold:
                                    555 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 455: ADC1->LTRL = (uint8_t)Threshold;
      008F1A 7B 04            [ 1]  556 	ld	a, (0x04, sp)
      008F1C C7 54 0B         [ 1]  557 	ld	0x540b, a
                                    558 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 456: ADC1->LTRH = (uint8_t)(Threshold >> (uint8_t)2);
      008F1F 1E 03            [ 2]  559 	ldw	x, (0x03, sp)
      008F21 54               [ 2]  560 	srlw	x
      008F22 54               [ 2]  561 	srlw	x
      008F23 9F               [ 1]  562 	ld	a, xl
      008F24 C7 54 0A         [ 1]  563 	ld	0x540a, a
                                    564 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 457: }
      008F27 81               [ 4]  565 	ret
                                    566 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 466: uint16_t ADC1_GetBufferValue(uint8_t Buffer)
                                    567 ;	-----------------------------------------
                                    568 ;	 function ADC1_GetBufferValue
                                    569 ;	-----------------------------------------
      008F28                        570 _ADC1_GetBufferValue:
      008F28 52 0B            [ 2]  571 	sub	sp, #11
                                    572 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 474: if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
      008F2A C6 54 02         [ 1]  573 	ld	a, 0x5402
      008F2D 6B 0B            [ 1]  574 	ld	(0x0b, sp), a
                                    575 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 477: templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
      008F2F 7B 0E            [ 1]  576 	ld	a, (0x0e, sp)
      008F31 48               [ 1]  577 	sll	a
      008F32 5F               [ 1]  578 	clrw	x
      008F33 97               [ 1]  579 	ld	xl, a
      008F34 51               [ 1]  580 	exgw	x, y
      008F35 93               [ 1]  581 	ldw	x, y
      008F36 1C 53 E1         [ 2]  582 	addw	x, #0x53e1
                                    583 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 479: temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
      008F39 72 A9 53 E0      [ 2]  584 	addw	y, #0x53e0
                                    585 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 477: templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
                                    586 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 479: temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
                                    587 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 477: templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
      008F3D F6               [ 1]  588 	ld	a, (x)
      008F3E 97               [ 1]  589 	ld	xl, a
                                    590 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 479: temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
      008F3F 90 F6            [ 1]  591 	ld	a, (y)
                                    592 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 474: if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
      008F41 88               [ 1]  593 	push	a
      008F42 7B 0C            [ 1]  594 	ld	a, (0x0c, sp)
      008F44 A5 08            [ 1]  595 	bcp	a, #0x08
      008F46 84               [ 1]  596 	pop	a
      008F47 27 0E            [ 1]  597 	jreq	00102$
                                    598 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 477: templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
                                    599 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 479: temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
                                    600 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 481: temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
      008F49 0F 08            [ 1]  601 	clr	(0x08, sp)
      008F4B 0F 03            [ 1]  602 	clr	(0x03, sp)
      008F4D 1A 03            [ 1]  603 	or	a, (0x03, sp)
      008F4F 01               [ 1]  604 	rrwa	x
      008F50 1A 08            [ 1]  605 	or	a, (0x08, sp)
      008F52 97               [ 1]  606 	ld	xl, a
      008F53 1F 01            [ 2]  607 	ldw	(0x01, sp), x
      008F55 20 19            [ 2]  608 	jra	00103$
      008F57                        609 00102$:
                                    610 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 486: temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
                                    611 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 488: templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
                                    612 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 490: temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)(temph << 8));
      008F57 02               [ 1]  613 	rlwa	x
      008F58 4F               [ 1]  614 	clr	a
      008F59 01               [ 1]  615 	rrwa	x
      008F5A 58               [ 2]  616 	sllw	x
      008F5B 58               [ 2]  617 	sllw	x
      008F5C 58               [ 2]  618 	sllw	x
      008F5D 58               [ 2]  619 	sllw	x
      008F5E 58               [ 2]  620 	sllw	x
      008F5F 58               [ 2]  621 	sllw	x
      008F60 1F 09            [ 2]  622 	ldw	(0x09, sp), x
      008F62 97               [ 1]  623 	ld	xl, a
      008F63 7B 0A            [ 1]  624 	ld	a, (0x0a, sp)
      008F65 6B 06            [ 1]  625 	ld	(0x06, sp), a
      008F67 9F               [ 1]  626 	ld	a, xl
      008F68 1A 09            [ 1]  627 	or	a, (0x09, sp)
      008F6A 6B 01            [ 1]  628 	ld	(0x01, sp), a
      008F6C 7B 06            [ 1]  629 	ld	a, (0x06, sp)
      008F6E 6B 02            [ 1]  630 	ld	(0x02, sp), a
      008F70                        631 00103$:
                                    632 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 493: return ((uint16_t)temph);
      008F70 1E 01            [ 2]  633 	ldw	x, (0x01, sp)
                                    634 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 494: }
      008F72 5B 0B            [ 2]  635 	addw	sp, #11
      008F74 81               [ 4]  636 	ret
                                    637 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 502: FlagStatus ADC1_GetAWDChannelStatus(ADC1_Channel_TypeDef Channel)
                                    638 ;	-----------------------------------------
                                    639 ;	 function ADC1_GetAWDChannelStatus
                                    640 ;	-----------------------------------------
      008F75                        641 _ADC1_GetAWDChannelStatus:
      008F75 52 02            [ 2]  642 	sub	sp, #2
                                    643 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 509: if (Channel < (uint8_t)8)
      008F77 7B 05            [ 1]  644 	ld	a, (0x05, sp)
      008F79 A1 08            [ 1]  645 	cp	a, #0x08
      008F7B 24 16            [ 1]  646 	jrnc	00102$
                                    647 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 511: status = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << Channel));
      008F7D C6 54 0D         [ 1]  648 	ld	a, 0x540d
      008F80 88               [ 1]  649 	push	a
      008F81 A6 01            [ 1]  650 	ld	a, #0x01
      008F83 6B 03            [ 1]  651 	ld	(0x03, sp), a
      008F85 7B 06            [ 1]  652 	ld	a, (0x06, sp)
      008F87 27 05            [ 1]  653 	jreq	00113$
      008F89                        654 00112$:
      008F89 08 03            [ 1]  655 	sll	(0x03, sp)
      008F8B 4A               [ 1]  656 	dec	a
      008F8C 26 FB            [ 1]  657 	jrne	00112$
      008F8E                        658 00113$:
      008F8E 84               [ 1]  659 	pop	a
      008F8F 14 02            [ 1]  660 	and	a, (0x02, sp)
      008F91 20 19            [ 2]  661 	jra	00103$
      008F93                        662 00102$:
                                    663 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 515: status = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8)));
      008F93 C6 54 0C         [ 1]  664 	ld	a, 0x540c
      008F96 97               [ 1]  665 	ld	xl, a
      008F97 7B 05            [ 1]  666 	ld	a, (0x05, sp)
      008F99 A0 08            [ 1]  667 	sub	a, #0x08
      008F9B 88               [ 1]  668 	push	a
      008F9C A6 01            [ 1]  669 	ld	a, #0x01
      008F9E 6B 02            [ 1]  670 	ld	(0x02, sp), a
      008FA0 84               [ 1]  671 	pop	a
      008FA1 4D               [ 1]  672 	tnz	a
      008FA2 27 05            [ 1]  673 	jreq	00115$
      008FA4                        674 00114$:
      008FA4 08 01            [ 1]  675 	sll	(0x01, sp)
      008FA6 4A               [ 1]  676 	dec	a
      008FA7 26 FB            [ 1]  677 	jrne	00114$
      008FA9                        678 00115$:
      008FA9 9F               [ 1]  679 	ld	a, xl
      008FAA 14 01            [ 1]  680 	and	a, (0x01, sp)
      008FAC                        681 00103$:
                                    682 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 518: return ((FlagStatus)status);
                                    683 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 519: }
      008FAC 5B 02            [ 2]  684 	addw	sp, #2
      008FAE 81               [ 4]  685 	ret
                                    686 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 527: FlagStatus ADC1_GetFlagStatus(ADC1_Flag_TypeDef Flag)
                                    687 ;	-----------------------------------------
                                    688 ;	 function ADC1_GetFlagStatus
                                    689 ;	-----------------------------------------
      008FAF                        690 _ADC1_GetFlagStatus:
      008FAF 52 04            [ 2]  691 	sub	sp, #4
                                    692 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 535: if ((Flag & 0x0F) == 0x01)
      008FB1 7B 07            [ 1]  693 	ld	a, (0x07, sp)
      008FB3 6B 03            [ 1]  694 	ld	(0x03, sp), a
      008FB5 0F 02            [ 1]  695 	clr	(0x02, sp)
      008FB7 7B 03            [ 1]  696 	ld	a, (0x03, sp)
      008FB9 A4 0F            [ 1]  697 	and	a, #0x0f
      008FBB 97               [ 1]  698 	ld	xl, a
      008FBC 4F               [ 1]  699 	clr	a
      008FBD 95               [ 1]  700 	ld	xh, a
      008FBE 5A               [ 2]  701 	decw	x
      008FBF 26 07            [ 1]  702 	jrne	00108$
                                    703 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 538: flagstatus = (uint8_t)(ADC1->CR3 & ADC1_CR3_OVR);
      008FC1 C6 54 03         [ 1]  704 	ld	a, 0x5403
      008FC4 A4 40            [ 1]  705 	and	a, #0x40
      008FC6 20 49            [ 2]  706 	jra	00109$
      008FC8                        707 00108$:
                                    708 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 540: else if ((Flag & 0xF0) == 0x10)
      008FC8 7B 03            [ 1]  709 	ld	a, (0x03, sp)
      008FCA A4 F0            [ 1]  710 	and	a, #0xf0
      008FCC 97               [ 1]  711 	ld	xl, a
      008FCD 4F               [ 1]  712 	clr	a
      008FCE 95               [ 1]  713 	ld	xh, a
      008FCF A3 00 10         [ 2]  714 	cpw	x, #0x0010
      008FD2 26 38            [ 1]  715 	jrne	00105$
                                    716 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 543: temp = (uint8_t)(Flag & (uint8_t)0x0F);
      008FD4 7B 07            [ 1]  717 	ld	a, (0x07, sp)
      008FD6 A4 0F            [ 1]  718 	and	a, #0x0f
                                    719 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 544: if (temp < 8)
      008FD8 97               [ 1]  720 	ld	xl, a
      008FD9 A1 08            [ 1]  721 	cp	a, #0x08
      008FDB 24 16            [ 1]  722 	jrnc	00102$
                                    723 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 546: flagstatus = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
      008FDD C6 54 0D         [ 1]  724 	ld	a, 0x540d
      008FE0 6B 04            [ 1]  725 	ld	(0x04, sp), a
      008FE2 A6 01            [ 1]  726 	ld	a, #0x01
      008FE4 88               [ 1]  727 	push	a
      008FE5 9F               [ 1]  728 	ld	a, xl
      008FE6 4D               [ 1]  729 	tnz	a
      008FE7 27 05            [ 1]  730 	jreq	00135$
      008FE9                        731 00134$:
      008FE9 08 01            [ 1]  732 	sll	(1, sp)
      008FEB 4A               [ 1]  733 	dec	a
      008FEC 26 FB            [ 1]  734 	jrne	00134$
      008FEE                        735 00135$:
      008FEE 84               [ 1]  736 	pop	a
      008FEF 14 04            [ 1]  737 	and	a, (0x04, sp)
      008FF1 20 1E            [ 2]  738 	jra	00109$
      008FF3                        739 00102$:
                                    740 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 550: flagstatus = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
      008FF3 C6 54 0C         [ 1]  741 	ld	a, 0x540c
      008FF6 6B 01            [ 1]  742 	ld	(0x01, sp), a
      008FF8 1D 00 08         [ 2]  743 	subw	x, #8
      008FFB A6 01            [ 1]  744 	ld	a, #0x01
      008FFD 88               [ 1]  745 	push	a
      008FFE 9F               [ 1]  746 	ld	a, xl
      008FFF 4D               [ 1]  747 	tnz	a
      009000 27 05            [ 1]  748 	jreq	00137$
      009002                        749 00136$:
      009002 08 01            [ 1]  750 	sll	(1, sp)
      009004 4A               [ 1]  751 	dec	a
      009005 26 FB            [ 1]  752 	jrne	00136$
      009007                        753 00137$:
      009007 84               [ 1]  754 	pop	a
      009008 14 01            [ 1]  755 	and	a, (0x01, sp)
      00900A 20 05            [ 2]  756 	jra	00109$
      00900C                        757 00105$:
                                    758 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 555: flagstatus = (uint8_t)(ADC1->CSR & Flag);
      00900C C6 54 00         [ 1]  759 	ld	a, 0x5400
      00900F 14 07            [ 1]  760 	and	a, (0x07, sp)
      009011                        761 00109$:
                                    762 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 557: return ((FlagStatus)flagstatus);
                                    763 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 559: }
      009011 5B 04            [ 2]  764 	addw	sp, #4
      009013 81               [ 4]  765 	ret
                                    766 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 567: void ADC1_ClearFlag(ADC1_Flag_TypeDef Flag)
                                    767 ;	-----------------------------------------
                                    768 ;	 function ADC1_ClearFlag
                                    769 ;	-----------------------------------------
      009014                        770 _ADC1_ClearFlag:
      009014 52 05            [ 2]  771 	sub	sp, #5
                                    772 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 574: if ((Flag & 0x0F) == 0x01)
      009016 7B 08            [ 1]  773 	ld	a, (0x08, sp)
      009018 0F 01            [ 1]  774 	clr	(0x01, sp)
      00901A 88               [ 1]  775 	push	a
      00901B A4 0F            [ 1]  776 	and	a, #0x0f
      00901D 97               [ 1]  777 	ld	xl, a
      00901E 4F               [ 1]  778 	clr	a
      00901F 95               [ 1]  779 	ld	xh, a
      009020 84               [ 1]  780 	pop	a
      009021 5A               [ 2]  781 	decw	x
      009022 26 06            [ 1]  782 	jrne	00108$
                                    783 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 577: ADC1->CR3 &= (uint8_t)(~ADC1_CR3_OVR);
      009024 72 1D 54 03      [ 1]  784 	bres	21507, #6
      009028 20 57            [ 2]  785 	jra	00110$
      00902A                        786 00108$:
                                    787 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 579: else if ((Flag & 0xF0) == 0x10)
      00902A A4 F0            [ 1]  788 	and	a, #0xf0
      00902C 97               [ 1]  789 	ld	xl, a
      00902D 4F               [ 1]  790 	clr	a
      00902E 95               [ 1]  791 	ld	xh, a
      00902F A3 00 10         [ 2]  792 	cpw	x, #0x0010
      009032 26 40            [ 1]  793 	jrne	00105$
                                    794 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 582: temp = (uint8_t)(Flag & (uint8_t)0x0F);
      009034 7B 08            [ 1]  795 	ld	a, (0x08, sp)
      009036 A4 0F            [ 1]  796 	and	a, #0x0f
                                    797 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 583: if (temp < 8)
      009038 97               [ 1]  798 	ld	xl, a
      009039 A1 08            [ 1]  799 	cp	a, #0x08
      00903B 24 1A            [ 1]  800 	jrnc	00102$
                                    801 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 585: ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
      00903D C6 54 0D         [ 1]  802 	ld	a, 0x540d
      009040 6B 05            [ 1]  803 	ld	(0x05, sp), a
      009042 A6 01            [ 1]  804 	ld	a, #0x01
      009044 88               [ 1]  805 	push	a
      009045 9F               [ 1]  806 	ld	a, xl
      009046 4D               [ 1]  807 	tnz	a
      009047 27 05            [ 1]  808 	jreq	00135$
      009049                        809 00134$:
      009049 08 01            [ 1]  810 	sll	(1, sp)
      00904B 4A               [ 1]  811 	dec	a
      00904C 26 FB            [ 1]  812 	jrne	00134$
      00904E                        813 00135$:
      00904E 84               [ 1]  814 	pop	a
      00904F 43               [ 1]  815 	cpl	a
      009050 14 05            [ 1]  816 	and	a, (0x05, sp)
      009052 C7 54 0D         [ 1]  817 	ld	0x540d, a
      009055 20 2A            [ 2]  818 	jra	00110$
      009057                        819 00102$:
                                    820 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 589: ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
      009057 C6 54 0C         [ 1]  821 	ld	a, 0x540c
      00905A 6B 04            [ 1]  822 	ld	(0x04, sp), a
      00905C 1D 00 08         [ 2]  823 	subw	x, #8
      00905F A6 01            [ 1]  824 	ld	a, #0x01
      009061 88               [ 1]  825 	push	a
      009062 9F               [ 1]  826 	ld	a, xl
      009063 4D               [ 1]  827 	tnz	a
      009064 27 05            [ 1]  828 	jreq	00137$
      009066                        829 00136$:
      009066 08 01            [ 1]  830 	sll	(1, sp)
      009068 4A               [ 1]  831 	dec	a
      009069 26 FB            [ 1]  832 	jrne	00136$
      00906B                        833 00137$:
      00906B 84               [ 1]  834 	pop	a
      00906C 43               [ 1]  835 	cpl	a
      00906D 14 04            [ 1]  836 	and	a, (0x04, sp)
      00906F C7 54 0C         [ 1]  837 	ld	0x540c, a
      009072 20 0D            [ 2]  838 	jra	00110$
      009074                        839 00105$:
                                    840 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 594: ADC1->CSR &= (uint8_t) (~Flag);
      009074 C6 54 00         [ 1]  841 	ld	a, 0x5400
      009077 6B 03            [ 1]  842 	ld	(0x03, sp), a
      009079 7B 08            [ 1]  843 	ld	a, (0x08, sp)
      00907B 43               [ 1]  844 	cpl	a
      00907C 14 03            [ 1]  845 	and	a, (0x03, sp)
      00907E C7 54 00         [ 1]  846 	ld	0x5400, a
      009081                        847 00110$:
                                    848 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 596: }
      009081 5B 05            [ 2]  849 	addw	sp, #5
      009083 81               [ 4]  850 	ret
                                    851 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 616: ITStatus ADC1_GetITStatus(ADC1_IT_TypeDef ITPendingBit)
                                    852 ;	-----------------------------------------
                                    853 ;	 function ADC1_GetITStatus
                                    854 ;	-----------------------------------------
      009084                        855 _ADC1_GetITStatus:
      009084 52 03            [ 2]  856 	sub	sp, #3
                                    857 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 624: if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
      009086 7B 07            [ 1]  858 	ld	a, (0x07, sp)
      009088 A4 F0            [ 1]  859 	and	a, #0xf0
      00908A 97               [ 1]  860 	ld	xl, a
      00908B 4F               [ 1]  861 	clr	a
      00908C 95               [ 1]  862 	ld	xh, a
                                    863 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 627: temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
      00908D 7B 07            [ 1]  864 	ld	a, (0x07, sp)
                                    865 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 624: if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
      00908F A3 00 10         [ 2]  866 	cpw	x, #0x0010
      009092 26 36            [ 1]  867 	jrne	00105$
                                    868 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 627: temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
      009094 A4 0F            [ 1]  869 	and	a, #0x0f
                                    870 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 628: if (temp < 8)
      009096 97               [ 1]  871 	ld	xl, a
      009097 A1 08            [ 1]  872 	cp	a, #0x08
      009099 24 16            [ 1]  873 	jrnc	00102$
                                    874 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 630: itstatus = (ITStatus)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
      00909B C6 54 0D         [ 1]  875 	ld	a, 0x540d
      00909E 88               [ 1]  876 	push	a
      00909F A6 01            [ 1]  877 	ld	a, #0x01
      0090A1 6B 04            [ 1]  878 	ld	(0x04, sp), a
      0090A3 9F               [ 1]  879 	ld	a, xl
      0090A4 4D               [ 1]  880 	tnz	a
      0090A5 27 05            [ 1]  881 	jreq	00124$
      0090A7                        882 00123$:
      0090A7 08 04            [ 1]  883 	sll	(0x04, sp)
      0090A9 4A               [ 1]  884 	dec	a
      0090AA 26 FB            [ 1]  885 	jrne	00123$
      0090AC                        886 00124$:
      0090AC 84               [ 1]  887 	pop	a
      0090AD 14 03            [ 1]  888 	and	a, (0x03, sp)
      0090AF 20 23            [ 2]  889 	jra	00106$
      0090B1                        890 00102$:
                                    891 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 634: itstatus = (ITStatus)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
      0090B1 C6 54 0C         [ 1]  892 	ld	a, 0x540c
      0090B4 6B 02            [ 1]  893 	ld	(0x02, sp), a
      0090B6 1D 00 08         [ 2]  894 	subw	x, #8
      0090B9 A6 01            [ 1]  895 	ld	a, #0x01
      0090BB 88               [ 1]  896 	push	a
      0090BC 9F               [ 1]  897 	ld	a, xl
      0090BD 4D               [ 1]  898 	tnz	a
      0090BE 27 05            [ 1]  899 	jreq	00126$
      0090C0                        900 00125$:
      0090C0 08 01            [ 1]  901 	sll	(1, sp)
      0090C2 4A               [ 1]  902 	dec	a
      0090C3 26 FB            [ 1]  903 	jrne	00125$
      0090C5                        904 00126$:
      0090C5 84               [ 1]  905 	pop	a
      0090C6 14 02            [ 1]  906 	and	a, (0x02, sp)
      0090C8 20 0A            [ 2]  907 	jra	00106$
      0090CA                        908 00105$:
                                    909 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 639: itstatus = (ITStatus)(ADC1->CSR & (uint8_t)ITPendingBit);
      0090CA AE 54 00         [ 2]  910 	ldw	x, #0x5400
      0090CD 88               [ 1]  911 	push	a
      0090CE F6               [ 1]  912 	ld	a, (x)
      0090CF 6B 02            [ 1]  913 	ld	(0x02, sp), a
      0090D1 84               [ 1]  914 	pop	a
      0090D2 14 01            [ 1]  915 	and	a, (0x01, sp)
      0090D4                        916 00106$:
                                    917 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 641: return ((ITStatus)itstatus);
                                    918 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 642: }
      0090D4 5B 03            [ 2]  919 	addw	sp, #3
      0090D6 81               [ 4]  920 	ret
                                    921 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 662: void ADC1_ClearITPendingBit(ADC1_IT_TypeDef ITPendingBit)
                                    922 ;	-----------------------------------------
                                    923 ;	 function ADC1_ClearITPendingBit
                                    924 ;	-----------------------------------------
      0090D7                        925 _ADC1_ClearITPendingBit:
      0090D7 52 02            [ 2]  926 	sub	sp, #2
                                    927 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 669: if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
      0090D9 7B 06            [ 1]  928 	ld	a, (0x06, sp)
      0090DB A4 F0            [ 1]  929 	and	a, #0xf0
      0090DD 97               [ 1]  930 	ld	xl, a
      0090DE 4F               [ 1]  931 	clr	a
      0090DF 95               [ 1]  932 	ld	xh, a
      0090E0 A3 00 10         [ 2]  933 	cpw	x, #0x0010
      0090E3 26 40            [ 1]  934 	jrne	00105$
                                    935 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 672: temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
      0090E5 7B 06            [ 1]  936 	ld	a, (0x06, sp)
      0090E7 A4 0F            [ 1]  937 	and	a, #0x0f
                                    938 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 673: if (temp < 8)
      0090E9 97               [ 1]  939 	ld	xl, a
      0090EA A1 08            [ 1]  940 	cp	a, #0x08
      0090EC 24 1A            [ 1]  941 	jrnc	00102$
                                    942 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 675: ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
      0090EE C6 54 0D         [ 1]  943 	ld	a, 0x540d
      0090F1 6B 02            [ 1]  944 	ld	(0x02, sp), a
      0090F3 A6 01            [ 1]  945 	ld	a, #0x01
      0090F5 88               [ 1]  946 	push	a
      0090F6 9F               [ 1]  947 	ld	a, xl
      0090F7 4D               [ 1]  948 	tnz	a
      0090F8 27 05            [ 1]  949 	jreq	00124$
      0090FA                        950 00123$:
      0090FA 08 01            [ 1]  951 	sll	(1, sp)
      0090FC 4A               [ 1]  952 	dec	a
      0090FD 26 FB            [ 1]  953 	jrne	00123$
      0090FF                        954 00124$:
      0090FF 84               [ 1]  955 	pop	a
      009100 43               [ 1]  956 	cpl	a
      009101 14 02            [ 1]  957 	and	a, (0x02, sp)
      009103 C7 54 0D         [ 1]  958 	ld	0x540d, a
      009106 20 2A            [ 2]  959 	jra	00107$
      009108                        960 00102$:
                                    961 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 679: ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
      009108 C6 54 0C         [ 1]  962 	ld	a, 0x540c
      00910B 6B 01            [ 1]  963 	ld	(0x01, sp), a
      00910D 1D 00 08         [ 2]  964 	subw	x, #8
      009110 A6 01            [ 1]  965 	ld	a, #0x01
      009112 88               [ 1]  966 	push	a
      009113 9F               [ 1]  967 	ld	a, xl
      009114 4D               [ 1]  968 	tnz	a
      009115 27 05            [ 1]  969 	jreq	00126$
      009117                        970 00125$:
      009117 08 01            [ 1]  971 	sll	(1, sp)
      009119 4A               [ 1]  972 	dec	a
      00911A 26 FB            [ 1]  973 	jrne	00125$
      00911C                        974 00126$:
      00911C 84               [ 1]  975 	pop	a
      00911D 43               [ 1]  976 	cpl	a
      00911E 14 01            [ 1]  977 	and	a, (0x01, sp)
      009120 C7 54 0C         [ 1]  978 	ld	0x540c, a
      009123 20 0D            [ 2]  979 	jra	00107$
      009125                        980 00105$:
                                    981 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 684: ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ITPendingBit);
      009125 C6 54 00         [ 1]  982 	ld	a, 0x5400
      009128 1E 05            [ 2]  983 	ldw	x, (0x05, sp)
      00912A 53               [ 2]  984 	cplw	x
      00912B 89               [ 2]  985 	pushw	x
      00912C 14 02            [ 1]  986 	and	a, (2, sp)
      00912E 85               [ 2]  987 	popw	x
      00912F C7 54 00         [ 1]  988 	ld	0x5400, a
      009132                        989 00107$:
                                    990 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 686: }
      009132 5B 02            [ 2]  991 	addw	sp, #2
      009134 81               [ 4]  992 	ret
                                    993 	.area CODE
                                    994 	.area CONST
                                    995 	.area INITIALIZER
                                    996 	.area CABS (ABS)
