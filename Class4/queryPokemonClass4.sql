CREATE DATABASE kanto
    WITH
    OWNER = root
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_US.utf8'
    LC_CTYPE = 'en_US.utf8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;



CREATE TABLE IF NOT EXISTS public.pokemones
(
    pokedex integer NOT NULL,
    nombre character varying(10) COLLATE pg_catalog."default",
    tipo1 character varying(10) COLLATE pg_catalog."default",
    tipo2 character varying(10) COLLATE pg_catalog."default",
    CONSTRAINT pokemones_pkey PRIMARY KEY (pokedex)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.pokemones
    OWNER to root;

CREATE TABLE IF NOT EXISTS public.mis_pokemones
(
    pokedex integer,
    fecha_captura date,
    lugar character varying(20) COLLATE pg_catalog."default",
    huevo boolean,
    peso double precision,
    estatura double precision,
    CONSTRAINT mis_pokemones_pokedex_fkey FOREIGN KEY (pokedex)
        REFERENCES public.pokemones (pokedex) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.mis_pokemones
    OWNER to root;

-- primera parte de las query
select *
from pokemones
where pokedex >50;

select * 
from pokemones
where tipo2 = 'psiquico';

select * 
from pokemones
limit 22;
-- segunda parte de las query
select nombre as pokename, pokedex as nro_pokedex
from pokemones
limit 30;
-- tercera parte de las query
select count(pokedex)
from pokemones;

select * 
from pokemones
where tipo2 = 'roca';