#!/usr/bin/python
import random
alfabeto=["A","$","K","4","M","-","9","T","3","Z"]
palabra=raw_input("Escribe una palabra: ")
cifrado=""
for posicion in range(len(palabra)):
 caracter=palabra[posicion]
 if caracter!=" ":
  cifrado=cifrado+alfabeto[random.randrange(len(alfabeto))]
 else:
  cifrado=cifrado+"_"
print(cifrado)

