.intel_syntax noprefix
.globl _start
.section .text

_start:
    shl rdi, 24
    shr rdi, 56
    mov rax, rdi


.section .data
