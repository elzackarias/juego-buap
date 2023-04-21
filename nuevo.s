	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 1
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	stp	x28, x27, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	sub	sp, sp, #544
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w27, -24
	.cfi_offset w28, -32
	sub	x8, x29, #120
	str	x8, [sp, #256]                  ; 8-byte Folded Spill
	adrp	x8, ___stack_chk_guard@GOTPAGE
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
	ldr	x8, [x8]
	stur	x8, [x29, #-24]
	stur	wzr, [x29, #-204]
	mov	x0, #0
	bl	_time
                                        ; kill: def $w0 killed $w0 killed $x0
	bl	_srand
	ldr	x8, [sp, #256]                  ; 8-byte Folded Reload
	mov	w9, #10000
	stur	w9, [x29, #-208]
	stur	wzr, [x29, #-212]
	stur	wzr, [x29, #-216]
	stur	wzr, [x29, #-232]
	stur	w9, [x29, #-240]
	mov	w9, #2
	stur	w9, [x29, #-244]
	mov	w9, #1
	stur	w9, [x29, #-248]
	str	xzr, [x8]
	str	wzr, [x8, #8]
	adrp	x0, l_.str@PAGE
	add	x0, x0, l_.str@PAGEOFF
	bl	_printf
	adrp	x0, l_.str.1@PAGE
	add	x0, x0, l_.str.1@PAGEOFF
	bl	_printf
	adrp	x0, l_.str.2@PAGE
	add	x0, x0, l_.str.2@PAGEOFF
	bl	_printf
	adrp	x0, l_.str.3@PAGE
	add	x0, x0, l_.str.3@PAGEOFF
	bl	_printf
	b	LBB0_1
LBB0_1:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_129 Depth 2
                                        ;     Child Loop BB0_133 Depth 2
                                        ;       Child Loop BB0_149 Depth 3
                                        ;       Child Loop BB0_165 Depth 3
                                        ;     Child Loop BB0_10 Depth 2
                                        ;       Child Loop BB0_18 Depth 3
                                        ;       Child Loop BB0_47 Depth 3
                                        ;     Child Loop BB0_81 Depth 2
                                        ;       Child Loop BB0_89 Depth 3
                                        ;       Child Loop BB0_107 Depth 3
	ldur	w8, [x29, #-232]
	cbnz	w8, LBB0_6
	b	LBB0_2
LBB0_2:                                 ;   in Loop: Header=BB0_1 Depth=1
	ldur	w8, [x29, #-248]
	subs	w8, w8, #1
	b.ne	LBB0_6
	b	LBB0_3
LBB0_3:                                 ;   in Loop: Header=BB0_1 Depth=1
	adrp	x0, l_.str.4@PAGE
	add	x0, x0, l_.str.4@PAGEOFF
	bl	_printf
	adrp	x0, l_.str.5@PAGE
	add	x0, x0, l_.str.5@PAGEOFF
	bl	_printf
	adrp	x0, l_.str.6@PAGE
	add	x0, x0, l_.str.6@PAGEOFF
	bl	_printf
	adrp	x0, l_.str.7@PAGE
	add	x0, x0, l_.str.7@PAGEOFF
	bl	_printf
	adrp	x0, l_.str.8@PAGE
	add	x0, x0, l_.str.8@PAGEOFF
	bl	_printf
	mov	x9, sp
	sub	x8, x29, #232
	str	x8, [x9]
	adrp	x0, l_.str.9@PAGE
	add	x0, x0, l_.str.9@PAGEOFF
	bl	_scanf
	subs	w8, w0, #1
	b.eq	LBB0_5
	b	LBB0_4
LBB0_4:
	adrp	x8, ___stderrp@GOTPAGE
	ldr	x8, [x8, ___stderrp@GOTPAGEOFF]
	ldr	x0, [x8]
	adrp	x1, l_.str.10@PAGE
	add	x1, x1, l_.str.10@PAGEOFF
	bl	_fprintf
	mov	w0, #1
	bl	_exit
LBB0_5:                                 ;   in Loop: Header=BB0_1 Depth=1
	b	LBB0_7
LBB0_6:                                 ;   in Loop: Header=BB0_1 Depth=1
	ldur	w8, [x29, #-248]
	stur	w8, [x29, #-232]
	b	LBB0_7
LBB0_7:                                 ;   in Loop: Header=BB0_1 Depth=1
	ldur	w8, [x29, #-232]
	subs	w8, w8, #1
                                        ; kill: def $x8 killed $w8
	str	x8, [sp, #248]                  ; 8-byte Folded Spill
	subs	x8, x8, #3
	b.hi	LBB0_187
; %bb.8:                                ;   in Loop: Header=BB0_1 Depth=1
	ldr	x11, [sp, #248]                 ; 8-byte Folded Reload
	adrp	x10, lJTI0_0@PAGE
	add	x10, x10, lJTI0_0@PAGEOFF
Ltmp0:
	adr	x8, Ltmp0
	ldrsw	x9, [x10, x11, lsl #2]
	add	x8, x8, x9
	br	x8
LBB0_9:                                 ;   in Loop: Header=BB0_1 Depth=1
	adrp	x0, l_.str.11@PAGE
	add	x0, x0, l_.str.11@PAGEOFF
	str	x0, [sp, #240]                  ; 8-byte Folded Spill
	bl	_printf
	adrp	x0, l_.str.12@PAGE
	add	x0, x0, l_.str.12@PAGEOFF
	bl	_printf
	ldr	x0, [sp, #240]                  ; 8-byte Folded Reload
	bl	_printf
	bl	_rand
	mov	w9, #3
	sdiv	w8, w0, w9
	mul	w8, w8, w9
	subs	w8, w0, w8
	add	w8, w8, #3
	stur	w8, [x29, #-252]
	ldur	w9, [x29, #-252]
                                        ; implicit-def: $x8
	mov	x8, x9
	mov	x9, sp
	str	x8, [x9]
	adrp	x0, l_.str.13@PAGE
	add	x0, x0, l_.str.13@PAGEOFF
	bl	_printf
	mov	w0, #2
	bl	_sleep
	bl	_rand
	mov	w9, #950
	sdiv	w8, w0, w9
	mul	w8, w8, w9
	subs	w8, w0, w8
	add	w8, w8, #600
	scvtf	s0, w8
	str	s0, [sp, #284]
	stur	wzr, [x29, #-236]
	b	LBB0_10
LBB0_10:                                ;   Parent Loop BB0_1 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB0_18 Depth 3
                                        ;       Child Loop BB0_47 Depth 3
	ldur	w8, [x29, #-236]
	ldur	w9, [x29, #-252]
	subs	w8, w8, w9
	b.ge	LBB0_67
	b	LBB0_11
LBB0_11:                                ;   in Loop: Header=BB0_10 Depth=2
	bl	_rand
	mov	w9, #150
	sdiv	w8, w0, w9
	mul	w8, w8, w9
	subs	w8, w0, w8
	add	w8, w8, #90
	stur	w8, [x29, #-216]
	ldr	s0, [sp, #284]
	fmov	s1, #10.00000000
	fsub	s0, s0, s1
	str	s0, [sp, #284]
	adrp	x0, l_.str.14@PAGE
	add	x0, x0, l_.str.14@PAGEOFF
	bl	_printf
	mov	w0, #3
	bl	_sleep
	adrp	x0, l_.str.11@PAGE
	add	x0, x0, l_.str.11@PAGEOFF
	str	x0, [sp, #232]                  ; 8-byte Folded Spill
	bl	_printf
	ldr	s0, [sp, #284]
	fcvt	d0, s0
	mov	x8, sp
	str	d0, [x8]
	adrp	x0, l_.str.15@PAGE
	add	x0, x0, l_.str.15@PAGEOFF
	bl	_printf
	ldr	x0, [sp, #232]                  ; 8-byte Folded Reload
	bl	_printf
	ldur	w9, [x29, #-216]
                                        ; implicit-def: $x8
	mov	x8, x9
	mov	x9, sp
	str	x8, [x9]
	adrp	x0, l_.str.16@PAGE
	add	x0, x0, l_.str.16@PAGEOFF
	bl	_printf
	ldr	x0, [sp, #232]                  ; 8-byte Folded Reload
	bl	_printf
	adrp	x0, l_.str.17@PAGE
	add	x0, x0, l_.str.17@PAGEOFF
	bl	_printf
	ldr	x0, [sp, #232]                  ; 8-byte Folded Reload
	bl	_printf
	mov	w0, #5
	bl	_sleep
	ldur	w8, [x29, #-216]
	subs	w8, w8, #200
	b.le	LBB0_13
	b	LBB0_12
LBB0_12:                                ;   in Loop: Header=BB0_10 Depth=2
	adrp	x0, l_.str.18@PAGE
	add	x0, x0, l_.str.18@PAGEOFF
	bl	_printf
	mov	w0, #3
	bl	_sleep
	b	LBB0_44
LBB0_13:                                ;   in Loop: Header=BB0_10 Depth=2
	bl	_rand
	mov	w9, #2
	sdiv	w8, w0, w9
	mul	w8, w8, w9
	subs	w8, w0, w8
	stur	w8, [x29, #-224]
	ldur	w8, [x29, #-224]
	cbnz	w8, LBB0_37
	b	LBB0_14
LBB0_14:                                ;   in Loop: Header=BB0_10 Depth=2
	adrp	x0, l_.str.19@PAGE
	add	x0, x0, l_.str.19@PAGEOFF
	bl	_printf
	mov	w0, #3
	str	w0, [sp, #228]                  ; 4-byte Folded Spill
	bl	_sleep
	adrp	x0, l_.str.11@PAGE
	add	x0, x0, l_.str.11@PAGEOFF
	str	x0, [sp, #216]                  ; 8-byte Folded Spill
	bl	_printf
	adrp	x0, l_.str.20@PAGE
	add	x0, x0, l_.str.20@PAGEOFF
	bl	_printf
	ldr	x0, [sp, #216]                  ; 8-byte Folded Reload
	bl	_printf
	ldr	w0, [sp, #228]                  ; 4-byte Folded Reload
	bl	_sleep
	ldur	w8, [x29, #-216]
	subs	w8, w8, #100
	b.le	LBB0_30
	b	LBB0_15
LBB0_15:                                ;   in Loop: Header=BB0_10 Depth=2
	ldur	w8, [x29, #-216]
	subs	w8, w8, #200
	b.ge	LBB0_30
	b	LBB0_16
LBB0_16:                                ;   in Loop: Header=BB0_10 Depth=2
	ldr	s0, [sp, #284]
	mov	w8, #1148846080
	fmov	s1, w8
	fcmp	s0, s1
	b.hi	LBB0_30
	b	LBB0_17
LBB0_17:                                ;   in Loop: Header=BB0_10 Depth=2
	adrp	x0, l_.str.21@PAGE
	add	x0, x0, l_.str.21@PAGEOFF
	bl	_printf
	mov	w0, #3
	str	w0, [sp, #212]                  ; 4-byte Folded Spill
	bl	_sleep
	adrp	x0, l_.str.22@PAGE
	add	x0, x0, l_.str.22@PAGEOFF
	bl	_printf
	ldr	w0, [sp, #212]                  ; 4-byte Folded Reload
	bl	_sleep
	adrp	x0, l_.str.23@PAGE
	add	x0, x0, l_.str.23@PAGEOFF
	bl	_printf
	mov	w0, #2
	bl	_sleep
	b	LBB0_18
LBB0_18:                                ;   Parent Loop BB0_1 Depth=1
                                        ;     Parent Loop BB0_10 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	mov	x9, sp
	add	x8, sp, #277
	str	x8, [sp, #200]                  ; 8-byte Folded Spill
	str	x8, [x9]
	adrp	x0, l_.str.24@PAGE
	add	x0, x0, l_.str.24@PAGEOFF
	bl	_scanf
	ldr	x0, [sp, #200]                  ; 8-byte Folded Reload
	add	x1, sp, #274
	mov	w8, #83
	strb	w8, [sp, #274]
	mov	w8, #73
	strb	w8, [sp, #275]
	strb	wzr, [sp, #276]
	bl	_strcmp
	add	w8, w0, #1
	stur	w8, [x29, #-232]
	ldur	w8, [x29, #-232]
	subs	w8, w8, #1
	b.ne	LBB0_23
	b	LBB0_19
LBB0_19:                                ;   in Loop: Header=BB0_18 Depth=3
	ldur	w8, [x29, #-240]
	subs	w8, w8, #2
	b.lt	LBB0_21
	b	LBB0_20
LBB0_20:                                ;   in Loop: Header=BB0_18 Depth=3
	bl	_rand
	ldr	x9, [sp, #256]                  ; 8-byte Folded Reload
	mov	w10, #2
	sdiv	w8, w0, w10
	mul	w8, w8, w10
	subs	w8, w0, w8
	add	w8, w8, #8
	stur	w8, [x29, #-224]
	ldur	w8, [x29, #-224]
	mov	w10, #30
	mul	w8, w8, w10
	stur	w8, [x29, #-212]
	ldur	w8, [x29, #-208]
	ldur	w10, [x29, #-212]
	subs	w8, w8, w10
	stur	w8, [x29, #-208]
	ldur	w8, [x29, #-240]
	ldur	w10, [x29, #-224]
	subs	w8, w8, w10
	stur	w8, [x29, #-240]
	ldr	w8, [x9]
	add	w8, w8, #1
	str	w8, [x9]
	adrp	x0, l_.str.25@PAGE
	add	x0, x0, l_.str.25@PAGEOFF
	bl	_printf
	mov	w0, #3
	str	w0, [sp, #196]                  ; 4-byte Folded Spill
	bl	_sleep
	ldur	w8, [x29, #-224]
                                        ; implicit-def: $x10
	mov	x10, x8
	ldur	w9, [x29, #-240]
                                        ; implicit-def: $x8
	mov	x8, x9
	mov	x9, sp
	str	x10, [x9]
	str	x8, [x9, #8]
	adrp	x0, l_.str.26@PAGE
	add	x0, x0, l_.str.26@PAGEOFF
	bl	_printf
	ldr	w0, [sp, #196]                  ; 4-byte Folded Reload
	bl	_sleep
	ldur	w8, [x29, #-212]
                                        ; implicit-def: $x10
	mov	x10, x8
	ldur	w9, [x29, #-208]
                                        ; implicit-def: $x8
	mov	x8, x9
	mov	x9, sp
	str	x10, [x9]
	str	x8, [x9, #8]
	adrp	x0, l_.str.27@PAGE
	add	x0, x0, l_.str.27@PAGEOFF
	bl	_printf
	b	LBB0_22
LBB0_21:                                ;   in Loop: Header=BB0_18 Depth=3
	adrp	x0, l_.str.28@PAGE
	add	x0, x0, l_.str.28@PAGEOFF
	bl	_printf
	b	LBB0_22
LBB0_22:                                ;   in Loop: Header=BB0_18 Depth=3
	b	LBB0_27
LBB0_23:                                ;   in Loop: Header=BB0_18 Depth=3
	add	x1, sp, #271
	mov	w8, #78
	strb	w8, [sp, #271]
	mov	w8, #79
	strb	w8, [sp, #272]
	strb	wzr, [sp, #273]
	add	x0, sp, #277
	bl	_strcmp
	add	w8, w0, #2
	stur	w8, [x29, #-232]
	ldur	w8, [x29, #-232]
	subs	w8, w8, #2
	b.ne	LBB0_25
	b	LBB0_24
LBB0_24:                                ;   in Loop: Header=BB0_18 Depth=3
	adrp	x0, l_.str.29@PAGE
	add	x0, x0, l_.str.29@PAGEOFF
	bl	_printf
	b	LBB0_26
LBB0_25:                                ;   in Loop: Header=BB0_18 Depth=3
	adrp	x0, l_.str.30@PAGE
	add	x0, x0, l_.str.30@PAGEOFF
	bl	_printf
	mov	w8, #3
	stur	w8, [x29, #-232]
	b	LBB0_26
LBB0_26:                                ;   in Loop: Header=BB0_18 Depth=3
	b	LBB0_27
LBB0_27:                                ;   in Loop: Header=BB0_18 Depth=3
	b	LBB0_28
LBB0_28:                                ;   in Loop: Header=BB0_18 Depth=3
	ldur	w8, [x29, #-232]
	subs	w8, w8, #3
	b.eq	LBB0_18
	b	LBB0_29
LBB0_29:                                ;   in Loop: Header=BB0_10 Depth=2
	b	LBB0_36
LBB0_30:                                ;   in Loop: Header=BB0_10 Depth=2
	adrp	x0, l_.str.31@PAGE
	add	x0, x0, l_.str.31@PAGEOFF
	bl	_printf
	adrp	x0, l_.str.32@PAGE
	add	x0, x0, l_.str.32@PAGEOFF
	bl	_printf
	mov	w0, #5
	str	w0, [sp, #192]                  ; 4-byte Folded Spill
	bl	_sleep
	adrp	x0, l_.str.33@PAGE
	add	x0, x0, l_.str.33@PAGEOFF
	str	x0, [sp, #184]                  ; 8-byte Folded Spill
	bl	_printf
	adrp	x0, l_.str.34@PAGE
	add	x0, x0, l_.str.34@PAGEOFF
	bl	_printf
	ldr	x0, [sp, #184]                  ; 8-byte Folded Reload
	bl	_printf
	ldr	w0, [sp, #192]                  ; 4-byte Folded Reload
	bl	_sleep
	ldur	w8, [x29, #-216]
	subs	w8, w8, #100
	b.le	LBB0_34
	b	LBB0_31
LBB0_31:                                ;   in Loop: Header=BB0_10 Depth=2
	ldur	w8, [x29, #-216]
	subs	w8, w8, #200
	b.ge	LBB0_34
	b	LBB0_32
LBB0_32:                                ;   in Loop: Header=BB0_10 Depth=2
	ldr	s0, [sp, #284]
	mov	w8, #1148846080
	fmov	s1, w8
	fcmp	s0, s1
	b.le	LBB0_34
	b	LBB0_33
LBB0_33:                                ;   in Loop: Header=BB0_10 Depth=2
	adrp	x0, l_.str.35@PAGE
	add	x0, x0, l_.str.35@PAGEOFF
	bl	_printf
	mov	w0, #3
	str	w0, [sp, #180]                  ; 4-byte Folded Spill
	bl	_sleep
	adrp	x0, l_.str.36@PAGE
	add	x0, x0, l_.str.36@PAGEOFF
	bl	_printf
	ldr	w0, [sp, #180]                  ; 4-byte Folded Reload
	bl	_sleep
	b	LBB0_35
LBB0_34:
	adrp	x0, l_.str.37@PAGE
	add	x0, x0, l_.str.37@PAGEOFF
	bl	_printf
	mov	w0, #1
	str	w0, [sp, #164]                  ; 4-byte Folded Spill
	bl	_sleep
	adrp	x0, l_.str.38@PAGE
	add	x0, x0, l_.str.38@PAGEOFF
	bl	_printf
	adrp	x0, l_.str.39@PAGE
	add	x0, x0, l_.str.39@PAGEOFF
	bl	_printf
	ldr	w0, [sp, #164]                  ; 4-byte Folded Reload
	bl	_sleep
	adrp	x0, l_.str.40@PAGE
	add	x0, x0, l_.str.40@PAGEOFF
	bl	_printf
	ldr	w0, [sp, #164]                  ; 4-byte Folded Reload
	bl	_sleep
	adrp	x0, l_.str.41@PAGE
	add	x0, x0, l_.str.41@PAGEOFF
	bl	_printf
	ldr	w0, [sp, #164]                  ; 4-byte Folded Reload
	bl	_sleep
	adrp	x0, l_.str.42@PAGE
	add	x0, x0, l_.str.42@PAGEOFF
	bl	_printf
	mov	w0, #5
	bl	_sleep
	adrp	x0, l_.str.43@PAGE
	add	x0, x0, l_.str.43@PAGEOFF
	bl	_printf
	adrp	x0, l_.str.44@PAGE
	add	x0, x0, l_.str.44@PAGEOFF
	bl	_printf
	mov	w0, #3
	bl	_sleep
	adrp	x0, l_.str.45@PAGE
	add	x0, x0, l_.str.45@PAGEOFF
	bl	_printf
	mov	w0, #2
	bl	_sleep
	adrp	x0, l_.str.11@PAGE
	add	x0, x0, l_.str.11@PAGEOFF
	str	x0, [sp, #168]                  ; 8-byte Folded Spill
	bl	_printf
	adrp	x0, l_.str.46@PAGE
	add	x0, x0, l_.str.46@PAGEOFF
	bl	_printf
	ldr	x0, [sp, #168]                  ; 8-byte Folded Reload
	bl	_printf
	stur	wzr, [x29, #-204]
	b	LBB0_191
LBB0_35:                                ;   in Loop: Header=BB0_10 Depth=2
	b	LBB0_36
LBB0_36:                                ;   in Loop: Header=BB0_10 Depth=2
	b	LBB0_43
LBB0_37:                                ;   in Loop: Header=BB0_10 Depth=2
	adrp	x0, l_.str.47@PAGE
	add	x0, x0, l_.str.47@PAGEOFF
	bl	_printf
	adrp	x0, l_.str.48@PAGE
	add	x0, x0, l_.str.48@PAGEOFF
	bl	_printf
	adrp	x0, l_.str.49@PAGE
	add	x0, x0, l_.str.49@PAGEOFF
	bl	_printf
	mov	w0, #6
	bl	_sleep
	adrp	x0, l_.str.11@PAGE
	add	x0, x0, l_.str.11@PAGEOFF
	str	x0, [sp, #152]                  ; 8-byte Folded Spill
	bl	_printf
	adrp	x0, l_.str.50@PAGE
	add	x0, x0, l_.str.50@PAGEOFF
	bl	_printf
	ldr	x0, [sp, #152]                  ; 8-byte Folded Reload
	bl	_printf
	mov	w0, #5
	bl	_sleep
	ldur	w8, [x29, #-216]
	subs	w8, w8, #100
	b.le	LBB0_41
	b	LBB0_38
LBB0_38:                                ;   in Loop: Header=BB0_10 Depth=2
	ldur	w8, [x29, #-216]
	subs	w8, w8, #200
	b.ge	LBB0_41
	b	LBB0_39
LBB0_39:                                ;   in Loop: Header=BB0_10 Depth=2
	ldr	s0, [sp, #284]
	mov	w8, #1148846080
	fmov	s1, w8
	fcmp	s0, s1
	b.le	LBB0_41
	b	LBB0_40
LBB0_40:                                ;   in Loop: Header=BB0_10 Depth=2
	adrp	x0, l_.str.35@PAGE
	add	x0, x0, l_.str.35@PAGEOFF
	bl	_printf
	mov	w0, #3
	str	w0, [sp, #148]                  ; 4-byte Folded Spill
	bl	_sleep
	adrp	x0, l_.str.36@PAGE
	add	x0, x0, l_.str.36@PAGEOFF
	bl	_printf
	ldr	w0, [sp, #148]                  ; 4-byte Folded Reload
	bl	_sleep
	b	LBB0_42
LBB0_41:
	adrp	x0, l_.str.37@PAGE
	add	x0, x0, l_.str.37@PAGEOFF
	bl	_printf
	mov	w0, #1
	str	w0, [sp, #132]                  ; 4-byte Folded Spill
	bl	_sleep
	adrp	x0, l_.str.38@PAGE
	add	x0, x0, l_.str.38@PAGEOFF
	bl	_printf
	adrp	x0, l_.str.39@PAGE
	add	x0, x0, l_.str.39@PAGEOFF
	bl	_printf
	ldr	w0, [sp, #132]                  ; 4-byte Folded Reload
	bl	_sleep
	adrp	x0, l_.str.40@PAGE
	add	x0, x0, l_.str.40@PAGEOFF
	bl	_printf
	ldr	w0, [sp, #132]                  ; 4-byte Folded Reload
	bl	_sleep
	adrp	x0, l_.str.41@PAGE
	add	x0, x0, l_.str.41@PAGEOFF
	bl	_printf
	ldr	w0, [sp, #132]                  ; 4-byte Folded Reload
	bl	_sleep
	adrp	x0, l_.str.42@PAGE
	add	x0, x0, l_.str.42@PAGEOFF
	bl	_printf
	mov	w0, #4
	bl	_sleep
	adrp	x0, l_.str.51@PAGE
	add	x0, x0, l_.str.51@PAGEOFF
	bl	_printf
	adrp	x0, l_.str.44@PAGE
	add	x0, x0, l_.str.44@PAGEOFF
	bl	_printf
	adrp	x0, l_.str.45@PAGE
	add	x0, x0, l_.str.45@PAGEOFF
	bl	_printf
	mov	w0, #3
	bl	_sleep
	adrp	x0, l_.str.11@PAGE
	add	x0, x0, l_.str.11@PAGEOFF
	str	x0, [sp, #136]                  ; 8-byte Folded Spill
	bl	_printf
	adrp	x0, l_.str.52@PAGE
	add	x0, x0, l_.str.52@PAGEOFF
	bl	_printf
	ldr	x0, [sp, #136]                  ; 8-byte Folded Reload
	bl	_printf
	stur	wzr, [x29, #-204]
	b	LBB0_191
LBB0_42:                                ;   in Loop: Header=BB0_10 Depth=2
	b	LBB0_43
LBB0_43:                                ;   in Loop: Header=BB0_10 Depth=2
	b	LBB0_44
LBB0_44:                                ;   in Loop: Header=BB0_10 Depth=2
	bl	_rand
	mov	w9, #6
	sdiv	w8, w0, w9
	mul	w8, w8, w9
	subs	w8, w0, w8
	stur	w8, [x29, #-224]
	ldur	w8, [x29, #-224]
	subs	w8, w8, #2
	b.gt	LBB0_64
	b	LBB0_45
LBB0_45:                                ;   in Loop: Header=BB0_10 Depth=2
	adrp	x0, l_.str.53@PAGE
	add	x0, x0, l_.str.53@PAGEOFF
	bl	_printf
	mov	w0, #3
	bl	_sleep
	bl	_rand
	mov	w9, #2000
	sdiv	w8, w0, w9
	mul	w8, w8, w9
	subs	w8, w0, w8
	add	w8, w8, #1000
	stur	w8, [x29, #-228]
	ldur	w8, [x29, #-228]
	subs	w8, w8, #2000
	b.gt	LBB0_62
	b	LBB0_46
LBB0_46:                                ;   in Loop: Header=BB0_10 Depth=2
	adrp	x0, l_.str.54@PAGE
	add	x0, x0, l_.str.54@PAGEOFF
	bl	_printf
	adrp	x0, l_.str.55@PAGE
	add	x0, x0, l_.str.55@PAGEOFF
	bl	_printf
	mov	w0, #4
	bl	_sleep
	b	LBB0_47
LBB0_47:                                ;   Parent Loop BB0_1 Depth=1
                                        ;     Parent Loop BB0_10 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	mov	x9, sp
	add	x8, sp, #277
	str	x8, [sp, #120]                  ; 8-byte Folded Spill
	str	x8, [x9]
	adrp	x0, l_.str.24@PAGE
	add	x0, x0, l_.str.24@PAGEOFF
	bl	_scanf
	ldr	x0, [sp, #120]                  ; 8-byte Folded Reload
	add	x1, sp, #274
	mov	w8, #83
	strb	w8, [sp, #274]
	mov	w8, #73
	strb	w8, [sp, #275]
	strb	wzr, [sp, #276]
	bl	_strcmp
	add	w8, w0, #1
	stur	w8, [x29, #-232]
	ldur	w8, [x29, #-232]
	subs	w8, w8, #1
	b.ne	LBB0_55
	b	LBB0_48
LBB0_48:                                ;   in Loop: Header=BB0_47 Depth=3
	adrp	x0, l_.str.56@PAGE
	add	x0, x0, l_.str.56@PAGEOFF
	bl	_printf
	mov	w0, #3
	bl	_sleep
	ldur	w8, [x29, #-224]
	cbnz	w8, LBB0_50
	b	LBB0_49
LBB0_49:                                ;   in Loop: Header=BB0_47 Depth=3
	bl	_rand
	mov	w9, #50
	sdiv	w8, w0, w9
	mul	w8, w8, w9
	subs	w8, w0, w8
	add	w8, w8, #100
	stur	w8, [x29, #-228]
	ldr	s0, [sp, #284]
	ldur	s1, [x29, #-228]
	scvtf	s1, s1
	fadd	s0, s0, s1
	str	s0, [sp, #284]
	ldur	w9, [x29, #-228]
                                        ; implicit-def: $x8
	mov	x8, x9
	mov	x9, sp
	str	x8, [x9]
	adrp	x0, l_.str.57@PAGE
	add	x0, x0, l_.str.57@PAGEOFF
	bl	_printf
	b	LBB0_54
LBB0_50:                                ;   in Loop: Header=BB0_47 Depth=3
	ldur	w8, [x29, #-224]
	subs	w8, w8, #1
	b.ne	LBB0_52
	b	LBB0_51
LBB0_51:                                ;   in Loop: Header=BB0_47 Depth=3
	bl	_rand
	mov	w9, #31
	sdiv	w8, w0, w9
	mul	w8, w8, w9
	subs	w8, w0, w8
	add	w8, w8, #50
	stur	w8, [x29, #-228]
	ldur	w9, [x29, #-228]
                                        ; implicit-def: $x8
	mov	x8, x9
	mov	x9, sp
	str	x8, [x9]
	adrp	x0, l_.str.58@PAGE
	add	x0, x0, l_.str.58@PAGEOFF
	bl	_printf
	b	LBB0_53
LBB0_52:                                ;   in Loop: Header=BB0_47 Depth=3
	bl	_rand
	mov	w9, #41
	sdiv	w8, w0, w9
	mul	w8, w8, w9
	subs	w8, w0, w8
	add	w8, w8, #20
	stur	w8, [x29, #-228]
	ldur	w9, [x29, #-228]
                                        ; implicit-def: $x8
	mov	x8, x9
	mov	x9, sp
	str	x8, [x9]
	adrp	x0, l_.str.59@PAGE
	add	x0, x0, l_.str.59@PAGEOFF
	bl	_printf
	b	LBB0_53
LBB0_53:                                ;   in Loop: Header=BB0_47 Depth=3
	b	LBB0_54
LBB0_54:                                ;   in Loop: Header=BB0_47 Depth=3
	ldur	w8, [x29, #-208]
	subs	w8, w8, #50
	stur	w8, [x29, #-208]
	adrp	x0, l_.str.60@PAGE
	add	x0, x0, l_.str.60@PAGEOFF
	bl	_printf
	b	LBB0_59
LBB0_55:                                ;   in Loop: Header=BB0_47 Depth=3
	add	x1, sp, #271
	mov	w8, #78
	strb	w8, [sp, #271]
	mov	w8, #79
	strb	w8, [sp, #272]
	strb	wzr, [sp, #273]
	add	x0, sp, #277
	bl	_strcmp
	add	w8, w0, #2
	stur	w8, [x29, #-232]
	ldur	w8, [x29, #-232]
	subs	w8, w8, #2
	b.ne	LBB0_57
	b	LBB0_56
LBB0_56:                                ;   in Loop: Header=BB0_47 Depth=3
	adrp	x0, l_.str.61@PAGE
	add	x0, x0, l_.str.61@PAGEOFF
	bl	_printf
	b	LBB0_58
LBB0_57:                                ;   in Loop: Header=BB0_47 Depth=3
	adrp	x0, l_.str.30@PAGE
	add	x0, x0, l_.str.30@PAGEOFF
	bl	_printf
	mov	w8, #3
	stur	w8, [x29, #-232]
	b	LBB0_58
LBB0_58:                                ;   in Loop: Header=BB0_47 Depth=3
	b	LBB0_59
LBB0_59:                                ;   in Loop: Header=BB0_47 Depth=3
	b	LBB0_60
LBB0_60:                                ;   in Loop: Header=BB0_47 Depth=3
	ldur	w8, [x29, #-232]
	subs	w8, w8, #3
	b.eq	LBB0_47
	b	LBB0_61
LBB0_61:                                ;   in Loop: Header=BB0_10 Depth=2
	b	LBB0_63
LBB0_62:                                ;   in Loop: Header=BB0_10 Depth=2
	ldur	w9, [x29, #-228]
                                        ; implicit-def: $x8
	mov	x8, x9
	mov	x9, sp
	str	x8, [x9]
	adrp	x0, l_.str.62@PAGE
	add	x0, x0, l_.str.62@PAGEOFF
	bl	_printf
	b	LBB0_63
LBB0_63:                                ;   in Loop: Header=BB0_10 Depth=2
	b	LBB0_65
LBB0_64:                                ;   in Loop: Header=BB0_10 Depth=2
	adrp	x0, l_.str.63@PAGE
	add	x0, x0, l_.str.63@PAGEOFF
	bl	_printf
	b	LBB0_65
LBB0_65:                                ;   in Loop: Header=BB0_10 Depth=2
	mov	w0, #5
	bl	_sleep
	b	LBB0_66
LBB0_66:                                ;   in Loop: Header=BB0_10 Depth=2
	ldur	w8, [x29, #-236]
	add	w8, w8, #1
	stur	w8, [x29, #-236]
	b	LBB0_10
LBB0_67:                                ;   in Loop: Header=BB0_1 Depth=1
	ldr	x8, [sp, #256]                  ; 8-byte Folded Reload
	ldr	w8, [x8]
	subs	w8, w8, #2
	b.gt	LBB0_69
	b	LBB0_68
LBB0_68:                                ;   in Loop: Header=BB0_1 Depth=1
	ldr	x9, [sp, #256]                  ; 8-byte Folded Reload
	mov	w8, #1
	str	w8, [x9]
	b	LBB0_69
LBB0_69:                                ;   in Loop: Header=BB0_1 Depth=1
	ldur	w8, [x29, #-240]
	mov	w9, #7000
	subs	w8, w8, w9
	b.lt	LBB0_71
	b	LBB0_70
LBB0_70:                                ;   in Loop: Header=BB0_1 Depth=1
	ldr	x9, [sp, #256]                  ; 8-byte Folded Reload
	ldr	w8, [x9, #4]
	add	w8, w8, #1
	str	w8, [x9, #4]
	b	LBB0_71
LBB0_71:                                ;   in Loop: Header=BB0_1 Depth=1
	ldur	w8, [x29, #-208]
	subs	w8, w8, #1000
	b.lt	LBB0_73
	b	LBB0_72
LBB0_72:                                ;   in Loop: Header=BB0_1 Depth=1
	ldr	x9, [sp, #256]                  ; 8-byte Folded Reload
	ldr	w8, [x9, #8]
	add	w8, w8, #1
	str	w8, [x9, #8]
	b	LBB0_73
LBB0_73:                                ;   in Loop: Header=BB0_1 Depth=1
	ldr	x9, [sp, #256]                  ; 8-byte Folded Reload
	ldr	w8, [x9]
	ldr	w10, [x9, #4]
	add	w8, w8, w10
	ldr	w9, [x9, #8]
	add	w8, w8, w9
	subs	w8, w8, #3
	b.ne	LBB0_75
	b	LBB0_74
LBB0_74:                                ;   in Loop: Header=BB0_1 Depth=1
	adrp	x0, l_.str.64@PAGE
	add	x0, x0, l_.str.64@PAGEOFF
	bl	_printf
	ldur	w8, [x29, #-248]
	add	w8, w8, #1
	stur	w8, [x29, #-248]
	stur	wzr, [x29, #-232]
	b	LBB0_76
LBB0_75:                                ;   in Loop: Header=BB0_1 Depth=1
	adrp	x0, l_.str.65@PAGE
	add	x0, x0, l_.str.65@PAGEOFF
	bl	_printf
	b	LBB0_76
LBB0_76:                                ;   in Loop: Header=BB0_1 Depth=1
	mov	w0, #2
	bl	_sleep
	b	LBB0_77
LBB0_77:                                ;   in Loop: Header=BB0_1 Depth=1
	adrp	x0, l_.str.66@PAGE
	add	x0, x0, l_.str.66@PAGEOFF
	bl	_printf
	adrp	x0, l_.str.67@PAGE
	add	x0, x0, l_.str.67@PAGEOFF
	bl	_printf
	adrp	x0, l_.str.68@PAGE
	add	x0, x0, l_.str.68@PAGEOFF
	bl	_printf
	ldur	w8, [x29, #-248]
	subs	w8, w8, #1
	b.eq	LBB0_79
	b	LBB0_78
LBB0_78:                                ;   in Loop: Header=BB0_1 Depth=1
	adrp	x0, l_.str.69@PAGE
	add	x0, x0, l_.str.69@PAGEOFF
	bl	_printf
	b	LBB0_80
LBB0_79:                                ;   in Loop: Header=BB0_1 Depth=1
	mov	w8, #2
	stur	w8, [x29, #-248]
	b	LBB0_80
LBB0_80:                                ;   in Loop: Header=BB0_1 Depth=1
	bl	_rand
	mov	w9, #4
	sdiv	w8, w0, w9
	mul	w8, w8, w9
	subs	w8, w0, w8
	add	w8, w8, #6
	stur	w8, [x29, #-252]
	stur	wzr, [x29, #-256]
	ldur	w9, [x29, #-252]
                                        ; implicit-def: $x8
	mov	x8, x9
	mov	x9, sp
	str	x8, [x9]
	adrp	x0, l_.str.70@PAGE
	add	x0, x0, l_.str.70@PAGEOFF
	bl	_printf
	mov	w0, #2
	bl	_sleep
	stur	wzr, [x29, #-236]
	b	LBB0_81
LBB0_81:                                ;   Parent Loop BB0_1 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB0_89 Depth 3
                                        ;       Child Loop BB0_107 Depth 3
	ldur	w8, [x29, #-236]
	ldur	w9, [x29, #-252]
	subs	w8, w8, w9
	b.ge	LBB0_122
	b	LBB0_82
LBB0_82:                                ;   in Loop: Header=BB0_81 Depth=2
	bl	_rand
	mov	w9, #216
	sdiv	w8, w0, w9
	mul	w8, w8, w9
	subs	w8, w0, w8
	add	w8, w8, #185
	stur	w8, [x29, #-216]
	bl	_rand
	mov	w9, #1001
	sdiv	w8, w0, w9
	mul	w8, w8, w9
	subs	w8, w0, w8
	add	w8, w8, #1500
	scvtf	s0, w8
	str	s0, [sp, #284]
	mov	w0, #2
	str	w0, [sp, #116]                  ; 4-byte Folded Spill
	bl	_sleep
	ldur	w8, [x29, #-236]
	add	w10, w8, #1
	mov	x9, sp
                                        ; implicit-def: $x8
	mov	x8, x10
	str	x8, [x9]
	adrp	x0, l_.str.71@PAGE
	add	x0, x0, l_.str.71@PAGEOFF
	bl	_printf
	ldr	w0, [sp, #116]                  ; 4-byte Folded Reload
	bl	_sleep
	ldr	s0, [sp, #284]
	fcvt	d0, s0
	mov	x8, sp
	str	d0, [x8]
	adrp	x0, l_.str.72@PAGE
	add	x0, x0, l_.str.72@PAGEOFF
	bl	_printf
	ldr	w0, [sp, #116]                  ; 4-byte Folded Reload
	bl	_sleep
	ldur	w9, [x29, #-216]
                                        ; implicit-def: $x8
	mov	x8, x9
	mov	x9, sp
	str	x8, [x9]
	adrp	x0, l_.str.73@PAGE
	add	x0, x0, l_.str.73@PAGEOFF
	bl	_printf
	ldur	w8, [x29, #-216]
	subs	w8, w8, #350
	b.lt	LBB0_84
	b	LBB0_83
LBB0_83:                                ;   in Loop: Header=BB0_81 Depth=2
	ldur	w8, [x29, #-256]
	add	w8, w8, #10
	stur	w8, [x29, #-256]
	adrp	x0, l_.str.74@PAGE
	add	x0, x0, l_.str.74@PAGEOFF
	bl	_printf
	mov	w0, #3
	bl	_sleep
	b	LBB0_105
LBB0_84:                                ;   in Loop: Header=BB0_81 Depth=2
	ldur	w8, [x29, #-216]
	subs	w8, w8, #200
	b.le	LBB0_103
	b	LBB0_85
LBB0_85:                                ;   in Loop: Header=BB0_81 Depth=2
	ldur	w8, [x29, #-216]
	subs	w8, w8, #350
	b.ge	LBB0_103
	b	LBB0_86
LBB0_86:                                ;   in Loop: Header=BB0_81 Depth=2
	ldr	s0, [sp, #284]
	mov	w8, #1157234688
	fmov	s1, w8
	fcmp	s0, s1
	b.le	LBB0_88
	b	LBB0_87
LBB0_87:                                ;   in Loop: Header=BB0_81 Depth=2
	adrp	x0, l_.str.75@PAGE
	add	x0, x0, l_.str.75@PAGEOFF
	bl	_printf
	ldur	w8, [x29, #-256]
	add	w8, w8, #15
	stur	w8, [x29, #-256]
	b	LBB0_102
LBB0_88:                                ;   in Loop: Header=BB0_81 Depth=2
	adrp	x0, l_.str.76@PAGE
	add	x0, x0, l_.str.76@PAGEOFF
	bl	_printf
	adrp	x0, l_.str.77@PAGE
	add	x0, x0, l_.str.77@PAGEOFF
	bl	_printf
	b	LBB0_89
LBB0_89:                                ;   Parent Loop BB0_1 Depth=1
                                        ;     Parent Loop BB0_81 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	mov	x9, sp
	add	x8, sp, #277
	str	x8, [sp, #104]                  ; 8-byte Folded Spill
	str	x8, [x9]
	adrp	x0, l_.str.24@PAGE
	add	x0, x0, l_.str.24@PAGEOFF
	bl	_scanf
	ldr	x0, [sp, #104]                  ; 8-byte Folded Reload
	add	x1, sp, #274
	mov	w8, #83
	strb	w8, [sp, #274]
	mov	w8, #73
	strb	w8, [sp, #275]
	strb	wzr, [sp, #276]
	bl	_strcmp
	add	w8, w0, #1
	stur	w8, [x29, #-232]
	ldur	w8, [x29, #-232]
	subs	w8, w8, #1
	b.ne	LBB0_95
	b	LBB0_90
LBB0_90:                                ;   in Loop: Header=BB0_89 Depth=3
	ldur	w8, [x29, #-240]
	subs	w8, w8, #6
	b.lt	LBB0_93
	b	LBB0_91
LBB0_91:                                ;   in Loop: Header=BB0_89 Depth=3
	ldur	w8, [x29, #-208]
	subs	w8, w8, #80
	b.lt	LBB0_93
	b	LBB0_92
LBB0_92:                                ;   in Loop: Header=BB0_89 Depth=3
	bl	_rand
	mov	x8, x0
	mov	w0, #2
	str	w0, [sp, #100]                  ; 4-byte Folded Spill
	sdiv	w9, w8, w0
	mul	w9, w9, w0
	subs	w8, w8, w9
	add	w8, w8, #8
	stur	w8, [x29, #-224]
	ldur	w8, [x29, #-224]
	mov	w9, #3
	str	w9, [sp, #96]                   ; 4-byte Folded Spill
	mul	w9, w8, w9
	ldur	w8, [x29, #-240]
	subs	w8, w8, w9
	stur	w8, [x29, #-240]
	ldur	w8, [x29, #-224]
	mov	w9, #40
	mul	w8, w8, w9
	stur	w8, [x29, #-212]
	ldur	w9, [x29, #-212]
	ldur	w8, [x29, #-208]
	subs	w8, w8, w9
	stur	w8, [x29, #-208]
	ldur	w8, [x29, #-256]
	add	w8, w8, #20
	stur	w8, [x29, #-256]
	bl	_sleep
	adrp	x0, l_.str.78@PAGE
	add	x0, x0, l_.str.78@PAGEOFF
	bl	_printf
	ldur	w9, [x29, #-224]
                                        ; implicit-def: $x8
	mov	x8, x9
	mov	x9, sp
	str	x8, [x9]
	adrp	x0, l_.str.79@PAGE
	add	x0, x0, l_.str.79@PAGEOFF
	bl	_printf
	ldr	w9, [sp, #96]                   ; 4-byte Folded Reload
	ldur	w8, [x29, #-224]
	mul	w11, w8, w9
	ldur	w9, [x29, #-212]
                                        ; implicit-def: $x8
	mov	x8, x9
	mov	x9, sp
                                        ; implicit-def: $x10
	mov	x10, x11
	str	x10, [x9]
	str	x8, [x9, #8]
	adrp	x0, l_.str.80@PAGE
	add	x0, x0, l_.str.80@PAGEOFF
	bl	_printf
	ldur	w8, [x29, #-208]
                                        ; implicit-def: $x10
	mov	x10, x8
	ldur	w9, [x29, #-240]
                                        ; implicit-def: $x8
	mov	x8, x9
	mov	x9, sp
	str	x10, [x9]
	str	x8, [x9, #8]
	adrp	x0, l_.str.81@PAGE
	add	x0, x0, l_.str.81@PAGEOFF
	bl	_printf
	ldr	w0, [sp, #100]                  ; 4-byte Folded Reload
	bl	_sleep
	b	LBB0_94
LBB0_93:                                ;   in Loop: Header=BB0_89 Depth=3
	adrp	x0, l_.str.82@PAGE
	add	x0, x0, l_.str.82@PAGEOFF
	bl	_printf
	b	LBB0_94
LBB0_94:                                ;   in Loop: Header=BB0_89 Depth=3
	b	LBB0_99
LBB0_95:                                ;   in Loop: Header=BB0_89 Depth=3
	add	x1, sp, #271
	mov	w8, #78
	strb	w8, [sp, #271]
	mov	w8, #79
	strb	w8, [sp, #272]
	strb	wzr, [sp, #273]
	add	x0, sp, #277
	bl	_strcmp
	add	w8, w0, #2
	stur	w8, [x29, #-232]
	ldur	w8, [x29, #-232]
	subs	w8, w8, #2
	b.ne	LBB0_97
	b	LBB0_96
LBB0_96:                                ;   in Loop: Header=BB0_89 Depth=3
	adrp	x0, l_.str.83@PAGE
	add	x0, x0, l_.str.83@PAGEOFF
	bl	_printf
	b	LBB0_98
LBB0_97:                                ;   in Loop: Header=BB0_89 Depth=3
	adrp	x0, l_.str.30@PAGE
	add	x0, x0, l_.str.30@PAGEOFF
	bl	_printf
	mov	w8, #3
	stur	w8, [x29, #-232]
	b	LBB0_98
LBB0_98:                                ;   in Loop: Header=BB0_89 Depth=3
	b	LBB0_99
LBB0_99:                                ;   in Loop: Header=BB0_89 Depth=3
	b	LBB0_100
LBB0_100:                               ;   in Loop: Header=BB0_89 Depth=3
	ldur	w8, [x29, #-232]
	subs	w8, w8, #3
	b.eq	LBB0_89
	b	LBB0_101
LBB0_101:                               ;   in Loop: Header=BB0_81 Depth=2
	b	LBB0_102
LBB0_102:                               ;   in Loop: Header=BB0_81 Depth=2
	b	LBB0_104
LBB0_103:
	mov	w0, #2
	bl	_sleep
	adrp	x0, l_.str.84@PAGE
	add	x0, x0, l_.str.84@PAGEOFF
	bl	_printf
	adrp	x0, l_.str.39@PAGE
	add	x0, x0, l_.str.39@PAGEOFF
	bl	_printf
	mov	w0, #1
	str	w0, [sp, #92]                   ; 4-byte Folded Spill
	bl	_sleep
	adrp	x0, l_.str.40@PAGE
	add	x0, x0, l_.str.40@PAGEOFF
	bl	_printf
	ldr	w0, [sp, #92]                   ; 4-byte Folded Reload
	bl	_sleep
	adrp	x0, l_.str.41@PAGE
	add	x0, x0, l_.str.41@PAGEOFF
	bl	_printf
	ldr	w0, [sp, #92]                   ; 4-byte Folded Reload
	bl	_sleep
	adrp	x0, l_.str.42@PAGE
	add	x0, x0, l_.str.42@PAGEOFF
	bl	_printf
	mov	w0, #4
	bl	_sleep
	adrp	x0, l_.str.51@PAGE
	add	x0, x0, l_.str.51@PAGEOFF
	bl	_printf
	adrp	x0, l_.str.85@PAGE
	add	x0, x0, l_.str.85@PAGEOFF
	bl	_printf
	stur	wzr, [x29, #-204]
	b	LBB0_191
LBB0_104:                               ;   in Loop: Header=BB0_81 Depth=2
	b	LBB0_105
LBB0_105:                               ;   in Loop: Header=BB0_81 Depth=2
	ldur	w8, [x29, #-236]
	mov	w10, #4
	sdiv	w9, w8, w10
	mul	w9, w9, w10
	subs	w8, w8, w9
	cbnz	w8, LBB0_120
	b	LBB0_106
LBB0_106:                               ;   in Loop: Header=BB0_81 Depth=2
	mov	w0, #1
	bl	_sleep
	adrp	x0, l_.str.86@PAGE
	add	x0, x0, l_.str.86@PAGEOFF
	bl	_printf
	bl	_rand
	mov	w9, #3501
	sdiv	w8, w0, w9
	mul	w8, w8, w9
	subs	w8, w0, w8
	scvtf	s0, w8
	str	s0, [sp, #280]
	ldr	s0, [sp, #280]
	mov	w8, #1148846080
	fmov	s1, w8
	fdiv	s0, s0, s1
	str	s0, [sp, #280]
	adrp	x0, l_.str.87@PAGE
	add	x0, x0, l_.str.87@PAGEOFF
	bl	_printf
	b	LBB0_107
LBB0_107:                               ;   Parent Loop BB0_1 Depth=1
                                        ;     Parent Loop BB0_81 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	mov	x9, sp
	add	x8, sp, #277
	str	x8, [sp, #80]                   ; 8-byte Folded Spill
	str	x8, [x9]
	adrp	x0, l_.str.24@PAGE
	add	x0, x0, l_.str.24@PAGEOFF
	bl	_scanf
	ldr	x0, [sp, #80]                   ; 8-byte Folded Reload
	add	x1, sp, #274
	mov	w8, #83
	strb	w8, [sp, #274]
	mov	w8, #73
	strb	w8, [sp, #275]
	strb	wzr, [sp, #276]
	bl	_strcmp
	add	w8, w0, #1
	stur	w8, [x29, #-232]
	ldur	w8, [x29, #-232]
	subs	w8, w8, #1
	b.ne	LBB0_113
	b	LBB0_108
LBB0_108:                               ;   in Loop: Header=BB0_107 Depth=3
	ldr	s0, [sp, #280]
	fcmp	s0, #0.0
	b.lt	LBB0_111
	b	LBB0_109
LBB0_109:                               ;   in Loop: Header=BB0_107 Depth=3
	ldr	s0, [sp, #280]
	fcvt	d0, s0
	fmov	d1, #2.50000000
	fcmp	d0, d1
	b.hi	LBB0_111
	b	LBB0_110
LBB0_110:                               ;   in Loop: Header=BB0_107 Depth=3
	mov	w0, #1
	bl	_sleep
	adrp	x0, l_.str.88@PAGE
	add	x0, x0, l_.str.88@PAGEOFF
	bl	_printf
	ldur	w8, [x29, #-208]
	subs	w8, w8, #60
	stur	w8, [x29, #-208]
	ldur	w8, [x29, #-240]
	add	w8, w8, #10
	stur	w8, [x29, #-240]
	ldur	w8, [x29, #-256]
	add	w8, w8, #5
	stur	w8, [x29, #-256]
	b	LBB0_112
LBB0_111:                               ;   in Loop: Header=BB0_107 Depth=3
	mov	w0, #1
	bl	_sleep
	ldr	s0, [sp, #280]
	fcvt	d0, s0
	mov	x8, sp
	str	d0, [x8]
	adrp	x0, l_.str.89@PAGE
	add	x0, x0, l_.str.89@PAGEOFF
	bl	_printf
	b	LBB0_112
LBB0_112:                               ;   in Loop: Header=BB0_107 Depth=3
	b	LBB0_117
LBB0_113:                               ;   in Loop: Header=BB0_107 Depth=3
	add	x1, sp, #271
	mov	w8, #78
	strb	w8, [sp, #271]
	mov	w8, #79
	strb	w8, [sp, #272]
	strb	wzr, [sp, #273]
	add	x0, sp, #277
	bl	_strcmp
	add	w8, w0, #2
	stur	w8, [x29, #-232]
	ldur	w8, [x29, #-232]
	subs	w8, w8, #2
	b.ne	LBB0_115
	b	LBB0_114
LBB0_114:                               ;   in Loop: Header=BB0_107 Depth=3
	adrp	x0, l_.str.90@PAGE
	add	x0, x0, l_.str.90@PAGEOFF
	bl	_printf
	b	LBB0_116
LBB0_115:                               ;   in Loop: Header=BB0_107 Depth=3
	adrp	x0, l_.str.30@PAGE
	add	x0, x0, l_.str.30@PAGEOFF
	bl	_printf
	mov	w8, #3
	stur	w8, [x29, #-232]
	b	LBB0_116
LBB0_116:                               ;   in Loop: Header=BB0_107 Depth=3
	b	LBB0_117
LBB0_117:                               ;   in Loop: Header=BB0_107 Depth=3
	b	LBB0_118
LBB0_118:                               ;   in Loop: Header=BB0_107 Depth=3
	ldur	w8, [x29, #-232]
	subs	w8, w8, #3
	b.eq	LBB0_107
	b	LBB0_119
LBB0_119:                               ;   in Loop: Header=BB0_81 Depth=2
	b	LBB0_120
LBB0_120:                               ;   in Loop: Header=BB0_81 Depth=2
	b	LBB0_121
LBB0_121:                               ;   in Loop: Header=BB0_81 Depth=2
	ldur	w8, [x29, #-236]
	add	w8, w8, #1
	stur	w8, [x29, #-236]
	b	LBB0_81
LBB0_122:                               ;   in Loop: Header=BB0_1 Depth=1
	mov	w0, #2
	bl	_sleep
	ldur	w9, [x29, #-208]
                                        ; implicit-def: $x8
	mov	x8, x9
	mov	x9, sp
	str	x8, [x9]
	adrp	x0, l_.str.91@PAGE
	add	x0, x0, l_.str.91@PAGEOFF
	bl	_printf
	ldur	w9, [x29, #-240]
                                        ; implicit-def: $x8
	mov	x8, x9
	mov	x9, sp
	str	x8, [x9]
	adrp	x0, l_.str.92@PAGE
	add	x0, x0, l_.str.92@PAGEOFF
	bl	_printf
	ldur	w9, [x29, #-256]
                                        ; implicit-def: $x8
	mov	x8, x9
	mov	x9, sp
	str	x8, [x9]
	adrp	x0, l_.str.93@PAGE
	add	x0, x0, l_.str.93@PAGEOFF
	bl	_printf
	ldur	w8, [x29, #-240]
	mov	w9, #5000
	subs	w8, w8, w9
	b.lt	LBB0_126
	b	LBB0_123
LBB0_123:                               ;   in Loop: Header=BB0_1 Depth=1
	ldur	w8, [x29, #-208]
	subs	w8, w8, #700
	b.lt	LBB0_126
	b	LBB0_124
LBB0_124:                               ;   in Loop: Header=BB0_1 Depth=1
	ldur	w8, [x29, #-256]
	subs	w8, w8, #100
	b.lt	LBB0_126
	b	LBB0_125
LBB0_125:                               ;   in Loop: Header=BB0_1 Depth=1
	adrp	x0, l_.str.94@PAGE
	add	x0, x0, l_.str.94@PAGEOFF
	bl	_printf
	mov	w0, #2
	bl	_sleep
	ldur	w8, [x29, #-248]
	add	w8, w8, #1
	stur	w8, [x29, #-248]
	stur	wzr, [x29, #-232]
	b	LBB0_127
LBB0_126:                               ;   in Loop: Header=BB0_1 Depth=1
	adrp	x0, l_.str.95@PAGE
	add	x0, x0, l_.str.95@PAGEOFF
	bl	_printf
	adrp	x0, l_.str.96@PAGE
	add	x0, x0, l_.str.96@PAGEOFF
	bl	_printf
	b	LBB0_127
LBB0_127:                               ;   in Loop: Header=BB0_1 Depth=1
	b	LBB0_188
LBB0_128:                               ;   in Loop: Header=BB0_1 Depth=1
	mov	w0, #2
	bl	_sleep
	adrp	x0, l_.str.97@PAGE
	add	x0, x0, l_.str.97@PAGEOFF
	bl	_printf
	adrp	x0, l_.str.98@PAGE
	add	x0, x0, l_.str.98@PAGEOFF
	bl	_printf
	adrp	x0, l_.str.68@PAGE
	add	x0, x0, l_.str.68@PAGEOFF
	bl	_printf
	bl	_rand
	mov	w9, #4
	sdiv	w8, w0, w9
	mul	w8, w8, w9
	subs	w8, w0, w8
	add	w8, w8, #10
	stur	w8, [x29, #-252]
	str	wzr, [sp, #300]
	b	LBB0_129
LBB0_129:                               ;   Parent Loop BB0_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	w8, [sp, #300]
	ldur	w9, [x29, #-252]
	subs	w8, w8, w9
	b.ge	LBB0_132
	b	LBB0_130
LBB0_130:                               ;   in Loop: Header=BB0_129 Depth=2
	bl	_rand
	mov	w9, #1500
	sdiv	w8, w0, w9
	mul	w8, w8, w9
	subs	w8, w0, w8
	add	w8, w8, #2500
	scvtf	s0, w8
	ldrsw	x9, [sp, #300]
	sub	x8, x29, #200
	str	s0, [x8, x9, lsl #2]
	bl	_rand
	mov	w9, #221
	sdiv	w8, w0, w9
	mul	w8, w8, w9
	subs	w8, w0, w8
	add	w8, w8, #330
	ldrsw	x10, [sp, #300]
	sub	x9, x29, #104
	str	w8, [x9, x10, lsl #2]
	b	LBB0_131
LBB0_131:                               ;   in Loop: Header=BB0_129 Depth=2
	ldr	w8, [sp, #300]
	add	w8, w8, #1
	str	w8, [sp, #300]
	b	LBB0_129
LBB0_132:                               ;   in Loop: Header=BB0_1 Depth=1
	ldur	w9, [x29, #-252]
                                        ; implicit-def: $x8
	mov	x8, x9
	mov	x9, sp
	str	x8, [x9]
	adrp	x0, l_.str.99@PAGE
	add	x0, x0, l_.str.99@PAGEOFF
	bl	_printf
	str	wzr, [sp, #300]
	b	LBB0_133
LBB0_133:                               ;   Parent Loop BB0_1 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB0_149 Depth 3
                                        ;       Child Loop BB0_165 Depth 3
	ldr	w8, [sp, #300]
	ldur	w9, [x29, #-252]
	subs	w8, w8, w9
	b.ge	LBB0_180
	b	LBB0_134
LBB0_134:                               ;   in Loop: Header=BB0_133 Depth=2
	ldrsw	x9, [sp, #300]
	sub	x8, x29, #104
	ldr	w8, [x8, x9, lsl #2]
	subs	w8, w8, #500
	b.lt	LBB0_136
	b	LBB0_135
LBB0_135:                               ;   in Loop: Header=BB0_133 Depth=2
	mov	w8, #49
	str	w8, [sp, #288]
	b	LBB0_144
LBB0_136:                               ;   in Loop: Header=BB0_133 Depth=2
	ldrsw	x9, [sp, #300]
	sub	x8, x29, #104
	ldr	w8, [x8, x9, lsl #2]
	subs	w8, w8, #350
	b.le	LBB0_142
	b	LBB0_137
LBB0_137:                               ;   in Loop: Header=BB0_133 Depth=2
	ldrsw	x9, [sp, #300]
	sub	x8, x29, #104
	ldr	w8, [x8, x9, lsl #2]
	subs	w8, w8, #500
	b.ge	LBB0_142
	b	LBB0_138
LBB0_138:                               ;   in Loop: Header=BB0_133 Depth=2
	ldrsw	x9, [sp, #300]
	sub	x8, x29, #200
	ldr	s0, [x8, x9, lsl #2]
	mov	w8, #32768
	movk	w8, #17723, lsl #16
	fmov	s1, w8
	fcmp	s0, s1
	b.le	LBB0_140
	b	LBB0_139
LBB0_139:                               ;   in Loop: Header=BB0_133 Depth=2
	mov	w8, #50
	str	w8, [sp, #288]
	b	LBB0_141
LBB0_140:                               ;   in Loop: Header=BB0_133 Depth=2
	mov	w8, #51
	str	w8, [sp, #288]
	b	LBB0_141
LBB0_141:                               ;   in Loop: Header=BB0_133 Depth=2
	b	LBB0_143
LBB0_142:                               ;   in Loop: Header=BB0_133 Depth=2
	mov	w8, #52
	str	w8, [sp, #288]
	b	LBB0_143
LBB0_143:                               ;   in Loop: Header=BB0_133 Depth=2
	b	LBB0_144
LBB0_144:                               ;   in Loop: Header=BB0_133 Depth=2
	mov	w0, #2
	bl	_sleep
	ldr	w8, [sp, #300]
	add	w10, w8, #1
	mov	x9, sp
                                        ; implicit-def: $x8
	mov	x8, x10
	str	x8, [x9]
	adrp	x0, l_.str.100@PAGE
	add	x0, x0, l_.str.100@PAGEOFF
	bl	_printf
	mov	w0, #3
	bl	_sleep
	ldr	w8, [sp, #288]
	subs	w8, w8, #49
                                        ; kill: def $x8 killed $w8
	str	x8, [sp, #72]                   ; 8-byte Folded Spill
	subs	x8, x8, #3
	b.hi	LBB0_163
; %bb.145:                              ;   in Loop: Header=BB0_133 Depth=2
	ldr	x11, [sp, #72]                  ; 8-byte Folded Reload
	adrp	x10, lJTI0_1@PAGE
	add	x10, x10, lJTI0_1@PAGEOFF
Ltmp1:
	adr	x8, Ltmp1
	ldrsw	x9, [x10, x11, lsl #2]
	add	x8, x8, x9
	br	x8
LBB0_146:                               ;   in Loop: Header=BB0_133 Depth=2
	ldr	w8, [sp, #300]
	add	w11, w8, #1
	ldrsw	x9, [sp, #300]
	sub	x8, x29, #104
	ldr	w9, [x8, x9, lsl #2]
                                        ; implicit-def: $x8
	mov	x8, x9
	mov	x9, sp
                                        ; implicit-def: $x10
	mov	x10, x11
	str	x10, [x9]
	str	x8, [x9, #8]
	adrp	x0, l_.str.101@PAGE
	add	x0, x0, l_.str.101@PAGEOFF
	bl	_printf
	b	LBB0_163
LBB0_147:                               ;   in Loop: Header=BB0_133 Depth=2
	ldr	w8, [sp, #300]
	add	w11, w8, #1
	ldrsw	x9, [sp, #300]
	sub	x8, x29, #104
	ldr	w8, [x8, x9, lsl #2]
                                        ; implicit-def: $x9
	mov	x9, x8
	ldrsw	x10, [sp, #300]
	sub	x8, x29, #200
	ldr	s0, [x8, x10, lsl #2]
	fcvt	d0, s0
	mov	x8, sp
                                        ; implicit-def: $x10
	mov	x10, x11
	str	x10, [x8]
	str	x9, [x8, #8]
	str	d0, [x8, #16]
	adrp	x0, l_.str.102@PAGE
	add	x0, x0, l_.str.102@PAGEOFF
	bl	_printf
	b	LBB0_163
LBB0_148:                               ;   in Loop: Header=BB0_133 Depth=2
	ldrsw	x9, [sp, #300]
	sub	x8, x29, #104
	ldr	w8, [x8, x9, lsl #2]
                                        ; implicit-def: $x9
	mov	x9, x8
	ldrsw	x10, [sp, #300]
	sub	x8, x29, #200
	ldr	s0, [x8, x10, lsl #2]
	fcvt	d0, s0
	mov	x8, sp
	str	x9, [x8]
	str	d0, [x8, #8]
	adrp	x0, l_.str.103@PAGE
	add	x0, x0, l_.str.103@PAGEOFF
	bl	_printf
	adrp	x0, l_.str.77@PAGE
	add	x0, x0, l_.str.77@PAGEOFF
	bl	_printf
	b	LBB0_149
LBB0_149:                               ;   Parent Loop BB0_1 Depth=1
                                        ;     Parent Loop BB0_133 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	mov	x9, sp
	add	x8, sp, #277
	str	x8, [sp, #64]                   ; 8-byte Folded Spill
	str	x8, [x9]
	adrp	x0, l_.str.24@PAGE
	add	x0, x0, l_.str.24@PAGEOFF
	bl	_scanf
	ldr	x0, [sp, #64]                   ; 8-byte Folded Reload
	add	x1, sp, #274
	mov	w8, #83
	strb	w8, [sp, #274]
	mov	w8, #73
	strb	w8, [sp, #275]
	strb	wzr, [sp, #276]
	bl	_strcmp
	add	w8, w0, #1
	stur	w8, [x29, #-232]
	ldur	w8, [x29, #-232]
	subs	w8, w8, #1
	b.ne	LBB0_155
	b	LBB0_150
LBB0_150:                               ;   in Loop: Header=BB0_149 Depth=3
	adrp	x0, l_.str.104@PAGE
	add	x0, x0, l_.str.104@PAGEOFF
	bl	_printf
	mov	w0, #2
	bl	_sleep
	ldur	w8, [x29, #-240]
	subs	w8, w8, #25
	b.lt	LBB0_153
	b	LBB0_151
LBB0_151:                               ;   in Loop: Header=BB0_149 Depth=3
	ldur	w8, [x29, #-208]
	subs	w8, w8, #250
	b.lt	LBB0_153
	b	LBB0_152
LBB0_152:                               ;   in Loop: Header=BB0_149 Depth=3
	bl	_rand
	mov	w9, #5
	str	w9, [sp, #56]                   ; 4-byte Folded Spill
	sdiv	w8, w0, w9
	mul	w8, w8, w9
	subs	w8, w0, w8
	add	w8, w8, #5
	stur	w8, [x29, #-224]
	ldur	w8, [x29, #-224]
	mul	w9, w8, w9
	ldur	w8, [x29, #-240]
	subs	w8, w8, w9
	stur	w8, [x29, #-240]
	ldur	w8, [x29, #-224]
	mov	w9, #50
	mul	w8, w8, w9
	stur	w8, [x29, #-212]
	ldur	w9, [x29, #-212]
	ldur	w8, [x29, #-208]
	subs	w8, w8, w9
	stur	w8, [x29, #-208]
	ldr	w8, [sp, #292]
	mov	w9, #1
	str	w9, [sp, #60]                   ; 4-byte Folded Spill
	add	w8, w8, #1
	str	w8, [sp, #292]
	adrp	x0, l_.str.105@PAGE
	add	x0, x0, l_.str.105@PAGEOFF
	bl	_printf
	ldur	w9, [x29, #-224]
                                        ; implicit-def: $x8
	mov	x8, x9
	mov	x9, sp
	str	x8, [x9]
	adrp	x0, l_.str.79@PAGE
	add	x0, x0, l_.str.79@PAGEOFF
	bl	_printf
	ldr	w0, [sp, #60]                   ; 4-byte Folded Reload
	bl	_sleep
	ldr	w9, [sp, #56]                   ; 4-byte Folded Reload
	ldur	w8, [x29, #-224]
	mul	w11, w8, w9
	ldur	w9, [x29, #-212]
                                        ; implicit-def: $x8
	mov	x8, x9
	mov	x9, sp
                                        ; implicit-def: $x10
	mov	x10, x11
	str	x10, [x9]
	str	x8, [x9, #8]
	adrp	x0, l_.str.106@PAGE
	add	x0, x0, l_.str.106@PAGEOFF
	bl	_printf
	ldr	w0, [sp, #60]                   ; 4-byte Folded Reload
	bl	_sleep
	ldur	w8, [x29, #-240]
                                        ; implicit-def: $x10
	mov	x10, x8
	ldur	w9, [x29, #-208]
                                        ; implicit-def: $x8
	mov	x8, x9
	mov	x9, sp
	str	x10, [x9]
	str	x8, [x9, #8]
	adrp	x0, l_.str.107@PAGE
	add	x0, x0, l_.str.107@PAGEOFF
	bl	_printf
	b	LBB0_154
LBB0_153:                               ;   in Loop: Header=BB0_149 Depth=3
	adrp	x0, l_.str.108@PAGE
	add	x0, x0, l_.str.108@PAGEOFF
	bl	_printf
	b	LBB0_154
LBB0_154:                               ;   in Loop: Header=BB0_149 Depth=3
	b	LBB0_159
LBB0_155:                               ;   in Loop: Header=BB0_149 Depth=3
	add	x1, sp, #271
	mov	w8, #78
	strb	w8, [sp, #271]
	mov	w8, #79
	strb	w8, [sp, #272]
	strb	wzr, [sp, #273]
	add	x0, sp, #277
	bl	_strcmp
	add	w8, w0, #2
	stur	w8, [x29, #-232]
	ldur	w8, [x29, #-232]
	subs	w8, w8, #2
	b.ne	LBB0_157
	b	LBB0_156
LBB0_156:                               ;   in Loop: Header=BB0_149 Depth=3
	adrp	x0, l_.str.109@PAGE
	add	x0, x0, l_.str.109@PAGEOFF
	bl	_printf
	b	LBB0_158
LBB0_157:                               ;   in Loop: Header=BB0_149 Depth=3
	adrp	x0, l_.str.30@PAGE
	add	x0, x0, l_.str.30@PAGEOFF
	bl	_printf
	mov	w8, #3
	stur	w8, [x29, #-232]
	b	LBB0_158
LBB0_158:                               ;   in Loop: Header=BB0_149 Depth=3
	b	LBB0_159
LBB0_159:                               ;   in Loop: Header=BB0_149 Depth=3
	b	LBB0_160
LBB0_160:                               ;   in Loop: Header=BB0_149 Depth=3
	ldur	w8, [x29, #-232]
	subs	w8, w8, #3
	b.eq	LBB0_149
	b	LBB0_161
LBB0_161:                               ;   in Loop: Header=BB0_133 Depth=2
	b	LBB0_163
LBB0_162:
	ldrsw	x9, [sp, #300]
	sub	x8, x29, #104
	ldr	w9, [x8, x9, lsl #2]
                                        ; implicit-def: $x8
	mov	x8, x9
	mov	x9, sp
	str	x8, [x9]
	adrp	x0, l_.str.110@PAGE
	add	x0, x0, l_.str.110@PAGEOFF
	bl	_printf
	mov	w0, #2
	bl	_sleep
	adrp	x0, l_.str.111@PAGE
	add	x0, x0, l_.str.111@PAGEOFF
	bl	_printf
	adrp	x0, l_.str.39@PAGE
	add	x0, x0, l_.str.39@PAGEOFF
	bl	_printf
	mov	w0, #1
	str	w0, [sp, #52]                   ; 4-byte Folded Spill
	bl	_sleep
	adrp	x0, l_.str.40@PAGE
	add	x0, x0, l_.str.40@PAGEOFF
	bl	_printf
	ldr	w0, [sp, #52]                   ; 4-byte Folded Reload
	bl	_sleep
	adrp	x0, l_.str.41@PAGE
	add	x0, x0, l_.str.41@PAGEOFF
	bl	_printf
	ldr	w0, [sp, #52]                   ; 4-byte Folded Reload
	bl	_sleep
	adrp	x0, l_.str.42@PAGE
	add	x0, x0, l_.str.42@PAGEOFF
	bl	_printf
	mov	w0, #4
	bl	_sleep
	adrp	x0, l_.str.51@PAGE
	add	x0, x0, l_.str.51@PAGEOFF
	bl	_printf
	adrp	x0, l_.str.85@PAGE
	add	x0, x0, l_.str.85@PAGEOFF
	bl	_printf
	stur	wzr, [x29, #-204]
	b	LBB0_191
LBB0_163:                               ;   in Loop: Header=BB0_133 Depth=2
	ldr	w8, [sp, #300]
	mov	w10, #4
	sdiv	w9, w8, w10
	mul	w9, w9, w10
	subs	w8, w8, w9
	cbnz	w8, LBB0_178
	b	LBB0_164
LBB0_164:                               ;   in Loop: Header=BB0_133 Depth=2
	adrp	x0, l_.str.112@PAGE
	add	x0, x0, l_.str.112@PAGEOFF
	bl	_printf
	adrp	x0, l_.str.77@PAGE
	add	x0, x0, l_.str.77@PAGEOFF
	bl	_printf
	b	LBB0_165
LBB0_165:                               ;   Parent Loop BB0_1 Depth=1
                                        ;     Parent Loop BB0_133 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	mov	x9, sp
	add	x8, sp, #277
	str	x8, [sp, #40]                   ; 8-byte Folded Spill
	str	x8, [x9]
	adrp	x0, l_.str.24@PAGE
	add	x0, x0, l_.str.24@PAGEOFF
	bl	_scanf
	ldr	x0, [sp, #40]                   ; 8-byte Folded Reload
	add	x1, sp, #274
	mov	w8, #83
	strb	w8, [sp, #274]
	mov	w8, #73
	strb	w8, [sp, #275]
	strb	wzr, [sp, #276]
	bl	_strcmp
	add	w8, w0, #1
	stur	w8, [x29, #-232]
	ldur	w8, [x29, #-232]
	subs	w8, w8, #1
	b.ne	LBB0_171
	b	LBB0_166
LBB0_166:                               ;   in Loop: Header=BB0_165 Depth=3
	bl	_rand
	mov	w9, #5
	sdiv	w8, w0, w9
	mul	w8, w8, w9
	subs	w8, w0, w8
	stur	w8, [x29, #-220]
	ldur	w8, [x29, #-220]
	tbnz	w8, #31, LBB0_169
	b	LBB0_167
LBB0_167:                               ;   in Loop: Header=BB0_165 Depth=3
	ldur	w8, [x29, #-220]
	subs	w8, w8, #3
	b.gt	LBB0_169
	b	LBB0_168
LBB0_168:                               ;   in Loop: Header=BB0_165 Depth=3
	adrp	x0, l_.str.113@PAGE
	add	x0, x0, l_.str.113@PAGEOFF
	bl	_printf
	ldur	w8, [x29, #-208]
	subs	w8, w8, #70
	stur	w8, [x29, #-208]
	ldur	w8, [x29, #-240]
	add	w8, w8, #15
	stur	w8, [x29, #-240]
	b	LBB0_170
LBB0_169:                               ;   in Loop: Header=BB0_165 Depth=3
	ldur	w9, [x29, #-220]
                                        ; implicit-def: $x8
	mov	x8, x9
	mov	x9, sp
	str	x8, [x9]
	adrp	x0, l_.str.114@PAGE
	add	x0, x0, l_.str.114@PAGEOFF
	bl	_printf
	b	LBB0_170
LBB0_170:                               ;   in Loop: Header=BB0_165 Depth=3
	b	LBB0_175
LBB0_171:                               ;   in Loop: Header=BB0_165 Depth=3
	add	x1, sp, #271
	mov	w8, #78
	strb	w8, [sp, #271]
	mov	w8, #79
	strb	w8, [sp, #272]
	strb	wzr, [sp, #273]
	add	x0, sp, #277
	bl	_strcmp
	add	w8, w0, #2
	stur	w8, [x29, #-232]
	ldur	w8, [x29, #-232]
	subs	w8, w8, #2
	b.ne	LBB0_173
	b	LBB0_172
LBB0_172:                               ;   in Loop: Header=BB0_165 Depth=3
	adrp	x0, l_.str.115@PAGE
	add	x0, x0, l_.str.115@PAGEOFF
	bl	_printf
	b	LBB0_174
LBB0_173:                               ;   in Loop: Header=BB0_165 Depth=3
	adrp	x0, l_.str.30@PAGE
	add	x0, x0, l_.str.30@PAGEOFF
	bl	_printf
	mov	w8, #3
	stur	w8, [x29, #-232]
	b	LBB0_174
LBB0_174:                               ;   in Loop: Header=BB0_165 Depth=3
	b	LBB0_175
LBB0_175:                               ;   in Loop: Header=BB0_165 Depth=3
	b	LBB0_176
LBB0_176:                               ;   in Loop: Header=BB0_165 Depth=3
	ldur	w8, [x29, #-232]
	subs	w8, w8, #3
	b.eq	LBB0_165
	b	LBB0_177
LBB0_177:                               ;   in Loop: Header=BB0_133 Depth=2
	b	LBB0_178
LBB0_178:                               ;   in Loop: Header=BB0_133 Depth=2
	b	LBB0_179
LBB0_179:                               ;   in Loop: Header=BB0_133 Depth=2
	ldr	w8, [sp, #300]
	add	w8, w8, #1
	str	w8, [sp, #300]
	b	LBB0_133
LBB0_180:                               ;   in Loop: Header=BB0_1 Depth=1
	ldur	w9, [x29, #-240]
                                        ; implicit-def: $x8
	mov	x8, x9
	mov	x9, sp
	str	x8, [x9]
	adrp	x0, l_.str.116@PAGE
	add	x0, x0, l_.str.116@PAGEOFF
	bl	_printf
	ldur	w9, [x29, #-208]
                                        ; implicit-def: $x8
	mov	x8, x9
	mov	x9, sp
	str	x8, [x9]
	adrp	x0, l_.str.117@PAGE
	add	x0, x0, l_.str.117@PAGEOFF
	bl	_printf
	ldr	w9, [sp, #292]
                                        ; implicit-def: $x8
	mov	x8, x9
	mov	x9, sp
	str	x8, [x9]
	adrp	x0, l_.str.118@PAGE
	add	x0, x0, l_.str.118@PAGEOFF
	bl	_printf
	ldur	w8, [x29, #-240]
	subs	w8, w8, #3000
	b.lt	LBB0_184
	b	LBB0_181
LBB0_181:                               ;   in Loop: Header=BB0_1 Depth=1
	ldur	w8, [x29, #-208]
	subs	w8, w8, #300
	b.lt	LBB0_184
	b	LBB0_182
LBB0_182:                               ;   in Loop: Header=BB0_1 Depth=1
	ldr	w8, [sp, #292]
	subs	w8, w8, #3
	b.lt	LBB0_184
	b	LBB0_183
LBB0_183:                               ;   in Loop: Header=BB0_1 Depth=1
	adrp	x0, l_.str.119@PAGE
	add	x0, x0, l_.str.119@PAGEOFF
	bl	_printf
	adrp	x0, l_.str.120@PAGE
	add	x0, x0, l_.str.120@PAGEOFF
	bl	_printf
	b	LBB0_185
LBB0_184:                               ;   in Loop: Header=BB0_1 Depth=1
	adrp	x0, l_.str.121@PAGE
	add	x0, x0, l_.str.121@PAGEOFF
	bl	_printf
	b	LBB0_185
LBB0_185:                               ;   in Loop: Header=BB0_1 Depth=1
	b	LBB0_188
LBB0_186:                               ;   in Loop: Header=BB0_1 Depth=1
	adrp	x0, l_.str.122@PAGE
	add	x0, x0, l_.str.122@PAGEOFF
	bl	_printf
	b	LBB0_188
LBB0_187:                               ;   in Loop: Header=BB0_1 Depth=1
	stur	wzr, [x29, #-232]
	adrp	x0, l_.str.123@PAGE
	add	x0, x0, l_.str.123@PAGEOFF
	bl	_printf
	b	LBB0_188
LBB0_188:                               ;   in Loop: Header=BB0_1 Depth=1
	b	LBB0_189
LBB0_189:                               ;   in Loop: Header=BB0_1 Depth=1
	ldur	w8, [x29, #-232]
	cbz	w8, LBB0_1
	b	LBB0_190
LBB0_190:
	stur	wzr, [x29, #-204]
	b	LBB0_191
LBB0_191:
	ldur	w8, [x29, #-204]
	str	w8, [sp, #36]                   ; 4-byte Folded Spill
	ldur	x9, [x29, #-24]
	adrp	x8, ___stack_chk_guard@GOTPAGE
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
	ldr	x8, [x8]
	subs	x8, x8, x9
	b.eq	LBB0_193
	b	LBB0_192
LBB0_192:
	bl	___stack_chk_fail
LBB0_193:
	ldr	w0, [sp, #36]                   ; 4-byte Folded Reload
	add	sp, sp, #544
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp], #32             ; 16-byte Folded Reload
	ret
	.cfi_endproc
	.p2align	2
lJTI0_0:
	.long	LBB0_9-Ltmp0
	.long	LBB0_77-Ltmp0
	.long	LBB0_128-Ltmp0
	.long	LBB0_186-Ltmp0
	.p2align	2
lJTI0_1:
	.long	LBB0_146-Ltmp1
	.long	LBB0_147-Ltmp1
	.long	LBB0_148-Ltmp1
	.long	LBB0_162-Ltmp1
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	" ______                  _____   _     _ _       \n|  ___ \\                (____ \\ | |   | | |      \n| | _ | | ____  ____ ___ _   \\ \\| |__ | | |      \n| || || |/ _  |/ ___)___) |   | |  __)| | |      \n| || || ( ( | | |  |___ | |__/ /| |   | | |_____ \n|_||_||_|\\_||_|_|  (___/|_____/ |_|   |_|_______)\n"

l_.str.1:                               ; @.str.1
	.asciz	"Bienvenido al juego 'MarsDHL\n'"

l_.str.2:                               ; @.str.2
	.asciz	"En el juego transportaras plantas a marte enfrentandote a todo tipo de cosas\n"

l_.str.3:                               ; @.str.3
	.asciz	"\t**DISFRUTA EL JUEGO**\n"

l_.str.4:                               ; @.str.4
	.asciz	"Selecciona una de las siguientes opciones\n"

l_.str.5:                               ; @.str.5
	.asciz	"1 - Nivel 1\n"

l_.str.6:                               ; @.str.6
	.asciz	"2 - Nivel 2\n"

l_.str.7:                               ; @.str.7
	.asciz	"3 - Nivel 3\n"

l_.str.8:                               ; @.str.8
	.asciz	"4 - Salir\n"

l_.str.9:                               ; @.str.9
	.asciz	"%d"

l_.str.10:                              ; @.str.10
	.asciz	"Solo se permiten numeros del 1 al 4\n"

l_.str.11:                              ; @.str.11
	.asciz	"/-----------------------------------------------/\n"

l_.str.12:                              ; @.str.12
	.asciz	"/**NIVEL 1:**/\n"

l_.str.13:                              ; @.str.13
	.asciz	"Se generaron %d planetas, de los cuales algunos son muy peligros\n"

l_.str.14:                              ; @.str.14
	.asciz	"Encontraste un planeta\n"

l_.str.15:                              ; @.str.15
	.asciz	"/**Tu velocidad actual: %1.0f km/h**\n"

l_.str.16:                              ; @.str.16
	.asciz	"Distancia con el planeta: %d kilometros\n"

l_.str.17:                              ; @.str.17
	.asciz	"/**Revisando si tiene vida o no**\n"

l_.str.18:                              ; @.str.18
	.asciz	"Estas tan lejos del planeta que no es necesario esquivarlo o destruirlo. Sigues tu ruta sin problemas\n"

l_.str.19:                              ; @.str.19
	.asciz	"Te haz encontrado con un planeta muerto\n"

l_.str.20:                              ; @.str.20
	.asciz	"**Revisando si puede destruir el planeta...**\n"

l_.str.21:                              ; @.str.21
	.asciz	"Puedes destruir el planeta si es que lo desea\n"

l_.str.22:                              ; @.str.22
	.asciz	"Desea destruir el planeta? Si es asi perdera 30 capsulas por cada bala.\n"

l_.str.23:                              ; @.str.23
	.asciz	"Escriba SI para destruir el planeta o NO para esquivarlo:\n"

l_.str.24:                              ; @.str.24
	.asciz	"%s"

l_.str.25:                              ; @.str.25
	.asciz	"Haz destruido el planeta con exito\n"

l_.str.26:                              ; @.str.26
	.asciz	"Las balas que utilizaste fueron %d, por lo tanto te quedan %d balas\n"

l_.str.27:                              ; @.str.27
	.asciz	"Perdiste %d vidas, te quedan %d vidas\n"

l_.str.28:                              ; @.str.28
	.asciz	"NO tienes balas suficientes\n"

l_.str.29:                              ; @.str.29
	.asciz	"Decidiste esquivar el planeta\n"

l_.str.30:                              ; @.str.30
	.asciz	"Escribe la opcion correcta\n"

l_.str.31:                              ; @.str.31
	.asciz	"No puedes destruir el planeta, tienes que esquivarlo lo mas rapido posible\n"

l_.str.32:                              ; @.str.32
	.asciz	"Se necesita una velocidad mayor a 1000 km/h para esquivar\n"

l_.str.33:                              ; @.str.33
	.asciz	"------------------------------------------------------------/ \n"

l_.str.34:                              ; @.str.34
	.asciz	"La nave esta haciendo lo posible para esquivar el planeta... \n"

l_.str.35:                              ; @.str.35
	.asciz	"Por poco y no la cuentas! Has esquivado por los pelos al planeta\n"

l_.str.36:                              ; @.str.36
	.asciz	"Procura no estar en estas situaciones...\n"

l_.str.37:                              ; @.str.37
	.asciz	"Oh no! A pesar de tus esfuerzos no se puede esquivar el planeta, sera un impacto total...\n"

l_.str.38:                              ; @.str.38
	.asciz	"Impactaras con el planeta en:\n"

l_.str.39:                              ; @.str.39
	.asciz	"3\n"

l_.str.40:                              ; @.str.40
	.asciz	"2\n"

l_.str.41:                              ; @.str.41
	.asciz	"1\n"

l_.str.42:                              ; @.str.42
	.asciz	"...\n"

l_.str.43:                              ; @.str.43
	.asciz	"                             ____\n                     __,-~~/~    `---.\n                   _/_,---(      ,    )\n               __ /        <    /   )  \\___\n- ------===;;;'====------------------===;;;===----- -  -\n                  \\/  ~\"~\"~\"~\"~\"~\\~\"~)~\"/\n                  (_ (   \\  (     >    \\)\n                   \\_( _ <         >_>'\n                      ~ `-i' ::>|--\"\n                          I;|.|.|\n                         <|i::|i|`.\n                        (` ^'\" ' \")\n\033[31m"

l_.str.44:                              ; @.str.44
	.asciz	"La nave ha chocado de lleno contra el planeta.\n"

l_.str.45:                              ; @.str.45
	.asciz	"Has perdido el juego debido a un terrible accidente...\n"

l_.str.46:                              ; @.str.46
	.asciz	"\t**GRACIAS POR JUGAR**\n"

l_.str.47:                              ; @.str.47
	.asciz	"Te has encontrado con un planeta con vida\n"

l_.str.48:                              ; @.str.48
	.asciz	"No puedes destruir el planeta ya que tiene vida\n"

l_.str.49:                              ; @.str.49
	.asciz	"Tienes que esquivar este planeta lo mas rapido posible, se necesita una velocidad mayor a 1000 km/h para esquivar\n"

l_.str.50:                              ; @.str.50
	.asciz	"/**Haciendo lo posible para esquivar el planeta...**\n"

l_.str.51:                              ; @.str.51
	.asciz	"                             ____\n                     __,-~~/~    `---.\n                   _/_,---(      ,    )\n               __ /        <    /   )  \\___\n- ------===;;;'====------------------===;;;===----- -  -\n                  \\/  ~\"~\"~\"~\"~\"~\\~\"~)~\"/\n                  (_ (   \\  (     >    \\)\n                   \\_( _ <         >_>'\n                      ~ `-i' ::>|--\"\n                          I;|.|.|\n                         <|i::|i|`.\n                        (` ^'\" ' \")\n"

l_.str.52:                              ; @.str.52
	.asciz	"**GRACIAS POR JUGAR**\n"

l_.str.53:                              ; @.str.53
	.asciz	"Encontraste un objeto en tu recorrido\n"

l_.str.54:                              ; @.str.54
	.asciz	"No sabras que es el objeto hasta que lo tomes\n"

l_.str.55:                              ; @.str.55
	.asciz	"Desea tomar el objeto? Si es asi, perderas 50 capsulas de vida. Escriba SI o NO):\n"

l_.str.56:                              ; @.str.56
	.asciz	"Decidiste tomar el objeto\n"

l_.str.57:                              ; @.str.57
	.asciz	"Tomaste un propulsor de %d km/h, ahora tienes mas velocidad\n"

l_.str.58:                              ; @.str.58
	.asciz	"Tomaste %d capsulas de vida, ahora tienes mas vida\n"

l_.str.59:                              ; @.str.59
	.asciz	"Tomaste %d balas, ahora tienes mas balas\n"

l_.str.60:                              ; @.str.60
	.asciz	"Perdiste 50 capsulas de vida por agarrar el objeto\n"

l_.str.61:                              ; @.str.61
	.asciz	"Decidiste no tomar el objeto\n"

l_.str.62:                              ; @.str.62
	.asciz	"Desgraciadamente estas muy lejos del objeto (%d m) para poder tomarlo...\n"

l_.str.63:                              ; @.str.63
	.asciz	"En tu recorrido no haz encontrado ningun objeto\n"

l_.str.64:                              ; @.str.64
	.asciz	"Felicidades, Has pasado el nivel con exito! Puedes seguir al siguiente nivel\n"

l_.str.65:                              ; @.str.65
	.asciz	"Oh no... No pudiste ganar debido a que te faltaron puntos... Intentalo de nuevo!\n"

l_.str.66:                              ; @.str.66
	.asciz	"\n\n/-----------------------------------/\n"

l_.str.67:                              ; @.str.67
	.asciz	"/**NIVEL 2:**\n"

l_.str.68:                              ; @.str.68
	.asciz	"/-----------------------------------/\n"

l_.str.69:                              ; @.str.69
	.asciz	"Ya que has ganado el nivel 1 se mantendra tu vida y tus balas\n"

l_.str.70:                              ; @.str.70
	.asciz	"Se generaron %d meteoros \n"

l_.str.71:                              ; @.str.71
	.asciz	"\n******************\n* Aparecio el meteoro %d *\n******************\n"

l_.str.72:                              ; @.str.72
	.asciz	" \n ------ Velocidad %1.0f km/h ------\n"

l_.str.73:                              ; @.str.73
	.asciz	"\n --- Distancia %d km --- \n"

l_.str.74:                              ; @.str.74
	.asciz	"Has esquivado el meteoro,\n Ganaste 10 asteroides destruidos\n"

l_.str.75:                              ; @.str.75
	.asciz	"Has evadido el meteoro :), \nGanaste 15 asteroides destruidos\n"

l_.str.76:                              ; @.str.76
	.asciz	"\nPuedes destruir el meteoro \n"

l_.str.77:                              ; @.str.77
	.asciz	"Escriba 'SI' para destruir o 'NO' para evadirlo \n"

l_.str.78:                              ; @.str.78
	.asciz	"Destruiste el meteoro con sus asteroides\n"

l_.str.79:                              ; @.str.79
	.asciz	"Realizaste %d disparos\n"

l_.str.80:                              ; @.str.80
	.asciz	"Perdiste:\n %d Balas \n %d Vidas \n"

l_.str.81:                              ; @.str.81
	.asciz	"Te Quedan: \n %d Vidas \n %d Balas\n"

l_.str.82:                              ; @.str.82
	.asciz	"No lo puedes destruir, insuficiencia de balas o vidas\n"

l_.str.83:                              ; @.str.83
	.asciz	"Decidiste no destruirlo. Continua el viaje :)\n"

l_.str.84:                              ; @.str.84
	.asciz	"\n No pudiste esquivar el meteoro, distancia insuficiente \nImpactaras en: \n"

l_.str.85:                              ; @.str.85
	.asciz	"Has perdido el juego :c\n"

l_.str.86:                              ; @.str.86
	.asciz	"\n \302\260\302\260\302\260\302\260Aparecio un objeto de interes\n"

l_.str.87:                              ; @.str.87
	.asciz	"Escriba 'SI' para tomarlo o 'NO' para esquivarlo \n"

l_.str.88:                              ; @.str.88
	.asciz	"\nOuh!, tomaste el objeto de interes\nPerdiste: \n60 capsulas de vida\nGanaste: \n10 Balas \n 5 Asteroides destruidos\n"

l_.str.89:                              ; @.str.89
	.asciz	"Lo siento! \n no conseguiste la distancia necesaria (%1.2f km) :(\n"

l_.str.90:                              ; @.str.90
	.asciz	"\nEsquivaste el objeto de interes.\nContinuando el viaje \n"

l_.str.91:                              ; @.str.91
	.asciz	"\nVidas totales %d  \n"

l_.str.92:                              ; @.str.92
	.asciz	"Balas finales %d \n"

l_.str.93:                              ; @.str.93
	.asciz	"Asteroides destruidos %d  \n"

l_.str.94:                              ; @.str.94
	.asciz	"\007Felicidades, Has pasado el nivel con exito! Puedes seguir al siguiente nivel\n"

l_.str.95:                              ; @.str.95
	.asciz	"Oh no... No pudiste ganar debido a que te faltaron puntos...\n"

l_.str.96:                              ; @.str.96
	.asciz	"Intentalo de nuevo!\n"

l_.str.97:                              ; @.str.97
	.asciz	"\n\n\n/-----------------------------------/\n"

l_.str.98:                              ; @.str.98
	.asciz	"/**NIVEL 3:**\n"

l_.str.99:                              ; @.str.99
	.asciz	"\nCruzaras %d Hoyos Negros \n"

l_.str.100:                             ; @.str.100
	.asciz	"\n*************************\n Hoyo Negro: %d \n"

l_.str.101:                             ; @.str.101
	.asciz	"\nTe desviaste el Hoyo Negro %d, ya que tu distancia entre tu y el hoyo fue de %d km \n "

l_.str.102:                             ; @.str.102
	.asciz	"\nEvadiste el hoyo negro %d tu distancia fue %d km y tu velocidad fue de %1.0f km/h \n "

l_.str.103:                             ; @.str.103
	.asciz	" \nPuedes destruir el Hoyo Negro \n Tu distancia fue %d km \n Tu velocidad alcanzada fue de %1.0f km/h \n"

l_.str.104:                             ; @.str.104
	.asciz	"\nAtacaras el hoyo negro \n"

l_.str.105:                             ; @.str.105
	.asciz	"Destruiste el hoyo negro \n"

l_.str.106:                             ; @.str.106
	.asciz	"Perdiste: \n %d Balas\n  %d Vida \n"

l_.str.107:                             ; @.str.107
	.asciz	"------\nTe quedan:\n%d Balas\n%d Vida \n"

l_.str.108:                             ; @.str.108
	.asciz	"Insuficiente de balas o vida \n"

l_.str.109:                             ; @.str.109
	.asciz	"Decidiste no destruir el hoyo negro \n"

l_.str.110:                             ; @.str.110
	.asciz	" Tu distancia fue %d km \n"

l_.str.111:                             ; @.str.111
	.asciz	"No pudiste esquivar el Hoyo Negro, distancia insuficiente \nImpactaras en: \n"

l_.str.112:                             ; @.str.112
	.asciz	"\n \302\260\302\260 Te has encontrado un objeto de interes \n"

l_.str.113:                             ; @.str.113
	.asciz	"Ohh!!!!!, has perdiste 70 capsulas de vida \nGanaste 15 balas \n"

l_.str.114:                             ; @.str.114
	.asciz	"Lo siento no alcanzaste la distancia necesaria (%d km)\n"

l_.str.115:                             ; @.str.115
	.asciz	"Decidiste no destruir el objeto de interes \n"

l_.str.116:                             ; @.str.116
	.asciz	"Quedaste con %d balas\n"

l_.str.117:                             ; @.str.117
	.asciz	"Quedaste con %d vida\n"

l_.str.118:                             ; @.str.118
	.asciz	"Destruiste %d hoyos negros\n"

l_.str.119:                             ; @.str.119
	.asciz	" Felicidades! Cruzaste el nivel 3\n"

l_.str.120:                             ; @.str.120
	.asciz	"   ___   _   _  _   _   ___ _____ ___ \n  / __| /_\\ | \\| | /_\\ / __|_   _| __|\n | (_ |/ _ \\| .` |/ _ \\\\__ \\ | | | _| \n  \\___/_/ \\_\\_|\\_/_/ \\_\\___/ |_| |___|\n"

l_.str.121:                             ; @.str.121
	.asciz	"No cruzaste el nivel 3 ;c \n"

l_.str.122:                             ; @.str.122
	.asciz	"Saliendo del juego....\n"

l_.str.123:                             ; @.str.123
	.asciz	"Por favor escribe una opcion disponible\n"

.subsections_via_symbols
