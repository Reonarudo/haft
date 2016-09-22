	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 11
	.section	__TEXT,__literal16,16byte_literals
	.align	4
LCPI0_0:
	.space	16
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.align	4, 0x90
_main:                                  ## @main
Lfunc_begin0:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception0
## BB#0:
	pushq	%rbp
Ltmp30:
	.cfi_def_cfa_offset 16
Ltmp31:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp32:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$88, %rsp
Ltmp33:
	.cfi_offset %rbx, -56
Ltmp34:
	.cfi_offset %r12, -48
Ltmp35:
	.cfi_offset %r13, -40
Ltmp36:
	.cfi_offset %r14, -32
Ltmp37:
	.cfi_offset %r15, -24
	leaq	-64(%rbp), %r12
	movq	%r12, %rdi
	callq	_SWIFT$move_ptr
	movq	%rax, %r15
	leaq	-88(%rbp), %rdi
	callq	_SWIFT$move_ptr
	movq	%rax, -112(%rbp)        ## 8-byte Spill
	movq	%r15, %rax
	incq	%rax
	movq	%rax, -104(%rbp)        ## 8-byte Spill
	movl	$1, %r14d
	movl	_SWIFT$global0(%rip), %eax
	movq	%rax, -96(%rbp)         ## 8-byte Spill
	jmp	LBB0_4
	.align	4, 0x90
LBB0_3:                                 ## %BBShadow77
                                        ##   in Loop: Header=BB0_4 Depth=1
	movq	-96(%rbp), %rcx         ## 8-byte Reload
	leal	-1(%rcx,%rax), %ecx
	cmpl	$1000, %ecx             ## imm = 0x3E8
	movl	%eax, %r14d
	jle	LBB0_4
	jmp	LBB0_24
LBB0_20:                                ## %BBShadow76
                                        ##   in Loop: Header=BB0_4 Depth=1
	testl	%edi, %edi
	je	LBB0_24
## BB#21:                               ##   in Loop: Header=BB0_4 Depth=1
	testl	%r8d, %r8d
	jne	LBB0_25
## BB#22:                               ## %BBShadow83
                                        ##   in Loop: Header=BB0_4 Depth=1
	testl	%esi, %esi
	jne	LBB0_24
## BB#23:                               ##   in Loop: Header=BB0_4 Depth=1
	movl	$8, %edi
	callq	___cxa_allocate_exception
	movq	%rax, %rbx
	movq	%rbx, %rdi
	callq	_SWIFT$move_ptr
	leaq	L_.str.1(%rip), %rcx
	movq	%rcx, (%rbx)
	movl	$19, %edx
	movq	%rbx, %rdi
	movq	%rax, %rsi
	callq	_SWIFT$check_ptr
Ltmp4:
	xorl	%edx, %edx
	movq	%rbx, %rdi
	movq	__ZTIPKc@GOTPCREL(%rip), %rsi
	callq	___cxa_throw
Ltmp5:
	jmp	LBB0_24
LBB0_25:                                ## %BBShadow84
                                        ##   in Loop: Header=BB0_4 Depth=1
	testl	%esi, %esi
	je	LBB0_24
## BB#26:                               ##   in Loop: Header=BB0_4 Depth=1
	testl	%eax, %eax
	jne	LBB0_29
## BB#27:                               ## %BBShadow85
                                        ##   in Loop: Header=BB0_4 Depth=1
	testl	%ecx, %ecx
	jne	LBB0_24
## BB#28:                               ##   in Loop: Header=BB0_4 Depth=1
	movl	$8, %edi
	callq	___cxa_allocate_exception
	movq	%rax, %rbx
	movq	%rbx, %rdi
	callq	_SWIFT$move_ptr
	leaq	L_.str.2(%rip), %rcx
	movq	%rcx, (%rbx)
	movl	$20, %edx
	movq	%rbx, %rdi
	movq	%rax, %rsi
	callq	_SWIFT$check_ptr
Ltmp2:
	xorl	%edx, %edx
	movq	%rbx, %rdi
	movq	__ZTIPKc@GOTPCREL(%rip), %rsi
	callq	___cxa_throw
Ltmp3:
	jmp	LBB0_24
LBB0_29:                                ## %BBShadow86
                                        ##   in Loop: Header=BB0_4 Depth=1
	testl	%ecx, %ecx
	je	LBB0_24
## BB#30:                               ##   in Loop: Header=BB0_4 Depth=1
	movl	$4, %edi
	callq	___cxa_allocate_exception
	movq	%rax, %rbx
	movq	%rbx, %rdi
	callq	_SWIFT$move_ptr
	movq	%rax, %r12
	movl	%r14d, (%rbx)
	movl	(%r12), %edi
	movl	$21, %edx
	movl	%r13d, %esi
	callq	_SWIFT$check_i32
	movl	$22, %edx
	movq	%rbx, %rdi
	movq	%r12, %rsi
	callq	_SWIFT$check_ptr
Ltmp0:
	xorl	%edx, %edx
	movq	%rbx, %rdi
	movq	__ZTIi@GOTPCREL(%rip), %rsi
	callq	___cxa_throw
Ltmp1:
	jmp	LBB0_24
LBB0_7:                                 ##   in Loop: Header=BB0_4 Depth=1
Ltmp8:
	movq	%rdx, %rbx
	movq	%rax, %r12
	movl	$2, %edi
	callq	_SWIFT$move_i32
	cmpl	$2, %ebx
	jne	LBB0_14
## BB#8:                                ## %BBShadow79
                                        ##   in Loop: Header=BB0_4 Depth=1
	cmpl	%eax, %ebx
	leaq	-64(%rbp), %rbx
	jne	LBB0_24
## BB#9:                                ##   in Loop: Header=BB0_4 Depth=1
	movl	$9, %edx
	movq	%r12, %rdi
	movq	%r12, %rsi
	callq	_SWIFT$check_ptr
	movq	%r12, %rdi
	callq	___cxa_begin_catch
	movq	%rax, %r12
	movq	%r12, %rdi
	callq	_SWIFT$move_ptr
	movq	%rax, %r13
	movl	$10, %edx
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	_SWIFT$check_ptr
	movl	$11, %edx
	movq	%r12, %rdi
	movq	%r13, %rsi
	callq	_SWIFT$check_ptr
Ltmp19:
	movq	%rbx, %rdi
	movq	%r12, %rsi
	callq	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6assignEPKc
Ltmp20:
	jmp	LBB0_10
LBB0_14:                                ## %BBShadow80
                                        ##   in Loop: Header=BB0_4 Depth=1
	cmpl	%eax, %ebx
	je	LBB0_24
## BB#15:                               ##   in Loop: Header=BB0_4 Depth=1
	movl	$1, %edi
	callq	_SWIFT$move_i32
	cmpl	$1, %ebx
	jne	LBB0_36
## BB#16:                               ## %BBShadow81
                                        ##   in Loop: Header=BB0_4 Depth=1
	cmpl	%eax, %ebx
	jne	LBB0_24
## BB#17:                               ##   in Loop: Header=BB0_4 Depth=1
	movl	$12, %edx
	movq	%r12, %rdi
	movq	%r12, %rsi
	callq	_SWIFT$check_ptr
	movq	%r12, %rdi
	callq	___cxa_begin_catch
	movq	%rax, %rbx
	movq	%rbx, %rdi
	callq	_SWIFT$move_ptr
	movl	(%rbx), %ebx
	movl	(%rax), %r13d
	movl	$13, %edx
	leaq	-88(%rbp), %r12
	movq	%r12, %rdi
	movq	-112(%rbp), %rsi        ## 8-byte Reload
	callq	_SWIFT$check_ptr
	movl	$14, %edx
	movl	%ebx, %edi
	movl	%r13d, %esi
	callq	_SWIFT$check_i32
Ltmp9:
	movq	%r12, %rdi
	movq	%r12, %r13
	movl	%ebx, %esi
	callq	__ZNSt3__19to_stringEi
Ltmp10:
## BB#18:                               ##   in Loop: Header=BB0_4 Depth=1
	movl	$15, %edx
	leaq	-64(%rbp), %r12
	movq	%r12, %rdi
	movq	%r15, %rsi
	callq	_SWIFT$check_ptr
	movl	$16, %edx
	movq	%r13, %rdi
	movq	-112(%rbp), %rsi        ## 8-byte Reload
	callq	_SWIFT$check_ptr
Ltmp11:
	movq	%r12, %rdi
	movq	%r13, %rsi
	callq	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEaSERKS5_
