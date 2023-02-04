--- Modelo normalizado ---


create schema keepcodingvehiculos authorization pyfrgaxt;

--- 1. Vehiculos y sus tablas de referencias

--Tabla vehiculos
create table keepcodingvehiculos.vehiculos(
	id_coche varchar(20) not null, --PK
	id_modelo varchar(20) not null, --FK
	id_color varchar(20) not null, --FK
	matricula varchar(100) not null,
	kms_total varchar(100) not null,
	fecha_compra date not null,
	id_aseguradora varchar(20) not null, --FK
	fecha_baja date null 

);

--PK
alter table keepcodingvehiculos.vehiculos
add constraint vehiculos_PK primary key (id_coche);



--Tabla color
create table keepcodingvehiculos.colores(
	id_color varchar(20) not null, --PK
	nombre_color varchar(200) not null
);
	
--PK
alter table keepcodingvehiculos.colores
add constraint colores_PK primary key (id_color);



--Tabla modelos
create table keepcodingvehiculos.modelos(
	id_modelo varchar(20) not null, --PK
	nombre_modelo varchar(200) not null,
	id_marca varchar(20) not null --FK
);

--PK
alter table keepcodingvehiculos.modelos
add constraint modelos_PK primary key (id_modelo);



--Tabla marcas
create table keepcodingvehiculos.marcas(
	id_marca varchar(20) not null, --PK
	nombre_marca varchar(200) not null,
	id_grupo varchar(20) not null --FK
);

--PK
alter table keepcodingvehiculos.marcas
add constraint marcas_PK primary key (id_marca);



--Tabla Grupos
create table keepcodingvehiculos.grupos(
	id_grupo varchar(20) not null, --PK
	nombre_grupo varchar(200) not null
);

--PK
alter table keepcodingvehiculos.grupos
add constraint grupos_PK primary key (id_grupo);



--Tabla revisión vehículos
create table keepcodingvehiculos.revisiones(
	id_revision varchar(20) not null, --PK,FK
	id_coche varchar(20) not null, --PK
	kms_revision varchar(200) not null,
	fecha_revision date not null,
	importe integer not null,
	id_moneda varchar(20) not null --FK
	
); 

--PK
alter table keepcodingvehiculos.revisiones
add constraint revisiones_PK primary key (id_revision , id_coche);



--Tabla monedas
create table keepcodingvehiculos.monedas(
	id_moneda varchar(20) not null, --PK
	nombre_moneda varchar(200) not null
);

--PK
alter table keepcodingvehiculos.monedas
add constraint monedas_PK primary key (id_moneda);



--Tabla Aseguradoras
create table keepcodingvehiculos.aseguradoras(
	id_aseguradora varchar(20) not null, --PK
	nombre_aseguradora varchar(200) not null,
	id_poliza varchar(20) not null --FK
);

--PK
alter table keepcodingvehiculos.aseguradoras
add constraint aseguradoras_PK primary key (id_aseguradora);



--Tabla poliza
create table keepcodingvehiculos.polizas(
	id_poliza varchar(20) not null, --PK
	numero_poliza varchar(100) not null
);

--PK
alter table keepcodingvehiculos.polizas
add constraint polizas_PK primary key (id_poliza);



-----------FK-----------
alter table keepcodingvehiculos.vehiculos 
add constraint vehiculo_colores_FK foreign key (id_color)
references keepcodingvehiculos.colores(id_color);

alter table keepcodingvehiculos.vehiculos 
add constraint vehiculo_modelos_FK foreign key (id_modelo)
references keepcodingvehiculos.modelos(id_modelo);

alter table keepcodingvehiculos.vehiculos 
add constraint vehiculo_aseguradoras_FK foreign key (id_aseguradora)
references keepcodingvehiculos.aseguradoras(id_aseguradora);

alter table keepcodingvehiculos.modelos
add constraint vehiculo_marcas_FK foreign key (id_marca)
references keepcodingvehiculos.marcas(id_marca);

alter table keepcodingvehiculos.marcas
add constraint vehiculo_grupos_FK foreign key (id_grupo)
references keepcodingvehiculos.grupos(id_grupo);

alter table keepcodingvehiculos.revisiones  
add constraint vehiculo_vehiculos_FK foreign key (id_coche)
references keepcodingvehiculos.vehiculos(id_coche);

