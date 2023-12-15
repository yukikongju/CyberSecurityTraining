.intel_syntax noprefix
.globl _start
.section .text

; As an example, a for-loop can be used to compute the sum of the numbers 1 to n:
;   sum = 0
;   i = 1
;   for i <= n:
;     sum += i
;     i += 1

; Please compute the average of n consecutive quad words, where:
;   rdi = memory address of the 1st quad word
;   rsi = n (amount to loop for)
;   rax = average computed

; We will now set the following in preparation for your code:
;   [0x4042f8:0x4045e8] = {n qwords]}
;   rdi = 0x4042f8
;   rsi = 94

; rbx = i; rcx = sum


_start:
    mov rax, 0
    mov rbx, 0 
    mov rcx, 0
    ; push rsi

loop:
    cmp rbx, rsi
    je done

    add rcx, [rdi+8*rbx]
    add rbx, 1
    jmp loop

done:
    ; pop rsi
    mov rax, rcx
    div rsi


.section .data
