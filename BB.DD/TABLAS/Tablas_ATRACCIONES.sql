drop table averias_parque ;
drop table atracciones ;
drop table zonas ;
drop table emple_parque ;

 create table emple_parque
 (dni_emple varchar2(9) PRIMARY KEY,
 Nom_Empleado varchar2(30) NOT NULL,
 Alta_empresa date  not null );
  
insert into emple_parque values
('6664321M','Ignacio Pe�a','12/10/2011');
insert into emple_parque values
('3455344J','Luis P�rez','10/05/2007');
insert into emple_parque values
('23552335I','Alvaro Mart�n','19/05/2010');
insert into emple_parque values
('11111111I','Ana Gil','19/05/2009');
insert into emple_parque values
('33333333I','Chus Sabio','10/05/2008');


create table ZONAS
(Nom_Zona varchar2(30) PRIMARY KEY,
 Dni_Encargado varchar2(9) references emple_parque,
 Presupuesto number(10,2));

insert into Zonas values
('Infantil','3455344J',40000);
insert into Zonas values
('Agua','33333333I',50000);
insert into Zonas values
('Gran Maquinaria','33333333I',12000);
insert into Zonas values
('Familiares','3455344J',21000);



 create table atracciones
 (Cod_Atraccion char(4) PRIMARY KEY,  
  Nom_Atraccion varchar2(30) ,
  Fecha_Inauguracion date,
  Capacidad number ,
  Nom_Zona varchar2(30) references Zonas );

insert into atracciones values
('A100','Los Vikingos','01/05/2006',90,'Infantil');
insert into atracciones values
('A110','Lejano Oeste','01/09/2006',80,'Infantil');
insert into atracciones values
('A120','T�o Vivo','01/05/2006',120,'Infantil');
insert into atracciones values
('A130','La Peque Monta�a','01/09/2006',60,'Infantil');
insert into atracciones values
('B100','Los R�pidos','01/05/2006',40,'Agua');
insert into atracciones values
('B110','Cataratas Locas','01/09/2006',40,'Agua');
insert into atracciones values
('C100','Drag�n Chiflado','01/05/2007',100, 'Gran Maquinaria');
insert into atracciones values
('C110','Enterprise', '01/09/2007',90,'Gran Maquinaria');
insert into atracciones values
('C120','Los 7 Picos','01/05/2012', 110,'Gran Maquinaria');
insert into atracciones values
('C130','Monta�a Rusa','01/05/2006',80, 'Gran Maquinaria');
insert into atracciones values
('C200','La Noria', '01/05/2006',40,'Familiares');
insert into atracciones values
('C210','El Ferrocarril', '01/05/2006',60,'Familiares');
insert into atracciones values
('C220','Tunel Terrorifico', '01/05/2009',70,'Familiares');


 create table averias_parque
 ( Cod_Atraccion char (4) references atracciones,
 Fecha_Falla date ,
 Fecha_Arreglo date ,
 Coste_Averia number(10,2),
 DNI_Emple varchar2(9) references emple_parque,
  constraint pk_aver  primary key (Cod_atraccion,fecha_falla));

alter session set nls_date_format = 'dd/mm/yyyy hh24:mi';
insert into averias_parque values
('A100','10/07/2021 16:30','17/09/2021 17:45',300,'6664321M');
insert into averias_parque values
('B110','10/07/2021 16:30','18/07/2021 12:00',300,'6664321M');
insert into averias_parque values
('A110','15/06/2020 16:35','17/06/2020 19:45',5000,'6664321M');
insert into averias_parque values
('A120','17/12/2020 18:30','22/02/2021 20:30',1600,'3455344J');
insert into averias_parque values
('B110','15/08/2020 18:30','16/08/2020 18:30',9000,'3455344J');
insert into averias_parque values
('C120','12/03/2021 13:30','16/03/2021 11:30',7000,'3455344J');
insert into averias_parque values
('A100','12/05/2021 11:30','15/05/2021 13:30',400,'33333333I');
insert into averias_parque values
('C100','05/10/2021 13:30',null,null,'33333333I');
insert into averias_parque values
('A110','11/09/2021 18:30',null,null,'3455344J');
insert into averias_parque values
('A100','06/09/2021 12:30',null,null,'6664321M');

COMMIT;