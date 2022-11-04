# Forensics


## Challenge 20: I made a dd of Agent Smith usb key


```
>>> https://ringzer0ctf.com/challenges/20

The flag is inside the file

>>> vi 86b265d37d1fc10b721a2accae04a60d
FLAG-ggmgk05096
```

Flag: `FLAG-ggmgk05096`


## Challenge 65: Hide my ass in my home

Goal: view hidden files with `ls -la`


```
>>> 
>>> ls -la
>>> vi .me.swp

2. search for flag: 
Flag-1s4g76jk89f

```

## Challenge 92: Dinosaure Survive

Goal: 

```
>>> https://ringzer0ctf.com/challenges/92

1. find file signature using 'xxd'
>>> xxd <file>
00000000: 4556 4609 0d0a ff00 0101 0000 0068 6561  EVF..........hea

By looking at the first 4 bytes, we see that it is an E01 file, which is a 
mounted image

2. mount the image using `xmount`

By looking at manual:
>>> mkdir mountpoint
>>> xmount --in ewf <file> mountpoint

3. look for flag 
>>> strings 0b02119984a7cee0ba83d55425b9491f.dd | grep "flag"
flag-pc
flag-6b96e212b3f85968db654f7892f06122
flag-6b96e212b3f85968db654f7892f06122
flag-6b96e212b3f85968db654f7892f06122
```

Flag: `flag-6b96e212b3f85968db654f7892f06122`



## Challenge 103: Dr. Pouce

Goal: use exiftool to find file metadata

```
>>> https://ringzer0ctf.com/challenges/103

1. find metadata
>>> exiftool DR_Pouce.pdf
Author: Steve Finger
>>> exiftool DR_Pouce.png
GPS Latitude                    : 44 deg 38' 46.43" N
GPS Longitude                   : 63 deg 34' 23.83" W
Focal Length                    : 4.0 mm
GPS Position                    : 44 deg 38' 46.43" N, 63 deg 34' 23.83" W

2. find location using: https://www.itilog.com/
Ashburn Golf Club Old Course, Highway 102, Halifax, NS B3N 2E9, Canada

3. Flag: cityfirstnamelastname
halifaxstevefinger

```

Flag: `halifaxstevefinger`


## Challenge 252: I love cat

Goal: sometimes, files are hidden. Use `cat -A` to print all

```
>>> https://ringzer0ctf.com/challenges/252

>>> ssh  cat@challenges.ringzer0team.com -p 10252
password: cat
>>> ls -la

>>> cat flag.txt 
**************************** WHERE IS THE FLAG ? ****************************


>>> cat -A flag.txt
or 
>>> . flag.txt

. flag.txt 
-rbash: $'FLAG-0K14eDrm4t5g7KD54X8Dl3NNcZ956oCK\r****************************': command not found

```

Flag: `FLAG-0K14eDrm4t5g7KD54X8Dl3NNcZ956oCK`


