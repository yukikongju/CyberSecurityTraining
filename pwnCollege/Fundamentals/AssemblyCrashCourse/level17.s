.intel_syntax noprefix
.globl _start
.section .text

  ; Set [rdi] = 0xdeadbeef00001337
  ; Set [rsi] = 0xc0ffee0000

_start:
    mov rax, 0xdeadbeef00001337
    mov [rdi], rax
    mov rax, 0xc0ffee0000
    mov [rsi], rax

.section .data
