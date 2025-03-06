#!/bin/bash
echo -n "Introduce un fichero: "
read fich
echo -n "Introduce un numero: "
read num
if [ -e $fich ]
 then
  if [ -r $fich ]
   then
   compruebo=`cat $fich |  wc -l` # para que salga de forma numérica
   if [ $compruebo -gt $num ]
    then
     linea=`cat $fich | head -n $num | tail -n 1` #cabecera y cola
     echo "$linea"
   else
    echo "No  es mayor el fichero que el numero introducido"
   fi 
  else
   echo "No se puede leer"
  fi
else
 echo "El fichero no existe"
fi
