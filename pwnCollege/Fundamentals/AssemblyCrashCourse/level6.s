.intel_syntax noprefix
.globl _start
.section .text

_start: ; rdi % rsi
    xor rdx, rdx ; clear previous remainder
    mov rax, rdi ; store rdi in rax for division
    div rsi
    mov rax, rdx ; store remainder in rax

.section .data
