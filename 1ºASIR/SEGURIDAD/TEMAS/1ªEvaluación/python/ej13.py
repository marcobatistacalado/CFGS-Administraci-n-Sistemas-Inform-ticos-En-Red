#!/usr/bin/python
frase=raw_input("Dime una frase: ")
print("Minusculas: "+frase.lower())
print("Mayusculas: "+frase.upper())
print("Cambiando la 'a' por la 'e': "+frase.replace("a","e"))
print("Posicion de la 'o': "+str(frase.find("o"))) #index
print("Posicion de la 'z': "+str(frase.find("z"))) #index
print("Longitud de la frase: "+str(len(frase)))

