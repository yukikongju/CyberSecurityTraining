# Level 1/2/3 - Open port and sending HTTP request: curl, nc, python

```
> curl http://127.0.0.1:80
> echo -e "GET / HTTP/1.1\r\nHost: 127.0.0.1\r\nConnection: close\r\n\r\n" | nc 127.0.0.1 80
> python -c "import requests; print(requests.get('http://127.0.0.1:80').text)"
```

# Level 4/5/6 - HTTP request with header

```
> curl -H "Host: b01646261cdf6d928184f4e39c1c6833" http://127.0.0.1:80
> echo -e "GET / HTTP/1.1\r\nHost: e76dbe86a196617e8b753a4edef52e43\r\nConnection: close\r\n\r\n" | nc 127.0.0.1 80
> python -c "import requests; url='http://127.0.0.1:80/'; headers={'Host': 'dac6cf5fc69f38ba8e782dfa034ba5bf'}; response = requests.get(url, headers=headers); print(response.text)"
```

# Level 7/8/9 - Get Path of HTTP request

```
> curl http://127.0.0.1:80/2f535bf3401478355dba06559d5c9825
> echo -e "GET /c0dfe6945635e28c1a9844ec431bbf5b HTTP/1.1\r\nHost: 127.0.0.1\r\nConnection: close\r\n\r\n" | nc 127.0.0.1 80
> python -c "import requests; print(requests.get('http://127.0.0.1:80/66468611e10b6aa006a991524cef3071').text)"
```
# Level 10 - HTTP request with URL encode



