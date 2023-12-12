.intel_syntax noprefix
.globl _start
.section .text

  ; Load two consecutive quad words from the address stored in rdi
  ; Calculate the sum of the previous steps quad words.
  ; Store the sum at the address in rsi

_start:
    mov rax, [rdi]
    add rax, [rdi+8]
    mov [rsi], rax

.section .data
