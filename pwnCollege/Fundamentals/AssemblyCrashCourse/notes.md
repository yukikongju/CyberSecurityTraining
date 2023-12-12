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


