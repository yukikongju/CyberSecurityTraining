.intel_syntax noprefix
.globl _start
.section .text

_start:
    xor rax, rax
    or rax, rdi ; load rdi in rax
    and rax, 1 ; check if rdi is even
    xor rax, 1

.section .data
