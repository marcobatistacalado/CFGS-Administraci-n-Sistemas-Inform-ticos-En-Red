option explicit
dim cad, max, contador, caracter, letra
letra=0
cad=inputbox("Introduce una cadena: ")
max=len(cad)
contador=0
do while max > contador
contador=contador+1
caracter=mid(cad,contador,1)
if caracter = " " then
  letra=letra
else
  letra=letra + 1
end if
loop
wscript.echo(letra)