import socket 

target_host = "www.google.com"
target_port = 80
request = b"GET / HTTP/1.1\r\nHost: google.com\r\n\r\n"

client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
client.connect((target_host, target_port))
client.send(request)

response = client.recv(4096)
client.close()

print(response)
print(response.decode())