Ltmp12:
## BB#19:                               ##   in Loop: Header=BB0_4 Depth=1
	movl	$17, %edx
	movq	%r13, %rdi
	movq	-112(%rbp), %rsi        ## 8-byte Reload
	callq	_SWIFT$check_ptr
Ltmp16:
	movq	%r13, %rdi
	callq	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev
Ltmp17:
LBB0_10:                                ## %_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEaSEPKc.exit4
                                        ##   in Loop: Header=BB0_4 Depth=1
	callq	___cxa_end_catch
	jmp	LBB0_11
	.align	4, 0x90
LBB0_4:                                 ## =>This Inner Loop Header: Depth=1
	movq	-96(%rbp), %rax         ## 8-byte Reload
	leal	-1(%rax,%r14), %r13d
	xorl	%edx, %edx
	movq	%r12, %rdi
	movq	%r15, %rsi
	callq	_SWIFT$check_ptr
	xorps	%xmm0, %xmm0
	movaps	%xmm0, -64(%rbp)
	movq	$0, -48(%rbp)
	movslq	%r14d, %rax
	imulq	$1431655766, %rax, %rcx ## imm = 0x55555556
	movq	%rcx, %rdx
	shrq	$63, %rdx
	shrq	$32, %rcx
	addl	%edx, %ecx
	leal	(%rcx,%rcx,2), %ecx
	movl	%eax, %r8d
	subl	%ecx, %r8d
	movslq	%r13d, %rcx
	imulq	$1431655766, %rcx, %rsi ## imm = 0x55555556
	movq	%rsi, %rdi
	shrq	$63, %rdi
	shrq	$32, %rsi
	addl	%edi, %esi
	leal	(%rsi,%rsi,2), %edi
	movl	%ecx, %esi
	subl	%edi, %esi
	imulq	$1717986919, %rax, %rdi ## imm = 0x66666667
	movq	%rdi, %rbx
	shrq	$63, %rbx
	sarq	$33, %rdi
	addl	%ebx, %edi
	leal	(%rdi,%rdi,4), %edi
	subl	%edi, %eax
	imulq	$1717986919, %rcx, %rdi ## imm = 0x66666667
	movq	%rdi, %rbx
	shrq	$63, %rbx
	sarq	$33, %rdi
	addl	%ebx, %edi
	leal	(%rdi,%rdi,4), %edi
	subl	%edi, %ecx
	movl	%esi, %edi
	orl	%ecx, %edi
	movl	%r8d, %edx
	orl	%eax, %edx
	jne	LBB0_20
## BB#5:                                ## %BBShadow
                                        ##   in Loop: Header=BB0_4 Depth=1
	testl	%edi, %edi
	jne	LBB0_24
## BB#6:                                ##   in Loop: Header=BB0_4 Depth=1
	movl	$1, %edx
	movq	%r12, %rdi
	movq	%r15, %rsi
	callq	_SWIFT$check_ptr
Ltmp6:
	movq	%r12, %rdi
	leaq	L_.str(%rip), %rsi
	callq	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6assignEPKc
Ltmp7:
LBB0_11:                                ## %_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEaSEPKc.exit
                                        ##   in Loop: Header=BB0_4 Depth=1
	movzbl	-64(%rbp), %r13d
	movzbl	(%r15), %ebx
	movb	%r13b, %al
	andb	$1, %al
	movq	-48(%rbp), %r12
	leaq	-63(%rbp), %rcx
	cmoveq	%rcx, %r12
	movb	%bl, %cl
	andb	$1, %cl
	movq	16(%r15), %rsi
	cmoveq	-104(%rbp), %rsi        ## 8-byte Folded Reload
	shrq	%r13
	shrq	%rbx
	testb	%al, %al
	cmovneq	-56(%rbp), %r13
	testb	%cl, %cl
	cmovneq	8(%r15), %rbx
	movl	$2, %edx
	movq	%r12, %rdi
	callq	_SWIFT$check_ptr
	movl	$3, %edx
	movq	%r13, %rdi
	movq	%rbx, %rsi
	callq	_SWIFT$check_i64
Ltmp22:
	movq	__ZNSt3__14coutE@GOTPCREL(%rip), %rdi
	movq	%r12, %rsi
	movq	%r13, %rdx
	callq	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	movq	%rax, %rbx
Ltmp23:
## BB#12:                               ## %_ZNSt3__1lsIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS_13basic_ostreamIT_T0_EES9_RKNS_12basic_stringIS6_S7_T1_EE.exit
                                        ##   in Loop: Header=BB0_4 Depth=1
	movq	%rbx, %rdi
	callq	_SWIFT$move_ptr
	movq	%rax, %r12
	movl	$4, %edx
	movq	%rbx, %rdi
	movq	%r12, %rsi
	callq	_SWIFT$check_ptr
	movl	$5, %edx
	movq	%rbx, %rdi
	movq	%r12, %rsi
	callq	_SWIFT$check_ptr
Ltmp24:
	movl	$1, %edx
	movq	%rbx, %rdi
	leaq	L_.str.3(%rip), %rsi
	callq	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp25:
## BB#13:                               ## %_ZNSt3__1lsINS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc.exit
                                        ##   in Loop: Header=BB0_4 Depth=1
	movl	$6, %edx
	leaq	-64(%rbp), %r12
	movq	%r12, %rdi
	movq	%r15, %rsi
	callq	_SWIFT$check_ptr
	movq	%r12, %rdi
	callq	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev
	leal	1(%r14), %eax
	cmpl	$1001, %eax             ## imm = 0x3E9
	jl	LBB0_3
## BB#1:                                ## %BBShadow78
	movq	-96(%rbp), %rax         ## 8-byte Reload
	addl	%r14d, %eax
	cmpl	$1001, %eax             ## imm = 0x3E9
	jl	LBB0_24
## BB#2:
	xorl	%eax, %eax
	addq	$88, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB0_35:
Ltmp26:
	movq	%rax, %r12
LBB0_37:                                ## %.loopexit
	leaq	-64(%rbp), %rbx
	movl	$7, %edx
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	_SWIFT$check_ptr
Ltmp27:
	movq	%rbx, %rdi
	callq	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev
Ltmp28:
## BB#38:
	movq	%r12, %rdi
	callq	__Unwind_Resume
LBB0_34:
Ltmp21:
	movq	%rax, %r12
	callq	___cxa_end_catch
	jmp	LBB0_37
LBB0_36:                                ## %BBShadow82
	cmpl	%eax, %ebx
	jne	LBB0_37
LBB0_24:                                ## %Detected
	callq	_SWIFT$detected
LBB0_32:
Ltmp13:
	movq	%rax, %r12
	leaq	-88(%rbp), %rbx
	movl	$18, %edx
	movq	%rbx, %rdi
	movq	-112(%rbp), %rsi        ## 8-byte Reload
	callq	_SWIFT$check_ptr
Ltmp14:
	movq	%rbx, %rdi
	callq	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev
Ltmp15:
## BB#33:
	callq	___cxa_end_catch
	jmp	LBB0_37
LBB0_31:
Ltmp18:
	movq	%rax, %r12
	callq	___cxa_end_catch
	jmp	LBB0_37
LBB0_39:
Ltmp29:
	movq	%rax, %rbx
	movl	$8, %edx
	movq	%rbx, %rdi
	movq	%rbx, %rsi
	callq	_SWIFT$check_ptr
	movq	%rbx, %rdi
	callq	___clang_call_terminate
Lfunc_end0:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.align	2
GCC_except_table0:
Lexception0:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.asciz	"\233\202"              ## @TType base offset
	.byte	3                       ## Call site Encoding = udata4
	.ascii	"\204\002"              ## Call site table length
Lset0 = Lfunc_begin0-Lfunc_begin0       ## >> Call Site 1 <<
	.long	Lset0
Lset1 = Ltmp4-Lfunc_begin0              ##   Call between Lfunc_begin0 and Ltmp4
	.long	Lset1
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lset2 = Ltmp4-Lfunc_begin0              ## >> Call Site 2 <<
	.long	Lset2
Lset3 = Ltmp5-Ltmp4                     ##   Call between Ltmp4 and Ltmp5
	.long	Lset3
Lset4 = Ltmp8-Lfunc_begin0              ##     jumps to Ltmp8
	.long	Lset4
	.byte	5                       ##   On action: 3
Lset5 = Ltmp5-Lfunc_begin0              ## >> Call Site 3 <<
	.long	Lset5
Lset6 = Ltmp2-Ltmp5                     ##   Call between Ltmp5 and Ltmp2
	.long	Lset6
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lset7 = Ltmp2-Lfunc_begin0              ## >> Call Site 4 <<
	.long	Lset7
