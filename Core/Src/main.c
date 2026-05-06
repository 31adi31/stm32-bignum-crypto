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

  /* existing benchmark values */
  const char *hex_str =
      "30644e72e131a029b85045b68181585d97816a916871ca8d3c208c16d87cfd47";
  const char *hex_a256 =
      "261ced3ce04fd5dad825b1e0645a25179c33feffe3d7cbaff1a0524a31e459af";
  const char *hex_a512 =
      "4b9139846c6ece307e5439ff71e48a28cdb7bb4b97d6dd4b4f05d29765b61585"
      "266b6f8d7ac9a402cf0ece25a017f460f1907b74d7af4d6a7ebd2851b35c36b6";
  const char *hex_b =
      "4f8ae966d72ee4cfa82140ebe67c809497e5b830757d0106123a48d5a577d143";
  const char *hex_p =
      "30644e72e131a029b85045b68181585d97816a916871ca8d3c208c16d87cfd47";

  /* Montgomery parameters */
  const char *hex_mont_p =
      "fffffffffffffffadf85458a2bb4a9aafdc562"
      "0273d3cf1d8b9c583ce2d3695a9e13641146433fb"
      "cc939dce249b3ef97d2fe363630c75d8f681b202a"
      "ec4617ad3df1ed5d5fd65612433f51f5f066ed085"
      "6365553ded1af3b557135e7f57c935984f0c70e0e"
      "68b77e2a689daf3efe8721df158a136ade73530ac"
      "ca4f483a797abc0ab182b324fb61d108a94bb2c8e"
      "3fbb96adab760d7f4681d4f42a3de394df4ae56ed"
      "e76372bb190b07a7c8ee0a6d709e02fce1cdf7e2e"
      "cc03404cd28342f619172fe9ce98583ff8e4f1232"
      "eef28183c3fe3b1b4c6fad733bb5fcbc2ec22005c"
      "58ef1837d1683b2c6f34a26c1b2effa886b423861"
      "285c97ffffffffffffffff";

  const char *hex_mont_rsq =
      "352bd399be84058efaff50d29d573457a57c73b"
      "ddc70fb82bae7b0b36e362dc06a315604189cd76b"
      "06bdeac1f5500fa7e8c2954e4c1804ca5c6d1aebd"
      "b06f65b6a12fb707c8c0510b297a8236fa93d2826"
      "74e1d64fbcbdc8e6678eeb375db18eae1302f2f6d"
      "4777e9b894b245f6b69a144f0c619ce34845885a9"
      "97d50cd51aecdd24a12753c8f09d627588c49875d"
      "5a7748d407c3437b7a8f8a98014a12b74e4b14884"
      "d8a18af8cee3e768c860d10b8a5f57d037430ee91"
      "e561ab426d07137fd70acf2aa4cf36dddf92f8e9a"
      "b7e33fb0f6afebb76e589d6ce9fdac6acff4eaaa1"
      "8af748291173f2a0570187ec422eeb70a152f3964"
      "58f3b8187be36bd38a4fa1";

  /* DH private keys */
  const char *hex_ra = hex_a256;
  const char *hex_rb = hex_b;

  /* existing benchmark bigints */
  bigint *A    = bigint_alloc(8);
  bigint *B    = bigint_alloc(8);
  bigint *R    = bigint_alloc(32);
  bigint *TMP  = bigint_alloc(32);
  bigint *TMP2 = bigint_alloc(32);
  bigint *TMP3 = bigint_alloc(32);
  bigint *TMP4 = bigint_alloc(32);
  bigint *A256 = bigint_alloc(8);
  bigint *A512 = bigint_alloc(16);
  bigint *BEXP = bigint_alloc(8);
  bigint *P    = bigint_alloc(8);

  /* Montgomery bigints */
  bigint *MONT_P   = bigint_alloc(64);
  bigint *MONT_RSQ = bigint_alloc(64);
  bigint *MONT_R   = bigint_alloc(65);
  bigint *MONT_T1  = bigint_alloc(129);
  bigint *MONT_T2  = bigint_alloc(65);
  bigint *MONT_T3  = bigint_alloc(65);

  /* DH bigints */
  bigint *G  = bigint_alloc(1);
  bigint *RA = bigint_alloc(8);
  bigint *RB = bigint_alloc(8);
  bigint *X  = bigint_alloc(65);
  bigint *Y  = bigint_alloc(65);

  char out_hex[520];

  if (!A || !B || !R || !TMP || !TMP2 || !TMP3 || !TMP4
      || !A256 || !A512 || !BEXP || !P
      || !MONT_P || !MONT_RSQ || !MONT_R
      || !MONT_T1 || !MONT_T2 || !MONT_T3
      || !G || !RA || !RB || !X || !Y) {
    printf("Bigint alloc failed\r\n");
    Error_Handler();
  }

  bigint_from_hex(A, hex_str);
  bigint_from_hex(B, hex_str);
  bigint_from_hex(A256, hex_a256);
  bigint_from_hex(A512, hex_a512);
  bigint_from_hex(BEXP, hex_b);
  bigint_from_hex(P, hex_p);

  if (bigint_from_hex(MONT_P, hex_mont_p) != 0) {
      printf("MONT_P parse FAILED\r\n");
      Error_Handler();
  }
  if (bigint_from_hex(MONT_RSQ, hex_mont_rsq) != 0) {
      printf("MONT_RSQ parse FAILED\r\n");
      Error_Handler();
  }

  // g = 2
  bigint_set_zero(G);
  G->limbs[0] = 2;
  G->n_limbs  = 1;

  bigint_from_hex(RA, hex_ra);
  bigint_from_hex(RB, hex_rb);

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
      for (uint32_t i = 0; i < N; i++) { bigint_add(R, A, B); bench_sink ^= R->limbs[0]; }
      uint32_t add_cycles = DWT->CYCCNT - start;
      __DSB(); __ISB();
      printf("bigint_add: %lu cycles/op\r\n", (unsigned long)(add_cycles / N));

      // ---------- SUB ----------
      __DSB(); __ISB();
      start = DWT->CYCCNT;
      for (uint32_t i = 0; i < N; i++) { bigint_sub(R, A, B); bench_sink ^= R->limbs[0]; }
      uint32_t sub_cycles = DWT->CYCCNT - start;
      __DSB(); __ISB();
      printf("bigint_sub: %lu cycles/op\r\n", (unsigned long)(sub_cycles / N));

      // ---------- MUL ----------
      __DSB(); __ISB();
      start = DWT->CYCCNT;
      for (uint32_t i = 0; i < N; i++) { bigint_mul(R, A, B); bench_sink ^= R->limbs[0]; }
      uint32_t mul_cycles = DWT->CYCCNT - start;
      __DSB(); __ISB();
      printf("bigint_mul: %lu cycles/op\r\n", (unsigned long)(mul_cycles / N));

      // ---------- MOD ----------
      const uint32_t Nmod = 50;
      __DSB(); __ISB();
      start = DWT->CYCCNT;
      for (uint32_t i = 0; i < Nmod; i++) { bigint_mod(R, A, B, TMP); bench_sink ^= R->limbs[0]; }
      uint32_t mod_cycles = DWT->CYCCNT - start;
      __DSB(); __ISB();
      printf("bigint_mod: %lu cycles/op\r\n", (unsigned long)(mod_cycles / Nmod));

      // ---------- MOD MUL (256-bit a) ----------
      const uint32_t Nmodmul = 50;
      __DSB(); __ISB();
      start = DWT->CYCCNT;
      for (uint32_t i = 0; i < Nmodmul; i++) { bigint_mod_mul(R, A256, A256, P, TMP2, TMP3); bench_sink ^= R->limbs[0]; }
      uint32_t modmul256_cycles = DWT->CYCCNT - start;
      __DSB(); __ISB();
      bigint_to_hex(R, out_hex, sizeof out_hex);
      printf("bigint_mod_mul (256-bit a): %lu cycles/op\r\n", (unsigned long)(modmul256_cycles / Nmodmul));
      printf("  result: %s\r\n", out_hex);

      // ---------- MOD MUL (512-bit a) ----------
      __DSB(); __ISB();
      start = DWT->CYCCNT;
      for (uint32_t i = 0; i < Nmodmul; i++) { bigint_mod_mul(R, A512, A512, P, TMP2, TMP3); bench_sink ^= R->limbs[0]; }
      uint32_t modmul512_cycles = DWT->CYCCNT - start;
      __DSB(); __ISB();
      bigint_to_hex(R, out_hex, sizeof out_hex);
      printf("bigint_mod_mul (512-bit a): %lu cycles/op\r\n", (unsigned long)(modmul512_cycles / Nmodmul));
      printf("  result: %s\r\n", out_hex);

      // ---------- MOD POW (256-bit a) ----------
      const uint32_t Nmodpow = 10;
      __DSB(); __ISB();
      start = DWT->CYCCNT;
      for (uint32_t i = 0; i < Nmodpow; i++) { bigint_mod_pow(R, A256, BEXP, P, TMP2, TMP3, TMP4); bench_sink ^= R->limbs[0]; }
      uint32_t modpow256_cycles = DWT->CYCCNT - start;
      __DSB(); __ISB();
      bigint_to_hex(R, out_hex, sizeof out_hex);
      printf("bigint_mod_pow (256-bit a): %lu cycles/op\r\n", (unsigned long)(modpow256_cycles / Nmodpow));
      printf("  result: %s\r\n", out_hex);

      // ---------- MOD POW (512-bit a) ----------
      __DSB(); __ISB();
      start = DWT->CYCCNT;
      for (uint32_t i = 0; i < Nmodpow; i++) { bigint_mod_pow(R, A512, BEXP, P, TMP2, TMP3, TMP4); bench_sink ^= R->limbs[0]; }
      uint32_t modpow512_cycles = DWT->CYCCNT - start;
      __DSB(); __ISB();
      bigint_to_hex(R, out_hex, sizeof out_hex);
      printf("bigint_mod_pow (512-bit a): %lu cycles/op\r\n", (unsigned long)(modpow512_cycles / Nmodpow));
      printf("  result: %s\r\n", out_hex);

      // ---------- MONTGOMERY MOD POW (256-bit a, 2048-bit p) ----------
      __DSB(); __ISB();
      start = DWT->CYCCNT;
      int mont_ret = bigint_mont_mod_pow(MONT_R, A256, BEXP, MONT_P, MONT_RSQ,
                                          1, 64, MONT_T1, MONT_T2, MONT_T3);
      uint32_t mont_cycles = DWT->CYCCNT - start;
      __DSB(); __ISB();
      if (mont_ret != 0) {
          printf("mont_mod_pow (256-bit a) FAILED\r\n");
      } else {
          bigint_to_hex(MONT_R, out_hex, sizeof out_hex);
          printf("mont_mod_pow (256-bit a, 2048-bit p): %lu cycles/op\r\n", (unsigned long)mont_cycles);
          printf("  result: %s\r\n", out_hex);
      }

      // ---------- MONTGOMERY MOD POW (512-bit a, 2048-bit p) ----------
      __DSB(); __ISB();
      start = DWT->CYCCNT;
      int mont_ret512 = bigint_mont_mod_pow(MONT_R, A512, BEXP, MONT_P, MONT_RSQ,
                                             1, 64, MONT_T1, MONT_T2, MONT_T3);
      uint32_t mont512_cycles = DWT->CYCCNT - start;
      __DSB(); __ISB();
      if (mont_ret512 != 0) {
          printf("mont_mod_pow (512-bit a) FAILED\r\n");
      } else {
          bigint_to_hex(MONT_R, out_hex, sizeof out_hex);
          printf("mont_mod_pow (512-bit a, 2048-bit p): %lu cycles/op\r\n", (unsigned long)mont512_cycles);
          printf("  result: %s\r\n", out_hex);
      }

      // ---------- SLIDING WINDOW MOD POW (256-bit a, 2048-bit p) ----------
      __DSB(); __ISB();
      start = DWT->CYCCNT;
      int win_ret256 = bigint_mont_mod_pow_window(MONT_R, A256, BEXP, MONT_P, MONT_RSQ,
                                                   1, 64, MONT_T1, MONT_T2, MONT_T3);
      uint32_t win256_cycles = DWT->CYCCNT - start;
      __DSB(); __ISB();
      if (win_ret256 != 0) {
          printf("mont_mod_pow_window (256-bit a) FAILED\r\n");
      } else {
          bigint_to_hex(MONT_R, out_hex, sizeof out_hex);
          printf("mont_mod_pow_window (256-bit a, 2048-bit p): %lu cycles/op\r\n", (unsigned long)win256_cycles);
          printf("  result: %s\r\n", out_hex);
      }

      // ---------- SLIDING WINDOW MOD POW (512-bit a, 2048-bit p) ----------
      __DSB(); __ISB();
      start = DWT->CYCCNT;
      int win_ret512 = bigint_mont_mod_pow_window(MONT_R, A512, BEXP, MONT_P, MONT_RSQ,
                                                   1, 64, MONT_T1, MONT_T2, MONT_T3);
      uint32_t win512_cycles = DWT->CYCCNT - start;
      __DSB(); __ISB();
      if (win_ret512 != 0) {
          printf("mont_mod_pow_window (512-bit a) FAILED\r\n");
      } else {
          bigint_to_hex(MONT_R, out_hex, sizeof out_hex);
          printf("mont_mod_pow_window (512-bit a, 2048-bit p): %lu cycles/op\r\n", (unsigned long)win512_cycles);
          printf("  result: %s\r\n", out_hex);
      }

      // ---------- KARATSUBA MONTGOMERY MOD POW (256-bit a, 2048-bit p) ----------
      __DSB(); __ISB();
      start = DWT->CYCCNT;
      int kara_ret256 = bigint_mont_mod_pow_karatsuba(MONT_R, A256, BEXP, MONT_P, MONT_RSQ,
                                                       1, 64, MONT_T1, MONT_T2, MONT_T3);
      uint32_t kara256_cycles = DWT->CYCCNT - start;
      __DSB(); __ISB();
      if (kara_ret256 != 0) {
          printf("mont_mod_pow_karatsuba (256-bit a) FAILED\r\n");
      } else {
          bigint_to_hex(MONT_R, out_hex, sizeof out_hex);
          printf("mont_mod_pow_karatsuba (256-bit a, 2048-bit p): %lu cycles/op\r\n", (unsigned long)kara256_cycles);
          printf("  result: %s\r\n", out_hex);
      }

      // ---------- KARATSUBA MONTGOMERY MOD POW (512-bit a, 2048-bit p) ----------
      __DSB(); __ISB();
      start = DWT->CYCCNT;
      int kara_ret512 = bigint_mont_mod_pow_karatsuba(MONT_R, A512, BEXP, MONT_P, MONT_RSQ,
                                                       1, 64, MONT_T1, MONT_T2, MONT_T3);
      uint32_t kara512_cycles = DWT->CYCCNT - start;
      __DSB(); __ISB();
      if (kara_ret512 != 0) {
          printf("mont_mod_pow_karatsuba (512-bit a) FAILED\r\n");
      } else {
          bigint_to_hex(MONT_R, out_hex, sizeof out_hex);
          printf("mont_mod_pow_karatsuba (512-bit a, 2048-bit p): %lu cycles/op\r\n", (unsigned long)kara512_cycles);
          printf("  result: %s\r\n", out_hex);
      }

      // ---------- DIFFIE-HELLMAN via Montgomery (2048-bit prime) ----------
      __DSB(); __ISB();
      uint32_t dh_start = DWT->CYCCNT;
      int dh_ret = bigint_mont_mod_pow(X, G, RA, MONT_P, MONT_RSQ,
                                       1, 64, MONT_T1, MONT_T2, MONT_T3);
      uint32_t x_cycles = DWT->CYCCNT - dh_start;
      __DSB(); __ISB();
      if (dh_ret != 0) {
          printf("DH x mont_mod_pow failed!\r\n");
      } else {
          bigint_to_hex(X, out_hex, sizeof out_hex);
          printf("DH x = g^ra mod p2048: %lu cycles\r\n", (unsigned long)x_cycles);
          printf("  x: %s\r\n", out_hex);
          __DSB(); __ISB();
          dh_start = DWT->CYCCNT;
          int dh_ret2 = bigint_mont_mod_pow(Y, X, RB, MONT_P, MONT_RSQ,
                                            1, 64, MONT_T1, MONT_T2, MONT_T3);
          uint32_t y_cycles = DWT->CYCCNT - dh_start;
          __DSB(); __ISB();
          if (dh_ret2 != 0) {
              printf("DH y mont_mod_pow failed!\r\n");
          } else {
              bigint_to_hex(Y, out_hex, sizeof out_hex);
              printf("DH y = x^rb mod p2048: %lu cycles\r\n", (unsigned long)y_cycles);
              printf("  y: %s\r\n", out_hex);
              printf("DH total: %lu cycles\r\n", (unsigned long)(x_cycles + y_cycles));
          }
      }

      // ---------- DIFFIE-HELLMAN via Sliding Window Montgomery (2048-bit prime) ----------
      __DSB(); __ISB();
      uint32_t dhw_start = DWT->CYCCNT;
      int dhw_ret = bigint_mont_mod_pow_window(X, G, RA, MONT_P, MONT_RSQ,
                                               1, 64, MONT_T1, MONT_T2, MONT_T3);
      uint32_t xw_cycles = DWT->CYCCNT - dhw_start;
      __DSB(); __ISB();
      if (dhw_ret != 0) {
          printf("DH (window) x failed!\r\n");
      } else {
          bigint_to_hex(X, out_hex, sizeof out_hex);
          printf("DH (window) x = g^ra mod p2048: %lu cycles\r\n", (unsigned long)xw_cycles);
          printf("  x: %s\r\n", out_hex);
          __DSB(); __ISB();
          dhw_start = DWT->CYCCNT;
          int dhw_ret2 = bigint_mont_mod_pow_window(Y, X, RB, MONT_P, MONT_RSQ,
                                                    1, 64, MONT_T1, MONT_T2, MONT_T3);
          uint32_t yw_cycles = DWT->CYCCNT - dhw_start;
          __DSB(); __ISB();
          if (dhw_ret2 != 0) {
              printf("DH (window) y failed!\r\n");
          } else {
              bigint_to_hex(Y, out_hex, sizeof out_hex);
              printf("DH (window) y = x^rb mod p2048: %lu cycles\r\n", (unsigned long)yw_cycles);
              printf("  y: %s\r\n", out_hex);
              printf("DH (window) total: %lu cycles\r\n", (unsigned long)(xw_cycles + yw_cycles));
          }
      }

      // ---------- DIFFIE-HELLMAN via Karatsuba Montgomery (2048-bit prime) ----------
      __DSB(); __ISB();
      uint32_t dhk_start = DWT->CYCCNT;
      int dhk_ret = bigint_mont_mod_pow_karatsuba(X, G, RA, MONT_P, MONT_RSQ,
                                                   1, 64, MONT_T1, MONT_T2, MONT_T3);
      uint32_t xk_cycles = DWT->CYCCNT - dhk_start;
      __DSB(); __ISB();
      if (dhk_ret != 0) {
          printf("DH (karatsuba) x failed!\r\n");
      } else {
          bigint_to_hex(X, out_hex, sizeof out_hex);
          printf("DH (karatsuba) x = g^ra mod p2048: %lu cycles\r\n", (unsigned long)xk_cycles);
          printf("  x: %s\r\n", out_hex);
          __DSB(); __ISB();
          dhk_start = DWT->CYCCNT;
          int dhk_ret2 = bigint_mont_mod_pow_karatsuba(Y, X, RB, MONT_P, MONT_RSQ,
                                                        1, 64, MONT_T1, MONT_T2, MONT_T3);
          uint32_t yk_cycles = DWT->CYCCNT - dhk_start;
          __DSB(); __ISB();
          if (dhk_ret2 != 0) {
              printf("DH (karatsuba) y failed!\r\n");
          } else {
              bigint_to_hex(Y, out_hex, sizeof out_hex);
              printf("DH (karatsuba) y = x^rb mod p2048: %lu cycles\r\n", (unsigned long)yk_cycles);
              printf("  y: %s\r\n", out_hex);
              printf("DH (karatsuba) total: %lu cycles\r\n", (unsigned long)(xk_cycles + yk_cycles));
          }
      }

      HAL_GPIO_TogglePin(GPIOA, GPIO_PIN_5);
      HAL_Delay(500);
  }
}

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
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK) Error_Handler();
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_HSI;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV1;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;
  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_0) != HAL_OK) Error_Handler();
}

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

int _write(int file, char *ptr, int len) {
  for (int i = 0; i < len; i++) ITM_SendChar((uint32_t)ptr[i]);
  return len;
}

void Error_Handler(void)
{
  __disable_irq();
  while (1) { }
}
