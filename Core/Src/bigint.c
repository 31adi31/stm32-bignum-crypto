#include "bigint.h"
#include <string.h>
#include <stdlib.h>

/* ============================================================
 *  allocator configuration (STM32 friendly)
 * ============================================================ */
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

    // clear full dst to keep deterministic output (optional)
    memset(dst->limbs, 0, dst->capacity * sizeof(uint32_t));
    memcpy(dst->limbs, src->limbs, src->n_limbs * sizeof(uint32_t));
    dst->n_limbs = src->n_limbs;
    return 0;
}

void bigint_trim(bigint *x) {
    if (!x) return;
    while (x->n_limbs > 1 && x->limbs[x->n_limbs - 1] == 0) {
        x->n_limbs--;
    }
}

/* ============================================================
 *  helpers
 * ============================================================ */

int bigint_is_zero(const bigint *x) {
    if (!x) return 1;
    for (size_t i = 0; i < x->n_limbs; i++) {
        if (x->limbs[i] != 0) return 0;
    }
    return 1;
}

int bigint_cmp(const bigint *a, const bigint *b) {
    if (!a && !b) return 0;
    if (!a) return bigint_is_zero(b) ? 0 : -1;
    if (!b) return bigint_is_zero(a) ? 0 : +1;

    // work with trimmed logical sizes without mutating inputs
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
 *  conversion (NO ALLOCATION)
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

    // parse from end, 8 hex chars per 32-bit limb
    for (long i = (long)len - 1; i >= 0; i -= 8) {
        if (limb_idx >= out->capacity) return -1; // not enough room

        uint32_t acc = 0;
        long start = i - 7;
        if (start < 0) start = 0;

        for (long j = start; j <= i; j++) {
            int d = hexval(hex_str[j]);
            if (d < 0) continue; // skip non-hex chars
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
        if (output_size >= 2) {
            hex_output[0] = '0';
            hex_output[1] = '\0';
        } else {
            hex_output[0] = '\0';
        }
        return;
    }

    // find MS non-zero limb
    long ms = (long)x->n_limbs - 1;
    while (ms >= 0 && x->limbs[ms] == 0) ms--;

    if (ms < 0) {
        if (output_size >= 2) {
            hex_output[0] = '0';
            hex_output[1] = '\0';
        } else {
            hex_output[0] = '\0';
        }
        return;
    }

    size_t pos = 0;

    #define PUTCH(ch) do { \
        if (pos + 1 < output_size) { \
            hex_output[pos++] = (ch); \
        } \
    } while (0)

    // MS limb: skip leading zeros
    uint32_t limb = x->limbs[ms];
    int started = 0;
    for (int nib = 7; nib >= 0; nib--) {
        uint32_t v = (limb >> (nib * 4)) & 0xFu;
        if (!started && v == 0) continue;
        started = 1;
        PUTCH(hexdigits[v]);
    }

    // remaining limbs: always 8 hex chars
    for (long i = ms - 1; i >= 0; i--) {
        limb = x->limbs[i];
        for (int nib = 7; nib >= 0; nib--) {
            uint32_t v = (limb >> (nib * 4)) & 0xFu;
            PUTCH(hexdigits[v]);
        }
    }

    // null-terminate
    hex_output[(pos < output_size) ? pos : (output_size - 1)] = '\0';

    #undef PUTCH
}

/* ============================================================
 *  arithmetic (NO ALLOCATION)
 * ============================================================ */

