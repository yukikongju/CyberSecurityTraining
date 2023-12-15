; INCOMPLETE

.intel_syntax noprefix
.globl _start
.section .text

; Now all we need to check is if `number` is greater than 2.

; If it is, always do:
;   jmp [0x1337+0x18]
; Otherwise:
;   jmp [jump_table_address + number * 8]

; Using the above knowledge, implement the following logic:
;   if rdi is 0:
;     jmp 0x40303f
;   else if rdi is 1:
;     jmp 0x403106
;   else if rdi is 2:
;     jmp 0x403195
;   else if rdi is 3:
;     jmp 0x403280
;   else:
;     jmp 0x403378

; Please do the above with the following constraints:
;   Assume rdi will NOT be negative
;   Use no more than 1 cmp instruction
;   Use no more than 3 jumps (of any variant)
;   We will provide you with the number to 'switch' on in rdi.
;   We will provide you with a jump table base address in rsi.

_start:
    mov rax, 0
    mov rbx, 0
    mov rcx, 0
    push rsi

loop:
    cmp rbx, rsi
    je done

    mov rcx, [rdi+8*rbx]
    add rax, rcx
    add rbx, 1
    jmp loop

done:

.section .data
