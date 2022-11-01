# Over the Wire - Bandit

Le mot de passe est le flag du niveau précédent

## What we learned

- [X] use the command `find` to search for executables files, files owned by 
      specific user


### Level 0 -> Level 1

Goal: connect to ssh using user, hostname, port and password

```
ssh bandit0@bandit.labs.overthewire.org -p 2220
```

Flag: `NH2SXQwcBdpmTEzi3bvBHMM9H66vVXjL`

### Level 1 -> Level 2

Goal: Understand that '-' is stdin, so we need to call complate path with '~/'

```
ssh bandit1@bandit.labs.overthewire.org -p 2220
cat ~/-
```

Flag: `rRGizSaX8Mk1RTb1CNQoXTcYZWU6lgzi`

### Level 2 -> Level 3

Goal: Call file name with space in it

```
ssh bandit2@bandit.labs.overthewire.org -p 2220
cat spaces\ in\ this\ filename
```

Flag: `aBZ0W5EmUfAf7kHTQeOwd8bauFJ2lAiG`


### Level 3 -> Level 4

Goal: View hidden file with `ls -a`

```
ssh bandit3@bandit.labs.overthewire.org -p 2220
cd inhere
ls -a
vi .hidden
```

Flag: `2EW7BBsr6aMMoJ2HjW067dm8EgX26xNe`

### Level 4 -> Level 5

Goal: check what's inside file using `file`

```
ssh bandit4@bandit.labs.overthewire.org -p 2220
file ./*
```

Flag: `lrIWWI6bB37kxfiCQZqUdOIYfr6eEeqR`

### Level 5 -> Level 6

Goal: find human readable file ; find executable file inside dummy directories

```
>>> ssh bandit5@bandit.labs.overthewire.org -p 2220
>>> find . -type f -size 1033c ! -executable -exec file {} + | grep ASCII

./maybehere07/.file2: ASCII text, with very long lines (1000)
```

Flag: `P4L4vucdmLnm8I7Vl7jG1ApGSfjYKqJU`


### Level 6 -> Level 7

Goal: search file with owner, group and size


```
>>> ssh bandit6@bandit.labs.overthewire.org -p 2220
>>> cd ..
>>> find . -type f -size 1033c ! -executable -exec file {} + | grep ASCII

find: ‘./bandit30-git’: Permission denied
find: ‘./bandit31-git’: Permission denied
find: ‘./bandit5/inhere’: Permission denied
find: ‘./ubuntu’: Permission denied
find: ‘./bandit29-git’: Permission denied
find: ‘./bandit28-git’: Permission denied
find: ‘./bandit27-git’: Permission denied

>>> find / -type f -user bandit7 -group bandit6 -size 33c

/var/lib/dpkg/info/bandit7.password

```

Flag: `z7WtoNQU2XfjmMtWA8u5rN4vzqu4v99S`

