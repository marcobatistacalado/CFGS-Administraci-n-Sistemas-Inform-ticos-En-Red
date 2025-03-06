option explicit
dim peliculas ()
dim numero
numero=cint(inputbox("Cuantas peliculas quieres ver?"))
redim peliculas(numero-1)

for indice=0 to numero-1
  peliculas(indice)=inputbox("Dime el nombre de la peli " & indice+1)
next

dim elemento

for each elemento in peliculas
  