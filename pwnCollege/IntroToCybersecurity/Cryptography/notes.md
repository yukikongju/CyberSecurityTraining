# Level 1 - Decode base64

```{sh}
> echo "cHduLmNvbGxlZ2V7WTdtS0xpRGYtYWVBN3JSdkxDSWM5OHV1TWY0LjAxTTNNek1zTVRPd0V6V30K" | base64 -d
```

# Level 2 - One-time pad encryption

We perform XOR

```{md}
key (b64): XtO8gDyXuvZDEiafnK6jF3vTJko6fWdmB6t3OEW8zqhQgLujAeb18eS+FZniSIv3Qp49DzrpJPE1
secret ciphertext (b64): LqTSrl/41pomdUPk0fHSSBbkZTl+FSsob9kaUxPw9vk+1NbzVr6R39T4W6qvMsaED8pyeH+Tc4w/
```

# Level 3 - One-time pad encryption; key used several times

The secret ciphertext is being given to us and we can input any plain text 
to get the ciphertext

# Level 4 - Advanced Encryption Standard (AES)

```{md}
In this challenge you will decrypt a secret encrypted with Advanced Encryption Standard (AES).
The Electronic Codebook (ECB) block cipher mode of operation is used.


key (b64): Jn7e5EYiSpQwqx1ewWWYhg==
secret ciphertext (b64): Y1v7NbFma0MmwElTwEOm6SKotPeC+W15s3/ZNd5eYCOv0iEcl8DmJ38NWWIzZu3qLvu0f9HAVeLASjlwPVOwuQ==
```

# Level 5 -  [ INC ]

- Use AES ECB multiple encryption to find the key
- Property: 

```{md}
In this challenge you will decrypt a secret encrypted with Advanced Encryption Standard (AES).
The Electronic Codebook (ECB) block cipher mode of operation is used.
You can encrypt arbitrary data, which has the secret appended to it, with the key being reused each time.

secret ciphertext (b64): avPjQDMdVL0/BjLUCnclaiu82p3NKWh6dgXE+wDrAhIhQw2P41NHqANNWyTwjVH33xMql6Ueb5PKKFjTrrG8Ww==
secret ciphertext (hex): 6af3e340331d54bd3f0632d40a77256a 2bbcda9dcd29687a7605c4fb00eb0212 21430d8fe35347a8034d5b24f08d51f7 df132a97a51e6f93ca2858d3aeb1bc5b 
```

# Level 6 - Dilfie-Hellman Key Exchange

- p: prime
- g: primitive root modulo
- a: Alice's private key; A: Alice's public key
- b: Bob's private key; B: Bob's public key

- private keys a and b are between [1 and p-1]
- public keys A and B are $A=g^a mod p$ and $B=g^b mod p$
- shared secret for Alice `s=B^a mod p`; for Bob: `s=A^b mod p`


Steps:


```{md}
p: 0xffffffffffffffffc90fdaa22168c234c4c6628b80dc1cd129024e088a67cc74020bbea63b139b22514a08798e3404ddef9519b3cd3a431b302b0a6df25f14374fe1356d6d51c245e485b576625e7ec6f44c42e9a637ed6b0bff5cb6f406b7edee386bfb5a899fa5ae9f24117c4b1fe649286651ece45b3dc2007cb8a163bf0598da48361c55d39a69163fa8fd24cf5f83655d23dca3ad961c62f356208552bb9ed529077096966d670c354e4abc9804f1746c08ca18217c32905e462e36ce3be39e772c180e86039b2783a2ec07a28fb5c55df06f4c52c9de2bcbf6955817183995497cea956ae515d2261898fa051015728e5a8aacaa68ffffffffffffffff
g: 0x2
A: 0x53ff9694dc1cf4ee45e05e0d5d75c8461117f23b64eb736aa63074b30d8f56045acc58bedd78dee446e8f5d6b804f0167bdc7768b8d6aad94d43b3ae0a05b6ef2c0896e871a5cee65e55672fc7851063b64d676da4d0c9866918356469cf6267d4a8a29c6db61bbd802b8741bd045c8add7de938cedae7724f8d23673510e0ea377baa24aad4747f8128c4b14ff34ca9f09f8ac9743cc85add27188919855ae3e4a96bafd335cd924575b2b6b88d7e18642a2a48d7aee94b844b5cc2f628e93fd7faef6e82b314aa2e7887580c07c897787961cb26bba3aa410b394bb6202cac218496ea28a271feced0dfaef156251c16e5296c015ddd3d8af54b5f3135e5d6

> 

```

