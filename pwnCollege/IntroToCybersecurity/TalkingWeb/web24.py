import requests

url="http://127.0.0.1:80"
data = {"a": "3777d1cdfc3e2bd180b906b607c0bae7", "b": "efde695d 88f8ed1c&7e5fb159#3b86c000"}
res = requests.post(url=url, data=data)
print(res.text)
