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
; [ ] read(4, <read_request>, <read_request_count>) = <read_request_result>
; [ ] write(4, "HTTP/1.0 200 OK\r\n\r\n", 19) = 19
; [ ] close(4) = 0
; [ ] exit(0) = ?

.section .text

_start:
    # create socket
    mov rdi, 2
    mov rsi, 1
    mov rdx, 0
    mov rax, 41 # sys_socket
    syscall

    # bind socket to 0.0.0.0:80
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
    mov rdi, sockfd
    mov rsi, 0
    mov rax, 50 # sys_listen
    syscall

    # accept (3, NULL, NULL)
    mov rdi, sockfd
    mov rsi, 0
    mov rdx, 0
    mov rax, 43 # sys_accept
    syscall
    mov tunnel, rax

    # read(4, <read_request>, <read_request_count>) = <read_request_result>
    mov rdi, tunnel
    lea rsi, request
    mov rdx, 256
    mov rax, 0
    syscall

    # write(4, "HTTP/1.0 200 OK\r\n\r\n", 19)
    mov rdi, tunnel
    lea rsi, response
    mov rdx, 19
    mov rax, 1
    syscall

    # close(4)
    mov rdi, 4
    mov rax, 3
    syscall


    # exit
    mov rdi, 0
    mov rax, 60     # SYS_exit
    syscall

.section .data

sockfd: .quad 0
tunnel: .quad 0
request: .space 256
response: .ascii "HTTP/1.0 200 OK\r\n\r\n"
sockaddr: .quad 0x50000002 # AF_INET(2) and PORT(80) in big endian
	  .quad 0x0 # IP(0.0.0.0)
	  .quad 0x0 # padding
	  .quad 0x0 # padding


