# How to - Use John the Ripper to get password from hash 

## What To Know

- `john the ripper` is an open-source tool that brute force hash from password 
  by comparing the hash of a password with a bunch of password list
- we can get the password list at [SecLists](https://github.com/danielmiessler/SecLists)
- To find which hash function was used to generate the hash we get, we can 
  use `hashid` ([here](https://github.com/psypanda/hashID))

## Walkthrough

**Useful Commands**

- [X] where is `rockyou.txt` located: `locate rockyou.txt`



Let's say we stumble across a hash `$P$8ohUJ.1sdFw09/bMaAQPTGDNi2BIUt1`. How 
can we find the password generated from this hash?

```
%% 1. Find which function was used to generate this hash using 'hashid' to know 
%%    which format we need to use when using 'john'

$ echo "$P$8ohUJ.1sdFw09/bMaAQPTGDNi2BIUt1" > tmp.txt
$ hashid --john tmp.txt 
--File 'tmp.txt'--
Analyzing '$P$8ohUJ.1sdFw09/bMaAQPTGDNi2BIUt1'
[+] Wordpress ≥ v2.6.2 [JtR Format: phpass]
[+] Joomla ≥ v2.5.18 [JtR Format: phpass]
[+] PHPass' Portable Hash [JtR Format: phpass]

2. Use john to get the password


```


## Ressources

- [X] [Jack The Ripper - Supported Hash Format](https://pentestmonkey.net/cheat-sheet/john-the-ripper-hash-formats)
- [X] [Stack Exchange Example](https://security.stackexchange.com/questions/232139/john-format-md5-caused-unknown-ciphertext-format-name-requested-error)
- [X] [Generating Hash from password](https://www.browserling.com/tools/all-hashes)
- [X] [John FAQ](https://www.openwall.com/john/doc/FAQ.shtml)


