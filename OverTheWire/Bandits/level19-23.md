# What we learned

- Good idea to check file permission with `ls -la` to find if we can execute 
  file as another user (level 19 -> 20)
- we can send line of text over netcat connection using `echo -n 'Line of text' | nc <ip> <port>` (see level 20 -> 21)


Flag: `awhqfNnAbc1naukrpqDYcF95h7HoMTrC`

%% ---------------------------------------------------------

### Level 19 -> Level 20 (CHECK!)


Goal: execute file as another user when we have the permission use `ls -la`

```
>>> ssh bandit19@bandit.labs.overthewire.org -p 2220
>>> ./bandit20-do

Run a command as another user.
  Example: ./bandit20-do id

>>> ls -la

drwxr-xr-x  2 root     root      4096 Sep  1 06:30 .
drwxr-xr-x 49 root     root      4096 Sep  1 06:30 ..
-rwsr-x---  1 bandit20 bandit19 14872 Sep  1 06:30 bandit20-do
-rw-r--r--  1 root     root       220 Jan  6  2022 .bash_logout
-rw-r--r--  1 root     root      3771 Jan  6  2022 .bashrc
-rw-r--r--  1 root     root       807 Jan  6  2022 .profile

The binary file is executed as bandit20 even though we are bandit19, so 
we can access to bandit20 password

>>> ./bandit20-do cat /etc/bandit_pass/bandit20
VxCazJaVykI6W36BkBU0mJTCM8rR95XT
```

Flag: `VxCazJaVykI6W36BkBU0mJTCM8rR95XT`

%% ---------------------------------------------------------

### Level 20 -> Level 21 


Goal: send a line of text over a netcat connection

```
>>> ssh bandit20@bandit.labs.overthewire.org -p 2220
>>> echo -n 'VxCazJaVykI6W36BkBU0mJTCM8rR95XT' | nc -l -p 1234 &

the symbol '&' let the process run in background

>>> ./suconnect 1234

Read: VxCazJaVykI6W36BkBU0mJTCM8rR95XT
Password matches, sending next password
NvEJF7oVjkddltPSrdKEFOllh9V1IBcq

```

Flag: `NvEJF7oVjkddltPSrdKEFOllh9V1IBcq`

%% ---------------------------------------------------------

### Level 21 -> Level 22


Goal: 


```
>>> ssh bandit21@bandit.labs.overthewire.org -p 2220

1. check for cron jobs
>>> cd /etc/cron.d
>>> cat cronjob_bandit22.sh

@reboot bandit22 /usr/bin/cronjob_bandit22.sh &> /dev/null
* * * * * bandit22 /usr/bin/cronjob_bandit22.sh &> /dev/null

2. Try to execute sh file and check what's inside it
>>> cat /usr/bin/cronjob_bandit22.sh

#!/bin/bash
chmod 644 /tmp/t7O6lds9S0RqQh9aMcz6ShpAoZKF7fgv
cat /etc/bandit_pass/bandit22 > /tmp/t7O6lds9S0RqQh9aMcz6ShpAoZKF7fgv

We see that the password has been redirected in the file

3. find the password
>>> cat /tmp/t7O6lds9S0RqQh9aMcz6ShpAoZKF7fgv
WdDozAdTM2z9DiFEQ2mGlwngMfj4EZff
```

Flag: `WdDozAdTM2z9DiFEQ2mGlwngMfj4EZff`

%% ---------------------------------------------------------

### Level 22 -> Level 23


Goal: 


```
>>> ssh bandit22@bandit.labs.overthewire.org -p 2220

1. look inside cron directory
>>> cd /etc/cron.d
>>> ls -la
>>> cat cronjob_bandit23
@reboot bandit23 /usr/bin/cronjob_bandit23.sh  &> /dev/null
* * * * * bandit23 /usr/bin/cronjob_bandit23.sh  &> /dev/null

2. check what's inside bash file
>>> /usr/bin/cronjob_bandit23.sh
Copying passwordfile /etc/bandit_pass/bandit22 to /tmp/8169b67bd894ddbb4412f91573b38db3

>>> cat /usr/bin/cronjob_bandit23.sh

#!/bin/bash
myname=$(whoami)
mytarget=$(echo I am user $myname | md5sum | cut -d ' ' -f 1)
echo "Copying passwordfile /etc/bandit_pass/$myname to /tmp/$mytarget"
cat /etc/bandit_pass/$myname > /tmp/$mytarget

We see that the password for the user is store in $mytarget, so we need to 
generate it using bandit23 bc we want that password

3. find flag
>>> echo "I am user bandit23" | md5sum | cut -d ' ' -f 1
8ca319486bfbbc3663ea0fbe81326349
>>> cat 8ca319486bfbbc3663ea0fbe81326349
QYw0Y2aiA672PsMmh9puTQuhoz8SyR2G

```

