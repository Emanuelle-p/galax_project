	.file	"Initstate.cpp"
	.text
	.section	.text._ZNSt6vectorIfSaIfEED2Ev,"axG",@progbits,_ZNSt6vectorIfSaIfEED5Ev,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt6vectorIfSaIfEED2Ev
	.type	_ZNSt6vectorIfSaIfEED2Ev, @function
_ZNSt6vectorIfSaIfEED2Ev:
.LFB2838:
	.cfi_startproc
	endbr64
	movq	(%rdi), %rax
	testq	%rax, %rax
	je	.L3
	movq	16(%rdi), %rsi
	movq	%rax, %rdi
	subq	%rax, %rsi
	jmp	_ZdlPvm@PLT
	.p2align 4,,10
	.p2align 3
.L3:
	ret
	.cfi_endproc
.LFE2838:
	.size	_ZNSt6vectorIfSaIfEED2Ev, .-_ZNSt6vectorIfSaIfEED2Ev
	.weak	_ZNSt6vectorIfSaIfEED1Ev
	.set	_ZNSt6vectorIfSaIfEED1Ev,_ZNSt6vectorIfSaIfEED2Ev
	.section	.text._ZSt18__do_uninit_fill_nIPSt6vectorIfSaIfEEmS2_ET_S4_T0_RKT1_,"axG",@progbits,_ZSt18__do_uninit_fill_nIPSt6vectorIfSaIfEEmS2_ET_S4_T0_RKT1_,comdat
	.p2align 4
	.weak	_ZSt18__do_uninit_fill_nIPSt6vectorIfSaIfEEmS2_ET_S4_T0_RKT1_
	.type	_ZSt18__do_uninit_fill_nIPSt6vectorIfSaIfEEmS2_ET_S4_T0_RKT1_, @function
_ZSt18__do_uninit_fill_nIPSt6vectorIfSaIfEEmS2_ET_S4_T0_RKT1_:
.LFB3246:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA3246
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movq	%rdi, 8(%rsp)
	testq	%rsi, %rsi
	je	.L19
	movq	(%rdx), %r14
	movq	%rsi, %r13
	movq	%rdx, %r12
	movq	%rdi, %rbp
	movabsq	$9223372036854775804, %r15
	jmp	.L14
	.p2align 4,,10
	.p2align 3
.L26:
	cmpq	%rbx, %r15
	jb	.L25
	movq	%rbx, %rdi
.LEHB0:
	call	_Znwm@PLT
	movq	%rax, %rcx
.L7:
	addq	%rcx, %rbx
	vmovq	%rcx, %xmm1
	movq	%rbx, 16(%rbp)
	vpunpcklqdq	%xmm1, %xmm1, %xmm0
	vmovdqu	%xmm0, 0(%rbp)
	movq	(%r12), %r14
	movq	8(%r12), %rbx
	subq	%r14, %rbx
	cmpq	$4, %rbx
	jle	.L10
	movq	%rcx, %rdi
	movq	%rbx, %rdx
	movq	%r14, %rsi
	call	memmove@PLT
	movq	%rax, %rcx
.L11:
	addq	%rbx, %rcx
	addq	$24, %rbp
	movq	%rcx, -16(%rbp)
	decq	%r13
	je	.L5
.L14:
	movq	8(%r12), %rbx
	vpxor	%xmm0, %xmm0, %xmm0
	movq	$0, 16(%rbp)
	vmovdqu	%xmm0, 0(%rbp)
	subq	%r14, %rbx
	jne	.L26
	xorl	%ecx, %ecx
	jmp	.L7
	.p2align 4,,10
	.p2align 3
.L19:
	movq	%rdi, %rbp
.L5:
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%rbp, %rax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L10:
	.cfi_restore_state
	jne	.L11
	vmovss	(%r14), %xmm0
	vmovss	%xmm0, (%rcx)
	jmp	.L11
	.p2align 4,,10
	.p2align 3
.L25:
	testq	%rbx, %rbx
	jns	.L9
	call	_ZSt28__throw_bad_array_new_lengthv@PLT
	.p2align 4,,10
	.p2align 3
.L9:
	call	_ZSt17__throw_bad_allocv@PLT
.LEHE0:
.L21:
	endbr64
	movq	%rax, %rdi
.L15:
	vzeroupper
	call	__cxa_begin_catch@PLT
.L16:
	cmpq	%rbp, 8(%rsp)
	je	.L27
	movq	8(%rsp), %rbx
	movq	%rbx, %rdi
	call	_ZNSt6vectorIfSaIfEED1Ev
	movq	%rbx, %rax
	addq	$24, %rax
	movq	%rax, 8(%rsp)
	jmp	.L16
.L27:
.LEHB1:
	call	__cxa_rethrow@PLT
.LEHE1:
.L22:
	endbr64
	movq	%rax, %rbx
.L18:
	vzeroupper
	call	__cxa_end_catch@PLT
	movq	%rbx, %rdi
.LEHB2:
	call	_Unwind_Resume@PLT
.LEHE2:
	.cfi_endproc
