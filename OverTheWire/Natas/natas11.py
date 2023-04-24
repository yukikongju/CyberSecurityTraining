import requests
from urllib.parse import unquote
import base64

#  https://www.youtube.com/watch?v=P-4DPO_OgIg&list=PL1H1sBF1VAKWM3wMCn6H5Ql6OrgIivt2V&index=9

#  not used


username = "natas11"
password = "1KFqoJXi6hRaPluAmk8ESDW4fSysRoIg"

url = f"http://{username}.natas.labs.overthewire.org/"


print(url)
print(password)




#  1. get response
session = requests.Session()
response = session.get(url, auth = (username, password))
content = response.text
print(content)
print(response.headers)
print(session.cookies)


# 2. get cookie
cookie = session.cookies['data'] # we can't use it completely because it has url symbol that need to be converted
cookie = unquote(session.cookies['data'])
print(cookie)

# 3. decode cookie to get background color

#  a. find the key: plaintext ^ ciphertext = key



print()


