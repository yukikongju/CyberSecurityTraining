.intel_syntax noprefix
.globl _start
.section .text

  ; Create a two jump trampoline:
  ;   Make the first instruction in your code a jmp
  ;   Make that jmp a relative jump to 0x51 bytes from its current position
  ;   At 0x51 write the following code:
  ;     Place the top value on the stack into register rdi
  ;     jmp to the absolute address 0x403000

_start:
    jmp here
    .rept 0x51
	nop
    .endr

here: 
    mov rdi, [rsp]
    mov rax, 0x403000
    jmp rax

.section .data
