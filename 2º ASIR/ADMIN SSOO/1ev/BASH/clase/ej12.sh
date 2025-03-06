#!/bin/bash
#situación inicial
flexiones=0
#bucle y condición de finalización
while [ $flexiones -lt 20 ]
do
 #acciones
 echo "Haciendo flexion..."
 sleep 0.5 #pausa
 #avance
 flexiones=`expr $flexiones + 1` 
done #cuando la condición es falsa salta aquí
