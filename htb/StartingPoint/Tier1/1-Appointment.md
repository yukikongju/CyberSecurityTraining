# Appointment

[Walkthrough](blob:https://app.hackthebox.com/f521bd46-f80c-415c-a995-098ea55c7945)

Goal: Perform SQL Injection against SQL DB

## Concepts Learned


- We can get caught by perimeter security using nmap with `-sC` (script scanning)
  and `-sV` (script version) because they are intrusive methods
- When we see that the service is `http`, we know that the target IP is an url
- we can use `gobuster` to find page and directories inside a website
- We can use [secList](https://github.com/danielmiessler/SecLists) to get a 
  bunch of keywords
- To perform SQL Injection, we want our query to look like this:
    - `SELECT * FROM users WHERE username='admin'#' AND password='a' `. This 
      query will find 1 row and give us access


**Commands**

```
nmap -sC -sV 10.129.48.204
gobuster dir --url https://10.129.48.204/ --wordlist 

Username: admin'#; password: whatever
```


**Recap**

1. We run nmap to find any open ports. We find that the service is `http`, so 
   we know that our target IP is an url which we can paste in our browser
2. On the website, we see that there is a login page. We need to find the 
   credentials
3. We tried to use gobuster to find any useful informations. We didn't find 
   any, so we try brute forcing the login. 
4. Brute forcing the login didn't work, so we try SQL Injection
5. We input `admin'#` in the login page and we find the flag


