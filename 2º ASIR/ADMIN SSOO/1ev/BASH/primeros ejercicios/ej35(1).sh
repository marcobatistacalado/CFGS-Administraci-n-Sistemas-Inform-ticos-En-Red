#!/bin/bash
echo -n "Porcentaje de rojo:"
read rojo
echo -n "Porcentaje de verde:"
read verde
echo -n "Porcentaje de azul:"
read azul
rojo=`expr $rojo \* 255`
rojo=`expr $rojo / 100`
verde=`expr $verde \*255`
verde=`expr $verde / 100`
azul=`expr $azul \*255`
azul=`expr $azul / 100`
echo "$rojo $verde $azul"
