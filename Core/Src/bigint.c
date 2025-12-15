#include "bigint.h"
#include <string.h>
#include <stdio.h>

/* ============================================================
 *  allocator configuration (STM32 friendly)
 *  If you use FreeRTOS, consider swapping to pvPortMalloc/vPortFree.
 * ============================================================ */
#include <stdlib.h>

#ifndef BIGINT_MALLOC
#define BIGINT_MALLOC malloc
#endif

#ifndef BIGINT_FREE
#define BIGINT_FREE free
#endif

/* ============================================================
 *  internal helper
 * ============================================================ */
static bigint *bigint_clone(const bigint *x) {
    if (!x) return NULL;
    bigint *r = bigint_alloc(x->n_limbs);
    if (!r) return NULL;
    memcpy(r->limbs, x->limbs, x->n_limbs * sizeof(uint32_t));
    return r;
}

static int bigint_is_zero(const bigint *x) {
    if (!x) return 1;
    for (size_t i = 0; i < x->n_limbs; i++) {
        if (x->limbs[i] != 0) return 0;
    }
    return 1;
}

/* ============================================================
 *  Bigint type + allocator
 * ============================================================ */

bigint *bigint_alloc(size_t n_limbs) {
    if (n_limbs == 0) n_limbs = 1; // keep representation non-empty
    bigint *x = (bigint *)BIGINT_MALLOC(sizeof(bigint) + n_limbs * sizeof(uint32_t));
    if (!x) return NULL;
    x->n_limbs = n_limbs;
    memset(x->limbs, 0, n_limbs * sizeof(uint32_t));
    return x;
}

void bigint_free(bigint *x) {
    if (x) BIGINT_FREE(x);
}

/* Trims leading zero limbs by decreasing n_limbs.
 * This does NOT free memory or realloc; it just reduces "effective length".
 */
void bigint_trim(bigint *x) {
    if (!x) return;
    while (x->n_limbs > 1 && x->limbs[x->n_limbs - 1] == 0) {
        x->n_limbs--;
    }
}

/* ============================================================
 *  Hex <-> bigint
 * ============================================================ */

bigint *bigint_from_hex(const char *hex_str, size_t n_limbs) {
    if (!hex_str) return NULL;

    bigint *x = bigint_alloc(n_limbs);
    if (!x) return NULL;

    size_t len = strlen(hex_str);
    size_t limbIdx = 0;

    for (long i = (long)len - 1; i >= 0 && limbIdx < x->n_limbs; i -= 8) {
        uint32_t acc = 0;
        long start = i - 7;
        if (start < 0) start = 0;

        for (long j = start; j <= i; j++) {
            char c = hex_str[j];
            uint32_t d;

            if (c >= '0' && c <= '9')       d = (uint32_t)(c - '0');
            else if (c >= 'a' && c <= 'f')  d = 10u + (uint32_t)(c - 'a');
            else if (c >= 'A' && c <= 'F')  d = 10u + (uint32_t)(c - 'A');
            else continue; // skip non-hex chars

            acc = (acc << 4) | d;
        }

        x->limbs[limbIdx++] = acc;
    }

    bigint_trim(x);
    return x;
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

    // find most significant non-zero limb
    long ms = (long)x->n_limbs - 1;
    while (ms >= 0 && x->limbs[ms] == 0) ms--;

    if (ms < 0) {
        // should not happen due to bigint_is_zero, but safe
        if (output_size >= 2) {
            hex_output[0] = '0';
            hex_output[1] = '\0';
        } else {
            hex_output[0] = '\0';
        }
        return;
    }

    size_t pos = 0;

    // helper: write one char if room
    #define PUTCH(ch) do {                       \
        if (pos + 1 < output_size) {             \
            hex_output[pos++] = (ch);            \
        }                                        \
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

    // remaining limbs: always 8 hex chars each
    for (long i = ms - 1; i >= 0; i--) {
        limb = x->limbs[i];
        for (int nib = 7; nib >= 0; nib--) {
            uint32_t v = (limb >> (nib * 4)) & 0xFu;
            PUTCH(hexdigits[v]);
        }
    }

    // null-terminate (even if truncated)
    if (output_size > 0) {
        hex_output[(pos < output_size) ? pos : (output_size - 1)] = '\0';
    }

    #undef PUTCH
}

/* ============================================================
 *  Comparison
 * ============================================================ */

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
 *  Arithmetic
 * ============================================================ */

bigint *bigint_add(const bigint *a, const bigint *b) {
    if (!a || !b) return NULL;

    size_t na = a->n_limbs;
    size_t nb = b->n_limbs;
    size_t n  = (na > nb) ? na : nb;

    bigint *r = bigint_alloc(n + 1);
    if (!r) return NULL;

    uint64_t carry = 0;
    for (size_t i = 0; i < n; i++) {
        uint64_t av = (i < na) ? (uint64_t)a->limbs[i] : 0;
        uint64_t bv = (i < nb) ? (uint64_t)b->limbs[i] : 0;

        uint64_t sum = av + bv + carry;
        r->limbs[i] = (uint32_t)(sum & 0xFFFFFFFFu);
        carry       = sum >> 32;
    }
    r->limbs[n] = (uint32_t)carry;

    bigint_trim(r);
    return r;
}

