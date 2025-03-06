#!/bin/bash
echo -n "Introduce una palabra: "
read palabra1
echo -n "Introduce otra palabra: "
read palabra2
if [ $palabra1 = $palabra2 ]
then
 echo "son iguales"
else
 echo "son distintas"
fi
