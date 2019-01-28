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
	.file	"lab01.c"
	.text
	.align	2
	.global	setPixel
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	setPixel, %function
setPixel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L3
	rsb	r0, r0, r0, lsl #4
	add	r1, r1, r0, lsl #4
	ldr	r3, [r3]
	lsl	r1, r1, #1
	strh	r2, [r3, r1]	@ movhi
	bx	lr
.L4:
	.align	2
.L3:
	.word	.LANCHOR0
	.size	setPixel, .-setPixel
	.align	2
	.global	drawTriangle
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawTriangle, %function
drawTriangle:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #992
	rsb	r2, r0, r0, lsl #4
	ldr	r0, .L9
	lsl	r2, r2, #4
	ldr	r0, [r0]
	add	r3, r2, #5952
	add	r3, r3, #48
	add	r2, r1, r2
	push	{r4, lr}
	add	r3, r3, r1
	lsl	lr, r2, #1
	add	r4, r0, #48
	sub	r2, r2, #-2147483647
	add	r3, r0, r3, lsl #1
	add	r2, r0, r2, lsl #1
	add	r1, r0, lr
	add	r0, lr, r4
.L6:
	strh	ip, [r1]	@ movhi
	strh	ip, [r2, #2]!	@ movhi
	strh	ip, [r3]	@ movhi
	cmp	r2, r0
	sub	r3, r3, #476
	sub	r3, r3, #2
	add	r1, r1, #480
	bne	.L6
	pop	{r4, lr}
	bx	lr
.L10:
	.align	2
.L9:
	.word	.LANCHOR0
	.size	drawTriangle, .-drawTriangle
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
	mov	r3, #67108864
	ldr	r2, .L14
	push	{r4, lr}
	mov	r1, #60
	strh	r2, [r3]	@ movhi
	mov	r0, #50
	ldr	r4, .L14+4
	mov	lr, pc
	bx	r4
	mov	r1, #20
	mov	r0, #30
	mov	lr, pc
	bx	r4
	mov	r1, #100
	mov	r0, #90
	mov	lr, pc
	bx	r4
.L12:
	b	.L12
.L15:
	.align	2
.L14:
	.word	1027
	.word	drawTriangle
	.size	main, .-main
	.global	videoBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.ident	"GCC: (devkitARM release 50) 8.2.0"
