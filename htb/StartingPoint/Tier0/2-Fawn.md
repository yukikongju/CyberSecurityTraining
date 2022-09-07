# Fawn - File Transfer Protocol (FTP)

[Walkthrough](blob:https://app.hackthebox.com/4f0b4ff7-fd1e-4673-aa38-c51abbd1199c)

Goal: Fetch data during FTP if data transfer is poorly done


## Concepts Learned

```
sudo nmap -sV 10.129.1.14
ftp 10.129.1.14
```

**Recap**

1. We used nmap to find that the network service if ftp
2. we connected to the network using ftp
3. we connected to the network using the following credentials: 
    username: anonymous; password: anon123
4. We downloaded the flag on our local computer using `get flag.txt`


