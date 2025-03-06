#!/bin/bash
echo -n "Introduce una palabra: "
read word
max=`expr length $word`
min=1
while [ $min -le $max ]
do
 mostrar=`expr substr "$word" 1 $min`
 echo "$mostrar"
 min=`expr $min + 1`
done
