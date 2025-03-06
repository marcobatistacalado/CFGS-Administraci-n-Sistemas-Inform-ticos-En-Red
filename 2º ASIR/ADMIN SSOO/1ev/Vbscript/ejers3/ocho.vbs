' Crear un script que muestre los ficheros del directorio desde donde se está 
'ejecutando, guarde en un array la fecha de creación de los ficheros que 
'hay en  ese directorio y muestre cuál es el más antiguo y cuál el más moderno.  
dim sistema, intro, quitar,carpeta, fichero, mostrar, creacion, contar, fich1, fmax, fich2, fmin
set sistema=wscript.createobject("scripting.filesystemobject")
intro=WScript.ScriptFullName
quitar=Replace(intro,"\"&WScript.ScriptName,"")
set carpeta=sistema.getfolder(quitar)
contar=1
for each fichero in carpeta.files
    mostrar= mostrar & fichero.name & " CREADO: " & fichero.DateCreated & vbCrLf
    creacion=fichero.DateCreated
    if contar = 1 Then
        fich1=fichero.DateCreated
        fich2=fichero.DateCreated
    end if
    if fich1 < creacion Then
        fich1=creacion
        fmax=fichero.name
    end if
    if fich2 > creacion Then
        fich2=creacion
        fmin=fichero.Name
    end if
    contar=contar+1
next
WScript.Echo mostrar
WScript.Echo "EL PRIMER FICHERO CREADO ES: " & fmin & " FECHA: " & fich2
WScript.Echo "EL ULT FICHERO CREADO ES: " & fmax & " FECHA: " & fich1
