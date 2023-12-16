.intel_syntax noprefix
.globl _start

; ===== Expected: Parent Process =====
; [ ] execve(<execve_args>) = 0
; [ ] socket(AF_INET, SOCK_STREAM, IPPROTO_IP) = 3
; [ ] bind(3, {sa_family=AF_INET, sin_port=htons(<bind_port>), sin_addr=inet_addr("<bind_address>")}, 16) = 0
;     - Bind to port 80
;     - Bind to address 0.0.0.0
; [ ] listen(3, 0) = 0
; [ ] accept(3, NULL, NULL) = 4
; [ ] exit(0) = ?


.section .text

_start:
    # create socket
    mov rax, 41
    mov rdi, 2
    mov rsi, 1
    mov rdx, 0
    syscall

    # create listening on 0.0.0.0:80
    mov rdi, rax
    push 0x50000002 # AF_INET(2) and port 80 in big endian
    mov rsi, rsp
    push 0x0 # IP(0.0.0.0)
    push 0x0 # padding
    push 0x0 # padding
    mov rdx, 16 # addrlen
    mov rax, 49
    syscall

    # listen to (3, 0)
    mov rdi, 3
    mov rsi, 0
    mov rax, 50 # sys_listen
    syscall

    # accept (3, NULL, NULL)
    mov rdi, 3
    mov rsi, 0
    mov rdx, 0
    mov rax, 43 # sys_accept
    syscall


    # exit
    mov rdi, 0
    mov rax, 60     # SYS_exit
    syscall

.section .data



