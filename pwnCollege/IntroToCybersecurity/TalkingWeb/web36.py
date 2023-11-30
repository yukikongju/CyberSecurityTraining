import requests

url="http://127.0.0.1:80"
res = requests.get(url)
cookies = res.cookies

response = requests.get(url, cookies=cookies)
print(response.text)

