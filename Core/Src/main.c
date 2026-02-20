/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.c
  * @brief          : Main program body
  ******************************************************************************
  * @attention
  *
  * Copyright (c) 2025 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  ******************************************************************************
  */
/* USER CODE END Header */
/* Includes ------------------------------------------------------------------*/
#include "main.h"
#include <stdio.h>
#include "core_cm4.h"   // for ITM_SendChar
#include "bigint.h"


/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */

/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */

/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */

/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/

/* USER CODE BEGIN PV */

/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
static void MX_GPIO_Init(void);
/* USER CODE BEGIN PFP */

/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */
/* USER CODE BEGIN 0 */
static inline void DWT_CycleCounterInit(void) {
  CoreDebug->DEMCR |= CoreDebug_DEMCR_TRCENA_Msk;  // enable DWT/ITM block
  DWT->CYCCNT = 0;                                 // reset counter
  DWT->CTRL |= DWT_CTRL_CYCCNTENA_Msk;             // start CYCCNT
}

/* USER CODE END 0 */


/* USER CODE END 0 */

/**
  * @brief  The application entry point.
  * @retval int
  */

// Retarget printf() to SWV (ITM)

int main(void)
{

  /* USER CODE BEGIN 1 */

  /* USER CODE END 1 */

  /* MCU Configuration--------------------------------------------------------*/

  /* Reset of all peripherals, Initializes the Flash interface and the Systick. */


  /* USER CODE BEGIN Init */
  HAL_Init();
  // right after HAL_Init();
  CoreDebug->DEMCR |= CoreDebug_DEMCR_TRCENA_Msk;   // enable tracing
  ITM->TCR = ITM_TCR_ITMENA_Msk;                    // enable ITM
  ITM->TER = 1;                                     // enable stimulus port 0
  setvbuf(stdout, NULL, _IONBF, 0);
  SystemClock_Config();
  /* USER CODE END Init */

  /* Configure the system clock */


  /* USER CODE BEGIN SysInit */

  /* USER CODE END SysInit */

  /* Initialize all configured peripherals */

  /* USER CODE BEGIN 2 */
  MX_GPIO_Init();
  DWT_CycleCounterInit();
  /* USER CODE END 2 */

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */
  // Allocate test operands ONCE (outside the loop)
  const char *hex_str =
      "30644e72e131a029b85045b68181585d97816a916871ca8d3c208c16d87cfd47";

  // Preallocate bigints
  bigint *A   = bigint_alloc(8);
  bigint *B   = bigint_alloc(8);
  bigint *R   = bigint_alloc(16);   // enough for mul
  bigint *TMP = bigint_alloc(16);   // scratch for mod

  char out_hex[140];

  if (!A || !B || !R || !TMP) {
    printf("Bigint alloc failed\r\n");
    Error_Handler();
  }

  // Load values
  bigint_from_hex(A, hex_str);
  bigint_from_hex(B, hex_str);

  // Quick sanity print once (same format as before)
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


      // ---------- SANITY / LIVENESS ----------
      HAL_GPIO_TogglePin(GPIOA, GPIO_PIN_5);
      HAL_Delay(500);
  }


  /* USER CODE END 3 */
}

/**
  * @brief System Clock Configuration
  * @retval None
  */
void SystemClock_Config(void)
{
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};

  /** Configure the main internal regulator output voltage
  */
  __HAL_RCC_PWR_CLK_ENABLE();
  __HAL_PWR_VOLTAGESCALING_CONFIG(PWR_REGULATOR_VOLTAGE_SCALE2);

  /** Initializes the RCC Oscillators according to the specified parameters
  * in the RCC_OscInitTypeDef structure.
  */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSI;
  RCC_OscInitStruct.HSIState = RCC_HSI_ON;
  RCC_OscInitStruct.HSICalibrationValue = RCC_HSICALIBRATION_DEFAULT;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_NONE;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    Error_Handler();
  }

  /** Initializes the CPU, AHB and APB buses clocks
  */
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

/**
  * @brief GPIO Initialization Function
  * @param None
  * @retval None
  */
static void MX_GPIO_Init(void)
{
  GPIO_InitTypeDef GPIO_InitStruct = {0};
  /* USER CODE BEGIN MX_GPIO_Init_1 */

  /* USER CODE END MX_GPIO_Init_1 */

  /* GPIO Ports Clock Enable */
  __HAL_RCC_GPIOA_CLK_ENABLE();

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(GPIOA, GPIO_PIN_5, GPIO_PIN_RESET);

  /*Configure GPIO pin : PA5 */
  GPIO_InitStruct.Pin = GPIO_PIN_5;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);

  /* USER CODE BEGIN MX_GPIO_Init_2 */

  /* USER CODE END MX_GPIO_Init_2 */
}

/* USER CODE BEGIN 4 */
int _write(int file, char *ptr, int len) {
  for (int i = 0; i < len; i++) {
    ITM_SendChar((uint32_t)ptr[i]);
  }
  return len;
}

/* USER CODE END 4 */

/**
  * @brief  This function is executed in case of error occurrence.
  * @retval None
  */
void Error_Handler(void)
{
  /* USER CODE BEGIN Error_Handler_Debug */
  /* User can add his own implementation to report the HAL error return state */
  __disable_irq();
  while (1)
  {
  }
  /* USER CODE END Error_Handler_Debug */
}
#ifdef USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t *file, uint32_t line)
{
  /* USER CODE BEGIN 6 */
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  /* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */
