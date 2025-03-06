option explicit
dim contador, mostrar
contador=1 
mostrar=""
do while contador <= 10
  mostrar=mostrar & " " & contador
  wscript.echo(mostrar)
  contador=contador + 1
loop