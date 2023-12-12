.intel_syntax noprefix
.globl _start
.section .text

; take the top value of the stack, subtract rdi from it, then put it back.

_start:
    pop rax
    sub rax, rdi
    push rax

.section .data
