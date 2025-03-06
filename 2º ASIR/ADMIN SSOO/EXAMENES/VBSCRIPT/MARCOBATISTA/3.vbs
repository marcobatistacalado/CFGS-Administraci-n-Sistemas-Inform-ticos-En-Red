option explicit
dim sistema, intro, intro2, carpeta, mostrar,mostrar2, fichero,subdirectorios, subcarpeta, tamano, numfich
set sistema=wscript.createobject("scripting.filesystemobject")

intro=inputbox("Introduce tu nombre de usuario:")
'comprobar que exista primero solo si te lo pide
if (sistema.folderexists("C:\Users\"&intro)) then
  set carpeta=sistema.getfolder("C:\Users\"&intro)
  mostrar=""
  for each subdirectorios in carpeta.subfolders
    mostrar=mostrar & subdirectorios.name &vbcrlf
  next
  wscript.echo mostrar

  
  intro2=inputbox("Introduce una carpeta:")
  intro2="C:\Users\"&intro&"\"&intro2
  set subcarpeta=sistema.getfolder(intro2)
  mostrar2=""
  tamano=0
  numfich=0
  for each fichero in subcarpeta.files
    mostrar2=mostrar2 & fichero.name &vbcrlf
    if (right(fichero.name,4)=".vbs") then
      tamano=tamano+fichero.size
      numfich=numfich+1
    end if
  next
  
  wscript.echo "FICHEROS"&vbcrlf&mostrar2
  wscript.echo "FICHEROS .VBS"&vbcrlf&"Tamano total es: "&tamano&"Bytes y cuantos ficheros= "&numfich

else
wscript.echo "Carpeta personal del usuario no existe"
end if