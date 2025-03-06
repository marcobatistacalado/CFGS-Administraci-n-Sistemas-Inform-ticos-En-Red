#!/bin/bash
num1=0
num2=1
contador=20

while [ $contador -ne 0 ]
do
 echo  "$num1"
 serie=`expr $num1 + $num2`
 num1=$num2
 num2=$serie
 contador=`expr $contador - 1` 
done
