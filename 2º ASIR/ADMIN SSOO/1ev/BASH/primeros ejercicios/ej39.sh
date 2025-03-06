#!/bin/bash
contador=1
while [ $contador -le 100 ]
do
 cuadrado=`expr $contador \* 2`
 echo "$contador = $cuadrado"
 contador=`expr $contador + 1`
done
