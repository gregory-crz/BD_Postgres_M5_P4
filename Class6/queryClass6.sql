CREATE DATABASE blog
    WITH
    OWNER = root
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_US.utf8'
    LC_CTYPE = 'en_US.utf8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

create table usuario (
	id serial primary key,
	email varchar(255) not null
);

create table post (
	id serial primary key,
	usuario_id integer not null,
	titulo varchar(255) not null,
	frcha date not null,
	foreign key (usuario_id) references usuario(id)
);

create table comentario (
	id serial primary key,
	post_id integer not null,
	usuario_id integer not null,
	texto text not null,
	fecha date not null,
	foreign key (post_id) references post(id),
	foreign key (usuario_id) references usuario(id)
);

insert into usuario(email)
values ('usuario01@hotmail.com'),
	  ('usuario02@gmail.com'),
	  ('usuario03@gmail.com'),
	  ('usuario04@hotmail.com'),
	  ('usuario05@yahoo.com'),
	  ('usuario06@hotmail.com'),
	  ('usuario07@yahoo.com'),
	  ('usuario08@yahoo.com'),
	  ('usuario09@yahoo.com');
	  
insert into post (usuario_id, titulo, frcha)
values (1, 'post 1: esto es malo', '2020-06-29'),
       (2, 'post 2: esto es malo', '2020-06-20'),
	   (3, 'post 3: esto es exelente', '2020-05-30'),
	   (4, 'post 4: esto es bueno', '2020-05-09'),
	   (5, 'post 5: esto es bueno', '2020-07-10'),
	   (6, 'post 6: esto es exelente', '2020-07-18'),
	   (7, 'post 7: esto es exelente', '2020-07-07'),
	   (5, 'post 8: esto es exelente', '2020-05-14'),
	   (2, 'post 9: esto es bueno', '2020-05-08'),
	   (6, 'post 10: esto es bueno', '2020-06-02'),
	   (4, 'post 11: esto es bueno', '2020-05-05'),
	   (9, 'post 12: esto es malo', '2020-07-23'),
	   (5, 'post 13: esto es exelente', '2020-05-30'),
	   (8, 'post 14: esto es exelente', '2020-05-01'),
	   (7, 'post 15: esto es malo', '2020-06-17');

insert into comentario (usuario_id, post_id, texto, fecha)
values (3, 6, 'Este es el comentario 1', '2020-07-08'),
       (4, 2, 'Este es el comentario 2', '2020-06-07'),
       (6, 4, 'Este es el comentario 3', '2020-06-16'),
       (2, 13, 'Este es el comentario 4', '2020-06-15'),
       (6, 6, 'Este es el comentario 5', '2020-05-14'),
       (3, 3, 'Este es el comentario 6', '2020-07-08'),
       (6, 1, 'Este es el comentario 7', '2020-05-22'),
       (6, 7, 'Este es el comentario 8', '2020-07-09'),
       (8, 13, 'Este es el comentario 9', '2020-06-30'),
       (8, 6, 'Este es el comentario 10', '2020-06-19'),
       (5, 1, 'Este es el comentario 11', '2020-05-09'),
       (8, 15, 'Este es el comentario 12', '2020-06-17'),
       (1, 9, 'Este es el comentario 13', '2020-05-01'),
       (2, 5, 'Este es el comentario 14', '2020-05-31'),
       (4, 3, 'Este es el comentario 15', '2020-06-28');
	   
-- consulas 
select email, usuario.id, titulo
from usuario
join post on usuario.id = usuario_id
where usuario.id=5;

select email, usuario.id, texto, fecha
from usuario
full join comentario on usuario.id = usuario_id
where email not like 'usuario06%';
-- falta completar esta query
select *
from usuario
full join post on usuario.id = usuario_id
where usuario_id is null or usuario.id is null;
-----------------------------------------
select *
from post 
full join comentario on post.id = post_id;

select * 
from usuario
join post on usuario.id=usuario_id
where frcha
between '2020-06-01' and '2020-06-30';