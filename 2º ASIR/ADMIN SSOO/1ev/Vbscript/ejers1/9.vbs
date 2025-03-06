option explicit
dim asignaturas, media, nota, contador
contador=1
asignaturas=cint(inputbox("Introduce un numero de asignaturas: "))

do while contador <= asignaturas
  nota=inputbox("Introduce la nota de la asignatura:" )
  if nota < 5 then
    wscript.echo("Suspenso")
  else
    wscript.echo("Aprobado")
  end if
  
  contador=contador + 1
loop