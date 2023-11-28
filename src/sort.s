.file	"sort.c"
	.text
	.p2align 4
	.globl	swap
	.type	swap, @function
swap:
.LFB23:
	.cfi_startproc
	endbr64
	movslq	%edi, %rdi
	movslq	%esi, %rsi
	leaq	(%rdx,%rdi,8), %rcx
	leaq	(%rdx,%rsi,8), %rax
	movq	(%rcx), %rdi
	movq	(%rax), %rdx
	movq	%rdx, (%rcx)
	movq	%rdi, (%rax)
	ret
	.cfi_endproc
.LFE23:
	.size	swap, .-swap
	.p2align 4
	.globl	sort_pyramid
	.type	sort_pyramid, @function
sort_pyramid:
.LFB24:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	leal	-1(%rsi), %ebx
	movslq	%ebx, %rax
	leaq	(%rdi,%rax,8), %rbp
	testl	%ebx, %ebx
	jle	.L11
	.p2align 4,,10
	.p2align 3
.L10:
	movl	%ebx, %r10d
	subl	$1, %ebx
	movl	$1, %r8d
	movl	%ebx, %edx
	sarl	%edx
	movslq	%edx, %rax
	addl	%edx, %edx
	movslq	%edx, %rcx
	leaq	(%rdi,%rax,8), %rax
	addl	$1, %edx
	leaq	8(%rdi,%rcx,8), %rcx
	.p2align 4,,10
	.p2align 3
.L9:
	movq	(%rax), %rsi
	cmpq	(%rcx), %rsi
	jge	.L7
	movslq	%edx, %r9
	leaq	(%rdi,%r9,8), %r9
	movq	(%r9), %r11
	movq	%r11, (%rax)
	movq	%rsi, (%r9)
.L7:
	testb	%r8b, %r10b
	jne	.L8
	movq	(%rax), %rsi
	cmpq	8(%rcx), %rsi
	jge	.L8
	leal	1(%rdx), %r8d
	movslq	%r8d, %r8
	leaq	(%rdi,%r8,8), %r8
	movq	(%r8), %r9
	movq	%r9, (%rax)
	movq	%rsi, (%r8)
.L8:
	subl	$2, %edx
	subq	$8, %rax
	subq	$16, %rcx
	xorl	%r8d, %r8d
	cmpl	$-1, %edx
	jne	.L9
	movq	0(%rbp), %rdx
	movq	(%rdi), %rax
	subq	$8, %rbp
	movq	%rdx, (%rdi)
	movq	%rax, 8(%rbp)
	testl	%ebx, %ebx
	jne	.L10
.L11:
	movq	8(%rdi), %rdx
	movq	(%rdi), %rax
	cmpq	%rax, %rdx
	jge	.L3
	movq	%rdx, (%rdi)
	movq	%rax, 8(%rdi)
.L3:
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE24:
	.size	sort_pyramid, .-sort_pyramid
	.ident	"GCC: (Ubuntu 9.3.0-10ubuntu2) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
