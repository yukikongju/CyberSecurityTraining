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

# Level 25 - Conditional Branches

```{md}
In this level you will be working with control flow manipulation. This involves using instructions
to both indirectly and directly control the special register `rip`, the instruction pointer.
You will use instructions such as: jmp, call, cmp, and their alternatives to implement the requested behavior.

We will be testing your code multiple times in this level with dynamic values! This means we will
be running your code in a variety of random ways to verify that the logic is robust enough to
survive normal use. 



We will now introduce you to conditional jumps--one of the most valuable instructions in x86.
In higher level programming languages, an if-else structure exists to do things like:
  if x is even:
    is_even = 1
  else:
   is_even = 0

This should look familiar, since it is implementable in only bit-logic, which you've done in a prior level.

In these structures, we can control the program's control flow based on dynamic values provided to the program.

Implementing the above logic with jmps can be done like so:

; assume rdi = x, rax is output
; rdx = rdi mod 2
mov rax, rdi
mov rsi, 2
div rsi
; remainder is 0 if even
cmp rdx, 0
; jump to not_even code is its not 0
jne not_even
; fall through to even code
mov rbx, 1
jmp done
; jump to this only when not_even
not_even:
mov rbx, 0
done:
mov rax, rbx
; more instructions here

Often though, you want more than just a single 'if-else'.

Sometimes you want two if checks, followed by an else.

To do this, you need to make sure that you have control flow that 'falls-through' to the next `if` after it fails.

All must jump to the same `done` after execution to avoid the else.

There are many jump types in x86, it will help to learn how they can be used.

Nearly all of them rely on something called the ZF, the Zero Flag.

The ZF is set to 1 when a cmp is equal. 0 otherwise.

Using the above knowledge, implement the following:
  if [x] is 0x7f454c46:
    y = [x+4] + [x+8] + [x+12]
  else if [x] is 0x00005A4D:
    y = [x+4] - [x+8] - [x+12]
  else:
    y = [x+4] * [x+8] * [x+12]

where:
  x = rdi, y = rax.

Assume each dereferenced value is a signed dword.
This means the values can start as a negative value at each memory position.

A valid solution will use the following at least once:
  jmp (any variant), cmp
```

- since we have only 8 bits, we need to use `eax` rather than `rax` (16 bits)

# Level 26 - Jump Tables and Switch statements

- goal: reduce the number of compares using 'switch' statements

# Level 27/28 - Compute Averages

- using for loop
- using while loop


# Level 29 - 

as -o asm.o asm.s && objcopy -O binary --only-section=.text asm.o asm.bin && cat ./asm.bin | /challenge/run

