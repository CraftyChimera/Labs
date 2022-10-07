import socket
ip = "127.0.0.1"
  
for port in range(65535):
    try:
        serv = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
        serv.bind((ip,port))
         
    except:
        print('[OPEN] Port open :',port)
        
    serv.close()
