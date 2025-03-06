'Contar cuantos ficheros tienen extensión .exe en el directorio c:\windows  
option explicit
dim consola, sistema, intro, carpeta, fichero, contador
set sistema=wscript.createobject("scripting.filesystemobject")
set consola=wscript.createobject("wscript.shell")

intro="c:\windows"
'comprobar que exista primero solo si te lo pide
if (sistema.folderexists(intro)) then
set carpeta=sistema.getfolder(intro)
contador=0
for each fichero in carpeta.files
    if right(fichero.name, 4)=".exe" then
        contador=contador+1
    end if
next
wscript.echo "FICHEROS .EXE: " & contador
else
wscript.echo "Carpeta introducida no existe"
end if