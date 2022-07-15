-- se crea la base de datos
CREATE DATABASE mawashicards
    WITH
    OWNER = root
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_US.utf8'
    LC_CTYPE = 'en_US.utf8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;
-- se cran sus tablas
CREATE TABLE IF NOT EXISTS public.autos
(
    id integer NOT NULL,
    marca character varying(50) COLLATE pg_catalog."default",
    modelo character varying(50) COLLATE pg_catalog."default",
    "año" integer,
    color character varying(50) COLLATE pg_catalog."default",
    precio double precision,
    CONSTRAINT autos_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.autos
    OWNER to root;

CREATE TABLE IF NOT EXISTS public.ventas
(
    fecha date,
    id_auto integer,
    cliente character varying(255) COLLATE pg_catalog."default",
    referencia integer,
    cantidad integer,
    metodo_pago character varying(50) COLLATE pg_catalog."default",
    CONSTRAINT ventas_id_auto_fkey FOREIGN KEY (id_auto)
        REFERENCES public.autos (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.ventas
    OWNER to root;

----se importan los datos a las tablas anterior mente creadas
copy autos from 'a0aaead3ab0e:/var/lib/postgresql/data/autos.csv' csv header;

copy ventas from '/var/lib/postgresql/data/ventas.csv' csv header;

-- se crean las consultas solicitadas
-- query 1
select cliente, marca, modelo 
from autos
join ventas on ventas.id_auto = autos.id;
-- query 2
select *
from ventas
left join autos on autos.id = ventas.id_auto;
query 3
select *
from ventas
left join autos on autos.id = ventas.id_auto
where id_auto is null;
-- query 4
select *
from ventas
full join autos on autos.id = ventas.id_auto;
-- query 5
select *
from ventas
full join autos on autos.id = ventas.id_auto
where id_auto is null or id is null;
-- query 6
select *
from autos
full join ventas on autos.id = ventas.id_auto
where metodo_pago = 'credito';
-- query 7
select id, marca, modelo, color, precio
from autos
full join ventas on autos.id = ventas.id_auto
where precio >=1500000;