Lset8 = Ltmp3-Ltmp2                     ##   Call between Ltmp2 and Ltmp3
	.long	Lset8
Lset9 = Ltmp8-Lfunc_begin0              ##     jumps to Ltmp8
	.long	Lset9
	.byte	5                       ##   On action: 3
Lset10 = Ltmp3-Lfunc_begin0             ## >> Call Site 5 <<
	.long	Lset10
Lset11 = Ltmp0-Ltmp3                    ##   Call between Ltmp3 and Ltmp0
	.long	Lset11
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lset12 = Ltmp0-Lfunc_begin0             ## >> Call Site 6 <<
	.long	Lset12
Lset13 = Ltmp1-Ltmp0                    ##   Call between Ltmp0 and Ltmp1
	.long	Lset13
Lset14 = Ltmp8-Lfunc_begin0             ##     jumps to Ltmp8
	.long	Lset14
	.byte	5                       ##   On action: 3
Lset15 = Ltmp1-Lfunc_begin0             ## >> Call Site 7 <<
	.long	Lset15
Lset16 = Ltmp19-Ltmp1                   ##   Call between Ltmp1 and Ltmp19
	.long	Lset16
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lset17 = Ltmp19-Lfunc_begin0            ## >> Call Site 8 <<
	.long	Lset17
Lset18 = Ltmp20-Ltmp19                  ##   Call between Ltmp19 and Ltmp20
	.long	Lset18
Lset19 = Ltmp21-Lfunc_begin0            ##     jumps to Ltmp21
	.long	Lset19
	.byte	0                       ##   On action: cleanup
Lset20 = Ltmp20-Lfunc_begin0            ## >> Call Site 9 <<
	.long	Lset20
Lset21 = Ltmp9-Ltmp20                   ##   Call between Ltmp20 and Ltmp9
	.long	Lset21
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lset22 = Ltmp9-Lfunc_begin0             ## >> Call Site 10 <<
	.long	Lset22
Lset23 = Ltmp10-Ltmp9                   ##   Call between Ltmp9 and Ltmp10
	.long	Lset23
Lset24 = Ltmp18-Lfunc_begin0            ##     jumps to Ltmp18
	.long	Lset24
	.byte	0                       ##   On action: cleanup
Lset25 = Ltmp11-Lfunc_begin0            ## >> Call Site 11 <<
	.long	Lset25
Lset26 = Ltmp12-Ltmp11                  ##   Call between Ltmp11 and Ltmp12
	.long	Lset26
Lset27 = Ltmp13-Lfunc_begin0            ##     jumps to Ltmp13
	.long	Lset27
	.byte	0                       ##   On action: cleanup
Lset28 = Ltmp16-Lfunc_begin0            ## >> Call Site 12 <<
	.long	Lset28
Lset29 = Ltmp17-Ltmp16                  ##   Call between Ltmp16 and Ltmp17
	.long	Lset29
Lset30 = Ltmp18-Lfunc_begin0            ##     jumps to Ltmp18
	.long	Lset30
	.byte	0                       ##   On action: cleanup
Lset31 = Ltmp17-Lfunc_begin0            ## >> Call Site 13 <<
	.long	Lset31
Lset32 = Ltmp6-Ltmp17                   ##   Call between Ltmp17 and Ltmp6
	.long	Lset32
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lset33 = Ltmp6-Lfunc_begin0             ## >> Call Site 14 <<
	.long	Lset33
Lset34 = Ltmp7-Ltmp6                    ##   Call between Ltmp6 and Ltmp7
	.long	Lset34
Lset35 = Ltmp8-Lfunc_begin0             ##     jumps to Ltmp8
	.long	Lset35
	.byte	5                       ##   On action: 3
Lset36 = Ltmp22-Lfunc_begin0            ## >> Call Site 15 <<
	.long	Lset36
Lset37 = Ltmp25-Ltmp22                  ##   Call between Ltmp22 and Ltmp25
	.long	Lset37
Lset38 = Ltmp26-Lfunc_begin0            ##     jumps to Ltmp26
	.long	Lset38
	.byte	0                       ##   On action: cleanup
Lset39 = Ltmp25-Lfunc_begin0            ## >> Call Site 16 <<
	.long	Lset39
Lset40 = Ltmp27-Ltmp25                  ##   Call between Ltmp25 and Ltmp27
	.long	Lset40
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lset41 = Ltmp27-Lfunc_begin0            ## >> Call Site 17 <<
	.long	Lset41
Lset42 = Ltmp28-Ltmp27                  ##   Call between Ltmp27 and Ltmp28
	.long	Lset42
Lset43 = Ltmp29-Lfunc_begin0            ##     jumps to Ltmp29
	.long	Lset43
	.byte	7                       ##   On action: 4
Lset44 = Ltmp28-Lfunc_begin0            ## >> Call Site 18 <<
	.long	Lset44
Lset45 = Ltmp14-Ltmp28                  ##   Call between Ltmp28 and Ltmp14
	.long	Lset45
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lset46 = Ltmp14-Lfunc_begin0            ## >> Call Site 19 <<
	.long	Lset46
Lset47 = Ltmp15-Ltmp14                  ##   Call between Ltmp14 and Ltmp15
	.long	Lset47
Lset48 = Ltmp29-Lfunc_begin0            ##     jumps to Ltmp29
	.long	Lset48
	.byte	7                       ##   On action: 4
Lset49 = Ltmp15-Lfunc_begin0            ## >> Call Site 20 <<
	.long	Lset49
Lset50 = Lfunc_end0-Ltmp15              ##   Call between Ltmp15 and Lfunc_end0
	.long	Lset50
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.byte	0                       ## >> Action Record 1 <<
                                        ##   Cleanup
	.byte	0                       ##   No further actions
	.byte	1                       ## >> Action Record 2 <<
                                        ##   Catch TypeInfo 1
	.byte	125                     ##   Continue to action 1
	.byte	2                       ## >> Action Record 3 <<
                                        ##   Catch TypeInfo 2
	.byte	125                     ##   Continue to action 2
	.byte	3                       ## >> Action Record 4 <<
                                        ##   Catch TypeInfo 3
	.byte	0                       ##   No further actions
                                        ## >> Catch TypeInfos <<
	.long	0                       ## TypeInfo 3
	.long	__ZTIPKc@GOTPCREL+4     ## TypeInfo 2
	.long	__ZTIi@GOTPCREL+4       ## TypeInfo 1
	.align	2

	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	.weak_def_can_be_hidden	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	.align	4, 0x90
__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m: ## @_ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Lfunc_begin1:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception1
## BB#0:
	pushq	%rbp
Ltmp68:
	.cfi_def_cfa_offset 16
Ltmp69:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp70:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$136, %rsp
Ltmp71:
	.cfi_offset %rbx, -56
Ltmp72:
	.cfi_offset %r12, -48
Ltmp73:
	.cfi_offset %r13, -40
Ltmp74:
	.cfi_offset %r14, -32
Ltmp75:
	.cfi_offset %r15, -24
	movq	%rdx, %r12
	movq	%rsi, %rbx
	movq	%rbx, -88(%rbp)         ## 8-byte Spill
	movq	%rdi, %r13
	movq	%r13, -72(%rbp)         ## 8-byte Spill
	callq	_SWIFT$move_ptr
	movq	%rax, %r15
	movq	%r15, -80(%rbp)         ## 8-byte Spill
	movq	%rbx, %rdi
	callq	_SWIFT$move_ptr
	movq	%rax, -144(%rbp)        ## 8-byte Spill
	movq	%r12, %rdi
	callq	_SWIFT$move_i64
	movq	%rax, -136(%rbp)        ## 8-byte Spill
	leaq	-48(%rbp), %rdi
	callq	_SWIFT$move_ptr
	movq	%rax, -128(%rbp)        ## 8-byte Spill
	leaq	-64(%rbp), %r14
	movq	%r14, %rdi
	callq	_SWIFT$move_ptr
	movq	%rax, %rbx
	xorl	%edx, %edx
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	_SWIFT$check_ptr
	movl	$1, %edx
	movq	%r13, %rdi
	movq	%r15, %rsi
	callq	_SWIFT$check_ptr
Ltmp38:
	movq	%r14, %rdi
	movq	%r13, %rsi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryC1ERS3_
Ltmp39:
## BB#1:
	cmpb	$0, -64(%rbp)
	movb	(%rbx), %al
	movq	%rbx, -96(%rbp)         ## 8-byte Spill
	je	LBB1_29
