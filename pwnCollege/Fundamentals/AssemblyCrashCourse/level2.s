.intel_syntax noprefix
.globl _start
.section .text

_start:
        mov rax, 0x1337
	mov r12, 0xCAFED00D1337BEEF
	mov rsp, 0x31337

.section .data