.LFE3246:
	.globl	__gxx_personality_v0
	.section	.gcc_except_table._ZSt18__do_uninit_fill_nIPSt6vectorIfSaIfEEmS2_ET_S4_T0_RKT1_,"aG",@progbits,_ZSt18__do_uninit_fill_nIPSt6vectorIfSaIfEEmS2_ET_S4_T0_RKT1_,comdat
	.align 4
.LLSDA3246:
	.byte	0xff
	.byte	0x9b
	.uleb128 .LLSDATT3246-.LLSDATTD3246
.LLSDATTD3246:
	.byte	0x1
	.uleb128 .LLSDACSE3246-.LLSDACSB3246
.LLSDACSB3246:
	.uleb128 .LEHB0-.LFB3246
	.uleb128 .LEHE0-.LEHB0
	.uleb128 .L21-.LFB3246
	.uleb128 0x1
	.uleb128 .LEHB1-.LFB3246
	.uleb128 .LEHE1-.LEHB1
	.uleb128 .L22-.LFB3246
	.uleb128 0
	.uleb128 .LEHB2-.LFB3246
	.uleb128 .LEHE2-.LEHB2
	.uleb128 0
	.uleb128 0
.LLSDACSE3246:
	.byte	0x1
	.byte	0
	.align 4
	.long	0

.LLSDATT3246:
	.section	.text._ZSt18__do_uninit_fill_nIPSt6vectorIfSaIfEEmS2_ET_S4_T0_RKT1_,"axG",@progbits,_ZSt18__do_uninit_fill_nIPSt6vectorIfSaIfEEmS2_ET_S4_T0_RKT1_,comdat
	.size	_ZSt18__do_uninit_fill_nIPSt6vectorIfSaIfEEmS2_ET_S4_T0_RKT1_, .-_ZSt18__do_uninit_fill_nIPSt6vectorIfSaIfEEmS2_ET_S4_T0_RKT1_
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"basic_string::append"
.LC1:
	.string	"/data/dubinski.tab"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC2:
	.string	"cannot create std::vector larger than max_size()"
	.section	.text.unlikely,"ax",@progbits
	.align 2
.LCOLDB9:
	.text
.LHOTB9:
	.align 2
	.p2align 4
	.globl	_ZN9InitstateC2Ei
	.type	_ZN9InitstateC2Ei, @function
_ZN9InitstateC2Ei:
.LFB2552:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA2552
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	xorl	%edx, %edx
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	movq	%rdi, %r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	andq	$-32, %rsp
	subq	$704, %rsp
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movl	%esi, 84(%rsp)
	leaq	160(%rsp), %r13
	leaq	128(%rsp), %r15
	movq	%r15, %rsi
	movq	%r13, %rdi
	movq	%fs:40, %rax
	movq	%rax, 696(%rsp)
	xorl	%eax, %eax
	leaq	176(%rsp), %rax
	movq	$27, 128(%rsp)
	movq	%rax, 160(%rsp)
	movq	%rax, 96(%rsp)
.LEHB3:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm@PLT
.LEHE3:
	movq	128(%rsp), %rdx
	vmovdqa	.LC7(%rip), %xmm0
	movq	%rax, 160(%rsp)
	movq	%rdx, 176(%rsp)
	vmovdqu	%xmm0, (%rax)
	vmovdqa	.LC8(%rip), %xmm0
	vmovdqu	%xmm0, 11(%rax)
	movq	128(%rsp), %rax
	movq	160(%rsp), %rdx
	movq	%rax, 168(%rsp)
	movb	$0, (%rdx,%rax)
	movabsq	$4611686018427387903, %rax
	subq	168(%rsp), %rax
	cmpq	$17, %rax
	jbe	.L168
	movl	$18, %edx
	leaq	.LC1(%rip), %rsi
	movq	%r13, %rdi
.LEHB4:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_appendEPKcm@PLT
.LEHE4:
	leaq	16(%r14), %rcx
	leaq	16(%rax), %rdi
	movq	8(%rax), %rsi
	movq	%rcx, (%r14)
	movq	(%rax), %rdx
	cmpq	%rdi, %rdx
	je	.L169
	movq	%rdx, (%r14)
	movq	16(%rax), %rdx
	movq	%rdx, 16(%r14)
.L38:
	movq	%rdi, (%rax)
	movq	%rsi, 8(%r14)
	movb	$0, 16(%rax)
	movq	$0, 8(%rax)
	movq	96(%rsp), %rax
	movq	160(%rsp), %rdi
	cmpq	%rax, %rdi
	je	.L39
	movq	176(%rsp), %rax
	leaq	1(%rax), %rsi
	call	_ZdlPvm@PLT
.L39:
	movslq	84(%rsp), %rax
	movl	$81920, 32(%r14)
	movq	%rax, 104(%rsp)
	shrq	$61, %rax
	jne	.L170
	vpxor	%xmm0, %xmm0, %xmm0
	cmpq	$0, 104(%rsp)
	movq	$0, 56(%r14)
	vmovdqu	%xmm0, 40(%r14)
	je	.L171
	movq	104(%rsp), %rax
	leaq	0(,%rax,4), %rbx
	movq	%rbx, %rdi
.LEHB5:
	call	_Znwm@PLT
