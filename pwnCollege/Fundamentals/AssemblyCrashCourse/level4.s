.intel_syntax noprefix
.globl _start
.section .text

_start:
    mov rax, rdi
    imul rax, rsi
    add rax, rdx


.section .data
