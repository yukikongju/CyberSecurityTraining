# Over the Wire - Bandit

### Level 0

Goal: connect to ssh using user, hostname, port and password

```
ssh bandit0@bandit.labs.overthewire.org -p 2220
```

Flag: `NH2SXQwcBdpmTEzi3bvBHMM9H66vVXjL`

### Level 0 -> Level 1

Goal: Understand that '-' is stdin, so we need to call complate path with '~/'

```
ssh bandit1@bandit.labs.overthewire.org -p 2220
cat ~/-
```

Flag: `rRGizSaX8Mk1RTb1CNQoXTcYZWU6lgzi`

### Level 1 -> Level 2

Goal: Call file name with space in it

```
ssh bandit2@bandit.labs.overthewire.org -p 2220
cat spaces\ in\ this\ filename
```

Flag: `aBZ0W5EmUfAf7kHTQeOwd8bauFJ2lAiG`


### Level 2 -> Level 3

Goal: View hidden file with `ls -a`

```
ssh bandit3@bandit.labs.overthewire.org -p 2220
cd inhere
ls -a
vi .hidden
```

Flag: `2EW7BBsr6aMMoJ2HjW067dm8EgX26xNe`

### Level 3 -> Level 4

Goal: check what's inside file using `file`

```
ssh bandit4@bandit.labs.overthewire.org -p 2220
file ./*
```

Flag: `lrIWWI6bB37kxfiCQZqUdOIYfr6eEeqR`

### Level 4 -> Level 5

Goal: find file recursively; find executable file inside dummy directories

```
ssh bandit5@bandit.labs.overthewire.org -p 2220
ls -lR

```

Flag: ``




