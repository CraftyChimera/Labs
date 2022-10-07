import socket
import select
import sys

server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
IP_address = "127.0.0.1"
Port = 9000
server.connect((IP_address, Port))
name=input("Enter name")
server.send(name.encode())

while True:
	sockets_list = [sys.stdin, server]
	read_sockets,write_socket, error_socket = select.select(sockets_list,[],[])

	for socks in read_sockets:
		if socks == server:
			message = socks.recv(2048).decode()
			print (message)
		else:
			message = sys.stdin.readline()
			server.send(message.encode())
			print(f"<You>{message}")
server.close()

