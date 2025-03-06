#!/bin/bash
echo -n "Introduce un numero: "
read num
exp=10
mostrar=0
potencia=1
while [ $exp -ne 0 ]
do
 potencia=`expr $potencia  \* $num`
 echo "$potencia"
 exp=`expr $exp - 1`
done

