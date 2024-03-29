# Challenges

- run program
- run program with stdin
- run program from file input
- run program from arguments
- run program from empty environment
- run program with stdout redirection

# Level 1/2/3/4/5 - 

- Execute command they ask, then rerun `/challenge/embryo_{NUM}`


```{sh}
> /usr/bin/bash // level 2: 
> ./embryoio_level3 'vnafzqlxec' // level 3: pass parameter
> export qlfcaz=mokkyaxihy // level 4: set environment variable
> ./embryoio_level5 < /tmp/njmypn // level 5: program redirection stdin
> ./embryoio_level6 > /tmp/njmypn // level 6: program redirection stdout
> env -i ./embryoio_level7 // level 7: run command in empty environment
```

# Level 8/9/10 - Process

```{sh}
hacker@program-interaction-level-8:/challenge$ mkdir /tmp/abc/
hacker@program-interaction-level-8:/challenge$ vi /tmp/abc/int8.sh
hacker@program-interaction-level-8:/challenge$ chmod +x /tmp/abc/int8.sh 
hacker@program-interaction-level-8:/challenge$ /tmp/abc/int8.sh 

For 9:
> /tmp/abc/int9.sh < 'ondfs'
```

# Level 11 - 

- the challenge checks for a specific parent process : shellscript
- the challenge will check that env[KEY] holds value VALUE (listed to the right as KEY:VALUE) : ugdygr:ybezdhyzoq

```{sh}
> export ugdygr=ybezdhyzoq
```

# Level 12/13/14 - 

- the challenge checks for a specific parent process : shellscript
- the challenge will check that input is redirected from a specific file path : /tmp/ejnuee
- the challenge will check for a hardcoded password over stdin : jojklaar

```{sh}
> echo -e "jojklaar" > /tmp/ejnuee
> bash s.sh < /tmp/ejnuee
```

# Level 15/16/17/18/19/20/21 - Executing command in ipython

- if they ask for stdin, execute normally and input stdin manually afterwards
- if they ask for arguments, write them afterwards
- if the check for environment variable, `export <var>=<value>`

```{ipython}
hacker@program-interaction-level-15:/challenge$ ipython
In [1]: import subprocess
In [2]: subprocess.run(["/challenge/embryoio_level15"])

-- args
In [2]: subprocess.run(["/challenge/embryoio_level17", "jivlxzhtri"])

-- stdin
> subprocess.run(["/challenge/embryoio_level19"], stdin=open('/tmp/wqyudm', 'r'), text=True)

-- stdout
In [3]: subprocess.run(["/challenge/embryoio_level20"], stdout=open('/tmp/nvxsmu', 'w'), text=True)

-- empty environment
subprocess.run(['env', '-i', './embryoio_level28'])

-- Executing bash script in ipython
In [2]: subprocess.Popen(["env", "-i", "./embryoio_level21"])

```

Writeups: https://hackmd.io/@iru7NsehRf-RHH8iUuJSPw/ryN9KhNVa
Writeups: https://github.com/Anon0nyx/pwn_college_notebook/tree/master/embryoio

# Level 22 to 28 - Same, but with python

We need to create a python script and run the previous command `python /tmp/t.py`

# Level 29 to 35 - Run Binary with C

```{sh}
> gcc /tmp/t.c -o ~/a.out
> ~/a.out
```

# Level 36/37/38/39 - Pipe

```
> /usr/bin/bash
> ./embryoio_level36 | cat
> ./embryoio_level37 | grep '.'
> ./embryoio_level38 | sed 's/.*/&/'
> ./embryoio_level39 | rev | rev
```

# Level 40/41 - stdin


```{sh}
> cat | ./embryoio_level40
```

# Level 42/43/44/45 - shellscript

- Execute bash script: `bash t.sh`

```{sh}
> /challenge/embryoio_level42 | cat
> /challenge/embryoio_level43 | grep '.'
> /challenge/embryoio_level44 | sed 's/.*/&/'
> /challenge/embryoio_level45 | rev

```

# Level 46 - shellscript with input

- Execute bash script: `bash t.sh`
- add input afterwards

```{sh}
> cat | /challenge/embryoio_level46 
> rev | /challenge/embryoio_level47 
```

# Level 48 - ipython



- [writeups](https://www.youtube.com/watch?v=r7IqlDr1tWw&list=PLuUFRHxVK7sTW8DY0f2cZPhGvgqgDsZ1A&index=3)

