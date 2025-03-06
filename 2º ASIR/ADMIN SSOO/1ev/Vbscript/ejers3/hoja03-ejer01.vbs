option explicit
dim sistema, comando, carpeta, pregunta, unidad, mensaje, subcarpeta, fichero
set sistema=wscript.createobject("scripting.filesystemobject")
set unidad=sistema.getdrive("c:")
mensaje="Unidad C:" & vbcrlf & unidad.filesystem & vbcrlf & unidad.freespace
wscript.echo mensaje
set carpeta=unidad.rootfolder
do
 comando=inputbox("Que comando quieres ejectuar")
 if comando="pwd" then
  wscript.echo carpeta.path
 elseif comando="dir" then
  mensaje=carpeta.path & vbcrlf
  for each subcarpeta in carpeta.subfolders
   mensaje=mensaje & "<DIR>" & subcarpeta.name & vbcrlf
  next
  for each fichero in carpeta.files
   mensaje=mensaje & fichero.name & vbcrlf
  next
  wscript.echo mensaje
 elseif comando="cd" then
  pregunta=inputbox("A que carpeta quieres ir")
  if sistema.folderexists(pregunta) then
   set carpeta=sistema.getfolder(pregunta)
  else
   wscript.echo "No existe la ruta"
  end if
 elseif comando<>"exit" then
  wscript.echo "Comando irreconocible"
 end if
loop until comando="exit"
