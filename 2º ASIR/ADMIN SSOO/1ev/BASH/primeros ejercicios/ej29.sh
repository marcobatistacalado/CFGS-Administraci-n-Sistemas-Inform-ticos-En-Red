#!/bin/bash
if [ $# -eq 1 ]
 then
 if [ -e $1 ]
 then
  if [ -s $1 ]
   then
    if [ -r $1  ]
     then
      "se puede leer"
      cat $1
    else
     "no se puede leer"
    fi
  else
   echo "esta vacio"
  fi
 else
 echo "no existe el fichero"
 fi
else
 echo "error, mal fataaal"
fi

