.intel_syntax noprefix
.globl _start
.section .text

  ; Make the first instruction in your code a jmp
  ; Make that jmp a relative jump to 0x51 bytes from the current position
  ; At the code location where the relative jump will redirect control flow set rax to 0x1

_start:
    jmp here
    .rept 0x51
	nop
    .endr

here: 
    mov rax, 0x1

.section .data
