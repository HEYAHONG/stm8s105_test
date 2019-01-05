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
      00910E                         73 _ADC1_DeInit:
                                     74 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 54: ADC1->CSR  = ADC1_CSR_RESET_VALUE;
      00910E 35 00 54 00      [ 1]   75 	mov	0x5400+0, #0x00
                                     76 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 55: ADC1->CR1  = ADC1_CR1_RESET_VALUE;
      009112 35 00 54 01      [ 1]   77 	mov	0x5401+0, #0x00
                                     78 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 56: ADC1->CR2  = ADC1_CR2_RESET_VALUE;
      009116 35 00 54 02      [ 1]   79 	mov	0x5402+0, #0x00
                                     80 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 57: ADC1->CR3  = ADC1_CR3_RESET_VALUE;
      00911A 35 00 54 03      [ 1]   81 	mov	0x5403+0, #0x00
                                     82 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 58: ADC1->TDRH = ADC1_TDRH_RESET_VALUE;
      00911E 35 00 54 06      [ 1]   83 	mov	0x5406+0, #0x00
                                     84 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 59: ADC1->TDRL = ADC1_TDRL_RESET_VALUE;
      009122 35 00 54 07      [ 1]   85 	mov	0x5407+0, #0x00
                                     86 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 60: ADC1->HTRH = ADC1_HTRH_RESET_VALUE;
      009126 35 FF 54 08      [ 1]   87 	mov	0x5408+0, #0xff
                                     88 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 61: ADC1->HTRL = ADC1_HTRL_RESET_VALUE;
      00912A 35 03 54 09      [ 1]   89 	mov	0x5409+0, #0x03
                                     90 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 62: ADC1->LTRH = ADC1_LTRH_RESET_VALUE;
      00912E 35 00 54 0A      [ 1]   91 	mov	0x540a+0, #0x00
                                     92 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 63: ADC1->LTRL = ADC1_LTRL_RESET_VALUE;
      009132 35 00 54 0B      [ 1]   93 	mov	0x540b+0, #0x00
                                     94 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 64: ADC1->AWCRH = ADC1_AWCRH_RESET_VALUE;
      009136 35 00 54 0E      [ 1]   95 	mov	0x540e+0, #0x00
                                     96 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 65: ADC1->AWCRL = ADC1_AWCRL_RESET_VALUE;
      00913A 35 00 54 0F      [ 1]   97 	mov	0x540f+0, #0x00
                                     98 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 66: }
      00913E 81               [ 4]   99 	ret
                                    100 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 88: void ADC1_Init(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_PresSel_TypeDef ADC1_PrescalerSelection, ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState ADC1_ExtTriggerState, ADC1_Align_TypeDef ADC1_Align, ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState ADC1_SchmittTriggerState)
                                    101 ;	-----------------------------------------
                                    102 ;	 function ADC1_Init
                                    103 ;	-----------------------------------------
      00913F                        104 _ADC1_Init:
                                    105 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 103: ADC1_ConversionConfig(ADC1_ConversionMode, ADC1_Channel, ADC1_Align);
      00913F 7B 08            [ 1]  106 	ld	a, (0x08, sp)
      009141 88               [ 1]  107 	push	a
      009142 7B 05            [ 1]  108 	ld	a, (0x05, sp)
      009144 88               [ 1]  109 	push	a
      009145 7B 05            [ 1]  110 	ld	a, (0x05, sp)
      009147 88               [ 1]  111 	push	a
      009148 CD 92 55         [ 4]  112 	call	_ADC1_ConversionConfig
      00914B 5B 03            [ 2]  113 	addw	sp, #3
                                    114 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 105: ADC1_PrescalerConfig(ADC1_PrescalerSelection);
      00914D 7B 05            [ 1]  115 	ld	a, (0x05, sp)
      00914F 88               [ 1]  116 	push	a
      009150 CD 91 C6         [ 4]  117 	call	_ADC1_PrescalerConfig
      009153 84               [ 1]  118 	pop	a
                                    119 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 110: ADC1_ExternalTriggerConfig(ADC1_ExtTrigger, ADC1_ExtTriggerState);
      009154 7B 07            [ 1]  120 	ld	a, (0x07, sp)
      009156 88               [ 1]  121 	push	a
      009157 7B 07            [ 1]  122 	ld	a, (0x07, sp)
      009159 88               [ 1]  123 	push	a
      00915A CD 92 88         [ 4]  124 	call	_ADC1_ExternalTriggerConfig
      00915D 5B 02            [ 2]  125 	addw	sp, #2
                                    126 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 115: ADC1_SchmittTriggerConfig(ADC1_SchmittTriggerChannel, ADC1_SchmittTriggerState);
      00915F 7B 0A            [ 1]  127 	ld	a, (0x0a, sp)
      009161 88               [ 1]  128 	push	a
      009162 7B 0A            [ 1]  129 	ld	a, (0x0a, sp)
      009164 88               [ 1]  130 	push	a
      009165 CD 91 D7         [ 4]  131 	call	_ADC1_SchmittTriggerConfig
      009168 5B 02            [ 2]  132 	addw	sp, #2
                                    133 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 118: ADC1->CR1 |= ADC1_CR1_ADON;
      00916A 72 10 54 01      [ 1]  134 	bset	21505, #0
                                    135 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 119: }
      00916E 81               [ 4]  136 	ret
                                    137 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 126: void ADC1_Cmd(FunctionalState NewState)
                                    138 ;	-----------------------------------------
                                    139 ;	 function ADC1_Cmd
                                    140 ;	-----------------------------------------
      00916F                        141 _ADC1_Cmd:
                                    142 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 133: ADC1->CR1 |= ADC1_CR1_ADON;
      00916F C6 54 01         [ 1]  143 	ld	a, 0x5401
                                    144 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 131: if (NewState != DISABLE)
      009172 0D 03            [ 1]  145 	tnz	(0x03, sp)
      009174 27 06            [ 1]  146 	jreq	00102$
                                    147 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 133: ADC1->CR1 |= ADC1_CR1_ADON;
      009176 AA 01            [ 1]  148 	or	a, #0x01
      009178 C7 54 01         [ 1]  149 	ld	0x5401, a
      00917B 81               [ 4]  150 	ret
      00917C                        151 00102$:
                                    152 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 137: ADC1->CR1 &= (uint8_t)(~ADC1_CR1_ADON);
      00917C A4 FE            [ 1]  153 	and	a, #0xfe
      00917E C7 54 01         [ 1]  154 	ld	0x5401, a
                                    155 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 139: }
      009181 81               [ 4]  156 	ret
                                    157 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 146: void ADC1_ScanModeCmd(FunctionalState NewState)
                                    158 ;	-----------------------------------------
                                    159 ;	 function ADC1_ScanModeCmd
                                    160 ;	-----------------------------------------
      009182                        161 _ADC1_ScanModeCmd:
                                    162 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 153: ADC1->CR2 |= ADC1_CR2_SCAN;
      009182 C6 54 02         [ 1]  163 	ld	a, 0x5402
                                    164 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 151: if (NewState != DISABLE)
      009185 0D 03            [ 1]  165 	tnz	(0x03, sp)
      009187 27 06            [ 1]  166 	jreq	00102$
                                    167 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 153: ADC1->CR2 |= ADC1_CR2_SCAN;
      009189 AA 02            [ 1]  168 	or	a, #0x02
      00918B C7 54 02         [ 1]  169 	ld	0x5402, a
      00918E 81               [ 4]  170 	ret
      00918F                        171 00102$:
                                    172 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 157: ADC1->CR2 &= (uint8_t)(~ADC1_CR2_SCAN);
      00918F A4 FD            [ 1]  173 	and	a, #0xfd
      009191 C7 54 02         [ 1]  174 	ld	0x5402, a
                                    175 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 159: }
      009194 81               [ 4]  176 	ret
                                    177 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 166: void ADC1_DataBufferCmd(FunctionalState NewState)
                                    178 ;	-----------------------------------------
                                    179 ;	 function ADC1_DataBufferCmd
                                    180 ;	-----------------------------------------
      009195                        181 _ADC1_DataBufferCmd:
                                    182 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 173: ADC1->CR3 |= ADC1_CR3_DBUF;
      009195 C6 54 03         [ 1]  183 	ld	a, 0x5403
                                    184 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 171: if (NewState != DISABLE)
      009198 0D 03            [ 1]  185 	tnz	(0x03, sp)
      00919A 27 06            [ 1]  186 	jreq	00102$
                                    187 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 173: ADC1->CR3 |= ADC1_CR3_DBUF;
      00919C AA 80            [ 1]  188 	or	a, #0x80
      00919E C7 54 03         [ 1]  189 	ld	0x5403, a
      0091A1 81               [ 4]  190 	ret
      0091A2                        191 00102$:
                                    192 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 177: ADC1->CR3 &= (uint8_t)(~ADC1_CR3_DBUF);
      0091A2 A4 7F            [ 1]  193 	and	a, #0x7f
      0091A4 C7 54 03         [ 1]  194 	ld	0x5403, a
                                    195 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 179: }
      0091A7 81               [ 4]  196 	ret
                                    197 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 190: void ADC1_ITConfig(ADC1_IT_TypeDef ADC1_IT, FunctionalState NewState)
                                    198 ;	-----------------------------------------
                                    199 ;	 function ADC1_ITConfig
                                    200 ;	-----------------------------------------
      0091A8                        201 _ADC1_ITConfig:
      0091A8 88               [ 1]  202 	push	a
                                    203 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 199: ADC1->CSR |= (uint8_t)ADC1_IT;
      0091A9 C6 54 00         [ 1]  204 	ld	a, 0x5400
      0091AC 6B 01            [ 1]  205 	ld	(0x01, sp), a
                                    206 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 196: if (NewState != DISABLE)
      0091AE 0D 06            [ 1]  207 	tnz	(0x06, sp)
      0091B0 27 09            [ 1]  208 	jreq	00102$
                                    209 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 199: ADC1->CSR |= (uint8_t)ADC1_IT;
      0091B2 7B 05            [ 1]  210 	ld	a, (0x05, sp)
      0091B4 1A 01            [ 1]  211 	or	a, (0x01, sp)
      0091B6 C7 54 00         [ 1]  212 	ld	0x5400, a
      0091B9 20 09            [ 2]  213 	jra	00104$
      0091BB                        214 00102$:
                                    215 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 204: ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ADC1_IT);
      0091BB 1E 04            [ 2]  216 	ldw	x, (0x04, sp)
      0091BD 53               [ 2]  217 	cplw	x
      0091BE 9F               [ 1]  218 	ld	a, xl
      0091BF 14 01            [ 1]  219 	and	a, (0x01, sp)
      0091C1 C7 54 00         [ 1]  220 	ld	0x5400, a
      0091C4                        221 00104$:
                                    222 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 206: }
      0091C4 84               [ 1]  223 	pop	a
      0091C5 81               [ 4]  224 	ret
                                    225 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 214: void ADC1_PrescalerConfig(ADC1_PresSel_TypeDef ADC1_Prescaler)
                                    226 ;	-----------------------------------------
                                    227 ;	 function ADC1_PrescalerConfig
                                    228 ;	-----------------------------------------
      0091C6                        229 _ADC1_PrescalerConfig:
                                    230 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 220: ADC1->CR1 &= (uint8_t)(~ADC1_CR1_SPSEL);
      0091C6 C6 54 01         [ 1]  231 	ld	a, 0x5401
      0091C9 A4 8F            [ 1]  232 	and	a, #0x8f
      0091CB C7 54 01         [ 1]  233 	ld	0x5401, a
                                    234 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 222: ADC1->CR1 |= (uint8_t)(ADC1_Prescaler);
      0091CE C6 54 01         [ 1]  235 	ld	a, 0x5401
      0091D1 1A 03            [ 1]  236 	or	a, (0x03, sp)
      0091D3 C7 54 01         [ 1]  237 	ld	0x5401, a
                                    238 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 223: }
      0091D6 81               [ 4]  239 	ret
                                    240 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 233: void ADC1_SchmittTriggerConfig(ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState NewState)
                                    241 ;	-----------------------------------------
                                    242 ;	 function ADC1_SchmittTriggerConfig
                                    243 ;	-----------------------------------------
      0091D7                        244 _ADC1_SchmittTriggerConfig:
      0091D7 52 02            [ 2]  245 	sub	sp, #2
                                    246 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 239: if (ADC1_SchmittTriggerChannel == ADC1_SCHMITTTRIG_ALL)
      0091D9 7B 05            [ 1]  247 	ld	a, (0x05, sp)
      0091DB 4C               [ 1]  248 	inc	a
      0091DC 26 21            [ 1]  249 	jrne	00114$
                                    250 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 243: ADC1->TDRL &= (uint8_t)0x0;
      0091DE C6 54 07         [ 1]  251 	ld	a, 0x5407
                                    252 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 241: if (NewState != DISABLE)
      0091E1 0D 06            [ 1]  253 	tnz	(0x06, sp)
      0091E3 27 0D            [ 1]  254 	jreq	00102$
                                    255 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 243: ADC1->TDRL &= (uint8_t)0x0;
      0091E5 35 00 54 07      [ 1]  256 	mov	0x5407+0, #0x00
                                    257 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 244: ADC1->TDRH &= (uint8_t)0x0;
      0091E9 C6 54 06         [ 1]  258 	ld	a, 0x5406
      0091EC 35 00 54 06      [ 1]  259 	mov	0x5406+0, #0x00
      0091F0 20 60            [ 2]  260 	jra	00116$
      0091F2                        261 00102$:
                                    262 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 248: ADC1->TDRL |= (uint8_t)0xFF;
      0091F2 35 FF 54 07      [ 1]  263 	mov	0x5407+0, #0xff
                                    264 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 249: ADC1->TDRH |= (uint8_t)0xFF;
      0091F6 C6 54 06         [ 1]  265 	ld	a, 0x5406
      0091F9 35 FF 54 06      [ 1]  266 	mov	0x5406+0, #0xff
      0091FD 20 53            [ 2]  267 	jra	00116$
      0091FF                        268 00114$:
                                    269 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 252: else if (ADC1_SchmittTriggerChannel < ADC1_SCHMITTTRIG_CHANNEL8)
      0091FF 7B 05            [ 1]  270 	ld	a, (0x05, sp)
      009201 A1 08            [ 1]  271 	cp	a, #0x08
      009203 24 25            [ 1]  272 	jrnc	00111$
                                    273 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 243: ADC1->TDRL &= (uint8_t)0x0;
      009205 C6 54 07         [ 1]  274 	ld	a, 0x5407
      009208 6B 01            [ 1]  275 	ld	(0x01, sp), a
                                    276 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 256: ADC1->TDRL &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel));
      00920A A6 01            [ 1]  277 	ld	a, #0x01
      00920C 88               [ 1]  278 	push	a
      00920D 7B 06            [ 1]  279 	ld	a, (0x06, sp)
      00920F 27 05            [ 1]  280 	jreq	00149$
      009211                        281 00148$:
      009211 08 01            [ 1]  282 	sll	(1, sp)
      009213 4A               [ 1]  283 	dec	a
      009214 26 FB            [ 1]  284 	jrne	00148$
      009216                        285 00149$:
      009216 84               [ 1]  286 	pop	a
                                    287 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 254: if (NewState != DISABLE)
      009217 0D 06            [ 1]  288 	tnz	(0x06, sp)
      009219 27 08            [ 1]  289 	jreq	00105$
                                    290 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 256: ADC1->TDRL &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel));
      00921B 43               [ 1]  291 	cpl	a
      00921C 14 01            [ 1]  292 	and	a, (0x01, sp)
      00921E C7 54 07         [ 1]  293 	ld	0x5407, a
      009221 20 2F            [ 2]  294 	jra	00116$
      009223                        295 00105$:
                                    296 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 260: ADC1->TDRL |= (uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel);
      009223 1A 01            [ 1]  297 	or	a, (0x01, sp)
      009225 C7 54 07         [ 1]  298 	ld	0x5407, a
      009228 20 28            [ 2]  299 	jra	00116$
      00922A                        300 00111$:
                                    301 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 244: ADC1->TDRH &= (uint8_t)0x0;
      00922A C6 54 06         [ 1]  302 	ld	a, 0x5406
      00922D 6B 02            [ 1]  303 	ld	(0x02, sp), a
                                    304 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 267: ADC1->TDRH &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8)));
      00922F 7B 05            [ 1]  305 	ld	a, (0x05, sp)
      009231 A0 08            [ 1]  306 	sub	a, #0x08
      009233 97               [ 1]  307 	ld	xl, a
      009234 A6 01            [ 1]  308 	ld	a, #0x01
      009236 88               [ 1]  309 	push	a
      009237 9F               [ 1]  310 	ld	a, xl
      009238 4D               [ 1]  311 	tnz	a
      009239 27 05            [ 1]  312 	jreq	00152$
      00923B                        313 00151$:
      00923B 08 01            [ 1]  314 	sll	(1, sp)
      00923D 4A               [ 1]  315 	dec	a
      00923E 26 FB            [ 1]  316 	jrne	00151$
      009240                        317 00152$:
      009240 84               [ 1]  318 	pop	a
                                    319 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 265: if (NewState != DISABLE)
      009241 0D 06            [ 1]  320 	tnz	(0x06, sp)
      009243 27 08            [ 1]  321 	jreq	00108$
                                    322 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 267: ADC1->TDRH &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8)));
      009245 43               [ 1]  323 	cpl	a
      009246 14 02            [ 1]  324 	and	a, (0x02, sp)
      009248 C7 54 06         [ 1]  325 	ld	0x5406, a
      00924B 20 05            [ 2]  326 	jra	00116$
      00924D                        327 00108$:
                                    328 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 271: ADC1->TDRH |= (uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8));
      00924D 1A 02            [ 1]  329 	or	a, (0x02, sp)
      00924F C7 54 06         [ 1]  330 	ld	0x5406, a
      009252                        331 00116$:
                                    332 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 274: }
      009252 5B 02            [ 2]  333 	addw	sp, #2
      009254 81               [ 4]  334 	ret
                                    335 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 286: void ADC1_ConversionConfig(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_Align_TypeDef ADC1_Align)
                                    336 ;	-----------------------------------------
                                    337 ;	 function ADC1_ConversionConfig
                                    338 ;	-----------------------------------------
      009255                        339 _ADC1_ConversionConfig:
                                    340 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 294: ADC1->CR2 &= (uint8_t)(~ADC1_CR2_ALIGN);
      009255 72 17 54 02      [ 1]  341 	bres	21506, #3
                                    342 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 296: ADC1->CR2 |= (uint8_t)(ADC1_Align);
      009259 C6 54 02         [ 1]  343 	ld	a, 0x5402
      00925C 1A 05            [ 1]  344 	or	a, (0x05, sp)
      00925E C7 54 02         [ 1]  345 	ld	0x5402, a
                                    346 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 301: ADC1->CR1 |= ADC1_CR1_CONT;
      009261 C6 54 01         [ 1]  347 	ld	a, 0x5401
                                    348 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 298: if (ADC1_ConversionMode == ADC1_CONVERSIONMODE_CONTINUOUS)
      009264 88               [ 1]  349 	push	a
      009265 7B 04            [ 1]  350 	ld	a, (0x04, sp)
      009267 4A               [ 1]  351 	dec	a
      009268 84               [ 1]  352 	pop	a
      009269 26 07            [ 1]  353 	jrne	00102$
                                    354 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 301: ADC1->CR1 |= ADC1_CR1_CONT;
      00926B AA 02            [ 1]  355 	or	a, #0x02
      00926D C7 54 01         [ 1]  356 	ld	0x5401, a
      009270 20 05            [ 2]  357 	jra	00103$
      009272                        358 00102$:
                                    359 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 306: ADC1->CR1 &= (uint8_t)(~ADC1_CR1_CONT);
      009272 A4 FD            [ 1]  360 	and	a, #0xfd
      009274 C7 54 01         [ 1]  361 	ld	0x5401, a
      009277                        362 00103$:
                                    363 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 310: ADC1->CSR &= (uint8_t)(~ADC1_CSR_CH);
      009277 C6 54 00         [ 1]  364 	ld	a, 0x5400
      00927A A4 F0            [ 1]  365 	and	a, #0xf0
      00927C C7 54 00         [ 1]  366 	ld	0x5400, a
                                    367 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 312: ADC1->CSR |= (uint8_t)(ADC1_Channel);
      00927F C6 54 00         [ 1]  368 	ld	a, 0x5400
      009282 1A 04            [ 1]  369 	or	a, (0x04, sp)
      009284 C7 54 00         [ 1]  370 	ld	0x5400, a
                                    371 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 313: }
      009287 81               [ 4]  372 	ret
                                    373 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 325: void ADC1_ExternalTriggerConfig(ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState NewState)
                                    374 ;	-----------------------------------------
                                    375 ;	 function ADC1_ExternalTriggerConfig
                                    376 ;	-----------------------------------------
      009288                        377 _ADC1_ExternalTriggerConfig:
                                    378 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 332: ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTSEL);
      009288 C6 54 02         [ 1]  379 	ld	a, 0x5402
      00928B A4 CF            [ 1]  380 	and	a, #0xcf
      00928D C7 54 02         [ 1]  381 	ld	0x5402, a
      009290 C6 54 02         [ 1]  382 	ld	a, 0x5402
                                    383 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 334: if (NewState != DISABLE)
      009293 0D 04            [ 1]  384 	tnz	(0x04, sp)
      009295 27 07            [ 1]  385 	jreq	00102$
                                    386 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 337: ADC1->CR2 |= (uint8_t)(ADC1_CR2_EXTTRIG);
      009297 AA 40            [ 1]  387 	or	a, #0x40
      009299 C7 54 02         [ 1]  388 	ld	0x5402, a
      00929C 20 05            [ 2]  389 	jra	00103$
      00929E                        390 00102$:
                                    391 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 342: ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTTRIG);
      00929E A4 BF            [ 1]  392 	and	a, #0xbf
      0092A0 C7 54 02         [ 1]  393 	ld	0x5402, a
      0092A3                        394 00103$:
                                    395 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 346: ADC1->CR2 |= (uint8_t)(ADC1_ExtTrigger);
      0092A3 C6 54 02         [ 1]  396 	ld	a, 0x5402
      0092A6 1A 03            [ 1]  397 	or	a, (0x03, sp)
      0092A8 C7 54 02         [ 1]  398 	ld	0x5402, a
                                    399 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 347: }
      0092AB 81               [ 4]  400 	ret
                                    401 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 358: void ADC1_StartConversion(void)
                                    402 ;	-----------------------------------------
                                    403 ;	 function ADC1_StartConversion
                                    404 ;	-----------------------------------------
      0092AC                        405 _ADC1_StartConversion:
                                    406 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 360: ADC1->CR1 |= ADC1_CR1_ADON;
      0092AC 72 10 54 01      [ 1]  407 	bset	21505, #0
                                    408 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 361: }
      0092B0 81               [ 4]  409 	ret
                                    410 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 370: uint16_t ADC1_GetConversionValue(void)
                                    411 ;	-----------------------------------------
                                    412 ;	 function ADC1_GetConversionValue
                                    413 ;	-----------------------------------------
      0092B1                        414 _ADC1_GetConversionValue:
      0092B1 52 08            [ 2]  415 	sub	sp, #8
                                    416 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 375: if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
      0092B3 C6 54 02         [ 1]  417 	ld	a, 0x5402
      0092B6 A5 08            [ 1]  418 	bcp	a, #0x08
      0092B8 27 15            [ 1]  419 	jreq	00102$
                                    420 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 378: templ = ADC1->DRL;
      0092BA C6 54 05         [ 1]  421 	ld	a, 0x5405
      0092BD 97               [ 1]  422 	ld	xl, a
                                    423 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 380: temph = ADC1->DRH;
      0092BE C6 54 04         [ 1]  424 	ld	a, 0x5404
                                    425 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 382: temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
      0092C1 0F 04            [ 1]  426 	clr	(0x04, sp)
      0092C3 0F 01            [ 1]  427 	clr	(0x01, sp)
      0092C5 1A 01            [ 1]  428 	or	a, (0x01, sp)
      0092C7 01               [ 1]  429 	rrwa	x
      0092C8 1A 04            [ 1]  430 	or	a, (0x04, sp)
      0092CA 97               [ 1]  431 	ld	xl, a
      0092CB 1F 07            [ 2]  432 	ldw	(0x07, sp), x
      0092CD 20 1D            [ 2]  433 	jra	00103$
      0092CF                        434 00102$:
                                    435 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 387: temph = ADC1->DRH;
      0092CF C6 54 04         [ 1]  436 	ld	a, 0x5404
      0092D2 5F               [ 1]  437 	clrw	x
      0092D3 97               [ 1]  438 	ld	xl, a
      0092D4 51               [ 1]  439 	exgw	x, y
                                    440 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 389: templ = ADC1->DRL;
      0092D5 C6 54 05         [ 1]  441 	ld	a, 0x5405
                                    442 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 391: temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)((uint16_t)temph << 8));
      0092D8 5F               [ 1]  443 	clrw	x
      0092D9 97               [ 1]  444 	ld	xl, a
      0092DA 58               [ 2]  445 	sllw	x
      0092DB 58               [ 2]  446 	sllw	x
      0092DC 58               [ 2]  447 	sllw	x
      0092DD 58               [ 2]  448 	sllw	x
      0092DE 58               [ 2]  449 	sllw	x
      0092DF 58               [ 2]  450 	sllw	x
      0092E0 1F 05            [ 2]  451 	ldw	(0x05, sp), x
      0092E2 7B 06            [ 1]  452 	ld	a, (0x06, sp)
      0092E4 97               [ 1]  453 	ld	xl, a
      0092E5 90 9F            [ 1]  454 	ld	a, yl
      0092E7 1A 05            [ 1]  455 	or	a, (0x05, sp)
      0092E9 95               [ 1]  456 	ld	xh, a
      0092EA 1F 07            [ 2]  457 	ldw	(0x07, sp), x
      0092EC                        458 00103$:
                                    459 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 394: return ((uint16_t)temph);
      0092EC 1E 07            [ 2]  460 	ldw	x, (0x07, sp)
                                    461 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 395: }
      0092EE 5B 08            [ 2]  462 	addw	sp, #8
      0092F0 81               [ 4]  463 	ret
                                    464 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 405: void ADC1_AWDChannelConfig(ADC1_Channel_TypeDef Channel, FunctionalState NewState)
                                    465 ;	-----------------------------------------
                                    466 ;	 function ADC1_AWDChannelConfig
                                    467 ;	-----------------------------------------
      0092F1                        468 _ADC1_AWDChannelConfig:
      0092F1 52 02            [ 2]  469 	sub	sp, #2
                                    470 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 411: if (Channel < (uint8_t)8)
      0092F3 7B 05            [ 1]  471 	ld	a, (0x05, sp)
      0092F5 A1 08            [ 1]  472 	cp	a, #0x08
      0092F7 24 25            [ 1]  473 	jrnc	00108$
                                    474 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 415: ADC1->AWCRL |= (uint8_t)((uint8_t)1 << Channel);
      0092F9 C6 54 0F         [ 1]  475 	ld	a, 0x540f
      0092FC 6B 02            [ 1]  476 	ld	(0x02, sp), a
      0092FE A6 01            [ 1]  477 	ld	a, #0x01
      009300 88               [ 1]  478 	push	a
      009301 7B 06            [ 1]  479 	ld	a, (0x06, sp)
      009303 27 05            [ 1]  480 	jreq	00129$
      009305                        481 00128$:
      009305 08 01            [ 1]  482 	sll	(1, sp)
      009307 4A               [ 1]  483 	dec	a
      009308 26 FB            [ 1]  484 	jrne	00128$
      00930A                        485 00129$:
      00930A 84               [ 1]  486 	pop	a
                                    487 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 413: if (NewState != DISABLE)
      00930B 0D 06            [ 1]  488 	tnz	(0x06, sp)
      00930D 27 07            [ 1]  489 	jreq	00102$
                                    490 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 415: ADC1->AWCRL |= (uint8_t)((uint8_t)1 << Channel);
      00930F 1A 02            [ 1]  491 	or	a, (0x02, sp)
      009311 C7 54 0F         [ 1]  492 	ld	0x540f, a
      009314 20 30            [ 2]  493 	jra	00110$
      009316                        494 00102$:
                                    495 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 419: ADC1->AWCRL &= (uint8_t)~(uint8_t)((uint8_t)1 << Channel);
      009316 43               [ 1]  496 	cpl	a
      009317 14 02            [ 1]  497 	and	a, (0x02, sp)
      009319 C7 54 0F         [ 1]  498 	ld	0x540f, a
      00931C 20 28            [ 2]  499 	jra	00110$
      00931E                        500 00108$:
                                    501 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 426: ADC1->AWCRH |= (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8));
      00931E C6 54 0E         [ 1]  502 	ld	a, 0x540e
      009321 6B 01            [ 1]  503 	ld	(0x01, sp), a
      009323 7B 05            [ 1]  504 	ld	a, (0x05, sp)
      009325 A0 08            [ 1]  505 	sub	a, #0x08
      009327 97               [ 1]  506 	ld	xl, a
      009328 A6 01            [ 1]  507 	ld	a, #0x01
      00932A 88               [ 1]  508 	push	a
      00932B 9F               [ 1]  509 	ld	a, xl
      00932C 4D               [ 1]  510 	tnz	a
      00932D 27 05            [ 1]  511 	jreq	00132$
      00932F                        512 00131$:
      00932F 08 01            [ 1]  513 	sll	(1, sp)
      009331 4A               [ 1]  514 	dec	a
      009332 26 FB            [ 1]  515 	jrne	00131$
      009334                        516 00132$:
      009334 84               [ 1]  517 	pop	a
                                    518 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 424: if (NewState != DISABLE)
      009335 0D 06            [ 1]  519 	tnz	(0x06, sp)
      009337 27 07            [ 1]  520 	jreq	00105$
                                    521 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 426: ADC1->AWCRH |= (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8));
      009339 1A 01            [ 1]  522 	or	a, (0x01, sp)
      00933B C7 54 0E         [ 1]  523 	ld	0x540e, a
      00933E 20 06            [ 2]  524 	jra	00110$
      009340                        525 00105$:
                                    526 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 430: ADC1->AWCRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (uint8_t)(Channel - (uint8_t)8));
      009340 43               [ 1]  527 	cpl	a
      009341 14 01            [ 1]  528 	and	a, (0x01, sp)
      009343 C7 54 0E         [ 1]  529 	ld	0x540e, a
      009346                        530 00110$:
                                    531 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 433: }
      009346 5B 02            [ 2]  532 	addw	sp, #2
      009348 81               [ 4]  533 	ret
                                    534 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 441: void ADC1_SetHighThreshold(uint16_t Threshold)
                                    535 ;	-----------------------------------------
                                    536 ;	 function ADC1_SetHighThreshold
                                    537 ;	-----------------------------------------
      009349                        538 _ADC1_SetHighThreshold:
                                    539 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 443: ADC1->HTRH = (uint8_t)(Threshold >> (uint8_t)2);
      009349 1E 03            [ 2]  540 	ldw	x, (0x03, sp)
      00934B 54               [ 2]  541 	srlw	x
      00934C 54               [ 2]  542 	srlw	x
      00934D 9F               [ 1]  543 	ld	a, xl
      00934E C7 54 08         [ 1]  544 	ld	0x5408, a
                                    545 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 444: ADC1->HTRL = (uint8_t)Threshold;
      009351 7B 04            [ 1]  546 	ld	a, (0x04, sp)
      009353 C7 54 09         [ 1]  547 	ld	0x5409, a
                                    548 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 445: }
      009356 81               [ 4]  549 	ret
                                    550 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 453: void ADC1_SetLowThreshold(uint16_t Threshold)
                                    551 ;	-----------------------------------------
                                    552 ;	 function ADC1_SetLowThreshold
                                    553 ;	-----------------------------------------
      009357                        554 _ADC1_SetLowThreshold:
                                    555 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 455: ADC1->LTRL = (uint8_t)Threshold;
      009357 7B 04            [ 1]  556 	ld	a, (0x04, sp)
      009359 C7 54 0B         [ 1]  557 	ld	0x540b, a
                                    558 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 456: ADC1->LTRH = (uint8_t)(Threshold >> (uint8_t)2);
      00935C 1E 03            [ 2]  559 	ldw	x, (0x03, sp)
      00935E 54               [ 2]  560 	srlw	x
      00935F 54               [ 2]  561 	srlw	x
      009360 9F               [ 1]  562 	ld	a, xl
      009361 C7 54 0A         [ 1]  563 	ld	0x540a, a
                                    564 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 457: }
      009364 81               [ 4]  565 	ret
                                    566 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 466: uint16_t ADC1_GetBufferValue(uint8_t Buffer)
                                    567 ;	-----------------------------------------
                                    568 ;	 function ADC1_GetBufferValue
                                    569 ;	-----------------------------------------
      009365                        570 _ADC1_GetBufferValue:
      009365 52 0B            [ 2]  571 	sub	sp, #11
                                    572 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 474: if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
      009367 C6 54 02         [ 1]  573 	ld	a, 0x5402
      00936A 6B 0B            [ 1]  574 	ld	(0x0b, sp), a
                                    575 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 477: templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
      00936C 7B 0E            [ 1]  576 	ld	a, (0x0e, sp)
      00936E 48               [ 1]  577 	sll	a
      00936F 5F               [ 1]  578 	clrw	x
      009370 97               [ 1]  579 	ld	xl, a
      009371 51               [ 1]  580 	exgw	x, y
      009372 93               [ 1]  581 	ldw	x, y
      009373 1C 53 E1         [ 2]  582 	addw	x, #0x53e1
                                    583 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 479: temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
      009376 72 A9 53 E0      [ 2]  584 	addw	y, #0x53e0
                                    585 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 477: templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
                                    586 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 479: temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
                                    587 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 477: templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
      00937A F6               [ 1]  588 	ld	a, (x)
      00937B 97               [ 1]  589 	ld	xl, a
                                    590 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 479: temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
      00937C 90 F6            [ 1]  591 	ld	a, (y)
                                    592 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 474: if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
      00937E 88               [ 1]  593 	push	a
      00937F 7B 0C            [ 1]  594 	ld	a, (0x0c, sp)
      009381 A5 08            [ 1]  595 	bcp	a, #0x08
      009383 84               [ 1]  596 	pop	a
      009384 27 0E            [ 1]  597 	jreq	00102$
                                    598 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 477: templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
                                    599 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 479: temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
                                    600 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 481: temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
      009386 0F 08            [ 1]  601 	clr	(0x08, sp)
      009388 0F 03            [ 1]  602 	clr	(0x03, sp)
      00938A 1A 03            [ 1]  603 	or	a, (0x03, sp)
      00938C 01               [ 1]  604 	rrwa	x
      00938D 1A 08            [ 1]  605 	or	a, (0x08, sp)
      00938F 97               [ 1]  606 	ld	xl, a
      009390 1F 01            [ 2]  607 	ldw	(0x01, sp), x
      009392 20 19            [ 2]  608 	jra	00103$
      009394                        609 00102$:
                                    610 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 486: temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
                                    611 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 488: templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
                                    612 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 490: temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)(temph << 8));
      009394 02               [ 1]  613 	rlwa	x
      009395 4F               [ 1]  614 	clr	a
      009396 01               [ 1]  615 	rrwa	x
      009397 58               [ 2]  616 	sllw	x
      009398 58               [ 2]  617 	sllw	x
      009399 58               [ 2]  618 	sllw	x
      00939A 58               [ 2]  619 	sllw	x
      00939B 58               [ 2]  620 	sllw	x
      00939C 58               [ 2]  621 	sllw	x
      00939D 1F 09            [ 2]  622 	ldw	(0x09, sp), x
      00939F 97               [ 1]  623 	ld	xl, a
      0093A0 7B 0A            [ 1]  624 	ld	a, (0x0a, sp)
      0093A2 6B 06            [ 1]  625 	ld	(0x06, sp), a
      0093A4 9F               [ 1]  626 	ld	a, xl
      0093A5 1A 09            [ 1]  627 	or	a, (0x09, sp)
      0093A7 6B 01            [ 1]  628 	ld	(0x01, sp), a
      0093A9 7B 06            [ 1]  629 	ld	a, (0x06, sp)
      0093AB 6B 02            [ 1]  630 	ld	(0x02, sp), a
      0093AD                        631 00103$:
                                    632 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 493: return ((uint16_t)temph);
      0093AD 1E 01            [ 2]  633 	ldw	x, (0x01, sp)
                                    634 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 494: }
      0093AF 5B 0B            [ 2]  635 	addw	sp, #11
      0093B1 81               [ 4]  636 	ret
                                    637 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 502: FlagStatus ADC1_GetAWDChannelStatus(ADC1_Channel_TypeDef Channel)
                                    638 ;	-----------------------------------------
                                    639 ;	 function ADC1_GetAWDChannelStatus
                                    640 ;	-----------------------------------------
      0093B2                        641 _ADC1_GetAWDChannelStatus:
      0093B2 52 02            [ 2]  642 	sub	sp, #2
                                    643 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 509: if (Channel < (uint8_t)8)
      0093B4 7B 05            [ 1]  644 	ld	a, (0x05, sp)
      0093B6 A1 08            [ 1]  645 	cp	a, #0x08
      0093B8 24 16            [ 1]  646 	jrnc	00102$
                                    647 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 511: status = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << Channel));
      0093BA C6 54 0D         [ 1]  648 	ld	a, 0x540d
      0093BD 88               [ 1]  649 	push	a
      0093BE A6 01            [ 1]  650 	ld	a, #0x01
      0093C0 6B 03            [ 1]  651 	ld	(0x03, sp), a
      0093C2 7B 06            [ 1]  652 	ld	a, (0x06, sp)
      0093C4 27 05            [ 1]  653 	jreq	00113$
      0093C6                        654 00112$:
      0093C6 08 03            [ 1]  655 	sll	(0x03, sp)
      0093C8 4A               [ 1]  656 	dec	a
      0093C9 26 FB            [ 1]  657 	jrne	00112$
      0093CB                        658 00113$:
      0093CB 84               [ 1]  659 	pop	a
      0093CC 14 02            [ 1]  660 	and	a, (0x02, sp)
      0093CE 20 19            [ 2]  661 	jra	00103$
      0093D0                        662 00102$:
                                    663 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 515: status = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8)));
      0093D0 C6 54 0C         [ 1]  664 	ld	a, 0x540c
      0093D3 97               [ 1]  665 	ld	xl, a
      0093D4 7B 05            [ 1]  666 	ld	a, (0x05, sp)
      0093D6 A0 08            [ 1]  667 	sub	a, #0x08
      0093D8 88               [ 1]  668 	push	a
      0093D9 A6 01            [ 1]  669 	ld	a, #0x01
      0093DB 6B 02            [ 1]  670 	ld	(0x02, sp), a
      0093DD 84               [ 1]  671 	pop	a
      0093DE 4D               [ 1]  672 	tnz	a
      0093DF 27 05            [ 1]  673 	jreq	00115$
      0093E1                        674 00114$:
      0093E1 08 01            [ 1]  675 	sll	(0x01, sp)
      0093E3 4A               [ 1]  676 	dec	a
      0093E4 26 FB            [ 1]  677 	jrne	00114$
      0093E6                        678 00115$:
      0093E6 9F               [ 1]  679 	ld	a, xl
      0093E7 14 01            [ 1]  680 	and	a, (0x01, sp)
      0093E9                        681 00103$:
                                    682 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 518: return ((FlagStatus)status);
                                    683 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 519: }
      0093E9 5B 02            [ 2]  684 	addw	sp, #2
      0093EB 81               [ 4]  685 	ret
                                    686 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 527: FlagStatus ADC1_GetFlagStatus(ADC1_Flag_TypeDef Flag)
                                    687 ;	-----------------------------------------
                                    688 ;	 function ADC1_GetFlagStatus
                                    689 ;	-----------------------------------------
      0093EC                        690 _ADC1_GetFlagStatus:
      0093EC 52 04            [ 2]  691 	sub	sp, #4
                                    692 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 535: if ((Flag & 0x0F) == 0x01)
      0093EE 7B 07            [ 1]  693 	ld	a, (0x07, sp)
      0093F0 6B 03            [ 1]  694 	ld	(0x03, sp), a
      0093F2 0F 02            [ 1]  695 	clr	(0x02, sp)
      0093F4 7B 03            [ 1]  696 	ld	a, (0x03, sp)
      0093F6 A4 0F            [ 1]  697 	and	a, #0x0f
      0093F8 97               [ 1]  698 	ld	xl, a
      0093F9 4F               [ 1]  699 	clr	a
      0093FA 95               [ 1]  700 	ld	xh, a
      0093FB 5A               [ 2]  701 	decw	x
      0093FC 26 07            [ 1]  702 	jrne	00108$
                                    703 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 538: flagstatus = (uint8_t)(ADC1->CR3 & ADC1_CR3_OVR);
      0093FE C6 54 03         [ 1]  704 	ld	a, 0x5403
      009401 A4 40            [ 1]  705 	and	a, #0x40
      009403 20 49            [ 2]  706 	jra	00109$
      009405                        707 00108$:
                                    708 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 540: else if ((Flag & 0xF0) == 0x10)
      009405 7B 03            [ 1]  709 	ld	a, (0x03, sp)
      009407 A4 F0            [ 1]  710 	and	a, #0xf0
      009409 97               [ 1]  711 	ld	xl, a
      00940A 4F               [ 1]  712 	clr	a
      00940B 95               [ 1]  713 	ld	xh, a
      00940C A3 00 10         [ 2]  714 	cpw	x, #0x0010
      00940F 26 38            [ 1]  715 	jrne	00105$
                                    716 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 543: temp = (uint8_t)(Flag & (uint8_t)0x0F);
      009411 7B 07            [ 1]  717 	ld	a, (0x07, sp)
      009413 A4 0F            [ 1]  718 	and	a, #0x0f
                                    719 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 544: if (temp < 8)
      009415 97               [ 1]  720 	ld	xl, a
      009416 A1 08            [ 1]  721 	cp	a, #0x08
      009418 24 16            [ 1]  722 	jrnc	00102$
                                    723 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 546: flagstatus = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
      00941A C6 54 0D         [ 1]  724 	ld	a, 0x540d
      00941D 6B 04            [ 1]  725 	ld	(0x04, sp), a
      00941F A6 01            [ 1]  726 	ld	a, #0x01
      009421 88               [ 1]  727 	push	a
      009422 9F               [ 1]  728 	ld	a, xl
      009423 4D               [ 1]  729 	tnz	a
      009424 27 05            [ 1]  730 	jreq	00135$
      009426                        731 00134$:
      009426 08 01            [ 1]  732 	sll	(1, sp)
      009428 4A               [ 1]  733 	dec	a
      009429 26 FB            [ 1]  734 	jrne	00134$
      00942B                        735 00135$:
      00942B 84               [ 1]  736 	pop	a
      00942C 14 04            [ 1]  737 	and	a, (0x04, sp)
      00942E 20 1E            [ 2]  738 	jra	00109$
      009430                        739 00102$:
                                    740 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 550: flagstatus = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
      009430 C6 54 0C         [ 1]  741 	ld	a, 0x540c
      009433 6B 01            [ 1]  742 	ld	(0x01, sp), a
      009435 1D 00 08         [ 2]  743 	subw	x, #8
      009438 A6 01            [ 1]  744 	ld	a, #0x01
      00943A 88               [ 1]  745 	push	a
      00943B 9F               [ 1]  746 	ld	a, xl
      00943C 4D               [ 1]  747 	tnz	a
      00943D 27 05            [ 1]  748 	jreq	00137$
      00943F                        749 00136$:
      00943F 08 01            [ 1]  750 	sll	(1, sp)
      009441 4A               [ 1]  751 	dec	a
      009442 26 FB            [ 1]  752 	jrne	00136$
      009444                        753 00137$:
      009444 84               [ 1]  754 	pop	a
      009445 14 01            [ 1]  755 	and	a, (0x01, sp)
      009447 20 05            [ 2]  756 	jra	00109$
      009449                        757 00105$:
                                    758 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 555: flagstatus = (uint8_t)(ADC1->CSR & Flag);
      009449 C6 54 00         [ 1]  759 	ld	a, 0x5400
      00944C 14 07            [ 1]  760 	and	a, (0x07, sp)
      00944E                        761 00109$:
                                    762 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 557: return ((FlagStatus)flagstatus);
                                    763 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 559: }
      00944E 5B 04            [ 2]  764 	addw	sp, #4
      009450 81               [ 4]  765 	ret
                                    766 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 567: void ADC1_ClearFlag(ADC1_Flag_TypeDef Flag)
                                    767 ;	-----------------------------------------
                                    768 ;	 function ADC1_ClearFlag
                                    769 ;	-----------------------------------------
      009451                        770 _ADC1_ClearFlag:
      009451 52 05            [ 2]  771 	sub	sp, #5
                                    772 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 574: if ((Flag & 0x0F) == 0x01)
      009453 7B 08            [ 1]  773 	ld	a, (0x08, sp)
      009455 0F 01            [ 1]  774 	clr	(0x01, sp)
      009457 88               [ 1]  775 	push	a
      009458 A4 0F            [ 1]  776 	and	a, #0x0f
      00945A 97               [ 1]  777 	ld	xl, a
      00945B 4F               [ 1]  778 	clr	a
      00945C 95               [ 1]  779 	ld	xh, a
      00945D 84               [ 1]  780 	pop	a
      00945E 5A               [ 2]  781 	decw	x
      00945F 26 06            [ 1]  782 	jrne	00108$
                                    783 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 577: ADC1->CR3 &= (uint8_t)(~ADC1_CR3_OVR);
      009461 72 1D 54 03      [ 1]  784 	bres	21507, #6
      009465 20 57            [ 2]  785 	jra	00110$
      009467                        786 00108$:
                                    787 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 579: else if ((Flag & 0xF0) == 0x10)
      009467 A4 F0            [ 1]  788 	and	a, #0xf0
      009469 97               [ 1]  789 	ld	xl, a
      00946A 4F               [ 1]  790 	clr	a
      00946B 95               [ 1]  791 	ld	xh, a
      00946C A3 00 10         [ 2]  792 	cpw	x, #0x0010
      00946F 26 40            [ 1]  793 	jrne	00105$
                                    794 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 582: temp = (uint8_t)(Flag & (uint8_t)0x0F);
      009471 7B 08            [ 1]  795 	ld	a, (0x08, sp)
      009473 A4 0F            [ 1]  796 	and	a, #0x0f
                                    797 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 583: if (temp < 8)
      009475 97               [ 1]  798 	ld	xl, a
      009476 A1 08            [ 1]  799 	cp	a, #0x08
      009478 24 1A            [ 1]  800 	jrnc	00102$
                                    801 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 585: ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
      00947A C6 54 0D         [ 1]  802 	ld	a, 0x540d
      00947D 6B 05            [ 1]  803 	ld	(0x05, sp), a
      00947F A6 01            [ 1]  804 	ld	a, #0x01
      009481 88               [ 1]  805 	push	a
      009482 9F               [ 1]  806 	ld	a, xl
      009483 4D               [ 1]  807 	tnz	a
      009484 27 05            [ 1]  808 	jreq	00135$
      009486                        809 00134$:
      009486 08 01            [ 1]  810 	sll	(1, sp)
      009488 4A               [ 1]  811 	dec	a
      009489 26 FB            [ 1]  812 	jrne	00134$
      00948B                        813 00135$:
      00948B 84               [ 1]  814 	pop	a
      00948C 43               [ 1]  815 	cpl	a
      00948D 14 05            [ 1]  816 	and	a, (0x05, sp)
      00948F C7 54 0D         [ 1]  817 	ld	0x540d, a
      009492 20 2A            [ 2]  818 	jra	00110$
      009494                        819 00102$:
                                    820 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 589: ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
      009494 C6 54 0C         [ 1]  821 	ld	a, 0x540c
      009497 6B 04            [ 1]  822 	ld	(0x04, sp), a
      009499 1D 00 08         [ 2]  823 	subw	x, #8
      00949C A6 01            [ 1]  824 	ld	a, #0x01
      00949E 88               [ 1]  825 	push	a
      00949F 9F               [ 1]  826 	ld	a, xl
      0094A0 4D               [ 1]  827 	tnz	a
      0094A1 27 05            [ 1]  828 	jreq	00137$
      0094A3                        829 00136$:
      0094A3 08 01            [ 1]  830 	sll	(1, sp)
      0094A5 4A               [ 1]  831 	dec	a
      0094A6 26 FB            [ 1]  832 	jrne	00136$
      0094A8                        833 00137$:
      0094A8 84               [ 1]  834 	pop	a
      0094A9 43               [ 1]  835 	cpl	a
      0094AA 14 04            [ 1]  836 	and	a, (0x04, sp)
      0094AC C7 54 0C         [ 1]  837 	ld	0x540c, a
      0094AF 20 0D            [ 2]  838 	jra	00110$
      0094B1                        839 00105$:
                                    840 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 594: ADC1->CSR &= (uint8_t) (~Flag);
      0094B1 C6 54 00         [ 1]  841 	ld	a, 0x5400
      0094B4 6B 03            [ 1]  842 	ld	(0x03, sp), a
      0094B6 7B 08            [ 1]  843 	ld	a, (0x08, sp)
      0094B8 43               [ 1]  844 	cpl	a
      0094B9 14 03            [ 1]  845 	and	a, (0x03, sp)
      0094BB C7 54 00         [ 1]  846 	ld	0x5400, a
      0094BE                        847 00110$:
                                    848 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 596: }
      0094BE 5B 05            [ 2]  849 	addw	sp, #5
      0094C0 81               [ 4]  850 	ret
                                    851 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 616: ITStatus ADC1_GetITStatus(ADC1_IT_TypeDef ITPendingBit)
                                    852 ;	-----------------------------------------
                                    853 ;	 function ADC1_GetITStatus
                                    854 ;	-----------------------------------------
      0094C1                        855 _ADC1_GetITStatus:
      0094C1 52 03            [ 2]  856 	sub	sp, #3
                                    857 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 624: if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
      0094C3 7B 07            [ 1]  858 	ld	a, (0x07, sp)
      0094C5 A4 F0            [ 1]  859 	and	a, #0xf0
      0094C7 97               [ 1]  860 	ld	xl, a
      0094C8 4F               [ 1]  861 	clr	a
      0094C9 95               [ 1]  862 	ld	xh, a
                                    863 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 627: temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
      0094CA 7B 07            [ 1]  864 	ld	a, (0x07, sp)
                                    865 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 624: if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
      0094CC A3 00 10         [ 2]  866 	cpw	x, #0x0010
      0094CF 26 36            [ 1]  867 	jrne	00105$
                                    868 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 627: temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
      0094D1 A4 0F            [ 1]  869 	and	a, #0x0f
                                    870 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 628: if (temp < 8)
      0094D3 97               [ 1]  871 	ld	xl, a
      0094D4 A1 08            [ 1]  872 	cp	a, #0x08
      0094D6 24 16            [ 1]  873 	jrnc	00102$
                                    874 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 630: itstatus = (ITStatus)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
      0094D8 C6 54 0D         [ 1]  875 	ld	a, 0x540d
      0094DB 88               [ 1]  876 	push	a
      0094DC A6 01            [ 1]  877 	ld	a, #0x01
      0094DE 6B 04            [ 1]  878 	ld	(0x04, sp), a
      0094E0 9F               [ 1]  879 	ld	a, xl
      0094E1 4D               [ 1]  880 	tnz	a
      0094E2 27 05            [ 1]  881 	jreq	00124$
      0094E4                        882 00123$:
      0094E4 08 04            [ 1]  883 	sll	(0x04, sp)
      0094E6 4A               [ 1]  884 	dec	a
      0094E7 26 FB            [ 1]  885 	jrne	00123$
      0094E9                        886 00124$:
      0094E9 84               [ 1]  887 	pop	a
      0094EA 14 03            [ 1]  888 	and	a, (0x03, sp)
      0094EC 20 23            [ 2]  889 	jra	00106$
      0094EE                        890 00102$:
                                    891 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 634: itstatus = (ITStatus)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
      0094EE C6 54 0C         [ 1]  892 	ld	a, 0x540c
      0094F1 6B 02            [ 1]  893 	ld	(0x02, sp), a
      0094F3 1D 00 08         [ 2]  894 	subw	x, #8
      0094F6 A6 01            [ 1]  895 	ld	a, #0x01
      0094F8 88               [ 1]  896 	push	a
      0094F9 9F               [ 1]  897 	ld	a, xl
      0094FA 4D               [ 1]  898 	tnz	a
      0094FB 27 05            [ 1]  899 	jreq	00126$
      0094FD                        900 00125$:
      0094FD 08 01            [ 1]  901 	sll	(1, sp)
      0094FF 4A               [ 1]  902 	dec	a
      009500 26 FB            [ 1]  903 	jrne	00125$
      009502                        904 00126$:
      009502 84               [ 1]  905 	pop	a
      009503 14 02            [ 1]  906 	and	a, (0x02, sp)
      009505 20 0A            [ 2]  907 	jra	00106$
      009507                        908 00105$:
                                    909 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 639: itstatus = (ITStatus)(ADC1->CSR & (uint8_t)ITPendingBit);
      009507 AE 54 00         [ 2]  910 	ldw	x, #0x5400
      00950A 88               [ 1]  911 	push	a
      00950B F6               [ 1]  912 	ld	a, (x)
      00950C 6B 02            [ 1]  913 	ld	(0x02, sp), a
      00950E 84               [ 1]  914 	pop	a
      00950F 14 01            [ 1]  915 	and	a, (0x01, sp)
      009511                        916 00106$:
                                    917 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 641: return ((ITStatus)itstatus);
                                    918 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 642: }
      009511 5B 03            [ 2]  919 	addw	sp, #3
      009513 81               [ 4]  920 	ret
                                    921 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 662: void ADC1_ClearITPendingBit(ADC1_IT_TypeDef ITPendingBit)
                                    922 ;	-----------------------------------------
                                    923 ;	 function ADC1_ClearITPendingBit
                                    924 ;	-----------------------------------------
      009514                        925 _ADC1_ClearITPendingBit:
      009514 52 02            [ 2]  926 	sub	sp, #2
                                    927 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 669: if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
      009516 7B 06            [ 1]  928 	ld	a, (0x06, sp)
      009518 A4 F0            [ 1]  929 	and	a, #0xf0
      00951A 97               [ 1]  930 	ld	xl, a
      00951B 4F               [ 1]  931 	clr	a
      00951C 95               [ 1]  932 	ld	xh, a
      00951D A3 00 10         [ 2]  933 	cpw	x, #0x0010
      009520 26 40            [ 1]  934 	jrne	00105$
                                    935 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 672: temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
      009522 7B 06            [ 1]  936 	ld	a, (0x06, sp)
      009524 A4 0F            [ 1]  937 	and	a, #0x0f
                                    938 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 673: if (temp < 8)
      009526 97               [ 1]  939 	ld	xl, a
      009527 A1 08            [ 1]  940 	cp	a, #0x08
      009529 24 1A            [ 1]  941 	jrnc	00102$
                                    942 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 675: ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
      00952B C6 54 0D         [ 1]  943 	ld	a, 0x540d
      00952E 6B 02            [ 1]  944 	ld	(0x02, sp), a
      009530 A6 01            [ 1]  945 	ld	a, #0x01
      009532 88               [ 1]  946 	push	a
      009533 9F               [ 1]  947 	ld	a, xl
      009534 4D               [ 1]  948 	tnz	a
      009535 27 05            [ 1]  949 	jreq	00124$
      009537                        950 00123$:
      009537 08 01            [ 1]  951 	sll	(1, sp)
      009539 4A               [ 1]  952 	dec	a
      00953A 26 FB            [ 1]  953 	jrne	00123$
      00953C                        954 00124$:
      00953C 84               [ 1]  955 	pop	a
      00953D 43               [ 1]  956 	cpl	a
      00953E 14 02            [ 1]  957 	and	a, (0x02, sp)
      009540 C7 54 0D         [ 1]  958 	ld	0x540d, a
      009543 20 2A            [ 2]  959 	jra	00107$
      009545                        960 00102$:
                                    961 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 679: ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
      009545 C6 54 0C         [ 1]  962 	ld	a, 0x540c
      009548 6B 01            [ 1]  963 	ld	(0x01, sp), a
      00954A 1D 00 08         [ 2]  964 	subw	x, #8
      00954D A6 01            [ 1]  965 	ld	a, #0x01
      00954F 88               [ 1]  966 	push	a
      009550 9F               [ 1]  967 	ld	a, xl
      009551 4D               [ 1]  968 	tnz	a
      009552 27 05            [ 1]  969 	jreq	00126$
      009554                        970 00125$:
      009554 08 01            [ 1]  971 	sll	(1, sp)
      009556 4A               [ 1]  972 	dec	a
      009557 26 FB            [ 1]  973 	jrne	00125$
      009559                        974 00126$:
      009559 84               [ 1]  975 	pop	a
      00955A 43               [ 1]  976 	cpl	a
      00955B 14 01            [ 1]  977 	and	a, (0x01, sp)
      00955D C7 54 0C         [ 1]  978 	ld	0x540c, a
      009560 20 0D            [ 2]  979 	jra	00107$
      009562                        980 00105$:
                                    981 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 684: ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ITPendingBit);
      009562 C6 54 00         [ 1]  982 	ld	a, 0x5400
      009565 1E 05            [ 2]  983 	ldw	x, (0x05, sp)
      009567 53               [ 2]  984 	cplw	x
      009568 89               [ 2]  985 	pushw	x
      009569 14 02            [ 1]  986 	and	a, (2, sp)
      00956B 85               [ 2]  987 	popw	x
      00956C C7 54 00         [ 1]  988 	ld	0x5400, a
      00956F                        989 00107$:
                                    990 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 686: }
      00956F 5B 02            [ 2]  991 	addw	sp, #2
      009571 81               [ 4]  992 	ret
                                    993 	.area CODE
                                    994 	.area CONST
                                    995 	.area INITIALIZER
                                    996 	.area CABS (ABS)
