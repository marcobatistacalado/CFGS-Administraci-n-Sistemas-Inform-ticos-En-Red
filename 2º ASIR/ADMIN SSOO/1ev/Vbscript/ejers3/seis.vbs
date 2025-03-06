'Crear un script que liste los nombres (escritos al revés) de todos los ficheros 
'que  hay en el directorio c:\windows  

option explicit
dim consola, sistema, intro, carpeta, fichero, mostrar
set sistema=wscript.createobject("scripting.filesystemobject")
set consola=wscript.createobject("wscript.shell")

intro="c:\windows"
'comprobar que exista primero solo si te lo pide
if (sistema.folderexists(intro)) then
set carpeta=sistema.getfolder(intro)
mostrar=""
for each fichero in carpeta.files
    mostrar= mostrar & strreverse(fichero.name) &vbcrlf
next
wscript.echo mostrar
else
wscript.echo "Carpeta introducida no existe"
end if