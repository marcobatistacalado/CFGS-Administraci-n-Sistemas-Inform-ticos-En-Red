#!/bin/bash
echo "Tienes 1000 monedas iniciales"
monedas=1000

while [ 0 -eq 0 ]
do
if [ $monedas -lt 20 ]
 then
 echo "TE HAS QUEDADO SIN MONEDAS BRO..."
 break
fi

echo -n "Si quieres apostar 20 monedas introduce la palabra apostar: "
read apostar
if [ $apostar = "apostar" ]
 then
 monedas=`expr $monedas - 20`
 dado1=`expr $RANDOM % 6 + 1`
 dado2=`expr $RANDOM % 6 + 1`
 dado3=`expr $RANDOM % 6 + 1` 
 echo "DADO1: $dado1"
 echo "DADO2: $dado2"
 echo "DADO3: $dado3"
 if [ $dado1 -eq $dado2 -a $dado2 -eq $dado3 ]
  then
  monedas=`expr $monedas + 500`
  echo "Has ganado 500 monedas porque los dados son iguales!!!"
 fi
 echo "Tienes un total de $monedas monedas."
else
 echo "joo, no has introducido la palabra apostar, yo quería que jugases"
 break
fi
done
