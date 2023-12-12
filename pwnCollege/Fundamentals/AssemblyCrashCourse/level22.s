.intel_syntax noprefix
.globl _start
.section .text

_start:
    mov rax, 0x403000
    jmp rax

.section .data


