option explicit
dim cad, max, contador, caracter, a, e, i, o, u
a=0
e=0
i=0
o=0
u=0
cad=inputbox("Introduce una cadena: ")
max=len(cad)
contador=0
do while max > contador
contador=contador+1
caracter=mid(cad,contador,1)
if (caracter = "a")then
  a=a + 1
end if
if (caracter = "e")then
  e=e + 1
end if
if (caracter = "i")then
  i=i + 1
end if
if (caracter = "o")then
  o=o + 1
end if
if (caracter = "u")then
  u=u + 1
end if
loop
wscript.echo("LETRAS A: " & a)
wscript.echo("LETRAS E: " & e)
wscript.echo("LETRAS I: " & i)
wscript.echo("LETRAS O: " & o)
wscript.echo("LETRAS U: " & u)