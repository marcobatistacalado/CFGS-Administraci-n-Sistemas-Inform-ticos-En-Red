'Crear un script que pida el nombre de una 
'página web o dirección ftp y la  muestre en el explorador.  NO FUNCIONA EL PUTO RUN ESE
option explicit
dim consola, intro,
set consola=wscript.createobject("wscript.shell")
intro=inputbox("Introduce url: ")
consola.run "chrome" & intro