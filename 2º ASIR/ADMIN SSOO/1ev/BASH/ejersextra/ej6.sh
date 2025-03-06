#!/bin/bash
echo -n "Introduce tu nombre: "
read nom
sem=7
trab=0
extra=0
while [ $sem -gt 0 ]
do
 echo -n "Introduce horas trabajadas de lunes a domingo (dia por dia): "
 read hor
 if [ $hor -le 8 ]
  then
  trab=`expr $trab + $hor`
 else
  otr=`expr $hor - 8`
  extra=`expr $extra + $otr`
  trab=`expr $trab + 8`
 fi
 sem=`expr $sem - 1`
done
total=`expr $trab + $extra`
trab=`expr $trab \* 10`
extra=`expr $extra \* 15`
echo "Nombre: $nom"
echo "Paga horas trabajadas: $trab €"
echo "Paga horas extra: $extra €"
echo "Horas totales: $total"
