# Sequel

[Walkthrough](blob:https://app.hackthebox.com/4a09df2f-11bc-4b3c-86c9-463140625ba5)

Goal: 

## Concepts Learned

**Commands**

- We can connect to mysql database using the flag `-h` (host) and `-u` username

```
nmap -sC -sV 10.129.19.203
mysql -h 10.129.19.203 -u root

SHOW databases;
use htb;
SHOW tables;
select * from config;

```

**Recap**

1. We performed nmap to find open port, and we found that one use `mysql` as 
   as service
2. We connect to mysql database using `root` as username (we tried admin but it 
   didn't work)
3. By exploring database, we found that the flag was in the config table.
