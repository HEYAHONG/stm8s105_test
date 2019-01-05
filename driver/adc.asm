;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module adc
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _GPIO_Init
	.globl _ADC1_ClearFlag
	.globl _ADC1_GetFlagStatus
	.globl _ADC1_GetConversionValue
	.globl _ADC1_StartConversion
	.globl _ADC1_ExternalTriggerConfig
	.globl _ADC1_ConversionConfig
	.globl _ADC1_SchmittTriggerConfig
	.globl _ADC1_PrescalerConfig
	.globl _ADC1_Cmd
	.globl _ADC1_DeInit
	.globl _ReadADC
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area DABS (ABS)

; default segment ordering for linker
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area CONST
	.area INITIALIZER
	.area CODE

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	driver/adc.c: 3: u16 ReadADC()
;	-----------------------------------------
;	 function ReadADC
;	-----------------------------------------
_ReadADC:
;	driver/adc.c: 6: ADC1_DeInit();
	call	_ADC1_DeInit
;	driver/adc.c: 7: ADC1_ClearFlag(ADC1_FLAG_EOC);//软件清除
	push	#0x80
	call	_ADC1_ClearFlag
	pop	a
;	driver/adc.c: 9: GPIO_Init(ADC_GPIO,ADC_PIN,GPIO_MODE_IN_FL_NO_IT);//AIN4 IO设置为悬浮输入
	push	#0x00
	push	#0x01
	push	#0x05
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	driver/adc.c: 11: ADC1_PrescalerConfig(ADC1_PRESSEL_FCPU_D2);//预分频2
	push	#0x00
	call	_ADC1_PrescalerConfig
	pop	a
;	driver/adc.c: 13: ADC1_ExternalTriggerConfig(ADC1_EXTTRIG_TIM,DISABLE);//不使用外部触发
	push	#0x00
	push	#0x00
	call	_ADC1_ExternalTriggerConfig
	addw	sp, #2
;	driver/adc.c: 15: ADC1_SchmittTriggerConfig(ADC_SCHMITTTRIG,DISABLE);
	push	#0x00
	push	#0x00
	call	_ADC1_SchmittTriggerConfig
	addw	sp, #2
;	driver/adc.c: 23: ADC1_ConversionConfig(ADC1_CONVERSIONMODE_SINGLE,//单次转换
	push	#0x08
	push	#0x00
	push	#0x00
	call	_ADC1_ConversionConfig
	addw	sp, #3
;	driver/adc.c: 29: ADC1_Cmd(ENABLE);//开启ADC
	push	#0x01
	call	_ADC1_Cmd
	pop	a
;	driver/adc.c: 30: ADC1_StartConversion();
	call	_ADC1_StartConversion
;	driver/adc.c: 31: while(!ADC1_GetFlagStatus(ADC1_FLAG_EOC));//等待转换完成
00101$:
	push	#0x80
	call	_ADC1_GetFlagStatus
	addw	sp, #1
	tnz	a
	jreq	00101$
;	driver/adc.c: 33: ADC1_ClearFlag(ADC1_FLAG_EOC);//软件清除
	push	#0x80
	call	_ADC1_ClearFlag
	pop	a
;	driver/adc.c: 35: return (u16)ADC1_GetConversionValue();//从ADC_DR中读取ADC值
;	driver/adc.c: 37: }
	jp	_ADC1_GetConversionValue
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
