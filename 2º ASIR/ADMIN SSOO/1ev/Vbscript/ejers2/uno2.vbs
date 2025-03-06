option explicit
dim ano_actual, ahora
ahora=now()
ano_actual=year(ahora)
'un año es bisiesto si es divisible entre 4 
'excepto los años que acaban en 00 que son bisiestos si acaban en 00
if (ano_actual Mod 4 = 0 and ano_actual Mod 100 <> 0 or ano_actual Mod 400 = 0) then
  wscript.echo("Es bisiesto")
else
  wscript.echo("No es bisiesto")
end if
