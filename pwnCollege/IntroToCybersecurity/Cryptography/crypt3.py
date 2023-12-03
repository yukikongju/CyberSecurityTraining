import base64

def onetimepad_decrypt(ciphertext, key):
    # make sure that key is same length as ciphertext
    key = key[:len(ciphertext)]

    # decrypt using xor -- two methods are equivalent
    plaintext = bytes([c^k for c, k in zip(ciphertext, key)])
    #  plaintext = ''.join([chr(ord(chr(c))^ord(chr(k))) for c, k in zip(ciphertext, key)])
    return plaintext


if __name__ == "__main__":
    plaintext_b64 = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
    #  key_b64 = "XtO8gDyXuvZDEiafnK6jF3vTJko6fWdmB6t3OEW8zqhQgLujAeb18eS+FZniSIv3Qp49DzrpJPE1"
    ciphertext_b64 = "vsLbmmQsASKl6vPOhDj7TRytDZKT1cVzfvH0SlZDI9g/sujxEGZG8gRNoJQuNK6v4DPZdw46jXXC"
    secret_b64 = "pxMv3aHZBOha5DAvoO5RddxcAhlF6QvcQgcmQaeQHRP9o3gmMYuxtZKBhwH5J0VGxMEMae3as65S"

    # decode ciphertext and key 
    plaintext = base64.b64decode(plaintext_b64)
    ciphertext = base64.b64decode(ciphertext_b64)
    secret = base64.b64decode(secret_b64)

    # 1. Find secret key one time pad decryption: key=ciphertext^plaintext
    key = onetimepad_decrypt(ciphertext, plaintext)
    #  print(key)

    # 2. use key to decrypt secret message
    decipher = onetimepad_decrypt(secret, key)
    print(decipher.decode('utf-8'))