## BB#2:                                ## %BBShadow101
	testb	%al, %al
	je	LBB1_30
## BB#3:
	movq	-72(%rbp), %rsi         ## 8-byte Reload
	movq	(%rsi), %rax
	movq	-80(%rbp), %rdx         ## 8-byte Reload
	movq	(%rdx), %rcx
	movq	-24(%rax), %rax
	movq	-24(%rcx), %rcx
	leaq	(%rsi,%rax), %rbx
	leaq	(%rdx,%rcx), %r15
	movq	40(%rsi,%rax), %rdi
	movq	%rdi, -104(%rbp)        ## 8-byte Spill
	movq	40(%rdx,%rcx), %rdi
	movq	%rdi, -152(%rbp)        ## 8-byte Spill
	movl	8(%rsi,%rax), %r13d
	movl	8(%rdx,%rcx), %edi
	movl	%edi, -156(%rbp)        ## 4-byte Spill
	movl	144(%rsi,%rax), %eax
	movl	144(%rdx,%rcx), %ecx
	cmpl	$-1, %eax
	je	LBB1_4
## BB#13:                               ## %BBShadow103
	cmpl	$-1, %ecx
	movl	%ecx, -128(%rbp)        ## 4-byte Spill
	movl	%eax, -160(%rbp)        ## 4-byte Spill
	jne	LBB1_14
	jmp	LBB1_30
LBB1_29:                                ## %BBShadow
	testb	%al, %al
	je	LBB1_21
	jmp	LBB1_30
LBB1_4:                                 ## %BBShadow102
	cmpl	$-1, %ecx
	jne	LBB1_30
## BB#5:
	leaq	-48(%rbp), %r14
	movl	$3, %edx
	movq	%r14, %rdi
	movq	-128(%rbp), %rsi        ## 8-byte Reload
	callq	_SWIFT$check_ptr
	movl	$4, %edx
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	_SWIFT$check_ptr
Ltmp40:
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	__ZNKSt3__18ios_base6getlocEv
Ltmp41:
## BB#6:                                ## %.noexc
	movq	%r15, -120(%rbp)        ## 8-byte Spill
	movq	%rbx, -112(%rbp)        ## 8-byte Spill
	leaq	-48(%rbp), %rbx
	movl	$5, %edx
	movq	%rbx, %rdi
	movq	-128(%rbp), %rsi        ## 8-byte Reload
	callq	_SWIFT$check_ptr
Ltmp42:
	movq	__ZNSt3__15ctypeIcE2idE@GOTPCREL(%rip), %rsi
	movq	%rbx, %rdi
	callq	__ZNKSt3__16locale9use_facetERNS0_2idE
	movq	%rax, %rbx
Ltmp43:
## BB#7:
	movq	%rbx, %rdi
	callq	_SWIFT$move_ptr
	movq	(%rbx), %rcx
	movq	(%rax), %rdx
	movq	56(%rcx), %r14
	movq	56(%rdx), %r15
	movl	$6, %edx
	movq	%rbx, %rdi
	movq	%rax, %rsi
	callq	_SWIFT$check_ptr
	movl	$7, %edx
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	_SWIFT$check_ptr
Ltmp44:
	movl	$32, %esi
	movq	%rbx, %rdi
	callq	*%r14
	movb	%al, %r14b
Ltmp45:
## BB#8:                                ## %_ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5widenEc.exit.i
	movzbl	%r14b, %edi
	callq	_SWIFT$move_i8
	movb	%al, -161(%rbp)         ## 1-byte Spill
	leaq	-48(%rbp), %r15
	movl	$8, %edx
	movq	%r15, %rdi
	movq	-128(%rbp), %rbx        ## 8-byte Reload
	movq	%rbx, %rsi
	callq	_SWIFT$check_ptr
	movl	$9, %edx
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	_SWIFT$check_ptr
Ltmp50:
	movq	%r15, %rdi
	callq	__ZNSt3__16localeD1Ev
Ltmp51:
	movq	-112(%rbp), %rbx        ## 8-byte Reload
	movq	-120(%rbp), %r15        ## 8-byte Reload
## BB#9:                                ## %.noexc1
	movsbl	%r14b, %eax
	movl	%eax, -160(%rbp)        ## 4-byte Spill
	movsbl	-161(%rbp), %esi        ## 1-byte Folded Reload
	movl	%esi, -128(%rbp)        ## 4-byte Spill
	movl	%eax, 144(%rbx)
	movl	144(%r15), %edi
	movl	$10, %edx
	callq	_SWIFT$check_i32
LBB1_14:
	movq	%r15, -120(%rbp)        ## 8-byte Spill
	movq	%rbx, -112(%rbp)        ## 8-byte Spill
	movq	-88(%rbp), %rcx         ## 8-byte Reload
	addq	%rcx, %r12
	movq	-136(%rbp), %r15        ## 8-byte Reload
	movq	-144(%rbp), %r14        ## 8-byte Reload
	addq	%r14, %r15
	andl	$176, %r13d
	movl	-156(%rbp), %eax        ## 4-byte Reload
	andl	$176, %eax
	cmpl	$32, %r13d
	movq	%rcx, %rdx
	movq	%rcx, %r13
	cmoveq	%r12, %rdx
	movq	%rdx, -136(%rbp)        ## 8-byte Spill
	cmpl	$32, %eax
	movq	%r14, %rbx
	cmoveq	%r15, %rbx
	movl	$13, %edx
	movq	-104(%rbp), %rdi        ## 8-byte Reload
	movq	-152(%rbp), %rsi        ## 8-byte Reload
	callq	_SWIFT$check_ptr
	movl	$14, %edx
	movq	%r13, %rdi
	movq	%r14, %rsi
	callq	_SWIFT$check_ptr
	movl	$15, %edx
	movq	-136(%rbp), %r13        ## 8-byte Reload
	movq	%r13, %rdi
	movq	%rbx, %rsi
	callq	_SWIFT$check_ptr
	movl	$16, %edx
	movq	%r12, %rdi
	movq	%r15, %rsi
	callq	_SWIFT$check_ptr
	movl	$17, %edx
	movq	-112(%rbp), %r14        ## 8-byte Reload
	movq	%r14, %rdi
	movq	-120(%rbp), %rsi        ## 8-byte Reload
	callq	_SWIFT$check_ptr
	movl	$18, %edx
	movl	-160(%rbp), %ebx        ## 4-byte Reload
	movl	%ebx, %edi
	movl	-128(%rbp), %esi        ## 4-byte Reload
	callq	_SWIFT$check_i8
Ltmp52:
	movsbl	%bl, %r9d
	movq	-104(%rbp), %rdi        ## 8-byte Reload
	movq	-88(%rbp), %rsi         ## 8-byte Reload
	movq	%r13, %rdx
	movq	%r12, %rcx
	movq	%r14, %r8
	callq	__ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
	movq	%rax, %rbx
Ltmp53:
## BB#15:
	movq	%rbx, %rdi
	callq	_SWIFT$move_ptr
	testq	%rbx, %rbx
	je	LBB1_16
## BB#20:                               ## %BBShadow105
	testq	%rax, %rax
	jne	LBB1_21
	jmp	LBB1_30
LBB1_16:                                ## %BBShadow104
	testq	%rax, %rax
	jne	LBB1_30
## BB#17:
	movq	-72(%rbp), %rdi         ## 8-byte Reload
	movq	(%rdi), %rax
	movq	-80(%rbp), %rdx         ## 8-byte Reload
	movq	(%rdx), %rcx
	movq	-24(%rax), %rax
	movq	-24(%rcx), %rcx
	leaq	(%rdi,%rax), %r14
	movq	%rdx, %rsi
	addq	%rcx, %rsi
	movl	32(%rdi,%rax), %ebx
	movl	32(%rdx,%rcx), %r15d
	orl	$5, %ebx
	orl	$5, %r15d
	movl	$19, %edx
	movq	%r14, %rdi
	callq	_SWIFT$check_ptr
	movl	$20, %edx
	movl	%ebx, %edi
	movl	%r15d, %esi
	callq	_SWIFT$check_i32
Ltmp54:
	movq	%r14, %rdi
	movl	%ebx, %esi
	callq	__ZNSt3__18ios_base5clearEj
Ltmp55:
LBB1_21:                                ## %_ZNSt3__19basic_iosIcNS_11char_traitsIcEEE8setstateEj.exit
	leaq	-64(%rbp), %rbx
	movl	$2, %edx
	movq	%rbx, %rdi
	movq	-96(%rbp), %rsi         ## 8-byte Reload
	callq	_SWIFT$check_ptr
