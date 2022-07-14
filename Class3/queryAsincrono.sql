BEGIN;


CREATE TABLE IF NOT EXISTS public.medicos
(
    id serial,
    nombre character varying(255) NOT NULL,
    apellido character varying(255) NOT NULL,
    numero_matricula integer NOT NULL,
    especialidad character varying(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.pacientes
(
    id serial,
    nombre character varying(255) NOT NULL,
    apellido character varying(255) NOT NULL,
    rut character varying(12) NOT NULL,
    telefono character varying(12),
    PRIMARY KEY (id)
);

insert into medicos (nombre, apellido, numero_matricula, especialidad)
values ('mijael','villablanca', 4587, 'otorrino'),
	   ('antonia','funetes', 44441, 'pediatra'),
	   ('francisca','scamandra', 222110, 'cardiologo'),
	   ('matilda','potter', 64411, 'traumatologo'),
	   ('harri','parker', 5022, 'cirujano');

insert into pacientes (nombre, apellido, rut, telefono)
values ('javiera','villablanca', '4587', '55444646'),
	   ('sofea','funetes', '44441', '565656'),
	   ('arnoldo','scamandra', '222110', '8778999'),
	   ('mafalda','potter', '64411', '457881145'),
	   ('florencia','peña', '64411', '457881145'),
	   ('leopoldo','hernandez', '64411', '457881145'),
	   ('soyla','cerda', '64411', '457881145'),
	   ('aquiles','baezas', '64411', '457881145'),
	   ('fernanda','melo', '64411', '457881145'),
	   ('juanito','perez', '5022', '454523');
	   
select * from medicos;
select * from pacientes;
END;