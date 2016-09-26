   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.3 - 27 Jul 2015
   3                     ; Generator (Limited) V4.4.2 - 04 Jun 2015
  45                     ; 54 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
  45                     ; 55 {
  46                     .text:	section	.text,new
  47  0000               f_NonHandledInterrupt:
  51                     ; 59 }
  54  0000 80            	iret
  76                     ; 67 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  76                     ; 68 {
  77                     .text:	section	.text,new
  78  0000               f_TRAP_IRQHandler:
  82                     ; 72 }
  85  0000 80            	iret
 107                     ; 79 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
 107                     ; 80 {
 108                     .text:	section	.text,new
 109  0000               f_TLI_IRQHandler:
 113                     ; 84 }
 116  0000 80            	iret
 138                     ; 91 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 138                     ; 92 {
 139                     .text:	section	.text,new
 140  0000               f_AWU_IRQHandler:
 144                     ; 96 }
 147  0000 80            	iret
 169                     ; 103 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 169                     ; 104 {
 170                     .text:	section	.text,new
 171  0000               f_CLK_IRQHandler:
 175                     ; 108 }
 178  0000 80            	iret
 201                     ; 115 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 201                     ; 116 {
 202                     .text:	section	.text,new
 203  0000               f_EXTI_PORTA_IRQHandler:
 207                     ; 120 }
 210  0000 80            	iret
 233                     ; 127 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 233                     ; 128 {
 234                     .text:	section	.text,new
 235  0000               f_EXTI_PORTB_IRQHandler:
 239                     ; 132 }
 242  0000 80            	iret
 265                     ; 139 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 265                     ; 140 {
 266                     .text:	section	.text,new
 267  0000               f_EXTI_PORTC_IRQHandler:
 271                     ; 144 }
 274  0000 80            	iret
 297                     ; 151 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 297                     ; 152 {
 298                     .text:	section	.text,new
 299  0000               f_EXTI_PORTD_IRQHandler:
 303                     ; 156 }
 306  0000 80            	iret
 329                     ; 163 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 329                     ; 164 {
 330                     .text:	section	.text,new
 331  0000               f_EXTI_PORTE_IRQHandler:
 335                     ; 168 }
 338  0000 80            	iret
 360                     ; 215 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 360                     ; 216 {
 361                     .text:	section	.text,new
 362  0000               f_SPI_IRQHandler:
 366                     ; 220 }
 369  0000 80            	iret
 394                     ; 227 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 394                     ; 228 {
 395                     .text:	section	.text,new
 396  0000               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 398  0000 8a            	push	cc
 399  0001 84            	pop	a
 400  0002 a4bf          	and	a,#191
 401  0004 88            	push	a
 402  0005 86            	pop	cc
 403  0006 3b0002        	push	c_x+2
 404  0009 be00          	ldw	x,c_x
 405  000b 89            	pushw	x
 406  000c 3b0002        	push	c_y+2
 407  000f be00          	ldw	x,c_y
 408  0011 89            	pushw	x
 411                     ; 230   TIM1_ClearFlag(TIM1_FLAG_UPDATE);
 413  0012 ae0001        	ldw	x,#1
 414  0015 cd0000        	call	_TIM1_ClearFlag
 416                     ; 232   ++u16_cnt_ms;
 418  0018 be00          	ldw	x,_u16_cnt_ms
 419  001a 1c0001        	addw	x,#1
 420  001d bf00          	ldw	_u16_cnt_ms,x
 421                     ; 233 }
 424  001f 85            	popw	x
 425  0020 bf00          	ldw	c_y,x
 426  0022 320002        	pop	c_y+2
 427  0025 85            	popw	x
 428  0026 bf00          	ldw	c_x,x
 429  0028 320002        	pop	c_x+2
 430  002b 80            	iret
 453                     ; 240 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 453                     ; 241 {
 454                     .text:	section	.text,new
 455  0000               f_TIM1_CAP_COM_IRQHandler:
 459                     ; 245 }
 462  0000 80            	iret
 485                     ; 278 INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 485                     ; 279 {
 486                     .text:	section	.text,new
 487  0000               f_TIM2_UPD_OVF_BRK_IRQHandler:
 491                     ; 283 }
 494  0000 80            	iret
 517                     ; 290 INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 517                     ; 291 {
 518                     .text:	section	.text,new
 519  0000               f_TIM2_CAP_COM_IRQHandler:
 523                     ; 295 }
 526  0000 80            	iret
 549                     ; 305 INTERRUPT_HANDLER(TIM3_UPD_OVF_BRK_IRQHandler, 15)
 549                     ; 306 {
 550                     .text:	section	.text,new
 551  0000               f_TIM3_UPD_OVF_BRK_IRQHandler:
 555                     ; 310 }
 558  0000 80            	iret
 581                     ; 317 INTERRUPT_HANDLER(TIM3_CAP_COM_IRQHandler, 16)
 581                     ; 318 {
 582                     .text:	section	.text,new
 583  0000               f_TIM3_CAP_COM_IRQHandler:
 587                     ; 322 }
 590  0000 80            	iret
 612                     ; 383 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 612                     ; 384 {
 613                     .text:	section	.text,new
 614  0000               f_I2C_IRQHandler:
 618                     ; 388 }
 621  0000 80            	iret
 644                     ; 396 INTERRUPT_HANDLER(UART2_TX_IRQHandler, 20)
 644                     ; 397 {
 645                     .text:	section	.text,new
 646  0000               f_UART2_TX_IRQHandler:
 650                     ; 401 }
 653  0000 80            	iret
 676                     ; 408 INTERRUPT_HANDLER(UART2_RX_IRQHandler, 21)
 676                     ; 409 {
 677                     .text:	section	.text,new
 678  0000               f_UART2_RX_IRQHandler:
 682                     ; 413 }
 685  0000 80            	iret
 707                     ; 462 INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 707                     ; 463 {
 708                     .text:	section	.text,new
 709  0000               f_ADC1_IRQHandler:
 713                     ; 467 }
 716  0000 80            	iret
 739                     ; 488 INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 739                     ; 489 {
 740                     .text:	section	.text,new
 741  0000               f_TIM4_UPD_OVF_IRQHandler:
 745                     ; 493 }
 748  0000 80            	iret
 771                     ; 501 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 771                     ; 502 {
 772                     .text:	section	.text,new
 773  0000               f_EEPROM_EEC_IRQHandler:
 777                     ; 506 }
 780  0000 80            	iret
 792                     	xref.b	_u16_cnt_ms
 793                     	xdef	f_EEPROM_EEC_IRQHandler
 794                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 795                     	xdef	f_ADC1_IRQHandler
 796                     	xdef	f_UART2_TX_IRQHandler
 797                     	xdef	f_UART2_RX_IRQHandler
 798                     	xdef	f_I2C_IRQHandler
 799                     	xdef	f_TIM3_CAP_COM_IRQHandler
 800                     	xdef	f_TIM3_UPD_OVF_BRK_IRQHandler
 801                     	xdef	f_TIM2_CAP_COM_IRQHandler
 802                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 803                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 804                     	xdef	f_TIM1_CAP_COM_IRQHandler
 805                     	xdef	f_SPI_IRQHandler
 806                     	xdef	f_EXTI_PORTE_IRQHandler
 807                     	xdef	f_EXTI_PORTD_IRQHandler
 808                     	xdef	f_EXTI_PORTC_IRQHandler
 809                     	xdef	f_EXTI_PORTB_IRQHandler
 810                     	xdef	f_EXTI_PORTA_IRQHandler
 811                     	xdef	f_CLK_IRQHandler
 812                     	xdef	f_AWU_IRQHandler
 813                     	xdef	f_TLI_IRQHandler
 814                     	xdef	f_TRAP_IRQHandler
 815                     	xdef	f_NonHandledInterrupt
 816                     	xref	_TIM1_ClearFlag
 817                     	xref.b	c_x
 818                     	xref.b	c_y
 837                     	end
