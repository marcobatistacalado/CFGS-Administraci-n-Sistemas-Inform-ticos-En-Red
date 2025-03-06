#!/usr/bin/python
nombre=raw_input("Dime un fichero con su ruta: ")
fichero=open(nombre,"r")
contador=1
for linea in fichero:
 print(str(contador)+": "+linea.rstrip())
 contador=contador+1
fichero.close()

