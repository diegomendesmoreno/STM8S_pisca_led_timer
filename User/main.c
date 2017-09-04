/* Projeto    : STM8S_pisca_led_timer
 * MCU        : STM8S105C6 (STM8SDISCOVERY)
 * Copyright  : Atribui��o (CC BY 4.0) Diego Moreno
 * Vers�o     : 1.0.0
 * Data	      : 05/08/2014
 * Descri��o  : Piscar o LED da placa STM8SDISCOVERY com o timer TIM1.
 */

/* Includes */
#include "stm8s.h"

/* Defines de usu�rio */
//#define USE_EXT_OSCILLATOR

/* Declara��o de Subrotinas */
static void TIM1_Config(void);
void delay(unsigned int milisegundos);

/* Vari�veis globais */
volatile unsigned int u16_cnt_ms = 0;

main()
{
  //Configura��o de Clock
  #ifdef USE_EXT_OSCILLATOR
    CLK_DeInit();
    CLK_HSECmd(ENABLE);                 //Cristal externo = 16MHz
    CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSE, DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
  #else
    CLK_DeInit();
    CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);	//Clock interno = 16MHz
  #endif
  
  /* Inicializa��es */
  GPIO_Init(GPIOD,GPIO_PIN_0,GPIO_MODE_OUT_PP_LOW_SLOW);//LED
  TIM1_Config();
  
  //Permitir interrup��es
  enableInterrupts();
  
  while(1)
  {
    GPIO_WriteHigh(GPIOD,GPIO_PIN_0);
    delay(1000);
    GPIO_WriteLow(GPIOD,GPIO_PIN_0);
    delay(1000);
  }
}

/* Subrotina  : TIM1_Config
 * Descri��o  : Inicializa o timer TIM1.
 * Par�metros : void
 * Retorno    : void
 */
static void TIM1_Config(void)
{
  //Configura��o para frequ�ncia TIM1 = 1000 Hz
  uint16_t Prescaler = 15;
  uint16_t Period = 999;
  
  //Inicializa��o do TIM1
  TIM1_TimeBaseInit(Prescaler, TIM1_COUNTERMODE_UP, Period, 0);
  
  //Escolhe interrup��o por OVERFLOW ("UPDATE")
  TIM1_ITConfig(TIM1_IT_UPDATE, ENABLE);
  
  //Ativa o perif�rico TIM1
  TIM1_Cmd(ENABLE);
  
  //Gera um evento para ativar as configura��es
  TIM1->EGR |= 0x0001;
  
  //Limpa o flag do TIM1
  TIM1_ClearFlag(TIM1_FLAG_UPDATE);
}


/* Subrotina  : delay
 * Descri��o  : Cria um atraso com o tempo em milisegundos predeterminado.
 * Par�metros : Tempo de atraso em milissegundos
 * Retorno    : void
 */
void delay(unsigned int milisegundos)
{
  u16_cnt_ms = 0;
  
  while(milisegundos > u16_cnt_ms);
}