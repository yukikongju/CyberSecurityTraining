
# What we learn

- To download remote file to local machine with `scp -P <port> <user>@<IP>:<remotefilepath> <localfilepath>`
- we can use private key with `ssh -i` to login
- if the private key is accessible to all user, we can't ssh into it (see level 14) 
  we need to change permissions so that the key be only accessible to us


-----------------------

Flag: `wbWdlBxEir4CaE8LaPhauuOo6pwRmrDw`


### Level 13 -> Level 14


Goal: 
1. use `scp` to copy remote file to local machine
2. use private key to connect via `ssh`


-----BEGIN RSA PRIVATE KEY-----
MIIEpAIBAAKCAQEAxkkOE83W2cOT7IWhFc9aPaaQmQDdgzuXCv+ppZHa++buSkN+
gg0tcr7Fw8NLGa5+Uzec2rEg0WmeevB13AIoYp0MZyETq46t+jk9puNwZwIt9XgB
ZufGtZEwWbFWw/vVLNwOXBe4UWStGRWzgPpEeSv5Tb1VjLZIBdGphTIK22Amz6Zb
ThMsiMnyJafEwJ/T8PQO3myS91vUHEuoOMAzoUID4kN0MEZ3+XahyK0HJVq68KsV
ObefXG1vvA3GAJ29kxJaqvRfgYnqZryWN7w3CHjNU4c/2Jkp+n8L0SnxaNA+WYA7
jiPyTF0is8uzMlYQ4l1Lzh/8/MpvhCQF8r22dwIDAQABAoIBAQC6dWBjhyEOzjeA
J3j/RWmap9M5zfJ/wb2bfidNpwbB8rsJ4sZIDZQ7XuIh4LfygoAQSS+bBw3RXvzE
pvJt3SmU8hIDuLsCjL1VnBY5pY7Bju8g8aR/3FyjyNAqx/TLfzlLYfOu7i9Jet67
xAh0tONG/u8FB5I3LAI2Vp6OviwvdWeC4nOxCthldpuPKNLA8rmMMVRTKQ+7T2VS
nXmwYckKUcUgzoVSpiNZaS0zUDypdpy2+tRH3MQa5kqN1YKjvF8RC47woOYCktsD
o3FFpGNFec9Taa3Msy+DfQQhHKZFKIL3bJDONtmrVvtYK40/yeU4aZ/HA2DQzwhe
ol1AfiEhAoGBAOnVjosBkm7sblK+n4IEwPxs8sOmhPnTDUy5WGrpSCrXOmsVIBUf
laL3ZGLx3xCIwtCnEucB9DvN2HZkupc/h6hTKUYLqXuyLD8njTrbRhLgbC9QrKrS
M1F2fSTxVqPtZDlDMwjNR04xHA/fKh8bXXyTMqOHNJTHHNhbh3McdURjAoGBANkU
1hqfnw7+aXncJ9bjysr1ZWbqOE5Nd8AFgfwaKuGTTVX2NsUQnCMWdOp+wFak40JH
PKWkJNdBG+ex0H9JNQsTK3X5PBMAS8AfX0GrKeuwKWA6erytVTqjOfLYcdp5+z9s
8DtVCxDuVsM+i4X8UqIGOlvGbtKEVokHPFXP1q/dAoGAcHg5YX7WEehCgCYTzpO+
xysX8ScM2qS6xuZ3MqUWAxUWkh7NGZvhe0sGy9iOdANzwKw7mUUFViaCMR/t54W1
GC83sOs3D7n5Mj8x3NdO8xFit7dT9a245TvaoYQ7KgmqpSg/ScKCw4c3eiLava+J
3btnJeSIU+8ZXq9XjPRpKwUCgYA7z6LiOQKxNeXH3qHXcnHok855maUj5fJNpPbY
iDkyZ8ySF8GlcFsky8Yw6fWCqfG3zDrohJ5l9JmEsBh7SadkwsZhvecQcS9t4vby
9/8X4jS0P8ibfcKS4nBP+dT81kkkg5Z5MohXBORA7VWx+ACohcDEkprsQ+w32xeD
qT1EvQKBgQDKm8ws2ByvSUVs9GjTilCajFqLJ0eVYzRPaY6f++Gv/UVfAPV4c+S0
kAWpXbv5tbkkzbS0eaLPTKgLzavXtQoTtKwrjpolHKIHUz6Wu+n4abfAIRFubOdN
/+aLoRQ0yBDRbdXMsZN/jvY44eM+xRLdRVyMmdPtP8belRi2E2aEzA==
-----END RSA PRIVATE KEY-----



```
>>> ssh bandit13@bandit.labs.overthewire.org -p 2220
>>> cat sshkey.private
>>> exit

1. copy key to local [machine](machine)
>>> scp -P 2220 bandit13@bandit.labs.overthewire.org:sshkey.private bandit13_key

2. use the key to log
>>> ssh -i bandit13_key bandit14@bandit.labs.overthewire.org -p 2220

Permissions 0640 for 'bandit13_key' are too open.
It is required that your private key files are NOT accessible by others.

>>> chmod 700 bandit13_key # key only accessible for me
>>> ssh -i bandit13_key bandit14@bandit.labs.overthewire.org -p 2220


```

Flag: N/A


### Level 14 -> Level 15


Goal: use netcat `nc` to establish connections and listen

nc <host> <port>

```
>>> ssh bandit14@bandit.labs.overthewire.org -p 2220

1. get the password
>>> cd /etc/bandit_pass/
>>> cat bandit14
fGrHPx402xGC7U7rXKDaxiWFTOiF0ENq

2. send password via netcat
>>> nc localhost 30000
>>> fGrHPx402xGC7U7rXKDaxiWFTOiF0ENq
jN2kgmIXJ6fShzhT2avhotn4Zcka6tnt

```

Flag: `jN2kgmIXJ6fShzhT2avhotn4Zcka6tnt`


### Level 15 -> Level 16


Goal: 


```
>>> ssh bandit15@bandit.labs.overthewire.org -p 2220

```

Flag: ``

%% ---------------------------------------------------------

### Level 16 -> Level 17


Goal: 


```
>>> ssh bandit16@bandit.labs.overthewire.org -p 2220

```

Flag: ``

