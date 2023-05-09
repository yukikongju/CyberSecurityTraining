# Burp Suite - 

## Burp Suite - The Basics

- Tools in Burp Suite:
    * Proxy: intercepting requests/response
    * Repeater: intercept and modify requests
    * Intruder: bruteforce attacks or fuzz endpoints
    * Decoder: encoding or decoding payload
    * Comparer: comparing files bytes per bytes
    * Sequencer: assess randomness in token or cookie session
- Views in dashboard: Tasks, Event Logs, Issue Activities, Advisory
- Project options tabs: connections, http, tls, sessions, misc
- 'Proxy' Introduction
- 'Target' Introduction
    * Site Map
    * Scope
    * Issue Definitions
- To perform XSS using Burp Suite: intercept package and change payload before forwarding

```
>>> Forward and backward in tickets
THM{NmNlZTliNGE1MWU1ZTQzMzgzNmFiNWVk}

email=pentester%40example.thm&content=test+attack
<script>alert('Succ3ssful XSS');</script>
>>> email=<script>alert('Succ3ssful XSS');</script>&content=test+attack

```

## Burp Suite - Repeater

- change: `Connection: close` to `Connection: open` => `Connection: keep-alive`
- Inspector: 'skipped'


**Practical 1: adding header in request**

```
>>> FlagAuthorised: True
THM{Yzg2MWI2ZDhlYzdlNGFiZTUzZTIzMzVi}
```

