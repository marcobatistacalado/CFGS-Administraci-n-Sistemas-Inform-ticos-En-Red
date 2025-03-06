#!/bin/bash

hexadecimal() {
 case $1 in
  10) echo "A" ;;
  11) echo "B" ;;
  12) echo "C" ;;
  13) echo "D" ;;
  14) echo "E" ;;
  15) echo "F" ;;
   *) echo "$1" ;;
 esac
}

echo -n "Introduce el porcentaje de rojo: "
read rojo
echo -n "Introduce el porcentaje de verde: "
read verde
echo -n "Introduce el porcentaje de azul: "
read azul

rojo=`expr $rojo \* 255 / 100`
verde=`expr $verde \* 255 / 100`
azul=`expr $azul \* 255 / 100`

r1=`expr $rojo / 16`
r2=`expr $rojo % 16`
v1=`expr $verde / 16`
v2=`expr $verde % 16`
a1=`expr $azul / 16`
a2=`expr $azul % 16`

r1=$(hexadecimal $r1)
r2=$(hexadecimal $r2)
v1=$(hexadecimal $v1)
v2=$(hexadecimal $v2)
a1=$(hexadecimal $a1)
a2=$(hexadecimal $a2)

#case $r1 in
# 10) r1="A" ;;
# 11) r1="B" ;;
# 12) r1="C" ;;
# 13) r1="D" ;;
# 14) r1="E" ;;
# 15) r1="F" ;;
#esac

color="$r1$r2$v1$v2$a1$a2"

echo "Color Hexadecimal: $color"