int bigint_add(bigint *res, const bigint *a, const bigint *b) {
    if (!res || !a || !b) return -1;

    size_t na = a->n_limbs;
    size_t nb = b->n_limbs;
    size_t n  = (na > nb) ? na : nb;

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

    // Optional: clear any higher stale limbs (helps debugging determinism)
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

    // Disallow aliasing for mul unless you add a scratch buffer
    if (res == a || res == b) return -1;

    size_t na = a->n_limbs;
    size_t nb = b->n_limbs;

    if (res->capacity < na + nb) return -1;

    memset(res->limbs, 0, res->capacity * sizeof(uint32_t));

    for (size_t i = 0; i < na; i++) {
        uint64_t carry = 0;
        uint64_t av = (uint64_t)a->limbs[i];

        for (size_t j = 0; j < nb; j++) {
            size_t k = i + j;

            uint64_t cur  = (uint64_t)res->limbs[k];
            uint64_t prod = av * (uint64_t)b->limbs[j] + cur + carry;

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
 *  bit ops (IN-PLACE)
 * ============================================================ */

int bigint_shl1(bigint *x) {
    if (!x) return -1;

    uint32_t carry = 0;
    for (size_t i = 0; i < x->n_limbs; i++) {
        uint64_t v = ((uint64_t)x->limbs[i] << 1) | (uint64_t)carry;
        x->limbs[i] = (uint32_t)v;
        carry = (uint32_t)(v >> 32); // 0 or 1
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
 *  modulo (NO ALLOCATION)
 *  res = a mod b, using binary long-division style reduction
 * ============================================================ */

int bigint_mod(bigint *res, const bigint *a, const bigint *b, bigint *tmp) {
    if (!res || !a || !b || !tmp) return -1;
    if (bigint_is_zero(b)) return -1;
    if (res == tmp) return -1;

    // tmp must be able to grow as large as res during shifting
    if (tmp->capacity < res->capacity) return -1;

    // res = a (copy)
    if (bigint_copy(res, a) != 0) return -1;
    bigint_trim(res);

    // tmp = b (copy)
    if (bigint_copy(tmp, b) != 0) return -1;
    bigint_trim(tmp);

    if (bigint_cmp(res, tmp) < 0) {
        return 0; // already reduced
    }

    // Shift tmp left until tmp > res; count shifts
    size_t k = 0;
    while (bigint_cmp(tmp, res) <= 0) {
        if (bigint_shl1(tmp) != 0) return -1;
        k++;
    }

    // step back one shift: tmp >>= 1; k--
    if (bigint_shr1(tmp) != 0) return -1;
    if (k > 0) k--;

    while (1) {
        if (bigint_cmp(res, tmp) >= 0) {
            if (bigint_sub(res, res, tmp) != 0) return -1;
        }

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

static int bigint_get_bit(const bigint *x, size_t bit)
{
    size_t limb = bit / 32;
    size_t off  = bit % 32;

    if (limb >= x->n_limbs)
        return 0;

    return (x->limbs[limb] >> off) & 1;
}

static size_t bigint_msb(const bigint *x)
{
    size_t i = x->n_limbs;

    while (i > 0 && x->limbs[i - 1] == 0)
        i--;

    if (i == 0)
        return 0;

    uint32_t limb = x->limbs[i - 1];

    int bit = 31;
    while (((limb >> bit) & 1) == 0)
        bit--;

    return (i - 1) * 32 + bit;
}


/* ============================================================
 *  mod_mul
 * ============================================================ */

int bigint_mod_mul(bigint *r,
            const bigint *a,
            const bigint *b,
            const bigint *p,
            bigint *tmp_mul,
            bigint *tmp_mod)
{
    if (!r || !a || !b || !p || !tmp_mul || !tmp_mod)
        return -1;

    /* tmp_mul = a * b */
    if (bigint_mul(tmp_mul, a, b) != 0)
        return -1;

    /* r = tmp_mul % p */
    if (bigint_mod(r, tmp_mul, p, tmp_mod) != 0)
        return -1;

    return 0;
}


/* ============================================================
 *  mod_pow  (square-multiply MSB → LSB)
 * ============================================================ */

int bigint_mod_pow(bigint *r,
            const bigint *a,
            const bigint *b,
            const bigint *p,
            bigint *tmp1,
            bigint *tmp2,
            bigint *tmp3)
{
    if (!r || !a || !b || !p)
        return -1;

    /* r = 1 */
    bigint_set_zero(r);
    r->limbs[0] = 1;

    size_t msb = bigint_msb(b);

    for (long i = (long)msb; i >= 0; i--) {

        /* r = r*r % p */
        if (bigint_mod_mul(tmp1, r, r, p, tmp2, tmp3) != 0)
            return -1;

        if (bigint_copy(r, tmp1) != 0)
            return -1;

        /* if exponent bit = 1 */
        if (bigint_get_bit(b, i)) {

            if (bigint_mod_mul(tmp1, r, a, p, tmp2, tmp3) != 0)
                return -1;

            if (bigint_copy(r, tmp1) != 0)
                return -1;
        }
    }

    return 0;
}

