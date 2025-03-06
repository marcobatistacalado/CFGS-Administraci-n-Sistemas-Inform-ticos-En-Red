#!/bin/bash
echo -n "Introduce una frase: "
read frase
echo -n "Introduce un parametro para sustituir en la frase: "
read parametro
resul=`echo $frase | tr [aeiou] "$parametro"`
echo $resul
