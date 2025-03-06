/*FUNCION_01: Función que recibe un número de 4 cifras y devuelve la matrícula 
del coche que comienza por esas cifras. Además muestra su modelo por pantalla. 
Si no hay ninguno o hubiera varios devuelve valor nulo. (2 ptos)*/
create or replace FUNCTION EX_3_2021 (NUM1 NUMBER)
RETURN VARCHAR2
IS
FMATRICULA COCHES_TALLER.MATRICULA%TYPE;
FMODELO COCHES_TALLER.MATRICULA%TYPE;
BEGIN
SELECT MATRICULA, MODELO INTO FMATRICULA, FMODELO
  FROM COCHES_TALLER
    WHERE SUBSTR(FMATRICULA,1,4)=NUM1;
  
    VER('EL MODELO ES '||FMODELO);
    RETURN FMATRICULA;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN NULL;
  WHEN TOO_MANY_ROWS THEN
    RETURN NULL;
END;

/*PROC_02: Procedimiento que recibe los siguientes parámetros: número de mecánico, 
fecha (será la fecha de entrada al taller de un arreglo) y un número de 4 cifras 
(para la matrícula) 
Mediante excepciones validar que se cumplan las siguientes condiciones 
(dar el mensaje de error adecuado si no es así):
-Ningún parámetro puede ser nulo. (0,5 ptos)
-La fecha ha de ser mayor que la del sistema y no puede caer en domingo. (1 pto)
-El número de mecánico existe en la tabla mecánicos. (1 pto)
-Llamar a la función anterior pasando el número de 4 cifras y si esta función 
nos devuelve una matrícula se da de alta un arreglo para esa matrícula, 
fecha de entrada y  nempleado los recibidos y el resto de campos a nulo.  (1 pto)

-Controlar con la excepción adecuada que no ocurra ningún error inesperado. (0,5 ptos)*/

create or replace PROCEDURE EX_3_2021_2 (PNUM_MECANICO NUMBER, P_FECHA_ENTRADA DATE, PNUM_MATRICULA NUMBER)
AS
NULO EXCEPTION;
MAL_FECHA EXCEPTION;
EXT_NUM_MECANICO EXCEPTION;
EMP MECANICOS.NEMPLEADO%TYPE;
LLAMAR_FUN VARCHAR2(2367);
BEGIN
  IF PNUM_MECANICO IS NULL OR P_FECHA_ENTRADA IS NULL OR PNUM_MATRICULA IS NULL THEN
    RAISE NULO;
  END IF;
  IF P_FECHA_ENTRADA<SYSDATE OR TO_CHAR(P_FECHA_ENTRADA, 'D')=7 THEN
    RAISE MAL_FECHA;
  END IF;
  SELECT NEMPLEADO INTO EMP
    FROM MECANICOS
      WHERE NEMPLEADO = PNUM_MECANICO;
  IF EMP = PNUM_MECANICO THEN
    RAISE EXT_NUM_MECANICO;
  END IF;
  LLAMAR_FUN:= EX_3_2021 (PNUM_MATRICULA);
  IF LLAMAR_FUN IS NOT NULL THEN
    INSERT INTO ARREGLOS VALUES (LLAMAR_FUN, PNUM_MECANICO, P_FECHA_ENTRADA, NULL, NULL);
  END IF;
  EXCEPTION
  WHEN NO_DATA_FOUND THEN
    VER('ERROR');
  WHEN TOO_MANY_ROWS THEN
    VER('ERROR');
  WHEN NULO THEN
      VER('DATOS INTRODUCIDOS NULOS');
  WHEN MAL_FECHA THEN 
      ver('FECHA MAL');
  WHEN EXT_NUM_MECANICO THEN
    VER('NUMERO DE EMPLEADO YA EXISTE');
END;

/*PROC_03: Procedimiento que recibe un número de mecánico y muestra todos 
los arreglos terminados que ha tenido.
Muestra la matrícula y modelo del coche, la  fecha de entrada y la de salida.
Al finalizar muestra cuantos arreglos fueron en el año 2020. (2,5 ptos)*/

CREATE OR REPLACE PROCEDURE EX_3_2021_3 (PNUM_MECANICO NUMBER)
AS
  CURSOR CUR_1 IS
    SELECT ARREGLOS.MATRICULA, MODELO, FECHA_ENTRADA, FECHA_SALIDA
      FROM ARREGLOS JOIN COCHES_TALLER ON ARREGLOS.MATRICULA=COCHES_TALLER.MATRICULA
        WHERE PNUM_MECANICO=NEMPLEADO AND FECHA_SALIDA IS NOT NULL;
        
  CUANTOS NUMBER:=0;
BEGIN
  FOR I IN CUR_1 LOOP
    VER(I.MATRICULA||'---'||I.MODELO||'---'||I.FECHA_ENTRADA||'---'||I.FECHA_SALIDA);
  END LOOP;
  
  SELECT COUNT(*) INTO CUANTOS
    FROM ARREGLOS
      WHERE NEMPLEADO=PNUM_MECANICO AND TO_CHAR(FECHA_SALIDA,'YYYY')='2020';
      
  VER(' NUMERO DE ARREGLOS EN 2020: '||CUANTOS);
END;

EXECUTE EX_3_2021_3 (2);


/*PROC_04: Procedimiento que recibe dos números y muestra todos los números múltiplos 
de 10 que hay entre ellos. 
Al final muestra la suma de los números mostrados. (1,5 ptos)*/
CREATE OR REPLACE PROCEDURE EX_3_2021_4 (PNUM1 NUMBER,PNUM2 NUMBER)
AS
  MAYOR NUMBER;
  MENOR NUMBER;
  SUMA NUMBER := 0;
BEGIN
  IF PNUM1<PNUM2 THEN
    MAYOR:= PNUM2;
    MENOR:= PNUM1;
  ELSE
    MAYOR:= PNUM1;
    MENOR:= PNUM2;
  END IF;
  
  FOR I IN MENOR..MAYOR LOOP
    IF MOD(I,10) = 0 THEN
      VER(I);
      SUMA := SUMA + I;
    END IF;
  END LOOP;
  
  VER ('LA SUMA ES '||SUMA);
  
END;

EXECUTE EX_3_2021_4(10,40);


