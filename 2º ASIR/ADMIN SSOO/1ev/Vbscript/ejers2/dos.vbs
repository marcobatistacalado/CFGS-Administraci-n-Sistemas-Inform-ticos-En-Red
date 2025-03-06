option explicit
dim cumple, ahora, ano_actual, ano_cumple, anos, mes_actual, mes_cumple
ahora= date()
cumple="04/02/2003"
ano_actual=cint(year(ahora))
ano_cumple=cint(right(cumple,4))
mes_actual=cint(mid(ahora,4,2))
mes_cumple=cint(mid(cumple,4,2))
anos=ano_actual - ano_cumple

if mes_actual < mes_cumple then
  anos=anos-1
else
  if mes_actual = mes_cumple then
     anos=anos - 1
  end if
end if

wscript.echo(anos)