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
      009B01                         73 _ADC1_DeInit:
                                     74 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 54: ADC1->CSR  = ADC1_CSR_RESET_VALUE;
      009B01 35 00 54 00      [ 1]   75 	mov	0x5400+0, #0x00
                                     76 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 55: ADC1->CR1  = ADC1_CR1_RESET_VALUE;
      009B05 35 00 54 01      [ 1]   77 	mov	0x5401+0, #0x00
                                     78 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 56: ADC1->CR2  = ADC1_CR2_RESET_VALUE;
      009B09 35 00 54 02      [ 1]   79 	mov	0x5402+0, #0x00
                                     80 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 57: ADC1->CR3  = ADC1_CR3_RESET_VALUE;
      009B0D 35 00 54 03      [ 1]   81 	mov	0x5403+0, #0x00
                                     82 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 58: ADC1->TDRH = ADC1_TDRH_RESET_VALUE;
      009B11 35 00 54 06      [ 1]   83 	mov	0x5406+0, #0x00
                                     84 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 59: ADC1->TDRL = ADC1_TDRL_RESET_VALUE;
      009B15 35 00 54 07      [ 1]   85 	mov	0x5407+0, #0x00
                                     86 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 60: ADC1->HTRH = ADC1_HTRH_RESET_VALUE;
      009B19 35 FF 54 08      [ 1]   87 	mov	0x5408+0, #0xff
                                     88 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 61: ADC1->HTRL = ADC1_HTRL_RESET_VALUE;
      009B1D 35 03 54 09      [ 1]   89 	mov	0x5409+0, #0x03
                                     90 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 62: ADC1->LTRH = ADC1_LTRH_RESET_VALUE;
      009B21 35 00 54 0A      [ 1]   91 	mov	0x540a+0, #0x00
                                     92 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 63: ADC1->LTRL = ADC1_LTRL_RESET_VALUE;
      009B25 35 00 54 0B      [ 1]   93 	mov	0x540b+0, #0x00
                                     94 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 64: ADC1->AWCRH = ADC1_AWCRH_RESET_VALUE;
      009B29 35 00 54 0E      [ 1]   95 	mov	0x540e+0, #0x00
                                     96 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 65: ADC1->AWCRL = ADC1_AWCRL_RESET_VALUE;
      009B2D 35 00 54 0F      [ 1]   97 	mov	0x540f+0, #0x00
                                     98 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 66: }
      009B31 81               [ 4]   99 	ret
                                    100 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 88: void ADC1_Init(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_PresSel_TypeDef ADC1_PrescalerSelection, ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState ADC1_ExtTriggerState, ADC1_Align_TypeDef ADC1_Align, ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState ADC1_SchmittTriggerState)
                                    101 ;	-----------------------------------------
                                    102 ;	 function ADC1_Init
                                    103 ;	-----------------------------------------
      009B32                        104 _ADC1_Init:
                                    105 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 103: ADC1_ConversionConfig(ADC1_ConversionMode, ADC1_Channel, ADC1_Align);
      009B32 7B 08            [ 1]  106 	ld	a, (0x08, sp)
      009B34 88               [ 1]  107 	push	a
      009B35 7B 05            [ 1]  108 	ld	a, (0x05, sp)
      009B37 88               [ 1]  109 	push	a
      009B38 7B 05            [ 1]  110 	ld	a, (0x05, sp)
      009B3A 88               [ 1]  111 	push	a
      009B3B CD 9C 48         [ 4]  112 	call	_ADC1_ConversionConfig
      009B3E 5B 03            [ 2]  113 	addw	sp, #3
                                    114 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 105: ADC1_PrescalerConfig(ADC1_PrescalerSelection);
      009B40 7B 05            [ 1]  115 	ld	a, (0x05, sp)
      009B42 88               [ 1]  116 	push	a
      009B43 CD 9B B9         [ 4]  117 	call	_ADC1_PrescalerConfig
      009B46 84               [ 1]  118 	pop	a
                                    119 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 110: ADC1_ExternalTriggerConfig(ADC1_ExtTrigger, ADC1_ExtTriggerState);
      009B47 7B 07            [ 1]  120 	ld	a, (0x07, sp)
      009B49 88               [ 1]  121 	push	a
      009B4A 7B 07            [ 1]  122 	ld	a, (0x07, sp)
      009B4C 88               [ 1]  123 	push	a
      009B4D CD 9C 7B         [ 4]  124 	call	_ADC1_ExternalTriggerConfig
      009B50 5B 02            [ 2]  125 	addw	sp, #2
                                    126 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 115: ADC1_SchmittTriggerConfig(ADC1_SchmittTriggerChannel, ADC1_SchmittTriggerState);
      009B52 7B 0A            [ 1]  127 	ld	a, (0x0a, sp)
      009B54 88               [ 1]  128 	push	a
      009B55 7B 0A            [ 1]  129 	ld	a, (0x0a, sp)
      009B57 88               [ 1]  130 	push	a
      009B58 CD 9B CA         [ 4]  131 	call	_ADC1_SchmittTriggerConfig
      009B5B 5B 02            [ 2]  132 	addw	sp, #2
                                    133 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 118: ADC1->CR1 |= ADC1_CR1_ADON;
      009B5D 72 10 54 01      [ 1]  134 	bset	21505, #0
                                    135 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 119: }
      009B61 81               [ 4]  136 	ret
                                    137 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 126: void ADC1_Cmd(FunctionalState NewState)
                                    138 ;	-----------------------------------------
                                    139 ;	 function ADC1_Cmd
                                    140 ;	-----------------------------------------
      009B62                        141 _ADC1_Cmd:
                                    142 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 133: ADC1->CR1 |= ADC1_CR1_ADON;
      009B62 C6 54 01         [ 1]  143 	ld	a, 0x5401
                                    144 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 131: if (NewState != DISABLE)
      009B65 0D 03            [ 1]  145 	tnz	(0x03, sp)
      009B67 27 06            [ 1]  146 	jreq	00102$
                                    147 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 133: ADC1->CR1 |= ADC1_CR1_ADON;
      009B69 AA 01            [ 1]  148 	or	a, #0x01
      009B6B C7 54 01         [ 1]  149 	ld	0x5401, a
      009B6E 81               [ 4]  150 	ret
      009B6F                        151 00102$:
                                    152 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 137: ADC1->CR1 &= (uint8_t)(~ADC1_CR1_ADON);
      009B6F A4 FE            [ 1]  153 	and	a, #0xfe
      009B71 C7 54 01         [ 1]  154 	ld	0x5401, a
                                    155 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 139: }
      009B74 81               [ 4]  156 	ret
                                    157 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 146: void ADC1_ScanModeCmd(FunctionalState NewState)
                                    158 ;	-----------------------------------------
                                    159 ;	 function ADC1_ScanModeCmd
                                    160 ;	-----------------------------------------
      009B75                        161 _ADC1_ScanModeCmd:
                                    162 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 153: ADC1->CR2 |= ADC1_CR2_SCAN;
      009B75 C6 54 02         [ 1]  163 	ld	a, 0x5402
                                    164 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 151: if (NewState != DISABLE)
      009B78 0D 03            [ 1]  165 	tnz	(0x03, sp)
      009B7A 27 06            [ 1]  166 	jreq	00102$
                                    167 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 153: ADC1->CR2 |= ADC1_CR2_SCAN;
      009B7C AA 02            [ 1]  168 	or	a, #0x02
      009B7E C7 54 02         [ 1]  169 	ld	0x5402, a
      009B81 81               [ 4]  170 	ret
      009B82                        171 00102$:
                                    172 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 157: ADC1->CR2 &= (uint8_t)(~ADC1_CR2_SCAN);
      009B82 A4 FD            [ 1]  173 	and	a, #0xfd
      009B84 C7 54 02         [ 1]  174 	ld	0x5402, a
                                    175 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 159: }
      009B87 81               [ 4]  176 	ret
                                    177 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 166: void ADC1_DataBufferCmd(FunctionalState NewState)
                                    178 ;	-----------------------------------------
                                    179 ;	 function ADC1_DataBufferCmd
                                    180 ;	-----------------------------------------
      009B88                        181 _ADC1_DataBufferCmd:
                                    182 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 173: ADC1->CR3 |= ADC1_CR3_DBUF;
      009B88 C6 54 03         [ 1]  183 	ld	a, 0x5403
                                    184 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 171: if (NewState != DISABLE)
      009B8B 0D 03            [ 1]  185 	tnz	(0x03, sp)
      009B8D 27 06            [ 1]  186 	jreq	00102$
                                    187 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 173: ADC1->CR3 |= ADC1_CR3_DBUF;
      009B8F AA 80            [ 1]  188 	or	a, #0x80
      009B91 C7 54 03         [ 1]  189 	ld	0x5403, a
      009B94 81               [ 4]  190 	ret
      009B95                        191 00102$:
                                    192 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 177: ADC1->CR3 &= (uint8_t)(~ADC1_CR3_DBUF);
      009B95 A4 7F            [ 1]  193 	and	a, #0x7f
      009B97 C7 54 03         [ 1]  194 	ld	0x5403, a
                                    195 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 179: }
      009B9A 81               [ 4]  196 	ret
                                    197 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 190: void ADC1_ITConfig(ADC1_IT_TypeDef ADC1_IT, FunctionalState NewState)
                                    198 ;	-----------------------------------------
                                    199 ;	 function ADC1_ITConfig
                                    200 ;	-----------------------------------------
      009B9B                        201 _ADC1_ITConfig:
      009B9B 88               [ 1]  202 	push	a
                                    203 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 199: ADC1->CSR |= (uint8_t)ADC1_IT;
      009B9C C6 54 00         [ 1]  204 	ld	a, 0x5400
      009B9F 6B 01            [ 1]  205 	ld	(0x01, sp), a
                                    206 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 196: if (NewState != DISABLE)
      009BA1 0D 06            [ 1]  207 	tnz	(0x06, sp)
      009BA3 27 09            [ 1]  208 	jreq	00102$
                                    209 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 199: ADC1->CSR |= (uint8_t)ADC1_IT;
      009BA5 7B 05            [ 1]  210 	ld	a, (0x05, sp)
      009BA7 1A 01            [ 1]  211 	or	a, (0x01, sp)
      009BA9 C7 54 00         [ 1]  212 	ld	0x5400, a
      009BAC 20 09            [ 2]  213 	jra	00104$
      009BAE                        214 00102$:
                                    215 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 204: ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ADC1_IT);
      009BAE 1E 04            [ 2]  216 	ldw	x, (0x04, sp)
      009BB0 53               [ 2]  217 	cplw	x
      009BB1 9F               [ 1]  218 	ld	a, xl
      009BB2 14 01            [ 1]  219 	and	a, (0x01, sp)
      009BB4 C7 54 00         [ 1]  220 	ld	0x5400, a
      009BB7                        221 00104$:
                                    222 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 206: }
      009BB7 84               [ 1]  223 	pop	a
      009BB8 81               [ 4]  224 	ret
                                    225 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 214: void ADC1_PrescalerConfig(ADC1_PresSel_TypeDef ADC1_Prescaler)
                                    226 ;	-----------------------------------------
                                    227 ;	 function ADC1_PrescalerConfig
                                    228 ;	-----------------------------------------
      009BB9                        229 _ADC1_PrescalerConfig:
                                    230 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 220: ADC1->CR1 &= (uint8_t)(~ADC1_CR1_SPSEL);
      009BB9 C6 54 01         [ 1]  231 	ld	a, 0x5401
      009BBC A4 8F            [ 1]  232 	and	a, #0x8f
      009BBE C7 54 01         [ 1]  233 	ld	0x5401, a
                                    234 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 222: ADC1->CR1 |= (uint8_t)(ADC1_Prescaler);
      009BC1 C6 54 01         [ 1]  235 	ld	a, 0x5401
      009BC4 1A 03            [ 1]  236 	or	a, (0x03, sp)
      009BC6 C7 54 01         [ 1]  237 	ld	0x5401, a
                                    238 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 223: }
      009BC9 81               [ 4]  239 	ret
                                    240 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 233: void ADC1_SchmittTriggerConfig(ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState NewState)
                                    241 ;	-----------------------------------------
                                    242 ;	 function ADC1_SchmittTriggerConfig
                                    243 ;	-----------------------------------------
      009BCA                        244 _ADC1_SchmittTriggerConfig:
      009BCA 52 02            [ 2]  245 	sub	sp, #2
                                    246 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 239: if (ADC1_SchmittTriggerChannel == ADC1_SCHMITTTRIG_ALL)
      009BCC 7B 05            [ 1]  247 	ld	a, (0x05, sp)
      009BCE 4C               [ 1]  248 	inc	a
      009BCF 26 21            [ 1]  249 	jrne	00114$
                                    250 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 243: ADC1->TDRL &= (uint8_t)0x0;
      009BD1 C6 54 07         [ 1]  251 	ld	a, 0x5407
                                    252 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 241: if (NewState != DISABLE)
      009BD4 0D 06            [ 1]  253 	tnz	(0x06, sp)
      009BD6 27 0D            [ 1]  254 	jreq	00102$
                                    255 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 243: ADC1->TDRL &= (uint8_t)0x0;
      009BD8 35 00 54 07      [ 1]  256 	mov	0x5407+0, #0x00
                                    257 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 244: ADC1->TDRH &= (uint8_t)0x0;
      009BDC C6 54 06         [ 1]  258 	ld	a, 0x5406
      009BDF 35 00 54 06      [ 1]  259 	mov	0x5406+0, #0x00
      009BE3 20 60            [ 2]  260 	jra	00116$
      009BE5                        261 00102$:
                                    262 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 248: ADC1->TDRL |= (uint8_t)0xFF;
      009BE5 35 FF 54 07      [ 1]  263 	mov	0x5407+0, #0xff
                                    264 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 249: ADC1->TDRH |= (uint8_t)0xFF;
      009BE9 C6 54 06         [ 1]  265 	ld	a, 0x5406
      009BEC 35 FF 54 06      [ 1]  266 	mov	0x5406+0, #0xff
      009BF0 20 53            [ 2]  267 	jra	00116$
      009BF2                        268 00114$:
                                    269 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 252: else if (ADC1_SchmittTriggerChannel < ADC1_SCHMITTTRIG_CHANNEL8)
      009BF2 7B 05            [ 1]  270 	ld	a, (0x05, sp)
      009BF4 A1 08            [ 1]  271 	cp	a, #0x08
      009BF6 24 25            [ 1]  272 	jrnc	00111$
                                    273 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 243: ADC1->TDRL &= (uint8_t)0x0;
      009BF8 C6 54 07         [ 1]  274 	ld	a, 0x5407
      009BFB 6B 01            [ 1]  275 	ld	(0x01, sp), a
                                    276 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 256: ADC1->TDRL &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel));
      009BFD A6 01            [ 1]  277 	ld	a, #0x01
      009BFF 88               [ 1]  278 	push	a
      009C00 7B 06            [ 1]  279 	ld	a, (0x06, sp)
      009C02 27 05            [ 1]  280 	jreq	00149$
      009C04                        281 00148$:
      009C04 08 01            [ 1]  282 	sll	(1, sp)
      009C06 4A               [ 1]  283 	dec	a
      009C07 26 FB            [ 1]  284 	jrne	00148$
      009C09                        285 00149$:
      009C09 84               [ 1]  286 	pop	a
                                    287 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 254: if (NewState != DISABLE)
      009C0A 0D 06            [ 1]  288 	tnz	(0x06, sp)
      009C0C 27 08            [ 1]  289 	jreq	00105$
                                    290 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 256: ADC1->TDRL &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel));
      009C0E 43               [ 1]  291 	cpl	a
      009C0F 14 01            [ 1]  292 	and	a, (0x01, sp)
      009C11 C7 54 07         [ 1]  293 	ld	0x5407, a
      009C14 20 2F            [ 2]  294 	jra	00116$
      009C16                        295 00105$:
                                    296 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 260: ADC1->TDRL |= (uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel);
      009C16 1A 01            [ 1]  297 	or	a, (0x01, sp)
      009C18 C7 54 07         [ 1]  298 	ld	0x5407, a
      009C1B 20 28            [ 2]  299 	jra	00116$
      009C1D                        300 00111$:
                                    301 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 244: ADC1->TDRH &= (uint8_t)0x0;
      009C1D C6 54 06         [ 1]  302 	ld	a, 0x5406
      009C20 6B 02            [ 1]  303 	ld	(0x02, sp), a
                                    304 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 267: ADC1->TDRH &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8)));
      009C22 7B 05            [ 1]  305 	ld	a, (0x05, sp)
      009C24 A0 08            [ 1]  306 	sub	a, #0x08
      009C26 97               [ 1]  307 	ld	xl, a
      009C27 A6 01            [ 1]  308 	ld	a, #0x01
      009C29 88               [ 1]  309 	push	a
      009C2A 9F               [ 1]  310 	ld	a, xl
      009C2B 4D               [ 1]  311 	tnz	a
      009C2C 27 05            [ 1]  312 	jreq	00152$
      009C2E                        313 00151$:
      009C2E 08 01            [ 1]  314 	sll	(1, sp)
      009C30 4A               [ 1]  315 	dec	a
      009C31 26 FB            [ 1]  316 	jrne	00151$
      009C33                        317 00152$:
      009C33 84               [ 1]  318 	pop	a
                                    319 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 265: if (NewState != DISABLE)
      009C34 0D 06            [ 1]  320 	tnz	(0x06, sp)
      009C36 27 08            [ 1]  321 	jreq	00108$
                                    322 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 267: ADC1->TDRH &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8)));
      009C38 43               [ 1]  323 	cpl	a
      009C39 14 02            [ 1]  324 	and	a, (0x02, sp)
      009C3B C7 54 06         [ 1]  325 	ld	0x5406, a
      009C3E 20 05            [ 2]  326 	jra	00116$
      009C40                        327 00108$:
                                    328 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 271: ADC1->TDRH |= (uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8));
      009C40 1A 02            [ 1]  329 	or	a, (0x02, sp)
      009C42 C7 54 06         [ 1]  330 	ld	0x5406, a
      009C45                        331 00116$:
                                    332 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 274: }
      009C45 5B 02            [ 2]  333 	addw	sp, #2
      009C47 81               [ 4]  334 	ret
                                    335 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 286: void ADC1_ConversionConfig(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_Align_TypeDef ADC1_Align)
                                    336 ;	-----------------------------------------
                                    337 ;	 function ADC1_ConversionConfig
                                    338 ;	-----------------------------------------
      009C48                        339 _ADC1_ConversionConfig:
                                    340 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 294: ADC1->CR2 &= (uint8_t)(~ADC1_CR2_ALIGN);
      009C48 72 17 54 02      [ 1]  341 	bres	21506, #3
                                    342 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 296: ADC1->CR2 |= (uint8_t)(ADC1_Align);
      009C4C C6 54 02         [ 1]  343 	ld	a, 0x5402
      009C4F 1A 05            [ 1]  344 	or	a, (0x05, sp)
      009C51 C7 54 02         [ 1]  345 	ld	0x5402, a
                                    346 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 301: ADC1->CR1 |= ADC1_CR1_CONT;
      009C54 C6 54 01         [ 1]  347 	ld	a, 0x5401
                                    348 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 298: if (ADC1_ConversionMode == ADC1_CONVERSIONMODE_CONTINUOUS)
      009C57 88               [ 1]  349 	push	a
      009C58 7B 04            [ 1]  350 	ld	a, (0x04, sp)
      009C5A 4A               [ 1]  351 	dec	a
      009C5B 84               [ 1]  352 	pop	a
      009C5C 26 07            [ 1]  353 	jrne	00102$
                                    354 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 301: ADC1->CR1 |= ADC1_CR1_CONT;
      009C5E AA 02            [ 1]  355 	or	a, #0x02
      009C60 C7 54 01         [ 1]  356 	ld	0x5401, a
      009C63 20 05            [ 2]  357 	jra	00103$
      009C65                        358 00102$:
                                    359 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 306: ADC1->CR1 &= (uint8_t)(~ADC1_CR1_CONT);
      009C65 A4 FD            [ 1]  360 	and	a, #0xfd
      009C67 C7 54 01         [ 1]  361 	ld	0x5401, a
      009C6A                        362 00103$:
                                    363 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 310: ADC1->CSR &= (uint8_t)(~ADC1_CSR_CH);
      009C6A C6 54 00         [ 1]  364 	ld	a, 0x5400
      009C6D A4 F0            [ 1]  365 	and	a, #0xf0
      009C6F C7 54 00         [ 1]  366 	ld	0x5400, a
                                    367 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 312: ADC1->CSR |= (uint8_t)(ADC1_Channel);
      009C72 C6 54 00         [ 1]  368 	ld	a, 0x5400
      009C75 1A 04            [ 1]  369 	or	a, (0x04, sp)
      009C77 C7 54 00         [ 1]  370 	ld	0x5400, a
                                    371 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 313: }
      009C7A 81               [ 4]  372 	ret
                                    373 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 325: void ADC1_ExternalTriggerConfig(ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState NewState)
                                    374 ;	-----------------------------------------
                                    375 ;	 function ADC1_ExternalTriggerConfig
                                    376 ;	-----------------------------------------
      009C7B                        377 _ADC1_ExternalTriggerConfig:
                                    378 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 332: ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTSEL);
      009C7B C6 54 02         [ 1]  379 	ld	a, 0x5402
      009C7E A4 CF            [ 1]  380 	and	a, #0xcf
      009C80 C7 54 02         [ 1]  381 	ld	0x5402, a
      009C83 C6 54 02         [ 1]  382 	ld	a, 0x5402
                                    383 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 334: if (NewState != DISABLE)
      009C86 0D 04            [ 1]  384 	tnz	(0x04, sp)
      009C88 27 07            [ 1]  385 	jreq	00102$
                                    386 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 337: ADC1->CR2 |= (uint8_t)(ADC1_CR2_EXTTRIG);
      009C8A AA 40            [ 1]  387 	or	a, #0x40
      009C8C C7 54 02         [ 1]  388 	ld	0x5402, a
      009C8F 20 05            [ 2]  389 	jra	00103$
      009C91                        390 00102$:
                                    391 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 342: ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTTRIG);
      009C91 A4 BF            [ 1]  392 	and	a, #0xbf
      009C93 C7 54 02         [ 1]  393 	ld	0x5402, a
      009C96                        394 00103$:
                                    395 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 346: ADC1->CR2 |= (uint8_t)(ADC1_ExtTrigger);
      009C96 C6 54 02         [ 1]  396 	ld	a, 0x5402
      009C99 1A 03            [ 1]  397 	or	a, (0x03, sp)
      009C9B C7 54 02         [ 1]  398 	ld	0x5402, a
                                    399 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 347: }
      009C9E 81               [ 4]  400 	ret
                                    401 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 358: void ADC1_StartConversion(void)
                                    402 ;	-----------------------------------------
                                    403 ;	 function ADC1_StartConversion
                                    404 ;	-----------------------------------------
      009C9F                        405 _ADC1_StartConversion:
                                    406 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 360: ADC1->CR1 |= ADC1_CR1_ADON;
      009C9F 72 10 54 01      [ 1]  407 	bset	21505, #0
                                    408 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 361: }
      009CA3 81               [ 4]  409 	ret
                                    410 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 370: uint16_t ADC1_GetConversionValue(void)
                                    411 ;	-----------------------------------------
                                    412 ;	 function ADC1_GetConversionValue
                                    413 ;	-----------------------------------------
      009CA4                        414 _ADC1_GetConversionValue:
      009CA4 52 08            [ 2]  415 	sub	sp, #8
                                    416 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 375: if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
      009CA6 C6 54 02         [ 1]  417 	ld	a, 0x5402
      009CA9 A5 08            [ 1]  418 	bcp	a, #0x08
      009CAB 27 15            [ 1]  419 	jreq	00102$
                                    420 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 378: templ = ADC1->DRL;
      009CAD C6 54 05         [ 1]  421 	ld	a, 0x5405
      009CB0 97               [ 1]  422 	ld	xl, a
                                    423 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 380: temph = ADC1->DRH;
      009CB1 C6 54 04         [ 1]  424 	ld	a, 0x5404
                                    425 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 382: temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
      009CB4 0F 04            [ 1]  426 	clr	(0x04, sp)
      009CB6 0F 01            [ 1]  427 	clr	(0x01, sp)
      009CB8 1A 01            [ 1]  428 	or	a, (0x01, sp)
      009CBA 01               [ 1]  429 	rrwa	x
      009CBB 1A 04            [ 1]  430 	or	a, (0x04, sp)
      009CBD 97               [ 1]  431 	ld	xl, a
      009CBE 1F 07            [ 2]  432 	ldw	(0x07, sp), x
      009CC0 20 1D            [ 2]  433 	jra	00103$
      009CC2                        434 00102$:
                                    435 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 387: temph = ADC1->DRH;
      009CC2 C6 54 04         [ 1]  436 	ld	a, 0x5404
      009CC5 5F               [ 1]  437 	clrw	x
      009CC6 97               [ 1]  438 	ld	xl, a
      009CC7 51               [ 1]  439 	exgw	x, y
                                    440 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 389: templ = ADC1->DRL;
      009CC8 C6 54 05         [ 1]  441 	ld	a, 0x5405
                                    442 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 391: temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)((uint16_t)temph << 8));
      009CCB 5F               [ 1]  443 	clrw	x
      009CCC 97               [ 1]  444 	ld	xl, a
      009CCD 58               [ 2]  445 	sllw	x
      009CCE 58               [ 2]  446 	sllw	x
      009CCF 58               [ 2]  447 	sllw	x
      009CD0 58               [ 2]  448 	sllw	x
      009CD1 58               [ 2]  449 	sllw	x
      009CD2 58               [ 2]  450 	sllw	x
      009CD3 1F 05            [ 2]  451 	ldw	(0x05, sp), x
      009CD5 7B 06            [ 1]  452 	ld	a, (0x06, sp)
      009CD7 97               [ 1]  453 	ld	xl, a
      009CD8 90 9F            [ 1]  454 	ld	a, yl
      009CDA 1A 05            [ 1]  455 	or	a, (0x05, sp)
      009CDC 95               [ 1]  456 	ld	xh, a
      009CDD 1F 07            [ 2]  457 	ldw	(0x07, sp), x
      009CDF                        458 00103$:
                                    459 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 394: return ((uint16_t)temph);
      009CDF 1E 07            [ 2]  460 	ldw	x, (0x07, sp)
                                    461 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 395: }
      009CE1 5B 08            [ 2]  462 	addw	sp, #8
      009CE3 81               [ 4]  463 	ret
                                    464 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 405: void ADC1_AWDChannelConfig(ADC1_Channel_TypeDef Channel, FunctionalState NewState)
                                    465 ;	-----------------------------------------
                                    466 ;	 function ADC1_AWDChannelConfig
                                    467 ;	-----------------------------------------
      009CE4                        468 _ADC1_AWDChannelConfig:
      009CE4 52 02            [ 2]  469 	sub	sp, #2
                                    470 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 411: if (Channel < (uint8_t)8)
      009CE6 7B 05            [ 1]  471 	ld	a, (0x05, sp)
      009CE8 A1 08            [ 1]  472 	cp	a, #0x08
      009CEA 24 25            [ 1]  473 	jrnc	00108$
                                    474 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 415: ADC1->AWCRL |= (uint8_t)((uint8_t)1 << Channel);
      009CEC C6 54 0F         [ 1]  475 	ld	a, 0x540f
      009CEF 6B 01            [ 1]  476 	ld	(0x01, sp), a
      009CF1 A6 01            [ 1]  477 	ld	a, #0x01
      009CF3 88               [ 1]  478 	push	a
      009CF4 7B 06            [ 1]  479 	ld	a, (0x06, sp)
      009CF6 27 05            [ 1]  480 	jreq	00129$
      009CF8                        481 00128$:
      009CF8 08 01            [ 1]  482 	sll	(1, sp)
      009CFA 4A               [ 1]  483 	dec	a
      009CFB 26 FB            [ 1]  484 	jrne	00128$
      009CFD                        485 00129$:
      009CFD 84               [ 1]  486 	pop	a
                                    487 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 413: if (NewState != DISABLE)
      009CFE 0D 06            [ 1]  488 	tnz	(0x06, sp)
      009D00 27 07            [ 1]  489 	jreq	00102$
                                    490 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 415: ADC1->AWCRL |= (uint8_t)((uint8_t)1 << Channel);
      009D02 1A 01            [ 1]  491 	or	a, (0x01, sp)
      009D04 C7 54 0F         [ 1]  492 	ld	0x540f, a
      009D07 20 30            [ 2]  493 	jra	00110$
      009D09                        494 00102$:
                                    495 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 419: ADC1->AWCRL &= (uint8_t)~(uint8_t)((uint8_t)1 << Channel);
      009D09 43               [ 1]  496 	cpl	a
      009D0A 14 01            [ 1]  497 	and	a, (0x01, sp)
      009D0C C7 54 0F         [ 1]  498 	ld	0x540f, a
      009D0F 20 28            [ 2]  499 	jra	00110$
      009D11                        500 00108$:
                                    501 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 426: ADC1->AWCRH |= (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8));
      009D11 C6 54 0E         [ 1]  502 	ld	a, 0x540e
      009D14 6B 02            [ 1]  503 	ld	(0x02, sp), a
      009D16 7B 05            [ 1]  504 	ld	a, (0x05, sp)
      009D18 A0 08            [ 1]  505 	sub	a, #0x08
      009D1A 97               [ 1]  506 	ld	xl, a
      009D1B A6 01            [ 1]  507 	ld	a, #0x01
      009D1D 88               [ 1]  508 	push	a
      009D1E 9F               [ 1]  509 	ld	a, xl
      009D1F 4D               [ 1]  510 	tnz	a
      009D20 27 05            [ 1]  511 	jreq	00132$
      009D22                        512 00131$:
      009D22 08 01            [ 1]  513 	sll	(1, sp)
      009D24 4A               [ 1]  514 	dec	a
      009D25 26 FB            [ 1]  515 	jrne	00131$
      009D27                        516 00132$:
      009D27 84               [ 1]  517 	pop	a
                                    518 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 424: if (NewState != DISABLE)
      009D28 0D 06            [ 1]  519 	tnz	(0x06, sp)
      009D2A 27 07            [ 1]  520 	jreq	00105$
                                    521 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 426: ADC1->AWCRH |= (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8));
      009D2C 1A 02            [ 1]  522 	or	a, (0x02, sp)
      009D2E C7 54 0E         [ 1]  523 	ld	0x540e, a
      009D31 20 06            [ 2]  524 	jra	00110$
      009D33                        525 00105$:
                                    526 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 430: ADC1->AWCRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (uint8_t)(Channel - (uint8_t)8));
      009D33 43               [ 1]  527 	cpl	a
      009D34 14 02            [ 1]  528 	and	a, (0x02, sp)
      009D36 C7 54 0E         [ 1]  529 	ld	0x540e, a
      009D39                        530 00110$:
                                    531 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 433: }
      009D39 5B 02            [ 2]  532 	addw	sp, #2
      009D3B 81               [ 4]  533 	ret
                                    534 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 441: void ADC1_SetHighThreshold(uint16_t Threshold)
                                    535 ;	-----------------------------------------
                                    536 ;	 function ADC1_SetHighThreshold
                                    537 ;	-----------------------------------------
      009D3C                        538 _ADC1_SetHighThreshold:
                                    539 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 443: ADC1->HTRH = (uint8_t)(Threshold >> (uint8_t)2);
      009D3C 1E 03            [ 2]  540 	ldw	x, (0x03, sp)
      009D3E 54               [ 2]  541 	srlw	x
      009D3F 54               [ 2]  542 	srlw	x
      009D40 9F               [ 1]  543 	ld	a, xl
      009D41 C7 54 08         [ 1]  544 	ld	0x5408, a
                                    545 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 444: ADC1->HTRL = (uint8_t)Threshold;
      009D44 7B 04            [ 1]  546 	ld	a, (0x04, sp)
      009D46 C7 54 09         [ 1]  547 	ld	0x5409, a
                                    548 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 445: }
      009D49 81               [ 4]  549 	ret
                                    550 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 453: void ADC1_SetLowThreshold(uint16_t Threshold)
                                    551 ;	-----------------------------------------
                                    552 ;	 function ADC1_SetLowThreshold
                                    553 ;	-----------------------------------------
      009D4A                        554 _ADC1_SetLowThreshold:
                                    555 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 455: ADC1->LTRL = (uint8_t)Threshold;
      009D4A 7B 04            [ 1]  556 	ld	a, (0x04, sp)
      009D4C C7 54 0B         [ 1]  557 	ld	0x540b, a
                                    558 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 456: ADC1->LTRH = (uint8_t)(Threshold >> (uint8_t)2);
      009D4F 1E 03            [ 2]  559 	ldw	x, (0x03, sp)
      009D51 54               [ 2]  560 	srlw	x
      009D52 54               [ 2]  561 	srlw	x
      009D53 9F               [ 1]  562 	ld	a, xl
      009D54 C7 54 0A         [ 1]  563 	ld	0x540a, a
                                    564 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 457: }
      009D57 81               [ 4]  565 	ret
                                    566 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 466: uint16_t ADC1_GetBufferValue(uint8_t Buffer)
                                    567 ;	-----------------------------------------
                                    568 ;	 function ADC1_GetBufferValue
                                    569 ;	-----------------------------------------
      009D58                        570 _ADC1_GetBufferValue:
      009D58 52 0B            [ 2]  571 	sub	sp, #11
                                    572 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 474: if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
      009D5A C6 54 02         [ 1]  573 	ld	a, 0x5402
      009D5D 6B 07            [ 1]  574 	ld	(0x07, sp), a
                                    575 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 477: templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
      009D5F 7B 0E            [ 1]  576 	ld	a, (0x0e, sp)
      009D61 48               [ 1]  577 	sll	a
      009D62 5F               [ 1]  578 	clrw	x
      009D63 97               [ 1]  579 	ld	xl, a
      009D64 51               [ 1]  580 	exgw	x, y
      009D65 93               [ 1]  581 	ldw	x, y
      009D66 1C 53 E1         [ 2]  582 	addw	x, #0x53e1
                                    583 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 479: temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
      009D69 72 A9 53 E0      [ 2]  584 	addw	y, #0x53e0
                                    585 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 477: templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
                                    586 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 479: temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
                                    587 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 477: templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
      009D6D F6               [ 1]  588 	ld	a, (x)
      009D6E 97               [ 1]  589 	ld	xl, a
                                    590 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 479: temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
      009D6F 90 F6            [ 1]  591 	ld	a, (y)
                                    592 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 474: if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
      009D71 88               [ 1]  593 	push	a
      009D72 7B 08            [ 1]  594 	ld	a, (0x08, sp)
      009D74 A5 08            [ 1]  595 	bcp	a, #0x08
      009D76 84               [ 1]  596 	pop	a
      009D77 27 0E            [ 1]  597 	jreq	00102$
                                    598 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 477: templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
                                    599 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 479: temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
                                    600 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 481: temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
      009D79 0F 06            [ 1]  601 	clr	(0x06, sp)
      009D7B 0F 01            [ 1]  602 	clr	(0x01, sp)
      009D7D 1A 01            [ 1]  603 	or	a, (0x01, sp)
      009D7F 01               [ 1]  604 	rrwa	x
      009D80 1A 06            [ 1]  605 	or	a, (0x06, sp)
      009D82 97               [ 1]  606 	ld	xl, a
      009D83 1F 0A            [ 2]  607 	ldw	(0x0a, sp), x
      009D85 20 19            [ 2]  608 	jra	00103$
      009D87                        609 00102$:
                                    610 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 486: temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
                                    611 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 488: templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
                                    612 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 490: temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)(temph << 8));
      009D87 02               [ 1]  613 	rlwa	x
      009D88 4F               [ 1]  614 	clr	a
      009D89 01               [ 1]  615 	rrwa	x
      009D8A 58               [ 2]  616 	sllw	x
      009D8B 58               [ 2]  617 	sllw	x
      009D8C 58               [ 2]  618 	sllw	x
      009D8D 58               [ 2]  619 	sllw	x
      009D8E 58               [ 2]  620 	sllw	x
      009D8F 58               [ 2]  621 	sllw	x
      009D90 1F 03            [ 2]  622 	ldw	(0x03, sp), x
      009D92 97               [ 1]  623 	ld	xl, a
      009D93 7B 04            [ 1]  624 	ld	a, (0x04, sp)
      009D95 6B 09            [ 1]  625 	ld	(0x09, sp), a
      009D97 9F               [ 1]  626 	ld	a, xl
      009D98 1A 03            [ 1]  627 	or	a, (0x03, sp)
      009D9A 6B 0A            [ 1]  628 	ld	(0x0a, sp), a
      009D9C 7B 09            [ 1]  629 	ld	a, (0x09, sp)
      009D9E 6B 0B            [ 1]  630 	ld	(0x0b, sp), a
      009DA0                        631 00103$:
                                    632 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 493: return ((uint16_t)temph);
      009DA0 1E 0A            [ 2]  633 	ldw	x, (0x0a, sp)
                                    634 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 494: }
      009DA2 5B 0B            [ 2]  635 	addw	sp, #11
      009DA4 81               [ 4]  636 	ret
                                    637 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 502: FlagStatus ADC1_GetAWDChannelStatus(ADC1_Channel_TypeDef Channel)
                                    638 ;	-----------------------------------------
                                    639 ;	 function ADC1_GetAWDChannelStatus
                                    640 ;	-----------------------------------------
      009DA5                        641 _ADC1_GetAWDChannelStatus:
      009DA5 52 02            [ 2]  642 	sub	sp, #2
                                    643 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 509: if (Channel < (uint8_t)8)
      009DA7 7B 05            [ 1]  644 	ld	a, (0x05, sp)
      009DA9 A1 08            [ 1]  645 	cp	a, #0x08
      009DAB 24 16            [ 1]  646 	jrnc	00102$
                                    647 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 511: status = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << Channel));
      009DAD C6 54 0D         [ 1]  648 	ld	a, 0x540d
      009DB0 88               [ 1]  649 	push	a
      009DB1 A6 01            [ 1]  650 	ld	a, #0x01
      009DB3 6B 03            [ 1]  651 	ld	(0x03, sp), a
      009DB5 7B 06            [ 1]  652 	ld	a, (0x06, sp)
      009DB7 27 05            [ 1]  653 	jreq	00113$
      009DB9                        654 00112$:
      009DB9 08 03            [ 1]  655 	sll	(0x03, sp)
      009DBB 4A               [ 1]  656 	dec	a
      009DBC 26 FB            [ 1]  657 	jrne	00112$
      009DBE                        658 00113$:
      009DBE 84               [ 1]  659 	pop	a
      009DBF 14 02            [ 1]  660 	and	a, (0x02, sp)
      009DC1 20 19            [ 2]  661 	jra	00103$
      009DC3                        662 00102$:
                                    663 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 515: status = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8)));
      009DC3 C6 54 0C         [ 1]  664 	ld	a, 0x540c
      009DC6 97               [ 1]  665 	ld	xl, a
      009DC7 7B 05            [ 1]  666 	ld	a, (0x05, sp)
      009DC9 A0 08            [ 1]  667 	sub	a, #0x08
      009DCB 88               [ 1]  668 	push	a
      009DCC A6 01            [ 1]  669 	ld	a, #0x01
      009DCE 6B 02            [ 1]  670 	ld	(0x02, sp), a
      009DD0 84               [ 1]  671 	pop	a
      009DD1 4D               [ 1]  672 	tnz	a
      009DD2 27 05            [ 1]  673 	jreq	00115$
      009DD4                        674 00114$:
      009DD4 08 01            [ 1]  675 	sll	(0x01, sp)
      009DD6 4A               [ 1]  676 	dec	a
      009DD7 26 FB            [ 1]  677 	jrne	00114$
      009DD9                        678 00115$:
      009DD9 9F               [ 1]  679 	ld	a, xl
      009DDA 14 01            [ 1]  680 	and	a, (0x01, sp)
      009DDC                        681 00103$:
                                    682 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 518: return ((FlagStatus)status);
                                    683 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 519: }
      009DDC 5B 02            [ 2]  684 	addw	sp, #2
      009DDE 81               [ 4]  685 	ret
                                    686 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 527: FlagStatus ADC1_GetFlagStatus(ADC1_Flag_TypeDef Flag)
                                    687 ;	-----------------------------------------
                                    688 ;	 function ADC1_GetFlagStatus
                                    689 ;	-----------------------------------------
      009DDF                        690 _ADC1_GetFlagStatus:
      009DDF 52 04            [ 2]  691 	sub	sp, #4
                                    692 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 535: if ((Flag & 0x0F) == 0x01)
      009DE1 7B 07            [ 1]  693 	ld	a, (0x07, sp)
      009DE3 6B 03            [ 1]  694 	ld	(0x03, sp), a
      009DE5 0F 02            [ 1]  695 	clr	(0x02, sp)
      009DE7 7B 03            [ 1]  696 	ld	a, (0x03, sp)
      009DE9 A4 0F            [ 1]  697 	and	a, #0x0f
      009DEB 97               [ 1]  698 	ld	xl, a
      009DEC 4F               [ 1]  699 	clr	a
      009DED 95               [ 1]  700 	ld	xh, a
      009DEE 5A               [ 2]  701 	decw	x
      009DEF 26 07            [ 1]  702 	jrne	00108$
                                    703 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 538: flagstatus = (uint8_t)(ADC1->CR3 & ADC1_CR3_OVR);
      009DF1 C6 54 03         [ 1]  704 	ld	a, 0x5403
      009DF4 A4 40            [ 1]  705 	and	a, #0x40
      009DF6 20 49            [ 2]  706 	jra	00109$
      009DF8                        707 00108$:
                                    708 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 540: else if ((Flag & 0xF0) == 0x10)
      009DF8 7B 03            [ 1]  709 	ld	a, (0x03, sp)
      009DFA A4 F0            [ 1]  710 	and	a, #0xf0
      009DFC 97               [ 1]  711 	ld	xl, a
      009DFD 4F               [ 1]  712 	clr	a
      009DFE 95               [ 1]  713 	ld	xh, a
      009DFF A3 00 10         [ 2]  714 	cpw	x, #0x0010
      009E02 26 38            [ 1]  715 	jrne	00105$
                                    716 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 543: temp = (uint8_t)(Flag & (uint8_t)0x0F);
      009E04 7B 07            [ 1]  717 	ld	a, (0x07, sp)
      009E06 A4 0F            [ 1]  718 	and	a, #0x0f
                                    719 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 544: if (temp < 8)
      009E08 97               [ 1]  720 	ld	xl, a
      009E09 A1 08            [ 1]  721 	cp	a, #0x08
      009E0B 24 16            [ 1]  722 	jrnc	00102$
                                    723 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 546: flagstatus = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
      009E0D C6 54 0D         [ 1]  724 	ld	a, 0x540d
      009E10 6B 01            [ 1]  725 	ld	(0x01, sp), a
      009E12 A6 01            [ 1]  726 	ld	a, #0x01
      009E14 88               [ 1]  727 	push	a
      009E15 9F               [ 1]  728 	ld	a, xl
      009E16 4D               [ 1]  729 	tnz	a
      009E17 27 05            [ 1]  730 	jreq	00135$
      009E19                        731 00134$:
      009E19 08 01            [ 1]  732 	sll	(1, sp)
      009E1B 4A               [ 1]  733 	dec	a
      009E1C 26 FB            [ 1]  734 	jrne	00134$
      009E1E                        735 00135$:
      009E1E 84               [ 1]  736 	pop	a
      009E1F 14 01            [ 1]  737 	and	a, (0x01, sp)
      009E21 20 1E            [ 2]  738 	jra	00109$
      009E23                        739 00102$:
                                    740 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 550: flagstatus = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
      009E23 C6 54 0C         [ 1]  741 	ld	a, 0x540c
      009E26 6B 04            [ 1]  742 	ld	(0x04, sp), a
      009E28 1D 00 08         [ 2]  743 	subw	x, #8
      009E2B A6 01            [ 1]  744 	ld	a, #0x01
      009E2D 88               [ 1]  745 	push	a
      009E2E 9F               [ 1]  746 	ld	a, xl
      009E2F 4D               [ 1]  747 	tnz	a
      009E30 27 05            [ 1]  748 	jreq	00137$
      009E32                        749 00136$:
      009E32 08 01            [ 1]  750 	sll	(1, sp)
      009E34 4A               [ 1]  751 	dec	a
      009E35 26 FB            [ 1]  752 	jrne	00136$
      009E37                        753 00137$:
      009E37 84               [ 1]  754 	pop	a
      009E38 14 04            [ 1]  755 	and	a, (0x04, sp)
      009E3A 20 05            [ 2]  756 	jra	00109$
      009E3C                        757 00105$:
                                    758 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 555: flagstatus = (uint8_t)(ADC1->CSR & Flag);
      009E3C C6 54 00         [ 1]  759 	ld	a, 0x5400
      009E3F 14 07            [ 1]  760 	and	a, (0x07, sp)
      009E41                        761 00109$:
                                    762 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 557: return ((FlagStatus)flagstatus);
                                    763 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 559: }
      009E41 5B 04            [ 2]  764 	addw	sp, #4
      009E43 81               [ 4]  765 	ret
                                    766 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 567: void ADC1_ClearFlag(ADC1_Flag_TypeDef Flag)
                                    767 ;	-----------------------------------------
                                    768 ;	 function ADC1_ClearFlag
                                    769 ;	-----------------------------------------
      009E44                        770 _ADC1_ClearFlag:
      009E44 52 05            [ 2]  771 	sub	sp, #5
                                    772 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 574: if ((Flag & 0x0F) == 0x01)
      009E46 7B 08            [ 1]  773 	ld	a, (0x08, sp)
      009E48 0F 01            [ 1]  774 	clr	(0x01, sp)
      009E4A 88               [ 1]  775 	push	a
      009E4B A4 0F            [ 1]  776 	and	a, #0x0f
      009E4D 97               [ 1]  777 	ld	xl, a
      009E4E 4F               [ 1]  778 	clr	a
      009E4F 95               [ 1]  779 	ld	xh, a
      009E50 84               [ 1]  780 	pop	a
      009E51 5A               [ 2]  781 	decw	x
      009E52 26 06            [ 1]  782 	jrne	00108$
                                    783 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 577: ADC1->CR3 &= (uint8_t)(~ADC1_CR3_OVR);
      009E54 72 1D 54 03      [ 1]  784 	bres	21507, #6
      009E58 20 57            [ 2]  785 	jra	00110$
      009E5A                        786 00108$:
                                    787 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 579: else if ((Flag & 0xF0) == 0x10)
      009E5A A4 F0            [ 1]  788 	and	a, #0xf0
      009E5C 97               [ 1]  789 	ld	xl, a
      009E5D 4F               [ 1]  790 	clr	a
      009E5E 95               [ 1]  791 	ld	xh, a
      009E5F A3 00 10         [ 2]  792 	cpw	x, #0x0010
      009E62 26 40            [ 1]  793 	jrne	00105$
                                    794 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 582: temp = (uint8_t)(Flag & (uint8_t)0x0F);
      009E64 7B 08            [ 1]  795 	ld	a, (0x08, sp)
      009E66 A4 0F            [ 1]  796 	and	a, #0x0f
                                    797 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 583: if (temp < 8)
      009E68 97               [ 1]  798 	ld	xl, a
      009E69 A1 08            [ 1]  799 	cp	a, #0x08
      009E6B 24 1A            [ 1]  800 	jrnc	00102$
                                    801 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 585: ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
      009E6D C6 54 0D         [ 1]  802 	ld	a, 0x540d
      009E70 6B 05            [ 1]  803 	ld	(0x05, sp), a
      009E72 A6 01            [ 1]  804 	ld	a, #0x01
      009E74 88               [ 1]  805 	push	a
      009E75 9F               [ 1]  806 	ld	a, xl
      009E76 4D               [ 1]  807 	tnz	a
      009E77 27 05            [ 1]  808 	jreq	00135$
      009E79                        809 00134$:
      009E79 08 01            [ 1]  810 	sll	(1, sp)
      009E7B 4A               [ 1]  811 	dec	a
      009E7C 26 FB            [ 1]  812 	jrne	00134$
      009E7E                        813 00135$:
      009E7E 84               [ 1]  814 	pop	a
      009E7F 43               [ 1]  815 	cpl	a
      009E80 14 05            [ 1]  816 	and	a, (0x05, sp)
      009E82 C7 54 0D         [ 1]  817 	ld	0x540d, a
      009E85 20 2A            [ 2]  818 	jra	00110$
      009E87                        819 00102$:
                                    820 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 589: ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
      009E87 C6 54 0C         [ 1]  821 	ld	a, 0x540c
      009E8A 6B 04            [ 1]  822 	ld	(0x04, sp), a
      009E8C 1D 00 08         [ 2]  823 	subw	x, #8
      009E8F A6 01            [ 1]  824 	ld	a, #0x01
      009E91 88               [ 1]  825 	push	a
      009E92 9F               [ 1]  826 	ld	a, xl
      009E93 4D               [ 1]  827 	tnz	a
      009E94 27 05            [ 1]  828 	jreq	00137$
      009E96                        829 00136$:
      009E96 08 01            [ 1]  830 	sll	(1, sp)
      009E98 4A               [ 1]  831 	dec	a
      009E99 26 FB            [ 1]  832 	jrne	00136$
      009E9B                        833 00137$:
      009E9B 84               [ 1]  834 	pop	a
      009E9C 43               [ 1]  835 	cpl	a
      009E9D 14 04            [ 1]  836 	and	a, (0x04, sp)
      009E9F C7 54 0C         [ 1]  837 	ld	0x540c, a
      009EA2 20 0D            [ 2]  838 	jra	00110$
      009EA4                        839 00105$:
                                    840 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 594: ADC1->CSR &= (uint8_t) (~Flag);
      009EA4 C6 54 00         [ 1]  841 	ld	a, 0x5400
      009EA7 6B 03            [ 1]  842 	ld	(0x03, sp), a
      009EA9 7B 08            [ 1]  843 	ld	a, (0x08, sp)
      009EAB 43               [ 1]  844 	cpl	a
      009EAC 14 03            [ 1]  845 	and	a, (0x03, sp)
      009EAE C7 54 00         [ 1]  846 	ld	0x5400, a
      009EB1                        847 00110$:
                                    848 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 596: }
      009EB1 5B 05            [ 2]  849 	addw	sp, #5
      009EB3 81               [ 4]  850 	ret
                                    851 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 616: ITStatus ADC1_GetITStatus(ADC1_IT_TypeDef ITPendingBit)
                                    852 ;	-----------------------------------------
                                    853 ;	 function ADC1_GetITStatus
                                    854 ;	-----------------------------------------
      009EB4                        855 _ADC1_GetITStatus:
      009EB4 52 03            [ 2]  856 	sub	sp, #3
                                    857 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 624: if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
      009EB6 7B 07            [ 1]  858 	ld	a, (0x07, sp)
      009EB8 A4 F0            [ 1]  859 	and	a, #0xf0
      009EBA 97               [ 1]  860 	ld	xl, a
      009EBB 4F               [ 1]  861 	clr	a
      009EBC 95               [ 1]  862 	ld	xh, a
                                    863 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 627: temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
      009EBD 7B 07            [ 1]  864 	ld	a, (0x07, sp)
                                    865 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 624: if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
      009EBF A3 00 10         [ 2]  866 	cpw	x, #0x0010
      009EC2 26 36            [ 1]  867 	jrne	00105$
                                    868 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 627: temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
      009EC4 A4 0F            [ 1]  869 	and	a, #0x0f
                                    870 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 628: if (temp < 8)
      009EC6 97               [ 1]  871 	ld	xl, a
      009EC7 A1 08            [ 1]  872 	cp	a, #0x08
      009EC9 24 16            [ 1]  873 	jrnc	00102$
                                    874 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 630: itstatus = (ITStatus)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
      009ECB C6 54 0D         [ 1]  875 	ld	a, 0x540d
      009ECE 88               [ 1]  876 	push	a
      009ECF A6 01            [ 1]  877 	ld	a, #0x01
      009ED1 6B 04            [ 1]  878 	ld	(0x04, sp), a
      009ED3 9F               [ 1]  879 	ld	a, xl
      009ED4 4D               [ 1]  880 	tnz	a
      009ED5 27 05            [ 1]  881 	jreq	00124$
      009ED7                        882 00123$:
      009ED7 08 04            [ 1]  883 	sll	(0x04, sp)
      009ED9 4A               [ 1]  884 	dec	a
      009EDA 26 FB            [ 1]  885 	jrne	00123$
      009EDC                        886 00124$:
      009EDC 84               [ 1]  887 	pop	a
      009EDD 14 03            [ 1]  888 	and	a, (0x03, sp)
      009EDF 20 23            [ 2]  889 	jra	00106$
      009EE1                        890 00102$:
                                    891 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 634: itstatus = (ITStatus)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
      009EE1 C6 54 0C         [ 1]  892 	ld	a, 0x540c
      009EE4 6B 02            [ 1]  893 	ld	(0x02, sp), a
      009EE6 1D 00 08         [ 2]  894 	subw	x, #8
      009EE9 A6 01            [ 1]  895 	ld	a, #0x01
      009EEB 88               [ 1]  896 	push	a
      009EEC 9F               [ 1]  897 	ld	a, xl
      009EED 4D               [ 1]  898 	tnz	a
      009EEE 27 05            [ 1]  899 	jreq	00126$
      009EF0                        900 00125$:
      009EF0 08 01            [ 1]  901 	sll	(1, sp)
      009EF2 4A               [ 1]  902 	dec	a
      009EF3 26 FB            [ 1]  903 	jrne	00125$
      009EF5                        904 00126$:
      009EF5 84               [ 1]  905 	pop	a
      009EF6 14 02            [ 1]  906 	and	a, (0x02, sp)
      009EF8 20 0A            [ 2]  907 	jra	00106$
      009EFA                        908 00105$:
                                    909 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 639: itstatus = (ITStatus)(ADC1->CSR & (uint8_t)ITPendingBit);
      009EFA AE 54 00         [ 2]  910 	ldw	x, #0x5400
      009EFD 88               [ 1]  911 	push	a
      009EFE F6               [ 1]  912 	ld	a, (x)
      009EFF 6B 02            [ 1]  913 	ld	(0x02, sp), a
      009F01 84               [ 1]  914 	pop	a
      009F02 14 01            [ 1]  915 	and	a, (0x01, sp)
      009F04                        916 00106$:
                                    917 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 641: return ((ITStatus)itstatus);
                                    918 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 642: }
      009F04 5B 03            [ 2]  919 	addw	sp, #3
      009F06 81               [ 4]  920 	ret
                                    921 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 662: void ADC1_ClearITPendingBit(ADC1_IT_TypeDef ITPendingBit)
                                    922 ;	-----------------------------------------
                                    923 ;	 function ADC1_ClearITPendingBit
                                    924 ;	-----------------------------------------
      009F07                        925 _ADC1_ClearITPendingBit:
      009F07 52 02            [ 2]  926 	sub	sp, #2
                                    927 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 669: if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
      009F09 7B 06            [ 1]  928 	ld	a, (0x06, sp)
      009F0B A4 F0            [ 1]  929 	and	a, #0xf0
      009F0D 97               [ 1]  930 	ld	xl, a
      009F0E 4F               [ 1]  931 	clr	a
      009F0F 95               [ 1]  932 	ld	xh, a
      009F10 A3 00 10         [ 2]  933 	cpw	x, #0x0010
      009F13 26 40            [ 1]  934 	jrne	00105$
                                    935 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 672: temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
      009F15 7B 06            [ 1]  936 	ld	a, (0x06, sp)
      009F17 A4 0F            [ 1]  937 	and	a, #0x0f
                                    938 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 673: if (temp < 8)
      009F19 97               [ 1]  939 	ld	xl, a
      009F1A A1 08            [ 1]  940 	cp	a, #0x08
      009F1C 24 1A            [ 1]  941 	jrnc	00102$
                                    942 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 675: ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
      009F1E C6 54 0D         [ 1]  943 	ld	a, 0x540d
      009F21 6B 02            [ 1]  944 	ld	(0x02, sp), a
      009F23 A6 01            [ 1]  945 	ld	a, #0x01
      009F25 88               [ 1]  946 	push	a
      009F26 9F               [ 1]  947 	ld	a, xl
      009F27 4D               [ 1]  948 	tnz	a
      009F28 27 05            [ 1]  949 	jreq	00124$
      009F2A                        950 00123$:
      009F2A 08 01            [ 1]  951 	sll	(1, sp)
      009F2C 4A               [ 1]  952 	dec	a
      009F2D 26 FB            [ 1]  953 	jrne	00123$
      009F2F                        954 00124$:
      009F2F 84               [ 1]  955 	pop	a
      009F30 43               [ 1]  956 	cpl	a
      009F31 14 02            [ 1]  957 	and	a, (0x02, sp)
      009F33 C7 54 0D         [ 1]  958 	ld	0x540d, a
      009F36 20 2A            [ 2]  959 	jra	00107$
      009F38                        960 00102$:
                                    961 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 679: ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
      009F38 C6 54 0C         [ 1]  962 	ld	a, 0x540c
      009F3B 6B 01            [ 1]  963 	ld	(0x01, sp), a
      009F3D 1D 00 08         [ 2]  964 	subw	x, #8
      009F40 A6 01            [ 1]  965 	ld	a, #0x01
      009F42 88               [ 1]  966 	push	a
      009F43 9F               [ 1]  967 	ld	a, xl
      009F44 4D               [ 1]  968 	tnz	a
      009F45 27 05            [ 1]  969 	jreq	00126$
      009F47                        970 00125$:
      009F47 08 01            [ 1]  971 	sll	(1, sp)
      009F49 4A               [ 1]  972 	dec	a
      009F4A 26 FB            [ 1]  973 	jrne	00125$
      009F4C                        974 00126$:
      009F4C 84               [ 1]  975 	pop	a
      009F4D 43               [ 1]  976 	cpl	a
      009F4E 14 01            [ 1]  977 	and	a, (0x01, sp)
      009F50 C7 54 0C         [ 1]  978 	ld	0x540c, a
      009F53 20 0D            [ 2]  979 	jra	00107$
      009F55                        980 00105$:
                                    981 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 684: ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ITPendingBit);
      009F55 C6 54 00         [ 1]  982 	ld	a, 0x5400
      009F58 1E 05            [ 2]  983 	ldw	x, (0x05, sp)
      009F5A 53               [ 2]  984 	cplw	x
      009F5B 89               [ 2]  985 	pushw	x
      009F5C 14 02            [ 1]  986 	and	a, (2, sp)
      009F5E 85               [ 2]  987 	popw	x
      009F5F C7 54 00         [ 1]  988 	ld	0x5400, a
      009F62                        989 00107$:
                                    990 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 686: }
      009F62 5B 02            [ 2]  991 	addw	sp, #2
      009F64 81               [ 4]  992 	ret
                                    993 	.area CODE
                                    994 	.area CONST
                                    995 	.area INITIALIZER
                                    996 	.area CABS (ABS)
