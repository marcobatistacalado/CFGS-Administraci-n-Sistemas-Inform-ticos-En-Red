'Crear un script que abra con el programa Paint todos los ficheros con extensión .vbs 
'que haya en un directorio introducido por el usuario (comprobar que exista  la carpeta).  

option explicit
dim consola, sistema, intro, carpeta, mostrar, fichero, intro2, fich1, extension
set sistema=wscript.createobject("scripting.filesystemobject")
set consola=wscript.createobject("wscript.shell")

intro=inputbox("Introduce una carpeta:")
'comprobar que exista primero solo si te lo pide
if (sistema.folderexists(intro)) then
set carpeta=sistema.getfolder(intro)
mostrar=""
for each fichero in carpeta.files
wscript.echo fichero.path
    if right(fichero.name, 4)=".vbs" then
        consola.run "mspaint" & fichero.path
    end if
next
else
wscript.echo "Carpeta introducida no existe"
end if