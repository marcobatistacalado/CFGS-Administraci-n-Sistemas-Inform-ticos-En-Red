#!/bin/bash
echo -n "¿Cuantas horas has trabajado? "
read horas
if [ $horas -lt 40 ]
 then
 salario=`expr $horas \* 10`
 echo "El salario que te corresponde es: $salario"
else
 extras=`expr $horas - 40`
 pago2=`expr $extras \* 15`
 pago1=`expr 40 \* 10`
 salario=`expr $pago1 + $pago2`
 echo "El salario que te corresponde es: $salario"
fi 

