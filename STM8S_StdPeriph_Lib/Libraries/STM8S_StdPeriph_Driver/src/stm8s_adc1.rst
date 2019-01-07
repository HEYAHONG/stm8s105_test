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
      009587                         73 _ADC1_DeInit:
                                     74 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 54: ADC1->CSR  = ADC1_CSR_RESET_VALUE;
      009587 35 00 54 00      [ 1]   75 	mov	0x5400+0, #0x00
                                     76 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 55: ADC1->CR1  = ADC1_CR1_RESET_VALUE;
      00958B 35 00 54 01      [ 1]   77 	mov	0x5401+0, #0x00
                                     78 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 56: ADC1->CR2  = ADC1_CR2_RESET_VALUE;
      00958F 35 00 54 02      [ 1]   79 	mov	0x5402+0, #0x00
                                     80 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 57: ADC1->CR3  = ADC1_CR3_RESET_VALUE;
      009593 35 00 54 03      [ 1]   81 	mov	0x5403+0, #0x00
                                     82 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 58: ADC1->TDRH = ADC1_TDRH_RESET_VALUE;
      009597 35 00 54 06      [ 1]   83 	mov	0x5406+0, #0x00
                                     84 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 59: ADC1->TDRL = ADC1_TDRL_RESET_VALUE;
      00959B 35 00 54 07      [ 1]   85 	mov	0x5407+0, #0x00
                                     86 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 60: ADC1->HTRH = ADC1_HTRH_RESET_VALUE;
      00959F 35 FF 54 08      [ 1]   87 	mov	0x5408+0, #0xff
                                     88 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 61: ADC1->HTRL = ADC1_HTRL_RESET_VALUE;
      0095A3 35 03 54 09      [ 1]   89 	mov	0x5409+0, #0x03
                                     90 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 62: ADC1->LTRH = ADC1_LTRH_RESET_VALUE;
      0095A7 35 00 54 0A      [ 1]   91 	mov	0x540a+0, #0x00
                                     92 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 63: ADC1->LTRL = ADC1_LTRL_RESET_VALUE;
      0095AB 35 00 54 0B      [ 1]   93 	mov	0x540b+0, #0x00
                                     94 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 64: ADC1->AWCRH = ADC1_AWCRH_RESET_VALUE;
      0095AF 35 00 54 0E      [ 1]   95 	mov	0x540e+0, #0x00
                                     96 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 65: ADC1->AWCRL = ADC1_AWCRL_RESET_VALUE;
      0095B3 35 00 54 0F      [ 1]   97 	mov	0x540f+0, #0x00
                                     98 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 66: }
      0095B7 81               [ 4]   99 	ret
                                    100 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 88: void ADC1_Init(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_PresSel_TypeDef ADC1_PrescalerSelection, ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState ADC1_ExtTriggerState, ADC1_Align_TypeDef ADC1_Align, ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState ADC1_SchmittTriggerState)
                                    101 ;	-----------------------------------------
                                    102 ;	 function ADC1_Init
                                    103 ;	-----------------------------------------
      0095B8                        104 _ADC1_Init:
                                    105 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 103: ADC1_ConversionConfig(ADC1_ConversionMode, ADC1_Channel, ADC1_Align);
      0095B8 7B 08            [ 1]  106 	ld	a, (0x08, sp)
      0095BA 88               [ 1]  107 	push	a
      0095BB 7B 05            [ 1]  108 	ld	a, (0x05, sp)
      0095BD 88               [ 1]  109 	push	a
      0095BE 7B 05            [ 1]  110 	ld	a, (0x05, sp)
      0095C0 88               [ 1]  111 	push	a
      0095C1 CD 96 CE         [ 4]  112 	call	_ADC1_ConversionConfig
      0095C4 5B 03            [ 2]  113 	addw	sp, #3
                                    114 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 105: ADC1_PrescalerConfig(ADC1_PrescalerSelection);
      0095C6 7B 05            [ 1]  115 	ld	a, (0x05, sp)
      0095C8 88               [ 1]  116 	push	a
      0095C9 CD 96 3F         [ 4]  117 	call	_ADC1_PrescalerConfig
      0095CC 84               [ 1]  118 	pop	a
                                    119 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 110: ADC1_ExternalTriggerConfig(ADC1_ExtTrigger, ADC1_ExtTriggerState);
      0095CD 7B 07            [ 1]  120 	ld	a, (0x07, sp)
      0095CF 88               [ 1]  121 	push	a
      0095D0 7B 07            [ 1]  122 	ld	a, (0x07, sp)
      0095D2 88               [ 1]  123 	push	a
      0095D3 CD 97 01         [ 4]  124 	call	_ADC1_ExternalTriggerConfig
      0095D6 5B 02            [ 2]  125 	addw	sp, #2
                                    126 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 115: ADC1_SchmittTriggerConfig(ADC1_SchmittTriggerChannel, ADC1_SchmittTriggerState);
      0095D8 7B 0A            [ 1]  127 	ld	a, (0x0a, sp)
      0095DA 88               [ 1]  128 	push	a
      0095DB 7B 0A            [ 1]  129 	ld	a, (0x0a, sp)
      0095DD 88               [ 1]  130 	push	a
      0095DE CD 96 50         [ 4]  131 	call	_ADC1_SchmittTriggerConfig
      0095E1 5B 02            [ 2]  132 	addw	sp, #2
                                    133 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 118: ADC1->CR1 |= ADC1_CR1_ADON;
      0095E3 72 10 54 01      [ 1]  134 	bset	21505, #0
                                    135 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 119: }
      0095E7 81               [ 4]  136 	ret
                                    137 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 126: void ADC1_Cmd(FunctionalState NewState)
                                    138 ;	-----------------------------------------
                                    139 ;	 function ADC1_Cmd
                                    140 ;	-----------------------------------------
      0095E8                        141 _ADC1_Cmd:
                                    142 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 133: ADC1->CR1 |= ADC1_CR1_ADON;
      0095E8 C6 54 01         [ 1]  143 	ld	a, 0x5401
                                    144 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 131: if (NewState != DISABLE)
      0095EB 0D 03            [ 1]  145 	tnz	(0x03, sp)
      0095ED 27 06            [ 1]  146 	jreq	00102$
                                    147 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 133: ADC1->CR1 |= ADC1_CR1_ADON;
      0095EF AA 01            [ 1]  148 	or	a, #0x01
      0095F1 C7 54 01         [ 1]  149 	ld	0x5401, a
      0095F4 81               [ 4]  150 	ret
      0095F5                        151 00102$:
                                    152 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 137: ADC1->CR1 &= (uint8_t)(~ADC1_CR1_ADON);
      0095F5 A4 FE            [ 1]  153 	and	a, #0xfe
      0095F7 C7 54 01         [ 1]  154 	ld	0x5401, a
                                    155 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 139: }
      0095FA 81               [ 4]  156 	ret
                                    157 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 146: void ADC1_ScanModeCmd(FunctionalState NewState)
                                    158 ;	-----------------------------------------
                                    159 ;	 function ADC1_ScanModeCmd
                                    160 ;	-----------------------------------------
      0095FB                        161 _ADC1_ScanModeCmd:
                                    162 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 153: ADC1->CR2 |= ADC1_CR2_SCAN;
      0095FB C6 54 02         [ 1]  163 	ld	a, 0x5402
                                    164 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 151: if (NewState != DISABLE)
      0095FE 0D 03            [ 1]  165 	tnz	(0x03, sp)
      009600 27 06            [ 1]  166 	jreq	00102$
                                    167 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 153: ADC1->CR2 |= ADC1_CR2_SCAN;
      009602 AA 02            [ 1]  168 	or	a, #0x02
      009604 C7 54 02         [ 1]  169 	ld	0x5402, a
      009607 81               [ 4]  170 	ret
      009608                        171 00102$:
                                    172 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 157: ADC1->CR2 &= (uint8_t)(~ADC1_CR2_SCAN);
      009608 A4 FD            [ 1]  173 	and	a, #0xfd
      00960A C7 54 02         [ 1]  174 	ld	0x5402, a
                                    175 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 159: }
      00960D 81               [ 4]  176 	ret
                                    177 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 166: void ADC1_DataBufferCmd(FunctionalState NewState)
                                    178 ;	-----------------------------------------
                                    179 ;	 function ADC1_DataBufferCmd
                                    180 ;	-----------------------------------------
      00960E                        181 _ADC1_DataBufferCmd:
                                    182 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 173: ADC1->CR3 |= ADC1_CR3_DBUF;
      00960E C6 54 03         [ 1]  183 	ld	a, 0x5403
                                    184 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 171: if (NewState != DISABLE)
      009611 0D 03            [ 1]  185 	tnz	(0x03, sp)
      009613 27 06            [ 1]  186 	jreq	00102$
                                    187 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 173: ADC1->CR3 |= ADC1_CR3_DBUF;
      009615 AA 80            [ 1]  188 	or	a, #0x80
      009617 C7 54 03         [ 1]  189 	ld	0x5403, a
      00961A 81               [ 4]  190 	ret
      00961B                        191 00102$:
                                    192 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 177: ADC1->CR3 &= (uint8_t)(~ADC1_CR3_DBUF);
      00961B A4 7F            [ 1]  193 	and	a, #0x7f
      00961D C7 54 03         [ 1]  194 	ld	0x5403, a
                                    195 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 179: }
      009620 81               [ 4]  196 	ret
                                    197 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 190: void ADC1_ITConfig(ADC1_IT_TypeDef ADC1_IT, FunctionalState NewState)
                                    198 ;	-----------------------------------------
                                    199 ;	 function ADC1_ITConfig
                                    200 ;	-----------------------------------------
      009621                        201 _ADC1_ITConfig:
      009621 88               [ 1]  202 	push	a
                                    203 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 199: ADC1->CSR |= (uint8_t)ADC1_IT;
      009622 C6 54 00         [ 1]  204 	ld	a, 0x5400
      009625 6B 01            [ 1]  205 	ld	(0x01, sp), a
                                    206 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 196: if (NewState != DISABLE)
      009627 0D 06            [ 1]  207 	tnz	(0x06, sp)
      009629 27 09            [ 1]  208 	jreq	00102$
                                    209 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 199: ADC1->CSR |= (uint8_t)ADC1_IT;
      00962B 7B 05            [ 1]  210 	ld	a, (0x05, sp)
      00962D 1A 01            [ 1]  211 	or	a, (0x01, sp)
      00962F C7 54 00         [ 1]  212 	ld	0x5400, a
      009632 20 09            [ 2]  213 	jra	00104$
      009634                        214 00102$:
                                    215 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 204: ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ADC1_IT);
      009634 1E 04            [ 2]  216 	ldw	x, (0x04, sp)
      009636 53               [ 2]  217 	cplw	x
      009637 9F               [ 1]  218 	ld	a, xl
      009638 14 01            [ 1]  219 	and	a, (0x01, sp)
      00963A C7 54 00         [ 1]  220 	ld	0x5400, a
      00963D                        221 00104$:
                                    222 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 206: }
      00963D 84               [ 1]  223 	pop	a
      00963E 81               [ 4]  224 	ret
                                    225 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 214: void ADC1_PrescalerConfig(ADC1_PresSel_TypeDef ADC1_Prescaler)
                                    226 ;	-----------------------------------------
                                    227 ;	 function ADC1_PrescalerConfig
                                    228 ;	-----------------------------------------
      00963F                        229 _ADC1_PrescalerConfig:
                                    230 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 220: ADC1->CR1 &= (uint8_t)(~ADC1_CR1_SPSEL);
      00963F C6 54 01         [ 1]  231 	ld	a, 0x5401
      009642 A4 8F            [ 1]  232 	and	a, #0x8f
      009644 C7 54 01         [ 1]  233 	ld	0x5401, a
                                    234 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 222: ADC1->CR1 |= (uint8_t)(ADC1_Prescaler);
      009647 C6 54 01         [ 1]  235 	ld	a, 0x5401
      00964A 1A 03            [ 1]  236 	or	a, (0x03, sp)
      00964C C7 54 01         [ 1]  237 	ld	0x5401, a
                                    238 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 223: }
      00964F 81               [ 4]  239 	ret
                                    240 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 233: void ADC1_SchmittTriggerConfig(ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState NewState)
                                    241 ;	-----------------------------------------
                                    242 ;	 function ADC1_SchmittTriggerConfig
                                    243 ;	-----------------------------------------
      009650                        244 _ADC1_SchmittTriggerConfig:
      009650 52 02            [ 2]  245 	sub	sp, #2
                                    246 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 239: if (ADC1_SchmittTriggerChannel == ADC1_SCHMITTTRIG_ALL)
      009652 7B 05            [ 1]  247 	ld	a, (0x05, sp)
      009654 4C               [ 1]  248 	inc	a
      009655 26 21            [ 1]  249 	jrne	00114$
                                    250 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 243: ADC1->TDRL &= (uint8_t)0x0;
      009657 C6 54 07         [ 1]  251 	ld	a, 0x5407
                                    252 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 241: if (NewState != DISABLE)
      00965A 0D 06            [ 1]  253 	tnz	(0x06, sp)
      00965C 27 0D            [ 1]  254 	jreq	00102$
                                    255 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 243: ADC1->TDRL &= (uint8_t)0x0;
      00965E 35 00 54 07      [ 1]  256 	mov	0x5407+0, #0x00
                                    257 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 244: ADC1->TDRH &= (uint8_t)0x0;
      009662 C6 54 06         [ 1]  258 	ld	a, 0x5406
      009665 35 00 54 06      [ 1]  259 	mov	0x5406+0, #0x00
      009669 20 60            [ 2]  260 	jra	00116$
      00966B                        261 00102$:
                                    262 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 248: ADC1->TDRL |= (uint8_t)0xFF;
      00966B 35 FF 54 07      [ 1]  263 	mov	0x5407+0, #0xff
                                    264 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 249: ADC1->TDRH |= (uint8_t)0xFF;
      00966F C6 54 06         [ 1]  265 	ld	a, 0x5406
      009672 35 FF 54 06      [ 1]  266 	mov	0x5406+0, #0xff
      009676 20 53            [ 2]  267 	jra	00116$
      009678                        268 00114$:
                                    269 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 252: else if (ADC1_SchmittTriggerChannel < ADC1_SCHMITTTRIG_CHANNEL8)
      009678 7B 05            [ 1]  270 	ld	a, (0x05, sp)
      00967A A1 08            [ 1]  271 	cp	a, #0x08
      00967C 24 25            [ 1]  272 	jrnc	00111$
                                    273 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 243: ADC1->TDRL &= (uint8_t)0x0;
      00967E C6 54 07         [ 1]  274 	ld	a, 0x5407
      009681 6B 01            [ 1]  275 	ld	(0x01, sp), a
                                    276 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 256: ADC1->TDRL &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel));
      009683 A6 01            [ 1]  277 	ld	a, #0x01
      009685 88               [ 1]  278 	push	a
      009686 7B 06            [ 1]  279 	ld	a, (0x06, sp)
      009688 27 05            [ 1]  280 	jreq	00149$
      00968A                        281 00148$:
      00968A 08 01            [ 1]  282 	sll	(1, sp)
      00968C 4A               [ 1]  283 	dec	a
      00968D 26 FB            [ 1]  284 	jrne	00148$
      00968F                        285 00149$:
      00968F 84               [ 1]  286 	pop	a
                                    287 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 254: if (NewState != DISABLE)
      009690 0D 06            [ 1]  288 	tnz	(0x06, sp)
      009692 27 08            [ 1]  289 	jreq	00105$
                                    290 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 256: ADC1->TDRL &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel));
      009694 43               [ 1]  291 	cpl	a
      009695 14 01            [ 1]  292 	and	a, (0x01, sp)
      009697 C7 54 07         [ 1]  293 	ld	0x5407, a
      00969A 20 2F            [ 2]  294 	jra	00116$
      00969C                        295 00105$:
                                    296 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 260: ADC1->TDRL |= (uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel);
      00969C 1A 01            [ 1]  297 	or	a, (0x01, sp)
      00969E C7 54 07         [ 1]  298 	ld	0x5407, a
      0096A1 20 28            [ 2]  299 	jra	00116$
      0096A3                        300 00111$:
                                    301 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 244: ADC1->TDRH &= (uint8_t)0x0;
      0096A3 C6 54 06         [ 1]  302 	ld	a, 0x5406
      0096A6 6B 02            [ 1]  303 	ld	(0x02, sp), a
                                    304 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 267: ADC1->TDRH &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8)));
      0096A8 7B 05            [ 1]  305 	ld	a, (0x05, sp)
      0096AA A0 08            [ 1]  306 	sub	a, #0x08
      0096AC 97               [ 1]  307 	ld	xl, a
      0096AD A6 01            [ 1]  308 	ld	a, #0x01
      0096AF 88               [ 1]  309 	push	a
      0096B0 9F               [ 1]  310 	ld	a, xl
      0096B1 4D               [ 1]  311 	tnz	a
      0096B2 27 05            [ 1]  312 	jreq	00152$
      0096B4                        313 00151$:
      0096B4 08 01            [ 1]  314 	sll	(1, sp)
      0096B6 4A               [ 1]  315 	dec	a
      0096B7 26 FB            [ 1]  316 	jrne	00151$
      0096B9                        317 00152$:
      0096B9 84               [ 1]  318 	pop	a
                                    319 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 265: if (NewState != DISABLE)
      0096BA 0D 06            [ 1]  320 	tnz	(0x06, sp)
      0096BC 27 08            [ 1]  321 	jreq	00108$
                                    322 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 267: ADC1->TDRH &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8)));
      0096BE 43               [ 1]  323 	cpl	a
      0096BF 14 02            [ 1]  324 	and	a, (0x02, sp)
      0096C1 C7 54 06         [ 1]  325 	ld	0x5406, a
      0096C4 20 05            [ 2]  326 	jra	00116$
      0096C6                        327 00108$:
                                    328 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 271: ADC1->TDRH |= (uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8));
      0096C6 1A 02            [ 1]  329 	or	a, (0x02, sp)
      0096C8 C7 54 06         [ 1]  330 	ld	0x5406, a
      0096CB                        331 00116$:
                                    332 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 274: }
      0096CB 5B 02            [ 2]  333 	addw	sp, #2
      0096CD 81               [ 4]  334 	ret
                                    335 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 286: void ADC1_ConversionConfig(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_Align_TypeDef ADC1_Align)
                                    336 ;	-----------------------------------------
                                    337 ;	 function ADC1_ConversionConfig
                                    338 ;	-----------------------------------------
      0096CE                        339 _ADC1_ConversionConfig:
                                    340 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 294: ADC1->CR2 &= (uint8_t)(~ADC1_CR2_ALIGN);
      0096CE 72 17 54 02      [ 1]  341 	bres	21506, #3
                                    342 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 296: ADC1->CR2 |= (uint8_t)(ADC1_Align);
      0096D2 C6 54 02         [ 1]  343 	ld	a, 0x5402
      0096D5 1A 05            [ 1]  344 	or	a, (0x05, sp)
      0096D7 C7 54 02         [ 1]  345 	ld	0x5402, a
                                    346 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 301: ADC1->CR1 |= ADC1_CR1_CONT;
      0096DA C6 54 01         [ 1]  347 	ld	a, 0x5401
                                    348 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 298: if (ADC1_ConversionMode == ADC1_CONVERSIONMODE_CONTINUOUS)
      0096DD 88               [ 1]  349 	push	a
      0096DE 7B 04            [ 1]  350 	ld	a, (0x04, sp)
      0096E0 4A               [ 1]  351 	dec	a
      0096E1 84               [ 1]  352 	pop	a
      0096E2 26 07            [ 1]  353 	jrne	00102$
                                    354 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 301: ADC1->CR1 |= ADC1_CR1_CONT;
      0096E4 AA 02            [ 1]  355 	or	a, #0x02
      0096E6 C7 54 01         [ 1]  356 	ld	0x5401, a
      0096E9 20 05            [ 2]  357 	jra	00103$
      0096EB                        358 00102$:
                                    359 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 306: ADC1->CR1 &= (uint8_t)(~ADC1_CR1_CONT);
      0096EB A4 FD            [ 1]  360 	and	a, #0xfd
      0096ED C7 54 01         [ 1]  361 	ld	0x5401, a
      0096F0                        362 00103$:
                                    363 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 310: ADC1->CSR &= (uint8_t)(~ADC1_CSR_CH);
      0096F0 C6 54 00         [ 1]  364 	ld	a, 0x5400
      0096F3 A4 F0            [ 1]  365 	and	a, #0xf0
      0096F5 C7 54 00         [ 1]  366 	ld	0x5400, a
                                    367 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 312: ADC1->CSR |= (uint8_t)(ADC1_Channel);
      0096F8 C6 54 00         [ 1]  368 	ld	a, 0x5400
      0096FB 1A 04            [ 1]  369 	or	a, (0x04, sp)
      0096FD C7 54 00         [ 1]  370 	ld	0x5400, a
                                    371 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 313: }
      009700 81               [ 4]  372 	ret
                                    373 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 325: void ADC1_ExternalTriggerConfig(ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState NewState)
                                    374 ;	-----------------------------------------
                                    375 ;	 function ADC1_ExternalTriggerConfig
                                    376 ;	-----------------------------------------
      009701                        377 _ADC1_ExternalTriggerConfig:
                                    378 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 332: ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTSEL);
      009701 C6 54 02         [ 1]  379 	ld	a, 0x5402
      009704 A4 CF            [ 1]  380 	and	a, #0xcf
      009706 C7 54 02         [ 1]  381 	ld	0x5402, a
      009709 C6 54 02         [ 1]  382 	ld	a, 0x5402
                                    383 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 334: if (NewState != DISABLE)
      00970C 0D 04            [ 1]  384 	tnz	(0x04, sp)
      00970E 27 07            [ 1]  385 	jreq	00102$
                                    386 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 337: ADC1->CR2 |= (uint8_t)(ADC1_CR2_EXTTRIG);
      009710 AA 40            [ 1]  387 	or	a, #0x40
      009712 C7 54 02         [ 1]  388 	ld	0x5402, a
      009715 20 05            [ 2]  389 	jra	00103$
      009717                        390 00102$:
                                    391 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 342: ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTTRIG);
      009717 A4 BF            [ 1]  392 	and	a, #0xbf
      009719 C7 54 02         [ 1]  393 	ld	0x5402, a
      00971C                        394 00103$:
                                    395 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 346: ADC1->CR2 |= (uint8_t)(ADC1_ExtTrigger);
      00971C C6 54 02         [ 1]  396 	ld	a, 0x5402
      00971F 1A 03            [ 1]  397 	or	a, (0x03, sp)
      009721 C7 54 02         [ 1]  398 	ld	0x5402, a
                                    399 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 347: }
      009724 81               [ 4]  400 	ret
                                    401 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 358: void ADC1_StartConversion(void)
                                    402 ;	-----------------------------------------
                                    403 ;	 function ADC1_StartConversion
                                    404 ;	-----------------------------------------
      009725                        405 _ADC1_StartConversion:
                                    406 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 360: ADC1->CR1 |= ADC1_CR1_ADON;
      009725 72 10 54 01      [ 1]  407 	bset	21505, #0
                                    408 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 361: }
      009729 81               [ 4]  409 	ret
                                    410 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 370: uint16_t ADC1_GetConversionValue(void)
                                    411 ;	-----------------------------------------
                                    412 ;	 function ADC1_GetConversionValue
                                    413 ;	-----------------------------------------
      00972A                        414 _ADC1_GetConversionValue:
      00972A 52 08            [ 2]  415 	sub	sp, #8
                                    416 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 375: if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
      00972C C6 54 02         [ 1]  417 	ld	a, 0x5402
      00972F A5 08            [ 1]  418 	bcp	a, #0x08
      009731 27 15            [ 1]  419 	jreq	00102$
                                    420 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 378: templ = ADC1->DRL;
      009733 C6 54 05         [ 1]  421 	ld	a, 0x5405
      009736 97               [ 1]  422 	ld	xl, a
                                    423 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 380: temph = ADC1->DRH;
      009737 C6 54 04         [ 1]  424 	ld	a, 0x5404
                                    425 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 382: temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
      00973A 0F 04            [ 1]  426 	clr	(0x04, sp)
      00973C 0F 01            [ 1]  427 	clr	(0x01, sp)
      00973E 1A 01            [ 1]  428 	or	a, (0x01, sp)
      009740 01               [ 1]  429 	rrwa	x
      009741 1A 04            [ 1]  430 	or	a, (0x04, sp)
      009743 97               [ 1]  431 	ld	xl, a
      009744 1F 07            [ 2]  432 	ldw	(0x07, sp), x
      009746 20 1D            [ 2]  433 	jra	00103$
      009748                        434 00102$:
                                    435 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 387: temph = ADC1->DRH;
      009748 C6 54 04         [ 1]  436 	ld	a, 0x5404
      00974B 5F               [ 1]  437 	clrw	x
      00974C 97               [ 1]  438 	ld	xl, a
      00974D 51               [ 1]  439 	exgw	x, y
                                    440 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 389: templ = ADC1->DRL;
      00974E C6 54 05         [ 1]  441 	ld	a, 0x5405
                                    442 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 391: temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)((uint16_t)temph << 8));
      009751 5F               [ 1]  443 	clrw	x
      009752 97               [ 1]  444 	ld	xl, a
      009753 58               [ 2]  445 	sllw	x
      009754 58               [ 2]  446 	sllw	x
      009755 58               [ 2]  447 	sllw	x
      009756 58               [ 2]  448 	sllw	x
      009757 58               [ 2]  449 	sllw	x
      009758 58               [ 2]  450 	sllw	x
      009759 1F 05            [ 2]  451 	ldw	(0x05, sp), x
      00975B 7B 06            [ 1]  452 	ld	a, (0x06, sp)
      00975D 97               [ 1]  453 	ld	xl, a
      00975E 90 9F            [ 1]  454 	ld	a, yl
      009760 1A 05            [ 1]  455 	or	a, (0x05, sp)
      009762 95               [ 1]  456 	ld	xh, a
      009763 1F 07            [ 2]  457 	ldw	(0x07, sp), x
      009765                        458 00103$:
                                    459 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 394: return ((uint16_t)temph);
      009765 1E 07            [ 2]  460 	ldw	x, (0x07, sp)
                                    461 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 395: }
      009767 5B 08            [ 2]  462 	addw	sp, #8
      009769 81               [ 4]  463 	ret
                                    464 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 405: void ADC1_AWDChannelConfig(ADC1_Channel_TypeDef Channel, FunctionalState NewState)
                                    465 ;	-----------------------------------------
                                    466 ;	 function ADC1_AWDChannelConfig
                                    467 ;	-----------------------------------------
      00976A                        468 _ADC1_AWDChannelConfig:
      00976A 52 02            [ 2]  469 	sub	sp, #2
                                    470 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 411: if (Channel < (uint8_t)8)
      00976C 7B 05            [ 1]  471 	ld	a, (0x05, sp)
      00976E A1 08            [ 1]  472 	cp	a, #0x08
      009770 24 25            [ 1]  473 	jrnc	00108$
                                    474 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 415: ADC1->AWCRL |= (uint8_t)((uint8_t)1 << Channel);
      009772 C6 54 0F         [ 1]  475 	ld	a, 0x540f
      009775 6B 01            [ 1]  476 	ld	(0x01, sp), a
      009777 A6 01            [ 1]  477 	ld	a, #0x01
      009779 88               [ 1]  478 	push	a
      00977A 7B 06            [ 1]  479 	ld	a, (0x06, sp)
      00977C 27 05            [ 1]  480 	jreq	00129$
      00977E                        481 00128$:
      00977E 08 01            [ 1]  482 	sll	(1, sp)
      009780 4A               [ 1]  483 	dec	a
      009781 26 FB            [ 1]  484 	jrne	00128$
      009783                        485 00129$:
      009783 84               [ 1]  486 	pop	a
                                    487 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 413: if (NewState != DISABLE)
      009784 0D 06            [ 1]  488 	tnz	(0x06, sp)
      009786 27 07            [ 1]  489 	jreq	00102$
                                    490 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 415: ADC1->AWCRL |= (uint8_t)((uint8_t)1 << Channel);
      009788 1A 01            [ 1]  491 	or	a, (0x01, sp)
      00978A C7 54 0F         [ 1]  492 	ld	0x540f, a
      00978D 20 30            [ 2]  493 	jra	00110$
      00978F                        494 00102$:
                                    495 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 419: ADC1->AWCRL &= (uint8_t)~(uint8_t)((uint8_t)1 << Channel);
      00978F 43               [ 1]  496 	cpl	a
      009790 14 01            [ 1]  497 	and	a, (0x01, sp)
      009792 C7 54 0F         [ 1]  498 	ld	0x540f, a
      009795 20 28            [ 2]  499 	jra	00110$
      009797                        500 00108$:
                                    501 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 426: ADC1->AWCRH |= (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8));
      009797 C6 54 0E         [ 1]  502 	ld	a, 0x540e
      00979A 6B 02            [ 1]  503 	ld	(0x02, sp), a
      00979C 7B 05            [ 1]  504 	ld	a, (0x05, sp)
      00979E A0 08            [ 1]  505 	sub	a, #0x08
      0097A0 97               [ 1]  506 	ld	xl, a
      0097A1 A6 01            [ 1]  507 	ld	a, #0x01
      0097A3 88               [ 1]  508 	push	a
      0097A4 9F               [ 1]  509 	ld	a, xl
      0097A5 4D               [ 1]  510 	tnz	a
      0097A6 27 05            [ 1]  511 	jreq	00132$
      0097A8                        512 00131$:
      0097A8 08 01            [ 1]  513 	sll	(1, sp)
      0097AA 4A               [ 1]  514 	dec	a
      0097AB 26 FB            [ 1]  515 	jrne	00131$
      0097AD                        516 00132$:
      0097AD 84               [ 1]  517 	pop	a
                                    518 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 424: if (NewState != DISABLE)
      0097AE 0D 06            [ 1]  519 	tnz	(0x06, sp)
      0097B0 27 07            [ 1]  520 	jreq	00105$
                                    521 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 426: ADC1->AWCRH |= (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8));
      0097B2 1A 02            [ 1]  522 	or	a, (0x02, sp)
      0097B4 C7 54 0E         [ 1]  523 	ld	0x540e, a
      0097B7 20 06            [ 2]  524 	jra	00110$
      0097B9                        525 00105$:
                                    526 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 430: ADC1->AWCRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (uint8_t)(Channel - (uint8_t)8));
      0097B9 43               [ 1]  527 	cpl	a
      0097BA 14 02            [ 1]  528 	and	a, (0x02, sp)
      0097BC C7 54 0E         [ 1]  529 	ld	0x540e, a
      0097BF                        530 00110$:
                                    531 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 433: }
      0097BF 5B 02            [ 2]  532 	addw	sp, #2
      0097C1 81               [ 4]  533 	ret
                                    534 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 441: void ADC1_SetHighThreshold(uint16_t Threshold)
                                    535 ;	-----------------------------------------
                                    536 ;	 function ADC1_SetHighThreshold
                                    537 ;	-----------------------------------------
      0097C2                        538 _ADC1_SetHighThreshold:
                                    539 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 443: ADC1->HTRH = (uint8_t)(Threshold >> (uint8_t)2);
      0097C2 1E 03            [ 2]  540 	ldw	x, (0x03, sp)
      0097C4 54               [ 2]  541 	srlw	x
      0097C5 54               [ 2]  542 	srlw	x
      0097C6 9F               [ 1]  543 	ld	a, xl
      0097C7 C7 54 08         [ 1]  544 	ld	0x5408, a
                                    545 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 444: ADC1->HTRL = (uint8_t)Threshold;
      0097CA 7B 04            [ 1]  546 	ld	a, (0x04, sp)
      0097CC C7 54 09         [ 1]  547 	ld	0x5409, a
                                    548 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 445: }
      0097CF 81               [ 4]  549 	ret
                                    550 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 453: void ADC1_SetLowThreshold(uint16_t Threshold)
                                    551 ;	-----------------------------------------
                                    552 ;	 function ADC1_SetLowThreshold
                                    553 ;	-----------------------------------------
      0097D0                        554 _ADC1_SetLowThreshold:
                                    555 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 455: ADC1->LTRL = (uint8_t)Threshold;
      0097D0 7B 04            [ 1]  556 	ld	a, (0x04, sp)
      0097D2 C7 54 0B         [ 1]  557 	ld	0x540b, a
                                    558 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 456: ADC1->LTRH = (uint8_t)(Threshold >> (uint8_t)2);
      0097D5 1E 03            [ 2]  559 	ldw	x, (0x03, sp)
      0097D7 54               [ 2]  560 	srlw	x
      0097D8 54               [ 2]  561 	srlw	x
      0097D9 9F               [ 1]  562 	ld	a, xl
      0097DA C7 54 0A         [ 1]  563 	ld	0x540a, a
                                    564 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 457: }
      0097DD 81               [ 4]  565 	ret
                                    566 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 466: uint16_t ADC1_GetBufferValue(uint8_t Buffer)
                                    567 ;	-----------------------------------------
                                    568 ;	 function ADC1_GetBufferValue
                                    569 ;	-----------------------------------------
      0097DE                        570 _ADC1_GetBufferValue:
      0097DE 52 0B            [ 2]  571 	sub	sp, #11
                                    572 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 474: if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
      0097E0 C6 54 02         [ 1]  573 	ld	a, 0x5402
      0097E3 6B 07            [ 1]  574 	ld	(0x07, sp), a
                                    575 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 477: templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
      0097E5 7B 0E            [ 1]  576 	ld	a, (0x0e, sp)
      0097E7 48               [ 1]  577 	sll	a
      0097E8 5F               [ 1]  578 	clrw	x
      0097E9 97               [ 1]  579 	ld	xl, a
      0097EA 51               [ 1]  580 	exgw	x, y
      0097EB 93               [ 1]  581 	ldw	x, y
      0097EC 1C 53 E1         [ 2]  582 	addw	x, #0x53e1
                                    583 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 479: temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
      0097EF 72 A9 53 E0      [ 2]  584 	addw	y, #0x53e0
                                    585 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 477: templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
                                    586 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 479: temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
                                    587 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 477: templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
      0097F3 F6               [ 1]  588 	ld	a, (x)
      0097F4 97               [ 1]  589 	ld	xl, a
                                    590 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 479: temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
      0097F5 90 F6            [ 1]  591 	ld	a, (y)
                                    592 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 474: if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
      0097F7 88               [ 1]  593 	push	a
      0097F8 7B 08            [ 1]  594 	ld	a, (0x08, sp)
      0097FA A5 08            [ 1]  595 	bcp	a, #0x08
      0097FC 84               [ 1]  596 	pop	a
      0097FD 27 0E            [ 1]  597 	jreq	00102$
                                    598 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 477: templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
                                    599 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 479: temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
                                    600 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 481: temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
      0097FF 0F 06            [ 1]  601 	clr	(0x06, sp)
      009801 0F 01            [ 1]  602 	clr	(0x01, sp)
      009803 1A 01            [ 1]  603 	or	a, (0x01, sp)
      009805 01               [ 1]  604 	rrwa	x
      009806 1A 06            [ 1]  605 	or	a, (0x06, sp)
      009808 97               [ 1]  606 	ld	xl, a
      009809 1F 0A            [ 2]  607 	ldw	(0x0a, sp), x
      00980B 20 19            [ 2]  608 	jra	00103$
      00980D                        609 00102$:
                                    610 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 486: temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
                                    611 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 488: templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
                                    612 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 490: temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)(temph << 8));
      00980D 02               [ 1]  613 	rlwa	x
      00980E 4F               [ 1]  614 	clr	a
      00980F 01               [ 1]  615 	rrwa	x
      009810 58               [ 2]  616 	sllw	x
      009811 58               [ 2]  617 	sllw	x
      009812 58               [ 2]  618 	sllw	x
      009813 58               [ 2]  619 	sllw	x
      009814 58               [ 2]  620 	sllw	x
      009815 58               [ 2]  621 	sllw	x
      009816 1F 03            [ 2]  622 	ldw	(0x03, sp), x
      009818 97               [ 1]  623 	ld	xl, a
      009819 7B 04            [ 1]  624 	ld	a, (0x04, sp)
      00981B 6B 09            [ 1]  625 	ld	(0x09, sp), a
      00981D 9F               [ 1]  626 	ld	a, xl
      00981E 1A 03            [ 1]  627 	or	a, (0x03, sp)
      009820 6B 0A            [ 1]  628 	ld	(0x0a, sp), a
      009822 7B 09            [ 1]  629 	ld	a, (0x09, sp)
      009824 6B 0B            [ 1]  630 	ld	(0x0b, sp), a
      009826                        631 00103$:
                                    632 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 493: return ((uint16_t)temph);
      009826 1E 0A            [ 2]  633 	ldw	x, (0x0a, sp)
                                    634 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 494: }
      009828 5B 0B            [ 2]  635 	addw	sp, #11
      00982A 81               [ 4]  636 	ret
                                    637 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 502: FlagStatus ADC1_GetAWDChannelStatus(ADC1_Channel_TypeDef Channel)
                                    638 ;	-----------------------------------------
                                    639 ;	 function ADC1_GetAWDChannelStatus
                                    640 ;	-----------------------------------------
      00982B                        641 _ADC1_GetAWDChannelStatus:
      00982B 52 02            [ 2]  642 	sub	sp, #2
                                    643 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 509: if (Channel < (uint8_t)8)
      00982D 7B 05            [ 1]  644 	ld	a, (0x05, sp)
      00982F A1 08            [ 1]  645 	cp	a, #0x08
      009831 24 16            [ 1]  646 	jrnc	00102$
                                    647 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 511: status = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << Channel));
      009833 C6 54 0D         [ 1]  648 	ld	a, 0x540d
      009836 88               [ 1]  649 	push	a
      009837 A6 01            [ 1]  650 	ld	a, #0x01
      009839 6B 03            [ 1]  651 	ld	(0x03, sp), a
      00983B 7B 06            [ 1]  652 	ld	a, (0x06, sp)
      00983D 27 05            [ 1]  653 	jreq	00113$
      00983F                        654 00112$:
      00983F 08 03            [ 1]  655 	sll	(0x03, sp)
      009841 4A               [ 1]  656 	dec	a
      009842 26 FB            [ 1]  657 	jrne	00112$
      009844                        658 00113$:
      009844 84               [ 1]  659 	pop	a
      009845 14 02            [ 1]  660 	and	a, (0x02, sp)
      009847 20 19            [ 2]  661 	jra	00103$
      009849                        662 00102$:
                                    663 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 515: status = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8)));
      009849 C6 54 0C         [ 1]  664 	ld	a, 0x540c
      00984C 97               [ 1]  665 	ld	xl, a
      00984D 7B 05            [ 1]  666 	ld	a, (0x05, sp)
      00984F A0 08            [ 1]  667 	sub	a, #0x08
      009851 88               [ 1]  668 	push	a
      009852 A6 01            [ 1]  669 	ld	a, #0x01
      009854 6B 02            [ 1]  670 	ld	(0x02, sp), a
      009856 84               [ 1]  671 	pop	a
      009857 4D               [ 1]  672 	tnz	a
      009858 27 05            [ 1]  673 	jreq	00115$
      00985A                        674 00114$:
      00985A 08 01            [ 1]  675 	sll	(0x01, sp)
      00985C 4A               [ 1]  676 	dec	a
      00985D 26 FB            [ 1]  677 	jrne	00114$
      00985F                        678 00115$:
      00985F 9F               [ 1]  679 	ld	a, xl
      009860 14 01            [ 1]  680 	and	a, (0x01, sp)
      009862                        681 00103$:
                                    682 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 518: return ((FlagStatus)status);
                                    683 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 519: }
      009862 5B 02            [ 2]  684 	addw	sp, #2
      009864 81               [ 4]  685 	ret
                                    686 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 527: FlagStatus ADC1_GetFlagStatus(ADC1_Flag_TypeDef Flag)
                                    687 ;	-----------------------------------------
                                    688 ;	 function ADC1_GetFlagStatus
                                    689 ;	-----------------------------------------
      009865                        690 _ADC1_GetFlagStatus:
      009865 52 04            [ 2]  691 	sub	sp, #4
                                    692 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 535: if ((Flag & 0x0F) == 0x01)
      009867 7B 07            [ 1]  693 	ld	a, (0x07, sp)
      009869 6B 03            [ 1]  694 	ld	(0x03, sp), a
      00986B 0F 02            [ 1]  695 	clr	(0x02, sp)
      00986D 7B 03            [ 1]  696 	ld	a, (0x03, sp)
      00986F A4 0F            [ 1]  697 	and	a, #0x0f
      009871 97               [ 1]  698 	ld	xl, a
      009872 4F               [ 1]  699 	clr	a
      009873 95               [ 1]  700 	ld	xh, a
      009874 5A               [ 2]  701 	decw	x
      009875 26 07            [ 1]  702 	jrne	00108$
                                    703 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 538: flagstatus = (uint8_t)(ADC1->CR3 & ADC1_CR3_OVR);
      009877 C6 54 03         [ 1]  704 	ld	a, 0x5403
      00987A A4 40            [ 1]  705 	and	a, #0x40
      00987C 20 49            [ 2]  706 	jra	00109$
      00987E                        707 00108$:
                                    708 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 540: else if ((Flag & 0xF0) == 0x10)
      00987E 7B 03            [ 1]  709 	ld	a, (0x03, sp)
      009880 A4 F0            [ 1]  710 	and	a, #0xf0
      009882 97               [ 1]  711 	ld	xl, a
      009883 4F               [ 1]  712 	clr	a
      009884 95               [ 1]  713 	ld	xh, a
      009885 A3 00 10         [ 2]  714 	cpw	x, #0x0010
      009888 26 38            [ 1]  715 	jrne	00105$
                                    716 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 543: temp = (uint8_t)(Flag & (uint8_t)0x0F);
      00988A 7B 07            [ 1]  717 	ld	a, (0x07, sp)
      00988C A4 0F            [ 1]  718 	and	a, #0x0f
                                    719 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 544: if (temp < 8)
      00988E 97               [ 1]  720 	ld	xl, a
      00988F A1 08            [ 1]  721 	cp	a, #0x08
      009891 24 16            [ 1]  722 	jrnc	00102$
                                    723 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 546: flagstatus = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
      009893 C6 54 0D         [ 1]  724 	ld	a, 0x540d
      009896 6B 01            [ 1]  725 	ld	(0x01, sp), a
      009898 A6 01            [ 1]  726 	ld	a, #0x01
      00989A 88               [ 1]  727 	push	a
      00989B 9F               [ 1]  728 	ld	a, xl
      00989C 4D               [ 1]  729 	tnz	a
      00989D 27 05            [ 1]  730 	jreq	00135$
      00989F                        731 00134$:
      00989F 08 01            [ 1]  732 	sll	(1, sp)
      0098A1 4A               [ 1]  733 	dec	a
      0098A2 26 FB            [ 1]  734 	jrne	00134$
      0098A4                        735 00135$:
      0098A4 84               [ 1]  736 	pop	a
      0098A5 14 01            [ 1]  737 	and	a, (0x01, sp)
      0098A7 20 1E            [ 2]  738 	jra	00109$
      0098A9                        739 00102$:
                                    740 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 550: flagstatus = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
      0098A9 C6 54 0C         [ 1]  741 	ld	a, 0x540c
      0098AC 6B 04            [ 1]  742 	ld	(0x04, sp), a
      0098AE 1D 00 08         [ 2]  743 	subw	x, #8
      0098B1 A6 01            [ 1]  744 	ld	a, #0x01
      0098B3 88               [ 1]  745 	push	a
      0098B4 9F               [ 1]  746 	ld	a, xl
      0098B5 4D               [ 1]  747 	tnz	a
      0098B6 27 05            [ 1]  748 	jreq	00137$
      0098B8                        749 00136$:
      0098B8 08 01            [ 1]  750 	sll	(1, sp)
      0098BA 4A               [ 1]  751 	dec	a
      0098BB 26 FB            [ 1]  752 	jrne	00136$
      0098BD                        753 00137$:
      0098BD 84               [ 1]  754 	pop	a
      0098BE 14 04            [ 1]  755 	and	a, (0x04, sp)
      0098C0 20 05            [ 2]  756 	jra	00109$
      0098C2                        757 00105$:
                                    758 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 555: flagstatus = (uint8_t)(ADC1->CSR & Flag);
      0098C2 C6 54 00         [ 1]  759 	ld	a, 0x5400
      0098C5 14 07            [ 1]  760 	and	a, (0x07, sp)
      0098C7                        761 00109$:
                                    762 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 557: return ((FlagStatus)flagstatus);
                                    763 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 559: }
      0098C7 5B 04            [ 2]  764 	addw	sp, #4
      0098C9 81               [ 4]  765 	ret
                                    766 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 567: void ADC1_ClearFlag(ADC1_Flag_TypeDef Flag)
                                    767 ;	-----------------------------------------
                                    768 ;	 function ADC1_ClearFlag
                                    769 ;	-----------------------------------------
      0098CA                        770 _ADC1_ClearFlag:
      0098CA 52 05            [ 2]  771 	sub	sp, #5
                                    772 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 574: if ((Flag & 0x0F) == 0x01)
      0098CC 7B 08            [ 1]  773 	ld	a, (0x08, sp)
      0098CE 0F 01            [ 1]  774 	clr	(0x01, sp)
      0098D0 88               [ 1]  775 	push	a
      0098D1 A4 0F            [ 1]  776 	and	a, #0x0f
      0098D3 97               [ 1]  777 	ld	xl, a
      0098D4 4F               [ 1]  778 	clr	a
      0098D5 95               [ 1]  779 	ld	xh, a
      0098D6 84               [ 1]  780 	pop	a
      0098D7 5A               [ 2]  781 	decw	x
      0098D8 26 06            [ 1]  782 	jrne	00108$
                                    783 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 577: ADC1->CR3 &= (uint8_t)(~ADC1_CR3_OVR);
      0098DA 72 1D 54 03      [ 1]  784 	bres	21507, #6
      0098DE 20 57            [ 2]  785 	jra	00110$
      0098E0                        786 00108$:
                                    787 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 579: else if ((Flag & 0xF0) == 0x10)
      0098E0 A4 F0            [ 1]  788 	and	a, #0xf0
      0098E2 97               [ 1]  789 	ld	xl, a
      0098E3 4F               [ 1]  790 	clr	a
      0098E4 95               [ 1]  791 	ld	xh, a
      0098E5 A3 00 10         [ 2]  792 	cpw	x, #0x0010
      0098E8 26 40            [ 1]  793 	jrne	00105$
                                    794 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 582: temp = (uint8_t)(Flag & (uint8_t)0x0F);
      0098EA 7B 08            [ 1]  795 	ld	a, (0x08, sp)
      0098EC A4 0F            [ 1]  796 	and	a, #0x0f
                                    797 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 583: if (temp < 8)
      0098EE 97               [ 1]  798 	ld	xl, a
      0098EF A1 08            [ 1]  799 	cp	a, #0x08
      0098F1 24 1A            [ 1]  800 	jrnc	00102$
                                    801 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 585: ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
      0098F3 C6 54 0D         [ 1]  802 	ld	a, 0x540d
      0098F6 6B 05            [ 1]  803 	ld	(0x05, sp), a
      0098F8 A6 01            [ 1]  804 	ld	a, #0x01
      0098FA 88               [ 1]  805 	push	a
      0098FB 9F               [ 1]  806 	ld	a, xl
      0098FC 4D               [ 1]  807 	tnz	a
      0098FD 27 05            [ 1]  808 	jreq	00135$
      0098FF                        809 00134$:
      0098FF 08 01            [ 1]  810 	sll	(1, sp)
      009901 4A               [ 1]  811 	dec	a
      009902 26 FB            [ 1]  812 	jrne	00134$
      009904                        813 00135$:
      009904 84               [ 1]  814 	pop	a
      009905 43               [ 1]  815 	cpl	a
      009906 14 05            [ 1]  816 	and	a, (0x05, sp)
      009908 C7 54 0D         [ 1]  817 	ld	0x540d, a
      00990B 20 2A            [ 2]  818 	jra	00110$
      00990D                        819 00102$:
                                    820 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 589: ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
      00990D C6 54 0C         [ 1]  821 	ld	a, 0x540c
      009910 6B 04            [ 1]  822 	ld	(0x04, sp), a
      009912 1D 00 08         [ 2]  823 	subw	x, #8
      009915 A6 01            [ 1]  824 	ld	a, #0x01
      009917 88               [ 1]  825 	push	a
      009918 9F               [ 1]  826 	ld	a, xl
      009919 4D               [ 1]  827 	tnz	a
      00991A 27 05            [ 1]  828 	jreq	00137$
      00991C                        829 00136$:
      00991C 08 01            [ 1]  830 	sll	(1, sp)
      00991E 4A               [ 1]  831 	dec	a
      00991F 26 FB            [ 1]  832 	jrne	00136$
      009921                        833 00137$:
      009921 84               [ 1]  834 	pop	a
      009922 43               [ 1]  835 	cpl	a
      009923 14 04            [ 1]  836 	and	a, (0x04, sp)
      009925 C7 54 0C         [ 1]  837 	ld	0x540c, a
      009928 20 0D            [ 2]  838 	jra	00110$
      00992A                        839 00105$:
                                    840 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 594: ADC1->CSR &= (uint8_t) (~Flag);
      00992A C6 54 00         [ 1]  841 	ld	a, 0x5400
      00992D 6B 03            [ 1]  842 	ld	(0x03, sp), a
      00992F 7B 08            [ 1]  843 	ld	a, (0x08, sp)
      009931 43               [ 1]  844 	cpl	a
      009932 14 03            [ 1]  845 	and	a, (0x03, sp)
      009934 C7 54 00         [ 1]  846 	ld	0x5400, a
      009937                        847 00110$:
                                    848 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 596: }
      009937 5B 05            [ 2]  849 	addw	sp, #5
      009939 81               [ 4]  850 	ret
                                    851 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 616: ITStatus ADC1_GetITStatus(ADC1_IT_TypeDef ITPendingBit)
                                    852 ;	-----------------------------------------
                                    853 ;	 function ADC1_GetITStatus
                                    854 ;	-----------------------------------------
      00993A                        855 _ADC1_GetITStatus:
      00993A 52 03            [ 2]  856 	sub	sp, #3
                                    857 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 624: if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
      00993C 7B 07            [ 1]  858 	ld	a, (0x07, sp)
      00993E A4 F0            [ 1]  859 	and	a, #0xf0
      009940 97               [ 1]  860 	ld	xl, a
      009941 4F               [ 1]  861 	clr	a
      009942 95               [ 1]  862 	ld	xh, a
                                    863 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 627: temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
      009943 7B 07            [ 1]  864 	ld	a, (0x07, sp)
                                    865 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 624: if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
      009945 A3 00 10         [ 2]  866 	cpw	x, #0x0010
      009948 26 36            [ 1]  867 	jrne	00105$
                                    868 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 627: temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
      00994A A4 0F            [ 1]  869 	and	a, #0x0f
                                    870 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 628: if (temp < 8)
      00994C 97               [ 1]  871 	ld	xl, a
      00994D A1 08            [ 1]  872 	cp	a, #0x08
      00994F 24 16            [ 1]  873 	jrnc	00102$
                                    874 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 630: itstatus = (ITStatus)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
      009951 C6 54 0D         [ 1]  875 	ld	a, 0x540d
      009954 88               [ 1]  876 	push	a
      009955 A6 01            [ 1]  877 	ld	a, #0x01
      009957 6B 04            [ 1]  878 	ld	(0x04, sp), a
      009959 9F               [ 1]  879 	ld	a, xl
      00995A 4D               [ 1]  880 	tnz	a
      00995B 27 05            [ 1]  881 	jreq	00124$
      00995D                        882 00123$:
      00995D 08 04            [ 1]  883 	sll	(0x04, sp)
      00995F 4A               [ 1]  884 	dec	a
      009960 26 FB            [ 1]  885 	jrne	00123$
      009962                        886 00124$:
      009962 84               [ 1]  887 	pop	a
      009963 14 03            [ 1]  888 	and	a, (0x03, sp)
      009965 20 23            [ 2]  889 	jra	00106$
      009967                        890 00102$:
                                    891 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 634: itstatus = (ITStatus)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
      009967 C6 54 0C         [ 1]  892 	ld	a, 0x540c
      00996A 6B 02            [ 1]  893 	ld	(0x02, sp), a
      00996C 1D 00 08         [ 2]  894 	subw	x, #8
      00996F A6 01            [ 1]  895 	ld	a, #0x01
      009971 88               [ 1]  896 	push	a
      009972 9F               [ 1]  897 	ld	a, xl
      009973 4D               [ 1]  898 	tnz	a
      009974 27 05            [ 1]  899 	jreq	00126$
      009976                        900 00125$:
      009976 08 01            [ 1]  901 	sll	(1, sp)
      009978 4A               [ 1]  902 	dec	a
      009979 26 FB            [ 1]  903 	jrne	00125$
      00997B                        904 00126$:
      00997B 84               [ 1]  905 	pop	a
      00997C 14 02            [ 1]  906 	and	a, (0x02, sp)
      00997E 20 0A            [ 2]  907 	jra	00106$
      009980                        908 00105$:
                                    909 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 639: itstatus = (ITStatus)(ADC1->CSR & (uint8_t)ITPendingBit);
      009980 AE 54 00         [ 2]  910 	ldw	x, #0x5400
      009983 88               [ 1]  911 	push	a
      009984 F6               [ 1]  912 	ld	a, (x)
      009985 6B 02            [ 1]  913 	ld	(0x02, sp), a
      009987 84               [ 1]  914 	pop	a
      009988 14 01            [ 1]  915 	and	a, (0x01, sp)
      00998A                        916 00106$:
                                    917 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 641: return ((ITStatus)itstatus);
                                    918 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 642: }
      00998A 5B 03            [ 2]  919 	addw	sp, #3
      00998C 81               [ 4]  920 	ret
                                    921 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 662: void ADC1_ClearITPendingBit(ADC1_IT_TypeDef ITPendingBit)
                                    922 ;	-----------------------------------------
                                    923 ;	 function ADC1_ClearITPendingBit
                                    924 ;	-----------------------------------------
      00998D                        925 _ADC1_ClearITPendingBit:
      00998D 52 02            [ 2]  926 	sub	sp, #2
                                    927 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 669: if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
      00998F 7B 06            [ 1]  928 	ld	a, (0x06, sp)
      009991 A4 F0            [ 1]  929 	and	a, #0xf0
      009993 97               [ 1]  930 	ld	xl, a
      009994 4F               [ 1]  931 	clr	a
      009995 95               [ 1]  932 	ld	xh, a
      009996 A3 00 10         [ 2]  933 	cpw	x, #0x0010
      009999 26 40            [ 1]  934 	jrne	00105$
                                    935 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 672: temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
      00999B 7B 06            [ 1]  936 	ld	a, (0x06, sp)
      00999D A4 0F            [ 1]  937 	and	a, #0x0f
                                    938 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 673: if (temp < 8)
      00999F 97               [ 1]  939 	ld	xl, a
      0099A0 A1 08            [ 1]  940 	cp	a, #0x08
      0099A2 24 1A            [ 1]  941 	jrnc	00102$
                                    942 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 675: ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
      0099A4 C6 54 0D         [ 1]  943 	ld	a, 0x540d
      0099A7 6B 02            [ 1]  944 	ld	(0x02, sp), a
      0099A9 A6 01            [ 1]  945 	ld	a, #0x01
      0099AB 88               [ 1]  946 	push	a
      0099AC 9F               [ 1]  947 	ld	a, xl
      0099AD 4D               [ 1]  948 	tnz	a
      0099AE 27 05            [ 1]  949 	jreq	00124$
      0099B0                        950 00123$:
      0099B0 08 01            [ 1]  951 	sll	(1, sp)
      0099B2 4A               [ 1]  952 	dec	a
      0099B3 26 FB            [ 1]  953 	jrne	00123$
      0099B5                        954 00124$:
      0099B5 84               [ 1]  955 	pop	a
      0099B6 43               [ 1]  956 	cpl	a
      0099B7 14 02            [ 1]  957 	and	a, (0x02, sp)
      0099B9 C7 54 0D         [ 1]  958 	ld	0x540d, a
      0099BC 20 2A            [ 2]  959 	jra	00107$
      0099BE                        960 00102$:
                                    961 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 679: ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
      0099BE C6 54 0C         [ 1]  962 	ld	a, 0x540c
      0099C1 6B 01            [ 1]  963 	ld	(0x01, sp), a
      0099C3 1D 00 08         [ 2]  964 	subw	x, #8
      0099C6 A6 01            [ 1]  965 	ld	a, #0x01
      0099C8 88               [ 1]  966 	push	a
      0099C9 9F               [ 1]  967 	ld	a, xl
      0099CA 4D               [ 1]  968 	tnz	a
      0099CB 27 05            [ 1]  969 	jreq	00126$
      0099CD                        970 00125$:
      0099CD 08 01            [ 1]  971 	sll	(1, sp)
      0099CF 4A               [ 1]  972 	dec	a
      0099D0 26 FB            [ 1]  973 	jrne	00125$
      0099D2                        974 00126$:
      0099D2 84               [ 1]  975 	pop	a
      0099D3 43               [ 1]  976 	cpl	a
      0099D4 14 01            [ 1]  977 	and	a, (0x01, sp)
      0099D6 C7 54 0C         [ 1]  978 	ld	0x540c, a
      0099D9 20 0D            [ 2]  979 	jra	00107$
      0099DB                        980 00105$:
                                    981 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 684: ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ITPendingBit);
      0099DB C6 54 00         [ 1]  982 	ld	a, 0x5400
      0099DE 1E 05            [ 2]  983 	ldw	x, (0x05, sp)
      0099E0 53               [ 2]  984 	cplw	x
      0099E1 89               [ 2]  985 	pushw	x
      0099E2 14 02            [ 1]  986 	and	a, (2, sp)
      0099E4 85               [ 2]  987 	popw	x
      0099E5 C7 54 00         [ 1]  988 	ld	0x5400, a
      0099E8                        989 00107$:
                                    990 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 686: }
      0099E8 5B 02            [ 2]  991 	addw	sp, #2
      0099EA 81               [ 4]  992 	ret
                                    993 	.area CODE
                                    994 	.area CONST
                                    995 	.area INITIALIZER
                                    996 	.area CABS (ABS)
