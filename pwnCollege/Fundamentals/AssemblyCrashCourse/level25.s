.intel_syntax noprefix
.globl _start
.section .text

;   if [x] is 0x7f454c46:
;     y = [x+4] + [x+8] + [x+12]
;   else if [x] is 0x00005A4D:
;     y = [x+4] - [x+8] - [x+12]
;   else:
;     y = [x+4] * [x+8] * [x+12]

; where:
;   x = rdi, y = eax.

; put r12 = 0x7f454c46; r11 = 0x00005A4D; compute in r10

_start:
    mov eax, [rdi]
    cmp eax, 0x7f454c46
    je equal
    cmp eax, 0x00005A4D
    je substract
    jmp multiply

equal:
    mov eax, [rdi+4]
    add eax, [rdi+8]
    add eax, [rdi+12]
    jmp done

substract:
    mov eax, [rdi+4]
    sub eax, [rdi+8]
    sub eax, [rdi+12]
    jmp done

multiply:
    mov eax, [rdi+4]
    imul eax, [rdi+8]
    imul eax, [rdi+12]
    jmp done

done:


.section .data
