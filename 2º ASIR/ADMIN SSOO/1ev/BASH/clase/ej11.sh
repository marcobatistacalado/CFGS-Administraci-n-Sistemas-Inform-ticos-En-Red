/bash
echo "Que dia de la semana es hoy? "
read dia
case $dia in
 Lunes) echo "Horario"
  	echo "Sistemas"
	echo "BBDD"
	echo "..." ;;
 Martes) echo "Martes" ;;
 Miercoles) echo "Miercoles" ;;
 Jueves) echo "Jueves" ;;
 Viernes | viernes) echo "Fiesta!";;
 *) echo "No has puesto un dia de la semana"
esac