.LEHE5:
	leaq	(%rax,%rbx), %r12
	cmpq	$1, 104(%rsp)
	movq	%rax, 40(%r14)
	leaq	4(%rax), %rdi
	movq	%r12, 56(%r14)
	movl	$0x00000000, (%rax)
	je	.L44
	cmpq	%r12, %rdi
	je	.L172
	leaq	-4(%rbx), %rdx
	xorl	%esi, %esi
	call	memset@PLT
	movq	%r12, 48(%r14)
.L160:
	leaq	64(%r14), %rax
	movq	$0, 80(%r14)
	vpxor	%xmm0, %xmm0, %xmm0
	movq	%rax, 64(%rsp)
	vmovdqu	%xmm0, 64(%r14)
.L47:
	movq	%rbx, %rdi
.LEHB6:
	call	_Znwm@PLT
.LEHE6:
	movq	104(%rsp), %r12
	leaq	(%rax,%rbx), %rcx
	movq	%rax, 64(%r14)
	leaq	4(%rax), %rdi
	movq	%rcx, 80(%r14)
	movl	$0x00000000, (%rax)
	decq	%r12
	je	.L48
	cmpq	%rcx, %rdi
	je	.L51
	leaq	-4(%rbx), %rdx
	xorl	%esi, %esi
	movq	%rcx, 120(%rsp)
	call	memset@PLT
	movq	120(%rsp), %rcx
.L51:
	movq	%rcx, 72(%r14)
.L161:
	leaq	88(%r14), %rax
	vpxor	%xmm0, %xmm0, %xmm0
	movq	%rbx, %rdi
	movq	%rax, 48(%rsp)
	movq	$0, 104(%r14)
	vmovdqu	%xmm0, 88(%r14)
.LEHB7:
	call	_Znwm@PLT
.LEHE7:
	leaq	(%rax,%rbx), %rcx
	movq	%rax, 88(%r14)
	leaq	4(%rax), %rdi
	movq	%rcx, 104(%r14)
	movl	$0x00000000, (%rax)
	testq	%r12, %r12
	je	.L52
	cmpq	%rcx, %rdi
	je	.L55
	leaq	-4(%rbx), %rdx
	xorl	%esi, %esi
	movq	%rcx, 120(%rsp)
	call	memset@PLT
	movq	120(%rsp), %rcx
.L55:
	movq	%rcx, 96(%r14)
.L162:
	leaq	112(%r14), %rax
	vpxor	%xmm0, %xmm0, %xmm0
	movq	%rbx, %rdi
	movq	%rax, 40(%rsp)
	movq	$0, 128(%r14)
	vmovdqu	%xmm0, 112(%r14)
.LEHB8:
	call	_Znwm@PLT
.LEHE8:
	leaq	(%rax,%rbx), %rcx
	movq	%rax, 112(%r14)
	leaq	4(%rax), %rdi
	movq	%rcx, 128(%r14)
	movl	$0x00000000, (%rax)
	testq	%r12, %r12
	je	.L56
	cmpq	%rcx, %rdi
	je	.L59
	leaq	-4(%rbx), %rdx
	xorl	%esi, %esi
	movq	%rcx, 120(%rsp)
	call	memset@PLT
	movq	120(%rsp), %rcx
.L59:
	movq	%rcx, 120(%r14)
.L163:
	leaq	136(%r14), %rax
	vpxor	%xmm0, %xmm0, %xmm0
	movq	%rbx, %rdi
	movq	%rax, 24(%rsp)
	movq	$0, 152(%r14)
	vmovdqu	%xmm0, 136(%r14)
.LEHB9:
	call	_Znwm@PLT
.LEHE9:
	leaq	(%rax,%rbx), %rcx
	movq	%rax, 136(%r14)
	leaq	4(%rax), %rdi
	movq	%rcx, 152(%r14)
	movl	$0x00000000, (%rax)
	testq	%r12, %r12
	je	.L60
	cmpq	%rdi, %rcx
	je	.L63
	leaq	-4(%rbx), %rdx
	xorl	%esi, %esi
	movq	%rcx, 120(%rsp)
	call	memset@PLT
	movq	120(%rsp), %rcx
.L63:
	movq	%rcx, 144(%r14)
.L164:
	leaq	160(%r14), %rax
	vpxor	%xmm0, %xmm0, %xmm0
	movq	%rbx, %rdi
	movq	%rax, 32(%rsp)
	movq	$0, 176(%r14)
	vmovdqu	%xmm0, 160(%r14)
.LEHB10:
	call	_Znwm@PLT
.LEHE10:
	leaq	(%rax,%rbx), %rcx
	movq	%rax, 160(%r14)
	leaq	4(%rax), %rdi
	movq	%rcx, 176(%r14)
	movl	$0x00000000, (%rax)
	testq	%r12, %r12
	je	.L64
	cmpq	%rdi, %rcx
	je	.L67
	leaq	-4(%rbx), %rdx
	xorl	%esi, %esi
	movq	%rcx, 120(%rsp)
	call	memset@PLT
	movq	120(%rsp), %rcx
.L67:
	movq	%rcx, 168(%r14)
