#!/bin/bash
echo "Dime tu nombre: "
read nombre
if [ $nombre = "usuario" ]
 then
  echo "Dime la contraseña: "
  read password
 if [ $password = "clave_secreta" ]
  then
   echo "acceso concedido"
 else
  echo "contraseña incorrecta"
  echo "acceso no concedido"
 fi
else
 echo "usuario incorrecto"
fi
