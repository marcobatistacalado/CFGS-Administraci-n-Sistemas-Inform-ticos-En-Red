option explicit
dim numero
numero=inputbox("Introduce un numero: ")
if numero < 0 then
  wscript.echo("El numero es negativo")
elseif numero > 0 then
  wscript.echo("El numero es positivo")
else
  wscript.echo("El numero no es nada")
end if