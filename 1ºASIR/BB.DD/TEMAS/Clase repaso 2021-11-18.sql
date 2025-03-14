ALTER SESSION SET NLS_DATE_FORMAT = 'DD/MM/YYYY HH24:MI';

DAR DE ALTA UNA VISITA PARA MA�ANA A LAS 12:00 DE LA MA�ANA
DEL ANIMAL 2 CON EL VETERINARIO 1234 MOTIVO DOLOR DE MUELAS Y EL RESTO DE LOS CAMPOS A NULOS

INSERT INTO VISITAS 
  VALUES (2, TO_DATE (TO_CHAR(SYSDATE +1,'DDMMYYYY')||'1200', 'DDMMYYYYHH24MI'),
           1234, 'DOLOR DE MUELAS', NULL, NULL);
          
;

SELECT TO_DATE (TO_CHAR(SYSDATE +1,'DDMMYYYY')||'1200', 'DDMMYYYYHH24MI')
  FROM DUAL;
  
  
  
el 23 de noviembre a las 15:30

SELECT   TO_DATE('231120211530','DDMMYYYYHH24MI')
  FROM DUAL;

SELECT   TO_DATE('23/11/2021 15:30','DD/MM/YYYY HH24:MI')
  FROM DUAL;

SELECT   TO_DATE('2021123 1530','YYYYMMDD HH24MI')
  FROM DUAL;
 
 SELECT TO_DATE (TO_CHAR(SYSDATE + 1,'DDMMYYYY')||'1200','DDMMYYYYHH24MI')
   FROM DUAL;
 
 TO_CHAR ---> CONSTRUYE UN CHAR (RECIBE UN DATE)
 TO_DATE ---> CONSTRUYE UN DATE (RECIBE UN CHAR)
 
 TO_CHAR (SYSDATE,'DD/MM/YYYY')
 TO_DATE ('19/06/2006','DD/MM/YYYY') 
 
 ALTER SESSION SET NLS_DATE_FORMAT = 'DD/MM/YYYY HH24:MI';
 
 
 DAR DE ALTA UNA VISITA
 PARA CADA ANIMAL QUE HA NACIDO ESTE A�O (    SELECT DE ANIMALES)
 CON LA VETERIANA QUE SE LLAMA ANA       (    SELECT A VETERINARIOS)
 MOTIVO REVISION
 FECHA 10 DE 12 A LAS 16:00;
 
 INSERT INTO VISITAS 
 SELECT IDENT_ANIMAL,TO_DATE('101220211600','DDMMYYYYHH24MI')   , NUMCOLEGIADO, 'REVISION', NULL, NULL
    FROM ANIMALES, VETERINARIOS 
      WHERE TO_CHAR(FECHA_NACIMIENTO,'YYYY') = TO_CHAR(SYSDATE,'YYYY')
           AND  VETERINARIOS.NOMBRE LIKE '%ANA%';
 
 DAR DE ALTA UNA VISITA CON MOTIVO REVISION 2 CON LOS MISMOS DATOS 
  DE LA ULTIMA VISITA QUE SE LE HIZO AL ANIMAL DE INDENTIFICADOR 9
  PARA DENTRO DE 7 DIAS A LAS 16:00
  
  INSERT INTO VISITAS
  SELECT IDENT_ANIMAL, TO_DATE(TO_CHAR(SYSDATE+7,'DDMMYYYY')||'1600','DDMMYYYYHH24MI'),
          NUMCOLEGIADO, 'REVISION 2', DIAGNOSTICO, PRECIO
     FROM VISITAS
       WHERE IDENT_ANIMAL = 9 
          AND FH_VISITA = (SELECT MAX (FH_VISITA)
                               FROM VISITAS
                                 WHERE IDENT_ANIMAL = 9);
  
  
 
BORRAR LOS EMPLEADOS DEL DEPARTAMENTO QUE MENOS EMPLEADOS TIENE
   
  DELETE EMPLE
     WHERE DEPT_NO IN (SELECT DEPT_NO
                         FROM EMPLE
                          GROUP BY DEPT_NO
                         HAVING COUNT(*) = (SELECT MIN(COUNT(*))
                                 FROM EMPLE
                                  GROUP BY DEPT_NO));
        