#!/bin/bash
echo "Te invito a mi fiesta de cumpleaños"
echo -n "Vas a asistir (s/n)?"
read asistencia
if [ $asistencia = "s" -o $asistencia = "S" ]
then
 echo "Bien, alli te esperaré"
elif [ $asistencia = "n" -o $asistencia = "N" ]
then
 echo "Otra vez será"
else
 echo "Respuesta incorrecta"
fi
