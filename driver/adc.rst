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
                                     11 	.globl _GPIO_ReadInputPin
                                     12 	.globl _GPIO_Init
                                     13 	.globl _ADC1_ClearFlag
                                     14 	.globl _ADC1_GetFlagStatus
                                     15 	.globl _ADC1_GetConversionValue
                                     16 	.globl _ADC1_StartConversion
                                     17 	.globl _ADC1_ExternalTriggerConfig
                                     18 	.globl _ADC1_ConversionConfig
                                     19 	.globl _ADC1_SchmittTriggerConfig
                                     20 	.globl _ADC1_PrescalerConfig
                                     21 	.globl _ADC1_Cmd
                                     22 	.globl _ADC1_DeInit
                                     23 	.globl _ReadADC
                                     24 	.globl _ReadDin
                                     25 ;--------------------------------------------------------
                                     26 ; ram data
                                     27 ;--------------------------------------------------------
                                     28 	.area DATA
                                     29 ;--------------------------------------------------------
                                     30 ; ram data
                                     31 ;--------------------------------------------------------
                                     32 	.area INITIALIZED
                                     33 ;--------------------------------------------------------
                                     34 ; absolute external ram data
                                     35 ;--------------------------------------------------------
                                     36 	.area DABS (ABS)
                                     37 
                                     38 ; default segment ordering for linker
                                     39 	.area HOME
                                     40 	.area GSINIT
                                     41 	.area GSFINAL
                                     42 	.area CONST
                                     43 	.area INITIALIZER
                                     44 	.area CODE
                                     45 
                                     46 ;--------------------------------------------------------
                                     47 ; global & static initialisations
                                     48 ;--------------------------------------------------------
                                     49 	.area HOME
                                     50 	.area GSINIT
                                     51 	.area GSFINAL
                                     52 	.area GSINIT
                                     53 ;--------------------------------------------------------
                                     54 ; Home
                                     55 ;--------------------------------------------------------
                                     56 	.area HOME
                                     57 	.area HOME
                                     58 ;--------------------------------------------------------
                                     59 ; code
                                     60 ;--------------------------------------------------------
                                     61 	.area CODE
                                     62 ;	driver/adc.c: 4: u16 ReadADC()
                                     63 ;	-----------------------------------------
                                     64 ;	 function ReadADC
                                     65 ;	-----------------------------------------
      00A4DD                         66 _ReadADC:
                                     67 ;	driver/adc.c: 7: ADC1_DeInit();
      00A4DD CD AB A5         [ 4]   68 	call	_ADC1_DeInit
                                     69 ;	driver/adc.c: 8: ADC1_ClearFlag(ADC1_FLAG_EOC);//软件清除
      00A4E0 4B 80            [ 1]   70 	push	#0x80
      00A4E2 CD AE E8         [ 4]   71 	call	_ADC1_ClearFlag
      00A4E5 84               [ 1]   72 	pop	a
                                     73 ;	driver/adc.c: 10: GPIO_Init(ADC_GPIO,ADC_PIN,GPIO_MODE_IN_FL_NO_IT);//AIN4 IO设置为悬浮输入
      00A4E6 4B 00            [ 1]   74 	push	#0x00
      00A4E8 4B 01            [ 1]   75 	push	#0x01
      00A4EA 4B 05            [ 1]   76 	push	#0x05
      00A4EC 4B 50            [ 1]   77 	push	#0x50
      00A4EE CD A5 60         [ 4]   78 	call	_GPIO_Init
      00A4F1 5B 04            [ 2]   79 	addw	sp, #4
                                     80 ;	driver/adc.c: 12: ADC1_PrescalerConfig(ADC1_PRESSEL_FCPU_D2);//预分频2
      00A4F3 4B 00            [ 1]   81 	push	#0x00
      00A4F5 CD AC 5D         [ 4]   82 	call	_ADC1_PrescalerConfig
      00A4F8 84               [ 1]   83 	pop	a
                                     84 ;	driver/adc.c: 14: ADC1_ExternalTriggerConfig(ADC1_EXTTRIG_TIM,DISABLE);//不使用外部触发
      00A4F9 4B 00            [ 1]   85 	push	#0x00
      00A4FB 4B 00            [ 1]   86 	push	#0x00
      00A4FD CD AD 1F         [ 4]   87 	call	_ADC1_ExternalTriggerConfig
      00A500 5B 02            [ 2]   88 	addw	sp, #2
                                     89 ;	driver/adc.c: 16: ADC1_SchmittTriggerConfig(ADC_SCHMITTTRIG,DISABLE);
      00A502 4B 00            [ 1]   90 	push	#0x00
      00A504 4B 00            [ 1]   91 	push	#0x00
      00A506 CD AC 6E         [ 4]   92 	call	_ADC1_SchmittTriggerConfig
      00A509 5B 02            [ 2]   93 	addw	sp, #2
                                     94 ;	driver/adc.c: 24: ADC1_ConversionConfig(ADC1_CONVERSIONMODE_SINGLE,//单次转换
      00A50B 4B 08            [ 1]   95 	push	#0x08
      00A50D 4B 00            [ 1]   96 	push	#0x00
      00A50F 4B 00            [ 1]   97 	push	#0x00
      00A511 CD AC EC         [ 4]   98 	call	_ADC1_ConversionConfig
      00A514 5B 03            [ 2]   99 	addw	sp, #3
                                    100 ;	driver/adc.c: 30: ADC1_Cmd(ENABLE);//开启ADC
      00A516 4B 01            [ 1]  101 	push	#0x01
      00A518 CD AC 06         [ 4]  102 	call	_ADC1_Cmd
      00A51B 84               [ 1]  103 	pop	a
                                    104 ;	driver/adc.c: 31: ADC1_StartConversion();
      00A51C CD AD 43         [ 4]  105 	call	_ADC1_StartConversion
                                    106 ;	driver/adc.c: 32: while(!ADC1_GetFlagStatus(ADC1_FLAG_EOC));//等待转换完成
      00A51F                        107 00101$:
      00A51F 4B 80            [ 1]  108 	push	#0x80
      00A521 CD AE 83         [ 4]  109 	call	_ADC1_GetFlagStatus
      00A524 5B 01            [ 2]  110 	addw	sp, #1
      00A526 4D               [ 1]  111 	tnz	a
      00A527 27 F6            [ 1]  112 	jreq	00101$
                                    113 ;	driver/adc.c: 34: ADC1_ClearFlag(ADC1_FLAG_EOC);//软件清除
      00A529 4B 80            [ 1]  114 	push	#0x80
      00A52B CD AE E8         [ 4]  115 	call	_ADC1_ClearFlag
      00A52E 84               [ 1]  116 	pop	a
                                    117 ;	driver/adc.c: 35: u16 ret=ADC1_GetConversionValue();//从ADC_DR中读取ADC值
      00A52F CD AD 48         [ 4]  118 	call	_ADC1_GetConversionValue
                                    119 ;	driver/adc.c: 36: ADC1_DeInit();
      00A532 89               [ 2]  120 	pushw	x
      00A533 CD AB A5         [ 4]  121 	call	_ADC1_DeInit
      00A536 85               [ 2]  122 	popw	x
                                    123 ;	driver/adc.c: 37: return ret;
                                    124 ;	driver/adc.c: 39: }
      00A537 81               [ 4]  125 	ret
                                    126 ;	driver/adc.c: 41: BitStatus ReadDin()
                                    127 ;	-----------------------------------------
                                    128 ;	 function ReadDin
                                    129 ;	-----------------------------------------
      00A538                        130 _ReadDin:
                                    131 ;	driver/adc.c: 43: GPIO_Init(GPIOF, GPIO_PIN_4, GPIO_MODE_IN_FL_NO_IT);
      00A538 4B 00            [ 1]  132 	push	#0x00
      00A53A 4B 10            [ 1]  133 	push	#0x10
      00A53C 4B 19            [ 1]  134 	push	#0x19
      00A53E 4B 50            [ 1]  135 	push	#0x50
      00A540 CD A5 60         [ 4]  136 	call	_GPIO_Init
      00A543 5B 04            [ 2]  137 	addw	sp, #4
                                    138 ;	driver/adc.c: 44: return  GPIO_ReadInputPin(GPIOF,GPIO_PIN_4);
      00A545 4B 10            [ 1]  139 	push	#0x10
      00A547 4B 19            [ 1]  140 	push	#0x19
      00A549 4B 50            [ 1]  141 	push	#0x50
      00A54B CD A6 00         [ 4]  142 	call	_GPIO_ReadInputPin
      00A54E 5B 03            [ 2]  143 	addw	sp, #3
                                    144 ;	driver/adc.c: 45: }
      00A550 81               [ 4]  145 	ret
                                    146 	.area CODE
                                    147 	.area CONST
                                    148 	.area INITIALIZER
                                    149 	.area CABS (ABS)
