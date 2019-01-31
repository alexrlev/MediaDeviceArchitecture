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
	.global	frame1
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	frame1, %function
frame1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #25
	push	{r4, r5, r6, lr}
	ldr	r4, .L4
	sub	sp, sp, #8
	ldr	r6, .L4+4
	mov	r0, r1
	mov	r3, r4
	mov	r2, #50
	mov	lr, pc
	bx	r6
	mov	r3, r4
	mov	r2, #50
	mov	r1, #40
	mov	r0, #25
	ldr	r5, .L4+8
	mov	lr, pc
	bx	r6
	mov	r3, r4
	mov	r2, #15
	mov	r1, #25
	mov	r0, #50
	mov	lr, pc
	bx	r5
	mov	r3, r4
	mov	r2, #50
	mov	r1, #45
	mov	r0, #25
	mov	lr, pc
	bx	r6
	mov	r3, r4
	mov	r2, #15
	mov	r1, #45
	mov	r0, #25
	mov	lr, pc
	bx	r5
	mov	r3, r4
	mov	r2, #15
	mov	r1, #45
	mov	r0, #50
	mov	lr, pc
	bx	r5
	mov	r3, r4
	mov	r2, #15
	mov	r1, #45
	mov	r0, #75
	mov	lr, pc
	bx	r5
	mov	r3, r4
	mov	r2, #50
	mov	r1, #65
	mov	r0, #25
	mov	lr, pc
	bx	r6
	mov	r3, r4
	mov	r2, #15
	mov	r1, #65
	mov	r0, #75
	mov	lr, pc
	bx	r5
	mov	r3, r4
	mov	r2, #50
	mov	r1, #85
	mov	r0, #25
	mov	lr, pc
	bx	r6
	mov	r3, r4
	mov	r2, #15
	mov	r1, #85
	mov	r0, #75
	mov	lr, pc
	bx	r5
	str	r4, [sp]
	mov	r3, #15
	mov	r2, #50
	mov	r1, #105
	ldr	r4, .L4+12
	mov	r0, #25
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	30399
	.word	drawVerticalLine
	.word	drawHorizontalLine
	.word	drawRectangle
	.size	frame1, .-frame1
	.align	2
	.global	frame2
	.syntax unified
	.arm
	.fpu softvfp
	.type	frame2, %function
frame2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #25
	push	{r4, r5, r6, r7, lr}
	ldr	r4, .L8
	sub	sp, sp, #12
	ldr	r5, .L8+4
	mov	r0, r1
	mov	r3, r4
	mov	r2, #50
	mov	lr, pc
	bx	r5
	mov	r3, r4
	mov	r2, #50
	mov	r1, #40
	mov	r0, #25
	mov	lr, pc
	bx	r5
	mov	r3, r4
	mov	r2, #50
	mov	r1, #55
	mov	r0, #25
	mov	lr, pc
	bx	r5
	ldr	r7, .L8+8
	mov	r3, r4
	mov	r2, #30
	mov	r1, #25
	mov	r0, #75
	mov	lr, pc
	bx	r7
	ldr	r6, .L8+12
	str	r4, [sp]
	mov	r3, #15
	mov	r2, #50
	mov	r1, #60
	mov	r0, #25
	mov	lr, pc
	bx	r6
	str	r4, [sp]
	mov	r3, #15
	mov	r2, #30
	mov	r1, #80
	mov	r0, #25
	mov	lr, pc
	bx	r6
	mov	r3, r4
	mov	r2, #20
	mov	r1, #80
	mov	r0, #55
	mov	lr, pc
	bx	r5
	ldr	r6, .L8+16
	mov	r3, r4
	mov	r2, #20
	mov	r1, #80
	mov	r0, #55
	mov	lr, pc
	bx	r6
	mov	r3, r4
	mov	r2, #50
	mov	r1, #105
	mov	r0, #25
	mov	lr, pc
	bx	r5
	mov	r3, r4
	mov	r2, #15
	mov	r1, #105
	mov	r0, #75
	mov	lr, pc
	bx	r7
	mov	r3, r4
	mov	r2, #50
	mov	r1, #125
	mov	r0, #25
	mov	lr, pc
	bx	r5
	mov	r3, r4
	mov	r2, #26
	mov	r1, #125
	ldr	r5, .L8+20
	mov	r0, #75
	mov	lr, pc
	bx	r5
	mov	r2, #25
	mov	r3, r4
	mov	r1, #125
	mov	r0, r2
	mov	lr, pc
	bx	r6
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	1023
	.word	drawVerticalLine
	.word	drawHorizontalLine
	.word	drawRectangle
	.word	drawDiagonalDownLine
	.word	drawDiagonalUpLine
	.size	frame2, .-frame2
	.align	2
	.global	frame3
	.syntax unified
	.arm
	.fpu softvfp
	.type	frame3, %function
frame3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #7
	mov	r1, #50
	push	{r4, r5, lr}
	ldr	r4, .L12
	sub	sp, sp, #12
	mov	r2, r3
	str	r4, [sp]
	ldr	r5, .L12+4
	mov	r0, r1
	mov	lr, pc
	bx	r5
	mov	r3, #7
	str	r4, [sp]
	mov	r2, r3
	mov	r1, #93
	mov	r0, #50
	mov	lr, pc
	bx	r5
	mov	r3, r4
	ldr	r5, .L12+8
	mov	r2, #6
	mov	r1, #50
	mov	r0, #80
	mov	lr, pc
	bx	r5
	mov	r3, r4
	mov	r2, #6
	mov	r1, #100
	mov	r0, #80
	mov	lr, pc
	bx	r5
	mov	r3, r4
	mov	r2, #10
	mov	r1, #50
	ldr	r5, .L12+12
	mov	r0, #86
	mov	lr, pc
	bx	r5
	mov	r3, r4
	mov	r2, #10
	mov	r1, #90
	ldr	r5, .L12+16
	mov	r0, #95
	mov	lr, pc
	bx	r5
	mov	r3, r4
	mov	r2, #31
	mov	r1, #59
	mov	r0, #95
	ldr	r4, .L12+20
	mov	lr, pc
	bx	r4
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	32736
	.word	drawRectangle
	.word	drawVerticalLine
	.word	drawDiagonalDownLine
	.word	drawDiagonalUpLine
	.word	drawHorizontalLine
	.size	frame3, .-frame3
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
	ldr	r2, .L17
	push	{r7, lr}
	ldr	r6, .L17+4
	strh	r2, [r3]	@ movhi
	ldr	r5, .L17+8
	ldr	r9, .L17+12
	ldr	r4, .L17+16
	ldr	r8, .L17+20
	ldr	r7, .L17+24
.L15:
	mov	r0, #0
	mov	lr, pc
	bx	r6
	mov	lr, pc
	bx	r5
	mov	lr, pc
	bx	r9
	mov	r0, #200
	mov	lr, pc
	bx	r4
	mov	r0, #0
	mov	lr, pc
	bx	r6
	mov	lr, pc
	bx	r5
	mov	lr, pc
	bx	r8
	mov	r0, #200
	mov	lr, pc
	bx	r4
	mov	r0, #0
	mov	lr, pc
	bx	r6
	mov	lr, pc
	bx	r5
	mov	lr, pc
	bx	r7
	mov	r0, #200
	mov	lr, pc
	bx	r4
	b	.L15
.L18:
	.align	2
.L17:
	.word	1027
	.word	fillScreen
	.word	waitForVBlank
	.word	frame1
	.word	delay
	.word	frame2
	.word	frame3
	.size	main, .-main
	.ident	"GCC: (devkitARM release 50) 8.2.0"
