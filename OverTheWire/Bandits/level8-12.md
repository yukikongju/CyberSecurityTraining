# Bandits 


## What we learned

- The first few bytes of a hexdump file tell us what is the file signature 
  ie if it was generate with `xxd`, `gzip`, ...
- when we have a binary file, we can use `xxd` to check file signature. We can 
  then move the compressed file to its right format `.gz`, `.bz2`, `.tar` 
  and decompress it



### Level 7 -> Level 8

Goal: Use grep to find stuffs in file

```
>>> ssh bandit7@bandit.labs.overthewire.org -p 2220
>>> cat data.txt | grep millionth
millionth	TESKZC0XvTetK0S9xNwm25STk5iWrBvP

```

Flag: `TESKZC0XvTetK0S9xNwm25STk5iWrBvP`


### Level 8 -> Level 9


Goal: Using sort and uniq to find unique line

```
>>> ssh bandit8@bandit.labs.overthewire.org -p 2220
>>> cat data.txt | sort | uniq -c

10 dhoAlBlnhEz2xYyJdfI5ysm0JpyqDkQV
10 distOgdG7obAspnU4rE1HsWJ2upkf6BK
10 DItvEOrpT0pRGL1bFdRhoQkwX8SdlMYV
1 EN632PlfYiZbn3PhVK3XOGSlNInNE00t
10 Eor03gLDc3awKULF84XCnD8xgRg6X9S3
10 F5wqfqjZqVuufXkocZswBcRuVJfMZD0t

```

Flag: `EN632PlfYiZbn3PhVK3XOGSlNInNE00t`


### Level 9 -> Level 10

Goal: use the command `strings` to print printable character in file

```
>>> ssh bandit9@bandit.labs.overthewire.org -p 2220
>>> strings data.txt | grep ===

========== the
bu========== password
4iu========== is
b~==P
========== G7w8LIi6J3kTb8A7j9LgrywtEUlyyp6s

```

Flag: `G7w8LIi6J3kTb8A7j9LgrywtEUlyyp6s`


### Level 10 -> Level 11


Goal: decode string encoded in base64


```
>>> ssh bandit10@bandit.labs.overthewire.org -p 2220
>>> base64 -d data.txt


The password is 6zPeziLdR2RKNdNYFNb6nVCKzphlXHBM
```

Flag: `6zPeziLdR2RKNdNYFNb6nVCKzphlXHBM`


### Level 11 -> Level 12


Goal: use the command `tr` to rotate symbols


```
>>> ssh bandit11@bandit.labs.overthewire.org -p 2220
>>> cat data.txt | tr '[a-z]' '[n-za-m]' | tr '[A-Z]' '[N-ZA-M]'

The password is JVNBBFSmZwKKOP0XbFXOoW8chDz5yVRv


```

Flag: `JVNBBFSmZwKKOP0XbFXOoW8chDz5yVRv`


### Level 12 -> Level 13 (YESS!)


Goal: 

1. create temporary directory using `mktemp -d`
2. discover file signature by looking at first bytes of hexadecimal dump
3. Recursively decompress, check for signature and compress file 



```
1. copy hex_dump in dir
>>> ssh bandit12@bandit.labs.overthewire.org -p 2220
>>> cd /tmp/
>>> mktemp -d
>>> cd /tmp/tmp.x4HFKkrio5
>>> cp ~/data.txt hex_dump
>>> cat hex_dump

00000000: 1f8b 0808 7151 1063 0203 6461 7461 322e  ....qQ.c..data2.

1F 8B means that the hex_dump file was compressed with GZIP

2. reverse hex dump using xxd
>>> xxd -r hex_dump compressed_file.gz

3. decompress file using gzip
>>> gzip -d compressed_file.gz

4. Hex dump
>>> xxd compressed_file 

00000000: 425a 6839 3141 5926 5359 5ded 11a8 0000  BZh91AY&SY].....
42 5A 68 correspond to Bzip2

>>> xxd compressed_file 
>>> mv compressed_file compressed_file.bz2


5. decompress using bzip2
>>> bzip2 -d compressed_file.bz2

6. hex dump compressed file to check file signature
>>> xxd compressed_file
00000000: 1f8b 0808 7151 1063 0203 6461 7461 342e  ....qQ.c..data4.

>>> mv compressed_file compressed_file.gz
>>> gzip -d compressed_file.gz

7. hex dump
>>> xxd compressed_file

00000000: 6461 7461 352e 6269 6e00 0000 0000 0000  data5.bin.......
This looks like an archive file ie tar file

>> mv compressed_file compressed_file.tar
>> tar -xf compressed_file.tar

compressed_file.tar  data5.bin  hex_dump

8. dump data5.bin
>>> xxd data5.bin

00000000: 6461 7461 362e 6269 6e00 0000 0000 0000  data6.bin.......

>>> mv data5.bin data5.tar
>>> tar -xf data5.tar
compressed_file.tar  data5.tar  data6.bin  hex_dump 

>>> xxd data6.bin

00000000: 425a 6839 3141 5926 5359 25d3 6424 0000  BZh91AY&SY%.d$..

>>> mv data6.bin data6.bz2
>>> bzip2 -d data6.bz2

>>> xxd data6

00000000: 6461 7461 382e 6269 6e00 0000 0000 0000  data8.bin.......

>>> mv data6 data6.tar
>>> tar -xf data6.tar 
>>> xxd data8.bin

00000000: 1f8b 0808 7151 1063 0203 6461 7461 392e  ....qQ.c..data9.

>>> mv data8.bin data8.gz
>>> gzip -d data8.gz 
>>> cat data8 
The password is wbWdlBxEir4CaE8LaPhauuOo6pwRmrDw

```

