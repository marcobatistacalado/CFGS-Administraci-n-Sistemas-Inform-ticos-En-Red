#!/bin/bash
echo -n "Introduce el numero 1: "
read num1
echo -n "Introduce el numero 2: "
read num2
echo -n "Introduce el numero 3: "
read num3
if [ $num1 -gt $num2 ]
 then
  if [ $num1 -gt $num3 ]
   then
    echo "El numero mayor es $num1"
    if [ $num2 -gt $num3 ]
     then
      echo "El numero mediano es $num2"
      echo "El numero menor es $num3"
    else 
     echo "El numero mediano es $num3"
     echo "El numero menor es $num2"
    fi
  else
  echo "El numero mayor es $num3"
  echo  "El numero mediano es $num1"
  echo  "El numero pequeño es $num2"
  fi
else
 if [ $num2 -gt $num3 ]
  then
   echo "El numero mayor es $num2"
   if [ $num3 -gt $num1 ]
    then
     echo "El numero mediano es $num3"
     echo "El numero pequeño es $num1"
   else
    echo "El numero mediano es $num1"
    echo "El numero pequeño es $num3"
   fi
 else
  echo "El numero mayor es  $num3"
  echo "El numero mediano es $num2"
  echo "El numero pequeño es $num1"
 fi
fi

