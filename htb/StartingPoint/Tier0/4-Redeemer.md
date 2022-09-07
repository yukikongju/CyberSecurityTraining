# Redeemer

[Walkthrough](blob:https://app.hackthebox.com/ec1c2d8d-daab-4344-b32a-993a66eb832c)

Goal: Using `redis-cli` to connect to redis remotly and get the flag

## Concepts Learned

- Redis is a 'in-memory' database, which means that it is the primary memory 
  for data storage. Thus, we can find cache data in this database

**Commands**

```
sudo nmap -sV 10.129.72.102
nmap -p- -sV 10.129.72.102
redis-cli -h 10.129.72.102

select 0
keys *
```

**Recap**

0. We use ping to verify that we can connect to the target
1. We use nmap to find that all the tcp ports are closed. However, by using the 
   flag `-p-`, we find that one port use `redis`
2. We connect to the redis database using `redis-cli`
3. In the database, we find that that we can access to the keys using `select 0`
4. We check all the keys for the flag using `keys *`. We find that one of 
   the key is named flag, so we retrieve it using `get flag`

