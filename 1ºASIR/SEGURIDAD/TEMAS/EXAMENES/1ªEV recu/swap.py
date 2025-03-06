#!/usr/bin/python
alfabeto="abcdefghijklmnopqrstuvwxyz"
frase=raw_input("Introduce la frase a codificar: ").lower()
codificada=""
anotar=False
for posicion in range(len(frase)):
 caracter=frase[posicion]
 if alfabeto.find(caracter)>=0:
  if anotar==True:
   second=caracter
   codificada=codificada+second+first
   anotar=False
  else:
   first=caracter
   anotar=True
 else:
  codificada=codificada+caracter
if anotar==True:
 codificada=codificada+first
print("")
print("Frase original: "+frase)
print("Frase codificada: "+codificada)