.L165:
	leaq	184(%r14), %rax
	vpxor	%xmm0, %xmm0, %xmm0
	movq	%rbx, %rdi
	movq	%rax, 16(%rsp)
	movq	$0, 200(%r14)
	vmovdqu	%xmm0, 184(%r14)
.LEHB11:
	call	_Znwm@PLT
.LEHE11:
	leaq	(%rax,%rbx), %rcx
	movq	%rax, 184(%r14)
	leaq	4(%rax), %rdi
	movq	%rcx, 200(%r14)
	movl	$0x00000000, (%rax)
	testq	%r12, %r12
	je	.L43
	cmpq	%rcx, %rdi
	je	.L68
	leaq	-4(%rbx), %rdx
	xorl	%esi, %esi
	movq	%rcx, 120(%rsp)
	call	memset@PLT
	movq	120(%rsp), %rcx
.L68:
	movq	%rcx, %rdi
.L43:
	movq	%rdi, 192(%r14)
	leaq	416(%rsp), %rbx
	movq	%rbx, %rdi
	movq	%rbx, 72(%rsp)
	call	_ZNSt8ios_baseC2Ev@PLT
	xorl	%edx, %edx
	leaq	16+_ZTVSt9basic_iosIcSt11char_traitsIcEE(%rip), %rax
	vpxor	%xmm0, %xmm0, %xmm0
	movw	%dx, 640(%rsp)
	movq	16+_ZTTSt14basic_ifstreamIcSt11char_traitsIcEE(%rip), %rcx
	xorl	%esi, %esi
	movq	%rax, 416(%rsp)
	movq	8+_ZTTSt14basic_ifstreamIcSt11char_traitsIcEE(%rip), %rax
	vmovdqu	%ymm0, 648(%rsp)
	movq	%rax, 160(%rsp)
	movq	-24(%rax), %rax
	movq	$0, 632(%rsp)
	movq	%rcx, 160(%rsp,%rax)
	movq	8+_ZTTSt14basic_ifstreamIcSt11char_traitsIcEE(%rip), %rax
	movq	$0, 168(%rsp)
	movq	-24(%rax), %rdi
	addq	%r13, %rdi
	vzeroupper
.LEHB12:
	call	_ZNSt9basic_iosIcSt11char_traitsIcEE4initEPSt15basic_streambufIcS1_E@PLT
.LEHE12:
	leaq	24+_ZTVSt14basic_ifstreamIcSt11char_traitsIcEE(%rip), %rax
	movq	96(%rsp), %r12
	movq	%rax, 160(%rsp)
	addq	$40, %rax
	movq	%rax, 416(%rsp)
	movq	%r12, %rdi
.LEHB13:
	call	_ZNSt13basic_filebufIcSt11char_traitsIcEEC1Ev@PLT
.LEHE13:
	movq	%r12, %rsi
	movq	%rbx, %rdi
.LEHB14:
	call	_ZNSt9basic_iosIcSt11char_traitsIcEE4initEPSt15basic_streambufIcS1_E@PLT
.LEHE14:
	movq	(%r14), %rsi
	movq	96(%rsp), %rdi
	movl	$8, %edx
.LEHB15:
	call	_ZNSt13basic_filebufIcSt11char_traitsIcEE4openEPKcSt13_Ios_Openmode@PLT
	movq	160(%rsp), %rdx
	movq	-24(%rdx), %rdi
	addq	%r13, %rdi
	testq	%rax, %rax
	je	.L173
	xorl	%esi, %esi
	call	_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate@PLT
.L75:
	vpxor	%xmm0, %xmm0, %xmm0
	movl	$28, %edi
	vmovdqu	%xmm0, 136(%rsp)
	call	_Znwm@PLT
.LEHE15:
	movq	%rax, %rbx
	movq	%rax, 128(%rsp)
	movslq	32(%r14), %r12
	leaq	28(%rax), %rax
	movq	%rax, 144(%rsp)
	vpxor	%xmm0, %xmm0, %xmm0
	movq	%rax, 136(%rsp)
	movabsq	$384307168202282325, %rax
	movl	$0x00000000, (%rbx)
	movq	$0, 20(%rbx)
	vmovdqu	%xmm0, 4(%rbx)
	cmpq	%r12, %rax
	jb	.L174
	leaq	(%r12,%r12,2), %rax
	leaq	0(,%rax,8), %rdi
	movq	%rdi, 56(%rsp)
	testq	%r12, %r12
	je	.L115
.LEHB16:
	call	_Znwm@PLT
.LEHE16:
	movq	%rax, 88(%rsp)
.L78:
	movq	%r12, %rsi
	movq	88(%rsp), %r12
	movq	%r15, %rdx
	movq	%r12, %rdi
.LEHB17:
	call	_ZSt18__do_uninit_fill_nIPSt6vectorIfSaIfEEmS2_ET_S4_T0_RKT1_
.LEHE17:
	movq	%rax, %r15
	movl	$28, %esi
	movq	%rbx, %rdi
	movq	%rax, 120(%rsp)
	call	_ZdlPvm@PLT
	movq	%r15, %rax
	movabsq	$-6148914691236517205, %rdx
	subq	%r12, %rax
	sarq	$3, %rax
	imulq	%rdx, %rax
	movq	%rax, 112(%rsp)
	cmpq	%r12, %r15
	je	.L79
	xorl	%r15d, %r15d
	.p2align 4,,10
	.p2align 3
