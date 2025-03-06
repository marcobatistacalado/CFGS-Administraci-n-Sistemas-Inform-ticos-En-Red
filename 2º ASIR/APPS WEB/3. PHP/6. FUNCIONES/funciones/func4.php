<html>
<head></head>
<body>
<?php
	$diasdespues=9;
	$meses=array(1=>'enero','febrero','marzo','abril','mayo','junio','julio','agosto','setiembre','octubre','noviembre','diciembre'); //hacer que comience en 1
	$diasem=array('domingo','lunes','martes','miercoles','jueves','viernes','sabado');
	$fecha=getdate();
    print_r($fecha);
	//Muestra la fecha de hoy
	echo ('Hoy es '.$diasem[$fecha['wday']].' '.$fecha['mday'].'de '.$meses[$fecha['mon']].' de '.$fecha['year']);
	$fechaman=getdate(time()+3600*24*$diasdespues); /* Sumamos el número de segundos de los dias que nos piden */
	//Muestra la fecha de mañana
	echo ("</br>Dentro de $diasdespues dias sera: ".$diasem[$fechaman['wday']].' '.$fechaman['mday'].'de '.$meses[$fechaman['mon']].' de '.$fechaman['year']);
	
?>
</body>
</html>