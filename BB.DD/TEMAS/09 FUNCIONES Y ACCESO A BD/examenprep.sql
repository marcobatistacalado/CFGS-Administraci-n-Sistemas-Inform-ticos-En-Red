SET SERVEROUTPUT ON
------------------------------------------------------------
CREATE OR REPLACE PROCEDURE VER (ALGO VARCHAR2)
AS
BEGIN
  DBMS_OUTPUT.PUT_LINE(ALGO);
END;
------------------------------------------------------------
DECLARE

BEGIN

END;
------------------------------------------------------------
CREATE OR REPLACE PROCEDURE()
AS
ERROR_NO_VALIDO EXCEPTION;
BEGIN


EXCEPTION
  WHEN ERROR_NO_VALIDO THEN 
    VER('DNI NO VALIDO');

END;
------------------------------------------------------------
CREATE OR REPLACE FUNCTION()
RETURN 
IS

BEGIN

END;
------------------------------------------------------------
--DATOS DE SELECT IGUALES:
--VNOMBRE DEPART.DNOMBRE%TYPE;