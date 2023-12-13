# Level 1 - 

- start program with `run`
- continue with `c`


# Level 2 - 

- see registers with `info registers`
- print registers values in hex: `p/x $rdi`


When running the code, we see that it ask for random number and we see that 
its value is in the `r12` registers

# Level 3 - 

- `help`; `apropos word`
- `disassemble main`
- storing user variable: `set $rax = 0`
- running gdb script: `gdb -x my_script.gdb ./a.out`
- setting breakpoint at main: `b *main`
- `echo 'set disassembly-flavor intel' > ~/.gdbinit`
- having gdb and program output side to side: `run > /tmp/a`; `mkfifo a`

```{md}
You can examine the contents of memory using the `x/<n><u><f> <address>` parameterized command. In this format `<u>` is
the unit size to display, `<f>` is the format to display it in, and `<n>` is the number of elements to display. Valid
unit sizes are `b` (1 byte), `h` (2 bytes), `w` (4 bytes), and `g` (8 bytes). Valid formats are `d` (decimal), `x`
(hexadecimal), `s` (string) and `i` (instruction). The address can be specified using a register name, symbol name, or
absolute address. Additionally, you can supply mathematical expressions when specifying the address.

For example, `x/8i $rip` will print the next 8 instructions from the current instruction pointer. `x/16i main` will
print the first 16 instructions of main. You can also use `disassemble main`, or `disas main` for short, to print all of
the instructions of main. Alternatively, `x/16gx $rsp` will print the first 16 values on the stack. `x/gx $rbp-0x32`
will print the local variable stored there on the stack.

You will probably want to view your instructions using the CORRECT assembly syntax. You can do that with the command
`set disassembly-flavor intel`.
```

```{md}
> break main
> c
> x/16gx $rsp ; show values on the stack
> x/16i $rsp ; show next 16 instructions

Check the register with value 0x00000000000000
```

# Level 4 - Stepping

- `break *<address>`



