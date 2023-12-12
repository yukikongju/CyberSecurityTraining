.intel_syntax noprefix
.globl _start
.section .text

_start:
    mov rax, rdi
    div rax, rsi

.section .data
