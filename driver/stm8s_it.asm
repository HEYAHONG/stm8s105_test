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
	.globl _modbus_process
	.globl _key_read
	.globl _UART2_ClearITPendingBit
	.globl _UART2_GetITStatus
	.globl _UART2_ReceiveData8
	.globl _last_uart_receive_time
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
_last_uart_receive_time::
	.ds 1
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
;	driver/stm8s_it.c: 161: for(temp=0;temp<500;temp++) //延时去抖
	ldw	x, #0x01f4
00107$:
;	driver/stm8s_it.c: 163: nop();nop();nop();nop();nop();
	nop
	nop
	nop
	nop
	nop
	decw	x
;	driver/stm8s_it.c: 161: for(temp=0;temp<500;temp++) //延时去抖
;	driver/stm8s_it.c: 165: for(temp=0;temp<5;temp++)
	tnzw	x
	jrne	00107$
00108$:
;	driver/stm8s_it.c: 167: if(key_read(temp)==RESET) keycount[temp]++;
	ld	a, xl
	pushw	x
	push	a
	call	_key_read
	addw	sp, #1
	popw	x
	tnz	a
	jrne	00109$
	ldw	y, x
	addw	y, #_keycount
	ld	a, (y)
	inc	a
	ld	(y), a
00109$:
;	driver/stm8s_it.c: 165: for(temp=0;temp<5;temp++)
	incw	x
	cpw	x, #0x0005
	jrc	00108$
;	driver/stm8s_it.c: 170: }
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
;	driver/stm8s_it.c: 427: INTERRUPT_HANDLER(UART2_RX_IRQHandler, 21)
;	-----------------------------------------
;	 function UART2_RX_IRQHandler
;	-----------------------------------------
_UART2_RX_IRQHandler:
	clr	a
	div	x, a
	sub	sp, #4
;	driver/stm8s_it.c: 432: if(UART2_GetITStatus(UART2_IT_RXNE))
	push	#0x55
	push	#0x02
	call	_UART2_GetITStatus
	addw	sp, #2
	tnz	a
	jreq	00105$
;	driver/stm8s_it.c: 437: if(ds_time.second/2 == last_uart_receive_time/2)
	ldw	x, #_ds_time+6
	ld	a, (x)
	clrw	x
	ld	xl, a
	push	#0x02
	push	#0x00
	pushw	x
	call	__divsint
	addw	sp, #4
	ldw	(0x03, sp), x
	clrw	x
	ld	a, _last_uart_receive_time+0
	ld	xl, a
	push	#0x02
	push	#0x00
	pushw	x
	call	__divsint
	addw	sp, #4
	ldw	(0x01, sp), x
	ldw	x, (0x03, sp)
	cpw	x, (0x01, sp)
	jrne	00102$
;	driver/stm8s_it.c: 439: modbus_buff[modbus_status]=UART2_ReceiveData8();
	clrw	x
	ld	a, _modbus_status+0
	ld	xl, a
	addw	x, #_modbus_buff
	pushw	x
	call	_UART2_ReceiveData8
	popw	x
	ld	(x), a
;	driver/stm8s_it.c: 440: modbus_status++;
	inc	_modbus_status+0
	jra	00105$
00102$:
;	driver/stm8s_it.c: 444: modbus_buff[0]=UART2_ReceiveData8();
	call	_UART2_ReceiveData8
	ld	_modbus_buff, a
;	driver/stm8s_it.c: 445: modbus_status=1;
	mov	_modbus_status+0, #0x01
00105$:
;	driver/stm8s_it.c: 450: if(modbus_status>7)
	ld	a, _modbus_status+0
	cp	a, #0x07
	jrule	00107$
;	driver/stm8s_it.c: 452: modbus_process();
	call	_modbus_process
;	driver/stm8s_it.c: 453: modbus_status=0;
	clr	_modbus_status+0
00107$:
;	driver/stm8s_it.c: 456: last_uart_receive_time=ds_time.second;
	ldw	x, #_ds_time+6
	ld	a, (x)
	ld	_last_uart_receive_time+0, a
;	driver/stm8s_it.c: 457: UART2_ClearITPendingBit(UART2_IT_RXNE);
	push	#0x55
	push	#0x02
	call	_UART2_ClearITPendingBit
	addw	sp, #2
;	driver/stm8s_it.c: 460: if(UART2_GetITStatus(UART2_IT_OR))
	push	#0x35
	push	#0x02
	call	_UART2_GetITStatus
	addw	sp, #2
	tnz	a
	jreq	00110$
;	driver/stm8s_it.c: 462: UART2_ClearITPendingBit(UART2_IT_OR);
	push	#0x35
	push	#0x02
	call	_UART2_ClearITPendingBit
	addw	sp, #2
00110$:
;	driver/stm8s_it.c: 465: }
	addw	sp, #4
	iret
;	driver/stm8s_it.c: 514: INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
;	-----------------------------------------
;	 function ADC1_IRQHandler
;	-----------------------------------------
_ADC1_IRQHandler:
;	driver/stm8s_it.c: 519: }
	iret
;	driver/stm8s_it.c: 540: INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
;	-----------------------------------------
;	 function TIM4_UPD_OVF_IRQHandler
;	-----------------------------------------
_TIM4_UPD_OVF_IRQHandler:
;	driver/stm8s_it.c: 545: }
	iret
;	driver/stm8s_it.c: 553: INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
;	-----------------------------------------
;	 function EEPROM_EEC_IRQHandler
;	-----------------------------------------
_EEPROM_EEC_IRQHandler:
;	driver/stm8s_it.c: 558: }
	iret
	.area CODE
	.area CONST
	.area INITIALIZER
__xinit__last_uart_receive_time:
	.db #0x00	; 0
	.area CABS (ABS)
