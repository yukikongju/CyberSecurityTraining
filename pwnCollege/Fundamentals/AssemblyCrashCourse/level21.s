.intel_syntax noprefix
.globl _start
.section .text

; Without using pop, please calculate the average of 4 consecutive quad words stored on the stack.

_start:
    mov rax, [rsp]
    add rax, [rsp+8]
    add rax, [rsp+16]
    add rax, [rsp+24]
    shr rax, 2
    push rax


.section .data
