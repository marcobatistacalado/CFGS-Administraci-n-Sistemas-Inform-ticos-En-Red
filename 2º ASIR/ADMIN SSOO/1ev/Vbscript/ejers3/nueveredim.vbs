'Crear un script que muestre un mensaje de advertencia con el mensaje: 
'¿Borrar  …? y con las opciones Si/No/Cancelar. Sustituir los … por un nombre 
'de  directorio escogido al azar del directorio c:\windows.  

option explicit
dim ventana()
dim sistema, intro, carpeta, subcarpeta, contar,aleat, muestro, indice
Randomize
set sistema=wscript.createobject("scripting.filesystemobject")
intro="C:\Windows"
set carpeta=sistema.getfolder(intro)
contar=0
for each subcarpeta in carpeta.subfolders
    contar=contar+1
next
redim ventana(contar)
 
indice=0
for each subcarpeta in carpeta.subfolders
    ventana(indice)=subcarpeta.name
    indice=indice+1
next
aleat=fix(rnd()*contar)
WScript.Echo aleat
 
muestro=MsgBox("Borrar "& ventana(aleat) &"?",vbExclamation+vbYesNoCancel)