alter table keepcodingvehiculos.revisiones 
add constraint revisiones_monedas_FK foreign key (id_moneda)
references keepcodingvehiculos.monedas(id_moneda);

alter table keepcodingvehiculos.aseguradoras
add constraint vehiculo_polizas_FK foreign key (id_poliza)
references keepcodingvehiculos.polizas(id_poliza);



-- Cargar los datos colores --
insert into keepcodingvehiculos.colores 
(id_color, nombre_color)
values('0001','Negro');

insert into keepcodingvehiculos.colores 
(id_color, nombre_color)
values('0002','Azul');

insert into keepcodingvehiculos.colores 
(id_color, nombre_color)
values('0003','Verde');

insert into keepcodingvehiculos.colores 
(id_color, nombre_color)
values('0004','Gris');

insert into keepcodingvehiculos.colores 
(id_color, nombre_color)
values('0005','Blanco');

insert into keepcodingvehiculos.colores 
(id_color, nombre_color)
values('0006','Rojo');



-- Cargar los datos grupos --
insert into keepcodingvehiculos.grupos
(id_grupo, nombre_grupo)
values('0001','Volkswagen');

insert into keepcodingvehiculos.grupos
(id_grupo, nombre_grupo)
values('0002','Stellantis');

insert into keepcodingvehiculos.grupos
(id_grupo, nombre_grupo)
values('0003','Bmw Group');

insert into keepcodingvehiculos.grupos
(id_grupo, nombre_grupo)
values('0004','Tata');

insert into keepcodingvehiculos.grupos
(id_grupo, nombre_grupo)
values('0005','Toyota Group');

insert into keepcodingvehiculos.grupos
(id_grupo, nombre_grupo)
values('0006','General Motors');



-- Cargar los datos marcas --
insert into keepcodingvehiculos.marcas
(id_marca, nombre_marca,id_grupo)
values('0001','Audi','0001');

insert into keepcodingvehiculos.marcas
(id_marca, nombre_marca,id_grupo)
values('0002','Citroen','0002');

insert into keepcodingvehiculos.marcas
(id_marca, nombre_marca,id_grupo)
values('0003','Mini','0003');

insert into keepcodingvehiculos.marcas
(id_marca, nombre_marca,id_grupo)
values('0004','Jaguar','0004');

insert into keepcodingvehiculos.marcas
(id_marca, nombre_marca,id_grupo)
values('0005','Lexus','0005');

insert into keepcodingvehiculos.marcas
(id_marca, nombre_marca,id_grupo)
values('0006','Chevrolet','0006');



-- Cargar los datos modelos --
insert into keepcodingvehiculos.modelos 
(id_modelo, nombre_modelo,id_marca)
values('0001','A4','0001');

insert into keepcodingvehiculos.modelos
(id_modelo, nombre_modelo,id_marca)
values('0002','Ds5','0002');

insert into keepcodingvehiculos.modelos
(id_modelo, nombre_modelo,id_marca)
values('0003','CouperS','0003');

insert into keepcodingvehiculos.modelos
(id_modelo, nombre_modelo,id_marca)
values('0004','FPace','0004');

insert into keepcodingvehiculos.modelos
(id_modelo, nombre_modelo,id_marca)
values('0005','Nx','0005');

insert into keepcodingvehiculos.modelos
(id_modelo, nombre_modelo,id_marca)
values('0006','Camaro','0006');

insert into keepcodingvehiculos.modelos
(id_modelo, nombre_modelo,id_marca)
values('0007','Q7','0001');

insert into keepcodingvehiculos.modelos
(id_modelo, nombre_modelo,id_marca)
values('0008','Berlingo','0002');

insert into keepcodingvehiculos.modelos
(id_modelo, nombre_modelo,id_marca)
values('0009','X4','0003');



-- Cargar los datos Polizas --
insert into keepcodingvehiculos.polizas  
(id_poliza, numero_poliza)
values('0001','T0D0R1ESG0');

insert into keepcodingvehiculos.polizas  
(id_poliza, numero_poliza)
values('0002','FR4NQU1C14');

insert into keepcodingvehiculos.polizas  
(id_poliza, numero_poliza)
values('0003','T3RC3R0S');