Ltmp59:
	movq	%rbx, %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryD1Ev
Ltmp60:
LBB1_25:
	movl	$22, %edx
	movq	-72(%rbp), %rbx         ## 8-byte Reload
	movq	%rbx, %rdi
	movq	-80(%rbp), %rsi         ## 8-byte Reload
	callq	_SWIFT$check_ptr
	movq	%rbx, %rax
	addq	$136, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB1_30:                                ## %Detected
	callq	_SWIFT$detected
LBB1_22:
Ltmp61:
	movq	%rax, %r14
	jmp	LBB1_23
LBB1_18:
Ltmp56:
	movq	%rax, %r14
	jmp	LBB1_19
LBB1_10:
Ltmp46:
	movq	%rax, %r14
	leaq	-48(%rbp), %rbx
	movl	$11, %edx
	movq	%rbx, %rdi
	movq	-128(%rbp), %rsi        ## 8-byte Reload
	callq	_SWIFT$check_ptr
Ltmp47:
	movq	%rbx, %rdi
	callq	__ZNSt3__16localeD1Ev
Ltmp48:
LBB1_19:                                ## %.body
	leaq	-64(%rbp), %rbx
	movl	$21, %edx
	movq	%rbx, %rdi
	movq	-96(%rbp), %rsi         ## 8-byte Reload
	callq	_SWIFT$check_ptr
Ltmp57:
	movq	%rbx, %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryD1Ev
Ltmp58:
LBB1_23:
	movq	-72(%rbp), %r15         ## 8-byte Reload
	movl	$23, %edx
	movq	%r14, %rdi
	movq	%r14, %rsi
	callq	_SWIFT$check_ptr
	movq	%r14, %rdi
	callq	___cxa_begin_catch
	movq	-72(%rbp), %rax         ## 8-byte Reload
	movq	(%rax), %rax
	movq	-80(%rbp), %rdx         ## 8-byte Reload
	movq	(%rdx), %rcx
	addq	-24(%rax), %r15
	movq	-24(%rcx), %rsi
	addq	%rdx, %rsi
	movl	$24, %edx
	movq	%r15, %rdi
	callq	_SWIFT$check_ptr
Ltmp62:
	movq	%r15, %rdi
	callq	__ZNSt3__18ios_base33__set_badbit_and_consider_rethrowEv
Ltmp63:
## BB#24:
	callq	___cxa_end_catch
	jmp	LBB1_25
LBB1_26:
Ltmp64:
	movq	%rax, %rbx
Ltmp65:
	callq	___cxa_end_catch
Ltmp66:
## BB#27:
	movq	%rbx, %rdi
	callq	__Unwind_Resume
LBB1_28:
Ltmp67:
	movq	%rax, %rbx
	movl	$25, %edx
	jmp	LBB1_12
LBB1_11:
Ltmp49:
	movq	%rax, %rbx
	movl	$12, %edx
LBB1_12:
	movq	%rbx, %rdi
	movq	%rbx, %rsi
	callq	_SWIFT$check_ptr
	movq	%rbx, %rdi
	callq	___clang_call_terminate
Lfunc_end1:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.align	2
GCC_except_table1:
Lexception1:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.asciz	"\245\201\200\200"      ## @TType base offset
	.byte	3                       ## Call site Encoding = udata4
	.ascii	"\234\001"              ## Call site table length
Lset51 = Ltmp38-Lfunc_begin1            ## >> Call Site 1 <<
	.long	Lset51
Lset52 = Ltmp39-Ltmp38                  ##   Call between Ltmp38 and Ltmp39
	.long	Lset52
Lset53 = Ltmp61-Lfunc_begin1            ##     jumps to Ltmp61
	.long	Lset53
	.byte	1                       ##   On action: 1
Lset54 = Ltmp40-Lfunc_begin1            ## >> Call Site 2 <<
	.long	Lset54
Lset55 = Ltmp41-Ltmp40                  ##   Call between Ltmp40 and Ltmp41
	.long	Lset55
Lset56 = Ltmp56-Lfunc_begin1            ##     jumps to Ltmp56
	.long	Lset56
	.byte	1                       ##   On action: 1
Lset57 = Ltmp42-Lfunc_begin1            ## >> Call Site 3 <<
	.long	Lset57
Lset58 = Ltmp45-Ltmp42                  ##   Call between Ltmp42 and Ltmp45
	.long	Lset58
Lset59 = Ltmp46-Lfunc_begin1            ##     jumps to Ltmp46
	.long	Lset59
	.byte	1                       ##   On action: 1
Lset60 = Ltmp50-Lfunc_begin1            ## >> Call Site 4 <<
	.long	Lset60
Lset61 = Ltmp55-Ltmp50                  ##   Call between Ltmp50 and Ltmp55
	.long	Lset61
Lset62 = Ltmp56-Lfunc_begin1            ##     jumps to Ltmp56
	.long	Lset62
	.byte	1                       ##   On action: 1
Lset63 = Ltmp59-Lfunc_begin1            ## >> Call Site 5 <<
	.long	Lset63
Lset64 = Ltmp60-Ltmp59                  ##   Call between Ltmp59 and Ltmp60
	.long	Lset64
Lset65 = Ltmp61-Lfunc_begin1            ##     jumps to Ltmp61
	.long	Lset65
	.byte	1                       ##   On action: 1
Lset66 = Ltmp47-Lfunc_begin1            ## >> Call Site 6 <<
	.long	Lset66
Lset67 = Ltmp48-Ltmp47                  ##   Call between Ltmp47 and Ltmp48
	.long	Lset67
Lset68 = Ltmp49-Lfunc_begin1            ##     jumps to Ltmp49
	.long	Lset68
	.byte	1                       ##   On action: 1
Lset69 = Ltmp57-Lfunc_begin1            ## >> Call Site 7 <<
	.long	Lset69
Lset70 = Ltmp58-Ltmp57                  ##   Call between Ltmp57 and Ltmp58
	.long	Lset70
Lset71 = Ltmp67-Lfunc_begin1            ##     jumps to Ltmp67
	.long	Lset71
	.byte	1                       ##   On action: 1
Lset72 = Ltmp58-Lfunc_begin1            ## >> Call Site 8 <<
	.long	Lset72
Lset73 = Ltmp62-Ltmp58                  ##   Call between Ltmp58 and Ltmp62
	.long	Lset73
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lset74 = Ltmp62-Lfunc_begin1            ## >> Call Site 9 <<
	.long	Lset74
Lset75 = Ltmp63-Ltmp62                  ##   Call between Ltmp62 and Ltmp63
	.long	Lset75
Lset76 = Ltmp64-Lfunc_begin1            ##     jumps to Ltmp64
	.long	Lset76
	.byte	0                       ##   On action: cleanup
Lset77 = Ltmp63-Lfunc_begin1            ## >> Call Site 10 <<
	.long	Lset77
Lset78 = Ltmp65-Ltmp63                  ##   Call between Ltmp63 and Ltmp65
	.long	Lset78
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lset79 = Ltmp65-Lfunc_begin1            ## >> Call Site 11 <<
	.long	Lset79
Lset80 = Ltmp66-Ltmp65                  ##   Call between Ltmp65 and Ltmp66
	.long	Lset80
Lset81 = Ltmp67-Lfunc_begin1            ##     jumps to Ltmp67
	.long	Lset81
	.byte	1                       ##   On action: 1
Lset82 = Ltmp66-Lfunc_begin1            ## >> Call Site 12 <<
	.long	Lset82
Lset83 = Lfunc_end1-Ltmp66              ##   Call between Ltmp66 and Lfunc_end1
	.long	Lset83
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.byte	1                       ## >> Action Record 1 <<
                                        ##   Catch TypeInfo 1
	.byte	0                       ##   No further actions
                                        ## >> Catch TypeInfos <<
	.long	0                       ## TypeInfo 1
	.align	2

	.section	__TEXT,__text,regular,pure_instructions
	.private_extern	___clang_call_terminate
	.globl	___clang_call_terminate
	.weak_def_can_be_hidden	___clang_call_terminate
	.align	4, 0x90
___clang_call_terminate:                ## @__clang_call_terminate
## BB#0:
	pushq	%rbx
	movq	%rdi, %rbx
	callq	_SWIFT$move_ptr
	xorl	%edx, %edx
	movq	%rbx, %rdi
	movq	%rax, %rsi
	callq	_SWIFT$check_ptr
	movq	%rbx, %rdi
	callq	___cxa_begin_catch
	callq	__ZSt9terminatev

	.private_extern	__ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
	.globl	__ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
	.weak_def_can_be_hidden	__ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
	.align	4, 0x90
__ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_: ## @_ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
Lfunc_begin2:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception2
## BB#0:
	pushq	%rbp
Ltmp82:
	.cfi_def_cfa_offset 16
Ltmp83:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp84:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$152, %rsp
Ltmp85:
	.cfi_offset %rbx, -56
Ltmp86:
	.cfi_offset %r12, -48
Ltmp87:
	.cfi_offset %r13, -40
Ltmp88:
	.cfi_offset %r14, -32
Ltmp89:
	.cfi_offset %r15, -24
	movl	%r9d, -88(%rbp)         ## 4-byte Spill
	movq	%r8, %r13
	movq	%r13, -120(%rbp)        ## 8-byte Spill
	movq	%rcx, %r12
	movq	%r12, -112(%rbp)        ## 8-byte Spill
	movq	%rdx, %rbx
	movq	%rbx, -96(%rbp)         ## 8-byte Spill
	movq	%rsi, %r15
	movq	%rdi, %r14
	movq	%r14, -72(%rbp)         ## 8-byte Spill
	callq	_SWIFT$move_ptr
	movq	%rax, -80(%rbp)         ## 8-byte Spill
	movq	%r15, %rdi
	callq	_SWIFT$move_ptr
	movq	%rax, -128(%rbp)        ## 8-byte Spill
	movq	%rbx, %rdi
	callq	_SWIFT$move_ptr
	movq	%rax, -104(%rbp)        ## 8-byte Spill
	movq	%r12, %rdi
	callq	_SWIFT$move_ptr
	movq	%rax, %r12
	movq	%r13, %rdi
	callq	_SWIFT$move_ptr
	movq	%rax, %r13
	movl	-88(%rbp), %edi         ## 4-byte Reload
	callq	_SWIFT$move_i8
	movb	%al, %bl
	leaq	-64(%rbp), %rdi
	callq	_SWIFT$move_ptr
	testq	%r14, %r14
	je	LBB3_16
## BB#1:                                ## %BBShadow68
	movb	%bl, -161(%rbp)         ## 1-byte Spill
	movq	-80(%rbp), %rcx         ## 8-byte Reload
	testq	%rcx, %rcx
	movq	%rcx, %rsi
	movq	%r15, %r14
	movq	%r12, %r9
	je	LBB3_26
## BB#2:
	movq	-112(%rbp), %rdi        ## 8-byte Reload
	subq	%r14, %rdi
	movq	%r9, %rcx
	movq	-128(%rbp), %r12        ## 8-byte Reload
	subq	%r12, %rcx
	movq	-120(%rbp), %rdx        ## 8-byte Reload
	movq	24(%rdx), %r15
	movq	24(%r13), %rbx
	xorl	%edx, %edx
	subq	%rdi, %r15
	cmovleq	%rdx, %r15
	subq	%rcx, %rbx
	cmovleq	%rdx, %rbx
	movq	%rbx, -136(%rbp)        ## 8-byte Spill
	movq	-96(%rbp), %rbx         ## 8-byte Reload
	subq	%r14, %rbx
	movq	-104(%rbp), %r13        ## 8-byte Reload
	subq	%r12, %r13
	testq	%rbx, %rbx
	jle	LBB3_25
## BB#3:                                ## %BBShadow69
	testq	%r13, %r13
	jle	LBB3_26
## BB#4:
	movq	%r9, -160(%rbp)         ## 8-byte Spill
	movq	%r15, -152(%rbp)        ## 8-byte Spill
	movq	%rax, -144(%rbp)        ## 8-byte Spill
	movq	-72(%rbp), %r15         ## 8-byte Reload
	movq	(%r15), %rax
	movq	(%rsi), %rcx
	movq	96(%rax), %rax
	movq	%rax, -176(%rbp)        ## 8-byte Spill
	movq	96(%rcx), %rax
	movq	%rax, -184(%rbp)        ## 8-byte Spill
	movl	$1, %edx
	movq	%r15, %rdi
	callq	_SWIFT$check_ptr
	movl	$2, %edx
	movq	%r14, %rdi
	movq	%r12, %rsi
	callq	_SWIFT$check_ptr
	movl	$3, %edx
	movq	%rbx, %rdi
	movq	%r13, %rsi
	callq	_SWIFT$check_i64
	movl	$4, %edx
	movq	-176(%rbp), %r12        ## 8-byte Reload
	movq	%r12, %rdi
	movq	-184(%rbp), %rsi        ## 8-byte Reload
	callq	_SWIFT$check_ptr
	movq	%r15, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	*%r12
	movq	%rax, %r14
	movq	%r14, %rdi
	callq	_SWIFT$move_i64
	cmpq	%rbx, %r14
	jne	LBB3_17
## BB#5:                                ## %BBShadow71
	cmpq	%r13, %rax
	movq	-80(%rbp), %rsi         ## 8-byte Reload
	movq	-144(%rbp), %rax        ## 8-byte Reload
	movq	-152(%rbp), %r15        ## 8-byte Reload
	movq	-160(%rbp), %r9         ## 8-byte Reload
	je	LBB3_6
	jmp	LBB3_26
LBB3_16:                                ## %BBShadow
	xorl	%eax, %eax
	movq	%rax, -72(%rbp)         ## 8-byte Spill
	cmpq	$0, -80(%rbp)           ## 8-byte Folded Reload
	movl	$0, %esi
	je	LBB3_21
	jmp	LBB3_26
LBB3_25:                                ## %BBShadow70
	testq	%r13, %r13
	jg	LBB3_26
LBB3_6:
	testq	%r15, %r15
	jle	LBB3_27
## BB#7:                                ## %BBShadow73
	cmpq	$0, -136(%rbp)          ## 8-byte Folded Reload
	jle	LBB3_26
## BB#8:                                ## %_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4dataEv.exit
	movq	%r9, -160(%rbp)         ## 8-byte Spill
	leaq	-64(%rbp), %r14
	movl	$5, %edx
	movq	%r14, %rdi
	movq	%rsi, -80(%rbp)         ## 8-byte Spill
	movq	%rax, %rsi
	movq	%rax, %rbx
	movq	%rbx, -144(%rbp)        ## 8-byte Spill
	callq	_SWIFT$check_ptr
	xorps	%xmm0, %xmm0
	movaps	%xmm0, -64(%rbp)
	movq	$0, -48(%rbp)
	movl	$6, %edx
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	_SWIFT$check_ptr
	movl	$7, %edx
	movq	%r15, %rdi
	movq	%r15, %r13
	movq	%r13, -152(%rbp)        ## 8-byte Spill
	movq	-136(%rbp), %r15        ## 8-byte Reload
	movq	%r15, %rsi
	callq	_SWIFT$check_i64
	movl	-88(%rbp), %eax         ## 4-byte Reload
	movzbl	%al, %r12d
	movzbl	-161(%rbp), %esi        ## 1-byte Folded Reload
	movl	$8, %edx
	movl	%r12d, %edi
	callq	_SWIFT$check_i8
	movsbl	%r12b, %edx
	movq	%r14, %rdi
	movq	%r13, %rsi
	callq	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6__initEmc
	movb	(%rbx), %al
	movq	%rbx, %rcx
	incq	%rcx
	testb	$1, -64(%rbp)
	leaq	-63(%rbp), %r12
	cmovneq	-48(%rbp), %r12
	testb	$1, %al
	movq	16(%rbx), %rbx
	cmoveq	%rcx, %rbx
	movq	-72(%rbp), %r13         ## 8-byte Reload
	movq	(%r13), %rax
	movq	-80(%rbp), %rsi         ## 8-byte Reload
	movq	(%rsi), %rcx
	movq	96(%rax), %r14
	movq	96(%rcx), %rax
	movq	%rax, -88(%rbp)         ## 8-byte Spill
	movl	$9, %edx
	movq	%r13, %rdi
	callq	_SWIFT$check_ptr
	movl	$10, %edx
	movq	%r12, %rdi
	movq	%rbx, %rsi
	callq	_SWIFT$check_ptr
	movl	$11, %edx
	movq	-152(%rbp), %rbx        ## 8-byte Reload
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	_SWIFT$check_i64
	movl	$12, %edx
	movq	%r14, %rdi
	movq	-88(%rbp), %rsi         ## 8-byte Reload
	callq	_SWIFT$check_ptr
Ltmp76:
	movq	%r13, %rdi
	movq	%rbx, %r13
	movq	%r12, %rsi
	movq	%r13, %rdx
	callq	*%r14
	movq	%rax, %rbx
