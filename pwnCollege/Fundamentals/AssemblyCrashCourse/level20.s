.intel_syntax noprefix
.globl _start
.section .text

; Swap values in rdi and rsi using push and pop only
; i.e.
; If to start rdi = 2 and rsi = 5
; Then to end rdi = 5 and rsi = 2


_start:
    push rdi
    push rsi
    pop rdi
    pop rsi

.section .data
