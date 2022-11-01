# What we learned

- we can gain access to user password when we execute file as them (see level 19->20)


Flag: `awhqfNnAbc1naukrpqDYcF95h7HoMTrC`

%% ---------------------------------------------------------

### Level 19 -> Level 20 (CHECK!)


Goal: Run ELF command(?)

```
>>> ssh bandit19@bandit.labs.overthewire.org -p 2220
>>> ./bandit20-do

Run a command as another user.
  Example: ./bandit20-do id

>>> ls -la

drwxr-xr-x  2 root     root      4096 Sep  1 06:30 .
drwxr-xr-x 49 root     root      4096 Sep  1 06:30 ..
-rwsr-x---  1 bandit20 bandit19 14872 Sep  1 06:30 bandit20-do
-rw-r--r--  1 root     root       220 Jan  6  2022 .bash_logout
-rw-r--r--  1 root     root      3771 Jan  6  2022 .bashrc
-rw-r--r--  1 root     root       807 Jan  6  2022 .profile

The binary file is executed as bandit20 even though we are bandit19, so 
we can access to bandit20 password

>>> ./bandit20-do cat /etc/bandit_pass/bandit20
VxCazJaVykI6W36BkBU0mJTCM8rR95XT
```

Flag: `VxCazJaVykI6W36BkBU0mJTCM8rR95XT`

%% ---------------------------------------------------------

### Level 20 -> Level 21


Goal: 


```
>>> ssh bandit20@bandit.labs.overthewire.org -p 2220

```

Flag: ``

%% ---------------------------------------------------------

### Level 21 -> Level 22


Goal: 


```
>>> ssh bandit21@bandit.labs.overthewire.org -p 2220

```

Flag: ``

