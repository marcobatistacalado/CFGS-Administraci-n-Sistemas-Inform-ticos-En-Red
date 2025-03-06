create or replace FUNCTION EXT_EQUIPO (FNOMBRE VARCHAR2)
RETURN NUMBER
IS
RETORNADOR NUMBER:=0;
BEGIN
  SELECT COUNT(*) INTO RETORNADOR
    FROM EQUIPOS
      WHERE UPPER(Nombre_Equipo) = UPPER(FNOMBRE);
  RETURN RETORNADOR;
END;
--------------------------------------------------------------------------------
create or replace FUNCTION EXT_ALIAS_ENTRENADOR (FALIAS VARCHAR2)
RETURN VARCHAR2
IS
RETORNADOR ENTRENADORES.DNI_ENTRENADOR%TYPE;
BEGIN
  SELECT DNI_ENTRENADOR INTO RETORNADOR
    FROM ENTRENADORES
      WHERE UPPER(ALIAS)= UPPER(FALIAS);
      
  RETURN RETORNADOR;

EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN NULL;
END;
--------------------------------------------------------------------------------
create or replace FUNCTION EXT_NACIONALIDAD (FNACIONALIDAD VARCHAR2)
RETURN NUMBER
IS
EXISTE NUMBER:=0;
BEGIN
  SELECT COUNT(*) INTO EXISTE
    FROM EQUIPOS
      WHERE UPPER(FNACIONALIDAD)=UPPER(NACIONALIDAD);
  RETURN EXISTE;
END;
--------------------------------------------------------------------------------
create or replace PROCEDURE ALTA_EQUIPO (P_NOMBRE_EQUIPO VARCHAR2, PALIAS VARCHAR2, PNACIONALIDAD VARCHAR2)
AS
PID_EQUIPO NUMBER;
PDNI EQUIPOS.DNI_ENTRENADOR%TYPE;
BEGIN
  IF EXT_EQUIPO(P_NOMBRE_EQUIPO)>0 THEN
    VER('ERROR EL NOMBRE DEL EQUIPO YA EXISTE');
  ELSE
    IF EXT_ALIAS_ENTRENADOR(PALIAS) IS NULL THEN
      VER('ERROR ENTRENADOR NO EXISTE');
    
    ELSE
      IF EXT_NACIONALIDAD(PNACIONALIDAD)=0 THEN
        VER('Bien!!, perteneces a un nuevo Pa�s en nuestra base de datos de torneos eSports');
      END IF;
      
      SELECT MAX(ID_EQUIPO) INTO PID_EQUIPO 
      FROM EQUIPOS;
      PID_EQUIPO:=PID_EQUIPO+1;
      
      PDNI:=EXT_ALIAS_ENTRENADOR(PALIAS);
      INSERT INTO EQUIPOS VALUES(PID_EQUIPO,PDNI,P_NOMBRE_EQUIPO, PNACIONALIDAD, 0);
    END IF;
  END IF;
END;
--------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE DATOS_EQUIPOS_ENTRENADORES_XML
AS
 
  CURSOR CUR_D IS
    SELECT ID_EQUIPO, NOMBRE_EQUIPO, DNI_ENTRENADOR, NACIONALIDAD, NUM_JUGADORES
      FROM EQUIPOS;
    
    V2AUX VARCHAR2(3267);
  CURSOR CUR_E IS
    SELECT ALIAS, TELEFONO
      FROM ENTRENADORES
        WHERE DNI_ENTRENADOR = V2AUX;
BEGIN
VER('<EQUIPOS>');
  FOR I IN CUR_D LOOP
    VER(' <EQUIPO>');
    VER('  <ID_EQUIPO>'||I.ID_EQUIPO||'</ID_EQUIPO>');
    VER('  <NOMBRE_EQUIPO>'||I.NOMBRE_EQUIPO||'</NOMBRE_EQUIPO>');
    VER('  <NACIONALIDAD>'||I.NACIONALIDAD||'</NACIONALIDAD>');
    VER('  <NUM_JUGADORES>'||I.NUM_JUGADORES||'</NUM_JUGADORES>');
    VER('  <ENTRENADORES>');
    VER('    <DNI_ENTRENADOR>'||I.DNI_ENTRENADOR||'</DNI_ENTRENADOR>');
    V2AUX:=I.DNI_ENTRENADOR;
    
    FOR J IN CUR_E LOOP
      VER('    <ALIAS>'||J.ALIAS||'</ALIAS>');
      VER('    <TELEFONO>'||J.TELEFONO||'</TELEFONO>');
    END LOOP;
    VER('  </ENTRENADORES>');
    VER(' </EQUIPO>');
  END LOOP;
  VER('</EQUIPOS>');
END;

EXECUTE DATOS_EQUIPOS_ENTRENADORES_XML;




