#include "bigint.h"
#include <string.h>
#include <stdlib.h>

#ifndef BIGINT_MALLOC
#define BIGINT_MALLOC malloc
#endif

#ifndef BIGINT_FREE
#define BIGINT_FREE free
#endif

/* ============================================================
 *  memory
 * ============================================================ */

bigint *bigint_alloc(size_t capacity_limbs) {
    if (capacity_limbs == 0) capacity_limbs = 1;
    bigint *x = (bigint *)BIGINT_MALLOC(sizeof(bigint) + capacity_limbs * sizeof(uint32_t));
    if (!x) return NULL;
    x->capacity = capacity_limbs;
    x->n_limbs  = 1;
    memset(x->limbs, 0, capacity_limbs * sizeof(uint32_t));
    return x;
}

void bigint_free(bigint *x) {
    if (x) BIGINT_FREE(x);
}

void bigint_set_zero(bigint *x) {
    if (!x) return;
    memset(x->limbs, 0, x->capacity * sizeof(uint32_t));
    x->n_limbs = 1;
}

int bigint_copy(bigint *dst, const bigint *src) {
    if (!dst || !src) return -1;
    if (dst->capacity < src->n_limbs) return -1;
    memset(dst->limbs, 0, dst->capacity * sizeof(uint32_t));
    memcpy(dst->limbs, src->limbs, src->n_limbs * sizeof(uint32_t));
    dst->n_limbs = src->n_limbs;
    return 0;
}

void bigint_trim(bigint *x) {
    if (!x) return;
    while (x->n_limbs > 1 && x->limbs[x->n_limbs - 1] == 0)
        x->n_limbs--;
}

/* ============================================================
 *  helpers
 * ============================================================ */

int bigint_is_zero(const bigint *x) {
    if (!x) return 1;
    for (size_t i = 0; i < x->n_limbs; i++)
        if (x->limbs[i] != 0) return 0;
    return 1;
}

int bigint_cmp(const bigint *a, const bigint *b) {
    if (!a && !b) return 0;
    if (!a) return bigint_is_zero(b) ? 0 : -1;
    if (!b) return bigint_is_zero(a) ? 0 : +1;

    size_t na = a->n_limbs;
    size_t nb = b->n_limbs;
    while (na > 1 && a->limbs[na - 1] == 0) na--;
    while (nb > 1 && b->limbs[nb - 1] == 0) nb--;

    if (na < nb) return -1;
    if (na > nb) return +1;
    for (size_t i = na; i > 0; i--) {
        uint32_t av = a->limbs[i - 1];
        uint32_t bv = b->limbs[i - 1];
        if (av < bv) return -1;
        if (av > bv) return +1;
    }
    return 0;
}

/* ============================================================
 *  conversion
 * ============================================================ */

static int hexval(char c) {
    if (c >= '0' && c <= '9') return (int)(c - '0');
    if (c >= 'a' && c <= 'f') return 10 + (int)(c - 'a');
    if (c >= 'A' && c <= 'F') return 10 + (int)(c - 'A');
    return -1;
}

int bigint_from_hex(bigint *out, const char *hex_str) {
    if (!out || !hex_str) return -1;
    bigint_set_zero(out);
    size_t len = strlen(hex_str);
    size_t limb_idx = 0;
    for (long i = (long)len - 1; i >= 0; i -= 8) {
        if (limb_idx >= out->capacity) return -1;
        uint32_t acc = 0;
        long start = i - 7;
        if (start < 0) start = 0;
        for (long j = start; j <= i; j++) {
            int d = hexval(hex_str[j]);
            if (d < 0) continue;
            acc = (acc << 4) | (uint32_t)d;
        }
        out->limbs[limb_idx++] = acc;
    }
    out->n_limbs = (limb_idx == 0) ? 1 : limb_idx;
    bigint_trim(out);
    return 0;
}

