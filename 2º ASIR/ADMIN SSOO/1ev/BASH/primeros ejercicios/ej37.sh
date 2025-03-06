#!/bin/bash
echo -n "introduce el nombre de un archivo: "
read arch1
echo -n "introduce el nombre de un archivo: "
read arch2

tam1=`du -b $arch1 | cut -f 1`
tam2=`du -b $arch2 | cut -f 1`

if [ $tam1 -gt $tam2 ]
then
 echo "El fichero 1 es mayor"
else
 if [ $tam2 -gt $tam1 ]
  then
  echo "El fichero 2 es mayor"
 else
  if [ $tam1 -eq $tam2 ]
   then
   echo "son iguales"
  fi
 fi
fi
