# Level 1 - Exit program

- arguments: `rdi`, `rsi`, `rdx`
- `syscall` type has to be loaded in rax


```{md}
Usage: `/challenge/run <path_to_web_server>`

$ cat server.s
.intel_syntax noprefix
.globl _start

.section .text

_start:
    mov rdi, 0
    mov rax, 60     # SYS_exit
    syscall

.section .data

$ as -o server.o server.s && ld server.o -o server 

$ strace ./server
execve("./server", ["./server"], 0x7ffccb8c6480 /* 17 vars */) = 0
exit(0)                                 = ?
+++ exited with 0 +++

$ /challenge/run ./server
```

# Level 2 - Program that creates a socket



# Level 3 - Program that binds socket



as -o server.o server.s && ld server.o -o server 



## Ressources

- [syscall](https://x64.syscall.sh/)
- [Writeups](https://tech.c01dkit.com/pwn-college-cse365-spring2023/#building-a-web-server-writeups)


