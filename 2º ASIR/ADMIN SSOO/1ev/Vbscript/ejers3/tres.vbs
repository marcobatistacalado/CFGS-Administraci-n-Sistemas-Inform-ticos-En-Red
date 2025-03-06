'Crear un script que liste los ficheros de una carpeta introducida por el usuario. 
'A  continuación debe poder ejecutar un fichero vbs indicado por el usuario. 
'Una  vez hecho esto debe permitir repetir el proceso o salir. 
option explicit
dim consola, sistema, intro, carpeta, mostrar, fichero, intro2, fich1, extension
set sistema=wscript.createobject("scripting.filesystemobject")
set consola=wscript.createobject("wscript.shell")

intro=inputbox("Introduce una carpeta:")
'comprobar que exista primero solo si te lo pide
if (sistema.folderexists(intro)) then
set carpeta=sistema.getfolder(intro)
wscript.echo carpeta
mostrar=""
for each fichero in carpeta.files
    mostrar= mostrar & fichero.name &vbcrlf
next
wscript.echo mostrar
intro2=inputbox("Introduce uno de los ficheros:")
set fich1=sistema.getfile(intro & "\" & intro2)
extension=right(fich1,3)
if extension="vbs" then
    consola.run fich1
end if
else
wscript.echo "Carpeta introducida no existe"
end if