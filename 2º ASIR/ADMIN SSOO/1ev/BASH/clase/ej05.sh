#!/bin/bash
echo -n "Eres rubio (si/no)?"
read respuesta
if test $respuesta = "si"
then
 echo "Accion A"
else
 echo "Respuesta falsa"
 echo "Accion B"
fi
