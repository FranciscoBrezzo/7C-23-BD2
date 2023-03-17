 create database Gym;
 use Gym;
 
 create table Sedes(
 id int AUTO_INCREMENT primary key,
 nombre varchar(30),
 direccion varchar(30)
 );
 
  
 create table Tipo_clases(
 id int AUTO_INCREMENT primary key,
 nombre varchar(30)
 );


create table Clases(
 id int AUTO_INCREMENT primary key,
 nombre varchar(30),
 horario time,
 cupo_maximo int,
 cupo_actual int,
 id_sedes int,
 id_tipo_clases int,
 constraint foreign key (id_sedes) references Sedes(id),
 constraint foreign key (id_tipo_clases) references Tipo_clases(id)
 );
 

create table Coordinadores(
 dni int primary key,
 nombre varchar(30),
 apellido varchar(30),
 telefono int,
 id_sedes int,
 constraint foreign key (id_sedes) references Sedes(id)
);


create table Socios(
id int AUTO_INCREMENT primary key,
nombre varchar(30),
apellido varchar(30),
telefono varchar(11),
domicilio varchar(30),
edad int
);


create table Sedes_socios(
id int AUTO_INCREMENT primary key,
id_sedes int,
id_socios int,
constraint foreign key (id_sedes) references Sedes(id),
constraint foreign key (id_socios) references Socios(id)
);


create table Tipo_plan(
id int AUTO_INCREMENT primary key,
nombre varchar(30)
);


create table Sesiones(
id int AUTO_INCREMENT primary key,
nombre varchar(30)
);


create table Ejercicios(
id int AUTO_INCREMENT primary key,
ejercicios varchar(30),
repes int,
series int,
nota varchar(100),
id_sesiones int,
constraint foreign key (id_sesiones) references Sesiones(id)
);


create table Planes(
id int AUTO_INCREMENT primary key,
fecha_incio datetime,
estado bool,
duracion int,
id_sesiones int,
id_socio int,
id_tipo_planes int,
constraint foreign key (id_sesiones) references Sesiones(id),
constraint foreign key (id_socio) references Socios(id),
constraint foreign key (id_tipo_planes) references Tipo_plan(id)
);

create table Registros(
id int AUTO_INCREMENT primary key,
fecha_registro datetime,
observaciones varchar(100),
id_planes int,
constraint foreign key (id_planes) references Planes(id)
);









