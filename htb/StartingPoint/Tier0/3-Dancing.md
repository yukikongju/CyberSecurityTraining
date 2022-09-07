# Dancing

[Walkthrough](blob:https://app.hackthebox.com/445b5843-e43d-4d9f-909d-869453f75330)


Goal: Get some file when the network use SMB as a service

## Concepts Learned

- Server Message Block (SMB) is a protocoal that can be use to transfer file 
  between two host on the same network
- If the port is 445/tcp, it usually means that the server is `smbclient`

**Commands**

```
sudo nmap -sV 10.129.243.177
smbclient -L 10.129.243.177
smbclient \\\\10.129.243.177\\WorkShares
```


**Recap**

1. we use nmap to check for open ports
2. we found that one of the open port is `445/tcp`, which means that the 
   server is `smbclient`
3. We see a bunch of sharename (admin, C, IPC, Workshares) and we try to connect 
   to them. We found that Workshares can be accessed
4. We find that the flag is in James.P and we download it using `get flag.txt`


