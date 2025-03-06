#!/bin/bash
echo -n "Dime tu edad: "
read edad
if [ $edad -ge 18 ] #[ $edad > 18 ] el mayor lo va entender como que lo escribe en un fichero

then
 echo "Eres mayor de edad"
 if [ $edad -eq 18 ]
 then
  echo "Justo tienes 18"
 fi
else
 echo "Aun no puedes votar"
fi

