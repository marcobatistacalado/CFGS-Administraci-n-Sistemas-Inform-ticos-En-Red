#!/bin/bash
echo "Introduce un numero: "
read num
echo "Introduce exponente: "
read exponente
potencia=1

while [ $exponente -gt 0 ]
do
 potencia=`expr $potencia \* $num`
 exponente=`expr $exponente - 1`
done
echo "$potencia"

