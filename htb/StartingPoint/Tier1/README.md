# HTB Starting Point - Tier 1

## What we Learned

1. We can use nmap with the flag `-sC` and `-sV` for a more thorough open 
   port analysis
2. If one of the service used is `mysql`, we just have to find the info we need 
   by exploring the database using `SHOW databases; USE <db_name>; SHOW tables;`
3. If the service used is `http`, it would be a good idea to run `gobuster` 
   to find any hidden page. We want to find:
   - login page: we can then brute force through the credentials
   - if the website is LFI safe by going to root file (test with windows first)
   - sub-domain: the subdomain can give us more information on the database used 
     (ex: amazon s3) and we can intercept files by hosting our own servers
4. If we see that the `http` server load a static page, it might be a good 
   idea to check if we can access to the root server. If we can do so, then 
   we can do a LFI (local file intrusion) attack
5. If we get a hash, we can use `john the ripper` to find the password
6. `Responder` can be used to catch SMB files

