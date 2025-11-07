#include <stdint.h>
#include <stddef.h>
#include <string.h>
#include <stdio.h>

// Prototypes
void hex_to_bigint(int32_t *limbds, const char *hex_str, size_t n_limbds);
void bigint_add(const int32_t *a, const int32_t *b, size_t n_limbs, int32_t *res);
void bigint_sub(const int32_t *a, const int32_t *b, size_t n_limbs, int32_t *res);
void bigint_mul(const int32_t *a, const int32_t *b, size_t n_limbs, int32_t *res);
void bigint_mul_mod_2k(const int32_t *a, const int32_t *b, size_t n_limbs, int32_t *res);
void bigint_to_hex(int32_t *limbs, size_t n_limbs, char *hex_output, size_t output_size);
// int main(void) {
//     const char *hex_str =
//         "30644e72e131a029b85045b68181585d97816a916871ca8d3c208c16d87cfd47";

//     int32_t firstLimbds[8];
//     int32_t secondLimbds[8];
//     int32_t resultSum[9]; 
//     int32_t resultSub[8]; 
//     int32_t resultMul[16]; 
//     int32_t resultMod[8];          // 8 limbs + 1 for carry
//     char hex_sum_output[100];       // buffer for hex string
//     char hex_sub_output[100];
//     char hex_mul_output[128];
//     char hex_mod_output[100];

//     // Parse hex into limbs
//     hex_to_bigint(firstLimbds, hex_str, 8);
//     hex_to_bigint(secondLimbds, hex_str, 8);

//     // Add them
//     bigint_add(firstLimbds, secondLimbds, 8, resultSum);
//     bigint_sub(firstLimbds, secondLimbds, 8, resultSub);
//     printf("Raw resultSub limbs (little-endian):\n");
//     for (int i = 7; i >= 0; i--) {
//         printf("  resultSub[%d] = %08x\n", i, (uint32_t)resultSub[i]);
//     }

//     bigint_mul(firstLimbds,secondLimbds,8, resultMul);
//     bigint_mul_mod_2k(firstLimbds,secondLimbds, 8, resultMod);

//     // Convert result back to hex (9 limbs because of possible carry)
//     bigint_to_hex(resultSum, 9, hex_sum_output, sizeof(hex_sum_output));
//     bigint_to_hex(resultSub, 8, hex_sub_output, sizeof(hex_sub_output));
//     bigint_to_hex(resultMul, 16, hex_mul_output, sizeof(hex_mul_output));
//     bigint_to_hex(resultMod, 8, hex_mod_output, sizeof(hex_mod_output));


//     // Print
//     printf("sum = %s\n", hex_sum_output);
//     printf("subtraction = %s\n", hex_sub_output);
//     printf("multiplication = %s\n", hex_mul_output);
//     printf("mod = %s\n", hex_mod_output);


//     return 0;
// }


// res must have space for n_limbs + 1 limbs.
// Adds a + b and writes full-precision result into res.
void bigint_add(const int32_t *a,
                const int32_t *b,
                size_t n_limbs,
                int32_t *res) {
    uint64_t carry = 0;

    for (size_t i = 0; i < n_limbs; i++) {
        uint64_t av = (uint64_t)(uint32_t)a[i];
        uint64_t bv = (uint64_t)(uint32_t)b[i];
        uint64_t sum = av + bv + carry;

        res[i] = (int32_t)(sum & 0xFFFFFFFFu);
        carry  = sum >> 32;
    }

    // final carry in the next limb
    res[n_limbs] = (int32_t)(carry & 0xFFFFFFFFu);
}

// res must have space for n_limbs limbs.
// Computes res = a − b; assumes a >= b for true arithmetic result.
void bigint_sub(const int32_t *a,
                const int32_t *b,
                size_t n_limbs,
                int32_t *res) {
    uint64_t borrow = 0;

    for (size_t i = 0; i < n_limbs; i++) {
        uint64_t av = (uint64_t)(uint32_t)a[i];
        uint64_t bv = (uint64_t)(uint32_t)b[i];
        uint64_t needed = bv + borrow;
        uint64_t diff = av - bv - borrow;

        if (av < needed)
            borrow = 1;
        else
            borrow = 0;

        res[i] = (int32_t)(diff & 0xFFFFFFFFu);
    }

    // if borrow == 1 here, result wrapped mod 2^(32*n_limbs)
}

