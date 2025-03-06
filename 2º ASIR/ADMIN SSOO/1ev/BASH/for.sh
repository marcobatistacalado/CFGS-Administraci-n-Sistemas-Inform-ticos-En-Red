#!/bin/bash
echo "Opcion 1" #valores directamente
for variable in 1 2 3 4
do
 echo "$variable"
done

echo "Opcion 2" #ejecucion de un comando
#seq 1 4
for variable in `seq 1 4`
do
 echo "$variable"
done

echo "Opcion 3" #variable con varios valores
numeros=`seq 1 4`
for variable in $numeros
do
 echo "$variable"
done

echo "Opcion 4" #otros comandos
for variable in `ls /home`
do
 echo "$variable"
done

echo "Listado de un directorio con While"
ls /home > listado.temp
numero=`cat listado.temp | wc -l`
contador=1
while [ $contador -le $numero ]
do
 fichero=`cat listado.temp | head -$contador | tail -1`
 echo "$contador: $fichero"
 contador=`expr $contador + 1`
done
rm listado.temp

echo "Probar FOR con otros comandos: ej. users, groups, ps, etc..."
