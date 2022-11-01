# Natas


## What we Learned

- the `robots.txt` file tells the search engine crawlers which URLs can be 
  accessed


### Level 0 -> Level 1

Goal: Inspect the source code to find the flag

```
Username: natas0
Password: natas0
URL:      http://natas0.natas.labs.overthewire.org

<!--The password for natas1 is g9D9cREhslqBKtcA2uocGHPfMZVzeFK6 -->
```

Flag: `g9D9cREhslqBKtcA2uocGHPfMZVzeFK6`


### Level 1 -> Level 2

Goal: Inspect page source even though "right click is blocked" ie try it even 
	though it says it doesn't work

```
Username: natas1
URL:      http://natas1.natas.labs.overthewire.org

<!--The password for natas2 is h4ubbcXrWqsTo7GGnnUMLppXbOogfBZ7 -->

```

Flag: `h4ubbcXrWqsTo7GGnnUMLppXbOogfBZ7`


### Level 2 -> Level 3

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


### Level 3 -> Level 4

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

### Level 4 -> Level 5

Goal: 

```
Username: natas4
URL:      http://natas4.natas.labs.overthewire.org
```

Flag: ``


%% ------------------------------------------------------------------

### Level 5 -> Level 6

Goal: 

```
Username: natas5
URL:      http://natas5.natas.labs.overthewire.org
```

Flag: ``



%% ------------------------------------------------------------------

### Level 6 -> Level 7

Goal: 

```
Username: natas6
URL:      http://natas6.natas.labs.overthewire.org
```

Flag: ``



%% ------------------------------------------------------------------

### Level 7 -> Level 8

Goal: 

```
Username: natas7
URL:      http://natas7.natas.labs.overthewire.org
```

Flag: ``




