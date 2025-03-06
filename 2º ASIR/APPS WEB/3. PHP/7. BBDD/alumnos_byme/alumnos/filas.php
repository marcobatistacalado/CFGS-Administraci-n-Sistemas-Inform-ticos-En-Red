<?php
	$conexion = mysql_connect('localhost', 'root', 'aplicaciones')or die('No se pudo conectar: ' . mysql_error());
	mysql_select_db('colegio') or die('No se pudo seleccionar la base de datos');
	$consulta = 'SELECT * FROM alumnos';
	$resultado= mysql_query($consulta) or die('Consulta fallida: ' . mysql_error());
	$filas=mysql_num_rows($resultado);
	$col=mysql_num_fields($resultado);
	echo 'La consulta tiene '.$filas.' filaa y '.$col.' columnas';
	mysql_close($conexion);
?>