Ltmp77:
## BB#9:                                ## %_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5sputnEPKcl.exit
	movq	%rbx, %rdi
	callq	_SWIFT$move_i64
	movq	%rax, %r14
	leaq	-64(%rbp), %r12
	movl	$13, %edx
	movq	%r12, %rdi
	movq	-144(%rbp), %rsi        ## 8-byte Reload
	callq	_SWIFT$check_ptr
	movq	%r12, %rdi
	callq	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev
	cmpq	%r13, %rbx
	jne	LBB3_18
## BB#10:                               ## %BBShadow75
	cmpq	%r15, %r14
	movq	-80(%rbp), %rsi         ## 8-byte Reload
	movq	-160(%rbp), %r9         ## 8-byte Reload
	je	LBB3_11
	jmp	LBB3_26
LBB3_17:                                ## %BBShadow72
	xorl	%ecx, %ecx
	movq	%rcx, -72(%rbp)         ## 8-byte Spill
	cmpq	%r13, %rax
	jmp	LBB3_20
LBB3_27:                                ## %BBShadow74
	cmpq	$0, -136(%rbp)          ## 8-byte Folded Reload
	jg	LBB3_26
LBB3_11:                                ## %.thread
	movq	-112(%rbp), %rax        ## 8-byte Reload
	subq	-96(%rbp), %rax         ## 8-byte Folded Reload
	subq	-104(%rbp), %r9         ## 8-byte Folded Reload
	testq	%rax, %rax
	movq	%rax, %r13
	jle	LBB3_28
## BB#12:                               ## %BBShadow77
	testq	%r9, %r9
	jle	LBB3_26
## BB#13:
	movq	-72(%rbp), %rbx         ## 8-byte Reload
	movq	(%rbx), %rax
	movq	(%rsi), %rcx
	movq	%r9, %r14
	movq	96(%rax), %r12
	movq	96(%rcx), %rax
	movq	%rax, -88(%rbp)         ## 8-byte Spill
	movl	$16, %edx
	movq	%rbx, %rdi
	movq	%rsi, -80(%rbp)         ## 8-byte Spill
	callq	_SWIFT$check_ptr
	movl	$17, %edx
	movq	-96(%rbp), %r15         ## 8-byte Reload
	movq	%r15, %rdi
	movq	-104(%rbp), %rsi        ## 8-byte Reload
	callq	_SWIFT$check_ptr
	movl	$18, %edx
	movq	%r13, %rdi
	movq	%r14, %rsi
	callq	_SWIFT$check_i64
	movl	$19, %edx
	movq	%r12, %rdi
	movq	-88(%rbp), %rsi         ## 8-byte Reload
	callq	_SWIFT$check_ptr
	movq	%rbx, %rdi
	movq	%r15, %rsi
	movq	%r13, %rdx
	callq	*%r12
	movq	%rax, %rbx
	movq	%rbx, %rdi
	callq	_SWIFT$move_i64
	cmpq	%r13, %rbx
	jne	LBB3_19
## BB#14:                               ## %BBShadow79
	cmpq	%r14, %rax
	movq	-80(%rbp), %rsi         ## 8-byte Reload
	je	LBB3_15
	jmp	LBB3_26
LBB3_18:                                ## %BBShadow76
	xorl	%eax, %eax
	movq	%rax, -72(%rbp)         ## 8-byte Spill
	cmpq	%r15, %r14
	jmp	LBB3_20
LBB3_28:                                ## %BBShadow78
	testq	%r9, %r9
	jg	LBB3_26
LBB3_15:
	movq	-120(%rbp), %rax        ## 8-byte Reload
	movq	$0, 24(%rax)
	jmp	LBB3_21
LBB3_19:                                ## %BBShadow80
	xorl	%ecx, %ecx
	movq	%rcx, -72(%rbp)         ## 8-byte Spill
	cmpq	%r14, %rax
LBB3_20:                                ## %BBShadow80
	movl	$0, %esi
	je	LBB3_26
LBB3_21:
	xorl	%edx, %edx
	movq	-72(%rbp), %rbx         ## 8-byte Reload
	movq	%rbx, %rdi
	callq	_SWIFT$check_ptr
	movq	%rbx, %rax
	addq	$152, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB3_26:                                ## %Detected
	callq	_SWIFT$detected
LBB3_22:
Ltmp78:
	movq	%rax, %rbx
	leaq	-64(%rbp), %r14
	movl	$14, %edx
	movq	%r14, %rdi
	movq	-144(%rbp), %rsi        ## 8-byte Reload
	callq	_SWIFT$check_ptr
Ltmp79:
	movq	%r14, %rdi
	callq	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev
Ltmp80:
## BB#23:
	movq	%rbx, %rdi
	callq	__Unwind_Resume
LBB3_24:
Ltmp81:
	movq	%rax, %rbx
	movl	$15, %edx
	movq	%rbx, %rdi
	movq	%rbx, %rsi
	callq	_SWIFT$check_ptr
	movq	%rbx, %rdi
	callq	___clang_call_terminate
Lfunc_end2:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.align	2
GCC_except_table3:
Lexception2:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.byte	73                      ## @TType base offset
	.byte	3                       ## Call site Encoding = udata4
	.byte	65                      ## Call site table length
Lset84 = Lfunc_begin2-Lfunc_begin2      ## >> Call Site 1 <<
	.long	Lset84
Lset85 = Ltmp76-Lfunc_begin2            ##   Call between Lfunc_begin2 and Ltmp76
	.long	Lset85
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lset86 = Ltmp76-Lfunc_begin2            ## >> Call Site 2 <<
	.long	Lset86
Lset87 = Ltmp77-Ltmp76                  ##   Call between Ltmp76 and Ltmp77
	.long	Lset87
Lset88 = Ltmp78-Lfunc_begin2            ##     jumps to Ltmp78
	.long	Lset88
	.byte	0                       ##   On action: cleanup
Lset89 = Ltmp77-Lfunc_begin2            ## >> Call Site 3 <<
	.long	Lset89
Lset90 = Ltmp79-Ltmp77                  ##   Call between Ltmp77 and Ltmp79
	.long	Lset90
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lset91 = Ltmp79-Lfunc_begin2            ## >> Call Site 4 <<
	.long	Lset91
Lset92 = Ltmp80-Ltmp79                  ##   Call between Ltmp79 and Ltmp80
	.long	Lset92
Lset93 = Ltmp81-Lfunc_begin2            ##     jumps to Ltmp81
	.long	Lset93
	.byte	1                       ##   On action: 1
Lset94 = Ltmp80-Lfunc_begin2            ## >> Call Site 5 <<
	.long	Lset94
Lset95 = Lfunc_end2-Ltmp80              ##   Call between Ltmp80 and Lfunc_end2
	.long	Lset95
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.byte	1                       ## >> Action Record 1 <<
                                        ##   Catch TypeInfo 1
	.byte	0                       ##   No further actions
                                        ## >> Catch TypeInfos <<
	.long	0                       ## TypeInfo 1
	.align	2

	.section	__TEXT,__text,regular,pure_instructions
	.globl	_SWIFT$detected
	.align	4, 0x90
_SWIFT$detected:                        ## @"SWIFT$detected"
	.cfi_startproc
## BB#0:                                ## %entry
	pushq	%rax
Ltmp90:
	.cfi_def_cfa_offset 16
	movl	$2, %edi
	callq	_exit
	.cfi_endproc

	.globl	_SWIFT$move_i8
	.align	4, 0x90
_SWIFT$move_i8:                         ## @"SWIFT$move_i8"
	.cfi_startproc
## BB#0:                                ## %entry
	movb	%dil, %al
	retq
	.cfi_endproc

	.globl	_SWIFT$move_i16
	.align	4, 0x90
_SWIFT$move_i16:                        ## @"SWIFT$move_i16"
	.cfi_startproc
## BB#0:                                ## %entry
	movw	%di, %ax
	retq
	.cfi_endproc

	.globl	_SWIFT$move_i32
	.align	4, 0x90
_SWIFT$move_i32:                        ## @"SWIFT$move_i32"
	.cfi_startproc
## BB#0:                                ## %entry
	movl	%edi, %eax
	retq
	.cfi_endproc

	.globl	_SWIFT$move_i64
	.align	4, 0x90
_SWIFT$move_i64:                        ## @"SWIFT$move_i64"
	.cfi_startproc
## BB#0:                                ## %entry
	movq	%rdi, %rax
	retq
	.cfi_endproc

	.globl	_SWIFT$move_ptr
	.align	4, 0x90
_SWIFT$move_ptr:                        ## @"SWIFT$move_ptr"
	.cfi_startproc
