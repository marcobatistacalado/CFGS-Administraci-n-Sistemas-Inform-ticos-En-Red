#!/bin/bash
echo -n "Introduce un numero: "
read num
contador=$num
while [ $contador -gt 1 ]
do
 contador=`expr $contador - 1`
 resto=`expr $num  %  $contador`
 if [ $resto -eq 0 ]
 then
  echo "Numero divisible: $contador"
 fi
done
