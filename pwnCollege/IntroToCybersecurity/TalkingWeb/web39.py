import requests

N = 3
url="http://127.0.0.1:80"
res = requests.get(url)

for i in range(N):
    cookies = res.cookies
    res= requests.get(url, cookies=cookies)

print(res.text)