.L80:
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L84:
	movq	(%r12), %rsi
	movq	%r13, %rdi
	addq	%rbx, %rsi
.LEHB18:
	call	_ZNSi10_M_extractIfEERSiRT_@PLT
.LEHE18:
	addq	$4, %rbx
	cmpq	$28, %rbx
	jne	.L84
	testb	$2, 448(%rsp)
	jne	.L85
	movq	112(%rsp), %rax
	incq	%r15
	addq	$24, %r12
	cmpq	%rax, %r15
	jb	.L80
.L85:
	movl	32(%r14), %eax
	cltd
	idivl	84(%rsp)
	cmpq	$0, 104(%rsp)
	cltq
	je	.L86
.L113:
	leaq	(%rax,%rax,2), %rsi
	movq	40(%r14), %rbx
	movq	64(%r14), %r11
	xorl	%eax, %eax
	movq	88(%r14), %r10
	movq	112(%r14), %r9
	salq	$3, %rsi
	movq	136(%r14), %r8
	movq	160(%r14), %rdi
	movq	184(%r14), %r12
	movq	88(%rsp), %rcx
	movq	104(%rsp), %r13
	.p2align 4,,10
	.p2align 3
.L88:
	movq	(%rcx), %rdx
	addq	%rsi, %rcx
	vmovss	4(%rdx), %xmm0
	vmovss	%xmm0, (%rbx,%rax,4)
	vmovss	8(%rdx), %xmm0
	vmovss	%xmm0, (%r11,%rax,4)
	vmovss	12(%rdx), %xmm0
	vmovss	%xmm0, (%r10,%rax,4)
	vmovss	16(%rdx), %xmm0
	vmovss	%xmm0, (%r9,%rax,4)
	vmovss	20(%rdx), %xmm0
	vmovss	%xmm0, (%r8,%rax,4)
	vmovss	24(%rdx), %xmm0
	vmovss	%xmm0, (%rdi,%rax,4)
	vmovss	(%rdx), %xmm0
	vmovss	%xmm0, (%r12,%rax,4)
	incq	%rax
	cmpq	%rax, %r13
	jne	.L88
	movq	88(%rsp), %rcx
	cmpq	%rcx, 120(%rsp)
	je	.L87
.L86:
	movq	88(%rsp), %rbx
	.p2align 4,,10
	.p2align 3
