;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module stm8s_it
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _TIM3_CAP_COM_IRQHandler
	.globl _TIM3_UPD_OVF_BRK_IRQHandler
	.globl _key_read
	.globl _UART2_ClearITPendingBit
	.globl _UART2_GetITStatus
	.globl _UART2_ClearFlag
	.globl _UART2_GetFlagStatus
	.globl _UART2_SendData8
	.globl _UART2_ReceiveData8
	.globl _TRAP_IRQHandler
	.globl _TLI_IRQHandler
	.globl _AWU_IRQHandler
	.globl _CLK_IRQHandler
	.globl _EXTI_PORTA_IRQHandler
	.globl _EXTI_PORTB_IRQHandler
	.globl _EXTI_PORTC_IRQHandler
	.globl _EXTI_PORTD_IRQHandler
	.globl _EXTI_PORTE_IRQHandler
	.globl _SPI_IRQHandler
	.globl _TIM1_UPD_OVF_TRG_BRK_IRQHandler
	.globl _TIM1_CAP_COM_IRQHandler
	.globl _TIM2_UPD_OVF_BRK_IRQHandler
	.globl _TIM2_CAP_COM_IRQHandler
	.globl _I2C_IRQHandler
	.globl _UART2_TX_IRQHandler
	.globl _UART2_RX_IRQHandler
	.globl _ADC1_IRQHandler
	.globl _TIM4_UPD_OVF_IRQHandler
	.globl _EEPROM_EEC_IRQHandler
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
;	driver/stm8s_it.c: 67: INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
;	-----------------------------------------
;	 function TRAP_IRQHandler
;	-----------------------------------------
_TRAP_IRQHandler:
;	driver/stm8s_it.c: 74: }
	iret
;	driver/stm8s_it.c: 81: INTERRUPT_HANDLER(TLI_IRQHandler, 0)
;	-----------------------------------------
;	 function TLI_IRQHandler
;	-----------------------------------------
_TLI_IRQHandler:
;	driver/stm8s_it.c: 87: }
	iret
;	driver/stm8s_it.c: 94: INTERRUPT_HANDLER(AWU_IRQHandler, 1)
;	-----------------------------------------
;	 function AWU_IRQHandler
;	-----------------------------------------
_AWU_IRQHandler:
;	driver/stm8s_it.c: 99: }
	iret
;	driver/stm8s_it.c: 106: INTERRUPT_HANDLER(CLK_IRQHandler, 2)
;	-----------------------------------------
;	 function CLK_IRQHandler
;	-----------------------------------------
_CLK_IRQHandler:
;	driver/stm8s_it.c: 111: }
	iret
;	driver/stm8s_it.c: 118: INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
;	-----------------------------------------
;	 function EXTI_PORTA_IRQHandler
;	-----------------------------------------
_EXTI_PORTA_IRQHandler:
;	driver/stm8s_it.c: 123: }
	iret
;	driver/stm8s_it.c: 130: INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
;	-----------------------------------------
;	 function EXTI_PORTB_IRQHandler
;	-----------------------------------------
_EXTI_PORTB_IRQHandler:
;	driver/stm8s_it.c: 135: }
	iret
;	driver/stm8s_it.c: 142: INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
;	-----------------------------------------
;	 function EXTI_PORTC_IRQHandler
;	-----------------------------------------
_EXTI_PORTC_IRQHandler:
;	driver/stm8s_it.c: 147: }
	iret
;	driver/stm8s_it.c: 155: INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
;	-----------------------------------------
;	 function EXTI_PORTD_IRQHandler
;	-----------------------------------------
_EXTI_PORTD_IRQHandler:
	clr	a
	div	x, a
	push	a
;	driver/stm8s_it.c: 161: for(temp=0;temp<100;temp++) //延时去抖
	ld	a, #0x64
00107$:
;	driver/stm8s_it.c: 163: nop();nop();nop();nop();nop();
	nop
	nop
	nop
	nop
	nop
	dec	a
;	driver/stm8s_it.c: 161: for(temp=0;temp<100;temp++) //延时去抖
	tnz	a
	jrne	00107$
;	driver/stm8s_it.c: 165: for(temp=0;temp<5;temp++)
	clr	(0x01, sp)
00108$:
;	driver/stm8s_it.c: 167: if(key_read(temp)==RESET) keycount[temp]++;
	ld	a, (0x01, sp)
	push	a
	call	_key_read
	addw	sp, #1
	tnz	a
	jrne	00109$
	clrw	x
	ld	a, (0x01, sp)
	ld	xl, a
	addw	x, #_keycount
	inc	(x)
00109$:
;	driver/stm8s_it.c: 165: for(temp=0;temp<5;temp++)
	inc	(0x01, sp)
	ld	a, (0x01, sp)
	cp	a, #0x05
	jrc	00108$
;	driver/stm8s_it.c: 170: }
	pop	a
	iret
;	driver/stm8s_it.c: 177: INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
;	-----------------------------------------
;	 function EXTI_PORTE_IRQHandler
;	-----------------------------------------
_EXTI_PORTE_IRQHandler:
;	driver/stm8s_it.c: 182: }
	iret
;	driver/stm8s_it.c: 229: INTERRUPT_HANDLER(SPI_IRQHandler, 10)
;	-----------------------------------------
;	 function SPI_IRQHandler
;	-----------------------------------------
_SPI_IRQHandler:
;	driver/stm8s_it.c: 234: }
	iret
