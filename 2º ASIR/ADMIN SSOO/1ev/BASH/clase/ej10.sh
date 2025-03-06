read -p "Introduce un fichero: " fichero
if [ -e $fichero ]
then
 if [ -r $fichero ]
 then
  echo "El $fichero existe y se puede leer"
 else
  echo "No puedo leer el fichero $fichero"
 fi
else
 echo "Ese fichero no existe"
fi
