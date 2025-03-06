option explicit
dim dado, salir, dado2, dado3, apostar, suma
randomize
apostar=inputbox("Introduce 1 si quieres apostar a grande y 2 si quieres apostar a pequeña")

dado=fix(rnd*6)+1
dado2=fix(rnd*6)+1
dado3=fix(rnd*6)+1
wscript.echo("DADO: "& dado)
wscript.echo("DADO2: "& dado2)
wscript.echo("DADO3: "& dado3)

suma=dado+dado2+dado3

if (apostar = 1) then
  if ( suma >= 11 ) then
    wscript.echo("Ganaste a grandes")
  else
    wscript.echo("Perdiste a grandes")
  end if
else 
  if ( suma <= 10 ) then
    wscript.echo("Ganaste a peques")
  else
    wscript.echo("Perdiste a peques")
  end if
end if