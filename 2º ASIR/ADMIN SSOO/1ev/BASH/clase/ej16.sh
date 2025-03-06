#!/bin/bash
for numero in seq 0 0.5 3 #lo entiende como un elemento
do
 echo "$numero"
done

echo ""

for numero in `seq 0 0.5 3` #por eso es importante comillas invertidas 
do
 sleep $numero #problema que la salida del seq es con coma por teclado español
		#y sleep funciona con punto
 echo "$numero"
done
