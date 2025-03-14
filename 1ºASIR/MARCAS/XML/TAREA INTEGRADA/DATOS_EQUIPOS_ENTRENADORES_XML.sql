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