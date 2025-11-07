#include <stdio.h>
#include <stdint.h>
#include <string.h>

// ---------------------------------------------------------
// Manual prototypes (from your bigint.c)
// ---------------------------------------------------------
void hex_to_bigint(int32_t *limbds, const char *hex_str, size_t n_limbds);
void bigint_add(const int32_t *a, const int32_t *b, size_t n_limbs, int32_t *res);
void bigint_sub(const int32_t *a, const int32_t *b, size_t n_limbs, int32_t *res);
void bigint_mul(const int32_t *a, const int32_t *b, size_t n_limbs, int32_t *res);
void bigint_mul_mod_2k(const int32_t *a, const int32_t *b, size_t n_limbs, int32_t *res);
void bigint_to_hex(int32_t *limbs, size_t n_limbs, char *hex_output, size_t output_size);

// ---------------------------------------------------------
// Helper: compare expected vs actual and print results
// ---------------------------------------------------------
int assert_equal_hex(const char *test_name, const char *expected, const char *actual) {
    if (strcmp(expected, actual) == 0) {
        printf("[PASS] %s\n", test_name);
        printf("       Expected: %s\n", expected);
        printf("       Actual:   %s\n\n", actual);
        return 1;
    } else {
        printf("[FAIL] %s\n", test_name);
        printf("       Expected: %s\n", expected);
        printf("       Actual:   %s\n\n", actual);
        return 0;
    }
}

// ---------------------------------------------------------
// Individual test cases
// ---------------------------------------------------------
void test_hex_roundtrip() {
    const char *hex = "30644e72e131a029b85045b68181585d97816a916871ca8d3c208c16d87cfd47";
    int32_t limbs[8];
    char output[100];

    hex_to_bigint(limbs, hex, 8);
    bigint_to_hex(limbs, 8, output, sizeof(output));

    assert_equal_hex("hex_to_bigint ↔ bigint_to_hex roundtrip", hex, output);
}

void test_bigint_add_same() {
    const char *hex =
        "30644e72e131a029b85045b68181585d97816a916871ca8d3c208c16d87cfd47";
    int32_t a[8], b[8], result[9];
    char output[100];

    hex_to_bigint(a, hex, 8);
    hex_to_bigint(b, hex, 8);
    bigint_add(a, b, 8, result);
    bigint_to_hex(result, 9, output, sizeof(output));

    const char *expected =
        "60c89ce5c263405370a08b6d0302b0bb2f02d522d0e3951a7841182db0f9fa8e";
    assert_equal_hex("bigint_add (p + p)", expected, output);
}

void test_bigint_sub_zero() {
    const char *hex =
        "30644e72e131a029b85045b68181585d97816a916871ca8d3c208c16d87cfd47";
    int32_t a[8], b[8], result[8];
    char output[100];

    hex_to_bigint(a, hex, 8);
    hex_to_bigint(b, hex, 8);
    bigint_sub(a, b, 8, result);
    bigint_to_hex(result, 8, output, sizeof(output));

    assert_equal_hex("bigint_sub (p - p)", "0", output);
}

void test_bigint_mul_same() {
    const char *hex =
        "30644e72e131a029b85045b68181585d97816a916871ca8d3c208c16d87cfd47";
    int32_t a[8], b[8], result[16];
    char output[200];

    hex_to_bigint(a, hex, 8);
    hex_to_bigint(b, hex, 8);
    bigint_mul(a, b, 8, result);
    bigint_to_hex(result, 16, output, sizeof(output));

    const char *expected =
        "925c4b8763cbf9c599a6f7c0348d21cb00b85511637560626edfa5c34c6b38d0"
        "4689e957a1242c84a50189c6d96cadca602072d09eac1013b5458a2275d69b1";
    assert_equal_hex("bigint_mul (p * p)", expected, output);
}

void test_bigint_mul_mod_2k_same() {
    const char *hex =
        "30644e72e131a029b85045b68181585d97816a916871ca8d3c208c16d87cfd47";
    int32_t a[8], b[8], result[8];
    char output[100];

    hex_to_bigint(a, hex, 8);
    hex_to_bigint(b, hex, 8);
    bigint_mul_mod_2k(a, b, 8, result);
    bigint_to_hex(result, 8, output, sizeof(output));

    const char *expected =
        "4689e957a1242c84a50189c6d96cadca602072d09eac1013b5458a2275d69b1";
    assert_equal_hex("bigint_mul_mod_2k (p^2 mod 2^256)", expected, output);
}

// ---------------------------------------------------------
// Test runner
// ---------------------------------------------------------
int main(void) {
    printf("Running BigInt unit tests...\n\n");

    test_hex_roundtrip();
    test_bigint_add_same();
    test_bigint_sub_zero();
    test_bigint_mul_same();
    test_bigint_mul_mod_2k_same();

    printf("✅ All bigint tests completed.\n");
    return 0;
}
