# Intro - 

Two ways of compiling code:

**Method 1: using `pwn.asm()`**


```{py}

```

**Method 2: compiling in assembly directly**

1. write the assembly code `.s`

```{s}
.intel_syntax noprefix
.globl _start

.section .text

_start:
    <WRITE INSTRUCTION HERE>

.section .data
```

2. compile and submit code


```{sh}
> as -o asm.o asm.s
> objcopy -O binary --only-section=.text asm.o asm.bin
> cat ./asm.bin | /challenge/run

as -o asm.o asm.s && objcopy -O binary --only-section=.text asm.o asm.bin && cat ./asm.bin | /challenge/run

```

# Level 1/2 - Set values in registers

# Level 3/4/5 - Operations: add, imul, div

# Level 6/7/8 - Implementing faster modulo for power of 2^n using lower n bits

- modulo is being stored in `rdx` register; quotient in `rax`
- 256 is 2 power of 8, so we load it using `mov al`; 65536 is 2 power of 16 so 
  we load it using `ax`

# Level 9 - Left and right shift with shl, shr


# Level 10/11 - Bitwise Logic

- to clear a register, use `xor <reg>, <reg>`

# Level 12/13 - Memory reads and write from addresses



# Level 15 - 

```{md}
Here is the breakdown of the names of memory sizes:
  Quad Word   = 8 Bytes = 64 bits
  Double Word = 4 bytes = 32 bits
  Word        = 2 bytes = 16 bits
  Byte        = 1 byte  = 8 bits
	
    In x86_64, you can access each of these sizes when dereferencing an address, just like using bigger or smaller register accesses:
    mov al, [address]        <=>        moves the least significant byte from address to rax
    mov ax, [address]        <=>        moves the least significant word from address to rax
    mov eax, [address]       <=>        moves the least significant double word from address to rax
    mov rax, [address]       <=>        moves the full quad word from address to rax
```


# Level 17/18 - Little Endian

- use a temporary register to copy between addressing registers
- loading consecutive registers with offset

# Level 19/20/21 - Stack

- swapping registers using the stack
- accessing the stack pointer with `rsp`

- [coursehero - writeups](https://www.coursehero.com/file/190516394/Assembly-Crash-Course-WriteUppdf/)

# Level 22/23 - Control Flow

- Absolute jumps vs relative jumps


as -o asm.o asm.s && objcopy -O binary --only-section=.text asm.o asm.bin && cat ./asm.bin | /challenge/run

