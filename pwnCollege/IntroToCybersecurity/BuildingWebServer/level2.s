.intel_syntax noprefix
.globl _start

; ===== Expected: Parent Process =====
; [ ] execve(<execve_args>) = 0
; [ ] socket(AF_INET, SOCK_STREAM, IPPROTO_IP) = 3
; [ ] exit(0) = ?

.section .text

_start:
    mov rdi, 2 # AF_INET
    mov rsi, 1 # SOCK_STREAM
    mov rdx, 0 # IPPROTO_IP
    mov rax, 41 # syscall socket
    syscall

    mov rdi, 0
    mov rax, 60 # SYS_EXIT
    syscall

.section .data
