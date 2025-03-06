#!/bin/bash
if [ $# -eq 1 ]
 then
 cat $1
else
 echo "has introducido más parametros o ningún parámetro"
fi

