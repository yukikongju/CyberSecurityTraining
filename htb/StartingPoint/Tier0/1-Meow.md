# Meow 

Goal: Finding and connecting to open port using nmap, ping telnet

[Walkthrough](blob:https://app.hackthebox.com/bfeedc4b-2c77-4a32-82d8-18f37c73049c)


## What we learned

- To find open ports, we use `nmap`
- We can use `ping` to see if our packets have reached destination
- To connect remotely on other network host, we can use `telnet`
- We can try several credentials: admin, adminstrator, root

**Commands**

```
sudo nmap -sV 10.129.1.17
ping 10.129.1.17
telnet 10.129.1.17
```

**Recap**

1. We use nmap to find the open ports
2. we use ping to find that the service we use to connect to the network is telnet
3. we use telnet to connect to the network using a bunch of credentials (admin, 
   administrator, root). root was the right credential
4. We capture the flag 


