#!/bin/bash
echo -n "Introduce una frase: "
read frase
contador=1
max=`echo $frase | wc -w`
while [ $contador -le $max ]
do
palabra=`echo $frase | cut -d " " -f $contador`
echo "$palabra"
contador=`expr $contador + 1`
done
