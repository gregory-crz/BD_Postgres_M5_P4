CREATE DATABASE pelis
    WITH
    OWNER = root
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_US.utf8'
    LC_CTYPE = 'en_US.utf8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;
-- creando las tablas
CREATE TABLE IF NOT EXISTS public.peliculas
(
    id integer NOT NULL,
    pelicula character varying(255) COLLATE pg_catalog."default",
    year_estreno integer,
    director character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT peliculas_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.peliculas
    OWNER to root;
CREATE TABLE IF NOT EXISTS public.repartos
(
    id_pelicula integer,
    actor character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT repartos_id_pelicula_fkey FOREIGN KEY (id_pelicula)
        REFERENCES public.peliculas (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.repartos
    OWNER to root;
-- importando datos csv a postgres

copy peliculas from '/var/lib/postgresql/data/peliculas.csv' csv header;
copy repartos from '/var/lib/postgresql/data/reparto.csv' csv header;

-- consultas solicitadas
-- query 1
select id
from peliculas
where pelicula = 'Titanic';
-- query 2
select actor, pelicula
from repartos
left join peliculas on repartos.id_pelicula = peliculas.id
where pelicula = 'Titanic';
-- query 3
select pelicula, id
from peliculas
join repartos on peliculas.id = repartos.id_pelicula
where actor = 'Harrison Ford' and id <= 100;
-- query 4
select pelicula, year_estreno
from peliculas
where year_estreno>=1990 and year_estreno<=1999
order by year_estreno asc;
-- query 5
select pelicula, length(pelicula) as longitud_titulo
from peliculas;
-- query 6
select max(length(pelicula))
from peliculas;