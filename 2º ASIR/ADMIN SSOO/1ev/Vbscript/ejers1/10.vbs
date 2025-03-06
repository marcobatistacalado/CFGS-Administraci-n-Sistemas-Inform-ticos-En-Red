option explicit
dim nota, media, asignatura, contador, suspenso, aprobado
contador=1
media=0
aprobado=0
suspenso=0
asignatura=cint(inputbox("Introduce numero de asignaturas: "))
do while contador <= asignatura
  nota=inputbox("Introduce nota de la asignatura: ")
  media= media + nota
  if nota < 5 then
    suspenso= suspenso + 1
  else
    aprobado= aprobado + 1
  end if
  contador=contador+1
loop
media= media / asignatura
wscript.echo("APROBADAS: " & aprobado & " SUSPENSAS: " & suspenso & " MEDIA:" & media)
if media < 5 then
  wscript.echo("Media suspensa")
else
  wscript.echo("Media aprobada")
end if