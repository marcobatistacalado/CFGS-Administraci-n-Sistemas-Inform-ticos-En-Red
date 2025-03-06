#!/usr/bin/python
nombre=raw_input("Dime un fichero con su ruta: ")
fichero=open(nombre,"r")
texto=fichero.read()
fichero.close()
print(texto)

