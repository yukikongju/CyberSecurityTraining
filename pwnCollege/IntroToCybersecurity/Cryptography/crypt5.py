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
    ciphertext_b64 = "avPjQDMdVL0/BjLUCnclaiu82p3NKWh6dgXE+wDrAhIhQw2P41NHqANNWyTwjVH33xMql6Ueb5PKKFjTrrG8Ww=="
    ciphertext_hex = "6af3e340331d54bd3f0632d40a77256a 2bbcda9dcd29687a7605c4fb00eb0212 21430d8fe35347a8034d5b24f08d51f7 df132a97a51e6f93ca2858d3aeb1bc5b "

    #
    decyphertext_b64 = base64.b64decode(ciphertext_b64)
    decyphertext_hex = base64.b64decode(ciphertext_hex)

    #
    #  key = aes_ecb_decrypt(decyphertext_b64, decyphertext_hex)
    #  plaintext = aes_ecb_decrypt(decyphertext_b64, key)
    #  print(plaintext)




