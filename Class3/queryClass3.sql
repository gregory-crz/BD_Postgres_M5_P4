BEGIN;
-- query 2
drop table if exists post;
create table post (
	id serial primary key,
	nombre_usuario varchar(255) not null,
	fecha_creacion date not null,
	contenido text not null,
	descripcion varchar(255) not null
);
-- query 3
insert into post (nombre_usuario, fecha_creacion, contenido, descripcion) 
values ('pamela', '2022-06-15', 'nose que paso tu no eres asi si el amor se acavo dimelo de frente', 'mensaje de pame'),
	   ('pamela', '2022-06-14', 'el gatito te perdio por negligencia', 'mensaje de pame'),
	   ('carlos', '2022-06-10', 'y yo que no creo en la ', 'mensaje de carlos');
	      
select * from post;
-- query 4
alter table post add titulo varchar(255) not null default 0;
-- query 5
update post set titulo = 'bellaquita' where id = 1;
update post set titulo = 'bellaco' where nombre_usuario = 'carlos';
-- query 6
insert into post (nombre_usuario, fecha_creacion, contenido, descripcion, titulo) 
values ('pedro', '2022-06-15', 'nose que paso tu no eres asi si el amor se acavo dimelo de frente', 'mensaje de pame', 'el malo'),
	   ('pedro', '2022-06-15', 'nose que paso tu no eres asi si el amor se acavo dimelo de frente', 'mensaje de pame', 'el malo');
-- query 7
delete from post where nombre_usuario = 'carlos';
-- query 8
insert into post (nombre_usuario, fecha_creacion, contenido, descripcion) 
values ('carlos', '2022-06-15', 'nose que paso tu no eres asi si el amor se acavo dimelo de frente', 'mensaje de pame');
-- segunda parte
-- query 1
drop table if exists comentarios;
create table comentarios (
	id serial primary key,
	fecha date not null,
	hora time not null,
	contenido text not null,
	post_id integer not null,
	foreign key (post_id) references post(id)
);
-- query 2
insert into comentarios (fecha, hora, contenido, post_id)
values ('2022-02-14', '15:33', 'y que pasa le pregunte por wasap', 2),
       ('2022-02-14', '15:33', 'mama mia', 1),
	   ('2022-02-14', '15:33', 'soy el chico de las poesias', 6),
	   ('2022-02-14', '15:33', 'tu fiel admirador', 6),
	   ('2022-02-14', '15:33', 'y que pasa le pregunte por wasap', 6),
	   ('2022-02-14', '15:33', 'y que pasa le pregunte por wasap', 6);
select * from comentarios;
-- quer 3
insert into post (nombre_usuario, fecha_creacion, contenido, descripcion) 
values ('margarita', '2022-06-15', 'nose que paso tu no eres asi si el amor se acavo dimelo de frente', 'mensaje de pame');
-- query 4
insert into comentarios (fecha, hora, contenido, post_id)
values ('2022-02-14', '15:33', 'y que pasa le pregunte por wasap', 7),
       ('2022-02-14', '15:33', 'mama mia', 1),
	   ('2022-02-14', '15:33', 'soy el chico de las poesias', 7),
	   ('2022-02-14', '15:33', 'tu fiel admirador', 7);
END;