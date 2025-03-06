#!/bin/bash
while [ 0 -eq 0 ]
do
echo "MENU:"
echo "1 - Mostrar usuarios"
echo "2 - Mostrar lineas de todos los ficheros .sh"
echo "3 - Ver procesos de usuario"
echo "4 - Salir"
echo -n "Introduce uno de los numeros del menú: "
read opt

case $opt in
1)echo "ESTOS SON LOS USUARIOS: " `ls /home`;;
2)echo -n "Introduce nombre de un usuario: "
read usu
for i in `ls /home/$usu | grep -e ".sh"`
do
lineas=`cat /home/$usu/$i | wc -l`
echo "NOMBRE FICHERO: $i Y EL NUMERO DE LINEAS ES: $lineas"
done
;;
3)echo -n "Introduce nombre de un usuario: "
read usu
echo "ESTOS SON LOS PROCESOS DE $usu"
echo ""
ps -u "$usu"
;;
4)exit;;
esac
done
