#!/bin/bash
if [ $# -eq 1 ]
 then
 if [ -e $1 ]
 then
 cat $1
 else
 echo "no existe el fichero"
 fi
else
 echo "has introducido más parametros o ningún parámetro"
fi


