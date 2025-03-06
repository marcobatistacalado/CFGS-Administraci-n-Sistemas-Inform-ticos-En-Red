#!/usr/bin/python
palabra=raw_input("Escribe una palabra: ")
for posicion in range(len(palabra)):
 caracter=palabra[posicion]
 print(str(posicion)+": "+caracter)

