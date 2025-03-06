#!/bin/bash
usuario=`whoami`
grupos=`groups $usuario | cut -d ":" -f 2` #para filtrar solo esa parte
for item in $grupos #puede tener muchos elementos esta variable
do
 echo "$usuario pertenece a $item"
done
