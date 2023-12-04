from cryptography.hazmat.primitives.ciphers import Cipher, modes, algorithms
from cryptography.hazmat.backends import default_backend
import base64

def aes_ecb_decrypt(ciphertext, key):
    cipher = Cipher(algorithms.AES(key), modes.ECB(), backend=default_backend())
    decryptor = cipher.decryptor()
    data = decryptor.update(ciphertext) + decryptor.finalize()
    return data.decode('utf-8')
    

if __name__ == "__main__":
    #
    ciphertext_b64 = "Y1v7NbFma0MmwElTwEOm6SKotPeC+W15s3/ZNd5eYCOv0iEcl8DmJ38NWWIzZu3qLvu0f9HAVeLASjlwPVOwuQ=="
    key_b64 = "Jn7e5EYiSpQwqx1ewWWYhg=="

    #
    ciphertext = base64.b64decode(ciphertext_b64)
    key = base64.b64decode(key_b64)

    #
    decyphered_text = aes_ecb_decrypt(ciphertext, key)
    print(decyphered_text)



