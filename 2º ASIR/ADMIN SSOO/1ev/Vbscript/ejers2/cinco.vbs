option explicit
dim dado, salir, dado2, dado3
randomize

while salir <> vbno 
dado=fix(rnd*6)
dado2=fix(rnd*6)
dado3=fix(rnd*6)
wscript.echo("DADO: "& dado)
wscript.echo("DADO2: "& dado2)
wscript.echo("DADO3: "& dado3)
salir=msgbox("Quieres seguir: " ,vbyesno)
wend