void bigint_to_hex(const bigint *x, char *hex_output, size_t output_size) {
    static const char hexdigits[] = "0123456789abcdef";
    if (!hex_output || output_size == 0) return;
    if (!x || bigint_is_zero(x)) {
        if (output_size >= 2) { hex_output[0] = '0'; hex_output[1] = '\0'; }
        else hex_output[0] = '\0';
        return;
    }
    long ms = (long)x->n_limbs - 1;
    while (ms >= 0 && x->limbs[ms] == 0) ms--;
    if (ms < 0) {
        if (output_size >= 2) { hex_output[0] = '0'; hex_output[1] = '\0'; }
        else hex_output[0] = '\0';
        return;
    }
    size_t pos = 0;
    #define PUTCH(ch) do { if (pos + 1 < output_size) hex_output[pos++] = (ch); } while (0)
    uint32_t limb = x->limbs[ms];
    int started = 0;
    for (int nib = 7; nib >= 0; nib--) {
        uint32_t v = (limb >> (nib * 4)) & 0xFu;
        if (!started && v == 0) continue;
        started = 1;
        PUTCH(hexdigits[v]);
    }
    for (long i = ms - 1; i >= 0; i--) {
        limb = x->limbs[i];
        for (int nib = 7; nib >= 0; nib--)
            PUTCH(hexdigits[(limb >> (nib * 4)) & 0xFu]);
    }
    hex_output[(pos < output_size) ? pos : (output_size - 1)] = '\0';
    #undef PUTCH
}

/* ============================================================
 *  arithmetic
 * ============================================================ */

int bigint_add(bigint *res, const bigint *a, const bigint *b) {
    if (!res || !a || !b) return -1;
    size_t na = a->n_limbs, nb = b->n_limbs;
    size_t n = (na > nb) ? na : nb;
    if (res->capacity < n + 1) return -1;
    uint64_t carry = 0;
    for (size_t i = 0; i < n; i++) {
        uint64_t av = (i < na) ? (uint64_t)a->limbs[i] : 0;
        uint64_t bv = (i < nb) ? (uint64_t)b->limbs[i] : 0;
        uint64_t sum = av + bv + carry;
        res->limbs[i] = (uint32_t)sum;
        carry = sum >> 32;
    }
    res->limbs[n] = (uint32_t)carry;
    res->n_limbs = n + (carry ? 1 : 0);
    for (size_t i = res->n_limbs; i < res->capacity; i++) res->limbs[i] = 0;
    return 0;
}

int bigint_sub(bigint *res, const bigint *a, const bigint *b) {
    if (!res || !a || !b) return -1;
    if (bigint_cmp(a, b) < 0) return -1;
    if (res->capacity < a->n_limbs) return -1;
    uint64_t borrow = 0;
    size_t n = a->n_limbs;
    for (size_t i = 0; i < n; i++) {
        uint64_t av = (uint64_t)a->limbs[i];
        uint64_t bv = (i < b->n_limbs) ? (uint64_t)b->limbs[i] : 0;
        uint64_t needed = bv + borrow;
        uint64_t diff   = av - needed;
        borrow = (av < needed) ? 1 : 0;
        res->limbs[i] = (uint32_t)diff;
    }
    res->n_limbs = n;
    bigint_trim(res);
    for (size_t i = res->n_limbs; i < res->capacity; i++) res->limbs[i] = 0;
    return 0;
}

int bigint_mul(bigint *res, const bigint *a, const bigint *b) {
    if (!res || !a || !b) return -1;
    if (res == a || res == b) return -1;
    size_t na = a->n_limbs, nb = b->n_limbs;
    if (res->capacity < na + nb) return -1;
    memset(res->limbs, 0, res->capacity * sizeof(uint32_t));
    for (size_t i = 0; i < na; i++) {
        uint64_t carry = 0;
        uint64_t av = (uint64_t)a->limbs[i];
        for (size_t j = 0; j < nb; j++) {
            size_t k = i + j;
            uint64_t prod = av * (uint64_t)b->limbs[j] + (uint64_t)res->limbs[k] + carry;
            res->limbs[k] = (uint32_t)prod;
            carry = prod >> 32;
        }
        res->limbs[i + nb] = (uint32_t)carry;
    }
    res->n_limbs = na + nb;
    bigint_trim(res);
    return 0;
}

