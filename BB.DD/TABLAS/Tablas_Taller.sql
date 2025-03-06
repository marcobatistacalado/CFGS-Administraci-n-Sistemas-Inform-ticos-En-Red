alter session set  nls_date_format = 'dd/mm/yyyy hh24:mi';

drop table arreglos ;
DROP TABLE MECANICOS;
drop table coches_taller;
drop table clientes_taller;

Create table mecanicos
(nempleado number primary key,
nombre	varchar2(30) not null,
direccion	varchar2(30) not null,
telefono	varchar2(9),
fecha_nac	date,
fecha_ing	date,
funcion	varchar2(15));

insert into mecanicos values ( 1, 'JUAN MARTIN','SAN BENITO, 6', '614324323', '1/10/1979', '2/10/2011','MECANICO');
insert into mecanicos values ( 2, 'PABLO SEBASTIAN','JUAN MONTALVO, 3', '617509875', '24/05/1979', '2/10/2008','MECANICO');
insert into mecanicos values ( 3, 'RAMON SANCHEZ','HONTANILLA, 43', '914567686', '12/4/1983', '22/3/2008','CHAPISTA');
insert into mecanicos values ( 4, 'SERGIO RUIZ','TORRECUADRADA, 123', '612343456', '30/7/1965', '25/2/2006','CHAPISTA');
insert into mecanicos values ( 5, 'ANA ROMERO','SAN BERNARDO, 124', '614678765', '23/8/1983', '23/12/2006','LUNAS');
insert into mecanicos values ( 6, 'ESTRELLA ROMERO','SAN BERNARDO, 124', '612888727', '23/6/1987', '25/4/2006','ADMINISTRATIVA');



create table clientes_taller
(ncliente	number primary key,
nombre        	varchar2 (30),
direccion	varchar2 (30),
telefono	varchar2 (9),
fecha_alta	date );


insert into clientes_taller values 
(1, 'RAMON GOMEZ','TORRENTE, 23','623453421','1/12/2014');
insert into clientes_taller values 
(2, 'LUIS GIL','SEBASTIAN 342','614375647','24/5/2011');
insert into clientes_taller values 
(3, 'PILAR RAMIREZ','MAYOR, 324','917654343','2/3/2008');
insert into clientes_taller values
(4,'JAIME SANTIAGO', 'SAN FELIPE, 35', '613245687', '3/12/2012');
insert into clientes_taller values
(5, 'RAMIRO PEREZ','MAYOR, 15','616545454','3/2/2010');
insert into clientes_taller values
(6,'MARIA PEREZ', 'ESQUINA, 76', '912897656', '6/3/2007');

create table coches_taller
(matricula 	varchar2 (7) primary key,
modelo	 	varchar2 (20) not null,
año_matricula 	varchar2(4),
ncliente	number references clientes_taller);
 
insert into coches_taller values
('2435HHV', 'RENAULT MEGANE', '2012',4);
insert into coches_taller values
('1234JDC', 'CITROEN C3', '2015',5);
insert into coches_taller values
('4567JYN', 'SEAT LEON', '2017',1);
insert into coches_taller values
('2356JDD', 'SMART FORTWO', '2015',1);
insert into coches_taller values
('6546HVJ', 'CITROEN C3', '2014',2);
insert into coches_taller values
('6543HXS', 'AUDI A4', '2014',3);
 
create table arreglos
(matricula varchar2(7) references coches_taller,
nempleado	number references mecanicos,
fecha_entrada	date ,
fecha_salida	date,
importe	number(8,2)
);

insert into arreglos values ('6546HVJ', 2, '18/12/2019 10:00', '20/12/2019 17:00', 1000);
insert into arreglos values ('6546HVJ', 4, '13/12/2019 12:20', '04/01/2020 16:00', 3000);
insert into arreglos values ('6546HVJ', 2, '10/03/2020 09:00', '15/03/2020 10:00', 1000);
insert into arreglos values ('6546HVJ', 4, '18/03/2020 09:00', '20/03/2020 10:00', 1000);
insert into arreglos values ('2435HHV', 1, '22/07/2020 17:26', '28/07/2020 17:38', 300);
insert into arreglos values ('1234JDC', 2, '29/03/2020 14:50', '04/04/2020 10:20', 3000);
insert into arreglos values ('4567JYN', 5, '13/10/2020 10:35', NULL, 800);
insert into arreglos values ('2356JDD', 1, '10/09/2020 12:12', '20/09/2020 14:00', 300);
insert into arreglos values ('6546HVJ', 3, '11/10/2020 09:30',  NULL, 400);
insert into arreglos values ('6543HXS', 4, '11/10/2020 11:00', '14/10/2020 13:00', 350);
insert into arreglos values ('6543HXS', 4, '30/09/2020 10:00', NULL, 350);
insert into arreglos values ('2435HHV', 2, '22/05/2020 17:00', '28/05/2020 17:38', 300);
insert into arreglos values ('2435HHV', 5, '12/05/2020 17:26', '18/05/2020 17:00', 300);
insert into arreglos values ('1234JDC', 5, '08/10/2020 12:00', NULL, 250);


commit;








