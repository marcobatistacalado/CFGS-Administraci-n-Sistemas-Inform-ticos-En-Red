option explicit
dim hoy, dia, mes, ano, cad, contador, cad2, aleat, max,veces
randomize
hoy=date()
dia=day(hoy)
mes=monthname(month(hoy))
ano=year(hoy)

cad="Hoy es "&dia&" de "&mes&" de "&ano

contador=1
cad2=""

max=cint(len(cad))
veces=1

do while veces <=5

for contador=1 to max
aleat=cint(fix(rnd()*2+1))
if aleat=1 then
  cad2=cad2& ucase(mid(cad,contador,1))
else
  cad2=cad2& lcase(mid(cad,contador,1))
end if
next

cad2=cad2&vbcrlf&""

veces=veces+1
loop
wscript.echo cad2
