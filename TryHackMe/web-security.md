# Web Security

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



