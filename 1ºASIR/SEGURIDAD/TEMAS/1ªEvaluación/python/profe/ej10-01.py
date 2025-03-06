#!/usr/bin/python
acertado="no"
while acertado!="si":
 password=raw_input("Introduce la password de administrador: ")
 if password=="a1234":
  print("Acceso concedido")
  acertado="si"
 else:
  print("Fallo, intenta otra vez")

