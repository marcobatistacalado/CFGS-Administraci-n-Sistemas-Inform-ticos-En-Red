<?php
$pizza  = "hola,estoy,probando funciones";
$pieces = explode(",", $pizza);
print_r($pieces);
$cadena="    cadena con blancos";
$otra="Esta";
echo $otra.$cadena;
echo "<br>";
parse_str('fam=1&ent=7&precio=25',$resultado);
print_r($resultado);
echo "Valor de la variable fam:".$fam;
echo "Valor de la variable ent:".$ent;
$resultado=str_replace('lunes','martes','lunes, ¿quién ha dicho lunes?'); 
echo "<br>$resultado";
$tam=strlen($resultado);
echo "<br>El numero de caracteres de la cadena es:$tam";
$pos=strpos("micorreo@gmail.com","@");

if ($pos==FALSE)
	echo "<br>Cadena no encontrada";
else
	echo "<br>Cadena encontrada en la posición:$pos";
$ejemplo="Ejemplo";
$ejemplo=strtoupper($ejemplo);
echo "<br>La cadena en mayusculas es:$ejemplo";
$nuevacadena=substr($cadena,15,5);
echo "<br>$nuevacadena";
?>