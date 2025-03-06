#!/bin/bash
echo -n "Dime un palabra: "
read palabra
longitud=`expr length "$palabra"`
posicion=1
while [ $posicion -le $longitud ]
do
 letra=`expr substr "$palabra" $posicion 1`
 echo "$letra"
 sleep 1
 posicion=`expr $posicion + 1`
done
