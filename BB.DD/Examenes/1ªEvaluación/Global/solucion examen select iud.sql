1------------------------------------------------------------------

SELECT IDENT_ANIMAL || '-' || RAZA ||
        '(' || SUBSTR(ESPECIE,1,3) ||')', 
       TO_CHAR(FECHA_NACIMIENTO,'MONTH-YYYY'),
        SUBSTR(TFNO_CONTACTO,1,3) || '***' ||
        SUBSTR(TFNO_CONTACTO,7,3)
FROM ANIMALES A,DUEÑOS D
WHERE A.DNI_DUEÑO= D.DNI
ORDER BY TO_CHAR(FECHA_NACIMIENTO,'YYYY'),RAZA;

2------------------------------------------------------------------


SELECT TRUNC(SYSDATE-FH_VISITA) DIAS,
       A.NOMBRE, V.NOMBRE, TO_CHAR(FH_VISITA,'DAY')
FROM VISITAS T,VETERINARIOS V, ANIMALES A
WHERE T.IDENT_ANIMAL = A.IDENT_ANIMAL
  AND T.NUMCOLEGIADO = V.NUMCOLEGIADO
  AND TO_CHAR(FH_VISITA,'HH24')<15
  AND ( MOTIVO = 'REVISION'
        OR MOTIVO = 'GASTRITIS'
          OR MOTIVO ='VACUNA' );

--  AND   MOTIVO IN ('REVISION','GASTRITIS','VACUNA' );

3------------------------------------------------------------------

--Lo hago en dos partes, para verlo mejor
SELECT DNI, D.NOMBRE, COUNT(*)
   FROM ANIMALES A, DUEÑOS D
    WHERE A.DNI_DUEÑO = D.DNI
      AND ESPECIE ='PERRO'
   GROUP BY DNI,D.NOMBRE;

SELECT DNI, D.NOMBRE, COUNT(*)
   FROM ANIMALES A, DUEÑOS D
    WHERE A.DNI_DUEÑO = D.DNI
      AND ESPECIE ='PERRO'
   GROUP BY DNI,D.NOMBRE
    HAVING COUNT(*) = (SELECT MAX(COUNT(*))
			FROM ANIMALES A, DUEÑOS D
			    WHERE A.DNI_DUEÑO = D.DNI
			      AND ESPECIE ='PERRO'
			   GROUP BY DNI,D.NOMBRE);


 

4------------------------------------------------------------------

SELECT A.NOMBRE,COUNT (*),MIN(FH_VISITA),MAX(FH_VISITA),
       SUM(PRECIO),COUNT(DISTINCT(MOTIVO))
  FROM ANIMALES A, VISITAS V
    WHERE A.IDENT_ANIMAL = V.IDENT_ANIMAL
      AND ESPECIE = 'GATO'
   GROUP BY A.NOMBRE;


5------------------------------------------------------------------


INSERT INTO VISITAS
    SELECT IDENT_ANIMAL,
    TO_DATE('1001'||(TO_CHAR(SYSDATE,'YYYY')+1)||'1000',
             'DDMMYYYYHH24MI')
 --   TO_DATE('10/01/'||(TO_CHAR(SYSDATE,'YYYY')+1)||' 10:00',
 --            'DD/MM/YYYY HH24:MI'),
      ,3443,'REVISION',NULL,NULL
FROM ANIMALES
WHERE ESPECIE = 'PERRO'
AND NOMBRE ='GRESCA';

6------------------------------------------------------------------

A)

INSERT INTO VETERINARIOS
   SELECT 4466,'ESTHER FLORES',DUEÑOS.TFNO_CONTACTO
     FROM DUEÑOS 
     WHERE NOMBRE LIKE 'Esther%';



B)
UPDATE ANIMALES
SET DNI_DUEÑO = (SELECT DNI
                   FROM DUEÑOS
                   WHERE NOMBRE LIKE 'Esther%')
WHERE NOMBRE LIKE 'GRESCA'
    AND ESPECIE = 'PERRO';

7------------------------------------------------------------------

A)
DELETE VISITAS
WHERE TO_CHAR(FH_VISITA,'MM')=01
  AND TO_CHAR(FH_VISITA,'YYYY')= TO_CHAR(SYSDATE,'YYYY')
  AND IDENT_ANIMAL IN (SELECT IDENT_ANIMAL
                     FROM ANIMALES
                      WHERE ESPECIE = 'PERRO');
 
B)

DELETE ANIMALES
WHERE IDENT_ANIMAL NOT IN (SELECT IDENT_ANIMAL
                          FROM VISITAS)
  AND ESPECIE LIKE 'PERRO';

