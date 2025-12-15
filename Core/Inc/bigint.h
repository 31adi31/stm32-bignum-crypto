#ifndef BIGINT_H
#define BIGINT_H

#include <stdint.h>
#include <stddef.h>

#ifdef __cplusplus
extern "C" {
#endif

typedef struct {
    size_t   n_limbs;   // allocated limb count (capacity)
    uint32_t limbs[];   // little-endian: limbs[0] is least significant
} bigint;

/* ========= memory ========= */
bigint *bigint_alloc(size_t n_limbs);
void    bigint_free(bigint *x);

/* Shrinks "logical size" by trimming leading zeros.
 * NOTE: This only updates n_limbs; it does NOT realloc.
 */
void    bigint_trim(bigint *x);

/* ========= conversion ========= */
bigint *bigint_from_hex(const char *hex_str, size_t n_limbs);
void    bigint_to_hex(const bigint *x, char *hex_output, size_t output_size);

/* ========= arithmetic ========= */
bigint *bigint_add(const bigint *a, const bigint *b);
/* Returns NULL if a < b (unsigned subtraction) */
bigint *bigint_sub(const bigint *a, const bigint *b);
bigint *bigint_mul(const bigint *a, const bigint *b);

/* ========= helpers / bit ops ========= */
int     bigint_cmp(const bigint *a, const bigint *b);   // -1/0/+1
bigint *bigint_shl1(const bigint *a);
bigint *bigint_shr1(const bigint *a);

/* ========= modulo ========= */
bigint *bigint_mod(const bigint *a, const bigint *b);   // assumes b != 0

#ifdef __cplusplus
}
#endif

#endif
