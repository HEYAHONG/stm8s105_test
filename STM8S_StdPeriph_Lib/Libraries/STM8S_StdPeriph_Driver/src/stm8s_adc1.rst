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
      008CB7                         73 _ADC1_DeInit:
                                     74 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 54: ADC1->CSR  = ADC1_CSR_RESET_VALUE;
      008CB7 35 00 54 00      [ 1]   75 	mov	0x5400+0, #0x00
                                     76 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 55: ADC1->CR1  = ADC1_CR1_RESET_VALUE;
      008CBB 35 00 54 01      [ 1]   77 	mov	0x5401+0, #0x00
                                     78 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 56: ADC1->CR2  = ADC1_CR2_RESET_VALUE;
      008CBF 35 00 54 02      [ 1]   79 	mov	0x5402+0, #0x00
                                     80 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 57: ADC1->CR3  = ADC1_CR3_RESET_VALUE;
      008CC3 35 00 54 03      [ 1]   81 	mov	0x5403+0, #0x00
                                     82 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 58: ADC1->TDRH = ADC1_TDRH_RESET_VALUE;
      008CC7 35 00 54 06      [ 1]   83 	mov	0x5406+0, #0x00
                                     84 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 59: ADC1->TDRL = ADC1_TDRL_RESET_VALUE;
      008CCB 35 00 54 07      [ 1]   85 	mov	0x5407+0, #0x00
                                     86 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 60: ADC1->HTRH = ADC1_HTRH_RESET_VALUE;
      008CCF 35 FF 54 08      [ 1]   87 	mov	0x5408+0, #0xff
                                     88 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 61: ADC1->HTRL = ADC1_HTRL_RESET_VALUE;
      008CD3 35 03 54 09      [ 1]   89 	mov	0x5409+0, #0x03
                                     90 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 62: ADC1->LTRH = ADC1_LTRH_RESET_VALUE;
      008CD7 35 00 54 0A      [ 1]   91 	mov	0x540a+0, #0x00
                                     92 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 63: ADC1->LTRL = ADC1_LTRL_RESET_VALUE;
      008CDB 35 00 54 0B      [ 1]   93 	mov	0x540b+0, #0x00
                                     94 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 64: ADC1->AWCRH = ADC1_AWCRH_RESET_VALUE;
      008CDF 35 00 54 0E      [ 1]   95 	mov	0x540e+0, #0x00
                                     96 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 65: ADC1->AWCRL = ADC1_AWCRL_RESET_VALUE;
      008CE3 35 00 54 0F      [ 1]   97 	mov	0x540f+0, #0x00
                                     98 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 66: }
      008CE7 81               [ 4]   99 	ret
                                    100 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 88: void ADC1_Init(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_PresSel_TypeDef ADC1_PrescalerSelection, ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState ADC1_ExtTriggerState, ADC1_Align_TypeDef ADC1_Align, ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState ADC1_SchmittTriggerState)
                                    101 ;	-----------------------------------------
                                    102 ;	 function ADC1_Init
                                    103 ;	-----------------------------------------
      008CE8                        104 _ADC1_Init:
                                    105 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 103: ADC1_ConversionConfig(ADC1_ConversionMode, ADC1_Channel, ADC1_Align);
      008CE8 7B 08            [ 1]  106 	ld	a, (0x08, sp)
      008CEA 88               [ 1]  107 	push	a
      008CEB 7B 05            [ 1]  108 	ld	a, (0x05, sp)
      008CED 88               [ 1]  109 	push	a
      008CEE 7B 05            [ 1]  110 	ld	a, (0x05, sp)
      008CF0 88               [ 1]  111 	push	a
      008CF1 CD 8D FE         [ 4]  112 	call	_ADC1_ConversionConfig
      008CF4 5B 03            [ 2]  113 	addw	sp, #3
                                    114 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 105: ADC1_PrescalerConfig(ADC1_PrescalerSelection);
      008CF6 7B 05            [ 1]  115 	ld	a, (0x05, sp)
      008CF8 88               [ 1]  116 	push	a
      008CF9 CD 8D 6F         [ 4]  117 	call	_ADC1_PrescalerConfig
      008CFC 84               [ 1]  118 	pop	a
                                    119 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 110: ADC1_ExternalTriggerConfig(ADC1_ExtTrigger, ADC1_ExtTriggerState);
      008CFD 7B 07            [ 1]  120 	ld	a, (0x07, sp)
      008CFF 88               [ 1]  121 	push	a
      008D00 7B 07            [ 1]  122 	ld	a, (0x07, sp)
      008D02 88               [ 1]  123 	push	a
      008D03 CD 8E 31         [ 4]  124 	call	_ADC1_ExternalTriggerConfig
      008D06 5B 02            [ 2]  125 	addw	sp, #2
                                    126 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 115: ADC1_SchmittTriggerConfig(ADC1_SchmittTriggerChannel, ADC1_SchmittTriggerState);
      008D08 7B 0A            [ 1]  127 	ld	a, (0x0a, sp)
      008D0A 88               [ 1]  128 	push	a
      008D0B 7B 0A            [ 1]  129 	ld	a, (0x0a, sp)
      008D0D 88               [ 1]  130 	push	a
      008D0E CD 8D 80         [ 4]  131 	call	_ADC1_SchmittTriggerConfig
      008D11 5B 02            [ 2]  132 	addw	sp, #2
                                    133 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 118: ADC1->CR1 |= ADC1_CR1_ADON;
      008D13 72 10 54 01      [ 1]  134 	bset	21505, #0
                                    135 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 119: }
      008D17 81               [ 4]  136 	ret
                                    137 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 126: void ADC1_Cmd(FunctionalState NewState)
                                    138 ;	-----------------------------------------
                                    139 ;	 function ADC1_Cmd
                                    140 ;	-----------------------------------------
      008D18                        141 _ADC1_Cmd:
                                    142 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 133: ADC1->CR1 |= ADC1_CR1_ADON;
      008D18 C6 54 01         [ 1]  143 	ld	a, 0x5401
                                    144 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 131: if (NewState != DISABLE)
      008D1B 0D 03            [ 1]  145 	tnz	(0x03, sp)
      008D1D 27 06            [ 1]  146 	jreq	00102$
                                    147 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 133: ADC1->CR1 |= ADC1_CR1_ADON;
      008D1F AA 01            [ 1]  148 	or	a, #0x01
      008D21 C7 54 01         [ 1]  149 	ld	0x5401, a
      008D24 81               [ 4]  150 	ret
      008D25                        151 00102$:
                                    152 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 137: ADC1->CR1 &= (uint8_t)(~ADC1_CR1_ADON);
      008D25 A4 FE            [ 1]  153 	and	a, #0xfe
      008D27 C7 54 01         [ 1]  154 	ld	0x5401, a
                                    155 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 139: }
      008D2A 81               [ 4]  156 	ret
                                    157 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 146: void ADC1_ScanModeCmd(FunctionalState NewState)
                                    158 ;	-----------------------------------------
                                    159 ;	 function ADC1_ScanModeCmd
                                    160 ;	-----------------------------------------
      008D2B                        161 _ADC1_ScanModeCmd:
                                    162 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 153: ADC1->CR2 |= ADC1_CR2_SCAN;
      008D2B C6 54 02         [ 1]  163 	ld	a, 0x5402
                                    164 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 151: if (NewState != DISABLE)
      008D2E 0D 03            [ 1]  165 	tnz	(0x03, sp)
      008D30 27 06            [ 1]  166 	jreq	00102$
                                    167 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 153: ADC1->CR2 |= ADC1_CR2_SCAN;
      008D32 AA 02            [ 1]  168 	or	a, #0x02
      008D34 C7 54 02         [ 1]  169 	ld	0x5402, a
      008D37 81               [ 4]  170 	ret
      008D38                        171 00102$:
                                    172 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 157: ADC1->CR2 &= (uint8_t)(~ADC1_CR2_SCAN);
      008D38 A4 FD            [ 1]  173 	and	a, #0xfd
      008D3A C7 54 02         [ 1]  174 	ld	0x5402, a
                                    175 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 159: }
      008D3D 81               [ 4]  176 	ret
                                    177 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 166: void ADC1_DataBufferCmd(FunctionalState NewState)
                                    178 ;	-----------------------------------------
                                    179 ;	 function ADC1_DataBufferCmd
                                    180 ;	-----------------------------------------
      008D3E                        181 _ADC1_DataBufferCmd:
                                    182 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 173: ADC1->CR3 |= ADC1_CR3_DBUF;
      008D3E C6 54 03         [ 1]  183 	ld	a, 0x5403
                                    184 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 171: if (NewState != DISABLE)
      008D41 0D 03            [ 1]  185 	tnz	(0x03, sp)
      008D43 27 06            [ 1]  186 	jreq	00102$
                                    187 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 173: ADC1->CR3 |= ADC1_CR3_DBUF;
      008D45 AA 80            [ 1]  188 	or	a, #0x80
      008D47 C7 54 03         [ 1]  189 	ld	0x5403, a
      008D4A 81               [ 4]  190 	ret
      008D4B                        191 00102$:
                                    192 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 177: ADC1->CR3 &= (uint8_t)(~ADC1_CR3_DBUF);
      008D4B A4 7F            [ 1]  193 	and	a, #0x7f
      008D4D C7 54 03         [ 1]  194 	ld	0x5403, a
                                    195 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 179: }
      008D50 81               [ 4]  196 	ret
                                    197 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 190: void ADC1_ITConfig(ADC1_IT_TypeDef ADC1_IT, FunctionalState NewState)
                                    198 ;	-----------------------------------------
                                    199 ;	 function ADC1_ITConfig
                                    200 ;	-----------------------------------------
      008D51                        201 _ADC1_ITConfig:
      008D51 88               [ 1]  202 	push	a
                                    203 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 199: ADC1->CSR |= (uint8_t)ADC1_IT;
      008D52 C6 54 00         [ 1]  204 	ld	a, 0x5400
      008D55 6B 01            [ 1]  205 	ld	(0x01, sp), a
                                    206 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 196: if (NewState != DISABLE)
      008D57 0D 06            [ 1]  207 	tnz	(0x06, sp)
      008D59 27 09            [ 1]  208 	jreq	00102$
                                    209 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 199: ADC1->CSR |= (uint8_t)ADC1_IT;
      008D5B 7B 05            [ 1]  210 	ld	a, (0x05, sp)
      008D5D 1A 01            [ 1]  211 	or	a, (0x01, sp)
      008D5F C7 54 00         [ 1]  212 	ld	0x5400, a
      008D62 20 09            [ 2]  213 	jra	00104$
      008D64                        214 00102$:
                                    215 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 204: ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ADC1_IT);
      008D64 1E 04            [ 2]  216 	ldw	x, (0x04, sp)
      008D66 53               [ 2]  217 	cplw	x
      008D67 9F               [ 1]  218 	ld	a, xl
      008D68 14 01            [ 1]  219 	and	a, (0x01, sp)
      008D6A C7 54 00         [ 1]  220 	ld	0x5400, a
      008D6D                        221 00104$:
                                    222 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 206: }
      008D6D 84               [ 1]  223 	pop	a
      008D6E 81               [ 4]  224 	ret
                                    225 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 214: void ADC1_PrescalerConfig(ADC1_PresSel_TypeDef ADC1_Prescaler)
                                    226 ;	-----------------------------------------
                                    227 ;	 function ADC1_PrescalerConfig
                                    228 ;	-----------------------------------------
      008D6F                        229 _ADC1_PrescalerConfig:
                                    230 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 220: ADC1->CR1 &= (uint8_t)(~ADC1_CR1_SPSEL);
      008D6F C6 54 01         [ 1]  231 	ld	a, 0x5401
      008D72 A4 8F            [ 1]  232 	and	a, #0x8f
      008D74 C7 54 01         [ 1]  233 	ld	0x5401, a
                                    234 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 222: ADC1->CR1 |= (uint8_t)(ADC1_Prescaler);
      008D77 C6 54 01         [ 1]  235 	ld	a, 0x5401
      008D7A 1A 03            [ 1]  236 	or	a, (0x03, sp)
      008D7C C7 54 01         [ 1]  237 	ld	0x5401, a
                                    238 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 223: }
      008D7F 81               [ 4]  239 	ret
                                    240 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 233: void ADC1_SchmittTriggerConfig(ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState NewState)
                                    241 ;	-----------------------------------------
                                    242 ;	 function ADC1_SchmittTriggerConfig
                                    243 ;	-----------------------------------------
      008D80                        244 _ADC1_SchmittTriggerConfig:
      008D80 52 02            [ 2]  245 	sub	sp, #2
                                    246 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 239: if (ADC1_SchmittTriggerChannel == ADC1_SCHMITTTRIG_ALL)
      008D82 7B 05            [ 1]  247 	ld	a, (0x05, sp)
      008D84 4C               [ 1]  248 	inc	a
      008D85 26 21            [ 1]  249 	jrne	00114$
                                    250 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 243: ADC1->TDRL &= (uint8_t)0x0;
      008D87 C6 54 07         [ 1]  251 	ld	a, 0x5407
                                    252 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 241: if (NewState != DISABLE)
      008D8A 0D 06            [ 1]  253 	tnz	(0x06, sp)
      008D8C 27 0D            [ 1]  254 	jreq	00102$
                                    255 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 243: ADC1->TDRL &= (uint8_t)0x0;
      008D8E 35 00 54 07      [ 1]  256 	mov	0x5407+0, #0x00
                                    257 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 244: ADC1->TDRH &= (uint8_t)0x0;
      008D92 C6 54 06         [ 1]  258 	ld	a, 0x5406
      008D95 35 00 54 06      [ 1]  259 	mov	0x5406+0, #0x00
      008D99 20 60            [ 2]  260 	jra	00116$
      008D9B                        261 00102$:
                                    262 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 248: ADC1->TDRL |= (uint8_t)0xFF;
      008D9B 35 FF 54 07      [ 1]  263 	mov	0x5407+0, #0xff
                                    264 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 249: ADC1->TDRH |= (uint8_t)0xFF;
      008D9F C6 54 06         [ 1]  265 	ld	a, 0x5406
      008DA2 35 FF 54 06      [ 1]  266 	mov	0x5406+0, #0xff
      008DA6 20 53            [ 2]  267 	jra	00116$
      008DA8                        268 00114$:
                                    269 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 252: else if (ADC1_SchmittTriggerChannel < ADC1_SCHMITTTRIG_CHANNEL8)
      008DA8 7B 05            [ 1]  270 	ld	a, (0x05, sp)
      008DAA A1 08            [ 1]  271 	cp	a, #0x08
      008DAC 24 25            [ 1]  272 	jrnc	00111$
                                    273 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 243: ADC1->TDRL &= (uint8_t)0x0;
      008DAE C6 54 07         [ 1]  274 	ld	a, 0x5407
      008DB1 6B 01            [ 1]  275 	ld	(0x01, sp), a
                                    276 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 256: ADC1->TDRL &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel));
      008DB3 A6 01            [ 1]  277 	ld	a, #0x01
      008DB5 88               [ 1]  278 	push	a
      008DB6 7B 06            [ 1]  279 	ld	a, (0x06, sp)
      008DB8 27 05            [ 1]  280 	jreq	00149$
      008DBA                        281 00148$:
      008DBA 08 01            [ 1]  282 	sll	(1, sp)
      008DBC 4A               [ 1]  283 	dec	a
      008DBD 26 FB            [ 1]  284 	jrne	00148$
      008DBF                        285 00149$:
      008DBF 84               [ 1]  286 	pop	a
                                    287 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 254: if (NewState != DISABLE)
      008DC0 0D 06            [ 1]  288 	tnz	(0x06, sp)
      008DC2 27 08            [ 1]  289 	jreq	00105$
                                    290 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 256: ADC1->TDRL &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel));
      008DC4 43               [ 1]  291 	cpl	a
      008DC5 14 01            [ 1]  292 	and	a, (0x01, sp)
      008DC7 C7 54 07         [ 1]  293 	ld	0x5407, a
      008DCA 20 2F            [ 2]  294 	jra	00116$
      008DCC                        295 00105$:
                                    296 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 260: ADC1->TDRL |= (uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel);
      008DCC 1A 01            [ 1]  297 	or	a, (0x01, sp)
      008DCE C7 54 07         [ 1]  298 	ld	0x5407, a
      008DD1 20 28            [ 2]  299 	jra	00116$
      008DD3                        300 00111$:
                                    301 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 244: ADC1->TDRH &= (uint8_t)0x0;
      008DD3 C6 54 06         [ 1]  302 	ld	a, 0x5406
      008DD6 6B 02            [ 1]  303 	ld	(0x02, sp), a
                                    304 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 267: ADC1->TDRH &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8)));
      008DD8 7B 05            [ 1]  305 	ld	a, (0x05, sp)
      008DDA A0 08            [ 1]  306 	sub	a, #0x08
      008DDC 97               [ 1]  307 	ld	xl, a
      008DDD A6 01            [ 1]  308 	ld	a, #0x01
      008DDF 88               [ 1]  309 	push	a
      008DE0 9F               [ 1]  310 	ld	a, xl
      008DE1 4D               [ 1]  311 	tnz	a
      008DE2 27 05            [ 1]  312 	jreq	00152$
      008DE4                        313 00151$:
      008DE4 08 01            [ 1]  314 	sll	(1, sp)
      008DE6 4A               [ 1]  315 	dec	a
      008DE7 26 FB            [ 1]  316 	jrne	00151$
      008DE9                        317 00152$:
      008DE9 84               [ 1]  318 	pop	a
                                    319 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 265: if (NewState != DISABLE)
      008DEA 0D 06            [ 1]  320 	tnz	(0x06, sp)
      008DEC 27 08            [ 1]  321 	jreq	00108$
                                    322 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 267: ADC1->TDRH &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8)));
      008DEE 43               [ 1]  323 	cpl	a
      008DEF 14 02            [ 1]  324 	and	a, (0x02, sp)
      008DF1 C7 54 06         [ 1]  325 	ld	0x5406, a
      008DF4 20 05            [ 2]  326 	jra	00116$
      008DF6                        327 00108$:
                                    328 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 271: ADC1->TDRH |= (uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8));
      008DF6 1A 02            [ 1]  329 	or	a, (0x02, sp)
      008DF8 C7 54 06         [ 1]  330 	ld	0x5406, a
      008DFB                        331 00116$:
                                    332 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 274: }
      008DFB 5B 02            [ 2]  333 	addw	sp, #2
      008DFD 81               [ 4]  334 	ret
                                    335 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 286: void ADC1_ConversionConfig(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_Align_TypeDef ADC1_Align)
                                    336 ;	-----------------------------------------
                                    337 ;	 function ADC1_ConversionConfig
                                    338 ;	-----------------------------------------
      008DFE                        339 _ADC1_ConversionConfig:
                                    340 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 294: ADC1->CR2 &= (uint8_t)(~ADC1_CR2_ALIGN);
      008DFE 72 17 54 02      [ 1]  341 	bres	21506, #3
                                    342 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 296: ADC1->CR2 |= (uint8_t)(ADC1_Align);
      008E02 C6 54 02         [ 1]  343 	ld	a, 0x5402
      008E05 1A 05            [ 1]  344 	or	a, (0x05, sp)
      008E07 C7 54 02         [ 1]  345 	ld	0x5402, a
                                    346 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 301: ADC1->CR1 |= ADC1_CR1_CONT;
      008E0A C6 54 01         [ 1]  347 	ld	a, 0x5401
                                    348 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 298: if (ADC1_ConversionMode == ADC1_CONVERSIONMODE_CONTINUOUS)
      008E0D 88               [ 1]  349 	push	a
      008E0E 7B 04            [ 1]  350 	ld	a, (0x04, sp)
      008E10 4A               [ 1]  351 	dec	a
      008E11 84               [ 1]  352 	pop	a
      008E12 26 07            [ 1]  353 	jrne	00102$
                                    354 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 301: ADC1->CR1 |= ADC1_CR1_CONT;
      008E14 AA 02            [ 1]  355 	or	a, #0x02
      008E16 C7 54 01         [ 1]  356 	ld	0x5401, a
      008E19 20 05            [ 2]  357 	jra	00103$
      008E1B                        358 00102$:
                                    359 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 306: ADC1->CR1 &= (uint8_t)(~ADC1_CR1_CONT);
      008E1B A4 FD            [ 1]  360 	and	a, #0xfd
      008E1D C7 54 01         [ 1]  361 	ld	0x5401, a
      008E20                        362 00103$:
                                    363 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 310: ADC1->CSR &= (uint8_t)(~ADC1_CSR_CH);
      008E20 C6 54 00         [ 1]  364 	ld	a, 0x5400
      008E23 A4 F0            [ 1]  365 	and	a, #0xf0
      008E25 C7 54 00         [ 1]  366 	ld	0x5400, a
                                    367 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 312: ADC1->CSR |= (uint8_t)(ADC1_Channel);
      008E28 C6 54 00         [ 1]  368 	ld	a, 0x5400
      008E2B 1A 04            [ 1]  369 	or	a, (0x04, sp)
      008E2D C7 54 00         [ 1]  370 	ld	0x5400, a
                                    371 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 313: }
      008E30 81               [ 4]  372 	ret
                                    373 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 325: void ADC1_ExternalTriggerConfig(ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState NewState)
                                    374 ;	-----------------------------------------
                                    375 ;	 function ADC1_ExternalTriggerConfig
                                    376 ;	-----------------------------------------
      008E31                        377 _ADC1_ExternalTriggerConfig:
                                    378 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 332: ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTSEL);
      008E31 C6 54 02         [ 1]  379 	ld	a, 0x5402
      008E34 A4 CF            [ 1]  380 	and	a, #0xcf
      008E36 C7 54 02         [ 1]  381 	ld	0x5402, a
      008E39 C6 54 02         [ 1]  382 	ld	a, 0x5402
                                    383 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 334: if (NewState != DISABLE)
      008E3C 0D 04            [ 1]  384 	tnz	(0x04, sp)
      008E3E 27 07            [ 1]  385 	jreq	00102$
                                    386 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 337: ADC1->CR2 |= (uint8_t)(ADC1_CR2_EXTTRIG);
      008E40 AA 40            [ 1]  387 	or	a, #0x40
      008E42 C7 54 02         [ 1]  388 	ld	0x5402, a
      008E45 20 05            [ 2]  389 	jra	00103$
      008E47                        390 00102$:
                                    391 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 342: ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTTRIG);
      008E47 A4 BF            [ 1]  392 	and	a, #0xbf
      008E49 C7 54 02         [ 1]  393 	ld	0x5402, a
      008E4C                        394 00103$:
                                    395 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 346: ADC1->CR2 |= (uint8_t)(ADC1_ExtTrigger);
      008E4C C6 54 02         [ 1]  396 	ld	a, 0x5402
      008E4F 1A 03            [ 1]  397 	or	a, (0x03, sp)
      008E51 C7 54 02         [ 1]  398 	ld	0x5402, a
                                    399 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 347: }
      008E54 81               [ 4]  400 	ret
                                    401 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 358: void ADC1_StartConversion(void)
                                    402 ;	-----------------------------------------
                                    403 ;	 function ADC1_StartConversion
                                    404 ;	-----------------------------------------
      008E55                        405 _ADC1_StartConversion:
                                    406 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 360: ADC1->CR1 |= ADC1_CR1_ADON;
      008E55 72 10 54 01      [ 1]  407 	bset	21505, #0
                                    408 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 361: }
      008E59 81               [ 4]  409 	ret
                                    410 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 370: uint16_t ADC1_GetConversionValue(void)
                                    411 ;	-----------------------------------------
                                    412 ;	 function ADC1_GetConversionValue
                                    413 ;	-----------------------------------------
      008E5A                        414 _ADC1_GetConversionValue:
      008E5A 52 08            [ 2]  415 	sub	sp, #8
                                    416 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 375: if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
      008E5C C6 54 02         [ 1]  417 	ld	a, 0x5402
      008E5F A5 08            [ 1]  418 	bcp	a, #0x08
      008E61 27 15            [ 1]  419 	jreq	00102$
                                    420 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 378: templ = ADC1->DRL;
      008E63 C6 54 05         [ 1]  421 	ld	a, 0x5405
      008E66 97               [ 1]  422 	ld	xl, a
                                    423 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 380: temph = ADC1->DRH;
      008E67 C6 54 04         [ 1]  424 	ld	a, 0x5404
                                    425 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 382: temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
      008E6A 0F 04            [ 1]  426 	clr	(0x04, sp)
      008E6C 0F 01            [ 1]  427 	clr	(0x01, sp)
      008E6E 1A 01            [ 1]  428 	or	a, (0x01, sp)
      008E70 01               [ 1]  429 	rrwa	x
      008E71 1A 04            [ 1]  430 	or	a, (0x04, sp)
      008E73 97               [ 1]  431 	ld	xl, a
      008E74 1F 07            [ 2]  432 	ldw	(0x07, sp), x
      008E76 20 1D            [ 2]  433 	jra	00103$
      008E78                        434 00102$:
                                    435 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 387: temph = ADC1->DRH;
      008E78 C6 54 04         [ 1]  436 	ld	a, 0x5404
      008E7B 5F               [ 1]  437 	clrw	x
      008E7C 97               [ 1]  438 	ld	xl, a
      008E7D 51               [ 1]  439 	exgw	x, y
                                    440 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 389: templ = ADC1->DRL;
      008E7E C6 54 05         [ 1]  441 	ld	a, 0x5405
                                    442 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 391: temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)((uint16_t)temph << 8));
      008E81 5F               [ 1]  443 	clrw	x
      008E82 97               [ 1]  444 	ld	xl, a
      008E83 58               [ 2]  445 	sllw	x
      008E84 58               [ 2]  446 	sllw	x
      008E85 58               [ 2]  447 	sllw	x
      008E86 58               [ 2]  448 	sllw	x
      008E87 58               [ 2]  449 	sllw	x
      008E88 58               [ 2]  450 	sllw	x
      008E89 1F 05            [ 2]  451 	ldw	(0x05, sp), x
      008E8B 7B 06            [ 1]  452 	ld	a, (0x06, sp)
      008E8D 97               [ 1]  453 	ld	xl, a
      008E8E 90 9F            [ 1]  454 	ld	a, yl
      008E90 1A 05            [ 1]  455 	or	a, (0x05, sp)
      008E92 95               [ 1]  456 	ld	xh, a
      008E93 1F 07            [ 2]  457 	ldw	(0x07, sp), x
      008E95                        458 00103$:
                                    459 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 394: return ((uint16_t)temph);
      008E95 1E 07            [ 2]  460 	ldw	x, (0x07, sp)
                                    461 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 395: }
      008E97 5B 08            [ 2]  462 	addw	sp, #8
      008E99 81               [ 4]  463 	ret
                                    464 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 405: void ADC1_AWDChannelConfig(ADC1_Channel_TypeDef Channel, FunctionalState NewState)
                                    465 ;	-----------------------------------------
                                    466 ;	 function ADC1_AWDChannelConfig
                                    467 ;	-----------------------------------------
      008E9A                        468 _ADC1_AWDChannelConfig:
      008E9A 52 02            [ 2]  469 	sub	sp, #2
                                    470 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 411: if (Channel < (uint8_t)8)
      008E9C 7B 05            [ 1]  471 	ld	a, (0x05, sp)
      008E9E A1 08            [ 1]  472 	cp	a, #0x08
      008EA0 24 25            [ 1]  473 	jrnc	00108$
                                    474 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 415: ADC1->AWCRL |= (uint8_t)((uint8_t)1 << Channel);
      008EA2 C6 54 0F         [ 1]  475 	ld	a, 0x540f
      008EA5 6B 02            [ 1]  476 	ld	(0x02, sp), a
      008EA7 A6 01            [ 1]  477 	ld	a, #0x01
      008EA9 88               [ 1]  478 	push	a
      008EAA 7B 06            [ 1]  479 	ld	a, (0x06, sp)
      008EAC 27 05            [ 1]  480 	jreq	00129$
      008EAE                        481 00128$:
      008EAE 08 01            [ 1]  482 	sll	(1, sp)
      008EB0 4A               [ 1]  483 	dec	a
      008EB1 26 FB            [ 1]  484 	jrne	00128$
      008EB3                        485 00129$:
      008EB3 84               [ 1]  486 	pop	a
                                    487 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 413: if (NewState != DISABLE)
      008EB4 0D 06            [ 1]  488 	tnz	(0x06, sp)
      008EB6 27 07            [ 1]  489 	jreq	00102$
                                    490 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 415: ADC1->AWCRL |= (uint8_t)((uint8_t)1 << Channel);
      008EB8 1A 02            [ 1]  491 	or	a, (0x02, sp)
      008EBA C7 54 0F         [ 1]  492 	ld	0x540f, a
      008EBD 20 30            [ 2]  493 	jra	00110$
      008EBF                        494 00102$:
                                    495 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 419: ADC1->AWCRL &= (uint8_t)~(uint8_t)((uint8_t)1 << Channel);
      008EBF 43               [ 1]  496 	cpl	a
      008EC0 14 02            [ 1]  497 	and	a, (0x02, sp)
      008EC2 C7 54 0F         [ 1]  498 	ld	0x540f, a
      008EC5 20 28            [ 2]  499 	jra	00110$
      008EC7                        500 00108$:
                                    501 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 426: ADC1->AWCRH |= (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8));
      008EC7 C6 54 0E         [ 1]  502 	ld	a, 0x540e
      008ECA 6B 01            [ 1]  503 	ld	(0x01, sp), a
      008ECC 7B 05            [ 1]  504 	ld	a, (0x05, sp)
      008ECE A0 08            [ 1]  505 	sub	a, #0x08
      008ED0 97               [ 1]  506 	ld	xl, a
      008ED1 A6 01            [ 1]  507 	ld	a, #0x01
      008ED3 88               [ 1]  508 	push	a
      008ED4 9F               [ 1]  509 	ld	a, xl
      008ED5 4D               [ 1]  510 	tnz	a
      008ED6 27 05            [ 1]  511 	jreq	00132$
      008ED8                        512 00131$:
      008ED8 08 01            [ 1]  513 	sll	(1, sp)
      008EDA 4A               [ 1]  514 	dec	a
      008EDB 26 FB            [ 1]  515 	jrne	00131$
      008EDD                        516 00132$:
      008EDD 84               [ 1]  517 	pop	a
                                    518 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 424: if (NewState != DISABLE)
      008EDE 0D 06            [ 1]  519 	tnz	(0x06, sp)
      008EE0 27 07            [ 1]  520 	jreq	00105$
                                    521 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 426: ADC1->AWCRH |= (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8));
      008EE2 1A 01            [ 1]  522 	or	a, (0x01, sp)
      008EE4 C7 54 0E         [ 1]  523 	ld	0x540e, a
      008EE7 20 06            [ 2]  524 	jra	00110$
      008EE9                        525 00105$:
                                    526 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 430: ADC1->AWCRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (uint8_t)(Channel - (uint8_t)8));
      008EE9 43               [ 1]  527 	cpl	a
      008EEA 14 01            [ 1]  528 	and	a, (0x01, sp)
      008EEC C7 54 0E         [ 1]  529 	ld	0x540e, a
      008EEF                        530 00110$:
                                    531 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 433: }
      008EEF 5B 02            [ 2]  532 	addw	sp, #2
      008EF1 81               [ 4]  533 	ret
                                    534 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 441: void ADC1_SetHighThreshold(uint16_t Threshold)
                                    535 ;	-----------------------------------------
                                    536 ;	 function ADC1_SetHighThreshold
                                    537 ;	-----------------------------------------
      008EF2                        538 _ADC1_SetHighThreshold:
                                    539 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 443: ADC1->HTRH = (uint8_t)(Threshold >> (uint8_t)2);
      008EF2 1E 03            [ 2]  540 	ldw	x, (0x03, sp)
      008EF4 54               [ 2]  541 	srlw	x
      008EF5 54               [ 2]  542 	srlw	x
      008EF6 9F               [ 1]  543 	ld	a, xl
      008EF7 C7 54 08         [ 1]  544 	ld	0x5408, a
                                    545 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 444: ADC1->HTRL = (uint8_t)Threshold;
      008EFA 7B 04            [ 1]  546 	ld	a, (0x04, sp)
      008EFC C7 54 09         [ 1]  547 	ld	0x5409, a
                                    548 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 445: }
      008EFF 81               [ 4]  549 	ret
                                    550 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 453: void ADC1_SetLowThreshold(uint16_t Threshold)
                                    551 ;	-----------------------------------------
                                    552 ;	 function ADC1_SetLowThreshold
                                    553 ;	-----------------------------------------
      008F00                        554 _ADC1_SetLowThreshold:
                                    555 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 455: ADC1->LTRL = (uint8_t)Threshold;
      008F00 7B 04            [ 1]  556 	ld	a, (0x04, sp)
      008F02 C7 54 0B         [ 1]  557 	ld	0x540b, a
                                    558 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 456: ADC1->LTRH = (uint8_t)(Threshold >> (uint8_t)2);
      008F05 1E 03            [ 2]  559 	ldw	x, (0x03, sp)
      008F07 54               [ 2]  560 	srlw	x
      008F08 54               [ 2]  561 	srlw	x
      008F09 9F               [ 1]  562 	ld	a, xl
      008F0A C7 54 0A         [ 1]  563 	ld	0x540a, a
                                    564 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 457: }
      008F0D 81               [ 4]  565 	ret
                                    566 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 466: uint16_t ADC1_GetBufferValue(uint8_t Buffer)
                                    567 ;	-----------------------------------------
                                    568 ;	 function ADC1_GetBufferValue
                                    569 ;	-----------------------------------------
      008F0E                        570 _ADC1_GetBufferValue:
      008F0E 52 0B            [ 2]  571 	sub	sp, #11
                                    572 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 474: if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
      008F10 C6 54 02         [ 1]  573 	ld	a, 0x5402
      008F13 6B 0B            [ 1]  574 	ld	(0x0b, sp), a
                                    575 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 477: templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
      008F15 7B 0E            [ 1]  576 	ld	a, (0x0e, sp)
      008F17 48               [ 1]  577 	sll	a
      008F18 5F               [ 1]  578 	clrw	x
      008F19 97               [ 1]  579 	ld	xl, a
      008F1A 51               [ 1]  580 	exgw	x, y
      008F1B 93               [ 1]  581 	ldw	x, y
      008F1C 1C 53 E1         [ 2]  582 	addw	x, #0x53e1
                                    583 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 479: temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
      008F1F 72 A9 53 E0      [ 2]  584 	addw	y, #0x53e0
                                    585 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 477: templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
                                    586 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 479: temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
                                    587 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 477: templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
      008F23 F6               [ 1]  588 	ld	a, (x)
      008F24 97               [ 1]  589 	ld	xl, a
                                    590 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 479: temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
      008F25 90 F6            [ 1]  591 	ld	a, (y)
                                    592 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 474: if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
      008F27 88               [ 1]  593 	push	a
      008F28 7B 0C            [ 1]  594 	ld	a, (0x0c, sp)
      008F2A A5 08            [ 1]  595 	bcp	a, #0x08
      008F2C 84               [ 1]  596 	pop	a
      008F2D 27 0E            [ 1]  597 	jreq	00102$
                                    598 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 477: templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
                                    599 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 479: temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
                                    600 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 481: temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
      008F2F 0F 08            [ 1]  601 	clr	(0x08, sp)
      008F31 0F 03            [ 1]  602 	clr	(0x03, sp)
      008F33 1A 03            [ 1]  603 	or	a, (0x03, sp)
      008F35 01               [ 1]  604 	rrwa	x
      008F36 1A 08            [ 1]  605 	or	a, (0x08, sp)
      008F38 97               [ 1]  606 	ld	xl, a
      008F39 1F 01            [ 2]  607 	ldw	(0x01, sp), x
      008F3B 20 19            [ 2]  608 	jra	00103$
      008F3D                        609 00102$:
                                    610 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 486: temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
                                    611 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 488: templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
                                    612 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 490: temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)(temph << 8));
      008F3D 02               [ 1]  613 	rlwa	x
      008F3E 4F               [ 1]  614 	clr	a
      008F3F 01               [ 1]  615 	rrwa	x
      008F40 58               [ 2]  616 	sllw	x
      008F41 58               [ 2]  617 	sllw	x
      008F42 58               [ 2]  618 	sllw	x
      008F43 58               [ 2]  619 	sllw	x
      008F44 58               [ 2]  620 	sllw	x
      008F45 58               [ 2]  621 	sllw	x
      008F46 1F 09            [ 2]  622 	ldw	(0x09, sp), x
      008F48 97               [ 1]  623 	ld	xl, a
      008F49 7B 0A            [ 1]  624 	ld	a, (0x0a, sp)
      008F4B 6B 06            [ 1]  625 	ld	(0x06, sp), a
      008F4D 9F               [ 1]  626 	ld	a, xl
      008F4E 1A 09            [ 1]  627 	or	a, (0x09, sp)
      008F50 6B 01            [ 1]  628 	ld	(0x01, sp), a
      008F52 7B 06            [ 1]  629 	ld	a, (0x06, sp)
      008F54 6B 02            [ 1]  630 	ld	(0x02, sp), a
      008F56                        631 00103$:
                                    632 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 493: return ((uint16_t)temph);
      008F56 1E 01            [ 2]  633 	ldw	x, (0x01, sp)
                                    634 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 494: }
      008F58 5B 0B            [ 2]  635 	addw	sp, #11
      008F5A 81               [ 4]  636 	ret
                                    637 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 502: FlagStatus ADC1_GetAWDChannelStatus(ADC1_Channel_TypeDef Channel)
                                    638 ;	-----------------------------------------
                                    639 ;	 function ADC1_GetAWDChannelStatus
                                    640 ;	-----------------------------------------
      008F5B                        641 _ADC1_GetAWDChannelStatus:
      008F5B 52 02            [ 2]  642 	sub	sp, #2
                                    643 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 509: if (Channel < (uint8_t)8)
      008F5D 7B 05            [ 1]  644 	ld	a, (0x05, sp)
      008F5F A1 08            [ 1]  645 	cp	a, #0x08
      008F61 24 16            [ 1]  646 	jrnc	00102$
                                    647 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 511: status = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << Channel));
      008F63 C6 54 0D         [ 1]  648 	ld	a, 0x540d
      008F66 88               [ 1]  649 	push	a
      008F67 A6 01            [ 1]  650 	ld	a, #0x01
      008F69 6B 03            [ 1]  651 	ld	(0x03, sp), a
      008F6B 7B 06            [ 1]  652 	ld	a, (0x06, sp)
      008F6D 27 05            [ 1]  653 	jreq	00113$
      008F6F                        654 00112$:
      008F6F 08 03            [ 1]  655 	sll	(0x03, sp)
      008F71 4A               [ 1]  656 	dec	a
      008F72 26 FB            [ 1]  657 	jrne	00112$
      008F74                        658 00113$:
      008F74 84               [ 1]  659 	pop	a
      008F75 14 02            [ 1]  660 	and	a, (0x02, sp)
      008F77 20 19            [ 2]  661 	jra	00103$
      008F79                        662 00102$:
                                    663 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 515: status = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8)));
      008F79 C6 54 0C         [ 1]  664 	ld	a, 0x540c
      008F7C 97               [ 1]  665 	ld	xl, a
      008F7D 7B 05            [ 1]  666 	ld	a, (0x05, sp)
      008F7F A0 08            [ 1]  667 	sub	a, #0x08
      008F81 88               [ 1]  668 	push	a
      008F82 A6 01            [ 1]  669 	ld	a, #0x01
      008F84 6B 02            [ 1]  670 	ld	(0x02, sp), a
      008F86 84               [ 1]  671 	pop	a
      008F87 4D               [ 1]  672 	tnz	a
      008F88 27 05            [ 1]  673 	jreq	00115$
      008F8A                        674 00114$:
      008F8A 08 01            [ 1]  675 	sll	(0x01, sp)
      008F8C 4A               [ 1]  676 	dec	a
      008F8D 26 FB            [ 1]  677 	jrne	00114$
      008F8F                        678 00115$:
      008F8F 9F               [ 1]  679 	ld	a, xl
      008F90 14 01            [ 1]  680 	and	a, (0x01, sp)
      008F92                        681 00103$:
                                    682 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 518: return ((FlagStatus)status);
                                    683 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 519: }
      008F92 5B 02            [ 2]  684 	addw	sp, #2
      008F94 81               [ 4]  685 	ret
                                    686 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 527: FlagStatus ADC1_GetFlagStatus(ADC1_Flag_TypeDef Flag)
                                    687 ;	-----------------------------------------
                                    688 ;	 function ADC1_GetFlagStatus
                                    689 ;	-----------------------------------------
      008F95                        690 _ADC1_GetFlagStatus:
      008F95 52 04            [ 2]  691 	sub	sp, #4
                                    692 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 535: if ((Flag & 0x0F) == 0x01)
      008F97 7B 07            [ 1]  693 	ld	a, (0x07, sp)
      008F99 6B 03            [ 1]  694 	ld	(0x03, sp), a
      008F9B 0F 02            [ 1]  695 	clr	(0x02, sp)
      008F9D 7B 03            [ 1]  696 	ld	a, (0x03, sp)
      008F9F A4 0F            [ 1]  697 	and	a, #0x0f
      008FA1 97               [ 1]  698 	ld	xl, a
      008FA2 4F               [ 1]  699 	clr	a
      008FA3 95               [ 1]  700 	ld	xh, a
      008FA4 5A               [ 2]  701 	decw	x
      008FA5 26 07            [ 1]  702 	jrne	00108$
                                    703 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 538: flagstatus = (uint8_t)(ADC1->CR3 & ADC1_CR3_OVR);
      008FA7 C6 54 03         [ 1]  704 	ld	a, 0x5403
      008FAA A4 40            [ 1]  705 	and	a, #0x40
      008FAC 20 49            [ 2]  706 	jra	00109$
      008FAE                        707 00108$:
                                    708 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 540: else if ((Flag & 0xF0) == 0x10)
      008FAE 7B 03            [ 1]  709 	ld	a, (0x03, sp)
      008FB0 A4 F0            [ 1]  710 	and	a, #0xf0
      008FB2 97               [ 1]  711 	ld	xl, a
      008FB3 4F               [ 1]  712 	clr	a
      008FB4 95               [ 1]  713 	ld	xh, a
      008FB5 A3 00 10         [ 2]  714 	cpw	x, #0x0010
      008FB8 26 38            [ 1]  715 	jrne	00105$
                                    716 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 543: temp = (uint8_t)(Flag & (uint8_t)0x0F);
      008FBA 7B 07            [ 1]  717 	ld	a, (0x07, sp)
      008FBC A4 0F            [ 1]  718 	and	a, #0x0f
                                    719 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 544: if (temp < 8)
      008FBE 97               [ 1]  720 	ld	xl, a
      008FBF A1 08            [ 1]  721 	cp	a, #0x08
      008FC1 24 16            [ 1]  722 	jrnc	00102$
                                    723 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 546: flagstatus = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
      008FC3 C6 54 0D         [ 1]  724 	ld	a, 0x540d
      008FC6 6B 04            [ 1]  725 	ld	(0x04, sp), a
      008FC8 A6 01            [ 1]  726 	ld	a, #0x01
      008FCA 88               [ 1]  727 	push	a
      008FCB 9F               [ 1]  728 	ld	a, xl
      008FCC 4D               [ 1]  729 	tnz	a
      008FCD 27 05            [ 1]  730 	jreq	00135$
      008FCF                        731 00134$:
      008FCF 08 01            [ 1]  732 	sll	(1, sp)
      008FD1 4A               [ 1]  733 	dec	a
      008FD2 26 FB            [ 1]  734 	jrne	00134$
      008FD4                        735 00135$:
      008FD4 84               [ 1]  736 	pop	a
      008FD5 14 04            [ 1]  737 	and	a, (0x04, sp)
      008FD7 20 1E            [ 2]  738 	jra	00109$
      008FD9                        739 00102$:
                                    740 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 550: flagstatus = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
      008FD9 C6 54 0C         [ 1]  741 	ld	a, 0x540c
      008FDC 6B 01            [ 1]  742 	ld	(0x01, sp), a
      008FDE 1D 00 08         [ 2]  743 	subw	x, #8
      008FE1 A6 01            [ 1]  744 	ld	a, #0x01
      008FE3 88               [ 1]  745 	push	a
      008FE4 9F               [ 1]  746 	ld	a, xl
      008FE5 4D               [ 1]  747 	tnz	a
      008FE6 27 05            [ 1]  748 	jreq	00137$
      008FE8                        749 00136$:
      008FE8 08 01            [ 1]  750 	sll	(1, sp)
      008FEA 4A               [ 1]  751 	dec	a
      008FEB 26 FB            [ 1]  752 	jrne	00136$
      008FED                        753 00137$:
      008FED 84               [ 1]  754 	pop	a
      008FEE 14 01            [ 1]  755 	and	a, (0x01, sp)
      008FF0 20 05            [ 2]  756 	jra	00109$
      008FF2                        757 00105$:
                                    758 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 555: flagstatus = (uint8_t)(ADC1->CSR & Flag);
      008FF2 C6 54 00         [ 1]  759 	ld	a, 0x5400
      008FF5 14 07            [ 1]  760 	and	a, (0x07, sp)
      008FF7                        761 00109$:
                                    762 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 557: return ((FlagStatus)flagstatus);
                                    763 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 559: }
      008FF7 5B 04            [ 2]  764 	addw	sp, #4
      008FF9 81               [ 4]  765 	ret
                                    766 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 567: void ADC1_ClearFlag(ADC1_Flag_TypeDef Flag)
                                    767 ;	-----------------------------------------
                                    768 ;	 function ADC1_ClearFlag
                                    769 ;	-----------------------------------------
      008FFA                        770 _ADC1_ClearFlag:
      008FFA 52 05            [ 2]  771 	sub	sp, #5
                                    772 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 574: if ((Flag & 0x0F) == 0x01)
      008FFC 7B 08            [ 1]  773 	ld	a, (0x08, sp)
      008FFE 0F 01            [ 1]  774 	clr	(0x01, sp)
      009000 88               [ 1]  775 	push	a
      009001 A4 0F            [ 1]  776 	and	a, #0x0f
      009003 97               [ 1]  777 	ld	xl, a
      009004 4F               [ 1]  778 	clr	a
      009005 95               [ 1]  779 	ld	xh, a
      009006 84               [ 1]  780 	pop	a
      009007 5A               [ 2]  781 	decw	x
      009008 26 06            [ 1]  782 	jrne	00108$
                                    783 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 577: ADC1->CR3 &= (uint8_t)(~ADC1_CR3_OVR);
      00900A 72 1D 54 03      [ 1]  784 	bres	21507, #6
      00900E 20 57            [ 2]  785 	jra	00110$
      009010                        786 00108$:
                                    787 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 579: else if ((Flag & 0xF0) == 0x10)
      009010 A4 F0            [ 1]  788 	and	a, #0xf0
      009012 97               [ 1]  789 	ld	xl, a
      009013 4F               [ 1]  790 	clr	a
      009014 95               [ 1]  791 	ld	xh, a
      009015 A3 00 10         [ 2]  792 	cpw	x, #0x0010
      009018 26 40            [ 1]  793 	jrne	00105$
                                    794 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 582: temp = (uint8_t)(Flag & (uint8_t)0x0F);
      00901A 7B 08            [ 1]  795 	ld	a, (0x08, sp)
      00901C A4 0F            [ 1]  796 	and	a, #0x0f
                                    797 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 583: if (temp < 8)
      00901E 97               [ 1]  798 	ld	xl, a
      00901F A1 08            [ 1]  799 	cp	a, #0x08
      009021 24 1A            [ 1]  800 	jrnc	00102$
                                    801 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 585: ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
      009023 C6 54 0D         [ 1]  802 	ld	a, 0x540d
      009026 6B 05            [ 1]  803 	ld	(0x05, sp), a
      009028 A6 01            [ 1]  804 	ld	a, #0x01
      00902A 88               [ 1]  805 	push	a
      00902B 9F               [ 1]  806 	ld	a, xl
      00902C 4D               [ 1]  807 	tnz	a
      00902D 27 05            [ 1]  808 	jreq	00135$
      00902F                        809 00134$:
      00902F 08 01            [ 1]  810 	sll	(1, sp)
      009031 4A               [ 1]  811 	dec	a
      009032 26 FB            [ 1]  812 	jrne	00134$
      009034                        813 00135$:
      009034 84               [ 1]  814 	pop	a
      009035 43               [ 1]  815 	cpl	a
      009036 14 05            [ 1]  816 	and	a, (0x05, sp)
      009038 C7 54 0D         [ 1]  817 	ld	0x540d, a
      00903B 20 2A            [ 2]  818 	jra	00110$
      00903D                        819 00102$:
                                    820 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 589: ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
      00903D C6 54 0C         [ 1]  821 	ld	a, 0x540c
      009040 6B 04            [ 1]  822 	ld	(0x04, sp), a
      009042 1D 00 08         [ 2]  823 	subw	x, #8
      009045 A6 01            [ 1]  824 	ld	a, #0x01
      009047 88               [ 1]  825 	push	a
      009048 9F               [ 1]  826 	ld	a, xl
      009049 4D               [ 1]  827 	tnz	a
      00904A 27 05            [ 1]  828 	jreq	00137$
      00904C                        829 00136$:
      00904C 08 01            [ 1]  830 	sll	(1, sp)
      00904E 4A               [ 1]  831 	dec	a
      00904F 26 FB            [ 1]  832 	jrne	00136$
      009051                        833 00137$:
      009051 84               [ 1]  834 	pop	a
      009052 43               [ 1]  835 	cpl	a
      009053 14 04            [ 1]  836 	and	a, (0x04, sp)
      009055 C7 54 0C         [ 1]  837 	ld	0x540c, a
      009058 20 0D            [ 2]  838 	jra	00110$
      00905A                        839 00105$:
                                    840 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 594: ADC1->CSR &= (uint8_t) (~Flag);
      00905A C6 54 00         [ 1]  841 	ld	a, 0x5400
      00905D 6B 03            [ 1]  842 	ld	(0x03, sp), a
      00905F 7B 08            [ 1]  843 	ld	a, (0x08, sp)
      009061 43               [ 1]  844 	cpl	a
      009062 14 03            [ 1]  845 	and	a, (0x03, sp)
      009064 C7 54 00         [ 1]  846 	ld	0x5400, a
      009067                        847 00110$:
                                    848 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 596: }
      009067 5B 05            [ 2]  849 	addw	sp, #5
      009069 81               [ 4]  850 	ret
                                    851 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 616: ITStatus ADC1_GetITStatus(ADC1_IT_TypeDef ITPendingBit)
                                    852 ;	-----------------------------------------
                                    853 ;	 function ADC1_GetITStatus
                                    854 ;	-----------------------------------------
      00906A                        855 _ADC1_GetITStatus:
      00906A 52 03            [ 2]  856 	sub	sp, #3
                                    857 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 624: if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
      00906C 7B 07            [ 1]  858 	ld	a, (0x07, sp)
      00906E A4 F0            [ 1]  859 	and	a, #0xf0
      009070 97               [ 1]  860 	ld	xl, a
      009071 4F               [ 1]  861 	clr	a
      009072 95               [ 1]  862 	ld	xh, a
                                    863 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 627: temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
      009073 7B 07            [ 1]  864 	ld	a, (0x07, sp)
                                    865 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 624: if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
      009075 A3 00 10         [ 2]  866 	cpw	x, #0x0010
      009078 26 36            [ 1]  867 	jrne	00105$
                                    868 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 627: temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
      00907A A4 0F            [ 1]  869 	and	a, #0x0f
                                    870 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 628: if (temp < 8)
      00907C 97               [ 1]  871 	ld	xl, a
      00907D A1 08            [ 1]  872 	cp	a, #0x08
      00907F 24 16            [ 1]  873 	jrnc	00102$
                                    874 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 630: itstatus = (ITStatus)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
      009081 C6 54 0D         [ 1]  875 	ld	a, 0x540d
      009084 88               [ 1]  876 	push	a
      009085 A6 01            [ 1]  877 	ld	a, #0x01
      009087 6B 04            [ 1]  878 	ld	(0x04, sp), a
      009089 9F               [ 1]  879 	ld	a, xl
      00908A 4D               [ 1]  880 	tnz	a
      00908B 27 05            [ 1]  881 	jreq	00124$
      00908D                        882 00123$:
      00908D 08 04            [ 1]  883 	sll	(0x04, sp)
      00908F 4A               [ 1]  884 	dec	a
      009090 26 FB            [ 1]  885 	jrne	00123$
      009092                        886 00124$:
      009092 84               [ 1]  887 	pop	a
      009093 14 03            [ 1]  888 	and	a, (0x03, sp)
      009095 20 23            [ 2]  889 	jra	00106$
      009097                        890 00102$:
                                    891 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 634: itstatus = (ITStatus)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
      009097 C6 54 0C         [ 1]  892 	ld	a, 0x540c
      00909A 6B 02            [ 1]  893 	ld	(0x02, sp), a
      00909C 1D 00 08         [ 2]  894 	subw	x, #8
      00909F A6 01            [ 1]  895 	ld	a, #0x01
      0090A1 88               [ 1]  896 	push	a
      0090A2 9F               [ 1]  897 	ld	a, xl
      0090A3 4D               [ 1]  898 	tnz	a
      0090A4 27 05            [ 1]  899 	jreq	00126$
      0090A6                        900 00125$:
      0090A6 08 01            [ 1]  901 	sll	(1, sp)
      0090A8 4A               [ 1]  902 	dec	a
      0090A9 26 FB            [ 1]  903 	jrne	00125$
      0090AB                        904 00126$:
      0090AB 84               [ 1]  905 	pop	a
      0090AC 14 02            [ 1]  906 	and	a, (0x02, sp)
      0090AE 20 0A            [ 2]  907 	jra	00106$
      0090B0                        908 00105$:
                                    909 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 639: itstatus = (ITStatus)(ADC1->CSR & (uint8_t)ITPendingBit);
      0090B0 AE 54 00         [ 2]  910 	ldw	x, #0x5400
      0090B3 88               [ 1]  911 	push	a
      0090B4 F6               [ 1]  912 	ld	a, (x)
      0090B5 6B 02            [ 1]  913 	ld	(0x02, sp), a
      0090B7 84               [ 1]  914 	pop	a
      0090B8 14 01            [ 1]  915 	and	a, (0x01, sp)
      0090BA                        916 00106$:
                                    917 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 641: return ((ITStatus)itstatus);
                                    918 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 642: }
      0090BA 5B 03            [ 2]  919 	addw	sp, #3
      0090BC 81               [ 4]  920 	ret
                                    921 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 662: void ADC1_ClearITPendingBit(ADC1_IT_TypeDef ITPendingBit)
                                    922 ;	-----------------------------------------
                                    923 ;	 function ADC1_ClearITPendingBit
                                    924 ;	-----------------------------------------
      0090BD                        925 _ADC1_ClearITPendingBit:
      0090BD 52 02            [ 2]  926 	sub	sp, #2
                                    927 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 669: if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
      0090BF 7B 06            [ 1]  928 	ld	a, (0x06, sp)
      0090C1 A4 F0            [ 1]  929 	and	a, #0xf0
      0090C3 97               [ 1]  930 	ld	xl, a
      0090C4 4F               [ 1]  931 	clr	a
      0090C5 95               [ 1]  932 	ld	xh, a
      0090C6 A3 00 10         [ 2]  933 	cpw	x, #0x0010
      0090C9 26 40            [ 1]  934 	jrne	00105$
                                    935 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 672: temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
      0090CB 7B 06            [ 1]  936 	ld	a, (0x06, sp)
      0090CD A4 0F            [ 1]  937 	and	a, #0x0f
                                    938 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 673: if (temp < 8)
      0090CF 97               [ 1]  939 	ld	xl, a
      0090D0 A1 08            [ 1]  940 	cp	a, #0x08
      0090D2 24 1A            [ 1]  941 	jrnc	00102$
                                    942 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 675: ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
      0090D4 C6 54 0D         [ 1]  943 	ld	a, 0x540d
      0090D7 6B 02            [ 1]  944 	ld	(0x02, sp), a
      0090D9 A6 01            [ 1]  945 	ld	a, #0x01
      0090DB 88               [ 1]  946 	push	a
      0090DC 9F               [ 1]  947 	ld	a, xl
      0090DD 4D               [ 1]  948 	tnz	a
      0090DE 27 05            [ 1]  949 	jreq	00124$
      0090E0                        950 00123$:
      0090E0 08 01            [ 1]  951 	sll	(1, sp)
      0090E2 4A               [ 1]  952 	dec	a
      0090E3 26 FB            [ 1]  953 	jrne	00123$
      0090E5                        954 00124$:
      0090E5 84               [ 1]  955 	pop	a
      0090E6 43               [ 1]  956 	cpl	a
      0090E7 14 02            [ 1]  957 	and	a, (0x02, sp)
      0090E9 C7 54 0D         [ 1]  958 	ld	0x540d, a
      0090EC 20 2A            [ 2]  959 	jra	00107$
      0090EE                        960 00102$:
                                    961 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 679: ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
      0090EE C6 54 0C         [ 1]  962 	ld	a, 0x540c
      0090F1 6B 01            [ 1]  963 	ld	(0x01, sp), a
      0090F3 1D 00 08         [ 2]  964 	subw	x, #8
      0090F6 A6 01            [ 1]  965 	ld	a, #0x01
      0090F8 88               [ 1]  966 	push	a
      0090F9 9F               [ 1]  967 	ld	a, xl
      0090FA 4D               [ 1]  968 	tnz	a
      0090FB 27 05            [ 1]  969 	jreq	00126$
      0090FD                        970 00125$:
      0090FD 08 01            [ 1]  971 	sll	(1, sp)
      0090FF 4A               [ 1]  972 	dec	a
      009100 26 FB            [ 1]  973 	jrne	00125$
      009102                        974 00126$:
      009102 84               [ 1]  975 	pop	a
      009103 43               [ 1]  976 	cpl	a
      009104 14 01            [ 1]  977 	and	a, (0x01, sp)
      009106 C7 54 0C         [ 1]  978 	ld	0x540c, a
      009109 20 0D            [ 2]  979 	jra	00107$
      00910B                        980 00105$:
                                    981 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 684: ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ITPendingBit);
      00910B C6 54 00         [ 1]  982 	ld	a, 0x5400
      00910E 1E 05            [ 2]  983 	ldw	x, (0x05, sp)
      009110 53               [ 2]  984 	cplw	x
      009111 89               [ 2]  985 	pushw	x
      009112 14 02            [ 1]  986 	and	a, (2, sp)
      009114 85               [ 2]  987 	popw	x
      009115 C7 54 00         [ 1]  988 	ld	0x5400, a
      009118                        989 00107$:
                                    990 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 686: }
      009118 5B 02            [ 2]  991 	addw	sp, #2
      00911A 81               [ 4]  992 	ret
                                    993 	.area CODE
                                    994 	.area CONST
                                    995 	.area INITIALIZER
                                    996 	.area CABS (ABS)
