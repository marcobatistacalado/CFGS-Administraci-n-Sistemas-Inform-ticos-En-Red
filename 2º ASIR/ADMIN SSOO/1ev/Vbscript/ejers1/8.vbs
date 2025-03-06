option explicit
dim nota, contador, media
contador=1
media=0
do while contador <= 6 
  nota=inputbox("Introduce una nota: ")
  media=media + nota
  contador=contador + 1
loop
media= media / 6
if media < 5 then
  wscript.echo("Suspenso")
else
  wscript.echo("Aprobado")
end if