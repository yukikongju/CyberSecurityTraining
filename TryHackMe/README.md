# TryHackMe


**Introduction to Cyber Security (24h)**

- Introduction to Cyber Security
    * [X] Intro to Offensive Security
    * [X] Intro to Defensive Security
    * [X] Careers in Cyber
- Introduction to Offensive Security
    * [X] Web Application Security  (2023-04-23)
	* learned: don't use chronological number to identify objects or text
    * [X] Operating System Security (2023-04-23)
	* look in `history` to check if any password
    * [X] Network Security          (2023-04-23)
	* learned: if we connect to root, we may be able to go into other account by checking `ls /home/`
- Introduction to Defensive Security
    * [X] Intro to Digital Forensics (2023-04-23)
	* using `pdfinfo` and `exiftool` to find metadata on pdf and images
    * [X] Security Operations (2023-04-23)


**Pre Security (40h)**

- Introduction to Cyber Security
- Network Fundamentals
    * [X] What is Networking (2023-04-24)
	* 'ping', MAC (media access control)
    * [X] Intro to LAN (2023-04-24)
	* network topologies and their flaws: star, bus, ring; routers; switchs
	    + bus: cannot handle lots of packet
	    + ring: if one server down, all down
	    + star: if switch down, network down
	* subnet mask: network, host, default gateway
	* ARP Protocol (Address resolution Protocol): associate mac address to IP
	* DHCP Protocol (dynamic Host Configuration Protocol): discover -> offer -> request -> ACK
    * [X] OSI Model (2023-04-26)
	* OSI: Open System Interconnection Model
	* 7 layers: physical (ethernet cable), data link (MAC / NIC), network (OSPF / RIP), transport (TCP [requires all packets] / UDP [don't]), session, presentation, application
    * [X] Packets & Frames (2023-04-28)
	* Difference between packet and frames? frame don't have IP addresses
	* TCP/IP: connection-based, three way handshake (SYN/ACK), checksum for data integrity
	* UDP/IP: stateless (no acknowledgement), time to live (TTL)
	* Ports: port range (0-65535); data = port 80; common port (0-1024); port connection with netcat `nc`
	* Types of protocols: ftp (21), ssh (22), http (80), https (443), SMB (445), RDP (3389) [more](http://www.vmaxx.net/techinfo/ports.htm)
    * [X] Extending Your Network (2023-04-28)
	* Port Forwarding using router
	* Stateful vs stateless Firewall: inspect connection vs individual packet inspection ([snort](https://www.snort.org/))
	* VPN benefits: offers privacy and anonymity without network having to communicate with each other directly
	* VPN Technology: PPP (encryption + authentification), PPTP (PPP but can leave network), IPSec (encrypt IP / [strong])
	* Virtual Local Area Network (VLAN)
- How The Web Works
    * [X] DNS in detail (2023-04-29)
	* DNS: Domain Name System; map IP adress to url
	* Domain hierarchy: Top Level Domain (TLD: gTLD (generic) vs ccTLD (country code)), Second Level Domain, Subdomain (63 char max); max length dns = 253 char
	* DNS Record Types: A (IPv4), AAAA (IPv6), CNAME (map to another DNS), MX (emails), TXT
	* Making a request: ask recursive DNS server if DNS not in cache; Time to live (TTL); stored in authoritative DNS server
	* `nslookup --type={CNAME, MX, A, TXT} <url>`
    * [X] HTTP in detail (2023-04-29)
	* HyperText Transfer Protocole Secure (HTTPS)
	* what is an url: scheme (http/https), user, host, port, path, query, fragment; `GET / HTTP/1.1`
	* HTTP Methods: GET (read), POST (create), PUT (update), DELETE
	* HTTP Status Code: [100-199] information response, [200-299] success, [300-399] redirection, [400-499] client error, [500-599] server errors
	* request Headers: host, user-agent, content-length, accept-encoding
	* response headers: set-cookie, cache-control, content-type, content-encoding
	* cookies:
    * [X] How websites work (2023-04-29)
	* SQL Injection => creating html links in input: `<a href="http://hacker.com" class="button">t</button>`
    * [X] Putting it all together (2023-04-29)
	* other components of DNS network: load balancers (health check), content delivery network (CDN), Databases, Web Application Firewall (WAF)
	* virtual host
- Linux Fundamentals
    * [ ] pt 1
    * [ ] pt 2
    * [ ] pt 3
- Window Fundamentals
    * [ ] pt 1
    * [ ] pt 2
    * [ ] pt 3


**Web Fundamentals (32h)**

- [X] How the Web Works
- Introduction to Web Hacking
    * [X] Walking an Application (2023-04-29)
    * [X] Content Discovery (2023-04-29)
    * [X] Subdomain Enumeration (2023-04-29)
    * [X] Authentication Bypass (2023-04-30)
    * [X] IDOR (2023-04-30)
    * [ ] File Inclusion
    * [X] SSRF (2023-04-30)
    * [ ] Cross-site Scripting
    * [X] Command Injection (2023-05-06)
    * [X] SQL Injection (2023-05-06)
- Burp Suite
    * Basics
    * Repeater
    * Intruder
    * Other Modules
    * Extender
- Web Hacking Fundamentals
    * How websites work
    * HTTP in detail
    * Burp Suite
    * OWASP Top 10
    * OWASP Juice Shop
    * Upload Vulnerabilities
    * Pickle Rick

**Jr Penetration Tester (64h)**

- Introduction to Cyber Security
- Introduction to Pentesting
- Introduction to Web Hacking
- Burp Suite
- Network Security
- Vulnerability Research
- Metasploit
- Privilege Escalation

**Offensive Pentesting**

- Getting Started
- Advanced Exploitation
- Buffer Overflow Exploitation
- Active Directory
- Extra Credit

**Red Teaming (48h)**

**Cyber Defense (48h)**



