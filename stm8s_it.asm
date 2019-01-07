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
;	stm8s_it.c: 67: INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
;	-----------------------------------------
;	 function TRAP_IRQHandler
;	-----------------------------------------
_TRAP_IRQHandler:
;	stm8s_it.c: 74: }
	iret
;	stm8s_it.c: 81: INTERRUPT_HANDLER(TLI_IRQHandler, 0)
;	-----------------------------------------
;	 function TLI_IRQHandler
;	-----------------------------------------
_TLI_IRQHandler:
;	stm8s_it.c: 87: }
	iret
;	stm8s_it.c: 94: INTERRUPT_HANDLER(AWU_IRQHandler, 1)
;	-----------------------------------------
;	 function AWU_IRQHandler
;	-----------------------------------------
_AWU_IRQHandler:
;	stm8s_it.c: 99: }
	iret
;	stm8s_it.c: 106: INTERRUPT_HANDLER(CLK_IRQHandler, 2)
;	-----------------------------------------
;	 function CLK_IRQHandler
;	-----------------------------------------
_CLK_IRQHandler:
;	stm8s_it.c: 111: }
	iret
;	stm8s_it.c: 118: INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
;	-----------------------------------------
;	 function EXTI_PORTA_IRQHandler
;	-----------------------------------------
_EXTI_PORTA_IRQHandler:
;	stm8s_it.c: 123: }
	iret
;	stm8s_it.c: 130: INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
;	-----------------------------------------
;	 function EXTI_PORTB_IRQHandler
;	-----------------------------------------
_EXTI_PORTB_IRQHandler:
;	stm8s_it.c: 135: }
	iret
;	stm8s_it.c: 142: INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
;	-----------------------------------------
;	 function EXTI_PORTC_IRQHandler
;	-----------------------------------------
_EXTI_PORTC_IRQHandler:
;	stm8s_it.c: 147: }
	iret
;	stm8s_it.c: 154: INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
;	-----------------------------------------
;	 function EXTI_PORTD_IRQHandler
;	-----------------------------------------
_EXTI_PORTD_IRQHandler:
;	stm8s_it.c: 159: }
	iret
;	stm8s_it.c: 166: INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
;	-----------------------------------------
;	 function EXTI_PORTE_IRQHandler
;	-----------------------------------------
_EXTI_PORTE_IRQHandler:
;	stm8s_it.c: 171: }
	iret
;	stm8s_it.c: 218: INTERRUPT_HANDLER(SPI_IRQHandler, 10)
;	-----------------------------------------
;	 function SPI_IRQHandler
;	-----------------------------------------
_SPI_IRQHandler:
;	stm8s_it.c: 223: }
	iret
;	stm8s_it.c: 230: INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
;	-----------------------------------------
;	 function TIM1_UPD_OVF_TRG_BRK_IRQHandler
;	-----------------------------------------
_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
;	stm8s_it.c: 235: }
	iret
;	stm8s_it.c: 242: INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
;	-----------------------------------------
;	 function TIM1_CAP_COM_IRQHandler
;	-----------------------------------------
_TIM1_CAP_COM_IRQHandler:
;	stm8s_it.c: 247: }
	iret
;	stm8s_it.c: 280: INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
;	-----------------------------------------
;	 function TIM2_UPD_OVF_BRK_IRQHandler
;	-----------------------------------------
_TIM2_UPD_OVF_BRK_IRQHandler:
;	stm8s_it.c: 285: }
	iret
;	stm8s_it.c: 292: INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
;	-----------------------------------------
;	 function TIM2_CAP_COM_IRQHandler
;	-----------------------------------------
_TIM2_CAP_COM_IRQHandler:
;	stm8s_it.c: 297: }
	iret
;	stm8s_it.c: 307: INTERRUPT_HANDLER(TIM3_UPD_OVF_BRK_IRQHandler, 15)
;	-----------------------------------------
;	 function TIM3_UPD_OVF_BRK_IRQHandler
;	-----------------------------------------
_TIM3_UPD_OVF_BRK_IRQHandler:
;	stm8s_it.c: 312: }
	iret
