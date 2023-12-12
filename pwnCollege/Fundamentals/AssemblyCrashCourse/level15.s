.intel_syntax noprefix
.globl _start
.section .text

_start:
        xor rax, rax
	mov al, [0x404000]

.section .data
