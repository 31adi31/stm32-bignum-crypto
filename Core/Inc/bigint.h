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
int     bigint_from_hex(bigint *out, const char *hex_str);
void    bigint_to_hex(const bigint *x, char *hex_output, size_t output_size);

/* ========= helpers ========= */
int     bigint_is_zero(const bigint *x);
int     bigint_cmp(const bigint *a, const bigint *b);

/* ========= arithmetic ========= */
int     bigint_add(bigint *res, const bigint *a, const bigint *b);
int     bigint_sub(bigint *res, const bigint *a, const bigint *b);
int     bigint_mul(bigint *res, const bigint *a, const bigint *b);

/* ========= bit ops ========= */
int     bigint_shl1(bigint *x);
int     bigint_shr1(bigint *x);

/* ========= modulo ========= */
int     bigint_mod(bigint *res, const bigint *a, const bigint *b, bigint *tmp);


/* r = (a * b) mod p */
int bigint_mod_mul(bigint *r,
            const bigint *a,
            const bigint *b,
            const bigint *p,
            bigint *tmp_mul,
            bigint *tmp_mod);

/* r = a^b mod p (square-multiply) */
int bigint_mod_pow(bigint *r,
            const bigint *a,
            const bigint *b,
            const bigint *p,
            bigint *tmp1,
            bigint *tmp2,
            bigint *tmp3);

#ifdef __cplusplus
}
#endif

#endif

