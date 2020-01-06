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
	mov	r3, #67108864
	mov	r0, #7296
	mov	r1, #768
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r6, #2048
	ldr	r2, .L4
	sub	sp, sp, #2048
	mov	r9, #4
	sub	sp, sp, #4
	ldr	r4, .L4+4
	strh	r0, [r3, #10]	@ movhi
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ldr	r1, .L4+8
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	mov	r8, #5
	mov	lr, pc
	bx	r4
	mov	r7, #6
	mov	r2, r6
	mov	r0, sp
	mov	r1, #0
	ldr	r3, .L4+12
	mov	lr, pc
	bx	r3
	mov	lr, #7
	mov	ip, #8
	mov	r0, #11
	mov	r1, #12
	strh	r9, [sp, #198]	@ movhi
	add	r9, sp, #264
	strh	r8, [r9]	@ movhi
	add	r8, sp, #328
	strh	r7, [r8, #2]	@ movhi
	add	r7, sp, #396
	strh	lr, [r7]	@ movhi
	ldr	r7, .L4+16
	add	lr, sp, #412
	strh	r7, [lr, #2]	@ movhi
	add	lr, sp, #460
	strh	ip, [lr, #2]	@ movhi
	add	ip, sp, #660
	strh	r0, [ip]	@ movhi
	ldr	ip, .L4+20
	add	r0, sp, #708
	strh	ip, [r0, #2]	@ movhi
	add	r0, sp, #724
	strh	r1, [r0, #2]	@ movhi
	mov	r0, #13	@ movhi
	add	r1, sp, #792
	strh	r0, [r1]	@ movhi
	mov	r0, #14	@ movhi
	mov	ip, #15	@ movhi
	mov	r2, #9
	mov	r5, #3
	mov	r3, #10
	mov	fp, #1
	mov	r10, #2
	add	r1, sp, #856
	strh	r0, [r1, #2]	@ movhi
	add	r0, sp, #924
	strh	ip, [r0]	@ movhi
	ldr	r1, .L4+24
	add	ip, sp, #528
	strh	r2, [ip]	@ movhi
	ldr	ip, .L4+28
	add	r2, sp, #592
	mov	r0, r5
	strh	r3, [r2, #2]	@ movhi
	str	r1, [sp, #168]
	mov	r3, #576
	mov	r2, #100663296
	ldr	r1, .L4+32
	str	ip, [sp, #232]
	strh	fp, [sp]	@ movhi
	strh	r10, [sp, #66]	@ movhi
	strh	r5, [sp, #132]	@ movhi
	mov	lr, pc
	bx	r4
	mov	r1, sp
	mov	r0, r5
	mov	r3, #512
	ldr	r2, .L4+36
	mov	lr, pc
	bx	r4
	mov	r0, r5
	ldr	r3, .L4+40
	ldr	r2, .L4+44
	ldr	r1, .L4+48
	mov	lr, pc
	bx	r4
	mov	r3, r6
	mov	r0, r5
	ldr	r2, .L4+52
	ldr	r1, .L4+56
	mov	lr, pc
	bx	r4
	mov	r3, #0
	ldr	r2, .L4+60
	ldr	r1, .L4+64
	str	r3, [r2]
	ldr	r2, .L4+68
	str	r3, [r1]
	ldrh	r2, [r2, #48]
	ldr	r3, .L4+72
	strh	r2, [r3]	@ movhi
	add	sp, sp, #2048
	add	sp, sp, #4
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	24068
	.word	DMANow
	.word	skyTilesPal
	.word	memset
	.word	2058
	.word	1034
	.word	1048583
	.word	1114124
	.word	skyTilesTiles
	.word	100720640
	.word	5984
	.word	100679680
	.word	treesTiles
	.word	100724736
	.word	treesMap
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
	sub	r3, r3, #1
	str	r3, [r4]
.L10:
	ldr	r3, .L16+12
	mov	lr, pc
	bx	r3
	mov	ip, #67108864
	ldr	r2, [r5]
	ldr	r3, [r4]
	add	r0, r2, r2, lsr #31
	add	r1, r3, r3, lsr #31
	asr	r0, r0, #1
	asr	r1, r1, #1
	lsl	r0, r0, #16
	lsl	r2, r2, #16
	lsl	r1, r1, #16
	lsl	r3, r3, #16
	lsr	r0, r0, #16
	lsr	r2, r2, #16
	lsr	r1, r1, #16
	lsr	r3, r3, #16
	strh	r0, [ip, #20]	@ movhi
	pop	{r4, r5, r6, lr}
	strh	r1, [ip, #22]	@ movhi
	strh	r2, [ip, #16]	@ movhi
	strh	r3, [ip, #18]	@ movhi
	bx	lr
.L9:
	ldrh	r3, [r3, #48]
	ldr	r4, .L16+8
	tst	r3, #128
	ldreq	r3, [r4]
	addeq	r3, r3, #1
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
