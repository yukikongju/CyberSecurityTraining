import base64

def onetimepad_decrypt(ciphertext, key):
    # make sure that key is same length as ciphertext
    key = key[:len(ciphertext)]

    # decrypt using xor -- two methods are equivalent
    #  plaintext = bytes([c^k for c, k in zip(ciphertext, key)])
    plaintext = ''.join([chr(ord(chr(c))^ord(chr(k))) for c, k in zip(ciphertext, key)])
    return plaintext


if __name__ == "__main__":
    key_b64 = "XtO8gDyXuvZDEiafnK6jF3vTJko6fWdmB6t3OEW8zqhQgLujAeb18eS+FZniSIv3Qp49DzrpJPE1"
    ciphertext_b64 = "LqTSrl/41pomdUPk0fHSSBbkZTl+FSsob9kaUxPw9vk+1NbzVr6R39T4W6qvMsaED8pyeH+Tc4w/"

    # decode ciphertext and key 
    key = base64.b64decode(key_b64)
    ciphertext = base64.b64decode(ciphertext_b64)
    plaintext = onetimepad_decrypt(ciphertext, key)
    print(plaintext)

