import socket
import select
from _thread import *
 
server = socket.socket()
server.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
 
IP_address = "127.0.0.1"

Port = 9000

server.bind((IP_address, Port))
 
server.listen(2)
 
list_of_clients = []
 
def clientthread(conn, name):
    welcome = "Welcome to this chatroom!"
    conn.send(welcome.encode())
 
    while True:
            try:
                message = conn.recv(2048).decode()
                if message:
                    print ("<" + name + "> " + message)
                    message_to_send = "<" + name + "> " + message
                    for x in list_of_clients:
                    	if x != conn:
                    		broadcast(message_to_send, x)
 
                else:
                    remove(conn)
 
            except:
                continue
 
def broadcast(message, connection):
    for clients in list_of_clients:
        if clients==connection:
            try:
                clients.send(message.encode())
            except:
                clients.close()
                remove(clients)
 
def remove(connection):    	
    if connection in list_of_clients:
        list_of_clients.remove(connection)
 
while True:
    conn, addr = server.accept()
    name_to_add=conn.recv(2048).decode()
    list_of_clients.append(conn)
    print (name_to_add + " connected")
    start_new_thread(clientthread,(conn,name_to_add))    
 
conn.close()
server.close()
