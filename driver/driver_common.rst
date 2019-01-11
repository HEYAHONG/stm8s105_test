                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.8.0 #10562 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module driver_common
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _Init_UART2
                                     12 	.globl _OLED_Clear
                                     13 	.globl _OLED_Init
                                     14 	.globl _key_init
                                     15 	.globl _ds1302_active
                                     16 	.globl _driver_init
                                     17 ;--------------------------------------------------------
                                     18 ; ram data
                                     19 ;--------------------------------------------------------
                                     20 	.area DATA
                                     21 ;--------------------------------------------------------
                                     22 ; ram data
                                     23 ;--------------------------------------------------------
                                     24 	.area INITIALIZED
                                     25 ;--------------------------------------------------------
                                     26 ; absolute external ram data
                                     27 ;--------------------------------------------------------
                                     28 	.area DABS (ABS)
                                     29 
                                     30 ; default segment ordering for linker
                                     31 	.area HOME
                                     32 	.area GSINIT
                                     33 	.area GSFINAL
                                     34 	.area CONST
                                     35 	.area INITIALIZER
                                     36 	.area CODE
                                     37 
                                     38 ;--------------------------------------------------------
                                     39 ; global & static initialisations
                                     40 ;--------------------------------------------------------
                                     41 	.area HOME
                                     42 	.area GSINIT
                                     43 	.area GSFINAL
                                     44 	.area GSINIT
                                     45 ;--------------------------------------------------------
                                     46 ; Home
                                     47 ;--------------------------------------------------------
                                     48 	.area HOME
                                     49 	.area HOME
                                     50 ;--------------------------------------------------------
                                     51 ; code
                                     52 ;--------------------------------------------------------
                                     53 	.area CODE
                                     54 ;	driver/driver_common.c: 2: void driver_init()
                                     55 ;	-----------------------------------------
                                     56 ;	 function driver_init
                                     57 ;	-----------------------------------------
      008F8E                         58 _driver_init:
                                     59 ;	driver/driver_common.c: 6: Init_UART2();
      008F8E CD 8F 9F         [ 4]   60 	call	_Init_UART2
                                     61 ;	driver/driver_common.c: 7: OLED_Init();
      008F91 CD 93 D4         [ 4]   62 	call	_OLED_Init
                                     63 ;	driver/driver_common.c: 8: ds1302_active();
      008F94 CD 8F 54         [ 4]   64 	call	_ds1302_active
                                     65 ;	driver/driver_common.c: 9: key_init();
      008F97 CD 90 A3         [ 4]   66 	call	_key_init
                                     67 ;	driver/driver_common.c: 10: OLED_Clear();
      008F9A CD 92 1C         [ 4]   68 	call	_OLED_Clear
                                     69 ;	driver/driver_common.c: 11: enableInterrupts(); 
      008F9D 9A               [ 1]   70 	rim
                                     71 ;	driver/driver_common.c: 12: }
      008F9E 81               [ 4]   72 	ret
                                     73 	.area CODE
                                     74 	.area CONST
                                     75 	.area INITIALIZER
                                     76 	.area CABS (ABS)
