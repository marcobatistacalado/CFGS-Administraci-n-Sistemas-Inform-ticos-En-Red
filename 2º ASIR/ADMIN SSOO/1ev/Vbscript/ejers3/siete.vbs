'Crear un script que sume el tamaño que ocupan todos los ficheros de un  directorio
'introducido por el usuario y lo compare con el tamaño que ocupa ese  directorio.  
option explicit
dim consola, sistema, intro, carpeta, tamano_total, tamano, fichero
set sistema=wscript.createobject("scripting.filesystemobject")
set consola=wscript.createobject("wscript.shell")

intro=inputbox("Introduce una carpeta:")
'comprobar que exista primero solo si te lo pide
if (sistema.folderexists(intro)) then
set carpeta=sistema.getfolder(intro)
tamano=0
for each fichero in carpeta.files
    tamano=tamano+fichero.size
next
tamano_total=carpeta.size
WScript.Echo "TAMANO CARPETA: " & tamano_total & "Bytes" & vbCrLf & "TAMANO TOTAL DE FICHEROS: " & tamano & "Bytes"

else
wscript.echo "Carpeta introducida no existe"
end if