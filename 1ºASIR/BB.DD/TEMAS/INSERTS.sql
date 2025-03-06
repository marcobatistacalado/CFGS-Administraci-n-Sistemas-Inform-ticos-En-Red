--INSERT PARA DAR DE ALTA NUEVAS FILAS EN UNA TABLA
INSERT INTO DEPART VALUES(50,'RR_HH', 'MADRID');

SELECT *
FROM DEPART;

INSERT INTO DEPART (DEPT_NO,LOC)

INSERT INTO EMPLE VALUES(8000,'PEREZ','BECARIO',NULL,SYSDATE+3, 500,NULL,20);

INSERT INTO EMPLE VALUES(MAX(EMP_NO)+1,'PEREZ','BECARIO',NULL,SYSDATE+3, 500,NULL,20);

INSERT INTO DEPART
SELECT MAX(DEPT_NO)+1,'NOVEDADES', 'MADRID'
FROM DEPART;
SELECT *
FROM DEPART;
commit; --APLICAR PERMANENTEMENTE
rollback; --BORRAR LO TEMPORAL

--Alta de un nuevo departamento que el dept_no sea el siguiente al último
--nombre de RRHH y localidad Madrid.
INSERT INTO DEPART  
  SELECT MAX(DEPT_NO) + 1, 'RRHH', 'MADRID'
    FROM DEPART;

--Dar de alta un empleado con número 8248, apellido MATA, oficio BECARIO, 
--responsable: SACA(EL Nº DE EMPLEADO DE SALA), fecha de alta HOY, salario: cuarta parte salario de SALA
--no tiene comision y el departamento el mismo de SALA
INSERT INTO EMPLE (DEPT_NO, EMP_NO, APELLIDO, OFICIO, RESPONSABLE, FECHA_ALTA, SALARIO)
  SELECT DEPT_NO, 8248, 'MATA', 'BECARIO', EMP_NO, SYSDATE, SALARIO*0.25
    FROM EMPLE
      WHERE APELLIDO LIKE 'SALA';
COMMIT;
SELECT *
  FROM EMPLE;
  
--nueva asignaturas, nombre fol, codigo el siguiente al ultimo
--mirar que codigo ha generado y dar de alta una nota de 7 para cada alumno
--en la asignatura de FOL.

INSERT INTO ASIGNATURAS (NOMBRE, COD)
  SELECT 'Fol',MAX(COD)+1
    FROM ASIGNATURAS;

SELECT * FROM ASIGNATURAS;

INSERT INTO NOTAS (DNI, COD, NOTA)
  SELECT DNI, 5, 7
    FROM ALUMNOS;

SELECT * FROM NOTAS;

--insertar un nuevo alumno con vuestros datos
--insertar para vuestro dni, con la nota media de BBDD en BBDD

INSERT INTO ALUMNOS VALUES('51495937H', 'Marco Batista', 'C/ Dolores, 2', 'Madrid', '646722855');

INSERT INTO NOTAS
SELECT '51495937H', NOTAS.COD, AVG(NOTA)
  FROM ASIGNATURAS JOIN NOTAS ON NOTAS.COD = ASIGNATURAS.COD
    WHERE NOMBRE LIKE 'BBDD'
      GROUP BY NOTAS.COD;


--UPDATE (NO JOINS SIII SUBCONSULTAS)
--modificar los valores de las columnas de una tabla

--subir 100€ a todos ls empleados
  UPDATE EMPLE
    SET SALARIO = SALARIO+100;
--subir 100€ a los empleados que son vendedor
  UPDATE EMPLE
    SET SALARIO = SALARIO+100
      WHERE OFICIO LIKE 'VENDEDOR';
--subir 100€ a los empleados del departamento contabilidad
  UPDATE EMPLE
    SET SALARIO = SALARIO+100
      WHERE DEPT_NO IN (SELECT DEPT_NO FROM DEPART WHERE DNOMBRE LIKE 'CONTABILIDAD');

--poner a Arroyo el mismo salario que tiene Sala
  UPDATE EMPLE
    SET SALARIO = (SELECT SALARIO FROM EMPLE WHERE APELLIDO LIKE 'SALA')
      WHERE APELLIDO LIKE 'ARROYO';

--SI QUIERO CAMBIAR MAS DE UN CAMPO
--poner a arroyo el oficio de sala, salario 2000, departamento 10
  UPDATE EMPLE
    SET SALARIO = 2000,
        DEPT_NO = 10,
        OFICIO = (SELECT OFICIO FROM EMPLE WHERE APELLIDO LIKE 'SALA')
      WHERE APELLIDO LIKE 'ARROYO';
--poner al empleado que menos gana el mismo salario que el que mas gana
  UPDATE EMPLE
    SET SALARIO = (SELECT MAX(SALARIO) FROM EMPLE)
  WHERE SALARIO = (SELECT MIN(SALARIO) FROM EMPLE);

--DELETE
--borra todos los empleados
DELETE EMPLE;
--borra todos los emplados del departamento 30
DELETE EMPLE
  WHERE DEPT_NO=30; 
--borrar todos los empleados que no son de madrid
DELETE EMPLE
  WHERE DEPT_NO IN (SELECT DEPT_NO FROM DEPART WHERE LOC NOT LIKE 'MADRID');
--borrar los departamentos que no tienen empleados**
DELETE DEPART
  WHERE DEPT_NO NOT IN (SELECT DEPT_NO FROM EMPLE);


--INTENTAR BORRAR EL DEPARTAMENTO 30
DELETE DEPART
  WHERE DEPT_NO =10; --salta el error por FK

--1º Borrar los empleados del departamento de VENTAS
DELETE EMPLE
  WHERE DEPT_NO IN (SELECT DEPT_NO 
                      FROM DEPART
                        WHERE DNOMBRE LIKE 'VENTAS');
--2ºBorrar el departamento de VENTAS
DELETE DEPART 
  WHERE DNOMBRE = 'VENTAS';

ROLLBACK;
