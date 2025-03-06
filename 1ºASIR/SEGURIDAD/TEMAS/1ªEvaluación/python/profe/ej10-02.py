#!/usr/bin/python
acceso=False
while not acceso:
 usuario=raw_input("Introduce el usuario: ")
 clave=raw_input("Introduce la clave: ")
 if usuario=="admin" and clave=="a1234":
  acceso=True
 else:
  print("Datos incorrectos")
print("Acceso concedido")

