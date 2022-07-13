drop table if exists departamentos;
create table departamentos (
	id_depa serial primary key,
	nombre varchar(255) not null
);

drop table if exists locales;
create table locales (
	id_local serial primary key,
	nombre varchar(255) not null,
	departamento_id integer not null,
	foreign key (departamento_id) references departamentos(id_depa)
);

drop table if exists proyectos;
create table proyectos (
	id_proyecto serial primary key,
	nombre varchar(255) not null,
	departamento_id integer not null,
	local_id integer not null,
	foreign key (departamento_id) references departamentos(id_depa),
	foreign key (local_id) references locales(id_local)
);
drop table if exists cargoempleado;
create table cargoempleado (
	cargo varchar(100) not null primary key,
	fechaingreso date not null,
	departamento_id integer not null,
	foreign key (departamento_id) references departamentos(id_depa)
);
drop table if exists empleados;
create table empleados (
	rut varchar(12) not null primary key,
	nombre varchar(100) not null,
	direccion varchar(255) not null,
	salario varchar(255) not null,
	sexo char,
	anonacimiento integer,
	cargoempleado_cargo varchar(100),
	foreign key (cargoempleado_cargo) references cargoempleado(cargo)
);
drop table if exists proyec_empleado;
create table proyec_empleado(
	id serial primary key,
	empleado_rut varchar(12),
	proyectos_id integer,
	foreign key (empleado_rut) references empleados(rut),
	foreign key (proyectos_id) references proyectos(id_proyecto)
);