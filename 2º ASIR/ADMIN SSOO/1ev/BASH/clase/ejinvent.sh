#!/bin/bash
echo -n "Adivina un numero: "
read numero
if [ "$numero" = "7" ] 
 then
 echo -n "adivina una letra: "
 read letra
 if [ "$letra" = "B" ] 
 then
 echo "reto conseguido"
 else
 echo "reto no conseguido"
 fi
else
 echo  "numero incorrecto"
fi
