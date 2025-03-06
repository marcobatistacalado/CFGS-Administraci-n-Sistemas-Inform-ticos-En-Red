#!/bin/bash
echo -n "Introduce un numero: "
read  num
result=$num
binario=""
if [ $num -eq 0 ]
 then
  echo "0"
else
 while [ $result -ne 1 ]
 do
  resto=`expr $result % 2`
  binario="$resto $binario" #cuidado con el orden
  result=`expr $result / 2`
 done
 binario="$result $binario"
 echo $binario
fi
