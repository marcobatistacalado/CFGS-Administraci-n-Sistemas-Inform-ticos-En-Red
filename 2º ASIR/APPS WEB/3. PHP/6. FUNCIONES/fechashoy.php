<html>
<head></head>
<body>
<?php
	
	$meses=array(1=>'enero','febrero','marzo','abril','mayo','junio','julio','agosto','setiembre','octubre','noviembre','diciembre');
	$diasem=array('domingo','lunes','martes','miercoles','jueves','viernes','sabado');
	$fecha=getdate();
	//Muestra la fecha de hoy
	echo ('Hoy es '.$diasem[$fecha['wday']].' '.$fecha['mday'].'de '.$meses[$fecha['mon']].' de '.$fecha['year']);
	$fechaman=getdate(time()+3600*24); /* Sumamos el número de segundos de un dia */
	//Muestra la fecha de mañana
	echo ('</br>Manana es '.$diasem[$fechaman['wday']].' '.$fechaman['mday'].'de '.$meses[$fechaman['mon']].' de '.$fechaman['year']);
	
?>
</body>
</html>