#!/bin/bash
echo -n "Introduce un numero: "
read num
contador=$num
div=0
while [ $contador -ge 1 ]
do
 resto=`expr $num  %  $contador`
 contador=`expr $contador - 1`
 if [ $resto -eq 0 ]
 then
  div=`expr $div + 1`
 fi
done
if [ $div -gt 2 -o $num -eq 1 ]
 then
 echo "No es primo"
else
 echo "Es primo"
fi
