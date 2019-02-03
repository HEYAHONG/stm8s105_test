                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.8.0 #10562 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module relay
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _GPIO_ReadInputPin
                                     12 	.globl _GPIO_WriteLow
                                     13 	.globl _GPIO_WriteHigh
                                     14 	.globl _GPIO_Init
                                     15 	.globl _relay_read
                                     16 	.globl _relay_on
                                     17 	.globl _relay_off
                                     18 ;--------------------------------------------------------
                                     19 ; ram data
                                     20 ;--------------------------------------------------------
                                     21 	.area DATA
                                     22 ;--------------------------------------------------------
                                     23 ; ram data
                                     24 ;--------------------------------------------------------
                                     25 	.area INITIALIZED
                                     26 ;--------------------------------------------------------
                                     27 ; absolute external ram data
                                     28 ;--------------------------------------------------------
                                     29 	.area DABS (ABS)
                                     30 
                                     31 ; default segment ordering for linker
                                     32 	.area HOME
                                     33 	.area GSINIT
                                     34 	.area GSFINAL
                                     35 	.area CONST
                                     36 	.area INITIALIZER
                                     37 	.area CODE
                                     38 
                                     39 ;--------------------------------------------------------
                                     40 ; global & static initialisations
                                     41 ;--------------------------------------------------------
                                     42 	.area HOME
                                     43 	.area GSINIT
                                     44 	.area GSFINAL
                                     45 	.area GSINIT
                                     46 ;--------------------------------------------------------
                                     47 ; Home
                                     48 ;--------------------------------------------------------
                                     49 	.area HOME
                                     50 	.area HOME
                                     51 ;--------------------------------------------------------
                                     52 ; code
                                     53 ;--------------------------------------------------------
                                     54 	.area CODE
                                     55 ;	driver/relay.c: 2: BitStatus  relay_read()
                                     56 ;	-----------------------------------------
                                     57 ;	 function relay_read
                                     58 ;	-----------------------------------------
      008AD2                         59 _relay_read:
                                     60 ;	driver/relay.c: 4: return GPIO_ReadInputPin(GPIOE,GPIO_PIN_5);
      008AD2 4B 20            [ 1]   61 	push	#0x20
      008AD4 4B 14            [ 1]   62 	push	#0x14
      008AD6 4B 50            [ 1]   63 	push	#0x50
      008AD8 CD A6 00         [ 4]   64 	call	_GPIO_ReadInputPin
      008ADB 5B 03            [ 2]   65 	addw	sp, #3
                                     66 ;	driver/relay.c: 5: }
      008ADD 81               [ 4]   67 	ret
                                     68 ;	driver/relay.c: 6: void relay_on()
                                     69 ;	-----------------------------------------
                                     70 ;	 function relay_on
                                     71 ;	-----------------------------------------
      008ADE                         72 _relay_on:
                                     73 ;	driver/relay.c: 8: GPIO_Init(GPIOE,GPIO_PIN_5, GPIO_MODE_OUT_PP_HIGH_SLOW);
      008ADE 4B D0            [ 1]   74 	push	#0xd0
      008AE0 4B 20            [ 1]   75 	push	#0x20
      008AE2 4B 14            [ 1]   76 	push	#0x14
      008AE4 4B 50            [ 1]   77 	push	#0x50
      008AE6 CD A5 60         [ 4]   78 	call	_GPIO_Init
      008AE9 5B 04            [ 2]   79 	addw	sp, #4
                                     80 ;	driver/relay.c: 9: GPIO_WriteHigh(GPIOE,GPIO_PIN_5);
      008AEB 4B 20            [ 1]   81 	push	#0x20
      008AED 4B 14            [ 1]   82 	push	#0x14
      008AEF 4B 50            [ 1]   83 	push	#0x50
      008AF1 CD A5 DB         [ 4]   84 	call	_GPIO_WriteHigh
      008AF4 5B 03            [ 2]   85 	addw	sp, #3
                                     86 ;	driver/relay.c: 10: }
      008AF6 81               [ 4]   87 	ret
                                     88 ;	driver/relay.c: 11: void relay_off()
                                     89 ;	-----------------------------------------
                                     90 ;	 function relay_off
                                     91 ;	-----------------------------------------
      008AF7                         92 _relay_off:
                                     93 ;	driver/relay.c: 13: GPIO_Init(GPIOE,GPIO_PIN_5, GPIO_MODE_OUT_PP_LOW_SLOW);
      008AF7 4B C0            [ 1]   94 	push	#0xc0
      008AF9 4B 20            [ 1]   95 	push	#0x20
      008AFB 4B 14            [ 1]   96 	push	#0x14
      008AFD 4B 50            [ 1]   97 	push	#0x50
      008AFF CD A5 60         [ 4]   98 	call	_GPIO_Init
      008B02 5B 04            [ 2]   99 	addw	sp, #4
                                    100 ;	driver/relay.c: 14: GPIO_WriteLow(GPIOE,GPIO_PIN_5);
      008B04 4B 20            [ 1]  101 	push	#0x20
      008B06 4B 14            [ 1]  102 	push	#0x14
      008B08 4B 50            [ 1]  103 	push	#0x50
      008B0A CD A5 E2         [ 4]  104 	call	_GPIO_WriteLow
      008B0D 5B 03            [ 2]  105 	addw	sp, #3
                                    106 ;	driver/relay.c: 15: }
      008B0F 81               [ 4]  107 	ret
                                    108 	.area CODE
                                    109 	.area CONST
                                    110 	.area INITIALIZER
                                    111 	.area CABS (ABS)