/* ============================================================
 *  bit ops
 * ============================================================ */

int bigint_shl1(bigint *x) {
    if (!x) return -1;
    uint32_t carry = 0;
    for (size_t i = 0; i < x->n_limbs; i++) {
        uint64_t v = ((uint64_t)x->limbs[i] << 1) | (uint64_t)carry;
        x->limbs[i] = (uint32_t)v;
        carry = (uint32_t)(v >> 32);
    }
    if (carry) {
        if (x->n_limbs >= x->capacity) return -1;
        x->limbs[x->n_limbs++] = carry;
    }
    return 0;
}

int bigint_shr1(bigint *x) {
    if (!x) return -1;
    uint32_t carry = 0;
    for (size_t j = x->n_limbs; j > 0; j--) {
        size_t i = j - 1;
        uint32_t limb = x->limbs[i];
        uint32_t new_carry = limb << 31;
        x->limbs[i] = (limb >> 1) | carry;
        carry = new_carry;
    }
    bigint_trim(x);
    return 0;
}

/* ============================================================
 *  modulo
 * ============================================================ */

int bigint_mod(bigint *res, const bigint *a, const bigint *b, bigint *tmp) {
    if (!res || !a || !b || !tmp) return -1;
    if (bigint_is_zero(b)) return -1;
    if (res == tmp) return -1;
    if (tmp->capacity < res->capacity) return -1;
    if (bigint_copy(res, a) != 0) return -1;
    bigint_trim(res);
    if (bigint_copy(tmp, b) != 0) return -1;
    bigint_trim(tmp);
    if (bigint_cmp(res, tmp) < 0) return 0;
    size_t k = 0;
    while (bigint_cmp(tmp, res) <= 0) {
        if (bigint_shl1(tmp) != 0) return -1;
        k++;
    }
    if (bigint_shr1(tmp) != 0) return -1;
    if (k > 0) k--;
    while (1) {
        if (bigint_cmp(res, tmp) >= 0)
            if (bigint_sub(res, res, tmp) != 0) return -1;
        if (k == 0) break;
        k--;
        if (bigint_shr1(tmp) != 0) return -1;
    }
    bigint_trim(res);
    return 0;
}

/* ============================================================
 *  bit helpers (internal)
 * ============================================================ */

static int bigint_get_bit(const bigint *x, size_t bit) {
    size_t limb = bit / 32;
    size_t off  = bit % 32;
    if (limb >= x->n_limbs) return 0;
    return (x->limbs[limb] >> off) & 1;
}

static size_t bigint_msb(const bigint *x) {
    size_t i = x->n_limbs;
    while (i > 0 && x->limbs[i - 1] == 0) i--;
    if (i == 0) return 0;
    uint32_t limb = x->limbs[i - 1];
    int bit = 31;
    while (((limb >> bit) & 1) == 0) bit--;
    return (i - 1) * 32 + bit;
}

/* ============================================================
 *  mod_mul / mod_pow
 * ============================================================ */

int bigint_mod_mul(bigint *r,
            const bigint *a, const bigint *b, const bigint *p,
            bigint *tmp_mul, bigint *tmp_mod)
{
    if (!r || !a || !b || !p || !tmp_mul || !tmp_mod) return -1;
    if (bigint_mul(tmp_mul, a, b) != 0) return -1;
    if (bigint_mod(r, tmp_mul, p, tmp_mod) != 0) return -1;
    return 0;
}

int bigint_mod_pow(bigint *r,
            const bigint *a, const bigint *b, const bigint *p,
            bigint *tmp1, bigint *tmp2, bigint *tmp3)
{
    if (!r || !a || !b || !p) return -1;
    bigint_set_zero(r);
    r->limbs[0] = 1;
    size_t msb = bigint_msb(b);
    for (long i = (long)msb; i >= 0; i--) {
        if (bigint_mod_mul(tmp1, r, r, p, tmp2, tmp3) != 0) return -1;
        if (bigint_copy(r, tmp1) != 0) return -1;
        if (bigint_get_bit(b, i)) {
            if (bigint_mod_mul(tmp1, r, a, p, tmp2, tmp3) != 0) return -1;
            if (bigint_copy(r, tmp1) != 0) return -1;
        }
    }
    return 0;
}

