#!/bin/bash
echo "Introduce tu nota1: "
read nota1
echo "Introduce tu nota2: "
read nota2
echo "Introduce tu nota3: "
read nota3
let media=(nota1+nota2+nota3)/3
if [ $media -lt 5 ]
 then
 echo "Suspenso"
fi
if [ $media -ge 5 -a $media -lt 6 ]
 then
 echo "Aprobado"
fi
if [ $media -ge 6 -a $media -lt 7 ]
 then
 echo "Bien"
fi
if [ $media -ge 7 -a $media -lt 9 ]
 then
 echo "Notable"
fi
if [ $media -ge 9 -a $media -le 10 ]
 then
 echo "Sobresaliente"
fi