.L94:
	movq	(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L92
	movq	16(%rbx), %rsi
	addq	$24, %rbx
	subq	%rdi, %rsi
	call	_ZdlPvm@PLT
	movq	120(%rsp), %rax
	cmpq	%rax, %rbx
	jne	.L94
.L87:
	cmpq	$0, 88(%rsp)
	je	.L91
	movq	56(%rsp), %rsi
	movq	88(%rsp), %rdi
	call	_ZdlPvm@PLT
.L91:
	leaq	24+_ZTVSt14basic_ifstreamIcSt11char_traitsIcEE(%rip), %rax
	movq	96(%rsp), %rdi
	movq	%rax, 160(%rsp)
	addq	$40, %rax
	movq	%rax, 416(%rsp)
	leaq	16+_ZTVSt13basic_filebufIcSt11char_traitsIcEE(%rip), %rax
	movq	%rax, 176(%rsp)
.LEHB19:
	call	_ZNSt13basic_filebufIcSt11char_traitsIcEE5closeEv@PLT
.LEHE19:
.L96:
	leaq	280(%rsp), %rdi
	call	_ZNSt12__basic_fileIcED1Ev@PLT
	leaq	16+_ZTVSt15basic_streambufIcSt11char_traitsIcEE(%rip), %rax
	leaq	232(%rsp), %rdi
	movq	%rax, 176(%rsp)
	call	_ZNSt6localeD1Ev@PLT
	movq	8+_ZTTSt14basic_ifstreamIcSt11char_traitsIcEE(%rip), %rax
	movq	16+_ZTTSt14basic_ifstreamIcSt11char_traitsIcEE(%rip), %rcx
	movq	72(%rsp), %rdi
	movq	%rax, 160(%rsp)
	movq	-24(%rax), %rax
	movq	%rcx, 160(%rsp,%rax)
	leaq	16+_ZTVSt9basic_iosIcSt11char_traitsIcEE(%rip), %rax
	movq	%rax, 416(%rsp)
	movq	$0, 168(%rsp)
	call	_ZNSt8ios_baseD2Ev@PLT
	movq	696(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L155
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L92:
	.cfi_restore_state
	addq	$24, %rbx
	cmpq	%rbx, 120(%rsp)
	jne	.L94
	jmp	.L87
	.p2align 4,,10
	.p2align 3
.L171:
	leaq	64(%r14), %rax
	movq	$0, 184(%r14)
	vpxor	%xmm1, %xmm1, %xmm1
	xorl	%edi, %edi
	movq	%rax, 64(%rsp)
	leaq	88(%r14), %rax
	movq	%rax, 48(%rsp)
	leaq	112(%r14), %rax
	movq	%rax, 40(%rsp)
	leaq	136(%r14), %rax
	movq	%rax, 24(%rsp)
	leaq	160(%r14), %rax
	movq	%rax, 32(%rsp)
	leaq	184(%r14), %rax
	movq	%rax, 16(%rsp)
	movq	$0, 200(%r14)
	vmovdqu	%ymm1, 40(%r14)
	vmovdqu	%ymm1, 72(%r14)
	vmovdqu	%ymm1, 104(%r14)
	vmovdqu	%ymm1, 136(%r14)
	vmovdqu	%xmm0, 168(%r14)
	vzeroupper
	jmp	.L43
.L115:
	movq	$0, 88(%rsp)
	jmp	.L78
.L173:
	movl	32(%rdi), %esi
	orl	$4, %esi
.LEHB20:
	call	_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate@PLT
.LEHE20:
	jmp	.L75
.L44:
	leaq	64(%r14), %rax
	vpxor	%xmm0, %xmm0, %xmm0
	movq	%rdi, 48(%r14)
	movl	$4, %ebx
	movq	%rax, 64(%rsp)
	movq	$0, 80(%r14)
	vmovdqu	%xmm0, 64(%r14)
	jmp	.L47
.L169:
	leaq	1(%rsi), %rdx
	cmpl	$8, %edx
	jnb	.L32
	testb	$4, %dl
	jne	.L175
	testl	%edx, %edx
	je	.L38
	movzbl	16(%rax), %esi
	movb	%sil, 16(%r14)
	testb	$2, %dl
	je	.L159
	movl	%edx, %edx
	movzwl	-2(%rdi,%rdx), %esi
	movw	%si, -2(%rcx,%rdx)
	movq	8(%rax), %rsi
	jmp	.L38
	.p2align 4,,10
	.p2align 3
.L48:
	movq	%rdi, 72(%r14)
	jmp	.L161
.L52:
	movq	%rdi, 96(%r14)
	jmp	.L162
.L56:
	movq	%rdi, 120(%r14)
	jmp	.L163
.L60:
	movq	%rdi, 144(%r14)
	jmp	.L164
.L64:
	movq	%rdi, 168(%r14)
	jmp	.L165
.L32:
	movq	16(%rax), %rsi
	movq	%rsi, 16(%r14)
	movl	%edx, %esi
	movq	-8(%rdi,%rsi), %r8
	movq	%r8, -8(%rcx,%rsi)
	leaq	24(%r14), %rsi
	movq	%rdi, %r8
	andq	$-8, %rsi
	subq	%rsi, %rcx
	addl	%ecx, %edx
	subq	%rcx, %r8
	andl	$-8, %edx
	cmpl	$8, %edx
	jb	.L159
	andl	$-8, %edx
	xorl	%ecx, %ecx
.L36:
	movl	%ecx, %r9d
	addl	$8, %ecx
	movq	(%r8,%r9), %r10
	movq	%r10, (%rsi,%r9)
	cmpl	%edx, %ecx
	jb	.L36
.L159:
	movq	8(%rax), %rsi
	jmp	.L38
.L172:
	movq	%rdi, 48(%r14)
	jmp	.L160
.L79:
	movl	32(%r14), %eax
	cltd
	idivl	84(%rsp)
	cmpq	$0, 104(%rsp)
	cltq
	jne	.L113
	jmp	.L87
.L175:
	movl	16(%rax), %esi
	movl	%edx, %edx
	movl	%esi, 16(%r14)
	movl	-4(%rdi,%rdx), %esi
	movl	%esi, -4(%rcx,%rdx)
	movq	8(%rax), %rsi
	jmp	.L38
.L170:
	movq	696(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L155
	leaq	.LC2(%rip), %rdi
.LEHB21:
	call	_ZSt20__throw_length_errorPKc@PLT
.LEHE21:
.L168:
	movq	696(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L155
	leaq	.LC0(%rip), %rdi
.LEHB22:
	call	_ZSt20__throw_length_errorPKc@PLT
.LEHE22:
.L174:
	movq	696(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L155
	leaq	.LC2(%rip), %rdi
.LEHB23:
	call	_ZSt20__throw_length_errorPKc@PLT
.LEHE23:
.L155:
	call	__stack_chk_fail@PLT
.L118:
	endbr64
	movq	%rax, %rbx
	vzeroupper
	jmp	.L110
.L122:
	endbr64
	movq	%rax, %rbx
	vzeroupper
	jmp	.L106
.L124:
	endbr64
	movq	%rax, %rbx
	vzeroupper
	jmp	.L99
.L131:
	endbr64
	movq	%rax, %rdi
	jmp	.L95
.L121:
	endbr64
	movq	%rax, %rbx
	vzeroupper
	jmp	.L107
.L120:
	endbr64
	movq	%rax, %rbx
	vzeroupper
	jmp	.L108
.L126:
	endbr64
	movq	%rax, %rbx
	jmp	.L100
.L116:
	endbr64
	movq	%rax, %rbx
	jmp	.L97
.L119:
	endbr64
	movq	%rax, %rbx
	vzeroupper
	jmp	.L109
.L128:
	endbr64
	movq	%rax, %rbx
	vzeroupper
	jmp	.L71
.L129:
	endbr64
	movq	%rax, %rbx
	jmp	.L70
.L125:
	endbr64
	movq	%rax, %rbx
	vzeroupper
	jmp	.L83
.L130:
	endbr64
	movq	%rax, %rbx
	jmp	.L81
.L123:
	endbr64
	movq	%rax, %rbx
	vzeroupper
	jmp	.L105
.L127:
	endbr64
	movq	%rax, %rbx
	vzeroupper
	jmp	.L72
.L117:
	endbr64
	movq	%rax, %rbx
	vzeroupper
	jmp	.L111
	.section	.gcc_except_table,"a",@progbits
	.align 4
.LLSDA2552:
	.byte	0xff
	.byte	0x9b
	.uleb128 .LLSDATT2552-.LLSDATTD2552
.LLSDATTD2552:
	.byte	0x1
	.uleb128 .LLSDACSE2552-.LLSDACSB2552
.LLSDACSB2552:
	.uleb128 .LEHB3-.LFB2552
	.uleb128 .LEHE3-.LEHB3
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB4-.LFB2552
	.uleb128 .LEHE4-.LEHB4
	.uleb128 .L116-.LFB2552
	.uleb128 0
	.uleb128 .LEHB5-.LFB2552
	.uleb128 .LEHE5-.LEHB5
	.uleb128 .L117-.LFB2552
	.uleb128 0
	.uleb128 .LEHB6-.LFB2552
	.uleb128 .LEHE6-.LEHB6
	.uleb128 .L118-.LFB2552
	.uleb128 0
	.uleb128 .LEHB7-.LFB2552
	.uleb128 .LEHE7-.LEHB7
	.uleb128 .L119-.LFB2552
	.uleb128 0
	.uleb128 .LEHB8-.LFB2552
	.uleb128 .LEHE8-.LEHB8
	.uleb128 .L120-.LFB2552
	.uleb128 0
	.uleb128 .LEHB9-.LFB2552
	.uleb128 .LEHE9-.LEHB9
	.uleb128 .L121-.LFB2552
	.uleb128 0
	.uleb128 .LEHB10-.LFB2552
	.uleb128 .LEHE10-.LEHB10
	.uleb128 .L122-.LFB2552
	.uleb128 0
	.uleb128 .LEHB11-.LFB2552
	.uleb128 .LEHE11-.LEHB11
	.uleb128 .L123-.LFB2552
	.uleb128 0
	.uleb128 .LEHB12-.LFB2552
	.uleb128 .LEHE12-.LEHB12
	.uleb128 .L127-.LFB2552
	.uleb128 0
	.uleb128 .LEHB13-.LFB2552
	.uleb128 .LEHE13-.LEHB13
	.uleb128 .L128-.LFB2552
	.uleb128 0
	.uleb128 .LEHB14-.LFB2552
	.uleb128 .LEHE14-.LEHB14
	.uleb128 .L129-.LFB2552
	.uleb128 0
	.uleb128 .LEHB15-.LFB2552
	.uleb128 .LEHE15-.LEHB15
	.uleb128 .L124-.LFB2552
	.uleb128 0
	.uleb128 .LEHB16-.LFB2552
	.uleb128 .LEHE16-.LEHB16
	.uleb128 .L125-.LFB2552
	.uleb128 0
	.uleb128 .LEHB17-.LFB2552
	.uleb128 .LEHE17-.LEHB17
	.uleb128 .L130-.LFB2552
	.uleb128 0
	.uleb128 .LEHB18-.LFB2552
	.uleb128 .LEHE18-.LEHB18
	.uleb128 .L126-.LFB2552
	.uleb128 0
	.uleb128 .LEHB19-.LFB2552
	.uleb128 .LEHE19-.LEHB19
	.uleb128 .L131-.LFB2552
	.uleb128 0x1
	.uleb128 .LEHB20-.LFB2552
	.uleb128 .LEHE20-.LEHB20
	.uleb128 .L124-.LFB2552
	.uleb128 0
	.uleb128 .LEHB21-.LFB2552
	.uleb128 .LEHE21-.LEHB21
	.uleb128 .L117-.LFB2552
	.uleb128 0
	.uleb128 .LEHB22-.LFB2552
	.uleb128 .LEHE22-.LEHB22
	.uleb128 .L116-.LFB2552
	.uleb128 0
	.uleb128 .LEHB23-.LFB2552
	.uleb128 .LEHE23-.LEHB23
	.uleb128 .L125-.LFB2552
	.uleb128 0
.LLSDACSE2552:
	.byte	0x1
	.byte	0
	.align 4
	.long	0

.LLSDATT2552:
	.text
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDAC2552
	.type	_ZN9InitstateC2Ei.cold, @function
_ZN9InitstateC2Ei.cold:
.LFSB2552:
.L81:
	.cfi_def_cfa 6, 16
	.cfi_offset 3, -56
	.cfi_offset 6, -16
	.cfi_offset 12, -48
	.cfi_offset 13, -40
	.cfi_offset 14, -32
	.cfi_offset 15, -24
	cmpq	$0, 88(%rsp)
	je	.L156
	movq	56(%rsp), %rsi
	movq	88(%rsp), %rdi
	vzeroupper
	call	_ZdlPvm@PLT
.L83:
	movq	%r15, %rdi
	call	_ZNSt6vectorIfSaIfEED1Ev
.L99:
	movq	%r13, %rdi
	call	_ZNSt14basic_ifstreamIcSt11char_traitsIcEED1Ev@PLT
.L73:
	movq	16(%rsp), %rdi
	call	_ZNSt6vectorIfSaIfEED1Ev
.L105:
	movq	32(%rsp), %rdi
	call	_ZNSt6vectorIfSaIfEED1Ev
.L106:
	movq	24(%rsp), %rdi
	call	_ZNSt6vectorIfSaIfEED1Ev
.L107:
	movq	40(%rsp), %rdi
	call	_ZNSt6vectorIfSaIfEED1Ev
.L108:
	movq	48(%rsp), %rdi
	call	_ZNSt6vectorIfSaIfEED1Ev
.L109:
	movq	64(%rsp), %rdi
	call	_ZNSt6vectorIfSaIfEED1Ev
.L110:
	leaq	40(%r14), %rdi
	call	_ZNSt6vectorIfSaIfEED1Ev
.L111:
	movq	%r14, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@PLT
	movq	696(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L167
.L112:
	movq	%rbx, %rdi
.LEHB24:
	call	_Unwind_Resume@PLT
.LEHE24:
.L97:
	movq	%r13, %rdi
	vzeroupper
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@PLT
	movq	696(%rsp), %rax
	subq	%fs:40, %rax
	je	.L112
.L167:
	call	__stack_chk_fail@PLT
.L95:
	vzeroupper
	call	__cxa_begin_catch@PLT
	call	__cxa_end_catch@PLT
	jmp	.L96
.L100:
	movq	88(%rsp), %r12
	vzeroupper
.L101:
	movq	(%r12), %rdi
	movq	16(%r12), %rsi
	subq	%rdi, %rsi
	testq	%rdi, %rdi
	je	.L102
	call	_ZdlPvm@PLT
.L102:
	addq	$24, %r12
	cmpq	%r12, 120(%rsp)
	jne	.L101
	cmpq	$0, 88(%rsp)
	je	.L99
	movq	56(%rsp), %rsi
	movq	88(%rsp), %rdi
	call	_ZdlPvm@PLT
	jmp	.L99
.L70:
	movq	96(%rsp), %rdi
	vzeroupper
	call	_ZNSt13basic_filebufIcSt11char_traitsIcEED1Ev@PLT
.L71:
	movq	8+_ZTTSt14basic_ifstreamIcSt11char_traitsIcEE(%rip), %rax
	movq	16+_ZTTSt14basic_ifstreamIcSt11char_traitsIcEE(%rip), %rcx
	movq	%rax, 160(%rsp)
	movq	-24(%rax), %rax
	movq	%rcx, 160(%rsp,%rax)
	xorl	%eax, %eax
	movq	%rax, 168(%rsp)
.L72:
	leaq	16+_ZTVSt9basic_iosIcSt11char_traitsIcEE(%rip), %rax
	movq	72(%rsp), %rdi
	movq	%rax, 416(%rsp)
	call	_ZNSt8ios_baseD2Ev@PLT
	jmp	.L73
.L156:
	vzeroupper
	jmp	.L83
	.cfi_endproc
.LFE2552:
	.section	.gcc_except_table
	.align 4
.LLSDAC2552:
	.byte	0xff
	.byte	0x9b
	.uleb128 .LLSDATTC2552-.LLSDATTDC2552
.LLSDATTDC2552:
	.byte	0x1
	.uleb128 .LLSDACSEC2552-.LLSDACSBC2552
.LLSDACSBC2552:
	.uleb128 .LEHB24-.LCOLDB9
	.uleb128 .LEHE24-.LEHB24
	.uleb128 0
	.uleb128 0
.LLSDACSEC2552:
	.byte	0x1
	.byte	0
	.align 4
	.long	0

.LLSDATTC2552:
	.section	.text.unlikely
	.text
	.size	_ZN9InitstateC2Ei, .-_ZN9InitstateC2Ei
	.section	.text.unlikely
	.size	_ZN9InitstateC2Ei.cold, .-_ZN9InitstateC2Ei.cold
.LCOLDE9:
	.text
.LHOTE9:
	.globl	_ZN9InitstateC1Ei
	.set	_ZN9InitstateC1Ei,_ZN9InitstateC2Ei
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC7:
	.quad	7291173201201031215
	.quad	3418077581590672434
	.align 16
.LC8:
	.quad	7809636682268111713
	.quad	8391162081213773921
	.hidden	DW.ref.__gxx_personality_v0
	.weak	DW.ref.__gxx_personality_v0
	.section	.data.rel.local.DW.ref.__gxx_personality_v0,"awG",@progbits,DW.ref.__gxx_personality_v0,comdat
	.align 8
	.type	DW.ref.__gxx_personality_v0, @object
	.size	DW.ref.__gxx_personality_v0, 8
DW.ref.__gxx_personality_v0:
	.quad	__gxx_personality_v0
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