/* ============================================================
 *  Montgomery reduction
 * ============================================================ */

int bigint_mont_reduction(bigint *r, bigint *x,
                          const bigint *p, uint32_t p_dash, size_t N)
{
    if (!r || !x || !p) return -1;
    if (x->capacity < 2*N + 1) return -1;
    if (r->capacity < N + 1)   return -1;

    while (x->n_limbs < 2*N + 1) x->limbs[x->n_limbs++] = 0;

    for (size_t i = 0; i < N; i++) {
        uint32_t m = (uint32_t)(((uint64_t)x->limbs[i] * (uint64_t)p_dash)
                                & 0xFFFFFFFFULL);
        uint64_t carry = 0;
        for (size_t j = 0; j < p->n_limbs; j++) {
            uint64_t prod = (uint64_t)m * (uint64_t)p->limbs[j]
                          + (uint64_t)x->limbs[i + j] + carry;
            x->limbs[i + j] = (uint32_t)prod;
            carry            = prod >> 32;
        }
        for (size_t j = i + p->n_limbs; carry; j++) {
            if (j >= x->capacity) return -1;
            uint64_t s  = (uint64_t)x->limbs[j] + carry;
            x->limbs[j] = (uint32_t)s;
            carry        = s >> 32;
        }
    }

    for (size_t i = 0; i <= N; i++) r->limbs[i] = x->limbs[N + i];
    r->n_limbs = N + 1;
    bigint_trim(r);

    if (bigint_cmp(r, p) >= 0)
        if (bigint_sub(r, r, p) != 0) return -1;

    return 0;
}

/* ============================================================
 *  Montgomery mod_pow — binary method
 * ============================================================ */

int bigint_mont_mod_pow(bigint *r,
                        const bigint *a, const bigint *b,
                        const bigint *p, const bigint *R_sq,
                        uint32_t p_dash, size_t N,
                        bigint *tmp1, bigint *tmp2, bigint *tmp3)
{
    if (!r || !a || !b || !p || !R_sq || !tmp1 || !tmp2 || !tmp3)
        return -1;

    if (bigint_mul(tmp1, a, R_sq) != 0) return -1;
    if (bigint_mont_reduction(tmp2, tmp1, p, p_dash, N) != 0) return -1;

    if (bigint_copy(tmp1, R_sq) != 0) return -1;
    if (bigint_mont_reduction(tmp3, tmp1, p, p_dash, N) != 0) return -1;

    size_t msb = bigint_msb(b);

    for (long i = (long)msb; i >= 0; i--) {
        if (bigint_mul(tmp1, tmp3, tmp3) != 0) return -1;
        if (bigint_mont_reduction(tmp3, tmp1, p, p_dash, N) != 0) return -1;

        if (bigint_get_bit(b, (size_t)i)) {
            if (bigint_mul(tmp1, tmp3, tmp2) != 0) return -1;
            if (bigint_mont_reduction(tmp3, tmp1, p, p_dash, N) != 0) return -1;
        }
    }

    if (bigint_copy(tmp1, tmp3) != 0) return -1;
    if (bigint_mont_reduction(r, tmp1, p, p_dash, N) != 0) return -1;

    return 0;
}

/* ============================================================
 *  Montgomery mod_pow — sliding window (k=4)
 * ============================================================ */

#define WINDOW_K          4
#define WINDOW_TABLE_SIZE (1 << (WINDOW_K - 1))   /* 8 */

