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
# Level 10/11/12 - HTTP request with URL encode

- replace space by `%20`

```
> curl "http://127.0.0.1:80/0f9d4d06%205bf3cffd/98d14b89%20c388206b"
> echo -e "GET /58e9e788%20101c2586/49ecaa5c%2032c3faea HTTP/1.1\r\nHost: 127.0.0.1\r\nConnection: close\r\n\r\n"  | nc 127.0.0.1 80
> python -c "import requests; print(requests.get('http://127.0.0.1:80/3559c538%20dfb52ebd/15b97dbc%20a6acc600').text)"
```

# Level 13/14/15/16/17/18 - Specify an argument / multiples arguments in HTTP request

- replace `&` by `%26`
- replace `#` by `%23`

```
> curl "http://127.0.0.1:80/?a=8d205a910ed45abb1400effa672794d1"
> echo -e "GET /?a=8cc75a9b5926a7dde346355c23cf46dd HTTP/1.1\r\nHost: 127.0.0.1\r\nConnection: close\r\n\r\n" | nc 127.0.0.1 80
> python -c "import requests; print(requests.get('http://127.0.0.1:80/?a=61e3a3021372cdc27a65491f182e3bcd').text)"

> curl "http://127.0.0.1:80/?a=7847bde3a8e0ea5b175555527c70fc16&b=37322bda%20d4a69ff7%265607dbec%23725ec12e"
> echo -e "GET /?a=2986016fba44ba00b00271359f43cc46&b=1ad00a56%20e72d06e2%26937f8b22%23fd190947 HTTP/1.1\r\nHost: 127.0.0.1\r\nConnection: close\r\n\r\n" | nc 127.0.0.1 80
> python -c "import requests; print(requests.get('http://127.0.0.1:80/?a=dd2367ac5705aec7860e846e0f2da95c&b=6e5468e7%20e79d6e00%261dea30a9%23deb4bd92').text)"
```

# Level 19/20/21/22/23/24 - Single and Multiple HTTP POST Request

- No need to encode special characters in json

```
> curl -X POST -d "a=39045a2881409c55aa06ca942cef2de8" http://127.0.0.1:80/

> curl -X POST -d "a=f6cc9b6515ef6bcd07d14c3610d85d04&b=f4808805%2043e6b69a%26ae3b016a%2354797d2b" http://127.0.0.1:80/
```

# Level 25/26/27/28/29/30 - Adding JSON in HTTP request

```
> curl -X POST -H "Content-Type: application/json" -d '{"a": "5e6d92a2a8cb9497026cea150ff689b0"}' http://127.0.0.1:80

> curl -X POST -H "Content-Type: application/json" -d '{
 "a": "35aa18366eaeffd8f794850c0f0b7162", 
 "b": {
     "c": "d23cd786",
     "d": ["68f37916", "e95d5ff5 787976b4&f61e36f2#c9dc1ece"]
 }
}' http://127.0.0.1:80

```

# Level 31/32/33 - Follow an HTTP redirect from HTTP response


# Level 34/35/36 - Include Cookie in HTTP request

