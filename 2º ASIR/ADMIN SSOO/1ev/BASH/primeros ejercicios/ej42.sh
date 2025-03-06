#!/bin/bash
echo -n "Introduce 1 si quieres borrar un archivo y cualquier otro numero para recuperar un archivo: "
read elec
if [ $elec -eq 1 ]
then
 echo "Introduce el archivo (ruta) a borrar"
 read arch
 mv $arch /home/administrador/Escritorio/.papelera
 echo "archivo movido a la papelera"
else
 ls /home/administrador/Escritorio/.papelera
 echo "Elige el archivo que quieres recuperar de la papelera: "
 read arch2
 echo "En que directorio quieres que se recupere el $arch2: "
 read  recu
 mv /home/administrador/Escritorio/.papelera/$arch2 $recu
 echo "el archivo ha sido recuperado"
fi
