#!/bin/bash
echo "a continuación vas a ver la tabla del 2:"
num1=1
num2=2
while [ $num1 -le 10 ]
do
 producto=`expr $num1 \* $num2`
 echo "$num1 x $num2 es igual $producto"
 num1=`expr $num1 + 1`
done
