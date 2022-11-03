## Krypton - What we learned


### Level 0 -> Level 1

Goal: decode using `base64`

```
>>> echo "S1JZUFRPTklTR1JFQVQ=" | base64 -d
KRYPTONISGREAT

>>> ssh krypton1@krypton.labs.overthewire.org -p 2231

```

Flag: `KRYPTONISGREAT`


### Level 1 -> Level 2

Goal: Perform simple rotation cipher

```
>>> ssh krypton1@krypton.labs.overthewire.org -p 2231
>>> cat krypton2
YRIRY GJB CNFFJBEQ EBGGRA
>>> cat krypton2 | tr '[A-Z]' '[N-ZA-M]'
LEVEL TWO PASSWORD ROTTEN
```

Flag: `ROTTEN`

%% ---------------------------------------------

### Level 2 -> Level 3


Goal: Discover key for Ceasar Cipher

```
>>> ssh krypton2@krypton.labs.overthewire.org -p 2231

1. Discover Key by executing binary
>>> mktemp -d
>>> cd /tmp/tmp.rJ7aezVuST
>>> echo "AAA" | discover.txt
>>> /krypton/krypton2/encrypt discover.txt
MMM

We know that all As are shifted to M

2. Convert encrypted text

>>> cat krypton3
OMQEMDUEQMEK
>>> cat /krypton/krypton2/krypton3 | tr '[M-ZA-L]' '[A-MN-Z]'
CAESARISEASY

```

Flag: `CAESARISEASY`

%% ---------------------------------------------

### Level 3 -> Level 4 (SKIPPED!)


Goal: Find the key using frequency analysis

```
>>> ssh krypton3@krypton.labs.overthewire.org -p 2231

```

Flag: ``

%% ---------------------------------------------

### Level 4 -> Level 5


Goal: 

```
>>> ssh krypton4@krypton.labs.overthewire.org -p 2231

```

Flag: ``


%% ---------------------------------------------

### Level 5 -> Level 6


Goal: 

```
>>> ssh krypton5@krypton.labs.overthewire.org -p 2231

```

Flag: ``



%% ---------------------------------------------

### Level 6 -> Level 7


Goal: 

```
>>> ssh krypton6@krypton.labs.overthewire.org -p 2231

```

Flag: ``