## BB#0:                                ## %entry
	movq	%rdi, %rax
	retq
	.cfi_endproc

	.globl	_SWIFT$move_float
	.align	4, 0x90
_SWIFT$move_float:                      ## @"SWIFT$move_float"
	.cfi_startproc
## BB#0:                                ## %entry
	movss	%xmm0, %xmm0            ## xmm0 = xmm0[0,1,2,3]
	retq
	.cfi_endproc

	.globl	_SWIFT$move_double
	.align	4, 0x90
_SWIFT$move_double:                     ## @"SWIFT$move_double"
	.cfi_startproc
## BB#0:                                ## %entry
	movsd	%xmm0, %xmm0            ## xmm0 = xmm0[0,1]
	retq
	.cfi_endproc

	.globl	_SWIFT$move_dq
	.align	4, 0x90
_SWIFT$move_dq:                         ## @"SWIFT$move_dq"
	.cfi_startproc
## BB#0:                                ## %entry
	movdqa	%xmm0, %xmm0
	retq
	.cfi_endproc

	.globl	_SWIFT$move_pd
	.align	4, 0x90
_SWIFT$move_pd:                         ## @"SWIFT$move_pd"
	.cfi_startproc
## BB#0:                                ## %entry
	movapd	%xmm0, %xmm0
	retq
	.cfi_endproc

	.globl	_SWIFT$move_ps
	.align	4, 0x90
_SWIFT$move_ps:                         ## @"SWIFT$move_ps"
	.cfi_startproc
## BB#0:                                ## %entry
	movaps	%xmm0, %xmm0
	retq
	.cfi_endproc

	.globl	_SWIFT$check_i8
	.align	4, 0x90
_SWIFT$check_i8:                        ## @"SWIFT$check_i8"
	.cfi_startproc
## BB#0:                                ## %entry
	movzbl	%sil, %eax
	movzbl	%dil, %ecx
	cmpl	%eax, %ecx
	jne	LBB15_2
## BB#1:                                ## %if.end
	retq
LBB15_2:                                ## %if.then
	pushq	%rax
Ltmp91:
	.cfi_def_cfa_offset 16
	movl	$2, %edi
	callq	_exit
	.cfi_endproc

	.globl	_SWIFT$check_i16
	.align	4, 0x90
_SWIFT$check_i16:                       ## @"SWIFT$check_i16"
	.cfi_startproc
## BB#0:                                ## %entry
	movzwl	%si, %eax
	movzwl	%di, %ecx
	cmpl	%eax, %ecx
	jne	LBB16_2
## BB#1:                                ## %if.end
	retq
LBB16_2:                                ## %if.then
	pushq	%rax
Ltmp92:
	.cfi_def_cfa_offset 16
	movl	$2, %edi
	callq	_exit
	.cfi_endproc

	.globl	_SWIFT$check_i32
	.align	4, 0x90
_SWIFT$check_i32:                       ## @"SWIFT$check_i32"
	.cfi_startproc
## BB#0:                                ## %entry
	cmpl	%esi, %edi
	jne	LBB17_2
## BB#1:                                ## %if.end
	retq
LBB17_2:                                ## %if.then
	pushq	%rax
Ltmp93:
	.cfi_def_cfa_offset 16
	movl	$2, %edi
	callq	_exit
	.cfi_endproc

	.globl	_SWIFT$check_i64
	.align	4, 0x90
_SWIFT$check_i64:                       ## @"SWIFT$check_i64"
	.cfi_startproc
## BB#0:                                ## %entry
	cmpq	%rsi, %rdi
	jne	LBB18_2
## BB#1:                                ## %if.end
	retq
LBB18_2:                                ## %if.then
	pushq	%rax
Ltmp94:
	.cfi_def_cfa_offset 16
	movl	$2, %edi
	callq	_exit
	.cfi_endproc

	.globl	_SWIFT$check_ptr
	.align	4, 0x90
_SWIFT$check_ptr:                       ## @"SWIFT$check_ptr"
	.cfi_startproc
## BB#0:                                ## %entry
	cmpq	%rsi, %rdi
	jne	LBB19_2
## BB#1:                                ## %if.end
	retq
LBB19_2:                                ## %if.then
	pushq	%rax
Ltmp95:
	.cfi_def_cfa_offset 16
	movl	$2, %edi
	callq	_exit
	.cfi_endproc

	.globl	_SWIFT$check_double
	.align	4, 0x90
_SWIFT$check_double:                    ## @"SWIFT$check_double"
	.cfi_startproc
## BB#0:                                ## %entry
	ucomisd	%xmm1, %xmm0
	jne	LBB20_2
## BB#1:                                ## %if.end
	retq
LBB20_2:                                ## %if.then
	pushq	%rax
Ltmp96:
	.cfi_def_cfa_offset 16
	movl	$2, %edi
	callq	_exit
	.cfi_endproc

	.globl	_SWIFT$check_float
	.align	4, 0x90
_SWIFT$check_float:                     ## @"SWIFT$check_float"
	.cfi_startproc
## BB#0:                                ## %entry
	ucomiss	%xmm1, %xmm0
	jne	LBB21_2
## BB#1:                                ## %if.end
	retq
LBB21_2:                                ## %if.then
	pushq	%rax
Ltmp97:
	.cfi_def_cfa_offset 16
	movl	$2, %edi
	callq	_exit
	.cfi_endproc

	.globl	_SWIFT$check_dq
	.align	4, 0x90
_SWIFT$check_dq:                        ## @"SWIFT$check_dq"
	.cfi_startproc
## BB#0:                                ## %entry
	pshufd	$78, %xmm0, %xmm2       ## xmm2 = xmm0[2,3,0,1]
	movd	%xmm2, %rax
	movd	%xmm0, %rcx
	pshufd	$78, %xmm1, %xmm0       ## xmm0 = xmm1[2,3,0,1]
	movd	%xmm0, %rdx
	movd	%xmm1, %rsi
	xorq	%rcx, %rsi
	xorq	%rax, %rdx
	orq	%rsi, %rdx
	jne	LBB22_2
## BB#1:                                ## %if.end
	retq
LBB22_2:                                ## %if.then
	pushq	%rax
Ltmp98:
	.cfi_def_cfa_offset 16
	movl	$2, %edi
	callq	_exit
	.cfi_endproc

	.globl	_SWIFT$check_pd
	.align	4, 0x90
_SWIFT$check_pd:                        ## @"SWIFT$check_pd"
	.cfi_startproc
## BB#0:                                ## %entry
	pshufd	$78, %xmm0, %xmm2       ## xmm2 = xmm0[2,3,0,1]
	movd	%xmm2, %rax
	movd	%xmm0, %rcx
	pshufd	$78, %xmm1, %xmm0       ## xmm0 = xmm1[2,3,0,1]
	movd	%xmm0, %rdx
	movd	%xmm1, %rsi
	xorq	%rcx, %rsi
	xorq	%rax, %rdx
	orq	%rsi, %rdx
	jne	LBB23_2
## BB#1:                                ## %if.end
	retq
LBB23_2:                                ## %if.then
	pushq	%rax
Ltmp99:
	.cfi_def_cfa_offset 16
	movl	$2, %edi
	callq	_exit
	.cfi_endproc

	.globl	_SWIFT$check_ps
	.align	4, 0x90
_SWIFT$check_ps:                        ## @"SWIFT$check_ps"
	.cfi_startproc
## BB#0:                                ## %entry
	pshufd	$78, %xmm0, %xmm2       ## xmm2 = xmm0[2,3,0,1]
	movd	%xmm2, %rax
	movd	%xmm0, %rcx
	pshufd	$78, %xmm1, %xmm0       ## xmm0 = xmm1[2,3,0,1]
	movd	%xmm0, %rdx
	movd	%xmm1, %rsi
	xorq	%rcx, %rsi
	xorq	%rax, %rdx
	orq	%rsi, %rdx
	jne	LBB24_2
## BB#1:                                ## %if.end
	retq
LBB24_2:                                ## %if.then
	pushq	%rax
Ltmp100:
	.cfi_def_cfa_offset 16
	movl	$2, %edi
	callq	_exit
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"FizzBuzz"

L_.str.3:                               ## @.str.3
	.asciz	"\n"

L_.str.1:                               ## @.str.1
	.asciz	"Fizz"

L_.str.2:                               ## @.str.2
	.asciz	"Buzz"

	.section	__TEXT,__const
	.align	2                       ## @"SWIFT$global0"
_SWIFT$global0:
	.long	1                       ## 0x1


.subsections_via_symbols