int bigint_mont_mod_pow_window(bigint *r,
                               const bigint *a, const bigint *b,
                               const bigint *p, const bigint *R_sq,
                               uint32_t p_dash, size_t N,
                               bigint *tmp1, bigint *tmp2, bigint *tmp3)
{
    if (!r || !a || !b || !p || !R_sq || !tmp1 || !tmp2 || !tmp3)
        return -1;

    bigint *table[WINDOW_TABLE_SIZE];
    int table_allocated = 0;

    for (int t = 0; t < WINDOW_TABLE_SIZE; t++) {
        table[t] = bigint_alloc(N + 1);
        if (!table[t]) goto fail;
        table_allocated = t + 1;
    }

    bigint *a_sq = bigint_alloc(N + 1);
    if (!a_sq) goto fail;

    if (bigint_mul(tmp1, a, R_sq) != 0) { bigint_free(a_sq); goto fail; }
    if (bigint_mont_reduction(table[0], tmp1, p, p_dash, N) != 0) { bigint_free(a_sq); goto fail; }

    if (bigint_mul(tmp1, table[0], table[0]) != 0) { bigint_free(a_sq); goto fail; }
    if (bigint_mont_reduction(a_sq, tmp1, p, p_dash, N) != 0) { bigint_free(a_sq); goto fail; }

    for (int t = 1; t < WINDOW_TABLE_SIZE; t++) {
        if (bigint_mul(tmp1, table[t-1], a_sq) != 0) { bigint_free(a_sq); goto fail; }
        if (bigint_mont_reduction(table[t], tmp1, p, p_dash, N) != 0) { bigint_free(a_sq); goto fail; }
    }

    bigint_free(a_sq);

    if (bigint_copy(tmp1, R_sq) != 0) goto fail;
    if (bigint_mont_reduction(tmp3, tmp1, p, p_dash, N) != 0) goto fail;

    long i = (long)bigint_msb(b);

    while (i >= 0) {
        if (!bigint_get_bit(b, (size_t)i)) {
            if (bigint_mul(tmp1, tmp3, tmp3) != 0) goto fail;
            if (bigint_mont_reduction(tmp3, tmp1, p, p_dash, N) != 0) goto fail;
            i--;
        } else {
            long s = i - WINDOW_K + 1;
            if (s < 0) s = 0;
            while (!bigint_get_bit(b, (size_t)s)) s++;

            int wlen = (int)(i - s + 1);
            uint32_t wval = 0;
            for (long bit = i; bit >= s; bit--)
                wval = (wval << 1) | (uint32_t)bigint_get_bit(b, (size_t)bit);

            for (int j = 0; j < wlen; j++) {
                if (bigint_mul(tmp1, tmp3, tmp3) != 0) goto fail;
                if (bigint_mont_reduction(tmp3, tmp1, p, p_dash, N) != 0) goto fail;
            }

            int tidx = (int)((wval - 1) / 2);
            if (bigint_mul(tmp1, tmp3, table[tidx]) != 0) goto fail;
            if (bigint_mont_reduction(tmp3, tmp1, p, p_dash, N) != 0) goto fail;

            i = s - 1;
        }
    }

    if (bigint_copy(tmp1, tmp3) != 0) goto fail;
    if (bigint_mont_reduction(r, tmp1, p, p_dash, N) != 0) goto fail;

    for (int t = 0; t < WINDOW_TABLE_SIZE; t++) bigint_free(table[t]);
    return 0;

fail:
    for (int t = 0; t < table_allocated; t++) bigint_free(table[t]);
    return -1;
}

/* ============================================================
 *  Karatsuba helper: accumulate src shifted left by (shift*32) bits into dst
 *
 *  dst must have capacity >= src->n_limbs + shift + 1
 *  All limbs in dst beyond n_limbs must be pre-zeroed (guaranteed
 *  by bigint_alloc and the memset at the start of bigint_karatsuba_mul)
 * ============================================================ */
