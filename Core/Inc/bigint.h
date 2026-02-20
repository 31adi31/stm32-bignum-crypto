#ifndef BIGINT_H
#define BIGINT_H

#include <stdint.h>
#include <stddef.h>

#ifdef __cplusplus
extern "C" {
#endif

typedef struct {
    size_t   n_limbs;    // number of USED limbs (logical length), >= 1
    size_t   capacity;   // number of ALLOCATED limbs available in limbs[]
    uint32_t limbs[];    // little-endian: limbs[0] is least significant
} bigint;

/* ========= memory ========= */
bigint *bigint_alloc(size_t capacity_limbs);
void    bigint_free(bigint *x);

/* Set x = 0 (keeps capacity, sets n_limbs=1) */
void    bigint_set_zero(bigint *x);

/* Copy src -> dst (dst must have enough capacity) */
int     bigint_copy(bigint *dst, const bigint *src);

/* Shrinks logical size by trimming leading zeros (never reallocs). */
void    bigint_trim(bigint *x);

/* ========= conversion ========= */
/* Parse hex into an existing bigint buffer (no allocation). */
int     bigint_from_hex(bigint *out, const char *hex_str);

/* Write bigint to hex string buffer (null-terminated, truncated if needed). */
void    bigint_to_hex(const bigint *x, char *hex_output, size_t output_size);

/* ========= helpers ========= */
int     bigint_is_zero(const bigint *x);
int     bigint_cmp(const bigint *a, const bigint *b);   // -1/0/+1

/* ========= arithmetic (NO ALLOCATION) ========= */
/* res may alias a or b (in-place OK) */
int     bigint_add(bigint *res, const bigint *a, const bigint *b);

/* unsigned subtraction: res = a - b; returns -1 if a < b. res may alias a. */
int     bigint_sub(bigint *res, const bigint *a, const bigint *b);

/* multiplication: res = a * b; res MUST NOT alias a or b (unless you add scratch) */
int     bigint_mul(bigint *res, const bigint *a, const bigint *b);

/* ========= bit ops (IN-PLACE) ========= */
int     bigint_shl1(bigint *x);   // x <<= 1
int     bigint_shr1(bigint *x);   // x >>= 1

/* ========= modulo (NO ALLOCATION) ========= */
/*
 * res = a mod b  (b != 0)
 * tmp is scratch (used to hold shifted divisor); must have capacity >= res->capacity
 * res may alias a, but must NOT alias tmp.
 */
int     bigint_mod(bigint *res, const bigint *a, const bigint *b, bigint *tmp);

#ifdef __cplusplus
}
#endif

#endif

