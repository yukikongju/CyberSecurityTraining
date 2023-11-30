import requests

url="http://127.0.0.1:80"
headers={"Content-type": "application/json"}
json_data = {'a': 'e67b1ebe6857f04044a38b1c8e4d2f12'}
res = requests.post(url=url, json=json_data, headers=headers)
print(res.text)
