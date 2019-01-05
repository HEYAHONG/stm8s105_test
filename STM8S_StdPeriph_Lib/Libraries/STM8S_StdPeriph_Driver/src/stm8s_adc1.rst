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
      0090D1                         73 _ADC1_DeInit:
                                     74 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 54: ADC1->CSR  = ADC1_CSR_RESET_VALUE;
      0090D1 35 00 54 00      [ 1]   75 	mov	0x5400+0, #0x00
                                     76 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 55: ADC1->CR1  = ADC1_CR1_RESET_VALUE;
      0090D5 35 00 54 01      [ 1]   77 	mov	0x5401+0, #0x00
                                     78 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 56: ADC1->CR2  = ADC1_CR2_RESET_VALUE;
      0090D9 35 00 54 02      [ 1]   79 	mov	0x5402+0, #0x00
                                     80 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 57: ADC1->CR3  = ADC1_CR3_RESET_VALUE;
      0090DD 35 00 54 03      [ 1]   81 	mov	0x5403+0, #0x00
                                     82 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 58: ADC1->TDRH = ADC1_TDRH_RESET_VALUE;
      0090E1 35 00 54 06      [ 1]   83 	mov	0x5406+0, #0x00
                                     84 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 59: ADC1->TDRL = ADC1_TDRL_RESET_VALUE;
      0090E5 35 00 54 07      [ 1]   85 	mov	0x5407+0, #0x00
                                     86 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 60: ADC1->HTRH = ADC1_HTRH_RESET_VALUE;
      0090E9 35 FF 54 08      [ 1]   87 	mov	0x5408+0, #0xff
                                     88 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 61: ADC1->HTRL = ADC1_HTRL_RESET_VALUE;
      0090ED 35 03 54 09      [ 1]   89 	mov	0x5409+0, #0x03
                                     90 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 62: ADC1->LTRH = ADC1_LTRH_RESET_VALUE;
      0090F1 35 00 54 0A      [ 1]   91 	mov	0x540a+0, #0x00
                                     92 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 63: ADC1->LTRL = ADC1_LTRL_RESET_VALUE;
      0090F5 35 00 54 0B      [ 1]   93 	mov	0x540b+0, #0x00
                                     94 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 64: ADC1->AWCRH = ADC1_AWCRH_RESET_VALUE;
      0090F9 35 00 54 0E      [ 1]   95 	mov	0x540e+0, #0x00
                                     96 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 65: ADC1->AWCRL = ADC1_AWCRL_RESET_VALUE;
      0090FD 35 00 54 0F      [ 1]   97 	mov	0x540f+0, #0x00
                                     98 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 66: }
      009101 81               [ 4]   99 	ret
                                    100 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 88: void ADC1_Init(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_PresSel_TypeDef ADC1_PrescalerSelection, ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState ADC1_ExtTriggerState, ADC1_Align_TypeDef ADC1_Align, ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState ADC1_SchmittTriggerState)
                                    101 ;	-----------------------------------------
                                    102 ;	 function ADC1_Init
                                    103 ;	-----------------------------------------
      009102                        104 _ADC1_Init:
                                    105 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 103: ADC1_ConversionConfig(ADC1_ConversionMode, ADC1_Channel, ADC1_Align);
      009102 7B 08            [ 1]  106 	ld	a, (0x08, sp)
      009104 88               [ 1]  107 	push	a
      009105 7B 05            [ 1]  108 	ld	a, (0x05, sp)
      009107 88               [ 1]  109 	push	a
      009108 7B 05            [ 1]  110 	ld	a, (0x05, sp)
      00910A 88               [ 1]  111 	push	a
      00910B CD 92 18         [ 4]  112 	call	_ADC1_ConversionConfig
      00910E 5B 03            [ 2]  113 	addw	sp, #3
                                    114 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 105: ADC1_PrescalerConfig(ADC1_PrescalerSelection);
      009110 7B 05            [ 1]  115 	ld	a, (0x05, sp)
      009112 88               [ 1]  116 	push	a
      009113 CD 91 89         [ 4]  117 	call	_ADC1_PrescalerConfig
      009116 84               [ 1]  118 	pop	a
                                    119 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 110: ADC1_ExternalTriggerConfig(ADC1_ExtTrigger, ADC1_ExtTriggerState);
      009117 7B 07            [ 1]  120 	ld	a, (0x07, sp)
      009119 88               [ 1]  121 	push	a
      00911A 7B 07            [ 1]  122 	ld	a, (0x07, sp)
      00911C 88               [ 1]  123 	push	a
      00911D CD 92 4B         [ 4]  124 	call	_ADC1_ExternalTriggerConfig
      009120 5B 02            [ 2]  125 	addw	sp, #2
                                    126 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 115: ADC1_SchmittTriggerConfig(ADC1_SchmittTriggerChannel, ADC1_SchmittTriggerState);
      009122 7B 0A            [ 1]  127 	ld	a, (0x0a, sp)
      009124 88               [ 1]  128 	push	a
      009125 7B 0A            [ 1]  129 	ld	a, (0x0a, sp)
      009127 88               [ 1]  130 	push	a
      009128 CD 91 9A         [ 4]  131 	call	_ADC1_SchmittTriggerConfig
      00912B 5B 02            [ 2]  132 	addw	sp, #2
                                    133 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 118: ADC1->CR1 |= ADC1_CR1_ADON;
      00912D 72 10 54 01      [ 1]  134 	bset	21505, #0
                                    135 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 119: }
      009131 81               [ 4]  136 	ret
                                    137 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 126: void ADC1_Cmd(FunctionalState NewState)
                                    138 ;	-----------------------------------------
                                    139 ;	 function ADC1_Cmd
                                    140 ;	-----------------------------------------
      009132                        141 _ADC1_Cmd:
                                    142 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 133: ADC1->CR1 |= ADC1_CR1_ADON;
      009132 C6 54 01         [ 1]  143 	ld	a, 0x5401
                                    144 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 131: if (NewState != DISABLE)
      009135 0D 03            [ 1]  145 	tnz	(0x03, sp)
      009137 27 06            [ 1]  146 	jreq	00102$
                                    147 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 133: ADC1->CR1 |= ADC1_CR1_ADON;
      009139 AA 01            [ 1]  148 	or	a, #0x01
      00913B C7 54 01         [ 1]  149 	ld	0x5401, a
      00913E 81               [ 4]  150 	ret
      00913F                        151 00102$:
                                    152 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 137: ADC1->CR1 &= (uint8_t)(~ADC1_CR1_ADON);
      00913F A4 FE            [ 1]  153 	and	a, #0xfe
      009141 C7 54 01         [ 1]  154 	ld	0x5401, a
                                    155 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 139: }
      009144 81               [ 4]  156 	ret
                                    157 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 146: void ADC1_ScanModeCmd(FunctionalState NewState)
                                    158 ;	-----------------------------------------
                                    159 ;	 function ADC1_ScanModeCmd
                                    160 ;	-----------------------------------------
      009145                        161 _ADC1_ScanModeCmd:
                                    162 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 153: ADC1->CR2 |= ADC1_CR2_SCAN;
      009145 C6 54 02         [ 1]  163 	ld	a, 0x5402
                                    164 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 151: if (NewState != DISABLE)
      009148 0D 03            [ 1]  165 	tnz	(0x03, sp)
      00914A 27 06            [ 1]  166 	jreq	00102$
                                    167 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 153: ADC1->CR2 |= ADC1_CR2_SCAN;
      00914C AA 02            [ 1]  168 	or	a, #0x02
      00914E C7 54 02         [ 1]  169 	ld	0x5402, a
      009151 81               [ 4]  170 	ret
      009152                        171 00102$:
                                    172 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 157: ADC1->CR2 &= (uint8_t)(~ADC1_CR2_SCAN);
      009152 A4 FD            [ 1]  173 	and	a, #0xfd
      009154 C7 54 02         [ 1]  174 	ld	0x5402, a
                                    175 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 159: }
      009157 81               [ 4]  176 	ret
                                    177 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 166: void ADC1_DataBufferCmd(FunctionalState NewState)
                                    178 ;	-----------------------------------------
                                    179 ;	 function ADC1_DataBufferCmd
                                    180 ;	-----------------------------------------
      009158                        181 _ADC1_DataBufferCmd:
                                    182 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 173: ADC1->CR3 |= ADC1_CR3_DBUF;
      009158 C6 54 03         [ 1]  183 	ld	a, 0x5403
                                    184 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 171: if (NewState != DISABLE)
      00915B 0D 03            [ 1]  185 	tnz	(0x03, sp)
      00915D 27 06            [ 1]  186 	jreq	00102$
                                    187 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 173: ADC1->CR3 |= ADC1_CR3_DBUF;
      00915F AA 80            [ 1]  188 	or	a, #0x80
      009161 C7 54 03         [ 1]  189 	ld	0x5403, a
      009164 81               [ 4]  190 	ret
      009165                        191 00102$:
                                    192 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 177: ADC1->CR3 &= (uint8_t)(~ADC1_CR3_DBUF);
      009165 A4 7F            [ 1]  193 	and	a, #0x7f
      009167 C7 54 03         [ 1]  194 	ld	0x5403, a
                                    195 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 179: }
      00916A 81               [ 4]  196 	ret
                                    197 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 190: void ADC1_ITConfig(ADC1_IT_TypeDef ADC1_IT, FunctionalState NewState)
                                    198 ;	-----------------------------------------
                                    199 ;	 function ADC1_ITConfig
                                    200 ;	-----------------------------------------
      00916B                        201 _ADC1_ITConfig:
      00916B 88               [ 1]  202 	push	a
                                    203 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 199: ADC1->CSR |= (uint8_t)ADC1_IT;
      00916C C6 54 00         [ 1]  204 	ld	a, 0x5400
      00916F 6B 01            [ 1]  205 	ld	(0x01, sp), a
                                    206 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 196: if (NewState != DISABLE)
      009171 0D 06            [ 1]  207 	tnz	(0x06, sp)
      009173 27 09            [ 1]  208 	jreq	00102$
                                    209 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 199: ADC1->CSR |= (uint8_t)ADC1_IT;
      009175 7B 05            [ 1]  210 	ld	a, (0x05, sp)
      009177 1A 01            [ 1]  211 	or	a, (0x01, sp)
      009179 C7 54 00         [ 1]  212 	ld	0x5400, a
      00917C 20 09            [ 2]  213 	jra	00104$
      00917E                        214 00102$:
                                    215 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 204: ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ADC1_IT);
      00917E 1E 04            [ 2]  216 	ldw	x, (0x04, sp)
      009180 53               [ 2]  217 	cplw	x
      009181 9F               [ 1]  218 	ld	a, xl
      009182 14 01            [ 1]  219 	and	a, (0x01, sp)
      009184 C7 54 00         [ 1]  220 	ld	0x5400, a
      009187                        221 00104$:
                                    222 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 206: }
      009187 84               [ 1]  223 	pop	a
      009188 81               [ 4]  224 	ret
                                    225 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 214: void ADC1_PrescalerConfig(ADC1_PresSel_TypeDef ADC1_Prescaler)
                                    226 ;	-----------------------------------------
                                    227 ;	 function ADC1_PrescalerConfig
                                    228 ;	-----------------------------------------
      009189                        229 _ADC1_PrescalerConfig:
                                    230 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 220: ADC1->CR1 &= (uint8_t)(~ADC1_CR1_SPSEL);
      009189 C6 54 01         [ 1]  231 	ld	a, 0x5401
      00918C A4 8F            [ 1]  232 	and	a, #0x8f
      00918E C7 54 01         [ 1]  233 	ld	0x5401, a
                                    234 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 222: ADC1->CR1 |= (uint8_t)(ADC1_Prescaler);
      009191 C6 54 01         [ 1]  235 	ld	a, 0x5401
      009194 1A 03            [ 1]  236 	or	a, (0x03, sp)
      009196 C7 54 01         [ 1]  237 	ld	0x5401, a
                                    238 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 223: }
      009199 81               [ 4]  239 	ret
                                    240 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 233: void ADC1_SchmittTriggerConfig(ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState NewState)
                                    241 ;	-----------------------------------------
                                    242 ;	 function ADC1_SchmittTriggerConfig
                                    243 ;	-----------------------------------------
      00919A                        244 _ADC1_SchmittTriggerConfig:
      00919A 52 02            [ 2]  245 	sub	sp, #2
                                    246 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 239: if (ADC1_SchmittTriggerChannel == ADC1_SCHMITTTRIG_ALL)
      00919C 7B 05            [ 1]  247 	ld	a, (0x05, sp)
      00919E 4C               [ 1]  248 	inc	a
      00919F 26 21            [ 1]  249 	jrne	00114$
                                    250 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 243: ADC1->TDRL &= (uint8_t)0x0;
      0091A1 C6 54 07         [ 1]  251 	ld	a, 0x5407
                                    252 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 241: if (NewState != DISABLE)
      0091A4 0D 06            [ 1]  253 	tnz	(0x06, sp)
      0091A6 27 0D            [ 1]  254 	jreq	00102$
                                    255 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 243: ADC1->TDRL &= (uint8_t)0x0;
      0091A8 35 00 54 07      [ 1]  256 	mov	0x5407+0, #0x00
                                    257 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 244: ADC1->TDRH &= (uint8_t)0x0;
      0091AC C6 54 06         [ 1]  258 	ld	a, 0x5406
      0091AF 35 00 54 06      [ 1]  259 	mov	0x5406+0, #0x00
      0091B3 20 60            [ 2]  260 	jra	00116$
      0091B5                        261 00102$:
                                    262 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 248: ADC1->TDRL |= (uint8_t)0xFF;
      0091B5 35 FF 54 07      [ 1]  263 	mov	0x5407+0, #0xff
                                    264 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 249: ADC1->TDRH |= (uint8_t)0xFF;
      0091B9 C6 54 06         [ 1]  265 	ld	a, 0x5406
      0091BC 35 FF 54 06      [ 1]  266 	mov	0x5406+0, #0xff
      0091C0 20 53            [ 2]  267 	jra	00116$
      0091C2                        268 00114$:
                                    269 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 252: else if (ADC1_SchmittTriggerChannel < ADC1_SCHMITTTRIG_CHANNEL8)
      0091C2 7B 05            [ 1]  270 	ld	a, (0x05, sp)
      0091C4 A1 08            [ 1]  271 	cp	a, #0x08
      0091C6 24 25            [ 1]  272 	jrnc	00111$
                                    273 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 243: ADC1->TDRL &= (uint8_t)0x0;
      0091C8 C6 54 07         [ 1]  274 	ld	a, 0x5407
      0091CB 6B 01            [ 1]  275 	ld	(0x01, sp), a
                                    276 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 256: ADC1->TDRL &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel));
      0091CD A6 01            [ 1]  277 	ld	a, #0x01
      0091CF 88               [ 1]  278 	push	a
      0091D0 7B 06            [ 1]  279 	ld	a, (0x06, sp)
      0091D2 27 05            [ 1]  280 	jreq	00149$
      0091D4                        281 00148$:
      0091D4 08 01            [ 1]  282 	sll	(1, sp)
      0091D6 4A               [ 1]  283 	dec	a
      0091D7 26 FB            [ 1]  284 	jrne	00148$
      0091D9                        285 00149$:
      0091D9 84               [ 1]  286 	pop	a
                                    287 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 254: if (NewState != DISABLE)
      0091DA 0D 06            [ 1]  288 	tnz	(0x06, sp)
      0091DC 27 08            [ 1]  289 	jreq	00105$
                                    290 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 256: ADC1->TDRL &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel));
      0091DE 43               [ 1]  291 	cpl	a
      0091DF 14 01            [ 1]  292 	and	a, (0x01, sp)
      0091E1 C7 54 07         [ 1]  293 	ld	0x5407, a
      0091E4 20 2F            [ 2]  294 	jra	00116$
      0091E6                        295 00105$:
                                    296 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 260: ADC1->TDRL |= (uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel);
      0091E6 1A 01            [ 1]  297 	or	a, (0x01, sp)
      0091E8 C7 54 07         [ 1]  298 	ld	0x5407, a
      0091EB 20 28            [ 2]  299 	jra	00116$
      0091ED                        300 00111$:
                                    301 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 244: ADC1->TDRH &= (uint8_t)0x0;
      0091ED C6 54 06         [ 1]  302 	ld	a, 0x5406
      0091F0 6B 02            [ 1]  303 	ld	(0x02, sp), a
                                    304 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 267: ADC1->TDRH &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8)));
      0091F2 7B 05            [ 1]  305 	ld	a, (0x05, sp)
      0091F4 A0 08            [ 1]  306 	sub	a, #0x08
      0091F6 97               [ 1]  307 	ld	xl, a
      0091F7 A6 01            [ 1]  308 	ld	a, #0x01
      0091F9 88               [ 1]  309 	push	a
      0091FA 9F               [ 1]  310 	ld	a, xl
      0091FB 4D               [ 1]  311 	tnz	a
      0091FC 27 05            [ 1]  312 	jreq	00152$
      0091FE                        313 00151$:
      0091FE 08 01            [ 1]  314 	sll	(1, sp)
      009200 4A               [ 1]  315 	dec	a
      009201 26 FB            [ 1]  316 	jrne	00151$
      009203                        317 00152$:
      009203 84               [ 1]  318 	pop	a
                                    319 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 265: if (NewState != DISABLE)
      009204 0D 06            [ 1]  320 	tnz	(0x06, sp)
      009206 27 08            [ 1]  321 	jreq	00108$
                                    322 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 267: ADC1->TDRH &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8)));
      009208 43               [ 1]  323 	cpl	a
      009209 14 02            [ 1]  324 	and	a, (0x02, sp)
      00920B C7 54 06         [ 1]  325 	ld	0x5406, a
      00920E 20 05            [ 2]  326 	jra	00116$
      009210                        327 00108$:
                                    328 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 271: ADC1->TDRH |= (uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8));
      009210 1A 02            [ 1]  329 	or	a, (0x02, sp)
      009212 C7 54 06         [ 1]  330 	ld	0x5406, a
      009215                        331 00116$:
                                    332 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 274: }
      009215 5B 02            [ 2]  333 	addw	sp, #2
      009217 81               [ 4]  334 	ret
                                    335 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 286: void ADC1_ConversionConfig(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_Align_TypeDef ADC1_Align)
                                    336 ;	-----------------------------------------
                                    337 ;	 function ADC1_ConversionConfig
                                    338 ;	-----------------------------------------
      009218                        339 _ADC1_ConversionConfig:
                                    340 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 294: ADC1->CR2 &= (uint8_t)(~ADC1_CR2_ALIGN);
      009218 72 17 54 02      [ 1]  341 	bres	21506, #3
                                    342 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 296: ADC1->CR2 |= (uint8_t)(ADC1_Align);
      00921C C6 54 02         [ 1]  343 	ld	a, 0x5402
      00921F 1A 05            [ 1]  344 	or	a, (0x05, sp)
      009221 C7 54 02         [ 1]  345 	ld	0x5402, a
                                    346 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 301: ADC1->CR1 |= ADC1_CR1_CONT;
      009224 C6 54 01         [ 1]  347 	ld	a, 0x5401
                                    348 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 298: if (ADC1_ConversionMode == ADC1_CONVERSIONMODE_CONTINUOUS)
      009227 88               [ 1]  349 	push	a
      009228 7B 04            [ 1]  350 	ld	a, (0x04, sp)
      00922A 4A               [ 1]  351 	dec	a
      00922B 84               [ 1]  352 	pop	a
      00922C 26 07            [ 1]  353 	jrne	00102$
                                    354 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 301: ADC1->CR1 |= ADC1_CR1_CONT;
      00922E AA 02            [ 1]  355 	or	a, #0x02
      009230 C7 54 01         [ 1]  356 	ld	0x5401, a
      009233 20 05            [ 2]  357 	jra	00103$
      009235                        358 00102$:
                                    359 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 306: ADC1->CR1 &= (uint8_t)(~ADC1_CR1_CONT);
      009235 A4 FD            [ 1]  360 	and	a, #0xfd
      009237 C7 54 01         [ 1]  361 	ld	0x5401, a
      00923A                        362 00103$:
                                    363 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 310: ADC1->CSR &= (uint8_t)(~ADC1_CSR_CH);
      00923A C6 54 00         [ 1]  364 	ld	a, 0x5400
      00923D A4 F0            [ 1]  365 	and	a, #0xf0
      00923F C7 54 00         [ 1]  366 	ld	0x5400, a
                                    367 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 312: ADC1->CSR |= (uint8_t)(ADC1_Channel);
      009242 C6 54 00         [ 1]  368 	ld	a, 0x5400
      009245 1A 04            [ 1]  369 	or	a, (0x04, sp)
      009247 C7 54 00         [ 1]  370 	ld	0x5400, a
                                    371 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 313: }
      00924A 81               [ 4]  372 	ret
                                    373 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 325: void ADC1_ExternalTriggerConfig(ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState NewState)
                                    374 ;	-----------------------------------------
                                    375 ;	 function ADC1_ExternalTriggerConfig
                                    376 ;	-----------------------------------------
      00924B                        377 _ADC1_ExternalTriggerConfig:
                                    378 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 332: ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTSEL);
      00924B C6 54 02         [ 1]  379 	ld	a, 0x5402
      00924E A4 CF            [ 1]  380 	and	a, #0xcf
      009250 C7 54 02         [ 1]  381 	ld	0x5402, a
      009253 C6 54 02         [ 1]  382 	ld	a, 0x5402
                                    383 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 334: if (NewState != DISABLE)
      009256 0D 04            [ 1]  384 	tnz	(0x04, sp)
      009258 27 07            [ 1]  385 	jreq	00102$
                                    386 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 337: ADC1->CR2 |= (uint8_t)(ADC1_CR2_EXTTRIG);
      00925A AA 40            [ 1]  387 	or	a, #0x40
      00925C C7 54 02         [ 1]  388 	ld	0x5402, a
      00925F 20 05            [ 2]  389 	jra	00103$
      009261                        390 00102$:
                                    391 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 342: ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTTRIG);
      009261 A4 BF            [ 1]  392 	and	a, #0xbf
      009263 C7 54 02         [ 1]  393 	ld	0x5402, a
      009266                        394 00103$:
                                    395 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 346: ADC1->CR2 |= (uint8_t)(ADC1_ExtTrigger);
      009266 C6 54 02         [ 1]  396 	ld	a, 0x5402
      009269 1A 03            [ 1]  397 	or	a, (0x03, sp)
      00926B C7 54 02         [ 1]  398 	ld	0x5402, a
                                    399 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 347: }
      00926E 81               [ 4]  400 	ret
                                    401 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 358: void ADC1_StartConversion(void)
                                    402 ;	-----------------------------------------
                                    403 ;	 function ADC1_StartConversion
                                    404 ;	-----------------------------------------
      00926F                        405 _ADC1_StartConversion:
                                    406 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 360: ADC1->CR1 |= ADC1_CR1_ADON;
      00926F 72 10 54 01      [ 1]  407 	bset	21505, #0
                                    408 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 361: }
      009273 81               [ 4]  409 	ret
                                    410 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 370: uint16_t ADC1_GetConversionValue(void)
                                    411 ;	-----------------------------------------
                                    412 ;	 function ADC1_GetConversionValue
                                    413 ;	-----------------------------------------
      009274                        414 _ADC1_GetConversionValue:
      009274 52 08            [ 2]  415 	sub	sp, #8
                                    416 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 375: if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
      009276 C6 54 02         [ 1]  417 	ld	a, 0x5402
      009279 A5 08            [ 1]  418 	bcp	a, #0x08
      00927B 27 15            [ 1]  419 	jreq	00102$
                                    420 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 378: templ = ADC1->DRL;
      00927D C6 54 05         [ 1]  421 	ld	a, 0x5405
      009280 97               [ 1]  422 	ld	xl, a
                                    423 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 380: temph = ADC1->DRH;
      009281 C6 54 04         [ 1]  424 	ld	a, 0x5404
                                    425 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 382: temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
      009284 0F 04            [ 1]  426 	clr	(0x04, sp)
      009286 0F 01            [ 1]  427 	clr	(0x01, sp)
      009288 1A 01            [ 1]  428 	or	a, (0x01, sp)
      00928A 01               [ 1]  429 	rrwa	x
      00928B 1A 04            [ 1]  430 	or	a, (0x04, sp)
      00928D 97               [ 1]  431 	ld	xl, a
      00928E 1F 07            [ 2]  432 	ldw	(0x07, sp), x
      009290 20 1D            [ 2]  433 	jra	00103$
      009292                        434 00102$:
                                    435 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 387: temph = ADC1->DRH;
      009292 C6 54 04         [ 1]  436 	ld	a, 0x5404
      009295 5F               [ 1]  437 	clrw	x
      009296 97               [ 1]  438 	ld	xl, a
      009297 51               [ 1]  439 	exgw	x, y
                                    440 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 389: templ = ADC1->DRL;
      009298 C6 54 05         [ 1]  441 	ld	a, 0x5405
                                    442 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 391: temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)((uint16_t)temph << 8));
      00929B 5F               [ 1]  443 	clrw	x
      00929C 97               [ 1]  444 	ld	xl, a
      00929D 58               [ 2]  445 	sllw	x
      00929E 58               [ 2]  446 	sllw	x
      00929F 58               [ 2]  447 	sllw	x
      0092A0 58               [ 2]  448 	sllw	x
      0092A1 58               [ 2]  449 	sllw	x
      0092A2 58               [ 2]  450 	sllw	x
      0092A3 1F 05            [ 2]  451 	ldw	(0x05, sp), x
      0092A5 7B 06            [ 1]  452 	ld	a, (0x06, sp)
      0092A7 97               [ 1]  453 	ld	xl, a
      0092A8 90 9F            [ 1]  454 	ld	a, yl
      0092AA 1A 05            [ 1]  455 	or	a, (0x05, sp)
      0092AC 95               [ 1]  456 	ld	xh, a
      0092AD 1F 07            [ 2]  457 	ldw	(0x07, sp), x
      0092AF                        458 00103$:
                                    459 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 394: return ((uint16_t)temph);
      0092AF 1E 07            [ 2]  460 	ldw	x, (0x07, sp)
                                    461 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 395: }
      0092B1 5B 08            [ 2]  462 	addw	sp, #8
      0092B3 81               [ 4]  463 	ret
                                    464 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 405: void ADC1_AWDChannelConfig(ADC1_Channel_TypeDef Channel, FunctionalState NewState)
                                    465 ;	-----------------------------------------
                                    466 ;	 function ADC1_AWDChannelConfig
                                    467 ;	-----------------------------------------
      0092B4                        468 _ADC1_AWDChannelConfig:
      0092B4 52 02            [ 2]  469 	sub	sp, #2
                                    470 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 411: if (Channel < (uint8_t)8)
      0092B6 7B 05            [ 1]  471 	ld	a, (0x05, sp)
      0092B8 A1 08            [ 1]  472 	cp	a, #0x08
      0092BA 24 25            [ 1]  473 	jrnc	00108$
                                    474 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 415: ADC1->AWCRL |= (uint8_t)((uint8_t)1 << Channel);
      0092BC C6 54 0F         [ 1]  475 	ld	a, 0x540f
      0092BF 6B 02            [ 1]  476 	ld	(0x02, sp), a
      0092C1 A6 01            [ 1]  477 	ld	a, #0x01
      0092C3 88               [ 1]  478 	push	a
      0092C4 7B 06            [ 1]  479 	ld	a, (0x06, sp)
      0092C6 27 05            [ 1]  480 	jreq	00129$
      0092C8                        481 00128$:
      0092C8 08 01            [ 1]  482 	sll	(1, sp)
      0092CA 4A               [ 1]  483 	dec	a
      0092CB 26 FB            [ 1]  484 	jrne	00128$
      0092CD                        485 00129$:
      0092CD 84               [ 1]  486 	pop	a
                                    487 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 413: if (NewState != DISABLE)
      0092CE 0D 06            [ 1]  488 	tnz	(0x06, sp)
      0092D0 27 07            [ 1]  489 	jreq	00102$
                                    490 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 415: ADC1->AWCRL |= (uint8_t)((uint8_t)1 << Channel);
      0092D2 1A 02            [ 1]  491 	or	a, (0x02, sp)
      0092D4 C7 54 0F         [ 1]  492 	ld	0x540f, a
      0092D7 20 30            [ 2]  493 	jra	00110$
      0092D9                        494 00102$:
                                    495 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 419: ADC1->AWCRL &= (uint8_t)~(uint8_t)((uint8_t)1 << Channel);
      0092D9 43               [ 1]  496 	cpl	a
      0092DA 14 02            [ 1]  497 	and	a, (0x02, sp)
      0092DC C7 54 0F         [ 1]  498 	ld	0x540f, a
      0092DF 20 28            [ 2]  499 	jra	00110$
      0092E1                        500 00108$:
                                    501 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 426: ADC1->AWCRH |= (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8));
      0092E1 C6 54 0E         [ 1]  502 	ld	a, 0x540e
      0092E4 6B 01            [ 1]  503 	ld	(0x01, sp), a
      0092E6 7B 05            [ 1]  504 	ld	a, (0x05, sp)
      0092E8 A0 08            [ 1]  505 	sub	a, #0x08
      0092EA 97               [ 1]  506 	ld	xl, a
      0092EB A6 01            [ 1]  507 	ld	a, #0x01
      0092ED 88               [ 1]  508 	push	a
      0092EE 9F               [ 1]  509 	ld	a, xl
      0092EF 4D               [ 1]  510 	tnz	a
      0092F0 27 05            [ 1]  511 	jreq	00132$
      0092F2                        512 00131$:
      0092F2 08 01            [ 1]  513 	sll	(1, sp)
      0092F4 4A               [ 1]  514 	dec	a
      0092F5 26 FB            [ 1]  515 	jrne	00131$
      0092F7                        516 00132$:
      0092F7 84               [ 1]  517 	pop	a
                                    518 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 424: if (NewState != DISABLE)
      0092F8 0D 06            [ 1]  519 	tnz	(0x06, sp)
      0092FA 27 07            [ 1]  520 	jreq	00105$
                                    521 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 426: ADC1->AWCRH |= (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8));
      0092FC 1A 01            [ 1]  522 	or	a, (0x01, sp)
      0092FE C7 54 0E         [ 1]  523 	ld	0x540e, a
      009301 20 06            [ 2]  524 	jra	00110$
      009303                        525 00105$:
                                    526 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 430: ADC1->AWCRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (uint8_t)(Channel - (uint8_t)8));
      009303 43               [ 1]  527 	cpl	a
      009304 14 01            [ 1]  528 	and	a, (0x01, sp)
      009306 C7 54 0E         [ 1]  529 	ld	0x540e, a
      009309                        530 00110$:
                                    531 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 433: }
      009309 5B 02            [ 2]  532 	addw	sp, #2
      00930B 81               [ 4]  533 	ret
                                    534 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 441: void ADC1_SetHighThreshold(uint16_t Threshold)
                                    535 ;	-----------------------------------------
                                    536 ;	 function ADC1_SetHighThreshold
                                    537 ;	-----------------------------------------
      00930C                        538 _ADC1_SetHighThreshold:
                                    539 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 443: ADC1->HTRH = (uint8_t)(Threshold >> (uint8_t)2);
      00930C 1E 03            [ 2]  540 	ldw	x, (0x03, sp)
      00930E 54               [ 2]  541 	srlw	x
      00930F 54               [ 2]  542 	srlw	x
      009310 9F               [ 1]  543 	ld	a, xl
      009311 C7 54 08         [ 1]  544 	ld	0x5408, a
                                    545 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 444: ADC1->HTRL = (uint8_t)Threshold;
      009314 7B 04            [ 1]  546 	ld	a, (0x04, sp)
      009316 C7 54 09         [ 1]  547 	ld	0x5409, a
                                    548 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 445: }
      009319 81               [ 4]  549 	ret
                                    550 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 453: void ADC1_SetLowThreshold(uint16_t Threshold)
                                    551 ;	-----------------------------------------
                                    552 ;	 function ADC1_SetLowThreshold
                                    553 ;	-----------------------------------------
      00931A                        554 _ADC1_SetLowThreshold:
                                    555 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 455: ADC1->LTRL = (uint8_t)Threshold;
      00931A 7B 04            [ 1]  556 	ld	a, (0x04, sp)
      00931C C7 54 0B         [ 1]  557 	ld	0x540b, a
                                    558 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 456: ADC1->LTRH = (uint8_t)(Threshold >> (uint8_t)2);
      00931F 1E 03            [ 2]  559 	ldw	x, (0x03, sp)
      009321 54               [ 2]  560 	srlw	x
      009322 54               [ 2]  561 	srlw	x
      009323 9F               [ 1]  562 	ld	a, xl
      009324 C7 54 0A         [ 1]  563 	ld	0x540a, a
                                    564 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 457: }
      009327 81               [ 4]  565 	ret
                                    566 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 466: uint16_t ADC1_GetBufferValue(uint8_t Buffer)
                                    567 ;	-----------------------------------------
                                    568 ;	 function ADC1_GetBufferValue
                                    569 ;	-----------------------------------------
      009328                        570 _ADC1_GetBufferValue:
      009328 52 0B            [ 2]  571 	sub	sp, #11
                                    572 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 474: if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
      00932A C6 54 02         [ 1]  573 	ld	a, 0x5402
      00932D 6B 0B            [ 1]  574 	ld	(0x0b, sp), a
                                    575 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 477: templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
      00932F 7B 0E            [ 1]  576 	ld	a, (0x0e, sp)
      009331 48               [ 1]  577 	sll	a
      009332 5F               [ 1]  578 	clrw	x
      009333 97               [ 1]  579 	ld	xl, a
      009334 51               [ 1]  580 	exgw	x, y
      009335 93               [ 1]  581 	ldw	x, y
      009336 1C 53 E1         [ 2]  582 	addw	x, #0x53e1
                                    583 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 479: temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
      009339 72 A9 53 E0      [ 2]  584 	addw	y, #0x53e0
                                    585 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 477: templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
                                    586 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 479: temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
                                    587 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 477: templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
      00933D F6               [ 1]  588 	ld	a, (x)
      00933E 97               [ 1]  589 	ld	xl, a
                                    590 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 479: temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
      00933F 90 F6            [ 1]  591 	ld	a, (y)
                                    592 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 474: if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
      009341 88               [ 1]  593 	push	a
      009342 7B 0C            [ 1]  594 	ld	a, (0x0c, sp)
      009344 A5 08            [ 1]  595 	bcp	a, #0x08
      009346 84               [ 1]  596 	pop	a
      009347 27 0E            [ 1]  597 	jreq	00102$
                                    598 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 477: templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
                                    599 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 479: temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
                                    600 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 481: temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
      009349 0F 08            [ 1]  601 	clr	(0x08, sp)
      00934B 0F 03            [ 1]  602 	clr	(0x03, sp)
      00934D 1A 03            [ 1]  603 	or	a, (0x03, sp)
      00934F 01               [ 1]  604 	rrwa	x
      009350 1A 08            [ 1]  605 	or	a, (0x08, sp)
      009352 97               [ 1]  606 	ld	xl, a
      009353 1F 01            [ 2]  607 	ldw	(0x01, sp), x
      009355 20 19            [ 2]  608 	jra	00103$
      009357                        609 00102$:
                                    610 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 486: temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
                                    611 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 488: templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
                                    612 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 490: temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)(temph << 8));
      009357 02               [ 1]  613 	rlwa	x
      009358 4F               [ 1]  614 	clr	a
      009359 01               [ 1]  615 	rrwa	x
      00935A 58               [ 2]  616 	sllw	x
      00935B 58               [ 2]  617 	sllw	x
      00935C 58               [ 2]  618 	sllw	x
      00935D 58               [ 2]  619 	sllw	x
      00935E 58               [ 2]  620 	sllw	x
      00935F 58               [ 2]  621 	sllw	x
      009360 1F 09            [ 2]  622 	ldw	(0x09, sp), x
      009362 97               [ 1]  623 	ld	xl, a
      009363 7B 0A            [ 1]  624 	ld	a, (0x0a, sp)
      009365 6B 06            [ 1]  625 	ld	(0x06, sp), a
      009367 9F               [ 1]  626 	ld	a, xl
      009368 1A 09            [ 1]  627 	or	a, (0x09, sp)
      00936A 6B 01            [ 1]  628 	ld	(0x01, sp), a
      00936C 7B 06            [ 1]  629 	ld	a, (0x06, sp)
      00936E 6B 02            [ 1]  630 	ld	(0x02, sp), a
      009370                        631 00103$:
                                    632 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 493: return ((uint16_t)temph);
      009370 1E 01            [ 2]  633 	ldw	x, (0x01, sp)
                                    634 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 494: }
      009372 5B 0B            [ 2]  635 	addw	sp, #11
      009374 81               [ 4]  636 	ret
                                    637 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 502: FlagStatus ADC1_GetAWDChannelStatus(ADC1_Channel_TypeDef Channel)
                                    638 ;	-----------------------------------------
                                    639 ;	 function ADC1_GetAWDChannelStatus
                                    640 ;	-----------------------------------------
      009375                        641 _ADC1_GetAWDChannelStatus:
      009375 52 02            [ 2]  642 	sub	sp, #2
                                    643 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 509: if (Channel < (uint8_t)8)
      009377 7B 05            [ 1]  644 	ld	a, (0x05, sp)
      009379 A1 08            [ 1]  645 	cp	a, #0x08
      00937B 24 16            [ 1]  646 	jrnc	00102$
                                    647 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 511: status = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << Channel));
      00937D C6 54 0D         [ 1]  648 	ld	a, 0x540d
      009380 88               [ 1]  649 	push	a
      009381 A6 01            [ 1]  650 	ld	a, #0x01
      009383 6B 03            [ 1]  651 	ld	(0x03, sp), a
      009385 7B 06            [ 1]  652 	ld	a, (0x06, sp)
      009387 27 05            [ 1]  653 	jreq	00113$
      009389                        654 00112$:
      009389 08 03            [ 1]  655 	sll	(0x03, sp)
      00938B 4A               [ 1]  656 	dec	a
      00938C 26 FB            [ 1]  657 	jrne	00112$
      00938E                        658 00113$:
      00938E 84               [ 1]  659 	pop	a
      00938F 14 02            [ 1]  660 	and	a, (0x02, sp)
      009391 20 19            [ 2]  661 	jra	00103$
      009393                        662 00102$:
                                    663 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 515: status = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8)));
      009393 C6 54 0C         [ 1]  664 	ld	a, 0x540c
      009396 97               [ 1]  665 	ld	xl, a
      009397 7B 05            [ 1]  666 	ld	a, (0x05, sp)
      009399 A0 08            [ 1]  667 	sub	a, #0x08
      00939B 88               [ 1]  668 	push	a
      00939C A6 01            [ 1]  669 	ld	a, #0x01
      00939E 6B 02            [ 1]  670 	ld	(0x02, sp), a
      0093A0 84               [ 1]  671 	pop	a
      0093A1 4D               [ 1]  672 	tnz	a
      0093A2 27 05            [ 1]  673 	jreq	00115$
      0093A4                        674 00114$:
      0093A4 08 01            [ 1]  675 	sll	(0x01, sp)
      0093A6 4A               [ 1]  676 	dec	a
      0093A7 26 FB            [ 1]  677 	jrne	00114$
      0093A9                        678 00115$:
      0093A9 9F               [ 1]  679 	ld	a, xl
      0093AA 14 01            [ 1]  680 	and	a, (0x01, sp)
      0093AC                        681 00103$:
                                    682 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 518: return ((FlagStatus)status);
                                    683 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 519: }
      0093AC 5B 02            [ 2]  684 	addw	sp, #2
      0093AE 81               [ 4]  685 	ret
                                    686 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 527: FlagStatus ADC1_GetFlagStatus(ADC1_Flag_TypeDef Flag)
                                    687 ;	-----------------------------------------
                                    688 ;	 function ADC1_GetFlagStatus
                                    689 ;	-----------------------------------------
      0093AF                        690 _ADC1_GetFlagStatus:
      0093AF 52 04            [ 2]  691 	sub	sp, #4
                                    692 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 535: if ((Flag & 0x0F) == 0x01)
      0093B1 7B 07            [ 1]  693 	ld	a, (0x07, sp)
      0093B3 6B 03            [ 1]  694 	ld	(0x03, sp), a
      0093B5 0F 02            [ 1]  695 	clr	(0x02, sp)
      0093B7 7B 03            [ 1]  696 	ld	a, (0x03, sp)
      0093B9 A4 0F            [ 1]  697 	and	a, #0x0f
      0093BB 97               [ 1]  698 	ld	xl, a
      0093BC 4F               [ 1]  699 	clr	a
      0093BD 95               [ 1]  700 	ld	xh, a
      0093BE 5A               [ 2]  701 	decw	x
      0093BF 26 07            [ 1]  702 	jrne	00108$
                                    703 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 538: flagstatus = (uint8_t)(ADC1->CR3 & ADC1_CR3_OVR);
      0093C1 C6 54 03         [ 1]  704 	ld	a, 0x5403
      0093C4 A4 40            [ 1]  705 	and	a, #0x40
      0093C6 20 49            [ 2]  706 	jra	00109$
      0093C8                        707 00108$:
                                    708 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 540: else if ((Flag & 0xF0) == 0x10)
      0093C8 7B 03            [ 1]  709 	ld	a, (0x03, sp)
      0093CA A4 F0            [ 1]  710 	and	a, #0xf0
      0093CC 97               [ 1]  711 	ld	xl, a
      0093CD 4F               [ 1]  712 	clr	a
      0093CE 95               [ 1]  713 	ld	xh, a
      0093CF A3 00 10         [ 2]  714 	cpw	x, #0x0010
      0093D2 26 38            [ 1]  715 	jrne	00105$
                                    716 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 543: temp = (uint8_t)(Flag & (uint8_t)0x0F);
      0093D4 7B 07            [ 1]  717 	ld	a, (0x07, sp)
      0093D6 A4 0F            [ 1]  718 	and	a, #0x0f
                                    719 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 544: if (temp < 8)
      0093D8 97               [ 1]  720 	ld	xl, a
      0093D9 A1 08            [ 1]  721 	cp	a, #0x08
      0093DB 24 16            [ 1]  722 	jrnc	00102$
                                    723 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 546: flagstatus = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
      0093DD C6 54 0D         [ 1]  724 	ld	a, 0x540d
      0093E0 6B 04            [ 1]  725 	ld	(0x04, sp), a
      0093E2 A6 01            [ 1]  726 	ld	a, #0x01
      0093E4 88               [ 1]  727 	push	a
      0093E5 9F               [ 1]  728 	ld	a, xl
      0093E6 4D               [ 1]  729 	tnz	a
      0093E7 27 05            [ 1]  730 	jreq	00135$
      0093E9                        731 00134$:
      0093E9 08 01            [ 1]  732 	sll	(1, sp)
      0093EB 4A               [ 1]  733 	dec	a
      0093EC 26 FB            [ 1]  734 	jrne	00134$
      0093EE                        735 00135$:
      0093EE 84               [ 1]  736 	pop	a
      0093EF 14 04            [ 1]  737 	and	a, (0x04, sp)
      0093F1 20 1E            [ 2]  738 	jra	00109$
      0093F3                        739 00102$:
                                    740 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 550: flagstatus = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
      0093F3 C6 54 0C         [ 1]  741 	ld	a, 0x540c
      0093F6 6B 01            [ 1]  742 	ld	(0x01, sp), a
      0093F8 1D 00 08         [ 2]  743 	subw	x, #8
      0093FB A6 01            [ 1]  744 	ld	a, #0x01
      0093FD 88               [ 1]  745 	push	a
      0093FE 9F               [ 1]  746 	ld	a, xl
      0093FF 4D               [ 1]  747 	tnz	a
      009400 27 05            [ 1]  748 	jreq	00137$
      009402                        749 00136$:
      009402 08 01            [ 1]  750 	sll	(1, sp)
      009404 4A               [ 1]  751 	dec	a
      009405 26 FB            [ 1]  752 	jrne	00136$
      009407                        753 00137$:
      009407 84               [ 1]  754 	pop	a
      009408 14 01            [ 1]  755 	and	a, (0x01, sp)
      00940A 20 05            [ 2]  756 	jra	00109$
      00940C                        757 00105$:
                                    758 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 555: flagstatus = (uint8_t)(ADC1->CSR & Flag);
      00940C C6 54 00         [ 1]  759 	ld	a, 0x5400
      00940F 14 07            [ 1]  760 	and	a, (0x07, sp)
      009411                        761 00109$:
                                    762 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 557: return ((FlagStatus)flagstatus);
                                    763 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 559: }
      009411 5B 04            [ 2]  764 	addw	sp, #4
      009413 81               [ 4]  765 	ret
                                    766 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 567: void ADC1_ClearFlag(ADC1_Flag_TypeDef Flag)
                                    767 ;	-----------------------------------------
                                    768 ;	 function ADC1_ClearFlag
                                    769 ;	-----------------------------------------
      009414                        770 _ADC1_ClearFlag:
      009414 52 05            [ 2]  771 	sub	sp, #5
                                    772 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 574: if ((Flag & 0x0F) == 0x01)
      009416 7B 08            [ 1]  773 	ld	a, (0x08, sp)
      009418 0F 01            [ 1]  774 	clr	(0x01, sp)
      00941A 88               [ 1]  775 	push	a
      00941B A4 0F            [ 1]  776 	and	a, #0x0f
      00941D 97               [ 1]  777 	ld	xl, a
      00941E 4F               [ 1]  778 	clr	a
      00941F 95               [ 1]  779 	ld	xh, a
      009420 84               [ 1]  780 	pop	a
      009421 5A               [ 2]  781 	decw	x
      009422 26 06            [ 1]  782 	jrne	00108$
                                    783 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 577: ADC1->CR3 &= (uint8_t)(~ADC1_CR3_OVR);
      009424 72 1D 54 03      [ 1]  784 	bres	21507, #6
      009428 20 57            [ 2]  785 	jra	00110$
      00942A                        786 00108$:
                                    787 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 579: else if ((Flag & 0xF0) == 0x10)
      00942A A4 F0            [ 1]  788 	and	a, #0xf0
      00942C 97               [ 1]  789 	ld	xl, a
      00942D 4F               [ 1]  790 	clr	a
      00942E 95               [ 1]  791 	ld	xh, a
      00942F A3 00 10         [ 2]  792 	cpw	x, #0x0010
      009432 26 40            [ 1]  793 	jrne	00105$
                                    794 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 582: temp = (uint8_t)(Flag & (uint8_t)0x0F);
      009434 7B 08            [ 1]  795 	ld	a, (0x08, sp)
      009436 A4 0F            [ 1]  796 	and	a, #0x0f
                                    797 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 583: if (temp < 8)
      009438 97               [ 1]  798 	ld	xl, a
      009439 A1 08            [ 1]  799 	cp	a, #0x08
      00943B 24 1A            [ 1]  800 	jrnc	00102$
                                    801 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 585: ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
      00943D C6 54 0D         [ 1]  802 	ld	a, 0x540d
      009440 6B 05            [ 1]  803 	ld	(0x05, sp), a
      009442 A6 01            [ 1]  804 	ld	a, #0x01
      009444 88               [ 1]  805 	push	a
      009445 9F               [ 1]  806 	ld	a, xl
      009446 4D               [ 1]  807 	tnz	a
      009447 27 05            [ 1]  808 	jreq	00135$
      009449                        809 00134$:
      009449 08 01            [ 1]  810 	sll	(1, sp)
      00944B 4A               [ 1]  811 	dec	a
      00944C 26 FB            [ 1]  812 	jrne	00134$
      00944E                        813 00135$:
      00944E 84               [ 1]  814 	pop	a
      00944F 43               [ 1]  815 	cpl	a
      009450 14 05            [ 1]  816 	and	a, (0x05, sp)
      009452 C7 54 0D         [ 1]  817 	ld	0x540d, a
      009455 20 2A            [ 2]  818 	jra	00110$
      009457                        819 00102$:
                                    820 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 589: ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
      009457 C6 54 0C         [ 1]  821 	ld	a, 0x540c
      00945A 6B 04            [ 1]  822 	ld	(0x04, sp), a
      00945C 1D 00 08         [ 2]  823 	subw	x, #8
      00945F A6 01            [ 1]  824 	ld	a, #0x01
      009461 88               [ 1]  825 	push	a
      009462 9F               [ 1]  826 	ld	a, xl
      009463 4D               [ 1]  827 	tnz	a
      009464 27 05            [ 1]  828 	jreq	00137$
      009466                        829 00136$:
      009466 08 01            [ 1]  830 	sll	(1, sp)
      009468 4A               [ 1]  831 	dec	a
      009469 26 FB            [ 1]  832 	jrne	00136$
      00946B                        833 00137$:
      00946B 84               [ 1]  834 	pop	a
      00946C 43               [ 1]  835 	cpl	a
      00946D 14 04            [ 1]  836 	and	a, (0x04, sp)
      00946F C7 54 0C         [ 1]  837 	ld	0x540c, a
      009472 20 0D            [ 2]  838 	jra	00110$
      009474                        839 00105$:
                                    840 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 594: ADC1->CSR &= (uint8_t) (~Flag);
      009474 C6 54 00         [ 1]  841 	ld	a, 0x5400
      009477 6B 03            [ 1]  842 	ld	(0x03, sp), a
      009479 7B 08            [ 1]  843 	ld	a, (0x08, sp)
      00947B 43               [ 1]  844 	cpl	a
      00947C 14 03            [ 1]  845 	and	a, (0x03, sp)
      00947E C7 54 00         [ 1]  846 	ld	0x5400, a
      009481                        847 00110$:
                                    848 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 596: }
      009481 5B 05            [ 2]  849 	addw	sp, #5
      009483 81               [ 4]  850 	ret
                                    851 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 616: ITStatus ADC1_GetITStatus(ADC1_IT_TypeDef ITPendingBit)
                                    852 ;	-----------------------------------------
                                    853 ;	 function ADC1_GetITStatus
                                    854 ;	-----------------------------------------
      009484                        855 _ADC1_GetITStatus:
      009484 52 03            [ 2]  856 	sub	sp, #3
                                    857 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 624: if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
      009486 7B 07            [ 1]  858 	ld	a, (0x07, sp)
      009488 A4 F0            [ 1]  859 	and	a, #0xf0
      00948A 97               [ 1]  860 	ld	xl, a
      00948B 4F               [ 1]  861 	clr	a
      00948C 95               [ 1]  862 	ld	xh, a
                                    863 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 627: temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
      00948D 7B 07            [ 1]  864 	ld	a, (0x07, sp)
                                    865 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 624: if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
      00948F A3 00 10         [ 2]  866 	cpw	x, #0x0010
      009492 26 36            [ 1]  867 	jrne	00105$
                                    868 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 627: temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
      009494 A4 0F            [ 1]  869 	and	a, #0x0f
                                    870 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 628: if (temp < 8)
      009496 97               [ 1]  871 	ld	xl, a
      009497 A1 08            [ 1]  872 	cp	a, #0x08
      009499 24 16            [ 1]  873 	jrnc	00102$
                                    874 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 630: itstatus = (ITStatus)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
      00949B C6 54 0D         [ 1]  875 	ld	a, 0x540d
      00949E 88               [ 1]  876 	push	a
      00949F A6 01            [ 1]  877 	ld	a, #0x01
      0094A1 6B 04            [ 1]  878 	ld	(0x04, sp), a
      0094A3 9F               [ 1]  879 	ld	a, xl
      0094A4 4D               [ 1]  880 	tnz	a
      0094A5 27 05            [ 1]  881 	jreq	00124$
      0094A7                        882 00123$:
      0094A7 08 04            [ 1]  883 	sll	(0x04, sp)
      0094A9 4A               [ 1]  884 	dec	a
      0094AA 26 FB            [ 1]  885 	jrne	00123$
      0094AC                        886 00124$:
      0094AC 84               [ 1]  887 	pop	a
      0094AD 14 03            [ 1]  888 	and	a, (0x03, sp)
      0094AF 20 23            [ 2]  889 	jra	00106$
      0094B1                        890 00102$:
                                    891 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 634: itstatus = (ITStatus)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
      0094B1 C6 54 0C         [ 1]  892 	ld	a, 0x540c
      0094B4 6B 02            [ 1]  893 	ld	(0x02, sp), a
      0094B6 1D 00 08         [ 2]  894 	subw	x, #8
      0094B9 A6 01            [ 1]  895 	ld	a, #0x01
      0094BB 88               [ 1]  896 	push	a
      0094BC 9F               [ 1]  897 	ld	a, xl
      0094BD 4D               [ 1]  898 	tnz	a
      0094BE 27 05            [ 1]  899 	jreq	00126$
      0094C0                        900 00125$:
      0094C0 08 01            [ 1]  901 	sll	(1, sp)
      0094C2 4A               [ 1]  902 	dec	a
      0094C3 26 FB            [ 1]  903 	jrne	00125$
      0094C5                        904 00126$:
      0094C5 84               [ 1]  905 	pop	a
      0094C6 14 02            [ 1]  906 	and	a, (0x02, sp)
      0094C8 20 0A            [ 2]  907 	jra	00106$
      0094CA                        908 00105$:
                                    909 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 639: itstatus = (ITStatus)(ADC1->CSR & (uint8_t)ITPendingBit);
      0094CA AE 54 00         [ 2]  910 	ldw	x, #0x5400
      0094CD 88               [ 1]  911 	push	a
      0094CE F6               [ 1]  912 	ld	a, (x)
      0094CF 6B 02            [ 1]  913 	ld	(0x02, sp), a
      0094D1 84               [ 1]  914 	pop	a
      0094D2 14 01            [ 1]  915 	and	a, (0x01, sp)
      0094D4                        916 00106$:
                                    917 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 641: return ((ITStatus)itstatus);
                                    918 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 642: }
      0094D4 5B 03            [ 2]  919 	addw	sp, #3
      0094D6 81               [ 4]  920 	ret
                                    921 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 662: void ADC1_ClearITPendingBit(ADC1_IT_TypeDef ITPendingBit)
                                    922 ;	-----------------------------------------
                                    923 ;	 function ADC1_ClearITPendingBit
                                    924 ;	-----------------------------------------
      0094D7                        925 _ADC1_ClearITPendingBit:
      0094D7 52 02            [ 2]  926 	sub	sp, #2
                                    927 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 669: if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
      0094D9 7B 06            [ 1]  928 	ld	a, (0x06, sp)
      0094DB A4 F0            [ 1]  929 	and	a, #0xf0
      0094DD 97               [ 1]  930 	ld	xl, a
      0094DE 4F               [ 1]  931 	clr	a
      0094DF 95               [ 1]  932 	ld	xh, a
      0094E0 A3 00 10         [ 2]  933 	cpw	x, #0x0010
      0094E3 26 40            [ 1]  934 	jrne	00105$
                                    935 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 672: temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
      0094E5 7B 06            [ 1]  936 	ld	a, (0x06, sp)
      0094E7 A4 0F            [ 1]  937 	and	a, #0x0f
                                    938 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 673: if (temp < 8)
      0094E9 97               [ 1]  939 	ld	xl, a
      0094EA A1 08            [ 1]  940 	cp	a, #0x08
      0094EC 24 1A            [ 1]  941 	jrnc	00102$
                                    942 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 675: ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
      0094EE C6 54 0D         [ 1]  943 	ld	a, 0x540d
      0094F1 6B 02            [ 1]  944 	ld	(0x02, sp), a
      0094F3 A6 01            [ 1]  945 	ld	a, #0x01
      0094F5 88               [ 1]  946 	push	a
      0094F6 9F               [ 1]  947 	ld	a, xl
      0094F7 4D               [ 1]  948 	tnz	a
      0094F8 27 05            [ 1]  949 	jreq	00124$
      0094FA                        950 00123$:
      0094FA 08 01            [ 1]  951 	sll	(1, sp)
      0094FC 4A               [ 1]  952 	dec	a
      0094FD 26 FB            [ 1]  953 	jrne	00123$
      0094FF                        954 00124$:
      0094FF 84               [ 1]  955 	pop	a
      009500 43               [ 1]  956 	cpl	a
      009501 14 02            [ 1]  957 	and	a, (0x02, sp)
      009503 C7 54 0D         [ 1]  958 	ld	0x540d, a
      009506 20 2A            [ 2]  959 	jra	00107$
      009508                        960 00102$:
                                    961 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 679: ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
      009508 C6 54 0C         [ 1]  962 	ld	a, 0x540c
      00950B 6B 01            [ 1]  963 	ld	(0x01, sp), a
      00950D 1D 00 08         [ 2]  964 	subw	x, #8
      009510 A6 01            [ 1]  965 	ld	a, #0x01
      009512 88               [ 1]  966 	push	a
      009513 9F               [ 1]  967 	ld	a, xl
      009514 4D               [ 1]  968 	tnz	a
      009515 27 05            [ 1]  969 	jreq	00126$
      009517                        970 00125$:
      009517 08 01            [ 1]  971 	sll	(1, sp)
      009519 4A               [ 1]  972 	dec	a
      00951A 26 FB            [ 1]  973 	jrne	00125$
      00951C                        974 00126$:
      00951C 84               [ 1]  975 	pop	a
      00951D 43               [ 1]  976 	cpl	a
      00951E 14 01            [ 1]  977 	and	a, (0x01, sp)
      009520 C7 54 0C         [ 1]  978 	ld	0x540c, a
      009523 20 0D            [ 2]  979 	jra	00107$
      009525                        980 00105$:
                                    981 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 684: ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ITPendingBit);
      009525 C6 54 00         [ 1]  982 	ld	a, 0x5400
      009528 1E 05            [ 2]  983 	ldw	x, (0x05, sp)
      00952A 53               [ 2]  984 	cplw	x
      00952B 89               [ 2]  985 	pushw	x
      00952C 14 02            [ 1]  986 	and	a, (2, sp)
      00952E 85               [ 2]  987 	popw	x
      00952F C7 54 00         [ 1]  988 	ld	0x5400, a
      009532                        989 00107$:
                                    990 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 686: }
      009532 5B 02            [ 2]  991 	addw	sp, #2
      009534 81               [ 4]  992 	ret
                                    993 	.area CODE
                                    994 	.area CONST
                                    995 	.area INITIALIZER
                                    996 	.area CABS (ABS)
