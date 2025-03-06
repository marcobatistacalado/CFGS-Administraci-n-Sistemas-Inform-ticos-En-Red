option explicit
dim numero, contador
contador=1
do while contador <=10
  numero=inputbox("Introduce un numero: ")
  if numero < 0 then
    wscript.echo("Negativo")
  elseif numero > 0 then
    wscript.echo("Positivo")
  else
    wscript.echo("No se que es bro")
  end if
  contador= contador + 1
loop