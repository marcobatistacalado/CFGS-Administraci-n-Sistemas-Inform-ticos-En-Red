option explicit
dim contador, mostrar
contador=1 
mostrar=""
do while contador <= 10
  mostrar=mostrar & " " & contador
  contador=contador + 1
loop
  wscript.echo(mostrar)