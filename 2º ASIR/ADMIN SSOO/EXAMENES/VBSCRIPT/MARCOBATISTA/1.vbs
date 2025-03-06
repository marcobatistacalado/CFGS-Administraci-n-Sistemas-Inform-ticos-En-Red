option explicit
dim monedas, intro, cad1, aleat, min, cad2, mostrar
randomize

monedas=200
wscript.echo "MONEDAS DISPONIBLES: "&monedas
cad1="xxxxxxxxx"

do while mostrar <> vbNo

intro=cint(inputbox("Introduce un numero del 1-9:"))
aleat=cint(fix(rnd()*9+1))
cad2=""
for min=1 to 9
  if min=aleat then
  cad2=cad2&"0"
  end if
  cad2=cad2&mid(cad1,min,1)
next
wscript.echo mid(cad2,1,3)&vbcrlf&mid(cad2,4,3)&vbcrlf&mid(cad2,7,3)

if aleat=intro then
  monedas=monedas+100
  wscript.echo "Has ganado 100 monedas"&vbcrlf&"POSEES: "&monedas
else
  monedas=monedas-10
  wscript.echo "Has perdido 10 monedas"&vbcrlf&"POSEES: "&monedas
end if

if monedas=0 then
  exit do
end if

mostrar=msgbox("QUIERES JUGAR OTRA VEZ?", vbYesNo)
loop
if monedas=0 then
wscript.echo "PERDISTE TE HAS QUEDADO SIN MONEDAS PARA APOSTAR"
end if
wscript.echo "VUELVE PRONTO"