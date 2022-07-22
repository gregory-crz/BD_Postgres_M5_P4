create table direcciones (
	id serial primary key,
	comuna varchar(255),
	calle varchar(255),
	numero integer
);

create table socios (
	id serial primary key,
	rut varchar(13) not null,
	nombre varchar(255) not null,
	apellido varchar(255) not null,
	telefono integer,
	direccion_id integer not null,
	foreign key (direccion_id) references direcciones(id)
);

create table autores (
	id serial primary key,
	nombre varchar(255) not null,
	apellido varchar(255) not null,
	nacimiento date not null,
	muerte date
);

create table libros(
    id serial primary key,
    isbn varchar(255) not null unique,
    titulo varchar(255) not null,
    paginas int not null,
    dia_prestamo int not null
);

create table autores_libros(
    autor_id int not null,
    libro_id int not null, 
    tipo_autor varchar(255) not null,
    foreign key (autor_id) references autores (id),
    foreign key (libro_id) references libros(id),
    primary key(autor_id,libro_id)
    
    
);

create table prestamos (
	id serial primary key,
	socio_id integer not null,
	libro_id integer not null,
	fecha_prestamo date not null,
	fecha_devolucion date,
	foreign key (socio_id) references socios(id),
	foreign key (libro_id) references libros(id)
);

insert into direcciones (comuna, calle, numero)
values ('santiago', 'avenida', 1),
       ('santiago', 'pasaje', 2),
	   ('santiago', 'avenida', 2),
	   ('santiago', 'avenida', 3),
	   ('santiago', 'pasaje', 3);
       
insert into socios (rut,nombre,apellido,telefono,direccion_id)
values ( '1111111-1', 'JUAN', 'SOTO',911111111, 1 ),
       ( '2222222-2', 'ANA','PEREZ', 922222222, 2),
       ('3333333-3','SANDRA','AGUILAR',933333333,3),
       ('4444444-4', 'ESTEBAN','JEREZ',944444444,4),
       ('5555555-5', 'SILVANA','MUÑOZ',955555555,5);
       
insert into libros(isbn,titulo,paginas,dia_prestamo)
values ( '111-1111111-111','Cuentos de terror', 344,7),
       ( '222-2222222-222','Poesias contemporáneas', 167,7),
       ( '333-3333333-333','Historias de Asia', 511,14),
       ( '444-4444444-444','Manual de mecánica', 298,14);
       
insert into autores (nombre, apellido, nacimiento,muerte)
values ('jose','salgado','1968-01-01','2020-02-02'),
       ('ana','salgado','1972-01-01', NULL),
	   ('andres','ulloa','1982-01-01',NULL),
	   ('sergio','mardones','1950-01-01', '2012-02-02'),
	   ('martin','porta','1976-01-01',NULL);

insert into autores_libros(autor_id,libro_id,tipo_autor)
values ( 1,1,'principal'),
       ( 2,1, 'coautor'),
       (3,2,'principal'),
       (4,3,'principal'),
       (5,4,'principal');

insert into prestamos(socio_id,libro_id,fecha_prestamo,fecha_devolucion)
values (1,1,'2020-01-20','2020-01-27'),
       (5,2,'2020-01-20','2020-01-30'),
       (3,3,'2020-01-22','2020-01-30'),
       (4,4,'2020-01-23','2020-01-30'),
       (2,1,'2020-02-27','2020-02-04'),
       (1,4,'2020-01-31','2020-02-12'),
       (3,2,'2020-01-31','2020-02-12');
       
       
  --consultas
  
 select * 
 from libros
 where paginas < 300;
 
 --mostrar autores que hayan nacido después de 1970
 
 select *
 from autores
 where nacimiento > '1970-01-01';
 
 --libro más solicitado
 
 select titulo 
 from libros
 JOIN prestamos on libros.id=libro_id
 group by titulo
 having count(libro_id) > 1;
 
 --mostrar cuanto deberia pagar cada usuario que entregue el prestamo después de 7 días
 
 select date_part('day', age(fecha_prestamo, fecha_devolucion))as dias_prestado, nombre, apellido
 from socios 
 join prestamos on socios.id=socio_id; 
 
 
 
 
 
 
 
 
 
 
 
 
  
       














