/* Projeto    : STM8S_pisca_led_timer
 * MCU        : STM8S105C6 (STM8SDISCOVERY)
 * Copyright  : Atribuição (CC BY 4.0) Diego Moreno
 * Versão     : 1.0.0
 * Data	      : 05/08/2014
 * Descrição  : Piscar o LED da placa STM8SDISCOVERY com o timer TIM1.
 */

/* Includes */
#include "stm8s.h"

/* Defines de usuário */
//#define USE_EXT_OSCILLATOR

/* Declaração de Subrotinas */
static void TIM1_Config(void);
void delay(unsigned int milisegundos);

/* Variáveis globais */
volatile unsigned int u16_cnt_ms = 0;

main()
{
  //Configuração de Clock
  #ifdef USE_EXT_OSCILLATOR
    CLK_DeInit();
    CLK_HSECmd(ENABLE);                 //Cristal externo = 16MHz
    CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSE, DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
  #else
    CLK_DeInit();
    CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);	//Clock interno = 16MHz
  #endif
  
  /* Inicializações */
  GPIO_Init(GPIOD,GPIO_PIN_0,GPIO_MODE_OUT_PP_LOW_SLOW);//LED
  TIM1_Config();
  
  //Permitir interrupções
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
 * Descrição  : Inicializa o timer TIM1.
 * Parâmetros : void
 * Retorno    : void
 */
static void TIM1_Config(void)
{
  //Configuração para frequência TIM1 = 1000 Hz
  uint16_t Prescaler = 15;
  uint16_t Period = 999;
  
  //Inicialização do TIM1
  TIM1_TimeBaseInit(Prescaler, TIM1_COUNTERMODE_UP, Period, 0);
  
  //Escolhe interrupção por OVERFLOW ("UPDATE")
  TIM1_ITConfig(TIM1_IT_UPDATE, ENABLE);
  
  //Ativa o periférico TIM1
  TIM1_Cmd(ENABLE);
  
  //Gera um evento para ativar as configurações
  TIM1->EGR |= 0x0001;
  
  //Limpa o flag do TIM1
  TIM1_ClearFlag(TIM1_FLAG_UPDATE);
}


/* Subrotina  : delay
 * Descrição  : Cria um atraso com o tempo em milisegundos predeterminado.
 * Parâmetros : Tempo de atraso em milissegundos
 * Retorno    : void
 */
void delay(unsigned int milisegundos)
{
  u16_cnt_ms = 0;
  
  while(milisegundos > u16_cnt_ms);
}