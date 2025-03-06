#!/usr/bin/python
import sys
print("Total parametros: "+str(len(sys.argv)))
print("Nombre del fichero Python: "+sys.argv[0])
if len(sys.argv)>1:
 for numero in range(1,len(sys.argv)):
  print("Parametro "+str(numero)+": "+sys.argv[numero])
else:
 print("No has escrito ningun parametro")
print("Version de Python: "+sys.version)

