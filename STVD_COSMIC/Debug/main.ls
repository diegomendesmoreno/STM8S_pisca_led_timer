   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.3 - 27 Jul 2015
   3                     ; Generator (Limited) V4.4.2 - 04 Jun 2015
  16                     	bsct
  17  0000               _u16_cnt_ms:
  18  0000 0000          	dc.w	0
  55                     ; 22 main()
  55                     ; 23 {
  57                     .text:	section	.text,new
  58  0000               _main:
  62                     ; 30     CLK_DeInit();
  64  0000 cd0000        	call	_CLK_DeInit
  66                     ; 31     CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);	//Clock interno = 16MHz
  68  0003 4f            	clr	a
  69  0004 cd0000        	call	_CLK_HSIPrescalerConfig
  71                     ; 35   GPIO_Init(GPIOD,GPIO_PIN_0,GPIO_MODE_OUT_PP_LOW_SLOW);//LED
  73  0007 4bc0          	push	#192
  74  0009 4b01          	push	#1
  75  000b ae500f        	ldw	x,#20495
  76  000e cd0000        	call	_GPIO_Init
  78  0011 85            	popw	x
  79                     ; 36   TIM1_Config();
  81  0012 cd0000        	call	L3_TIM1_Config
  83                     ; 39   enableInterrupts();
  86  0015 9a            rim
  88  0016               L32:
  89                     ; 43     GPIO_WriteHigh(GPIOD,GPIO_PIN_0);
  91  0016 4b01          	push	#1
  92  0018 ae500f        	ldw	x,#20495
  93  001b cd0000        	call	_GPIO_WriteHigh
  95  001e 84            	pop	a
  96                     ; 44     delay(1000);
  98  001f ae03e8        	ldw	x,#1000
  99  0022 cd0000        	call	_delay
 101                     ; 45     GPIO_WriteLow(GPIOD,GPIO_PIN_0);
 103  0025 4b01          	push	#1
 104  0027 ae500f        	ldw	x,#20495
 105  002a cd0000        	call	_GPIO_WriteLow
 107  002d 84            	pop	a
 108                     ; 46     delay(1000);
 110  002e ae03e8        	ldw	x,#1000
 111  0031 cd0000        	call	_delay
 114  0034 20e0          	jra	L32
 161                     ; 55 static void TIM1_Config(void)
 161                     ; 56 {
 162                     .text:	section	.text,new
 163  0000               L3_TIM1_Config:
 165  0000 5204          	subw	sp,#4
 166       00000004      OFST:	set	4
 169                     ; 58   uint16_t Prescaler = 15;
 171                     ; 59   uint16_t Period = 999;
 173                     ; 62   TIM1_TimeBaseInit(Prescaler, TIM1_COUNTERMODE_UP, Period, 0);
 175  0002 4b00          	push	#0
 176  0004 ae03e7        	ldw	x,#999
 177  0007 89            	pushw	x
 178  0008 4b00          	push	#0
 179  000a ae000f        	ldw	x,#15
 180  000d cd0000        	call	_TIM1_TimeBaseInit
 182  0010 5b04          	addw	sp,#4
 183                     ; 65   TIM1_ITConfig(TIM1_IT_UPDATE, ENABLE);
 185  0012 ae0101        	ldw	x,#257
 186  0015 cd0000        	call	_TIM1_ITConfig
 188                     ; 68   TIM1_Cmd(ENABLE);
 190  0018 a601          	ld	a,#1
 191  001a cd0000        	call	_TIM1_Cmd
 193                     ; 71   TIM1->EGR |= 0x0001;
 195  001d 72105257      	bset	21079,#0
 196                     ; 74   TIM1_ClearFlag(TIM1_FLAG_UPDATE);
 198  0021 ae0001        	ldw	x,#1
 199  0024 cd0000        	call	_TIM1_ClearFlag
 201                     ; 75 }
 204  0027 5b04          	addw	sp,#4
 205  0029 81            	ret
 240                     ; 83 void delay(unsigned int milisegundos)
 240                     ; 84 {
 241                     .text:	section	.text,new
 242  0000               _delay:
 244  0000 89            	pushw	x
 245       00000000      OFST:	set	0
 248                     ; 85   u16_cnt_ms = 0;
 250  0001 5f            	clrw	x
 251  0002 bf00          	ldw	_u16_cnt_ms,x
 253  0004               L37:
 254                     ; 87   while(milisegundos > u16_cnt_ms);
 256  0004 1e01          	ldw	x,(OFST+1,sp)
 257  0006 b300          	cpw	x,_u16_cnt_ms
 258  0008 22fa          	jrugt	L37
 259                     ; 88 }
 262  000a 85            	popw	x
 263  000b 81            	ret
 287                     	xdef	_main
 288                     	xdef	_u16_cnt_ms
 289                     	xdef	_delay
 290                     	xref	_TIM1_ClearFlag
 291                     	xref	_TIM1_ITConfig
 292                     	xref	_TIM1_Cmd
 293                     	xref	_TIM1_TimeBaseInit
 294                     	xref	_GPIO_WriteLow
 295                     	xref	_GPIO_WriteHigh
 296                     	xref	_GPIO_Init
 297                     	xref	_CLK_HSIPrescalerConfig
 298                     	xref	_CLK_DeInit
 317                     	end
