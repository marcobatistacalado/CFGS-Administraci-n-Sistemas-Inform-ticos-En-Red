#!/bin/bash
hora=0
texto=""
tiempo=`uptime -p`
hora=`expr substr "$tiempo" 4 2`
texto=`expr substr "$tiempo" 6 4`
while [ 1 = 1 ]
do
if [ $texto = "hour" ]
 then
  if [ $hora -ge 1 ]
   then
    echo "se va a apagar"
    `shutdown -h 1`
  else
    echo "no se va a pagar"
  fi
else
 echo "no lleva ni una hora encendido"
fi
done
