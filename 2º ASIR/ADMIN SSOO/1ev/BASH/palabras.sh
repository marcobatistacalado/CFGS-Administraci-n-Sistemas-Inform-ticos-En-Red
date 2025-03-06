#!/bin/bash
clear
echo "Instrucciones:"
echo "Se muestra un listado de palabras, la que elijas se creara como fichero en el directorio palabras."
echo "Escribe fin o Fin para terminar."
if [ ! -d "palabras" ]
then
 mkdir palabras
 echo "Directorio palabras creado"
 fecha=`date`
 echo "$fecha: directorio palabras no existe" >> errores.log
else
 echo "Comprobado que el directorio palabras existe"
fi
palabra=""
while [ "$palabra" != "fin" -a "$palabra" != "Fin" ]
do
 echo "== Fichero de palabras =="
 cat palabras.txt
 echo -n "Dime una palabra: "
 read palabra
 resultado=`cat palabras.txt | grep -e "$palabra"`
 if [ -n "$resultado" ]
 then
  fichero="palabras/$palabra"
  if [ -e "$fichero" ]
  then
   echo "Esa palabra ya se habia introducido"
   fecha=`date`
   echo "$fecha: el fichero $fichero ya existe" >> errores.log
  else
   touch "$fichero"
   echo "Creado $fichero"
  fi
 elif [ "$palabra" = "fin" -o "$palabra" = "Fin" ]
 then
  echo "Has decidido terminar"
 else
  echo "Esa palabra no esta en el fichero"
  fecha=`date`
  echo "$fecha: $palabra no existe" >> errores.log
 fi
done
echo "== Errores =="
cat errores.log
echo "== Directorio palabras =="
ls palabras
