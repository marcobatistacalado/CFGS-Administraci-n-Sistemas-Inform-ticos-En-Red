#!/usr/bin/python

#Comparaciones
# igual		==
# distinto	!=
# mayor		>
# mayor o igual	>=
# menor		<
# menor o igual <=

usuario=raw_input("Login: ")
clave=raw_input("Password: ")
if usuario=="admin" or clave=="a1234":
	print("Acceso denegado")
else:
	print("Acceso permitido")

# and, or, not

