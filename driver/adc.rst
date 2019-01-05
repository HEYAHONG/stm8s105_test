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
      008BAA                         64 _ReadADC:
                                     65 ;	driver/adc.c: 6: ADC1_DeInit();
      008BAA CD 8C D1         [ 4]   66 	call	_ADC1_DeInit
                                     67 ;	driver/adc.c: 7: ADC1_ClearFlag(ADC1_FLAG_EOC);//软件清除
      008BAD 4B 80            [ 1]   68 	push	#0x80
      008BAF CD 90 14         [ 4]   69 	call	_ADC1_ClearFlag
      008BB2 84               [ 1]   70 	pop	a
                                     71 ;	driver/adc.c: 9: GPIO_Init(ADC_GPIO,ADC_PIN,GPIO_MODE_IN_FL_NO_IT);//AIN4 IO设置为悬浮输入
      008BB3 4B 00            [ 1]   72 	push	#0x00
      008BB5 4B 01            [ 1]   73 	push	#0x01
      008BB7 4B 05            [ 1]   74 	push	#0x05
      008BB9 4B 50            [ 1]   75 	push	#0x50
      008BBB CD 8C 0E         [ 4]   76 	call	_GPIO_Init
      008BBE 5B 04            [ 2]   77 	addw	sp, #4
                                     78 ;	driver/adc.c: 11: ADC1_PrescalerConfig(ADC1_PRESSEL_FCPU_D2);//预分频2
      008BC0 4B 00            [ 1]   79 	push	#0x00
      008BC2 CD 8D 89         [ 4]   80 	call	_ADC1_PrescalerConfig
      008BC5 84               [ 1]   81 	pop	a
                                     82 ;	driver/adc.c: 13: ADC1_ExternalTriggerConfig(ADC1_EXTTRIG_TIM,DISABLE);//不使用外部触发
      008BC6 4B 00            [ 1]   83 	push	#0x00
      008BC8 4B 00            [ 1]   84 	push	#0x00
      008BCA CD 8E 4B         [ 4]   85 	call	_ADC1_ExternalTriggerConfig
      008BCD 5B 02            [ 2]   86 	addw	sp, #2
                                     87 ;	driver/adc.c: 15: ADC1_SchmittTriggerConfig(ADC_SCHMITTTRIG,DISABLE);
      008BCF 4B 00            [ 1]   88 	push	#0x00
      008BD1 4B 00            [ 1]   89 	push	#0x00
      008BD3 CD 8D 9A         [ 4]   90 	call	_ADC1_SchmittTriggerConfig
      008BD6 5B 02            [ 2]   91 	addw	sp, #2
                                     92 ;	driver/adc.c: 23: ADC1_ConversionConfig(ADC1_CONVERSIONMODE_SINGLE,//单次转换
      008BD8 4B 08            [ 1]   93 	push	#0x08
      008BDA 4B 00            [ 1]   94 	push	#0x00
      008BDC 4B 00            [ 1]   95 	push	#0x00
      008BDE CD 8E 18         [ 4]   96 	call	_ADC1_ConversionConfig
      008BE1 5B 03            [ 2]   97 	addw	sp, #3
                                     98 ;	driver/adc.c: 29: ADC1_Cmd(ENABLE);//开启ADC
      008BE3 4B 01            [ 1]   99 	push	#0x01
      008BE5 CD 8D 32         [ 4]  100 	call	_ADC1_Cmd
      008BE8 84               [ 1]  101 	pop	a
                                    102 ;	driver/adc.c: 30: ADC1_StartConversion();
      008BE9 CD 8E 6F         [ 4]  103 	call	_ADC1_StartConversion
                                    104 ;	driver/adc.c: 31: while(!ADC1_GetFlagStatus(ADC1_FLAG_EOC));//等待转换完成
      008BEC                        105 00101$:
      008BEC 4B 80            [ 1]  106 	push	#0x80
      008BEE CD 8F AF         [ 4]  107 	call	_ADC1_GetFlagStatus
      008BF1 5B 01            [ 2]  108 	addw	sp, #1
      008BF3 4D               [ 1]  109 	tnz	a
      008BF4 27 F6            [ 1]  110 	jreq	00101$
                                    111 ;	driver/adc.c: 33: ADC1_ClearFlag(ADC1_FLAG_EOC);//软件清除
      008BF6 4B 80            [ 1]  112 	push	#0x80
      008BF8 CD 90 14         [ 4]  113 	call	_ADC1_ClearFlag
      008BFB 84               [ 1]  114 	pop	a
                                    115 ;	driver/adc.c: 35: return (u16)ADC1_GetConversionValue();//从ADC_DR中读取ADC值
                                    116 ;	driver/adc.c: 37: }
      008BFC CC 8E 74         [ 2]  117 	jp	_ADC1_GetConversionValue
                                    118 	.area CODE
                                    119 	.area CONST
                                    120 	.area INITIALIZER
                                    121 	.area CABS (ABS)
