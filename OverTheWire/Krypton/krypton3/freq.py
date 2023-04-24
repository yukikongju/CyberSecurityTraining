#  https://www3.nd.edu/~busiforc/handouts/cryptography/Letter%20Frequencies.html

alphabet_dict1 = {
    'S'  : 'e' ,
    'Q'  : 't' ,
    'J'  : 'a' ,
    'N'  : 'o' ,
    'U'  : 'i' ,
    'B'  : 'n' ,
    'D'  : 's' ,
    'G'  : 'r' ,
    'C'  : 'h' ,
    'W'  : 'd' ,
    'Z'  : 'l' ,
    'V'  : 'u' ,
    'M'  : 'c' ,
    'T'  : 'm' ,
    'E'  : 'f' ,
    'X'  : 'y' ,
    'Y'  : 'w' ,
    'K'  : 'g' ,
    'L'  : 'p' ,
    'A'  : 'b' ,
    'I'  : 'v' ,
    'F'  : 'k' ,
    'O'  : 'x' ,
    'H'  : 'q' ,
    'R'  : 'j' ,
    'P'  : 'z' ,
}

alphabet_dict2 = {
    'A'  : 'E' ,
    'B'  : 'T' ,
    'C'  : 'A' ,
    'D'  : 'h' ,
    'E'  : 'I' ,
    'F'  : 'N' ,
    'G'  : 'S' ,
    'H'  : 'R' ,
    'I'  : 'H' ,
    'J'  : 't' ,
    'K'  : 'L' ,
    'L'  : 'U' ,
    'M'  : 'C' ,
    'N'  : 'r' , # n ou u
    'O'  : 'F' ,
    'P'  : 'Y' ,
    'Q'  : 'W' ,
    'R'  : 'G' ,
    'S'  : 'e' ,
    'T'  : 'B' ,
    'U'  : 'V' ,
    'V'  : 'K' ,
    'W'  : 'X' ,
    'X'  : 'Q' ,
    'Y'  : 'J' ,
    'Z'  : 'Z' ,
}


# JDS = the
# DSN = her




def n_grams(text, n):
    dict_count = {}
    num_patterns = 0
    for i in range(0, len(text)//n, n):
        pattern = text[i:i+n]
        if pattern in dict_count.keys():
            dict_count[pattern] += 1
        else:
            dict_count[pattern] = 1
            num_patterns += 1

    # sort 
    sorted_dict = sorted(dict_count.items(), key=lambda x: x[1], reverse=True)
    for key, value in sorted_dict[:15]:
        pattern = ''
        for symbol in key:
            pattern += alphabet_dict2.get(symbol)
        print(f"{key} {pattern} {value}")
        
    


def decrypt(text, alphabet_dict):
    decrypted = ""
    for symbol in text: 
        if symbol in alphabet_dict.keys():
            decrypted += (alphabet_dict.get(symbol))
        else: 
            decrypted += ' '
    print(decrypted)

def main():
    #  filename = "OverTheWire/Krypton/krypton3/found1"
    #  filename = "OverTheWire/Krypton/krypton3/found2"
    filename = "OverTheWire/Krypton/krypton3/foundcat"

    with open(filename) as f:
        output = f.readline().strip()

    text = output.replace(' ', '')
    print(n_grams(text, 3))
    decrypt(text, alphabet_dict2)




if __name__ == "__main__":
    main()

