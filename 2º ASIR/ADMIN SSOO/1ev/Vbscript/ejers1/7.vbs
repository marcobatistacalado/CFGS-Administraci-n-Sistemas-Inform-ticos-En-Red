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
wscript.echo("Esta es la media " & media)