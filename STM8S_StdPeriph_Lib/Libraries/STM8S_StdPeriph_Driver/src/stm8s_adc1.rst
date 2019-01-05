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
      008D0F                         73 _ADC1_DeInit:
                                     74 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 54: ADC1->CSR  = ADC1_CSR_RESET_VALUE;
      008D0F 35 00 54 00      [ 1]   75 	mov	0x5400+0, #0x00
                                     76 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 55: ADC1->CR1  = ADC1_CR1_RESET_VALUE;
      008D13 35 00 54 01      [ 1]   77 	mov	0x5401+0, #0x00
                                     78 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 56: ADC1->CR2  = ADC1_CR2_RESET_VALUE;
      008D17 35 00 54 02      [ 1]   79 	mov	0x5402+0, #0x00
                                     80 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 57: ADC1->CR3  = ADC1_CR3_RESET_VALUE;
      008D1B 35 00 54 03      [ 1]   81 	mov	0x5403+0, #0x00
                                     82 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 58: ADC1->TDRH = ADC1_TDRH_RESET_VALUE;
      008D1F 35 00 54 06      [ 1]   83 	mov	0x5406+0, #0x00
                                     84 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 59: ADC1->TDRL = ADC1_TDRL_RESET_VALUE;
      008D23 35 00 54 07      [ 1]   85 	mov	0x5407+0, #0x00
                                     86 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 60: ADC1->HTRH = ADC1_HTRH_RESET_VALUE;
      008D27 35 FF 54 08      [ 1]   87 	mov	0x5408+0, #0xff
                                     88 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 61: ADC1->HTRL = ADC1_HTRL_RESET_VALUE;
      008D2B 35 03 54 09      [ 1]   89 	mov	0x5409+0, #0x03
                                     90 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 62: ADC1->LTRH = ADC1_LTRH_RESET_VALUE;
      008D2F 35 00 54 0A      [ 1]   91 	mov	0x540a+0, #0x00
                                     92 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 63: ADC1->LTRL = ADC1_LTRL_RESET_VALUE;
      008D33 35 00 54 0B      [ 1]   93 	mov	0x540b+0, #0x00
                                     94 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 64: ADC1->AWCRH = ADC1_AWCRH_RESET_VALUE;
      008D37 35 00 54 0E      [ 1]   95 	mov	0x540e+0, #0x00
                                     96 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 65: ADC1->AWCRL = ADC1_AWCRL_RESET_VALUE;
      008D3B 35 00 54 0F      [ 1]   97 	mov	0x540f+0, #0x00
                                     98 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 66: }
      008D3F 81               [ 4]   99 	ret
                                    100 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 88: void ADC1_Init(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_PresSel_TypeDef ADC1_PrescalerSelection, ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState ADC1_ExtTriggerState, ADC1_Align_TypeDef ADC1_Align, ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState ADC1_SchmittTriggerState)
                                    101 ;	-----------------------------------------
                                    102 ;	 function ADC1_Init
                                    103 ;	-----------------------------------------
      008D40                        104 _ADC1_Init:
                                    105 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 103: ADC1_ConversionConfig(ADC1_ConversionMode, ADC1_Channel, ADC1_Align);
      008D40 7B 08            [ 1]  106 	ld	a, (0x08, sp)
      008D42 88               [ 1]  107 	push	a
      008D43 7B 05            [ 1]  108 	ld	a, (0x05, sp)
      008D45 88               [ 1]  109 	push	a
      008D46 7B 05            [ 1]  110 	ld	a, (0x05, sp)
      008D48 88               [ 1]  111 	push	a
      008D49 CD 8E 56         [ 4]  112 	call	_ADC1_ConversionConfig
      008D4C 5B 03            [ 2]  113 	addw	sp, #3
                                    114 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 105: ADC1_PrescalerConfig(ADC1_PrescalerSelection);
      008D4E 7B 05            [ 1]  115 	ld	a, (0x05, sp)
      008D50 88               [ 1]  116 	push	a
      008D51 CD 8D C7         [ 4]  117 	call	_ADC1_PrescalerConfig
      008D54 84               [ 1]  118 	pop	a
                                    119 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 110: ADC1_ExternalTriggerConfig(ADC1_ExtTrigger, ADC1_ExtTriggerState);
      008D55 7B 07            [ 1]  120 	ld	a, (0x07, sp)
      008D57 88               [ 1]  121 	push	a
      008D58 7B 07            [ 1]  122 	ld	a, (0x07, sp)
      008D5A 88               [ 1]  123 	push	a
      008D5B CD 8E 89         [ 4]  124 	call	_ADC1_ExternalTriggerConfig
      008D5E 5B 02            [ 2]  125 	addw	sp, #2
                                    126 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 115: ADC1_SchmittTriggerConfig(ADC1_SchmittTriggerChannel, ADC1_SchmittTriggerState);
      008D60 7B 0A            [ 1]  127 	ld	a, (0x0a, sp)
      008D62 88               [ 1]  128 	push	a
      008D63 7B 0A            [ 1]  129 	ld	a, (0x0a, sp)
      008D65 88               [ 1]  130 	push	a
      008D66 CD 8D D8         [ 4]  131 	call	_ADC1_SchmittTriggerConfig
      008D69 5B 02            [ 2]  132 	addw	sp, #2
                                    133 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 118: ADC1->CR1 |= ADC1_CR1_ADON;
      008D6B 72 10 54 01      [ 1]  134 	bset	21505, #0
                                    135 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 119: }
      008D6F 81               [ 4]  136 	ret
                                    137 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 126: void ADC1_Cmd(FunctionalState NewState)
                                    138 ;	-----------------------------------------
                                    139 ;	 function ADC1_Cmd
                                    140 ;	-----------------------------------------
      008D70                        141 _ADC1_Cmd:
                                    142 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 133: ADC1->CR1 |= ADC1_CR1_ADON;
      008D70 C6 54 01         [ 1]  143 	ld	a, 0x5401
                                    144 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 131: if (NewState != DISABLE)
      008D73 0D 03            [ 1]  145 	tnz	(0x03, sp)
      008D75 27 06            [ 1]  146 	jreq	00102$
                                    147 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 133: ADC1->CR1 |= ADC1_CR1_ADON;
      008D77 AA 01            [ 1]  148 	or	a, #0x01
      008D79 C7 54 01         [ 1]  149 	ld	0x5401, a
      008D7C 81               [ 4]  150 	ret
      008D7D                        151 00102$:
                                    152 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 137: ADC1->CR1 &= (uint8_t)(~ADC1_CR1_ADON);
      008D7D A4 FE            [ 1]  153 	and	a, #0xfe
      008D7F C7 54 01         [ 1]  154 	ld	0x5401, a
                                    155 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 139: }
      008D82 81               [ 4]  156 	ret
                                    157 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 146: void ADC1_ScanModeCmd(FunctionalState NewState)
                                    158 ;	-----------------------------------------
                                    159 ;	 function ADC1_ScanModeCmd
                                    160 ;	-----------------------------------------
      008D83                        161 _ADC1_ScanModeCmd:
                                    162 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 153: ADC1->CR2 |= ADC1_CR2_SCAN;
      008D83 C6 54 02         [ 1]  163 	ld	a, 0x5402
                                    164 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 151: if (NewState != DISABLE)
      008D86 0D 03            [ 1]  165 	tnz	(0x03, sp)
      008D88 27 06            [ 1]  166 	jreq	00102$
                                    167 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 153: ADC1->CR2 |= ADC1_CR2_SCAN;
      008D8A AA 02            [ 1]  168 	or	a, #0x02
      008D8C C7 54 02         [ 1]  169 	ld	0x5402, a
      008D8F 81               [ 4]  170 	ret
      008D90                        171 00102$:
                                    172 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 157: ADC1->CR2 &= (uint8_t)(~ADC1_CR2_SCAN);
      008D90 A4 FD            [ 1]  173 	and	a, #0xfd
      008D92 C7 54 02         [ 1]  174 	ld	0x5402, a
                                    175 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 159: }
      008D95 81               [ 4]  176 	ret
                                    177 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 166: void ADC1_DataBufferCmd(FunctionalState NewState)
                                    178 ;	-----------------------------------------
                                    179 ;	 function ADC1_DataBufferCmd
                                    180 ;	-----------------------------------------
      008D96                        181 _ADC1_DataBufferCmd:
                                    182 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 173: ADC1->CR3 |= ADC1_CR3_DBUF;
      008D96 C6 54 03         [ 1]  183 	ld	a, 0x5403
                                    184 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 171: if (NewState != DISABLE)
      008D99 0D 03            [ 1]  185 	tnz	(0x03, sp)
      008D9B 27 06            [ 1]  186 	jreq	00102$
                                    187 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 173: ADC1->CR3 |= ADC1_CR3_DBUF;
      008D9D AA 80            [ 1]  188 	or	a, #0x80
      008D9F C7 54 03         [ 1]  189 	ld	0x5403, a
      008DA2 81               [ 4]  190 	ret
      008DA3                        191 00102$:
                                    192 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 177: ADC1->CR3 &= (uint8_t)(~ADC1_CR3_DBUF);
      008DA3 A4 7F            [ 1]  193 	and	a, #0x7f
      008DA5 C7 54 03         [ 1]  194 	ld	0x5403, a
                                    195 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 179: }
      008DA8 81               [ 4]  196 	ret
                                    197 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 190: void ADC1_ITConfig(ADC1_IT_TypeDef ADC1_IT, FunctionalState NewState)
                                    198 ;	-----------------------------------------
                                    199 ;	 function ADC1_ITConfig
                                    200 ;	-----------------------------------------
      008DA9                        201 _ADC1_ITConfig:
      008DA9 88               [ 1]  202 	push	a
                                    203 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 199: ADC1->CSR |= (uint8_t)ADC1_IT;
      008DAA C6 54 00         [ 1]  204 	ld	a, 0x5400
      008DAD 6B 01            [ 1]  205 	ld	(0x01, sp), a
                                    206 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 196: if (NewState != DISABLE)
      008DAF 0D 06            [ 1]  207 	tnz	(0x06, sp)
      008DB1 27 09            [ 1]  208 	jreq	00102$
                                    209 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 199: ADC1->CSR |= (uint8_t)ADC1_IT;
      008DB3 7B 05            [ 1]  210 	ld	a, (0x05, sp)
      008DB5 1A 01            [ 1]  211 	or	a, (0x01, sp)
      008DB7 C7 54 00         [ 1]  212 	ld	0x5400, a
      008DBA 20 09            [ 2]  213 	jra	00104$
      008DBC                        214 00102$:
                                    215 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 204: ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ADC1_IT);
      008DBC 1E 04            [ 2]  216 	ldw	x, (0x04, sp)
      008DBE 53               [ 2]  217 	cplw	x
      008DBF 9F               [ 1]  218 	ld	a, xl
      008DC0 14 01            [ 1]  219 	and	a, (0x01, sp)
      008DC2 C7 54 00         [ 1]  220 	ld	0x5400, a
      008DC5                        221 00104$:
                                    222 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 206: }
      008DC5 84               [ 1]  223 	pop	a
      008DC6 81               [ 4]  224 	ret
                                    225 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 214: void ADC1_PrescalerConfig(ADC1_PresSel_TypeDef ADC1_Prescaler)
                                    226 ;	-----------------------------------------
                                    227 ;	 function ADC1_PrescalerConfig
                                    228 ;	-----------------------------------------
      008DC7                        229 _ADC1_PrescalerConfig:
                                    230 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 220: ADC1->CR1 &= (uint8_t)(~ADC1_CR1_SPSEL);
      008DC7 C6 54 01         [ 1]  231 	ld	a, 0x5401
      008DCA A4 8F            [ 1]  232 	and	a, #0x8f
      008DCC C7 54 01         [ 1]  233 	ld	0x5401, a
                                    234 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 222: ADC1->CR1 |= (uint8_t)(ADC1_Prescaler);
      008DCF C6 54 01         [ 1]  235 	ld	a, 0x5401
      008DD2 1A 03            [ 1]  236 	or	a, (0x03, sp)
      008DD4 C7 54 01         [ 1]  237 	ld	0x5401, a
                                    238 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 223: }
      008DD7 81               [ 4]  239 	ret
                                    240 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 233: void ADC1_SchmittTriggerConfig(ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState NewState)
                                    241 ;	-----------------------------------------
                                    242 ;	 function ADC1_SchmittTriggerConfig
                                    243 ;	-----------------------------------------
      008DD8                        244 _ADC1_SchmittTriggerConfig:
      008DD8 52 02            [ 2]  245 	sub	sp, #2
                                    246 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 239: if (ADC1_SchmittTriggerChannel == ADC1_SCHMITTTRIG_ALL)
      008DDA 7B 05            [ 1]  247 	ld	a, (0x05, sp)
      008DDC 4C               [ 1]  248 	inc	a
      008DDD 26 21            [ 1]  249 	jrne	00114$
                                    250 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 243: ADC1->TDRL &= (uint8_t)0x0;
      008DDF C6 54 07         [ 1]  251 	ld	a, 0x5407
                                    252 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 241: if (NewState != DISABLE)
      008DE2 0D 06            [ 1]  253 	tnz	(0x06, sp)
      008DE4 27 0D            [ 1]  254 	jreq	00102$
                                    255 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 243: ADC1->TDRL &= (uint8_t)0x0;
      008DE6 35 00 54 07      [ 1]  256 	mov	0x5407+0, #0x00
                                    257 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 244: ADC1->TDRH &= (uint8_t)0x0;
      008DEA C6 54 06         [ 1]  258 	ld	a, 0x5406
      008DED 35 00 54 06      [ 1]  259 	mov	0x5406+0, #0x00
      008DF1 20 60            [ 2]  260 	jra	00116$
      008DF3                        261 00102$:
                                    262 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 248: ADC1->TDRL |= (uint8_t)0xFF;
      008DF3 35 FF 54 07      [ 1]  263 	mov	0x5407+0, #0xff
                                    264 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 249: ADC1->TDRH |= (uint8_t)0xFF;
      008DF7 C6 54 06         [ 1]  265 	ld	a, 0x5406
      008DFA 35 FF 54 06      [ 1]  266 	mov	0x5406+0, #0xff
      008DFE 20 53            [ 2]  267 	jra	00116$
      008E00                        268 00114$:
                                    269 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 252: else if (ADC1_SchmittTriggerChannel < ADC1_SCHMITTTRIG_CHANNEL8)
      008E00 7B 05            [ 1]  270 	ld	a, (0x05, sp)
      008E02 A1 08            [ 1]  271 	cp	a, #0x08
      008E04 24 25            [ 1]  272 	jrnc	00111$
                                    273 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 243: ADC1->TDRL &= (uint8_t)0x0;
      008E06 C6 54 07         [ 1]  274 	ld	a, 0x5407
      008E09 6B 01            [ 1]  275 	ld	(0x01, sp), a
                                    276 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 256: ADC1->TDRL &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel));
      008E0B A6 01            [ 1]  277 	ld	a, #0x01
      008E0D 88               [ 1]  278 	push	a
      008E0E 7B 06            [ 1]  279 	ld	a, (0x06, sp)
      008E10 27 05            [ 1]  280 	jreq	00149$
      008E12                        281 00148$:
      008E12 08 01            [ 1]  282 	sll	(1, sp)
      008E14 4A               [ 1]  283 	dec	a
      008E15 26 FB            [ 1]  284 	jrne	00148$
      008E17                        285 00149$:
      008E17 84               [ 1]  286 	pop	a
                                    287 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 254: if (NewState != DISABLE)
      008E18 0D 06            [ 1]  288 	tnz	(0x06, sp)
      008E1A 27 08            [ 1]  289 	jreq	00105$
                                    290 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 256: ADC1->TDRL &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel));
      008E1C 43               [ 1]  291 	cpl	a
      008E1D 14 01            [ 1]  292 	and	a, (0x01, sp)
      008E1F C7 54 07         [ 1]  293 	ld	0x5407, a
      008E22 20 2F            [ 2]  294 	jra	00116$
      008E24                        295 00105$:
                                    296 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 260: ADC1->TDRL |= (uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel);
      008E24 1A 01            [ 1]  297 	or	a, (0x01, sp)
      008E26 C7 54 07         [ 1]  298 	ld	0x5407, a
      008E29 20 28            [ 2]  299 	jra	00116$
      008E2B                        300 00111$:
                                    301 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 244: ADC1->TDRH &= (uint8_t)0x0;
      008E2B C6 54 06         [ 1]  302 	ld	a, 0x5406
      008E2E 6B 02            [ 1]  303 	ld	(0x02, sp), a
                                    304 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 267: ADC1->TDRH &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8)));
      008E30 7B 05            [ 1]  305 	ld	a, (0x05, sp)
      008E32 A0 08            [ 1]  306 	sub	a, #0x08
      008E34 97               [ 1]  307 	ld	xl, a
      008E35 A6 01            [ 1]  308 	ld	a, #0x01
      008E37 88               [ 1]  309 	push	a
      008E38 9F               [ 1]  310 	ld	a, xl
      008E39 4D               [ 1]  311 	tnz	a
      008E3A 27 05            [ 1]  312 	jreq	00152$
      008E3C                        313 00151$:
      008E3C 08 01            [ 1]  314 	sll	(1, sp)
      008E3E 4A               [ 1]  315 	dec	a
      008E3F 26 FB            [ 1]  316 	jrne	00151$
      008E41                        317 00152$:
      008E41 84               [ 1]  318 	pop	a
                                    319 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 265: if (NewState != DISABLE)
      008E42 0D 06            [ 1]  320 	tnz	(0x06, sp)
      008E44 27 08            [ 1]  321 	jreq	00108$
                                    322 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 267: ADC1->TDRH &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8)));
      008E46 43               [ 1]  323 	cpl	a
      008E47 14 02            [ 1]  324 	and	a, (0x02, sp)
      008E49 C7 54 06         [ 1]  325 	ld	0x5406, a
      008E4C 20 05            [ 2]  326 	jra	00116$
      008E4E                        327 00108$:
                                    328 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 271: ADC1->TDRH |= (uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8));
      008E4E 1A 02            [ 1]  329 	or	a, (0x02, sp)
      008E50 C7 54 06         [ 1]  330 	ld	0x5406, a
      008E53                        331 00116$:
                                    332 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 274: }
      008E53 5B 02            [ 2]  333 	addw	sp, #2
      008E55 81               [ 4]  334 	ret
                                    335 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 286: void ADC1_ConversionConfig(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_Align_TypeDef ADC1_Align)
                                    336 ;	-----------------------------------------
                                    337 ;	 function ADC1_ConversionConfig
                                    338 ;	-----------------------------------------
      008E56                        339 _ADC1_ConversionConfig:
                                    340 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 294: ADC1->CR2 &= (uint8_t)(~ADC1_CR2_ALIGN);
      008E56 72 17 54 02      [ 1]  341 	bres	21506, #3
                                    342 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 296: ADC1->CR2 |= (uint8_t)(ADC1_Align);
      008E5A C6 54 02         [ 1]  343 	ld	a, 0x5402
      008E5D 1A 05            [ 1]  344 	or	a, (0x05, sp)
      008E5F C7 54 02         [ 1]  345 	ld	0x5402, a
                                    346 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 301: ADC1->CR1 |= ADC1_CR1_CONT;
      008E62 C6 54 01         [ 1]  347 	ld	a, 0x5401
                                    348 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 298: if (ADC1_ConversionMode == ADC1_CONVERSIONMODE_CONTINUOUS)
      008E65 88               [ 1]  349 	push	a
      008E66 7B 04            [ 1]  350 	ld	a, (0x04, sp)
      008E68 4A               [ 1]  351 	dec	a
      008E69 84               [ 1]  352 	pop	a
      008E6A 26 07            [ 1]  353 	jrne	00102$
                                    354 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 301: ADC1->CR1 |= ADC1_CR1_CONT;
      008E6C AA 02            [ 1]  355 	or	a, #0x02
      008E6E C7 54 01         [ 1]  356 	ld	0x5401, a
      008E71 20 05            [ 2]  357 	jra	00103$
      008E73                        358 00102$:
                                    359 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 306: ADC1->CR1 &= (uint8_t)(~ADC1_CR1_CONT);
      008E73 A4 FD            [ 1]  360 	and	a, #0xfd
      008E75 C7 54 01         [ 1]  361 	ld	0x5401, a
      008E78                        362 00103$:
                                    363 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 310: ADC1->CSR &= (uint8_t)(~ADC1_CSR_CH);
      008E78 C6 54 00         [ 1]  364 	ld	a, 0x5400
      008E7B A4 F0            [ 1]  365 	and	a, #0xf0
      008E7D C7 54 00         [ 1]  366 	ld	0x5400, a
                                    367 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 312: ADC1->CSR |= (uint8_t)(ADC1_Channel);
      008E80 C6 54 00         [ 1]  368 	ld	a, 0x5400
      008E83 1A 04            [ 1]  369 	or	a, (0x04, sp)
      008E85 C7 54 00         [ 1]  370 	ld	0x5400, a
                                    371 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 313: }
      008E88 81               [ 4]  372 	ret
                                    373 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 325: void ADC1_ExternalTriggerConfig(ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState NewState)
                                    374 ;	-----------------------------------------
                                    375 ;	 function ADC1_ExternalTriggerConfig
                                    376 ;	-----------------------------------------
      008E89                        377 _ADC1_ExternalTriggerConfig:
                                    378 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 332: ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTSEL);
      008E89 C6 54 02         [ 1]  379 	ld	a, 0x5402
      008E8C A4 CF            [ 1]  380 	and	a, #0xcf
      008E8E C7 54 02         [ 1]  381 	ld	0x5402, a
      008E91 C6 54 02         [ 1]  382 	ld	a, 0x5402
                                    383 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 334: if (NewState != DISABLE)
      008E94 0D 04            [ 1]  384 	tnz	(0x04, sp)
      008E96 27 07            [ 1]  385 	jreq	00102$
                                    386 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 337: ADC1->CR2 |= (uint8_t)(ADC1_CR2_EXTTRIG);
      008E98 AA 40            [ 1]  387 	or	a, #0x40
      008E9A C7 54 02         [ 1]  388 	ld	0x5402, a
      008E9D 20 05            [ 2]  389 	jra	00103$
      008E9F                        390 00102$:
                                    391 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 342: ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTTRIG);
      008E9F A4 BF            [ 1]  392 	and	a, #0xbf
      008EA1 C7 54 02         [ 1]  393 	ld	0x5402, a
      008EA4                        394 00103$:
                                    395 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 346: ADC1->CR2 |= (uint8_t)(ADC1_ExtTrigger);
      008EA4 C6 54 02         [ 1]  396 	ld	a, 0x5402
      008EA7 1A 03            [ 1]  397 	or	a, (0x03, sp)
      008EA9 C7 54 02         [ 1]  398 	ld	0x5402, a
                                    399 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 347: }
      008EAC 81               [ 4]  400 	ret
                                    401 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 358: void ADC1_StartConversion(void)
                                    402 ;	-----------------------------------------
                                    403 ;	 function ADC1_StartConversion
                                    404 ;	-----------------------------------------
      008EAD                        405 _ADC1_StartConversion:
                                    406 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 360: ADC1->CR1 |= ADC1_CR1_ADON;
      008EAD 72 10 54 01      [ 1]  407 	bset	21505, #0
                                    408 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 361: }
      008EB1 81               [ 4]  409 	ret
                                    410 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 370: uint16_t ADC1_GetConversionValue(void)
                                    411 ;	-----------------------------------------
                                    412 ;	 function ADC1_GetConversionValue
                                    413 ;	-----------------------------------------
      008EB2                        414 _ADC1_GetConversionValue:
      008EB2 52 08            [ 2]  415 	sub	sp, #8
                                    416 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 375: if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
      008EB4 C6 54 02         [ 1]  417 	ld	a, 0x5402
      008EB7 A5 08            [ 1]  418 	bcp	a, #0x08
      008EB9 27 15            [ 1]  419 	jreq	00102$
                                    420 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 378: templ = ADC1->DRL;
      008EBB C6 54 05         [ 1]  421 	ld	a, 0x5405
      008EBE 97               [ 1]  422 	ld	xl, a
                                    423 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 380: temph = ADC1->DRH;
      008EBF C6 54 04         [ 1]  424 	ld	a, 0x5404
                                    425 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 382: temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
      008EC2 0F 04            [ 1]  426 	clr	(0x04, sp)
      008EC4 0F 01            [ 1]  427 	clr	(0x01, sp)
      008EC6 1A 01            [ 1]  428 	or	a, (0x01, sp)
      008EC8 01               [ 1]  429 	rrwa	x
      008EC9 1A 04            [ 1]  430 	or	a, (0x04, sp)
      008ECB 97               [ 1]  431 	ld	xl, a
      008ECC 1F 07            [ 2]  432 	ldw	(0x07, sp), x
      008ECE 20 1D            [ 2]  433 	jra	00103$
      008ED0                        434 00102$:
                                    435 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 387: temph = ADC1->DRH;
      008ED0 C6 54 04         [ 1]  436 	ld	a, 0x5404
      008ED3 5F               [ 1]  437 	clrw	x
      008ED4 97               [ 1]  438 	ld	xl, a
      008ED5 51               [ 1]  439 	exgw	x, y
                                    440 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 389: templ = ADC1->DRL;
      008ED6 C6 54 05         [ 1]  441 	ld	a, 0x5405
                                    442 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 391: temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)((uint16_t)temph << 8));
      008ED9 5F               [ 1]  443 	clrw	x
      008EDA 97               [ 1]  444 	ld	xl, a
      008EDB 58               [ 2]  445 	sllw	x
      008EDC 58               [ 2]  446 	sllw	x
      008EDD 58               [ 2]  447 	sllw	x
      008EDE 58               [ 2]  448 	sllw	x
      008EDF 58               [ 2]  449 	sllw	x
      008EE0 58               [ 2]  450 	sllw	x
      008EE1 1F 05            [ 2]  451 	ldw	(0x05, sp), x
      008EE3 7B 06            [ 1]  452 	ld	a, (0x06, sp)
      008EE5 97               [ 1]  453 	ld	xl, a
      008EE6 90 9F            [ 1]  454 	ld	a, yl
      008EE8 1A 05            [ 1]  455 	or	a, (0x05, sp)
      008EEA 95               [ 1]  456 	ld	xh, a
      008EEB 1F 07            [ 2]  457 	ldw	(0x07, sp), x
      008EED                        458 00103$:
                                    459 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 394: return ((uint16_t)temph);
      008EED 1E 07            [ 2]  460 	ldw	x, (0x07, sp)
                                    461 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 395: }
      008EEF 5B 08            [ 2]  462 	addw	sp, #8
      008EF1 81               [ 4]  463 	ret
                                    464 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 405: void ADC1_AWDChannelConfig(ADC1_Channel_TypeDef Channel, FunctionalState NewState)
                                    465 ;	-----------------------------------------
                                    466 ;	 function ADC1_AWDChannelConfig
                                    467 ;	-----------------------------------------
      008EF2                        468 _ADC1_AWDChannelConfig:
      008EF2 52 02            [ 2]  469 	sub	sp, #2
                                    470 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 411: if (Channel < (uint8_t)8)
      008EF4 7B 05            [ 1]  471 	ld	a, (0x05, sp)
      008EF6 A1 08            [ 1]  472 	cp	a, #0x08
      008EF8 24 25            [ 1]  473 	jrnc	00108$
                                    474 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 415: ADC1->AWCRL |= (uint8_t)((uint8_t)1 << Channel);
      008EFA C6 54 0F         [ 1]  475 	ld	a, 0x540f
      008EFD 6B 02            [ 1]  476 	ld	(0x02, sp), a
      008EFF A6 01            [ 1]  477 	ld	a, #0x01
      008F01 88               [ 1]  478 	push	a
      008F02 7B 06            [ 1]  479 	ld	a, (0x06, sp)
      008F04 27 05            [ 1]  480 	jreq	00129$
      008F06                        481 00128$:
      008F06 08 01            [ 1]  482 	sll	(1, sp)
      008F08 4A               [ 1]  483 	dec	a
      008F09 26 FB            [ 1]  484 	jrne	00128$
      008F0B                        485 00129$:
      008F0B 84               [ 1]  486 	pop	a
                                    487 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 413: if (NewState != DISABLE)
      008F0C 0D 06            [ 1]  488 	tnz	(0x06, sp)
      008F0E 27 07            [ 1]  489 	jreq	00102$
                                    490 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 415: ADC1->AWCRL |= (uint8_t)((uint8_t)1 << Channel);
      008F10 1A 02            [ 1]  491 	or	a, (0x02, sp)
      008F12 C7 54 0F         [ 1]  492 	ld	0x540f, a
      008F15 20 30            [ 2]  493 	jra	00110$
      008F17                        494 00102$:
                                    495 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 419: ADC1->AWCRL &= (uint8_t)~(uint8_t)((uint8_t)1 << Channel);
      008F17 43               [ 1]  496 	cpl	a
      008F18 14 02            [ 1]  497 	and	a, (0x02, sp)
      008F1A C7 54 0F         [ 1]  498 	ld	0x540f, a
      008F1D 20 28            [ 2]  499 	jra	00110$
      008F1F                        500 00108$:
                                    501 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 426: ADC1->AWCRH |= (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8));
      008F1F C6 54 0E         [ 1]  502 	ld	a, 0x540e
      008F22 6B 01            [ 1]  503 	ld	(0x01, sp), a
      008F24 7B 05            [ 1]  504 	ld	a, (0x05, sp)
      008F26 A0 08            [ 1]  505 	sub	a, #0x08
      008F28 97               [ 1]  506 	ld	xl, a
      008F29 A6 01            [ 1]  507 	ld	a, #0x01
      008F2B 88               [ 1]  508 	push	a
      008F2C 9F               [ 1]  509 	ld	a, xl
      008F2D 4D               [ 1]  510 	tnz	a
      008F2E 27 05            [ 1]  511 	jreq	00132$
      008F30                        512 00131$:
      008F30 08 01            [ 1]  513 	sll	(1, sp)
      008F32 4A               [ 1]  514 	dec	a
      008F33 26 FB            [ 1]  515 	jrne	00131$
      008F35                        516 00132$:
      008F35 84               [ 1]  517 	pop	a
                                    518 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 424: if (NewState != DISABLE)
      008F36 0D 06            [ 1]  519 	tnz	(0x06, sp)
      008F38 27 07            [ 1]  520 	jreq	00105$
                                    521 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 426: ADC1->AWCRH |= (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8));
      008F3A 1A 01            [ 1]  522 	or	a, (0x01, sp)
      008F3C C7 54 0E         [ 1]  523 	ld	0x540e, a
      008F3F 20 06            [ 2]  524 	jra	00110$
      008F41                        525 00105$:
                                    526 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 430: ADC1->AWCRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (uint8_t)(Channel - (uint8_t)8));
      008F41 43               [ 1]  527 	cpl	a
      008F42 14 01            [ 1]  528 	and	a, (0x01, sp)
      008F44 C7 54 0E         [ 1]  529 	ld	0x540e, a
      008F47                        530 00110$:
                                    531 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 433: }
      008F47 5B 02            [ 2]  532 	addw	sp, #2
      008F49 81               [ 4]  533 	ret
                                    534 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 441: void ADC1_SetHighThreshold(uint16_t Threshold)
                                    535 ;	-----------------------------------------
                                    536 ;	 function ADC1_SetHighThreshold
                                    537 ;	-----------------------------------------
      008F4A                        538 _ADC1_SetHighThreshold:
                                    539 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 443: ADC1->HTRH = (uint8_t)(Threshold >> (uint8_t)2);
      008F4A 1E 03            [ 2]  540 	ldw	x, (0x03, sp)
      008F4C 54               [ 2]  541 	srlw	x
      008F4D 54               [ 2]  542 	srlw	x
      008F4E 9F               [ 1]  543 	ld	a, xl
      008F4F C7 54 08         [ 1]  544 	ld	0x5408, a
                                    545 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 444: ADC1->HTRL = (uint8_t)Threshold;
      008F52 7B 04            [ 1]  546 	ld	a, (0x04, sp)
      008F54 C7 54 09         [ 1]  547 	ld	0x5409, a
                                    548 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 445: }
      008F57 81               [ 4]  549 	ret
                                    550 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 453: void ADC1_SetLowThreshold(uint16_t Threshold)
                                    551 ;	-----------------------------------------
                                    552 ;	 function ADC1_SetLowThreshold
                                    553 ;	-----------------------------------------
      008F58                        554 _ADC1_SetLowThreshold:
                                    555 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 455: ADC1->LTRL = (uint8_t)Threshold;
      008F58 7B 04            [ 1]  556 	ld	a, (0x04, sp)
      008F5A C7 54 0B         [ 1]  557 	ld	0x540b, a
                                    558 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 456: ADC1->LTRH = (uint8_t)(Threshold >> (uint8_t)2);
      008F5D 1E 03            [ 2]  559 	ldw	x, (0x03, sp)
      008F5F 54               [ 2]  560 	srlw	x
      008F60 54               [ 2]  561 	srlw	x
      008F61 9F               [ 1]  562 	ld	a, xl
      008F62 C7 54 0A         [ 1]  563 	ld	0x540a, a
                                    564 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 457: }
      008F65 81               [ 4]  565 	ret
                                    566 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 466: uint16_t ADC1_GetBufferValue(uint8_t Buffer)
                                    567 ;	-----------------------------------------
                                    568 ;	 function ADC1_GetBufferValue
                                    569 ;	-----------------------------------------
      008F66                        570 _ADC1_GetBufferValue:
      008F66 52 0B            [ 2]  571 	sub	sp, #11
                                    572 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 474: if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
      008F68 C6 54 02         [ 1]  573 	ld	a, 0x5402
      008F6B 6B 0B            [ 1]  574 	ld	(0x0b, sp), a
                                    575 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 477: templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
      008F6D 7B 0E            [ 1]  576 	ld	a, (0x0e, sp)
      008F6F 48               [ 1]  577 	sll	a
      008F70 5F               [ 1]  578 	clrw	x
      008F71 97               [ 1]  579 	ld	xl, a
      008F72 51               [ 1]  580 	exgw	x, y
      008F73 93               [ 1]  581 	ldw	x, y
      008F74 1C 53 E1         [ 2]  582 	addw	x, #0x53e1
                                    583 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 479: temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
      008F77 72 A9 53 E0      [ 2]  584 	addw	y, #0x53e0
                                    585 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 477: templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
                                    586 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 479: temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
                                    587 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 477: templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
      008F7B F6               [ 1]  588 	ld	a, (x)
      008F7C 97               [ 1]  589 	ld	xl, a
                                    590 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 479: temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
      008F7D 90 F6            [ 1]  591 	ld	a, (y)
                                    592 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 474: if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
      008F7F 88               [ 1]  593 	push	a
      008F80 7B 0C            [ 1]  594 	ld	a, (0x0c, sp)
      008F82 A5 08            [ 1]  595 	bcp	a, #0x08
      008F84 84               [ 1]  596 	pop	a
      008F85 27 0E            [ 1]  597 	jreq	00102$
                                    598 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 477: templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
                                    599 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 479: temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
                                    600 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 481: temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
      008F87 0F 08            [ 1]  601 	clr	(0x08, sp)
      008F89 0F 03            [ 1]  602 	clr	(0x03, sp)
      008F8B 1A 03            [ 1]  603 	or	a, (0x03, sp)
      008F8D 01               [ 1]  604 	rrwa	x
      008F8E 1A 08            [ 1]  605 	or	a, (0x08, sp)
      008F90 97               [ 1]  606 	ld	xl, a
      008F91 1F 01            [ 2]  607 	ldw	(0x01, sp), x
      008F93 20 19            [ 2]  608 	jra	00103$
      008F95                        609 00102$:
                                    610 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 486: temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
                                    611 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 488: templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
                                    612 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 490: temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)(temph << 8));
      008F95 02               [ 1]  613 	rlwa	x
      008F96 4F               [ 1]  614 	clr	a
      008F97 01               [ 1]  615 	rrwa	x
      008F98 58               [ 2]  616 	sllw	x
      008F99 58               [ 2]  617 	sllw	x
      008F9A 58               [ 2]  618 	sllw	x
      008F9B 58               [ 2]  619 	sllw	x
      008F9C 58               [ 2]  620 	sllw	x
      008F9D 58               [ 2]  621 	sllw	x
      008F9E 1F 09            [ 2]  622 	ldw	(0x09, sp), x
      008FA0 97               [ 1]  623 	ld	xl, a
      008FA1 7B 0A            [ 1]  624 	ld	a, (0x0a, sp)
      008FA3 6B 06            [ 1]  625 	ld	(0x06, sp), a
      008FA5 9F               [ 1]  626 	ld	a, xl
      008FA6 1A 09            [ 1]  627 	or	a, (0x09, sp)
      008FA8 6B 01            [ 1]  628 	ld	(0x01, sp), a
      008FAA 7B 06            [ 1]  629 	ld	a, (0x06, sp)
      008FAC 6B 02            [ 1]  630 	ld	(0x02, sp), a
      008FAE                        631 00103$:
                                    632 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 493: return ((uint16_t)temph);
      008FAE 1E 01            [ 2]  633 	ldw	x, (0x01, sp)
                                    634 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 494: }
      008FB0 5B 0B            [ 2]  635 	addw	sp, #11
      008FB2 81               [ 4]  636 	ret
                                    637 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 502: FlagStatus ADC1_GetAWDChannelStatus(ADC1_Channel_TypeDef Channel)
                                    638 ;	-----------------------------------------
                                    639 ;	 function ADC1_GetAWDChannelStatus
                                    640 ;	-----------------------------------------
      008FB3                        641 _ADC1_GetAWDChannelStatus:
      008FB3 52 02            [ 2]  642 	sub	sp, #2
                                    643 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 509: if (Channel < (uint8_t)8)
      008FB5 7B 05            [ 1]  644 	ld	a, (0x05, sp)
      008FB7 A1 08            [ 1]  645 	cp	a, #0x08
      008FB9 24 16            [ 1]  646 	jrnc	00102$
                                    647 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 511: status = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << Channel));
      008FBB C6 54 0D         [ 1]  648 	ld	a, 0x540d
      008FBE 88               [ 1]  649 	push	a
      008FBF A6 01            [ 1]  650 	ld	a, #0x01
      008FC1 6B 03            [ 1]  651 	ld	(0x03, sp), a
      008FC3 7B 06            [ 1]  652 	ld	a, (0x06, sp)
      008FC5 27 05            [ 1]  653 	jreq	00113$
      008FC7                        654 00112$:
      008FC7 08 03            [ 1]  655 	sll	(0x03, sp)
      008FC9 4A               [ 1]  656 	dec	a
      008FCA 26 FB            [ 1]  657 	jrne	00112$
      008FCC                        658 00113$:
      008FCC 84               [ 1]  659 	pop	a
      008FCD 14 02            [ 1]  660 	and	a, (0x02, sp)
      008FCF 20 19            [ 2]  661 	jra	00103$
      008FD1                        662 00102$:
                                    663 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 515: status = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8)));
      008FD1 C6 54 0C         [ 1]  664 	ld	a, 0x540c
      008FD4 97               [ 1]  665 	ld	xl, a
      008FD5 7B 05            [ 1]  666 	ld	a, (0x05, sp)
      008FD7 A0 08            [ 1]  667 	sub	a, #0x08
      008FD9 88               [ 1]  668 	push	a
      008FDA A6 01            [ 1]  669 	ld	a, #0x01
      008FDC 6B 02            [ 1]  670 	ld	(0x02, sp), a
      008FDE 84               [ 1]  671 	pop	a
      008FDF 4D               [ 1]  672 	tnz	a
      008FE0 27 05            [ 1]  673 	jreq	00115$
      008FE2                        674 00114$:
      008FE2 08 01            [ 1]  675 	sll	(0x01, sp)
      008FE4 4A               [ 1]  676 	dec	a
      008FE5 26 FB            [ 1]  677 	jrne	00114$
      008FE7                        678 00115$:
      008FE7 9F               [ 1]  679 	ld	a, xl
      008FE8 14 01            [ 1]  680 	and	a, (0x01, sp)
      008FEA                        681 00103$:
                                    682 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 518: return ((FlagStatus)status);
                                    683 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 519: }
      008FEA 5B 02            [ 2]  684 	addw	sp, #2
      008FEC 81               [ 4]  685 	ret
                                    686 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 527: FlagStatus ADC1_GetFlagStatus(ADC1_Flag_TypeDef Flag)
                                    687 ;	-----------------------------------------
                                    688 ;	 function ADC1_GetFlagStatus
                                    689 ;	-----------------------------------------
      008FED                        690 _ADC1_GetFlagStatus:
      008FED 52 04            [ 2]  691 	sub	sp, #4
                                    692 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 535: if ((Flag & 0x0F) == 0x01)
      008FEF 7B 07            [ 1]  693 	ld	a, (0x07, sp)
      008FF1 6B 03            [ 1]  694 	ld	(0x03, sp), a
      008FF3 0F 02            [ 1]  695 	clr	(0x02, sp)
      008FF5 7B 03            [ 1]  696 	ld	a, (0x03, sp)
      008FF7 A4 0F            [ 1]  697 	and	a, #0x0f
      008FF9 97               [ 1]  698 	ld	xl, a
      008FFA 4F               [ 1]  699 	clr	a
      008FFB 95               [ 1]  700 	ld	xh, a
      008FFC 5A               [ 2]  701 	decw	x
      008FFD 26 07            [ 1]  702 	jrne	00108$
                                    703 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 538: flagstatus = (uint8_t)(ADC1->CR3 & ADC1_CR3_OVR);
      008FFF C6 54 03         [ 1]  704 	ld	a, 0x5403
      009002 A4 40            [ 1]  705 	and	a, #0x40
      009004 20 49            [ 2]  706 	jra	00109$
      009006                        707 00108$:
                                    708 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 540: else if ((Flag & 0xF0) == 0x10)
      009006 7B 03            [ 1]  709 	ld	a, (0x03, sp)
      009008 A4 F0            [ 1]  710 	and	a, #0xf0
      00900A 97               [ 1]  711 	ld	xl, a
      00900B 4F               [ 1]  712 	clr	a
      00900C 95               [ 1]  713 	ld	xh, a
      00900D A3 00 10         [ 2]  714 	cpw	x, #0x0010
      009010 26 38            [ 1]  715 	jrne	00105$
                                    716 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 543: temp = (uint8_t)(Flag & (uint8_t)0x0F);
      009012 7B 07            [ 1]  717 	ld	a, (0x07, sp)
      009014 A4 0F            [ 1]  718 	and	a, #0x0f
                                    719 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 544: if (temp < 8)
      009016 97               [ 1]  720 	ld	xl, a
      009017 A1 08            [ 1]  721 	cp	a, #0x08
      009019 24 16            [ 1]  722 	jrnc	00102$
                                    723 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 546: flagstatus = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
      00901B C6 54 0D         [ 1]  724 	ld	a, 0x540d
      00901E 6B 04            [ 1]  725 	ld	(0x04, sp), a
      009020 A6 01            [ 1]  726 	ld	a, #0x01
      009022 88               [ 1]  727 	push	a
      009023 9F               [ 1]  728 	ld	a, xl
      009024 4D               [ 1]  729 	tnz	a
      009025 27 05            [ 1]  730 	jreq	00135$
      009027                        731 00134$:
      009027 08 01            [ 1]  732 	sll	(1, sp)
      009029 4A               [ 1]  733 	dec	a
      00902A 26 FB            [ 1]  734 	jrne	00134$
      00902C                        735 00135$:
      00902C 84               [ 1]  736 	pop	a
      00902D 14 04            [ 1]  737 	and	a, (0x04, sp)
      00902F 20 1E            [ 2]  738 	jra	00109$
      009031                        739 00102$:
                                    740 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 550: flagstatus = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
      009031 C6 54 0C         [ 1]  741 	ld	a, 0x540c
      009034 6B 01            [ 1]  742 	ld	(0x01, sp), a
      009036 1D 00 08         [ 2]  743 	subw	x, #8
      009039 A6 01            [ 1]  744 	ld	a, #0x01
      00903B 88               [ 1]  745 	push	a
      00903C 9F               [ 1]  746 	ld	a, xl
      00903D 4D               [ 1]  747 	tnz	a
      00903E 27 05            [ 1]  748 	jreq	00137$
      009040                        749 00136$:
      009040 08 01            [ 1]  750 	sll	(1, sp)
      009042 4A               [ 1]  751 	dec	a
      009043 26 FB            [ 1]  752 	jrne	00136$
      009045                        753 00137$:
      009045 84               [ 1]  754 	pop	a
      009046 14 01            [ 1]  755 	and	a, (0x01, sp)
      009048 20 05            [ 2]  756 	jra	00109$
      00904A                        757 00105$:
                                    758 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 555: flagstatus = (uint8_t)(ADC1->CSR & Flag);
      00904A C6 54 00         [ 1]  759 	ld	a, 0x5400
      00904D 14 07            [ 1]  760 	and	a, (0x07, sp)
      00904F                        761 00109$:
                                    762 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 557: return ((FlagStatus)flagstatus);
                                    763 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 559: }
      00904F 5B 04            [ 2]  764 	addw	sp, #4
      009051 81               [ 4]  765 	ret
                                    766 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 567: void ADC1_ClearFlag(ADC1_Flag_TypeDef Flag)
                                    767 ;	-----------------------------------------
                                    768 ;	 function ADC1_ClearFlag
                                    769 ;	-----------------------------------------
      009052                        770 _ADC1_ClearFlag:
      009052 52 05            [ 2]  771 	sub	sp, #5
                                    772 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 574: if ((Flag & 0x0F) == 0x01)
      009054 7B 08            [ 1]  773 	ld	a, (0x08, sp)
      009056 0F 01            [ 1]  774 	clr	(0x01, sp)
      009058 88               [ 1]  775 	push	a
      009059 A4 0F            [ 1]  776 	and	a, #0x0f
      00905B 97               [ 1]  777 	ld	xl, a
      00905C 4F               [ 1]  778 	clr	a
      00905D 95               [ 1]  779 	ld	xh, a
      00905E 84               [ 1]  780 	pop	a
      00905F 5A               [ 2]  781 	decw	x
      009060 26 06            [ 1]  782 	jrne	00108$
                                    783 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 577: ADC1->CR3 &= (uint8_t)(~ADC1_CR3_OVR);
      009062 72 1D 54 03      [ 1]  784 	bres	21507, #6
      009066 20 57            [ 2]  785 	jra	00110$
      009068                        786 00108$:
                                    787 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 579: else if ((Flag & 0xF0) == 0x10)
      009068 A4 F0            [ 1]  788 	and	a, #0xf0
      00906A 97               [ 1]  789 	ld	xl, a
      00906B 4F               [ 1]  790 	clr	a
      00906C 95               [ 1]  791 	ld	xh, a
      00906D A3 00 10         [ 2]  792 	cpw	x, #0x0010
      009070 26 40            [ 1]  793 	jrne	00105$
                                    794 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 582: temp = (uint8_t)(Flag & (uint8_t)0x0F);
      009072 7B 08            [ 1]  795 	ld	a, (0x08, sp)
      009074 A4 0F            [ 1]  796 	and	a, #0x0f
                                    797 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 583: if (temp < 8)
      009076 97               [ 1]  798 	ld	xl, a
      009077 A1 08            [ 1]  799 	cp	a, #0x08
      009079 24 1A            [ 1]  800 	jrnc	00102$
                                    801 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 585: ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
      00907B C6 54 0D         [ 1]  802 	ld	a, 0x540d
      00907E 6B 05            [ 1]  803 	ld	(0x05, sp), a
      009080 A6 01            [ 1]  804 	ld	a, #0x01
      009082 88               [ 1]  805 	push	a
      009083 9F               [ 1]  806 	ld	a, xl
      009084 4D               [ 1]  807 	tnz	a
      009085 27 05            [ 1]  808 	jreq	00135$
      009087                        809 00134$:
      009087 08 01            [ 1]  810 	sll	(1, sp)
      009089 4A               [ 1]  811 	dec	a
      00908A 26 FB            [ 1]  812 	jrne	00134$
      00908C                        813 00135$:
      00908C 84               [ 1]  814 	pop	a
      00908D 43               [ 1]  815 	cpl	a
      00908E 14 05            [ 1]  816 	and	a, (0x05, sp)
      009090 C7 54 0D         [ 1]  817 	ld	0x540d, a
      009093 20 2A            [ 2]  818 	jra	00110$
      009095                        819 00102$:
                                    820 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 589: ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
      009095 C6 54 0C         [ 1]  821 	ld	a, 0x540c
      009098 6B 04            [ 1]  822 	ld	(0x04, sp), a
      00909A 1D 00 08         [ 2]  823 	subw	x, #8
      00909D A6 01            [ 1]  824 	ld	a, #0x01
      00909F 88               [ 1]  825 	push	a
      0090A0 9F               [ 1]  826 	ld	a, xl
      0090A1 4D               [ 1]  827 	tnz	a
      0090A2 27 05            [ 1]  828 	jreq	00137$
      0090A4                        829 00136$:
      0090A4 08 01            [ 1]  830 	sll	(1, sp)
      0090A6 4A               [ 1]  831 	dec	a
      0090A7 26 FB            [ 1]  832 	jrne	00136$
      0090A9                        833 00137$:
      0090A9 84               [ 1]  834 	pop	a
      0090AA 43               [ 1]  835 	cpl	a
      0090AB 14 04            [ 1]  836 	and	a, (0x04, sp)
      0090AD C7 54 0C         [ 1]  837 	ld	0x540c, a
      0090B0 20 0D            [ 2]  838 	jra	00110$
      0090B2                        839 00105$:
                                    840 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 594: ADC1->CSR &= (uint8_t) (~Flag);
      0090B2 C6 54 00         [ 1]  841 	ld	a, 0x5400
      0090B5 6B 03            [ 1]  842 	ld	(0x03, sp), a
      0090B7 7B 08            [ 1]  843 	ld	a, (0x08, sp)
      0090B9 43               [ 1]  844 	cpl	a
      0090BA 14 03            [ 1]  845 	and	a, (0x03, sp)
      0090BC C7 54 00         [ 1]  846 	ld	0x5400, a
      0090BF                        847 00110$:
                                    848 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 596: }
      0090BF 5B 05            [ 2]  849 	addw	sp, #5
      0090C1 81               [ 4]  850 	ret
                                    851 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 616: ITStatus ADC1_GetITStatus(ADC1_IT_TypeDef ITPendingBit)
                                    852 ;	-----------------------------------------
                                    853 ;	 function ADC1_GetITStatus
                                    854 ;	-----------------------------------------
      0090C2                        855 _ADC1_GetITStatus:
      0090C2 52 03            [ 2]  856 	sub	sp, #3
                                    857 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 624: if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
      0090C4 7B 07            [ 1]  858 	ld	a, (0x07, sp)
      0090C6 A4 F0            [ 1]  859 	and	a, #0xf0
      0090C8 97               [ 1]  860 	ld	xl, a
      0090C9 4F               [ 1]  861 	clr	a
      0090CA 95               [ 1]  862 	ld	xh, a
                                    863 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 627: temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
      0090CB 7B 07            [ 1]  864 	ld	a, (0x07, sp)
                                    865 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 624: if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
      0090CD A3 00 10         [ 2]  866 	cpw	x, #0x0010
      0090D0 26 36            [ 1]  867 	jrne	00105$
                                    868 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 627: temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
      0090D2 A4 0F            [ 1]  869 	and	a, #0x0f
                                    870 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 628: if (temp < 8)
      0090D4 97               [ 1]  871 	ld	xl, a
      0090D5 A1 08            [ 1]  872 	cp	a, #0x08
      0090D7 24 16            [ 1]  873 	jrnc	00102$
                                    874 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 630: itstatus = (ITStatus)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
      0090D9 C6 54 0D         [ 1]  875 	ld	a, 0x540d
      0090DC 88               [ 1]  876 	push	a
      0090DD A6 01            [ 1]  877 	ld	a, #0x01
      0090DF 6B 04            [ 1]  878 	ld	(0x04, sp), a
      0090E1 9F               [ 1]  879 	ld	a, xl
      0090E2 4D               [ 1]  880 	tnz	a
      0090E3 27 05            [ 1]  881 	jreq	00124$
      0090E5                        882 00123$:
      0090E5 08 04            [ 1]  883 	sll	(0x04, sp)
      0090E7 4A               [ 1]  884 	dec	a
      0090E8 26 FB            [ 1]  885 	jrne	00123$
      0090EA                        886 00124$:
      0090EA 84               [ 1]  887 	pop	a
      0090EB 14 03            [ 1]  888 	and	a, (0x03, sp)
      0090ED 20 23            [ 2]  889 	jra	00106$
      0090EF                        890 00102$:
                                    891 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 634: itstatus = (ITStatus)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
      0090EF C6 54 0C         [ 1]  892 	ld	a, 0x540c
      0090F2 6B 02            [ 1]  893 	ld	(0x02, sp), a
      0090F4 1D 00 08         [ 2]  894 	subw	x, #8
      0090F7 A6 01            [ 1]  895 	ld	a, #0x01
      0090F9 88               [ 1]  896 	push	a
      0090FA 9F               [ 1]  897 	ld	a, xl
      0090FB 4D               [ 1]  898 	tnz	a
      0090FC 27 05            [ 1]  899 	jreq	00126$
      0090FE                        900 00125$:
      0090FE 08 01            [ 1]  901 	sll	(1, sp)
      009100 4A               [ 1]  902 	dec	a
      009101 26 FB            [ 1]  903 	jrne	00125$
      009103                        904 00126$:
      009103 84               [ 1]  905 	pop	a
      009104 14 02            [ 1]  906 	and	a, (0x02, sp)
      009106 20 0A            [ 2]  907 	jra	00106$
      009108                        908 00105$:
                                    909 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 639: itstatus = (ITStatus)(ADC1->CSR & (uint8_t)ITPendingBit);
      009108 AE 54 00         [ 2]  910 	ldw	x, #0x5400
      00910B 88               [ 1]  911 	push	a
      00910C F6               [ 1]  912 	ld	a, (x)
      00910D 6B 02            [ 1]  913 	ld	(0x02, sp), a
      00910F 84               [ 1]  914 	pop	a
      009110 14 01            [ 1]  915 	and	a, (0x01, sp)
      009112                        916 00106$:
                                    917 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 641: return ((ITStatus)itstatus);
                                    918 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 642: }
      009112 5B 03            [ 2]  919 	addw	sp, #3
      009114 81               [ 4]  920 	ret
                                    921 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 662: void ADC1_ClearITPendingBit(ADC1_IT_TypeDef ITPendingBit)
                                    922 ;	-----------------------------------------
                                    923 ;	 function ADC1_ClearITPendingBit
                                    924 ;	-----------------------------------------
      009115                        925 _ADC1_ClearITPendingBit:
      009115 52 02            [ 2]  926 	sub	sp, #2
                                    927 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 669: if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
      009117 7B 06            [ 1]  928 	ld	a, (0x06, sp)
      009119 A4 F0            [ 1]  929 	and	a, #0xf0
      00911B 97               [ 1]  930 	ld	xl, a
      00911C 4F               [ 1]  931 	clr	a
      00911D 95               [ 1]  932 	ld	xh, a
      00911E A3 00 10         [ 2]  933 	cpw	x, #0x0010
      009121 26 40            [ 1]  934 	jrne	00105$
                                    935 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 672: temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
      009123 7B 06            [ 1]  936 	ld	a, (0x06, sp)
      009125 A4 0F            [ 1]  937 	and	a, #0x0f
                                    938 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 673: if (temp < 8)
      009127 97               [ 1]  939 	ld	xl, a
      009128 A1 08            [ 1]  940 	cp	a, #0x08
      00912A 24 1A            [ 1]  941 	jrnc	00102$
                                    942 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 675: ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
      00912C C6 54 0D         [ 1]  943 	ld	a, 0x540d
      00912F 6B 02            [ 1]  944 	ld	(0x02, sp), a
      009131 A6 01            [ 1]  945 	ld	a, #0x01
      009133 88               [ 1]  946 	push	a
      009134 9F               [ 1]  947 	ld	a, xl
      009135 4D               [ 1]  948 	tnz	a
      009136 27 05            [ 1]  949 	jreq	00124$
      009138                        950 00123$:
      009138 08 01            [ 1]  951 	sll	(1, sp)
      00913A 4A               [ 1]  952 	dec	a
      00913B 26 FB            [ 1]  953 	jrne	00123$
      00913D                        954 00124$:
      00913D 84               [ 1]  955 	pop	a
      00913E 43               [ 1]  956 	cpl	a
      00913F 14 02            [ 1]  957 	and	a, (0x02, sp)
      009141 C7 54 0D         [ 1]  958 	ld	0x540d, a
      009144 20 2A            [ 2]  959 	jra	00107$
      009146                        960 00102$:
                                    961 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 679: ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
      009146 C6 54 0C         [ 1]  962 	ld	a, 0x540c
      009149 6B 01            [ 1]  963 	ld	(0x01, sp), a
      00914B 1D 00 08         [ 2]  964 	subw	x, #8
      00914E A6 01            [ 1]  965 	ld	a, #0x01
      009150 88               [ 1]  966 	push	a
      009151 9F               [ 1]  967 	ld	a, xl
      009152 4D               [ 1]  968 	tnz	a
      009153 27 05            [ 1]  969 	jreq	00126$
      009155                        970 00125$:
      009155 08 01            [ 1]  971 	sll	(1, sp)
      009157 4A               [ 1]  972 	dec	a
      009158 26 FB            [ 1]  973 	jrne	00125$
      00915A                        974 00126$:
      00915A 84               [ 1]  975 	pop	a
      00915B 43               [ 1]  976 	cpl	a
      00915C 14 01            [ 1]  977 	and	a, (0x01, sp)
      00915E C7 54 0C         [ 1]  978 	ld	0x540c, a
      009161 20 0D            [ 2]  979 	jra	00107$
      009163                        980 00105$:
                                    981 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 684: ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ITPendingBit);
      009163 C6 54 00         [ 1]  982 	ld	a, 0x5400
      009166 1E 05            [ 2]  983 	ldw	x, (0x05, sp)
      009168 53               [ 2]  984 	cplw	x
      009169 89               [ 2]  985 	pushw	x
      00916A 14 02            [ 1]  986 	and	a, (2, sp)
      00916C 85               [ 2]  987 	popw	x
      00916D C7 54 00         [ 1]  988 	ld	0x5400, a
      009170                        989 00107$:
                                    990 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 686: }
      009170 5B 02            [ 2]  991 	addw	sp, #2
      009172 81               [ 4]  992 	ret
                                    993 	.area CODE
                                    994 	.area CONST
                                    995 	.area INITIALIZER
                                    996 	.area CABS (ABS)
