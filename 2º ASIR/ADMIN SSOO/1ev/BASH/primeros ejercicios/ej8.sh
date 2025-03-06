#!/bin/bash
echo -n "Introduce un numero: "
read num
if [ "$num % 2" -eq 0 ]
 then
  echo "el numero es par"
else
 echo "el numero es inpar"
fi
