                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.8.0 #10562 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module beep
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _GPIO_ReadInputPin
                                     12 	.globl _GPIO_WriteLow
                                     13 	.globl _GPIO_WriteHigh
                                     14 	.globl _GPIO_Init
                                     15 	.globl _beep_init
                                     16 	.globl _beep_read
                                     17 	.globl _beep_on
                                     18 	.globl _beep_off
                                     19 ;--------------------------------------------------------
                                     20 ; ram data
                                     21 ;--------------------------------------------------------
                                     22 	.area DATA
                                     23 ;--------------------------------------------------------
                                     24 ; ram data
                                     25 ;--------------------------------------------------------
                                     26 	.area INITIALIZED
                                     27 ;--------------------------------------------------------
                                     28 ; absolute external ram data
                                     29 ;--------------------------------------------------------
                                     30 	.area DABS (ABS)
                                     31 
                                     32 ; default segment ordering for linker
                                     33 	.area HOME
                                     34 	.area GSINIT
                                     35 	.area GSFINAL
                                     36 	.area CONST
                                     37 	.area INITIALIZER
                                     38 	.area CODE
                                     39 
                                     40 ;--------------------------------------------------------
                                     41 ; global & static initialisations
                                     42 ;--------------------------------------------------------
                                     43 	.area HOME
                                     44 	.area GSINIT
                                     45 	.area GSFINAL
                                     46 	.area GSINIT
                                     47 ;--------------------------------------------------------
                                     48 ; Home
                                     49 ;--------------------------------------------------------
                                     50 	.area HOME
                                     51 	.area HOME
                                     52 ;--------------------------------------------------------
                                     53 ; code
                                     54 ;--------------------------------------------------------
                                     55 	.area CODE
                                     56 ;	driver/beep.c: 2: void beep_init()
                                     57 ;	-----------------------------------------
                                     58 ;	 function beep_init
                                     59 ;	-----------------------------------------
      009462                         60 _beep_init:
                                     61 ;	driver/beep.c: 4: GPIO_Init(GPIOD, GPIO_PIN_7, GPIO_MODE_OUT_OD_LOW_SLOW);
      009462 4B 80            [ 1]   62 	push	#0x80
      009464 4B 80            [ 1]   63 	push	#0x80
      009466 4B 0F            [ 1]   64 	push	#0x0f
      009468 4B 50            [ 1]   65 	push	#0x50
      00946A CD A5 60         [ 4]   66 	call	_GPIO_Init
      00946D 5B 04            [ 2]   67 	addw	sp, #4
                                     68 ;	driver/beep.c: 5: }
      00946F 81               [ 4]   69 	ret
                                     70 ;	driver/beep.c: 7: BitStatus beep_read()
                                     71 ;	-----------------------------------------
                                     72 ;	 function beep_read
                                     73 ;	-----------------------------------------
      009470                         74 _beep_read:
                                     75 ;	driver/beep.c: 9: return GPIO_ReadInputPin(GPIOD,GPIO_PIN_7);
      009470 4B 80            [ 1]   76 	push	#0x80
      009472 4B 0F            [ 1]   77 	push	#0x0f
      009474 4B 50            [ 1]   78 	push	#0x50
      009476 CD A6 00         [ 4]   79 	call	_GPIO_ReadInputPin
      009479 5B 03            [ 2]   80 	addw	sp, #3
                                     81 ;	driver/beep.c: 10: }
      00947B 81               [ 4]   82 	ret
                                     83 ;	driver/beep.c: 11: void beep_on()
                                     84 ;	-----------------------------------------
                                     85 ;	 function beep_on
                                     86 ;	-----------------------------------------
      00947C                         87 _beep_on:
                                     88 ;	driver/beep.c: 13: GPIO_Init(GPIOD, GPIO_PIN_7, GPIO_MODE_OUT_PP_HIGH_SLOW);
      00947C 4B D0            [ 1]   89 	push	#0xd0
      00947E 4B 80            [ 1]   90 	push	#0x80
      009480 4B 0F            [ 1]   91 	push	#0x0f
      009482 4B 50            [ 1]   92 	push	#0x50
      009484 CD A5 60         [ 4]   93 	call	_GPIO_Init
      009487 5B 04            [ 2]   94 	addw	sp, #4
                                     95 ;	driver/beep.c: 14: GPIO_WriteHigh(GPIOD,GPIO_PIN_7);
      009489 4B 80            [ 1]   96 	push	#0x80
      00948B 4B 0F            [ 1]   97 	push	#0x0f
      00948D 4B 50            [ 1]   98 	push	#0x50
      00948F CD A5 DB         [ 4]   99 	call	_GPIO_WriteHigh
      009492 5B 03            [ 2]  100 	addw	sp, #3
                                    101 ;	driver/beep.c: 15: }
      009494 81               [ 4]  102 	ret
                                    103 ;	driver/beep.c: 16: void beep_off()
                                    104 ;	-----------------------------------------
                                    105 ;	 function beep_off
                                    106 ;	-----------------------------------------
      009495                        107 _beep_off:
                                    108 ;	driver/beep.c: 18: GPIO_Init(GPIOD, GPIO_PIN_7, GPIO_MODE_OUT_PP_LOW_SLOW);
      009495 4B C0            [ 1]  109 	push	#0xc0
      009497 4B 80            [ 1]  110 	push	#0x80
      009499 4B 0F            [ 1]  111 	push	#0x0f
      00949B 4B 50            [ 1]  112 	push	#0x50
      00949D CD A5 60         [ 4]  113 	call	_GPIO_Init
      0094A0 5B 04            [ 2]  114 	addw	sp, #4
                                    115 ;	driver/beep.c: 19: GPIO_WriteLow(GPIOD,GPIO_PIN_7);
      0094A2 4B 80            [ 1]  116 	push	#0x80
      0094A4 4B 0F            [ 1]  117 	push	#0x0f
      0094A6 4B 50            [ 1]  118 	push	#0x50
      0094A8 CD A5 E2         [ 4]  119 	call	_GPIO_WriteLow
      0094AB 5B 03            [ 2]  120 	addw	sp, #3
                                    121 ;	driver/beep.c: 20: }
      0094AD 81               [ 4]  122 	ret
                                    123 	.area CODE
                                    124 	.area CONST
                                    125 	.area INITIALIZER
                                    126 	.area CABS (ABS)
