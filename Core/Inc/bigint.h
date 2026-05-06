#ifndef BIGINT_H
#define BIGINT_H

#include <stdint.h>
#include <stddef.h>

#ifdef __cplusplus
extern "C" {
#endif

typedef struct {
    size_t   n_limbs;
    size_t   capacity;
    uint32_t limbs[];
} bigint;

/* ========= memory ========= */
bigint *bigint_alloc(size_t capacity_limbs);
void    bigint_free(bigint *x);
void    bigint_set_zero(bigint *x);
int     bigint_copy(bigint *dst, const bigint *src);
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

/* Karatsuba multiply — drop-in for bigint_mul, faster for large inputs */
int     bigint_karatsuba_mul(bigint *res, const bigint *a, const bigint *b);

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

/* ========= Montgomery ========= */

int bigint_mont_reduction(bigint *r, bigint *x,
                          const bigint *p, uint32_t p_dash, size_t N);

/* Montgomery mod_pow — binary method */
int bigint_mont_mod_pow(bigint *r,
                        const bigint *a, const bigint *b,
                        const bigint *p, const bigint *R_sq,
                        uint32_t p_dash, size_t N,
                        bigint *tmp1, bigint *tmp2, bigint *tmp3);

/* Montgomery mod_pow — sliding window (k=4) */
int bigint_mont_mod_pow_window(bigint *r,
                               const bigint *a, const bigint *b,
                               const bigint *p, const bigint *R_sq,
                               uint32_t p_dash, size_t N,
                               bigint *tmp1, bigint *tmp2, bigint *tmp3);

/* Montgomery mod_pow — binary method with Karatsuba multiplication */
int bigint_mont_mod_pow_karatsuba(bigint *r,
                                  const bigint *a, const bigint *b,
                                  const bigint *p, const bigint *R_sq,
                                  uint32_t p_dash, size_t N,
                                  bigint *tmp1, bigint *tmp2, bigint *tmp3);

#ifdef __cplusplus
}
#endif

#endif
