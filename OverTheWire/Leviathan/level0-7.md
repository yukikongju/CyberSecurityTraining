# What we learned

- use `ltrace` to check libraries inside binary
- we can use symbolic links `ln -s <filename>` to get passwords
- if a function execute a file, try to rename the file as "file name.txt" and 
  create a sym link to "file" so that the system execute the sym link (level 2 -> 3)

%% ----------------------------------------------------

### Level 0

Flag: `leviathan0`


### Level 0 -> Level 1

Goal: Have the reflex to use `ls -la` to find hidden files

```
>>> ssh leviathan0@leviathan.labs.overthewire.org -p 2223
>>> cd ../leviathan0
>>> ls -la
>>> vi .backup
<DT><A HREF="http://leviathan.labs.overthewire.org/passwordus.html | This will be fixed later, the password for leviathan1 is PPIfmI1qsA" ADD_DATE="1155384634" LAST_CHARSET="ISO-8859-1" ID="rdf:#$2wIU71">password to leviathan1</A>

```

Flag: `PPIfmI1qsA`

%% ----------------------------------------------------

### Level 1 -> Level 2

Goal: Use `ltrace` to find what libraries the binary uses

```
>>> ssh leviathan1@leviathan.labs.overthewire.org -p 2223

1. find which functions is called
>>> ltrace ./check

__libc_start_main(0x80491e6, 1, 0xffffd4e4, 0 <unfinished ...>
printf("password: ")                                   = 10
getchar(0xf7fbe4a0, 0xf7fd6f80, 0x786573, 0x646f67password: 1
)    = 49
getchar(0xf7fbe4a0, 0xf7fd6f31, 0x786573, 0x646f67)    = 10
getchar(0xf7fbe4a0, 0xf7fd0a31, 0x786573, 0x646f67
)    = 10
strcmp("1\n\n", "sex")                                 = -1
puts("Wrong password, Good Bye ..."Wrong password, Good Bye ...
)                   = 29
+++ exited (status 0) +++

The password is "sex"

2. Enter the password to get the flag
>>> ./check
>>> sex
>>> whoami // leviathan2
>>> cat /etc/leviathan_pass/leviathan2
mEh5PNl10e
```

Flag: `mEh5PNl10e`



%% ----------------------------------------------------

### Level 2 -> Level 3 (REVIEW!)

Goal: Create file with space with symlinks to the password


```
>>> ssh leviathan2@leviathan.labs.overthewire.org -p 2223

1. try to execute printfile
>>> printfile

*** File Printer ***
Usage: /home/leviathan2/printfile filename

2. create tmp dir to make some experiments
>>> mkdir /tmp/yuki
>>> touch tmp.txt
>>> ~/printfile tmp.txt
>>> ltrace ~/printfile tmp.txt

__libc_start_main(0x80491e6, 2, 0xffffd4a4, 0 <unfinished ...>
access("tmp.txt", 4)                                   = 0
snprintf("/bin/cat tmp.txt", 511, "/bin/cat %s", "tmp.txt") = 16
geteuid()                                              = 12002
geteuid()                                              = 12002
setreuid(12002, 12002)                                 = 0
system("/bin/cat tmp.txt"cat /etc/leviathan_pass/leviathan3
 <no return ...>
--- SIGCHLD (Child exited) ---
<... system resumed> )                                 = 0
+++ exited (status 0) +++

We see that the system calls /bin/cat and the file name. we try to 
execute program with file with space so that we call `/bin/cat pass file.txt`

3. get the flag by creating new file and symbolic link
>>> touch "pass file.txt"
>>> ln -s /etc/leviathan_pass/leviathan3 pass
>>> ~/printfile "pass file.txt" 
Q0G8j4sakn
/bin/cat: file.txt: No such file or directory

```

Flag: `Q0G8j4sakn`


%% ----------------------------------------------------

### Level 3 -> Level 4

Goal: 


```
>>> ssh leviathan3@leviathan.labs.overthewire.org -p 2223

>>> ltrace ./level3 

__libc_start_main(0x80492bf, 1, 0xffffd504, 0 <unfinished ...>
strcmp("h0no33", "kakaka")                             = -1
printf("Enter the password> ")                         = 20
fgets(Enter the password> 1234
"1234\n", 256, 0xf7fab620)                       = 0xffffd2dc
strcmp("1234\n", "snlprintf\n")                        = -1
puts("bzzzzzzzzap. WRONG"bzzzzzzzzap. WRONG
)                             = 19
+++ exited (status 0) +++

We see that we compare our input with "snlprinf"

>>> ./level3 
Enter the password> snlprintf
[You've got shell]!
>>> whoami
leviathan4
>>> cat /etc/leviathan_pass/leviathan4
AgvropI4OA
```

Flag: `AgvropI4OA`


%% ----------------------------------------------------

### Level 4 -> Level 5

Goal: 


```
>>> ssh leviathan4@leviathan.labs.overthewire.org -p 2223

1. see what's in the trash
>>> ls -la
>>> cd .trash
>>> ./bin
01000101 01001011 01001011 01101100 01010100 01000110 00110001 01011000 01110001 01110011 00001010 

2. convert to ascii: https://www.binaryhexconverter.com/binary-to-ascii-text-converter
EKKlTF1Xqs

```

Flag: `EKKlTF1Xqs`


%% ----------------------------------------------------

### Level 5 -> Level 6

Goal: create symbolic link to password if file doesn't exist


```
>>> ssh leviathan5@leviathan.labs.overthewire.org -p 2223


1. try to execute binary
>>> ./leviathan5
Cannot find /tmp/file.log

2. use ltrace
>>> ltrace ./leviathan5 
__libc_start_main(0x8049206, 1, 0xffffd4f4, 0 <unfinished ...>
fopen("/tmp/file.log", "r")                            = 0
puts("Cannot find /tmp/file.log"Cannot find /tmp/file.log
)                      = 26
exit(-1 <no return ...>
+++ exited (status 255) +++

we see that the file /tmp/file.log doesn't exist. create a symlink to open 
the password

3. create symlink
>>>  ln -s /etc/leviathan_pass/leviathan6 /tmp/file.log
>>> ./leviathan5 
YZ55XPVk2l

```

Flag: `YZ55XPVk2l`

%% ----------------------------------------------------

### Level 6 -> Level 7

Goal: Brute Force

```
>>> ssh leviathan6@leviathan.labs.overthewire.org -p 2223

1. check what binary does
>>> ./leviathan6
usage: ./leviathan6 <4 digit code>
>>> ./leviathan6 1234
Wrong

2. Brute force the binary: try all 4 digits combination

brute.sh: 

    #!/bin/bash

    for i in {0000..9999} 
    do 
	    ~/leviathan6 $i
    done

>>> chmod +x brute.sh
>>> ./brute.sh

3. get the password once we are in the shell
>>> cat /etc/leviathan_pass/leviathan7
8GpZ5f8Hze

```

Flag: `8GpZ5f8Hze`


%% ----------------------------------------------------

### Level 7 -> Level 8

Goal: 


```
>>> ssh leviathan7@leviathan.labs.overthewire.org -p 2223
```

Flag: ``




