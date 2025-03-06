#!/bin/bash
echo -n "Introduce un numero: "
read num
contador=$num
div=0
while [ $contador -gt 1 ]
do
 contador=`expr $contador - 1`
 resto=`expr $num  %  $contador`
 if [ $resto -eq 0 ]
 then
  div=`expr $div + $contador`
 fi
done
if [ $div -eq $num ]
 then
 echo "El numero es perfecto"
else
 echo "El numero no es perfecto"
fi
