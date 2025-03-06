/*CREATE OR REPLACE VIEW BLABLABLA
AS SELECT *
FROM FHSFH
WHERE HFJSFS

WITH CHECK OPTION;
Al hacer un INSERT o UPDATE sobre la vista SQL comprueba que las
filas resultantes satisfagan el criterio de b�squeda de la definici�n de la vista, si no lo cumplen,
la sentencia INSERT o UPDATE falla

WITH READ ONLY;
Solo se puede hacer SELECT de las filas de la vista

FORCE;
Crea la vista aunque la tabla base no exista;
*/

/*EJERCICIO1*/
CREATE OR REPLACE VIEW VSALARIOS
AS
SELECT EMP_NO, APELLIDO, DEPT_NO, OFICIO, SALARIO, COMISION
FROM EMPLE
WHERE OFICIO <> 'PRESIDENTE';

/*EJERCICIO2*/
CREATE OR REPLACE VIEW RESUMEN_SALARIOS
AS
SELECT DEPART.DEPT_NO, DNOMBRE, SUM(SALARIO) TOTAL_SALARIO, SUM(COMISION) TOTAL_COMIS,
MAX(SALARIO) MEJOR_SALARIO, MIN(SALARIO) PEOR_SALARIO
FROM DEPART JOIN EMPLE ON EMPLE.DEPT_NO = DEPART.DEPT_NO
GROUP BY DEPART.DEPT_NO,DNOMBRE; /*HAY QUE PONER DNOMBRE PQ CUANDO VAYA A ORDENAR POR DEPT_NO EL SELECT
DE DNOMBRE NO VA A SABER SI COGER EL MAX EL MIN ETC*/

/*EJERCICIO3*/
CREATE OR REPLACE VIEW VISTA_VENDEDORES
AS
SELECT *
FROM EMPLE
WHERE OFICIO LIKE 'VENDEDOR'
WITH CHECK OPTION;

/*EJERCICIO4*/

CREATE OR REPLACE VIEW VZONAS_EMP1
AS
SELECT COD_ATRACCION, NOM_ATRACCION,TO_CHAR(FECHA_INAUGURACION,'YYYY') ANO_INAGURACION,
CAPACIDAD,ATRACCIONES.NOM_ZONA
FROM ATRACCIONES JOIN ZONAS ON ZONAS.NOM_ZONA = ATRACCIONES.NOM_ZONA
WHERE DNI_ENCARGADO LIKE '3455344J';

/*EJERCICIO5*/
CREATE OR REPLACE VIEW VFAMILIARES
AS
SELECT COD_ATRACCION, NOM_ATRACCION, FECHA_INAUGURACION, CAPACIDAD, ATRACCIONES.NOM_ZONA
FROM ATRACCIONES JOIN ZONAS ON ZONAS.NOM_ZONA = ATRACCIONES.NOM_ZONA
WHERE ZONAS.NOM_ZONA LIKE 'Familiares'
WITH CHECK OPTION;

/*EJERCICIO6*/
CREATE OR REPLACE VIEW VRESUMEN_ZONA
AS
SELECT ZONAS.NOM_ZONA,DNI_ENCARGADO, COUNT(FECHA_FALLA) AVERIAS, 
SUM(COSTE_AVERIA) SUMACOSTRES, MIN(FECHA_FALLA) PRIMERA_AVERIA, MAX(FECHA_FALLA) ULTIMA_AVERIA
FROM AVERIAS_PARQUE JOIN ZONAS ON ZONAS.DNI_ENCARGADO = AVERIAS_PARQUE.DNI_EMPLE
GROUP BY ZONAS.NOM_ZONA, DNI_ENCARGADO;






