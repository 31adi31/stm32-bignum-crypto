# stm32-bignum-crypto

Arbitrary-precision integer arithmetic in C for an ARM Cortex-M4 microcontroller (STM32F401RE Nucleo), optimized and benchmarked cycle-by-cycle, and used to implement 2048-bit Diffie-Hellman key exchange on-device.

**Motivation:** this library was built as the arithmetic foundation for verifying Groth16 zk-SNARK proofs on a microcontroller. This repo covers the bignum and modular arithmetic layer; pairing-based verification was planned as future work.

## Features

- Bignum `add`, `sub`, `mul`, `mod`, and shifts with caller-provided result buffers (no allocation on the hot path)
- In-place operations and buffer reuse in modular reduction
- Modular exponentiation (`mod_mul`, `mod_pow`) in three variants:
  - Classic square-and-multiply
  - Montgomery reduction (removes division from the inner loop)
  - Montgomery + sliding window exponentiation (precomputes odd powers to cut multiplications)
- Karatsuba multiplication (implemented and evaluated, see results)
- 2048-bit Diffie-Hellman key exchange built on the library

## Results
<img width="1032" height="689" alt="benchmark results" src="https://github.com/user-attachments/assets/cff0ec7f-47ca-41f4-bcdb-d83b81b93f0a" />

All numbers are CPU cycles measured on-device with the Cortex-M4 **DWT cycle counter** (lower is better). Modulus is 2048-bit.

### Modular exponentiation

| Method | 256-bit base | 512-bit base | Speedup vs. classic (256-bit) |
|---|---:|---:|---:|
| Classic `mod_pow` | 85,660,501 | 117,653,497 | 1.00× |
| Montgomery | 50,057,083 | 50,078,065 | 1.71× |
| **Montgomery + sliding window** | **41,514,579** | **41,527,326** | **2.06×** |
| Montgomery + Karatsuba | 108,594,966 | 108,760,157 | 0.79× |

With a 512-bit base, Montgomery + sliding window is **2.83×** faster than classic. Once Montgomery is in place, cost depends almost entirely on modulus size, not base size.

### Diffie-Hellman key exchange (2048-bit prime)

| Method | x = g^a mod p | y = x^b mod p | Total | vs. Montgomery |
|---|---:|---:|---:|---:|
| Montgomery | 51,769,943 | 50,114,134 | 101,884,077 | 1.00× |
| **Montgomery + sliding window** | **41,509,852** | **41,565,310** | **83,075,162** | **1.23×** |
| Montgomery + Karatsuba | 112,403,424 | 108,883,309 | 221,286,733 | 0.46× |

## Takeaways

- **Montgomery reduction** was the biggest single win, replacing expensive multi-precision division in every `mod_mul`.
- **Sliding window exponentiation** added roughly 20% on top by reducing the number of multiplications.
- **Karatsuba made things slower.** It does less arithmetic in theory, but its recursion needs extra temporary buffers, and the allocation overhead on the Cortex-M4 outweighed the compute savings at these operand sizes. Measuring instead of assuming is what caught this.
- Removing allocation from the base operations mattered as much as the algorithmic changes.

## Hardware and tools

- STM32F401RE Nucleo (ARM Cortex-M4)
- C, STM32CubeIDE, GDB
- DWT cycle counter for benchmarking

## Building

Import the project into STM32CubeIDE, build, and flash to a Nucleo-F401RE board. Library and benchmark code live in `Core/`.
