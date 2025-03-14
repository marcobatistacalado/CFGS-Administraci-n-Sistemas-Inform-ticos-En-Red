/*EJERCICIO1*/
CREATE OR REPLACE FUNCTION EX_BUSCAR_RESIDENTE (FNOM VARCHAR2)
RETURN VARCHAR2
IS
FDNI RESIDENTES.DNI%TYPE;
BEGIN
  SELECT DNI INTO FDNI
    FROM RESIDENTES
      WHERE UPPER(FNOM)=UPPER(NOMBRE);
  
  RETURN FDNI;

EXCEPTION
  WHEN NO_DATA_FOUND THEN
  RETURN NULL;
  WHEN TOO_MANY_ROWS THEN
  RETURN NULL;
END;

/*EJERCICIO2*/
CREATE OR REPLACE FUNCTION EX_HORARIO_CORRECTO (FFECHA DATE)
RETURN BOOLEAN
IS
BEGIN
  IF FFECHA<SYSDATE OR TO_CHAR(FFECHA, 'HH:24') NOT BETWEEN 9 AND 13 OR TO_CHAR(FFECHA, 'MI') NOT IN ('00', '30') THEN
    RETURN FALSE;
  ELSE
    RETURN TRUE;
  END IF;
END;

/*EJERCICIO3*/
CREATE OR REPLACE PROCEDURE EX_RESERVA_REVISION (PNOM VARCHAR2, PFECHA DATE, PCOD VARCHAR2)
AS 
NULOS EXCEPTION;
NO_EXT_RES EXCEPTION;
FECHA_MAL EXCEPTION;
NO_EXT_PERS EXCEPTION;

PDNI VARCHAR2(3267);
INVENTADO VARCHAR2(3267):= NULL;
PEPE NUMBER:=0;

PCARGO VARCHAR2 (3267);
CURSOR CUR_1 IS
  SELECT CARGO, CODIGO, NOMBRE
    FROM PERSONAL
      WHERE CARGO = PCARGO;
BEGIN
  IF PNOM IS NULL OR PFECHA IS NULL OR PCOD IS NULL THEN
    RAISE NULOS;
  END IF;
  IF EX_BUSCAR_RESIDENTE(PNOM) IS NULL THEN
    RAISE NO_EXT_RES;
  END IF;
  IF EX_HORARIO_CORRECTO(PFECHA)= FALSE THEN
    RAISE FECHA_MAL;
  END IF;
  
  SELECT NOMBRE INTO INVENTADO
    FROM PERSONAL
      WHERE CODIGO=PCOD;
  IF INVENTADO IS NULL THEN
    RAISE NO_EXT_PERS;
  END IF;
  
  SELECT COUNT(*) INTO PEPE
    FROM REVISIONES
      WHERE FH_REVISION=PFECHA AND PCOD=COD_REALIZA;
  
  PDNI:= EX_BUSCAR_RESIDENTE(PNOM);
  IF PEPE=0 THEN
    INSERT INTO REVISIONES VALUES(PDNI, PFECHA, NULL, PCOD);
  ELSE
    SELECT CARGO INTO PCARGO
      FROM PERSONAL
        WHERE CODIGO=PCOD;
    FOR I IN CUR_1 LOOP
      VER(I.CARGO||'  '||I.CODIGO||'  '||I.NOMBRE);
    END LOOP;
  END IF;
  
EXCEPTION
  WHEN NULOS THEN
    VER('DATOS INTRODUCIDOS NULOS');
  WHEN NO_EXT_RES THEN
    VER('NO EXISTE ESTE RESIDENTE');
  WHEN FECHA_MAL THEN
    VER('FECHA INCORRECTA');
  WHEN NO_EXT_PERS THEN
    VER('NO EXISTE ESTE TRABAJADOR');
END;

/*EJERCICIO 4*/
create or replace PROCEDURE EX_INF_RESIDENTES 
AS
NUM_REVISIONES NUMBER:=0;
HOMBRE NUMBER:=0;
MUJER NUMBER:=0;

CURSOR CUR_1 IS
  SELECT DNI,NOMBRE, TO_CHAR(FECHA_NAC, 'YYYY') A�O_NACIMIENTO, SUBSTR(HABITACION,1,1) PLANTA, SEXO
    FROM RESIDENTES;
  
  VAUX VARCHAR2(3267);
  
CURSOR CUR_2 IS
  SELECT TO_CHAR(FH_REVISION, 'DD/MM/YY') FECHILLA, DIAGNOSTICO, NOMBRE
    FROM RESIDENTES JOIN REVISIONES ON REVISIONES.DNI_RESIDENTE = RESIDENTES.DNI
      WHERE SUBSTR(COD_REALIZA,1,3)='MED' AND RESIDENTES.DNI = VAUX;
BEGIN

  FOR I IN CUR_1 LOOP
    VER('NOMBRE: '||I.NOMBRE||' A�O DE NACIMIENTO: '||I.A�O_NACIMIENTO||' HABITACI�N: '||I.PLANTA||'� Planta SEXO: '||I.SEXO);
    IF I.SEXO = 'H' THEN
      HOMBRE:=HOMBRE+1;
    ELSE
      MUJER:=MUJER+1;
    END IF;
    VAUX:=I.DNI;
    
    FOR J IN CUR_2 LOOP
    VER('    FECHA: '||J.FECHILLA||' DIAGN�STICO: '||J.DIAGNOSTICO||' NOMBRE DEL M�DICO: '||J.NOMBRE);
    NUM_REVISIONES:=NUM_REVISIONES+1;
    END LOOP;
    VER('NUMERO DE REVISIONES ES: '||NUM_REVISIONES);
  END LOOP;
    VER('NUMERO DE HOMBRES: '||HOMBRE||' NUMERO DE MUJERES: '||MUJER);
  
END;

EXECUTE EX_INF_RESIDENTES;


/*EJERCICIO 5*/
create or replace PROCEDURE EX_BUCLE_FINAL (PALABRA VARCHAR2, NUMERO NUMBER)
AS
ASTERISCO VARCHAR2(3267);
BEGIN
  FOR I IN 1..NUMERO LOOP
    ASTERISCO:='*'||ASTERISCO;
  END LOOP;
  
  VER(ASTERISCO||UPPER(PALABRA)||ASTERISCO);
END;

EXECUTE EX_BUCLE_FINAL ('patata',5);








  
  
  
  
  
  