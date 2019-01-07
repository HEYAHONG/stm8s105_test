                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.8.0 #10562 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module adc
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _GPIO_Init
                                     12 	.globl _ADC1_ClearFlag
                                     13 	.globl _ADC1_GetFlagStatus
                                     14 	.globl _ADC1_GetConversionValue
                                     15 	.globl _ADC1_StartConversion
                                     16 	.globl _ADC1_ExternalTriggerConfig
                                     17 	.globl _ADC1_ConversionConfig
                                     18 	.globl _ADC1_PrescalerConfig
                                     19 	.globl _ADC1_Cmd
                                     20 	.globl _ADC1_DeInit
                                     21 	.globl _ReadADC
                                     22 ;--------------------------------------------------------
                                     23 ; ram data
                                     24 ;--------------------------------------------------------
                                     25 	.area DATA
                                     26 ;--------------------------------------------------------
                                     27 ; ram data
                                     28 ;--------------------------------------------------------
                                     29 	.area INITIALIZED
                                     30 ;--------------------------------------------------------
                                     31 ; absolute external ram data
                                     32 ;--------------------------------------------------------
                                     33 	.area DABS (ABS)
                                     34 
                                     35 ; default segment ordering for linker
                                     36 	.area HOME
                                     37 	.area GSINIT
                                     38 	.area GSFINAL
                                     39 	.area CONST
                                     40 	.area INITIALIZER
                                     41 	.area CODE
                                     42 
                                     43 ;--------------------------------------------------------
                                     44 ; global & static initialisations
                                     45 ;--------------------------------------------------------
                                     46 	.area HOME
                                     47 	.area GSINIT
                                     48 	.area GSFINAL
                                     49 	.area GSINIT
                                     50 ;--------------------------------------------------------
                                     51 ; Home
                                     52 ;--------------------------------------------------------
                                     53 	.area HOME
                                     54 	.area HOME
                                     55 ;--------------------------------------------------------
                                     56 ; code
                                     57 ;--------------------------------------------------------
                                     58 	.area CODE
                                     59 ;	driver/adc.c: 3: u16 ReadADC()
                                     60 ;	-----------------------------------------
                                     61 ;	 function ReadADC
                                     62 ;	-----------------------------------------
      009463                         63 _ReadADC:
                                     64 ;	driver/adc.c: 6: ADC1_DeInit();
      009463 CD 95 87         [ 4]   65 	call	_ADC1_DeInit
                                     66 ;	driver/adc.c: 7: ADC1_ClearFlag(ADC1_FLAG_EOC);//软件清除
      009466 4B 80            [ 1]   67 	push	#0x80
      009468 CD 98 CA         [ 4]   68 	call	_ADC1_ClearFlag
      00946B 84               [ 1]   69 	pop	a
                                     70 ;	driver/adc.c: 9: GPIO_Init(ADC_GPIO,ADC_PIN,GPIO_MODE_IN_FL_NO_IT);//AIN4 IO设置为悬浮输入
      00946C 4B 00            [ 1]   71 	push	#0x00
      00946E 4B 01            [ 1]   72 	push	#0x01
      009470 4B 05            [ 1]   73 	push	#0x05
      009472 4B 50            [ 1]   74 	push	#0x50
      009474 CD 94 C4         [ 4]   75 	call	_GPIO_Init
      009477 5B 04            [ 2]   76 	addw	sp, #4
                                     77 ;	driver/adc.c: 11: ADC1_PrescalerConfig(ADC1_PRESSEL_FCPU_D2);//预分频2
      009479 4B 00            [ 1]   78 	push	#0x00
      00947B CD 96 3F         [ 4]   79 	call	_ADC1_PrescalerConfig
      00947E 84               [ 1]   80 	pop	a
                                     81 ;	driver/adc.c: 13: ADC1_ExternalTriggerConfig(ADC1_EXTTRIG_TIM,DISABLE);//不使用外部触发
      00947F 4B 00            [ 1]   82 	push	#0x00
      009481 4B 00            [ 1]   83 	push	#0x00
      009483 CD 97 01         [ 4]   84 	call	_ADC1_ExternalTriggerConfig
      009486 5B 02            [ 2]   85 	addw	sp, #2
                                     86 ;	driver/adc.c: 23: ADC1_ConversionConfig(ADC1_CONVERSIONMODE_SINGLE,//单次转换
      009488 4B 08            [ 1]   87 	push	#0x08
      00948A 4B 00            [ 1]   88 	push	#0x00
      00948C 4B 00            [ 1]   89 	push	#0x00
      00948E CD 96 CE         [ 4]   90 	call	_ADC1_ConversionConfig
      009491 5B 03            [ 2]   91 	addw	sp, #3
                                     92 ;	driver/adc.c: 29: ADC1_Cmd(ENABLE);//开启ADC
      009493 4B 01            [ 1]   93 	push	#0x01
      009495 CD 95 E8         [ 4]   94 	call	_ADC1_Cmd
      009498 84               [ 1]   95 	pop	a
                                     96 ;	driver/adc.c: 30: ADC1_StartConversion();
      009499 CD 97 25         [ 4]   97 	call	_ADC1_StartConversion
                                     98 ;	driver/adc.c: 31: while(!ADC1_GetFlagStatus(ADC1_FLAG_EOC));//等待转换完成
      00949C                         99 00101$:
      00949C 4B 80            [ 1]  100 	push	#0x80
      00949E CD 98 65         [ 4]  101 	call	_ADC1_GetFlagStatus
      0094A1 5B 01            [ 2]  102 	addw	sp, #1
      0094A3 4D               [ 1]  103 	tnz	a
      0094A4 27 F6            [ 1]  104 	jreq	00101$
                                    105 ;	driver/adc.c: 33: ADC1_ClearFlag(ADC1_FLAG_EOC);//软件清除
      0094A6 4B 80            [ 1]  106 	push	#0x80
      0094A8 CD 98 CA         [ 4]  107 	call	_ADC1_ClearFlag
      0094AB 84               [ 1]  108 	pop	a
                                    109 ;	driver/adc.c: 34: u16 ret=ADC1_GetConversionValue();//从ADC_DR中读取ADC值
      0094AC CD 97 2A         [ 4]  110 	call	_ADC1_GetConversionValue
                                    111 ;	driver/adc.c: 35: ADC1_DeInit();
      0094AF 89               [ 2]  112 	pushw	x
      0094B0 CD 95 87         [ 4]  113 	call	_ADC1_DeInit
      0094B3 85               [ 2]  114 	popw	x
                                    115 ;	driver/adc.c: 36: return ret;
                                    116 ;	driver/adc.c: 38: }
      0094B4 81               [ 4]  117 	ret
                                    118 	.area CODE
                                    119 	.area CONST
                                    120 	.area INITIALIZER
                                    121 	.area CABS (ABS)
