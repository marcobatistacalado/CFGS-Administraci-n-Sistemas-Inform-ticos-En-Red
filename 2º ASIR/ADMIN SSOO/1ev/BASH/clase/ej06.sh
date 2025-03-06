#!/bin/bash
echo -n "Usuario: "
read usuario
#if test "$usuario" = "administrador"
if [ "$usuario" = "administrador" ]
then

 echo -n "Clave: "
 read clave
 if [ "$clave" = "a1234567" ]
 then
  echo "Acceso concedido"
 else
  echo "Clave incorrecta"
 fi

else
 echo "Usuario incorrecto"
fi
