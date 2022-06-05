# File Transfers


[Walkthrough](https://www.youtube.com/watch?v=1BfD6kmPFrs)

[Methods to perform file transfer](https://medium.com/@PenTest_duck/almost-all-the-ways-to-file-transfer-1bd6bf710d65)


## Windows File Transfer

```
wget 10.129.201.55/flag.txt
```
![image](https://user-images.githubusercontent.com/34996954/172055004-cc356761-bf5d-4737-b29b-667aab23f401.png)

![image](https://user-images.githubusercontent.com/34996954/172055012-7c7b3c2c-0dc0-4630-b74c-cec80b3c7fe3.png)


## Linux File Transfer Methods

```
curl 10.129.254.150/flag.txt
```

![image](https://user-images.githubusercontent.com/34996954/172054984-a54b7574-3d92-448e-827d-12c001952612.png)


## Catching Files over HTTP/SMB

1) Connect through ssh

```
curl htb-student@10.129.254.150 
pw: HTB_@cademy_stdnt!
```

2) Upload file using scp

From you computer:

```
scp upload_nix.zip htb-student@10.129.254.150:/tmp/upload_nix.zip
```

From HTB htb-student@nix04:
```
# go to dir
cd /tmp
# unzip file
gunzip -S .zip upload_nix.zip
# run hasher to get the flag
hasher upload_nix
```
![image](https://user-images.githubusercontent.com/34996954/172057964-dc9e457b-9ccb-44c4-830b-203adc040526.png)

