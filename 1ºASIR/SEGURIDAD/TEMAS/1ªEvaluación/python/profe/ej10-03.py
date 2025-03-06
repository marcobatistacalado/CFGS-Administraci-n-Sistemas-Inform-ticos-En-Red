#!/usr/bin/python
acceso=False
intentos=3
while not acceso and intentos>0:
 usuario=raw_input("Introduzca usuario: ")
 clave=raw_input("Introduzca clave: ")
 intentos=intentos-1
 if usuario=="admin" and clave=="a1234":
  acceso=True
  print("Acceso concedido")
 else:
  print("Acceso denegado")
  print("Te quedan "+str(intentos)+" intentos")

