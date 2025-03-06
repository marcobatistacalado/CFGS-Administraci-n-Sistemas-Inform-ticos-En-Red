<?php
$cadena= "    Hola,estoy,probando funciones   ";
$r=trim($cadena);
$r=strtoupper($r);
echo "En mayusculas:$r<br>";
$r=strtolower($r);
echo "En minusculas:$r<br>";
echo "<p style='white-space:pre'>Como al ppio:$cadena</p>";
?>