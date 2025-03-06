#!/bin/bash
read -p "Dime tu n
#!/bin/bash
read -p "Dime tu nombre: " nombre
if [ -z $nombre ]
then
 echo "Hola desconocido"
else
 echo "Hola $nombre"
fi
