#!/bin/bash
echo -n "Dime un número"
read num1
echo -n "Dime otro numero"
read num2
if [ $num1 -gt $num2 ]
 then
  echo "El $num1 es mayor"
 elif [ $num2 -gt $num1 ]
  then
  echo "El $num2 es mayor"
 elif [ $num1 -eq $num2 ]
  then 
 echo "Los numeros son iguales"
fi
