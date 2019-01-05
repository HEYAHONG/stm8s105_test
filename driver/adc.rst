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
                                     18 	.globl _ADC1_SchmittTriggerConfig
                                     19 	.globl _ADC1_PrescalerConfig
                                     20 	.globl _ADC1_Cmd
                                     21 	.globl _ADC1_DeInit
                                     22 	.globl _ReadADC
                                     23 ;--------------------------------------------------------
                                     24 ; ram data
                                     25 ;--------------------------------------------------------
                                     26 	.area DATA
                                     27 ;--------------------------------------------------------
                                     28 ; ram data
                                     29 ;--------------------------------------------------------
                                     30 	.area INITIALIZED
                                     31 ;--------------------------------------------------------
                                     32 ; absolute external ram data
                                     33 ;--------------------------------------------------------
                                     34 	.area DABS (ABS)
                                     35 
                                     36 ; default segment ordering for linker
                                     37 	.area HOME
                                     38 	.area GSINIT
                                     39 	.area GSFINAL
                                     40 	.area CONST
                                     41 	.area INITIALIZER
                                     42 	.area CODE
                                     43 
                                     44 ;--------------------------------------------------------
                                     45 ; global & static initialisations
                                     46 ;--------------------------------------------------------
                                     47 	.area HOME
                                     48 	.area GSINIT
                                     49 	.area GSFINAL
                                     50 	.area GSINIT
                                     51 ;--------------------------------------------------------
                                     52 ; Home
                                     53 ;--------------------------------------------------------
                                     54 	.area HOME
                                     55 	.area HOME
                                     56 ;--------------------------------------------------------
                                     57 ; code
                                     58 ;--------------------------------------------------------
                                     59 	.area CODE
                                     60 ;	driver/adc.c: 3: u16 ReadADC()
                                     61 ;	-----------------------------------------
                                     62 ;	 function ReadADC
                                     63 ;	-----------------------------------------
      008E03                         64 _ReadADC:
                                     65 ;	driver/adc.c: 6: ADC1_DeInit();
      008E03 CD 8F 2A         [ 4]   66 	call	_ADC1_DeInit
                                     67 ;	driver/adc.c: 7: ADC1_ClearFlag(ADC1_FLAG_EOC);//软件清除
      008E06 4B 80            [ 1]   68 	push	#0x80
      008E08 CD 92 6D         [ 4]   69 	call	_ADC1_ClearFlag
      008E0B 84               [ 1]   70 	pop	a
                                     71 ;	driver/adc.c: 9: GPIO_Init(ADC_GPIO,ADC_PIN,GPIO_MODE_IN_FL_NO_IT);//AIN4 IO设置为悬浮输入
      008E0C 4B 00            [ 1]   72 	push	#0x00
      008E0E 4B 01            [ 1]   73 	push	#0x01
      008E10 4B 05            [ 1]   74 	push	#0x05
      008E12 4B 50            [ 1]   75 	push	#0x50
      008E14 CD 8E 67         [ 4]   76 	call	_GPIO_Init
      008E17 5B 04            [ 2]   77 	addw	sp, #4
                                     78 ;	driver/adc.c: 11: ADC1_PrescalerConfig(ADC1_PRESSEL_FCPU_D2);//预分频2
      008E19 4B 00            [ 1]   79 	push	#0x00
      008E1B CD 8F E2         [ 4]   80 	call	_ADC1_PrescalerConfig
      008E1E 84               [ 1]   81 	pop	a
                                     82 ;	driver/adc.c: 13: ADC1_ExternalTriggerConfig(ADC1_EXTTRIG_TIM,DISABLE);//不使用外部触发
      008E1F 4B 00            [ 1]   83 	push	#0x00
      008E21 4B 00            [ 1]   84 	push	#0x00
      008E23 CD 90 A4         [ 4]   85 	call	_ADC1_ExternalTriggerConfig
      008E26 5B 02            [ 2]   86 	addw	sp, #2
                                     87 ;	driver/adc.c: 15: ADC1_SchmittTriggerConfig(ADC_SCHMITTTRIG,DISABLE);
      008E28 4B 00            [ 1]   88 	push	#0x00
      008E2A 4B 00            [ 1]   89 	push	#0x00
      008E2C CD 8F F3         [ 4]   90 	call	_ADC1_SchmittTriggerConfig
      008E2F 5B 02            [ 2]   91 	addw	sp, #2
                                     92 ;	driver/adc.c: 23: ADC1_ConversionConfig(ADC1_CONVERSIONMODE_SINGLE,//单次转换
      008E31 4B 08            [ 1]   93 	push	#0x08
      008E33 4B 00            [ 1]   94 	push	#0x00
      008E35 4B 00            [ 1]   95 	push	#0x00
      008E37 CD 90 71         [ 4]   96 	call	_ADC1_ConversionConfig
      008E3A 5B 03            [ 2]   97 	addw	sp, #3
                                     98 ;	driver/adc.c: 29: ADC1_Cmd(ENABLE);//开启ADC
      008E3C 4B 01            [ 1]   99 	push	#0x01
      008E3E CD 8F 8B         [ 4]  100 	call	_ADC1_Cmd
      008E41 84               [ 1]  101 	pop	a
                                    102 ;	driver/adc.c: 30: ADC1_StartConversion();
      008E42 CD 90 C8         [ 4]  103 	call	_ADC1_StartConversion
                                    104 ;	driver/adc.c: 31: while(!ADC1_GetFlagStatus(ADC1_FLAG_EOC));//等待转换完成
      008E45                        105 00101$:
      008E45 4B 80            [ 1]  106 	push	#0x80
      008E47 CD 92 08         [ 4]  107 	call	_ADC1_GetFlagStatus
      008E4A 5B 01            [ 2]  108 	addw	sp, #1
      008E4C 4D               [ 1]  109 	tnz	a
      008E4D 27 F6            [ 1]  110 	jreq	00101$
                                    111 ;	driver/adc.c: 33: ADC1_ClearFlag(ADC1_FLAG_EOC);//软件清除
      008E4F 4B 80            [ 1]  112 	push	#0x80
      008E51 CD 92 6D         [ 4]  113 	call	_ADC1_ClearFlag
      008E54 84               [ 1]  114 	pop	a
                                    115 ;	driver/adc.c: 35: return (u16)ADC1_GetConversionValue();//从ADC_DR中读取ADC值
                                    116 ;	driver/adc.c: 37: }
      008E55 CC 90 CD         [ 2]  117 	jp	_ADC1_GetConversionValue
                                    118 	.area CODE
                                    119 	.area CONST
                                    120 	.area INITIALIZER
                                    121 	.area CABS (ABS)
