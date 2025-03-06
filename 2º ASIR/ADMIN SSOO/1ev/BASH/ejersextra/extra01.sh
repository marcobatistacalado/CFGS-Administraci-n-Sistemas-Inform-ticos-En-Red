#!/bin/bash
usu=`whoami`
echo -n "Introduce un número de asignaturas: "
read num1
suma=0
num2=$num1
while [ $num1 -gt 0 ]
do
 echo -n "Introduce una nota: "
 read nota
 suma=`expr $suma + $nota`
 num1=`expr $num1 - 1`
done
 media=`expr $suma / $num2`
 echo "Media del usuario $usu : $media"

 if [ $media -lt 5 ]
  then
  echo "Resultado: suspenso"
 fi
 if [ $media -eq 5 ]
  then
  echo "Resultado: suficiente"
 fi
 if [ $media -eq 6 ]
  then
  echo "Resultado: bien"
 fi
 if [ $media -eq 7 -o $media -eq 8 ]
  then
  echo "Resultado: notable"
 fi
 if [ $media -gt 8 ]
  then
  echo "Resultado: sobresaliente"
 fi