;	driver/stm8s_it.c: 241: INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
;	-----------------------------------------
;	 function TIM1_UPD_OVF_TRG_BRK_IRQHandler
;	-----------------------------------------
_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
;	driver/stm8s_it.c: 246: }
	iret
;	driver/stm8s_it.c: 253: INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
;	-----------------------------------------
;	 function TIM1_CAP_COM_IRQHandler
;	-----------------------------------------
_TIM1_CAP_COM_IRQHandler:
;	driver/stm8s_it.c: 258: }
	iret
;	driver/stm8s_it.c: 291: INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
;	-----------------------------------------
;	 function TIM2_UPD_OVF_BRK_IRQHandler
;	-----------------------------------------
_TIM2_UPD_OVF_BRK_IRQHandler:
;	driver/stm8s_it.c: 296: }
	iret
;	driver/stm8s_it.c: 303: INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
;	-----------------------------------------
;	 function TIM2_CAP_COM_IRQHandler
;	-----------------------------------------
_TIM2_CAP_COM_IRQHandler:
;	driver/stm8s_it.c: 308: }
	iret
;	driver/stm8s_it.c: 318: INTERRUPT_HANDLER(TIM3_UPD_OVF_BRK_IRQHandler, 15)
;	-----------------------------------------
;	 function TIM3_UPD_OVF_BRK_IRQHandler
;	-----------------------------------------
_TIM3_UPD_OVF_BRK_IRQHandler:
;	driver/stm8s_it.c: 323: }
	iret
;	driver/stm8s_it.c: 330: INTERRUPT_HANDLER(TIM3_CAP_COM_IRQHandler, 16)
;	-----------------------------------------
;	 function TIM3_CAP_COM_IRQHandler
;	-----------------------------------------
_TIM3_CAP_COM_IRQHandler:
;	driver/stm8s_it.c: 335: }
	iret
;	driver/stm8s_it.c: 400: INTERRUPT_HANDLER(I2C_IRQHandler, 19)
;	-----------------------------------------
;	 function I2C_IRQHandler
;	-----------------------------------------
_I2C_IRQHandler:
;	driver/stm8s_it.c: 405: }
	iret
;	driver/stm8s_it.c: 413: INTERRUPT_HANDLER(UART2_TX_IRQHandler, 20)
;	-----------------------------------------
;	 function UART2_TX_IRQHandler
;	-----------------------------------------
_UART2_TX_IRQHandler:
;	driver/stm8s_it.c: 418: }
	iret
;	driver/stm8s_it.c: 425: INTERRUPT_HANDLER(UART2_RX_IRQHandler, 21)
;	-----------------------------------------
;	 function UART2_RX_IRQHandler
;	-----------------------------------------
_UART2_RX_IRQHandler:
	clr	a
	div	x, a
;	driver/stm8s_it.c: 430: if(UART2_GetITStatus(UART2_IT_RXNE))
	push	#0x55
	push	#0x02
	call	_UART2_GetITStatus
	addw	sp, #2
	tnz	a
	jreq	00105$
;	driver/stm8s_it.c: 432: while(UART2_GetFlagStatus(UART2_FLAG_TXE)==RESET);
00101$:
	push	#0x80
	push	#0x00
	call	_UART2_GetFlagStatus
	addw	sp, #2
	tnz	a
	jreq	00101$
;	driver/stm8s_it.c: 433: UART2_SendData8(UART2_ReceiveData8());
	call	_UART2_ReceiveData8
	push	a
	call	_UART2_SendData8
	pop	a
00105$:
;	driver/stm8s_it.c: 435: UART2_ClearITPendingBit(UART2_IT_RXNE);	
	push	#0x55
	push	#0x02
	call	_UART2_ClearITPendingBit
	addw	sp, #2
;	driver/stm8s_it.c: 438: if(UART2_GetITStatus(UART2_IT_OR))
	push	#0x35
	push	#0x02
	call	_UART2_GetITStatus
	addw	sp, #2
	tnz	a
	jreq	00107$
;	driver/stm8s_it.c: 440: UART2_ClearITPendingBit(UART2_IT_OR);
	push	#0x35
	push	#0x02
	call	_UART2_ClearITPendingBit
	addw	sp, #2
00107$:
;	driver/stm8s_it.c: 442: if(UART2_GetFlagStatus(UART2_FLAG_OR_LHE))
	push	#0x08
	push	#0x00
	call	_UART2_GetFlagStatus
	addw	sp, #2
	tnz	a
	jreq	00110$
;	driver/stm8s_it.c: 444: UART2_ClearFlag(UART2_FLAG_OR_LHE);
	push	#0x08
	push	#0x00
	call	_UART2_ClearFlag
	addw	sp, #2
00110$:
;	driver/stm8s_it.c: 448: }
	iret
;	driver/stm8s_it.c: 497: INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
;	-----------------------------------------
;	 function ADC1_IRQHandler
;	-----------------------------------------
_ADC1_IRQHandler:
;	driver/stm8s_it.c: 502: }
	iret
;	driver/stm8s_it.c: 523: INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
;	-----------------------------------------
;	 function TIM4_UPD_OVF_IRQHandler
;	-----------------------------------------
_TIM4_UPD_OVF_IRQHandler:
;	driver/stm8s_it.c: 528: }
	iret
;	driver/stm8s_it.c: 536: INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
;	-----------------------------------------
;	 function EEPROM_EEC_IRQHandler
;	-----------------------------------------
_EEPROM_EEC_IRQHandler:
;	driver/stm8s_it.c: 541: }
	iret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
