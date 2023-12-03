# Level 1/2 - 

```{sh}
> nc 10.0.0.3 31337
> nc -l 31337
```

# Level 3 - 

The remote host is somewhere on the `10.0.0.0/24` subnetwork, listening on port `31337`.

```{sh}
> nmap '10.0.0.0/24'
Starting Nmap 7.80 ( https://nmap.org ) at 2023-12-03 03:42 UTC
Nmap scan report for 10.0.0.215
Host is up (0.000011s latency).
Not shown: 999 closed ports
PORT      STATE SERVICE
31337/tcp open  Elite
MAC Address: 16:BC:FC:DA:B8:ED (Unknown)

Nmap scan report for 10.0.0.2
Host is up (0.0000080s latency).
All 1000 scanned ports on 10.0.0.2 are closed

Nmap done: 256 IP addresses (2 hosts up) scanned in 32.59 seconds

> nc 10.0.0.215 31337
```

# Level 4 - 




