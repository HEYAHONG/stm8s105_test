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
      008BE8                         64 _ReadADC:
                                     65 ;	driver/adc.c: 6: ADC1_DeInit();
      008BE8 CD 8D 0F         [ 4]   66 	call	_ADC1_DeInit
                                     67 ;	driver/adc.c: 7: ADC1_ClearFlag(ADC1_FLAG_EOC);//软件清除
      008BEB 4B 80            [ 1]   68 	push	#0x80
      008BED CD 90 52         [ 4]   69 	call	_ADC1_ClearFlag
      008BF0 84               [ 1]   70 	pop	a
                                     71 ;	driver/adc.c: 9: GPIO_Init(ADC_GPIO,ADC_PIN,GPIO_MODE_IN_FL_NO_IT);//AIN4 IO设置为悬浮输入
      008BF1 4B 00            [ 1]   72 	push	#0x00
      008BF3 4B 01            [ 1]   73 	push	#0x01
      008BF5 4B 05            [ 1]   74 	push	#0x05
      008BF7 4B 50            [ 1]   75 	push	#0x50
      008BF9 CD 8C 4C         [ 4]   76 	call	_GPIO_Init
      008BFC 5B 04            [ 2]   77 	addw	sp, #4
                                     78 ;	driver/adc.c: 11: ADC1_PrescalerConfig(ADC1_PRESSEL_FCPU_D2);//预分频2
      008BFE 4B 00            [ 1]   79 	push	#0x00
      008C00 CD 8D C7         [ 4]   80 	call	_ADC1_PrescalerConfig
      008C03 84               [ 1]   81 	pop	a
                                     82 ;	driver/adc.c: 13: ADC1_ExternalTriggerConfig(ADC1_EXTTRIG_TIM,DISABLE);//不使用外部触发
      008C04 4B 00            [ 1]   83 	push	#0x00
      008C06 4B 00            [ 1]   84 	push	#0x00
      008C08 CD 8E 89         [ 4]   85 	call	_ADC1_ExternalTriggerConfig
      008C0B 5B 02            [ 2]   86 	addw	sp, #2
                                     87 ;	driver/adc.c: 15: ADC1_SchmittTriggerConfig(ADC_SCHMITTTRIG,DISABLE);
      008C0D 4B 00            [ 1]   88 	push	#0x00
      008C0F 4B 00            [ 1]   89 	push	#0x00
      008C11 CD 8D D8         [ 4]   90 	call	_ADC1_SchmittTriggerConfig
      008C14 5B 02            [ 2]   91 	addw	sp, #2
                                     92 ;	driver/adc.c: 23: ADC1_ConversionConfig(ADC1_CONVERSIONMODE_SINGLE,//单次转换
      008C16 4B 08            [ 1]   93 	push	#0x08
      008C18 4B 00            [ 1]   94 	push	#0x00
      008C1A 4B 00            [ 1]   95 	push	#0x00
      008C1C CD 8E 56         [ 4]   96 	call	_ADC1_ConversionConfig
      008C1F 5B 03            [ 2]   97 	addw	sp, #3
                                     98 ;	driver/adc.c: 29: ADC1_Cmd(ENABLE);//开启ADC
      008C21 4B 01            [ 1]   99 	push	#0x01
      008C23 CD 8D 70         [ 4]  100 	call	_ADC1_Cmd
      008C26 84               [ 1]  101 	pop	a
                                    102 ;	driver/adc.c: 30: ADC1_StartConversion();
      008C27 CD 8E AD         [ 4]  103 	call	_ADC1_StartConversion
                                    104 ;	driver/adc.c: 31: while(!ADC1_GetFlagStatus(ADC1_FLAG_EOC));//等待转换完成
      008C2A                        105 00101$:
      008C2A 4B 80            [ 1]  106 	push	#0x80
      008C2C CD 8F ED         [ 4]  107 	call	_ADC1_GetFlagStatus
      008C2F 5B 01            [ 2]  108 	addw	sp, #1
      008C31 4D               [ 1]  109 	tnz	a
      008C32 27 F6            [ 1]  110 	jreq	00101$
                                    111 ;	driver/adc.c: 33: ADC1_ClearFlag(ADC1_FLAG_EOC);//软件清除
      008C34 4B 80            [ 1]  112 	push	#0x80
      008C36 CD 90 52         [ 4]  113 	call	_ADC1_ClearFlag
      008C39 84               [ 1]  114 	pop	a
                                    115 ;	driver/adc.c: 35: return (u16)ADC1_GetConversionValue();//从ADC_DR中读取ADC值
                                    116 ;	driver/adc.c: 37: }
      008C3A CC 8E B2         [ 2]  117 	jp	_ADC1_GetConversionValue
                                    118 	.area CODE
                                    119 	.area CONST
                                    120 	.area INITIALIZER
                                    121 	.area CABS (ABS)
