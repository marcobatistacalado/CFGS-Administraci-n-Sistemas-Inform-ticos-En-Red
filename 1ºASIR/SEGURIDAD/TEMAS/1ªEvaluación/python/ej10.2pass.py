#!/usr/bin/python
#preguntar un usuario y password hasta que acierte ambas
usuario=raw_input ("Usuario:")
password=raw_input ("Password:")

while usuario!="admin" or password!="a1234":
	print("datos incorrectos, vuelve a intentarlo")
	usuario=raw_input ("Usuario:")
	password=raw_input ("Password:")

print("correcta")
