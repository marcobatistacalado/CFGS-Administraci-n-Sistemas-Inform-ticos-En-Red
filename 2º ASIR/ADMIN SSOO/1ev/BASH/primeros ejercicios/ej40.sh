#!/bin/bash
echo -n "Introduce un numero: "
read num1
echo -n "Introduce otro numero: "
read num2
echo -n  "Introduce la operación básica a realizar (+ suma, - resta, \* producto, / division): "
read oper
result=`expr $num1 "$oper" $num2`
echo "$result"
