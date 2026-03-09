/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.c
  * @brief          : Main program body
  ******************************************************************************
  */
/* USER CODE END Header */

#include "main.h"
#include <stdio.h>
#include "core_cm4.h"
#include "bigint.h"


void SystemClock_Config(void);
static void MX_GPIO_Init(void);


/* USER CODE BEGIN 0 */
static inline void DWT_CycleCounterInit(void) {
  CoreDebug->DEMCR |= CoreDebug_DEMCR_TRCENA_Msk;
  DWT->CYCCNT = 0;
  DWT->CTRL |= DWT_CTRL_CYCCNTENA_Msk;
}
/* USER CODE END 0 */


int main(void)
{

  HAL_Init();

  CoreDebug->DEMCR |= CoreDebug_DEMCR_TRCENA_Msk;
  ITM->TCR = ITM_TCR_ITMENA_Msk;
  ITM->TER = 1;
  setvbuf(stdout, NULL, _IONBF, 0);

  SystemClock_Config();

  MX_GPIO_Init();
  DWT_CycleCounterInit();

  const char *hex_str =
      "30644e72e131a029b85045b68181585d97816a916871ca8d3c208c16d87cfd47";

  bigint *A   = bigint_alloc(8);
  bigint *B   = bigint_alloc(8);
  bigint *R   = bigint_alloc(16);
  bigint *TMP = bigint_alloc(16);

  /* NEW SCRATCH BUFFERS */
  bigint *TMP2 = bigint_alloc(16);
  bigint *TMP3 = bigint_alloc(16);
  bigint *TMP4 = bigint_alloc(16);

  char out_hex[140];

  if (!A || !B || !R || !TMP || !TMP2 || !TMP3 || !TMP4) {
    printf("Bigint alloc failed\r\n");
    Error_Handler();
  }

  bigint_from_hex(A, hex_str);
  bigint_from_hex(B, hex_str);

  bigint_add(R, A, B);
  bigint_to_hex(R, out_hex, sizeof out_hex);
  printf("A+B = %s\r\n", out_hex);

  static volatile uint32_t bench_sink = 0;

  while (1)
  {
      const uint32_t N = 500;

      // ---------- ADD ----------
      __DSB(); __ISB();
      uint32_t start = DWT->CYCCNT;

      for (uint32_t i = 0; i < N; i++) {
          bigint_add(R, A, B);
          bench_sink ^= R->limbs[0];
      }

      uint32_t add_cycles = DWT->CYCCNT - start;
      __DSB(); __ISB();

      printf("bigint_add: %lu cycles/op\r\n",
             (unsigned long)(add_cycles / N));


      // ---------- SUB ----------
      __DSB(); __ISB();
      start = DWT->CYCCNT;

      for (uint32_t i = 0; i < N; i++) {
          bigint_sub(R, A, B);
          bench_sink ^= R->limbs[0];
      }

      uint32_t sub_cycles = DWT->CYCCNT - start;
      __DSB(); __ISB();

      printf("bigint_sub: %lu cycles/op\r\n",
             (unsigned long)(sub_cycles / N));


      // ---------- MUL ----------
      __DSB(); __ISB();
      start = DWT->CYCCNT;

      for (uint32_t i = 0; i < N; i++) {
          bigint_mul(R, A, B);
          bench_sink ^= R->limbs[0];
      }

      uint32_t mul_cycles = DWT->CYCCNT - start;
      __DSB(); __ISB();

      printf("bigint_mul: %lu cycles/op\r\n",
             (unsigned long)(mul_cycles / N));


      // ---------- MOD ----------
      const uint32_t Nmod = 50;

      __DSB(); __ISB();
      start = DWT->CYCCNT;

      for (uint32_t i = 0; i < Nmod; i++) {
          bigint_mod(R, A, B, TMP);
          bench_sink ^= R->limbs[0];
      }

      uint32_t mod_cycles = DWT->CYCCNT - start;
      __DSB(); __ISB();

      printf("bigint_mod: %lu cycles/op\r\n",
             (unsigned long)(mod_cycles / Nmod));


      // ---------- MOD MUL ----------
      const uint32_t Nmodmul = 50;

      __DSB(); __ISB();
      start = DWT->CYCCNT;

      for (uint32_t i = 0; i < Nmodmul; i++) {
          bigint_mod_mul(R, A, B, B, TMP2, TMP3);
          bench_sink ^= R->limbs[0];
      }

      uint32_t modmul_cycles = DWT->CYCCNT - start;
      __DSB(); __ISB();

      printf("bigint_mod_mul: %lu cycles/op\r\n",
             (unsigned long)(modmul_cycles / Nmodmul));


      // ---------- MOD POW ----------
      const uint32_t Nmodpow = 10;

      __DSB(); __ISB();
      start = DWT->CYCCNT;

      for (uint32_t i = 0; i < Nmodpow; i++) {
          bigint_mod_pow(R, A, B, B, TMP2, TMP3, TMP4);
          bench_sink ^= R->limbs[0];
      }

      uint32_t modpow_cycles = DWT->CYCCNT - start;
      __DSB(); __ISB();

      printf("bigint_mod_pow: %lu cycles/op\r\n",
             (unsigned long)(modpow_cycles / Nmodpow));


      HAL_GPIO_TogglePin(GPIOA, GPIO_PIN_5);
      HAL_Delay(500);
  }
}


/* CLOCK CONFIG (UNCHANGED) */

void SystemClock_Config(void)
{
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};

  __HAL_RCC_PWR_CLK_ENABLE();
  __HAL_PWR_VOLTAGESCALING_CONFIG(PWR_REGULATOR_VOLTAGE_SCALE2);

  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSI;
  RCC_OscInitStruct.HSIState = RCC_HSI_ON;
  RCC_OscInitStruct.HSICalibrationValue = RCC_HSICALIBRATION_DEFAULT;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_NONE;

  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    Error_Handler();
  }

  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;

  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_HSI;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV1;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_0) != HAL_OK)
  {
    Error_Handler();
  }
}


/* GPIO INIT (UNCHANGED) */

static void MX_GPIO_Init(void)
{
  GPIO_InitTypeDef GPIO_InitStruct = {0};

  __HAL_RCC_GPIOA_CLK_ENABLE();

  HAL_GPIO_WritePin(GPIOA, GPIO_PIN_5, GPIO_PIN_RESET);

  GPIO_InitStruct.Pin = GPIO_PIN_5;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;

  HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);
}


/* PRINTF REDIRECT (UNCHANGED) */

int _write(int file, char *ptr, int len) {
  for (int i = 0; i < len; i++) {
    ITM_SendChar((uint32_t)ptr[i]);
  }
  return len;
}


void Error_Handler(void)
{
  __disable_irq();
  while (1) { }
}
