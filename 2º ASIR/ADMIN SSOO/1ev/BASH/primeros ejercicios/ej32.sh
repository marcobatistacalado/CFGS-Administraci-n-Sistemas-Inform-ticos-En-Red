#!/bin/bash
contador=0
for i in `groups $1 | cut -d ":" -f 2`
do
 contador=`expr $contador + 1`
done
echo "Pertenece a $contador grupos"
