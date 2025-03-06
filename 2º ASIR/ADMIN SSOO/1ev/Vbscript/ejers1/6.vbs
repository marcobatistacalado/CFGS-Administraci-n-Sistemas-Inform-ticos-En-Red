option explicit
dim nota
nota=inputbox("Introduce una nota del 1 al 10: ")
if nota = 1 or nota = 2 or nota= 3 or nota = 4 then
  wscript.echo("Suspenso")
elseif nota = 5 then
  wscript.echo("Aprobado")
elseif nota = 6 then
  wscript.echo("Bien")
elseif nota = 7 or nota = 8 then
  wscript.echo("Notable")
elseif nota = 9 or nota = 10 then
  wscript.echo("Sobresaliente")
else
  wscript.echo("No es un numero del 1 al 10")
end if
