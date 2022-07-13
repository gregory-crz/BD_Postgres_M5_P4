drop table if exists usuarios;

create table usuarios (
	email varchar(20) primary key not null,
	password varchar(255) not null,
	name varchar(100) not null
);

drop table if exists post;

create table post (
	id serial primary key,
	fecha date not null default now(),
	hora time not null default now(),
	contenido text not null,
	usuario_email varchar(20) not null,
	foreign key (usuario_email) references usuarios(email)
);

drop table if exists comentarios;

create table comentarios (
	id serial primary key,
	fecha date not null default now(),
	hora time not null default now(),
	contenido text not null,
	usuario_email varchar(20) not null,
	post_id integer not null,
	foreign key (usuario_email) references usuarios(email),
	foreign key (post_id) references post(id)
);