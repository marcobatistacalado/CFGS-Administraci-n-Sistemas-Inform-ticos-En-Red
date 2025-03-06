#!/usr/bin/python
#preguntar una password hasta que la acierte
password=raw_input ("Introduce una password:")
while password!="a1234":
	print("password incorrecta,vuelve a intentarlo")
	password=raw_input ("Introducir password:")
 
print("Password correcta")
