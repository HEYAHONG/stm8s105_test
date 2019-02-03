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
      00ABA5                         73 _ADC1_DeInit:
                                     74 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 54: ADC1->CSR  = ADC1_CSR_RESET_VALUE;
      00ABA5 35 00 54 00      [ 1]   75 	mov	0x5400+0, #0x00
                                     76 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 55: ADC1->CR1  = ADC1_CR1_RESET_VALUE;
      00ABA9 35 00 54 01      [ 1]   77 	mov	0x5401+0, #0x00
                                     78 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 56: ADC1->CR2  = ADC1_CR2_RESET_VALUE;
      00ABAD 35 00 54 02      [ 1]   79 	mov	0x5402+0, #0x00
                                     80 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 57: ADC1->CR3  = ADC1_CR3_RESET_VALUE;
      00ABB1 35 00 54 03      [ 1]   81 	mov	0x5403+0, #0x00
                                     82 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 58: ADC1->TDRH = ADC1_TDRH_RESET_VALUE;
      00ABB5 35 00 54 06      [ 1]   83 	mov	0x5406+0, #0x00
                                     84 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 59: ADC1->TDRL = ADC1_TDRL_RESET_VALUE;
      00ABB9 35 00 54 07      [ 1]   85 	mov	0x5407+0, #0x00
                                     86 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 60: ADC1->HTRH = ADC1_HTRH_RESET_VALUE;
      00ABBD 35 FF 54 08      [ 1]   87 	mov	0x5408+0, #0xff
                                     88 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 61: ADC1->HTRL = ADC1_HTRL_RESET_VALUE;
      00ABC1 35 03 54 09      [ 1]   89 	mov	0x5409+0, #0x03
                                     90 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 62: ADC1->LTRH = ADC1_LTRH_RESET_VALUE;
      00ABC5 35 00 54 0A      [ 1]   91 	mov	0x540a+0, #0x00
                                     92 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 63: ADC1->LTRL = ADC1_LTRL_RESET_VALUE;
      00ABC9 35 00 54 0B      [ 1]   93 	mov	0x540b+0, #0x00
                                     94 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 64: ADC1->AWCRH = ADC1_AWCRH_RESET_VALUE;
      00ABCD 35 00 54 0E      [ 1]   95 	mov	0x540e+0, #0x00
                                     96 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 65: ADC1->AWCRL = ADC1_AWCRL_RESET_VALUE;
      00ABD1 35 00 54 0F      [ 1]   97 	mov	0x540f+0, #0x00
                                     98 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 66: }
      00ABD5 81               [ 4]   99 	ret
                                    100 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 88: void ADC1_Init(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_PresSel_TypeDef ADC1_PrescalerSelection, ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState ADC1_ExtTriggerState, ADC1_Align_TypeDef ADC1_Align, ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState ADC1_SchmittTriggerState)
                                    101 ;	-----------------------------------------
                                    102 ;	 function ADC1_Init
                                    103 ;	-----------------------------------------
      00ABD6                        104 _ADC1_Init:
                                    105 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 103: ADC1_ConversionConfig(ADC1_ConversionMode, ADC1_Channel, ADC1_Align);
      00ABD6 7B 08            [ 1]  106 	ld	a, (0x08, sp)
      00ABD8 88               [ 1]  107 	push	a
      00ABD9 7B 05            [ 1]  108 	ld	a, (0x05, sp)
      00ABDB 88               [ 1]  109 	push	a
      00ABDC 7B 05            [ 1]  110 	ld	a, (0x05, sp)
      00ABDE 88               [ 1]  111 	push	a
      00ABDF CD AC EC         [ 4]  112 	call	_ADC1_ConversionConfig
      00ABE2 5B 03            [ 2]  113 	addw	sp, #3
                                    114 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 105: ADC1_PrescalerConfig(ADC1_PrescalerSelection);
      00ABE4 7B 05            [ 1]  115 	ld	a, (0x05, sp)
      00ABE6 88               [ 1]  116 	push	a
      00ABE7 CD AC 5D         [ 4]  117 	call	_ADC1_PrescalerConfig
      00ABEA 84               [ 1]  118 	pop	a
                                    119 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 110: ADC1_ExternalTriggerConfig(ADC1_ExtTrigger, ADC1_ExtTriggerState);
      00ABEB 7B 07            [ 1]  120 	ld	a, (0x07, sp)
      00ABED 88               [ 1]  121 	push	a
      00ABEE 7B 07            [ 1]  122 	ld	a, (0x07, sp)
      00ABF0 88               [ 1]  123 	push	a
      00ABF1 CD AD 1F         [ 4]  124 	call	_ADC1_ExternalTriggerConfig
      00ABF4 5B 02            [ 2]  125 	addw	sp, #2
                                    126 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 115: ADC1_SchmittTriggerConfig(ADC1_SchmittTriggerChannel, ADC1_SchmittTriggerState);
      00ABF6 7B 0A            [ 1]  127 	ld	a, (0x0a, sp)
      00ABF8 88               [ 1]  128 	push	a
      00ABF9 7B 0A            [ 1]  129 	ld	a, (0x0a, sp)
      00ABFB 88               [ 1]  130 	push	a
      00ABFC CD AC 6E         [ 4]  131 	call	_ADC1_SchmittTriggerConfig
      00ABFF 5B 02            [ 2]  132 	addw	sp, #2
                                    133 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 118: ADC1->CR1 |= ADC1_CR1_ADON;
      00AC01 72 10 54 01      [ 1]  134 	bset	21505, #0
                                    135 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 119: }
      00AC05 81               [ 4]  136 	ret
                                    137 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 126: void ADC1_Cmd(FunctionalState NewState)
                                    138 ;	-----------------------------------------
                                    139 ;	 function ADC1_Cmd
                                    140 ;	-----------------------------------------
      00AC06                        141 _ADC1_Cmd:
                                    142 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 133: ADC1->CR1 |= ADC1_CR1_ADON;
      00AC06 C6 54 01         [ 1]  143 	ld	a, 0x5401
                                    144 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 131: if (NewState != DISABLE)
      00AC09 0D 03            [ 1]  145 	tnz	(0x03, sp)
      00AC0B 27 06            [ 1]  146 	jreq	00102$
                                    147 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 133: ADC1->CR1 |= ADC1_CR1_ADON;
      00AC0D AA 01            [ 1]  148 	or	a, #0x01
      00AC0F C7 54 01         [ 1]  149 	ld	0x5401, a
      00AC12 81               [ 4]  150 	ret
      00AC13                        151 00102$:
                                    152 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 137: ADC1->CR1 &= (uint8_t)(~ADC1_CR1_ADON);
      00AC13 A4 FE            [ 1]  153 	and	a, #0xfe
      00AC15 C7 54 01         [ 1]  154 	ld	0x5401, a
                                    155 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 139: }
      00AC18 81               [ 4]  156 	ret
                                    157 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 146: void ADC1_ScanModeCmd(FunctionalState NewState)
                                    158 ;	-----------------------------------------
                                    159 ;	 function ADC1_ScanModeCmd
                                    160 ;	-----------------------------------------
      00AC19                        161 _ADC1_ScanModeCmd:
                                    162 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 153: ADC1->CR2 |= ADC1_CR2_SCAN;
      00AC19 C6 54 02         [ 1]  163 	ld	a, 0x5402
                                    164 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 151: if (NewState != DISABLE)
      00AC1C 0D 03            [ 1]  165 	tnz	(0x03, sp)
      00AC1E 27 06            [ 1]  166 	jreq	00102$
                                    167 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 153: ADC1->CR2 |= ADC1_CR2_SCAN;
      00AC20 AA 02            [ 1]  168 	or	a, #0x02
      00AC22 C7 54 02         [ 1]  169 	ld	0x5402, a
      00AC25 81               [ 4]  170 	ret
      00AC26                        171 00102$:
                                    172 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 157: ADC1->CR2 &= (uint8_t)(~ADC1_CR2_SCAN);
      00AC26 A4 FD            [ 1]  173 	and	a, #0xfd
      00AC28 C7 54 02         [ 1]  174 	ld	0x5402, a
                                    175 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 159: }
      00AC2B 81               [ 4]  176 	ret
                                    177 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 166: void ADC1_DataBufferCmd(FunctionalState NewState)
                                    178 ;	-----------------------------------------
                                    179 ;	 function ADC1_DataBufferCmd
                                    180 ;	-----------------------------------------
      00AC2C                        181 _ADC1_DataBufferCmd:
                                    182 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 173: ADC1->CR3 |= ADC1_CR3_DBUF;
      00AC2C C6 54 03         [ 1]  183 	ld	a, 0x5403
                                    184 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 171: if (NewState != DISABLE)
      00AC2F 0D 03            [ 1]  185 	tnz	(0x03, sp)
      00AC31 27 06            [ 1]  186 	jreq	00102$
                                    187 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 173: ADC1->CR3 |= ADC1_CR3_DBUF;
      00AC33 AA 80            [ 1]  188 	or	a, #0x80
      00AC35 C7 54 03         [ 1]  189 	ld	0x5403, a
      00AC38 81               [ 4]  190 	ret
      00AC39                        191 00102$:
                                    192 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 177: ADC1->CR3 &= (uint8_t)(~ADC1_CR3_DBUF);
      00AC39 A4 7F            [ 1]  193 	and	a, #0x7f
      00AC3B C7 54 03         [ 1]  194 	ld	0x5403, a
                                    195 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 179: }
      00AC3E 81               [ 4]  196 	ret
                                    197 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 190: void ADC1_ITConfig(ADC1_IT_TypeDef ADC1_IT, FunctionalState NewState)
                                    198 ;	-----------------------------------------
                                    199 ;	 function ADC1_ITConfig
                                    200 ;	-----------------------------------------
      00AC3F                        201 _ADC1_ITConfig:
      00AC3F 88               [ 1]  202 	push	a
                                    203 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 199: ADC1->CSR |= (uint8_t)ADC1_IT;
      00AC40 C6 54 00         [ 1]  204 	ld	a, 0x5400
      00AC43 6B 01            [ 1]  205 	ld	(0x01, sp), a
                                    206 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 196: if (NewState != DISABLE)
      00AC45 0D 06            [ 1]  207 	tnz	(0x06, sp)
      00AC47 27 09            [ 1]  208 	jreq	00102$
                                    209 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 199: ADC1->CSR |= (uint8_t)ADC1_IT;
      00AC49 7B 05            [ 1]  210 	ld	a, (0x05, sp)
      00AC4B 1A 01            [ 1]  211 	or	a, (0x01, sp)
      00AC4D C7 54 00         [ 1]  212 	ld	0x5400, a
      00AC50 20 09            [ 2]  213 	jra	00104$
      00AC52                        214 00102$:
                                    215 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 204: ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ADC1_IT);
      00AC52 1E 04            [ 2]  216 	ldw	x, (0x04, sp)
      00AC54 53               [ 2]  217 	cplw	x
      00AC55 9F               [ 1]  218 	ld	a, xl
      00AC56 14 01            [ 1]  219 	and	a, (0x01, sp)
      00AC58 C7 54 00         [ 1]  220 	ld	0x5400, a
      00AC5B                        221 00104$:
                                    222 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 206: }
      00AC5B 84               [ 1]  223 	pop	a
      00AC5C 81               [ 4]  224 	ret
                                    225 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 214: void ADC1_PrescalerConfig(ADC1_PresSel_TypeDef ADC1_Prescaler)
                                    226 ;	-----------------------------------------
                                    227 ;	 function ADC1_PrescalerConfig
                                    228 ;	-----------------------------------------
      00AC5D                        229 _ADC1_PrescalerConfig:
                                    230 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 220: ADC1->CR1 &= (uint8_t)(~ADC1_CR1_SPSEL);
      00AC5D C6 54 01         [ 1]  231 	ld	a, 0x5401
      00AC60 A4 8F            [ 1]  232 	and	a, #0x8f
      00AC62 C7 54 01         [ 1]  233 	ld	0x5401, a
                                    234 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 222: ADC1->CR1 |= (uint8_t)(ADC1_Prescaler);
      00AC65 C6 54 01         [ 1]  235 	ld	a, 0x5401
      00AC68 1A 03            [ 1]  236 	or	a, (0x03, sp)
      00AC6A C7 54 01         [ 1]  237 	ld	0x5401, a
                                    238 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 223: }
      00AC6D 81               [ 4]  239 	ret
                                    240 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 233: void ADC1_SchmittTriggerConfig(ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState NewState)
                                    241 ;	-----------------------------------------
                                    242 ;	 function ADC1_SchmittTriggerConfig
                                    243 ;	-----------------------------------------
      00AC6E                        244 _ADC1_SchmittTriggerConfig:
      00AC6E 52 02            [ 2]  245 	sub	sp, #2
                                    246 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 239: if (ADC1_SchmittTriggerChannel == ADC1_SCHMITTTRIG_ALL)
      00AC70 7B 05            [ 1]  247 	ld	a, (0x05, sp)
      00AC72 4C               [ 1]  248 	inc	a
      00AC73 26 21            [ 1]  249 	jrne	00114$
                                    250 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 243: ADC1->TDRL &= (uint8_t)0x0;
      00AC75 C6 54 07         [ 1]  251 	ld	a, 0x5407
                                    252 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 241: if (NewState != DISABLE)
      00AC78 0D 06            [ 1]  253 	tnz	(0x06, sp)
      00AC7A 27 0D            [ 1]  254 	jreq	00102$
                                    255 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 243: ADC1->TDRL &= (uint8_t)0x0;
      00AC7C 35 00 54 07      [ 1]  256 	mov	0x5407+0, #0x00
                                    257 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 244: ADC1->TDRH &= (uint8_t)0x0;
      00AC80 C6 54 06         [ 1]  258 	ld	a, 0x5406
      00AC83 35 00 54 06      [ 1]  259 	mov	0x5406+0, #0x00
      00AC87 20 60            [ 2]  260 	jra	00116$
      00AC89                        261 00102$:
                                    262 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 248: ADC1->TDRL |= (uint8_t)0xFF;
      00AC89 35 FF 54 07      [ 1]  263 	mov	0x5407+0, #0xff
                                    264 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 249: ADC1->TDRH |= (uint8_t)0xFF;
      00AC8D C6 54 06         [ 1]  265 	ld	a, 0x5406
      00AC90 35 FF 54 06      [ 1]  266 	mov	0x5406+0, #0xff
      00AC94 20 53            [ 2]  267 	jra	00116$
      00AC96                        268 00114$:
                                    269 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 252: else if (ADC1_SchmittTriggerChannel < ADC1_SCHMITTTRIG_CHANNEL8)
      00AC96 7B 05            [ 1]  270 	ld	a, (0x05, sp)
      00AC98 A1 08            [ 1]  271 	cp	a, #0x08
      00AC9A 24 25            [ 1]  272 	jrnc	00111$
                                    273 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 243: ADC1->TDRL &= (uint8_t)0x0;
      00AC9C C6 54 07         [ 1]  274 	ld	a, 0x5407
      00AC9F 6B 01            [ 1]  275 	ld	(0x01, sp), a
                                    276 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 256: ADC1->TDRL &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel));
      00ACA1 A6 01            [ 1]  277 	ld	a, #0x01
      00ACA3 88               [ 1]  278 	push	a
      00ACA4 7B 06            [ 1]  279 	ld	a, (0x06, sp)
      00ACA6 27 05            [ 1]  280 	jreq	00149$
      00ACA8                        281 00148$:
      00ACA8 08 01            [ 1]  282 	sll	(1, sp)
      00ACAA 4A               [ 1]  283 	dec	a
      00ACAB 26 FB            [ 1]  284 	jrne	00148$
      00ACAD                        285 00149$:
      00ACAD 84               [ 1]  286 	pop	a
                                    287 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 254: if (NewState != DISABLE)
      00ACAE 0D 06            [ 1]  288 	tnz	(0x06, sp)
      00ACB0 27 08            [ 1]  289 	jreq	00105$
                                    290 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 256: ADC1->TDRL &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel));
      00ACB2 43               [ 1]  291 	cpl	a
      00ACB3 14 01            [ 1]  292 	and	a, (0x01, sp)
      00ACB5 C7 54 07         [ 1]  293 	ld	0x5407, a
      00ACB8 20 2F            [ 2]  294 	jra	00116$
      00ACBA                        295 00105$:
                                    296 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 260: ADC1->TDRL |= (uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel);
      00ACBA 1A 01            [ 1]  297 	or	a, (0x01, sp)
      00ACBC C7 54 07         [ 1]  298 	ld	0x5407, a
      00ACBF 20 28            [ 2]  299 	jra	00116$
      00ACC1                        300 00111$:
                                    301 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 244: ADC1->TDRH &= (uint8_t)0x0;
      00ACC1 C6 54 06         [ 1]  302 	ld	a, 0x5406
      00ACC4 6B 02            [ 1]  303 	ld	(0x02, sp), a
                                    304 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 267: ADC1->TDRH &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8)));
      00ACC6 7B 05            [ 1]  305 	ld	a, (0x05, sp)
      00ACC8 A0 08            [ 1]  306 	sub	a, #0x08
      00ACCA 97               [ 1]  307 	ld	xl, a
      00ACCB A6 01            [ 1]  308 	ld	a, #0x01
      00ACCD 88               [ 1]  309 	push	a
      00ACCE 9F               [ 1]  310 	ld	a, xl
      00ACCF 4D               [ 1]  311 	tnz	a
      00ACD0 27 05            [ 1]  312 	jreq	00152$
      00ACD2                        313 00151$:
      00ACD2 08 01            [ 1]  314 	sll	(1, sp)
      00ACD4 4A               [ 1]  315 	dec	a
      00ACD5 26 FB            [ 1]  316 	jrne	00151$
      00ACD7                        317 00152$:
      00ACD7 84               [ 1]  318 	pop	a
                                    319 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 265: if (NewState != DISABLE)
      00ACD8 0D 06            [ 1]  320 	tnz	(0x06, sp)
      00ACDA 27 08            [ 1]  321 	jreq	00108$
                                    322 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 267: ADC1->TDRH &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8)));
      00ACDC 43               [ 1]  323 	cpl	a
      00ACDD 14 02            [ 1]  324 	and	a, (0x02, sp)
      00ACDF C7 54 06         [ 1]  325 	ld	0x5406, a
      00ACE2 20 05            [ 2]  326 	jra	00116$
      00ACE4                        327 00108$:
                                    328 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 271: ADC1->TDRH |= (uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8));
      00ACE4 1A 02            [ 1]  329 	or	a, (0x02, sp)
      00ACE6 C7 54 06         [ 1]  330 	ld	0x5406, a
      00ACE9                        331 00116$:
                                    332 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 274: }
      00ACE9 5B 02            [ 2]  333 	addw	sp, #2
      00ACEB 81               [ 4]  334 	ret
                                    335 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 286: void ADC1_ConversionConfig(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_Align_TypeDef ADC1_Align)
                                    336 ;	-----------------------------------------
                                    337 ;	 function ADC1_ConversionConfig
                                    338 ;	-----------------------------------------
      00ACEC                        339 _ADC1_ConversionConfig:
                                    340 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 294: ADC1->CR2 &= (uint8_t)(~ADC1_CR2_ALIGN);
      00ACEC 72 17 54 02      [ 1]  341 	bres	21506, #3
                                    342 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 296: ADC1->CR2 |= (uint8_t)(ADC1_Align);
      00ACF0 C6 54 02         [ 1]  343 	ld	a, 0x5402
      00ACF3 1A 05            [ 1]  344 	or	a, (0x05, sp)
      00ACF5 C7 54 02         [ 1]  345 	ld	0x5402, a
                                    346 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 301: ADC1->CR1 |= ADC1_CR1_CONT;
      00ACF8 C6 54 01         [ 1]  347 	ld	a, 0x5401
                                    348 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 298: if (ADC1_ConversionMode == ADC1_CONVERSIONMODE_CONTINUOUS)
      00ACFB 88               [ 1]  349 	push	a
      00ACFC 7B 04            [ 1]  350 	ld	a, (0x04, sp)
      00ACFE 4A               [ 1]  351 	dec	a
      00ACFF 84               [ 1]  352 	pop	a
      00AD00 26 07            [ 1]  353 	jrne	00102$
                                    354 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 301: ADC1->CR1 |= ADC1_CR1_CONT;
      00AD02 AA 02            [ 1]  355 	or	a, #0x02
      00AD04 C7 54 01         [ 1]  356 	ld	0x5401, a
      00AD07 20 05            [ 2]  357 	jra	00103$
      00AD09                        358 00102$:
                                    359 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 306: ADC1->CR1 &= (uint8_t)(~ADC1_CR1_CONT);
      00AD09 A4 FD            [ 1]  360 	and	a, #0xfd
      00AD0B C7 54 01         [ 1]  361 	ld	0x5401, a
      00AD0E                        362 00103$:
                                    363 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 310: ADC1->CSR &= (uint8_t)(~ADC1_CSR_CH);
      00AD0E C6 54 00         [ 1]  364 	ld	a, 0x5400
      00AD11 A4 F0            [ 1]  365 	and	a, #0xf0
      00AD13 C7 54 00         [ 1]  366 	ld	0x5400, a
                                    367 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 312: ADC1->CSR |= (uint8_t)(ADC1_Channel);
      00AD16 C6 54 00         [ 1]  368 	ld	a, 0x5400
      00AD19 1A 04            [ 1]  369 	or	a, (0x04, sp)
      00AD1B C7 54 00         [ 1]  370 	ld	0x5400, a
                                    371 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 313: }
      00AD1E 81               [ 4]  372 	ret
                                    373 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 325: void ADC1_ExternalTriggerConfig(ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState NewState)
                                    374 ;	-----------------------------------------
                                    375 ;	 function ADC1_ExternalTriggerConfig
                                    376 ;	-----------------------------------------
      00AD1F                        377 _ADC1_ExternalTriggerConfig:
                                    378 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 332: ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTSEL);
      00AD1F C6 54 02         [ 1]  379 	ld	a, 0x5402
      00AD22 A4 CF            [ 1]  380 	and	a, #0xcf
      00AD24 C7 54 02         [ 1]  381 	ld	0x5402, a
      00AD27 C6 54 02         [ 1]  382 	ld	a, 0x5402
                                    383 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 334: if (NewState != DISABLE)
      00AD2A 0D 04            [ 1]  384 	tnz	(0x04, sp)
      00AD2C 27 07            [ 1]  385 	jreq	00102$
                                    386 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 337: ADC1->CR2 |= (uint8_t)(ADC1_CR2_EXTTRIG);
      00AD2E AA 40            [ 1]  387 	or	a, #0x40
      00AD30 C7 54 02         [ 1]  388 	ld	0x5402, a
      00AD33 20 05            [ 2]  389 	jra	00103$
      00AD35                        390 00102$:
                                    391 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 342: ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTTRIG);
      00AD35 A4 BF            [ 1]  392 	and	a, #0xbf
      00AD37 C7 54 02         [ 1]  393 	ld	0x5402, a
      00AD3A                        394 00103$:
                                    395 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 346: ADC1->CR2 |= (uint8_t)(ADC1_ExtTrigger);
      00AD3A C6 54 02         [ 1]  396 	ld	a, 0x5402
      00AD3D 1A 03            [ 1]  397 	or	a, (0x03, sp)
      00AD3F C7 54 02         [ 1]  398 	ld	0x5402, a
                                    399 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 347: }
      00AD42 81               [ 4]  400 	ret
                                    401 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 358: void ADC1_StartConversion(void)
                                    402 ;	-----------------------------------------
                                    403 ;	 function ADC1_StartConversion
                                    404 ;	-----------------------------------------
      00AD43                        405 _ADC1_StartConversion:
                                    406 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 360: ADC1->CR1 |= ADC1_CR1_ADON;
      00AD43 72 10 54 01      [ 1]  407 	bset	21505, #0
                                    408 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 361: }
      00AD47 81               [ 4]  409 	ret
                                    410 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 370: uint16_t ADC1_GetConversionValue(void)
                                    411 ;	-----------------------------------------
                                    412 ;	 function ADC1_GetConversionValue
                                    413 ;	-----------------------------------------
      00AD48                        414 _ADC1_GetConversionValue:
      00AD48 52 08            [ 2]  415 	sub	sp, #8
                                    416 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 375: if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
      00AD4A C6 54 02         [ 1]  417 	ld	a, 0x5402
      00AD4D A5 08            [ 1]  418 	bcp	a, #0x08
      00AD4F 27 15            [ 1]  419 	jreq	00102$
                                    420 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 378: templ = ADC1->DRL;
      00AD51 C6 54 05         [ 1]  421 	ld	a, 0x5405
      00AD54 97               [ 1]  422 	ld	xl, a
                                    423 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 380: temph = ADC1->DRH;
      00AD55 C6 54 04         [ 1]  424 	ld	a, 0x5404
                                    425 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 382: temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
      00AD58 0F 04            [ 1]  426 	clr	(0x04, sp)
      00AD5A 0F 01            [ 1]  427 	clr	(0x01, sp)
      00AD5C 1A 01            [ 1]  428 	or	a, (0x01, sp)
      00AD5E 01               [ 1]  429 	rrwa	x
      00AD5F 1A 04            [ 1]  430 	or	a, (0x04, sp)
      00AD61 97               [ 1]  431 	ld	xl, a
      00AD62 1F 07            [ 2]  432 	ldw	(0x07, sp), x
      00AD64 20 1D            [ 2]  433 	jra	00103$
      00AD66                        434 00102$:
                                    435 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 387: temph = ADC1->DRH;
      00AD66 C6 54 04         [ 1]  436 	ld	a, 0x5404
      00AD69 5F               [ 1]  437 	clrw	x
      00AD6A 97               [ 1]  438 	ld	xl, a
      00AD6B 51               [ 1]  439 	exgw	x, y
                                    440 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 389: templ = ADC1->DRL;
      00AD6C C6 54 05         [ 1]  441 	ld	a, 0x5405
                                    442 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 391: temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)((uint16_t)temph << 8));
      00AD6F 5F               [ 1]  443 	clrw	x
      00AD70 97               [ 1]  444 	ld	xl, a
      00AD71 58               [ 2]  445 	sllw	x
      00AD72 58               [ 2]  446 	sllw	x
      00AD73 58               [ 2]  447 	sllw	x
      00AD74 58               [ 2]  448 	sllw	x
      00AD75 58               [ 2]  449 	sllw	x
      00AD76 58               [ 2]  450 	sllw	x
      00AD77 1F 05            [ 2]  451 	ldw	(0x05, sp), x
      00AD79 7B 06            [ 1]  452 	ld	a, (0x06, sp)
      00AD7B 97               [ 1]  453 	ld	xl, a
      00AD7C 90 9F            [ 1]  454 	ld	a, yl
      00AD7E 1A 05            [ 1]  455 	or	a, (0x05, sp)
      00AD80 95               [ 1]  456 	ld	xh, a
      00AD81 1F 07            [ 2]  457 	ldw	(0x07, sp), x
      00AD83                        458 00103$:
                                    459 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 394: return ((uint16_t)temph);
      00AD83 1E 07            [ 2]  460 	ldw	x, (0x07, sp)
                                    461 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 395: }
      00AD85 5B 08            [ 2]  462 	addw	sp, #8
      00AD87 81               [ 4]  463 	ret
                                    464 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 405: void ADC1_AWDChannelConfig(ADC1_Channel_TypeDef Channel, FunctionalState NewState)
                                    465 ;	-----------------------------------------
                                    466 ;	 function ADC1_AWDChannelConfig
                                    467 ;	-----------------------------------------
      00AD88                        468 _ADC1_AWDChannelConfig:
      00AD88 52 02            [ 2]  469 	sub	sp, #2
                                    470 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 411: if (Channel < (uint8_t)8)
      00AD8A 7B 05            [ 1]  471 	ld	a, (0x05, sp)
      00AD8C A1 08            [ 1]  472 	cp	a, #0x08
      00AD8E 24 25            [ 1]  473 	jrnc	00108$
                                    474 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 415: ADC1->AWCRL |= (uint8_t)((uint8_t)1 << Channel);
      00AD90 C6 54 0F         [ 1]  475 	ld	a, 0x540f
      00AD93 6B 01            [ 1]  476 	ld	(0x01, sp), a
      00AD95 A6 01            [ 1]  477 	ld	a, #0x01
      00AD97 88               [ 1]  478 	push	a
      00AD98 7B 06            [ 1]  479 	ld	a, (0x06, sp)
      00AD9A 27 05            [ 1]  480 	jreq	00129$
      00AD9C                        481 00128$:
      00AD9C 08 01            [ 1]  482 	sll	(1, sp)
      00AD9E 4A               [ 1]  483 	dec	a
      00AD9F 26 FB            [ 1]  484 	jrne	00128$
      00ADA1                        485 00129$:
      00ADA1 84               [ 1]  486 	pop	a
                                    487 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 413: if (NewState != DISABLE)
      00ADA2 0D 06            [ 1]  488 	tnz	(0x06, sp)
      00ADA4 27 07            [ 1]  489 	jreq	00102$
                                    490 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 415: ADC1->AWCRL |= (uint8_t)((uint8_t)1 << Channel);
      00ADA6 1A 01            [ 1]  491 	or	a, (0x01, sp)
      00ADA8 C7 54 0F         [ 1]  492 	ld	0x540f, a
      00ADAB 20 30            [ 2]  493 	jra	00110$
      00ADAD                        494 00102$:
                                    495 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 419: ADC1->AWCRL &= (uint8_t)~(uint8_t)((uint8_t)1 << Channel);
      00ADAD 43               [ 1]  496 	cpl	a
      00ADAE 14 01            [ 1]  497 	and	a, (0x01, sp)
      00ADB0 C7 54 0F         [ 1]  498 	ld	0x540f, a
      00ADB3 20 28            [ 2]  499 	jra	00110$
      00ADB5                        500 00108$:
                                    501 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 426: ADC1->AWCRH |= (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8));
      00ADB5 C6 54 0E         [ 1]  502 	ld	a, 0x540e
      00ADB8 6B 02            [ 1]  503 	ld	(0x02, sp), a
      00ADBA 7B 05            [ 1]  504 	ld	a, (0x05, sp)
      00ADBC A0 08            [ 1]  505 	sub	a, #0x08
      00ADBE 97               [ 1]  506 	ld	xl, a
      00ADBF A6 01            [ 1]  507 	ld	a, #0x01
      00ADC1 88               [ 1]  508 	push	a
      00ADC2 9F               [ 1]  509 	ld	a, xl
      00ADC3 4D               [ 1]  510 	tnz	a
      00ADC4 27 05            [ 1]  511 	jreq	00132$
      00ADC6                        512 00131$:
      00ADC6 08 01            [ 1]  513 	sll	(1, sp)
      00ADC8 4A               [ 1]  514 	dec	a
      00ADC9 26 FB            [ 1]  515 	jrne	00131$
      00ADCB                        516 00132$:
      00ADCB 84               [ 1]  517 	pop	a
                                    518 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 424: if (NewState != DISABLE)
      00ADCC 0D 06            [ 1]  519 	tnz	(0x06, sp)
      00ADCE 27 07            [ 1]  520 	jreq	00105$
                                    521 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 426: ADC1->AWCRH |= (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8));
      00ADD0 1A 02            [ 1]  522 	or	a, (0x02, sp)
      00ADD2 C7 54 0E         [ 1]  523 	ld	0x540e, a
      00ADD5 20 06            [ 2]  524 	jra	00110$
      00ADD7                        525 00105$:
                                    526 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 430: ADC1->AWCRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (uint8_t)(Channel - (uint8_t)8));
      00ADD7 43               [ 1]  527 	cpl	a
      00ADD8 14 02            [ 1]  528 	and	a, (0x02, sp)
      00ADDA C7 54 0E         [ 1]  529 	ld	0x540e, a
      00ADDD                        530 00110$:
                                    531 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 433: }
      00ADDD 5B 02            [ 2]  532 	addw	sp, #2
      00ADDF 81               [ 4]  533 	ret
                                    534 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 441: void ADC1_SetHighThreshold(uint16_t Threshold)
                                    535 ;	-----------------------------------------
                                    536 ;	 function ADC1_SetHighThreshold
                                    537 ;	-----------------------------------------
      00ADE0                        538 _ADC1_SetHighThreshold:
                                    539 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 443: ADC1->HTRH = (uint8_t)(Threshold >> (uint8_t)2);
      00ADE0 1E 03            [ 2]  540 	ldw	x, (0x03, sp)
      00ADE2 54               [ 2]  541 	srlw	x
      00ADE3 54               [ 2]  542 	srlw	x
      00ADE4 9F               [ 1]  543 	ld	a, xl
      00ADE5 C7 54 08         [ 1]  544 	ld	0x5408, a
                                    545 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 444: ADC1->HTRL = (uint8_t)Threshold;
      00ADE8 7B 04            [ 1]  546 	ld	a, (0x04, sp)
      00ADEA C7 54 09         [ 1]  547 	ld	0x5409, a
                                    548 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 445: }
      00ADED 81               [ 4]  549 	ret
                                    550 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 453: void ADC1_SetLowThreshold(uint16_t Threshold)
                                    551 ;	-----------------------------------------
                                    552 ;	 function ADC1_SetLowThreshold
                                    553 ;	-----------------------------------------
      00ADEE                        554 _ADC1_SetLowThreshold:
                                    555 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 455: ADC1->LTRL = (uint8_t)Threshold;
      00ADEE 7B 04            [ 1]  556 	ld	a, (0x04, sp)
      00ADF0 C7 54 0B         [ 1]  557 	ld	0x540b, a
                                    558 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 456: ADC1->LTRH = (uint8_t)(Threshold >> (uint8_t)2);
      00ADF3 1E 03            [ 2]  559 	ldw	x, (0x03, sp)
      00ADF5 54               [ 2]  560 	srlw	x
      00ADF6 54               [ 2]  561 	srlw	x
      00ADF7 9F               [ 1]  562 	ld	a, xl
      00ADF8 C7 54 0A         [ 1]  563 	ld	0x540a, a
                                    564 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 457: }
      00ADFB 81               [ 4]  565 	ret
                                    566 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 466: uint16_t ADC1_GetBufferValue(uint8_t Buffer)
                                    567 ;	-----------------------------------------
                                    568 ;	 function ADC1_GetBufferValue
                                    569 ;	-----------------------------------------
      00ADFC                        570 _ADC1_GetBufferValue:
      00ADFC 52 0B            [ 2]  571 	sub	sp, #11
                                    572 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 474: if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
      00ADFE C6 54 02         [ 1]  573 	ld	a, 0x5402
      00AE01 6B 09            [ 1]  574 	ld	(0x09, sp), a
                                    575 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 477: templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
      00AE03 7B 0E            [ 1]  576 	ld	a, (0x0e, sp)
      00AE05 48               [ 1]  577 	sll	a
      00AE06 5F               [ 1]  578 	clrw	x
      00AE07 97               [ 1]  579 	ld	xl, a
      00AE08 51               [ 1]  580 	exgw	x, y
      00AE09 93               [ 1]  581 	ldw	x, y
      00AE0A 1C 53 E1         [ 2]  582 	addw	x, #0x53e1
                                    583 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 479: temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
      00AE0D 72 A9 53 E0      [ 2]  584 	addw	y, #0x53e0
                                    585 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 477: templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
                                    586 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 479: temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
                                    587 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 477: templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
      00AE11 F6               [ 1]  588 	ld	a, (x)
      00AE12 97               [ 1]  589 	ld	xl, a
                                    590 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 479: temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
      00AE13 90 F6            [ 1]  591 	ld	a, (y)
                                    592 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 474: if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
      00AE15 88               [ 1]  593 	push	a
      00AE16 7B 0A            [ 1]  594 	ld	a, (0x0a, sp)
      00AE18 A5 08            [ 1]  595 	bcp	a, #0x08
      00AE1A 84               [ 1]  596 	pop	a
      00AE1B 27 0E            [ 1]  597 	jreq	00102$
                                    598 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 477: templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
                                    599 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 479: temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
                                    600 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 481: temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
      00AE1D 0F 04            [ 1]  601 	clr	(0x04, sp)
      00AE1F 0F 0A            [ 1]  602 	clr	(0x0a, sp)
      00AE21 1A 0A            [ 1]  603 	or	a, (0x0a, sp)
      00AE23 01               [ 1]  604 	rrwa	x
      00AE24 1A 04            [ 1]  605 	or	a, (0x04, sp)
      00AE26 97               [ 1]  606 	ld	xl, a
      00AE27 1F 01            [ 2]  607 	ldw	(0x01, sp), x
      00AE29 20 19            [ 2]  608 	jra	00103$
      00AE2B                        609 00102$:
                                    610 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 486: temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
                                    611 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 488: templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
                                    612 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 490: temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)(temph << 8));
      00AE2B 02               [ 1]  613 	rlwa	x
      00AE2C 4F               [ 1]  614 	clr	a
      00AE2D 01               [ 1]  615 	rrwa	x
      00AE2E 58               [ 2]  616 	sllw	x
      00AE2F 58               [ 2]  617 	sllw	x
      00AE30 58               [ 2]  618 	sllw	x
      00AE31 58               [ 2]  619 	sllw	x
      00AE32 58               [ 2]  620 	sllw	x
      00AE33 58               [ 2]  621 	sllw	x
      00AE34 1F 05            [ 2]  622 	ldw	(0x05, sp), x
      00AE36 97               [ 1]  623 	ld	xl, a
      00AE37 7B 06            [ 1]  624 	ld	a, (0x06, sp)
      00AE39 6B 08            [ 1]  625 	ld	(0x08, sp), a
      00AE3B 9F               [ 1]  626 	ld	a, xl
      00AE3C 1A 05            [ 1]  627 	or	a, (0x05, sp)
      00AE3E 6B 01            [ 1]  628 	ld	(0x01, sp), a
      00AE40 7B 08            [ 1]  629 	ld	a, (0x08, sp)
      00AE42 6B 02            [ 1]  630 	ld	(0x02, sp), a
      00AE44                        631 00103$:
                                    632 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 493: return ((uint16_t)temph);
      00AE44 1E 01            [ 2]  633 	ldw	x, (0x01, sp)
                                    634 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 494: }
      00AE46 5B 0B            [ 2]  635 	addw	sp, #11
      00AE48 81               [ 4]  636 	ret
                                    637 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 502: FlagStatus ADC1_GetAWDChannelStatus(ADC1_Channel_TypeDef Channel)
                                    638 ;	-----------------------------------------
                                    639 ;	 function ADC1_GetAWDChannelStatus
                                    640 ;	-----------------------------------------
      00AE49                        641 _ADC1_GetAWDChannelStatus:
      00AE49 52 02            [ 2]  642 	sub	sp, #2
                                    643 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 509: if (Channel < (uint8_t)8)
      00AE4B 7B 05            [ 1]  644 	ld	a, (0x05, sp)
      00AE4D A1 08            [ 1]  645 	cp	a, #0x08
      00AE4F 24 16            [ 1]  646 	jrnc	00102$
                                    647 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 511: status = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << Channel));
      00AE51 C6 54 0D         [ 1]  648 	ld	a, 0x540d
      00AE54 88               [ 1]  649 	push	a
      00AE55 A6 01            [ 1]  650 	ld	a, #0x01
      00AE57 6B 03            [ 1]  651 	ld	(0x03, sp), a
      00AE59 7B 06            [ 1]  652 	ld	a, (0x06, sp)
      00AE5B 27 05            [ 1]  653 	jreq	00113$
      00AE5D                        654 00112$:
      00AE5D 08 03            [ 1]  655 	sll	(0x03, sp)
      00AE5F 4A               [ 1]  656 	dec	a
      00AE60 26 FB            [ 1]  657 	jrne	00112$
      00AE62                        658 00113$:
      00AE62 84               [ 1]  659 	pop	a
      00AE63 14 02            [ 1]  660 	and	a, (0x02, sp)
      00AE65 20 19            [ 2]  661 	jra	00103$
      00AE67                        662 00102$:
                                    663 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 515: status = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8)));
      00AE67 C6 54 0C         [ 1]  664 	ld	a, 0x540c
      00AE6A 97               [ 1]  665 	ld	xl, a
      00AE6B 7B 05            [ 1]  666 	ld	a, (0x05, sp)
      00AE6D A0 08            [ 1]  667 	sub	a, #0x08
      00AE6F 88               [ 1]  668 	push	a
      00AE70 A6 01            [ 1]  669 	ld	a, #0x01
      00AE72 6B 02            [ 1]  670 	ld	(0x02, sp), a
      00AE74 84               [ 1]  671 	pop	a
      00AE75 4D               [ 1]  672 	tnz	a
      00AE76 27 05            [ 1]  673 	jreq	00115$
      00AE78                        674 00114$:
      00AE78 08 01            [ 1]  675 	sll	(0x01, sp)
      00AE7A 4A               [ 1]  676 	dec	a
      00AE7B 26 FB            [ 1]  677 	jrne	00114$
      00AE7D                        678 00115$:
      00AE7D 9F               [ 1]  679 	ld	a, xl
      00AE7E 14 01            [ 1]  680 	and	a, (0x01, sp)
      00AE80                        681 00103$:
                                    682 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 518: return ((FlagStatus)status);
                                    683 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 519: }
      00AE80 5B 02            [ 2]  684 	addw	sp, #2
      00AE82 81               [ 4]  685 	ret
                                    686 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 527: FlagStatus ADC1_GetFlagStatus(ADC1_Flag_TypeDef Flag)
                                    687 ;	-----------------------------------------
                                    688 ;	 function ADC1_GetFlagStatus
                                    689 ;	-----------------------------------------
      00AE83                        690 _ADC1_GetFlagStatus:
      00AE83 52 04            [ 2]  691 	sub	sp, #4
                                    692 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 535: if ((Flag & 0x0F) == 0x01)
      00AE85 7B 07            [ 1]  693 	ld	a, (0x07, sp)
      00AE87 6B 03            [ 1]  694 	ld	(0x03, sp), a
      00AE89 0F 02            [ 1]  695 	clr	(0x02, sp)
      00AE8B 7B 03            [ 1]  696 	ld	a, (0x03, sp)
      00AE8D A4 0F            [ 1]  697 	and	a, #0x0f
      00AE8F 97               [ 1]  698 	ld	xl, a
      00AE90 4F               [ 1]  699 	clr	a
      00AE91 95               [ 1]  700 	ld	xh, a
      00AE92 5A               [ 2]  701 	decw	x
      00AE93 26 07            [ 1]  702 	jrne	00108$
                                    703 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 538: flagstatus = (uint8_t)(ADC1->CR3 & ADC1_CR3_OVR);
      00AE95 C6 54 03         [ 1]  704 	ld	a, 0x5403
      00AE98 A4 40            [ 1]  705 	and	a, #0x40
      00AE9A 20 49            [ 2]  706 	jra	00109$
      00AE9C                        707 00108$:
                                    708 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 540: else if ((Flag & 0xF0) == 0x10)
      00AE9C 7B 03            [ 1]  709 	ld	a, (0x03, sp)
      00AE9E A4 F0            [ 1]  710 	and	a, #0xf0
      00AEA0 97               [ 1]  711 	ld	xl, a
      00AEA1 4F               [ 1]  712 	clr	a
      00AEA2 95               [ 1]  713 	ld	xh, a
      00AEA3 A3 00 10         [ 2]  714 	cpw	x, #0x0010
      00AEA6 26 38            [ 1]  715 	jrne	00105$
                                    716 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 543: temp = (uint8_t)(Flag & (uint8_t)0x0F);
      00AEA8 7B 07            [ 1]  717 	ld	a, (0x07, sp)
      00AEAA A4 0F            [ 1]  718 	and	a, #0x0f
                                    719 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 544: if (temp < 8)
      00AEAC 97               [ 1]  720 	ld	xl, a
      00AEAD A1 08            [ 1]  721 	cp	a, #0x08
      00AEAF 24 16            [ 1]  722 	jrnc	00102$
                                    723 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 546: flagstatus = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
      00AEB1 C6 54 0D         [ 1]  724 	ld	a, 0x540d
      00AEB4 6B 04            [ 1]  725 	ld	(0x04, sp), a
      00AEB6 A6 01            [ 1]  726 	ld	a, #0x01
      00AEB8 88               [ 1]  727 	push	a
      00AEB9 9F               [ 1]  728 	ld	a, xl
      00AEBA 4D               [ 1]  729 	tnz	a
      00AEBB 27 05            [ 1]  730 	jreq	00135$
      00AEBD                        731 00134$:
      00AEBD 08 01            [ 1]  732 	sll	(1, sp)
      00AEBF 4A               [ 1]  733 	dec	a
      00AEC0 26 FB            [ 1]  734 	jrne	00134$
      00AEC2                        735 00135$:
      00AEC2 84               [ 1]  736 	pop	a
      00AEC3 14 04            [ 1]  737 	and	a, (0x04, sp)
      00AEC5 20 1E            [ 2]  738 	jra	00109$
      00AEC7                        739 00102$:
                                    740 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 550: flagstatus = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
      00AEC7 C6 54 0C         [ 1]  741 	ld	a, 0x540c
      00AECA 6B 01            [ 1]  742 	ld	(0x01, sp), a
      00AECC 1D 00 08         [ 2]  743 	subw	x, #8
      00AECF A6 01            [ 1]  744 	ld	a, #0x01
      00AED1 88               [ 1]  745 	push	a
      00AED2 9F               [ 1]  746 	ld	a, xl
      00AED3 4D               [ 1]  747 	tnz	a
      00AED4 27 05            [ 1]  748 	jreq	00137$
      00AED6                        749 00136$:
      00AED6 08 01            [ 1]  750 	sll	(1, sp)
      00AED8 4A               [ 1]  751 	dec	a
      00AED9 26 FB            [ 1]  752 	jrne	00136$
      00AEDB                        753 00137$:
      00AEDB 84               [ 1]  754 	pop	a
      00AEDC 14 01            [ 1]  755 	and	a, (0x01, sp)
      00AEDE 20 05            [ 2]  756 	jra	00109$
      00AEE0                        757 00105$:
                                    758 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 555: flagstatus = (uint8_t)(ADC1->CSR & Flag);
      00AEE0 C6 54 00         [ 1]  759 	ld	a, 0x5400
      00AEE3 14 07            [ 1]  760 	and	a, (0x07, sp)
      00AEE5                        761 00109$:
                                    762 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 557: return ((FlagStatus)flagstatus);
                                    763 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 559: }
      00AEE5 5B 04            [ 2]  764 	addw	sp, #4
      00AEE7 81               [ 4]  765 	ret
                                    766 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 567: void ADC1_ClearFlag(ADC1_Flag_TypeDef Flag)
                                    767 ;	-----------------------------------------
                                    768 ;	 function ADC1_ClearFlag
                                    769 ;	-----------------------------------------
      00AEE8                        770 _ADC1_ClearFlag:
      00AEE8 52 05            [ 2]  771 	sub	sp, #5
                                    772 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 574: if ((Flag & 0x0F) == 0x01)
      00AEEA 7B 08            [ 1]  773 	ld	a, (0x08, sp)
      00AEEC 0F 04            [ 1]  774 	clr	(0x04, sp)
      00AEEE 88               [ 1]  775 	push	a
      00AEEF A4 0F            [ 1]  776 	and	a, #0x0f
      00AEF1 97               [ 1]  777 	ld	xl, a
      00AEF2 4F               [ 1]  778 	clr	a
      00AEF3 95               [ 1]  779 	ld	xh, a
      00AEF4 84               [ 1]  780 	pop	a
      00AEF5 5A               [ 2]  781 	decw	x
      00AEF6 26 06            [ 1]  782 	jrne	00108$
                                    783 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 577: ADC1->CR3 &= (uint8_t)(~ADC1_CR3_OVR);
      00AEF8 72 1D 54 03      [ 1]  784 	bres	21507, #6
      00AEFC 20 57            [ 2]  785 	jra	00110$
      00AEFE                        786 00108$:
                                    787 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 579: else if ((Flag & 0xF0) == 0x10)
      00AEFE A4 F0            [ 1]  788 	and	a, #0xf0
      00AF00 97               [ 1]  789 	ld	xl, a
      00AF01 4F               [ 1]  790 	clr	a
      00AF02 95               [ 1]  791 	ld	xh, a
      00AF03 A3 00 10         [ 2]  792 	cpw	x, #0x0010
      00AF06 26 40            [ 1]  793 	jrne	00105$
                                    794 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 582: temp = (uint8_t)(Flag & (uint8_t)0x0F);
      00AF08 7B 08            [ 1]  795 	ld	a, (0x08, sp)
      00AF0A A4 0F            [ 1]  796 	and	a, #0x0f
                                    797 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 583: if (temp < 8)
      00AF0C 97               [ 1]  798 	ld	xl, a
      00AF0D A1 08            [ 1]  799 	cp	a, #0x08
      00AF0F 24 1A            [ 1]  800 	jrnc	00102$
                                    801 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 585: ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
      00AF11 C6 54 0D         [ 1]  802 	ld	a, 0x540d
      00AF14 6B 03            [ 1]  803 	ld	(0x03, sp), a
      00AF16 A6 01            [ 1]  804 	ld	a, #0x01
      00AF18 88               [ 1]  805 	push	a
      00AF19 9F               [ 1]  806 	ld	a, xl
      00AF1A 4D               [ 1]  807 	tnz	a
      00AF1B 27 05            [ 1]  808 	jreq	00135$
      00AF1D                        809 00134$:
      00AF1D 08 01            [ 1]  810 	sll	(1, sp)
      00AF1F 4A               [ 1]  811 	dec	a
      00AF20 26 FB            [ 1]  812 	jrne	00134$
      00AF22                        813 00135$:
      00AF22 84               [ 1]  814 	pop	a
      00AF23 43               [ 1]  815 	cpl	a
      00AF24 14 03            [ 1]  816 	and	a, (0x03, sp)
      00AF26 C7 54 0D         [ 1]  817 	ld	0x540d, a
      00AF29 20 2A            [ 2]  818 	jra	00110$
      00AF2B                        819 00102$:
                                    820 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 589: ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
      00AF2B C6 54 0C         [ 1]  821 	ld	a, 0x540c
      00AF2E 6B 02            [ 1]  822 	ld	(0x02, sp), a
      00AF30 1D 00 08         [ 2]  823 	subw	x, #8
      00AF33 A6 01            [ 1]  824 	ld	a, #0x01
      00AF35 88               [ 1]  825 	push	a
      00AF36 9F               [ 1]  826 	ld	a, xl
      00AF37 4D               [ 1]  827 	tnz	a
      00AF38 27 05            [ 1]  828 	jreq	00137$
      00AF3A                        829 00136$:
      00AF3A 08 01            [ 1]  830 	sll	(1, sp)
      00AF3C 4A               [ 1]  831 	dec	a
      00AF3D 26 FB            [ 1]  832 	jrne	00136$
      00AF3F                        833 00137$:
      00AF3F 84               [ 1]  834 	pop	a
      00AF40 43               [ 1]  835 	cpl	a
      00AF41 14 02            [ 1]  836 	and	a, (0x02, sp)
      00AF43 C7 54 0C         [ 1]  837 	ld	0x540c, a
      00AF46 20 0D            [ 2]  838 	jra	00110$
      00AF48                        839 00105$:
                                    840 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 594: ADC1->CSR &= (uint8_t) (~Flag);
      00AF48 C6 54 00         [ 1]  841 	ld	a, 0x5400
      00AF4B 6B 01            [ 1]  842 	ld	(0x01, sp), a
      00AF4D 7B 08            [ 1]  843 	ld	a, (0x08, sp)
      00AF4F 43               [ 1]  844 	cpl	a
      00AF50 14 01            [ 1]  845 	and	a, (0x01, sp)
      00AF52 C7 54 00         [ 1]  846 	ld	0x5400, a
      00AF55                        847 00110$:
                                    848 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 596: }
      00AF55 5B 05            [ 2]  849 	addw	sp, #5
      00AF57 81               [ 4]  850 	ret
                                    851 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 616: ITStatus ADC1_GetITStatus(ADC1_IT_TypeDef ITPendingBit)
                                    852 ;	-----------------------------------------
                                    853 ;	 function ADC1_GetITStatus
                                    854 ;	-----------------------------------------
      00AF58                        855 _ADC1_GetITStatus:
      00AF58 52 03            [ 2]  856 	sub	sp, #3
                                    857 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 624: if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
      00AF5A 7B 07            [ 1]  858 	ld	a, (0x07, sp)
      00AF5C A4 F0            [ 1]  859 	and	a, #0xf0
      00AF5E 97               [ 1]  860 	ld	xl, a
      00AF5F 4F               [ 1]  861 	clr	a
      00AF60 95               [ 1]  862 	ld	xh, a
                                    863 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 627: temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
      00AF61 7B 07            [ 1]  864 	ld	a, (0x07, sp)
                                    865 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 624: if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
      00AF63 A3 00 10         [ 2]  866 	cpw	x, #0x0010
      00AF66 26 36            [ 1]  867 	jrne	00105$
                                    868 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 627: temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
      00AF68 A4 0F            [ 1]  869 	and	a, #0x0f
                                    870 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 628: if (temp < 8)
      00AF6A 97               [ 1]  871 	ld	xl, a
      00AF6B A1 08            [ 1]  872 	cp	a, #0x08
      00AF6D 24 16            [ 1]  873 	jrnc	00102$
                                    874 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 630: itstatus = (ITStatus)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
      00AF6F C6 54 0D         [ 1]  875 	ld	a, 0x540d
      00AF72 88               [ 1]  876 	push	a
      00AF73 A6 01            [ 1]  877 	ld	a, #0x01
      00AF75 6B 02            [ 1]  878 	ld	(0x02, sp), a
      00AF77 9F               [ 1]  879 	ld	a, xl
      00AF78 4D               [ 1]  880 	tnz	a
      00AF79 27 05            [ 1]  881 	jreq	00124$
      00AF7B                        882 00123$:
      00AF7B 08 02            [ 1]  883 	sll	(0x02, sp)
      00AF7D 4A               [ 1]  884 	dec	a
      00AF7E 26 FB            [ 1]  885 	jrne	00123$
      00AF80                        886 00124$:
      00AF80 84               [ 1]  887 	pop	a
      00AF81 14 01            [ 1]  888 	and	a, (0x01, sp)
      00AF83 20 23            [ 2]  889 	jra	00106$
      00AF85                        890 00102$:
                                    891 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 634: itstatus = (ITStatus)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
      00AF85 C6 54 0C         [ 1]  892 	ld	a, 0x540c
      00AF88 6B 03            [ 1]  893 	ld	(0x03, sp), a
      00AF8A 1D 00 08         [ 2]  894 	subw	x, #8
      00AF8D A6 01            [ 1]  895 	ld	a, #0x01
      00AF8F 88               [ 1]  896 	push	a
      00AF90 9F               [ 1]  897 	ld	a, xl
      00AF91 4D               [ 1]  898 	tnz	a
      00AF92 27 05            [ 1]  899 	jreq	00126$
      00AF94                        900 00125$:
      00AF94 08 01            [ 1]  901 	sll	(1, sp)
      00AF96 4A               [ 1]  902 	dec	a
      00AF97 26 FB            [ 1]  903 	jrne	00125$
      00AF99                        904 00126$:
      00AF99 84               [ 1]  905 	pop	a
      00AF9A 14 03            [ 1]  906 	and	a, (0x03, sp)
      00AF9C 20 0A            [ 2]  907 	jra	00106$
      00AF9E                        908 00105$:
                                    909 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 639: itstatus = (ITStatus)(ADC1->CSR & (uint8_t)ITPendingBit);
      00AF9E AE 54 00         [ 2]  910 	ldw	x, #0x5400
      00AFA1 88               [ 1]  911 	push	a
      00AFA2 F6               [ 1]  912 	ld	a, (x)
      00AFA3 6B 03            [ 1]  913 	ld	(0x03, sp), a
      00AFA5 84               [ 1]  914 	pop	a
      00AFA6 14 02            [ 1]  915 	and	a, (0x02, sp)
      00AFA8                        916 00106$:
                                    917 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 641: return ((ITStatus)itstatus);
                                    918 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 642: }
      00AFA8 5B 03            [ 2]  919 	addw	sp, #3
      00AFAA 81               [ 4]  920 	ret
                                    921 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 662: void ADC1_ClearITPendingBit(ADC1_IT_TypeDef ITPendingBit)
                                    922 ;	-----------------------------------------
                                    923 ;	 function ADC1_ClearITPendingBit
                                    924 ;	-----------------------------------------
      00AFAB                        925 _ADC1_ClearITPendingBit:
      00AFAB 52 02            [ 2]  926 	sub	sp, #2
                                    927 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 669: if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
      00AFAD 7B 06            [ 1]  928 	ld	a, (0x06, sp)
      00AFAF A4 F0            [ 1]  929 	and	a, #0xf0
      00AFB1 97               [ 1]  930 	ld	xl, a
      00AFB2 4F               [ 1]  931 	clr	a
      00AFB3 95               [ 1]  932 	ld	xh, a
      00AFB4 A3 00 10         [ 2]  933 	cpw	x, #0x0010
      00AFB7 26 40            [ 1]  934 	jrne	00105$
                                    935 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 672: temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
      00AFB9 7B 06            [ 1]  936 	ld	a, (0x06, sp)
      00AFBB A4 0F            [ 1]  937 	and	a, #0x0f
                                    938 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 673: if (temp < 8)
      00AFBD 97               [ 1]  939 	ld	xl, a
      00AFBE A1 08            [ 1]  940 	cp	a, #0x08
      00AFC0 24 1A            [ 1]  941 	jrnc	00102$
                                    942 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 675: ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
      00AFC2 C6 54 0D         [ 1]  943 	ld	a, 0x540d
      00AFC5 6B 02            [ 1]  944 	ld	(0x02, sp), a
      00AFC7 A6 01            [ 1]  945 	ld	a, #0x01
      00AFC9 88               [ 1]  946 	push	a
      00AFCA 9F               [ 1]  947 	ld	a, xl
      00AFCB 4D               [ 1]  948 	tnz	a
      00AFCC 27 05            [ 1]  949 	jreq	00124$
      00AFCE                        950 00123$:
      00AFCE 08 01            [ 1]  951 	sll	(1, sp)
      00AFD0 4A               [ 1]  952 	dec	a
      00AFD1 26 FB            [ 1]  953 	jrne	00123$
      00AFD3                        954 00124$:
      00AFD3 84               [ 1]  955 	pop	a
      00AFD4 43               [ 1]  956 	cpl	a
      00AFD5 14 02            [ 1]  957 	and	a, (0x02, sp)
      00AFD7 C7 54 0D         [ 1]  958 	ld	0x540d, a
      00AFDA 20 2A            [ 2]  959 	jra	00107$
      00AFDC                        960 00102$:
                                    961 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 679: ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
      00AFDC C6 54 0C         [ 1]  962 	ld	a, 0x540c
      00AFDF 6B 01            [ 1]  963 	ld	(0x01, sp), a
      00AFE1 1D 00 08         [ 2]  964 	subw	x, #8
      00AFE4 A6 01            [ 1]  965 	ld	a, #0x01
      00AFE6 88               [ 1]  966 	push	a
      00AFE7 9F               [ 1]  967 	ld	a, xl
      00AFE8 4D               [ 1]  968 	tnz	a
      00AFE9 27 05            [ 1]  969 	jreq	00126$
      00AFEB                        970 00125$:
      00AFEB 08 01            [ 1]  971 	sll	(1, sp)
      00AFED 4A               [ 1]  972 	dec	a
      00AFEE 26 FB            [ 1]  973 	jrne	00125$
      00AFF0                        974 00126$:
      00AFF0 84               [ 1]  975 	pop	a
      00AFF1 43               [ 1]  976 	cpl	a
      00AFF2 14 01            [ 1]  977 	and	a, (0x01, sp)
      00AFF4 C7 54 0C         [ 1]  978 	ld	0x540c, a
      00AFF7 20 0D            [ 2]  979 	jra	00107$
      00AFF9                        980 00105$:
                                    981 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 684: ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ITPendingBit);
      00AFF9 C6 54 00         [ 1]  982 	ld	a, 0x5400
      00AFFC 1E 05            [ 2]  983 	ldw	x, (0x05, sp)
      00AFFE 53               [ 2]  984 	cplw	x
      00AFFF 89               [ 2]  985 	pushw	x
      00B000 14 02            [ 1]  986 	and	a, (2, sp)
      00B002 85               [ 2]  987 	popw	x
      00B003 C7 54 00         [ 1]  988 	ld	0x5400, a
      00B006                        989 00107$:
                                    990 ;	STM8S_StdPeriph_Lib/Libraries/STM8S_StdPeriph_Driver/src/stm8s_adc1.c: 686: }
      00B006 5B 02            [ 2]  991 	addw	sp, #2
      00B008 81               [ 4]  992 	ret
                                    993 	.area CODE
                                    994 	.area CONST
                                    995 	.area INITIALIZER
                                    996 	.area CABS (ABS)
