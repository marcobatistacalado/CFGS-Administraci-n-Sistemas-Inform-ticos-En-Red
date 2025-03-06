#!/usr/bin/python
linea=""
fichero=open("ej17.txt","w") #w-escritura, r-lectura
while linea!="END":
 linea=raw_input("Escribe una linea: ")
 if linea!="END":
  fichero.write(linea+"\n")
fichero.close()

