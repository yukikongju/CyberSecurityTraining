import requests

url="http://127.0.0.1:80"
headers={"Content-type": "application/json"}
json_data = {'a': 'e93f850bf58b70a99de551885e93e7ef', 
             'b': {
                 'c': '05cee41a',
                 'd': ['4b71ff6e', '8c3f8d24 cb320193&9254f563#767be4ca']
                 }
             }
res = requests.post(url=url, json=json_data, headers=headers)
print(res.text)