// res must have space for 2 * n_limbs limbs.
// Computes full product res = a * b (schoolbook method).
void bigint_mul(const int32_t *a,
                const int32_t *b,
                size_t n_limbs,
                int32_t *res) {
    // zero the result
    for (size_t i = 0; i < 2 * n_limbs; i++) {
        res[i] = 0;
    }

    for (size_t i = 0; i < n_limbs; i++) {
        uint64_t carry = 0;
        uint64_t av = (uint64_t)(uint32_t)a[i];

        for (size_t j = 0; j < n_limbs; j++) {
            size_t k = i + j;

            uint64_t bv  = (uint64_t)(uint32_t)b[j];
            uint64_t cur = (uint64_t)(uint32_t)res[k];

            uint64_t prod = av * bv + cur + carry;

            res[k] = (int32_t)(prod & 0xFFFFFFFFu);
            carry  = prod >> 32;
        }

        res[i + n_limbs] = (int32_t)((uint32_t)carry);
    }
}

void bigint_mul_mod_2k(const int32_t *a,
                       const int32_t *b,
                       size_t n_limbs, int32_t *res) {
    int32_t tmp[64];  // adjust size if n_limbs can be bigger than 32

    // NOTE: fixed argument order here
    bigint_mul(a, b, n_limbs, tmp);

    // Keep only low n_limbs limbs (mod 2^(32*n_limbs))
    for (size_t i = 0; i < n_limbs; i++) {
        res[i] = tmp[i];
    }
    // high limbs tmp[n_limbs .. 2*n_limbs-1] are discarded
}


void hex_to_bigint(int32_t *limbds, const char *hex_str, size_t n_limbds) {
    // 1) Zero out all limbs so we start from a known state
    for (size_t i = 0; i < n_limbds; i++) {
        limbds[i] = 0;
    }

    size_t limbIdx = 0;
    size_t len = strlen(hex_str);

    // i = index of the LAST char in the current 8-digit chunk
    for (long i = (long)len - 1; i >= 0 && limbIdx < n_limbds; i -= 8) {
        uint32_t acc = 0;

        // Find the START index for this chunk (up to 8 chars)
        long start = i - 7;
        if (start < 0) {
            start = 0;  // leftmost chunk may have fewer than 8 hex digits
        }

        // Walk from start → i (left to right) and build a base-16 number
        for (long j = start; j <= i; j++) {
            char c = hex_str[j];
            uint32_t d;

            if (c >= '0' && c <= '9') {
                d = (uint32_t)(c - '0');          // '0'..'9' → 0..9
            } else if (c >= 'a' && c <= 'f') {
                d = 10u + (uint32_t)(c - 'a');    // 'a'..'f' → 10..15
            } else if (c >= 'A' && c <= 'F') {
                d = 10u + (uint32_t)(c - 'A');    // 'A'..'F' → 10..15
            } else {
                continue;
            }

            // acc = acc * 16 + d;
            acc = (acc << 4) | d;   // multiply by 16, then add digit
        }

        // Store this 32-bit chunk into the current limb (little-endian)
        limbds[limbIdx] = (int32_t)acc;
        limbIdx++;
    }
}

void bigint_to_hex(int32_t *limbs, size_t n_limbs,
                   char *hex_output, size_t output_size) {

    (void)output_size; // unused for now

    char hexdigits[] = "0123456789abcdef";

    // Step 1: find most significant non-zero limb
    long ms_limb_idx = (long)n_limbs - 1;
    while (ms_limb_idx >= 0 && limbs[ms_limb_idx] == 0) {
        ms_limb_idx--;
    }

    // Step 2: zero case
    if (ms_limb_idx < 0) {
        hex_output[0] = '0';
        hex_output[1] = '\0';
        return;
    }

    size_t hex_pos = 0;

    // Step 3: process most significant limb (skip leading zeros)
    uint32_t limb = (uint32_t)limbs[ms_limb_idx];
    int started = 0;
    for (int nib = 7; nib >= 0; nib--) {
        uint32_t v = (limb >> (nib * 4)) & 0xF;
        if (!started && v == 0) continue;  // skip leading zeros
        started = 1;
        hex_output[hex_pos++] = hexdigits[v];
    }

    // Step 4: process remaining limbs (always 8 hex digits each)
    for (long i = ms_limb_idx - 1; i >= 0; i--) {
        limb = (uint32_t)limbs[i];
        for (int nib = 7; nib >= 0; nib--) {
            uint32_t v = (limb >> (nib * 4)) & 0xF;
            hex_output[hex_pos++] = hexdigits[v];
        }
    }

    // Step 5: null terminate
    hex_output[hex_pos] = '\0';
}
