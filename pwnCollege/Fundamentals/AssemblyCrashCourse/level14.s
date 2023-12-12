.intel_syntax noprefix
.globl _start
.section .text

_start:
        mov rax, [0x404000]
	add qword ptr [0x404000], 0x1337 ; add value to adress

.section .data
