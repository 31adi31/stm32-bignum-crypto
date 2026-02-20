	.cpu cortex-m4
	.arch armv7e-m
	.fpu fpv4-sp-d16
	.eabi_attribute 27, 1	@ Tag_ABI_HardFP_use
	.eabi_attribute 28, 1	@ Tag_ABI_VFP_args
	.eabi_attribute 20, 1	@ Tag_ABI_FP_denormal
	.eabi_attribute 21, 1	@ Tag_ABI_FP_exceptions
	.eabi_attribute 23, 3	@ Tag_ABI_FP_number_model
	.eabi_attribute 24, 1	@ Tag_ABI_align8_needed
	.eabi_attribute 25, 1	@ Tag_ABI_align8_preserved
	.eabi_attribute 26, 1	@ Tag_ABI_enum_size
	.eabi_attribute 30, 2	@ Tag_ABI_optimization_goals
	.eabi_attribute 34, 1	@ Tag_CPU_unaligned_access
	.eabi_attribute 18, 4	@ Tag_ABI_PCS_wchar_t
	.file	"bigint.c"
@ GNU C11 (GNU Tools for STM32 13.3.rel1.20240926-1715) version 13.3.1 20240614 (arm-none-eabi)
@	compiled by GNU C version 4.2.1 Compatible Apple LLVM 10.0.1 (clang-1001.0.46.4), GMP version 6.2.1, MPFR version 3.1.6, MPC version 1.0.3, isl version isl-0.15-1-g835ea3a-GMP

@ GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
@ options passed: -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -march=armv7e-m+fp -g3 -O2 -std=gnu11 -ffunction-sections -fdata-sections -fstack-usage -fcyclomatic-complexity
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 1 "../Core/Src/bigint.c"
	.section	.text.bigint_alloc,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	bigint_alloc
	.syntax unified
	.thumb
	.thumb_func
	.type	bigint_alloc, %function
bigint_alloc:
.LVL0:
.LFB0:
	.loc 1 20 45 view -0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 1 21 5 view .LVU1
	cmp	r0, #1	@ tmp132,
	it	cc
	movcc	r0, #1	@ tmp132,
.LVL1:
@ ../Core/Src/bigint.c:20: bigint *bigint_alloc(size_t capacity_limbs) {
	.loc 1 20 45 is_stmt 0 view .LVU2
	push	{r4, r5, r6, lr}	@
	.cfi_def_cfa_offset 16
	.cfi_offset 4, -16
	.cfi_offset 5, -12
	.cfi_offset 6, -8
	.cfi_offset 14, -4
@ ../Core/Src/bigint.c:23:     bigint *x = (bigint *)BIGINT_MALLOC(sizeof(bigint) + capacity_limbs * sizeof(uint32_t));
	.loc 1 23 49 view .LVU3
	adds	r5, r0, #2	@ tmp121, _5,
@ ../Core/Src/bigint.c:23:     bigint *x = (bigint *)BIGINT_MALLOC(sizeof(bigint) + capacity_limbs * sizeof(uint32_t));
	.loc 1 23 27 view .LVU4
	lsls	r5, r5, #2	@ _2, tmp121,
	mov	r6, r0	@ _5, tmp132
.LVL2:
	.loc 1 23 5 is_stmt 1 view .LVU5
@ ../Core/Src/bigint.c:23:     bigint *x = (bigint *)BIGINT_MALLOC(sizeof(bigint) + capacity_limbs * sizeof(uint32_t));
	.loc 1 23 27 is_stmt 0 view .LVU6
	mov	r0, r5	@, _2
.LVL3:
	.loc 1 23 27 view .LVU7
	bl	malloc		@
.LVL4:
	.loc 1 24 5 is_stmt 1 view .LVU8
@ ../Core/Src/bigint.c:24:     if (!x) return NULL;
	.loc 1 24 8 is_stmt 0 view .LVU9
	mov	r4, r0	@ <retval>, tmp133
	cbz	r0, .L1	@ <retval>,
	.loc 1 26 5 is_stmt 1 view .LVU10
@ ../Core/Src/bigint.c:27:     x->n_limbs  = 1;
	.loc 1 27 16 is_stmt 0 view .LVU11
	movs	r3, #1	@ tmp123,
@ ../Core/Src/bigint.c:26:     x->capacity = capacity_limbs;
	.loc 1 26 17 view .LVU12
	str	r6, [r0, #4]	@ _5, x_10->capacity
	.loc 1 27 5 is_stmt 1 view .LVU13
@ ../Core/Src/bigint.c:28:     memset(x->limbs, 0, capacity_limbs * sizeof(uint32_t));
	.loc 1 28 5 is_stmt 0 view .LVU14
	sub	r2, r5, #8	@, _2,
@ ../Core/Src/bigint.c:27:     x->n_limbs  = 1;
	.loc 1 27 16 view .LVU15
	str	r3, [r0], #8	@ tmp123, x_10->n_limbs
.LVL5:
	.loc 1 28 5 is_stmt 1 view .LVU16
	movs	r1, #0	@,
	bl	memset		@
.LVL6:
	.loc 1 29 5 view .LVU17
.L1:
@ ../Core/Src/bigint.c:30: }
	.loc 1 30 1 is_stmt 0 view .LVU18
	mov	r0, r4	@, <retval>
	pop	{r4, r5, r6, pc}	@
	.loc 1 30 1 view .LVU19
	.cfi_endproc
.LFE0:
	.size	bigint_alloc, .-bigint_alloc
	.section	.text.bigint_free,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	bigint_free
	.syntax unified
	.thumb
	.thumb_func
	.type	bigint_free, %function
bigint_free:
.LVL7:
.LFB1:
	.loc 1 32 29 is_stmt 1 view -0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 33 5 view .LVU21
@ ../Core/Src/bigint.c:33:     if (x) BIGINT_FREE(x);
	.loc 1 33 8 is_stmt 0 view .LVU22
	cbz	r0, .L8	@ tmp115,
	.loc 1 33 12 is_stmt 1 discriminator 1 view .LVU23
	b	free		@
.LVL8:
.L8:
@ ../Core/Src/bigint.c:34: }
	.loc 1 34 1 is_stmt 0 view .LVU24
	bx	lr	@
	.cfi_endproc
.LFE1:
	.size	bigint_free, .-bigint_free
	.section	.text.bigint_set_zero,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	bigint_set_zero
	.syntax unified
	.thumb
	.thumb_func
	.type	bigint_set_zero, %function
bigint_set_zero:
.LVL9:
.LFB2:
	.loc 1 36 33 is_stmt 1 view -0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 1 37 5 view .LVU26
@ ../Core/Src/bigint.c:37:     if (!x) return;
	.loc 1 37 8 is_stmt 0 view .LVU27
	cbz	r0, .L16	@ x,
.LVL10:
.LBB61:
.LBI61:
	.loc 1 36 6 is_stmt 1 view .LVU28
.LBB62:
	.loc 1 38 5 view .LVU29
.LBE62:
.LBE61:
@ ../Core/Src/bigint.c:36: void bigint_set_zero(bigint *x) {
	.loc 1 36 33 is_stmt 0 view .LVU30
	push	{r4, lr}	@
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 14, -4
.LBB64:
.LBB63:
@ ../Core/Src/bigint.c:38:     memset(x->limbs, 0, x->capacity * sizeof(uint32_t));
	.loc 1 38 5 view .LVU31
	ldr	r2, [r0, #4]	@ x_1(D)->capacity, x_1(D)->capacity
	mov	r4, r0	@ x, tmp127
	movs	r1, #0	@,
	lsls	r2, r2, #2	@, x_1(D)->capacity,
	adds	r0, r0, #8	@, x,
.LVL11:
	.loc 1 38 5 view .LVU32
	bl	memset		@
.LVL12:
	.loc 1 39 5 is_stmt 1 view .LVU33
@ ../Core/Src/bigint.c:39:     x->n_limbs = 1;
	.loc 1 39 16 is_stmt 0 view .LVU34
	movs	r3, #1	@ tmp126,
	str	r3, [r4]	@ tmp126, x_1(D)->n_limbs
.LVL13:
	.loc 1 39 16 view .LVU35
.LBE63:
.LBE64:
@ ../Core/Src/bigint.c:40: }
	.loc 1 40 1 view .LVU36
	pop	{r4, pc}	@
.LVL14:
.L16:
	.cfi_def_cfa_offset 0
	.cfi_restore 4
	.cfi_restore 14
	.loc 1 40 1 view .LVU37
	bx	lr	@
	.cfi_endproc
.LFE2:
	.size	bigint_set_zero, .-bigint_set_zero
	.section	.text.bigint_copy,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	bigint_copy
	.syntax unified
	.thumb
	.thumb_func
	.type	bigint_copy, %function
bigint_copy:
.LVL15:
.LFB3:
	.loc 1 42 49 is_stmt 1 view -0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 1 43 5 view .LVU39
@ ../Core/Src/bigint.c:43:     if (!dst || !src) return -1;
	.loc 1 43 8 is_stmt 0 view .LVU40
	cbz	r0, .L21	@ dst,
@ ../Core/Src/bigint.c:42: int bigint_copy(bigint *dst, const bigint *src) {
	.loc 1 42 49 view .LVU41
	push	{r3, r4, r5, lr}	@
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.cfi_offset 4, -12
	.cfi_offset 5, -8
	.cfi_offset 14, -4
	mov	r5, r1	@ src, tmp140
@ ../Core/Src/bigint.c:43:     if (!dst || !src) return -1;
	.loc 1 43 14 discriminator 2 view .LVU42
	cbz	r1, .L23	@ src,
@ ../Core/Src/bigint.c:44:     if (dst->capacity < src->n_limbs) return -1;
	.loc 1 44 12 view .LVU43
	ldr	r2, [r0, #4]	@ _1, dst_11(D)->capacity
@ ../Core/Src/bigint.c:44:     if (dst->capacity < src->n_limbs) return -1;
	.loc 1 44 8 view .LVU44
	ldr	r3, [r1]	@ src_12(D)->n_limbs, src_12(D)->n_limbs
	cmp	r2, r3	@ _1, src_12(D)->n_limbs
	mov	r4, r0	@ dst, tmp139
	.loc 1 44 5 is_stmt 1 view .LVU45
@ ../Core/Src/bigint.c:44:     if (dst->capacity < src->n_limbs) return -1;
	.loc 1 44 8 is_stmt 0 view .LVU46
	bcc	.L23		@,
	.loc 1 47 5 is_stmt 1 view .LVU47
@ ../Core/Src/bigint.c:47:     memset(dst->limbs, 0, dst->capacity * sizeof(uint32_t));
	.loc 1 47 15 is_stmt 0 view .LVU48
	add	r3, r0, #8	@ _3, dst,
@ ../Core/Src/bigint.c:47:     memset(dst->limbs, 0, dst->capacity * sizeof(uint32_t));
	.loc 1 47 5 view .LVU49
	mov	r0, r3	@, _3
.LVL16:
	.loc 1 47 5 view .LVU50
	lsls	r2, r2, #2	@, _1,
	movs	r1, #0	@,
.LVL17:
	.loc 1 47 5 view .LVU51
	bl	memset		@
.LVL18:
	.loc 1 48 5 is_stmt 1 view .LVU52
	mov	r1, r5	@ tmp133, src
	ldr	r2, [r1], #8	@ src_12(D)->n_limbs, src_12(D)->n_limbs
	lsls	r2, r2, #2	@, src_12(D)->n_limbs,
	bl	memcpy		@
.LVL19:
	.loc 1 49 5 view .LVU53
@ ../Core/Src/bigint.c:49:     dst->n_limbs = src->n_limbs;
	.loc 1 49 23 is_stmt 0 view .LVU54
	ldr	r3, [r5]	@ _8, src_12(D)->n_limbs
@ ../Core/Src/bigint.c:49:     dst->n_limbs = src->n_limbs;
	.loc 1 49 18 view .LVU55
	str	r3, [r4]	@ _8, dst_11(D)->n_limbs
	.loc 1 50 5 is_stmt 1 view .LVU56
@ ../Core/Src/bigint.c:50:     return 0;
	.loc 1 50 12 is_stmt 0 view .LVU57
	movs	r0, #0	@ <retval>,
@ ../Core/Src/bigint.c:51: }
	.loc 1 51 1 view .LVU58
	pop	{r3, r4, r5, pc}	@
.LVL20:
.L23:
@ ../Core/Src/bigint.c:43:     if (!dst || !src) return -1;
	.loc 1 43 30 discriminator 3 view .LVU59
	mov	r0, #-1	@ <retval>,
.LVL21:
@ ../Core/Src/bigint.c:51: }
	.loc 1 51 1 view .LVU60
	pop	{r3, r4, r5, pc}	@
.LVL22:
.L21:
	.cfi_def_cfa_offset 0
	.cfi_restore 3
	.cfi_restore 4
	.cfi_restore 5
	.cfi_restore 14
@ ../Core/Src/bigint.c:43:     if (!dst || !src) return -1;
	.loc 1 43 30 discriminator 3 view .LVU61
	mov	r0, #-1	@ <retval>,
.LVL23:
@ ../Core/Src/bigint.c:51: }
	.loc 1 51 1 view .LVU62
	bx	lr	@
	.cfi_endproc
.LFE3:
	.size	bigint_copy, .-bigint_copy
	.section	.text.bigint_trim,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	bigint_trim
	.syntax unified
	.thumb
	.thumb_func
	.type	bigint_trim, %function
bigint_trim:
.LVL24:
.LFB4:
	.loc 1 53 29 is_stmt 1 view -0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 54 5 view .LVU64
@ ../Core/Src/bigint.c:54:     if (!x) return;
	.loc 1 54 8 is_stmt 0 view .LVU65
	cbz	r0, .L28	@ x,
.LBB67:
.LBB68:
	.loc 1 55 27 is_stmt 1 view .LVU66
@ ../Core/Src/bigint.c:55:     while (x->n_limbs > 1 && x->limbs[x->n_limbs - 1] == 0) {
	.loc 1 55 13 is_stmt 0 view .LVU67
	ldr	r3, [r0]	@ _1, x_4(D)->n_limbs
@ ../Core/Src/bigint.c:55:     while (x->n_limbs > 1 && x->limbs[x->n_limbs - 1] == 0) {
	.loc 1 55 27 view .LVU68
	cmp	r3, #1	@ _1,
	bls	.L28		@,
	adds	r2, r3, #2	@ tmp123, _1,
	add	r2, r0, r2, lsl #2	@ ivtmp.51, x, tmp123,
	subs	r3, r3, #1	@ ivtmp.45, _1,
	b	.L31		@
.L32:
@ ../Core/Src/bigint.c:56:         x->n_limbs--;
	.loc 1 56 19 view .LVU69
	str	r3, [r0]	@ ivtmp.45, x_4(D)->n_limbs
	.loc 1 55 27 is_stmt 1 view .LVU70
	subs	r3, r3, #1	@ ivtmp.45, ivtmp.45,
	beq	.L28		@,
.L31:
	.loc 1 56 9 view .LVU71
@ ../Core/Src/bigint.c:55:     while (x->n_limbs > 1 && x->limbs[x->n_limbs - 1] == 0) {
	.loc 1 55 27 is_stmt 0 discriminator 1 view .LVU72
	ldr	r1, [r2, #-4]!	@ MEM[(long unsigned int *)_19], MEM[(long unsigned int *)_19]
	cmp	r1, #0	@ MEM[(long unsigned int *)_19]
	beq	.L32	@
.L28:
.LBE68:
.LBE67:
@ ../Core/Src/bigint.c:58: }
	.loc 1 58 1 view .LVU73
	bx	lr	@
	.cfi_endproc
.LFE4:
	.size	bigint_trim, .-bigint_trim
	.section	.text.bigint_is_zero,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	bigint_is_zero
	.syntax unified
	.thumb
	.thumb_func
	.type	bigint_is_zero, %function
bigint_is_zero:
.LVL25:
.LFB5:
	.loc 1 64 37 is_stmt 1 view -0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 65 5 view .LVU75
@ ../Core/Src/bigint.c:65:     if (!x) return 1;
	.loc 1 65 8 is_stmt 0 view .LVU76
	cbz	r0, .L41	@ x,
.LVL26:
.LBB73:
.LBB74:
	.loc 1 66 26 is_stmt 1 discriminator 1 view .LVU77
@ ../Core/Src/bigint.c:66:     for (size_t i = 0; i < x->n_limbs; i++) {
	.loc 1 66 29 is_stmt 0 discriminator 1 view .LVU78
	ldr	r1, [r0]	@ _11, x_3(D)->n_limbs
@ ../Core/Src/bigint.c:66:     for (size_t i = 0; i < x->n_limbs; i++) {
	.loc 1 66 26 discriminator 1 view .LVU79
	cbz	r1, .L41	@ _11,
	adds	r0, r0, #4	@ ivtmp.62, x,
.LVL27:
@ ../Core/Src/bigint.c:66:     for (size_t i = 0; i < x->n_limbs; i++) {
	.loc 1 66 17 view .LVU80
	movs	r3, #0	@ i,
	b	.L39		@
.LVL28:
.L44:
@ ../Core/Src/bigint.c:66:     for (size_t i = 0; i < x->n_limbs; i++) {
	.loc 1 66 26 discriminator 1 view .LVU81
	cmp	r3, r1	@ i, _11
	beq	.L41		@,
.LVL29:
.L39:
	.loc 1 67 9 is_stmt 1 view .LVU82
	.loc 1 66 41 discriminator 2 view .LVU83
@ ../Core/Src/bigint.c:67:         if (x->limbs[i] != 0) return 0;
	.loc 1 67 12 is_stmt 0 view .LVU84
	ldr	r2, [r0, #4]!	@ MEM[(long unsigned int *)_12], MEM[(long unsigned int *)_12]
@ ../Core/Src/bigint.c:66:     for (size_t i = 0; i < x->n_limbs; i++) {
	.loc 1 66 41 discriminator 2 view .LVU85
	adds	r3, r3, #1	@ i, i,
.LVL30:
	.loc 1 66 26 is_stmt 1 discriminator 1 view .LVU86
@ ../Core/Src/bigint.c:67:         if (x->limbs[i] != 0) return 0;
	.loc 1 67 12 is_stmt 0 view .LVU87
	cmp	r2, #0	@ MEM[(long unsigned int *)_12]
	beq	.L44	@
@ ../Core/Src/bigint.c:67:         if (x->limbs[i] != 0) return 0;
	.loc 1 67 38 discriminator 1 view .LVU88
	movs	r0, #0	@ <retval>,
.LVL31:
	.loc 1 67 38 discriminator 1 view .LVU89
.LBE74:
.LBE73:
@ ../Core/Src/bigint.c:70: }
	.loc 1 70 1 view .LVU90
	bx	lr	@
.L41:
@ ../Core/Src/bigint.c:65:     if (!x) return 1;
	.loc 1 65 20 discriminator 1 view .LVU91
	movs	r0, #1	@ <retval>,
	bx	lr	@
	.cfi_endproc
.LFE5:
	.size	bigint_is_zero, .-bigint_is_zero
	.section	.text.bigint_cmp,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	bigint_cmp
	.syntax unified
	.thumb
	.thumb_func
	.type	bigint_cmp, %function
bigint_cmp:
.LVL32:
.LFB6:
	.loc 1 72 50 is_stmt 1 view -0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 1 73 5 view .LVU93
@ ../Core/Src/bigint.c:73:     if (!a && !b) return 0;
	.loc 1 73 8 is_stmt 0 view .LVU94
	cbz	r0, .L78	@ a,
	.loc 1 75 5 is_stmt 1 view .LVU95
.LBB95:
.LBB96:
.LBB97:
@ ../Core/Src/bigint.c:66:     for (size_t i = 0; i < x->n_limbs; i++) {
	.loc 1 66 29 is_stmt 0 discriminator 1 view .LVU96
	ldr	r3, [r0]	@ i, a_3(D)->n_limbs
.LBE97:
.LBE96:
.LBE95:
@ ../Core/Src/bigint.c:75:     if (!b) return bigint_is_zero(a) ? 0 : +1;
	.loc 1 75 8 view .LVU97
	cmp	r1, #0	@ b
	beq	.L79	@
.LVL33:
.LBB102:
.LBI102:
	.loc 1 72 5 is_stmt 1 view .LVU98
.LBB103:
	.loc 1 78 5 view .LVU99
	.loc 1 79 5 view .LVU100
	add	ip, r3, #2	@ tmp156, i,
.LBE103:
.LBE102:
@ ../Core/Src/bigint.c:72: int bigint_cmp(const bigint *a, const bigint *b) {
	.loc 1 72 50 is_stmt 0 view .LVU101
	push	{r4, lr}	@
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 14, -4
.LBB109:
.LBB107:
@ ../Core/Src/bigint.c:79:     size_t nb = b->n_limbs;
	.loc 1 79 12 view .LVU102
	ldr	r2, [r1]	@ nb, b_4(D)->n_limbs
.LVL34:
	.loc 1 81 5 is_stmt 1 view .LVU103
	add	ip, r0, ip, lsl #2	@ ivtmp.116, a, tmp156,
@ ../Core/Src/bigint.c:81:     while (na > 1 && a->limbs[na - 1] == 0) na--;
	.loc 1 81 11 is_stmt 0 view .LVU104
	b	.L54		@
.L80:
@ ../Core/Src/bigint.c:81:     while (na > 1 && a->limbs[na - 1] == 0) na--;
	.loc 1 81 19 discriminator 2 view .LVU105
	ldr	r4, [ip, #-4]!	@ MEM[(long unsigned int *)_69], MEM[(long unsigned int *)_69]
@ ../Core/Src/bigint.c:81:     while (na > 1 && a->limbs[na - 1] == 0) na--;
	.loc 1 81 34 discriminator 2 view .LVU106
	add	lr, r3, #-1	@ _24, i,
@ ../Core/Src/bigint.c:81:     while (na > 1 && a->limbs[na - 1] == 0) na--;
	.loc 1 81 19 discriminator 2 view .LVU107
	cbnz	r4, .L53	@ MEM[(long unsigned int *)_69],
@ ../Core/Src/bigint.c:81:     while (na > 1 && a->limbs[na - 1] == 0) na--;
	.loc 1 81 47 discriminator 3 view .LVU108
	mov	r3, lr	@ i, _24
.LVL35:
.L54:
	.loc 1 81 19 is_stmt 1 discriminator 1 view .LVU109
	cmp	r3, #1	@ i,
	bhi	.L80		@,
.L53:
	add	ip, r2, #2	@ tmp159, nb,
	add	ip, r1, ip, lsl #2	@ ivtmp.107, b, tmp159,
	b	.L56		@
.L81:
@ ../Core/Src/bigint.c:82:     while (nb > 1 && b->limbs[nb - 1] == 0) nb--;
	.loc 1 82 19 is_stmt 0 discriminator 2 view .LVU110
	ldr	r4, [ip, #-4]!	@ MEM[(long unsigned int *)_62], MEM[(long unsigned int *)_62]
@ ../Core/Src/bigint.c:82:     while (nb > 1 && b->limbs[nb - 1] == 0) nb--;
	.loc 1 82 34 discriminator 2 view .LVU111
	add	lr, r2, #-1	@ _27, nb,
@ ../Core/Src/bigint.c:82:     while (nb > 1 && b->limbs[nb - 1] == 0) nb--;
	.loc 1 82 19 discriminator 2 view .LVU112
	cbnz	r4, .L55	@ MEM[(long unsigned int *)_62],
@ ../Core/Src/bigint.c:82:     while (nb > 1 && b->limbs[nb - 1] == 0) nb--;
	.loc 1 82 47 discriminator 3 view .LVU113
	mov	r2, lr	@ nb, _27
.LVL36:
.L56:
	.loc 1 82 19 is_stmt 1 discriminator 1 view .LVU114
	cmp	r2, #1	@ nb,
	bhi	.L81		@,
.L55:
	.loc 1 84 5 view .LVU115
@ ../Core/Src/bigint.c:84:     if (na < nb) return -1;
	.loc 1 84 8 is_stmt 0 view .LVU116
	cmp	r3, r2	@ i, nb
	bcc	.L68		@,
	.loc 1 85 5 is_stmt 1 view .LVU117
@ ../Core/Src/bigint.c:85:     if (na > nb) return +1;
	.loc 1 85 8 is_stmt 0 view .LVU118
	bhi	.L69		@,
	adds	r2, r3, #2	@ tmp162, i,
.LVL37:
	.loc 1 85 8 view .LVU119
	add	r0, r0, r2, lsl #2	@ ivtmp.91, a, tmp162,
.LVL38:
	.loc 1 85 8 view .LVU120
	add	r1, r1, r2, lsl #2	@ ivtmp.95, b, tmp162,
.LVL39:
.L57:
.LBB104:
.LBB105:
	.loc 1 88 9 is_stmt 1 view .LVU121
	.loc 1 91 9 view .LVU122
	.loc 1 91 9 is_stmt 0 view .LVU123
.LBE105:
	.loc 1 87 27 is_stmt 1 discriminator 1 view .LVU124
	cbz	r3, .L82	@ i,
.LBB106:
@ ../Core/Src/bigint.c:88:         uint32_t av = a->limbs[i - 1];
	.loc 1 88 18 is_stmt 0 view .LVU125
	ldr	r4, [r0, #-4]!	@ av, MEM[(long unsigned int *)_54]
.LVL40:
	.loc 1 89 9 is_stmt 1 view .LVU126
@ ../Core/Src/bigint.c:89:         uint32_t bv = b->limbs[i - 1];
	.loc 1 89 18 is_stmt 0 view .LVU127
	ldr	r2, [r1, #-4]!	@ bv, MEM[(long unsigned int *)_55]
.LVL41:
	.loc 1 90 9 is_stmt 1 view .LVU128
@ ../Core/Src/bigint.c:90:         if (av < bv) return -1;
	.loc 1 90 12 is_stmt 0 view .LVU129
	cmp	r4, r2	@ av, bv
@ ../Core/Src/bigint.c:88:         uint32_t av = a->limbs[i - 1];
	.loc 1 88 34 view .LVU130
	add	r3, r3, #-1	@ i, i,
.LVL42:
@ ../Core/Src/bigint.c:90:         if (av < bv) return -1;
	.loc 1 90 12 view .LVU131
	bcc	.L68		@,
@ ../Core/Src/bigint.c:91:         if (av > bv) return +1;
	.loc 1 91 12 view .LVU132
	bls	.L57		@,
.LVL43:
.L69:
	.loc 1 91 12 view .LVU133
.LBE106:
.LBE104:
@ ../Core/Src/bigint.c:85:     if (na > nb) return +1;
	.loc 1 85 25 discriminator 1 view .LVU134
	movs	r0, #1	@ <retval>,
.LVL44:
	.loc 1 85 25 discriminator 1 view .LVU135
.LBE107:
.LBE109:
@ ../Core/Src/bigint.c:94: }
	.loc 1 94 1 view .LVU136
	pop	{r4, pc}	@
.LVL45:
.L78:
	.cfi_def_cfa_offset 0
	.cfi_restore 4
	.cfi_restore 14
@ ../Core/Src/bigint.c:73:     if (!a && !b) return 0;
	.loc 1 73 12 discriminator 1 view .LVU137
	cbz	r1, .L59	@ b,
.LVL46:
.LBB110:
.LBB111:
.LBB112:
	.loc 1 66 26 is_stmt 1 discriminator 1 view .LVU138
@ ../Core/Src/bigint.c:66:     for (size_t i = 0; i < x->n_limbs; i++) {
	.loc 1 66 29 is_stmt 0 discriminator 1 view .LVU139
	ldr	r2, [r1]	@ _38, b_4(D)->n_limbs
@ ../Core/Src/bigint.c:66:     for (size_t i = 0; i < x->n_limbs; i++) {
	.loc 1 66 26 discriminator 1 view .LVU140
	cbz	r2, .L77	@ _38,
	adds	r1, r1, #4	@ ivtmp.74, b,
.LVL47:
	.loc 1 66 26 discriminator 1 view .LVU141
	b	.L49		@
.LVL48:
.L83:
	.loc 1 66 26 discriminator 1 view .LVU142
	cmp	r0, r2	@ i, _38
	beq	.L62		@,
.LVL49:
.L49:
	.loc 1 67 9 is_stmt 1 view .LVU143
	.loc 1 66 41 discriminator 2 view .LVU144
@ ../Core/Src/bigint.c:67:         if (x->limbs[i] != 0) return 0;
	.loc 1 67 12 is_stmt 0 view .LVU145
	ldr	r3, [r1, #4]!	@ MEM[(long unsigned int *)_30], MEM[(long unsigned int *)_30]
@ ../Core/Src/bigint.c:66:     for (size_t i = 0; i < x->n_limbs; i++) {
	.loc 1 66 41 discriminator 2 view .LVU146
	adds	r0, r0, #1	@ i, i,
.LVL50:
	.loc 1 66 26 is_stmt 1 discriminator 1 view .LVU147
@ ../Core/Src/bigint.c:67:         if (x->limbs[i] != 0) return 0;
	.loc 1 67 12 is_stmt 0 view .LVU148
	cmp	r3, #0	@ MEM[(long unsigned int *)_30]
	beq	.L83	@
	mov	r0, #-1	@ <retval>,
.LVL51:
	.loc 1 67 12 view .LVU149
	bx	lr	@
.LVL52:
.L59:
	.loc 1 67 12 view .LVU150
.LBE112:
.LBE111:
.LBE110:
@ ../Core/Src/bigint.c:73:     if (!a && !b) return 0;
	.loc 1 73 26 discriminator 2 view .LVU151
	mov	r0, r1	@ <retval>, b
.LVL53:
@ ../Core/Src/bigint.c:94: }
	.loc 1 94 1 view .LVU152
	bx	lr	@
.LVL54:
.L68:
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 14, -4
.LBB113:
.LBB108:
@ ../Core/Src/bigint.c:84:     if (na < nb) return -1;
	.loc 1 84 25 discriminator 1 view .LVU153
	mov	r0, #-1	@ <retval>,
.LBE108:
.LBE113:
@ ../Core/Src/bigint.c:94: }
	.loc 1 94 1 view .LVU154
	pop	{r4, pc}	@
.LVL55:
.L82:
@ ../Core/Src/bigint.c:73:     if (!a && !b) return 0;
	.loc 1 73 26 discriminator 2 view .LVU155
	mov	r0, r3	@ <retval>, i
@ ../Core/Src/bigint.c:94: }
	.loc 1 94 1 view .LVU156
	pop	{r4, pc}	@
.LVL56:
.L62:
	.cfi_def_cfa_offset 0
	.cfi_restore 4
	.cfi_restore 14
.LBB114:
.LBB100:
.LBB98:
@ ../Core/Src/bigint.c:66:     for (size_t i = 0; i < x->n_limbs; i++) {
	.loc 1 66 26 discriminator 1 view .LVU157
	mov	r0, r3	@ <retval>, i
	bx	lr	@
.LVL57:
.L79:
	.loc 1 66 26 is_stmt 1 discriminator 1 view .LVU158
	cmp	r3, #0	@ i
	beq	.L62	@
	adds	r0, r0, #4	@ ivtmp.81, a,
.LVL58:
	.loc 1 66 26 is_stmt 0 discriminator 1 view .LVU159
	b	.L52		@
.LVL59:
.L84:
	.loc 1 66 26 discriminator 1 view .LVU160
	cmp	r3, r1	@ i, i
	beq	.L77		@,
.LVL60:
.L52:
	.loc 1 67 9 is_stmt 1 view .LVU161
	.loc 1 66 41 discriminator 2 view .LVU162
@ ../Core/Src/bigint.c:67:         if (x->limbs[i] != 0) return 0;
	.loc 1 67 12 is_stmt 0 view .LVU163
	ldr	r2, [r0, #4]!	@ MEM[(long unsigned int *)_41], MEM[(long unsigned int *)_41]
@ ../Core/Src/bigint.c:66:     for (size_t i = 0; i < x->n_limbs; i++) {
	.loc 1 66 41 discriminator 2 view .LVU164
	adds	r1, r1, #1	@ i, i,
.LVL61:
	.loc 1 66 26 is_stmt 1 discriminator 1 view .LVU165
@ ../Core/Src/bigint.c:67:         if (x->limbs[i] != 0) return 0;
	.loc 1 67 12 is_stmt 0 view .LVU166
	cmp	r2, #0	@ MEM[(long unsigned int *)_41]
	beq	.L84	@
	movs	r0, #1	@ <retval>,
.LVL62:
	.loc 1 67 12 view .LVU167
.LBE98:
.LBE100:
.LBE114:
@ ../Core/Src/bigint.c:75:     if (!b) return bigint_is_zero(a) ? 0 : +1;
	.loc 1 75 42 view .LVU168
	bx	lr	@
.L77:
.LBB115:
.LBB101:
.LBB99:
	.loc 1 75 42 view .LVU169
	mov	r0, r2	@ <retval>, MEM[(long unsigned int *)_41]
	bx	lr	@
.LBE99:
.LBE101:
.LBE115:
	.cfi_endproc
.LFE6:
	.size	bigint_cmp, .-bigint_cmp
	.section	.text.bigint_from_hex,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	bigint_from_hex
	.syntax unified
	.thumb
	.thumb_func
	.type	bigint_from_hex, %function
bigint_from_hex:
.LVL63:
.LFB8:
	.loc 1 107 55 is_stmt 1 view -0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 1 108 5 view .LVU171
@ ../Core/Src/bigint.c:108:     if (!out || !hex_str) return -1;
	.loc 1 108 8 is_stmt 0 view .LVU172
	cmp	r0, #0	@ out
	beq	.L119	@
@ ../Core/Src/bigint.c:107: int bigint_from_hex(bigint *out, const char *hex_str) {
	.loc 1 107 55 view .LVU173
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}	@
	.cfi_def_cfa_offset 36
	.cfi_offset 4, -36
	.cfi_offset 5, -32
	.cfi_offset 6, -28
	.cfi_offset 7, -24
	.cfi_offset 8, -20
	.cfi_offset 9, -16
	.cfi_offset 10, -12
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	mov	r4, r1	@ hex_str, tmp196
	sub	sp, sp, #12	@,,
	.cfi_def_cfa_offset 48
@ ../Core/Src/bigint.c:108:     if (!out || !hex_str) return -1;
	.loc 1 108 14 discriminator 2 view .LVU174
	cmp	r1, #0	@ hex_str
	beq	.L88	@
	.loc 1 110 5 is_stmt 1 view .LVU175
.LVL64:
.LBB130:
.LBI130:
	.loc 1 36 6 view .LVU176
	.loc 1 37 5 view .LVU177
.LBB131:
.LBI131:
	.loc 1 36 6 view .LVU178
.LBB132:
	.loc 1 38 5 view .LVU179
@ ../Core/Src/bigint.c:38:     memset(x->limbs, 0, x->capacity * sizeof(uint32_t));
	.loc 1 38 26 is_stmt 0 view .LVU180
	ldr	r6, [r0, #4]	@ _39, out_17(D)->capacity
	mov	r5, r0	@ out, tmp195
@ ../Core/Src/bigint.c:38:     memset(x->limbs, 0, x->capacity * sizeof(uint32_t));
	.loc 1 38 5 view .LVU181
	movs	r1, #0	@,
.LVL65:
	.loc 1 38 5 view .LVU182
	lsls	r2, r6, #2	@, _39,
	adds	r0, r0, #8	@, out,
.LVL66:
	.loc 1 38 5 view .LVU183
	bl	memset		@
.LVL67:
	.loc 1 39 5 is_stmt 1 view .LVU184
@ ../Core/Src/bigint.c:39:     x->n_limbs = 1;
	.loc 1 39 16 is_stmt 0 view .LVU185
	movs	r3, #1	@ tmp169,
	str	r3, [r5]	@ tmp169, out_17(D)->n_limbs
.LVL68:
	.loc 1 39 16 view .LVU186
.LBE132:
.LBE131:
.LBE130:
	.loc 1 112 5 is_stmt 1 view .LVU187
@ ../Core/Src/bigint.c:112:     size_t len = strlen(hex_str);
	.loc 1 112 18 is_stmt 0 view .LVU188
	mov	r0, r4	@, hex_str
	bl	strlen		@
.LVL69:
	.loc 1 113 5 is_stmt 1 view .LVU189
	.loc 1 116 5 view .LVU190
.LBB133:
	.loc 1 116 10 view .LVU191
@ ../Core/Src/bigint.c:116:     for (long i = (long)len - 1; i >= 0; i -= 8) {
	.loc 1 116 15 is_stmt 0 view .LVU192
	subs	r3, r0, #1	@ i, tmp170,
.LVL70:
	.loc 1 116 36 is_stmt 1 discriminator 1 view .LVU193
	cmp	r0, #0	@ tmp170
	beq	.L98	@
.LBB134:
	.loc 1 117 9 view .LVU194
@ ../Core/Src/bigint.c:117:         if (limb_idx >= out->capacity) return -1; // not enough room
	.loc 1 117 12 is_stmt 0 view .LVU195
	cmp	r6, #0	@ _39
	beq	.L88	@
	mov	lr, r3	@ i, i
	adds	r7, r5, #4	@ ivtmp.149, out,
	mov	r10, r5	@ out, out
@ ../Core/Src/bigint.c:120:         long start = i - 7;
	.loc 1 120 14 view .LVU196
	sub	r5, lr, #7	@ _24, i,
.LVL71:
	.loc 1 120 14 view .LVU197
	add	r8, r4, #-1	@ tmp171, hex_str,
@ ../Core/Src/bigint.c:121:         if (start < 0) start = 0;
	.loc 1 121 12 view .LVU198
	bic	r5, r5, r5, asr #31	@ _24, _24
	add	r8, r8, r0	@ ivtmp.151, tmp170
	bic	r2, r3, #7	@ tmp174, i,
	subs	r0, r0, #9	@ tmp172, tmp170,
.LVL72:
.LBB135:
@ ../Core/Src/bigint.c:123:         for (long j = start; j <= i; j++) {
	.loc 1 123 32 discriminator 1 view .LVU199
	cmp	r5, lr	@ _24, i
	sub	r9, r0, r2	@ _97, tmp172, tmp174
.LBE135:
.LBE134:
.LBE133:
@ ../Core/Src/bigint.c:113:     size_t limb_idx = 0;
	.loc 1 113 12 view .LVU200
	mov	r0, #0	@ ivtmp.126,
.LVL73:
.LBB153:
.LBB148:
	.loc 1 119 9 is_stmt 1 view .LVU201
	.loc 1 120 9 view .LVU202
	.loc 1 121 9 view .LVU203
.LBB144:
	.loc 1 123 32 discriminator 1 view .LVU204
	bgt	.L101		@,
.LVL74:
.L122:
	.loc 1 123 32 is_stmt 0 discriminator 1 view .LVU205
	subs	r5, r5, #1	@ tmp175, _24,
.LVL75:
	.loc 1 123 32 discriminator 1 view .LVU206
	add	r5, r5, r4	@ ivtmp.138, hex_str
.LVL76:
	.loc 1 123 32 discriminator 1 view .LVU207
	movs	r3, #0	@ acc,
	str	lr, [sp, #4]	@ i, %sfp
	b	.L96		@
.LVL77:
.L94:
.LBB136:
.LBB137:
.LBB138:
@ ../Core/Src/bigint.c:103:     if (c >= 'A' && c <= 'F') return 10 + (int)(c - 'A');
	.loc 1 103 8 view .LVU208
	cmp	fp, #5	@ tmp187,
	bhi	.L95		@,
@ ../Core/Src/bigint.c:103:     if (c >= 'A' && c <= 'F') return 10 + (int)(c - 'A');
	.loc 1 103 41 discriminator 1 view .LVU209
	sub	r1, r2, #55	@ _80, _78,
.LVL78:
	.loc 1 103 41 discriminator 1 view .LVU210
.LBE138:
.LBE137:
	.loc 1 125 13 is_stmt 1 view .LVU211
.L93:
	.loc 1 126 13 view .LVU212
@ ../Core/Src/bigint.c:126:             acc = (acc << 4) | (uint32_t)d;
	.loc 1 126 17 is_stmt 0 view .LVU213
	orr	r3, r1, r3, lsl #4	@ acc, _80, acc,
.LVL79:
.L95:
	.loc 1 126 17 view .LVU214
.LBE136:
	.loc 1 123 39 is_stmt 1 discriminator 2 view .LVU215
	.loc 1 123 32 discriminator 1 view .LVU216
	cmp	r5, r8	@ ivtmp.138, ivtmp.151
	beq	.L120		@,
.LVL80:
.L96:
.LBB143:
	.loc 1 124 13 view .LVU217
.LBB141:
.LBB139:
	.loc 1 102 5 view .LVU218
	.loc 1 103 5 view .LVU219
	.loc 1 103 31 discriminator 1 view .LVU220
.LBE139:
.LBE141:
@ ../Core/Src/bigint.c:124:             int d = hexval(hex_str[j]);
	.loc 1 124 21 is_stmt 0 view .LVU221
	ldrb	r2, [r5, #1]!	@ zero_extendqisi2	@ _78, MEM[(const char *)_14]
.LVL81:
.LBB142:
.LBI137:
	.loc 1 100 12 is_stmt 1 view .LVU222
.LBB140:
	.loc 1 101 5 view .LVU223
@ ../Core/Src/bigint.c:101:     if (c >= '0' && c <= '9') return (int)(c - '0');
	.loc 1 101 18 is_stmt 0 view .LVU224
	sub	r1, r2, #48	@ tmp176, _78,
@ ../Core/Src/bigint.c:101:     if (c >= '0' && c <= '9') return (int)(c - '0');
	.loc 1 101 8 view .LVU225
	uxtb	ip, r1	@ tmp179, tmp176
	cmp	ip, #9	@ tmp179,
@ ../Core/Src/bigint.c:102:     if (c >= 'a' && c <= 'f') return 10 + (int)(c - 'a');
	.loc 1 102 8 view .LVU226
	sub	lr, r2, #97	@ tmp183, _78,
@ ../Core/Src/bigint.c:103:     if (c >= 'A' && c <= 'F') return 10 + (int)(c - 'A');
	.loc 1 103 8 view .LVU227
	sub	fp, r2, #65	@ tmp187, _78,
@ ../Core/Src/bigint.c:101:     if (c >= '0' && c <= '9') return (int)(c - '0');
	.loc 1 101 8 view .LVU228
	bls	.L93		@,
@ ../Core/Src/bigint.c:102:     if (c >= 'a' && c <= 'f') return 10 + (int)(c - 'a');
	.loc 1 102 8 view .LVU229
	cmp	lr, #5	@ tmp183,
	bhi	.L94		@,
	.loc 1 102 31 is_stmt 1 discriminator 1 view .LVU230
@ ../Core/Src/bigint.c:102:     if (c >= 'a' && c <= 'f') return 10 + (int)(c - 'a');
	.loc 1 102 41 is_stmt 0 discriminator 1 view .LVU231
	sub	r1, r2, #87	@ _80, _78,
.LVL82:
	.loc 1 102 41 discriminator 1 view .LVU232
.LBE140:
.LBE142:
	.loc 1 125 13 is_stmt 1 view .LVU233
	b	.L93		@
.LVL83:
.L120:
	.loc 1 125 13 is_stmt 0 view .LVU234
	ldr	lr, [sp, #4]	@ i, %sfp
.LBE143:
.LBE144:
	.loc 1 129 9 is_stmt 1 view .LVU235
@ ../Core/Src/bigint.c:129:         out->limbs[limb_idx++] = acc;
	.loc 1 129 32 is_stmt 0 view .LVU236
	str	r3, [r7, #4]!	@ acc, MEM[(long unsigned int *)_35]
.LBE148:
@ ../Core/Src/bigint.c:116:     for (long i = (long)len - 1; i >= 0; i -= 8) {
	.loc 1 116 44 discriminator 2 view .LVU237
	sub	lr, lr, #8	@ i, i,
@ ../Core/Src/bigint.c:116:     for (long i = (long)len - 1; i >= 0; i -= 8) {
	.loc 1 116 36 discriminator 1 view .LVU238
	cmp	lr, r9	@ i, _97
.LBB149:
@ ../Core/Src/bigint.c:129:         out->limbs[limb_idx++] = acc;
	.loc 1 129 28 view .LVU239
	add	r2, r0, #1	@ limb_idx, ivtmp.126,
.LVL84:
	.loc 1 129 28 view .LVU240
.LBE149:
	.loc 1 116 44 is_stmt 1 discriminator 2 view .LVU241
	.loc 1 116 36 discriminator 1 view .LVU242
	beq	.L121		@,
.LVL85:
.L97:
.LBB150:
	.loc 1 117 9 view .LVU243
@ ../Core/Src/bigint.c:117:         if (limb_idx >= out->capacity) return -1; // not enough room
	.loc 1 117 12 is_stmt 0 view .LVU244
	cmp	r2, r6	@ limb_idx, _39
	sub	r8, r8, #8	@ ivtmp.151, ivtmp.151,
	beq	.L88		@,
@ ../Core/Src/bigint.c:120:         long start = i - 7;
	.loc 1 120 14 view .LVU245
	sub	r5, lr, #7	@ _24, i,
@ ../Core/Src/bigint.c:121:         if (start < 0) start = 0;
	.loc 1 121 12 view .LVU246
	bic	r5, r5, r5, asr #31	@ _24, _24
.LBB145:
@ ../Core/Src/bigint.c:123:         for (long j = start; j <= i; j++) {
	.loc 1 123 32 discriminator 1 view .LVU247
	cmp	r5, lr	@ _24, i
.LBE145:
	mov	r0, r2	@ ivtmp.126, limb_idx
	.loc 1 119 9 is_stmt 1 view .LVU248
.LVL86:
	.loc 1 120 9 view .LVU249
	.loc 1 121 9 view .LVU250
.LBB146:
	.loc 1 123 32 discriminator 1 view .LVU251
	ble	.L122		@,
.LVL87:
.L101:
	.loc 1 123 32 is_stmt 0 discriminator 1 view .LVU252
.LBE146:
.LBE150:
@ ../Core/Src/bigint.c:116:     for (long i = (long)len - 1; i >= 0; i -= 8) {
	.loc 1 116 44 discriminator 2 view .LVU253
	sub	lr, lr, #8	@ i, i,
.LVL88:
.LBB151:
.LBB147:
@ ../Core/Src/bigint.c:123:         for (long j = start; j <= i; j++) {
	.loc 1 123 32 discriminator 1 view .LVU254
	movs	r3, #0	@ acc,
.LBE147:
	.loc 1 129 9 is_stmt 1 view .LVU255
.LBE151:
@ ../Core/Src/bigint.c:116:     for (long i = (long)len - 1; i >= 0; i -= 8) {
	.loc 1 116 36 is_stmt 0 discriminator 1 view .LVU256
	cmp	lr, r9	@ i, _97
.LBB152:
@ ../Core/Src/bigint.c:129:         out->limbs[limb_idx++] = acc;
	.loc 1 129 32 view .LVU257
	str	r3, [r7, #4]!	@ acc, MEM[(long unsigned int *)_35]
@ ../Core/Src/bigint.c:129:         out->limbs[limb_idx++] = acc;
	.loc 1 129 28 view .LVU258
	add	r2, r0, #1	@ limb_idx, ivtmp.126,
.LVL89:
	.loc 1 129 28 view .LVU259
.LBE152:
	.loc 1 116 44 is_stmt 1 discriminator 2 view .LVU260
	.loc 1 116 36 discriminator 1 view .LVU261
	bne	.L97		@,
.LVL90:
.L121:
	.loc 1 116 36 is_stmt 0 discriminator 1 view .LVU262
.LBE153:
.LBB154:
.LBB155:
.LBB156:
@ ../Core/Src/bigint.c:55:     while (x->n_limbs > 1 && x->limbs[x->n_limbs - 1] == 0) {
	.loc 1 55 27 view .LVU263
	cmp	r2, #1	@ limb_idx,
.LBE156:
.LBE155:
.LBE154:
@ ../Core/Src/bigint.c:132:     out->n_limbs = (limb_idx == 0) ? 1 : limb_idx;
	.loc 1 132 18 discriminator 4 view .LVU264
	mov	r5, r10	@ out, out
	.loc 1 132 5 is_stmt 1 view .LVU265
@ ../Core/Src/bigint.c:132:     out->n_limbs = (limb_idx == 0) ? 1 : limb_idx;
	.loc 1 132 18 is_stmt 0 discriminator 4 view .LVU266
	str	r2, [r10]	@ limb_idx, out_17(D)->n_limbs
	.loc 1 133 5 is_stmt 1 view .LVU267
.LVL91:
.LBB159:
.LBI154:
	.loc 1 53 6 view .LVU268
	.loc 1 54 5 view .LVU269
.LBB158:
.LBB157:
	.loc 1 55 27 view .LVU270
	beq	.L98		@,
.LVL92:
	.loc 1 55 27 is_stmt 0 view .LVU271
	adds	r3, r0, #3	@ tmp188, ivtmp.126,
	add	r3, r10, r3, lsl #2	@ ivtmp.132, out, tmp188,
	b	.L99		@
.LVL93:
.L100:
@ ../Core/Src/bigint.c:56:         x->n_limbs--;
	.loc 1 56 19 view .LVU272
	str	r0, [r5]	@ ivtmp.126, out_17(D)->n_limbs
	.loc 1 55 27 is_stmt 1 view .LVU273
	subs	r0, r0, #1	@ ivtmp.126, ivtmp.126,
	beq	.L98		@,
.L99:
	.loc 1 56 9 view .LVU274
@ ../Core/Src/bigint.c:55:     while (x->n_limbs > 1 && x->limbs[x->n_limbs - 1] == 0) {
	.loc 1 55 27 is_stmt 0 discriminator 1 view .LVU275
	ldr	r2, [r3, #-4]!	@ MEM[(long unsigned int *)_96], MEM[(long unsigned int *)_96]
	cmp	r2, #0	@ MEM[(long unsigned int *)_96]
	beq	.L100	@
.LVL94:
.L98:
	.loc 1 55 27 discriminator 1 view .LVU276
.LBE157:
.LBE158:
.LBE159:
@ ../Core/Src/bigint.c:134:     return 0;
	.loc 1 134 12 view .LVU277
	movs	r0, #0	@ <retval>,
@ ../Core/Src/bigint.c:135: }
	.loc 1 135 1 view .LVU278
	add	sp, sp, #12	@,,
	.cfi_remember_state
	.cfi_def_cfa_offset 36
	@ sp needed	@
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}	@
.LVL95:
.L88:
	.cfi_restore_state
@ ../Core/Src/bigint.c:108:     if (!out || !hex_str) return -1;
	.loc 1 108 34 discriminator 3 view .LVU279
	mov	r0, #-1	@ <retval>,
@ ../Core/Src/bigint.c:135: }
	.loc 1 135 1 view .LVU280
	add	sp, sp, #12	@,,
	.cfi_def_cfa_offset 36
	@ sp needed	@
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}	@
.LVL96:
.L119:
	.cfi_def_cfa_offset 0
	.cfi_restore 4
	.cfi_restore 5
	.cfi_restore 6
	.cfi_restore 7
	.cfi_restore 8
	.cfi_restore 9
	.cfi_restore 10
	.cfi_restore 11
	.cfi_restore 14
@ ../Core/Src/bigint.c:108:     if (!out || !hex_str) return -1;
	.loc 1 108 34 discriminator 3 view .LVU281
	mov	r0, #-1	@ <retval>,
.LVL97:
@ ../Core/Src/bigint.c:135: }
	.loc 1 135 1 view .LVU282
	bx	lr	@
	.cfi_endproc
.LFE8:
	.size	bigint_from_hex, .-bigint_from_hex
	.section	.text.bigint_to_hex,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	bigint_to_hex
	.syntax unified
	.thumb
	.thumb_func
	.type	bigint_to_hex, %function
bigint_to_hex:
.LVL98:
.LFB9:
	.loc 1 137 75 is_stmt 1 view -0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 1 138 5 view .LVU284
	.loc 1 139 5 view .LVU285
@ ../Core/Src/bigint.c:139:     if (!hex_output || output_size == 0) return;
	.loc 1 139 8 is_stmt 0 view .LVU286
	cmp	r1, #0	@ hex_output
	beq	.L174	@
@ ../Core/Src/bigint.c:139:     if (!hex_output || output_size == 0) return;
	.loc 1 139 21 discriminator 2 view .LVU287
	cmp	r2, #0	@ output_size
	beq	.L174	@
	.loc 1 141 5 is_stmt 1 view .LVU288
@ ../Core/Src/bigint.c:141:     if (!x || bigint_is_zero(x)) {
	.loc 1 141 8 is_stmt 0 view .LVU289
	cmp	r0, #0	@ x
	beq	.L175	@
.LVL99:
.LBB170:
.LBB171:
.LBB172:
	.loc 1 66 26 is_stmt 1 discriminator 1 view .LVU290
.LBE172:
.LBE171:
.LBE170:
@ ../Core/Src/bigint.c:137: void bigint_to_hex(const bigint *x, char *hex_output, size_t output_size) {
	.loc 1 137 75 is_stmt 0 view .LVU291
	push	{r4, r5, r6, r7, r8, lr}	@
	.cfi_def_cfa_offset 24
	.cfi_offset 4, -24
	.cfi_offset 5, -20
	.cfi_offset 6, -16
	.cfi_offset 7, -12
	.cfi_offset 8, -8
	.cfi_offset 14, -4
.LBB175:
.LBB174:
.LBB173:
@ ../Core/Src/bigint.c:66:     for (size_t i = 0; i < x->n_limbs; i++) {
	.loc 1 66 29 discriminator 1 view .LVU292
	ldr	r4, [r0]	@ _73, x_38(D)->n_limbs
@ ../Core/Src/bigint.c:66:     for (size_t i = 0; i < x->n_limbs; i++) {
	.loc 1 66 26 discriminator 1 view .LVU293
	cmp	r4, #0	@ _73
	beq	.L125	@
	add	ip, r0, #4	@ ivtmp.202, x,
@ ../Core/Src/bigint.c:66:     for (size_t i = 0; i < x->n_limbs; i++) {
	.loc 1 66 17 view .LVU294
	movs	r3, #0	@ i,
	b	.L127		@
.LVL100:
.L180:
@ ../Core/Src/bigint.c:66:     for (size_t i = 0; i < x->n_limbs; i++) {
	.loc 1 66 26 discriminator 1 view .LVU295
	cmp	r3, r4	@ i, _73
	beq	.L125		@,
.LVL101:
.L127:
	.loc 1 67 9 is_stmt 1 view .LVU296
	.loc 1 66 41 discriminator 2 view .LVU297
@ ../Core/Src/bigint.c:67:         if (x->limbs[i] != 0) return 0;
	.loc 1 67 12 is_stmt 0 view .LVU298
	ldr	r5, [ip, #4]!	@ MEM[(long unsigned int *)_98], MEM[(long unsigned int *)_98]
@ ../Core/Src/bigint.c:66:     for (size_t i = 0; i < x->n_limbs; i++) {
	.loc 1 66 41 discriminator 2 view .LVU299
	adds	r3, r3, #1	@ i, i,
.LVL102:
	.loc 1 66 26 is_stmt 1 discriminator 1 view .LVU300
@ ../Core/Src/bigint.c:67:         if (x->limbs[i] != 0) return 0;
	.loc 1 67 12 is_stmt 0 view .LVU301
	cmp	r5, #0	@ MEM[(long unsigned int *)_98]
	beq	.L180	@
.LVL103:
	.loc 1 67 12 view .LVU302
.LBE173:
.LBE174:
.LBE175:
	.loc 1 152 5 is_stmt 1 view .LVU303
	.loc 1 153 5 view .LVU304
	.loc 1 153 20 discriminator 1 view .LVU305
	subs	r5, r4, #1	@ ms, _73,
.LVL104:
	.loc 1 153 20 is_stmt 0 discriminator 1 view .LVU306
	bmi	.L125		@,
	adds	r3, r4, #2	@ tmp166, _73,
	add	r3, r0, r3, lsl #2	@ ivtmp.196, x, tmp166,
	b	.L129		@
.L130:
	.loc 1 153 20 discriminator 1 view .LVU307
	subs	r5, r5, #1	@ ms, ms,
.LVL105:
	.loc 1 153 20 discriminator 1 view .LVU308
	bcc	.L125		@,
.LVL106:
.L129:
	.loc 1 153 42 is_stmt 1 discriminator 3 view .LVU309
@ ../Core/Src/bigint.c:153:     while (ms >= 0 && x->limbs[ms] == 0) ms--;
	.loc 1 153 20 is_stmt 0 discriminator 2 view .LVU310
	ldr	r4, [r3, #-4]!	@ MEM[(long unsigned int *)_1], MEM[(long unsigned int *)_1]
	cmp	r4, #0	@ MEM[(long unsigned int *)_1]
	beq	.L130	@
	.loc 1 155 5 is_stmt 1 view .LVU311
	.loc 1 165 5 view .LVU312
.LVL107:
	.loc 1 174 5 view .LVU313
@ ../Core/Src/bigint.c:174:     uint32_t limb = x->limbs[ms];
	.loc 1 174 14 is_stmt 0 view .LVU314
	adds	r7, r5, #2	@ tmp186, ms,
	movs	r3, #28	@ ivtmp.186,
	ldr	ip, [r0, r7, lsl #2]	@ limb, x_38(D)->limbs[ms_74]
.LVL108:
	.loc 1 175 5 is_stmt 1 view .LVU315
	.loc 1 176 5 view .LVU316
.LBB176:
	.loc 1 176 10 view .LVU317
	.loc 1 176 27 discriminator 1 view .LVU318
.L138:
.LBB177:
	.loc 1 177 9 view .LVU319
	.loc 1 180 12 discriminator 3 view .LVU320
.LBE177:
	.loc 1 176 36 discriminator 2 view .LVU321
	.loc 1 176 27 discriminator 1 view .LVU322
.LBB178:
@ ../Core/Src/bigint.c:177:         uint32_t v = (limb >> (nib * 4)) & 0xFu;
	.loc 1 177 28 is_stmt 0 view .LVU323
	lsr	r4, ip, r3	@ tmp169, limb, ivtmp.186
.LVL109:
	.loc 1 178 9 is_stmt 1 view .LVU324
@ ../Core/Src/bigint.c:178:         if (!started && v == 0) continue;
	.loc 1 178 22 is_stmt 0 discriminator 1 view .LVU325
	ands	r4, r4, #15	@ pos, tmp169,
.LVL110:
	.loc 1 178 22 discriminator 1 view .LVU326
	bne	.L181		@,
.LBE178:
@ ../Core/Src/bigint.c:176:     for (int nib = 7; nib >= 0; nib--) {
	.loc 1 176 27 discriminator 1 view .LVU327
	subs	r3, r3, #4	@ ivtmp.186, ivtmp.186,
	adds	r6, r3, #4	@, ivtmp.186,
	bne	.L138		@,
.LVL111:
.L137:
	.loc 1 176 27 discriminator 1 view .LVU328
.LBE176:
	.loc 1 184 5 is_stmt 1 view .LVU329
.LBB184:
	.loc 1 184 10 view .LVU330
@ ../Core/Src/bigint.c:184:     for (long i = ms - 1; i >= 0; i--) {
	.loc 1 184 15 is_stmt 0 view .LVU331
	subs	r6, r5, #1	@ i, ms,
.LVL112:
	.loc 1 184 29 is_stmt 1 discriminator 1 view .LVU332
	cmp	r5, #0	@ ms
	beq	.L143	@
	add	lr, r4, #1	@ _12, pos,
.L144:
.LBB185:
.LBB186:
@ ../Core/Src/bigint.c:188:             PUTCH(hexdigits[v]);
	.loc 1 188 77 is_stmt 0 discriminator 1 view .LVU333
	ldr	r5, .L184	@ tmp187,
.LVL113:
	.loc 1 188 77 discriminator 1 view .LVU334
	add	r7, r0, r7, lsl #2	@ ivtmp.178, x, tmp186,
.LVL114:
.L142:
	.loc 1 188 77 discriminator 1 view .LVU335
.LBE186:
.LBE185:
	.loc 1 185 9 is_stmt 1 view .LVU336
@ ../Core/Src/bigint.c:185:         limb = x->limbs[i];
	.loc 1 185 14 is_stmt 0 view .LVU337
	ldr	r0, [r7, #-4]!	@ limb, MEM[(long unsigned int *)_20]
.LVL115:
	.loc 1 186 9 is_stmt 1 view .LVU338
.LBB188:
	.loc 1 186 14 view .LVU339
	.loc 1 186 31 discriminator 1 view .LVU340
.LBE188:
@ ../Core/Src/bigint.c:185:         limb = x->limbs[i];
	.loc 1 185 14 is_stmt 0 view .LVU341
	mov	ip, #28	@ ivtmp.169,
	b	.L141		@
.LVL116:
.L182:
	.loc 1 185 14 view .LVU342
	add	lr, r4, #1	@ _12, pos,
.LVL117:
.L141:
.LBB189:
.LBB187:
	.loc 1 187 13 is_stmt 1 view .LVU343
	.loc 1 188 13 view .LVU344
	.loc 1 188 18 view .LVU345
	.loc 1 188 47 discriminator 1 view .LVU346
@ ../Core/Src/bigint.c:187:             uint32_t v = (limb >> (nib * 4)) & 0xFu;
	.loc 1 187 32 is_stmt 0 view .LVU347
	lsr	r3, r0, ip	@ tmp178, limb, ivtmp.169
@ ../Core/Src/bigint.c:188:             PUTCH(hexdigits[v]);
	.loc 1 188 21 view .LVU348
	cmp	lr, r2	@ _12, output_size
@ ../Core/Src/bigint.c:187:             uint32_t v = (limb >> (nib * 4)) & 0xFu;
	.loc 1 187 22 view .LVU349
	and	r3, r3, #15	@ v, tmp178,
	sub	ip, ip, #4	@ ivtmp.169, ivtmp.169,
@ ../Core/Src/bigint.c:188:             PUTCH(hexdigits[v]);
	.loc 1 188 21 view .LVU350
	bcs	.L140		@,
@ ../Core/Src/bigint.c:188:             PUTCH(hexdigits[v]);
	.loc 1 188 65 discriminator 1 view .LVU351
	ldrb	r3, [r5, r3]	@ zero_extendqisi2	@ hexdigits[v_50], hexdigits[v_50]
	strb	r3, [r1, r4]	@ hexdigits[v_50], *_13
@ ../Core/Src/bigint.c:188:             PUTCH(hexdigits[v]);
	.loc 1 188 61 discriminator 1 view .LVU352
	mov	r4, lr	@ pos, _12
.L140:
.LVL118:
	.loc 1 188 16 is_stmt 1 discriminator 3 view .LVU353
.LBE187:
	.loc 1 186 40 discriminator 2 view .LVU354
	.loc 1 186 31 discriminator 1 view .LVU355
	cmn	ip, #4	@ ivtmp.169,
	bne	.L182		@,
.LBE189:
	.loc 1 184 36 discriminator 2 view .LVU356
@ ../Core/Src/bigint.c:184:     for (long i = ms - 1; i >= 0; i--) {
	.loc 1 184 29 is_stmt 0 discriminator 1 view .LVU357
	subs	r6, r6, #1	@ i, i,
.LVL119:
	.loc 1 184 29 discriminator 1 view .LVU358
	bcc	.L139		@,
	add	lr, r4, #1	@ _12, pos,
	b	.L142		@
.LVL120:
.L177:
	.cfi_def_cfa_offset 0
	.cfi_restore 4
	.cfi_restore 5
	.cfi_restore 6
	.cfi_restore 7
	.cfi_restore 8
	.cfi_restore 14
	.loc 1 184 29 discriminator 1 view .LVU359
.LBE184:
	.loc 1 146 13 is_stmt 1 view .LVU360
@ ../Core/Src/bigint.c:146:             hex_output[0] = '\0';
	.loc 1 146 27 is_stmt 0 view .LVU361
	movs	r3, #0	@ tmp164,
	strb	r3, [r1]	@ tmp164, *hex_output_36(D)
.L174:
	.loc 1 146 27 view .LVU362
	bx	lr	@
.L125:
	.cfi_def_cfa_offset 24
	.cfi_offset 4, -24
	.cfi_offset 5, -20
	.cfi_offset 6, -16
	.cfi_offset 7, -12
	.cfi_offset 8, -8
	.cfi_offset 14, -4
	.loc 1 142 9 is_stmt 1 view .LVU363
@ ../Core/Src/bigint.c:142:         if (output_size >= 2) {
	.loc 1 142 12 is_stmt 0 view .LVU364
	cmp	r2, #1	@ output_size,
	.loc 1 143 13 is_stmt 1 view .LVU365
	.loc 1 144 13 view .LVU366
@ ../Core/Src/bigint.c:143:             hex_output[0] = '0';
	.loc 1 143 27 is_stmt 0 view .LVU367
	itete	ne
	movne	r3, #48	@ tmp162,
@ ../Core/Src/bigint.c:146:             hex_output[0] = '\0';
	.loc 1 146 27 view .LVU368
	moveq	r3, #0	@ tmp164,
@ ../Core/Src/bigint.c:143:             hex_output[0] = '0';
	.loc 1 143 27 view .LVU369
	strhne	r3, [r1]	@ unaligned	@ tmp162, MEM <vector(2) char> [(char *)hex_output_36(D)]
	.loc 1 146 13 is_stmt 1 view .LVU370
@ ../Core/Src/bigint.c:146:             hex_output[0] = '\0';
	.loc 1 146 27 is_stmt 0 view .LVU371
	strbeq	r3, [r1]	@ tmp164, *hex_output_36(D)
@ ../Core/Src/bigint.c:196: }
	.loc 1 196 1 view .LVU372
	pop	{r4, r5, r6, r7, r8, pc}	@
.L175:
	.cfi_def_cfa_offset 0
	.cfi_restore 4
	.cfi_restore 5
	.cfi_restore 6
	.cfi_restore 7
	.cfi_restore 8
	.cfi_restore 14
	.loc 1 142 9 is_stmt 1 view .LVU373
@ ../Core/Src/bigint.c:142:         if (output_size >= 2) {
	.loc 1 142 12 is_stmt 0 view .LVU374
	cmp	r2, #1	@ output_size,
	beq	.L177		@,
	.loc 1 143 13 is_stmt 1 view .LVU375
	.loc 1 144 13 view .LVU376
@ ../Core/Src/bigint.c:143:             hex_output[0] = '0';
	.loc 1 143 27 is_stmt 0 view .LVU377
	movs	r3, #48	@ tmp162,
	strh	r3, [r1]	@ unaligned	@ tmp162, MEM <vector(2) char> [(char *)hex_output_36(D)]
	bx	lr	@
.LVL121:
.L135:
	.cfi_def_cfa_offset 24
	.cfi_offset 4, -24
	.cfi_offset 5, -20
	.cfi_offset 6, -16
	.cfi_offset 7, -12
	.cfi_offset 8, -8
	.cfi_offset 14, -4
	.loc 1 184 5 is_stmt 1 view .LVU378
.LBB190:
	.loc 1 184 10 view .LVU379
@ ../Core/Src/bigint.c:184:     for (long i = ms - 1; i >= 0; i--) {
	.loc 1 184 15 is_stmt 0 view .LVU380
	subs	r6, r5, #1	@ i, ms,
.LVL122:
	.loc 1 184 29 is_stmt 1 discriminator 1 view .LVU381
	cmp	r5, #0	@ ms
	bne	.L144	@
.LVL123:
.L139:
	.loc 1 184 29 is_stmt 0 discriminator 1 view .LVU382
.LBE190:
	.loc 1 193 5 is_stmt 1 view .LVU383
@ ../Core/Src/bigint.c:193:     hex_output[(pos < output_size) ? pos : (output_size - 1)] = '\0';
	.loc 1 193 42 is_stmt 0 view .LVU384
	cmp	r2, r4	@ output_size, pos
@ ../Core/Src/bigint.c:193:     hex_output[(pos < output_size) ? pos : (output_size - 1)] = '\0';
	.loc 1 193 42 discriminator 1 view .LVU385
	it	ls
	addls	r4, r2, #-1	@ pos, output_size,
.LVL124:
.L143:
@ ../Core/Src/bigint.c:193:     hex_output[(pos < output_size) ? pos : (output_size - 1)] = '\0';
	.loc 1 193 63 discriminator 4 view .LVU386
	movs	r3, #0	@ tmp182,
	strb	r3, [r1, r4]	@ tmp182, *_15
@ ../Core/Src/bigint.c:196: }
	.loc 1 196 1 view .LVU387
	pop	{r4, r5, r6, r7, r8, pc}	@
.LVL125:
.L181:
.LBB191:
.LBB179:
@ ../Core/Src/bigint.c:180:         PUTCH(hexdigits[v]);
	.loc 1 180 73 discriminator 1 view .LVU388
	ldr	r8, .L184	@ tmp189,
	mov	r6, r4	@ v, pos
	mov	lr, #1	@ _12,
	movs	r4, #0	@ pos,
.LVL126:
.L133:
	.loc 1 179 9 is_stmt 1 view .LVU389
	.loc 1 180 9 view .LVU390
	.loc 1 180 14 view .LVU391
	.loc 1 180 12 discriminator 3 view .LVU392
.LBE179:
	.loc 1 176 36 discriminator 2 view .LVU393
	.loc 1 176 27 discriminator 1 view .LVU394
.LBB180:
	.loc 1 177 9 view .LVU395
	.loc 1 180 43 discriminator 1 view .LVU396
	.loc 1 177 9 view .LVU397
@ ../Core/Src/bigint.c:180:         PUTCH(hexdigits[v]);
	.loc 1 180 17 is_stmt 0 view .LVU398
	cmp	lr, r2	@ _12, output_size
	bcc	.L134		@,
.L183:
	.loc 1 180 17 view .LVU399
.LBE180:
@ ../Core/Src/bigint.c:176:     for (int nib = 7; nib >= 0; nib--) {
	.loc 1 176 27 discriminator 1 view .LVU400
	subs	r3, r3, #4	@ ivtmp.186, ivtmp.186,
	adds	r6, r3, #4	@, ivtmp.186,
.LVL127:
	.loc 1 176 27 discriminator 1 view .LVU401
	beq	.L135		@,
.LBB181:
@ ../Core/Src/bigint.c:177:         uint32_t v = (limb >> (nib * 4)) & 0xFu;
	.loc 1 177 28 view .LVU402
	lsr	r6, ip, r3	@ tmp170, limb, ivtmp.186
@ ../Core/Src/bigint.c:180:         PUTCH(hexdigits[v]);
	.loc 1 180 17 view .LVU403
	cmp	lr, r2	@ _12, output_size
@ ../Core/Src/bigint.c:177:         uint32_t v = (limb >> (nib * 4)) & 0xFu;
	.loc 1 177 18 view .LVU404
	and	r6, r6, #15	@ v, tmp170,
.LVL128:
	.loc 1 178 9 is_stmt 1 view .LVU405
	.loc 1 179 9 view .LVU406
	.loc 1 180 9 view .LVU407
	.loc 1 180 14 view .LVU408
	.loc 1 180 12 discriminator 3 view .LVU409
.LBE181:
	.loc 1 176 36 discriminator 2 view .LVU410
	.loc 1 176 27 discriminator 1 view .LVU411
.LBB182:
	.loc 1 177 9 view .LVU412
	.loc 1 180 43 discriminator 1 view .LVU413
	.loc 1 177 9 view .LVU414
@ ../Core/Src/bigint.c:180:         PUTCH(hexdigits[v]);
	.loc 1 180 17 is_stmt 0 view .LVU415
	bcs	.L183		@,
.L134:
@ ../Core/Src/bigint.c:180:         PUTCH(hexdigits[v]);
	.loc 1 180 61 discriminator 1 view .LVU416
	ldrb	r6, [r8, r6]	@ zero_extendqisi2	@ hexdigits[v_111], hexdigits[v_111]
.LVL129:
	.loc 1 180 61 discriminator 1 view .LVU417
	strb	r6, [r1, r4]	@ hexdigits[v_111], *_8
	.loc 1 180 12 is_stmt 1 discriminator 3 view .LVU418
.LBE182:
	.loc 1 176 36 discriminator 2 view .LVU419
	.loc 1 176 27 discriminator 1 view .LVU420
	subs	r3, r3, #4	@ ivtmp.186, ivtmp.186,
	adds	r4, r3, #4	@, ivtmp.186,
	beq	.L146		@,
.LBB183:
@ ../Core/Src/bigint.c:177:         uint32_t v = (limb >> (nib * 4)) & 0xFu;
	.loc 1 177 28 is_stmt 0 view .LVU421
	lsr	r6, ip, r3	@ tmp174, limb, ivtmp.186
@ ../Core/Src/bigint.c:180:         PUTCH(hexdigits[v]);
	.loc 1 180 57 discriminator 1 view .LVU422
	mov	r4, lr	@ pos, _12
@ ../Core/Src/bigint.c:177:         uint32_t v = (limb >> (nib * 4)) & 0xFu;
	.loc 1 177 18 view .LVU423
	and	r6, r6, #15	@ v, tmp174,
.LVL130:
	.loc 1 178 9 is_stmt 1 view .LVU424
	.loc 1 178 9 is_stmt 0 view .LVU425
	add	lr, lr, #1	@ _12, _12,
.LVL131:
	.loc 1 178 9 view .LVU426
	b	.L133		@
.LVL132:
.L146:
@ ../Core/Src/bigint.c:180:         PUTCH(hexdigits[v]);
	.loc 1 180 57 discriminator 1 view .LVU427
	mov	r4, lr	@ pos, _12
	b	.L137		@
.L185:
	.align	2
.L184:
	.word	hexdigits.0
.LBE183:
.LBE191:
	.cfi_endproc
.LFE9:
	.size	bigint_to_hex, .-bigint_to_hex
	.section	.text.bigint_add,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	bigint_add
	.syntax unified
	.thumb
	.thumb_func
	.type	bigint_add, %function
bigint_add:
.LVL133:
.LFB10:
	.loc 1 202 63 is_stmt 1 view -0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 1 203 5 view .LVU429
@ ../Core/Src/bigint.c:203:     if (!res || !a || !b) return -1;
	.loc 1 203 8 is_stmt 0 view .LVU430
	cmp	r0, #0	@ res
	beq	.L196	@
@ ../Core/Src/bigint.c:203:     if (!res || !a || !b) return -1;
	.loc 1 203 14 discriminator 2 view .LVU431
	cmp	r1, #0	@ a
	beq	.L196	@
@ ../Core/Src/bigint.c:203:     if (!res || !a || !b) return -1;
	.loc 1 203 20 discriminator 4 view .LVU432
	cmp	r2, #0	@ b
	beq	.L196	@
	.loc 1 205 5 is_stmt 1 view .LVU433
@ ../Core/Src/bigint.c:202: int bigint_add(bigint *res, const bigint *a, const bigint *b) {
	.loc 1 202 63 is_stmt 0 view .LVU434
	push	{r4, r5, r6, r7, r8, r9, r10, lr}	@
	.cfi_def_cfa_offset 32
	.cfi_offset 4, -32
	.cfi_offset 5, -28
	.cfi_offset 6, -24
	.cfi_offset 7, -20
	.cfi_offset 8, -16
	.cfi_offset 9, -12
	.cfi_offset 10, -8
	.cfi_offset 14, -4
@ ../Core/Src/bigint.c:205:     size_t na = a->n_limbs;
	.loc 1 205 12 view .LVU435
	ldr	r6, [r1]	@ na, a_20(D)->n_limbs
.LVL134:
	.loc 1 206 5 is_stmt 1 view .LVU436
@ ../Core/Src/bigint.c:206:     size_t nb = b->n_limbs;
	.loc 1 206 12 is_stmt 0 view .LVU437
	ldr	r7, [r2]	@ nb, b_21(D)->n_limbs
.LVL135:
	.loc 1 207 5 is_stmt 1 view .LVU438
@ ../Core/Src/bigint.c:209:     if (res->capacity < n + 1) return -1;
	.loc 1 209 12 is_stmt 0 view .LVU439
	ldr	r8, [r0, #4]	@ _1, res_19(D)->capacity
@ ../Core/Src/bigint.c:207:     size_t n  = (na > nb) ? na : nb;
	.loc 1 207 12 view .LVU440
	cmp	r6, r7	@ n, nb
	mov	r4, r6	@ n, na
	it	cc
	movcc	r4, r7	@ n, nb
.LVL136:
	.loc 1 209 5 is_stmt 1 view .LVU441
@ ../Core/Src/bigint.c:209:     if (res->capacity < n + 1) return -1;
	.loc 1 209 27 is_stmt 0 view .LVU442
	adds	r3, r4, #1	@ tmp144, n,
@ ../Core/Src/bigint.c:209:     if (res->capacity < n + 1) return -1;
	.loc 1 209 8 view .LVU443
	cmp	r8, r3	@ _1, tmp144
	bcc	.L197		@,
.LVL137:
.LBB192:
	.loc 1 212 26 is_stmt 1 discriminator 1 view .LVU444
	cbz	r4, .L198	@ n,
.LBB193:
@ ../Core/Src/bigint.c:213:         uint64_t av = (i < na) ? (uint64_t)a->limbs[i] : 0;
	.loc 1 213 52 is_stmt 0 discriminator 1 view .LVU445
	add	r5, r1, #8	@ tmp186, a,
.LBE193:
@ ../Core/Src/bigint.c:212:     for (size_t i = 0; i < n; i++) {
	.loc 1 212 17 view .LVU446
	movs	r1, #0	@ i,
.LVL138:
.LBB194:
@ ../Core/Src/bigint.c:214:         uint64_t bv = (i < nb) ? (uint64_t)b->limbs[i] : 0;
	.loc 1 214 52 discriminator 1 view .LVU447
	add	r10, r2, #8	@ tmp187, b,
	add	lr, r0, #4	@ ivtmp.214, res,
.LBE194:
.LBE192:
@ ../Core/Src/bigint.c:211:     uint64_t carry = 0;
	.loc 1 211 14 view .LVU448
	mov	r3, r1	@ carry, i
	mov	ip, r1	@ carry, i
.LVL139:
.L191:
.LBB197:
.LBB195:
	.loc 1 213 9 is_stmt 1 view .LVU449
	.loc 1 214 9 view .LVU450
	.loc 1 216 9 view .LVU451
	.loc 1 217 9 view .LVU452
@ ../Core/Src/bigint.c:213:         uint64_t av = (i < na) ? (uint64_t)a->limbs[i] : 0;
	.loc 1 213 56 is_stmt 0 view .LVU453
	cmp	r6, r1	@ na, i
	bls	.L189		@,
	ldr	r2, [r5, r1, lsl #2]	@ tmp195, MEM[(long unsigned int *)_9 + i_44 * 4]
	adds	r3, r2, r3	@ tmp178, tmp195, carry
.LVL140:
	.loc 1 213 56 view .LVU454
	adc	ip, ip, #0	@ carry, carry
.L189:
@ ../Core/Src/bigint.c:214:         uint64_t bv = (i < nb) ? (uint64_t)b->limbs[i] : 0;
	.loc 1 214 56 view .LVU455
	cmp	r7, r1	@ nb, i
	bls	.L190		@,
@ ../Core/Src/bigint.c:216:         uint64_t sum = av + bv + carry;
	.loc 1 216 18 view .LVU456
	ldr	r2, [r10, r1, lsl #2]	@ tmp196, MEM[(long unsigned int *)_10 + i_44 * 4]
	adds	r3, r2, r3	@ tmp182, tmp196, carry
	adc	ip, ip, #0	@ carry, carry
.L190:
	.loc 1 216 18 view .LVU457
.LBE195:
@ ../Core/Src/bigint.c:212:     for (size_t i = 0; i < n; i++) {
	.loc 1 212 32 discriminator 2 view .LVU458
	adds	r1, r1, #1	@ i, i,
.LVL141:
@ ../Core/Src/bigint.c:212:     for (size_t i = 0; i < n; i++) {
	.loc 1 212 26 discriminator 1 view .LVU459
	cmp	r4, r1	@ n, i
.LBB196:
@ ../Core/Src/bigint.c:217:         res->limbs[i] = (uint32_t)sum;
	.loc 1 217 25 view .LVU460
	str	r3, [lr, #4]!	@ carry, MEM[(long unsigned int *)_30]
	.loc 1 218 9 is_stmt 1 view .LVU461
@ ../Core/Src/bigint.c:218:         carry = sum >> 32;
	.loc 1 218 15 is_stmt 0 view .LVU462
	mov	r9, ip	@ carry, carry
	mov	r3, ip	@ carry, carry
	mov	ip, #0	@ carry,
.LVL142:
	.loc 1 218 15 view .LVU463
.LBE196:
	.loc 1 212 32 is_stmt 1 discriminator 2 view .LVU464
	.loc 1 212 26 discriminator 1 view .LVU465
	bne	.L191		@,
.LBE197:
@ ../Core/Src/bigint.c:222:     res->n_limbs = n + (carry ? 1 : 0);
	.loc 1 222 22 is_stmt 0 discriminator 4 view .LVU466
	cmp	r9, ip	@ _53,
	ite	eq		@
	moveq	r1, r4	@, _59, n
	addne	r1, r4, #1	@,, _59, n
.LVL143:
.L188:
	.loc 1 221 5 is_stmt 1 view .LVU467
@ ../Core/Src/bigint.c:221:     res->limbs[n] = (uint32_t)carry;
	.loc 1 221 19 is_stmt 0 view .LVU468
	adds	r4, r4, #2	@ tmp163, n,
.LBB198:
@ ../Core/Src/bigint.c:225:     for (size_t i = res->n_limbs; i < res->capacity; i++) res->limbs[i] = 0;
	.loc 1 225 37 discriminator 1 view .LVU469
	cmp	r8, r1	@ _1, _59
.LBE198:
@ ../Core/Src/bigint.c:221:     res->limbs[n] = (uint32_t)carry;
	.loc 1 221 19 view .LVU470
	str	r3, [r0, r4, lsl #2]	@ _53, res_19(D)->limbs[n_25]
	.loc 1 222 5 is_stmt 1 view .LVU471
@ ../Core/Src/bigint.c:222:     res->n_limbs = n + (carry ? 1 : 0);
	.loc 1 222 18 is_stmt 0 discriminator 4 view .LVU472
	str	r1, [r0]	@ _59, res_19(D)->n_limbs
	.loc 1 225 5 is_stmt 1 view .LVU473
.LBB199:
	.loc 1 225 10 view .LVU474
.LVL144:
	.loc 1 225 37 discriminator 1 view .LVU475
	bls	.L193		@,
@ ../Core/Src/bigint.c:225:     for (size_t i = res->n_limbs; i < res->capacity; i++) res->limbs[i] = 0;
	.loc 1 225 73 is_stmt 0 discriminator 3 view .LVU476
	sub	r2, r8, r1	@ tmp164, _1, _59
	adds	r3, r1, #2	@ tmp166, _59,
	lsls	r2, r2, #2	@, tmp164,
	movs	r1, #0	@,
	add	r0, r0, r3, lsl #2	@, res, tmp166,
.LVL145:
	.loc 1 225 73 discriminator 3 view .LVU477
	bl	memset		@
.LVL146:
.L193:
	.loc 1 225 73 discriminator 3 view .LVU478
.LBE199:
@ ../Core/Src/bigint.c:227:     return 0;
	.loc 1 227 12 view .LVU479
	movs	r0, #0	@ <retval>,
.L186:
@ ../Core/Src/bigint.c:228: }
	.loc 1 228 1 view .LVU480
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}	@
.LVL147:
.L198:
.LBB200:
@ ../Core/Src/bigint.c:212:     for (size_t i = 0; i < n; i++) {
	.loc 1 212 26 discriminator 1 view .LVU481
	mov	r1, r4	@ _59, n
.LVL148:
	.loc 1 212 26 discriminator 1 view .LVU482
	mov	r3, r4	@ _53, n
	b	.L188		@
.LVL149:
.L196:
	.cfi_def_cfa_offset 0
	.cfi_restore 4
	.cfi_restore 5
	.cfi_restore 6
	.cfi_restore 7
	.cfi_restore 8
	.cfi_restore 9
	.cfi_restore 10
	.cfi_restore 14
	.loc 1 212 26 discriminator 1 view .LVU483
.LBE200:
@ ../Core/Src/bigint.c:203:     if (!res || !a || !b) return -1;
	.loc 1 203 34 discriminator 5 view .LVU484
	mov	r0, #-1	@ <retval>,
.LVL150:
@ ../Core/Src/bigint.c:228: }
	.loc 1 228 1 view .LVU485
	bx	lr	@
.LVL151:
.L197:
	.cfi_def_cfa_offset 32
	.cfi_offset 4, -32
	.cfi_offset 5, -28
	.cfi_offset 6, -24
	.cfi_offset 7, -20
	.cfi_offset 8, -16
	.cfi_offset 9, -12
	.cfi_offset 10, -8
	.cfi_offset 14, -4
@ ../Core/Src/bigint.c:203:     if (!res || !a || !b) return -1;
	.loc 1 203 34 discriminator 5 view .LVU486
	mov	r0, #-1	@ <retval>,
.LVL152:
	.loc 1 203 34 discriminator 5 view .LVU487
	b	.L186		@
	.cfi_endproc
.LFE10:
	.size	bigint_add, .-bigint_add
	.section	.text.bigint_sub,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	bigint_sub
	.syntax unified
	.thumb
	.thumb_func
	.type	bigint_sub, %function
bigint_sub:
.LVL153:
.LFB11:
	.loc 1 230 63 is_stmt 1 view -0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 1 231 5 view .LVU489
@ ../Core/Src/bigint.c:231:     if (!res || !a || !b) return -1;
	.loc 1 231 8 is_stmt 0 view .LVU490
	cmp	r0, #0	@ res
	beq	.L216	@
@ ../Core/Src/bigint.c:230: int bigint_sub(bigint *res, const bigint *a, const bigint *b) {
	.loc 1 230 63 view .LVU491
	push	{r4, r5, r6, r7, r8, r9, r10, lr}	@
	.cfi_def_cfa_offset 32
	.cfi_offset 4, -32
	.cfi_offset 5, -28
	.cfi_offset 6, -24
	.cfi_offset 7, -20
	.cfi_offset 8, -16
	.cfi_offset 9, -12
	.cfi_offset 10, -8
	.cfi_offset 14, -4
	mov	r4, r1	@ a, tmp191
@ ../Core/Src/bigint.c:231:     if (!res || !a || !b) return -1;
	.loc 1 231 14 discriminator 2 view .LVU492
	cmp	r1, #0	@ a
	beq	.L220	@
	mov	r7, r2	@ b, tmp192
@ ../Core/Src/bigint.c:231:     if (!res || !a || !b) return -1;
	.loc 1 231 20 discriminator 4 view .LVU493
	cmp	r2, #0	@ b
	beq	.L220	@
	.loc 1 232 5 is_stmt 1 view .LVU494
	mov	r5, r0	@ res, tmp190
@ ../Core/Src/bigint.c:232:     if (bigint_cmp(a, b) < 0) return -1;
	.loc 1 232 9 is_stmt 0 view .LVU495
	mov	r1, r2	@, b
.LVL154:
	.loc 1 232 9 view .LVU496
	mov	r0, r4	@, a
.LVL155:
	.loc 1 232 9 view .LVU497
	bl	bigint_cmp		@
.LVL156:
@ ../Core/Src/bigint.c:232:     if (bigint_cmp(a, b) < 0) return -1;
	.loc 1 232 8 discriminator 1 view .LVU498
	cmp	r0, #0	@ tmp193,
	blt	.L220		@,
	.loc 1 233 5 is_stmt 1 view .LVU499
@ ../Core/Src/bigint.c:233:     if (res->capacity < a->n_limbs) return -1;
	.loc 1 233 12 is_stmt 0 view .LVU500
	ldr	r10, [r5, #4]	@ _2, res_18(D)->capacity
@ ../Core/Src/bigint.c:233:     if (res->capacity < a->n_limbs) return -1;
	.loc 1 233 26 view .LVU501
	ldr	r3, [r4]	@ _34, a_19(D)->n_limbs
@ ../Core/Src/bigint.c:233:     if (res->capacity < a->n_limbs) return -1;
	.loc 1 233 8 view .LVU502
	cmp	r10, r3	@ _2, _34
	bcc	.L220		@,
.LVL157:
.LBB208:
	.loc 1 238 26 is_stmt 1 discriminator 1 view .LVU503
	cmp	r3, #0	@ _34
	beq	.L206	@
@ ../Core/Src/bigint.c:238:     for (size_t i = 0; i < n; i++) {
	.loc 1 238 17 is_stmt 0 view .LVU504
	mov	lr, #0	@ i,
.LBB209:
@ ../Core/Src/bigint.c:240:         uint64_t bv = (i < b->n_limbs) ? (uint64_t)b->limbs[i] : 0;
	.loc 1 240 29 view .LVU505
	ldr	r0, [r7], #8	@ _5, b_20(D)->n_limbs
.LVL158:
	.loc 1 240 29 view .LVU506
	add	r9, r4, #4	@ ivtmp.241, a,
	adds	r6, r5, #4	@ ivtmp.245, res,
.LBE209:
.LBE208:
@ ../Core/Src/bigint.c:235:     uint64_t borrow = 0;
	.loc 1 235 14 view .LVU507
	mov	ip, lr	@ borrow, i
	mov	r4, lr	@ borrow, i
.LVL159:
.LBB213:
.LBB210:
@ ../Core/Src/bigint.c:239:         uint64_t av = (uint64_t)a->limbs[i];
	.loc 1 239 18 view .LVU508
	mov	r8, lr	@ tmp151, i
.LVL160:
.L208:
	.loc 1 239 9 is_stmt 1 view .LVU509
	.loc 1 242 9 view .LVU510
	.loc 1 243 9 view .LVU511
@ ../Core/Src/bigint.c:240:         uint64_t bv = (i < b->n_limbs) ? (uint64_t)b->limbs[i] : 0;
	.loc 1 240 64 is_stmt 0 view .LVU512
	cmp	r0, lr	@ _5, i
@ ../Core/Src/bigint.c:239:         uint64_t av = (uint64_t)a->limbs[i];
	.loc 1 239 18 view .LVU513
	ldr	r2, [r9, #4]!	@ MEM[(long unsigned int *)_64], MEM[(long unsigned int *)_64]
.LVL161:
	.loc 1 240 9 is_stmt 1 view .LVU514
@ ../Core/Src/bigint.c:240:         uint64_t bv = (i < b->n_limbs) ? (uint64_t)b->limbs[i] : 0;
	.loc 1 240 64 is_stmt 0 view .LVU515
	bls	.L207		@,
@ ../Core/Src/bigint.c:242:         uint64_t needed = bv + borrow;
	.loc 1 242 18 view .LVU516
	ldr	r1, [r7, lr, lsl #2]	@ tmp196, MEM[(long unsigned int *)_66 + i_46 * 4]
	adds	ip, r1, ip	@ tmp183, tmp196, borrow
.LVL162:
	.loc 1 242 18 view .LVU517
	adc	r4, r4, #0	@ borrow, borrow
.L207:
@ ../Core/Src/bigint.c:243:         uint64_t diff   = av - needed;
	.loc 1 243 18 view .LVU518
	subs	r2, r2, ip	@ diff, MEM[(long unsigned int *)_64], borrow
.LVL163:
	.loc 1 245 9 is_stmt 1 view .LVU519
@ ../Core/Src/bigint.c:245:         borrow = (av < needed) ? 1 : 0;
	.loc 1 245 36 is_stmt 0 view .LVU520
	sbcs	r4, r8, r4	@ tmp194, tmp151, borrow
.LVL164:
	.loc 1 245 36 view .LVU521
.LBE210:
@ ../Core/Src/bigint.c:238:     for (size_t i = 0; i < n; i++) {
	.loc 1 238 32 discriminator 2 view .LVU522
	add	lr, lr, #1	@ i, i,
.LVL165:
.LBB211:
@ ../Core/Src/bigint.c:245:         borrow = (av < needed) ? 1 : 0;
	.loc 1 245 36 view .LVU523
	ite	cc
	movcc	ip, #1	@ borrow,
	.loc 1 245 36 view .LVU524
	movcs	ip, #0	@ borrow,
.LBE211:
@ ../Core/Src/bigint.c:238:     for (size_t i = 0; i < n; i++) {
	.loc 1 238 26 discriminator 1 view .LVU525
	cmp	r3, lr	@ _34, i
.LBB212:
@ ../Core/Src/bigint.c:246:         res->limbs[i] = (uint32_t)diff;
	.loc 1 246 25 view .LVU526
	str	r2, [r6, #4]!	@ diff, MEM[(long unsigned int *)_65]
.LVL166:
@ ../Core/Src/bigint.c:245:         borrow = (av < needed) ? 1 : 0;
	.loc 1 245 16 view .LVU527
	mov	r4, #0	@ borrow,
.LVL167:
	.loc 1 246 9 is_stmt 1 view .LVU528
.LBE212:
	.loc 1 238 32 discriminator 2 view .LVU529
	.loc 1 238 26 discriminator 1 view .LVU530
	bne	.L208		@,
.LBE213:
	.loc 1 249 5 view .LVU531
.LBB214:
.LBB215:
.LBB216:
@ ../Core/Src/bigint.c:55:     while (x->n_limbs > 1 && x->limbs[x->n_limbs - 1] == 0) {
	.loc 1 55 27 is_stmt 0 view .LVU532
	cmp	r3, #1	@ _34,
.LBE216:
.LBE215:
.LBE214:
@ ../Core/Src/bigint.c:249:     res->n_limbs = n;
	.loc 1 249 18 view .LVU533
	str	r3, [r5]	@ _34, res_18(D)->n_limbs
	.loc 1 250 5 is_stmt 1 view .LVU534
.LVL168:
.LBB221:
.LBI214:
	.loc 1 53 6 view .LVU535
	.loc 1 54 5 view .LVU536
.LBB219:
.LBI215:
	.loc 1 53 6 view .LVU537
.LBB217:
	.loc 1 55 27 view .LVU538
	beq	.L221		@,
	adds	r2, r3, #2	@ tmp161, _34,
	.loc 1 55 27 is_stmt 0 view .LVU539
	add	r2, r5, r2, lsl #2	@ ivtmp.235, res, tmp161,
	b	.L211		@
.L212:
	.loc 1 55 27 view .LVU540
	cmp	r3, #1	@ _34,
@ ../Core/Src/bigint.c:56:         x->n_limbs--;
	.loc 1 56 19 view .LVU541
	str	r3, [r5]	@ _34, res_18(D)->n_limbs
	.loc 1 55 27 is_stmt 1 view .LVU542
	beq	.L221		@,
.L211:
	.loc 1 56 9 view .LVU543
@ ../Core/Src/bigint.c:55:     while (x->n_limbs > 1 && x->limbs[x->n_limbs - 1] == 0) {
	.loc 1 55 27 is_stmt 0 discriminator 1 view .LVU544
	ldr	r1, [r2, #-4]!	@ MEM[(long unsigned int *)_24], MEM[(long unsigned int *)_24]
	mov	r0, r3	@ i, _34
@ ../Core/Src/bigint.c:55:     while (x->n_limbs > 1 && x->limbs[x->n_limbs - 1] == 0) {
	.loc 1 55 50 discriminator 1 view .LVU545
	subs	r3, r3, #1	@ _34, i,
@ ../Core/Src/bigint.c:55:     while (x->n_limbs > 1 && x->limbs[x->n_limbs - 1] == 0) {
	.loc 1 55 27 discriminator 1 view .LVU546
	cmp	r1, #0	@ MEM[(long unsigned int *)_24]
	beq	.L212	@
.LVL169:
.L210:
	.loc 1 55 27 discriminator 1 view .LVU547
.LBE217:
.LBE219:
.LBE221:
.LBB222:
	.loc 1 252 37 is_stmt 1 discriminator 1 view .LVU548
	cmp	r10, r0	@ _2, i
	bls	.L214		@,
@ ../Core/Src/bigint.c:252:     for (size_t i = res->n_limbs; i < res->capacity; i++) res->limbs[i] = 0;
	.loc 1 252 73 is_stmt 0 discriminator 3 view .LVU549
	sub	r2, r10, r0	@ tmp164, _2, i
	adds	r0, r0, #2	@ tmp166, i,
.LVL170:
	.loc 1 252 73 discriminator 3 view .LVU550
	lsls	r2, r2, #2	@, tmp164,
	movs	r1, #0	@,
	add	r0, r5, r0, lsl #2	@, res, tmp166,
.LVL171:
	.loc 1 252 73 discriminator 3 view .LVU551
	bl	memset		@
.LVL172:
.L214:
	.loc 1 252 73 discriminator 3 view .LVU552
.LBE222:
@ ../Core/Src/bigint.c:254:     return 0;
	.loc 1 254 12 view .LVU553
	movs	r0, #0	@ <retval>,
.LVL173:
.L204:
@ ../Core/Src/bigint.c:255: }
	.loc 1 255 1 view .LVU554
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}	@
.LVL174:
.L206:
	.loc 1 249 5 is_stmt 1 view .LVU555
@ ../Core/Src/bigint.c:249:     res->n_limbs = n;
	.loc 1 249 18 is_stmt 0 view .LVU556
	str	r3, [r5]	@ _34, res_18(D)->n_limbs
	.loc 1 250 5 is_stmt 1 view .LVU557
.LVL175:
.LBB223:
	.loc 1 53 6 view .LVU558
	.loc 1 54 5 view .LVU559
.LBB220:
	.loc 1 53 6 view .LVU560
.LBB218:
	.loc 1 55 27 view .LVU561
.L221:
	.loc 1 55 27 is_stmt 0 view .LVU562
	mov	r0, r3	@ i, _34
	b	.L210		@
.LVL176:
.L220:
	.loc 1 55 27 view .LVU563
.LBE218:
.LBE220:
.LBE223:
@ ../Core/Src/bigint.c:231:     if (!res || !a || !b) return -1;
	.loc 1 231 34 discriminator 5 view .LVU564
	mov	r0, #-1	@ <retval>,
	b	.L204		@
.LVL177:
.L216:
	.cfi_def_cfa_offset 0
	.cfi_restore 4
	.cfi_restore 5
	.cfi_restore 6
	.cfi_restore 7
	.cfi_restore 8
	.cfi_restore 9
	.cfi_restore 10
	.cfi_restore 14
	.loc 1 231 34 discriminator 5 view .LVU565
	mov	r0, #-1	@ <retval>,
.LVL178:
@ ../Core/Src/bigint.c:255: }
	.loc 1 255 1 view .LVU566
	bx	lr	@
	.cfi_endproc
.LFE11:
	.size	bigint_sub, .-bigint_sub
	.section	.text.bigint_mul,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	bigint_mul
	.syntax unified
	.thumb
	.thumb_func
	.type	bigint_mul, %function
bigint_mul:
.LVL179:
.LFB12:
	.loc 1 257 63 is_stmt 1 view -0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 1 258 5 view .LVU568
@ ../Core/Src/bigint.c:258:     if (!res || !a || !b) return -1;
	.loc 1 258 8 is_stmt 0 view .LVU569
	cmp	r0, #0	@ res
	beq	.L238	@
@ ../Core/Src/bigint.c:257: int bigint_mul(bigint *res, const bigint *a, const bigint *b) {
	.loc 1 257 63 view .LVU570
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}	@
	.cfi_def_cfa_offset 36
	.cfi_offset 4, -36
	.cfi_offset 5, -32
	.cfi_offset 6, -28
	.cfi_offset 7, -24
	.cfi_offset 8, -20
	.cfi_offset 9, -16
	.cfi_offset 10, -12
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	mov	r10, r1	@ a, tmp222
	sub	sp, sp, #28	@,,
	.cfi_def_cfa_offset 64
@ ../Core/Src/bigint.c:258:     if (!res || !a || !b) return -1;
	.loc 1 258 14 discriminator 2 view .LVU571
	cmp	r1, #0	@ a
	beq	.L243	@
	mov	r7, r2	@ b, tmp223
@ ../Core/Src/bigint.c:258:     if (!res || !a || !b) return -1;
	.loc 1 258 20 discriminator 4 view .LVU572
	cmp	r2, #0	@ b
	beq	.L243	@
@ ../Core/Src/bigint.c:261:     if (res == a || res == b) return -1;
	.loc 1 261 8 view .LVU573
	cmp	r0, r1	@ res, a
	mov	r4, r0	@ res, tmp221
	.loc 1 261 5 is_stmt 1 view .LVU574
@ ../Core/Src/bigint.c:261:     if (res == a || res == b) return -1;
	.loc 1 261 8 is_stmt 0 view .LVU575
	beq	.L243		@,
@ ../Core/Src/bigint.c:261:     if (res == a || res == b) return -1;
	.loc 1 261 18 discriminator 2 view .LVU576
	cmp	r0, r2	@ res, b
	beq	.L243		@,
	.loc 1 263 5 is_stmt 1 view .LVU577
@ ../Core/Src/bigint.c:264:     size_t nb = b->n_limbs;
	.loc 1 264 12 is_stmt 0 view .LVU578
	ldr	r5, [r2]	@ nb, b_24(D)->n_limbs
@ ../Core/Src/bigint.c:263:     size_t na = a->n_limbs;
	.loc 1 263 12 view .LVU579
	ldr	fp, [r1]	@ na, a_23(D)->n_limbs
.LVL180:
	.loc 1 264 5 is_stmt 1 view .LVU580
	.loc 1 266 5 view .LVU581
@ ../Core/Src/bigint.c:266:     if (res->capacity < na + nb) return -1;
	.loc 1 266 12 is_stmt 0 view .LVU582
	ldr	r2, [r0, #4]	@ _1, res_22(D)->capacity
.LVL181:
@ ../Core/Src/bigint.c:266:     if (res->capacity < na + nb) return -1;
	.loc 1 266 28 view .LVU583
	add	r3, fp, r5	@ _2, na, nb
@ ../Core/Src/bigint.c:266:     if (res->capacity < na + nb) return -1;
	.loc 1 266 8 view .LVU584
	cmp	r2, r3	@ _1, _2
@ ../Core/Src/bigint.c:266:     if (res->capacity < na + nb) return -1;
	.loc 1 266 28 view .LVU585
	str	r3, [sp, #20]	@ _2, %sfp
@ ../Core/Src/bigint.c:266:     if (res->capacity < na + nb) return -1;
	.loc 1 266 8 view .LVU586
	bcc	.L243		@,
	.loc 1 268 5 is_stmt 1 view .LVU587
	lsls	r2, r2, #2	@, _1,
	movs	r1, #0	@,
.LVL182:
	.loc 1 268 5 is_stmt 0 view .LVU588
	adds	r0, r0, #8	@, res,
.LVL183:
	.loc 1 268 5 view .LVU589
	bl	memset		@
.LVL184:
	.loc 1 270 5 is_stmt 1 view .LVU590
.LBB232:
	.loc 1 270 10 view .LVU591
	.loc 1 270 26 discriminator 1 view .LVU592
	cmp	fp, #0	@ na
	beq	.L235	@
	adds	r2, r5, #1	@ nb, nb,
	rsb	r3, r5, r5, lsl #30	@ tmp176, nb, nb,
.LBB233:
@ ../Core/Src/bigint.c:272:         uint64_t av = (uint64_t)a->limbs[i];
	.loc 1 272 18 is_stmt 0 view .LVU593
	ldr	r6, [r10, #8]	@ av, MEM[(long unsigned int *)_86]
	lsls	r3, r3, #2	@ tmp177, tmp176,
	.loc 1 271 9 is_stmt 1 view .LVU594
.LVL185:
	.loc 1 272 9 view .LVU595
@ ../Core/Src/bigint.c:272:         uint64_t av = (uint64_t)a->limbs[i];
	.loc 1 272 41 is_stmt 0 view .LVU596
	add	r10, r10, #8	@ ivtmp.281, a,
.LVL186:
	.loc 1 272 41 view .LVU597
	add	r0, r4, r2, lsl #2	@ ivtmp.285, res, nb,
@ ../Core/Src/bigint.c:272:         uint64_t av = (uint64_t)a->limbs[i];
	.loc 1 272 18 view .LVU598
	mov	r8, #0	@ av,
.LVL187:
	.loc 1 274 9 is_stmt 1 view .LVU599
.LBB234:
	.loc 1 274 14 view .LVU600
	.loc 1 274 30 discriminator 1 view .LVU601
	cbz	r5, .L233	@ nb,
	adds	r1, r7, #4	@ ivtmp.274, b,
	strd	r10, fp, [sp, #12]	@ ivtmp.281, na,,
	mov	fp, r3	@ tmp177, tmp177
.LVL188:
	.loc 1 274 30 is_stmt 0 discriminator 1 view .LVU602
	mov	r3, r1	@ ivtmp.274, ivtmp.274
	mov	r9, r8	@ i, av
	mov	r1, r4	@ res, res
	mov	r4, r3	@ ivtmp.274, ivtmp.274
.LVL189:
.L236:
@ ../Core/Src/bigint.c:274:         for (size_t j = 0; j < nb; j++) {
	.loc 1 274 21 view .LVU603
	movs	r7, #0	@ j,
.LBE234:
@ ../Core/Src/bigint.c:271:         uint64_t carry = 0;
	.loc 1 271 18 view .LVU604
	strd	r9, r0, [sp, #4]	@ i, ivtmp.285,,
	add	ip, fp, r0	@ ivtmp.270, tmp177, ivtmp.285
	mov	lr, r4	@ ivtmp.274, ivtmp.274
	mov	r2, r7	@ carry, j
	mov	r10, r1	@ res, res
	mov	r9, r6	@ av, av
.LVL190:
.L234:
.LBB238:
.LBB235:
	.loc 1 275 13 is_stmt 1 view .LVU605
	.loc 1 277 13 view .LVU606
	.loc 1 278 13 view .LVU607
@ ../Core/Src/bigint.c:278:             uint64_t prod = av * (uint64_t)b->limbs[j] + cur + carry;
	.loc 1 278 34 is_stmt 0 view .LVU608
	ldr	r6, [lr, #4]!	@ MEM[(long unsigned int *)_75], MEM[(long unsigned int *)_75]
@ ../Core/Src/bigint.c:277:             uint64_t cur  = (uint64_t)res->limbs[k];
	.loc 1 277 22 view .LVU609
	ldr	r1, [ip, #4]!	@ MEM[(long unsigned int *)_73], MEM[(long unsigned int *)_73]
.LVL191:
@ ../Core/Src/bigint.c:278:             uint64_t prod = av * (uint64_t)b->limbs[j] + cur + carry;
	.loc 1 278 32 view .LVU610
	umull	r3, r0, r6, r9	@ tmp209, tmp210, MEM[(long unsigned int *)_75], av
@ ../Core/Src/bigint.c:278:             uint64_t prod = av * (uint64_t)b->limbs[j] + cur + carry;
	.loc 1 278 56 view .LVU611
	adds	r3, r3, r1	@ tmp213, tmp209, MEM[(long unsigned int *)_73]
@ ../Core/Src/bigint.c:278:             uint64_t prod = av * (uint64_t)b->limbs[j] + cur + carry;
	.loc 1 278 32 view .LVU612
	mla	r0, r6, r8, r0	@ tmp187, MEM[(long unsigned int *)_75], av, tmp210
@ ../Core/Src/bigint.c:278:             uint64_t prod = av * (uint64_t)b->limbs[j] + cur + carry;
	.loc 1 278 56 view .LVU613
	adc	r0, r0, #0	@ tmp214, tmp187
.LBE235:
@ ../Core/Src/bigint.c:274:         for (size_t j = 0; j < nb; j++) {
	.loc 1 274 37 discriminator 3 view .LVU614
	adds	r7, r7, #1	@ j, j,
.LVL192:
.LBB236:
@ ../Core/Src/bigint.c:278:             uint64_t prod = av * (uint64_t)b->limbs[j] + cur + carry;
	.loc 1 278 22 view .LVU615
	adds	r3, r3, r2	@ prod, tmp213, carry
.LVL193:
	.loc 1 280 13 is_stmt 1 view .LVU616
@ ../Core/Src/bigint.c:281:             carry = prod >> 32;
	.loc 1 281 19 is_stmt 0 view .LVU617
	adc	r2, r0, #0	@ carry, tmp214
.LVL194:
	.loc 1 281 19 view .LVU618
.LBE236:
@ ../Core/Src/bigint.c:274:         for (size_t j = 0; j < nb; j++) {
	.loc 1 274 30 discriminator 1 view .LVU619
	cmp	r5, r7	@ nb, j
.LBB237:
@ ../Core/Src/bigint.c:280:             res->limbs[k] = (uint32_t)prod;
	.loc 1 280 29 view .LVU620
	str	r3, [ip]	@ prod, MEM[(long unsigned int *)_73]
.LVL195:
	.loc 1 281 13 is_stmt 1 view .LVU621
	.loc 1 281 13 is_stmt 0 view .LVU622
.LBE237:
	.loc 1 274 37 is_stmt 1 discriminator 3 view .LVU623
	.loc 1 274 30 discriminator 1 view .LVU624
	bne	.L234		@,
.LBE238:
.LBE233:
@ ../Core/Src/bigint.c:270:     for (size_t i = 0; i < na; i++) {
	.loc 1 270 33 is_stmt 0 discriminator 2 view .LVU625
	ldrd	r9, r0, [sp, #4]	@ i, ivtmp.285,,
@ ../Core/Src/bigint.c:270:     for (size_t i = 0; i < na; i++) {
	.loc 1 270 26 discriminator 1 view .LVU626
	ldr	r3, [sp, #16]	@ na, %sfp
.LVL196:
.LBB240:
@ ../Core/Src/bigint.c:284:         res->limbs[i + nb] = (uint32_t)carry;
	.loc 1 284 30 view .LVU627
	str	r2, [r0, #4]!	@ carry, MEM[(long unsigned int *)_57]
.LVL197:
	.loc 1 284 30 view .LVU628
.LBE240:
@ ../Core/Src/bigint.c:270:     for (size_t i = 0; i < na; i++) {
	.loc 1 270 33 discriminator 2 view .LVU629
	add	r9, r9, #1	@ i, i,
@ ../Core/Src/bigint.c:270:     for (size_t i = 0; i < na; i++) {
	.loc 1 270 26 discriminator 1 view .LVU630
	cmp	r3, r9	@ na, i
@ ../Core/Src/bigint.c:270:     for (size_t i = 0; i < na; i++) {
	.loc 1 270 33 discriminator 2 view .LVU631
	mov	r1, r10	@ res, res
.LVL198:
.LBB241:
	.loc 1 284 9 is_stmt 1 view .LVU632
.LBE241:
	.loc 1 270 33 discriminator 2 view .LVU633
	.loc 1 270 26 discriminator 1 view .LVU634
	beq	.L252		@,
.LVL199:
.LBB242:
	.loc 1 271 9 view .LVU635
	.loc 1 272 9 view .LVU636
@ ../Core/Src/bigint.c:272:         uint64_t av = (uint64_t)a->limbs[i];
	.loc 1 272 18 is_stmt 0 view .LVU637
	ldr	r3, [sp, #12]	@ ivtmp.281, %sfp
	ldr	r6, [r3, #4]!	@ av, MEM[(long unsigned int *)_33]
	.loc 1 272 18 view .LVU638
	str	r3, [sp, #12]	@ ivtmp.281, %sfp
	mov	r8, #0	@ av,
.LVL200:
	.loc 1 274 9 is_stmt 1 view .LVU639
.LBB239:
	.loc 1 274 14 view .LVU640
	.loc 1 274 30 discriminator 1 view .LVU641
	b	.L236		@
.LVL201:
.L258:
	.loc 1 274 30 is_stmt 0 discriminator 1 view .LVU642
	adds	r2, r2, #1	@ nb, nb,
.LVL202:
.L233:
	.loc 1 274 30 discriminator 1 view .LVU643
.LBE239:
	.loc 1 284 9 is_stmt 1 view .LVU644
.LBE242:
@ ../Core/Src/bigint.c:270:     for (size_t i = 0; i < na; i++) {
	.loc 1 270 26 is_stmt 0 discriminator 1 view .LVU645
	cmp	fp, r2	@ na, nb
.LBB243:
@ ../Core/Src/bigint.c:284:         res->limbs[i + nb] = (uint32_t)carry;
	.loc 1 284 28 view .LVU646
	str	r5, [r0, #4]!	@ nb, MEM[(long unsigned int *)_87]
.LBE243:
	.loc 1 270 33 is_stmt 1 discriminator 2 view .LVU647
.LVL203:
	.loc 1 270 26 discriminator 1 view .LVU648
	bne	.L258		@,
.LVL204:
.L235:
	.loc 1 270 26 is_stmt 0 discriminator 1 view .LVU649
.LBE232:
	.loc 1 287 5 is_stmt 1 view .LVU650
@ ../Core/Src/bigint.c:287:     res->n_limbs = na + nb;
	.loc 1 287 18 is_stmt 0 view .LVU651
	ldr	r3, [sp, #20]	@ _2, %sfp
	str	r3, [r4]	@ _2, res_22(D)->n_limbs
	.loc 1 288 5 is_stmt 1 view .LVU652
.LVL205:
.LBB244:
.LBI244:
	.loc 1 53 6 view .LVU653
	.loc 1 54 5 view .LVU654
.LBB245:
.LBI245:
	.loc 1 53 6 view .LVU655
.LBB246:
	.loc 1 55 27 view .LVU656
	cmp	r3, #1	@ _2,
	bls	.L231		@,
	adds	r2, r3, #2	@ tmp170, _2,
	subs	r7, r3, #1	@ ivtmp.258, _2,
	add	r2, r4, r2, lsl #2	@ ivtmp.264, res, tmp170,
	b	.L232		@
.L237:
@ ../Core/Src/bigint.c:56:         x->n_limbs--;
	.loc 1 56 19 is_stmt 0 view .LVU657
	str	r7, [r4]	@ ivtmp.258, res_22(D)->n_limbs
	.loc 1 55 27 is_stmt 1 view .LVU658
	subs	r7, r7, #1	@ ivtmp.258, ivtmp.258,
	beq	.L231		@,
.L232:
	.loc 1 56 9 view .LVU659
@ ../Core/Src/bigint.c:55:     while (x->n_limbs > 1 && x->limbs[x->n_limbs - 1] == 0) {
	.loc 1 55 27 is_stmt 0 discriminator 1 view .LVU660
	ldr	r3, [r2, #-4]!	@ MEM[(long unsigned int *)_39], MEM[(long unsigned int *)_39]
	cmp	r3, #0	@ MEM[(long unsigned int *)_39]
	beq	.L237	@
.L231:
.LBE246:
.LBE245:
.LBE244:
@ ../Core/Src/bigint.c:290:     return 0;
	.loc 1 290 12 view .LVU661
	movs	r0, #0	@ <retval>,
.LVL206:
.L228:
@ ../Core/Src/bigint.c:291: }
	.loc 1 291 1 view .LVU662
	add	sp, sp, #28	@,,
	.cfi_remember_state
	.cfi_def_cfa_offset 36
	@ sp needed	@
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}	@
.LVL207:
.L252:
	.cfi_restore_state
	.loc 1 291 1 view .LVU663
	mov	r4, r1	@ res, res
	b	.L235		@
.LVL208:
.L243:
@ ../Core/Src/bigint.c:258:     if (!res || !a || !b) return -1;
	.loc 1 258 34 discriminator 5 view .LVU664
	mov	r0, #-1	@ <retval>,
.LVL209:
	.loc 1 258 34 discriminator 5 view .LVU665
	b	.L228		@
.LVL210:
.L238:
	.cfi_def_cfa_offset 0
	.cfi_restore 4
	.cfi_restore 5
	.cfi_restore 6
	.cfi_restore 7
	.cfi_restore 8
	.cfi_restore 9
	.cfi_restore 10
	.cfi_restore 11
	.cfi_restore 14
	.loc 1 258 34 discriminator 5 view .LVU666
	mov	r0, #-1	@ <retval>,
.LVL211:
@ ../Core/Src/bigint.c:291: }
	.loc 1 291 1 view .LVU667
	bx	lr	@
	.cfi_endproc
.LFE12:
	.size	bigint_mul, .-bigint_mul
	.section	.text.bigint_shl1,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	bigint_shl1
	.syntax unified
	.thumb
	.thumb_func
	.type	bigint_shl1, %function
bigint_shl1:
.LVL212:
.LFB13:
	.loc 1 297 28 is_stmt 1 view -0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 1 298 5 view .LVU669
@ ../Core/Src/bigint.c:298:     if (!x) return -1;
	.loc 1 298 8 is_stmt 0 view .LVU670
	cbz	r0, .L278	@ x,
.LVL213:
.LBB247:
	.loc 1 301 26 is_stmt 1 discriminator 1 view .LVU671
.LBE247:
@ ../Core/Src/bigint.c:297: int bigint_shl1(bigint *x) {
	.loc 1 297 28 is_stmt 0 view .LVU672
	push	{r4, lr}	@
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 14, -4
.LBB251:
@ ../Core/Src/bigint.c:301:     for (size_t i = 0; i < x->n_limbs; i++) {
	.loc 1 301 29 discriminator 1 view .LVU673
	ldr	r4, [r0]	@ _18, x_17(D)->n_limbs
@ ../Core/Src/bigint.c:301:     for (size_t i = 0; i < x->n_limbs; i++) {
	.loc 1 301 26 discriminator 1 view .LVU674
	cbz	r4, .L266	@ _18,
@ ../Core/Src/bigint.c:301:     for (size_t i = 0; i < x->n_limbs; i++) {
	.loc 1 301 17 view .LVU675
	movs	r1, #0	@ i,
	add	ip, r0, #4	@ ivtmp.298, x,
.LBE251:
@ ../Core/Src/bigint.c:300:     uint32_t carry = 0;
	.loc 1 300 14 view .LVU676
	mov	r2, r1	@ carry, i
.LBB252:
.LBB248:
@ ../Core/Src/bigint.c:302:         uint64_t v = ((uint64_t)x->limbs[i] << 1) | (uint64_t)carry;
	.loc 1 302 23 view .LVU677
	mov	lr, r1	@ tmp133, i
.LVL214:
.L263:
	.loc 1 302 9 is_stmt 1 view .LVU678
@ ../Core/Src/bigint.c:302:         uint64_t v = ((uint64_t)x->limbs[i] << 1) | (uint64_t)carry;
	.loc 1 302 23 is_stmt 0 view .LVU679
	ldr	r3, [ip, #4]!	@ MEM[(long unsigned int *)_12], MEM[(long unsigned int *)_12]
.LBE248:
@ ../Core/Src/bigint.c:301:     for (size_t i = 0; i < x->n_limbs; i++) {
	.loc 1 301 41 discriminator 3 view .LVU680
	adds	r1, r1, #1	@ i, i,
.LVL215:
.LBB249:
@ ../Core/Src/bigint.c:302:         uint64_t v = ((uint64_t)x->limbs[i] << 1) | (uint64_t)carry;
	.loc 1 302 45 view .LVU681
	adds	r3, r3, r3	@ tmp150, MEM[(long unsigned int *)_12], MEM[(long unsigned int *)_12]
@ ../Core/Src/bigint.c:302:         uint64_t v = ((uint64_t)x->limbs[i] << 1) | (uint64_t)carry;
	.loc 1 302 18 view .LVU682
	orr	r3, r3, r2	@ v, tmp150, carry
@ ../Core/Src/bigint.c:302:         uint64_t v = ((uint64_t)x->limbs[i] << 1) | (uint64_t)carry;
	.loc 1 302 45 view .LVU683
	adc	r2, lr, lr	@ tmp151, tmp133, tmp133
.LVL216:
	.loc 1 303 9 is_stmt 1 view .LVU684
.LBE249:
@ ../Core/Src/bigint.c:301:     for (size_t i = 0; i < x->n_limbs; i++) {
	.loc 1 301 26 is_stmt 0 discriminator 1 view .LVU685
	cmp	r4, r1	@ _18, i
.LBB250:
@ ../Core/Src/bigint.c:303:         x->limbs[i] = (uint32_t)v;
	.loc 1 303 23 view .LVU686
	str	r3, [ip]	@ v, MEM[(long unsigned int *)_12]
	.loc 1 304 9 is_stmt 1 view .LVU687
.LVL217:
	.loc 1 304 9 is_stmt 0 view .LVU688
.LBE250:
	.loc 1 301 41 is_stmt 1 discriminator 3 view .LVU689
	.loc 1 301 26 discriminator 1 view .LVU690
	bne	.L263		@,
.LBE252:
	.loc 1 307 5 view .LVU691
@ ../Core/Src/bigint.c:307:     if (carry) {
	.loc 1 307 8 is_stmt 0 view .LVU692
	cbz	r2, .L266	@ carry,
	.loc 1 308 9 is_stmt 1 view .LVU693
@ ../Core/Src/bigint.c:308:         if (x->n_limbs >= x->capacity) return -1;
	.loc 1 308 12 is_stmt 0 view .LVU694
	ldr	r3, [r0, #4]	@ x_17(D)->capacity, x_17(D)->capacity
.LVL218:
	.loc 1 308 12 view .LVU695
	cmp	r3, r4	@ x_17(D)->capacity, _18
	bls	.L265		@,
	.loc 1 309 9 is_stmt 1 view .LVU696
@ ../Core/Src/bigint.c:309:         x->limbs[x->n_limbs++] = carry;
	.loc 1 309 32 is_stmt 0 view .LVU697
	adds	r3, r4, #2	@ tmp143, _18,
	movs	r2, #1	@ tmp144,
.LVL219:
@ ../Core/Src/bigint.c:309:         x->limbs[x->n_limbs++] = carry;
	.loc 1 309 28 view .LVU698
	adds	r4, r4, #1	@ tmp142, _18,
	str	r4, [r0]	@ tmp142, x_17(D)->n_limbs
@ ../Core/Src/bigint.c:309:         x->limbs[x->n_limbs++] = carry;
	.loc 1 309 32 view .LVU699
	str	r2, [r0, r3, lsl #2]	@ tmp144, x_17(D)->limbs[_18]
.LVL220:
.L266:
@ ../Core/Src/bigint.c:312:     return 0;
	.loc 1 312 12 view .LVU700
	movs	r0, #0	@ <retval>,
.LVL221:
@ ../Core/Src/bigint.c:313: }
	.loc 1 313 1 view .LVU701
	pop	{r4, pc}	@
.LVL222:
.L265:
@ ../Core/Src/bigint.c:298:     if (!x) return -1;
	.loc 1 298 20 discriminator 1 view .LVU702
	mov	r0, #-1	@ <retval>,
.LVL223:
@ ../Core/Src/bigint.c:313: }
	.loc 1 313 1 view .LVU703
	pop	{r4, pc}	@
.LVL224:
.L278:
	.cfi_def_cfa_offset 0
	.cfi_restore 4
	.cfi_restore 14
@ ../Core/Src/bigint.c:298:     if (!x) return -1;
	.loc 1 298 20 discriminator 1 view .LVU704
	mov	r0, #-1	@ <retval>,
.LVL225:
@ ../Core/Src/bigint.c:313: }
	.loc 1 313 1 view .LVU705
	bx	lr	@
	.cfi_endproc
.LFE13:
	.size	bigint_shl1, .-bigint_shl1
	.section	.text.bigint_shr1,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	bigint_shr1
	.syntax unified
	.thumb
	.thumb_func
	.type	bigint_shr1, %function
bigint_shr1:
.LVL226:
.LFB14:
	.loc 1 315 28 is_stmt 1 view -0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 1 316 5 view .LVU707
@ ../Core/Src/bigint.c:316:     if (!x) return -1;
	.loc 1 316 8 is_stmt 0 view .LVU708
	cbz	r0, .L286	@ x,
	.loc 1 318 5 is_stmt 1 view .LVU709
.LVL227:
	.loc 1 319 5 view .LVU710
.LBB263:
	.loc 1 319 10 view .LVU711
@ ../Core/Src/bigint.c:319:     for (size_t j = x->n_limbs; j > 0; j--) {
	.loc 1 319 17 is_stmt 0 view .LVU712
	ldr	r2, [r0]	@ j, x_8(D)->n_limbs
.LVL228:
	.loc 1 319 35 is_stmt 1 discriminator 1 view .LVU713
	cbz	r2, .L299	@ j,
.LBE263:
@ ../Core/Src/bigint.c:315: int bigint_shr1(bigint *x) {
	.loc 1 315 28 is_stmt 0 view .LVU714
	push	{r4, lr}	@
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 14, -4
	add	lr, r2, #2	@ tmp132, j,
	add	lr, r0, lr, lsl #2	@ ivtmp.313, x, tmp132,
.LBB266:
@ ../Core/Src/bigint.c:319:     for (size_t j = x->n_limbs; j > 0; j--) {
	.loc 1 319 35 discriminator 1 view .LVU715
	mov	ip, lr	@ ivtmp.322, ivtmp.313
@ ../Core/Src/bigint.c:319:     for (size_t j = x->n_limbs; j > 0; j--) {
	.loc 1 319 17 view .LVU716
	mov	r1, r2	@ i, j
.LBE266:
@ ../Core/Src/bigint.c:318:     uint32_t carry = 0;
	.loc 1 318 14 view .LVU717
	movs	r3, #0	@ new_carry,
.LVL229:
.L282:
.LBB267:
.LBB264:
	.loc 1 320 9 is_stmt 1 view .LVU718
	.loc 1 321 9 view .LVU719
@ ../Core/Src/bigint.c:321:         uint32_t limb = x->limbs[i];
	.loc 1 321 18 is_stmt 0 view .LVU720
	ldr	r4, [ip, #-4]!	@ limb, MEM[(long unsigned int *)_40]
.LVL230:
	.loc 1 322 9 is_stmt 1 view .LVU721
.LBE264:
@ ../Core/Src/bigint.c:319:     for (size_t j = x->n_limbs; j > 0; j--) {
	.loc 1 319 35 is_stmt 0 discriminator 1 view .LVU722
	subs	r1, r1, #1	@ i, i,
.LVL231:
.LBB265:
@ ../Core/Src/bigint.c:323:         x->limbs[i] = (limb >> 1) | carry;
	.loc 1 323 35 view .LVU723
	orr	r3, r3, r4, lsr #1	@ tmp135, carry, limb,
.LVL232:
@ ../Core/Src/bigint.c:323:         x->limbs[i] = (limb >> 1) | carry;
	.loc 1 323 21 view .LVU724
	str	r3, [ip]	@ tmp135, MEM[(long unsigned int *)_40]
@ ../Core/Src/bigint.c:322:         uint32_t new_carry = limb << 31;
	.loc 1 322 18 view .LVU725
	lsl	r3, r4, #31	@ new_carry, limb,
.LVL233:
	.loc 1 323 9 is_stmt 1 view .LVU726
	.loc 1 324 9 view .LVU727
	.loc 1 324 9 is_stmt 0 view .LVU728
.LBE265:
	.loc 1 319 41 is_stmt 1 discriminator 3 view .LVU729
	.loc 1 319 35 discriminator 1 view .LVU730
	bne	.L282		@,
.LBE267:
.LBB268:
.LBB269:
.LBB270:
	.loc 1 55 27 view .LVU731
	cmp	r2, #1	@ j,
	beq	.L283		@,
	subs	r3, r2, #1	@ ivtmp.307, j,
.LVL234:
	.loc 1 55 27 is_stmt 0 view .LVU732
	b	.L284		@
.L285:
@ ../Core/Src/bigint.c:56:         x->n_limbs--;
	.loc 1 56 19 view .LVU733
	str	r3, [r0]	@ ivtmp.307, x_8(D)->n_limbs
	.loc 1 55 27 is_stmt 1 view .LVU734
	subs	r3, r3, #1	@ ivtmp.307, ivtmp.307,
	beq	.L283		@,
.L284:
	.loc 1 56 9 view .LVU735
@ ../Core/Src/bigint.c:55:     while (x->n_limbs > 1 && x->limbs[x->n_limbs - 1] == 0) {
	.loc 1 55 27 is_stmt 0 discriminator 1 view .LVU736
	ldr	r2, [lr, #-4]!	@ MEM[(long unsigned int *)_33], MEM[(long unsigned int *)_33]
	cmp	r2, #0	@ MEM[(long unsigned int *)_33]
	beq	.L285	@
.L283:
.LBE270:
.LBE269:
.LBE268:
@ ../Core/Src/bigint.c:328:     return 0;
	.loc 1 328 12 view .LVU737
	movs	r0, #0	@ <retval>,
.LVL235:
@ ../Core/Src/bigint.c:329: }
	.loc 1 329 1 view .LVU738
	pop	{r4, pc}	@
.LVL236:
.L299:
	.cfi_def_cfa_offset 0
	.cfi_restore 4
	.cfi_restore 14
@ ../Core/Src/bigint.c:328:     return 0;
	.loc 1 328 12 view .LVU739
	movs	r0, #0	@ <retval>,
.LVL237:
@ ../Core/Src/bigint.c:329: }
	.loc 1 329 1 view .LVU740
	bx	lr	@
.LVL238:
.L286:
@ ../Core/Src/bigint.c:316:     if (!x) return -1;
	.loc 1 316 20 discriminator 1 view .LVU741
	mov	r0, #-1	@ <retval>,
.LVL239:
	.loc 1 316 20 discriminator 1 view .LVU742
	bx	lr	@
	.cfi_endproc
.LFE14:
	.size	bigint_shr1, .-bigint_shr1
	.section	.text.bigint_mod,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	bigint_mod
	.syntax unified
	.thumb
	.thumb_func
	.type	bigint_mod, %function
bigint_mod:
.LVL240:
.LFB15:
	.loc 1 336 76 is_stmt 1 view -0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 1 337 5 view .LVU744
@ ../Core/Src/bigint.c:336: int bigint_mod(bigint *res, const bigint *a, const bigint *b, bigint *tmp) {
	.loc 1 336 76 is_stmt 0 view .LVU745
	push	{r4, r5, r6, r7, r8, lr}	@
	.cfi_def_cfa_offset 24
	.cfi_offset 4, -24
	.cfi_offset 5, -20
	.cfi_offset 6, -16
	.cfi_offset 7, -12
	.cfi_offset 8, -8
	.cfi_offset 14, -4
@ ../Core/Src/bigint.c:337:     if (!res || !a || !b || !tmp) return -1;
	.loc 1 337 8 view .LVU746
	cmp	r0, #0	@ res
	beq	.L303	@
@ ../Core/Src/bigint.c:337:     if (!res || !a || !b || !tmp) return -1;
	.loc 1 337 14 discriminator 2 view .LVU747
	cmp	r1, #0	@ a
	beq	.L303	@
	mov	r6, r2	@ b, tmp202
@ ../Core/Src/bigint.c:337:     if (!res || !a || !b || !tmp) return -1;
	.loc 1 337 20 discriminator 4 view .LVU748
	cmp	r2, #0	@ b
	beq	.L303	@
	mov	r7, r3	@ tmp, tmp203
@ ../Core/Src/bigint.c:337:     if (!res || !a || !b || !tmp) return -1;
	.loc 1 337 26 discriminator 6 view .LVU749
	cmp	r3, #0	@ tmp
	beq	.L303	@
.LVL241:
.LBB296:
.LBB297:
.LBB298:
	.loc 1 66 26 is_stmt 1 discriminator 1 view .LVU750
@ ../Core/Src/bigint.c:66:     for (size_t i = 0; i < x->n_limbs; i++) {
	.loc 1 66 29 is_stmt 0 discriminator 1 view .LVU751
	ldr	r2, [r2]	@ _82, b_22(D)->n_limbs
.LVL242:
@ ../Core/Src/bigint.c:66:     for (size_t i = 0; i < x->n_limbs; i++) {
	.loc 1 66 26 discriminator 1 view .LVU752
	cmp	r2, #0	@ _82
	beq	.L303	@
	mov	r4, r0	@ res, tmp200
@ ../Core/Src/bigint.c:66:     for (size_t i = 0; i < x->n_limbs; i++) {
	.loc 1 66 17 view .LVU753
	movs	r3, #0	@ i,
.LVL243:
	.loc 1 66 17 view .LVU754
	adds	r0, r6, #4	@ ivtmp.390, b,
.LVL244:
	.loc 1 66 17 view .LVU755
	b	.L305		@
.LVL245:
.L372:
@ ../Core/Src/bigint.c:66:     for (size_t i = 0; i < x->n_limbs; i++) {
	.loc 1 66 26 discriminator 1 view .LVU756
	cmp	r3, r2	@ i, _82
	beq	.L303		@,
.LVL246:
.L305:
	.loc 1 67 9 is_stmt 1 view .LVU757
	.loc 1 66 41 discriminator 2 view .LVU758
@ ../Core/Src/bigint.c:67:         if (x->limbs[i] != 0) return 0;
	.loc 1 67 12 is_stmt 0 view .LVU759
	ldr	r5, [r0, #4]!	@ MEM[(long unsigned int *)_131], MEM[(long unsigned int *)_131]
@ ../Core/Src/bigint.c:66:     for (size_t i = 0; i < x->n_limbs; i++) {
	.loc 1 66 41 discriminator 2 view .LVU760
	adds	r3, r3, #1	@ i, i,
.LVL247:
	.loc 1 66 26 is_stmt 1 discriminator 1 view .LVU761
@ ../Core/Src/bigint.c:67:         if (x->limbs[i] != 0) return 0;
	.loc 1 67 12 is_stmt 0 view .LVU762
	cmp	r5, #0	@ MEM[(long unsigned int *)_131]
	beq	.L372	@
.LVL248:
	.loc 1 67 12 view .LVU763
.LBE298:
.LBE297:
.LBE296:
	.loc 1 339 5 is_stmt 1 view .LVU764
@ ../Core/Src/bigint.c:339:     if (res == tmp) return -1;
	.loc 1 339 8 is_stmt 0 view .LVU765
	cmp	r4, r7	@ res, tmp
	beq	.L303		@,
	.loc 1 342 5 is_stmt 1 view .LVU766
@ ../Core/Src/bigint.c:342:     if (tmp->capacity < res->capacity) return -1;
	.loc 1 342 8 is_stmt 0 view .LVU767
	ldr	r2, [r7, #4]	@ tmp_23(D)->capacity, tmp_23(D)->capacity
	ldr	r3, [r4, #4]	@ res_20(D)->capacity, res_20(D)->capacity
	cmp	r2, r3	@ tmp_23(D)->capacity, res_20(D)->capacity
	bcc	.L303		@,
	.loc 1 345 5 is_stmt 1 view .LVU768
@ ../Core/Src/bigint.c:345:     if (bigint_copy(res, a) != 0) return -1;
	.loc 1 345 9 is_stmt 0 view .LVU769
	mov	r0, r4	@, res
	bl	bigint_copy		@
.LVL249:
@ ../Core/Src/bigint.c:345:     if (bigint_copy(res, a) != 0) return -1;
	.loc 1 345 8 discriminator 1 view .LVU770
	cmp	r0, #0	@ tmp204
	bne	.L303	@
.LBB299:
.LBB300:
.LBB301:
	.loc 1 55 27 is_stmt 1 view .LVU771
@ ../Core/Src/bigint.c:55:     while (x->n_limbs > 1 && x->limbs[x->n_limbs - 1] == 0) {
	.loc 1 55 13 is_stmt 0 view .LVU772
	ldr	r0, [r4]	@ _80, res_20(D)->n_limbs
@ ../Core/Src/bigint.c:55:     while (x->n_limbs > 1 && x->limbs[x->n_limbs - 1] == 0) {
	.loc 1 55 27 view .LVU773
	cmp	r0, #1	@ _80,
	bls	.L306		@,
	subs	r3, r0, #1	@ ivtmp.378, _80,
	adds	r0, r0, #2	@ tmp178, _80,
	add	r0, r4, r0, lsl #2	@ ivtmp.384, res, tmp178,
	b	.L307		@
.L309:
@ ../Core/Src/bigint.c:56:         x->n_limbs--;
	.loc 1 56 19 view .LVU774
	str	r3, [r4]	@ ivtmp.378, res_20(D)->n_limbs
	.loc 1 55 27 is_stmt 1 view .LVU775
	subs	r3, r3, #1	@ ivtmp.378, ivtmp.378,
	beq	.L306		@,
.L307:
	.loc 1 56 9 view .LVU776
@ ../Core/Src/bigint.c:55:     while (x->n_limbs > 1 && x->limbs[x->n_limbs - 1] == 0) {
	.loc 1 55 27 is_stmt 0 discriminator 1 view .LVU777
	ldr	r2, [r0, #-4]!	@ MEM[(long unsigned int *)_126], MEM[(long unsigned int *)_126]
	cmp	r2, #0	@ MEM[(long unsigned int *)_126]
	beq	.L309	@
.L306:
.LBE301:
.LBE300:
.LBE299:
	.loc 1 349 5 is_stmt 1 view .LVU778
@ ../Core/Src/bigint.c:349:     if (bigint_copy(tmp, b) != 0) return -1;
	.loc 1 349 9 is_stmt 0 view .LVU779
	mov	r1, r6	@, b
	mov	r0, r7	@, tmp
	bl	bigint_copy		@
.LVL250:
@ ../Core/Src/bigint.c:349:     if (bigint_copy(tmp, b) != 0) return -1;
	.loc 1 349 8 discriminator 1 view .LVU780
	mov	r8, r0	@ <retval>, tmp205
	cmp	r0, #0	@ <retval>
	bne	.L303	@
.LBB302:
.LBB303:
.LBB304:
	.loc 1 55 27 is_stmt 1 view .LVU781
@ ../Core/Src/bigint.c:55:     while (x->n_limbs > 1 && x->limbs[x->n_limbs - 1] == 0) {
	.loc 1 55 13 is_stmt 0 view .LVU782
	ldr	r2, [r7]	@ _39, tmp_23(D)->n_limbs
@ ../Core/Src/bigint.c:55:     while (x->n_limbs > 1 && x->limbs[x->n_limbs - 1] == 0) {
	.loc 1 55 27 view .LVU783
	cmp	r2, #1	@ _39,
	bls	.L310		@,
	subs	r3, r2, #1	@ ivtmp.369, _39,
	adds	r2, r2, #2	@ tmp181, _39,
	add	r2, r7, r2, lsl #2	@ ivtmp.375, tmp, tmp181,
	b	.L311		@
.L314:
@ ../Core/Src/bigint.c:56:         x->n_limbs--;
	.loc 1 56 19 view .LVU784
	str	r3, [r7]	@ ivtmp.369, tmp_23(D)->n_limbs
	.loc 1 55 27 is_stmt 1 view .LVU785
	subs	r3, r3, #1	@ ivtmp.369, ivtmp.369,
	beq	.L310		@,
.L311:
	.loc 1 56 9 view .LVU786
@ ../Core/Src/bigint.c:55:     while (x->n_limbs > 1 && x->limbs[x->n_limbs - 1] == 0) {
	.loc 1 55 27 is_stmt 0 discriminator 1 view .LVU787
	ldr	r1, [r2, #-4]!	@ MEM[(long unsigned int *)_116], MEM[(long unsigned int *)_116]
	cmp	r1, #0	@ MEM[(long unsigned int *)_116]
	beq	.L314	@
.L310:
.LBE304:
.LBE303:
.LBE302:
	.loc 1 352 5 is_stmt 1 view .LVU788
@ ../Core/Src/bigint.c:352:     if (bigint_cmp(res, tmp) < 0) {
	.loc 1 352 9 is_stmt 0 view .LVU789
	mov	r1, r7	@, tmp
	mov	r0, r4	@, res
	bl	bigint_cmp		@
.LVL251:
@ ../Core/Src/bigint.c:352:     if (bigint_cmp(res, tmp) < 0) {
	.loc 1 352 8 discriminator 1 view .LVU790
	cmp	r0, #0	@ tmp206,
	blt	.L300		@,
@ ../Core/Src/bigint.c:357:     size_t k = 0;
	.loc 1 357 12 view .LVU791
	movs	r5, #0	@ k,
	b	.L313		@
.LVL252:
.L315:
@ ../Core/Src/bigint.c:359:         if (bigint_shl1(tmp) != 0) return -1;
	.loc 1 359 13 view .LVU792
	bl	bigint_shl1		@
.LVL253:
	.loc 1 360 9 is_stmt 1 view .LVU793
@ ../Core/Src/bigint.c:359:         if (bigint_shl1(tmp) != 0) return -1;
	.loc 1 359 12 is_stmt 0 discriminator 1 view .LVU794
	cmp	r0, #0	@ tmp207
	bne	.L303	@
@ ../Core/Src/bigint.c:360:         k++;
	.loc 1 360 10 view .LVU795
	adds	r5, r5, #1	@ k, k,
.LVL254:
.L313:
	.loc 1 358 33 is_stmt 1 view .LVU796
@ ../Core/Src/bigint.c:358:     while (bigint_cmp(tmp, res) <= 0) {
	.loc 1 358 12 is_stmt 0 view .LVU797
	mov	r1, r4	@, res
	mov	r0, r7	@, tmp
	bl	bigint_cmp		@
.LVL255:
	.loc 1 359 9 is_stmt 1 view .LVU798
@ ../Core/Src/bigint.c:358:     while (bigint_cmp(tmp, res) <= 0) {
	.loc 1 358 33 is_stmt 0 discriminator 1 view .LVU799
	cmp	r0, #0	@ tmp208,
@ ../Core/Src/bigint.c:359:         if (bigint_shl1(tmp) != 0) return -1;
	.loc 1 359 13 view .LVU800
	mov	r0, r7	@, tmp
@ ../Core/Src/bigint.c:358:     while (bigint_cmp(tmp, res) <= 0) {
	.loc 1 358 33 discriminator 1 view .LVU801
	ble	.L315		@,
.LVL256:
	.loc 1 364 5 is_stmt 1 view .LVU802
@ ../Core/Src/bigint.c:364:     if (bigint_shr1(tmp) != 0) return -1;
	.loc 1 364 9 is_stmt 0 view .LVU803
	bl	bigint_shr1		@
.LVL257:
@ ../Core/Src/bigint.c:364:     if (bigint_shr1(tmp) != 0) return -1;
	.loc 1 364 8 discriminator 1 view .LVU804
	cbnz	r0, .L303	@ tmp209,
	.loc 1 365 5 is_stmt 1 view .LVU805
@ ../Core/Src/bigint.c:365:     if (k > 0) k--;
	.loc 1 365 8 is_stmt 0 view .LVU806
	cbz	r5, .L317	@ k,
	.loc 1 365 16 is_stmt 1 discriminator 1 view .LVU807
@ ../Core/Src/bigint.c:365:     if (k > 0) k--;
	.loc 1 365 17 is_stmt 0 discriminator 1 view .LVU808
	subs	r5, r5, #1	@ k, k,
.LVL258:
.L317:
	.loc 1 367 5 is_stmt 1 view .LVU809
	.loc 1 368 9 view .LVU810
@ ../Core/Src/bigint.c:368:         if (bigint_cmp(res, tmp) >= 0) {
	.loc 1 368 13 is_stmt 0 view .LVU811
	mov	r1, r7	@, tmp
	mov	r0, r4	@, res
	bl	bigint_cmp		@
.LVL259:
@ ../Core/Src/bigint.c:368:         if (bigint_cmp(res, tmp) >= 0) {
	.loc 1 368 12 discriminator 1 view .LVU812
	cmp	r0, #0	@ tmp210,
	bge	.L318		@,
.L321:
	.loc 1 372 9 is_stmt 1 view .LVU813
@ ../Core/Src/bigint.c:372:         if (k == 0) break;
	.loc 1 372 12 is_stmt 0 view .LVU814
	cbz	r5, .L373	@ k,
	.loc 1 373 9 is_stmt 1 view .LVU815
.LBB305:
.LBB306:
.LBB307:
@ ../Core/Src/bigint.c:319:     for (size_t j = x->n_limbs; j > 0; j--) {
	.loc 1 319 17 is_stmt 0 view .LVU816
	ldr	r3, [r7]	@ j, tmp_23(D)->n_limbs
.LBE307:
.LBE306:
.LBE305:
@ ../Core/Src/bigint.c:373:         k--;
	.loc 1 373 10 view .LVU817
	subs	r5, r5, #1	@ k, k,
.LVL260:
	.loc 1 375 9 is_stmt 1 view .LVU818
.LBB316:
.LBI305:
	.loc 1 315 5 view .LVU819
.LBB315:
	.loc 1 316 5 view .LVU820
	.loc 1 318 5 view .LVU821
	.loc 1 319 5 view .LVU822
.LBB310:
	.loc 1 319 10 view .LVU823
	.loc 1 319 35 discriminator 1 view .LVU824
	cmp	r3, #0	@ j
	beq	.L317	@
	add	lr, r3, #2	@ tmp186, j,
	add	lr, r7, lr, lsl #2	@ ivtmp.349, tmp, tmp186,
	mov	r2, lr	@ ivtmp.358, ivtmp.349
@ ../Core/Src/bigint.c:319:     for (size_t j = x->n_limbs; j > 0; j--) {
	.loc 1 319 17 is_stmt 0 view .LVU825
	mov	r0, r3	@ i, j
.LBE310:
@ ../Core/Src/bigint.c:318:     uint32_t carry = 0;
	.loc 1 318 14 view .LVU826
	movs	r1, #0	@ new_carry,
.LVL261:
.L324:
.LBB311:
.LBB308:
	.loc 1 320 9 is_stmt 1 view .LVU827
	.loc 1 321 9 view .LVU828
@ ../Core/Src/bigint.c:321:         uint32_t limb = x->limbs[i];
	.loc 1 321 18 is_stmt 0 view .LVU829
	ldr	r6, [r2, #-4]!	@ limb, MEM[(long unsigned int *)_105]
.LVL262:
	.loc 1 322 9 is_stmt 1 view .LVU830
.LBE308:
@ ../Core/Src/bigint.c:319:     for (size_t j = x->n_limbs; j > 0; j--) {
	.loc 1 319 35 is_stmt 0 discriminator 1 view .LVU831
	subs	r0, r0, #1	@ i, i,
.LVL263:
.LBB309:
@ ../Core/Src/bigint.c:323:         x->limbs[i] = (limb >> 1) | carry;
	.loc 1 323 35 view .LVU832
	orr	r1, r1, r6, lsr #1	@ tmp189, carry, limb,
.LVL264:
@ ../Core/Src/bigint.c:323:         x->limbs[i] = (limb >> 1) | carry;
	.loc 1 323 21 view .LVU833
	str	r1, [r2]	@ tmp189, MEM[(long unsigned int *)_105]
@ ../Core/Src/bigint.c:322:         uint32_t new_carry = limb << 31;
	.loc 1 322 18 view .LVU834
	lsl	r1, r6, #31	@ new_carry, limb,
.LVL265:
	.loc 1 323 9 is_stmt 1 view .LVU835
	.loc 1 324 9 view .LVU836
	.loc 1 324 9 is_stmt 0 view .LVU837
.LBE309:
	.loc 1 319 41 is_stmt 1 discriminator 3 view .LVU838
	.loc 1 319 35 discriminator 1 view .LVU839
	bne	.L324		@,
.LBE311:
.LBB312:
.LBB313:
.LBB314:
	.loc 1 55 27 view .LVU840
	cmp	r3, #1	@ j,
	beq	.L317		@,
	subs	r1, r3, #1	@ ivtmp.343, j,
.LVL266:
	.loc 1 55 27 is_stmt 0 view .LVU841
	b	.L325		@
.L326:
@ ../Core/Src/bigint.c:56:         x->n_limbs--;
	.loc 1 56 19 view .LVU842
	str	r1, [r7]	@ ivtmp.343, tmp_23(D)->n_limbs
	.loc 1 55 27 is_stmt 1 view .LVU843
	subs	r1, r1, #1	@ ivtmp.343, ivtmp.343,
	beq	.L317		@,
.L325:
	.loc 1 56 9 view .LVU844
@ ../Core/Src/bigint.c:55:     while (x->n_limbs > 1 && x->limbs[x->n_limbs - 1] == 0) {
	.loc 1 55 27 is_stmt 0 discriminator 1 view .LVU845
	ldr	r3, [lr, #-4]!	@ MEM[(long unsigned int *)_98], MEM[(long unsigned int *)_98]
	cmp	r3, #0	@ MEM[(long unsigned int *)_98]
	beq	.L326	@
.LVL267:
	.loc 1 55 27 discriminator 1 view .LVU846
.LBE314:
.LBE313:
.LBE312:
.LBE315:
.LBE316:
	.loc 1 367 5 is_stmt 1 view .LVU847
	.loc 1 368 9 view .LVU848
@ ../Core/Src/bigint.c:368:         if (bigint_cmp(res, tmp) >= 0) {
	.loc 1 368 13 is_stmt 0 view .LVU849
	mov	r1, r7	@, tmp
	mov	r0, r4	@, res
	bl	bigint_cmp		@
.LVL268:
@ ../Core/Src/bigint.c:368:         if (bigint_cmp(res, tmp) >= 0) {
	.loc 1 368 12 discriminator 1 view .LVU850
	cmp	r0, #0	@ tmp210,
	blt	.L321		@,
.L318:
	.loc 1 369 13 is_stmt 1 view .LVU851
@ ../Core/Src/bigint.c:369:             if (bigint_sub(res, res, tmp) != 0) return -1;
	.loc 1 369 17 is_stmt 0 view .LVU852
	mov	r2, r7	@, tmp
	mov	r1, r4	@, res
	mov	r0, r4	@, res
	bl	bigint_sub		@
.LVL269:
@ ../Core/Src/bigint.c:369:             if (bigint_sub(res, res, tmp) != 0) return -1;
	.loc 1 369 16 discriminator 1 view .LVU853
	cmp	r0, #0	@ tmp211
	beq	.L321	@
.LVL270:
.L303:
@ ../Core/Src/bigint.c:337:     if (!res || !a || !b || !tmp) return -1;
	.loc 1 337 42 discriminator 7 view .LVU854
	mov	r8, #-1	@ <retval>,
.L300:
@ ../Core/Src/bigint.c:380: }
	.loc 1 380 1 view .LVU855
	mov	r0, r8	@, <retval>
	pop	{r4, r5, r6, r7, r8, pc}	@
.LVL271:
.L373:
.LBB317:
.LBB318:
.LBB319:
	.loc 1 55 27 is_stmt 1 view .LVU856
@ ../Core/Src/bigint.c:55:     while (x->n_limbs > 1 && x->limbs[x->n_limbs - 1] == 0) {
	.loc 1 55 13 is_stmt 0 view .LVU857
	ldr	r3, [r4]	@ _60, res_20(D)->n_limbs
@ ../Core/Src/bigint.c:55:     while (x->n_limbs > 1 && x->limbs[x->n_limbs - 1] == 0) {
	.loc 1 55 27 view .LVU858
	cmp	r3, #1	@ _60,
	bls	.L300		@,
	adds	r2, r3, #2	@ tmp184, _60,
	add	r2, r4, r2, lsl #2	@ ivtmp.340, res, tmp184,
	subs	r3, r3, #1	@ ivtmp.334, _60,
	b	.L322		@
.L327:
@ ../Core/Src/bigint.c:56:         x->n_limbs--;
	.loc 1 56 19 view .LVU859
	str	r3, [r4]	@ ivtmp.334, res_20(D)->n_limbs
	.loc 1 55 27 is_stmt 1 view .LVU860
	subs	r3, r3, #1	@ ivtmp.334, ivtmp.334,
	beq	.L300		@,
.L322:
	.loc 1 56 9 view .LVU861
@ ../Core/Src/bigint.c:55:     while (x->n_limbs > 1 && x->limbs[x->n_limbs - 1] == 0) {
	.loc 1 55 27 is_stmt 0 discriminator 1 view .LVU862
	ldr	r1, [r2, #-4]!	@ MEM[(long unsigned int *)_44], MEM[(long unsigned int *)_44]
	cmp	r1, #0	@ MEM[(long unsigned int *)_44]
	beq	.L327	@
	b	.L300		@
.LBE319:
.LBE318:
.LBE317:
	.cfi_endproc
.LFE15:
	.size	bigint_mod, .-bigint_mod
	.section	.rodata.hexdigits.0,"a"
	.align	2
	.type	hexdigits.0, %object
	.size	hexdigits.0, 17
hexdigits.0:
	.ascii	"0123456789abcdef\000"
	.text
.Letext0:
	.file 2 "/Applications/STM32CubeIDE.app/Contents/Eclipse/plugins/com.st.stm32cube.ide.mcu.externaltools.gnu-tools-for-stm32.13.3.rel1.macos64_1.0.0.202411102158/tools/arm-none-eabi/include/machine/_default_types.h"
	.file 3 "/Applications/STM32CubeIDE.app/Contents/Eclipse/plugins/com.st.stm32cube.ide.mcu.externaltools.gnu-tools-for-stm32.13.3.rel1.macos64_1.0.0.202411102158/tools/arm-none-eabi/include/sys/_stdint.h"
	.file 4 "/Applications/STM32CubeIDE.app/Contents/Eclipse/plugins/com.st.stm32cube.ide.mcu.externaltools.gnu-tools-for-stm32.13.3.rel1.macos64_1.0.0.202411102158/tools/lib/gcc/arm-none-eabi/13.3.1/include/stddef.h"
	.file 5 "../Core/Inc/bigint.h"
	.file 6 "/Applications/STM32CubeIDE.app/Contents/Eclipse/plugins/com.st.stm32cube.ide.mcu.externaltools.gnu-tools-for-stm32.13.3.rel1.macos64_1.0.0.202411102158/tools/arm-none-eabi/include/string.h"
	.file 7 "/Applications/STM32CubeIDE.app/Contents/Eclipse/plugins/com.st.stm32cube.ide.mcu.externaltools.gnu-tools-for-stm32.13.3.rel1.macos64_1.0.0.202411102158/tools/arm-none-eabi/include/stdlib.h"
	.file 8 "<built-in>"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x1070
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.uleb128 0x32
	.4byte	.LASF1034
	.byte	0x1d
	.4byte	.LASF1035
	.4byte	.LASF1036
	.4byte	.LLRL125
	.4byte	0
	.4byte	.Ldebug_line0
	.4byte	.Ldebug_macro0
	.uleb128 0x8
	.byte	0x8
	.byte	0x7
	.4byte	.LASF979
	.uleb128 0x8
	.byte	0x4
	.byte	0x7
	.4byte	.LASF980
	.uleb128 0x8
	.byte	0x1
	.byte	0x6
	.4byte	.LASF981
	.uleb128 0x8
	.byte	0x1
	.byte	0x8
	.4byte	.LASF982
	.uleb128 0x8
	.byte	0x2
	.byte	0x5
	.4byte	.LASF983
	.uleb128 0x8
	.byte	0x2
	.byte	0x7
	.4byte	.LASF984
	.uleb128 0x8
	.byte	0x4
	.byte	0x5
	.4byte	.LASF985
	.uleb128 0x10
	.4byte	.LASF988
	.byte	0x2
	.byte	0x4f
	.byte	0x1b
	.4byte	0x67
	.uleb128 0x8
	.byte	0x4
	.byte	0x7
	.4byte	.LASF986
	.uleb128 0x8
	.byte	0x8
	.byte	0x5
	.4byte	.LASF987
	.uleb128 0x10
	.4byte	.LASF989
	.byte	0x2
	.byte	0x69
	.byte	0x20
	.4byte	0x2a
	.uleb128 0x33
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x10
	.4byte	.LASF990
	.byte	0x3
	.byte	0x30
	.byte	0x14
	.4byte	0x5b
	.uleb128 0x10
	.4byte	.LASF991
	.byte	0x3
	.byte	0x3c
	.byte	0x14
	.4byte	0x75
	.uleb128 0x10
	.4byte	.LASF992
	.byte	0x4
	.byte	0xd6
	.byte	0x16
	.4byte	0x31
	.uleb128 0x8
	.byte	0x8
	.byte	0x4
	.4byte	.LASF993
	.uleb128 0x34
	.byte	0x8
	.byte	0x5
	.byte	0xb
	.byte	0x9
	.4byte	0xe1
	.uleb128 0x1e
	.4byte	.LASF994
	.byte	0xc
	.byte	0xc
	.4byte	0xa0
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF995
	.byte	0xd
	.byte	0xc
	.4byte	0xa0
	.byte	0x4
	.uleb128 0x1e
	.4byte	.LASF996
	.byte	0xe
	.byte	0xe
	.4byte	0xe1
	.byte	0x8
	.byte	0
	.uleb128 0x25
	.4byte	0x88
	.4byte	0xf0
	.uleb128 0x35
	.4byte	0x31
	.byte	0
	.uleb128 0x10
	.4byte	.LASF997
	.byte	0x5
	.byte	0xf
	.byte	0x3
	.4byte	0xb3
	.uleb128 0x1f
	.4byte	0xf0
	.uleb128 0x36
	.byte	0x4
	.uleb128 0x13
	.4byte	0x108
	.uleb128 0x8
	.byte	0x1
	.byte	0x8
	.4byte	.LASF507
	.uleb128 0x1f
	.4byte	0x108
	.uleb128 0x13
	.4byte	0x10f
	.uleb128 0x13
	.4byte	0x11e
	.uleb128 0x37
	.uleb128 0x19
	.4byte	.LASF998
	.byte	0x6
	.byte	0x29
	.byte	0x8
	.4byte	0xa0
	.4byte	0x135
	.uleb128 0xc
	.4byte	0x114
	.byte	0
	.uleb128 0x19
	.4byte	.LASF999
	.byte	0x6
	.byte	0x1f
	.byte	0x8
	.4byte	0x101
	.4byte	0x155
	.uleb128 0xc
	.4byte	0x101
	.uleb128 0xc
	.4byte	0x119
	.uleb128 0xc
	.4byte	0xa0
	.byte	0
	.uleb128 0x38
	.4byte	.LASF1024
	.byte	0x7
	.byte	0x5e
	.byte	0x6
	.4byte	0x167
	.uleb128 0xc
	.4byte	0x101
	.byte	0
	.uleb128 0x19
	.4byte	.LASF1000
	.byte	0x6
	.byte	0x21
	.byte	0x8
	.4byte	0x101
	.4byte	0x187
	.uleb128 0xc
	.4byte	0x101
	.uleb128 0xc
	.4byte	0x81
	.uleb128 0xc
	.4byte	0xa0
	.byte	0
	.uleb128 0x19
	.4byte	.LASF1001
	.byte	0x7
	.byte	0x6c
	.byte	0x7
	.4byte	0x101
	.4byte	0x19d
	.uleb128 0xc
	.4byte	0xa0
	.byte	0
	.uleb128 0x20
	.4byte	.LASF1006
	.2byte	0x150
	.4byte	0x81
	.4byte	.LFB15
	.4byte	.LFE15-.LFB15
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x466
	.uleb128 0xe
	.ascii	"res\000"
	.2byte	0x150
	.byte	0x18
	.4byte	0x466
	.4byte	.LLST110
	.4byte	.LVUS110
	.uleb128 0xe
	.ascii	"a\000"
	.2byte	0x150
	.byte	0x2b
	.4byte	0x46b
	.4byte	.LLST111
	.4byte	.LVUS111
	.uleb128 0xe
	.ascii	"b\000"
	.2byte	0x150
	.byte	0x3c
	.4byte	0x46b
	.4byte	.LLST112
	.4byte	.LVUS112
	.uleb128 0xe
	.ascii	"tmp\000"
	.2byte	0x150
	.byte	0x47
	.4byte	0x466
	.4byte	.LLST113
	.4byte	.LVUS113
	.uleb128 0xf
	.ascii	"k\000"
	.2byte	0x165
	.byte	0xc
	.4byte	0xa0
	.4byte	.LLST114
	.4byte	.LVUS114
	.uleb128 0x1a
	.4byte	0xc44
	.4byte	.LBB296
	.4byte	.LBE296-.LBB296
	.2byte	0x152
	.byte	0x9
	.4byte	0x25e
	.uleb128 0x2
	.4byte	0xc52
	.uleb128 0xa
	.4byte	0xc44
	.4byte	.LBB297
	.4byte	.LBE297-.LBB297
	.byte	0x40
	.byte	0x5
	.uleb128 0x2
	.4byte	0xc52
	.uleb128 0x1b
	.4byte	0xc5b
	.4byte	.LBB298
	.4byte	.LBE298-.LBB298
	.uleb128 0x3
	.4byte	0xc5c
	.4byte	.LLST115
	.4byte	.LVUS115
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1a
	.4byte	0xc67
	.4byte	.LBB299
	.4byte	.LBE299-.LBB299
	.2byte	0x15a
	.byte	0x5
	.4byte	0x28d
	.uleb128 0x2
	.4byte	0xc71
	.uleb128 0xa
	.4byte	0xc67
	.4byte	.LBB300
	.4byte	.LBE300-.LBB300
	.byte	0x35
	.byte	0x6
	.uleb128 0x2
	.4byte	0xc71
	.byte	0
	.byte	0
	.uleb128 0x1a
	.4byte	0xc67
	.4byte	.LBB302
	.4byte	.LBE302-.LBB302
	.2byte	0x15e
	.byte	0x5
	.4byte	0x2bc
	.uleb128 0x2
	.4byte	0xc71
	.uleb128 0xa
	.4byte	0xc67
	.4byte	.LBB303
	.4byte	.LBE303-.LBB303
	.byte	0x35
	.byte	0x6
	.uleb128 0x2
	.4byte	0xc71
	.byte	0
	.byte	0
	.uleb128 0x39
	.4byte	0x470
	.4byte	.LBI305
	.byte	.LVU819
	.4byte	.LLRL116
	.byte	0x1
	.2byte	0x177
	.byte	0xd
	.4byte	0x367
	.uleb128 0x5
	.4byte	0x482
	.4byte	.LLST117
	.4byte	.LVUS117
	.uleb128 0x6
	.4byte	.LLRL116
	.uleb128 0x3
	.4byte	0x48d
	.4byte	.LLST118
	.4byte	.LVUS118
	.uleb128 0x26
	.4byte	0x499
	.4byte	.LLRL119
	.4byte	0x33d
	.uleb128 0x3
	.4byte	0x49a
	.4byte	.LLST120
	.4byte	.LVUS120
	.uleb128 0x14
	.4byte	0x4a4
	.4byte	.LLRL121
	.uleb128 0x3
	.4byte	0x4a5
	.4byte	.LLST122
	.4byte	.LVUS122
	.uleb128 0x3
	.4byte	0x4af
	.4byte	.LLST123
	.4byte	.LVUS123
	.uleb128 0x3
	.4byte	0x4bb
	.4byte	.LLST124
	.4byte	.LVUS124
	.byte	0
	.byte	0
	.uleb128 0x27
	.4byte	0xc67
	.4byte	.LBB312
	.4byte	.LBE312-.LBB312
	.uleb128 0x2
	.4byte	0xc71
	.uleb128 0xa
	.4byte	0xc67
	.4byte	.LBB313
	.4byte	.LBE313-.LBB313
	.byte	0x35
	.byte	0x6
	.uleb128 0x2
	.4byte	0xc71
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1a
	.4byte	0xc67
	.4byte	.LBB317
	.4byte	.LBE317-.LBB317
	.2byte	0x17a
	.byte	0x5
	.4byte	0x396
	.uleb128 0x2
	.4byte	0xc71
	.uleb128 0xa
	.4byte	0xc67
	.4byte	.LBB318
	.4byte	.LBE318-.LBB318
	.byte	0x35
	.byte	0x6
	.uleb128 0x2
	.4byte	0xc71
	.byte	0
	.byte	0
	.uleb128 0xd
	.4byte	.LVL249
	.4byte	0xc7b
	.4byte	0x3aa
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0xd
	.4byte	.LVL250
	.4byte	0xc7b
	.4byte	0x3c4
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x77
	.sleb128 0
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0xd
	.4byte	.LVL251
	.4byte	0xbee
	.4byte	0x3de
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x77
	.sleb128 0
	.byte	0
	.uleb128 0x3a
	.4byte	.LVL253
	.4byte	0x4ca
	.uleb128 0xd
	.4byte	.LVL255
	.4byte	0xbee
	.4byte	0x401
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x77
	.sleb128 0
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0xd
	.4byte	.LVL257
	.4byte	0x470
	.4byte	0x415
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x77
	.sleb128 0
	.byte	0
	.uleb128 0xd
	.4byte	.LVL259
	.4byte	0xbee
	.4byte	0x42f
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x77
	.sleb128 0
	.byte	0
	.uleb128 0xd
	.4byte	.LVL268
	.4byte	0xbee
	.4byte	0x449
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x77
	.sleb128 0
	.byte	0
	.uleb128 0xb
	.4byte	.LVL269
	.4byte	0x6a5
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x77
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x13
	.4byte	0xf0
	.uleb128 0x13
	.4byte	0xfc
	.uleb128 0x3b
	.4byte	.LASF1002
	.byte	0x1
	.2byte	0x13b
	.byte	0x5
	.4byte	0x81
	.byte	0x1
	.4byte	0x4ca
	.uleb128 0x3c
	.ascii	"x\000"
	.byte	0x1
	.2byte	0x13b
	.byte	0x19
	.4byte	0x466
	.uleb128 0x21
	.4byte	.LASF1003
	.2byte	0x13e
	.byte	0xe
	.4byte	0x88
	.uleb128 0x15
	.uleb128 0x1c
	.ascii	"j\000"
	.2byte	0x13f
	.byte	0x11
	.4byte	0xa0
	.uleb128 0x15
	.uleb128 0x1c
	.ascii	"i\000"
	.2byte	0x140
	.byte	0x10
	.4byte	0xa0
	.uleb128 0x21
	.4byte	.LASF1004
	.2byte	0x141
	.byte	0x12
	.4byte	0x88
	.uleb128 0x21
	.4byte	.LASF1005
	.2byte	0x142
	.byte	0x12
	.4byte	0x88
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x20
	.4byte	.LASF1007
	.2byte	0x129
	.4byte	0x81
	.4byte	.LFB13
	.4byte	.LFE13-.LFB13
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x53a
	.uleb128 0xe
	.ascii	"x\000"
	.2byte	0x129
	.byte	0x19
	.4byte	0x466
	.4byte	.LLST96
	.4byte	.LVUS96
	.uleb128 0x22
	.4byte	.LASF1003
	.2byte	0x12c
	.byte	0xe
	.4byte	0x88
	.4byte	.LLST97
	.4byte	.LVUS97
	.uleb128 0x6
	.4byte	.LLRL98
	.uleb128 0xf
	.ascii	"i\000"
	.2byte	0x12d
	.byte	0x11
	.4byte	0xa0
	.4byte	.LLST99
	.4byte	.LVUS99
	.uleb128 0x6
	.4byte	.LLRL100
	.uleb128 0xf
	.ascii	"v\000"
	.2byte	0x12e
	.byte	0x12
	.4byte	0x94
	.4byte	.LLST101
	.4byte	.LVUS101
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x20
	.4byte	.LASF1008
	.2byte	0x101
	.4byte	0x81
	.4byte	.LFB12
	.4byte	.LFE12-.LFB12
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x6a5
	.uleb128 0xe
	.ascii	"res\000"
	.2byte	0x101
	.byte	0x18
	.4byte	0x466
	.4byte	.LLST81
	.4byte	.LVUS81
	.uleb128 0xe
	.ascii	"a\000"
	.2byte	0x101
	.byte	0x2b
	.4byte	0x46b
	.4byte	.LLST82
	.4byte	.LVUS82
	.uleb128 0xe
	.ascii	"b\000"
	.2byte	0x101
	.byte	0x3c
	.4byte	0x46b
	.4byte	.LLST83
	.4byte	.LVUS83
	.uleb128 0xf
	.ascii	"na\000"
	.2byte	0x107
	.byte	0xc
	.4byte	0xa0
	.4byte	.LLST84
	.4byte	.LVUS84
	.uleb128 0xf
	.ascii	"nb\000"
	.2byte	0x108
	.byte	0xc
	.4byte	0xa0
	.4byte	.LLST85
	.4byte	.LVUS85
	.uleb128 0x28
	.4byte	.LBB232
	.4byte	.LBE232-.LBB232
	.4byte	0x646
	.uleb128 0xf
	.ascii	"i\000"
	.2byte	0x10e
	.byte	0x11
	.4byte	0xa0
	.4byte	.LLST86
	.4byte	.LVUS86
	.uleb128 0x6
	.4byte	.LLRL87
	.uleb128 0x22
	.4byte	.LASF1003
	.2byte	0x10f
	.byte	0x12
	.4byte	0x94
	.4byte	.LLST88
	.4byte	.LVUS88
	.uleb128 0x1c
	.ascii	"av\000"
	.2byte	0x110
	.byte	0x12
	.4byte	0x94
	.uleb128 0x6
	.4byte	.LLRL89
	.uleb128 0xf
	.ascii	"j\000"
	.2byte	0x112
	.byte	0x15
	.4byte	0xa0
	.4byte	.LLST90
	.4byte	.LVUS90
	.uleb128 0x6
	.4byte	.LLRL91
	.uleb128 0x1c
	.ascii	"k\000"
	.2byte	0x113
	.byte	0x14
	.4byte	0xa0
	.uleb128 0xf
	.ascii	"cur\000"
	.2byte	0x115
	.byte	0x16
	.4byte	0x94
	.4byte	.LLST92
	.4byte	.LVUS92
	.uleb128 0x22
	.4byte	.LASF1009
	.2byte	0x116
	.byte	0x16
	.4byte	0x94
	.4byte	.LLST93
	.4byte	.LVUS93
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3d
	.4byte	0xc67
	.4byte	.LBI244
	.byte	.LVU653
	.4byte	.LBB244
	.4byte	.LBE244-.LBB244
	.byte	0x1
	.2byte	0x120
	.byte	0x5
	.4byte	0x68f
	.uleb128 0x5
	.4byte	0xc71
	.4byte	.LLST94
	.4byte	.LVUS94
	.uleb128 0x29
	.4byte	0xc67
	.4byte	.LBI245
	.byte	.LVU655
	.4byte	.LBB245
	.4byte	.LBE245-.LBB245
	.byte	0x35
	.uleb128 0x5
	.4byte	0xc71
	.4byte	.LLST95
	.4byte	.LVUS95
	.byte	0
	.byte	0
	.uleb128 0xb
	.4byte	.LVL184
	.4byte	0x1061
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 8
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.byte	0
	.uleb128 0x16
	.4byte	.LASF1010
	.byte	0xe6
	.byte	0x5
	.4byte	0x81
	.4byte	.LFB11
	.4byte	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x7dc
	.uleb128 0x9
	.ascii	"res\000"
	.byte	0xe6
	.byte	0x18
	.4byte	0x466
	.4byte	.LLST70
	.4byte	.LVUS70
	.uleb128 0x9
	.ascii	"a\000"
	.byte	0xe6
	.byte	0x2b
	.4byte	0x46b
	.4byte	.LLST71
	.4byte	.LVUS71
	.uleb128 0x9
	.ascii	"b\000"
	.byte	0xe6
	.byte	0x3c
	.4byte	0x46b
	.4byte	.LLST72
	.4byte	.LVUS72
	.uleb128 0x11
	.4byte	.LASF1011
	.byte	0xeb
	.byte	0xe
	.4byte	0x94
	.4byte	.LLST73
	.4byte	.LVUS73
	.uleb128 0x7
	.ascii	"n\000"
	.byte	0xec
	.byte	0xc
	.4byte	0xa0
	.uleb128 0x17
	.4byte	.LLRL74
	.4byte	0x758
	.uleb128 0x4
	.ascii	"i\000"
	.byte	0xee
	.byte	0x11
	.4byte	0xa0
	.4byte	.LLST75
	.4byte	.LVUS75
	.uleb128 0x6
	.4byte	.LLRL76
	.uleb128 0x7
	.ascii	"av\000"
	.byte	0xef
	.byte	0x12
	.4byte	0x94
	.uleb128 0x7
	.ascii	"bv\000"
	.byte	0xf0
	.byte	0x12
	.4byte	0x94
	.uleb128 0x2a
	.4byte	.LASF1012
	.byte	0xf2
	.4byte	0x94
	.uleb128 0x2a
	.4byte	.LASF1013
	.byte	0xf3
	.4byte	0x94
	.byte	0
	.byte	0
	.uleb128 0x28
	.4byte	.LBB222
	.4byte	.LBE222-.LBB222
	.4byte	0x786
	.uleb128 0x4
	.ascii	"i\000"
	.byte	0xfc
	.byte	0x11
	.4byte	0xa0
	.4byte	.LLST80
	.4byte	.LVUS80
	.uleb128 0xb
	.4byte	.LVL172
	.4byte	0x1061
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.byte	0
	.uleb128 0x23
	.4byte	0xc67
	.4byte	.LBI214
	.byte	.LVU535
	.4byte	.LLRL77
	.byte	0xfa
	.4byte	0x7c5
	.uleb128 0x5
	.4byte	0xc71
	.4byte	.LLST78
	.4byte	.LVUS78
	.uleb128 0x24
	.4byte	0xc67
	.4byte	.LBI215
	.byte	.LVU537
	.4byte	.LLRL77
	.byte	0x35
	.byte	0x6
	.uleb128 0x5
	.4byte	0xc71
	.4byte	.LLST79
	.4byte	.LVUS79
	.byte	0
	.byte	0
	.uleb128 0xb
	.4byte	.LVL156
	.4byte	0xbee
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x77
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x16
	.4byte	.LASF1014
	.byte	0xca
	.byte	0x5
	.4byte	0x81
	.4byte	.LFB10
	.4byte	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x8d1
	.uleb128 0x9
	.ascii	"res\000"
	.byte	0xca
	.byte	0x18
	.4byte	0x466
	.4byte	.LLST59
	.4byte	.LVUS59
	.uleb128 0x9
	.ascii	"a\000"
	.byte	0xca
	.byte	0x2b
	.4byte	0x46b
	.4byte	.LLST60
	.4byte	.LVUS60
	.uleb128 0x9
	.ascii	"b\000"
	.byte	0xca
	.byte	0x3c
	.4byte	0x46b
	.4byte	.LLST61
	.4byte	.LVUS61
	.uleb128 0x4
	.ascii	"na\000"
	.byte	0xcd
	.byte	0xc
	.4byte	0xa0
	.4byte	.LLST62
	.4byte	.LVUS62
	.uleb128 0x4
	.ascii	"nb\000"
	.byte	0xce
	.byte	0xc
	.4byte	0xa0
	.4byte	.LLST63
	.4byte	.LVUS63
	.uleb128 0x4
	.ascii	"n\000"
	.byte	0xcf
	.byte	0xc
	.4byte	0xa0
	.4byte	.LLST64
	.4byte	.LVUS64
	.uleb128 0x11
	.4byte	.LASF1003
	.byte	0xd3
	.byte	0xe
	.4byte	0x94
	.4byte	.LLST65
	.4byte	.LVUS65
	.uleb128 0x17
	.4byte	.LLRL66
	.4byte	0x8b2
	.uleb128 0x4
	.ascii	"i\000"
	.byte	0xd4
	.byte	0x11
	.4byte	0xa0
	.4byte	.LLST67
	.4byte	.LVUS67
	.uleb128 0x6
	.4byte	.LLRL68
	.uleb128 0x7
	.ascii	"av\000"
	.byte	0xd5
	.byte	0x12
	.4byte	0x94
	.uleb128 0x7
	.ascii	"bv\000"
	.byte	0xd6
	.byte	0x12
	.4byte	0x94
	.uleb128 0x7
	.ascii	"sum\000"
	.byte	0xd8
	.byte	0x12
	.4byte	0x94
	.byte	0
	.byte	0
	.uleb128 0x6
	.4byte	.LLRL69
	.uleb128 0x7
	.ascii	"i\000"
	.byte	0xe1
	.byte	0x11
	.4byte	0xa0
	.uleb128 0xb
	.4byte	.LVL146
	.4byte	0x1061
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x2b
	.4byte	.LASF1028
	.byte	0x89
	.4byte	.LFB9
	.4byte	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xa1e
	.uleb128 0x9
	.ascii	"x\000"
	.byte	0x89
	.byte	0x22
	.4byte	0x46b
	.4byte	.LLST43
	.4byte	.LVUS43
	.uleb128 0x2c
	.4byte	.LASF1015
	.byte	0x89
	.byte	0x2b
	.4byte	0x103
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2c
	.4byte	.LASF1016
	.byte	0x89
	.byte	0x3e
	.4byte	0xa0
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x3e
	.4byte	.LASF1037
	.byte	0x1
	.byte	0x8a
	.byte	0x17
	.4byte	0xa2e
	.uleb128 0x5
	.byte	0x3
	.4byte	hexdigits.0
	.uleb128 0x4
	.ascii	"ms\000"
	.byte	0x98
	.byte	0xa
	.4byte	0x54
	.4byte	.LLST44
	.4byte	.LVUS44
	.uleb128 0x4
	.ascii	"pos\000"
	.byte	0xa5
	.byte	0xc
	.4byte	0xa0
	.4byte	.LLST45
	.4byte	.LVUS45
	.uleb128 0x11
	.4byte	.LASF1004
	.byte	0xae
	.byte	0xe
	.4byte	0x88
	.4byte	.LLST46
	.4byte	.LVUS46
	.uleb128 0x11
	.4byte	.LASF1017
	.byte	0xaf
	.byte	0x9
	.4byte	0x81
	.4byte	.LLST47
	.4byte	.LVUS47
	.uleb128 0x17
	.4byte	.LLRL50
	.4byte	0x9a1
	.uleb128 0x4
	.ascii	"nib\000"
	.byte	0xb0
	.byte	0xe
	.4byte	0x81
	.4byte	.LLST51
	.4byte	.LVUS51
	.uleb128 0x6
	.4byte	.LLRL52
	.uleb128 0x4
	.ascii	"v\000"
	.byte	0xb1
	.byte	0x12
	.4byte	0x88
	.4byte	.LLST53
	.4byte	.LVUS53
	.byte	0
	.byte	0
	.uleb128 0x17
	.4byte	.LLRL54
	.4byte	0x9e4
	.uleb128 0x4
	.ascii	"i\000"
	.byte	0xb8
	.byte	0xf
	.4byte	0x54
	.4byte	.LLST55
	.4byte	.LVUS55
	.uleb128 0x6
	.4byte	.LLRL56
	.uleb128 0x4
	.ascii	"nib\000"
	.byte	0xba
	.byte	0x12
	.4byte	0x81
	.4byte	.LLST57
	.4byte	.LVUS57
	.uleb128 0x6
	.4byte	.LLRL58
	.uleb128 0x7
	.ascii	"v\000"
	.byte	0xbb
	.byte	0x16
	.4byte	0x88
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1d
	.4byte	0xc44
	.4byte	.LLRL48
	.byte	0x8d
	.byte	0xf
	.uleb128 0x2
	.4byte	0xc52
	.uleb128 0x1d
	.4byte	0xc44
	.4byte	.LLRL48
	.byte	0x40
	.byte	0x5
	.uleb128 0x2
	.4byte	0xc52
	.uleb128 0x14
	.4byte	0xc5b
	.4byte	.LLRL48
	.uleb128 0x3
	.4byte	0xc5c
	.4byte	.LLST49
	.4byte	.LVUS49
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x25
	.4byte	0x10f
	.4byte	0xa2e
	.uleb128 0x3f
	.4byte	0x31
	.byte	0x10
	.byte	0
	.uleb128 0x1f
	.4byte	0xa1e
	.uleb128 0x16
	.4byte	.LASF1018
	.byte	0x6b
	.byte	0x5
	.4byte	0x81
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xbd3
	.uleb128 0x9
	.ascii	"out\000"
	.byte	0x6b
	.byte	0x1d
	.4byte	0x466
	.4byte	.LLST24
	.4byte	.LVUS24
	.uleb128 0x2d
	.4byte	.LASF1019
	.byte	0x6b
	.byte	0x2e
	.4byte	0x114
	.4byte	.LLST25
	.4byte	.LVUS25
	.uleb128 0x4
	.ascii	"len\000"
	.byte	0x70
	.byte	0xc
	.4byte	0xa0
	.4byte	.LLST26
	.4byte	.LVUS26
	.uleb128 0x11
	.4byte	.LASF1020
	.byte	0x71
	.byte	0xc
	.4byte	0xa0
	.4byte	.LLST27
	.4byte	.LVUS27
	.uleb128 0x17
	.4byte	.LLRL30
	.4byte	0xb2b
	.uleb128 0x4
	.ascii	"i\000"
	.byte	0x74
	.byte	0xf
	.4byte	0x54
	.4byte	.LLST31
	.4byte	.LVUS31
	.uleb128 0x6
	.4byte	.LLRL32
	.uleb128 0x4
	.ascii	"acc\000"
	.byte	0x77
	.byte	0x12
	.4byte	0x88
	.4byte	.LLST33
	.4byte	.LVUS33
	.uleb128 0x11
	.4byte	.LASF1021
	.byte	0x78
	.byte	0xe
	.4byte	0x54
	.4byte	.LLST34
	.4byte	.LVUS34
	.uleb128 0x6
	.4byte	.LLRL35
	.uleb128 0x4
	.ascii	"j\000"
	.byte	0x7b
	.byte	0x13
	.4byte	0x54
	.4byte	.LLST36
	.4byte	.LVUS36
	.uleb128 0x6
	.4byte	.LLRL37
	.uleb128 0x4
	.ascii	"d\000"
	.byte	0x7c
	.byte	0x11
	.4byte	0x81
	.4byte	.LLST38
	.4byte	.LVUS38
	.uleb128 0x24
	.4byte	0xbd3
	.4byte	.LBI137
	.byte	.LVU222
	.4byte	.LLRL39
	.byte	0x7c
	.byte	0x15
	.uleb128 0x5
	.4byte	0xbe4
	.4byte	.LLST40
	.4byte	.LVUS40
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x40
	.4byte	0xce4
	.4byte	.LBI130
	.byte	.LVU176
	.4byte	.LBB130
	.4byte	.LBE130-.LBB130
	.byte	0x1
	.byte	0x6e
	.byte	0x5
	.4byte	0xb90
	.uleb128 0x5
	.4byte	0xcee
	.4byte	.LLST28
	.4byte	.LVUS28
	.uleb128 0x29
	.4byte	0xce4
	.4byte	.LBI131
	.byte	.LVU178
	.4byte	.LBB131
	.4byte	.LBE131-.LBB131
	.byte	0x24
	.uleb128 0x5
	.4byte	0xcee
	.4byte	.LLST29
	.4byte	.LVUS29
	.uleb128 0xb
	.4byte	.LVL67
	.4byte	0x1061
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x75
	.sleb128 8
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x4
	.byte	0x76
	.sleb128 0
	.byte	0x32
	.byte	0x24
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x23
	.4byte	0xc67
	.4byte	.LBI154
	.byte	.LVU268
	.4byte	.LLRL41
	.byte	0x85
	.4byte	0xbc2
	.uleb128 0x5
	.4byte	0xc71
	.4byte	.LLST42
	.4byte	.LVUS42
	.uleb128 0x1d
	.4byte	0xc67
	.4byte	.LLRL41
	.byte	0x35
	.byte	0x6
	.uleb128 0x2
	.4byte	0xc71
	.byte	0
	.byte	0
	.uleb128 0xb
	.4byte	.LVL69
	.4byte	0x11f
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x41
	.4byte	.LASF1038
	.byte	0x1
	.byte	0x64
	.byte	0xc
	.4byte	0x81
	.byte	0x1
	.4byte	0xbee
	.uleb128 0x12
	.ascii	"c\000"
	.byte	0x64
	.byte	0x18
	.4byte	0x108
	.byte	0
	.uleb128 0x2e
	.4byte	.LASF1022
	.byte	0x48
	.4byte	0x81
	.4byte	0xc44
	.uleb128 0x12
	.ascii	"a\000"
	.byte	0x48
	.byte	0x1e
	.4byte	0x46b
	.uleb128 0x12
	.ascii	"b\000"
	.byte	0x48
	.byte	0x2f
	.4byte	0x46b
	.uleb128 0x7
	.ascii	"na\000"
	.byte	0x4e
	.byte	0xc
	.4byte	0xa0
	.uleb128 0x7
	.ascii	"nb\000"
	.byte	0x4f
	.byte	0xc
	.4byte	0xa0
	.uleb128 0x15
	.uleb128 0x7
	.ascii	"i\000"
	.byte	0x57
	.byte	0x11
	.4byte	0xa0
	.uleb128 0x15
	.uleb128 0x7
	.ascii	"av\000"
	.byte	0x58
	.byte	0x12
	.4byte	0x88
	.uleb128 0x7
	.ascii	"bv\000"
	.byte	0x59
	.byte	0x12
	.4byte	0x88
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x2e
	.4byte	.LASF1023
	.byte	0x40
	.4byte	0x81
	.4byte	0xc67
	.uleb128 0x12
	.ascii	"x\000"
	.byte	0x40
	.byte	0x22
	.4byte	0x46b
	.uleb128 0x15
	.uleb128 0x7
	.ascii	"i\000"
	.byte	0x42
	.byte	0x11
	.4byte	0xa0
	.byte	0
	.byte	0
	.uleb128 0x2f
	.4byte	.LASF1025
	.byte	0x35
	.4byte	0xc7b
	.uleb128 0x12
	.ascii	"x\000"
	.byte	0x35
	.byte	0x1a
	.4byte	0x466
	.byte	0
	.uleb128 0x16
	.4byte	.LASF1026
	.byte	0x2a
	.byte	0x5
	.4byte	0x81
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xce4
	.uleb128 0x9
	.ascii	"dst\000"
	.byte	0x2a
	.byte	0x19
	.4byte	0x466
	.4byte	.LLST6
	.4byte	.LVUS6
	.uleb128 0x9
	.ascii	"src\000"
	.byte	0x2a
	.byte	0x2c
	.4byte	0x46b
	.4byte	.LLST7
	.4byte	.LVUS7
	.uleb128 0xd
	.4byte	.LVL18
	.4byte	0x1061
	.4byte	0xcd3
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 8
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0xb
	.4byte	.LVL19
	.4byte	0x106a
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x75
	.sleb128 8
	.byte	0
	.byte	0
	.uleb128 0x2f
	.4byte	.LASF1027
	.byte	0x24
	.4byte	0xcf8
	.uleb128 0x12
	.ascii	"x\000"
	.byte	0x24
	.byte	0x1e
	.4byte	0x466
	.byte	0
	.uleb128 0x2b
	.4byte	.LASF1029
	.byte	0x20
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xd35
	.uleb128 0x9
	.ascii	"x\000"
	.byte	0x20
	.byte	0x1a
	.4byte	0x466
	.4byte	.LLST2
	.4byte	.LVUS2
	.uleb128 0x42
	.4byte	.LVL8
	.4byte	0x155
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x9
	.byte	0xa3
	.uleb128 0x3
	.byte	0xa5
	.uleb128 0
	.uleb128 0x2a
	.byte	0xa8
	.uleb128 0x31
	.byte	0xa8
	.uleb128 0
	.byte	0
	.byte	0
	.uleb128 0x16
	.4byte	.LASF1030
	.byte	0x14
	.byte	0x9
	.4byte	0x466
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xda2
	.uleb128 0x2d
	.4byte	.LASF1031
	.byte	0x14
	.byte	0x1d
	.4byte	0xa0
	.4byte	.LLST0
	.4byte	.LVUS0
	.uleb128 0x4
	.ascii	"x\000"
	.byte	0x17
	.byte	0xd
	.4byte	0x466
	.4byte	.LLST1
	.4byte	.LVUS1
	.uleb128 0xd
	.4byte	.LVL4
	.4byte	0x187
	.4byte	0xd86
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x75
	.sleb128 0
	.byte	0
	.uleb128 0xb
	.4byte	.LVL6
	.4byte	0x1061
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 8
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x75
	.sleb128 -8
	.byte	0
	.byte	0
	.uleb128 0x18
	.4byte	0xce4
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xdf6
	.uleb128 0x5
	.4byte	0xcee
	.4byte	.LLST3
	.4byte	.LVUS3
	.uleb128 0x24
	.4byte	0xce4
	.4byte	.LBI61
	.byte	.LVU28
	.4byte	.LLRL4
	.byte	0x24
	.byte	0x6
	.uleb128 0x5
	.4byte	0xcee
	.4byte	.LLST5
	.4byte	.LVUS5
	.uleb128 0xb
	.4byte	.LVL12
	.4byte	0x1061
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 8
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x18
	.4byte	0xc67
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xe26
	.uleb128 0x43
	.4byte	0xc71
	.uleb128 0x1
	.byte	0x50
	.uleb128 0xa
	.4byte	0xc67
	.4byte	.LBB67
	.4byte	.LBE67-.LBB67
	.byte	0x35
	.byte	0x6
	.uleb128 0x2
	.4byte	0xc71
	.byte	0
	.byte	0
	.uleb128 0x18
	.4byte	0xc44
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xe77
	.uleb128 0x5
	.4byte	0xc52
	.4byte	.LLST8
	.4byte	.LVUS8
	.uleb128 0xa
	.4byte	0xc44
	.4byte	.LBB73
	.4byte	.LBE73-.LBB73
	.byte	0x40
	.byte	0x5
	.uleb128 0x2
	.4byte	0xc52
	.uleb128 0x1b
	.4byte	0xc5b
	.4byte	.LBB74
	.4byte	.LBE74-.LBB74
	.uleb128 0x3
	.4byte	0xc5c
	.4byte	.LLST9
	.4byte	.LVUS9
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x18
	.4byte	0xbee
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xfbf
	.uleb128 0x5
	.4byte	0xbfc
	.4byte	.LLST10
	.4byte	.LVUS10
	.uleb128 0x5
	.4byte	0xc05
	.4byte	.LLST11
	.4byte	.LVUS11
	.uleb128 0x30
	.4byte	0xc0e
	.uleb128 0x30
	.4byte	0xc18
	.uleb128 0x44
	.4byte	0xc44
	.4byte	.LLRL12
	.byte	0x1
	.byte	0x4b
	.byte	0x14
	.4byte	0xeec
	.uleb128 0x2
	.4byte	0xc52
	.uleb128 0x1d
	.4byte	0xc44
	.4byte	.LLRL12
	.byte	0x40
	.byte	0x5
	.uleb128 0x2
	.4byte	0xc52
	.uleb128 0x14
	.4byte	0xc5b
	.4byte	.LLRL12
	.uleb128 0x3
	.4byte	0xc5c
	.4byte	.LLST13
	.4byte	.LVUS13
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x23
	.4byte	0xbee
	.4byte	.LBI102
	.byte	.LVU98
	.4byte	.LLRL14
	.byte	0x48
	.4byte	0xf79
	.uleb128 0x5
	.4byte	0xc05
	.4byte	.LLST15
	.4byte	.LVUS15
	.uleb128 0x5
	.4byte	0xbfc
	.4byte	.LLST16
	.4byte	.LVUS16
	.uleb128 0x6
	.4byte	.LLRL14
	.uleb128 0x3
	.4byte	0xc0e
	.4byte	.LLST17
	.4byte	.LVUS17
	.uleb128 0x3
	.4byte	0xc18
	.4byte	.LLST18
	.4byte	.LVUS18
	.uleb128 0x1b
	.4byte	0xc22
	.4byte	.LBB104
	.4byte	.LBE104-.LBB104
	.uleb128 0x3
	.4byte	0xc23
	.4byte	.LLST19
	.4byte	.LVUS19
	.uleb128 0x14
	.4byte	0xc2c
	.4byte	.LLRL20
	.uleb128 0x3
	.4byte	0xc2d
	.4byte	.LLST21
	.4byte	.LVUS21
	.uleb128 0x3
	.4byte	0xc37
	.4byte	.LLST22
	.4byte	.LVUS22
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xa
	.4byte	0xc44
	.4byte	.LBB110
	.4byte	.LBE110-.LBB110
	.byte	0x4a
	.byte	0x14
	.uleb128 0x2
	.4byte	0xc52
	.uleb128 0xa
	.4byte	0xc44
	.4byte	.LBB111
	.4byte	.LBE111-.LBB111
	.byte	0x40
	.byte	0x5
	.uleb128 0x2
	.4byte	0xc52
	.uleb128 0x1b
	.4byte	0xc5b
	.4byte	.LBB112
	.4byte	.LBE112-.LBB112
	.uleb128 0x3
	.4byte	0xc5c
	.4byte	.LLST23
	.4byte	.LVUS23
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x18
	.4byte	0x470
	.4byte	.LFB14
	.4byte	.LFE14-.LFB14
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1061
	.uleb128 0x5
	.4byte	0x482
	.4byte	.LLST102
	.4byte	.LVUS102
	.uleb128 0x3
	.4byte	0x48d
	.4byte	.LLST103
	.4byte	.LVUS103
	.uleb128 0x26
	.4byte	0x499
	.4byte	.LLRL104
	.4byte	0x1038
	.uleb128 0x3
	.4byte	0x49a
	.4byte	.LLST105
	.4byte	.LVUS105
	.uleb128 0x14
	.4byte	0x4a4
	.4byte	.LLRL106
	.uleb128 0x3
	.4byte	0x4a5
	.4byte	.LLST107
	.4byte	.LVUS107
	.uleb128 0x3
	.4byte	0x4af
	.4byte	.LLST108
	.4byte	.LVUS108
	.uleb128 0x3
	.4byte	0x4bb
	.4byte	.LLST109
	.4byte	.LVUS109
	.byte	0
	.byte	0
	.uleb128 0x27
	.4byte	0xc67
	.4byte	.LBB268
	.4byte	.LBE268-.LBB268
	.uleb128 0x2
	.4byte	0xc71
	.uleb128 0xa
	.4byte	0xc67
	.4byte	.LBB269
	.4byte	.LBE269-.LBB269
	.byte	0x35
	.byte	0x6
	.uleb128 0x2
	.4byte	0xc71
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x31
	.4byte	.LASF1000
	.4byte	.LASF1032
	.uleb128 0x31
	.4byte	.LASF999
	.4byte	.LASF1033
	.byte	0
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x49
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x7e
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x58
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x57
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x48
	.byte	0x1
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x7f
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x48
	.byte	0x1
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x7f
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x55
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0xb
	.byte	0x1
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7a
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7a
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x58
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x59
	.uleb128 0x5
	.uleb128 0x57
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x58
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x57
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 5
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7a
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x2138
	.uleb128 0xb
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x58
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x57
	.uleb128 0x21
	.sleb128 5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x2138
	.uleb128 0xb
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x58
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x57
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x58
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x59
	.uleb128 0x21
	.sleb128 327
	.uleb128 0x57
	.uleb128 0x21
	.sleb128 5
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x29
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x2138
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x58
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x57
	.uleb128 0x21
	.sleb128 6
	.byte	0
	.byte	0
	.uleb128 0x2a
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 18
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2b
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 6
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7a
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2c
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x2d
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2e
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2f
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 6
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x20
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x30
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x31
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x3b
	.uleb128 0x21
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x32
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x17
	.uleb128 0x79
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x33
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x34
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x35
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x36
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x37
	.uleb128 0x26
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x38
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x39
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x2138
	.uleb128 0xb
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0x5
	.uleb128 0x57
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3a
	.uleb128 0x48
	.byte	0
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x7f
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3b
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3c
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3d
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x2138
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0x5
	.uleb128 0x57
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3e
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x3f
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x40
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x2138
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x57
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x41
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x42
	.uleb128 0x48
	.byte	0x1
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x82
	.uleb128 0x19
	.uleb128 0x7f
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x43
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x44
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x57
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loclists,"",%progbits
	.4byte	.Ldebug_loc3-.Ldebug_loc2
.Ldebug_loc2:
	.2byte	0x5
	.byte	0x4
	.byte	0
	.4byte	0
.Ldebug_loc0:
.LVUS110:
	.uleb128 0
	.uleb128 .LVU755
	.uleb128 .LVU755
	.uleb128 .LVU854
	.uleb128 .LVU854
	.uleb128 .LVU856
	.uleb128 .LVU856
	.uleb128 0
.LLST110:
	.byte	0x6
	.4byte	.LVL240
	.byte	0x4
	.uleb128 .LVL240-.LVL240
	.uleb128 .LVL244-.LVL240
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL244-.LVL240
	.uleb128 .LVL270-.LVL240
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL270-.LVL240
	.uleb128 .LVL271-.LVL240
	.uleb128 0xa
	.byte	0xa3
	.uleb128 0x3
	.byte	0xa5
	.uleb128 0
	.uleb128 0x2a
	.byte	0xa8
	.uleb128 0x31
	.byte	0xa8
	.uleb128 0
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL271-.LVL240
	.uleb128 .LFE15-.LVL240
	.uleb128 0x1
	.byte	0x54
	.byte	0
.LVUS111:
	.uleb128 0
	.uleb128 .LVU770
	.uleb128 .LVU770
	.uleb128 0
.LLST111:
	.byte	0x6
	.4byte	.LVL240
	.byte	0x4
	.uleb128 .LVL240-.LVL240
	.uleb128 .LVL249-1-.LVL240
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL249-1-.LVL240
	.uleb128 .LFE15-.LVL240
	.uleb128 0xa
	.byte	0xa3
	.uleb128 0x3
	.byte	0xa5
	.uleb128 0x1
	.uleb128 0x2a
	.byte	0xa8
	.uleb128 0x31
	.byte	0xa8
	.uleb128 0
	.byte	0x9f
	.byte	0
.LVUS112:
	.uleb128 0
	.uleb128 .LVU752
	.uleb128 .LVU752
	.uleb128 .LVU809
	.uleb128 .LVU809
	.uleb128 0
.LLST112:
	.byte	0x6
	.4byte	.LVL240
	.byte	0x4
	.uleb128 .LVL240-.LVL240
	.uleb128 .LVL242-.LVL240
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL242-.LVL240
	.uleb128 .LVL258-.LVL240
	.uleb128 0x1
	.byte	0x56
	.byte	0x4
	.uleb128 .LVL258-.LVL240
	.uleb128 .LFE15-.LVL240
	.uleb128 0xa
	.byte	0xa3
	.uleb128 0x3
	.byte	0xa5
	.uleb128 0x2
	.uleb128 0x2a
	.byte	0xa8
	.uleb128 0x31
	.byte	0xa8
	.uleb128 0
	.byte	0x9f
	.byte	0
.LVUS113:
	.uleb128 0
	.uleb128 .LVU754
	.uleb128 .LVU754
	.uleb128 .LVU792
	.uleb128 .LVU792
	.uleb128 .LVU793
	.uleb128 .LVU793
	.uleb128 .LVU802
	.uleb128 .LVU802
	.uleb128 .LVU804
	.uleb128 .LVU804
	.uleb128 .LVU854
	.uleb128 .LVU854
	.uleb128 .LVU856
	.uleb128 .LVU856
	.uleb128 0
.LLST113:
	.byte	0x6
	.4byte	.LVL240
	.byte	0x4
	.uleb128 .LVL240-.LVL240
	.uleb128 .LVL243-.LVL240
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL243-.LVL240
	.uleb128 .LVL252-.LVL240
	.uleb128 0x1
	.byte	0x57
	.byte	0x4
	.uleb128 .LVL252-.LVL240
	.uleb128 .LVL253-1-.LVL240
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL253-1-.LVL240
	.uleb128 .LVL256-.LVL240
	.uleb128 0x1
	.byte	0x57
	.byte	0x4
	.uleb128 .LVL256-.LVL240
	.uleb128 .LVL257-1-.LVL240
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL257-1-.LVL240
	.uleb128 .LVL270-.LVL240
	.uleb128 0x1
	.byte	0x57
	.byte	0x4
	.uleb128 .LVL270-.LVL240
	.uleb128 .LVL271-.LVL240
	.uleb128 0xa
	.byte	0xa3
	.uleb128 0x3
	.byte	0xa5
	.uleb128 0x3
	.uleb128 0x2a
	.byte	0xa8
	.uleb128 0x31
	.byte	0xa8
	.uleb128 0
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL271-.LVL240
	.uleb128 .LFE15-.LVL240
	.uleb128 0x1
	.byte	0x57
	.byte	0
.LVUS114:
	.uleb128 .LVU792
	.uleb128 .LVU854
	.uleb128 .LVU856
	.uleb128 0
.LLST114:
	.byte	0x6
	.4byte	.LVL252
	.byte	0x4
	.uleb128 .LVL252-.LVL252
	.uleb128 .LVL270-.LVL252
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL271-.LVL252
	.uleb128 .LFE15-.LVL252
	.uleb128 0x1
	.byte	0x55
	.byte	0
.LVUS115:
	.uleb128 .LVU750
	.uleb128 .LVU756
	.uleb128 .LVU756
	.uleb128 .LVU763
.LLST115:
	.byte	0x6
	.4byte	.LVL241
	.byte	0x4
	.uleb128 .LVL241-.LVL241
	.uleb128 .LVL245-.LVL241
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL245-.LVL241
	.uleb128 .LVL248-.LVL241
	.uleb128 0x1
	.byte	0x53
	.byte	0
.LVUS117:
	.uleb128 .LVU819
	.uleb128 .LVU846
.LLST117:
	.byte	0x8
	.4byte	.LVL260
	.uleb128 .LVL267-.LVL260
	.uleb128 0x1
	.byte	0x57
	.byte	0
.LVUS118:
	.uleb128 .LVU822
	.uleb128 .LVU827
	.uleb128 .LVU827
	.uleb128 .LVU833
	.uleb128 .LVU837
	.uleb128 .LVU841
	.uleb128 .LVU841
	.uleb128 .LVU846
.LLST118:
	.byte	0x6
	.4byte	.LVL260
	.byte	0x4
	.uleb128 .LVL260-.LVL260
	.uleb128 .LVL261-.LVL260
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL261-.LVL260
	.uleb128 .LVL264-.LVL260
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL265-.LVL260
	.uleb128 .LVL266-.LVL260
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL266-.LVL260
	.uleb128 .LVL267-.LVL260
	.uleb128 0x5
	.byte	0x76
	.sleb128 0
	.byte	0x4f
	.byte	0x24
	.byte	0x9f
	.byte	0
.LVUS120:
	.uleb128 .LVU824
	.uleb128 .LVU827
	.uleb128 .LVU827
	.uleb128 .LVU832
	.uleb128 .LVU832
	.uleb128 .LVU839
.LLST120:
	.byte	0x6
	.4byte	.LVL260
	.byte	0x4
	.uleb128 .LVL260-.LVL260
	.uleb128 .LVL261-.LVL260
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL261-.LVL260
	.uleb128 .LVL263-.LVL260
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL263-.LVL260
	.uleb128 .LVL265-.LVL260
	.uleb128 0x3
	.byte	0x70
	.sleb128 1
	.byte	0x9f
	.byte	0
.LVUS122:
	.uleb128 .LVU828
	.uleb128 .LVU832
	.uleb128 .LVU832
	.uleb128 .LVU846
.LLST122:
	.byte	0x6
	.4byte	.LVL261
	.byte	0x4
	.uleb128 .LVL261-.LVL261
	.uleb128 .LVL263-.LVL261
	.uleb128 0x3
	.byte	0x70
	.sleb128 -1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL263-.LVL261
	.uleb128 .LVL267-.LVL261
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LVUS123:
	.uleb128 .LVU830
	.uleb128 .LVU846
.LLST123:
	.byte	0x8
	.4byte	.LVL262
	.uleb128 .LVL267-.LVL262
	.uleb128 0x1
	.byte	0x56
	.byte	0
.LVUS124:
	.uleb128 .LVU835
	.uleb128 .LVU841
	.uleb128 .LVU841
	.uleb128 .LVU846
.LLST124:
	.byte	0x6
	.4byte	.LVL265
	.byte	0x4
	.uleb128 .LVL265-.LVL265
	.uleb128 .LVL266-.LVL265
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL266-.LVL265
	.uleb128 .LVL267-.LVL265
	.uleb128 0x5
	.byte	0x76
	.sleb128 0
	.byte	0x4f
	.byte	0x24
	.byte	0x9f
	.byte	0
.LVUS96:
	.uleb128 0
	.uleb128 .LVU701
	.uleb128 .LVU701
	.uleb128 .LVU702
	.uleb128 .LVU702
	.uleb128 .LVU703
	.uleb128 .LVU703
	.uleb128 .LVU704
	.uleb128 .LVU704
	.uleb128 .LVU705
	.uleb128 .LVU705
	.uleb128 0
.LLST96:
	.byte	0x6
	.4byte	.LVL212
	.byte	0x4
	.uleb128 .LVL212-.LVL212
	.uleb128 .LVL221-.LVL212
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL221-.LVL212
	.uleb128 .LVL222-.LVL212
	.uleb128 0xa
	.byte	0xa3
	.uleb128 0x3
	.byte	0xa5
	.uleb128 0
	.uleb128 0x2a
	.byte	0xa8
	.uleb128 0x31
	.byte	0xa8
	.uleb128 0
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL222-.LVL212
	.uleb128 .LVL223-.LVL212
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL223-.LVL212
	.uleb128 .LVL224-.LVL212
	.uleb128 0xa
	.byte	0xa3
	.uleb128 0x3
	.byte	0xa5
	.uleb128 0
	.uleb128 0x2a
	.byte	0xa8
	.uleb128 0x31
	.byte	0xa8
	.uleb128 0
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL224-.LVL212
	.uleb128 .LVL225-.LVL212
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL225-.LVL212
	.uleb128 .LFE13-.LVL212
	.uleb128 0xa
	.byte	0xa3
	.uleb128 0x3
	.byte	0xa5
	.uleb128 0
	.uleb128 0x2a
	.byte	0xa8
	.uleb128 0x31
	.byte	0xa8
	.uleb128 0
	.byte	0x9f
	.byte	0
.LVUS97:
	.uleb128 .LVU671
	.uleb128 .LVU678
	.uleb128 .LVU678
	.uleb128 .LVU684
	.uleb128 .LVU688
	.uleb128 .LVU698
	.uleb128 .LVU702
	.uleb128 .LVU704
.LLST97:
	.byte	0x6
	.4byte	.LVL213
	.byte	0x4
	.uleb128 .LVL213-.LVL213
	.uleb128 .LVL214-.LVL213
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL214-.LVL213
	.uleb128 .LVL216-.LVL213
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL217-.LVL213
	.uleb128 .LVL219-.LVL213
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL222-.LVL213
	.uleb128 .LVL224-.LVL213
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LVUS99:
	.uleb128 .LVU671
	.uleb128 .LVU678
	.uleb128 .LVU678
	.uleb128 .LVU681
	.uleb128 .LVU681
	.uleb128 .LVU690
	.uleb128 .LVU690
	.uleb128 .LVU700
	.uleb128 .LVU702
	.uleb128 .LVU704
.LLST99:
	.byte	0x6
	.4byte	.LVL213
	.byte	0x4
	.uleb128 .LVL213-.LVL213
	.uleb128 .LVL214-.LVL213
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL214-.LVL213
	.uleb128 .LVL215-.LVL213
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL215-.LVL213
	.uleb128 .LVL217-.LVL213
	.uleb128 0x3
	.byte	0x71
	.sleb128 -1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL217-.LVL213
	.uleb128 .LVL220-.LVL213
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL222-.LVL213
	.uleb128 .LVL224-.LVL213
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LVUS101:
	.uleb128 .LVU684
	.uleb128 .LVU695
	.uleb128 .LVU695
	.uleb128 .LVU698
	.uleb128 .LVU702
	.uleb128 .LVU704
.LLST101:
	.byte	0x6
	.4byte	.LVL216
	.byte	0x4
	.uleb128 .LVL216-.LVL216
	.uleb128 .LVL218-.LVL216
	.uleb128 0x6
	.byte	0x53
	.byte	0x93
	.uleb128 0x4
	.byte	0x52
	.byte	0x93
	.uleb128 0x4
	.byte	0x4
	.uleb128 .LVL218-.LVL216
	.uleb128 .LVL219-.LVL216
	.uleb128 0x7
	.byte	0x7c
	.sleb128 0
	.byte	0x93
	.uleb128 0x4
	.byte	0x52
	.byte	0x93
	.uleb128 0x4
	.byte	0x4
	.uleb128 .LVL222-.LVL216
	.uleb128 .LVL224-.LVL216
	.uleb128 0x7
	.byte	0x7c
	.sleb128 0
	.byte	0x93
	.uleb128 0x4
	.byte	0x52
	.byte	0x93
	.uleb128 0x4
	.byte	0
.LVUS81:
	.uleb128 0
	.uleb128 .LVU589
	.uleb128 .LVU589
	.uleb128 .LVU603
	.uleb128 .LVU603
	.uleb128 .LVU605
	.uleb128 .LVU605
	.uleb128 .LVU635
	.uleb128 .LVU635
	.uleb128 .LVU642
	.uleb128 .LVU642
	.uleb128 .LVU662
	.uleb128 .LVU662
	.uleb128 .LVU663
	.uleb128 .LVU663
	.uleb128 .LVU664
	.uleb128 .LVU664
	.uleb128 .LVU665
	.uleb128 .LVU665
	.uleb128 .LVU666
	.uleb128 .LVU666
	.uleb128 .LVU667
	.uleb128 .LVU667
	.uleb128 0
.LLST81:
	.byte	0x6
	.4byte	.LVL179
	.byte	0x4
	.uleb128 .LVL179-.LVL179
	.uleb128 .LVL183-.LVL179
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL183-.LVL179
	.uleb128 .LVL189-.LVL179
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL189-.LVL179
	.uleb128 .LVL190-.LVL179
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL190-.LVL179
	.uleb128 .LVL199-.LVL179
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL199-.LVL179
	.uleb128 .LVL201-.LVL179
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL201-.LVL179
	.uleb128 .LVL206-.LVL179
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL206-.LVL179
	.uleb128 .LVL207-.LVL179
	.uleb128 0xa
	.byte	0xa3
	.uleb128 0x3
	.byte	0xa5
	.uleb128 0
	.uleb128 0x2a
	.byte	0xa8
	.uleb128 0x31
	.byte	0xa8
	.uleb128 0
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL207-.LVL179
	.uleb128 .LVL208-.LVL179
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL208-.LVL179
	.uleb128 .LVL209-.LVL179
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL209-.LVL179
	.uleb128 .LVL210-.LVL179
	.uleb128 0xa
	.byte	0xa3
	.uleb128 0x3
	.byte	0xa5
	.uleb128 0
	.uleb128 0x2a
	.byte	0xa8
	.uleb128 0x31
	.byte	0xa8
	.uleb128 0
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL210-.LVL179
	.uleb128 .LVL211-.LVL179
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL211-.LVL179
	.uleb128 .LFE12-.LVL179
	.uleb128 0xa
	.byte	0xa3
	.uleb128 0x3
	.byte	0xa5
	.uleb128 0
	.uleb128 0x2a
	.byte	0xa8
	.uleb128 0x31
	.byte	0xa8
	.uleb128 0
	.byte	0x9f
	.byte	0
.LVUS82:
	.uleb128 0
	.uleb128 .LVU588
	.uleb128 .LVU588
	.uleb128 .LVU597
	.uleb128 .LVU597
	.uleb128 .LVU603
	.uleb128 .LVU603
	.uleb128 .LVU664
	.uleb128 .LVU664
	.uleb128 0
.LLST82:
	.byte	0x6
	.4byte	.LVL179
	.byte	0x4
	.uleb128 .LVL179-.LVL179
	.uleb128 .LVL182-.LVL179
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL182-.LVL179
	.uleb128 .LVL186-.LVL179
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL186-.LVL179
	.uleb128 .LVL189-.LVL179
	.uleb128 0x3
	.byte	0x7a
	.sleb128 -8
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL189-.LVL179
	.uleb128 .LVL208-.LVL179
	.uleb128 0xa
	.byte	0xa3
	.uleb128 0x3
	.byte	0xa5
	.uleb128 0x1
	.uleb128 0x2a
	.byte	0xa8
	.uleb128 0x31
	.byte	0xa8
	.uleb128 0
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL208-.LVL179
	.uleb128 .LFE12-.LVL179
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LVUS83:
	.uleb128 0
	.uleb128 .LVU583
	.uleb128 .LVU583
	.uleb128 .LVU603
	.uleb128 .LVU603
	.uleb128 .LVU642
	.uleb128 .LVU642
	.uleb128 .LVU649
	.uleb128 .LVU649
	.uleb128 .LVU666
	.uleb128 .LVU666
	.uleb128 0
.LLST83:
	.byte	0x6
	.4byte	.LVL179
	.byte	0x4
	.uleb128 .LVL179-.LVL179
	.uleb128 .LVL181-.LVL179
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL181-.LVL179
	.uleb128 .LVL189-.LVL179
	.uleb128 0x1
	.byte	0x57
	.byte	0x4
	.uleb128 .LVL189-.LVL179
	.uleb128 .LVL201-.LVL179
	.uleb128 0x3
	.byte	0x74
	.sleb128 -4
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL201-.LVL179
	.uleb128 .LVL204-.LVL179
	.uleb128 0x1
	.byte	0x57
	.byte	0x4
	.uleb128 .LVL204-.LVL179
	.uleb128 .LVL210-.LVL179
	.uleb128 0xa
	.byte	0xa3
	.uleb128 0x3
	.byte	0xa5
	.uleb128 0x2
	.uleb128 0x2a
	.byte	0xa8
	.uleb128 0x31
	.byte	0xa8
	.uleb128 0
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL210-.LVL179
	.uleb128 .LFE12-.LVL179
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LVUS84:
	.uleb128 .LVU580
	.uleb128 .LVU602
	.uleb128 .LVU602
	.uleb128 .LVU642
	.uleb128 .LVU642
	.uleb128 .LVU649
	.uleb128 .LVU663
	.uleb128 .LVU664
.LLST84:
	.byte	0x6
	.4byte	.LVL180
	.byte	0x4
	.uleb128 .LVL180-.LVL180
	.uleb128 .LVL188-.LVL180
	.uleb128 0x1
	.byte	0x5b
	.byte	0x4
	.uleb128 .LVL188-.LVL180
	.uleb128 .LVL201-.LVL180
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0x4
	.uleb128 .LVL201-.LVL180
	.uleb128 .LVL204-.LVL180
	.uleb128 0x1
	.byte	0x5b
	.byte	0x4
	.uleb128 .LVL207-.LVL180
	.uleb128 .LVL208-.LVL180
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
.LVUS85:
	.uleb128 .LVU581
	.uleb128 .LVU662
	.uleb128 .LVU663
	.uleb128 .LVU664
.LLST85:
	.byte	0x6
	.4byte	.LVL180
	.byte	0x4
	.uleb128 .LVL180-.LVL180
	.uleb128 .LVL206-.LVL180
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL207-.LVL180
	.uleb128 .LVL208-.LVL180
	.uleb128 0x1
	.byte	0x55
	.byte	0
.LVUS86:
	.uleb128 .LVU592
	.uleb128 .LVU603
	.uleb128 .LVU634
	.uleb128 .LVU642
	.uleb128 .LVU642
	.uleb128 .LVU643
	.uleb128 .LVU648
	.uleb128 .LVU649
	.uleb128 .LVU663
	.uleb128 .LVU664
.LLST86:
	.byte	0x6
	.4byte	.LVL184
	.byte	0x4
	.uleb128 .LVL184-.LVL184
	.uleb128 .LVL189-.LVL184
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL198-.LVL184
	.uleb128 .LVL201-.LVL184
	.uleb128 0x1
	.byte	0x59
	.byte	0x4
	.uleb128 .LVL201-.LVL184
	.uleb128 .LVL202-.LVL184
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL203-.LVL184
	.uleb128 .LVL204-.LVL184
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL207-.LVL184
	.uleb128 .LVL208-.LVL184
	.uleb128 0x1
	.byte	0x59
	.byte	0
.LVUS88:
	.uleb128 .LVU595
	.uleb128 .LVU605
	.uleb128 .LVU636
	.uleb128 .LVU642
.LLST88:
	.byte	0x6
	.4byte	.LVL185
	.byte	0x4
	.uleb128 .LVL185-.LVL185
	.uleb128 .LVL190-.LVL185
	.uleb128 0xa
	.byte	0x9e
	.uleb128 0x8
	.8byte	0
	.byte	0x4
	.uleb128 .LVL199-.LVL185
	.uleb128 .LVL201-.LVL185
	.uleb128 0xa
	.byte	0x9e
	.uleb128 0x8
	.8byte	0
	.byte	0
.LVUS90:
	.uleb128 .LVU601
	.uleb128 .LVU605
	.uleb128 .LVU605
	.uleb128 .LVU615
	.uleb128 .LVU615
	.uleb128 .LVU624
	.uleb128 .LVU624
	.uleb128 .LVU641
	.uleb128 .LVU641
	.uleb128 .LVU642
	.uleb128 .LVU663
	.uleb128 .LVU664
.LLST90:
	.byte	0x6
	.4byte	.LVL187
	.byte	0x4
	.uleb128 .LVL187-.LVL187
	.uleb128 .LVL190-.LVL187
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL190-.LVL187
	.uleb128 .LVL192-.LVL187
	.uleb128 0x1
	.byte	0x57
	.byte	0x4
	.uleb128 .LVL192-.LVL187
	.uleb128 .LVL195-.LVL187
	.uleb128 0x3
	.byte	0x77
	.sleb128 -1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL195-.LVL187
	.uleb128 .LVL200-.LVL187
	.uleb128 0x1
	.byte	0x57
	.byte	0x4
	.uleb128 .LVL200-.LVL187
	.uleb128 .LVL201-.LVL187
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL207-.LVL187
	.uleb128 .LVL208-.LVL187
	.uleb128 0x1
	.byte	0x57
	.byte	0
.LVUS92:
	.uleb128 .LVU607
	.uleb128 .LVU610
	.uleb128 .LVU610
	.uleb128 .LVU621
	.uleb128 .LVU621
	.uleb128 .LVU632
.LLST92:
	.byte	0x6
	.4byte	.LVL190
	.byte	0x4
	.uleb128 .LVL190-.LVL190
	.uleb128 .LVL191-.LVL190
	.uleb128 0x8
	.byte	0x7c
	.sleb128 4
	.byte	0x6
	.byte	0xa8
	.uleb128 0x31
	.byte	0xa8
	.uleb128 0x2a
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL191-.LVL190
	.uleb128 .LVL195-.LVL190
	.uleb128 0x8
	.byte	0x7c
	.sleb128 0
	.byte	0x6
	.byte	0xa8
	.uleb128 0x31
	.byte	0xa8
	.uleb128 0x2a
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL195-.LVL190
	.uleb128 .LVL198-.LVL190
	.uleb128 0x7
	.byte	0x71
	.sleb128 0
	.byte	0xa8
	.uleb128 0x31
	.byte	0xa8
	.uleb128 0x2a
	.byte	0x9f
	.byte	0
.LVUS93:
	.uleb128 .LVU618
	.uleb128 .LVU627
	.uleb128 .LVU627
	.uleb128 .LVU628
.LLST93:
	.byte	0x6
	.4byte	.LVL194
	.byte	0x4
	.uleb128 .LVL194-.LVL194
	.uleb128 .LVL196-.LVL194
	.uleb128 0x6
	.byte	0x53
	.byte	0x93
	.uleb128 0x4
	.byte	0x52
	.byte	0x93
	.uleb128 0x4
	.byte	0x4
	.uleb128 .LVL196-.LVL194
	.uleb128 .LVL197-.LVL194
	.uleb128 0x7
	.byte	0x7c
	.sleb128 0
	.byte	0x93
	.uleb128 0x4
	.byte	0x52
	.byte	0x93
	.uleb128 0x4
	.byte	0
.LVUS94:
	.uleb128 .LVU653
	.uleb128 .LVU662
.LLST94:
	.byte	0x8
	.4byte	.LVL205
	.uleb128 .LVL206-.LVL205
	.uleb128 0x1
	.byte	0x54
	.byte	0
.LVUS95:
	.uleb128 .LVU655
	.uleb128 .LVU662
.LLST95:
	.byte	0x8
	.4byte	.LVL205
	.uleb128 .LVL206-.LVL205
	.uleb128 0x1
	.byte	0x54
	.byte	0
.LVUS70:
	.uleb128 0
	.uleb128 .LVU497
	.uleb128 .LVU497
	.uleb128 .LVU554
	.uleb128 .LVU554
	.uleb128 .LVU555
	.uleb128 .LVU555
	.uleb128 .LVU563
	.uleb128 .LVU563
	.uleb128 .LVU565
	.uleb128 .LVU565
	.uleb128 .LVU566
	.uleb128 .LVU566
	.uleb128 0
.LLST70:
	.byte	0x6
	.4byte	.LVL153
	.byte	0x4
	.uleb128 .LVL153-.LVL153
	.uleb128 .LVL155-.LVL153
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL155-.LVL153
	.uleb128 .LVL173-.LVL153
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL173-.LVL153
	.uleb128 .LVL174-.LVL153
	.uleb128 0xa
	.byte	0xa3
	.uleb128 0x3
	.byte	0xa5
	.uleb128 0
	.uleb128 0x2a
	.byte	0xa8
	.uleb128 0x31
	.byte	0xa8
	.uleb128 0
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL174-.LVL153
	.uleb128 .LVL176-.LVL153
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL176-.LVL153
	.uleb128 .LVL177-.LVL153
	.uleb128 0xa
	.byte	0xa3
	.uleb128 0x3
	.byte	0xa5
	.uleb128 0
	.uleb128 0x2a
	.byte	0xa8
	.uleb128 0x31
	.byte	0xa8
	.uleb128 0
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL177-.LVL153
	.uleb128 .LVL178-.LVL153
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL178-.LVL153
	.uleb128 .LFE11-.LVL153
	.uleb128 0xa
	.byte	0xa3
	.uleb128 0x3
	.byte	0xa5
	.uleb128 0
	.uleb128 0x2a
	.byte	0xa8
	.uleb128 0x31
	.byte	0xa8
	.uleb128 0
	.byte	0x9f
	.byte	0
.LVUS71:
	.uleb128 0
	.uleb128 .LVU496
	.uleb128 .LVU496
	.uleb128 .LVU508
	.uleb128 .LVU508
	.uleb128 .LVU509
	.uleb128 .LVU509
	.uleb128 .LVU555
	.uleb128 .LVU555
	.uleb128 .LVU562
	.uleb128 .LVU562
	.uleb128 .LVU563
	.uleb128 .LVU563
	.uleb128 .LVU565
	.uleb128 .LVU565
	.uleb128 0
.LLST71:
	.byte	0x6
	.4byte	.LVL153
	.byte	0x4
	.uleb128 .LVL153-.LVL153
	.uleb128 .LVL154-.LVL153
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL154-.LVL153
	.uleb128 .LVL159-.LVL153
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL159-.LVL153
	.uleb128 .LVL160-.LVL153
	.uleb128 0x3
	.byte	0x79
	.sleb128 -4
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL160-.LVL153
	.uleb128 .LVL174-.LVL153
	.uleb128 0xa
	.byte	0xa3
	.uleb128 0x3
	.byte	0xa5
	.uleb128 0x1
	.uleb128 0x2a
	.byte	0xa8
	.uleb128 0x31
	.byte	0xa8
	.uleb128 0
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL174-.LVL153
	.uleb128 .LVL175-.LVL153
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL175-.LVL153
	.uleb128 .LVL176-.LVL153
	.uleb128 0xa
	.byte	0xa3
	.uleb128 0x3
	.byte	0xa5
	.uleb128 0x1
	.uleb128 0x2a
	.byte	0xa8
	.uleb128 0x31
	.byte	0xa8
	.uleb128 0
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL176-.LVL153
	.uleb128 .LVL177-.LVL153
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL177-.LVL153
	.uleb128 .LFE11-.LVL153
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LVUS72:
	.uleb128 0
	.uleb128 .LVU498
	.uleb128 .LVU498
	.uleb128 .LVU506
	.uleb128 .LVU506
	.uleb128 .LVU547
	.uleb128 .LVU547
	.uleb128 .LVU555
	.uleb128 .LVU555
	.uleb128 .LVU562
	.uleb128 .LVU562
	.uleb128 .LVU565
	.uleb128 .LVU565
	.uleb128 0
.LLST72:
	.byte	0x6
	.4byte	.LVL153
	.byte	0x4
	.uleb128 .LVL153-.LVL153
	.uleb128 .LVL156-1-.LVL153
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL156-1-.LVL153
	.uleb128 .LVL158-.LVL153
	.uleb128 0x1
	.byte	0x57
	.byte	0x4
	.uleb128 .LVL158-.LVL153
	.uleb128 .LVL169-.LVL153
	.uleb128 0x3
	.byte	0x77
	.sleb128 -8
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL169-.LVL153
	.uleb128 .LVL174-.LVL153
	.uleb128 0xa
	.byte	0xa3
	.uleb128 0x3
	.byte	0xa5
	.uleb128 0x2
	.uleb128 0x2a
	.byte	0xa8
	.uleb128 0x31
	.byte	0xa8
	.uleb128 0
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL174-.LVL153
	.uleb128 .LVL175-.LVL153
	.uleb128 0x1
	.byte	0x57
	.byte	0x4
	.uleb128 .LVL175-.LVL153
	.uleb128 .LVL177-.LVL153
	.uleb128 0xa
	.byte	0xa3
	.uleb128 0x3
	.byte	0xa5
	.uleb128 0x2
	.uleb128 0x2a
	.byte	0xa8
	.uleb128 0x31
	.byte	0xa8
	.uleb128 0
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL177-.LVL153
	.uleb128 .LFE11-.LVL153
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LVUS73:
	.uleb128 .LVU503
	.uleb128 .LVU509
	.uleb128 .LVU509
	.uleb128 .LVU517
	.uleb128 .LVU555
	.uleb128 .LVU562
.LLST73:
	.byte	0x6
	.4byte	.LVL157
	.byte	0x4
	.uleb128 .LVL157-.LVL157
	.uleb128 .LVL160-.LVL157
	.uleb128 0xa
	.byte	0x9e
	.uleb128 0x8
	.8byte	0
	.byte	0x4
	.uleb128 .LVL160-.LVL157
	.uleb128 .LVL162-.LVL157
	.uleb128 0x6
	.byte	0x5c
	.byte	0x93
	.uleb128 0x4
	.byte	0x54
	.byte	0x93
	.uleb128 0x4
	.byte	0x4
	.uleb128 .LVL174-.LVL157
	.uleb128 .LVL175-.LVL157
	.uleb128 0xa
	.byte	0x9e
	.uleb128 0x8
	.8byte	0
	.byte	0
.LVUS75:
	.uleb128 .LVU503
	.uleb128 .LVU509
	.uleb128 .LVU509
	.uleb128 .LVU523
	.uleb128 .LVU523
	.uleb128 .LVU530
	.uleb128 .LVU530
	.uleb128 .LVU547
	.uleb128 .LVU555
	.uleb128 .LVU562
.LLST75:
	.byte	0x6
	.4byte	.LVL157
	.byte	0x4
	.uleb128 .LVL157-.LVL157
	.uleb128 .LVL160-.LVL157
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL160-.LVL157
	.uleb128 .LVL165-.LVL157
	.uleb128 0x1
	.byte	0x5e
	.byte	0x4
	.uleb128 .LVL165-.LVL157
	.uleb128 .LVL167-.LVL157
	.uleb128 0x3
	.byte	0x7e
	.sleb128 -1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL167-.LVL157
	.uleb128 .LVL169-.LVL157
	.uleb128 0x1
	.byte	0x5e
	.byte	0x4
	.uleb128 .LVL174-.LVL157
	.uleb128 .LVL175-.LVL157
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS80:
	.uleb128 .LVU547
	.uleb128 .LVU550
	.uleb128 .LVU550
	.uleb128 .LVU551
.LLST80:
	.byte	0x6
	.4byte	.LVL169
	.byte	0x4
	.uleb128 .LVL169-.LVL169
	.uleb128 .LVL170-.LVL169
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL170-.LVL169
	.uleb128 .LVL171-.LVL169
	.uleb128 0x3
	.byte	0x70
	.sleb128 -2
	.byte	0x9f
	.byte	0
.LVUS78:
	.uleb128 .LVU535
	.uleb128 .LVU547
	.uleb128 .LVU558
	.uleb128 .LVU563
.LLST78:
	.byte	0x6
	.4byte	.LVL168
	.byte	0x4
	.uleb128 .LVL168-.LVL168
	.uleb128 .LVL169-.LVL168
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL175-.LVL168
	.uleb128 .LVL176-.LVL168
	.uleb128 0x1
	.byte	0x55
	.byte	0
.LVUS79:
	.uleb128 .LVU537
	.uleb128 .LVU547
	.uleb128 .LVU560
	.uleb128 .LVU563
.LLST79:
	.byte	0x6
	.4byte	.LVL168
	.byte	0x4
	.uleb128 .LVL168-.LVL168
	.uleb128 .LVL169-.LVL168
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL175-.LVL168
	.uleb128 .LVL176-.LVL168
	.uleb128 0x1
	.byte	0x55
	.byte	0
.LVUS59:
	.uleb128 0
	.uleb128 .LVU477
	.uleb128 .LVU477
	.uleb128 .LVU481
	.uleb128 .LVU481
	.uleb128 .LVU485
	.uleb128 .LVU485
	.uleb128 .LVU486
	.uleb128 .LVU486
	.uleb128 .LVU487
	.uleb128 .LVU487
	.uleb128 0
.LLST59:
	.byte	0x6
	.4byte	.LVL133
	.byte	0x4
	.uleb128 .LVL133-.LVL133
	.uleb128 .LVL145-.LVL133
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL145-.LVL133
	.uleb128 .LVL147-.LVL133
	.uleb128 0xa
	.byte	0xa3
	.uleb128 0x3
	.byte	0xa5
	.uleb128 0
	.uleb128 0x2a
	.byte	0xa8
	.uleb128 0x31
	.byte	0xa8
	.uleb128 0
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL147-.LVL133
	.uleb128 .LVL150-.LVL133
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL150-.LVL133
	.uleb128 .LVL151-.LVL133
	.uleb128 0xa
	.byte	0xa3
	.uleb128 0x3
	.byte	0xa5
	.uleb128 0
	.uleb128 0x2a
	.byte	0xa8
	.uleb128 0x31
	.byte	0xa8
	.uleb128 0
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL151-.LVL133
	.uleb128 .LVL152-.LVL133
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL152-.LVL133
	.uleb128 .LFE10-.LVL133
	.uleb128 0xa
	.byte	0xa3
	.uleb128 0x3
	.byte	0xa5
	.uleb128 0
	.uleb128 0x2a
	.byte	0xa8
	.uleb128 0x31
	.byte	0xa8
	.uleb128 0
	.byte	0x9f
	.byte	0
.LVUS60:
	.uleb128 0
	.uleb128 .LVU447
	.uleb128 .LVU447
	.uleb128 .LVU467
	.uleb128 .LVU467
	.uleb128 .LVU481
	.uleb128 .LVU481
	.uleb128 .LVU482
	.uleb128 .LVU482
	.uleb128 .LVU483
	.uleb128 .LVU483
	.uleb128 0
.LLST60:
	.byte	0x6
	.4byte	.LVL133
	.byte	0x4
	.uleb128 .LVL133-.LVL133
	.uleb128 .LVL138-.LVL133
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL138-.LVL133
	.uleb128 .LVL143-.LVL133
	.uleb128 0x3
	.byte	0x75
	.sleb128 -8
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL143-.LVL133
	.uleb128 .LVL147-.LVL133
	.uleb128 0xa
	.byte	0xa3
	.uleb128 0x3
	.byte	0xa5
	.uleb128 0x1
	.uleb128 0x2a
	.byte	0xa8
	.uleb128 0x31
	.byte	0xa8
	.uleb128 0
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL147-.LVL133
	.uleb128 .LVL148-.LVL133
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL148-.LVL133
	.uleb128 .LVL149-.LVL133
	.uleb128 0xa
	.byte	0xa3
	.uleb128 0x3
	.byte	0xa5
	.uleb128 0x1
	.uleb128 0x2a
	.byte	0xa8
	.uleb128 0x31
	.byte	0xa8
	.uleb128 0
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL149-.LVL133
	.uleb128 .LFE10-.LVL133
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LVUS61:
	.uleb128 0
	.uleb128 .LVU449
	.uleb128 .LVU449
	.uleb128 .LVU467
	.uleb128 .LVU467
	.uleb128 .LVU481
	.uleb128 .LVU481
	.uleb128 0
.LLST61:
	.byte	0x6
	.4byte	.LVL133
	.byte	0x4
	.uleb128 .LVL133-.LVL133
	.uleb128 .LVL139-.LVL133
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL139-.LVL133
	.uleb128 .LVL143-.LVL133
	.uleb128 0x3
	.byte	0x7a
	.sleb128 -8
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL143-.LVL133
	.uleb128 .LVL147-.LVL133
	.uleb128 0xa
	.byte	0xa3
	.uleb128 0x3
	.byte	0xa5
	.uleb128 0x2
	.uleb128 0x2a
	.byte	0xa8
	.uleb128 0x31
	.byte	0xa8
	.uleb128 0
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL147-.LVL133
	.uleb128 .LFE10-.LVL133
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LVUS62:
	.uleb128 .LVU436
	.uleb128 .LVU483
	.uleb128 .LVU486
	.uleb128 0
.LLST62:
	.byte	0x6
	.4byte	.LVL134
	.byte	0x4
	.uleb128 .LVL134-.LVL134
	.uleb128 .LVL149-.LVL134
	.uleb128 0x1
	.byte	0x56
	.byte	0x4
	.uleb128 .LVL151-.LVL134
	.uleb128 .LFE10-.LVL134
	.uleb128 0x1
	.byte	0x56
	.byte	0
.LVUS63:
	.uleb128 .LVU438
	.uleb128 .LVU483
	.uleb128 .LVU486
	.uleb128 0
.LLST63:
	.byte	0x6
	.4byte	.LVL135
	.byte	0x4
	.uleb128 .LVL135-.LVL135
	.uleb128 .LVL149-.LVL135
	.uleb128 0x1
	.byte	0x57
	.byte	0x4
	.uleb128 .LVL151-.LVL135
	.uleb128 .LFE10-.LVL135
	.uleb128 0x1
	.byte	0x57
	.byte	0
.LVUS64:
	.uleb128 .LVU441
	.uleb128 .LVU483
	.uleb128 .LVU486
	.uleb128 0
.LLST64:
	.byte	0x6
	.4byte	.LVL136
	.byte	0x4
	.uleb128 .LVL136-.LVL136
	.uleb128 .LVL149-.LVL136
	.uleb128 0x16
	.byte	0x76
	.sleb128 0
	.byte	0x12
	.byte	0x40
	.byte	0x4b
	.byte	0x24
	.byte	0x22
	.byte	0x77
	.sleb128 0
	.byte	0x16
	.byte	0x14
	.byte	0x40
	.byte	0x4b
	.byte	0x24
	.byte	0x22
	.byte	0x2b
	.byte	0x28
	.2byte	0x1
	.byte	0x16
	.byte	0x13
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL151-.LVL136
	.uleb128 .LFE10-.LVL136
	.uleb128 0x16
	.byte	0x76
	.sleb128 0
	.byte	0x12
	.byte	0x40
	.byte	0x4b
	.byte	0x24
	.byte	0x22
	.byte	0x77
	.sleb128 0
	.byte	0x16
	.byte	0x14
	.byte	0x40
	.byte	0x4b
	.byte	0x24
	.byte	0x22
	.byte	0x2b
	.byte	0x28
	.2byte	0x1
	.byte	0x16
	.byte	0x13
	.byte	0x9f
	.byte	0
.LVUS65:
	.uleb128 .LVU444
	.uleb128 .LVU449
	.uleb128 .LVU449
	.uleb128 .LVU454
	.uleb128 .LVU481
	.uleb128 .LVU483
.LLST65:
	.byte	0x6
	.4byte	.LVL137
	.byte	0x4
	.uleb128 .LVL137-.LVL137
	.uleb128 .LVL139-.LVL137
	.uleb128 0xa
	.byte	0x9e
	.uleb128 0x8
	.8byte	0
	.byte	0x4
	.uleb128 .LVL139-.LVL137
	.uleb128 .LVL140-.LVL137
	.uleb128 0x6
	.byte	0x53
	.byte	0x93
	.uleb128 0x4
	.byte	0x5c
	.byte	0x93
	.uleb128 0x4
	.byte	0x4
	.uleb128 .LVL147-.LVL137
	.uleb128 .LVL149-.LVL137
	.uleb128 0xa
	.byte	0x9e
	.uleb128 0x8
	.8byte	0
	.byte	0
.LVUS67:
	.uleb128 .LVU444
	.uleb128 .LVU449
	.uleb128 .LVU449
	.uleb128 .LVU459
	.uleb128 .LVU459
	.uleb128 .LVU465
	.uleb128 .LVU465
	.uleb128 .LVU467
	.uleb128 .LVU481
	.uleb128 .LVU483
.LLST67:
	.byte	0x6
	.4byte	.LVL137
	.byte	0x4
	.uleb128 .LVL137-.LVL137
	.uleb128 .LVL139-.LVL137
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL139-.LVL137
	.uleb128 .LVL141-.LVL137
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL141-.LVL137
	.uleb128 .LVL142-.LVL137
	.uleb128 0x3
	.byte	0x71
	.sleb128 -1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL142-.LVL137
	.uleb128 .LVL143-.LVL137
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL147-.LVL137
	.uleb128 .LVL149-.LVL137
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS43:
	.uleb128 0
	.uleb128 .LVU335
	.uleb128 .LVU335
	.uleb128 .LVU359
	.uleb128 .LVU359
	.uleb128 .LVU382
	.uleb128 .LVU382
	.uleb128 .LVU388
	.uleb128 .LVU388
	.uleb128 0
.LLST43:
	.byte	0x6
	.4byte	.LVL98
	.byte	0x4
	.uleb128 .LVL98-.LVL98
	.uleb128 .LVL114-.LVL98
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL114-.LVL98
	.uleb128 .LVL120-.LVL98
	.uleb128 0xa
	.byte	0xa3
	.uleb128 0x3
	.byte	0xa5
	.uleb128 0
	.uleb128 0x2a
	.byte	0xa8
	.uleb128 0x31
	.byte	0xa8
	.uleb128 0
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL120-.LVL98
	.uleb128 .LVL123-.LVL98
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL123-.LVL98
	.uleb128 .LVL125-.LVL98
	.uleb128 0xa
	.byte	0xa3
	.uleb128 0x3
	.byte	0xa5
	.uleb128 0
	.uleb128 0x2a
	.byte	0xa8
	.uleb128 0x31
	.byte	0xa8
	.uleb128 0
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL125-.LVL98
	.uleb128 .LFE9-.LVL98
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LVUS44:
	.uleb128 .LVU304
	.uleb128 .LVU306
	.uleb128 .LVU306
	.uleb128 .LVU308
	.uleb128 .LVU308
	.uleb128 .LVU309
	.uleb128 .LVU310
	.uleb128 .LVU334
	.uleb128 .LVU334
	.uleb128 .LVU335
	.uleb128 .LVU378
	.uleb128 .LVU382
	.uleb128 .LVU388
	.uleb128 0
.LLST44:
	.byte	0x6
	.4byte	.LVL103
	.byte	0x4
	.uleb128 .LVL103-.LVL103
	.uleb128 .LVL104-.LVL103
	.uleb128 0x3
	.byte	0x74
	.sleb128 -1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL104-.LVL103
	.uleb128 .LVL105-.LVL103
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL105-.LVL103
	.uleb128 .LVL106-.LVL103
	.uleb128 0x3
	.byte	0x75
	.sleb128 1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL106-.LVL103
	.uleb128 .LVL113-.LVL103
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL113-.LVL103
	.uleb128 .LVL114-.LVL103
	.uleb128 0x3
	.byte	0x77
	.sleb128 -2
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL121-.LVL103
	.uleb128 .LVL123-.LVL103
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL125-.LVL103
	.uleb128 .LFE9-.LVL103
	.uleb128 0x1
	.byte	0x55
	.byte	0
.LVUS45:
	.uleb128 .LVU313
	.uleb128 .LVU328
	.uleb128 .LVU332
	.uleb128 .LVU347
	.uleb128 .LVU347
	.uleb128 .LVU353
	.uleb128 .LVU353
	.uleb128 .LVU359
	.uleb128 .LVU378
	.uleb128 .LVU381
	.uleb128 .LVU381
	.uleb128 .LVU386
	.uleb128 .LVU388
	.uleb128 .LVU389
	.uleb128 .LVU392
	.uleb128 .LVU397
	.uleb128 .LVU397
	.uleb128 .LVU406
	.uleb128 .LVU406
	.uleb128 .LVU414
	.uleb128 .LVU414
	.uleb128 .LVU426
	.uleb128 .LVU426
	.uleb128 .LVU427
	.uleb128 .LVU427
	.uleb128 0
.LLST45:
	.byte	0x6
	.4byte	.LVL107
	.byte	0x4
	.uleb128 .LVL107-.LVL107
	.uleb128 .LVL111-.LVL107
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL112-.LVL107
	.uleb128 .LVL117-.LVL107
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL117-.LVL107
	.uleb128 .LVL118-.LVL107
	.uleb128 0x1
	.byte	0x5e
	.byte	0x4
	.uleb128 .LVL118-.LVL107
	.uleb128 .LVL120-.LVL107
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL121-.LVL107
	.uleb128 .LVL122-.LVL107
	.uleb128 0x1
	.byte	0x5e
	.byte	0x4
	.uleb128 .LVL122-.LVL107
	.uleb128 .LVL124-.LVL107
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL125-.LVL107
	.uleb128 .LVL126-.LVL107
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL126-.LVL107
	.uleb128 .LVL126-.LVL107
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL126-.LVL107
	.uleb128 .LVL128-.LVL107
	.uleb128 0x1
	.byte	0x5e
	.byte	0x4
	.uleb128 .LVL128-.LVL107
	.uleb128 .LVL128-.LVL107
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL128-.LVL107
	.uleb128 .LVL131-.LVL107
	.uleb128 0x1
	.byte	0x5e
	.byte	0x4
	.uleb128 .LVL131-.LVL107
	.uleb128 .LVL132-.LVL107
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL132-.LVL107
	.uleb128 .LFE9-.LVL107
	.uleb128 0x1
	.byte	0x5e
	.byte	0
.LVUS46:
	.uleb128 .LVU315
	.uleb128 .LVU335
	.uleb128 .LVU338
	.uleb128 .LVU359
	.uleb128 .LVU378
	.uleb128 .LVU382
	.uleb128 .LVU388
	.uleb128 0
.LLST46:
	.byte	0x6
	.4byte	.LVL108
	.byte	0x4
	.uleb128 .LVL108-.LVL108
	.uleb128 .LVL114-.LVL108
	.uleb128 0x1
	.byte	0x5c
	.byte	0x4
	.uleb128 .LVL115-.LVL108
	.uleb128 .LVL120-.LVL108
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL121-.LVL108
	.uleb128 .LVL123-.LVL108
	.uleb128 0x1
	.byte	0x5c
	.byte	0x4
	.uleb128 .LVL125-.LVL108
	.uleb128 .LFE9-.LVL108
	.uleb128 0x1
	.byte	0x5c
	.byte	0
.LVUS47:
	.uleb128 .LVU316
	.uleb128 .LVU328
	.uleb128 .LVU378
	.uleb128 .LVU382
	.uleb128 .LVU388
	.uleb128 .LVU389
	.uleb128 .LVU390
	.uleb128 0
.LLST47:
	.byte	0x6
	.4byte	.LVL108
	.byte	0x4
	.uleb128 .LVL108-.LVL108
	.uleb128 .LVL111-.LVL108
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL121-.LVL108
	.uleb128 .LVL123-.LVL108
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL125-.LVL108
	.uleb128 .LVL126-.LVL108
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL126-.LVL108
	.uleb128 .LFE9-.LVL108
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0
.LVUS51:
	.uleb128 .LVU318
	.uleb128 .LVU319
.LLST51:
	.byte	0x8
	.4byte	.LVL108
	.uleb128 .LVL108-.LVL108
	.uleb128 0x2
	.byte	0x37
	.byte	0x9f
	.byte	0
.LVUS53:
	.uleb128 .LVU324
	.uleb128 .LVU326
	.uleb128 .LVU326
	.uleb128 .LVU328
	.uleb128 .LVU388
	.uleb128 .LVU389
	.uleb128 .LVU389
	.uleb128 .LVU401
	.uleb128 .LVU405
	.uleb128 .LVU417
	.uleb128 .LVU424
	.uleb128 .LVU427
.LLST53:
	.byte	0x6
	.4byte	.LVL109
	.byte	0x4
	.uleb128 .LVL109-.LVL109
	.uleb128 .LVL110-.LVL109
	.uleb128 0x5
	.byte	0x74
	.sleb128 0
	.byte	0x3f
	.byte	0x1a
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL110-.LVL109
	.uleb128 .LVL111-.LVL109
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL125-.LVL109
	.uleb128 .LVL126-.LVL109
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL126-.LVL109
	.uleb128 .LVL127-.LVL109
	.uleb128 0x1
	.byte	0x56
	.byte	0x4
	.uleb128 .LVL128-.LVL109
	.uleb128 .LVL129-.LVL109
	.uleb128 0x1
	.byte	0x56
	.byte	0x4
	.uleb128 .LVL130-.LVL109
	.uleb128 .LVL132-.LVL109
	.uleb128 0x1
	.byte	0x56
	.byte	0
.LVUS55:
	.uleb128 .LVU332
	.uleb128 .LVU358
	.uleb128 .LVU358
	.uleb128 .LVU359
	.uleb128 .LVU381
	.uleb128 .LVU382
.LLST55:
	.byte	0x6
	.4byte	.LVL112
	.byte	0x4
	.uleb128 .LVL112-.LVL112
	.uleb128 .LVL119-.LVL112
	.uleb128 0x1
	.byte	0x56
	.byte	0x4
	.uleb128 .LVL119-.LVL112
	.uleb128 .LVL120-.LVL112
	.uleb128 0x3
	.byte	0x76
	.sleb128 1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL122-.LVL112
	.uleb128 .LVL123-.LVL112
	.uleb128 0x1
	.byte	0x56
	.byte	0
.LVUS57:
	.uleb128 .LVU340
	.uleb128 .LVU342
.LLST57:
	.byte	0x8
	.4byte	.LVL115
	.uleb128 .LVL116-.LVL115
	.uleb128 0x2
	.byte	0x37
	.byte	0x9f
	.byte	0
.LVUS49:
	.uleb128 .LVU290
	.uleb128 .LVU295
	.uleb128 .LVU295
	.uleb128 .LVU302
.LLST49:
	.byte	0x6
	.4byte	.LVL99
	.byte	0x4
	.uleb128 .LVL99-.LVL99
	.uleb128 .LVL100-.LVL99
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL100-.LVL99
	.uleb128 .LVL103-.LVL99
	.uleb128 0x1
	.byte	0x53
	.byte	0
.LVUS24:
	.uleb128 0
	.uleb128 .LVU183
	.uleb128 .LVU183
	.uleb128 .LVU197
	.uleb128 .LVU197
	.uleb128 .LVU271
	.uleb128 .LVU271
	.uleb128 .LVU279
	.uleb128 .LVU279
	.uleb128 .LVU281
	.uleb128 .LVU281
	.uleb128 .LVU282
	.uleb128 .LVU282
	.uleb128 0
.LLST24:
	.byte	0x6
	.4byte	.LVL63
	.byte	0x4
	.uleb128 .LVL63-.LVL63
	.uleb128 .LVL66-.LVL63
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL66-.LVL63
	.uleb128 .LVL71-.LVL63
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL71-.LVL63
	.uleb128 .LVL92-.LVL63
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL92-.LVL63
	.uleb128 .LVL95-.LVL63
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL95-.LVL63
	.uleb128 .LVL96-.LVL63
	.uleb128 0xa
	.byte	0xa3
	.uleb128 0x3
	.byte	0xa5
	.uleb128 0
	.uleb128 0x2a
	.byte	0xa8
	.uleb128 0x31
	.byte	0xa8
	.uleb128 0
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL96-.LVL63
	.uleb128 .LVL97-.LVL63
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL97-.LVL63
	.uleb128 .LFE8-.LVL63
	.uleb128 0xa
	.byte	0xa3
	.uleb128 0x3
	.byte	0xa5
	.uleb128 0
	.uleb128 0x2a
	.byte	0xa8
	.uleb128 0x31
	.byte	0xa8
	.uleb128 0
	.byte	0x9f
	.byte	0
.LVUS25:
	.uleb128 0
	.uleb128 .LVU182
	.uleb128 .LVU182
	.uleb128 .LVU281
	.uleb128 .LVU281
	.uleb128 0
.LLST25:
	.byte	0x6
	.4byte	.LVL63
	.byte	0x4
	.uleb128 .LVL63-.LVL63
	.uleb128 .LVL65-.LVL63
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL65-.LVL63
	.uleb128 .LVL96-.LVL63
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL96-.LVL63
	.uleb128 .LFE8-.LVL63
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LVUS26:
	.uleb128 .LVU189
	.uleb128 .LVU199
	.uleb128 .LVU199
	.uleb128 .LVU201
	.uleb128 .LVU201
	.uleb128 .LVU205
.LLST26:
	.byte	0x6
	.4byte	.LVL69
	.byte	0x4
	.uleb128 .LVL69-.LVL69
	.uleb128 .LVL72-.LVL69
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL72-.LVL69
	.uleb128 .LVL73-.LVL69
	.uleb128 0x3
	.byte	0x70
	.sleb128 9
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL73-.LVL69
	.uleb128 .LVL74-.LVL69
	.uleb128 0x3
	.byte	0x73
	.sleb128 1
	.byte	0x9f
	.byte	0
.LVUS27:
	.uleb128 .LVU190
	.uleb128 .LVU201
	.uleb128 .LVU201
	.uleb128 .LVU240
	.uleb128 .LVU240
	.uleb128 .LVU252
	.uleb128 .LVU252
	.uleb128 .LVU259
	.uleb128 .LVU259
	.uleb128 .LVU272
.LLST27:
	.byte	0x6
	.4byte	.LVL69
	.byte	0x4
	.uleb128 .LVL69-.LVL69
	.uleb128 .LVL73-.LVL69
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL73-.LVL69
	.uleb128 .LVL84-.LVL69
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL84-.LVL69
	.uleb128 .LVL87-.LVL69
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL87-.LVL69
	.uleb128 .LVL89-.LVL69
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL89-.LVL69
	.uleb128 .LVL93-.LVL69
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LVUS31:
	.uleb128 .LVU193
	.uleb128 .LVU205
	.uleb128 .LVU205
	.uleb128 .LVU208
	.uleb128 .LVU208
	.uleb128 .LVU242
	.uleb128 .LVU242
	.uleb128 .LVU254
	.uleb128 .LVU254
	.uleb128 .LVU261
	.uleb128 .LVU261
	.uleb128 .LVU276
.LLST31:
	.byte	0x6
	.4byte	.LVL70
	.byte	0x4
	.uleb128 .LVL70-.LVL70
	.uleb128 .LVL74-.LVL70
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL74-.LVL70
	.uleb128 .LVL77-.LVL70
	.uleb128 0x1
	.byte	0x5e
	.byte	0x4
	.uleb128 .LVL77-.LVL70
	.uleb128 .LVL84-.LVL70
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.byte	0x4
	.uleb128 .LVL84-.LVL70
	.uleb128 .LVL88-.LVL70
	.uleb128 0x1
	.byte	0x5e
	.byte	0x4
	.uleb128 .LVL88-.LVL70
	.uleb128 .LVL89-.LVL70
	.uleb128 0x3
	.byte	0x7e
	.sleb128 8
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL89-.LVL70
	.uleb128 .LVL94-.LVL70
	.uleb128 0x1
	.byte	0x5e
	.byte	0
.LVUS33:
	.uleb128 .LVU202
	.uleb128 .LVU208
	.uleb128 .LVU208
	.uleb128 .LVU243
	.uleb128 .LVU249
	.uleb128 .LVU262
.LLST33:
	.byte	0x6
	.4byte	.LVL73
	.byte	0x4
	.uleb128 .LVL73-.LVL73
	.uleb128 .LVL77-.LVL73
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL77-.LVL73
	.uleb128 .LVL85-.LVL73
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL86-.LVL73
	.uleb128 .LVL90-.LVL73
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS34:
	.uleb128 .LVU203
	.uleb128 .LVU204
	.uleb128 .LVU250
	.uleb128 .LVU251
.LLST34:
	.byte	0x8
	.4byte	.LVL73
	.uleb128 .LVL73-.LVL73
	.uleb128 0x3
	.byte	0x73
	.sleb128 -7
	.byte	0x9f
	.byte	0x8
	.4byte	.LVL86
	.uleb128 .LVL86-.LVL86
	.uleb128 0x3
	.byte	0x7e
	.sleb128 -7
	.byte	0x9f
	.byte	0
.LVUS36:
	.uleb128 .LVU204
	.uleb128 .LVU206
	.uleb128 .LVU206
	.uleb128 .LVU207
	.uleb128 .LVU251
	.uleb128 .LVU262
.LLST36:
	.byte	0x6
	.4byte	.LVL73
	.byte	0x4
	.uleb128 .LVL73-.LVL73
	.uleb128 .LVL75-.LVL73
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL75-.LVL73
	.uleb128 .LVL76-.LVL73
	.uleb128 0x3
	.byte	0x75
	.sleb128 1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL86-.LVL73
	.uleb128 .LVL90-.LVL73
	.uleb128 0x1
	.byte	0x55
	.byte	0
.LVUS38:
	.uleb128 .LVU210
	.uleb128 .LVU212
	.uleb128 .LVU232
	.uleb128 .LVU234
.LLST38:
	.byte	0x6
	.4byte	.LVL78
	.byte	0x4
	.uleb128 .LVL78-.LVL78
	.uleb128 .LVL78-.LVL78
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL82-.LVL78
	.uleb128 .LVL83-.LVL78
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LVUS40:
	.uleb128 .LVU208
	.uleb128 .LVU210
	.uleb128 .LVU222
	.uleb128 .LVU232
.LLST40:
	.byte	0x6
	.4byte	.LVL77
	.byte	0x4
	.uleb128 .LVL77-.LVL77
	.uleb128 .LVL78-.LVL77
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL81-.LVL77
	.uleb128 .LVL82-.LVL77
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LVUS28:
	.uleb128 .LVU176
	.uleb128 .LVU183
	.uleb128 .LVU183
	.uleb128 .LVU186
.LLST28:
	.byte	0x6
	.4byte	.LVL64
	.byte	0x4
	.uleb128 .LVL64-.LVL64
	.uleb128 .LVL66-.LVL64
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL66-.LVL64
	.uleb128 .LVL68-.LVL64
	.uleb128 0x1
	.byte	0x55
	.byte	0
.LVUS29:
	.uleb128 .LVU178
	.uleb128 .LVU183
	.uleb128 .LVU183
	.uleb128 .LVU186
.LLST29:
	.byte	0x6
	.4byte	.LVL64
	.byte	0x4
	.uleb128 .LVL64-.LVL64
	.uleb128 .LVL66-.LVL64
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL66-.LVL64
	.uleb128 .LVL68-.LVL64
	.uleb128 0x1
	.byte	0x55
	.byte	0
.LVUS42:
	.uleb128 .LVU268
	.uleb128 .LVU270
.LLST42:
	.byte	0x8
	.4byte	.LVL91
	.uleb128 .LVL91-.LVL91
	.uleb128 0x1
	.byte	0x55
	.byte	0
.LVUS6:
	.uleb128 0
	.uleb128 .LVU50
	.uleb128 .LVU50
	.uleb128 .LVU59
	.uleb128 .LVU59
	.uleb128 .LVU60
	.uleb128 .LVU60
	.uleb128 .LVU61
	.uleb128 .LVU61
	.uleb128 .LVU62
	.uleb128 .LVU62
	.uleb128 0
.LLST6:
	.byte	0x6
	.4byte	.LVL15
	.byte	0x4
	.uleb128 .LVL15-.LVL15
	.uleb128 .LVL16-.LVL15
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL16-.LVL15
	.uleb128 .LVL20-.LVL15
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL20-.LVL15
	.uleb128 .LVL21-.LVL15
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL21-.LVL15
	.uleb128 .LVL22-.LVL15
	.uleb128 0xa
	.byte	0xa3
	.uleb128 0x3
	.byte	0xa5
	.uleb128 0
	.uleb128 0x2a
	.byte	0xa8
	.uleb128 0x31
	.byte	0xa8
	.uleb128 0
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL22-.LVL15
	.uleb128 .LVL23-.LVL15
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL23-.LVL15
	.uleb128 .LFE3-.LVL15
	.uleb128 0xa
	.byte	0xa3
	.uleb128 0x3
	.byte	0xa5
	.uleb128 0
	.uleb128 0x2a
	.byte	0xa8
	.uleb128 0x31
	.byte	0xa8
	.uleb128 0
	.byte	0x9f
	.byte	0
.LVUS7:
	.uleb128 0
	.uleb128 .LVU51
	.uleb128 .LVU51
	.uleb128 .LVU59
	.uleb128 .LVU59
	.uleb128 0
.LLST7:
	.byte	0x6
	.4byte	.LVL15
	.byte	0x4
	.uleb128 .LVL15-.LVL15
	.uleb128 .LVL17-.LVL15
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL17-.LVL15
	.uleb128 .LVL20-.LVL15
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL20-.LVL15
	.uleb128 .LFE3-.LVL15
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LVUS2:
	.uleb128 0
	.uleb128 .LVU24
	.uleb128 .LVU24
	.uleb128 .LVU24
	.uleb128 .LVU24
	.uleb128 0
.LLST2:
	.byte	0x6
	.4byte	.LVL7
	.byte	0x4
	.uleb128 .LVL7-.LVL7
	.uleb128 .LVL8-1-.LVL7
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL8-1-.LVL7
	.uleb128 .LVL8-.LVL7
	.uleb128 0xa
	.byte	0xa3
	.uleb128 0x3
	.byte	0xa5
	.uleb128 0
	.uleb128 0x2a
	.byte	0xa8
	.uleb128 0x31
	.byte	0xa8
	.uleb128 0
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL8-.LVL7
	.uleb128 .LFE1-.LVL7
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LVUS0:
	.uleb128 0
	.uleb128 .LVU2
	.uleb128 .LVU2
	.uleb128 .LVU5
	.uleb128 .LVU5
	.uleb128 .LVU7
	.uleb128 .LVU7
	.uleb128 0
.LLST0:
	.byte	0x6
	.4byte	.LVL0
	.byte	0x4
	.uleb128 .LVL0-.LVL0
	.uleb128 .LVL1-.LVL0
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL1-.LVL0
	.uleb128 .LVL2-.LVL0
	.uleb128 0xa
	.byte	0xa3
	.uleb128 0x3
	.byte	0xa5
	.uleb128 0
	.uleb128 0x2a
	.byte	0xa8
	.uleb128 0x31
	.byte	0xa8
	.uleb128 0
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL2-.LVL0
	.uleb128 .LVL3-.LVL0
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL3-.LVL0
	.uleb128 .LFE0-.LVL0
	.uleb128 0x1
	.byte	0x56
	.byte	0
.LVUS1:
	.uleb128 .LVU8
	.uleb128 .LVU16
	.uleb128 .LVU16
	.uleb128 0
.LLST1:
	.byte	0x6
	.4byte	.LVL4
	.byte	0x4
	.uleb128 .LVL4-.LVL4
	.uleb128 .LVL5-.LVL4
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL5-.LVL4
	.uleb128 .LFE0-.LVL4
	.uleb128 0x1
	.byte	0x54
	.byte	0
.LVUS3:
	.uleb128 0
	.uleb128 .LVU32
	.uleb128 .LVU32
	.uleb128 .LVU37
	.uleb128 .LVU37
	.uleb128 0
.LLST3:
	.byte	0x6
	.4byte	.LVL9
	.byte	0x4
	.uleb128 .LVL9-.LVL9
	.uleb128 .LVL11-.LVL9
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL11-.LVL9
	.uleb128 .LVL14-.LVL9
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL14-.LVL9
	.uleb128 .LFE2-.LVL9
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LVUS5:
	.uleb128 .LVU28
	.uleb128 .LVU32
	.uleb128 .LVU32
	.uleb128 .LVU35
.LLST5:
	.byte	0x6
	.4byte	.LVL10
	.byte	0x4
	.uleb128 .LVL10-.LVL10
	.uleb128 .LVL11-.LVL10
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL11-.LVL10
	.uleb128 .LVL13-.LVL10
	.uleb128 0x1
	.byte	0x54
	.byte	0
.LVUS8:
	.uleb128 0
	.uleb128 .LVU80
	.uleb128 .LVU80
	.uleb128 .LVU81
	.uleb128 .LVU81
	.uleb128 0
.LLST8:
	.byte	0x6
	.4byte	.LVL25
	.byte	0x4
	.uleb128 .LVL25-.LVL25
	.uleb128 .LVL27-.LVL25
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL27-.LVL25
	.uleb128 .LVL28-.LVL25
	.uleb128 0x3
	.byte	0x70
	.sleb128 -4
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL28-.LVL25
	.uleb128 .LFE5-.LVL25
	.uleb128 0xa
	.byte	0xa3
	.uleb128 0x3
	.byte	0xa5
	.uleb128 0
	.uleb128 0x2a
	.byte	0xa8
	.uleb128 0x31
	.byte	0xa8
	.uleb128 0
	.byte	0x9f
	.byte	0
.LVUS9:
	.uleb128 .LVU77
	.uleb128 .LVU81
	.uleb128 .LVU81
	.uleb128 .LVU89
.LLST9:
	.byte	0x6
	.4byte	.LVL26
	.byte	0x4
	.uleb128 .LVL26-.LVL26
	.uleb128 .LVL28-.LVL26
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL28-.LVL26
	.uleb128 .LVL31-.LVL26
	.uleb128 0x1
	.byte	0x53
	.byte	0
.LVUS10:
	.uleb128 0
	.uleb128 .LVU120
	.uleb128 .LVU120
	.uleb128 .LVU137
	.uleb128 .LVU137
	.uleb128 .LVU142
	.uleb128 .LVU142
	.uleb128 .LVU150
	.uleb128 .LVU150
	.uleb128 .LVU152
	.uleb128 .LVU152
	.uleb128 .LVU158
	.uleb128 .LVU158
	.uleb128 .LVU159
	.uleb128 .LVU159
	.uleb128 .LVU160
	.uleb128 .LVU160
	.uleb128 0
.LLST10:
	.byte	0x6
	.4byte	.LVL32
	.byte	0x4
	.uleb128 .LVL32-.LVL32
	.uleb128 .LVL38-.LVL32
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL38-.LVL32
	.uleb128 .LVL45-.LVL32
	.uleb128 0xa
	.byte	0xa3
	.uleb128 0x3
	.byte	0xa5
	.uleb128 0
	.uleb128 0x2a
	.byte	0xa8
	.uleb128 0x31
	.byte	0xa8
	.uleb128 0
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL45-.LVL32
	.uleb128 .LVL48-.LVL32
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL48-.LVL32
	.uleb128 .LVL52-.LVL32
	.uleb128 0xa
	.byte	0xa3
	.uleb128 0x3
	.byte	0xa5
	.uleb128 0
	.uleb128 0x2a
	.byte	0xa8
	.uleb128 0x31
	.byte	0xa8
	.uleb128 0
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL52-.LVL32
	.uleb128 .LVL53-.LVL32
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL53-.LVL32
	.uleb128 .LVL57-.LVL32
	.uleb128 0xa
	.byte	0xa3
	.uleb128 0x3
	.byte	0xa5
	.uleb128 0
	.uleb128 0x2a
	.byte	0xa8
	.uleb128 0x31
	.byte	0xa8
	.uleb128 0
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL57-.LVL32
	.uleb128 .LVL58-.LVL32
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL58-.LVL32
	.uleb128 .LVL59-.LVL32
	.uleb128 0x3
	.byte	0x70
	.sleb128 -4
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL59-.LVL32
	.uleb128 .LFE6-.LVL32
	.uleb128 0xa
	.byte	0xa3
	.uleb128 0x3
	.byte	0xa5
	.uleb128 0
	.uleb128 0x2a
	.byte	0xa8
	.uleb128 0x31
	.byte	0xa8
	.uleb128 0
	.byte	0x9f
	.byte	0
.LVUS11:
	.uleb128 0
	.uleb128 .LVU121
	.uleb128 .LVU121
	.uleb128 .LVU137
	.uleb128 .LVU137
	.uleb128 .LVU141
	.uleb128 .LVU141
	.uleb128 .LVU142
	.uleb128 .LVU142
	.uleb128 .LVU150
	.uleb128 .LVU150
	.uleb128 .LVU153
	.uleb128 .LVU153
	.uleb128 .LVU158
	.uleb128 .LVU158
	.uleb128 .LVU160
	.uleb128 .LVU160
	.uleb128 0
.LLST11:
	.byte	0x6
	.4byte	.LVL32
	.byte	0x4
	.uleb128 .LVL32-.LVL32
	.uleb128 .LVL39-.LVL32
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL39-.LVL32
	.uleb128 .LVL45-.LVL32
	.uleb128 0xa
	.byte	0xa3
	.uleb128 0x3
	.byte	0xa5
	.uleb128 0x1
	.uleb128 0x2a
	.byte	0xa8
	.uleb128 0x31
	.byte	0xa8
	.uleb128 0
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL45-.LVL32
	.uleb128 .LVL47-.LVL32
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL47-.LVL32
	.uleb128 .LVL48-.LVL32
	.uleb128 0x3
	.byte	0x71
	.sleb128 -4
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL48-.LVL32
	.uleb128 .LVL52-.LVL32
	.uleb128 0xa
	.byte	0xa3
	.uleb128 0x3
	.byte	0xa5
	.uleb128 0x1
	.uleb128 0x2a
	.byte	0xa8
	.uleb128 0x31
	.byte	0xa8
	.uleb128 0
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL52-.LVL32
	.uleb128 .LVL54-.LVL32
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL54-.LVL32
	.uleb128 .LVL57-.LVL32
	.uleb128 0xa
	.byte	0xa3
	.uleb128 0x3
	.byte	0xa5
	.uleb128 0x1
	.uleb128 0x2a
	.byte	0xa8
	.uleb128 0x31
	.byte	0xa8
	.uleb128 0
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL57-.LVL32
	.uleb128 .LVL59-.LVL32
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL59-.LVL32
	.uleb128 .LFE6-.LVL32
	.uleb128 0xa
	.byte	0xa3
	.uleb128 0x3
	.byte	0xa5
	.uleb128 0x1
	.uleb128 0x2a
	.byte	0xa8
	.uleb128 0x31
	.byte	0xa8
	.uleb128 0
	.byte	0x9f
	.byte	0
.LVUS13:
	.uleb128 .LVU158
	.uleb128 .LVU160
	.uleb128 .LVU160
	.uleb128 .LVU167
.LLST13:
	.byte	0x6
	.4byte	.LVL57
	.byte	0x4
	.uleb128 .LVL57-.LVL57
	.uleb128 .LVL59-.LVL57
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL59-.LVL57
	.uleb128 .LVL62-.LVL57
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LVUS15:
	.uleb128 .LVU98
	.uleb128 .LVU121
	.uleb128 .LVU121
	.uleb128 .LVU135
	.uleb128 .LVU153
	.uleb128 .LVU157
.LLST15:
	.byte	0x6
	.4byte	.LVL33
	.byte	0x4
	.uleb128 .LVL33-.LVL33
	.uleb128 .LVL39-.LVL33
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL39-.LVL33
	.uleb128 .LVL44-.LVL33
	.uleb128 0xa
	.byte	0xa3
	.uleb128 0x3
	.byte	0xa5
	.uleb128 0x1
	.uleb128 0x2a
	.byte	0xa8
	.uleb128 0x31
	.byte	0xa8
	.uleb128 0
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL54-.LVL33
	.uleb128 .LVL56-.LVL33
	.uleb128 0xa
	.byte	0xa3
	.uleb128 0x3
	.byte	0xa5
	.uleb128 0x1
	.uleb128 0x2a
	.byte	0xa8
	.uleb128 0x31
	.byte	0xa8
	.uleb128 0
	.byte	0x9f
	.byte	0
.LVUS16:
	.uleb128 .LVU98
	.uleb128 .LVU120
	.uleb128 .LVU120
	.uleb128 .LVU135
	.uleb128 .LVU153
	.uleb128 .LVU157
.LLST16:
	.byte	0x6
	.4byte	.LVL33
	.byte	0x4
	.uleb128 .LVL33-.LVL33
	.uleb128 .LVL38-.LVL33
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL38-.LVL33
	.uleb128 .LVL44-.LVL33
	.uleb128 0xa
	.byte	0xa3
	.uleb128 0x3
	.byte	0xa5
	.uleb128 0
	.uleb128 0x2a
	.byte	0xa8
	.uleb128 0x31
	.byte	0xa8
	.uleb128 0
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL54-.LVL33
	.uleb128 .LVL56-.LVL33
	.uleb128 0xa
	.byte	0xa3
	.uleb128 0x3
	.byte	0xa5
	.uleb128 0
	.uleb128 0x2a
	.byte	0xa8
	.uleb128 0x31
	.byte	0xa8
	.uleb128 0
	.byte	0x9f
	.byte	0
.LVUS17:
	.uleb128 .LVU100
	.uleb128 .LVU121
.LLST17:
	.byte	0x8
	.4byte	.LVL33
	.uleb128 .LVL39-.LVL33
	.uleb128 0x1
	.byte	0x53
	.byte	0
.LVUS18:
	.uleb128 .LVU103
	.uleb128 .LVU119
.LLST18:
	.byte	0x8
	.4byte	.LVL34
	.uleb128 .LVL37-.LVL34
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LVUS19:
	.uleb128 .LVU123
	.uleb128 .LVU131
	.uleb128 .LVU131
	.uleb128 .LVU133
	.uleb128 .LVU155
	.uleb128 .LVU157
.LLST19:
	.byte	0x6
	.4byte	.LVL39
	.byte	0x4
	.uleb128 .LVL39-.LVL39
	.uleb128 .LVL42-.LVL39
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL42-.LVL39
	.uleb128 .LVL43-.LVL39
	.uleb128 0x3
	.byte	0x73
	.sleb128 1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL55-.LVL39
	.uleb128 .LVL56-.LVL39
	.uleb128 0x1
	.byte	0x53
	.byte	0
.LVUS21:
	.uleb128 .LVU126
	.uleb128 .LVU133
.LLST21:
	.byte	0x8
	.4byte	.LVL40
	.uleb128 .LVL43-.LVL40
	.uleb128 0x1
	.byte	0x54
	.byte	0
.LVUS22:
	.uleb128 .LVU128
	.uleb128 .LVU133
.LLST22:
	.byte	0x8
	.4byte	.LVL41
	.uleb128 .LVL43-.LVL41
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LVUS23:
	.uleb128 .LVU138
	.uleb128 .LVU142
	.uleb128 .LVU142
	.uleb128 .LVU149
.LLST23:
	.byte	0x6
	.4byte	.LVL46
	.byte	0x4
	.uleb128 .LVL46-.LVL46
	.uleb128 .LVL48-.LVL46
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL48-.LVL46
	.uleb128 .LVL51-.LVL46
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LVUS102:
	.uleb128 0
	.uleb128 .LVU738
	.uleb128 .LVU738
	.uleb128 .LVU739
	.uleb128 .LVU739
	.uleb128 .LVU740
	.uleb128 .LVU740
	.uleb128 .LVU741
	.uleb128 .LVU741
	.uleb128 .LVU742
	.uleb128 .LVU742
	.uleb128 0
.LLST102:
	.byte	0x6
	.4byte	.LVL226
	.byte	0x4
	.uleb128 .LVL226-.LVL226
	.uleb128 .LVL235-.LVL226
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL235-.LVL226
	.uleb128 .LVL236-.LVL226
	.uleb128 0xa
	.byte	0xa3
	.uleb128 0x3
	.byte	0xa5
	.uleb128 0
	.uleb128 0x2a
	.byte	0xa8
	.uleb128 0x31
	.byte	0xa8
	.uleb128 0
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL236-.LVL226
	.uleb128 .LVL237-.LVL226
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL237-.LVL226
	.uleb128 .LVL238-.LVL226
	.uleb128 0xa
	.byte	0xa3
	.uleb128 0x3
	.byte	0xa5
	.uleb128 0
	.uleb128 0x2a
	.byte	0xa8
	.uleb128 0x31
	.byte	0xa8
	.uleb128 0
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL238-.LVL226
	.uleb128 .LVL239-.LVL226
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL239-.LVL226
	.uleb128 .LFE14-.LVL226
	.uleb128 0xa
	.byte	0xa3
	.uleb128 0x3
	.byte	0xa5
	.uleb128 0
	.uleb128 0x2a
	.byte	0xa8
	.uleb128 0x31
	.byte	0xa8
	.uleb128 0
	.byte	0x9f
	.byte	0
.LVUS103:
	.uleb128 .LVU710
	.uleb128 .LVU718
	.uleb128 .LVU718
	.uleb128 .LVU724
	.uleb128 .LVU728
	.uleb128 .LVU732
	.uleb128 .LVU732
	.uleb128 .LVU739
	.uleb128 .LVU739
	.uleb128 .LVU741
.LLST103:
	.byte	0x6
	.4byte	.LVL227
	.byte	0x4
	.uleb128 .LVL227-.LVL227
	.uleb128 .LVL229-.LVL227
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL229-.LVL227
	.uleb128 .LVL232-.LVL227
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL233-.LVL227
	.uleb128 .LVL234-.LVL227
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL234-.LVL227
	.uleb128 .LVL236-.LVL227
	.uleb128 0x5
	.byte	0x74
	.sleb128 0
	.byte	0x4f
	.byte	0x24
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL236-.LVL227
	.uleb128 .LVL238-.LVL227
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS105:
	.uleb128 .LVU713
	.uleb128 .LVU718
	.uleb128 .LVU718
	.uleb128 .LVU723
	.uleb128 .LVU723
	.uleb128 .LVU730
	.uleb128 .LVU739
	.uleb128 .LVU741
.LLST105:
	.byte	0x6
	.4byte	.LVL228
	.byte	0x4
	.uleb128 .LVL228-.LVL228
	.uleb128 .LVL229-.LVL228
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL229-.LVL228
	.uleb128 .LVL231-.LVL228
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL231-.LVL228
	.uleb128 .LVL233-.LVL228
	.uleb128 0x3
	.byte	0x71
	.sleb128 1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL236-.LVL228
	.uleb128 .LVL238-.LVL228
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LVUS107:
	.uleb128 .LVU719
	.uleb128 .LVU723
	.uleb128 .LVU723
	.uleb128 .LVU739
.LLST107:
	.byte	0x6
	.4byte	.LVL229
	.byte	0x4
	.uleb128 .LVL229-.LVL229
	.uleb128 .LVL231-.LVL229
	.uleb128 0x3
	.byte	0x71
	.sleb128 -1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL231-.LVL229
	.uleb128 .LVL236-.LVL229
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LVUS108:
	.uleb128 .LVU721
	.uleb128 .LVU739
.LLST108:
	.byte	0x8
	.4byte	.LVL230
	.uleb128 .LVL236-.LVL230
	.uleb128 0x1
	.byte	0x54
	.byte	0
.LVUS109:
	.uleb128 .LVU726
	.uleb128 .LVU732
	.uleb128 .LVU732
	.uleb128 .LVU739
.LLST109:
	.byte	0x6
	.4byte	.LVL233
	.byte	0x4
	.uleb128 .LVL233-.LVL233
	.uleb128 .LVL234-.LVL233
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL234-.LVL233
	.uleb128 .LVL236-.LVL233
	.uleb128 0x5
	.byte	0x74
	.sleb128 0
	.byte	0x4f
	.byte	0x24
	.byte	0x9f
	.byte	0
.Ldebug_loc3:
	.section	.debug_aranges,"",%progbits
	.4byte	0x8c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.4byte	.LFB9
	.4byte	.LFE9-.LFB9
	.4byte	.LFB10
	.4byte	.LFE10-.LFB10
	.4byte	.LFB11
	.4byte	.LFE11-.LFB11
	.4byte	.LFB12
	.4byte	.LFE12-.LFB12
	.4byte	.LFB13
	.4byte	.LFE13-.LFB13
	.4byte	.LFB14
	.4byte	.LFE14-.LFB14
	.4byte	.LFB15
	.4byte	.LFE15-.LFB15
	.4byte	0
	.4byte	0
	.section	.debug_rnglists,"",%progbits
.Ldebug_ranges0:
	.4byte	.Ldebug_ranges3-.Ldebug_ranges2
.Ldebug_ranges2:
	.2byte	0x5
	.byte	0x4
	.byte	0
	.4byte	0
.LLRL4:
	.byte	0x5
	.4byte	.LBB61
	.byte	0x4
	.uleb128 .LBB61-.LBB61
	.uleb128 .LBE61-.LBB61
	.byte	0x4
	.uleb128 .LBB64-.LBB61
	.uleb128 .LBE64-.LBB61
	.byte	0
.LLRL12:
	.byte	0x5
	.4byte	.LBB95
	.byte	0x4
	.uleb128 .LBB95-.LBB95
	.uleb128 .LBE95-.LBB95
	.byte	0x4
	.uleb128 .LBB114-.LBB95
	.uleb128 .LBE114-.LBB95
	.byte	0x4
	.uleb128 .LBB115-.LBB95
	.uleb128 .LBE115-.LBB95
	.byte	0
.LLRL14:
	.byte	0x5
	.4byte	.LBB102
	.byte	0x4
	.uleb128 .LBB102-.LBB102
	.uleb128 .LBE102-.LBB102
	.byte	0x4
	.uleb128 .LBB109-.LBB102
	.uleb128 .LBE109-.LBB102
	.byte	0x4
	.uleb128 .LBB113-.LBB102
	.uleb128 .LBE113-.LBB102
	.byte	0
.LLRL20:
	.byte	0x5
	.4byte	.LBB105
	.byte	0x4
	.uleb128 .LBB105-.LBB105
	.uleb128 .LBE105-.LBB105
	.byte	0x4
	.uleb128 .LBB106-.LBB105
	.uleb128 .LBE106-.LBB105
	.byte	0
.LLRL30:
	.byte	0x5
	.4byte	.LBB133
	.byte	0x4
	.uleb128 .LBB133-.LBB133
	.uleb128 .LBE133-.LBB133
	.byte	0x4
	.uleb128 .LBB153-.LBB133
	.uleb128 .LBE153-.LBB133
	.byte	0
.LLRL32:
	.byte	0x5
	.4byte	.LBB134
	.byte	0x4
	.uleb128 .LBB134-.LBB134
	.uleb128 .LBE134-.LBB134
	.byte	0x4
	.uleb128 .LBB148-.LBB134
	.uleb128 .LBE148-.LBB134
	.byte	0x4
	.uleb128 .LBB149-.LBB134
	.uleb128 .LBE149-.LBB134
	.byte	0x4
	.uleb128 .LBB150-.LBB134
	.uleb128 .LBE150-.LBB134
	.byte	0x4
	.uleb128 .LBB151-.LBB134
	.uleb128 .LBE151-.LBB134
	.byte	0x4
	.uleb128 .LBB152-.LBB134
	.uleb128 .LBE152-.LBB134
	.byte	0
.LLRL35:
	.byte	0x5
	.4byte	.LBB135
	.byte	0x4
	.uleb128 .LBB135-.LBB135
	.uleb128 .LBE135-.LBB135
	.byte	0x4
	.uleb128 .LBB144-.LBB135
	.uleb128 .LBE144-.LBB135
	.byte	0x4
	.uleb128 .LBB145-.LBB135
	.uleb128 .LBE145-.LBB135
	.byte	0x4
	.uleb128 .LBB146-.LBB135
	.uleb128 .LBE146-.LBB135
	.byte	0x4
	.uleb128 .LBB147-.LBB135
	.uleb128 .LBE147-.LBB135
	.byte	0
.LLRL37:
	.byte	0x5
	.4byte	.LBB136
	.byte	0x4
	.uleb128 .LBB136-.LBB136
	.uleb128 .LBE136-.LBB136
	.byte	0x4
	.uleb128 .LBB143-.LBB136
	.uleb128 .LBE143-.LBB136
	.byte	0
.LLRL39:
	.byte	0x5
	.4byte	.LBB137
	.byte	0x4
	.uleb128 .LBB137-.LBB137
	.uleb128 .LBE137-.LBB137
	.byte	0x4
	.uleb128 .LBB141-.LBB137
	.uleb128 .LBE141-.LBB137
	.byte	0x4
	.uleb128 .LBB142-.LBB137
	.uleb128 .LBE142-.LBB137
	.byte	0
.LLRL41:
	.byte	0x5
	.4byte	.LBB154
	.byte	0x4
	.uleb128 .LBB154-.LBB154
	.uleb128 .LBE154-.LBB154
	.byte	0x4
	.uleb128 .LBB159-.LBB154
	.uleb128 .LBE159-.LBB154
	.byte	0
.LLRL48:
	.byte	0x5
	.4byte	.LBB170
	.byte	0x4
	.uleb128 .LBB170-.LBB170
	.uleb128 .LBE170-.LBB170
	.byte	0x4
	.uleb128 .LBB175-.LBB170
	.uleb128 .LBE175-.LBB170
	.byte	0
.LLRL50:
	.byte	0x5
	.4byte	.LBB176
	.byte	0x4
	.uleb128 .LBB176-.LBB176
	.uleb128 .LBE176-.LBB176
	.byte	0x4
	.uleb128 .LBB191-.LBB176
	.uleb128 .LBE191-.LBB176
	.byte	0
.LLRL52:
	.byte	0x5
	.4byte	.LBB177
	.byte	0x4
	.uleb128 .LBB177-.LBB177
	.uleb128 .LBE177-.LBB177
	.byte	0x4
	.uleb128 .LBB178-.LBB177
	.uleb128 .LBE178-.LBB177
	.byte	0x4
	.uleb128 .LBB179-.LBB177
	.uleb128 .LBE179-.LBB177
	.byte	0x4
	.uleb128 .LBB180-.LBB177
	.uleb128 .LBE180-.LBB177
	.byte	0x4
	.uleb128 .LBB181-.LBB177
	.uleb128 .LBE181-.LBB177
	.byte	0x4
	.uleb128 .LBB182-.LBB177
	.uleb128 .LBE182-.LBB177
	.byte	0x4
	.uleb128 .LBB183-.LBB177
	.uleb128 .LBE183-.LBB177
	.byte	0
.LLRL54:
	.byte	0x5
	.4byte	.LBB184
	.byte	0x4
	.uleb128 .LBB184-.LBB184
	.uleb128 .LBE184-.LBB184
	.byte	0x4
	.uleb128 .LBB190-.LBB184
	.uleb128 .LBE190-.LBB184
	.byte	0
.LLRL56:
	.byte	0x5
	.4byte	.LBB185
	.byte	0x4
	.uleb128 .LBB185-.LBB185
	.uleb128 .LBE185-.LBB185
	.byte	0x4
	.uleb128 .LBB188-.LBB185
	.uleb128 .LBE188-.LBB185
	.byte	0x4
	.uleb128 .LBB189-.LBB185
	.uleb128 .LBE189-.LBB185
	.byte	0
.LLRL58:
	.byte	0x5
	.4byte	.LBB186
	.byte	0x4
	.uleb128 .LBB186-.LBB186
	.uleb128 .LBE186-.LBB186
	.byte	0x4
	.uleb128 .LBB187-.LBB186
	.uleb128 .LBE187-.LBB186
	.byte	0
.LLRL66:
	.byte	0x5
	.4byte	.LBB192
	.byte	0x4
	.uleb128 .LBB192-.LBB192
	.uleb128 .LBE192-.LBB192
	.byte	0x4
	.uleb128 .LBB197-.LBB192
	.uleb128 .LBE197-.LBB192
	.byte	0x4
	.uleb128 .LBB200-.LBB192
	.uleb128 .LBE200-.LBB192
	.byte	0
.LLRL68:
	.byte	0x5
	.4byte	.LBB193
	.byte	0x4
	.uleb128 .LBB193-.LBB193
	.uleb128 .LBE193-.LBB193
	.byte	0x4
	.uleb128 .LBB194-.LBB193
	.uleb128 .LBE194-.LBB193
	.byte	0x4
	.uleb128 .LBB195-.LBB193
	.uleb128 .LBE195-.LBB193
	.byte	0x4
	.uleb128 .LBB196-.LBB193
	.uleb128 .LBE196-.LBB193
	.byte	0
.LLRL69:
	.byte	0x5
	.4byte	.LBB198
	.byte	0x4
	.uleb128 .LBB198-.LBB198
	.uleb128 .LBE198-.LBB198
	.byte	0x4
	.uleb128 .LBB199-.LBB198
	.uleb128 .LBE199-.LBB198
	.byte	0
.LLRL74:
	.byte	0x5
	.4byte	.LBB208
	.byte	0x4
	.uleb128 .LBB208-.LBB208
	.uleb128 .LBE208-.LBB208
	.byte	0x4
	.uleb128 .LBB213-.LBB208
	.uleb128 .LBE213-.LBB208
	.byte	0
.LLRL76:
	.byte	0x5
	.4byte	.LBB209
	.byte	0x4
	.uleb128 .LBB209-.LBB209
	.uleb128 .LBE209-.LBB209
	.byte	0x4
	.uleb128 .LBB210-.LBB209
	.uleb128 .LBE210-.LBB209
	.byte	0x4
	.uleb128 .LBB211-.LBB209
	.uleb128 .LBE211-.LBB209
	.byte	0x4
	.uleb128 .LBB212-.LBB209
	.uleb128 .LBE212-.LBB209
	.byte	0
.LLRL77:
	.byte	0x5
	.4byte	.LBB214
	.byte	0x4
	.uleb128 .LBB214-.LBB214
	.uleb128 .LBE214-.LBB214
	.byte	0x4
	.uleb128 .LBB221-.LBB214
	.uleb128 .LBE221-.LBB214
	.byte	0x4
	.uleb128 .LBB223-.LBB214
	.uleb128 .LBE223-.LBB214
	.byte	0
.LLRL87:
	.byte	0x5
	.4byte	.LBB233
	.byte	0x4
	.uleb128 .LBB233-.LBB233
	.uleb128 .LBE233-.LBB233
	.byte	0x4
	.uleb128 .LBB240-.LBB233
	.uleb128 .LBE240-.LBB233
	.byte	0x4
	.uleb128 .LBB241-.LBB233
	.uleb128 .LBE241-.LBB233
	.byte	0x4
	.uleb128 .LBB242-.LBB233
	.uleb128 .LBE242-.LBB233
	.byte	0x4
	.uleb128 .LBB243-.LBB233
	.uleb128 .LBE243-.LBB233
	.byte	0
.LLRL89:
	.byte	0x5
	.4byte	.LBB234
	.byte	0x4
	.uleb128 .LBB234-.LBB234
	.uleb128 .LBE234-.LBB234
	.byte	0x4
	.uleb128 .LBB238-.LBB234
	.uleb128 .LBE238-.LBB234
	.byte	0x4
	.uleb128 .LBB239-.LBB234
	.uleb128 .LBE239-.LBB234
	.byte	0
.LLRL91:
	.byte	0x5
	.4byte	.LBB235
	.byte	0x4
	.uleb128 .LBB235-.LBB235
	.uleb128 .LBE235-.LBB235
	.byte	0x4
	.uleb128 .LBB236-.LBB235
	.uleb128 .LBE236-.LBB235
	.byte	0x4
	.uleb128 .LBB237-.LBB235
	.uleb128 .LBE237-.LBB235
	.byte	0
.LLRL98:
	.byte	0x5
	.4byte	.LBB247
	.byte	0x4
	.uleb128 .LBB247-.LBB247
	.uleb128 .LBE247-.LBB247
	.byte	0x4
	.uleb128 .LBB251-.LBB247
	.uleb128 .LBE251-.LBB247
	.byte	0x4
	.uleb128 .LBB252-.LBB247
	.uleb128 .LBE252-.LBB247
	.byte	0
.LLRL100:
	.byte	0x5
	.4byte	.LBB248
	.byte	0x4
	.uleb128 .LBB248-.LBB248
	.uleb128 .LBE248-.LBB248
	.byte	0x4
	.uleb128 .LBB249-.LBB248
	.uleb128 .LBE249-.LBB248
	.byte	0x4
	.uleb128 .LBB250-.LBB248
	.uleb128 .LBE250-.LBB248
	.byte	0
.LLRL104:
	.byte	0x5
	.4byte	.LBB263
	.byte	0x4
	.uleb128 .LBB263-.LBB263
	.uleb128 .LBE263-.LBB263
	.byte	0x4
	.uleb128 .LBB266-.LBB263
	.uleb128 .LBE266-.LBB263
	.byte	0x4
	.uleb128 .LBB267-.LBB263
	.uleb128 .LBE267-.LBB263
	.byte	0
.LLRL106:
	.byte	0x5
	.4byte	.LBB264
	.byte	0x4
	.uleb128 .LBB264-.LBB264
	.uleb128 .LBE264-.LBB264
	.byte	0x4
	.uleb128 .LBB265-.LBB264
	.uleb128 .LBE265-.LBB264
	.byte	0
.LLRL116:
	.byte	0x5
	.4byte	.LBB305
	.byte	0x4
	.uleb128 .LBB305-.LBB305
	.uleb128 .LBE305-.LBB305
	.byte	0x4
	.uleb128 .LBB316-.LBB305
	.uleb128 .LBE316-.LBB305
	.byte	0
.LLRL119:
	.byte	0x5
	.4byte	.LBB307
	.byte	0x4
	.uleb128 .LBB307-.LBB307
	.uleb128 .LBE307-.LBB307
	.byte	0x4
	.uleb128 .LBB310-.LBB307
	.uleb128 .LBE310-.LBB307
	.byte	0x4
	.uleb128 .LBB311-.LBB307
	.uleb128 .LBE311-.LBB307
	.byte	0
.LLRL121:
	.byte	0x5
	.4byte	.LBB308
	.byte	0x4
	.uleb128 .LBB308-.LBB308
	.uleb128 .LBE308-.LBB308
	.byte	0x4
	.uleb128 .LBB309-.LBB308
	.uleb128 .LBE309-.LBB308
	.byte	0
.LLRL125:
	.byte	0x7
	.4byte	.LFB0
	.uleb128 .LFE0-.LFB0
	.byte	0x7
	.4byte	.LFB1
	.uleb128 .LFE1-.LFB1
	.byte	0x7
	.4byte	.LFB2
	.uleb128 .LFE2-.LFB2
	.byte	0x7
	.4byte	.LFB3
	.uleb128 .LFE3-.LFB3
	.byte	0x7
	.4byte	.LFB4
	.uleb128 .LFE4-.LFB4
	.byte	0x7
	.4byte	.LFB5
	.uleb128 .LFE5-.LFB5
	.byte	0x7
	.4byte	.LFB6
	.uleb128 .LFE6-.LFB6
	.byte	0x7
	.4byte	.LFB8
	.uleb128 .LFE8-.LFB8
	.byte	0x7
	.4byte	.LFB9
	.uleb128 .LFE9-.LFB9
	.byte	0x7
	.4byte	.LFB10
	.uleb128 .LFE10-.LFB10
	.byte	0x7
	.4byte	.LFB11
	.uleb128 .LFE11-.LFB11
	.byte	0x7
	.4byte	.LFB12
	.uleb128 .LFE12-.LFB12
	.byte	0x7
	.4byte	.LFB13
	.uleb128 .LFE13-.LFB13
	.byte	0x7
	.4byte	.LFB14
	.uleb128 .LFE14-.LFB14
	.byte	0x7
	.4byte	.LFB15
	.uleb128 .LFE15-.LFB15
	.byte	0
.Ldebug_ranges3:
	.section	.debug_macro,"",%progbits
.Ldebug_macro0:
	.2byte	0x5
	.byte	0x2
	.4byte	.Ldebug_line0
	.byte	0x3
	.uleb128 0
	.uleb128 0x1
	.byte	0x5
	.uleb128 0
	.4byte	.LASF0
	.byte	0x5
	.uleb128 0
	.4byte	.LASF1
	.byte	0x5
	.uleb128 0
	.4byte	.LASF2
	.byte	0x5
	.uleb128 0
	.4byte	.LASF3
	.byte	0x5
	.uleb128 0
	.4byte	.LASF4
	.byte	0x5
	.uleb128 0
	.4byte	.LASF5
	.byte	0x5
	.uleb128 0
	.4byte	.LASF6
	.byte	0x5
	.uleb128 0
	.4byte	.LASF7
	.byte	0x5
	.uleb128 0
	.4byte	.LASF8
	.byte	0x5
	.uleb128 0
	.4byte	.LASF9
	.byte	0x5
	.uleb128 0
	.4byte	.LASF10
	.byte	0x5
	.uleb128 0
	.4byte	.LASF11
	.byte	0x5
	.uleb128 0
	.4byte	.LASF12
	.byte	0x5
	.uleb128 0
	.4byte	.LASF13
	.byte	0x5
	.uleb128 0
	.4byte	.LASF14
	.byte	0x5
	.uleb128 0
	.4byte	.LASF15
	.byte	0x5
	.uleb128 0
	.4byte	.LASF16
	.byte	0x5
	.uleb128 0
	.4byte	.LASF17
	.byte	0x5
	.uleb128 0
	.4byte	.LASF18
	.byte	0x5
	.uleb128 0
	.4byte	.LASF19
	.byte	0x5
	.uleb128 0
	.4byte	.LASF20
	.byte	0x5
	.uleb128 0
	.4byte	.LASF21
	.byte	0x5
	.uleb128 0
	.4byte	.LASF22
	.byte	0x5
	.uleb128 0
	.4byte	.LASF23
	.byte	0x5
	.uleb128 0
	.4byte	.LASF24
	.byte	0x5
	.uleb128 0
	.4byte	.LASF25
	.byte	0x5
	.uleb128 0
	.4byte	.LASF26
	.byte	0x5
	.uleb128 0
	.4byte	.LASF27
	.byte	0x5
	.uleb128 0
	.4byte	.LASF28
	.byte	0x5
	.uleb128 0
	.4byte	.LASF29
	.byte	0x5
	.uleb128 0
	.4byte	.LASF30
	.byte	0x5
	.uleb128 0
	.4byte	.LASF31
	.byte	0x5
	.uleb128 0
	.4byte	.LASF32
	.byte	0x5
	.uleb128 0
	.4byte	.LASF33
	.byte	0x5
	.uleb128 0
	.4byte	.LASF34
	.byte	0x5
	.uleb128 0
	.4byte	.LASF35
	.byte	0x5
	.uleb128 0
	.4byte	.LASF36
	.byte	0x5
	.uleb128 0
	.4byte	.LASF37
	.byte	0x5
	.uleb128 0
	.4byte	.LASF38
	.byte	0x5
	.uleb128 0
	.4byte	.LASF39
	.byte	0x5
	.uleb128 0
	.4byte	.LASF40
	.byte	0x5
	.uleb128 0
	.4byte	.LASF41
	.byte	0x5
	.uleb128 0
	.4byte	.LASF42
	.byte	0x5
	.uleb128 0
	.4byte	.LASF43
	.byte	0x5
	.uleb128 0
	.4byte	.LASF44
	.byte	0x5
	.uleb128 0
	.4byte	.LASF45
	.byte	0x5
	.uleb128 0
	.4byte	.LASF46
	.byte	0x5
	.uleb128 0
	.4byte	.LASF47
	.byte	0x5
	.uleb128 0
	.4byte	.LASF48
	.byte	0x5
	.uleb128 0
	.4byte	.LASF49
	.byte	0x5
	.uleb128 0
	.4byte	.LASF50
	.byte	0x5
	.uleb128 0
	.4byte	.LASF51
	.byte	0x5
	.uleb128 0
	.4byte	.LASF52
	.byte	0x5
	.uleb128 0
	.4byte	.LASF53
	.byte	0x5
	.uleb128 0
	.4byte	.LASF54
	.byte	0x5
	.uleb128 0
	.4byte	.LASF55
	.byte	0x5
	.uleb128 0
	.4byte	.LASF56
	.byte	0x5
	.uleb128 0
	.4byte	.LASF57
	.byte	0x5
	.uleb128 0
	.4byte	.LASF58
	.byte	0x5
	.uleb128 0
	.4byte	.LASF59
	.byte	0x5
	.uleb128 0
	.4byte	.LASF60
	.byte	0x5
	.uleb128 0
	.4byte	.LASF61
	.byte	0x5
	.uleb128 0
	.4byte	.LASF62
	.byte	0x5
	.uleb128 0
	.4byte	.LASF63
	.byte	0x5
	.uleb128 0
	.4byte	.LASF64
	.byte	0x5
	.uleb128 0
	.4byte	.LASF65
	.byte	0x5
	.uleb128 0
	.4byte	.LASF66
	.byte	0x5
	.uleb128 0
	.4byte	.LASF67
	.byte	0x5
	.uleb128 0
	.4byte	.LASF68
	.byte	0x5
	.uleb128 0
	.4byte	.LASF69
	.byte	0x5
	.uleb128 0
	.4byte	.LASF70
	.byte	0x5
	.uleb128 0
	.4byte	.LASF71
	.byte	0x5
	.uleb128 0
	.4byte	.LASF72
	.byte	0x5
	.uleb128 0
	.4byte	.LASF73
	.byte	0x5
	.uleb128 0
	.4byte	.LASF74
	.byte	0x5
	.uleb128 0
	.4byte	.LASF75
	.byte	0x5
	.uleb128 0
	.4byte	.LASF76
	.byte	0x5
	.uleb128 0
	.4byte	.LASF77
	.byte	0x5
	.uleb128 0
	.4byte	.LASF78
	.byte	0x5
	.uleb128 0
	.4byte	.LASF79
	.byte	0x5
	.uleb128 0
	.4byte	.LASF80
	.byte	0x5
	.uleb128 0
	.4byte	.LASF81
	.byte	0x5
	.uleb128 0
	.4byte	.LASF82
	.byte	0x5
	.uleb128 0
	.4byte	.LASF83
	.byte	0x5
	.uleb128 0
	.4byte	.LASF84
	.byte	0x5
	.uleb128 0
	.4byte	.LASF85
	.byte	0x5
	.uleb128 0
	.4byte	.LASF86
	.byte	0x5
	.uleb128 0
	.4byte	.LASF87
	.byte	0x5
	.uleb128 0
	.4byte	.LASF88
	.byte	0x5
	.uleb128 0
	.4byte	.LASF89
	.byte	0x5
	.uleb128 0
	.4byte	.LASF90
	.byte	0x5
	.uleb128 0
	.4byte	.LASF91
	.byte	0x5
	.uleb128 0
	.4byte	.LASF92
	.byte	0x5
	.uleb128 0
	.4byte	.LASF93
	.byte	0x5
	.uleb128 0
	.4byte	.LASF94
	.byte	0x5
	.uleb128 0
	.4byte	.LASF95
	.byte	0x5
	.uleb128 0
	.4byte	.LASF96
	.byte	0x5
	.uleb128 0
	.4byte	.LASF97
	.byte	0x5
	.uleb128 0
	.4byte	.LASF98
	.byte	0x5
	.uleb128 0
	.4byte	.LASF99
	.byte	0x5
	.uleb128 0
	.4byte	.LASF100
	.byte	0x5
	.uleb128 0
	.4byte	.LASF101
	.byte	0x5
	.uleb128 0
	.4byte	.LASF102
	.byte	0x5
	.uleb128 0
	.4byte	.LASF103
	.byte	0x5
	.uleb128 0
	.4byte	.LASF104
	.byte	0x5
	.uleb128 0
	.4byte	.LASF105
	.byte	0x5
	.uleb128 0
	.4byte	.LASF106
	.byte	0x5
	.uleb128 0
	.4byte	.LASF107
	.byte	0x5
	.uleb128 0
	.4byte	.LASF108
	.byte	0x5
	.uleb128 0
	.4byte	.LASF109
	.byte	0x5
	.uleb128 0
	.4byte	.LASF110
	.byte	0x5
	.uleb128 0
	.4byte	.LASF111
	.byte	0x5
	.uleb128 0
	.4byte	.LASF112
	.byte	0x5
	.uleb128 0
	.4byte	.LASF113
	.byte	0x5
	.uleb128 0
	.4byte	.LASF114
	.byte	0x5
	.uleb128 0
	.4byte	.LASF115
	.byte	0x5
	.uleb128 0
	.4byte	.LASF116
	.byte	0x5
	.uleb128 0
	.4byte	.LASF117
	.byte	0x5
	.uleb128 0
	.4byte	.LASF118
	.byte	0x5
	.uleb128 0
	.4byte	.LASF119
	.byte	0x5
	.uleb128 0
	.4byte	.LASF120
	.byte	0x5
	.uleb128 0
	.4byte	.LASF121
	.byte	0x5
	.uleb128 0
	.4byte	.LASF122
	.byte	0x5
	.uleb128 0
	.4byte	.LASF123
	.byte	0x5
	.uleb128 0
	.4byte	.LASF124
	.byte	0x5
	.uleb128 0
	.4byte	.LASF125
	.byte	0x5
	.uleb128 0
	.4byte	.LASF126
	.byte	0x5
	.uleb128 0
	.4byte	.LASF127
	.byte	0x5
	.uleb128 0
	.4byte	.LASF128
	.byte	0x5
	.uleb128 0
	.4byte	.LASF129
	.byte	0x5
	.uleb128 0
	.4byte	.LASF130
	.byte	0x5
	.uleb128 0
	.4byte	.LASF131
	.byte	0x5
	.uleb128 0
	.4byte	.LASF132
	.byte	0x5
	.uleb128 0
	.4byte	.LASF133
	.byte	0x5
	.uleb128 0
	.4byte	.LASF134
	.byte	0x5
	.uleb128 0
	.4byte	.LASF135
	.byte	0x5
	.uleb128 0
	.4byte	.LASF136
	.byte	0x5
	.uleb128 0
	.4byte	.LASF137
	.byte	0x5
	.uleb128 0
	.4byte	.LASF138
	.byte	0x5
	.uleb128 0
	.4byte	.LASF139
	.byte	0x5
	.uleb128 0
	.4byte	.LASF140
	.byte	0x5
	.uleb128 0
	.4byte	.LASF141
	.byte	0x5
	.uleb128 0
	.4byte	.LASF142
	.byte	0x5
	.uleb128 0
	.4byte	.LASF143
	.byte	0x5
	.uleb128 0
	.4byte	.LASF144
	.byte	0x5
	.uleb128 0
	.4byte	.LASF145
	.byte	0x5
	.uleb128 0
	.4byte	.LASF146
	.byte	0x5
	.uleb128 0
	.4byte	.LASF147
	.byte	0x5
	.uleb128 0
	.4byte	.LASF148
	.byte	0x5
	.uleb128 0
	.4byte	.LASF149
	.byte	0x5
	.uleb128 0
	.4byte	.LASF150
	.byte	0x5
	.uleb128 0
	.4byte	.LASF151
	.byte	0x5
	.uleb128 0
	.4byte	.LASF152
	.byte	0x5
	.uleb128 0
	.4byte	.LASF153
	.byte	0x5
	.uleb128 0
	.4byte	.LASF154
	.byte	0x5
	.uleb128 0
	.4byte	.LASF155
	.byte	0x5
	.uleb128 0
	.4byte	.LASF156
	.byte	0x5
	.uleb128 0
	.4byte	.LASF157
	.byte	0x5
	.uleb128 0
	.4byte	.LASF158
	.byte	0x5
	.uleb128 0
	.4byte	.LASF159
	.byte	0x5
	.uleb128 0
	.4byte	.LASF160
	.byte	0x5
	.uleb128 0
	.4byte	.LASF161
	.byte	0x5
	.uleb128 0
	.4byte	.LASF162
	.byte	0x5
	.uleb128 0
	.4byte	.LASF163
	.byte	0x5
	.uleb128 0
	.4byte	.LASF164
	.byte	0x5
	.uleb128 0
	.4byte	.LASF165
	.byte	0x5
	.uleb128 0
	.4byte	.LASF166
	.byte	0x5
	.uleb128 0
	.4byte	.LASF167
	.byte	0x5
	.uleb128 0
	.4byte	.LASF168
	.byte	0x5
	.uleb128 0
	.4byte	.LASF169
	.byte	0x5
	.uleb128 0
	.4byte	.LASF170
	.byte	0x5
	.uleb128 0
	.4byte	.LASF171
	.byte	0x5
	.uleb128 0
	.4byte	.LASF172
	.byte	0x5
	.uleb128 0
	.4byte	.LASF173
	.byte	0x5
	.uleb128 0
	.4byte	.LASF174
	.byte	0x5
	.uleb128 0
	.4byte	.LASF175
	.byte	0x5
	.uleb128 0
	.4byte	.LASF176
	.byte	0x5
	.uleb128 0
	.4byte	.LASF177
	.byte	0x5
	.uleb128 0
	.4byte	.LASF178
	.byte	0x5
	.uleb128 0
	.4byte	.LASF179
	.byte	0x5
	.uleb128 0
	.4byte	.LASF180
	.byte	0x5
	.uleb128 0
	.4byte	.LASF181
	.byte	0x5
	.uleb128 0
	.4byte	.LASF182
	.byte	0x5
	.uleb128 0
	.4byte	.LASF183
	.byte	0x5
	.uleb128 0
	.4byte	.LASF184
	.byte	0x5
	.uleb128 0
	.4byte	.LASF185
	.byte	0x5
	.uleb128 0
	.4byte	.LASF186
	.byte	0x5
	.uleb128 0
	.4byte	.LASF187
	.byte	0x5
	.uleb128 0
	.4byte	.LASF188
	.byte	0x5
	.uleb128 0
	.4byte	.LASF189
	.byte	0x5
	.uleb128 0
	.4byte	.LASF190
	.byte	0x5
	.uleb128 0
	.4byte	.LASF191
	.byte	0x5
	.uleb128 0
	.4byte	.LASF192
	.byte	0x5
	.uleb128 0
	.4byte	.LASF193
	.byte	0x5
	.uleb128 0
	.4byte	.LASF194
	.byte	0x5
	.uleb128 0
	.4byte	.LASF195
	.byte	0x5
	.uleb128 0
	.4byte	.LASF196
	.byte	0x5
	.uleb128 0
	.4byte	.LASF197
	.byte	0x5
	.uleb128 0
	.4byte	.LASF198
	.byte	0x5
	.uleb128 0
	.4byte	.LASF199
	.byte	0x5
	.uleb128 0
	.4byte	.LASF200
	.byte	0x5
	.uleb128 0
	.4byte	.LASF201
	.byte	0x5
	.uleb128 0
	.4byte	.LASF202
	.byte	0x5
	.uleb128 0
	.4byte	.LASF203
	.byte	0x5
	.uleb128 0
	.4byte	.LASF204
	.byte	0x5
	.uleb128 0
	.4byte	.LASF205
	.byte	0x5
	.uleb128 0
	.4byte	.LASF206
	.byte	0x5
	.uleb128 0
	.4byte	.LASF207
	.byte	0x5
	.uleb128 0
	.4byte	.LASF208
	.byte	0x5
	.uleb128 0
	.4byte	.LASF209
	.byte	0x5
	.uleb128 0
	.4byte	.LASF210
	.byte	0x5
	.uleb128 0
	.4byte	.LASF211
	.byte	0x5
	.uleb128 0
	.4byte	.LASF212
	.byte	0x5
	.uleb128 0
	.4byte	.LASF213
	.byte	0x5
	.uleb128 0
	.4byte	.LASF214
	.byte	0x5
	.uleb128 0
	.4byte	.LASF215
	.byte	0x5
	.uleb128 0
	.4byte	.LASF216
	.byte	0x5
	.uleb128 0
	.4byte	.LASF217
	.byte	0x5
	.uleb128 0
	.4byte	.LASF218
	.byte	0x5
	.uleb128 0
	.4byte	.LASF219
	.byte	0x5
	.uleb128 0
	.4byte	.LASF220
	.byte	0x5
	.uleb128 0
	.4byte	.LASF221
	.byte	0x5
	.uleb128 0
	.4byte	.LASF222
	.byte	0x5
	.uleb128 0
	.4byte	.LASF223
	.byte	0x5
	.uleb128 0
	.4byte	.LASF224
	.byte	0x5
	.uleb128 0
	.4byte	.LASF225
	.byte	0x5
	.uleb128 0
	.4byte	.LASF226
	.byte	0x5
	.uleb128 0
	.4byte	.LASF227
	.byte	0x5
	.uleb128 0
	.4byte	.LASF228
	.byte	0x5
	.uleb128 0
	.4byte	.LASF229
	.byte	0x5
	.uleb128 0
	.4byte	.LASF230
	.byte	0x5
	.uleb128 0
	.4byte	.LASF231
	.byte	0x5
	.uleb128 0
	.4byte	.LASF232
	.byte	0x5
	.uleb128 0
	.4byte	.LASF233
	.byte	0x5
	.uleb128 0
	.4byte	.LASF234
	.byte	0x5
	.uleb128 0
	.4byte	.LASF235
	.byte	0x5
	.uleb128 0
	.4byte	.LASF236
	.byte	0x5
	.uleb128 0
	.4byte	.LASF237
	.byte	0x5
	.uleb128 0
	.4byte	.LASF238
	.byte	0x5
	.uleb128 0
	.4byte	.LASF239
	.byte	0x5
	.uleb128 0
	.4byte	.LASF240
	.byte	0x5
	.uleb128 0
	.4byte	.LASF241
	.byte	0x5
	.uleb128 0
	.4byte	.LASF242
	.byte	0x5
	.uleb128 0
	.4byte	.LASF243
	.byte	0x5
	.uleb128 0
	.4byte	.LASF244
	.byte	0x5
	.uleb128 0
	.4byte	.LASF245
	.byte	0x5
	.uleb128 0
	.4byte	.LASF246
	.byte	0x5
	.uleb128 0
	.4byte	.LASF247
	.byte	0x5
	.uleb128 0
	.4byte	.LASF248
	.byte	0x5
	.uleb128 0
	.4byte	.LASF249
	.byte	0x5
	.uleb128 0
	.4byte	.LASF250
	.byte	0x5
	.uleb128 0
	.4byte	.LASF251
	.byte	0x5
	.uleb128 0
	.4byte	.LASF252
	.byte	0x5
	.uleb128 0
	.4byte	.LASF253
	.byte	0x5
	.uleb128 0
	.4byte	.LASF254
	.byte	0x5
	.uleb128 0
	.4byte	.LASF255
	.byte	0x5
	.uleb128 0
	.4byte	.LASF256
	.byte	0x5
	.uleb128 0
	.4byte	.LASF257
	.byte	0x5
	.uleb128 0
	.4byte	.LASF258
	.byte	0x5
	.uleb128 0
	.4byte	.LASF259
	.byte	0x5
	.uleb128 0
	.4byte	.LASF260
	.byte	0x5
	.uleb128 0
	.4byte	.LASF261
	.byte	0x5
	.uleb128 0
	.4byte	.LASF262
	.byte	0x5
	.uleb128 0
	.4byte	.LASF263
	.byte	0x5
	.uleb128 0
	.4byte	.LASF264
	.byte	0x5
	.uleb128 0
	.4byte	.LASF265
	.byte	0x5
	.uleb128 0
	.4byte	.LASF266
	.byte	0x5
	.uleb128 0
	.4byte	.LASF267
	.byte	0x5
	.uleb128 0
	.4byte	.LASF268
	.byte	0x5
	.uleb128 0
	.4byte	.LASF269
	.byte	0x5
	.uleb128 0
	.4byte	.LASF270
	.byte	0x5
	.uleb128 0
	.4byte	.LASF271
	.byte	0x5
	.uleb128 0
	.4byte	.LASF272
	.byte	0x5
	.uleb128 0
	.4byte	.LASF273
	.byte	0x5
	.uleb128 0
	.4byte	.LASF274
	.byte	0x5
	.uleb128 0
	.4byte	.LASF275
	.byte	0x5
	.uleb128 0
	.4byte	.LASF276
	.byte	0x5
	.uleb128 0
	.4byte	.LASF277
	.byte	0x5
	.uleb128 0
	.4byte	.LASF278
	.byte	0x5
	.uleb128 0
	.4byte	.LASF279
	.byte	0x5
	.uleb128 0
	.4byte	.LASF280
	.byte	0x5
	.uleb128 0
	.4byte	.LASF281
	.byte	0x5
	.uleb128 0
	.4byte	.LASF282
	.byte	0x5
	.uleb128 0
	.4byte	.LASF283
	.byte	0x5
	.uleb128 0
	.4byte	.LASF284
	.byte	0x5
	.uleb128 0
	.4byte	.LASF285
	.byte	0x5
	.uleb128 0
	.4byte	.LASF286
	.byte	0x5
	.uleb128 0
	.4byte	.LASF287
	.byte	0x5
	.uleb128 0
	.4byte	.LASF288
	.byte	0x5
	.uleb128 0
	.4byte	.LASF289
	.byte	0x5
	.uleb128 0
	.4byte	.LASF290
	.byte	0x5
	.uleb128 0
	.4byte	.LASF291
	.byte	0x5
	.uleb128 0
	.4byte	.LASF292
	.byte	0x5
	.uleb128 0
	.4byte	.LASF293
	.byte	0x5
	.uleb128 0
	.4byte	.LASF294
	.byte	0x5
	.uleb128 0
	.4byte	.LASF295
	.byte	0x5
	.uleb128 0
	.4byte	.LASF296
	.byte	0x5
	.uleb128 0
	.4byte	.LASF297
	.byte	0x5
	.uleb128 0
	.4byte	.LASF298
	.byte	0x5
	.uleb128 0
	.4byte	.LASF299
	.byte	0x5
	.uleb128 0
	.4byte	.LASF300
	.byte	0x5
	.uleb128 0
	.4byte	.LASF301
	.byte	0x5
	.uleb128 0
	.4byte	.LASF302
	.byte	0x5
	.uleb128 0
	.4byte	.LASF303
	.byte	0x5
	.uleb128 0
	.4byte	.LASF304
	.byte	0x5
	.uleb128 0
	.4byte	.LASF305
	.byte	0x5
	.uleb128 0
	.4byte	.LASF306
	.byte	0x5
	.uleb128 0
	.4byte	.LASF307
	.byte	0x5
	.uleb128 0
	.4byte	.LASF308
	.byte	0x5
	.uleb128 0
	.4byte	.LASF309
	.byte	0x5
	.uleb128 0
	.4byte	.LASF310
	.byte	0x5
	.uleb128 0
	.4byte	.LASF311
	.byte	0x5
	.uleb128 0
	.4byte	.LASF312
	.byte	0x5
	.uleb128 0
	.4byte	.LASF313
	.byte	0x5
	.uleb128 0
	.4byte	.LASF314
	.byte	0x5
	.uleb128 0
	.4byte	.LASF315
	.byte	0x5
	.uleb128 0
	.4byte	.LASF316
	.byte	0x5
	.uleb128 0
	.4byte	.LASF317
	.byte	0x5
	.uleb128 0
	.4byte	.LASF318
	.byte	0x5
	.uleb128 0
	.4byte	.LASF319
	.byte	0x5
	.uleb128 0
	.4byte	.LASF320
	.byte	0x5
	.uleb128 0
	.4byte	.LASF321
	.byte	0x5
	.uleb128 0
	.4byte	.LASF322
	.byte	0x5
	.uleb128 0
	.4byte	.LASF323
	.byte	0x5
	.uleb128 0
	.4byte	.LASF324
	.byte	0x5
	.uleb128 0
	.4byte	.LASF325
	.byte	0x5
	.uleb128 0
	.4byte	.LASF326
	.byte	0x5
	.uleb128 0
	.4byte	.LASF327
	.byte	0x5
	.uleb128 0
	.4byte	.LASF328
	.byte	0x5
	.uleb128 0
	.4byte	.LASF329
	.byte	0x5
	.uleb128 0
	.4byte	.LASF330
	.byte	0x5
	.uleb128 0
	.4byte	.LASF331
	.byte	0x5
	.uleb128 0
	.4byte	.LASF332
	.byte	0x5
	.uleb128 0
	.4byte	.LASF333
	.byte	0x5
	.uleb128 0
	.4byte	.LASF334
	.byte	0x5
	.uleb128 0
	.4byte	.LASF335
	.byte	0x5
	.uleb128 0
	.4byte	.LASF336
	.byte	0x5
	.uleb128 0
	.4byte	.LASF337
	.byte	0x5
	.uleb128 0
	.4byte	.LASF338
	.byte	0x5
	.uleb128 0
	.4byte	.LASF339
	.byte	0x5
	.uleb128 0
	.4byte	.LASF340
	.byte	0x5
	.uleb128 0
	.4byte	.LASF341
	.byte	0x5
	.uleb128 0
	.4byte	.LASF342
	.byte	0x5
	.uleb128 0
	.4byte	.LASF343
	.byte	0x5
	.uleb128 0
	.4byte	.LASF344
	.byte	0x5
	.uleb128 0
	.4byte	.LASF345
	.byte	0x5
	.uleb128 0
	.4byte	.LASF346
	.byte	0x5
	.uleb128 0
	.4byte	.LASF347
	.byte	0x5
	.uleb128 0
	.4byte	.LASF348
	.byte	0x5
	.uleb128 0
	.4byte	.LASF349
	.byte	0x5
	.uleb128 0
	.4byte	.LASF350
	.byte	0x5
	.uleb128 0
	.4byte	.LASF351
	.byte	0x5
	.uleb128 0
	.4byte	.LASF352
	.byte	0x5
	.uleb128 0
	.4byte	.LASF353
	.byte	0x5
	.uleb128 0
	.4byte	.LASF354
	.byte	0x5
	.uleb128 0
	.4byte	.LASF355
	.byte	0x5
	.uleb128 0
	.4byte	.LASF356
	.byte	0x5
	.uleb128 0
	.4byte	.LASF357
	.byte	0x5
	.uleb128 0
	.4byte	.LASF358
	.byte	0x5
	.uleb128 0
	.4byte	.LASF359
	.byte	0x5
	.uleb128 0
	.4byte	.LASF360
	.byte	0x5
	.uleb128 0
	.4byte	.LASF361
	.byte	0x5
	.uleb128 0
	.4byte	.LASF362
	.byte	0x5
	.uleb128 0
	.4byte	.LASF363
	.byte	0x5
	.uleb128 0
	.4byte	.LASF364
	.byte	0x5
	.uleb128 0
	.4byte	.LASF365
	.byte	0x5
	.uleb128 0
	.4byte	.LASF366
	.byte	0x5
	.uleb128 0
	.4byte	.LASF367
	.byte	0x5
	.uleb128 0
	.4byte	.LASF368
	.byte	0x5
	.uleb128 0
	.4byte	.LASF369
	.byte	0x5
	.uleb128 0
	.4byte	.LASF370
	.byte	0x5
	.uleb128 0
	.4byte	.LASF371
	.byte	0x5
	.uleb128 0
	.4byte	.LASF372
	.byte	0x5
	.uleb128 0
	.4byte	.LASF373
	.byte	0x5
	.uleb128 0
	.4byte	.LASF374
	.byte	0x5
	.uleb128 0
	.4byte	.LASF375
	.byte	0x5
	.uleb128 0
	.4byte	.LASF376
	.byte	0x5
	.uleb128 0
	.4byte	.LASF377
	.byte	0x5
	.uleb128 0
	.4byte	.LASF378
	.byte	0x5
	.uleb128 0
	.4byte	.LASF379
	.byte	0x5
	.uleb128 0
	.4byte	.LASF380
	.byte	0x5
	.uleb128 0
	.4byte	.LASF381
	.byte	0x5
	.uleb128 0
	.4byte	.LASF382
	.byte	0x5
	.uleb128 0
	.4byte	.LASF383
	.byte	0x5
	.uleb128 0
	.4byte	.LASF384
	.byte	0x5
	.uleb128 0
	.4byte	.LASF385
	.byte	0x5
	.uleb128 0
	.4byte	.LASF386
	.byte	0x5
	.uleb128 0
	.4byte	.LASF387
	.byte	0x5
	.uleb128 0
	.4byte	.LASF388
	.byte	0x5
	.uleb128 0
	.4byte	.LASF389
	.byte	0x5
	.uleb128 0
	.4byte	.LASF390
	.byte	0x5
	.uleb128 0
	.4byte	.LASF391
	.byte	0x6
	.uleb128 0
	.4byte	.LASF392
	.byte	0x6
	.uleb128 0
	.4byte	.LASF393
	.byte	0x6
	.uleb128 0
	.4byte	.LASF394
	.byte	0x5
	.uleb128 0
	.4byte	.LASF395
	.byte	0x6
	.uleb128 0
	.4byte	.LASF396
	.byte	0x6
	.uleb128 0
	.4byte	.LASF397
	.byte	0x6
	.uleb128 0
	.4byte	.LASF398
	.byte	0x6
	.uleb128 0
	.4byte	.LASF399
	.byte	0x5
	.uleb128 0
	.4byte	.LASF400
	.byte	0x6
	.uleb128 0
	.4byte	.LASF401
	.byte	0x6
	.uleb128 0
	.4byte	.LASF402
	.byte	0x6
	.uleb128 0
	.4byte	.LASF403
	.byte	0x6
	.uleb128 0
	.4byte	.LASF404
	.byte	0x6
	.uleb128 0
	.4byte	.LASF405
	.byte	0x6
	.uleb128 0
	.4byte	.LASF406
	.byte	0x6
	.uleb128 0
	.4byte	.LASF407
	.byte	0x5
	.uleb128 0
	.4byte	.LASF408
	.byte	0x5
	.uleb128 0
	.4byte	.LASF409
	.byte	0x6
	.uleb128 0
	.4byte	.LASF410
	.byte	0x5
	.uleb128 0
	.4byte	.LASF411
	.byte	0x5
	.uleb128 0
	.4byte	.LASF412
	.byte	0x5
	.uleb128 0
	.4byte	.LASF413
	.byte	0x6
	.uleb128 0
	.4byte	.LASF414
	.byte	0x5
	.uleb128 0
	.4byte	.LASF415
	.byte	0x5
	.uleb128 0
	.4byte	.LASF416
	.byte	0x6
	.uleb128 0
	.4byte	.LASF417
	.byte	0x5
	.uleb128 0
	.4byte	.LASF418
	.byte	0x5
	.uleb128 0
	.4byte	.LASF419
	.byte	0x5
	.uleb128 0
	.4byte	.LASF420
	.byte	0x5
	.uleb128 0
	.4byte	.LASF421
	.byte	0x5
	.uleb128 0
	.4byte	.LASF422
	.byte	0x5
	.uleb128 0
	.4byte	.LASF423
	.byte	0x6
	.uleb128 0
	.4byte	.LASF424
	.byte	0x5
	.uleb128 0
	.4byte	.LASF425
	.byte	0x5
	.uleb128 0
	.4byte	.LASF426
	.byte	0x5
	.uleb128 0
	.4byte	.LASF427
	.byte	0x6
	.uleb128 0
	.4byte	.LASF428
	.byte	0x5
	.uleb128 0
	.4byte	.LASF429
	.byte	0x6
	.uleb128 0
	.4byte	.LASF430
	.byte	0x6
	.uleb128 0
	.4byte	.LASF431
	.byte	0x6
	.uleb128 0
	.4byte	.LASF432
	.byte	0x6
	.uleb128 0
	.4byte	.LASF433
	.byte	0x6
	.uleb128 0
	.4byte	.LASF434
	.byte	0x6
	.uleb128 0
	.4byte	.LASF435
	.byte	0x5
	.uleb128 0
	.4byte	.LASF436
	.byte	0x6
	.uleb128 0
	.4byte	.LASF437
	.byte	0x6
	.uleb128 0
	.4byte	.LASF438
	.byte	0x6
	.uleb128 0
	.4byte	.LASF439
	.byte	0x5
	.uleb128 0
	.4byte	.LASF440
	.byte	0x5
	.uleb128 0
	.4byte	.LASF441
	.byte	0x5
	.uleb128 0
	.4byte	.LASF442
	.byte	0x5
	.uleb128 0
	.4byte	.LASF443
	.byte	0x6
	.uleb128 0
	.4byte	.LASF444
	.byte	0x5
	.uleb128 0
	.4byte	.LASF445
	.byte	0x5
	.uleb128 0
	.4byte	.LASF446
	.byte	0x5
	.uleb128 0
	.4byte	.LASF447
	.byte	0x6
	.uleb128 0
	.4byte	.LASF448
	.byte	0x5
	.uleb128 0
	.4byte	.LASF449
	.byte	0x6
	.uleb128 0
	.4byte	.LASF450
	.byte	0x6
	.uleb128 0
	.4byte	.LASF451
	.byte	0x6
	.uleb128 0
	.4byte	.LASF452
	.byte	0x6
	.uleb128 0
	.4byte	.LASF453
	.byte	0x6
	.uleb128 0
	.4byte	.LASF454
	.byte	0x6
	.uleb128 0
	.4byte	.LASF455
	.byte	0x5
	.uleb128 0
	.4byte	.LASF456
	.byte	0x5
	.uleb128 0
	.4byte	.LASF457
	.byte	0x5
	.uleb128 0
	.4byte	.LASF458
	.byte	0x5
	.uleb128 0
	.4byte	.LASF459
	.byte	0x5
	.uleb128 0
	.4byte	.LASF460
	.byte	0x5
	.uleb128 0
	.4byte	.LASF461
	.byte	0x3
	.uleb128 0x1
	.uleb128 0x5
	.byte	0x5
	.uleb128 0x2
	.4byte	.LASF462
	.file 9 "/Applications/STM32CubeIDE.app/Contents/Eclipse/plugins/com.st.stm32cube.ide.mcu.externaltools.gnu-tools-for-stm32.13.3.rel1.macos64_1.0.0.202411102158/tools/lib/gcc/arm-none-eabi/13.3.1/include/stdint.h"
	.byte	0x3
	.uleb128 0x4
	.uleb128 0x9
	.file 10 "/Applications/STM32CubeIDE.app/Contents/Eclipse/plugins/com.st.stm32cube.ide.mcu.externaltools.gnu-tools-for-stm32.13.3.rel1.macos64_1.0.0.202411102158/tools/arm-none-eabi/include/stdint.h"
	.byte	0x3
	.uleb128 0x9
	.uleb128 0xa
	.byte	0x5
	.uleb128 0xa
	.4byte	.LASF463
	.byte	0x3
	.uleb128 0xc
	.uleb128 0x2
	.byte	0x5
	.uleb128 0x6
	.4byte	.LASF464
	.file 11 "/Applications/STM32CubeIDE.app/Contents/Eclipse/plugins/com.st.stm32cube.ide.mcu.externaltools.gnu-tools-for-stm32.13.3.rel1.macos64_1.0.0.202411102158/tools/arm-none-eabi/include/sys/features.h"
	.byte	0x3
	.uleb128 0x8
	.uleb128 0xb
	.byte	0x5
	.uleb128 0x16
	.4byte	.LASF465
	.file 12 "/Applications/STM32CubeIDE.app/Contents/Eclipse/plugins/com.st.stm32cube.ide.mcu.externaltools.gnu-tools-for-stm32.13.3.rel1.macos64_1.0.0.202411102158/tools/arm-none-eabi/include/_newlib_version.h"
	.byte	0x3
	.uleb128 0x1c
	.uleb128 0xc
	.byte	0x7
	.4byte	.Ldebug_macro2
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro3
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro4
	.byte	0x4
	.file 13 "/Applications/STM32CubeIDE.app/Contents/Eclipse/plugins/com.st.stm32cube.ide.mcu.externaltools.gnu-tools-for-stm32.13.3.rel1.macos64_1.0.0.202411102158/tools/arm-none-eabi/include/sys/_intsup.h"
	.byte	0x3
	.uleb128 0xd
	.uleb128 0xd
	.byte	0x7
	.4byte	.Ldebug_macro5
	.byte	0x4
	.byte	0x3
	.uleb128 0xe
	.uleb128 0x3
	.byte	0x7
	.4byte	.Ldebug_macro6
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro7
	.byte	0x4
	.byte	0x5
	.uleb128 0xd
	.4byte	.LASF620
	.byte	0x4
	.byte	0x3
	.uleb128 0x5
	.uleb128 0x4
	.byte	0x7
	.4byte	.Ldebug_macro8
	.byte	0x4
	.byte	0x4
	.byte	0x3
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x5
	.uleb128 0x8
	.4byte	.LASF678
	.file 14 "/Applications/STM32CubeIDE.app/Contents/Eclipse/plugins/com.st.stm32cube.ide.mcu.externaltools.gnu-tools-for-stm32.13.3.rel1.macos64_1.0.0.202411102158/tools/arm-none-eabi/include/_ansi.h"
	.byte	0x3
	.uleb128 0xa
	.uleb128 0xe
	.byte	0x5
	.uleb128 0x8
	.4byte	.LASF679
	.file 15 "/Applications/STM32CubeIDE.app/Contents/Eclipse/plugins/com.st.stm32cube.ide.mcu.externaltools.gnu-tools-for-stm32.13.3.rel1.macos64_1.0.0.202411102158/tools/arm-none-eabi/include/newlib-nano/newlib.h"
	.byte	0x3
	.uleb128 0xa
	.uleb128 0xf
	.byte	0x7
	.4byte	.Ldebug_macro9
	.byte	0x4
	.file 16 "/Applications/STM32CubeIDE.app/Contents/Eclipse/plugins/com.st.stm32cube.ide.mcu.externaltools.gnu-tools-for-stm32.13.3.rel1.macos64_1.0.0.202411102158/tools/arm-none-eabi/include/sys/config.h"
	.byte	0x3
	.uleb128 0xb
	.uleb128 0x10
	.byte	0x5
	.uleb128 0x2
	.4byte	.LASF694
	.file 17 "/Applications/STM32CubeIDE.app/Contents/Eclipse/plugins/com.st.stm32cube.ide.mcu.externaltools.gnu-tools-for-stm32.13.3.rel1.macos64_1.0.0.202411102158/tools/arm-none-eabi/include/machine/ieeefp.h"
	.byte	0x3
	.uleb128 0x4
	.uleb128 0x11
	.byte	0x7
	.4byte	.Ldebug_macro10
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro11
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro12
	.byte	0x4
	.file 18 "/Applications/STM32CubeIDE.app/Contents/Eclipse/plugins/com.st.stm32cube.ide.mcu.externaltools.gnu-tools-for-stm32.13.3.rel1.macos64_1.0.0.202411102158/tools/arm-none-eabi/include/sys/reent.h"
	.byte	0x3
	.uleb128 0xb
	.uleb128 0x12
	.byte	0x5
	.uleb128 0xb
	.4byte	.LASF718
	.byte	0x3
	.uleb128 0xd
	.uleb128 0xe
	.byte	0x4
	.byte	0x3
	.uleb128 0xe
	.uleb128 0x4
	.byte	0x4
	.file 19 "/Applications/STM32CubeIDE.app/Contents/Eclipse/plugins/com.st.stm32cube.ide.mcu.externaltools.gnu-tools-for-stm32.13.3.rel1.macos64_1.0.0.202411102158/tools/arm-none-eabi/include/sys/cdefs.h"
	.byte	0x3
	.uleb128 0xf
	.uleb128 0x13
	.byte	0x5
	.uleb128 0x2b
	.4byte	.LASF719
	.byte	0x3
	.uleb128 0x2f
	.uleb128 0x4
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro13
	.byte	0x4
	.file 20 "/Applications/STM32CubeIDE.app/Contents/Eclipse/plugins/com.st.stm32cube.ide.mcu.externaltools.gnu-tools-for-stm32.13.3.rel1.macos64_1.0.0.202411102158/tools/arm-none-eabi/include/sys/_types.h"
	.byte	0x3
	.uleb128 0x10
	.uleb128 0x14
	.byte	0x7
	.4byte	.Ldebug_macro14
	.byte	0x3
	.uleb128 0x18
	.uleb128 0x4
	.byte	0x7
	.4byte	.Ldebug_macro15
	.byte	0x4
	.file 21 "/Applications/STM32CubeIDE.app/Contents/Eclipse/plugins/com.st.stm32cube.ide.mcu.externaltools.gnu-tools-for-stm32.13.3.rel1.macos64_1.0.0.202411102158/tools/arm-none-eabi/include/machine/_types.h"
	.byte	0x3
	.uleb128 0x1b
	.uleb128 0x15
	.byte	0x5
	.uleb128 0x6
	.4byte	.LASF854
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro16
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro17
	.file 22 "/Applications/STM32CubeIDE.app/Contents/Eclipse/plugins/com.st.stm32cube.ide.mcu.externaltools.gnu-tools-for-stm32.13.3.rel1.macos64_1.0.0.202411102158/tools/arm-none-eabi/include/sys/lock.h"
	.byte	0x3
	.uleb128 0x23
	.uleb128 0x16
	.byte	0x7
	.4byte	.Ldebug_macro18
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro19
	.file 23 "/Applications/STM32CubeIDE.app/Contents/Eclipse/plugins/com.st.stm32cube.ide.mcu.externaltools.gnu-tools-for-stm32.13.3.rel1.macos64_1.0.0.202411102158/tools/arm-none-eabi/include/assert.h"
	.byte	0x3
	.uleb128 0x1ce
	.uleb128 0x17
	.byte	0x7
	.4byte	.Ldebug_macro20
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro21
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro22
	.byte	0x3
	.uleb128 0x11
	.uleb128 0x4
	.byte	0x7
	.4byte	.Ldebug_macro23
	.byte	0x4
	.file 24 "/Applications/STM32CubeIDE.app/Contents/Eclipse/plugins/com.st.stm32cube.ide.mcu.externaltools.gnu-tools-for-stm32.13.3.rel1.macos64_1.0.0.202411102158/tools/arm-none-eabi/include/sys/_locale.h"
	.byte	0x3
	.uleb128 0x14
	.uleb128 0x18
	.byte	0x5
	.uleb128 0x4
	.4byte	.LASF957
	.byte	0x4
	.file 25 "/Applications/STM32CubeIDE.app/Contents/Eclipse/plugins/com.st.stm32cube.ide.mcu.externaltools.gnu-tools-for-stm32.13.3.rel1.macos64_1.0.0.202411102158/tools/arm-none-eabi/include/strings.h"
	.byte	0x3
	.uleb128 0x18
	.uleb128 0x19
	.byte	0x5
	.uleb128 0x1e
	.4byte	.LASF958
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro24
	.file 26 "/Applications/STM32CubeIDE.app/Contents/Eclipse/plugins/com.st.stm32cube.ide.mcu.externaltools.gnu-tools-for-stm32.13.3.rel1.macos64_1.0.0.202411102158/tools/arm-none-eabi/include/sys/string.h"
	.byte	0x3
	.uleb128 0xbd
	.uleb128 0x1a
	.byte	0x4
	.byte	0x4
	.byte	0x3
	.uleb128 0x3
	.uleb128 0x7
	.byte	0x5
	.uleb128 0x8
	.4byte	.LASF963
	.byte	0x3
	.uleb128 0xa
	.uleb128 0x11
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro25
	.byte	0x3
	.uleb128 0x10
	.uleb128 0x4
	.byte	0x7
	.4byte	.Ldebug_macro23
	.byte	0x4
	.file 27 "/Applications/STM32CubeIDE.app/Contents/Eclipse/plugins/com.st.stm32cube.ide.mcu.externaltools.gnu-tools-for-stm32.13.3.rel1.macos64_1.0.0.202411102158/tools/arm-none-eabi/include/machine/stdlib.h"
	.byte	0x3
	.uleb128 0x14
	.uleb128 0x1b
	.byte	0x5
	.uleb128 0x2
	.4byte	.LASF965
	.byte	0x4
	.file 28 "/Applications/STM32CubeIDE.app/Contents/Eclipse/plugins/com.st.stm32cube.ide.mcu.externaltools.gnu-tools-for-stm32.13.3.rel1.macos64_1.0.0.202411102158/tools/arm-none-eabi/include/alloca.h"
	.byte	0x3
	.uleb128 0x16
	.uleb128 0x1c
	.byte	0x7
	.4byte	.Ldebug_macro26
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro27
	.byte	0x4
	.byte	0x5
	.uleb128 0x9
	.4byte	.LASF975
	.byte	0x5
	.uleb128 0xd
	.4byte	.LASF976
	.byte	0x5
	.uleb128 0xa7
	.4byte	.LASF977
	.byte	0x6
	.uleb128 0xc3
	.4byte	.LASF978
	.byte	0x4
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4._newlib_version.h.4.411db44ea2338a62eca2f0777f81481b,comdat
.Ldebug_macro2:
	.2byte	0x5
	.byte	0
	.byte	0x5
	.uleb128 0x4
	.4byte	.LASF466
	.byte	0x5
	.uleb128 0x6
	.4byte	.LASF467
	.byte	0x5
	.uleb128 0x7
	.4byte	.LASF468
	.byte	0x5
	.uleb128 0x8
	.4byte	.LASF469
	.byte	0x5
	.uleb128 0x9
	.4byte	.LASF470
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.features.h.33.e0c9f337c65cb9f22ed5f23d082bc78b,comdat
.Ldebug_macro3:
	.2byte	0x5
	.byte	0
	.byte	0x5
	.uleb128 0x21
	.4byte	.LASF471
	.byte	0x5
	.uleb128 0x28
	.4byte	.LASF472
	.byte	0x6
	.uleb128 0x88
	.4byte	.LASF473
	.byte	0x5
	.uleb128 0x89
	.4byte	.LASF474
	.byte	0x6
	.uleb128 0x8d
	.4byte	.LASF475
	.byte	0x5
	.uleb128 0x8e
	.4byte	.LASF476
	.byte	0x6
	.uleb128 0x8f
	.4byte	.LASF477
	.byte	0x5
	.uleb128 0x90
	.4byte	.LASF478
	.byte	0x6
	.uleb128 0xa3
	.4byte	.LASF479
	.byte	0x5
	.uleb128 0xa4
	.4byte	.LASF480
	.byte	0x5
	.uleb128 0x101
	.4byte	.LASF481
	.byte	0x5
	.uleb128 0x107
	.4byte	.LASF482
	.byte	0x5
	.uleb128 0x10f
	.4byte	.LASF483
	.byte	0x5
	.uleb128 0x117
	.4byte	.LASF484
	.byte	0x5
	.uleb128 0x122
	.4byte	.LASF485
	.byte	0x5
	.uleb128 0x126
	.4byte	.LASF486
	.byte	0x5
	.uleb128 0x12c
	.4byte	.LASF487
	.byte	0x5
	.uleb128 0x13c
	.4byte	.LASF488
	.byte	0x5
	.uleb128 0x14c
	.4byte	.LASF489
	.byte	0x5
	.uleb128 0x15e
	.4byte	.LASF490
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4._default_types.h.15.247e5cd201eca3442cbf5404108c4935,comdat
.Ldebug_macro4:
	.2byte	0x5
	.byte	0
	.byte	0x5
	.uleb128 0xf
	.4byte	.LASF491
	.byte	0x5
	.uleb128 0x1a
	.4byte	.LASF492
	.byte	0x5
	.uleb128 0x21
	.4byte	.LASF493
	.byte	0x5
	.uleb128 0x2f
	.4byte	.LASF494
	.byte	0x5
	.uleb128 0x3d
	.4byte	.LASF495
	.byte	0x5
	.uleb128 0x53
	.4byte	.LASF496
	.byte	0x5
	.uleb128 0x6d
	.4byte	.LASF497
	.byte	0x5
	.uleb128 0x8c
	.4byte	.LASF498
	.byte	0x5
	.uleb128 0xa6
	.4byte	.LASF499
	.byte	0x5
	.uleb128 0xbc
	.4byte	.LASF500
	.byte	0x5
	.uleb128 0xce
	.4byte	.LASF501
	.byte	0x6
	.uleb128 0xf4
	.4byte	.LASF502
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4._intsup.h.10.48bafbb683905c4daa4565a85aeeb264,comdat
.Ldebug_macro5:
	.2byte	0x5
	.byte	0
	.byte	0x5
	.uleb128 0xa
	.4byte	.LASF503
	.byte	0x5
	.uleb128 0x10
	.4byte	.LASF504
	.byte	0x6
	.uleb128 0x2b
	.4byte	.LASF505
	.byte	0x6
	.uleb128 0x2c
	.4byte	.LASF506
	.byte	0x6
	.uleb128 0x2d
	.4byte	.LASF507
	.byte	0x6
	.uleb128 0x2e
	.4byte	.LASF508
	.byte	0x2
	.uleb128 0x2f
	.ascii	"int\000"
	.byte	0x6
	.uleb128 0x30
	.4byte	.LASF509
	.byte	0x6
	.uleb128 0x31
	.4byte	.LASF510
	.byte	0x6
	.uleb128 0x32
	.4byte	.LASF511
	.byte	0x5
	.uleb128 0x33
	.4byte	.LASF512
	.byte	0x5
	.uleb128 0x34
	.4byte	.LASF513
	.byte	0x5
	.uleb128 0x35
	.4byte	.LASF514
	.byte	0x5
	.uleb128 0x36
	.4byte	.LASF515
	.byte	0x5
	.uleb128 0x37
	.4byte	.LASF516
	.byte	0x5
	.uleb128 0x38
	.4byte	.LASF517
	.byte	0x5
	.uleb128 0x39
	.4byte	.LASF518
	.byte	0x5
	.uleb128 0x3a
	.4byte	.LASF519
	.byte	0x5
	.uleb128 0x43
	.4byte	.LASF520
	.byte	0x5
	.uleb128 0x4a
	.4byte	.LASF521
	.byte	0x5
	.uleb128 0x52
	.4byte	.LASF522
	.byte	0x5
	.uleb128 0x5d
	.4byte	.LASF523
	.byte	0x5
	.uleb128 0x68
	.4byte	.LASF524
	.byte	0x5
	.uleb128 0x71
	.4byte	.LASF525
	.byte	0x5
	.uleb128 0x78
	.4byte	.LASF526
	.byte	0x5
	.uleb128 0x81
	.4byte	.LASF527
	.byte	0x5
	.uleb128 0x88
	.4byte	.LASF528
	.byte	0x5
	.uleb128 0x93
	.4byte	.LASF529
	.byte	0x5
	.uleb128 0x97
	.4byte	.LASF530
	.byte	0x5
	.uleb128 0xa2
	.4byte	.LASF531
	.byte	0x5
	.uleb128 0xad
	.4byte	.LASF532
	.byte	0x5
	.uleb128 0xb6
	.4byte	.LASF533
	.byte	0x6
	.uleb128 0xb8
	.4byte	.LASF505
	.byte	0x6
	.uleb128 0xb9
	.4byte	.LASF506
	.byte	0x6
	.uleb128 0xba
	.4byte	.LASF507
	.byte	0x6
	.uleb128 0xbb
	.4byte	.LASF508
	.byte	0x2
	.uleb128 0xbc
	.ascii	"int\000"
	.byte	0x6
	.uleb128 0xbd
	.4byte	.LASF511
	.byte	0x6
	.uleb128 0xc2
	.4byte	.LASF509
	.byte	0x6
	.uleb128 0xc3
	.4byte	.LASF510
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4._stdint.h.10.c24fa3af3bc1706662bb5593a907e841,comdat
.Ldebug_macro6:
	.2byte	0x5
	.byte	0
	.byte	0x5
	.uleb128 0xa
	.4byte	.LASF534
	.byte	0x5
	.uleb128 0x15
	.4byte	.LASF535
	.byte	0x5
	.uleb128 0x19
	.4byte	.LASF536
	.byte	0x5
	.uleb128 0x1b
	.4byte	.LASF537
	.byte	0x5
	.uleb128 0x21
	.4byte	.LASF538
	.byte	0x5
	.uleb128 0x25
	.4byte	.LASF539
	.byte	0x5
	.uleb128 0x27
	.4byte	.LASF540
	.byte	0x5
	.uleb128 0x2d
	.4byte	.LASF541
	.byte	0x5
	.uleb128 0x31
	.4byte	.LASF542
	.byte	0x5
	.uleb128 0x33
	.4byte	.LASF543
	.byte	0x5
	.uleb128 0x39
	.4byte	.LASF544
	.byte	0x5
	.uleb128 0x3d
	.4byte	.LASF545
	.byte	0x5
	.uleb128 0x3f
	.4byte	.LASF546
	.byte	0x5
	.uleb128 0x44
	.4byte	.LASF547
	.byte	0x5
	.uleb128 0x49
	.4byte	.LASF548
	.byte	0x5
	.uleb128 0x4e
	.4byte	.LASF549
	.byte	0x5
	.uleb128 0x53
	.4byte	.LASF550
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stdint.h.23.d53047a68f4a85177f80b422d52785ed,comdat
.Ldebug_macro7:
	.2byte	0x5
	.byte	0
	.byte	0x5
	.uleb128 0x17
	.4byte	.LASF551
	.byte	0x5
	.uleb128 0x1d
	.4byte	.LASF552
	.byte	0x5
	.uleb128 0x23
	.4byte	.LASF553
	.byte	0x5
	.uleb128 0x29
	.4byte	.LASF554
	.byte	0x5
	.uleb128 0x35
	.4byte	.LASF555
	.byte	0x5
	.uleb128 0x3f
	.4byte	.LASF556
	.byte	0x5
	.uleb128 0x49
	.4byte	.LASF557
	.byte	0x5
	.uleb128 0x53
	.4byte	.LASF558
	.byte	0x5
	.uleb128 0x80
	.4byte	.LASF559
	.byte	0x5
	.uleb128 0x81
	.4byte	.LASF560
	.byte	0x5
	.uleb128 0x82
	.4byte	.LASF561
	.byte	0x5
	.uleb128 0x98
	.4byte	.LASF562
	.byte	0x5
	.uleb128 0x99
	.4byte	.LASF563
	.byte	0x5
	.uleb128 0x9a
	.4byte	.LASF564
	.byte	0x5
	.uleb128 0xa2
	.4byte	.LASF565
	.byte	0x5
	.uleb128 0xa3
	.4byte	.LASF566
	.byte	0x5
	.uleb128 0xa4
	.4byte	.LASF567
	.byte	0x5
	.uleb128 0xae
	.4byte	.LASF568
	.byte	0x5
	.uleb128 0xaf
	.4byte	.LASF569
	.byte	0x5
	.uleb128 0xb0
	.4byte	.LASF570
	.byte	0x5
	.uleb128 0xb8
	.4byte	.LASF571
	.byte	0x5
	.uleb128 0xb9
	.4byte	.LASF572
	.byte	0x5
	.uleb128 0xba
	.4byte	.LASF573
	.byte	0x5
	.uleb128 0xc4
	.4byte	.LASF574
	.byte	0x5
	.uleb128 0xc5
	.4byte	.LASF575
	.byte	0x5
	.uleb128 0xc6
	.4byte	.LASF576
	.byte	0x5
	.uleb128 0xd4
	.4byte	.LASF577
	.byte	0x5
	.uleb128 0xd5
	.4byte	.LASF578
	.byte	0x5
	.uleb128 0xd6
	.4byte	.LASF579
	.byte	0x5
	.uleb128 0xe6
	.4byte	.LASF580
	.byte	0x5
	.uleb128 0xe7
	.4byte	.LASF581
	.byte	0x5
	.uleb128 0xe8
	.4byte	.LASF582
	.byte	0x5
	.uleb128 0xf6
	.4byte	.LASF583
	.byte	0x5
	.uleb128 0xf7
	.4byte	.LASF584
	.byte	0x5
	.uleb128 0xf8
	.4byte	.LASF585
	.byte	0x5
	.uleb128 0x106
	.4byte	.LASF586
	.byte	0x5
	.uleb128 0x107
	.4byte	.LASF587
	.byte	0x5
	.uleb128 0x108
	.4byte	.LASF588
	.byte	0x5
	.uleb128 0x116
	.4byte	.LASF589
	.byte	0x5
	.uleb128 0x117
	.4byte	.LASF590
	.byte	0x5
	.uleb128 0x118
	.4byte	.LASF591
	.byte	0x5
	.uleb128 0x126
	.4byte	.LASF592
	.byte	0x5
	.uleb128 0x127
	.4byte	.LASF593
	.byte	0x5
	.uleb128 0x128
	.4byte	.LASF594
	.byte	0x5
	.uleb128 0x136
	.4byte	.LASF595
	.byte	0x5
	.uleb128 0x137
	.4byte	.LASF596
	.byte	0x5
	.uleb128 0x138
	.4byte	.LASF597
	.byte	0x5
	.uleb128 0x146
	.4byte	.LASF598
	.byte	0x5
	.uleb128 0x147
	.4byte	.LASF599
	.byte	0x5
	.uleb128 0x14f
	.4byte	.LASF600
	.byte	0x5
	.uleb128 0x157
	.4byte	.LASF601
	.byte	0x5
	.uleb128 0x15d
	.4byte	.LASF602
	.byte	0x5
	.uleb128 0x15e
	.4byte	.LASF603
	.byte	0x5
	.uleb128 0x162
	.4byte	.LASF604
	.byte	0x5
	.uleb128 0x166
	.4byte	.LASF605
	.byte	0x5
	.uleb128 0x16b
	.4byte	.LASF606
	.byte	0x5
	.uleb128 0x176
	.4byte	.LASF607
	.byte	0x5
	.uleb128 0x180
	.4byte	.LASF608
	.byte	0x5
	.uleb128 0x185
	.4byte	.LASF609
	.byte	0x5
	.uleb128 0x18c
	.4byte	.LASF610
	.byte	0x5
	.uleb128 0x18d
	.4byte	.LASF611
	.byte	0x5
	.uleb128 0x198
	.4byte	.LASF612
	.byte	0x5
	.uleb128 0x199
	.4byte	.LASF613
	.byte	0x5
	.uleb128 0x1a4
	.4byte	.LASF614
	.byte	0x5
	.uleb128 0x1a5
	.4byte	.LASF615
	.byte	0x5
	.uleb128 0x1b1
	.4byte	.LASF616
	.byte	0x5
	.uleb128 0x1b2
	.4byte	.LASF617
	.byte	0x5
	.uleb128 0x1c1
	.4byte	.LASF618
	.byte	0x5
	.uleb128 0x1c2
	.4byte	.LASF619
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stddef.h.39.0dc9006b34572d4d9cae4c8b422c4971,comdat
.Ldebug_macro8:
	.2byte	0x5
	.byte	0
	.byte	0x5
	.uleb128 0x27
	.4byte	.LASF621
	.byte	0x5
	.uleb128 0x28
	.4byte	.LASF622
	.byte	0x5
	.uleb128 0x2a
	.4byte	.LASF623
	.byte	0x5
	.uleb128 0x84
	.4byte	.LASF624
	.byte	0x5
	.uleb128 0x85
	.4byte	.LASF625
	.byte	0x5
	.uleb128 0x86
	.4byte	.LASF626
	.byte	0x5
	.uleb128 0x87
	.4byte	.LASF627
	.byte	0x5
	.uleb128 0x88
	.4byte	.LASF628
	.byte	0x5
	.uleb128 0x89
	.4byte	.LASF629
	.byte	0x5
	.uleb128 0x8a
	.4byte	.LASF630
	.byte	0x5
	.uleb128 0x8b
	.4byte	.LASF631
	.byte	0x5
	.uleb128 0x8c
	.4byte	.LASF632
	.byte	0x5
	.uleb128 0x8d
	.4byte	.LASF633
	.byte	0x6
	.uleb128 0x9e
	.4byte	.LASF634
	.byte	0x5
	.uleb128 0xb9
	.4byte	.LASF635
	.byte	0x5
	.uleb128 0xba
	.4byte	.LASF636
	.byte	0x5
	.uleb128 0xbb
	.4byte	.LASF637
	.byte	0x5
	.uleb128 0xbc
	.4byte	.LASF638
	.byte	0x5
	.uleb128 0xbd
	.4byte	.LASF639
	.byte	0x5
	.uleb128 0xbe
	.4byte	.LASF640
	.byte	0x5
	.uleb128 0xbf
	.4byte	.LASF641
	.byte	0x5
	.uleb128 0xc0
	.4byte	.LASF642
	.byte	0x5
	.uleb128 0xc1
	.4byte	.LASF643
	.byte	0x5
	.uleb128 0xc2
	.4byte	.LASF644
	.byte	0x5
	.uleb128 0xc3
	.4byte	.LASF645
	.byte	0x5
	.uleb128 0xc4
	.4byte	.LASF646
	.byte	0x5
	.uleb128 0xc5
	.4byte	.LASF647
	.byte	0x5
	.uleb128 0xc6
	.4byte	.LASF648
	.byte	0x5
	.uleb128 0xc7
	.4byte	.LASF649
	.byte	0x5
	.uleb128 0xc8
	.4byte	.LASF650
	.byte	0x5
	.uleb128 0xc9
	.4byte	.LASF651
	.byte	0x5
	.uleb128 0xd0
	.4byte	.LASF652
	.byte	0x6
	.uleb128 0xed
	.4byte	.LASF653
	.byte	0x5
	.uleb128 0x10b
	.4byte	.LASF654
	.byte	0x5
	.uleb128 0x10c
	.4byte	.LASF655
	.byte	0x5
	.uleb128 0x10d
	.4byte	.LASF656
	.byte	0x5
	.uleb128 0x10e
	.4byte	.LASF657
	.byte	0x5
	.uleb128 0x10f
	.4byte	.LASF658
	.byte	0x5
	.uleb128 0x110
	.4byte	.LASF659
	.byte	0x5
	.uleb128 0x111
	.4byte	.LASF660
	.byte	0x5
	.uleb128 0x112
	.4byte	.LASF661
	.byte	0x5
	.uleb128 0x113
	.4byte	.LASF662
	.byte	0x5
	.uleb128 0x114
	.4byte	.LASF663
	.byte	0x5
	.uleb128 0x115
	.4byte	.LASF664
	.byte	0x5
	.uleb128 0x116
	.4byte	.LASF665
	.byte	0x5
	.uleb128 0x117
	.4byte	.LASF666
	.byte	0x5
	.uleb128 0x118
	.4byte	.LASF667
	.byte	0x5
	.uleb128 0x119
	.4byte	.LASF668
	.byte	0x5
	.uleb128 0x11a
	.4byte	.LASF669
	.byte	0x6
	.uleb128 0x127
	.4byte	.LASF670
	.byte	0x6
	.uleb128 0x15d
	.4byte	.LASF671
	.byte	0x6
	.uleb128 0x18f
	.4byte	.LASF672
	.byte	0x5
	.uleb128 0x194
	.4byte	.LASF673
	.byte	0x6
	.uleb128 0x19a
	.4byte	.LASF674
	.byte	0x6
	.uleb128 0x19f
	.4byte	.LASF675
	.byte	0x5
	.uleb128 0x1a0
	.4byte	.LASF676
	.byte	0x5
	.uleb128 0x1a5
	.4byte	.LASF677
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.newlib.h.7.d92c3fcef74a31e0d5308877d46e9786,comdat
.Ldebug_macro9:
	.2byte	0x5
	.byte	0
	.byte	0x5
	.uleb128 0x7
	.4byte	.LASF680
	.byte	0x5
	.uleb128 0x1b
	.4byte	.LASF681
	.byte	0x5
	.uleb128 0x27
	.4byte	.LASF682
	.byte	0x5
	.uleb128 0x2b
	.4byte	.LASF683
	.byte	0x5
	.uleb128 0x2e
	.4byte	.LASF684
	.byte	0x5
	.uleb128 0x163
	.4byte	.LASF685
	.byte	0x5
	.uleb128 0x166
	.4byte	.LASF686
	.byte	0x5
	.uleb128 0x16c
	.4byte	.LASF687
	.byte	0x5
	.uleb128 0x16f
	.4byte	.LASF688
	.byte	0x5
	.uleb128 0x172
	.4byte	.LASF689
	.byte	0x5
	.uleb128 0x177
	.4byte	.LASF690
	.byte	0x5
	.uleb128 0x17a
	.4byte	.LASF691
	.byte	0x5
	.uleb128 0x193
	.4byte	.LASF692
	.byte	0x5
	.uleb128 0x19d
	.4byte	.LASF693
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.ieeefp.h.77.5ad60f72ea25fc152400b550ac118212,comdat
.Ldebug_macro10:
	.2byte	0x5
	.byte	0
	.byte	0x5
	.uleb128 0x4d
	.4byte	.LASF695
	.byte	0x5
	.uleb128 0x5b
	.4byte	.LASF696
	.byte	0x5
	.uleb128 0x62
	.4byte	.LASF697
	.byte	0x5
	.uleb128 0x63
	.4byte	.LASF698
	.byte	0x5
	.uleb128 0x207
	.4byte	.LASF699
	.byte	0x5
	.uleb128 0x20a
	.4byte	.LASF700
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.config.h.224.88344135d9de3e7ea139102cd6493448,comdat
.Ldebug_macro11:
	.2byte	0x5
	.byte	0
	.byte	0x5
	.uleb128 0xe0
	.4byte	.LASF701
	.byte	0x6
	.uleb128 0xe6
	.4byte	.LASF702
	.byte	0x5
	.uleb128 0xea
	.4byte	.LASF703
	.byte	0x5
	.uleb128 0xf8
	.4byte	.LASF704
	.byte	0x5
	.uleb128 0xfc
	.4byte	.LASF705
	.byte	0x5
	.uleb128 0x103
	.4byte	.LASF706
	.byte	0x5
	.uleb128 0x109
	.4byte	.LASF707
	.byte	0x5
	.uleb128 0x116
	.4byte	.LASF708
	.byte	0x5
	.uleb128 0x122
	.4byte	.LASF709
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4._ansi.h.31.de524f58584151836e90d8620a16f8e8,comdat
.Ldebug_macro12:
	.2byte	0x5
	.byte	0
	.byte	0x5
	.uleb128 0x1f
	.4byte	.LASF710
	.byte	0x5
	.uleb128 0x20
	.4byte	.LASF711
	.byte	0x5
	.uleb128 0x21
	.4byte	.LASF712
	.byte	0x5
	.uleb128 0x25
	.4byte	.LASF713
	.byte	0x5
	.uleb128 0x2b
	.4byte	.LASF714
	.byte	0x5
	.uleb128 0x45
	.4byte	.LASF715
	.byte	0x5
	.uleb128 0x49
	.4byte	.LASF716
	.byte	0x5
	.uleb128 0x4a
	.4byte	.LASF717
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.cdefs.h.49.70fc7af612f78ddcace70fdd90b5623b,comdat
.Ldebug_macro13:
	.2byte	0x5
	.byte	0
	.byte	0x5
	.uleb128 0x31
	.4byte	.LASF720
	.byte	0x5
	.uleb128 0x32
	.4byte	.LASF721
	.byte	0x5
	.uleb128 0x33
	.4byte	.LASF722
	.byte	0x5
	.uleb128 0x36
	.4byte	.LASF723
	.byte	0x5
	.uleb128 0x39
	.4byte	.LASF724
	.byte	0x5
	.uleb128 0x3a
	.4byte	.LASF725
	.byte	0x5
	.uleb128 0x3c
	.4byte	.LASF726
	.byte	0x5
	.uleb128 0x3d
	.4byte	.LASF727
	.byte	0x5
	.uleb128 0x3e
	.4byte	.LASF728
	.byte	0x5
	.uleb128 0x3f
	.4byte	.LASF729
	.byte	0x5
	.uleb128 0x42
	.4byte	.LASF730
	.byte	0x5
	.uleb128 0x43
	.4byte	.LASF731
	.byte	0x5
	.uleb128 0x44
	.4byte	.LASF732
	.byte	0x5
	.uleb128 0x4e
	.4byte	.LASF733
	.byte	0x5
	.uleb128 0x51
	.4byte	.LASF734
	.byte	0x5
	.uleb128 0x5e
	.4byte	.LASF735
	.byte	0x5
	.uleb128 0x5f
	.4byte	.LASF736
	.byte	0x5
	.uleb128 0x6b
	.4byte	.LASF737
	.byte	0x5
	.uleb128 0x6c
	.4byte	.LASF738
	.byte	0x5
	.uleb128 0x70
	.4byte	.LASF739
	.byte	0x5
	.uleb128 0x71
	.4byte	.LASF740
	.byte	0x5
	.uleb128 0x73
	.4byte	.LASF741
	.byte	0x5
	.uleb128 0x75
	.4byte	.LASF742
	.byte	0x5
	.uleb128 0x78
	.4byte	.LASF743
	.byte	0x5
	.uleb128 0x79
	.4byte	.LASF744
	.byte	0x5
	.uleb128 0x7a
	.4byte	.LASF745
	.byte	0x5
	.uleb128 0x7d
	.4byte	.LASF746
	.byte	0x5
	.uleb128 0x82
	.4byte	.LASF747
	.byte	0x5
	.uleb128 0x84
	.4byte	.LASF748
	.byte	0x5
	.uleb128 0x85
	.4byte	.LASF749
	.byte	0x5
	.uleb128 0x87
	.4byte	.LASF750
	.byte	0x5
	.uleb128 0x8a
	.4byte	.LASF751
	.byte	0x5
	.uleb128 0x8b
	.4byte	.LASF752
	.byte	0x5
	.uleb128 0x8c
	.4byte	.LASF753
	.byte	0x5
	.uleb128 0x8e
	.4byte	.LASF754
	.byte	0x5
	.uleb128 0x8f
	.4byte	.LASF755
	.byte	0x5
	.uleb128 0x91
	.4byte	.LASF756
	.byte	0x5
	.uleb128 0x93
	.4byte	.LASF757
	.byte	0x5
	.uleb128 0xa4
	.4byte	.LASF758
	.byte	0x5
	.uleb128 0xa5
	.4byte	.LASF759
	.byte	0x5
	.uleb128 0xa6
	.4byte	.LASF760
	.byte	0x5
	.uleb128 0xa7
	.4byte	.LASF761
	.byte	0x5
	.uleb128 0xa8
	.4byte	.LASF762
	.byte	0x5
	.uleb128 0xaa
	.4byte	.LASF763
	.byte	0x5
	.uleb128 0xab
	.4byte	.LASF764
	.byte	0x5
	.uleb128 0xac
	.4byte	.LASF765
	.byte	0x5
	.uleb128 0xd9
	.4byte	.LASF766
	.byte	0x5
	.uleb128 0xe6
	.4byte	.LASF767
	.byte	0x5
	.uleb128 0xe7
	.4byte	.LASF768
	.byte	0x5
	.uleb128 0xe8
	.4byte	.LASF769
	.byte	0x5
	.uleb128 0xe9
	.4byte	.LASF770
	.byte	0x5
	.uleb128 0xea
	.4byte	.LASF771
	.byte	0x5
	.uleb128 0xeb
	.4byte	.LASF772
	.byte	0x5
	.uleb128 0xec
	.4byte	.LASF773
	.byte	0x5
	.uleb128 0xef
	.4byte	.LASF774
	.byte	0x5
	.uleb128 0xf0
	.4byte	.LASF775
	.byte	0x5
	.uleb128 0xf6
	.4byte	.LASF776
	.byte	0x5
	.uleb128 0x152
	.4byte	.LASF777
	.byte	0x5
	.uleb128 0x164
	.4byte	.LASF778
	.byte	0x5
	.uleb128 0x16a
	.4byte	.LASF779
	.byte	0x5
	.uleb128 0x16b
	.4byte	.LASF780
	.byte	0x5
	.uleb128 0x172
	.4byte	.LASF781
	.byte	0x5
	.uleb128 0x178
	.4byte	.LASF782
	.byte	0x5
	.uleb128 0x17e
	.4byte	.LASF783
	.byte	0x5
	.uleb128 0x17f
	.4byte	.LASF784
	.byte	0x5
	.uleb128 0x186
	.4byte	.LASF785
	.byte	0x5
	.uleb128 0x187
	.4byte	.LASF786
	.byte	0x5
	.uleb128 0x18e
	.4byte	.LASF787
	.byte	0x5
	.uleb128 0x194
	.4byte	.LASF788
	.byte	0x5
	.uleb128 0x1a5
	.4byte	.LASF789
	.byte	0x5
	.uleb128 0x1b2
	.4byte	.LASF790
	.byte	0x5
	.uleb128 0x1d4
	.4byte	.LASF791
	.byte	0x5
	.uleb128 0x1d5
	.4byte	.LASF792
	.byte	0x5
	.uleb128 0x1dc
	.4byte	.LASF793
	.byte	0x5
	.uleb128 0x1dd
	.4byte	.LASF794
	.byte	0x5
	.uleb128 0x1e0
	.4byte	.LASF795
	.byte	0x5
	.uleb128 0x1ea
	.4byte	.LASF796
	.byte	0x5
	.uleb128 0x1eb
	.4byte	.LASF797
	.byte	0x5
	.uleb128 0x1f5
	.4byte	.LASF798
	.byte	0x5
	.uleb128 0x20b
	.4byte	.LASF799
	.byte	0x5
	.uleb128 0x20d
	.4byte	.LASF800
	.byte	0x5
	.uleb128 0x20f
	.4byte	.LASF801
	.byte	0x5
	.uleb128 0x210
	.4byte	.LASF802
	.byte	0x5
	.uleb128 0x212
	.4byte	.LASF803
	.byte	0x5
	.uleb128 0x21c
	.4byte	.LASF804
	.byte	0x5
	.uleb128 0x220
	.4byte	.LASF805
	.byte	0x5
	.uleb128 0x224
	.4byte	.LASF806
	.byte	0x5
	.uleb128 0x227
	.4byte	.LASF807
	.byte	0x5
	.uleb128 0x22b
	.4byte	.LASF808
	.byte	0x5
	.uleb128 0x22d
	.4byte	.LASF809
	.byte	0x5
	.uleb128 0x250
	.4byte	.LASF810
	.byte	0x5
	.uleb128 0x254
	.4byte	.LASF811
	.byte	0x5
	.uleb128 0x258
	.4byte	.LASF812
	.byte	0x5
	.uleb128 0x25c
	.4byte	.LASF813
	.byte	0x5
	.uleb128 0x260
	.4byte	.LASF814
	.byte	0x5
	.uleb128 0x264
	.4byte	.LASF815
	.byte	0x5
	.uleb128 0x268
	.4byte	.LASF816
	.byte	0x5
	.uleb128 0x26c
	.4byte	.LASF817
	.byte	0x5
	.uleb128 0x273
	.4byte	.LASF818
	.byte	0x5
	.uleb128 0x274
	.4byte	.LASF819
	.byte	0x5
	.uleb128 0x275
	.4byte	.LASF820
	.byte	0x5
	.uleb128 0x276
	.4byte	.LASF821
	.byte	0x5
	.uleb128 0x277
	.4byte	.LASF822
	.byte	0x5
	.uleb128 0x28c
	.4byte	.LASF823
	.byte	0x5
	.uleb128 0x28d
	.4byte	.LASF824
	.byte	0x5
	.uleb128 0x29f
	.4byte	.LASF825
	.byte	0x5
	.uleb128 0x2a5
	.4byte	.LASF826
	.byte	0x5
	.uleb128 0x2a8
	.4byte	.LASF827
	.byte	0x5
	.uleb128 0x2aa
	.4byte	.LASF828
	.byte	0x5
	.uleb128 0x2ae
	.4byte	.LASF829
	.byte	0x5
	.uleb128 0x2b0
	.4byte	.LASF830
	.byte	0x5
	.uleb128 0x2b4
	.4byte	.LASF831
	.byte	0x5
	.uleb128 0x2b7
	.4byte	.LASF832
	.byte	0x5
	.uleb128 0x2b9
	.4byte	.LASF833
	.byte	0x5
	.uleb128 0x2bd
	.4byte	.LASF834
	.byte	0x5
	.uleb128 0x2bf
	.4byte	.LASF835
	.byte	0x5
	.uleb128 0x2c1
	.4byte	.LASF836
	.byte	0x5
	.uleb128 0x2c5
	.4byte	.LASF837
	.byte	0x5
	.uleb128 0x2d6
	.4byte	.LASF838
	.byte	0x5
	.uleb128 0x2d7
	.4byte	.LASF839
	.byte	0x5
	.uleb128 0x2d8
	.4byte	.LASF840
	.byte	0x5
	.uleb128 0x2dc
	.4byte	.LASF841
	.byte	0x5
	.uleb128 0x2dd
	.4byte	.LASF842
	.byte	0x5
	.uleb128 0x2e2
	.4byte	.LASF843
	.byte	0x5
	.uleb128 0x2e6
	.4byte	.LASF844
	.byte	0x5
	.uleb128 0x2ea
	.4byte	.LASF845
	.byte	0x5
	.uleb128 0x2ee
	.4byte	.LASF846
	.byte	0x5
	.uleb128 0x2ef
	.4byte	.LASF847
	.byte	0x5
	.uleb128 0x2f0
	.4byte	.LASF848
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4._types.h.20.dd0d04dca3800a0d2a6129b87f3adbb2,comdat
.Ldebug_macro14:
	.2byte	0x5
	.byte	0
	.byte	0x5
	.uleb128 0x14
	.4byte	.LASF849
	.byte	0x5
	.uleb128 0x16
	.4byte	.LASF850
	.byte	0x5
	.uleb128 0x17
	.4byte	.LASF851
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stddef.h.158.6f8e08a347b1cff664332fa350bfceb3,comdat
.Ldebug_macro15:
	.2byte	0x5
	.byte	0
	.byte	0x6
	.uleb128 0x9e
	.4byte	.LASF634
	.byte	0x6
	.uleb128 0xed
	.4byte	.LASF653
	.byte	0x6
	.uleb128 0x15d
	.4byte	.LASF671
	.byte	0x5
	.uleb128 0x162
	.4byte	.LASF852
	.byte	0x6
	.uleb128 0x169
	.4byte	.LASF853
	.byte	0x6
	.uleb128 0x18f
	.4byte	.LASF672
	.byte	0x5
	.uleb128 0x194
	.4byte	.LASF673
	.byte	0x6
	.uleb128 0x19a
	.4byte	.LASF674
	.byte	0x6
	.uleb128 0x19f
	.4byte	.LASF675
	.byte	0x5
	.uleb128 0x1a0
	.4byte	.LASF676
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4._types.h.127.3bdfe3ff8ea2d0985b03d9cbe93480e3,comdat
.Ldebug_macro16:
	.2byte	0x5
	.byte	0
	.byte	0x6
	.uleb128 0x7f
	.4byte	.LASF855
	.byte	0x5
	.uleb128 0x92
	.4byte	.LASF856
	.byte	0x6
	.uleb128 0x94
	.4byte	.LASF506
	.byte	0x5
	.uleb128 0xb3
	.4byte	.LASF857
	.byte	0x5
	.uleb128 0xbb
	.4byte	.LASF858
	.byte	0x5
	.uleb128 0xc0
	.4byte	.LASF859
	.byte	0x5
	.uleb128 0xc9
	.4byte	.LASF860
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.reent.h.18.25503cdc8b7e55dd0d6ea7b3e5af7a03,comdat
.Ldebug_macro17:
	.2byte	0x5
	.byte	0
	.byte	0x5
	.uleb128 0x12
	.4byte	.LASF861
	.byte	0x5
	.uleb128 0x16
	.4byte	.LASF862
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.lock.h.2.1461d1fff82dffe8bfddc23307f6484f,comdat
.Ldebug_macro18:
	.2byte	0x5
	.byte	0
	.byte	0x5
	.uleb128 0x2
	.4byte	.LASF863
	.byte	0x5
	.uleb128 0x23
	.4byte	.LASF864
	.byte	0x5
	.uleb128 0x25
	.4byte	.LASF865
	.byte	0x5
	.uleb128 0x27
	.4byte	.LASF866
	.byte	0x5
	.uleb128 0x2a
	.4byte	.LASF867
	.byte	0x5
	.uleb128 0x2c
	.4byte	.LASF868
	.byte	0x5
	.uleb128 0x2e
	.4byte	.LASF869
	.byte	0x5
	.uleb128 0x30
	.4byte	.LASF870
	.byte	0x5
	.uleb128 0x32
	.4byte	.LASF871
	.byte	0x5
	.uleb128 0x34
	.4byte	.LASF872
	.byte	0x5
	.uleb128 0x36
	.4byte	.LASF873
	.byte	0x5
	.uleb128 0x38
	.4byte	.LASF874
	.byte	0x5
	.uleb128 0x3b
	.4byte	.LASF875
	.byte	0x5
	.uleb128 0x3d
	.4byte	.LASF876
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.reent.h.78.390de510207922ae4defb78c0f450fc3,comdat
.Ldebug_macro19:
	.2byte	0x5
	.byte	0
	.byte	0x5
	.uleb128 0x4e
	.4byte	.LASF877
	.byte	0x5
	.uleb128 0x61
	.4byte	.LASF878
	.byte	0x5
	.uleb128 0x92
	.4byte	.LASF879
	.byte	0x5
	.uleb128 0x12b
	.4byte	.LASF880
	.byte	0x5
	.uleb128 0x12c
	.4byte	.LASF881
	.byte	0x5
	.uleb128 0x12d
	.4byte	.LASF882
	.byte	0x5
	.uleb128 0x12e
	.4byte	.LASF883
	.byte	0x5
	.uleb128 0x12f
	.4byte	.LASF884
	.byte	0x5
	.uleb128 0x130
	.4byte	.LASF885
	.byte	0x5
	.uleb128 0x131
	.4byte	.LASF886
	.byte	0x5
	.uleb128 0x13d
	.4byte	.LASF887
	.byte	0x5
	.uleb128 0x13e
	.4byte	.LASF888
	.byte	0x5
	.uleb128 0x13f
	.4byte	.LASF889
	.byte	0x5
	.uleb128 0x14a
	.4byte	.LASF890
	.byte	0x5
	.uleb128 0x14b
	.4byte	.LASF891
	.byte	0x5
	.uleb128 0x14c
	.4byte	.LASF892
	.byte	0x5
	.uleb128 0x14d
	.4byte	.LASF893
	.byte	0x5
	.uleb128 0x14e
	.4byte	.LASF894
	.byte	0x5
	.uleb128 0x1ac
	.4byte	.LASF895
	.byte	0x5
	.uleb128 0x1c6
	.4byte	.LASF896
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.assert.h.11.db24e541f16414db224bf986d21017e2,comdat
.Ldebug_macro20:
	.2byte	0x5
	.byte	0
	.byte	0x6
	.uleb128 0xb
	.4byte	.LASF897
	.byte	0x5
	.uleb128 0x10
	.4byte	.LASF898
	.byte	0x5
	.uleb128 0x1a
	.4byte	.LASF899
	.byte	0x5
	.uleb128 0x2d
	.4byte	.LASF900
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.reent.h.463.ea06f504d21c8c4258c6fe87e50d6d65,comdat
.Ldebug_macro21:
	.2byte	0x5
	.byte	0
	.byte	0x5
	.uleb128 0x1cf
	.4byte	.LASF901
	.byte	0x5
	.uleb128 0x1d9
	.4byte	.LASF902
	.byte	0x5
	.uleb128 0x1e2
	.4byte	.LASF903
	.byte	0x5
	.uleb128 0x1e6
	.4byte	.LASF904
	.byte	0x5
	.uleb128 0x1eb
	.4byte	.LASF905
	.byte	0x5
	.uleb128 0x1f6
	.4byte	.LASF906
	.byte	0x5
	.uleb128 0x1f9
	.4byte	.LASF907
	.byte	0x5
	.uleb128 0x1ff
	.4byte	.LASF908
	.byte	0x5
	.uleb128 0x202
	.4byte	.LASF909
	.byte	0x5
	.uleb128 0x208
	.4byte	.LASF910
	.byte	0x5
	.uleb128 0x20a
	.4byte	.LASF911
	.byte	0x5
	.uleb128 0x221
	.4byte	.LASF912
	.byte	0x5
	.uleb128 0x224
	.4byte	.LASF913
	.byte	0x5
	.uleb128 0x227
	.4byte	.LASF914
	.byte	0x5
	.uleb128 0x228
	.4byte	.LASF915
	.byte	0x5
	.uleb128 0x229
	.4byte	.LASF916
	.byte	0x5
	.uleb128 0x22a
	.4byte	.LASF917
	.byte	0x5
	.uleb128 0x22b
	.4byte	.LASF918
	.byte	0x5
	.uleb128 0x22c
	.4byte	.LASF919
	.byte	0x5
	.uleb128 0x22d
	.4byte	.LASF920
	.byte	0x5
	.uleb128 0x22e
	.4byte	.LASF921
	.byte	0x5
	.uleb128 0x22f
	.4byte	.LASF922
	.byte	0x5
	.uleb128 0x230
	.4byte	.LASF923
	.byte	0x5
	.uleb128 0x231
	.4byte	.LASF924
	.byte	0x5
	.uleb128 0x232
	.4byte	.LASF925
	.byte	0x5
	.uleb128 0x233
	.4byte	.LASF926
	.byte	0x5
	.uleb128 0x234
	.4byte	.LASF927
	.byte	0x5
	.uleb128 0x235
	.4byte	.LASF928
	.byte	0x5
	.uleb128 0x236
	.4byte	.LASF929
	.byte	0x5
	.uleb128 0x237
	.4byte	.LASF930
	.byte	0x5
	.uleb128 0x238
	.4byte	.LASF931
	.byte	0x5
	.uleb128 0x239
	.4byte	.LASF932
	.byte	0x5
	.uleb128 0x23a
	.4byte	.LASF933
	.byte	0x5
	.uleb128 0x23b
	.4byte	.LASF934
	.byte	0x5
	.uleb128 0x23c
	.4byte	.LASF935
	.byte	0x5
	.uleb128 0x23d
	.4byte	.LASF936
	.byte	0x5
	.uleb128 0x23e
	.4byte	.LASF937
	.byte	0x5
	.uleb128 0x303
	.4byte	.LASF938
	.byte	0x5
	.uleb128 0x304
	.4byte	.LASF939
	.byte	0x5
	.uleb128 0x305
	.4byte	.LASF940
	.byte	0x5
	.uleb128 0x306
	.4byte	.LASF941
	.byte	0x5
	.uleb128 0x307
	.4byte	.LASF942
	.byte	0x5
	.uleb128 0x308
	.4byte	.LASF943
	.byte	0x5
	.uleb128 0x309
	.4byte	.LASF944
	.byte	0x5
	.uleb128 0x30a
	.4byte	.LASF945
	.byte	0x5
	.uleb128 0x30b
	.4byte	.LASF946
	.byte	0x5
	.uleb128 0x30c
	.4byte	.LASF947
	.byte	0x5
	.uleb128 0x30d
	.4byte	.LASF948
	.byte	0x5
	.uleb128 0x30f
	.4byte	.LASF949
	.byte	0x5
	.uleb128 0x31a
	.4byte	.LASF950
	.byte	0x5
	.uleb128 0x320
	.4byte	.LASF951
	.byte	0x5
	.uleb128 0x32d
	.4byte	.LASF952
	.byte	0x5
	.uleb128 0x330
	.4byte	.LASF953
	.byte	0x5
	.uleb128 0x332
	.4byte	.LASF954
	.byte	0x5
	.uleb128 0x393
	.4byte	.LASF955
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.string.h.15.dab3980bf35408a4c507182805e2de3a,comdat
.Ldebug_macro22:
	.2byte	0x5
	.byte	0
	.byte	0x5
	.uleb128 0xf
	.4byte	.LASF850
	.byte	0x5
	.uleb128 0x10
	.4byte	.LASF956
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stddef.h.158.eec8bf00b5213f43d095cb984c5f22e3,comdat
.Ldebug_macro23:
	.2byte	0x5
	.byte	0
	.byte	0x6
	.uleb128 0x9e
	.4byte	.LASF634
	.byte	0x6
	.uleb128 0xed
	.4byte	.LASF653
	.byte	0x6
	.uleb128 0x15d
	.4byte	.LASF671
	.byte	0x6
	.uleb128 0x18f
	.4byte	.LASF672
	.byte	0x5
	.uleb128 0x194
	.4byte	.LASF673
	.byte	0x6
	.uleb128 0x19a
	.4byte	.LASF674
	.byte	0x6
	.uleb128 0x19f
	.4byte	.LASF675
	.byte	0x5
	.uleb128 0x1a0
	.4byte	.LASF676
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.string.h.177.59a005921fa78485abc80a0267de5752,comdat
.Ldebug_macro24:
	.2byte	0x5
	.byte	0
	.byte	0x5
	.uleb128 0xb1
	.4byte	.LASF959
	.byte	0x5
	.uleb128 0xb4
	.4byte	.LASF960
	.byte	0x5
	.uleb128 0xb7
	.4byte	.LASF961
	.byte	0x5
	.uleb128 0xba
	.4byte	.LASF962
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stdlib.h.13.4ed386f5c1a80d71e72172885d946ef2,comdat
.Ldebug_macro25:
	.2byte	0x5
	.byte	0
	.byte	0x5
	.uleb128 0xd
	.4byte	.LASF850
	.byte	0x5
	.uleb128 0xe
	.4byte	.LASF964
	.byte	0x5
	.uleb128 0xf
	.4byte	.LASF956
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.alloca.h.8.dfc0c703c47ec3e69746825b17d9e66d,comdat
.Ldebug_macro26:
	.2byte	0x5
	.byte	0
	.byte	0x5
	.uleb128 0x8
	.4byte	.LASF966
	.byte	0x6
	.uleb128 0xd
	.4byte	.LASF967
	.byte	0x5
	.uleb128 0x10
	.4byte	.LASF968
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stdlib.h.56.f4862cfbf4363a1db01842d5bdf72c18,comdat
.Ldebug_macro27:
	.2byte	0x5
	.byte	0
	.byte	0x5
	.uleb128 0x38
	.4byte	.LASF969
	.byte	0x5
	.uleb128 0x3c
	.4byte	.LASF970
	.byte	0x5
	.uleb128 0x3d
	.4byte	.LASF971
	.byte	0x5
	.uleb128 0x3f
	.4byte	.LASF972
	.byte	0x5
	.uleb128 0x43
	.4byte	.LASF973
	.byte	0x5
	.uleb128 0xa8
	.4byte	.LASF974
	.byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF184:
	.ascii	"__LDBL_MIN_10_EXP__ (-307)\000"
.LASF932:
	.ascii	"_REENT_WCRTOMB_STATE(ptr) ((ptr)->_misc->_wcrtomb_s"
	.ascii	"tate)\000"
.LASF609:
	.ascii	"WINT_MIN (__WINT_MIN__)\000"
.LASF843:
	.ascii	"__builtin_is_aligned(x,align) (((__uintptr_t)x & (("
	.ascii	"align) - 1)) == 0)\000"
.LASF488:
	.ascii	"__SVID_VISIBLE 1\000"
.LASF1003:
	.ascii	"carry\000"
.LASF92:
	.ascii	"__INTMAX_C(c) c ## LL\000"
.LASF226:
	.ascii	"__FLT64_DENORM_MIN__ 4.9406564584124654e-324F64\000"
.LASF751:
	.ascii	"__CC_SUPPORTS_INLINE 1\000"
.LASF374:
	.ascii	"__GCC_ATOMIC_WCHAR_T_LOCK_FREE 2\000"
.LASF366:
	.ascii	"__CHAR_UNSIGNED__ 1\000"
.LASF992:
	.ascii	"size_t\000"
.LASF467:
	.ascii	"_NEWLIB_VERSION \"4.4.0\"\000"
.LASF228:
	.ascii	"__FLT64_HAS_INFINITY__ 1\000"
.LASF1021:
	.ascii	"start\000"
.LASF834:
	.ascii	"__requires_exclusive(...) __lock_annotate(exclusive"
	.ascii	"_locks_required(__VA_ARGS__))\000"
.LASF826:
	.ascii	"__lockable __lock_annotate(lockable)\000"
.LASF319:
	.ascii	"__LLACCUM_MIN__ (-0X1P31LLK-0X1P31LLK)\000"
.LASF339:
	.ascii	"__UHQ_FBIT__ 16\000"
.LASF311:
	.ascii	"__LACCUM_EPSILON__ 0x1P-31LK\000"
.LASF80:
	.ascii	"__PTRDIFF_MAX__ 0x7fffffff\000"
.LASF740:
	.ascii	"__GNUCLIKE___SECTION 1\000"
.LASF713:
	.ascii	"_LONG_DOUBLE long double\000"
.LASF565:
	.ascii	"INT_LEAST8_MIN (-__INT_LEAST8_MAX__ - 1)\000"
.LASF542:
	.ascii	"_UINT32_T_DECLARED \000"
.LASF305:
	.ascii	"__UACCUM_MAX__ 0XFFFFFFFFP-16UK\000"
.LASF907:
	.ascii	"_REENT_INIT_MP(var) do { struct _reent *_r = (var);"
	.ascii	" _r->_mp->_result_k = 0; _r->_mp->_result = _r->_mp"
	.ascii	"->_p5s = _NULL; _r->_mp->_freelist = _NULL; } while"
	.ascii	" (0)\000"
.LASF883:
	.ascii	"_RAND48_MULT_0 (0xe66d)\000"
.LASF336:
	.ascii	"__TQ_IBIT__ 0\000"
.LASF221:
	.ascii	"__FLT64_DECIMAL_DIG__ 17\000"
.LASF191:
	.ascii	"__LDBL_MIN__ 2.2250738585072014e-308L\000"
.LASF889:
	.ascii	"_REENT_SIGNAL_SIZE 24\000"
.LASF955:
	.ascii	"_Kmax (sizeof (size_t) << 3)\000"
.LASF14:
	.ascii	"__ATOMIC_CONSUME 1\000"
.LASF312:
	.ascii	"__ULACCUM_FBIT__ 32\000"
.LASF76:
	.ascii	"__WCHAR_MAX__ 0xffffffffU\000"
.LASF760:
	.ascii	"__CONCAT(x,y) __CONCAT1(x,y)\000"
.LASF17:
	.ascii	"__SIZEOF_INT__ 4\000"
.LASF702:
	.ascii	"__RAND_MAX\000"
.LASF739:
	.ascii	"__GNUCLIKE___TYPEOF 1\000"
.LASF510:
	.ascii	"__int20__\000"
.LASF19:
	.ascii	"__SIZEOF_LONG_LONG__ 8\000"
.LASF170:
	.ascii	"__DBL_MAX_10_EXP__ 308\000"
.LASF215:
	.ascii	"__FLT64_MANT_DIG__ 53\000"
.LASF259:
	.ascii	"__FRACT_MIN__ (-0.5R-0.5R)\000"
.LASF487:
	.ascii	"__POSIX_VISIBLE 200809\000"
.LASF295:
	.ascii	"__USACCUM_MAX__ 0XFFFFP-8UHK\000"
.LASF247:
	.ascii	"__SFRACT_FBIT__ 7\000"
.LASF95:
	.ascii	"__INTMAX_WIDTH__ 64\000"
.LASF931:
	.ascii	"_REENT_MBSRTOWCS_STATE(ptr) ((ptr)->_misc->_mbsrtow"
	.ascii	"cs_state)\000"
.LASF403:
	.ascii	"__ARM_FEATURE_BTI_DEFAULT\000"
.LASF332:
	.ascii	"__SQ_IBIT__ 0\000"
.LASF29:
	.ascii	"__ORDER_PDP_ENDIAN__ 3412\000"
.LASF35:
	.ascii	"__SIZE_TYPE__ unsigned int\000"
.LASF594:
	.ascii	"UINT_FAST32_MAX (__UINT_FAST32_MAX__)\000"
.LASF44:
	.ascii	"__INT8_TYPE__ signed char\000"
.LASF207:
	.ascii	"__FLT32_MIN__ 1.1754943508222875e-38F32\000"
.LASF294:
	.ascii	"__USACCUM_MIN__ 0.0UHK\000"
.LASF204:
	.ascii	"__FLT32_DECIMAL_DIG__ 9\000"
.LASF187:
	.ascii	"__DECIMAL_DIG__ 17\000"
.LASF183:
	.ascii	"__LDBL_MIN_EXP__ (-1021)\000"
.LASF905:
	.ascii	"_REENT_INIT_RAND48(var) do { struct _reent *_r = (v"
	.ascii	"ar); _r->_r48->_seed[0] = _RAND48_SEED_0; _r->_r48-"
	.ascii	">_seed[1] = _RAND48_SEED_1; _r->_r48->_seed[2] = _R"
	.ascii	"AND48_SEED_2; _r->_r48->_mult[0] = _RAND48_MULT_0; "
	.ascii	"_r->_r48->_mult[1] = _RAND48_MULT_1; _r->_r48->_mul"
	.ascii	"t[2] = _RAND48_MULT_2; _r->_r48->_add = _RAND48_ADD"
	.ascii	"; _r->_r48->_rand_next = 1; } while (0)\000"
.LASF181:
	.ascii	"__LDBL_MANT_DIG__ 53\000"
.LASF120:
	.ascii	"__UINT8_C(c) c\000"
.LASF45:
	.ascii	"__INT16_TYPE__ short int\000"
.LASF772:
	.ascii	"__aligned(x) __attribute__((__aligned__(x)))\000"
.LASF827:
	.ascii	"__locks_exclusive(...) __lock_annotate(exclusive_lo"
	.ascii	"ck_function(__VA_ARGS__))\000"
.LASF222:
	.ascii	"__FLT64_MAX__ 1.7976931348623157e+308F64\000"
.LASF933:
	.ascii	"_REENT_WCSRTOMBS_STATE(ptr) ((ptr)->_misc->_wcsrtom"
	.ascii	"bs_state)\000"
.LASF731:
	.ascii	"__unbounded \000"
.LASF522:
	.ascii	"__INT8 \"hh\"\000"
.LASF48:
	.ascii	"__UINT8_TYPE__ unsigned char\000"
.LASF367:
	.ascii	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 1\000"
.LASF572:
	.ascii	"INT_LEAST16_MAX (__INT_LEAST16_MAX__)\000"
.LASF845:
	.ascii	"__builtin_align_down(x,align) ((__typeof__(x))((x)&"
	.ascii	"(~((align)-1))))\000"
.LASF590:
	.ascii	"INT_FAST16_MAX (__INT_FAST16_MAX__)\000"
.LASF282:
	.ascii	"__ULLFRACT_FBIT__ 64\000"
.LASF43:
	.ascii	"__SIG_ATOMIC_TYPE__ int\000"
.LASF63:
	.ascii	"__INT_FAST64_TYPE__ long long int\000"
.LASF449:
	.ascii	"__ARM_FEATURE_COPROC 15\000"
.LASF563:
	.ascii	"INT8_MAX (__INT8_MAX__)\000"
.LASF975:
	.ascii	"BIGINT_MALLOC malloc\000"
.LASF636:
	.ascii	"__SIZE_T__ \000"
.LASF604:
	.ascii	"PTRDIFF_MAX (__PTRDIFF_MAX__)\000"
.LASF203:
	.ascii	"__FLT32_MAX_10_EXP__ 38\000"
.LASF794:
	.ascii	"__exported __attribute__((__visibility__(\"default\""
	.ascii	")))\000"
.LASF903:
	.ascii	"_REENT_CHECK_TM(var) _REENT_CHECK(var, _localtime_b"
	.ascii	"uf, struct __tm *, sizeof *((var)->_localtime_buf),"
	.ascii	" )\000"
.LASF1023:
	.ascii	"bigint_is_zero\000"
.LASF255:
	.ascii	"__USFRACT_MAX__ 0XFFP-8UHR\000"
.LASF744:
	.ascii	"__GNUCLIKE_BUILTIN_STDARG 1\000"
.LASF213:
	.ascii	"__FP_FAST_FMAF32 1\000"
.LASF141:
	.ascii	"__UINTPTR_MAX__ 0xffffffffU\000"
.LASF671:
	.ascii	"__need_wchar_t\000"
.LASF200:
	.ascii	"__FLT32_MIN_EXP__ (-125)\000"
.LASF786:
	.ascii	"__result_use_check __attribute__((__warn_unused_res"
	.ascii	"ult__))\000"
.LASF847:
	.ascii	"__align_down(x,y) __builtin_align_down(x, y)\000"
.LASF812:
	.ascii	"__RCSID_SOURCE(s) struct __hack\000"
.LASF792:
	.ascii	"__predict_false(exp) __builtin_expect((exp), 0)\000"
.LASF629:
	.ascii	"_BSD_PTRDIFF_T_ \000"
.LASF569:
	.ascii	"INT16_MAX (__INT16_MAX__)\000"
.LASF272:
	.ascii	"__ULFRACT_FBIT__ 32\000"
.LASF218:
	.ascii	"__FLT64_MIN_10_EXP__ (-307)\000"
.LASF652:
	.ascii	"__size_t \000"
.LASF730:
	.ascii	"__bounded \000"
.LASF557:
	.ascii	"__int_fast32_t_defined 1\000"
.LASF134:
	.ascii	"__INT_FAST64_WIDTH__ 64\000"
.LASF958:
	.ascii	"_STRINGS_H_ \000"
.LASF1011:
	.ascii	"borrow\000"
.LASF612:
	.ascii	"INT16_C(x) __INT16_C(x)\000"
.LASF701:
	.ascii	"_POINTER_INT long\000"
.LASF251:
	.ascii	"__SFRACT_EPSILON__ 0x1P-7HR\000"
.LASF759:
	.ascii	"__CONCAT1(x,y) x ## y\000"
.LASF640:
	.ascii	"_T_SIZE \000"
.LASF114:
	.ascii	"__INT32_C(c) c ## L\000"
.LASF341:
	.ascii	"__USQ_FBIT__ 32\000"
.LASF28:
	.ascii	"__ORDER_BIG_ENDIAN__ 4321\000"
.LASF461:
	.ascii	"STM32F401xE 1\000"
.LASF331:
	.ascii	"__SQ_FBIT__ 31\000"
.LASF562:
	.ascii	"INT8_MIN (-__INT8_MAX__ - 1)\000"
.LASF246:
	.ascii	"__FLT32X_IS_IEC_60559__ 1\000"
.LASF534:
	.ascii	"_SYS__STDINT_H \000"
.LASF937:
	.ascii	"_REENT_SIGNAL_BUF(ptr) ((ptr)->_signal_buf)\000"
.LASF584:
	.ascii	"INT_LEAST64_MAX (__INT_LEAST64_MAX__)\000"
.LASF996:
	.ascii	"limbs\000"
.LASF89:
	.ascii	"__PTRDIFF_WIDTH__ 32\000"
.LASF806:
	.ascii	"__weak_reference(sym,alias) __asm__(\".weak \" #ali"
	.ascii	"as); __asm__(\".equ \" #alias \", \" #sym)\000"
.LASF135:
	.ascii	"__UINT_FAST8_MAX__ 0xffffffffU\000"
.LASF712:
	.ascii	"_NOTHROW \000"
.LASF976:
	.ascii	"BIGINT_FREE free\000"
.LASF607:
	.ascii	"WCHAR_MAX (__WCHAR_MAX__)\000"
.LASF672:
	.ascii	"NULL\000"
.LASF308:
	.ascii	"__LACCUM_IBIT__ 32\000"
.LASF566:
	.ascii	"INT_LEAST8_MAX (__INT_LEAST8_MAX__)\000"
.LASF502:
	.ascii	"__EXP\000"
.LASF82:
	.ascii	"__SCHAR_WIDTH__ 8\000"
.LASF680:
	.ascii	"__NEWLIB_H__ 1\000"
.LASF130:
	.ascii	"__INT_FAST16_WIDTH__ 32\000"
.LASF427:
	.ascii	"__VFP_FP__ 1\000"
.LASF532:
	.ascii	"__LEAST32 \"l\"\000"
.LASF525:
	.ascii	"__INT64 \"ll\"\000"
.LASF139:
	.ascii	"__INTPTR_MAX__ 0x7fffffff\000"
.LASF703:
	.ascii	"__RAND_MAX 0x7fffffff\000"
.LASF1030:
	.ascii	"bigint_alloc\000"
.LASF136:
	.ascii	"__UINT_FAST16_MAX__ 0xffffffffU\000"
.LASF583:
	.ascii	"INT_LEAST64_MIN (-__INT_LEAST64_MAX__ - 1)\000"
.LASF1013:
	.ascii	"diff\000"
.LASF742:
	.ascii	"__GNUCLIKE_BUILTIN_CONSTANT_P 1\000"
.LASF902:
	.ascii	"_REENT_CHECK(var,what,type,size,init) do { struct _"
	.ascii	"reent *_r = (var); if (_r->what == NULL) { _r->what"
	.ascii	" = (type)malloc(size); __reent_assert(_r->what); in"
	.ascii	"it; } } while (0)\000"
.LASF818:
	.ascii	"_Nonnull \000"
.LASF402:
	.ascii	"__ARM_FEATURE_BTI\000"
.LASF471:
	.ascii	"__GNUC_PREREQ(maj,min) ((__GNUC__ << 16) + __GNUC_M"
	.ascii	"INOR__ >= ((maj) << 16) + (min))\000"
.LASF264:
	.ascii	"__UFRACT_MIN__ 0.0UR\000"
.LASF1017:
	.ascii	"started\000"
.LASF549:
	.ascii	"_INTPTR_T_DECLARED \000"
.LASF244:
	.ascii	"__FLT32X_HAS_INFINITY__ 1\000"
.LASF592:
	.ascii	"INT_FAST32_MIN (-__INT_FAST32_MAX__ - 1)\000"
.LASF638:
	.ascii	"_SYS_SIZE_T_H \000"
.LASF689:
	.ascii	"_NANO_MALLOC 1\000"
.LASF459:
	.ascii	"DEBUG 1\000"
.LASF935:
	.ascii	"_REENT_GETDATE_ERR_P(ptr) (&((ptr)->_misc->_getdate"
	.ascii	"_err))\000"
.LASF164:
	.ascii	"__FLT_IS_IEC_60559__ 1\000"
.LASF297:
	.ascii	"__ACCUM_FBIT__ 15\000"
.LASF875:
	.ascii	"__lock_release(lock) __retarget_lock_release(lock)\000"
.LASF303:
	.ascii	"__UACCUM_IBIT__ 16\000"
.LASF985:
	.ascii	"long int\000"
.LASF867:
	.ascii	"__lock_init(lock) __retarget_lock_init(&lock)\000"
.LASF133:
	.ascii	"__INT_FAST64_MAX__ 0x7fffffffffffffffLL\000"
.LASF237:
	.ascii	"__FLT32X_DECIMAL_DIG__ 17\000"
.LASF174:
	.ascii	"__DBL_MIN__ ((double)2.2250738585072014e-308L)\000"
.LASF245:
	.ascii	"__FLT32X_HAS_QUIET_NAN__ 1\000"
.LASF793:
	.ascii	"__null_sentinel __attribute__((__sentinel__))\000"
.LASF241:
	.ascii	"__FLT32X_EPSILON__ 2.2204460492503131e-16F32x\000"
.LASF499:
	.ascii	"___int_least16_t_defined 1\000"
.LASF819:
	.ascii	"_Nullable \000"
.LASF60:
	.ascii	"__INT_FAST8_TYPE__ int\000"
.LASF716:
	.ascii	"_NOINLINE __attribute__ ((__noinline__))\000"
.LASF628:
	.ascii	"_PTRDIFF_T_ \000"
.LASF635:
	.ascii	"__size_t__ \000"
.LASF94:
	.ascii	"__UINTMAX_C(c) c ## ULL\000"
.LASF32:
	.ascii	"__SIZEOF_POINTER__ 4\000"
.LASF595:
	.ascii	"INT_FAST64_MIN (-__INT_FAST64_MAX__ - 1)\000"
.LASF370:
	.ascii	"__GCC_ATOMIC_BOOL_LOCK_FREE 2\000"
.LASF497:
	.ascii	"___int64_t_defined 1\000"
.LASF437:
	.ascii	"__ARM_NEON__\000"
.LASF561:
	.ascii	"UINTPTR_MAX (__UINTPTR_MAX__)\000"
.LASF202:
	.ascii	"__FLT32_MAX_EXP__ 128\000"
.LASF1022:
	.ascii	"bigint_cmp\000"
.LASF957:
	.ascii	"_SYS__LOCALE_H \000"
.LASF440:
	.ascii	"__THUMB_INTERWORK__ 1\000"
.LASF285:
	.ascii	"__ULLFRACT_MAX__ 0XFFFFFFFFFFFFFFFFP-64ULLR\000"
.LASF34:
	.ascii	"__GNUC_WIDE_EXECUTION_CHARSET_NAME \"UTF-32LE\"\000"
.LASF545:
	.ascii	"_UINT64_T_DECLARED \000"
.LASF647:
	.ascii	"_SIZE_T_DECLARED \000"
.LASF896:
	.ascii	"_REENT_INIT_PTR_ZEROED(var) { (var)->_stdin = &__sf"
	.ascii	"[0]; (var)->_stdout = &__sf[1]; (var)->_stderr = &_"
	.ascii	"_sf[2]; }\000"
.LASF42:
	.ascii	"__CHAR32_TYPE__ long unsigned int\000"
.LASF434:
	.ascii	"__ARM_FEATURE_FP16_VECTOR_ARITHMETIC\000"
.LASF478:
	.ascii	"_POSIX_C_SOURCE 200809L\000"
.LASF180:
	.ascii	"__DBL_IS_IEC_60559__ 1\000"
.LASF137:
	.ascii	"__UINT_FAST32_MAX__ 0xffffffffU\000"
.LASF152:
	.ascii	"__FLT_MAX_EXP__ 128\000"
.LASF18:
	.ascii	"__SIZEOF_LONG__ 4\000"
.LASF758:
	.ascii	"__P(protos) protos\000"
.LASF1020:
	.ascii	"limb_idx\000"
.LASF802:
	.ascii	"__strfmonlike(fmtarg,firstvararg) __attribute__((__"
	.ascii	"format__ (__strfmon__, fmtarg, firstvararg)))\000"
.LASF1028:
	.ascii	"bigint_to_hex\000"
.LASF707:
	.ascii	"_READ_WRITE_BUFSIZE_TYPE int\000"
.LASF22:
	.ascii	"__SIZEOF_DOUBLE__ 8\000"
.LASF115:
	.ascii	"__INT_LEAST32_WIDTH__ 32\000"
.LASF858:
	.ascii	"_TIME_T_ __int_least64_t\000"
.LASF527:
	.ascii	"__FAST16 \000"
.LASF916:
	.ascii	"_REENT_RAND48_SEED(ptr) ((ptr)->_r48->_seed)\000"
.LASF485:
	.ascii	"__LARGEFILE_VISIBLE 0\000"
.LASF964:
	.ascii	"__need_wchar_t \000"
.LASF468:
	.ascii	"__NEWLIB__ 4\000"
.LASF33:
	.ascii	"__GNUC_EXECUTION_CHARSET_NAME \"UTF-8\"\000"
.LASF971:
	.ascii	"EXIT_SUCCESS 0\000"
.LASF361:
	.ascii	"__UTA_FBIT__ 64\000"
.LASF723:
	.ascii	"__ASMNAME(cname) __XSTRING (__USER_LABEL_PREFIX__) "
	.ascii	"cname\000"
.LASF154:
	.ascii	"__FLT_DECIMAL_DIG__ 9\000"
.LASF846:
	.ascii	"__align_up(x,y) __builtin_align_up(x, y)\000"
.LASF536:
	.ascii	"_UINT8_T_DECLARED \000"
.LASF981:
	.ascii	"signed char\000"
.LASF832:
	.ascii	"__asserts_exclusive(...) __lock_annotate(assert_exc"
	.ascii	"lusive_lock(__VA_ARGS__))\000"
.LASF599:
	.ascii	"INTMAX_MIN (-INTMAX_MAX - 1)\000"
.LASF436:
	.ascii	"__ARM_FEATURE_FMA 1\000"
.LASF724:
	.ascii	"__ptr_t void *\000"
.LASF365:
	.ascii	"__GNUC_STDC_INLINE__ 1\000"
.LASF606:
	.ascii	"WCHAR_MIN (__WCHAR_MIN__)\000"
.LASF257:
	.ascii	"__FRACT_FBIT__ 15\000"
.LASF162:
	.ascii	"__FLT_HAS_QUIET_NAN__ 1\000"
.LASF7:
	.ascii	"__GNUC_PATCHLEVEL__ 1\000"
.LASF373:
	.ascii	"__GCC_ATOMIC_CHAR32_T_LOCK_FREE 2\000"
.LASF776:
	.ascii	"__alloc_align(x) __attribute__((__alloc_align__(x))"
	.ascii	")\000"
.LASF121:
	.ascii	"__UINT_LEAST16_MAX__ 0xffff\000"
.LASF831:
	.ascii	"__unlocks(...) __lock_annotate(unlock_function(__VA"
	.ascii	"_ARGS__))\000"
.LASF415:
	.ascii	"__ARM_ARCH_PROFILE 77\000"
.LASF463:
	.ascii	"_STDINT_H \000"
.LASF791:
	.ascii	"__predict_true(exp) __builtin_expect((exp), 1)\000"
.LASF290:
	.ascii	"__SACCUM_MAX__ 0X7FFFP-7HK\000"
.LASF876:
	.ascii	"__lock_release_recursive(lock) __retarget_lock_rele"
	.ascii	"ase_recursive(lock)\000"
.LASF220:
	.ascii	"__FLT64_MAX_10_EXP__ 308\000"
.LASF728:
	.ascii	"__attribute_format_strfmon__(a,b) \000"
.LASF646:
	.ascii	"_BSD_SIZE_T_DEFINED_ \000"
.LASF66:
	.ascii	"__UINT_FAST32_TYPE__ unsigned int\000"
.LASF649:
	.ascii	"___int_size_t_h \000"
.LASF3:
	.ascii	"__STDC_UTF_32__ 1\000"
.LASF21:
	.ascii	"__SIZEOF_FLOAT__ 4\000"
.LASF242:
	.ascii	"__FLT32X_DENORM_MIN__ 4.9406564584124654e-324F32x\000"
.LASF749:
	.ascii	"__GNUCLIKE_MATH_BUILTIN_RELOPS \000"
.LASF153:
	.ascii	"__FLT_MAX_10_EXP__ 38\000"
.LASF720:
	.ascii	"__PMT(args) args\000"
.LASF260:
	.ascii	"__FRACT_MAX__ 0X7FFFP-15R\000"
.LASF217:
	.ascii	"__FLT64_MIN_EXP__ (-1021)\000"
.LASF131:
	.ascii	"__INT_FAST32_MAX__ 0x7fffffff\000"
.LASF10:
	.ascii	"__ATOMIC_SEQ_CST 5\000"
.LASF706:
	.ascii	"_READ_WRITE_RETURN_TYPE int\000"
.LASF648:
	.ascii	"__DEFINED_size_t \000"
.LASF853:
	.ascii	"__need_wint_t\000"
.LASF809:
	.ascii	"__sym_default(sym,impl,verid) __asm__(\".symver \" "
	.ascii	"#impl \", \" #sym \"@@\" #verid)\000"
.LASF587:
	.ascii	"INT_FAST8_MAX (__INT_FAST8_MAX__)\000"
.LASF775:
	.ascii	"__alloc_size2(n,x) __attribute__((__alloc_size__(n,"
	.ascii	" x)))\000"
.LASF1006:
	.ascii	"bigint_mod\000"
.LASF335:
	.ascii	"__TQ_FBIT__ 127\000"
.LASF72:
	.ascii	"__SHRT_MAX__ 0x7fff\000"
.LASF684:
	.ascii	"_HAVE_LONG_DOUBLE 1\000"
.LASF558:
	.ascii	"__int_fast64_t_defined 1\000"
.LASF887:
	.ascii	"_REENT_EMERGENCY_SIZE 25\000"
.LASF894:
	.ascii	"_REENT_INIT_RESERVED_8 \000"
.LASF422:
	.ascii	"__thumb2__ 1\000"
.LASF322:
	.ascii	"__ULLACCUM_FBIT__ 32\000"
.LASF890:
	.ascii	"_REENT_INIT_RESERVED_0 \000"
.LASF857:
	.ascii	"_CLOCK_T_ unsigned long\000"
.LASF815:
	.ascii	"__DECONST(type,var) ((type)(__uintptr_t)(const void"
	.ascii	" *)(var))\000"
.LASF465:
	.ascii	"_SYS_FEATURES_H \000"
.LASF782:
	.ascii	"__noinline __attribute__ ((__noinline__))\000"
.LASF959:
	.ascii	"strcmpi strcasecmp\000"
.LASF994:
	.ascii	"n_limbs\000"
.LASF23:
	.ascii	"__SIZEOF_LONG_DOUBLE__ 8\000"
.LASF385:
	.ascii	"__PRAGMA_REDEFINE_EXTNAME 1\000"
.LASF37:
	.ascii	"__WCHAR_TYPE__ unsigned int\000"
.LASF914:
	.ascii	"_REENT_SIGNGAM(ptr) ((ptr)->_gamma_signgam)\000"
.LASF507:
	.ascii	"char\000"
.LASF358:
	.ascii	"__USA_IBIT__ 16\000"
.LASF697:
	.ascii	"__DOUBLE_TYPE double\000"
.LASF368:
	.ascii	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 1\000"
.LASF618:
	.ascii	"INTMAX_C(x) __INTMAX_C(x)\000"
.LASF605:
	.ascii	"PTRDIFF_MIN (-PTRDIFF_MAX - 1)\000"
.LASF795:
	.ascii	"__hidden __attribute__((__visibility__(\"hidden\"))"
	.ascii	")\000"
.LASF978:
	.ascii	"PUTCH\000"
.LASF67:
	.ascii	"__UINT_FAST64_TYPE__ long long unsigned int\000"
.LASF852:
	.ascii	"_WINT_T \000"
.LASF157:
	.ascii	"__FLT_MIN__ 1.1754943508222875e-38F\000"
.LASF850:
	.ascii	"__need_size_t \000"
.LASF347:
	.ascii	"__HA_FBIT__ 7\000"
.LASF444:
	.ascii	"__FDPIC__\000"
.LASF214:
	.ascii	"__FLT32_IS_IEC_60559__ 1\000"
.LASF378:
	.ascii	"__GCC_ATOMIC_LLONG_LOCK_FREE 1\000"
.LASF603:
	.ascii	"SIG_ATOMIC_MAX (__STDINT_EXP(INT_MAX))\000"
.LASF995:
	.ascii	"capacity\000"
.LASF1012:
	.ascii	"needed\000"
.LASF620:
	.ascii	"_GCC_WRAP_STDINT_H \000"
.LASF891:
	.ascii	"_REENT_INIT_RESERVED_1 \000"
.LASF766:
	.ascii	"__weak_symbol __attribute__((__weak__))\000"
.LASF254:
	.ascii	"__USFRACT_MIN__ 0.0UHR\000"
.LASF770:
	.ascii	"__used __attribute__((__used__))\000"
.LASF777:
	.ascii	"__generic(expr,t,yes,no) _Generic(expr, t: yes, def"
	.ascii	"ault: no)\000"
.LASF438:
	.ascii	"__ARM_NEON\000"
.LASF741:
	.ascii	"__GNUCLIKE_CTOR_SECTION_HANDLING 1\000"
.LASF103:
	.ascii	"__UINT8_MAX__ 0xff\000"
.LASF495:
	.ascii	"___int16_t_defined 1\000"
.LASF952:
	.ascii	"_REENT _impure_ptr\000"
.LASF185:
	.ascii	"__LDBL_MAX_EXP__ 1024\000"
.LASF1033:
	.ascii	"__builtin_memcpy\000"
.LASF460:
	.ascii	"USE_HAL_DRIVER 1\000"
.LASF537:
	.ascii	"__int8_t_defined 1\000"
.LASF177:
	.ascii	"__DBL_HAS_DENORM__ 1\000"
.LASF874:
	.ascii	"__lock_try_acquire_recursive(lock) __retarget_lock_"
	.ascii	"try_acquire_recursive(lock)\000"
.LASF942:
	.ascii	"_REENT_ERRNO(_ptr) ((_ptr)->_errno)\000"
.LASF752:
	.ascii	"__CC_SUPPORTS___INLINE 1\000"
.LASF687:
	.ascii	"_MB_LEN_MAX 1\000"
.LASF598:
	.ascii	"INTMAX_MAX (__INTMAX_MAX__)\000"
.LASF575:
	.ascii	"INT32_MAX (__INT32_MAX__)\000"
.LASF1009:
	.ascii	"prod\000"
.LASF943:
	.ascii	"_REENT_INC(_ptr) ((_ptr)->_inc)\000"
.LASF351:
	.ascii	"__DA_FBIT__ 31\000"
.LASF946:
	.ascii	"_REENT_STDIN(_ptr) ((_ptr)->_stdin)\000"
.LASF70:
	.ascii	"__GXX_ABI_VERSION 1018\000"
.LASF110:
	.ascii	"__INT_LEAST16_MAX__ 0x7fff\000"
.LASF159:
	.ascii	"__FLT_DENORM_MIN__ 1.4012984643248171e-45F\000"
.LASF530:
	.ascii	"__LEAST8 \"hh\"\000"
.LASF787:
	.ascii	"__returns_twice __attribute__((__returns_twice__))\000"
.LASF835:
	.ascii	"__requires_shared(...) __lock_annotate(shared_locks"
	.ascii	"_required(__VA_ARGS__))\000"
.LASF711:
	.ascii	"_END_STD_C \000"
.LASF921:
	.ascii	"_REENT_MP_P5S(ptr) ((ptr)->_mp->_p5s)\000"
.LASF573:
	.ascii	"UINT_LEAST16_MAX (__UINT_LEAST16_MAX__)\000"
.LASF124:
	.ascii	"__UINT32_C(c) c ## UL\000"
.LASF1007:
	.ascii	"bigint_shl1\000"
.LASF304:
	.ascii	"__UACCUM_MIN__ 0.0UK\000"
.LASF927:
	.ascii	"_REENT_MBTOWC_STATE(ptr) ((ptr)->_misc->_mbtowc_sta"
	.ascii	"te)\000"
.LASF820:
	.ascii	"_Null_unspecified \000"
.LASF158:
	.ascii	"__FLT_EPSILON__ 1.1920928955078125e-7F\000"
.LASF945:
	.ascii	"_REENT_SIG_FUNC(_ptr) ((_ptr)->_sig_func)\000"
.LASF762:
	.ascii	"__XSTRING(x) __STRING(x)\000"
.LASF727:
	.ascii	"__attribute_pure__ \000"
.LASF36:
	.ascii	"__PTRDIFF_TYPE__ int\000"
.LASF424:
	.ascii	"__ARM_ARCH_ISA_THUMB\000"
.LASF552:
	.ascii	"__int_least16_t_defined 1\000"
.LASF306:
	.ascii	"__UACCUM_EPSILON__ 0x1P-16UK\000"
.LASF452:
	.ascii	"__ARM_FEATURE_MATMUL_INT8\000"
.LASF578:
	.ascii	"INT_LEAST32_MAX (__INT_LEAST32_MAX__)\000"
.LASF577:
	.ascii	"INT_LEAST32_MIN (-__INT_LEAST32_MAX__ - 1)\000"
.LASF375:
	.ascii	"__GCC_ATOMIC_SHORT_LOCK_FREE 2\000"
.LASF292:
	.ascii	"__USACCUM_FBIT__ 8\000"
.LASF379:
	.ascii	"__GCC_ATOMIC_TEST_AND_SET_TRUEVAL 1\000"
.LASF656:
	.ascii	"_WCHAR_T \000"
.LASF486:
	.ascii	"__MISC_VISIBLE 1\000"
.LASF212:
	.ascii	"__FLT32_HAS_QUIET_NAN__ 1\000"
.LASF700:
	.ascii	"__OBSOLETE_MATH __OBSOLETE_MATH_DEFAULT\000"
.LASF195:
	.ascii	"__LDBL_HAS_INFINITY__ 1\000"
.LASF353:
	.ascii	"__TA_FBIT__ 63\000"
.LASF559:
	.ascii	"INTPTR_MIN (-__INTPTR_MAX__ - 1)\000"
.LASF445:
	.ascii	"__ARM_ARCH_EXT_IDIV__ 1\000"
.LASF780:
	.ascii	"__pure __attribute__((__pure__))\000"
.LASF796:
	.ascii	"__offsetof(type,field) offsetof(type, field)\000"
.LASF338:
	.ascii	"__UQQ_IBIT__ 0\000"
.LASF908:
	.ascii	"_REENT_CHECK_MP(var) _REENT_CHECK(var, _mp, struct "
	.ascii	"_mprec *, sizeof *((var)->_mp), _REENT_INIT_MP(var)"
	.ascii	")\000"
.LASF97:
	.ascii	"__SIG_ATOMIC_MIN__ (-__SIG_ATOMIC_MAX__ - 1)\000"
.LASF119:
	.ascii	"__UINT_LEAST8_MAX__ 0xff\000"
.LASF661:
	.ascii	"_BSD_WCHAR_T_ \000"
.LASF839:
	.ascii	"__nosanitizememory \000"
.LASF838:
	.ascii	"__nosanitizeaddress \000"
.LASF163:
	.ascii	"__FP_FAST_FMAF 1\000"
.LASF602:
	.ascii	"SIG_ATOMIC_MIN (-__STDINT_EXP(INT_MAX) - 1)\000"
.LASF234:
	.ascii	"__FLT32X_MIN_10_EXP__ (-307)\000"
.LASF1038:
	.ascii	"hexval\000"
.LASF538:
	.ascii	"_INT16_T_DECLARED \000"
.LASF951:
	.ascii	"__ATTRIBUTE_IMPURE_DATA__ \000"
.LASF878:
	.ascii	"_ATEXIT_INIT {_NULL, 0, {_NULL}, _NULL}\000"
.LASF112:
	.ascii	"__INT_LEAST16_WIDTH__ 16\000"
.LASF554:
	.ascii	"__int_least64_t_defined 1\000"
.LASF146:
	.ascii	"__DEC_EVAL_METHOD__ 2\000"
.LASF977:
	.ascii	"PUTCH(ch) do { if (pos + 1 < output_size) { hex_out"
	.ascii	"put[pos++] = (ch); } } while (0)\000"
.LASF435:
	.ascii	"__ARM_FEATURE_FP16_FML\000"
.LASF930:
	.ascii	"_REENT_MBRTOWC_STATE(ptr) ((ptr)->_misc->_mbrtowc_s"
	.ascii	"tate)\000"
.LASF789:
	.ascii	"__restrict restrict\000"
.LASF256:
	.ascii	"__USFRACT_EPSILON__ 0x1P-8UHR\000"
.LASF673:
	.ascii	"NULL ((void *)0)\000"
.LASF866:
	.ascii	"__LOCK_INIT_RECURSIVE(class,lock) __LOCK_INIT(class"
	.ascii	",lock)\000"
.LASF1008:
	.ascii	"bigint_mul\000"
.LASF252:
	.ascii	"__USFRACT_FBIT__ 8\000"
.LASF320:
	.ascii	"__LLACCUM_MAX__ 0X7FFFFFFFFFFFFFFFP-31LLK\000"
.LASF674:
	.ascii	"__need_NULL\000"
.LASF364:
	.ascii	"__USER_LABEL_PREFIX__ \000"
.LASF106:
	.ascii	"__UINT64_MAX__ 0xffffffffffffffffULL\000"
.LASF925:
	.ascii	"_REENT_STRTOK_LAST(ptr) ((ptr)->_misc->_strtok_last"
	.ascii	")\000"
.LASF105:
	.ascii	"__UINT32_MAX__ 0xffffffffUL\000"
.LASF616:
	.ascii	"INT64_C(x) __INT64_C(x)\000"
.LASF479:
	.ascii	"_ATFILE_SOURCE\000"
.LASF589:
	.ascii	"INT_FAST16_MIN (-__INT_FAST16_MAX__ - 1)\000"
.LASF1:
	.ascii	"__STDC_VERSION__ 201112L\000"
.LASF830:
	.ascii	"__trylocks_shared(...) __lock_annotate(shared_trylo"
	.ascii	"ck_function(__VA_ARGS__))\000"
.LASF107:
	.ascii	"__INT_LEAST8_MAX__ 0x7f\000"
.LASF382:
	.ascii	"__GCC_ATOMIC_POINTER_LOCK_FREE 2\000"
.LASF390:
	.ascii	"__ARM_FEATURE_QBIT 1\000"
.LASF409:
	.ascii	"__ARM_FEATURE_CLZ 1\000"
.LASF462:
	.ascii	"BIGINT_H \000"
.LASF11:
	.ascii	"__ATOMIC_ACQUIRE 2\000"
.LASF399:
	.ascii	"__ARM_FEATURE_COMPLEX\000"
.LASF828:
	.ascii	"__locks_shared(...) __lock_annotate(shared_lock_fun"
	.ascii	"ction(__VA_ARGS__))\000"
.LASF856:
	.ascii	"unsigned signed\000"
.LASF520:
	.ascii	"_INTPTR_EQ_INT \000"
.LASF413:
	.ascii	"__ARM_SIZEOF_WCHAR_T 4\000"
.LASF235:
	.ascii	"__FLT32X_MAX_EXP__ 1024\000"
.LASF1004:
	.ascii	"limb\000"
.LASF123:
	.ascii	"__UINT_LEAST32_MAX__ 0xffffffffUL\000"
.LASF175:
	.ascii	"__DBL_EPSILON__ ((double)2.2204460492503131e-16L)\000"
.LASF269:
	.ascii	"__LFRACT_MIN__ (-0.5LR-0.5LR)\000"
.LASF734:
	.ascii	"__has_feature(x) 0\000"
.LASF118:
	.ascii	"__INT_LEAST64_WIDTH__ 64\000"
.LASF161:
	.ascii	"__FLT_HAS_INFINITY__ 1\000"
.LASF989:
	.ascii	"__uint64_t\000"
.LASF99:
	.ascii	"__INT8_MAX__ 0x7f\000"
.LASF865:
	.ascii	"__LOCK_INIT(class,lock) extern struct __lock __lock"
	.ascii	"_ ## lock; class _LOCK_T lock = &__lock_ ## lock\000"
.LASF384:
	.ascii	"__GCC_HAVE_DWARF2_CFI_ASM 1\000"
.LASF494:
	.ascii	"___int8_t_defined 1\000"
.LASF249:
	.ascii	"__SFRACT_MIN__ (-0.5HR-0.5HR)\000"
.LASF986:
	.ascii	"long unsigned int\000"
.LASF350:
	.ascii	"__SA_IBIT__ 16\000"
.LASF380:
	.ascii	"__GCC_DESTRUCTIVE_SIZE 64\000"
.LASF143:
	.ascii	"__GCC_IEC_559_COMPLEX 0\000"
.LASF405:
	.ascii	"__ARM_FEATURE_MVE\000"
.LASF236:
	.ascii	"__FLT32X_MAX_10_EXP__ 308\000"
.LASF430:
	.ascii	"__ARM_FP16_FORMAT_IEEE\000"
.LASF49:
	.ascii	"__UINT16_TYPE__ short unsigned int\000"
.LASF475:
	.ascii	"_POSIX_SOURCE\000"
.LASF972:
	.ascii	"RAND_MAX __RAND_MAX\000"
.LASF988:
	.ascii	"__uint32_t\000"
.LASF924:
	.ascii	"_REENT_TM(ptr) ((ptr)->_localtime_buf)\000"
.LASF543:
	.ascii	"__int32_t_defined 1\000"
.LASF854:
	.ascii	"_MACHINE__TYPES_H \000"
.LASF662:
	.ascii	"_WCHAR_T_DEFINED_ \000"
.LASF145:
	.ascii	"__FLT_EVAL_METHOD_TS_18661_3__ 0\000"
.LASF726:
	.ascii	"__attribute_malloc__ \000"
.LASF518:
	.ascii	"int +2\000"
.LASF610:
	.ascii	"INT8_C(x) __INT8_C(x)\000"
.LASF822:
	.ascii	"__NULLABILITY_PRAGMA_POP \000"
.LASF64:
	.ascii	"__UINT_FAST8_TYPE__ unsigned int\000"
.LASF318:
	.ascii	"__LLACCUM_IBIT__ 32\000"
.LASF261:
	.ascii	"__FRACT_EPSILON__ 0x1P-15R\000"
.LASF909:
	.ascii	"_REENT_CHECK_EMERGENCY(var) _REENT_CHECK(var, _emer"
	.ascii	"gency, char *, _REENT_EMERGENCY_SIZE, )\000"
.LASF101:
	.ascii	"__INT32_MAX__ 0x7fffffffL\000"
.LASF709:
	.ascii	"_USE_GDTOA \000"
.LASF778:
	.ascii	"__min_size(x) static (x)\000"
.LASF860:
	.ascii	"_TIMER_T_ unsigned long\000"
.LASF116:
	.ascii	"__INT_LEAST64_MAX__ 0x7fffffffffffffffLL\000"
.LASF419:
	.ascii	"__APCS_32__ 1\000"
.LASF454:
	.ascii	"__ARM_FEATURE_BF16_VECTOR_ARITHMETIC\000"
.LASF956:
	.ascii	"__need_NULL \000"
.LASF474:
	.ascii	"_DEFAULT_SOURCE 1\000"
.LASF198:
	.ascii	"__FLT32_MANT_DIG__ 24\000"
.LASF965:
	.ascii	"_MACHSTDLIB_H_ \000"
.LASF209:
	.ascii	"__FLT32_DENORM_MIN__ 1.4012984643248171e-45F32\000"
.LASF773:
	.ascii	"__section(x) __attribute__((__section__(x)))\000"
.LASF676:
	.ascii	"offsetof(TYPE,MEMBER) __builtin_offsetof (TYPE, MEM"
	.ascii	"BER)\000"
.LASF126:
	.ascii	"__UINT64_C(c) c ## ULL\000"
.LASF59:
	.ascii	"__UINT_LEAST64_TYPE__ long long unsigned int\000"
.LASF393:
	.ascii	"__ARM_FEATURE_AES\000"
.LASF192:
	.ascii	"__LDBL_EPSILON__ 2.2204460492503131e-16L\000"
.LASF768:
	.ascii	"__pure2 __attribute__((__const__))\000"
.LASF372:
	.ascii	"__GCC_ATOMIC_CHAR16_T_LOCK_FREE 2\000"
.LASF821:
	.ascii	"__NULLABILITY_PRAGMA_PUSH \000"
.LASF169:
	.ascii	"__DBL_MAX_EXP__ 1024\000"
.LASF529:
	.ascii	"__FAST64 \"ll\"\000"
.LASF12:
	.ascii	"__ATOMIC_RELEASE 3\000"
.LASF1037:
	.ascii	"hexdigits\000"
.LASF243:
	.ascii	"__FLT32X_HAS_DENORM__ 1\000"
.LASF148:
	.ascii	"__FLT_MANT_DIG__ 24\000"
.LASF881:
	.ascii	"_RAND48_SEED_1 (0xabcd)\000"
.LASF307:
	.ascii	"__LACCUM_FBIT__ 31\000"
.LASF600:
	.ascii	"UINTMAX_MAX (__UINTMAX_MAX__)\000"
.LASF630:
	.ascii	"___int_ptrdiff_t_h \000"
.LASF15:
	.ascii	"__OPTIMIZE__ 1\000"
.LASF938:
	.ascii	"_REENT_CLEANUP(_ptr) ((_ptr)->__cleanup)\000"
.LASF541:
	.ascii	"_INT32_T_DECLARED \000"
.LASF223:
	.ascii	"__FLT64_NORM_MAX__ 1.7976931348623157e+308F64\000"
.LASF1014:
	.ascii	"bigint_add\000"
.LASF738:
	.ascii	"__GNUCLIKE_MATH_BUILTIN_CONSTANTS \000"
.LASF528:
	.ascii	"__FAST32 \000"
.LASF16:
	.ascii	"__FINITE_MATH_ONLY__ 0\000"
.LASF625:
	.ascii	"_T_PTRDIFF_ \000"
.LASF917:
	.ascii	"_REENT_RAND48_MULT(ptr) ((ptr)->_r48->_mult)\000"
.LASF193:
	.ascii	"__LDBL_DENORM_MIN__ 4.9406564584124654e-324L\000"
.LASF102:
	.ascii	"__INT64_MAX__ 0x7fffffffffffffffLL\000"
.LASF391:
	.ascii	"__ARM_FEATURE_SAT 1\000"
.LASF540:
	.ascii	"__int16_t_defined 1\000"
.LASF283:
	.ascii	"__ULLFRACT_IBIT__ 0\000"
.LASF1026:
	.ascii	"bigint_copy\000"
.LASF844:
	.ascii	"__builtin_align_up(x,align) ((__typeof__(x))(((__ui"
	.ascii	"ntptr_t)(x)+((align)-1))&(~((align)-1))))\000"
.LASF879:
	.ascii	"_REENT_SMALL_CHECK_INIT(ptr) \000"
.LASF383:
	.ascii	"__HAVE_SPECULATION_SAFE_VALUE 1\000"
.LASF5:
	.ascii	"__GNUC__ 13\000"
.LASF763:
	.ascii	"__const const\000"
.LASF774:
	.ascii	"__alloc_size(x) __attribute__((__alloc_size__(x)))\000"
.LASF85:
	.ascii	"__LONG_WIDTH__ 32\000"
.LASF693:
	.ascii	"_WANT_USE_GDTOA 1\000"
.LASF155:
	.ascii	"__FLT_MAX__ 3.4028234663852886e+38F\000"
.LASF302:
	.ascii	"__UACCUM_FBIT__ 16\000"
.LASF807:
	.ascii	"__warn_references(sym,msg) __asm__(\".section .gnu."
	.ascii	"warning.\" #sym); __asm__(\".asciz \\\"\" msg \"\\\""
	.ascii	"\"); __asm__(\".previous\")\000"
.LASF266:
	.ascii	"__UFRACT_EPSILON__ 0x1P-16UR\000"
.LASF77:
	.ascii	"__WCHAR_MIN__ 0U\000"
.LASF523:
	.ascii	"__INT16 \"h\"\000"
.LASF1036:
	.ascii	"/Users/adityachalasani/Desktop/groth14/groth14/Debu"
	.ascii	"g\000"
.LASF466:
	.ascii	"_NEWLIB_VERSION_H__ 1\000"
.LASF377:
	.ascii	"__GCC_ATOMIC_LONG_LOCK_FREE 2\000"
.LASF314:
	.ascii	"__ULACCUM_MIN__ 0.0ULK\000"
.LASF653:
	.ascii	"__need_size_t\000"
.LASF189:
	.ascii	"__LDBL_MAX__ 1.7976931348623157e+308L\000"
.LASF418:
	.ascii	"__ARM_ARCH 7\000"
.LASF642:
	.ascii	"_SIZE_T_ \000"
.LASF147:
	.ascii	"__FLT_RADIX__ 2\000"
.LASF987:
	.ascii	"long long int\000"
.LASF948:
	.ascii	"_REENT_STDERR(_ptr) ((_ptr)->_stderr)\000"
.LASF960:
	.ascii	"stricmp strcasecmp\000"
.LASF406:
	.ascii	"__ARM_FEATURE_CMSE\000"
.LASF576:
	.ascii	"UINT32_MAX (__UINT32_MAX__)\000"
.LASF654:
	.ascii	"__wchar_t__ \000"
.LASF196:
	.ascii	"__LDBL_HAS_QUIET_NAN__ 1\000"
.LASF86:
	.ascii	"__LONG_LONG_WIDTH__ 64\000"
.LASF962:
	.ascii	"strnicmp strncasecmp\000"
.LASF624:
	.ascii	"_PTRDIFF_T \000"
.LASF608:
	.ascii	"WINT_MAX (__WINT_MAX__)\000"
.LASF138:
	.ascii	"__UINT_FAST64_MAX__ 0xffffffffffffffffULL\000"
.LASF428:
	.ascii	"__ARM_FP\000"
.LASF348:
	.ascii	"__HA_IBIT__ 8\000"
.LASF140:
	.ascii	"__INTPTR_WIDTH__ 32\000"
.LASF0:
	.ascii	"__STDC__ 1\000"
.LASF898:
	.ascii	"assert(__e) ((__e) ? (void)0 : __assert_func (__FIL"
	.ascii	"E__, __LINE__, __ASSERT_FUNC, #__e))\000"
.LASF923:
	.ascii	"_REENT_ASCTIME_BUF(ptr) ((ptr)->_asctime_buf)\000"
.LASF944:
	.ascii	"_REENT_LOCALE(_ptr) ((_ptr)->_locale)\000"
.LASF240:
	.ascii	"__FLT32X_MIN__ 2.2250738585072014e-308F32x\000"
.LASF1002:
	.ascii	"bigint_shr1\000"
.LASF219:
	.ascii	"__FLT64_MAX_EXP__ 1024\000"
.LASF659:
	.ascii	"__WCHAR_T \000"
.LASF694:
	.ascii	"__SYS_CONFIG_H__ \000"
.LASF973:
	.ascii	"MB_CUR_MAX __locale_mb_cur_max()\000"
.LASF224:
	.ascii	"__FLT64_MIN__ 2.2250738585072014e-308F64\000"
.LASF746:
	.ascii	"__GNUC_VA_LIST_COMPATIBILITY 1\000"
.LASF496:
	.ascii	"___int32_t_defined 1\000"
.LASF910:
	.ascii	"__REENT_INIT_MISC_GETLOCALENAME_L \000"
.LASF682:
	.ascii	"_HAVE_CC_INHIBIT_LOOP_TO_LIBCALL 1\000"
.LASF150:
	.ascii	"__FLT_MIN_EXP__ (-125)\000"
.LASF414:
	.ascii	"__ARM_ARCH_PROFILE\000"
.LASF47:
	.ascii	"__INT64_TYPE__ long long int\000"
.LASF936:
	.ascii	"_REENT_GETLOCALENAME_L_BUF(ptr) ((ptr)->_misc->_get"
	.ascii	"localename_l_buf)\000"
.LASF267:
	.ascii	"__LFRACT_FBIT__ 31\000"
.LASF570:
	.ascii	"UINT16_MAX (__UINT16_MAX__)\000"
.LASF386:
	.ascii	"__SIZEOF_WCHAR_T__ 4\000"
.LASF897:
	.ascii	"assert\000"
.LASF482:
	.ascii	"__BSD_VISIBLE 1\000"
.LASF571:
	.ascii	"INT_LEAST16_MIN (-__INT_LEAST16_MAX__ - 1)\000"
.LASF769:
	.ascii	"__unused __attribute__((__unused__))\000"
.LASF784:
	.ascii	"__nonnull_all __attribute__((__nonnull__))\000"
.LASF899:
	.ascii	"__ASSERT_FUNC __func__\000"
.LASF265:
	.ascii	"__UFRACT_MAX__ 0XFFFFP-16UR\000"
.LASF501:
	.ascii	"___int_least64_t_defined 1\000"
.LASF692:
	.ascii	"_WANT_REENT_SMALL 1\000"
.LASF722:
	.ascii	"__THROW \000"
.LASF401:
	.ascii	"__ARM_FEATURE_PAUTH\000"
.LASF355:
	.ascii	"__UHA_FBIT__ 8\000"
.LASF911:
	.ascii	"_REENT_INIT_MISC(var) do { struct _reent *_r = (var"
	.ascii	"); _r->_misc->_strtok_last = _NULL; _r->_misc->_mbl"
	.ascii	"en_state.__count = 0; _r->_misc->_mblen_state.__val"
	.ascii	"ue.__wch = 0; _r->_misc->_wctomb_state.__count = 0;"
	.ascii	" _r->_misc->_wctomb_state.__value.__wch = 0; _r->_m"
	.ascii	"isc->_mbtowc_state.__count = 0; _r->_misc->_mbtowc_"
	.ascii	"state.__value.__wch = 0; _r->_misc->_mbrlen_state._"
	.ascii	"_count = 0; _r->_misc->_mbrlen_state.__value.__wch "
	.ascii	"= 0; _r->_misc->_mbrtowc_state.__count = 0; _r->_mi"
	.ascii	"sc->_mbrtowc_state.__value.__wch = 0; _r->_misc->_m"
	.ascii	"bsrtowcs_state.__count = 0; _r->_misc->_mbsrtowcs_s"
	.ascii	"tate.__value.__wch = 0; _r->_misc->_wcrtomb_state._"
	.ascii	"_count = 0; _r->_misc->_wcrtomb_state.__value.__wch"
	.ascii	" = 0; _r->_misc->_wcsrtombs_state.__count = 0; _r->"
	.ascii	"_misc->_wcsrtombs_state.__value.__wch = 0; __REENT_"
	.ascii	"INIT_MISC_GETLOCALENAME_L; _r->_misc->_l64a_buf[0] "
	.ascii	"= '\\0'; _r->_misc->_getdate_err = 0; } while (0)\000"
.LASF113:
	.ascii	"__INT_LEAST32_MAX__ 0x7fffffffL\000"
.LASF248:
	.ascii	"__SFRACT_IBIT__ 0\000"
.LASF480:
	.ascii	"_ATFILE_SOURCE 1\000"
.LASF504:
	.ascii	"__STDINT_EXP(x) __ ##x ##__\000"
.LASF491:
	.ascii	"__EXP(x) __ ##x ##__\000"
.LASF30:
	.ascii	"__BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__\000"
.LASF208:
	.ascii	"__FLT32_EPSILON__ 1.1920928955078125e-7F32\000"
.LASF439:
	.ascii	"__ARM_NEON_FP\000"
.LASF516:
	.ascii	"__int20 +2\000"
.LASF679:
	.ascii	"_ANSIDECL_H_ \000"
.LASF623:
	.ascii	"_ANSI_STDDEF_H \000"
.LASF262:
	.ascii	"__UFRACT_FBIT__ 16\000"
.LASF343:
	.ascii	"__UDQ_FBIT__ 64\000"
.LASF173:
	.ascii	"__DBL_NORM_MAX__ ((double)1.7976931348623157e+308L)"
	.ascii	"\000"
.LASF556:
	.ascii	"__int_fast16_t_defined 1\000"
.LASF918:
	.ascii	"_REENT_RAND48_ADD(ptr) ((ptr)->_r48->_add)\000"
.LASF698:
	.ascii	"__FLOAT_TYPE float\000"
.LASF404:
	.ascii	"__ARM_FEATURE_PAC_DEFAULT\000"
.LASF929:
	.ascii	"_REENT_MBRLEN_STATE(ptr) ((ptr)->_misc->_mbrlen_sta"
	.ascii	"te)\000"
.LASF176:
	.ascii	"__DBL_DENORM_MIN__ ((double)4.9406564584124654e-324"
	.ascii	"L)\000"
.LASF954:
	.ascii	"_GLOBAL_REENT (&_impure_data)\000"
.LASF581:
	.ascii	"INT64_MAX (__INT64_MAX__)\000"
.LASF980:
	.ascii	"unsigned int\000"
.LASF644:
	.ascii	"_SIZE_T_DEFINED_ \000"
.LASF1029:
	.ascii	"bigint_free\000"
.LASF469:
	.ascii	"__NEWLIB_MINOR__ 4\000"
.LASF229:
	.ascii	"__FLT64_HAS_QUIET_NAN__ 1\000"
.LASF615:
	.ascii	"UINT32_C(x) __UINT32_C(x)\000"
.LASF325:
	.ascii	"__ULLACCUM_MAX__ 0XFFFFFFFFFFFFFFFFP-32ULLK\000"
.LASF293:
	.ascii	"__USACCUM_IBIT__ 8\000"
.LASF586:
	.ascii	"INT_FAST8_MIN (-__INT_FAST8_MAX__ - 1)\000"
.LASF359:
	.ascii	"__UDA_FBIT__ 32\000"
.LASF227:
	.ascii	"__FLT64_HAS_DENORM__ 1\000"
.LASF149:
	.ascii	"__FLT_DIG__ 6\000"
.LASF40:
	.ascii	"__UINTMAX_TYPE__ long long unsigned int\000"
.LASF668:
	.ascii	"_WCHAR_T_DECLARED \000"
.LASF718:
	.ascii	"_SYS_REENT_H_ \000"
.LASF144:
	.ascii	"__FLT_EVAL_METHOD__ 0\000"
.LASF71:
	.ascii	"__SCHAR_MAX__ 0x7f\000"
.LASF128:
	.ascii	"__INT_FAST8_WIDTH__ 32\000"
.LASF2:
	.ascii	"__STDC_UTF_16__ 1\000"
.LASF885:
	.ascii	"_RAND48_MULT_2 (0x0005)\000"
.LASF407:
	.ascii	"__ARM_FEATURE_LDREX\000"
.LASF912:
	.ascii	"_REENT_CHECK_MISC(var) _REENT_CHECK(var, _misc, str"
	.ascii	"uct _misc_reent *, sizeof *((var)->_misc), _REENT_I"
	.ascii	"NIT_MISC(var))\000"
.LASF626:
	.ascii	"_T_PTRDIFF \000"
.LASF337:
	.ascii	"__UQQ_FBIT__ 8\000"
.LASF38:
	.ascii	"__WINT_TYPE__ unsigned int\000"
.LASF432:
	.ascii	"__ARM_FP16_ARGS\000"
.LASF142:
	.ascii	"__GCC_IEC_559 0\000"
.LASF928:
	.ascii	"_REENT_WCTOMB_STATE(ptr) ((ptr)->_misc->_wctomb_sta"
	.ascii	"te)\000"
.LASF836:
	.ascii	"__requires_unlocked(...) __lock_annotate(locks_excl"
	.ascii	"uded(__VA_ARGS__))\000"
.LASF967:
	.ascii	"alloca\000"
.LASF270:
	.ascii	"__LFRACT_MAX__ 0X7FFFFFFFP-31LR\000"
.LASF388:
	.ascii	"__SIZEOF_PTRDIFF_T__ 4\000"
.LASF655:
	.ascii	"__WCHAR_T__ \000"
.LASF498:
	.ascii	"___int_least8_t_defined 1\000"
.LASF446:
	.ascii	"__ARM_FEATURE_IDIV 1\000"
.LASF31:
	.ascii	"__FLOAT_WORD_ORDER__ __ORDER_LITTLE_ENDIAN__\000"
.LASF667:
	.ascii	"_GCC_WCHAR_T \000"
.LASF555:
	.ascii	"__int_fast8_t_defined 1\000"
.LASF704:
	.ascii	"__EXPORT \000"
.LASF56:
	.ascii	"__UINT_LEAST8_TYPE__ unsigned char\000"
.LASF699:
	.ascii	"__OBSOLETE_MATH_DEFAULT 1\000"
.LASF813:
	.ascii	"__SCCSID(s) struct __hack\000"
.LASF83:
	.ascii	"__SHRT_WIDTH__ 16\000"
.LASF803:
	.ascii	"__strftimelike(fmtarg,firstvararg) __attribute__((_"
	.ascii	"_format__ (__strftime__, fmtarg, firstvararg)))\000"
.LASF560:
	.ascii	"INTPTR_MAX (__INTPTR_MAX__)\000"
.LASF705:
	.ascii	"__IMPORT \000"
.LASF882:
	.ascii	"_RAND48_SEED_2 (0x1234)\000"
.LASF632:
	.ascii	"_PTRDIFF_T_DECLARED \000"
.LASF357:
	.ascii	"__USA_FBIT__ 16\000"
.LASF765:
	.ascii	"__volatile volatile\000"
.LASF848:
	.ascii	"__is_aligned(x,y) __builtin_is_aligned(x, y)\000"
.LASF62:
	.ascii	"__INT_FAST32_TYPE__ int\000"
.LASF870:
	.ascii	"__lock_close_recursive(lock) __retarget_lock_close_"
	.ascii	"recursive(lock)\000"
.LASF233:
	.ascii	"__FLT32X_MIN_EXP__ (-1021)\000"
.LASF757:
	.ascii	"__CC_SUPPORTS_DYNAMIC_ARRAY_INIT 1\000"
.LASF941:
	.ascii	"_REENT_EMERGENCY(_ptr) ((_ptr)->_emergency)\000"
.LASF481:
	.ascii	"__ATFILE_VISIBLE 1\000"
.LASF271:
	.ascii	"__LFRACT_EPSILON__ 0x1P-31LR\000"
.LASF710:
	.ascii	"_BEGIN_STD_C \000"
.LASF779:
	.ascii	"__malloc_like __attribute__((__malloc__))\000"
.LASF412:
	.ascii	"__ARM_SIZEOF_MINIMAL_ENUM 1\000"
.LASF982:
	.ascii	"unsigned char\000"
.LASF239:
	.ascii	"__FLT32X_NORM_MAX__ 1.7976931348623157e+308F32x\000"
.LASF416:
	.ascii	"__arm__ 1\000"
.LASF201:
	.ascii	"__FLT32_MIN_10_EXP__ (-37)\000"
.LASF25:
	.ascii	"__CHAR_BIT__ 8\000"
.LASF484:
	.ascii	"__ISO_C_VISIBLE 2011\000"
.LASF568:
	.ascii	"INT16_MIN (-__INT16_MAX__ - 1)\000"
.LASF997:
	.ascii	"bigint\000"
.LASF431:
	.ascii	"__ARM_FP16_FORMAT_ALTERNATIVE\000"
.LASF810:
	.ascii	"__FBSDID(s) struct __hack\000"
.LASF190:
	.ascii	"__LDBL_NORM_MAX__ 1.7976931348623157e+308L\000"
.LASF464:
	.ascii	"_MACHINE__DEFAULT_TYPES_H \000"
.LASF26:
	.ascii	"__BIGGEST_ALIGNMENT__ 8\000"
.LASF631:
	.ascii	"_GCC_PTRDIFF_T \000"
.LASF748:
	.ascii	"__GNUCLIKE_BUILTIN_NEXT_ARG 1\000"
.LASF354:
	.ascii	"__TA_IBIT__ 64\000"
.LASF533:
	.ascii	"__LEAST64 \"ll\"\000"
.LASF901:
	.ascii	"__reent_assert(x) ((x) ? (void)0 : __assert_func(__"
	.ascii	"FILE__, __LINE__, (char *)0, \"REENT malloc succeed"
	.ascii	"ed\"))\000"
.LASF637:
	.ascii	"_SIZE_T \000"
.LASF664:
	.ascii	"_WCHAR_T_H \000"
.LASF396:
	.ascii	"__ARM_FEATURE_QRDMX\000"
.LASF764:
	.ascii	"__signed signed\000"
.LASF425:
	.ascii	"__ARM_ARCH_ISA_THUMB 2\000"
.LASF75:
	.ascii	"__LONG_LONG_MAX__ 0x7fffffffffffffffLL\000"
.LASF993:
	.ascii	"long double\000"
.LASF511:
	.ascii	"long\000"
.LASF761:
	.ascii	"__STRING(x) #x\000"
.LASF508:
	.ascii	"short\000"
.LASF949:
	.ascii	"_REENT_INIT_PTR(var) { memset((var), 0, sizeof(*(va"
	.ascii	"r))); _REENT_INIT_PTR_ZEROED(var); }\000"
.LASF1010:
	.ascii	"bigint_sub\000"
.LASF743:
	.ascii	"__GNUCLIKE_BUILTIN_VARARGS 1\000"
.LASF263:
	.ascii	"__UFRACT_IBIT__ 0\000"
.LASF400:
	.ascii	"__ARM_32BIT_STATE 1\000"
.LASF108:
	.ascii	"__INT8_C(c) c\000"
.LASF268:
	.ascii	"__LFRACT_IBIT__ 0\000"
.LASF622:
	.ascii	"_STDDEF_H_ \000"
.LASF167:
	.ascii	"__DBL_MIN_EXP__ (-1021)\000"
.LASF641:
	.ascii	"__SIZE_T \000"
.LASF804:
	.ascii	"__printf0like(fmtarg,firstvararg) \000"
.LASF895:
	.ascii	"_REENT_INIT(var) { 0, &__sf[0], &__sf[1], &__sf[2],"
	.ascii	" 0, _NULL, _REENT_INIT_RESERVED_0 _REENT_INIT_RESER"
	.ascii	"VED_1 _NULL, _NULL, _NULL, 0, 0, _NULL, _NULL, _NUL"
	.ascii	"L, _NULL, _NULL, _REENT_INIT_RESERVED_6_7 _REENT_IN"
	.ascii	"IT_RESERVED_8 _NULL, _NULL, _NULL }\000"
.LASF199:
	.ascii	"__FLT32_DIG__ 6\000"
.LASF767:
	.ascii	"__dead2 __attribute__((__noreturn__))\000"
.LASF920:
	.ascii	"_REENT_MP_RESULT_K(ptr) ((ptr)->_mp->_result_k)\000"
.LASF969:
	.ascii	"__compar_fn_t_defined \000"
.LASF619:
	.ascii	"UINTMAX_C(x) __UINTMAX_C(x)\000"
.LASF597:
	.ascii	"UINT_FAST64_MAX (__UINT_FAST64_MAX__)\000"
.LASF512:
	.ascii	"signed +0\000"
.LASF194:
	.ascii	"__LDBL_HAS_DENORM__ 1\000"
.LASF287:
	.ascii	"__SACCUM_FBIT__ 7\000"
.LASF735:
	.ascii	"__BEGIN_DECLS \000"
.LASF299:
	.ascii	"__ACCUM_MIN__ (-0X1P15K-0X1P15K)\000"
.LASF392:
	.ascii	"__ARM_FEATURE_CRYPTO\000"
.LASF54:
	.ascii	"__INT_LEAST32_TYPE__ long int\000"
.LASF125:
	.ascii	"__UINT_LEAST64_MAX__ 0xffffffffffffffffULL\000"
.LASF258:
	.ascii	"__FRACT_IBIT__ 0\000"
.LASF230:
	.ascii	"__FLT64_IS_IEC_60559__ 1\000"
.LASF84:
	.ascii	"__INT_WIDTH__ 32\000"
.LASF470:
	.ascii	"__NEWLIB_PATCHLEVEL__ 0\000"
.LASF871:
	.ascii	"__lock_acquire(lock) __retarget_lock_acquire(lock)\000"
.LASF27:
	.ascii	"__ORDER_LITTLE_ENDIAN__ 1234\000"
.LASF855:
	.ascii	"__size_t\000"
.LASF156:
	.ascii	"__FLT_NORM_MAX__ 3.4028234663852886e+38F\000"
.LASF721:
	.ascii	"__DOTS , ...\000"
.LASF979:
	.ascii	"long long unsigned int\000"
.LASF585:
	.ascii	"UINT_LEAST64_MAX (__UINT_LEAST64_MAX__)\000"
.LASF151:
	.ascii	"__FLT_MIN_10_EXP__ (-37)\000"
.LASF313:
	.ascii	"__ULACCUM_IBIT__ 32\000"
.LASF197:
	.ascii	"__LDBL_IS_IEC_60559__ 1\000"
.LASF588:
	.ascii	"UINT_FAST8_MAX (__UINT_FAST8_MAX__)\000"
.LASF326:
	.ascii	"__ULLACCUM_EPSILON__ 0x1P-32ULLK\000"
.LASF645:
	.ascii	"_SIZE_T_DEFINED \000"
.LASF333:
	.ascii	"__DQ_FBIT__ 63\000"
.LASF483:
	.ascii	"__GNU_VISIBLE 0\000"
.LASF288:
	.ascii	"__SACCUM_IBIT__ 8\000"
.LASF627:
	.ascii	"__PTRDIFF_T \000"
.LASF340:
	.ascii	"__UHQ_IBIT__ 0\000"
.LASF369:
	.ascii	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 1\000"
.LASF61:
	.ascii	"__INT_FAST16_TYPE__ int\000"
.LASF548:
	.ascii	"_UINTMAX_T_DECLARED \000"
.LASF289:
	.ascii	"__SACCUM_MIN__ (-0X1P7HK-0X1P7HK)\000"
.LASF1034:
	.ascii	"GNU C11 13.3.1 20240614 -mcpu=cortex-m4 -mfpu=fpv4-"
	.ascii	"sp-d16 -mfloat-abi=hard -mthumb -march=armv7e-m+fp "
	.ascii	"-g3 -O2 -std=gnu11 -ffunction-sections -fdata-secti"
	.ascii	"ons -fstack-usage -fcyclomatic-complexity\000"
.LASF57:
	.ascii	"__UINT_LEAST16_TYPE__ short unsigned int\000"
.LASF547:
	.ascii	"_INTMAX_T_DECLARED \000"
.LASF310:
	.ascii	"__LACCUM_MAX__ 0X7FFFFFFFFFFFFFFFP-31LK\000"
.LASF41:
	.ascii	"__CHAR16_TYPE__ short unsigned int\000"
.LASF232:
	.ascii	"__FLT32X_DIG__ 15\000"
.LASF8:
	.ascii	"__VERSION__ \"13.3.1 20240614\"\000"
.LASF345:
	.ascii	"__UTQ_FBIT__ 128\000"
.LASF940:
	.ascii	"_REENT_CVTLEN(_ptr) ((_ptr)->_cvtlen)\000"
.LASF321:
	.ascii	"__LLACCUM_EPSILON__ 0x1P-31LLK\000"
.LASF323:
	.ascii	"__ULLACCUM_IBIT__ 32\000"
.LASF913:
	.ascii	"_REENT_CHECK_SIGNAL_BUF(var) _REENT_CHECK(var, _sig"
	.ascii	"nal_buf, char *, _REENT_SIGNAL_SIZE, )\000"
.LASF129:
	.ascii	"__INT_FAST16_MAX__ 0x7fffffff\000"
.LASF492:
	.ascii	"__have_longlong64 1\000"
.LASF20:
	.ascii	"__SIZEOF_SHORT__ 2\000"
.LASF873:
	.ascii	"__lock_try_acquire(lock) __retarget_lock_try_acquir"
	.ascii	"e(lock)\000"
.LASF550:
	.ascii	"_UINTPTR_T_DECLARED \000"
.LASF663:
	.ascii	"_WCHAR_T_DEFINED \000"
.LASF315:
	.ascii	"__ULACCUM_MAX__ 0XFFFFFFFFFFFFFFFFP-32ULK\000"
.LASF829:
	.ascii	"__trylocks_exclusive(...) __lock_annotate(exclusive"
	.ascii	"_trylock_function(__VA_ARGS__))\000"
.LASF915:
	.ascii	"_REENT_RAND_NEXT(ptr) ((ptr)->_r48->_rand_next)\000"
.LASF695:
	.ascii	"__IEEE_LITTLE_ENDIAN \000"
.LASF274:
	.ascii	"__ULFRACT_MIN__ 0.0ULR\000"
.LASF601:
	.ascii	"SIZE_MAX (__SIZE_MAX__)\000"
.LASF756:
	.ascii	"__CC_SUPPORTS_VARADIC_XXX 1\000"
.LASF334:
	.ascii	"__DQ_IBIT__ 0\000"
.LASF455:
	.ascii	"__ARM_BF16_FORMAT_ALTERNATIVE\000"
.LASF46:
	.ascii	"__INT32_TYPE__ long int\000"
.LASF781:
	.ascii	"__always_inline __inline__ __attribute__((__always_"
	.ascii	"inline__))\000"
.LASF823:
	.ascii	"__arg_type_tag(arg_kind,arg_idx,type_tag_idx) \000"
.LASF877:
	.ascii	"_ATEXIT_SIZE 32\000"
.LASF798:
	.ascii	"__containerof(x,s,m) ({ const volatile __typeof(((s"
	.ascii	" *)0)->m) *__x = (x); __DEQUALIFY(s *, (const volat"
	.ascii	"ile char *)__x - __offsetof(s, m));})\000"
.LASF643:
	.ascii	"_BSD_SIZE_T_ \000"
.LASF733:
	.ascii	"__has_extension __has_feature\000"
.LASF517:
	.ascii	"__int20__ +2\000"
.LASF837:
	.ascii	"__no_lock_analysis __lock_annotate(no_thread_safety"
	.ascii	"_analysis)\000"
.LASF660:
	.ascii	"_WCHAR_T_ \000"
.LASF1000:
	.ascii	"memset\000"
.LASF904:
	.ascii	"_REENT_CHECK_ASCTIME_BUF(var) _REENT_CHECK(var, _as"
	.ascii	"ctime_buf, char *, _REENT_ASCTIME_SIZE, memset((var"
	.ascii	")->_asctime_buf, 0, _REENT_ASCTIME_SIZE))\000"
.LASF658:
	.ascii	"_T_WCHAR \000"
.LASF681:
	.ascii	"_ATEXIT_DYNAMIC_ALLOC 1\000"
.LASF922:
	.ascii	"_REENT_MP_FREELIST(ptr) ((ptr)->_mp->_freelist)\000"
.LASF968:
	.ascii	"alloca(size) __builtin_alloca(size)\000"
.LASF859:
	.ascii	"_CLOCKID_T_ unsigned long\000"
.LASF346:
	.ascii	"__UTQ_IBIT__ 0\000"
.LASF349:
	.ascii	"__SA_FBIT__ 15\000"
.LASF666:
	.ascii	"__INT_WCHAR_T_H \000"
.LASF238:
	.ascii	"__FLT32X_MAX__ 1.7976931348623157e+308F32x\000"
.LASF443:
	.ascii	"__ARM_EABI__ 1\000"
.LASF683:
	.ascii	"_HAVE_INITFINI_ARRAY 1\000"
.LASF457:
	.ascii	"__ELF__ 1\000"
.LASF574:
	.ascii	"INT32_MIN (-__INT32_MAX__ - 1)\000"
.LASF423:
	.ascii	"__THUMBEL__ 1\000"
.LASF389:
	.ascii	"__ARM_FEATURE_DSP 1\000"
.LASF1035:
	.ascii	"../Core/Src/bigint.c\000"
.LASF328:
	.ascii	"__QQ_IBIT__ 0\000"
.LASF1001:
	.ascii	"malloc\000"
.LASF900:
	.ascii	"static_assert _Static_assert\000"
.LASF617:
	.ascii	"UINT64_C(x) __UINT64_C(x)\000"
.LASF317:
	.ascii	"__LLACCUM_FBIT__ 31\000"
.LASF1032:
	.ascii	"__builtin_memset\000"
.LASF1025:
	.ascii	"bigint_trim\000"
.LASF567:
	.ascii	"UINT_LEAST8_MAX (__UINT_LEAST8_MAX__)\000"
.LASF342:
	.ascii	"__USQ_IBIT__ 0\000"
.LASF6:
	.ascii	"__GNUC_MINOR__ 3\000"
.LASF1027:
	.ascii	"bigint_set_zero\000"
.LASF58:
	.ascii	"__UINT_LEAST32_TYPE__ long unsigned int\000"
.LASF410:
	.ascii	"__ARM_FEATURE_NUMERIC_MAXMIN\000"
.LASF884:
	.ascii	"_RAND48_MULT_1 (0xdeec)\000"
.LASF39:
	.ascii	"__INTMAX_TYPE__ long long int\000"
.LASF376:
	.ascii	"__GCC_ATOMIC_INT_LOCK_FREE 2\000"
.LASF880:
	.ascii	"_RAND48_SEED_0 (0x330e)\000"
.LASF535:
	.ascii	"_INT8_T_DECLARED \000"
.LASF441:
	.ascii	"__ARM_ARCH_7EM__ 1\000"
.LASF500:
	.ascii	"___int_least32_t_defined 1\000"
.LASF651:
	.ascii	"_SIZET_ \000"
.LASF296:
	.ascii	"__USACCUM_EPSILON__ 0x1P-8UHK\000"
.LASF179:
	.ascii	"__DBL_HAS_QUIET_NAN__ 1\000"
.LASF614:
	.ascii	"INT32_C(x) __INT32_C(x)\000"
.LASF591:
	.ascii	"UINT_FAST16_MAX (__UINT_FAST16_MAX__)\000"
.LASF717:
	.ascii	"_NOINLINE_STATIC _NOINLINE static\000"
.LASF280:
	.ascii	"__LLFRACT_MAX__ 0X7FFFFFFFFFFFFFFFP-63LLR\000"
.LASF395:
	.ascii	"__ARM_FEATURE_UNALIGNED 1\000"
.LASF579:
	.ascii	"UINT_LEAST32_MAX (__UINT_LEAST32_MAX__)\000"
.LASF814:
	.ascii	"__COPYRIGHT(s) struct __hack\000"
.LASF514:
	.ascii	"char +0\000"
.LASF68:
	.ascii	"__INTPTR_TYPE__ int\000"
.LASF69:
	.ascii	"__UINTPTR_TYPE__ unsigned int\000"
.LASF276:
	.ascii	"__ULFRACT_EPSILON__ 0x1P-32ULR\000"
.LASF363:
	.ascii	"__REGISTER_PREFIX__ \000"
.LASF205:
	.ascii	"__FLT32_MAX__ 3.4028234663852886e+38F32\000"
.LASF166:
	.ascii	"__DBL_DIG__ 15\000"
.LASF539:
	.ascii	"_UINT16_T_DECLARED \000"
.LASF811:
	.ascii	"__RCSID(s) struct __hack\000"
.LASF1015:
	.ascii	"hex_output\000"
.LASF934:
	.ascii	"_REENT_L64A_BUF(ptr) ((ptr)->_misc->_l64a_buf)\000"
.LASF24:
	.ascii	"__SIZEOF_SIZE_T__ 4\000"
.LASF926:
	.ascii	"_REENT_MBLEN_STATE(ptr) ((ptr)->_misc->_mblen_state"
	.ascii	")\000"
.LASF51:
	.ascii	"__UINT64_TYPE__ long long unsigned int\000"
.LASF553:
	.ascii	"__int_least32_t_defined 1\000"
.LASF117:
	.ascii	"__INT64_C(c) c ## LL\000"
.LASF1018:
	.ascii	"bigint_from_hex\000"
.LASF893:
	.ascii	"_REENT_INIT_RESERVED_6_7 \000"
.LASF736:
	.ascii	"__END_DECLS \000"
.LASF74:
	.ascii	"__LONG_MAX__ 0x7fffffffL\000"
.LASF450:
	.ascii	"__ARM_FEATURE_CDE\000"
.LASF298:
	.ascii	"__ACCUM_IBIT__ 16\000"
.LASF506:
	.ascii	"unsigned\000"
.LASF91:
	.ascii	"__INTMAX_MAX__ 0x7fffffffffffffffLL\000"
.LASF678:
	.ascii	"_STRING_H_ \000"
.LASF983:
	.ascii	"short int\000"
.LASF621:
	.ascii	"_STDDEF_H \000"
.LASF842:
	.ascii	"__pt_guarded_by(x) __lock_annotate(pt_guarded_by(x)"
	.ascii	")\000"
.LASF841:
	.ascii	"__guarded_by(x) __lock_annotate(guarded_by(x))\000"
.LASF122:
	.ascii	"__UINT16_C(c) c\000"
.LASF433:
	.ascii	"__ARM_FEATURE_FP16_SCALAR_ARITHMETIC\000"
.LASF808:
	.ascii	"__sym_compat(sym,impl,verid) __asm__(\".symver \" #"
	.ascii	"impl \", \" #sym \"@\" #verid)\000"
.LASF991:
	.ascii	"uint64_t\000"
.LASF360:
	.ascii	"__UDA_IBIT__ 32\000"
.LASF531:
	.ascii	"__LEAST16 \"h\"\000"
.LASF799:
	.ascii	"__printflike(fmtarg,firstvararg) __attribute__((__f"
	.ascii	"ormat__ (__printf__, fmtarg, firstvararg)))\000"
.LASF785:
	.ascii	"__fastcall __attribute__((__fastcall__))\000"
.LASF580:
	.ascii	"INT64_MIN (-__INT64_MAX__ - 1)\000"
.LASF825:
	.ascii	"__lock_annotate(x) \000"
.LASF686:
	.ascii	"_LITE_EXIT 1\000"
.LASF9:
	.ascii	"__ATOMIC_RELAXED 0\000"
.LASF714:
	.ascii	"_ATTRIBUTE(attrs) __attribute__ (attrs)\000"
.LASF448:
	.ascii	"__ARM_FEATURE_COPROC\000"
.LASF950:
	.ascii	"__ATTRIBUTE_IMPURE_PTR__ \000"
.LASF178:
	.ascii	"__DBL_HAS_INFINITY__ 1\000"
.LASF96:
	.ascii	"__SIG_ATOMIC_MAX__ 0x7fffffff\000"
.LASF582:
	.ascii	"UINT64_MAX (__UINT64_MAX__)\000"
.LASF906:
	.ascii	"_REENT_CHECK_RAND48(var) _REENT_CHECK(var, _r48, st"
	.ascii	"ruct _rand48 *, sizeof *((var)->_r48), _REENT_INIT_"
	.ascii	"RAND48((var)))\000"
.LASF691:
	.ascii	"_RETARGETABLE_LOCKING 1\000"
.LASF797:
	.ascii	"__rangeof(type,start,end) (__offsetof(type, end) - "
	.ascii	"__offsetof(type, start))\000"
.LASF458:
	.ascii	"__USES_INITFINI__ 1\000"
.LASF611:
	.ascii	"UINT8_C(x) __UINT8_C(x)\000"
.LASF634:
	.ascii	"__need_ptrdiff_t\000"
.LASF275:
	.ascii	"__ULFRACT_MAX__ 0XFFFFFFFFP-32ULR\000"
.LASF171:
	.ascii	"__DBL_DECIMAL_DIG__ 17\000"
.LASF493:
	.ascii	"__have_long32 1\000"
.LASF861:
	.ascii	"_NULL 0\000"
.LASF729:
	.ascii	"__flexarr [0]\000"
.LASF546:
	.ascii	"__int64_t_defined 1\000"
.LASF100:
	.ascii	"__INT16_MAX__ 0x7fff\000"
.LASF690:
	.ascii	"_REENT_CHECK_VERIFY 1\000"
.LASF371:
	.ascii	"__GCC_ATOMIC_CHAR_LOCK_FREE 2\000"
.LASF816:
	.ascii	"__DEVOLATILE(type,var) ((type)(__uintptr_t)(volatil"
	.ascii	"e void *)(var))\000"
.LASF490:
	.ascii	"__SSP_FORTIFY_LEVEL 0\000"
.LASF411:
	.ascii	"__ARM_FEATURE_SIMD32 1\000"
.LASF489:
	.ascii	"__XSI_VISIBLE 0\000"
.LASF963:
	.ascii	"_STDLIB_H_ \000"
.LASF953:
	.ascii	"_REENT_IS_NULL(_ptr) ((_ptr) == NULL)\000"
.LASF327:
	.ascii	"__QQ_FBIT__ 7\000"
.LASF892:
	.ascii	"_REENT_INIT_RESERVED_2 \000"
.LASF98:
	.ascii	"__SIG_ATOMIC_WIDTH__ 32\000"
.LASF225:
	.ascii	"__FLT64_EPSILON__ 2.2204460492503131e-16F64\000"
.LASF864:
	.ascii	"_LOCK_RECURSIVE_T _LOCK_T\000"
.LASF472:
	.ascii	"__GNUC_PREREQ__(ma,mi) __GNUC_PREREQ(ma, mi)\000"
.LASF669:
	.ascii	"__DEFINED_wchar_t \000"
.LASF362:
	.ascii	"__UTA_IBIT__ 64\000"
.LASF397:
	.ascii	"__ARM_FEATURE_CRC32\000"
.LASF805:
	.ascii	"__strong_reference(sym,aliassym) extern __typeof (s"
	.ascii	"ym) aliassym __attribute__ ((__alias__ (#sym)))\000"
.LASF286:
	.ascii	"__ULLFRACT_EPSILON__ 0x1P-64ULLR\000"
.LASF788:
	.ascii	"__unreachable() __builtin_unreachable()\000"
.LASF4:
	.ascii	"__STDC_HOSTED__ 1\000"
.LASF387:
	.ascii	"__SIZEOF_WINT_T__ 4\000"
.LASF998:
	.ascii	"strlen\000"
.LASF456:
	.ascii	"__GXX_TYPEINFO_EQUALITY_INLINE 0\000"
.LASF188:
	.ascii	"__LDBL_DECIMAL_DIG__ 17\000"
.LASF1016:
	.ascii	"output_size\000"
.LASF737:
	.ascii	"__GNUCLIKE_ASM 3\000"
.LASF309:
	.ascii	"__LACCUM_MIN__ (-0X1P31LK-0X1P31LK)\000"
.LASF127:
	.ascii	"__INT_FAST8_MAX__ 0x7fffffff\000"
.LASF210:
	.ascii	"__FLT32_HAS_DENORM__ 1\000"
.LASF800:
	.ascii	"__scanflike(fmtarg,firstvararg) __attribute__((__fo"
	.ascii	"rmat__ (__scanf__, fmtarg, firstvararg)))\000"
.LASF526:
	.ascii	"__FAST8 \000"
.LASF324:
	.ascii	"__ULLACCUM_MIN__ 0.0ULLK\000"
.LASF849:
	.ascii	"_SYS__TYPES_H \000"
.LASF132:
	.ascii	"__INT_FAST32_WIDTH__ 32\000"
.LASF665:
	.ascii	"___int_wchar_t_h \000"
.LASF999:
	.ascii	"memcpy\000"
.LASF939:
	.ascii	"_REENT_CVTBUF(_ptr) ((_ptr)->_cvtbuf)\000"
.LASF745:
	.ascii	"__GNUCLIKE_BUILTIN_VAALIST 1\000"
.LASF715:
	.ascii	"_ELIDABLE_INLINE static __inline__\000"
.LASF966:
	.ascii	"_NEWLIB_ALLOCA_H \000"
.LASF524:
	.ascii	"__INT32 \"l\"\000"
.LASF447:
	.ascii	"__ARM_ASM_SYNTAX_UNIFIED__ 1\000"
.LASF974:
	.ascii	"strtodf strtof\000"
.LASF50:
	.ascii	"__UINT32_TYPE__ long unsigned int\000"
.LASF398:
	.ascii	"__ARM_FEATURE_DOTPROD\000"
.LASF862:
	.ascii	"__Long long\000"
.LASF473:
	.ascii	"_DEFAULT_SOURCE\000"
.LASF442:
	.ascii	"__ARM_PCS_VFP 1\000"
.LASF650:
	.ascii	"_GCC_SIZE_T \000"
.LASF755:
	.ascii	"__CC_SUPPORTS_WARNING 1\000"
.LASF88:
	.ascii	"__WINT_WIDTH__ 32\000"
.LASF284:
	.ascii	"__ULLFRACT_MIN__ 0.0ULLR\000"
.LASF657:
	.ascii	"_T_WCHAR_ \000"
.LASF344:
	.ascii	"__UDQ_IBIT__ 0\000"
.LASF381:
	.ascii	"__GCC_CONSTRUCTIVE_SIZE 64\000"
.LASF670:
	.ascii	"_BSD_WCHAR_T_\000"
.LASF790:
	.ascii	"__restrict_arr restrict\000"
.LASF278:
	.ascii	"__LLFRACT_IBIT__ 0\000"
.LASF613:
	.ascii	"UINT16_C(x) __UINT16_C(x)\000"
.LASF961:
	.ascii	"strncmpi strncasecmp\000"
.LASF279:
	.ascii	"__LLFRACT_MIN__ (-0.5LLR-0.5LLR)\000"
.LASF990:
	.ascii	"uint32_t\000"
.LASF503:
	.ascii	"_SYS__INTSUP_H \000"
.LASF291:
	.ascii	"__SACCUM_EPSILON__ 0x1P-7HK\000"
.LASF750:
	.ascii	"__GNUCLIKE_BUILTIN_MEMCPY 1\000"
.LASF420:
	.ascii	"__GCC_ASM_FLAG_OUTPUTS__ 1\000"
.LASF947:
	.ascii	"_REENT_STDOUT(_ptr) ((_ptr)->_stdout)\000"
.LASF596:
	.ascii	"INT_FAST64_MAX (__INT_FAST64_MAX__)\000"
.LASF429:
	.ascii	"__ARM_FP 4\000"
.LASF476:
	.ascii	"_POSIX_SOURCE 1\000"
.LASF65:
	.ascii	"__UINT_FAST16_TYPE__ unsigned int\000"
.LASF356:
	.ascii	"__UHA_IBIT__ 8\000"
.LASF851:
	.ascii	"__need_wint_t \000"
.LASF301:
	.ascii	"__ACCUM_EPSILON__ 0x1P-15K\000"
.LASF316:
	.ascii	"__ULACCUM_EPSILON__ 0x1P-32ULK\000"
.LASF182:
	.ascii	"__LDBL_DIG__ 15\000"
.LASF90:
	.ascii	"__SIZE_WIDTH__ 32\000"
.LASF919:
	.ascii	"_REENT_MP_RESULT(ptr) ((ptr)->_mp->_result)\000"
.LASF79:
	.ascii	"__WINT_MIN__ 0U\000"
.LASF216:
	.ascii	"__FLT64_DIG__ 15\000"
.LASF521:
	.ascii	"_INT32_EQ_LONG \000"
.LASF1024:
	.ascii	"free\000"
.LASF78:
	.ascii	"__WINT_MAX__ 0xffffffffU\000"
.LASF754:
	.ascii	"__CC_SUPPORTS___FUNC__ 1\000"
.LASF109:
	.ascii	"__INT_LEAST8_WIDTH__ 8\000"
.LASF708:
	.ascii	"_REENT_SMALL \000"
.LASF725:
	.ascii	"__long_double_t long double\000"
.LASF53:
	.ascii	"__INT_LEAST16_TYPE__ short int\000"
.LASF160:
	.ascii	"__FLT_HAS_DENORM__ 1\000"
.LASF513:
	.ascii	"unsigned +0\000"
.LASF172:
	.ascii	"__DBL_MAX__ ((double)1.7976931348623157e+308L)\000"
.LASF984:
	.ascii	"short unsigned int\000"
.LASF277:
	.ascii	"__LLFRACT_FBIT__ 63\000"
.LASF211:
	.ascii	"__FLT32_HAS_INFINITY__ 1\000"
.LASF1031:
	.ascii	"capacity_limbs\000"
.LASF421:
	.ascii	"__thumb__ 1\000"
.LASF186:
	.ascii	"__LDBL_MAX_10_EXP__ 308\000"
.LASF426:
	.ascii	"__ARMEL__ 1\000"
.LASF453:
	.ascii	"__ARM_FEATURE_BF16_SCALAR_ARITHMETIC\000"
.LASF801:
	.ascii	"__format_arg(fmtarg) __attribute__((__format_arg__ "
	.ascii	"(fmtarg)))\000"
.LASF747:
	.ascii	"__compiler_membar() __asm __volatile(\" \" : : : \""
	.ascii	"memory\")\000"
.LASF869:
	.ascii	"__lock_close(lock) __retarget_lock_close(lock)\000"
.LASF329:
	.ascii	"__HQ_FBIT__ 15\000"
.LASF300:
	.ascii	"__ACCUM_MAX__ 0X7FFFFFFFP-15K\000"
.LASF824:
	.ascii	"__datatype_type_tag(kind,type) \000"
.LASF696:
	.ascii	"_SUPPORTS_ERREXCEPT \000"
.LASF81:
	.ascii	"__SIZE_MAX__ 0xffffffffU\000"
.LASF677:
	.ascii	"_GCC_MAX_ALIGN_T \000"
.LASF417:
	.ascii	"__ARM_ARCH\000"
.LASF564:
	.ascii	"UINT8_MAX (__UINT8_MAX__)\000"
.LASF633:
	.ascii	"__DEFINED_ptrdiff_t \000"
.LASF719:
	.ascii	"_SYS_CDEFS_H_ \000"
.LASF551:
	.ascii	"__int_least8_t_defined 1\000"
.LASF675:
	.ascii	"offsetof\000"
.LASF519:
	.ascii	"long +4\000"
.LASF783:
	.ascii	"__nonnull(x) __attribute__((__nonnull__ x))\000"
.LASF886:
	.ascii	"_RAND48_ADD (0x000b)\000"
.LASF1019:
	.ascii	"hex_str\000"
.LASF970:
	.ascii	"EXIT_FAILURE 1\000"
.LASF408:
	.ascii	"__ARM_FEATURE_LDREX 7\000"
.LASF872:
	.ascii	"__lock_acquire_recursive(lock) __retarget_lock_acqu"
	.ascii	"ire_recursive(lock)\000"
.LASF639:
	.ascii	"_T_SIZE_ \000"
.LASF281:
	.ascii	"__LLFRACT_EPSILON__ 0x1P-63LLR\000"
.LASF250:
	.ascii	"__SFRACT_MAX__ 0X7FP-7HR\000"
.LASF231:
	.ascii	"__FLT32X_MANT_DIG__ 53\000"
.LASF87:
	.ascii	"__WCHAR_WIDTH__ 32\000"
.LASF544:
	.ascii	"_INT64_T_DECLARED \000"
.LASF111:
	.ascii	"__INT16_C(c) c\000"
.LASF352:
	.ascii	"__DA_IBIT__ 32\000"
.LASF253:
	.ascii	"__USFRACT_IBIT__ 0\000"
.LASF515:
	.ascii	"short +1\000"
.LASF394:
	.ascii	"__ARM_FEATURE_SHA2\000"
.LASF817:
	.ascii	"__DEQUALIFY(type,var) ((type)(__uintptr_t)(const vo"
	.ascii	"latile void *)(var))\000"
.LASF868:
	.ascii	"__lock_init_recursive(lock) __retarget_lock_init_re"
	.ascii	"cursive(&lock)\000"
.LASF13:
	.ascii	"__ATOMIC_ACQ_REL 4\000"
.LASF52:
	.ascii	"__INT_LEAST8_TYPE__ signed char\000"
.LASF330:
	.ascii	"__HQ_IBIT__ 0\000"
.LASF771:
	.ascii	"__packed __attribute__((__packed__))\000"
.LASF168:
	.ascii	"__DBL_MIN_10_EXP__ (-307)\000"
.LASF1005:
	.ascii	"new_carry\000"
.LASF833:
	.ascii	"__asserts_shared(...) __lock_annotate(assert_shared"
	.ascii	"_lock(__VA_ARGS__))\000"
.LASF732:
	.ascii	"__ptrvalue \000"
.LASF753:
	.ascii	"__CC_SUPPORTS___INLINE__ 1\000"
.LASF509:
	.ascii	"__int20\000"
.LASF688:
	.ascii	"_NANO_FORMATTED_IO 1\000"
.LASF593:
	.ascii	"INT_FAST32_MAX (__INT_FAST32_MAX__)\000"
.LASF206:
	.ascii	"__FLT32_NORM_MAX__ 3.4028234663852886e+38F32\000"
.LASF888:
	.ascii	"_REENT_ASCTIME_SIZE 26\000"
.LASF685:
	.ascii	"_LDBL_EQ_DBL 1\000"
.LASF477:
	.ascii	"_POSIX_C_SOURCE\000"
.LASF93:
	.ascii	"__UINTMAX_MAX__ 0xffffffffffffffffULL\000"
.LASF165:
	.ascii	"__DBL_MANT_DIG__ 53\000"
.LASF273:
	.ascii	"__ULFRACT_IBIT__ 0\000"
.LASF863:
	.ascii	"__SYS_LOCK_H__ \000"
.LASF840:
	.ascii	"__nosanitizethread \000"
.LASF73:
	.ascii	"__INT_MAX__ 0x7fffffff\000"
.LASF55:
	.ascii	"__INT_LEAST64_TYPE__ long long int\000"
.LASF104:
	.ascii	"__UINT16_MAX__ 0xffff\000"
.LASF505:
	.ascii	"signed\000"
.LASF451:
	.ascii	"__ARM_FEATURE_CDE_COPROC\000"
	.ident	"GCC: (GNU Tools for STM32 13.3.rel1.20240926-1715) 13.3.1 20240614"
