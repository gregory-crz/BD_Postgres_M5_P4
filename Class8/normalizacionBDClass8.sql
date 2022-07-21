-- normalizacion de tablas 1fn, 2fn, 3fn
begin;

create table direccion (
	id serial primary key,
	comuna varchar(255),
	sector varchar(255),
	numero integer
);

create table cliente (
	id serial primary key,
	nombre varchar(255) not null,
	rut integer not null,
	direccion_id integer,
	foreign key direccion_id references direccion(id)
);

create table directores (
	id serial primary key,
	nombre varchar(255) not null,
);

create table pelicula (
	id serial primary key,
	titulo varchar(255) not null,
	fecha_estreno date not null,
	director_id integer not null,
	foreign key director_id references director(id)
);

create table prestamo (
	id serial primary key,
	fecha_prestamo date not null,
	pelicula_id integer not null,
	cliente_id integer not null,
	foreign key pelicula_id references pelicula(id),
	foreign key cliente_id references cliente(id)	
);

create table devolucion (
	id serial primary key,
	fecha_devolucion date not null,
	pelicula_id integer not null,
	cliente_id integer not null,
	foreign key pelicula_id references pelicula(id),
	foreign key cliente_id references cliente(id)
);

end;