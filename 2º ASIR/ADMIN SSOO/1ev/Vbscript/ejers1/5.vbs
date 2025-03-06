option explicit
dim numero, contador, negativo, positivo
negativo=0
positivo=0
contador=1
do while contador <=10
  numero=inputbox("Introduce un numero: ")
  if numero < 0 then
    negativo= negativo + 1
  else
    positivo= positivo + 1
  end if
  contador= contador + 1
loop
wscript.echo("Numeros negativos: " & negativo & " Numeros positivos: " & positivo)