/* unsigned subtraction: returns NULL if a < b */
bigint *bigint_sub(const bigint *a, const bigint *b) {
    if (!a || !b) return NULL;
    if (bigint_cmp(a, b) < 0) return NULL;

    size_t n = a->n_limbs;
    bigint *r = bigint_alloc(n);
    if (!r) return NULL;

    uint64_t borrow = 0;
    for (size_t i = 0; i < n; i++) {
        uint64_t av = (uint64_t)a->limbs[i];
        uint64_t bv = (i < b->n_limbs) ? (uint64_t)b->limbs[i] : 0;

        uint64_t needed = bv + borrow;
        uint64_t diff   = av - bv - borrow;

        borrow = (av < needed) ? 1 : 0;
        r->limbs[i] = (uint32_t)(diff & 0xFFFFFFFFu);
    }

    bigint_trim(r);
    return r;
}

bigint *bigint_mul(const bigint *a, const bigint *b) {
    if (!a || !b) return NULL;

    size_t na = a->n_limbs;
    size_t nb = b->n_limbs;

    bigint *r = bigint_alloc(na + nb);
    if (!r) return NULL;

    for (size_t i = 0; i < na; i++) {
        uint64_t av = (uint64_t)a->limbs[i];
        uint64_t carry = 0;

        for (size_t j = 0; j < nb; j++) {
            size_t k = i + j;

            uint64_t bv   = (uint64_t)b->limbs[j];
            uint64_t cur  = (uint64_t)r->limbs[k];
            uint64_t prod = av * bv + cur + carry;

            r->limbs[k] = (uint32_t)(prod & 0xFFFFFFFFu);
            carry       = prod >> 32;
        }

        r->limbs[i + nb] = (uint32_t)carry;
    }

    bigint_trim(r);
    return r;
}

/* ============================================================
 *  Bit shifts by 1
 * ============================================================ */

bigint *bigint_shl1(const bigint *a) {
    if (!a) return NULL;

    size_t n = a->n_limbs;
    bigint *r = bigint_alloc(n + 1);
    if (!r) return NULL;

    uint32_t carry = 0;
    for (size_t i = 0; i < n; i++) {
        uint64_t v = ((uint64_t)a->limbs[i] << 1) | carry;
        r->limbs[i] = (uint32_t)(v & 0xFFFFFFFFu);
        carry       = (uint32_t)(v >> 32); // 0 or 1
    }
    r->limbs[n] = carry;

    bigint_trim(r);
    return r;
}

bigint *bigint_shr1(const bigint *a) {
    if (!a) return NULL;

    size_t n = a->n_limbs;
    bigint *r = bigint_alloc(n);
    if (!r) return NULL;

    uint32_t carry = 0;
    for (size_t j = n; j > 0; j--) {
        size_t i = j - 1;
        uint32_t limb = a->limbs[i];
        r->limbs[i] = (limb >> 1) | carry;
        carry = limb << 31;
    }

    bigint_trim(r);
    return r;
}

/* ============================================================
 *  Modulo (binary long-division style reduction)
 * ============================================================ */

bigint *bigint_mod(const bigint *a, const bigint *b) {
    if (!a || !b) return NULL;
    if (bigint_is_zero(b)) return NULL;

    bigint *rem = bigint_clone(a);
    bigint *t   = bigint_clone(b);
    if (!rem || !t) {
        bigint_free(rem);
        bigint_free(t);
        return NULL;
    }

    bigint_trim(rem);
    bigint_trim(t);

    if (bigint_cmp(rem, t) < 0) {
        bigint_free(t);
        return rem;
    }

    size_t k = 0;
    while (bigint_cmp(t, rem) <= 0) {
        bigint *t2 = bigint_shl1(t);
        bigint_free(t);
        t = t2;
        if (!t) { bigint_free(rem); return NULL; }
        k++;
    }

    // step back one
    bigint *t2 = bigint_shr1(t);
    bigint_free(t);
    t = t2;
    if (!t) { bigint_free(rem); return NULL; }
    if (k > 0) k--;

    while (1) {
        if (bigint_cmp(rem, t) >= 0) {
            bigint *tmp = bigint_sub(rem, t);
            if (!tmp) { bigint_free(rem); bigint_free(t); return NULL; }
            bigint_free(rem);
            rem = tmp;
            bigint_trim(rem);
        }

        if (k == 0) break;
        k--;

        bigint *t3 = bigint_shr1(t);
        bigint_free(t);
        t = t3;
        if (!t) { bigint_free(rem); return NULL; }
    }

    bigint_free(t);
    bigint_trim(rem);
    return rem;
}
