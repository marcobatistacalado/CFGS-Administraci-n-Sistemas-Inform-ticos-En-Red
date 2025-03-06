#!/bin/bash
contador=0
while [ $contador -le 10 ]
 do
 echo "$contador"
 contador=`expr $contador + 1`
 done

