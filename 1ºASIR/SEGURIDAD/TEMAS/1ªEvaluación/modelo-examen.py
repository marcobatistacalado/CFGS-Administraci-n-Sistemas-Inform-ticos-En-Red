#!/usr/bin/python
import os
import random
salida=""
consonantes="fghjkpqvwxz"
texto=raw_input("Introduce un texto o un fichero: ")
if os.path.exists(texto):
 fichero=open(texto,"r")
 texto=fichero.read()
 fichero.close()
for posicion in range(len(texto)):
 caracter=texto[posicion]
 if caracter==" " or caracter=="\n":
  salida=salida+caracter
 else:
  aleatorio=random.randrange(len(consonantes))
  salida=salida+caracter+consonantes[aleatorio]
print(salida)

