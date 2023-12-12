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


