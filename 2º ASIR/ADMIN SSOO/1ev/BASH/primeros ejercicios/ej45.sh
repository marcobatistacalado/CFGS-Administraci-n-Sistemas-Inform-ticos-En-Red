#!/bin/bash
echo -n "Introduce una frase: "
read frase
contador=1
max=`echo $frase | wc -c`
while [ $contador -le $max ]
do
palabra=`expr substr "$frase" $contador 1`
echo "$palabra"
contador=`expr $contador + 1`
done
