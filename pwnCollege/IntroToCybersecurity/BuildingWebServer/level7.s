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
; [ ] open("<open_path>", O_RDONLY) = 5
; [ ] read(5, <read_file>, <read_file_count>) = <read_file_result>
; [ ] close(5) = 0
; [ ] write(4, "HTTP/1.0 200 OK\r\n\r\n", 19) = 19
; [ ] write(4, <write_file>, <write_file_count>) = <write_file_result>
; [ ] close(4) = 0
; [ ] exit(0) = ?

.section .text

_start:
    # create a socket
    mov rdi, 2 # AF_INET
    mov rsi, 1 # SOCK_STREAM
    mov rdx, 0 # IPPROTO_IP
    mov rax, 41 # sys_socket
    syscall
    mov sockfd, rax

    # bind the socket to 0.0.0.0:80
    mov rdi, sockfd   # socket_fd
    lea rsi, sockaddr # sockaddr
    mov rdx, 16 # addrlen
    mov rax, 49 # sys_bind
    syscall

    # listen(3, 0)
    mov rdi, sockfd
    mov rsi, 0
    mov rax, 50 # sys_listen
    syscall

    # accept(3, NULL, NULL) = 4
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
    mov rax, 0 # sys_read
    syscall

    # open("<open_path>", O_RDONLY) = 5
    lea rdi, [request+4] # extract file name
    movb [rdi+16], 0
    mov rsi, 0 # O_RDONLY
    mov rax, 2 # sys_open
    syscall
    mov txtfile, rax

    # read(5, <read_file>, <read_file_count>) = <read_file_result>
    mov rdi, txtfile
    lea rsi, filecontent
    mov rdx, 1024
    mov rax, 0 # sys_read
    syscall
    mov filecnt, rax # 

    # close(5)
    mov rdi, txtfile
    mov rax, 3 # sys_close
    syscall

    # write(4, "HTTP/1.0 200 OK\r\n\r\n", 19) = 19
    mov rdi, tunnel
    lea rsi, response
    mov rdx, 19
    mov rax, 1 # sys_write
    syscall

    # write(4, <write_file>, <write_file_count>) = <write_file_result>
    mov rdi, tunnel
    lea rsi, filecontent
    mov rdx, filecnt
    mov rax, 1 # sys_write
    syscall

    # close(4)
    mov rdi, tunnel
    mov rax, 3 # sys_close
    syscall

    mov rdi, 0
    mov rax, 60     # SYS_exit
    syscall

.section .data

sockfd:   .quad 0
tunnel:   .quad 0
txtfile:  .quad 0
filecnt:  .quad 0
request:  .space 256
filecontent: .space 1024
response: .ascii "HTTP/1.0 200 OK\r\n\r\n"
sockaddr: .quad 0x50000002 # AF_INET(2) and PORT(80) in big endian
          .quad 0x0 # IP(0.0.0.0)
          .quad 0x0 # padding
          .quad 0x0 # padding