;	stm8s_it.c: 319: INTERRUPT_HANDLER(TIM3_CAP_COM_IRQHandler, 16)
;	-----------------------------------------
;	 function TIM3_CAP_COM_IRQHandler
;	-----------------------------------------
_TIM3_CAP_COM_IRQHandler:
;	stm8s_it.c: 324: }
	iret
;	stm8s_it.c: 389: INTERRUPT_HANDLER(I2C_IRQHandler, 19)
;	-----------------------------------------
;	 function I2C_IRQHandler
;	-----------------------------------------
_I2C_IRQHandler:
;	stm8s_it.c: 394: }
	iret
;	stm8s_it.c: 402: INTERRUPT_HANDLER(UART2_TX_IRQHandler, 20)
;	-----------------------------------------
;	 function UART2_TX_IRQHandler
;	-----------------------------------------
_UART2_TX_IRQHandler:
;	stm8s_it.c: 407: }
	iret
;	stm8s_it.c: 414: INTERRUPT_HANDLER(UART2_RX_IRQHandler, 21)
;	-----------------------------------------
;	 function UART2_RX_IRQHandler
;	-----------------------------------------
_UART2_RX_IRQHandler:
	clr	a
	div	x, a
;	stm8s_it.c: 419: if(UART2_GetITStatus(UART2_IT_RXNE))
	push	#0x55
	push	#0x02
	call	_UART2_GetITStatus
	addw	sp, #2
	tnz	a
	jreq	00105$
;	stm8s_it.c: 421: while(UART2_GetFlagStatus(UART2_FLAG_TXE)==RESET);
00101$:
	push	#0x80
	push	#0x00
	call	_UART2_GetFlagStatus
	addw	sp, #2
	tnz	a
	jreq	00101$
;	stm8s_it.c: 422: UART2_SendData8(UART2_ReceiveData8());
	call	_UART2_ReceiveData8
	push	a
	call	_UART2_SendData8
	pop	a
00105$:
;	stm8s_it.c: 424: UART2_ClearITPendingBit(UART2_IT_RXNE);	
	push	#0x55
	push	#0x02
	call	_UART2_ClearITPendingBit
	addw	sp, #2
;	stm8s_it.c: 427: if(UART2_GetITStatus(UART2_IT_OR))
	push	#0x35
	push	#0x02
	call	_UART2_GetITStatus
	addw	sp, #2
	tnz	a
	jreq	00107$
;	stm8s_it.c: 429: UART2_ClearITPendingBit(UART2_IT_OR);
	push	#0x35
	push	#0x02
	call	_UART2_ClearITPendingBit
	addw	sp, #2
00107$:
;	stm8s_it.c: 431: if(UART2_GetFlagStatus(UART2_FLAG_OR_LHE))
	push	#0x08
	push	#0x00
	call	_UART2_GetFlagStatus
	addw	sp, #2
	tnz	a
	jreq	00110$
;	stm8s_it.c: 433: UART2_ClearFlag(UART2_FLAG_OR_LHE);
	push	#0x08
	push	#0x00
	call	_UART2_ClearFlag
	addw	sp, #2
00110$:
;	stm8s_it.c: 437: }
	iret
;	stm8s_it.c: 486: INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
;	-----------------------------------------
;	 function ADC1_IRQHandler
;	-----------------------------------------
_ADC1_IRQHandler:
;	stm8s_it.c: 491: }
	iret
;	stm8s_it.c: 512: INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
;	-----------------------------------------
;	 function TIM4_UPD_OVF_IRQHandler
;	-----------------------------------------
_TIM4_UPD_OVF_IRQHandler:
;	stm8s_it.c: 517: }
	iret
;	stm8s_it.c: 525: INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
;	-----------------------------------------
;	 function EEPROM_EEC_IRQHandler
;	-----------------------------------------
_EEPROM_EEC_IRQHandler:
;	stm8s_it.c: 530: }
	iret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
