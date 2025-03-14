--------------------------------------------------------------------------------
--EXAMEN 2019
--------------------------------------------------------------------------------
--EJERCICIO 1
create or replace PROCEDURE EJ1_2019(NUMERO1 NUMBER, NUMERO2 NUMBER, CARACTER CHAR)
AS

BEGIN
  IF CARACTER NOT IN ('+','-','*','/') THEN
    VER('ERROR CARACTER');
  END IF;
  IF CARACTER='+' THEN
    VER('RESULTADO: '||NUMERO1+NUMERO2);
  END IF;
  IF CARACTER='-' THEN
    VER('RESULTADO: '||NUMERO1-NUMERO2);
  END IF;
  IF CARACTER='*' THEN
    VER('RESULTADO: '||NUMERO1*NUMERO2);
  END IF;
  IF CARACTER='/' THEN
    VER('RESULTADO: '||NUMERO1/NUMERO2);
  END IF;
END;
EXECUTE EJ1_2019(4,2,'+');
--------------------------------------------------------------------------------
--EJERCICIO 2
CREATE OR REPLACE PROCEDURE EJ2_2019(USUARIO VARCHAR2, CONTRA VARCHAR2, TELEFONO VARCHAR2, CORREO VARCHAR2, FECHA DATE)
AS
EDAD NUMBER;
CONTADOR NUMBER :=0;
BEGIN
  IF USUARIO IS NULL OR CONTRA IS NULL OR TELEFONO IS NULL OR CORREO IS NULL OR FECHA IS NULL THEN
    VER('ERROR');
    CONTADOR:=CONTADOR+1;
  END IF;
  IF LENGTH(CONTRA) NOT BETWEEN 6 AND 10 THEN
    VER('ERROR CONTRA');
    CONTADOR:=CONTADOR+1;
  END IF;
  IF LENGTH(TELEFONO) != 9 OR SUBSTR(TELEFONO,1,1) NOT IN(6,7) THEN
    VER('ERROR TELEFONO');
    CONTADOR:=CONTADOR+1;
  END IF;
  EDAD:= TRUNC((SYSDATE-FECHA)/365);
  IF EDAD<18 THEN
    VER('ERROR EDAD');
    CONTADOR:=CONTADOR+1;
  END IF;
  IF CONTADOR=0 THEN
    VER('BIENVENIDO');
    IF TO_CHAR(FECHA,'MM')=TO_CHAR(SYSDATE,'MM') THEN
    VER('TE REGALAMOS LA CUOTA DE ESTE MES');
  END IF;
  END IF;

END;

EXECUTE EJ2_2019('MARCO', 'HOLAQUETA','646722873','MARCO','04/03/2003');

--------------------------------------------------------------------------------
--EJERCICIO 3
CREATE OR REPLACE PROCEDURE EJ3_2019(NUMERO1 NUMBER)
AS
POSICION NUMBER:=0;
SUMA NUMBER:=0;
BEGIN
  FOR CONT IN 1..LENGTH(NUMERO1) LOOP
    POSICION:= SUBSTR(NUMERO1,CONT,1);
    SUMA:= SUMA+POSICION;
  END LOOP;
  VER(SUMA);
END;

EXECUTE EJ3_2019(445);
--------------------------------------------------------------------------------
--EJERCICIO 4
CREATE OR REPLACE PROCEDURE EJ4_2019(NUMERO1 NUMBER, NUMERO2 NUMBER)
AS
MENOR NUMBER;
MAYOR NUMBER;
BEGIN
  IF NUMERO1<NUMERO2 THEN
    MENOR:=NUMERO1;
    MAYOR:=NUMERO2;
  ELSE
    MENOR:=NUMERO2;
    MAYOR:=NUMERO1;
  END IF;
  
  FOR CONT IN MENOR..MAYOR LOOP
    IF MOD(CONT,10)=0 THEN
      VER(CONT);
    END IF;
  END LOOP;
END;

EXECUTE EJ4_2019 (2,20);
--------------------------------------------------------------------------------
--EJERCICIO 5
CREATE OR REPLACE PROCEDURE EJ5_2019
AS
HOY DATE:=SYSDATE;
A�O DATE:='01/01/2022';
D NUMBER:=0;
G NUMBER:=0;
DIFERENCIA NUMBER;
BEGIN
  DIFERENCIA:=HOY-A�O;
  
  FOR CONT IN 1..DIFERENCIA LOOP
    IF TO_CHAR(A�O,'D')=6 THEN
      D:=TO_CHAR(A�O,'DD');
    END IF;
    A�O:=A�O+1;
    IF TO_CHAR(A�O,'D')=7 THEN
      G:=TO_CHAR(A�O,'DD');
    END IF;
    VER(D||'-'||G||'/'||TO_CHAR(A�O,'MM'));
  END LOOP;
END;