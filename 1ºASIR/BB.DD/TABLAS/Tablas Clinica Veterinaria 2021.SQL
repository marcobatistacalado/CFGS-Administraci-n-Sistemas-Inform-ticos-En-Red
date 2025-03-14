alter session set nls_date_format ='dd/mm/yyyy hh24:mi';
drop table visitas;
drop table animales;
drop table due�os;
drop table veterinarios;
create table due�os
(dni varchar2(9) primary key,
 nombre varchar2(30),
 direccion varchar2(35),
 tfno_contacto number(9),
 alta_clinica varchar(7),
 cuota_mensual char(1));

create table animales
(ident_animal number primary key,
 nombre varchar2(30),
 especie varchar2(20),
 raza varchar2(20),
 fecha_nacimiento date,
 peso number (5,2),
 sexo char(1),
 dni_due�o varchar2(9));

create table veterinarios
(numcolegiado number primary key,
 nombre varchar(20),
telefono number(9));

create table visitas
(ident_animal number references animales,
 fh_visita date,
numcolegiado number references veterinarios,
 Motivo varchar(30), 
 Diagnostico varchar(30),
 precio number(*,2),
 constraint pk_visitas primary key (ident_animal, fh_visita)
);

insert into due�os values ('221221P','Angel Manzano','c/Estaci�n 9',623453456,'10-2015','S');
insert into due�os values ('342545L','Nuria Aguilera','c/Estrecho 49',661221125,'11-2015','S');
insert into due�os values ('132123K','Luc�a G�mez','c/Estaci�n 19',637178989,'11-2015','N');
insert into due�os values ('231239S','Antonio Pedrosa','c/Illescas 176',613154664,'01-2017','N');
insert into due�os values ('231121J','Esther Flores','c/Maderuelo 20',618908998,'02-2017','N');
insert into due�os values ('453445J','Maria Carrasco','c/Estrecho 23',671232342,'03-2017','N');
insert into due�os values ('323422H','Alba Carrillo',null,null,'01-2021','N');

 
insert into animales values (1,'JUK','PERRO','Affenpinscher','11/10/2016',10,'M','221221P');
insert into animales values (2,'SOL','PERRO','Affenpinscher','21/06/2013',15,'M','132123K');
insert into animales values (3,'JAS','PERRO','Alaskan Malamute','16/02/2018',35,'M','342545L');
insert into animales values (4,'GRESCA','PERRO','Boxer','17/10/2014',20,'H','231239S');
insert into animales values (5,'TRIT�N','PERRO','Dobermann','01/01/2017',40,'H','132123K');
insert into animales values (6,'CHUSCHUS','GATO','Persa','12/12/2014',6,'M','231121J');
insert into animales values (7,'FILOMENA','GATO','Abisinio','14/02/2017',10,'H','132123K');
insert into animales values (8,'GRESCA','GATO','Abisinio','14/02/2018',12,'H','231121J');
insert into animales values (9,'PITBULL','GATO',null,'19/02/2021',6,'H','323422H');

insert into veterinarios values (1234,'ANA GIL', 686145232);
insert into veterinarios values (3443,'ELENA MORAGA', 686989766);
insert into veterinarios values (3888,'MARIA ELENA RUIZ', 626912436);

insert into visitas values (1,'02/01/2021 10:30',1234,'VACUNA','OK' ,20);
insert into visitas values (2,'5/1/2021 12:30',1234,'REVISION',NULL,20);
insert into visitas values (1,'5/1/2021 12:30',3443,'FIEBRE',NULL,20);
insert into visitas values (1,'23/1/2021 17:40',3443,'GASTRITIS',NULL,30);
insert into visitas values (3,'26/1/2021 13:00',1234,'VACUNA','OK',22);
insert into visitas values (4,'23/1/2021 9:45',3443,'REVISION','OK',20);
insert into visitas values (5,'2/2/2021 18:35',3443,'DENTADURA','VOLVER PARA LIMPIEZA',45);
insert into visitas values (4,'12/2/2021 12:45',3443,'PARASITOS','REVISAR EN UN MES',25);
insert into visitas values (5,'16/2/2021 11:30',1234,'VACUNA','OK',20);
insert into visitas values (6,'24/2/2021 18:30',3443,'REVISION',NULL,20);
insert into visitas values (2,'27/2/2021 19:20',3443,'VACUNA','OK',20);
insert into visitas values (7,'2/3/2021 19:20',1234,'VISITA',NULL,25);
insert into visitas values (1,'2/3/2021 09:30',1234,'GASTRITIS',NULL,30);
insert into visitas values (2,'5/3/2021 17:30',3443,'DOLORES','ECOGRAF�A',24);
insert into visitas values (5,'5/3/2021 10:30',1234,'NO COME',NULL,25);
insert into visitas values (2,'16/3/2021 17:30',3443,'GASTRITIS',NULL,24);
insert into visitas values (5,'16/3/2021 10:30',1234,'VACUNA','OK',25);
insert into visitas values (4,'16/3/2021 12:30',1234,'VACUNA','OK',25);
insert into visitas values (8,'11/3/2021 16:00',1234,'REVISION',NULL,25);
insert into visitas values (6,'11/5/2021 16:00',1234,'OTITIS','VOLVER EN TRES MESES',25);
insert into visitas values (2,'11/5/2021 16:00',3443,'REVISION',NULL,25);

commit;