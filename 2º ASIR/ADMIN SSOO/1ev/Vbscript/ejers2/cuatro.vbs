option explicit
dim dado, salir
randomize

while salir <> VBno 
dado=fix(rnd*6)+1
wscript.echo("DADO: "& dado)
salir=msgbox("Quieres seguir: " ,vbyesno)
wend