Flag: `QYw0Y2aiA672PsMmh9puTQuhoz8SyR2G`

%% ---------------------------------------------------------

### Level 23 -> Level 24


Goal: 


```
>>> ssh bandit23@bandit.labs.overthewire.org -p 2220

1. look inside cron dir
>>> cd /etc/crond.d
>>> cat cronjob_bandit24

@reboot bandit24 /usr/bin/cronjob_bandit24.sh &> /dev/null
* * * * * bandit24 /usr/bin/cronjob_bandit24.sh &> /dev/null

>>> /usr/bin/cronjob_bandit24.sh

/usr/bin/cronjob_bandit24.sh: line 5: cd: /var/spool/bandit23/foo: No such file or directory
Executing and deleting all scripts in /var/spool/bandit23/foo:
Handling cronjob_bandit15_root
rm: cannot remove './cronjob_bandit15_root': Permission denied
Handling cronjob_bandit17_root
rm: cannot remove './cronjob_bandit17_root': Permission denied
Handling cronjob_bandit22
rm: cannot remove './cronjob_bandit22': Permission denied
Handling cronjob_bandit23
rm: cannot remove './cronjob_bandit23': Permission denied
Handling cronjob_bandit24
rm: cannot remove './cronjob_bandit24': Permission denied
Handling cronjob_bandit25_root
rm: cannot remove './cronjob_bandit25_root': Permission denied
Handling e2scrub_all
rm: cannot remove './e2scrub_all': Permission denied
Handling otw-tmp-dir
rm: cannot remove './otw-tmp-dir': Permission denied
Handling sysstat
rm: cannot remove './sysstat': Permission denied
Handling .placeholder
rm: cannot remove './.placeholder': Permission denied


2. look inside bash file 

>>> cat /usr/bin/cronjob_bandit24.sh

#!/bin/bash
myname=$(whoami)
cd /var/spool/$myname/foo
echo "Executing and deleting all scripts in /var/spool/$myname/foo:"
for i in * .*;
do
    if [ "$i" != "." -a "$i" != ".." ];
    then
        echo "Handling $i"
        owner="$(stat --format "%U" ./$i)"
        if [ "${owner}" = "bandit23" ]; then
            timeout -s 9 60 ./$i
        fi
        rm -f ./$i
    fi
done

>>> ls -la var/spool/

drwxr-xr-x  5 root     root     4096 Sep  1 06:30 .
drwxr-xr-x 13 root     root     4096 Sep  1 06:30 ..
dr-xr-x---  3 bandit24 bandit23 4096 Sep  1 06:30 bandit24
drwxr-xr-x  3 root     root     4096 Aug 10 12:21 cron
lrwxrwxrwx  1 root     root        7 Aug 10 12:21 mail -> ../mail
drwx------  2 syslog   adm      4096 Dec 30  2021 rsyslog

>>> ls -la /var/spool/bandit24/

drwxrwx-wx 14 root     bandit24 4096 Nov  2 04:20 foo


3. Make script to copy password

>>> mktemp -d
/tmp/tmp.SGjvD5tLNH

Create script: bandit24_pass.sh

#!/bin/bash
cat /etc/bandit_pass/bandit24 > /tmp/tmp.SGjvD5tLNH/password

```

Flag: ``


[SOlution](https://mayadevbe.me/posts/overthewire/bandit/level24/)


%% ---------------------------------------------------------

### Level 24 -> Level 25


Goal: 


```
>>> ssh bandit24@bandit.labs.overthewire.org -p 2220


```

Flag: ``



%% ---------------------------------------------------------

### Level 25 -> Level 26


Goal: 


```
>>> ssh bandit25@bandit.labs.overthewire.org -p 2220

```

Flag: ``



