# x86 Course

[Link to course](https://0xinfection.github.io/reversing/pages/x86-course.html)


## Notes

- [X] **Part 1: Goals**

    - Learn Malware Analysis


- [X] **Part 2: Techniques**

    - Types of Malware Analysis: 
      * static
      * dynamic


- [X] **Part 3: Types Of Malware** (review)

    - Categories of Malware: 
      * Backdoor
      * Botnet
      * Downloader
      * rootkit
      * scareware
      * worm/virus


- [X] **Part 4: x86 Assembly Intro**

    - Windows binary are in `PE`, where ase linux binary are in `ELF` format


- [X] **Part 5: Binary Number System**

    - Convert binary to hexadecimal and vice-versa
    - binary arithmetic: 
      * addition/substraction
      * multiplication/division with power of 2 using shift


- [X] **Part 6: Hexadecimal Number System**

    - Convert hexadecimal to binary and decimal and vice-versa


- [X] **Part 7: Transistors And Memory** (review)

    - `Field-effect transistors`: high input impedance at low frequency
    - `High impedance`: low voltage, high frequency


- [X] **Part 8 - Bytes, Words, Double Words, etc...**

    - An `address` is 4 bytes. A `byte` is 8 bits. A `word` is two bytes (16 bits).
    - A `double word ` is 4 bytes, so an address is a double word


- [X] **Part 9: x86 Basic Architecture**

    - A `CPU` is the computer brain
    - Components of a CPU: 
      * Arithmetic and Control Unit
      * Execution Unit
      * Registers
      * Flags


- [X] **Part 10: General-purpose Registers** (review)

    - A `register` is 4 bytes long (32 bits)
    - What does each register do: 
      * EAX: accumulator. Temporarily store results of atihmetic
      * EBX: base register. store base address
      * ECX: counter register. how many time a process needs to be repeated
      * EDX: general purpose register.
      * ESI: source index register. store address where to read data
      * EDI: destination index register. holds implied address of write register
      * EBP: base pointer. points to bottom of current stack frame
      * ESP: stack pointer. points to the top of stack
    - We can reference the register to their 16 bits equivalent: SI, DI, BP, SP


- [X] **Part 11: Segment Registers** (review)

    - `segment registers` are used for referencing memory location
    - the registers: 
      * CS: code segment register. store base location of code section (.text)
      * DS: data segment register. store variables default location (.data)
      * ES: extra segment register. used in string operation
      * SS: stack segment register. store base location of stack segment
      * FS/GS: extra segment register


- [X] **Part 12: Instruction Pointer Register** (CHECK!!)

    - using `gcc` to disassemble and access unreachable function: `gcc -o hello hello.c`
    - using `objdump` to compile C as assembly: `objdump -S hello > hello.dump` (or with -d)
    - using `gdb` to access unreachable function. we set a breakpoint to 
      'unreachableFunction' to see its address and set the instruction ip ($eip) 
      to that address to find what the function does


- [X] **Part 13: Control Registers**

    - determine operating mode

- [X] **Part 14: Flags**

    - Flag Status: 
    - System Flags: should never be modified


- [ ] **Part 15: Stack**

    - grows downward, from larger to smaller address


- [ ] **Part 16: Heap**


- [X] **Part 17 – How To Install Linux**


- [X] **Part 18 - vim Text Editor**


- [X] **Part 19 - Why Learn Assembly**


- [ ] **Part 20 - Instruction Code Handling**

    - find function assembly code: `objdump -d hello | grep unreachableFunction.: -A11`


- [ ] **Part 21 - How To Compile A Program**


- [ ] **Part 22 - ASM Program 1 [Moving Immediate Data]**


- [ ] **Part 23 - ASM Debugging 1 [Moving Immediate Data]**


- [ ] **Part 24 - ASM Hacking 1 [Moving Immediate Data]**


- [ ] **Part 25 - ASM Program 2 [Moving Data Between Registers]**


- [ ] **Part 26 - ASM Debugging 2 [Moving Data Between Registers]**


- [ ] **Part 27 - ASM Hacking 2 [Moving Data Between Registers]**


- [ ] **Part 28 - ASM Program 3 [Moving Data Between Memory And Registers]**


- [ ] **Part 29 - ASM Debugging 3 [Moving Data Between Memory And Registers]**


- [ ] **Part 30 - ASM Hacking 3 [Moving Data Between Memory And Registers]**


- [ ] **Part 31 - ASM Program 4 [Moving Data Between Registers And Memory]**


- [ ] **Part 32 - ASM Debugging 4 [Moving Data Between Registers And Memory]**


- [ ] **Part 33 - ASM Hacking 4 [Moving Data Between Registers And Memory]**


- [ ] **Part 34 - ASM Program 5 [Indirect Addressing With Registers]**


- [ ] **Part 35 - ASM Debugging 5 [Indirect Addressing With Registers]**


- [ ] **Part 36 - ASM Hacking 5 [Indirect Addressing With Registers]**


- [ ] **Part 37 - ASM Program 6 [CMOV Instructions]**


- [ ] **Part 38 - ASM Debugging 6 [CMOV Instructions]**


- [ ] **Part 39 - ASM Hacking 6 [CMOV Instructions]**


- [ ] **Part 40 - Conclusion**


## Ressources

- [0xZ0F - Course Reverse Engineering](https://github.com/0xZ0F/Z0FCourse_ReverseEngineering)


