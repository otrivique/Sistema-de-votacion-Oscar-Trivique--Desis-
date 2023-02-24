-- Database: Oscar_Trivique

-- DROP DATABASE IF EXISTS "Oscar_Trivique";

CREATE DATABASE "Oscar_Trivique"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Spanish_Chile.1252'
    LC_CTYPE = 'Spanish_Chile.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;
	
	
	
	
	
CREATE TABLE region (
	id_region INT primary key,
	nombre_region varchar(50)
);

insert into region (id_region, nombre_region) values(1, 'Arica y Parinacota');
insert into region (id_region, nombre_region) values(2, 'Antofagasta');
insert into region (id_region, nombre_region) values(3, 'Maule');
insert into region (id_region, nombre_region) values(4, 'Metropolitana de Santiago');



CREATE TABLE comuna (
	id_comuna INT primary key,
	nombre_comuna varchar(50),
	id_region INT
);

ALTER TABLE comuna
ADD CONSTRAINT comuna_fk_region
FOREIGN KEY (id_region) REFERENCES region(id_region);
	
INSERT INTO comuna (id_comuna, nombre_comuna, id_region) VALUES (1,'Camarones',1);
INSERT INTO comuna (id_comuna, nombre_comuna, id_region) VALUES (2,'Putre',1);
INSERT INTO comuna (id_comuna, nombre_comuna, id_region) VALUES (3,'Mejillones',2);
INSERT INTO comuna (id_comuna, nombre_comuna, id_region) VALUES (4,'Calama',2);
INSERT INTO comuna (id_comuna, nombre_comuna, id_region) VALUES (5,'Tocopilla',2);
INSERT INTO comuna (id_comuna, nombre_comuna, id_region) VALUES (6,'Chanco',3);
INSERT INTO comuna (id_comuna, nombre_comuna, id_region) VALUES (7,'Curepto',3);
INSERT INTO comuna (id_comuna, nombre_comuna, id_region) VALUES (8,'Linares',3);
INSERT INTO comuna (id_comuna, nombre_comuna, id_region) VALUES (9,'Penalolen',4);
INSERT INTO comuna (id_comuna, nombre_comuna, id_region) VALUES (10,'La florida',4);
INSERT INTO comuna (id_comuna, nombre_comuna, id_region) VALUES (11,'Maipu',4);
INSERT INTO comuna (id_comuna, nombre_comuna, id_region) VALUES (12,'Providencia',4);




CREATE TABLE candidato (
	id_candidato INT primary key,
	nombre_candidato varchar(50),
	id_comuna INT
);


ALTER TABLE candidato
ADD CONSTRAINT condidato_fk_comuna
FOREIGN KEY (id_comuna) REFERENCES comuna(id_comuna);



INSERT INTO candidato (id_candidato, nombre_candidato, id_comuna) VALUES (1,'Juan Riquelme',1);
INSERT INTO candidato (id_candidato, nombre_candidato, id_comuna) VALUES (2,'Agustin palma',1);
INSERT INTO candidato (id_candidato, nombre_candidato, id_comuna) VALUES (3,'Francisca Quevedo',2);
INSERT INTO candidato (id_candidato, nombre_candidato, id_comuna) VALUES (4,'Maria Juana',2);
INSERT INTO candidato (id_candidato, nombre_candidato, id_comuna) VALUES (5,'Usvaldo Rozas',2);
INSERT INTO candidato (id_candidato, nombre_candidato, id_comuna) VALUES (6,'Natalia Parra',3);
INSERT INTO candidato (id_candidato, nombre_candidato, id_comuna) VALUES (7,'Alejandro Villa',3);
INSERT INTO candidato (id_candidato, nombre_candidato, id_comuna) VALUES (8,'Jaime Guzman',4);
INSERT INTO candidato (id_candidato, nombre_candidato, id_comuna) VALUES (9,'Albert Maldonado',4);
INSERT INTO candidato (id_candidato, nombre_candidato, id_comuna) VALUES (10,'Alexis Sanchez',5);
INSERT INTO candidato (id_candidato, nombre_candidato, id_comuna) VALUES (11,'Arturo Vidal',5);
INSERT INTO candidato (id_candidato, nombre_candidato, id_comuna) VALUES (12,'Javiera Munoz',6);
INSERT INTO candidato (id_candidato, nombre_candidato, id_comuna) VALUES (13,'Ruben Aguilar',6);
INSERT INTO candidato (id_candidato, nombre_candidato, id_comuna) VALUES (14,'Matias Vergara',6);
INSERT INTO candidato (id_candidato, nombre_candidato, id_comuna) VALUES (15,'Benjamin Almonacid',7);
INSERT INTO candidato (id_candidato, nombre_candidato, id_comuna) VALUES (16,'Matilde Moralez',7);
INSERT INTO candidato (id_candidato, nombre_candidato, id_comuna) VALUES (17,'Juan Perez',8);
INSERT INTO candidato (id_candidato, nombre_candidato, id_comuna) VALUES (18,'Roman Hernandez',8);
INSERT INTO candidato (id_candidato, nombre_candidato, id_comuna) VALUES (19,'Oscar trivique',9);
INSERT INTO candidato (id_candidato, nombre_candidato, id_comuna) VALUES (20,'Vania Navarrete',9);
INSERT INTO candidato (id_candidato, nombre_candidato, id_comuna) VALUES (21,'Francesco Herrera',9);
INSERT INTO candidato (id_candidato, nombre_candidato, id_comuna) VALUES (22,'Anita Munoz',10);
INSERT INTO candidato (id_candidato, nombre_candidato, id_comuna) VALUES (23,'Arturo Munoz',10);
INSERT INTO candidato (id_candidato, nombre_candidato, id_comuna) VALUES (24,'Cris Mj',11);
INSERT INTO candidato (id_candidato, nombre_candidato, id_comuna) VALUES (25,'Austin Santos',11);
INSERT INTO candidato (id_candidato, nombre_candidato, id_comuna) VALUES (26,'Eusebio Lillo',12);
INSERT INTO candidato (id_candidato, nombre_candidato, id_comuna) VALUES (27,'Marcela Gutierrez',12);
INSERT INTO candidato (id_candidato, nombre_candidato, id_comuna) VALUES (28,'Daniela Gonzalez',12);



CREATE TABLE votante(
	rut varchar(50) primary key,
	nombre varchar(50),
	apellido varchar(50),
	alia varchar(50),
	email varchar(50),
	id_candidato INT,
	web boolean NOT NULL,
	tv boolean NOT NULL,
	redes boolean NOT NULL,
	amigo boolean NOT NULL
);


ALTER TABLE votante
ADD CONSTRAINT votante_fk_candidato
FOREIGN KEY (id_candidato) REFERENCES candidato(id_candidato);

















	