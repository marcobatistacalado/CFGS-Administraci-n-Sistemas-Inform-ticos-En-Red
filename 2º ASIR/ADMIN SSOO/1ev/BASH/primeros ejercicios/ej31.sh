#!/bin/bash
if [ -d $1 ]
then
 for i in `ls -a $1`
 do
  if [ -f "$1/$i" ]
   then
    cat "$1/$i"
    echo "----------------"
  else
   echo "$i no es un fichero"
  fi
 done
fi
