import requests

url="http://127.0.0.1:80"
data = {"a": "a1d4f5e63eaf4630b86ec7fc6a5f3b38"}
res = requests.post(url=url, data=data)
print(res.text)
