# Crocodile

[Walkthrough](blob:https://app.hackthebox.com/782aaa03-2b39-4e44-b583-2f6c6f2c010f)

Goal: 

## Concepts Learned

**Commands**

```
nmap -sC -sV 10.129.149.169
ftp 10.129.149.169
get ...

gobuster

```


**Recap**

1. we use nmap to scan open port. We find that one port use `ftp` as it service 
   and another `http`. Let's check out the ftp first
2. We connect to network using ftp with the username `anonymous`. We 
   downloaded the userlists files, but haven't found the flag yet
3. Looking at the userlist files, we find that a username is called `aron`. 
   We try to login using his credentials, but no luck there either. Let's try 
   the http port
4. There is not much on the site, so we run gobuster on the IP address. We 
   find that one of the page is called `login.php`. We go to this page
5. We test out a bunch of credentials using the userlists we found earlier. 
   It worked with `admin` and we get our flag
