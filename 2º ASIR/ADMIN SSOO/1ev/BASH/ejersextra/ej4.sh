#!/bin/bash
echo "MENUU"
echo "Opción 1: Autor"
echo "Opción 2: Cancion"
echo "Opción 3: Buscar"
echo "Opción 4: Salir"
echo -n "Selecciona una opción introduciendo el número correspondiente:"
read opt
while [ $opt != "4" ]
do
if [ $opt = "1" ]
 then
 echo "Los autores son: "
 cat /home/administrador/Escritorio/BASH/canciones.txt | cut -d ";" -f "1"
fi
if [ $opt = "2" ]
 then
 echo "Las canciones son: "
 cat /home/administrador/Escritorio/BASH/canciones.txt | cut -d ";" -f "2"
fi
if [ $opt = "3" ]
 then
 echo -n "Selecciona autor introduciendo el numero 1 y cancion introduciendo el numero 2: "
 read num
 if [ $num = "1" ]
  then
  echo -n "Introduce el nombre del autor en minus: "
  read autor
  echo "Estas son sus canciones: "
  cat /home/administrador/Escritorio/BASH/canciones.txt | grep -e "$autor" | cut -d ";" -f "2"
 else
  echo -n "Introduce la cancion en minus: "
  read canc
  echo "Este es el autor: "
  cat /home/administrador/Escritorio/BASH/canciones.txt | grep -e "$canc" | cut -d ";" -f "1"
 fi
fi
 echo ""
 echo -n "Introduce otra vez una de las opciones del menú: "
 read opt2
 opt=$opt2
done
