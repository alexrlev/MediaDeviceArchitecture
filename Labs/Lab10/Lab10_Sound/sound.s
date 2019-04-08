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
	.file	"sound.c"
	.text
	.align	2
	.global	setupSounds
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	setupSounds, %function
setupSounds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	mov	r0, #128
	mov	r1, #0
	ldr	r2, .L3
	strh	r0, [r3, #132]	@ movhi
	strh	r1, [r3, #128]	@ movhi
	strh	r2, [r3, #130]	@ movhi
	bx	lr
.L4:
	.align	2
.L3:
	.word	-1266
	.size	setupSounds, .-setupSounds
	.global	__aeabi_idiv
	.global	__aeabi_i2d
	.global	__aeabi_dmul
	.global	__aeabi_ddiv
	.global	__aeabi_d2iz
	.align	2
	.global	playSoundA
	.syntax unified
	.arm
	.fpu softvfp
	.type	playSoundA, %function
playSoundA:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r5, #0
	mov	r6, r2
	ldr	r2, .L7+8
	ldr	r2, [r2]
	ldr	r7, .L7+12
	mov	r8, r1
	mov	r9, r0
	mov	r10, r3
	str	r5, [r2, #20]
	mov	r1, r0
	ldr	r2, .L7+16
	mov	r3, #910163968
	mov	r0, #1
	ldr	r4, .L7+20
	mov	lr, pc
	bx	r4
	strh	r5, [r7, #2]	@ movhi
	mov	r1, r6
	ldr	r3, .L7+24
	mov	r0, #16777216
	mov	lr, pc
	bx	r3
	mov	r2, #128
	mov	r3, #1
	rsb	r0, r0, #0
	ldr	r4, .L7+28
	lsl	r0, r0, #16
	lsr	r0, r0, #16
	strh	r0, [r7]	@ movhi
	strh	r2, [r7, #2]	@ movhi
	mov	r0, r8
	ldr	r7, .L7+32
	str	r9, [r4]
	str	r8, [r4, #4]
	str	r6, [r4, #8]
	str	r3, [r4, #12]
	str	r10, [r4, #16]
	mov	lr, pc
	bx	r7
	ldr	r8, .L7+36
	adr	r3, .L7
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r8
	mov	r8, r0
	mov	r0, r6
	mov	r9, r1
	mov	lr, pc
	bx	r7
	ldr	r6, .L7+40
	mov	r2, r0
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
	mov	lr, pc
	bx	r6
	ldr	r3, .L7+44
	mov	lr, pc
	bx	r3
	str	r5, [r4, #28]
	str	r0, [r4, #20]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L8:
	.align	3
.L7:
	.word	1443109011
	.word	1078844686
	.word	dma
	.word	67109120
	.word	67109024
	.word	DMANow
	.word	__aeabi_idiv
	.word	soundA
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	__aeabi_ddiv
	.word	__aeabi_d2iz
	.size	playSoundA, .-playSoundA
	.align	2
	.global	playSoundB
	.syntax unified
	.arm
	.fpu softvfp
	.type	playSoundB, %function
playSoundB:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r5, #0
	mov	r6, r2
	ldr	r2, .L11+8
	ldr	r2, [r2]
	ldr	r7, .L11+12
	mov	r8, r1
	mov	r9, r0
	mov	r10, r3
	str	r5, [r2, #32]
	mov	r1, r0
	ldr	r2, .L11+16
	mov	r3, #910163968
	mov	r0, #2
	ldr	r4, .L11+20
	mov	lr, pc
	bx	r4
	strh	r5, [r7, #6]	@ movhi
	mov	r1, r6
	ldr	r3, .L11+24
	mov	r0, #16777216
	mov	lr, pc
	bx	r3
	mov	r2, #128
	mov	r3, #1
	rsb	r0, r0, #0
	ldr	r4, .L11+28
	lsl	r0, r0, #16
	lsr	r0, r0, #16
	strh	r0, [r7, #4]	@ movhi
	strh	r2, [r7, #6]	@ movhi
	mov	r0, r8
	ldr	r7, .L11+32
	str	r9, [r4]
	str	r8, [r4, #4]
	str	r6, [r4, #8]
	str	r3, [r4, #12]
	str	r10, [r4, #16]
	mov	lr, pc
	bx	r7
	ldr	r8, .L11+36
	adr	r3, .L11
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r8
	mov	r8, r0
	mov	r0, r6
	mov	r9, r1
	mov	lr, pc
	bx	r7
	ldr	r6, .L11+40
	mov	r2, r0
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
	mov	lr, pc
	bx	r6
	ldr	r3, .L11+44
	mov	lr, pc
	bx	r3
	str	r5, [r4, #28]
	str	r0, [r4, #20]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L12:
	.align	3
.L11:
	.word	1443109011
	.word	1078844686
	.word	dma
	.word	67109120
	.word	67109028
	.word	DMANow
	.word	__aeabi_idiv
	.word	soundB
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	__aeabi_ddiv
	.word	__aeabi_d2iz
	.size	playSoundB, .-playSoundB
	.align	2
	.global	interruptHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	interruptHandler, %function
interruptHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	ldr	r3, .L34
	ldrh	r1, [r3, #2]
	tst	r1, #1
	strh	r2, [r3, #8]	@ movhi
	beq	.L27
	ldr	r0, .L34+4
	ldr	r3, [r0, #12]
	cmp	r3, r2
	push	{r4, lr}
	bne	.L30
.L16:
	ldr	r0, .L34+8
	ldr	r3, [r0, #12]
	cmp	r3, #0
	beq	.L20
	ldr	r3, [r0, #28]
	ldr	r2, [r0, #20]
	add	r3, r3, #1
	cmp	r3, r2
	str	r3, [r0, #28]
	beq	.L31
.L20:
	mov	r2, #1
	ldr	r3, .L34
	strh	r2, [r3, #2]	@ movhi
	mov	r2, #1
	ldr	r3, .L34
	pop	{r4, lr}
	strh	r2, [r3, #8]	@ movhi
	bx	lr
.L30:
	ldr	r3, [r0, #28]
	ldr	r2, [r0, #20]
	add	r3, r3, #1
	cmp	r3, r2
	str	r3, [r0, #28]
	bne	.L16
	ldr	r3, [r0, #16]
	cmp	r3, #0
	bne	.L32
	ldr	r1, .L34+12
	ldr	r2, .L34+16
	ldr	r1, [r1]
	str	r3, [r0, #12]
	str	r3, [r1, #20]
	strh	r3, [r2, #2]	@ movhi
	b	.L16
.L27:
	mov	r2, #1
	ldr	r3, .L34
	strh	r2, [r3, #8]	@ movhi
	bx	lr
.L31:
	ldr	r3, [r0, #16]
	cmp	r3, #0
	bne	.L33
	ldr	r1, .L34+12
	ldr	r2, .L34+16
	ldr	r1, [r1]
	str	r3, [r0, #12]
	str	r3, [r1, #32]
	strh	r3, [r2, #6]	@ movhi
	b	.L20
.L32:
	ldm	r0, {r0, r1, r2}
	bl	playSoundA
	b	.L16
.L33:
	ldm	r0, {r0, r1, r2}
	bl	playSoundB
	b	.L20
.L35:
	.align	2
.L34:
	.word	67109376
	.word	soundA
	.word	soundB
	.word	dma
	.word	67109120
	.size	interruptHandler, .-interruptHandler
	.align	2
	.global	setupInterrupts
	.syntax unified
	.arm
	.fpu softvfp
	.type	setupInterrupts, %function
setupInterrupts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #67108864
	str	lr, [sp, #-4]!
	mov	lr, #1
	ldrh	r1, [r0, #4]
	ldr	r3, .L38
	orr	r1, r1, #8
	ldrh	r2, [r3]
	ldr	ip, .L38+4
	strh	r1, [r0, #4]	@ movhi
	ldr	r1, .L38+8
	orr	r2, r2, lr
	strh	lr, [r3, #8]	@ movhi
	strh	r2, [r3]	@ movhi
	ldr	lr, [sp], #4
	str	r1, [ip, #4092]
	bx	lr
.L39:
	.align	2
.L38:
	.word	67109376
	.word	50360320
	.word	interruptHandler
	.size	setupInterrupts, .-setupInterrupts
	.align	2
	.global	pauseSound
	.syntax unified
	.arm
	.fpu softvfp
	.type	pauseSound, %function
pauseSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L49
	ldr	r2, [r3, #12]
	cmp	r2, #0
	movne	r2, #0
	ldrne	r1, .L49+4
	strne	r2, [r3, #12]
	ldr	r3, .L49+8
	strhne	r2, [r1, #2]	@ movhi
	ldr	r2, [r3, #12]
	cmp	r2, #0
	movne	r2, #0
	ldrne	r1, .L49+4
	strne	r2, [r3, #12]
	strhne	r2, [r1, #6]	@ movhi
	bx	lr
.L50:
	.align	2
.L49:
	.word	soundA
	.word	67109120
	.word	soundB
	.size	pauseSound, .-pauseSound
	.align	2
	.global	unpauseSound
	.syntax unified
	.arm
	.fpu softvfp
	.type	unpauseSound, %function
unpauseSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L54
	ldr	r2, [r3, #12]
	cmp	r2, #0
	moveq	r0, #1
	moveq	r1, #128
	streq	r0, [r3, #12]
	ldr	r3, .L54+4
	ldreq	r2, .L54+8
	ldr	r3, [r3, #12]
	strheq	r1, [r2, #2]	@ movhi
	cmp	r3, #0
	moveq	r2, #128
	ldreq	r3, .L54+8
	strheq	r2, [r3, #6]	@ movhi
	bx	lr
.L55:
	.align	2
.L54:
	.word	soundA
	.word	soundB
	.word	67109120
	.size	unpauseSound, .-unpauseSound
	.align	2
	.global	stopSound
	.syntax unified
	.arm
	.fpu softvfp
	.type	stopSound, %function
stopSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L65
	ldr	r2, [r3, #12]
	cmp	r2, #0
	beq	.L57
	mov	r2, #0
	ldr	r0, .L65+4
	ldr	r1, .L65+8
	ldr	r0, [r0]
	str	r2, [r3, #12]
	str	r2, [r0, #20]
	strh	r2, [r1, #2]	@ movhi
.L57:
	ldr	r3, .L65+12
	ldr	r2, [r3, #12]
	cmp	r2, #0
	bxeq	lr
	mov	r2, #0
	ldr	r0, .L65+4
	ldr	r1, .L65+8
	ldr	r0, [r0]
	str	r2, [r3, #12]
	str	r2, [r0, #32]
	strh	r2, [r1, #6]	@ movhi
	bx	lr
.L66:
	.align	2
.L65:
	.word	soundA
	.word	dma
	.word	67109120
	.word	soundB
	.size	stopSound, .-stopSound
	.comm	soundB,32,4
	.comm	soundA,32,4
	.ident	"GCC: (devkitARM release 50) 8.2.0"
