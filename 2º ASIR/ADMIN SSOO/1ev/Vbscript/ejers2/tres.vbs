option explicit
dim dado, salir
randomize

while salir <> vbno 
dado=fix(rnd*6)
wscript.echo("DADO: "& dado)
salir=msgbox("quieres seguir " ,vbyesno)
wend

