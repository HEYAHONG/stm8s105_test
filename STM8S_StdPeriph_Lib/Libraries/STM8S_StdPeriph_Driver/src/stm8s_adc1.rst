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
      0094D3                         73 _ADC1_DeInit:
                                     74 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 54: ADC1->CSR  = ADC1_CSR_RESET_VALUE;
      0094D3 35 00 54 00      [ 1]   75 	mov	0x5400+0, #0x00
                                     76 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 55: ADC1->CR1  = ADC1_CR1_RESET_VALUE;
      0094D7 35 00 54 01      [ 1]   77 	mov	0x5401+0, #0x00
                                     78 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 56: ADC1->CR2  = ADC1_CR2_RESET_VALUE;
      0094DB 35 00 54 02      [ 1]   79 	mov	0x5402+0, #0x00
                                     80 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 57: ADC1->CR3  = ADC1_CR3_RESET_VALUE;
      0094DF 35 00 54 03      [ 1]   81 	mov	0x5403+0, #0x00
                                     82 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 58: ADC1->TDRH = ADC1_TDRH_RESET_VALUE;
      0094E3 35 00 54 06      [ 1]   83 	mov	0x5406+0, #0x00
                                     84 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 59: ADC1->TDRL = ADC1_TDRL_RESET_VALUE;
      0094E7 35 00 54 07      [ 1]   85 	mov	0x5407+0, #0x00
                                     86 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 60: ADC1->HTRH = ADC1_HTRH_RESET_VALUE;
      0094EB 35 FF 54 08      [ 1]   87 	mov	0x5408+0, #0xff
                                     88 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 61: ADC1->HTRL = ADC1_HTRL_RESET_VALUE;
      0094EF 35 03 54 09      [ 1]   89 	mov	0x5409+0, #0x03
                                     90 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 62: ADC1->LTRH = ADC1_LTRH_RESET_VALUE;
      0094F3 35 00 54 0A      [ 1]   91 	mov	0x540a+0, #0x00
                                     92 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 63: ADC1->LTRL = ADC1_LTRL_RESET_VALUE;
      0094F7 35 00 54 0B      [ 1]   93 	mov	0x540b+0, #0x00
                                     94 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 64: ADC1->AWCRH = ADC1_AWCRH_RESET_VALUE;
      0094FB 35 00 54 0E      [ 1]   95 	mov	0x540e+0, #0x00
                                     96 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 65: ADC1->AWCRL = ADC1_AWCRL_RESET_VALUE;
      0094FF 35 00 54 0F      [ 1]   97 	mov	0x540f+0, #0x00
                                     98 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 66: }
      009503 81               [ 4]   99 	ret
                                    100 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 88: void ADC1_Init(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_PresSel_TypeDef ADC1_PrescalerSelection, ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState ADC1_ExtTriggerState, ADC1_Align_TypeDef ADC1_Align, ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState ADC1_SchmittTriggerState)
                                    101 ;	-----------------------------------------
                                    102 ;	 function ADC1_Init
                                    103 ;	-----------------------------------------
      009504                        104 _ADC1_Init:
                                    105 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 103: ADC1_ConversionConfig(ADC1_ConversionMode, ADC1_Channel, ADC1_Align);
      009504 7B 08            [ 1]  106 	ld	a, (0x08, sp)
      009506 88               [ 1]  107 	push	a
      009507 7B 05            [ 1]  108 	ld	a, (0x05, sp)
      009509 88               [ 1]  109 	push	a
      00950A 7B 05            [ 1]  110 	ld	a, (0x05, sp)
      00950C 88               [ 1]  111 	push	a
      00950D CD 96 1A         [ 4]  112 	call	_ADC1_ConversionConfig
      009510 5B 03            [ 2]  113 	addw	sp, #3
                                    114 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 105: ADC1_PrescalerConfig(ADC1_PrescalerSelection);
      009512 7B 05            [ 1]  115 	ld	a, (0x05, sp)
      009514 88               [ 1]  116 	push	a
      009515 CD 95 8B         [ 4]  117 	call	_ADC1_PrescalerConfig
      009518 84               [ 1]  118 	pop	a
                                    119 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 110: ADC1_ExternalTriggerConfig(ADC1_ExtTrigger, ADC1_ExtTriggerState);
      009519 7B 07            [ 1]  120 	ld	a, (0x07, sp)
      00951B 88               [ 1]  121 	push	a
      00951C 7B 07            [ 1]  122 	ld	a, (0x07, sp)
      00951E 88               [ 1]  123 	push	a
      00951F CD 96 4D         [ 4]  124 	call	_ADC1_ExternalTriggerConfig
      009522 5B 02            [ 2]  125 	addw	sp, #2
                                    126 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 115: ADC1_SchmittTriggerConfig(ADC1_SchmittTriggerChannel, ADC1_SchmittTriggerState);
      009524 7B 0A            [ 1]  127 	ld	a, (0x0a, sp)
      009526 88               [ 1]  128 	push	a
      009527 7B 0A            [ 1]  129 	ld	a, (0x0a, sp)
      009529 88               [ 1]  130 	push	a
      00952A CD 95 9C         [ 4]  131 	call	_ADC1_SchmittTriggerConfig
      00952D 5B 02            [ 2]  132 	addw	sp, #2
                                    133 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 118: ADC1->CR1 |= ADC1_CR1_ADON;
      00952F 72 10 54 01      [ 1]  134 	bset	21505, #0
                                    135 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 119: }
      009533 81               [ 4]  136 	ret
                                    137 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 126: void ADC1_Cmd(FunctionalState NewState)
                                    138 ;	-----------------------------------------
                                    139 ;	 function ADC1_Cmd
                                    140 ;	-----------------------------------------
      009534                        141 _ADC1_Cmd:
                                    142 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 133: ADC1->CR1 |= ADC1_CR1_ADON;
      009534 C6 54 01         [ 1]  143 	ld	a, 0x5401
                                    144 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 131: if (NewState != DISABLE)
      009537 0D 03            [ 1]  145 	tnz	(0x03, sp)
      009539 27 06            [ 1]  146 	jreq	00102$
                                    147 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 133: ADC1->CR1 |= ADC1_CR1_ADON;
      00953B AA 01            [ 1]  148 	or	a, #0x01
      00953D C7 54 01         [ 1]  149 	ld	0x5401, a
      009540 81               [ 4]  150 	ret
      009541                        151 00102$:
                                    152 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 137: ADC1->CR1 &= (uint8_t)(~ADC1_CR1_ADON);
      009541 A4 FE            [ 1]  153 	and	a, #0xfe
      009543 C7 54 01         [ 1]  154 	ld	0x5401, a
                                    155 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 139: }
      009546 81               [ 4]  156 	ret
                                    157 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 146: void ADC1_ScanModeCmd(FunctionalState NewState)
                                    158 ;	-----------------------------------------
                                    159 ;	 function ADC1_ScanModeCmd
                                    160 ;	-----------------------------------------
      009547                        161 _ADC1_ScanModeCmd:
                                    162 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 153: ADC1->CR2 |= ADC1_CR2_SCAN;
      009547 C6 54 02         [ 1]  163 	ld	a, 0x5402
                                    164 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 151: if (NewState != DISABLE)
      00954A 0D 03            [ 1]  165 	tnz	(0x03, sp)
      00954C 27 06            [ 1]  166 	jreq	00102$
                                    167 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 153: ADC1->CR2 |= ADC1_CR2_SCAN;
      00954E AA 02            [ 1]  168 	or	a, #0x02
      009550 C7 54 02         [ 1]  169 	ld	0x5402, a
      009553 81               [ 4]  170 	ret
      009554                        171 00102$:
                                    172 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 157: ADC1->CR2 &= (uint8_t)(~ADC1_CR2_SCAN);
      009554 A4 FD            [ 1]  173 	and	a, #0xfd
      009556 C7 54 02         [ 1]  174 	ld	0x5402, a
                                    175 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 159: }
      009559 81               [ 4]  176 	ret
                                    177 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 166: void ADC1_DataBufferCmd(FunctionalState NewState)
                                    178 ;	-----------------------------------------
                                    179 ;	 function ADC1_DataBufferCmd
                                    180 ;	-----------------------------------------
      00955A                        181 _ADC1_DataBufferCmd:
                                    182 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 173: ADC1->CR3 |= ADC1_CR3_DBUF;
      00955A C6 54 03         [ 1]  183 	ld	a, 0x5403
                                    184 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 171: if (NewState != DISABLE)
      00955D 0D 03            [ 1]  185 	tnz	(0x03, sp)
      00955F 27 06            [ 1]  186 	jreq	00102$
                                    187 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 173: ADC1->CR3 |= ADC1_CR3_DBUF;
      009561 AA 80            [ 1]  188 	or	a, #0x80
      009563 C7 54 03         [ 1]  189 	ld	0x5403, a
      009566 81               [ 4]  190 	ret
      009567                        191 00102$:
                                    192 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 177: ADC1->CR3 &= (uint8_t)(~ADC1_CR3_DBUF);
      009567 A4 7F            [ 1]  193 	and	a, #0x7f
      009569 C7 54 03         [ 1]  194 	ld	0x5403, a
                                    195 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 179: }
      00956C 81               [ 4]  196 	ret
                                    197 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 190: void ADC1_ITConfig(ADC1_IT_TypeDef ADC1_IT, FunctionalState NewState)
                                    198 ;	-----------------------------------------
                                    199 ;	 function ADC1_ITConfig
                                    200 ;	-----------------------------------------
      00956D                        201 _ADC1_ITConfig:
      00956D 88               [ 1]  202 	push	a
                                    203 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 199: ADC1->CSR |= (uint8_t)ADC1_IT;
      00956E C6 54 00         [ 1]  204 	ld	a, 0x5400
      009571 6B 01            [ 1]  205 	ld	(0x01, sp), a
                                    206 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 196: if (NewState != DISABLE)
      009573 0D 06            [ 1]  207 	tnz	(0x06, sp)
      009575 27 09            [ 1]  208 	jreq	00102$
                                    209 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 199: ADC1->CSR |= (uint8_t)ADC1_IT;
      009577 7B 05            [ 1]  210 	ld	a, (0x05, sp)
      009579 1A 01            [ 1]  211 	or	a, (0x01, sp)
      00957B C7 54 00         [ 1]  212 	ld	0x5400, a
      00957E 20 09            [ 2]  213 	jra	00104$
      009580                        214 00102$:
                                    215 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 204: ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ADC1_IT);
      009580 1E 04            [ 2]  216 	ldw	x, (0x04, sp)
      009582 53               [ 2]  217 	cplw	x
      009583 9F               [ 1]  218 	ld	a, xl
      009584 14 01            [ 1]  219 	and	a, (0x01, sp)
      009586 C7 54 00         [ 1]  220 	ld	0x5400, a
      009589                        221 00104$:
                                    222 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 206: }
      009589 84               [ 1]  223 	pop	a
      00958A 81               [ 4]  224 	ret
                                    225 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 214: void ADC1_PrescalerConfig(ADC1_PresSel_TypeDef ADC1_Prescaler)
                                    226 ;	-----------------------------------------
                                    227 ;	 function ADC1_PrescalerConfig
                                    228 ;	-----------------------------------------
      00958B                        229 _ADC1_PrescalerConfig:
                                    230 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 220: ADC1->CR1 &= (uint8_t)(~ADC1_CR1_SPSEL);
      00958B C6 54 01         [ 1]  231 	ld	a, 0x5401
      00958E A4 8F            [ 1]  232 	and	a, #0x8f
      009590 C7 54 01         [ 1]  233 	ld	0x5401, a
                                    234 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 222: ADC1->CR1 |= (uint8_t)(ADC1_Prescaler);
      009593 C6 54 01         [ 1]  235 	ld	a, 0x5401
      009596 1A 03            [ 1]  236 	or	a, (0x03, sp)
      009598 C7 54 01         [ 1]  237 	ld	0x5401, a
                                    238 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 223: }
      00959B 81               [ 4]  239 	ret
                                    240 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 233: void ADC1_SchmittTriggerConfig(ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState NewState)
                                    241 ;	-----------------------------------------
                                    242 ;	 function ADC1_SchmittTriggerConfig
                                    243 ;	-----------------------------------------
      00959C                        244 _ADC1_SchmittTriggerConfig:
      00959C 52 02            [ 2]  245 	sub	sp, #2
                                    246 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 239: if (ADC1_SchmittTriggerChannel == ADC1_SCHMITTTRIG_ALL)
      00959E 7B 05            [ 1]  247 	ld	a, (0x05, sp)
      0095A0 4C               [ 1]  248 	inc	a
      0095A1 26 21            [ 1]  249 	jrne	00114$
                                    250 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 243: ADC1->TDRL &= (uint8_t)0x0;
      0095A3 C6 54 07         [ 1]  251 	ld	a, 0x5407
                                    252 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 241: if (NewState != DISABLE)
      0095A6 0D 06            [ 1]  253 	tnz	(0x06, sp)
      0095A8 27 0D            [ 1]  254 	jreq	00102$
                                    255 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 243: ADC1->TDRL &= (uint8_t)0x0;
      0095AA 35 00 54 07      [ 1]  256 	mov	0x5407+0, #0x00
                                    257 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 244: ADC1->TDRH &= (uint8_t)0x0;
      0095AE C6 54 06         [ 1]  258 	ld	a, 0x5406
      0095B1 35 00 54 06      [ 1]  259 	mov	0x5406+0, #0x00
      0095B5 20 60            [ 2]  260 	jra	00116$
      0095B7                        261 00102$:
                                    262 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 248: ADC1->TDRL |= (uint8_t)0xFF;
      0095B7 35 FF 54 07      [ 1]  263 	mov	0x5407+0, #0xff
                                    264 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 249: ADC1->TDRH |= (uint8_t)0xFF;
      0095BB C6 54 06         [ 1]  265 	ld	a, 0x5406
      0095BE 35 FF 54 06      [ 1]  266 	mov	0x5406+0, #0xff
      0095C2 20 53            [ 2]  267 	jra	00116$
      0095C4                        268 00114$:
                                    269 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 252: else if (ADC1_SchmittTriggerChannel < ADC1_SCHMITTTRIG_CHANNEL8)
      0095C4 7B 05            [ 1]  270 	ld	a, (0x05, sp)
      0095C6 A1 08            [ 1]  271 	cp	a, #0x08
      0095C8 24 25            [ 1]  272 	jrnc	00111$
                                    273 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 243: ADC1->TDRL &= (uint8_t)0x0;
      0095CA C6 54 07         [ 1]  274 	ld	a, 0x5407
      0095CD 6B 01            [ 1]  275 	ld	(0x01, sp), a
                                    276 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 256: ADC1->TDRL &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel));
      0095CF A6 01            [ 1]  277 	ld	a, #0x01
      0095D1 88               [ 1]  278 	push	a
      0095D2 7B 06            [ 1]  279 	ld	a, (0x06, sp)
      0095D4 27 05            [ 1]  280 	jreq	00149$
      0095D6                        281 00148$:
      0095D6 08 01            [ 1]  282 	sll	(1, sp)
      0095D8 4A               [ 1]  283 	dec	a
      0095D9 26 FB            [ 1]  284 	jrne	00148$
      0095DB                        285 00149$:
      0095DB 84               [ 1]  286 	pop	a
                                    287 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 254: if (NewState != DISABLE)
      0095DC 0D 06            [ 1]  288 	tnz	(0x06, sp)
      0095DE 27 08            [ 1]  289 	jreq	00105$
                                    290 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 256: ADC1->TDRL &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel));
      0095E0 43               [ 1]  291 	cpl	a
      0095E1 14 01            [ 1]  292 	and	a, (0x01, sp)
      0095E3 C7 54 07         [ 1]  293 	ld	0x5407, a
      0095E6 20 2F            [ 2]  294 	jra	00116$
      0095E8                        295 00105$:
                                    296 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 260: ADC1->TDRL |= (uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel);
      0095E8 1A 01            [ 1]  297 	or	a, (0x01, sp)
      0095EA C7 54 07         [ 1]  298 	ld	0x5407, a
      0095ED 20 28            [ 2]  299 	jra	00116$
      0095EF                        300 00111$:
                                    301 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 244: ADC1->TDRH &= (uint8_t)0x0;
      0095EF C6 54 06         [ 1]  302 	ld	a, 0x5406
      0095F2 6B 02            [ 1]  303 	ld	(0x02, sp), a
                                    304 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 267: ADC1->TDRH &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8)));
      0095F4 7B 05            [ 1]  305 	ld	a, (0x05, sp)
      0095F6 A0 08            [ 1]  306 	sub	a, #0x08
      0095F8 97               [ 1]  307 	ld	xl, a
      0095F9 A6 01            [ 1]  308 	ld	a, #0x01
      0095FB 88               [ 1]  309 	push	a
      0095FC 9F               [ 1]  310 	ld	a, xl
      0095FD 4D               [ 1]  311 	tnz	a
      0095FE 27 05            [ 1]  312 	jreq	00152$
      009600                        313 00151$:
      009600 08 01            [ 1]  314 	sll	(1, sp)
      009602 4A               [ 1]  315 	dec	a
      009603 26 FB            [ 1]  316 	jrne	00151$
      009605                        317 00152$:
      009605 84               [ 1]  318 	pop	a
                                    319 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 265: if (NewState != DISABLE)
      009606 0D 06            [ 1]  320 	tnz	(0x06, sp)
      009608 27 08            [ 1]  321 	jreq	00108$
                                    322 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 267: ADC1->TDRH &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8)));
      00960A 43               [ 1]  323 	cpl	a
      00960B 14 02            [ 1]  324 	and	a, (0x02, sp)
      00960D C7 54 06         [ 1]  325 	ld	0x5406, a
      009610 20 05            [ 2]  326 	jra	00116$
      009612                        327 00108$:
                                    328 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 271: ADC1->TDRH |= (uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8));
      009612 1A 02            [ 1]  329 	or	a, (0x02, sp)
      009614 C7 54 06         [ 1]  330 	ld	0x5406, a
      009617                        331 00116$:
                                    332 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 274: }
      009617 5B 02            [ 2]  333 	addw	sp, #2
      009619 81               [ 4]  334 	ret
                                    335 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 286: void ADC1_ConversionConfig(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_Align_TypeDef ADC1_Align)
                                    336 ;	-----------------------------------------
                                    337 ;	 function ADC1_ConversionConfig
                                    338 ;	-----------------------------------------
      00961A                        339 _ADC1_ConversionConfig:
                                    340 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 294: ADC1->CR2 &= (uint8_t)(~ADC1_CR2_ALIGN);
      00961A 72 17 54 02      [ 1]  341 	bres	21506, #3
                                    342 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 296: ADC1->CR2 |= (uint8_t)(ADC1_Align);
      00961E C6 54 02         [ 1]  343 	ld	a, 0x5402
      009621 1A 05            [ 1]  344 	or	a, (0x05, sp)
      009623 C7 54 02         [ 1]  345 	ld	0x5402, a
                                    346 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 301: ADC1->CR1 |= ADC1_CR1_CONT;
      009626 C6 54 01         [ 1]  347 	ld	a, 0x5401
                                    348 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 298: if (ADC1_ConversionMode == ADC1_CONVERSIONMODE_CONTINUOUS)
      009629 88               [ 1]  349 	push	a
      00962A 7B 04            [ 1]  350 	ld	a, (0x04, sp)
      00962C 4A               [ 1]  351 	dec	a
      00962D 84               [ 1]  352 	pop	a
      00962E 26 07            [ 1]  353 	jrne	00102$
                                    354 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 301: ADC1->CR1 |= ADC1_CR1_CONT;
      009630 AA 02            [ 1]  355 	or	a, #0x02
      009632 C7 54 01         [ 1]  356 	ld	0x5401, a
      009635 20 05            [ 2]  357 	jra	00103$
      009637                        358 00102$:
                                    359 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 306: ADC1->CR1 &= (uint8_t)(~ADC1_CR1_CONT);
      009637 A4 FD            [ 1]  360 	and	a, #0xfd
      009639 C7 54 01         [ 1]  361 	ld	0x5401, a
      00963C                        362 00103$:
                                    363 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 310: ADC1->CSR &= (uint8_t)(~ADC1_CSR_CH);
      00963C C6 54 00         [ 1]  364 	ld	a, 0x5400
      00963F A4 F0            [ 1]  365 	and	a, #0xf0
      009641 C7 54 00         [ 1]  366 	ld	0x5400, a
                                    367 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 312: ADC1->CSR |= (uint8_t)(ADC1_Channel);
      009644 C6 54 00         [ 1]  368 	ld	a, 0x5400
      009647 1A 04            [ 1]  369 	or	a, (0x04, sp)
      009649 C7 54 00         [ 1]  370 	ld	0x5400, a
                                    371 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 313: }
      00964C 81               [ 4]  372 	ret
                                    373 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 325: void ADC1_ExternalTriggerConfig(ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState NewState)
                                    374 ;	-----------------------------------------
                                    375 ;	 function ADC1_ExternalTriggerConfig
                                    376 ;	-----------------------------------------
      00964D                        377 _ADC1_ExternalTriggerConfig:
                                    378 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 332: ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTSEL);
      00964D C6 54 02         [ 1]  379 	ld	a, 0x5402
      009650 A4 CF            [ 1]  380 	and	a, #0xcf
      009652 C7 54 02         [ 1]  381 	ld	0x5402, a
      009655 C6 54 02         [ 1]  382 	ld	a, 0x5402
                                    383 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 334: if (NewState != DISABLE)
      009658 0D 04            [ 1]  384 	tnz	(0x04, sp)
      00965A 27 07            [ 1]  385 	jreq	00102$
                                    386 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 337: ADC1->CR2 |= (uint8_t)(ADC1_CR2_EXTTRIG);
      00965C AA 40            [ 1]  387 	or	a, #0x40
      00965E C7 54 02         [ 1]  388 	ld	0x5402, a
      009661 20 05            [ 2]  389 	jra	00103$
      009663                        390 00102$:
                                    391 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 342: ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTTRIG);
      009663 A4 BF            [ 1]  392 	and	a, #0xbf
      009665 C7 54 02         [ 1]  393 	ld	0x5402, a
      009668                        394 00103$:
                                    395 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 346: ADC1->CR2 |= (uint8_t)(ADC1_ExtTrigger);
      009668 C6 54 02         [ 1]  396 	ld	a, 0x5402
      00966B 1A 03            [ 1]  397 	or	a, (0x03, sp)
      00966D C7 54 02         [ 1]  398 	ld	0x5402, a
                                    399 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 347: }
      009670 81               [ 4]  400 	ret
                                    401 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 358: void ADC1_StartConversion(void)
                                    402 ;	-----------------------------------------
                                    403 ;	 function ADC1_StartConversion
                                    404 ;	-----------------------------------------
      009671                        405 _ADC1_StartConversion:
                                    406 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 360: ADC1->CR1 |= ADC1_CR1_ADON;
      009671 72 10 54 01      [ 1]  407 	bset	21505, #0
                                    408 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 361: }
      009675 81               [ 4]  409 	ret
                                    410 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 370: uint16_t ADC1_GetConversionValue(void)
                                    411 ;	-----------------------------------------
                                    412 ;	 function ADC1_GetConversionValue
                                    413 ;	-----------------------------------------
      009676                        414 _ADC1_GetConversionValue:
      009676 52 08            [ 2]  415 	sub	sp, #8
                                    416 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 375: if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
      009678 C6 54 02         [ 1]  417 	ld	a, 0x5402
      00967B A5 08            [ 1]  418 	bcp	a, #0x08
      00967D 27 15            [ 1]  419 	jreq	00102$
                                    420 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 378: templ = ADC1->DRL;
      00967F C6 54 05         [ 1]  421 	ld	a, 0x5405
      009682 97               [ 1]  422 	ld	xl, a
                                    423 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 380: temph = ADC1->DRH;
      009683 C6 54 04         [ 1]  424 	ld	a, 0x5404
                                    425 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 382: temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
      009686 0F 04            [ 1]  426 	clr	(0x04, sp)
      009688 0F 01            [ 1]  427 	clr	(0x01, sp)
      00968A 1A 01            [ 1]  428 	or	a, (0x01, sp)
      00968C 01               [ 1]  429 	rrwa	x
      00968D 1A 04            [ 1]  430 	or	a, (0x04, sp)
      00968F 97               [ 1]  431 	ld	xl, a
      009690 1F 07            [ 2]  432 	ldw	(0x07, sp), x
      009692 20 1D            [ 2]  433 	jra	00103$
      009694                        434 00102$:
                                    435 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 387: temph = ADC1->DRH;
      009694 C6 54 04         [ 1]  436 	ld	a, 0x5404
      009697 5F               [ 1]  437 	clrw	x
      009698 97               [ 1]  438 	ld	xl, a
      009699 51               [ 1]  439 	exgw	x, y
                                    440 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 389: templ = ADC1->DRL;
      00969A C6 54 05         [ 1]  441 	ld	a, 0x5405
                                    442 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 391: temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)((uint16_t)temph << 8));
      00969D 5F               [ 1]  443 	clrw	x
      00969E 97               [ 1]  444 	ld	xl, a
      00969F 58               [ 2]  445 	sllw	x
      0096A0 58               [ 2]  446 	sllw	x
      0096A1 58               [ 2]  447 	sllw	x
      0096A2 58               [ 2]  448 	sllw	x
      0096A3 58               [ 2]  449 	sllw	x
      0096A4 58               [ 2]  450 	sllw	x
      0096A5 1F 05            [ 2]  451 	ldw	(0x05, sp), x
      0096A7 7B 06            [ 1]  452 	ld	a, (0x06, sp)
      0096A9 97               [ 1]  453 	ld	xl, a
      0096AA 90 9F            [ 1]  454 	ld	a, yl
      0096AC 1A 05            [ 1]  455 	or	a, (0x05, sp)
      0096AE 95               [ 1]  456 	ld	xh, a
      0096AF 1F 07            [ 2]  457 	ldw	(0x07, sp), x
      0096B1                        458 00103$:
                                    459 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 394: return ((uint16_t)temph);
      0096B1 1E 07            [ 2]  460 	ldw	x, (0x07, sp)
                                    461 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 395: }
      0096B3 5B 08            [ 2]  462 	addw	sp, #8
      0096B5 81               [ 4]  463 	ret
                                    464 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 405: void ADC1_AWDChannelConfig(ADC1_Channel_TypeDef Channel, FunctionalState NewState)
                                    465 ;	-----------------------------------------
                                    466 ;	 function ADC1_AWDChannelConfig
                                    467 ;	-----------------------------------------
      0096B6                        468 _ADC1_AWDChannelConfig:
      0096B6 52 02            [ 2]  469 	sub	sp, #2
                                    470 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 411: if (Channel < (uint8_t)8)
      0096B8 7B 05            [ 1]  471 	ld	a, (0x05, sp)
      0096BA A1 08            [ 1]  472 	cp	a, #0x08
      0096BC 24 25            [ 1]  473 	jrnc	00108$
                                    474 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 415: ADC1->AWCRL |= (uint8_t)((uint8_t)1 << Channel);
      0096BE C6 54 0F         [ 1]  475 	ld	a, 0x540f
      0096C1 6B 02            [ 1]  476 	ld	(0x02, sp), a
      0096C3 A6 01            [ 1]  477 	ld	a, #0x01
      0096C5 88               [ 1]  478 	push	a
      0096C6 7B 06            [ 1]  479 	ld	a, (0x06, sp)
      0096C8 27 05            [ 1]  480 	jreq	00129$
      0096CA                        481 00128$:
      0096CA 08 01            [ 1]  482 	sll	(1, sp)
      0096CC 4A               [ 1]  483 	dec	a
      0096CD 26 FB            [ 1]  484 	jrne	00128$
      0096CF                        485 00129$:
      0096CF 84               [ 1]  486 	pop	a
                                    487 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 413: if (NewState != DISABLE)
      0096D0 0D 06            [ 1]  488 	tnz	(0x06, sp)
      0096D2 27 07            [ 1]  489 	jreq	00102$
                                    490 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 415: ADC1->AWCRL |= (uint8_t)((uint8_t)1 << Channel);
      0096D4 1A 02            [ 1]  491 	or	a, (0x02, sp)
      0096D6 C7 54 0F         [ 1]  492 	ld	0x540f, a
      0096D9 20 30            [ 2]  493 	jra	00110$
      0096DB                        494 00102$:
                                    495 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 419: ADC1->AWCRL &= (uint8_t)~(uint8_t)((uint8_t)1 << Channel);
      0096DB 43               [ 1]  496 	cpl	a
      0096DC 14 02            [ 1]  497 	and	a, (0x02, sp)
      0096DE C7 54 0F         [ 1]  498 	ld	0x540f, a
      0096E1 20 28            [ 2]  499 	jra	00110$
      0096E3                        500 00108$:
                                    501 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 426: ADC1->AWCRH |= (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8));
      0096E3 C6 54 0E         [ 1]  502 	ld	a, 0x540e
      0096E6 6B 01            [ 1]  503 	ld	(0x01, sp), a
      0096E8 7B 05            [ 1]  504 	ld	a, (0x05, sp)
      0096EA A0 08            [ 1]  505 	sub	a, #0x08
      0096EC 97               [ 1]  506 	ld	xl, a
      0096ED A6 01            [ 1]  507 	ld	a, #0x01
      0096EF 88               [ 1]  508 	push	a
      0096F0 9F               [ 1]  509 	ld	a, xl
      0096F1 4D               [ 1]  510 	tnz	a
      0096F2 27 05            [ 1]  511 	jreq	00132$
      0096F4                        512 00131$:
      0096F4 08 01            [ 1]  513 	sll	(1, sp)
      0096F6 4A               [ 1]  514 	dec	a
      0096F7 26 FB            [ 1]  515 	jrne	00131$
      0096F9                        516 00132$:
      0096F9 84               [ 1]  517 	pop	a
                                    518 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 424: if (NewState != DISABLE)
      0096FA 0D 06            [ 1]  519 	tnz	(0x06, sp)
      0096FC 27 07            [ 1]  520 	jreq	00105$
                                    521 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 426: ADC1->AWCRH |= (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8));
      0096FE 1A 01            [ 1]  522 	or	a, (0x01, sp)
      009700 C7 54 0E         [ 1]  523 	ld	0x540e, a
      009703 20 06            [ 2]  524 	jra	00110$
      009705                        525 00105$:
                                    526 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 430: ADC1->AWCRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (uint8_t)(Channel - (uint8_t)8));
      009705 43               [ 1]  527 	cpl	a
      009706 14 01            [ 1]  528 	and	a, (0x01, sp)
      009708 C7 54 0E         [ 1]  529 	ld	0x540e, a
      00970B                        530 00110$:
                                    531 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 433: }
      00970B 5B 02            [ 2]  532 	addw	sp, #2
      00970D 81               [ 4]  533 	ret
                                    534 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 441: void ADC1_SetHighThreshold(uint16_t Threshold)
                                    535 ;	-----------------------------------------
                                    536 ;	 function ADC1_SetHighThreshold
                                    537 ;	-----------------------------------------
      00970E                        538 _ADC1_SetHighThreshold:
                                    539 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 443: ADC1->HTRH = (uint8_t)(Threshold >> (uint8_t)2);
      00970E 1E 03            [ 2]  540 	ldw	x, (0x03, sp)
      009710 54               [ 2]  541 	srlw	x
      009711 54               [ 2]  542 	srlw	x
      009712 9F               [ 1]  543 	ld	a, xl
      009713 C7 54 08         [ 1]  544 	ld	0x5408, a
                                    545 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 444: ADC1->HTRL = (uint8_t)Threshold;
      009716 7B 04            [ 1]  546 	ld	a, (0x04, sp)
      009718 C7 54 09         [ 1]  547 	ld	0x5409, a
                                    548 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 445: }
      00971B 81               [ 4]  549 	ret
                                    550 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 453: void ADC1_SetLowThreshold(uint16_t Threshold)
                                    551 ;	-----------------------------------------
                                    552 ;	 function ADC1_SetLowThreshold
                                    553 ;	-----------------------------------------
      00971C                        554 _ADC1_SetLowThreshold:
                                    555 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 455: ADC1->LTRL = (uint8_t)Threshold;
      00971C 7B 04            [ 1]  556 	ld	a, (0x04, sp)
      00971E C7 54 0B         [ 1]  557 	ld	0x540b, a
                                    558 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 456: ADC1->LTRH = (uint8_t)(Threshold >> (uint8_t)2);
      009721 1E 03            [ 2]  559 	ldw	x, (0x03, sp)
      009723 54               [ 2]  560 	srlw	x
      009724 54               [ 2]  561 	srlw	x
      009725 9F               [ 1]  562 	ld	a, xl
      009726 C7 54 0A         [ 1]  563 	ld	0x540a, a
                                    564 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 457: }
      009729 81               [ 4]  565 	ret
                                    566 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 466: uint16_t ADC1_GetBufferValue(uint8_t Buffer)
                                    567 ;	-----------------------------------------
                                    568 ;	 function ADC1_GetBufferValue
                                    569 ;	-----------------------------------------
      00972A                        570 _ADC1_GetBufferValue:
      00972A 52 0B            [ 2]  571 	sub	sp, #11
                                    572 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 474: if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
      00972C C6 54 02         [ 1]  573 	ld	a, 0x5402
      00972F 6B 0B            [ 1]  574 	ld	(0x0b, sp), a
                                    575 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 477: templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
      009731 7B 0E            [ 1]  576 	ld	a, (0x0e, sp)
      009733 48               [ 1]  577 	sll	a
      009734 5F               [ 1]  578 	clrw	x
      009735 97               [ 1]  579 	ld	xl, a
      009736 51               [ 1]  580 	exgw	x, y
      009737 93               [ 1]  581 	ldw	x, y
      009738 1C 53 E1         [ 2]  582 	addw	x, #0x53e1
                                    583 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 479: temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
      00973B 72 A9 53 E0      [ 2]  584 	addw	y, #0x53e0
                                    585 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 477: templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
                                    586 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 479: temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
                                    587 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 477: templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
      00973F F6               [ 1]  588 	ld	a, (x)
      009740 97               [ 1]  589 	ld	xl, a
                                    590 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 479: temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
      009741 90 F6            [ 1]  591 	ld	a, (y)
                                    592 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 474: if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
      009743 88               [ 1]  593 	push	a
      009744 7B 0C            [ 1]  594 	ld	a, (0x0c, sp)
      009746 A5 08            [ 1]  595 	bcp	a, #0x08
      009748 84               [ 1]  596 	pop	a
      009749 27 0E            [ 1]  597 	jreq	00102$
                                    598 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 477: templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
                                    599 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 479: temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
                                    600 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 481: temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
      00974B 0F 08            [ 1]  601 	clr	(0x08, sp)
      00974D 0F 03            [ 1]  602 	clr	(0x03, sp)
      00974F 1A 03            [ 1]  603 	or	a, (0x03, sp)
      009751 01               [ 1]  604 	rrwa	x
      009752 1A 08            [ 1]  605 	or	a, (0x08, sp)
      009754 97               [ 1]  606 	ld	xl, a
      009755 1F 01            [ 2]  607 	ldw	(0x01, sp), x
      009757 20 19            [ 2]  608 	jra	00103$
      009759                        609 00102$:
                                    610 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 486: temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
                                    611 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 488: templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
                                    612 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 490: temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)(temph << 8));
      009759 02               [ 1]  613 	rlwa	x
      00975A 4F               [ 1]  614 	clr	a
      00975B 01               [ 1]  615 	rrwa	x
      00975C 58               [ 2]  616 	sllw	x
      00975D 58               [ 2]  617 	sllw	x
      00975E 58               [ 2]  618 	sllw	x
      00975F 58               [ 2]  619 	sllw	x
      009760 58               [ 2]  620 	sllw	x
      009761 58               [ 2]  621 	sllw	x
      009762 1F 09            [ 2]  622 	ldw	(0x09, sp), x
      009764 97               [ 1]  623 	ld	xl, a
      009765 7B 0A            [ 1]  624 	ld	a, (0x0a, sp)
      009767 6B 06            [ 1]  625 	ld	(0x06, sp), a
      009769 9F               [ 1]  626 	ld	a, xl
      00976A 1A 09            [ 1]  627 	or	a, (0x09, sp)
      00976C 6B 01            [ 1]  628 	ld	(0x01, sp), a
      00976E 7B 06            [ 1]  629 	ld	a, (0x06, sp)
      009770 6B 02            [ 1]  630 	ld	(0x02, sp), a
      009772                        631 00103$:
                                    632 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 493: return ((uint16_t)temph);
      009772 1E 01            [ 2]  633 	ldw	x, (0x01, sp)
                                    634 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 494: }
      009774 5B 0B            [ 2]  635 	addw	sp, #11
      009776 81               [ 4]  636 	ret
                                    637 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 502: FlagStatus ADC1_GetAWDChannelStatus(ADC1_Channel_TypeDef Channel)
                                    638 ;	-----------------------------------------
                                    639 ;	 function ADC1_GetAWDChannelStatus
                                    640 ;	-----------------------------------------
      009777                        641 _ADC1_GetAWDChannelStatus:
      009777 52 02            [ 2]  642 	sub	sp, #2
                                    643 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 509: if (Channel < (uint8_t)8)
      009779 7B 05            [ 1]  644 	ld	a, (0x05, sp)
      00977B A1 08            [ 1]  645 	cp	a, #0x08
      00977D 24 16            [ 1]  646 	jrnc	00102$
                                    647 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 511: status = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << Channel));
      00977F C6 54 0D         [ 1]  648 	ld	a, 0x540d
      009782 88               [ 1]  649 	push	a
      009783 A6 01            [ 1]  650 	ld	a, #0x01
      009785 6B 03            [ 1]  651 	ld	(0x03, sp), a
      009787 7B 06            [ 1]  652 	ld	a, (0x06, sp)
      009789 27 05            [ 1]  653 	jreq	00113$
      00978B                        654 00112$:
      00978B 08 03            [ 1]  655 	sll	(0x03, sp)
      00978D 4A               [ 1]  656 	dec	a
      00978E 26 FB            [ 1]  657 	jrne	00112$
      009790                        658 00113$:
      009790 84               [ 1]  659 	pop	a
      009791 14 02            [ 1]  660 	and	a, (0x02, sp)
      009793 20 19            [ 2]  661 	jra	00103$
      009795                        662 00102$:
                                    663 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 515: status = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8)));
      009795 C6 54 0C         [ 1]  664 	ld	a, 0x540c
      009798 97               [ 1]  665 	ld	xl, a
      009799 7B 05            [ 1]  666 	ld	a, (0x05, sp)
      00979B A0 08            [ 1]  667 	sub	a, #0x08
      00979D 88               [ 1]  668 	push	a
      00979E A6 01            [ 1]  669 	ld	a, #0x01
      0097A0 6B 02            [ 1]  670 	ld	(0x02, sp), a
      0097A2 84               [ 1]  671 	pop	a
      0097A3 4D               [ 1]  672 	tnz	a
      0097A4 27 05            [ 1]  673 	jreq	00115$
      0097A6                        674 00114$:
      0097A6 08 01            [ 1]  675 	sll	(0x01, sp)
      0097A8 4A               [ 1]  676 	dec	a
      0097A9 26 FB            [ 1]  677 	jrne	00114$
      0097AB                        678 00115$:
      0097AB 9F               [ 1]  679 	ld	a, xl
      0097AC 14 01            [ 1]  680 	and	a, (0x01, sp)
      0097AE                        681 00103$:
                                    682 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 518: return ((FlagStatus)status);
                                    683 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 519: }
      0097AE 5B 02            [ 2]  684 	addw	sp, #2
      0097B0 81               [ 4]  685 	ret
                                    686 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 527: FlagStatus ADC1_GetFlagStatus(ADC1_Flag_TypeDef Flag)
                                    687 ;	-----------------------------------------
                                    688 ;	 function ADC1_GetFlagStatus
                                    689 ;	-----------------------------------------
      0097B1                        690 _ADC1_GetFlagStatus:
      0097B1 52 04            [ 2]  691 	sub	sp, #4
                                    692 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 535: if ((Flag & 0x0F) == 0x01)
      0097B3 7B 07            [ 1]  693 	ld	a, (0x07, sp)
      0097B5 6B 03            [ 1]  694 	ld	(0x03, sp), a
      0097B7 0F 02            [ 1]  695 	clr	(0x02, sp)
      0097B9 7B 03            [ 1]  696 	ld	a, (0x03, sp)
      0097BB A4 0F            [ 1]  697 	and	a, #0x0f
      0097BD 97               [ 1]  698 	ld	xl, a
      0097BE 4F               [ 1]  699 	clr	a
      0097BF 95               [ 1]  700 	ld	xh, a
      0097C0 5A               [ 2]  701 	decw	x
      0097C1 26 07            [ 1]  702 	jrne	00108$
                                    703 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 538: flagstatus = (uint8_t)(ADC1->CR3 & ADC1_CR3_OVR);
      0097C3 C6 54 03         [ 1]  704 	ld	a, 0x5403
      0097C6 A4 40            [ 1]  705 	and	a, #0x40
      0097C8 20 49            [ 2]  706 	jra	00109$
      0097CA                        707 00108$:
                                    708 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 540: else if ((Flag & 0xF0) == 0x10)
      0097CA 7B 03            [ 1]  709 	ld	a, (0x03, sp)
      0097CC A4 F0            [ 1]  710 	and	a, #0xf0
      0097CE 97               [ 1]  711 	ld	xl, a
      0097CF 4F               [ 1]  712 	clr	a
      0097D0 95               [ 1]  713 	ld	xh, a
      0097D1 A3 00 10         [ 2]  714 	cpw	x, #0x0010
      0097D4 26 38            [ 1]  715 	jrne	00105$
                                    716 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 543: temp = (uint8_t)(Flag & (uint8_t)0x0F);
      0097D6 7B 07            [ 1]  717 	ld	a, (0x07, sp)
      0097D8 A4 0F            [ 1]  718 	and	a, #0x0f
                                    719 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 544: if (temp < 8)
      0097DA 97               [ 1]  720 	ld	xl, a
      0097DB A1 08            [ 1]  721 	cp	a, #0x08
      0097DD 24 16            [ 1]  722 	jrnc	00102$
                                    723 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 546: flagstatus = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
      0097DF C6 54 0D         [ 1]  724 	ld	a, 0x540d
      0097E2 6B 04            [ 1]  725 	ld	(0x04, sp), a
      0097E4 A6 01            [ 1]  726 	ld	a, #0x01
      0097E6 88               [ 1]  727 	push	a
      0097E7 9F               [ 1]  728 	ld	a, xl
      0097E8 4D               [ 1]  729 	tnz	a
      0097E9 27 05            [ 1]  730 	jreq	00135$
      0097EB                        731 00134$:
      0097EB 08 01            [ 1]  732 	sll	(1, sp)
      0097ED 4A               [ 1]  733 	dec	a
      0097EE 26 FB            [ 1]  734 	jrne	00134$
      0097F0                        735 00135$:
      0097F0 84               [ 1]  736 	pop	a
      0097F1 14 04            [ 1]  737 	and	a, (0x04, sp)
      0097F3 20 1E            [ 2]  738 	jra	00109$
      0097F5                        739 00102$:
                                    740 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 550: flagstatus = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
      0097F5 C6 54 0C         [ 1]  741 	ld	a, 0x540c
      0097F8 6B 01            [ 1]  742 	ld	(0x01, sp), a
      0097FA 1D 00 08         [ 2]  743 	subw	x, #8
      0097FD A6 01            [ 1]  744 	ld	a, #0x01
      0097FF 88               [ 1]  745 	push	a
      009800 9F               [ 1]  746 	ld	a, xl
      009801 4D               [ 1]  747 	tnz	a
      009802 27 05            [ 1]  748 	jreq	00137$
      009804                        749 00136$:
      009804 08 01            [ 1]  750 	sll	(1, sp)
      009806 4A               [ 1]  751 	dec	a
      009807 26 FB            [ 1]  752 	jrne	00136$
      009809                        753 00137$:
      009809 84               [ 1]  754 	pop	a
      00980A 14 01            [ 1]  755 	and	a, (0x01, sp)
      00980C 20 05            [ 2]  756 	jra	00109$
      00980E                        757 00105$:
                                    758 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 555: flagstatus = (uint8_t)(ADC1->CSR & Flag);
      00980E C6 54 00         [ 1]  759 	ld	a, 0x5400
      009811 14 07            [ 1]  760 	and	a, (0x07, sp)
      009813                        761 00109$:
                                    762 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 557: return ((FlagStatus)flagstatus);
                                    763 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 559: }
      009813 5B 04            [ 2]  764 	addw	sp, #4
      009815 81               [ 4]  765 	ret
                                    766 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 567: void ADC1_ClearFlag(ADC1_Flag_TypeDef Flag)
                                    767 ;	-----------------------------------------
                                    768 ;	 function ADC1_ClearFlag
                                    769 ;	-----------------------------------------
      009816                        770 _ADC1_ClearFlag:
      009816 52 05            [ 2]  771 	sub	sp, #5
                                    772 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 574: if ((Flag & 0x0F) == 0x01)
      009818 7B 08            [ 1]  773 	ld	a, (0x08, sp)
      00981A 0F 01            [ 1]  774 	clr	(0x01, sp)
      00981C 88               [ 1]  775 	push	a
      00981D A4 0F            [ 1]  776 	and	a, #0x0f
      00981F 97               [ 1]  777 	ld	xl, a
      009820 4F               [ 1]  778 	clr	a
      009821 95               [ 1]  779 	ld	xh, a
      009822 84               [ 1]  780 	pop	a
      009823 5A               [ 2]  781 	decw	x
      009824 26 06            [ 1]  782 	jrne	00108$
                                    783 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 577: ADC1->CR3 &= (uint8_t)(~ADC1_CR3_OVR);
      009826 72 1D 54 03      [ 1]  784 	bres	21507, #6
      00982A 20 57            [ 2]  785 	jra	00110$
      00982C                        786 00108$:
                                    787 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 579: else if ((Flag & 0xF0) == 0x10)
      00982C A4 F0            [ 1]  788 	and	a, #0xf0
      00982E 97               [ 1]  789 	ld	xl, a
      00982F 4F               [ 1]  790 	clr	a
      009830 95               [ 1]  791 	ld	xh, a
      009831 A3 00 10         [ 2]  792 	cpw	x, #0x0010
      009834 26 40            [ 1]  793 	jrne	00105$
                                    794 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 582: temp = (uint8_t)(Flag & (uint8_t)0x0F);
      009836 7B 08            [ 1]  795 	ld	a, (0x08, sp)
      009838 A4 0F            [ 1]  796 	and	a, #0x0f
                                    797 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 583: if (temp < 8)
      00983A 97               [ 1]  798 	ld	xl, a
      00983B A1 08            [ 1]  799 	cp	a, #0x08
      00983D 24 1A            [ 1]  800 	jrnc	00102$
                                    801 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 585: ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
      00983F C6 54 0D         [ 1]  802 	ld	a, 0x540d
      009842 6B 05            [ 1]  803 	ld	(0x05, sp), a
      009844 A6 01            [ 1]  804 	ld	a, #0x01
      009846 88               [ 1]  805 	push	a
      009847 9F               [ 1]  806 	ld	a, xl
      009848 4D               [ 1]  807 	tnz	a
      009849 27 05            [ 1]  808 	jreq	00135$
      00984B                        809 00134$:
      00984B 08 01            [ 1]  810 	sll	(1, sp)
      00984D 4A               [ 1]  811 	dec	a
      00984E 26 FB            [ 1]  812 	jrne	00134$
      009850                        813 00135$:
      009850 84               [ 1]  814 	pop	a
      009851 43               [ 1]  815 	cpl	a
      009852 14 05            [ 1]  816 	and	a, (0x05, sp)
      009854 C7 54 0D         [ 1]  817 	ld	0x540d, a
      009857 20 2A            [ 2]  818 	jra	00110$
      009859                        819 00102$:
                                    820 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 589: ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
      009859 C6 54 0C         [ 1]  821 	ld	a, 0x540c
      00985C 6B 04            [ 1]  822 	ld	(0x04, sp), a
      00985E 1D 00 08         [ 2]  823 	subw	x, #8
      009861 A6 01            [ 1]  824 	ld	a, #0x01
      009863 88               [ 1]  825 	push	a
      009864 9F               [ 1]  826 	ld	a, xl
      009865 4D               [ 1]  827 	tnz	a
      009866 27 05            [ 1]  828 	jreq	00137$
      009868                        829 00136$:
      009868 08 01            [ 1]  830 	sll	(1, sp)
      00986A 4A               [ 1]  831 	dec	a
      00986B 26 FB            [ 1]  832 	jrne	00136$
      00986D                        833 00137$:
      00986D 84               [ 1]  834 	pop	a
      00986E 43               [ 1]  835 	cpl	a
      00986F 14 04            [ 1]  836 	and	a, (0x04, sp)
      009871 C7 54 0C         [ 1]  837 	ld	0x540c, a
      009874 20 0D            [ 2]  838 	jra	00110$
      009876                        839 00105$:
                                    840 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 594: ADC1->CSR &= (uint8_t) (~Flag);
      009876 C6 54 00         [ 1]  841 	ld	a, 0x5400
      009879 6B 03            [ 1]  842 	ld	(0x03, sp), a
      00987B 7B 08            [ 1]  843 	ld	a, (0x08, sp)
      00987D 43               [ 1]  844 	cpl	a
      00987E 14 03            [ 1]  845 	and	a, (0x03, sp)
      009880 C7 54 00         [ 1]  846 	ld	0x5400, a
      009883                        847 00110$:
                                    848 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 596: }
      009883 5B 05            [ 2]  849 	addw	sp, #5
      009885 81               [ 4]  850 	ret
                                    851 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 616: ITStatus ADC1_GetITStatus(ADC1_IT_TypeDef ITPendingBit)
                                    852 ;	-----------------------------------------
                                    853 ;	 function ADC1_GetITStatus
                                    854 ;	-----------------------------------------
      009886                        855 _ADC1_GetITStatus:
      009886 52 03            [ 2]  856 	sub	sp, #3
                                    857 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 624: if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
      009888 7B 07            [ 1]  858 	ld	a, (0x07, sp)
      00988A A4 F0            [ 1]  859 	and	a, #0xf0
      00988C 97               [ 1]  860 	ld	xl, a
      00988D 4F               [ 1]  861 	clr	a
      00988E 95               [ 1]  862 	ld	xh, a
                                    863 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 627: temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
      00988F 7B 07            [ 1]  864 	ld	a, (0x07, sp)
                                    865 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 624: if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
      009891 A3 00 10         [ 2]  866 	cpw	x, #0x0010
      009894 26 36            [ 1]  867 	jrne	00105$
                                    868 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 627: temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
      009896 A4 0F            [ 1]  869 	and	a, #0x0f
                                    870 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 628: if (temp < 8)
      009898 97               [ 1]  871 	ld	xl, a
      009899 A1 08            [ 1]  872 	cp	a, #0x08
      00989B 24 16            [ 1]  873 	jrnc	00102$
                                    874 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 630: itstatus = (ITStatus)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
      00989D C6 54 0D         [ 1]  875 	ld	a, 0x540d
      0098A0 88               [ 1]  876 	push	a
      0098A1 A6 01            [ 1]  877 	ld	a, #0x01
      0098A3 6B 04            [ 1]  878 	ld	(0x04, sp), a
      0098A5 9F               [ 1]  879 	ld	a, xl
      0098A6 4D               [ 1]  880 	tnz	a
      0098A7 27 05            [ 1]  881 	jreq	00124$
      0098A9                        882 00123$:
      0098A9 08 04            [ 1]  883 	sll	(0x04, sp)
      0098AB 4A               [ 1]  884 	dec	a
      0098AC 26 FB            [ 1]  885 	jrne	00123$
      0098AE                        886 00124$:
      0098AE 84               [ 1]  887 	pop	a
      0098AF 14 03            [ 1]  888 	and	a, (0x03, sp)
      0098B1 20 23            [ 2]  889 	jra	00106$
      0098B3                        890 00102$:
                                    891 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 634: itstatus = (ITStatus)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
      0098B3 C6 54 0C         [ 1]  892 	ld	a, 0x540c
      0098B6 6B 02            [ 1]  893 	ld	(0x02, sp), a
      0098B8 1D 00 08         [ 2]  894 	subw	x, #8
      0098BB A6 01            [ 1]  895 	ld	a, #0x01
      0098BD 88               [ 1]  896 	push	a
      0098BE 9F               [ 1]  897 	ld	a, xl
      0098BF 4D               [ 1]  898 	tnz	a
      0098C0 27 05            [ 1]  899 	jreq	00126$
      0098C2                        900 00125$:
      0098C2 08 01            [ 1]  901 	sll	(1, sp)
      0098C4 4A               [ 1]  902 	dec	a
      0098C5 26 FB            [ 1]  903 	jrne	00125$
      0098C7                        904 00126$:
      0098C7 84               [ 1]  905 	pop	a
      0098C8 14 02            [ 1]  906 	and	a, (0x02, sp)
      0098CA 20 0A            [ 2]  907 	jra	00106$
      0098CC                        908 00105$:
                                    909 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 639: itstatus = (ITStatus)(ADC1->CSR & (uint8_t)ITPendingBit);
      0098CC AE 54 00         [ 2]  910 	ldw	x, #0x5400
      0098CF 88               [ 1]  911 	push	a
      0098D0 F6               [ 1]  912 	ld	a, (x)
      0098D1 6B 02            [ 1]  913 	ld	(0x02, sp), a
      0098D3 84               [ 1]  914 	pop	a
      0098D4 14 01            [ 1]  915 	and	a, (0x01, sp)
      0098D6                        916 00106$:
                                    917 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 641: return ((ITStatus)itstatus);
                                    918 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 642: }
      0098D6 5B 03            [ 2]  919 	addw	sp, #3
      0098D8 81               [ 4]  920 	ret
                                    921 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 662: void ADC1_ClearITPendingBit(ADC1_IT_TypeDef ITPendingBit)
                                    922 ;	-----------------------------------------
                                    923 ;	 function ADC1_ClearITPendingBit
                                    924 ;	-----------------------------------------
      0098D9                        925 _ADC1_ClearITPendingBit:
      0098D9 52 02            [ 2]  926 	sub	sp, #2
                                    927 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 669: if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
      0098DB 7B 06            [ 1]  928 	ld	a, (0x06, sp)
      0098DD A4 F0            [ 1]  929 	and	a, #0xf0
      0098DF 97               [ 1]  930 	ld	xl, a
      0098E0 4F               [ 1]  931 	clr	a
      0098E1 95               [ 1]  932 	ld	xh, a
      0098E2 A3 00 10         [ 2]  933 	cpw	x, #0x0010
      0098E5 26 40            [ 1]  934 	jrne	00105$
                                    935 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 672: temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
      0098E7 7B 06            [ 1]  936 	ld	a, (0x06, sp)
      0098E9 A4 0F            [ 1]  937 	and	a, #0x0f
                                    938 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 673: if (temp < 8)
      0098EB 97               [ 1]  939 	ld	xl, a
      0098EC A1 08            [ 1]  940 	cp	a, #0x08
      0098EE 24 1A            [ 1]  941 	jrnc	00102$
                                    942 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 675: ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
      0098F0 C6 54 0D         [ 1]  943 	ld	a, 0x540d
      0098F3 6B 02            [ 1]  944 	ld	(0x02, sp), a
      0098F5 A6 01            [ 1]  945 	ld	a, #0x01
      0098F7 88               [ 1]  946 	push	a
      0098F8 9F               [ 1]  947 	ld	a, xl
      0098F9 4D               [ 1]  948 	tnz	a
      0098FA 27 05            [ 1]  949 	jreq	00124$
      0098FC                        950 00123$:
      0098FC 08 01            [ 1]  951 	sll	(1, sp)
      0098FE 4A               [ 1]  952 	dec	a
      0098FF 26 FB            [ 1]  953 	jrne	00123$
      009901                        954 00124$:
      009901 84               [ 1]  955 	pop	a
      009902 43               [ 1]  956 	cpl	a
      009903 14 02            [ 1]  957 	and	a, (0x02, sp)
      009905 C7 54 0D         [ 1]  958 	ld	0x540d, a
      009908 20 2A            [ 2]  959 	jra	00107$
      00990A                        960 00102$:
                                    961 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 679: ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
      00990A C6 54 0C         [ 1]  962 	ld	a, 0x540c
      00990D 6B 01            [ 1]  963 	ld	(0x01, sp), a
      00990F 1D 00 08         [ 2]  964 	subw	x, #8
      009912 A6 01            [ 1]  965 	ld	a, #0x01
      009914 88               [ 1]  966 	push	a
      009915 9F               [ 1]  967 	ld	a, xl
      009916 4D               [ 1]  968 	tnz	a
      009917 27 05            [ 1]  969 	jreq	00126$
      009919                        970 00125$:
      009919 08 01            [ 1]  971 	sll	(1, sp)
      00991B 4A               [ 1]  972 	dec	a
      00991C 26 FB            [ 1]  973 	jrne	00125$
      00991E                        974 00126$:
      00991E 84               [ 1]  975 	pop	a
      00991F 43               [ 1]  976 	cpl	a
      009920 14 01            [ 1]  977 	and	a, (0x01, sp)
      009922 C7 54 0C         [ 1]  978 	ld	0x540c, a
      009925 20 0D            [ 2]  979 	jra	00107$
      009927                        980 00105$:
                                    981 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 684: ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ITPendingBit);
      009927 C6 54 00         [ 1]  982 	ld	a, 0x5400
      00992A 1E 05            [ 2]  983 	ldw	x, (0x05, sp)
      00992C 53               [ 2]  984 	cplw	x
      00992D 89               [ 2]  985 	pushw	x
      00992E 14 02            [ 1]  986 	and	a, (2, sp)
      009930 85               [ 2]  987 	popw	x
      009931 C7 54 00         [ 1]  988 	ld	0x5400, a
      009934                        989 00107$:
                                    990 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 686: }
      009934 5B 02            [ 2]  991 	addw	sp, #2
      009936 81               [ 4]  992 	ret
                                    993 	.area CODE
                                    994 	.area CONST
                                    995 	.area INITIALIZER
                                    996 	.area CABS (ABS)
