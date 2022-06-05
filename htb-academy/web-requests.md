# Web Requests

## HyperText Transfer Protocol (HTTP)

```
curl -s -O 159.65.92.13:31665/download.php
```

![image](https://user-images.githubusercontent.com/34996954/172033540-c1855178-193b-4785-b896-ef5df5840b64.png)


## HTTP Requests and Responses

```
curl 157.245.33.77:30661 -v
```

![image](https://user-images.githubusercontent.com/34996954/172033578-f388efcf-bf49-4dc2-9dce-607d38093e53.png)
![image](https://user-images.githubusercontent.com/34996954/172033588-f72246d7-7c56-4ae7-9c36-b5fe7c96a118.png)
![image](https://user-images.githubusercontent.com/34996954/172033592-6eb5fb07-8d6d-4fa8-8243-b70a71fa22ec.png)


## HTTP Headers

Go to IP adress url and open browser dev tool with 'ctrl+shift+i'. Go to Network tab the view txt file and make requests.

![image](https://user-images.githubusercontent.com/34996954/172033714-87e229f1-01b2-4790-bafd-c9c2c58c562a.png)


```
curl http://159.65.92.13:30131/flag_327a6c4304ad5938eaf0efb6cc3e53dc.txt
```

![image](https://user-images.githubusercontent.com/34996954/172033671-9481c316-5ae6-4eaf-a879-5ebc71edb4c4.png)


## GET

Go to IP adress and enter credentials: username=admin; password=admin. Search 'flag' to see flag url and curl into the url

![image](https://user-images.githubusercontent.com/34996954/172033742-5a989480-9712-4a3f-8010-eff94d312500.png)

![image](https://user-images.githubusercontent.com/34996954/172033786-71c43cdb-6fb7-4dec-b6c3-b200498f8d7d.png)

```
curl -u 'admin:admin'  http://139.59.177.61:30054/search.php?search=flag
```

![image](https://user-images.githubusercontent.com/34996954/172033812-9798ba5d-aeb6-4e3a-8784-4f568d0b1e60.png)


## POST

Go to IP address and login using username=admin and password=admin. Find the cookie by opening the devtool 'ctrl+shift+i' in Network

![image](https://user-images.githubusercontent.com/34996954/172033905-77862c13-be43-4ee9-a2dc-461c35f373b3.png)

![image](https://user-images.githubusercontent.com/34996954/172033896-4f5fd228-1f65-49c9-8a18-4a8ef86ca89d.png)

```
curl -X POST -d '{"search":"flag"}' -b 'PHPSESSID=9rerdhremt3qlb46ntv0ir87v6' -H 'Content-Type: application/json' http://138.68.188.223:31545/search.php
```

![image](https://user-images.githubusercontent.com/34996954/172033960-c2e7be94-ea61-4772-94b6-981eaadc8060.png)


## CRUD API

1) Update city name 'london' to flag

```
curl -X PUT http://138.68.188.223:32338/api.php/city/london -d '{"city_name":"flag", "country_name":"HTB"}' -H 'Content-Type: application/json'
```

2) Delete any city

```
curl -X DELETE http://138.68.188.223:32338/api.php/city/boston
```

3) Search for flag

```
curl -s http://138.68.188.223:32338/api.php/city/flag
```

![image](https://user-images.githubusercontent.com/34996954/172034097-bb7a965b-d371-4bdd-87c2-bfbbeddfb2e6.png)