static int bigint_accum_shifted(bigint *dst, const bigint *src, size_t shift)
{
    if (!dst || !src) return -1;
    if (bigint_is_zero(src)) return 0;
    if (dst->capacity < src->n_limbs + shift + 1) return -1;

    uint64_t carry = 0;
    for (size_t i = 0; i < src->n_limbs || carry; i++) {
        size_t pos = i + shift;
        if (pos >= dst->capacity) return -1;

        /* extend logical length — underlying limbs are pre-zeroed */
        if (pos >= dst->n_limbs) dst->n_limbs = pos + 1;

        uint64_t sv  = (i < src->n_limbs) ? (uint64_t)src->limbs[i] : 0;
        uint64_t sum = (uint64_t)dst->limbs[pos] + sv + carry;
        dst->limbs[pos] = (uint32_t)sum;
        carry            = sum >> 32;
    }
    return 0;
}

/* ============================================================
 *  Karatsuba multiplication
 *
 *  For inputs < KARATSUBA_THRESHOLD limbs, falls back to schoolbook.
 *  Otherwise splits each input at 'half' limbs and recurses:
 *
 *    a = a_hi * B^half + a_lo
 *    b = b_hi * B^half + b_lo
 *
 *    z0 = a_lo * b_lo
 *    z2 = a_hi * b_hi
 *    z1 = (a_lo+a_hi)*(b_lo+b_hi) - z0 - z2   [= a_lo*b_hi + a_hi*b_lo]
 *
 *    result = z0 + z1*B^half + z2*B^(2*half)
 *
 *  For 64-limb inputs with threshold=16 this recurses 2 levels,
 *  reducing multiply-accumulate ops from 64^2=4096 to ~9*16^2=2304 (~44% savings).
 * ============================================================ */
#define KARATSUBA_THRESHOLD 16

int bigint_karatsuba_mul(bigint *res, const bigint *a, const bigint *b)
{
    if (!res || !a || !b) return -1;
    if (res == a || res == b) return -1;

    size_t na = a->n_limbs;
    size_t nb = b->n_limbs;

    /* fall back to schoolbook for small inputs */
    if (na < KARATSUBA_THRESHOLD || nb < KARATSUBA_THRESHOLD)
        return bigint_mul(res, a, b);

    if (res->capacity < na + nb) return -1;

    size_t half = ((na > nb) ? na : nb) / 2;

    size_t a_lo_n = (na <= half) ? na : half;
    size_t a_hi_n = (na >  half) ? (na - half) : 0;
    size_t b_lo_n = (nb <= half) ? nb : half;
    size_t b_hi_n = (nb >  half) ? (nb - half) : 0;

    bigint *a_lo  = bigint_alloc(half + 1);
    bigint *a_hi  = bigint_alloc((a_hi_n ? a_hi_n : 1) + 1);
    bigint *b_lo  = bigint_alloc(half + 1);
    bigint *b_hi  = bigint_alloc((b_hi_n ? b_hi_n : 1) + 1);
    bigint *z0    = bigint_alloc(2 * half + 2);
    bigint *z2    = bigint_alloc((a_hi_n + b_hi_n + 2 >= 2) ? (a_hi_n + b_hi_n + 2) : 2);
    bigint *a_sum = bigint_alloc(half + 2);
    bigint *b_sum = bigint_alloc(half + 2);
    bigint *z1    = bigint_alloc(2 * (half + 1) + 2);

    int ret = -1;

    if (!a_lo || !a_hi || !b_lo || !b_hi || !z0 || !z2 || !a_sum || !b_sum || !z1)
        goto cleanup;

    /* fill a_lo: lower 'half' limbs of a */
    if (a_lo_n > 0) {
        memcpy(a_lo->limbs, a->limbs, a_lo_n * sizeof(uint32_t));
        a_lo->n_limbs = a_lo_n;
        bigint_trim(a_lo);
    }

    /* fill a_hi: upper limbs of a (zero if na <= half) */
    if (a_hi_n > 0) {
        memcpy(a_hi->limbs, a->limbs + half, a_hi_n * sizeof(uint32_t));
        a_hi->n_limbs = a_hi_n;
        bigint_trim(a_hi);
    }

    /* fill b_lo, b_hi similarly */
    if (b_lo_n > 0) {
        memcpy(b_lo->limbs, b->limbs, b_lo_n * sizeof(uint32_t));
        b_lo->n_limbs = b_lo_n;
        bigint_trim(b_lo);
    }
    if (b_hi_n > 0) {
        memcpy(b_hi->limbs, b->limbs + half, b_hi_n * sizeof(uint32_t));
        b_hi->n_limbs = b_hi_n;
        bigint_trim(b_hi);
    }

    /* z0 = a_lo * b_lo */
    if (bigint_karatsuba_mul(z0, a_lo, b_lo) != 0) goto cleanup;

    /* z2 = a_hi * b_hi */
    if (bigint_karatsuba_mul(z2, a_hi, b_hi) != 0) goto cleanup;

    /* a_sum = a_lo + a_hi,  b_sum = b_lo + b_hi */
    if (bigint_add(a_sum, a_lo, a_hi) != 0) goto cleanup;
    if (bigint_add(b_sum, b_lo, b_hi) != 0) goto cleanup;

    /* z1 = (a_lo+a_hi)*(b_lo+b_hi) - z0 - z2 */
    if (bigint_karatsuba_mul(z1, a_sum, b_sum) != 0) goto cleanup;
    if (bigint_sub(z1, z1, z0) != 0) goto cleanup;   /* always >= 0 */
    if (bigint_sub(z1, z1, z2) != 0) goto cleanup;   /* always >= 0 */

    /* res = z0 + z1*B^half + z2*B^(2*half) */
    memset(res->limbs, 0, res->capacity * sizeof(uint32_t));
    res->n_limbs = 1;

    if (bigint_accum_shifted(res, z0, 0)       != 0) goto cleanup;
    if (bigint_accum_shifted(res, z1, half)     != 0) goto cleanup;
    if (bigint_accum_shifted(res, z2, 2 * half) != 0) goto cleanup;

    bigint_trim(res);
    ret = 0;

cleanup:
    bigint_free(a_lo);  bigint_free(a_hi);
    bigint_free(b_lo);  bigint_free(b_hi);
    bigint_free(z0);    bigint_free(z2);
    bigint_free(a_sum); bigint_free(b_sum);
    bigint_free(z1);
    return ret;
}

