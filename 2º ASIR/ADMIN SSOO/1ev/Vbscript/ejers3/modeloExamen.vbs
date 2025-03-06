option explicit
dim sistema, consola, carpeta, elemento, opcion, menu, salida
dim usuario, fichero, contador, pregunta, extension
set sistema=wscript.createobject("scripting.filesystemobject")
set consola=wscript.createobject("wscript.shell")
opcion=0
while opcion<> 4
 menu="1.Listar usuarios" & vbcrlf & "2.Listar ficheros" & vbcrlf & "3.Abrir fichero" &vbcrlf & "4.Salir"
 opcion=cint(inputbox(menu & vbcrlf & "Que opcion eliges"))
 if opcion=1 then
  set carpeta=sistema.getfolder("C:\Users")
  salida="** Usuarios **" & vbcrlf
  for each elemento in carpeta.subfolders
   salida=salida & elemento.name & vbcrlf
  next
  wscript.echo salida
 elseif opcion=2 then
  usuario=inputbox("Dime un usuario")
  set carpeta=sistema.getfolder("C:\Users\"&usuario)
  salida="** " & carpeta.path & " **" & vbcrlf
  contador=0
  for each fichero in carpeta.files
   if right(fichero.name,3)="txt" then
    salida=salida & fichero.name & " - " & fichero.size & "bytes" & vbcrlf
    contador=contador+1
   end if
  next
  wscript.echo salida & "Total: " & contador
 elseif opcion=3 then
  'pregunta=inputbox("Escribe un fichero de Asir2")
  'pregunta="C:\Users\asir2\" & pregunta
  pregunta=inputbox("Escribe un fichero de imagen")
  if sistema.fileexists(pregunta) then
   set fichero=sistema.getfile(pregunta)
   extension=right(fichero.name,3)
   if extension="jpg" or extension="png" or extension="gif" then
    consola.run "mspaint " & fichero.path
   end if
  end if
 end if
wend
