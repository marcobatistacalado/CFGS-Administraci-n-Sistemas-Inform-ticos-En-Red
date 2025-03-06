#!/bin/bash
echo -n "Introduce un año: "
read ano
bisiesto=`cal febrero $ano | grep "29"`
if [ -z "$bisiesto" ]
then
 echo "no es bisiesto"
else
 echo "es bisiesto"
fi

