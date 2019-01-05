                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.8.0 #10562 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_it
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _EEPROM_EEC_IRQHandler
                                     12 	.globl _TIM4_UPD_OVF_IRQHandler
                                     13 	.globl _ADC1_IRQHandler
                                     14 	.globl _UART2_RX_IRQHandler
                                     15 	.globl _UART2_TX_IRQHandler
                                     16 	.globl _I2C_IRQHandler
                                     17 	.globl _TIM3_CAP_COM_IRQHandler
                                     18 	.globl _TIM3_UPD_OVF_BRK_IRQHandler
                                     19 	.globl _TIM2_CAP_COM_IRQHandler
                                     20 	.globl _TIM2_UPD_OVF_BRK_IRQHandler
                                     21 	.globl _TIM1_CAP_COM_IRQHandler
                                     22 	.globl _TIM1_UPD_OVF_TRG_BRK_IRQHandler
                                     23 	.globl _SPI_IRQHandler
                                     24 	.globl _EXTI_PORTE_IRQHandler
                                     25 	.globl _EXTI_PORTD_IRQHandler
                                     26 	.globl _EXTI_PORTC_IRQHandler
                                     27 	.globl _EXTI_PORTB_IRQHandler
                                     28 	.globl _EXTI_PORTA_IRQHandler
                                     29 	.globl _CLK_IRQHandler
                                     30 	.globl _AWU_IRQHandler
                                     31 	.globl _TLI_IRQHandler
                                     32 	.globl _TRAP_IRQHandler
                                     33 ;--------------------------------------------------------
                                     34 ; ram data
                                     35 ;--------------------------------------------------------
                                     36 	.area DATA
                                     37 ;--------------------------------------------------------
                                     38 ; ram data
                                     39 ;--------------------------------------------------------
                                     40 	.area INITIALIZED
                                     41 ;--------------------------------------------------------
                                     42 ; absolute external ram data
                                     43 ;--------------------------------------------------------
                                     44 	.area DABS (ABS)
                                     45 
                                     46 ; default segment ordering for linker
                                     47 	.area HOME
                                     48 	.area GSINIT
                                     49 	.area GSFINAL
                                     50 	.area CONST
                                     51 	.area INITIALIZER
                                     52 	.area CODE
                                     53 
                                     54 ;--------------------------------------------------------
                                     55 ; global & static initialisations
                                     56 ;--------------------------------------------------------
                                     57 	.area HOME
                                     58 	.area GSINIT
                                     59 	.area GSFINAL
                                     60 	.area GSINIT
                                     61 ;--------------------------------------------------------
                                     62 ; Home
                                     63 ;--------------------------------------------------------
                                     64 	.area HOME
                                     65 	.area HOME
                                     66 ;--------------------------------------------------------
                                     67 ; code
                                     68 ;--------------------------------------------------------
                                     69 	.area CODE
                                     70 ;	stm8s_it.c: 67: INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
                                     71 ;	-----------------------------------------
                                     72 ;	 function TRAP_IRQHandler
                                     73 ;	-----------------------------------------
      009007                         74 _TRAP_IRQHandler:
                                     75 ;	stm8s_it.c: 74: }
      009007 80               [11]   76 	iret
                                     77 ;	stm8s_it.c: 81: INTERRUPT_HANDLER(TLI_IRQHandler, 0)
                                     78 ;	-----------------------------------------
                                     79 ;	 function TLI_IRQHandler
                                     80 ;	-----------------------------------------
      009008                         81 _TLI_IRQHandler:
                                     82 ;	stm8s_it.c: 87: }
      009008 80               [11]   83 	iret
                                     84 ;	stm8s_it.c: 94: INTERRUPT_HANDLER(AWU_IRQHandler, 1)
                                     85 ;	-----------------------------------------
                                     86 ;	 function AWU_IRQHandler
                                     87 ;	-----------------------------------------
      009009                         88 _AWU_IRQHandler:
                                     89 ;	stm8s_it.c: 99: }
      009009 80               [11]   90 	iret
                                     91 ;	stm8s_it.c: 106: INTERRUPT_HANDLER(CLK_IRQHandler, 2)
                                     92 ;	-----------------------------------------
                                     93 ;	 function CLK_IRQHandler
                                     94 ;	-----------------------------------------
      00900A                         95 _CLK_IRQHandler:
                                     96 ;	stm8s_it.c: 111: }
      00900A 80               [11]   97 	iret
                                     98 ;	stm8s_it.c: 118: INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
                                     99 ;	-----------------------------------------
                                    100 ;	 function EXTI_PORTA_IRQHandler
                                    101 ;	-----------------------------------------
      00900B                        102 _EXTI_PORTA_IRQHandler:
                                    103 ;	stm8s_it.c: 123: }
      00900B 80               [11]  104 	iret
                                    105 ;	stm8s_it.c: 130: INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
                                    106 ;	-----------------------------------------
                                    107 ;	 function EXTI_PORTB_IRQHandler
                                    108 ;	-----------------------------------------
      00900C                        109 _EXTI_PORTB_IRQHandler:
                                    110 ;	stm8s_it.c: 135: }
      00900C 80               [11]  111 	iret
                                    112 ;	stm8s_it.c: 142: INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
                                    113 ;	-----------------------------------------
                                    114 ;	 function EXTI_PORTC_IRQHandler
                                    115 ;	-----------------------------------------
      00900D                        116 _EXTI_PORTC_IRQHandler:
                                    117 ;	stm8s_it.c: 147: }
      00900D 80               [11]  118 	iret
                                    119 ;	stm8s_it.c: 154: INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
                                    120 ;	-----------------------------------------
                                    121 ;	 function EXTI_PORTD_IRQHandler
                                    122 ;	-----------------------------------------
      00900E                        123 _EXTI_PORTD_IRQHandler:
                                    124 ;	stm8s_it.c: 159: }
      00900E 80               [11]  125 	iret
                                    126 ;	stm8s_it.c: 166: INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
                                    127 ;	-----------------------------------------
                                    128 ;	 function EXTI_PORTE_IRQHandler
                                    129 ;	-----------------------------------------
      00900F                        130 _EXTI_PORTE_IRQHandler:
                                    131 ;	stm8s_it.c: 171: }
      00900F 80               [11]  132 	iret
                                    133 ;	stm8s_it.c: 218: INTERRUPT_HANDLER(SPI_IRQHandler, 10)
                                    134 ;	-----------------------------------------
                                    135 ;	 function SPI_IRQHandler
                                    136 ;	-----------------------------------------
      009010                        137 _SPI_IRQHandler:
                                    138 ;	stm8s_it.c: 223: }
      009010 80               [11]  139 	iret
                                    140 ;	stm8s_it.c: 230: INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
                                    141 ;	-----------------------------------------
                                    142 ;	 function TIM1_UPD_OVF_TRG_BRK_IRQHandler
                                    143 ;	-----------------------------------------
      009011                        144 _TIM1_UPD_OVF_TRG_BRK_IRQHandler:
                                    145 ;	stm8s_it.c: 235: }
      009011 80               [11]  146 	iret
                                    147 ;	stm8s_it.c: 242: INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
                                    148 ;	-----------------------------------------
                                    149 ;	 function TIM1_CAP_COM_IRQHandler
                                    150 ;	-----------------------------------------
      009012                        151 _TIM1_CAP_COM_IRQHandler:
                                    152 ;	stm8s_it.c: 247: }
      009012 80               [11]  153 	iret
                                    154 ;	stm8s_it.c: 280: INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
                                    155 ;	-----------------------------------------
                                    156 ;	 function TIM2_UPD_OVF_BRK_IRQHandler
                                    157 ;	-----------------------------------------
      009013                        158 _TIM2_UPD_OVF_BRK_IRQHandler:
                                    159 ;	stm8s_it.c: 285: }
      009013 80               [11]  160 	iret
                                    161 ;	stm8s_it.c: 292: INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
                                    162 ;	-----------------------------------------
                                    163 ;	 function TIM2_CAP_COM_IRQHandler
                                    164 ;	-----------------------------------------
      009014                        165 _TIM2_CAP_COM_IRQHandler:
                                    166 ;	stm8s_it.c: 297: }
      009014 80               [11]  167 	iret
                                    168 ;	stm8s_it.c: 307: INTERRUPT_HANDLER(TIM3_UPD_OVF_BRK_IRQHandler, 15)
                                    169 ;	-----------------------------------------
                                    170 ;	 function TIM3_UPD_OVF_BRK_IRQHandler
                                    171 ;	-----------------------------------------
      009015                        172 _TIM3_UPD_OVF_BRK_IRQHandler:
                                    173 ;	stm8s_it.c: 312: }
      009015 80               [11]  174 	iret
                                    175 ;	stm8s_it.c: 319: INTERRUPT_HANDLER(TIM3_CAP_COM_IRQHandler, 16)
                                    176 ;	-----------------------------------------
                                    177 ;	 function TIM3_CAP_COM_IRQHandler
                                    178 ;	-----------------------------------------
      009016                        179 _TIM3_CAP_COM_IRQHandler:
                                    180 ;	stm8s_it.c: 324: }
      009016 80               [11]  181 	iret
                                    182 ;	stm8s_it.c: 389: INTERRUPT_HANDLER(I2C_IRQHandler, 19)
                                    183 ;	-----------------------------------------
                                    184 ;	 function I2C_IRQHandler
                                    185 ;	-----------------------------------------
      009017                        186 _I2C_IRQHandler:
                                    187 ;	stm8s_it.c: 394: }
      009017 80               [11]  188 	iret
                                    189 ;	stm8s_it.c: 402: INTERRUPT_HANDLER(UART2_TX_IRQHandler, 20)
                                    190 ;	-----------------------------------------
                                    191 ;	 function UART2_TX_IRQHandler
                                    192 ;	-----------------------------------------
      009018                        193 _UART2_TX_IRQHandler:
                                    194 ;	stm8s_it.c: 407: }
      009018 80               [11]  195 	iret
                                    196 ;	stm8s_it.c: 414: INTERRUPT_HANDLER(UART2_RX_IRQHandler, 21)
                                    197 ;	-----------------------------------------
                                    198 ;	 function UART2_RX_IRQHandler
                                    199 ;	-----------------------------------------
      009019                        200 _UART2_RX_IRQHandler:
                                    201 ;	stm8s_it.c: 419: }
      009019 80               [11]  202 	iret
                                    203 ;	stm8s_it.c: 468: INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
                                    204 ;	-----------------------------------------
                                    205 ;	 function ADC1_IRQHandler
                                    206 ;	-----------------------------------------
      00901A                        207 _ADC1_IRQHandler:
                                    208 ;	stm8s_it.c: 473: }
      00901A 80               [11]  209 	iret
                                    210 ;	stm8s_it.c: 494: INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
                                    211 ;	-----------------------------------------
                                    212 ;	 function TIM4_UPD_OVF_IRQHandler
                                    213 ;	-----------------------------------------
      00901B                        214 _TIM4_UPD_OVF_IRQHandler:
                                    215 ;	stm8s_it.c: 499: }
      00901B 80               [11]  216 	iret
                                    217 ;	stm8s_it.c: 507: INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
                                    218 ;	-----------------------------------------
                                    219 ;	 function EEPROM_EEC_IRQHandler
                                    220 ;	-----------------------------------------
      00901C                        221 _EEPROM_EEC_IRQHandler:
                                    222 ;	stm8s_it.c: 512: }
      00901C 80               [11]  223 	iret
                                    224 	.area CODE
                                    225 	.area CONST
                                    226 	.area INITIALIZER
                                    227 	.area CABS (ABS)
