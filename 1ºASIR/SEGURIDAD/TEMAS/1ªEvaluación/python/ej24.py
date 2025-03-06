#!/usr/bin/python
import os
os.system("clear")
nombre=raw_input("Dime un fichero: ")
fid1=open(nombre,"r")
fid2=open(nombre+".crypt","w")
alfabeto=["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
sustituto=["e","d","f","g","i","h","j","k","o","l","m","n","p","q","u","r","s","t","v","w","a","x","y","z","b","c"]
salida=""
for linea in fid1:
 for posicion in range(len(linea)):
  caracter=linea[posicion]
  if caracter in alfabeto:
   lugar=alfabeto.index(caracter)
   salida=salida+sustituto[lugar]
  else:
   salida=salida+caracter
fid2.write(salida)
fid1.close()
fid2.close()
print("Fichero "+nombre+".crypt generado")

