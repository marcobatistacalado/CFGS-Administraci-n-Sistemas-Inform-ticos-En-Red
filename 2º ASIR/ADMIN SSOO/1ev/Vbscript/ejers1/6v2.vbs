option explicit
dim nota
nota=inputbox("Introduce una nota del 1 al 10: ")
if nota < 5 then
  wscript.echo("Suspenso")
else
  wscript.echo("Aprobado")
end if