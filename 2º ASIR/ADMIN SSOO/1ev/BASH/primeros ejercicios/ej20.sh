#!/bin/bash
num=0
contador=0
suma=0
while [ $num -eq 0 ]
do
 echo "Introduce un numero: "
 read num2
 if [ $num2 -lt 0 ]
  then
  num=1
 else 
  suma=`expr $num2 + $suma`
  contador=`expr $contador + 1`
 fi
done
media=`expr $suma / $contador`
echo "$media"
