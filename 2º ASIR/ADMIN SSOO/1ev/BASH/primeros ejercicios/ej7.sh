#!/bin/bash
echo -n "introduce un numero: "
read num
if [ $num -eq 0 ]
 then
  echo "el numero no es ni positivo ni negativo"
else
 if [ $num -ge 0 ]
  then
   echo "el numero es positivo"
 else
  echo "el numero es negativo"
 fi
fi
