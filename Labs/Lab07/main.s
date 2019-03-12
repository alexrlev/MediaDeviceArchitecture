	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.align	2
	.global	initialize
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 2048
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r3, #67108864
	mov	r5, #512
	mov	r2, #7296
	sub	sp, sp, #2048
	sub	sp, sp, #4
	ldr	r4, .L4
	strh	r2, [r3, #10]	@ movhi
	strh	r5, [r3]	@ movhi
	mov	r2, #83886080
	mov	r3, #256
	ldr	r1, .L4+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r0, sp
	mov	r2, #2048
	mov	r1, #0
	ldr	r3, .L4+8
	mov	lr, pc
	bx	r3
	mov	ip, #1
	mov	r3, #1152
	mov	r2, #100663296
	ldr	r1, .L4+12
	mov	r0, #3
	strh	ip, [sp]	@ movhi
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r1, sp
	ldr	r2, .L4+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #0
	ldr	r2, .L4+20
	ldr	r1, .L4+24
	str	r3, [r2]
	ldr	r2, .L4+28
	str	r3, [r1]
	ldrh	r2, [r2, #48]
	ldr	r3, .L4+32
	strh	r2, [r3]	@ movhi
	add	sp, sp, #2048
	add	sp, sp, #4
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	DMANow
	.word	skyTilesPal
	.word	memset
	.word	skyTilesBitmap
	.word	100720640
	.word	vOff
	.word	hOff
	.word	67109120
	.word	buttons
	.size	initialize, .-initialize
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L16
	ldrh	r2, [r3, #48]
	tst	r2, #16
	push	{r4, r5, r6, lr}
	bne	.L7
	ldr	r5, .L16+4
	ldr	r3, [r5]
	add	r3, r3, #1
	str	r3, [r5]
.L8:
	ldr	r3, .L16
	ldrh	r2, [r3, #48]
	tst	r2, #64
	bne	.L9
	ldr	r4, .L16+8
	ldr	r3, [r4]
	add	r3, r3, #1
	str	r3, [r4]
.L10:
	ldr	r3, .L16+12
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	ldrh	r1, [r5]
	ldrh	r2, [r4]
	strh	r1, [r3, #20]	@ movhi
	pop	{r4, r5, r6, lr}
	strh	r2, [r3, #22]	@ movhi
	bx	lr
.L9:
	ldrh	r3, [r3, #48]
	ldr	r4, .L16+8
	tst	r3, #128
	ldreq	r3, [r4]
	subeq	r3, r3, #1
	streq	r3, [r4]
	b	.L10
.L7:
	ldrh	r3, [r3, #48]
	ldr	r5, .L16+4
	tst	r3, #32
	ldreq	r3, [r5]
	subeq	r3, r3, #1
	streq	r3, [r5]
	b	.L8
.L17:
	.align	2
.L16:
	.word	67109120
	.word	hOff
	.word	vOff
	.word	waitForVBlank
	.size	game, .-game
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r7, lr}
	ldr	r3, .L21
	mov	lr, pc
	bx	r3
	ldr	r7, .L21+4
	ldr	r6, .L21+8
	ldr	r4, .L21+12
	ldr	r5, .L21+16
.L19:
	mov	lr, pc
	bx	r7
	ldrh	r3, [r4]
	strh	r3, [r6]	@ movhi
	ldrh	r3, [r5, #48]
	strh	r3, [r4]	@ movhi
	b	.L19
.L22:
	.align	2
.L21:
	.word	initialize
	.word	game
	.word	oldButtons
	.word	buttons
	.word	67109120
	.size	main, .-main
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.ident	"GCC: (devkitARM release 50) 8.2.0"
