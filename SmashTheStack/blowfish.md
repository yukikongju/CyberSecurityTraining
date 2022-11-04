# Blowfish


## What we learned

- connection to telnet: `telnet <host> <port>`
- find useful flags:
    - `find / -type f`: find file from home
    - `-perm /6000`: files permissions
    - `-exec <command> {}`: execute command

%% -------------------------------------------------------


## Level 1 - Telnet connection

Goal: connect to telnet

```
1. get encrypted password
telnet blowfish.smashthestack.org 6666
Trying 84.22.114.35...
Connected to blowfish.smashthestack.org.
Escape character is '^]'.


Encrypted Password is: GungJnfRnfl

Connection closed by foreign host.

2. decrypt password: brute force ceasar cipher
ThatWasEasy

```
Flag: `ThatWasEasy`


%% -------------------------------------------------------


## Level 2 

Goal: check which files is accessible by user

```
>>> ssh level2@blowfish.smashthestack.org -p 2222

1. find file which user has permission
>>> find / -type f -perm /6000 -exec ls -l {} \; | grep level2
-rwsr-x--- 1 level3 level2 11529 Dec  3  2012 /var/opt/.level3_backdoor

2. log into shell
>>> /var/opt/.level3_backdoor 
>>> cat /pass/level3
bl0wfi1sh_Rul3Z!

```
Flag: `bl0wfi1sh_Rul3Z!`


%% -------------------------------------------------------

## Level 3 

Goal: 

```
>>> ssh level3@blowfish.smashthestack.org -p 2222


```
Flag: ``


%% -------------------------------------------------------

## Level 4 

Goal: 

```


```
Flag: ``