-- Cargar los datos Aseguradoras --
insert into keepcodingvehiculos.aseguradoras  
(id_aseguradora, nombre_aseguradora, id_poliza)
values('0001','MAPFRE', '0001');

insert into keepcodingvehiculos.aseguradoras  
(id_aseguradora, nombre_aseguradora, id_poliza)
values('0002','MTT', '0002');

insert into keepcodingvehiculos.aseguradoras  
(id_aseguradora, nombre_aseguradora, id_poliza)
values('0003','AXA', '0003');



-- Cargar los datos Vehículos --
insert into keepcodingvehiculos.vehiculos  
(id_coche, id_modelo, id_color, matricula, kms_total, fecha_compra, id_aseguradora)
values('0001','0002', '0003', '4045BBH','155600','07/20/2010','0003');

insert into keepcodingvehiculos.vehiculos  
(id_coche, id_modelo, id_color, matricula, kms_total, fecha_compra, id_aseguradora)
values('0002','0001', '0002', '9100HFB','75600','01/01/2012','0002');

insert into keepcodingvehiculos.vehiculos  
(id_coche, id_modelo, id_color, matricula, kms_total, fecha_compra, id_aseguradora)
values('0003','0003', '0001', '8153KKH','50600','11/26/2018','0001');

insert into keepcodingvehiculos.vehiculos  
(id_coche, id_modelo, id_color, matricula, kms_total, fecha_compra, id_aseguradora)
values('0004','0005', '0004', '8845LLH','5600','01/10/2022','0001');

insert into keepcodingvehiculos.vehiculos  
(id_coche, id_modelo, id_color, matricula, kms_total, fecha_compra, id_aseguradora, fecha_baja)
values('0005','0004', '0005', '6300JBH','105800','07/01/2015','0002','01/01/2023');

insert into keepcodingvehiculos.vehiculos  
(id_coche, id_modelo, id_color, matricula, kms_total, fecha_compra, id_aseguradora)
values('0006','0006', '0006', '3377LLH','9600','04/11/2022','0001');

insert into keepcodingvehiculos.vehiculos  
(id_coche, id_modelo, id_color, matricula, kms_total, fecha_compra, id_aseguradora)
values('0007','0007', '0001', '3377JTH','69600','01/01/2016','0001');

insert into keepcodingvehiculos.vehiculos  
(id_coche, id_modelo, id_color, matricula, kms_total, fecha_compra, id_aseguradora)
values('0008','0008', '0003', '4117DTH','120600','04/11/2010','0002');

insert into keepcodingvehiculos.vehiculos  
(id_coche, id_modelo, id_color, matricula, kms_total, fecha_compra, id_aseguradora)
values('0009','0008', '0004', '5566LXH','7600','07/28/2022','0003');



-- Cargar los datos Monedas --
insert into keepcodingvehiculos.monedas 
(id_moneda, nombre_moneda)
values('0001','EUR');

insert into keepcodingvehiculos.monedas   
(id_moneda, nombre_moneda)
values('0002','DOLAR');

insert into keepcodingvehiculos.monedas   
(id_moneda, nombre_moneda)
values('0003','LIBRA');



-- Cargar los datos Revisiones --
insert into keepcodingvehiculos.revisiones  
(id_coche, id_revision, kms_revision, fecha_revision, importe, id_moneda)
values('0001','0001','150000','12/07/2022','300','0001');

insert into keepcodingvehiculos.revisiones  
(id_coche, id_revision, kms_revision, fecha_revision, importe, id_moneda)
values('0002','0002','60000','09/30/2022','400','0001');

insert into keepcodingvehiculos.revisiones  
(id_coche, id_revision, kms_revision, fecha_revision, importe, id_moneda)
values('0003','0003','30000','03/11/2022','350','0002');

insert into keepcodingvehiculos.revisiones  
(id_coche, id_revision, kms_revision, fecha_revision, importe, id_moneda)
values('0005','0004','90000','10/26/2022','250','0003');

insert into keepcodingvehiculos.revisiones  
(id_coche, id_revision, kms_revision, fecha_revision, importe, id_moneda)
values('0007','0005','60000','11/15/2022','350','0003');

insert into keepcodingvehiculos.revisiones  
(id_coche, id_revision, kms_revision, fecha_revision, importe, id_moneda)
values('0008','0006','120000','12/03/2022','250','0003');