/* ============================================================
 *  Montgomery mod_pow — binary method with Karatsuba multiply
 *  Identical to bigint_mont_mod_pow but uses bigint_karatsuba_mul
 *  instead of bigint_mul for the squaring/multiply steps.
 * ============================================================ */
int bigint_mont_mod_pow_karatsuba(bigint *r,
                                  const bigint *a, const bigint *b,
                                  const bigint *p, const bigint *R_sq,
                                  uint32_t p_dash, size_t N,
                                  bigint *tmp1, bigint *tmp2, bigint *tmp3)
{
    if (!r || !a || !b || !p || !R_sq || !tmp1 || !tmp2 || !tmp3)
        return -1;

    /* a_m = to_mont(a) */
    if (bigint_karatsuba_mul(tmp1, a, R_sq) != 0) return -1;
    if (bigint_mont_reduction(tmp2, tmp1, p, p_dash, N) != 0) return -1;

    /* acc = to_mont(1) */
    if (bigint_copy(tmp1, R_sq) != 0) return -1;
    if (bigint_mont_reduction(tmp3, tmp1, p, p_dash, N) != 0) return -1;

    size_t msb = bigint_msb(b);

    for (long i = (long)msb; i >= 0; i--) {
        /* square */
        if (bigint_karatsuba_mul(tmp1, tmp3, tmp3) != 0) return -1;
        if (bigint_mont_reduction(tmp3, tmp1, p, p_dash, N) != 0) return -1;

        /* multiply if bit set */
        if (bigint_get_bit(b, (size_t)i)) {
            if (bigint_karatsuba_mul(tmp1, tmp3, tmp2) != 0) return -1;
            if (bigint_mont_reduction(tmp3, tmp1, p, p_dash, N) != 0) return -1;
        }
    }

    /* convert back */
    if (bigint_copy(tmp1, tmp3) != 0) return -1;
    if (bigint_mont_reduction(r, tmp1, p, p_dash, N) != 0) return -1;

    return 0;
}
