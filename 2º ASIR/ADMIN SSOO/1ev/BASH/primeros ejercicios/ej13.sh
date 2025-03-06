#!/bin/bash
echo -n "Introduce un numero: "
read num1
contador=$num1
while [ $contador -gt 1 ]
do
 contador=`expr $contador - 1`
 num1=`expr $num1 \* $contador`
done
echo "$num1"
