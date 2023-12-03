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



