BEGIN;


CREATE TABLE IF NOT EXISTS public.cargoempleado
(
    cargo character varying(100) COLLATE pg_catalog."default" NOT NULL,
    fechaingreso date NOT NULL,
    departamento_id integer NOT NULL,
    CONSTRAINT cargoempleado_pkey PRIMARY KEY (cargo)
);

CREATE TABLE IF NOT EXISTS public.departamentos
(
    id_depa integer NOT NULL DEFAULT nextval('departamentos_id_depa_seq'::regclass),
    nombre character varying(255) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT departamentos_pkey PRIMARY KEY (id_depa)
);

CREATE TABLE IF NOT EXISTS public.empleados
(
    rut character varying(12) COLLATE pg_catalog."default" NOT NULL,
    nombre character varying(100) COLLATE pg_catalog."default" NOT NULL,
    direccion character varying(255) COLLATE pg_catalog."default" NOT NULL,
    salario character varying(255) COLLATE pg_catalog."default" NOT NULL,
    sexo character(1) COLLATE pg_catalog."default",
    anonacimiento integer,
    cargoempleado_cargo character varying(100) COLLATE pg_catalog."default",
    CONSTRAINT empleados_pkey PRIMARY KEY (rut)
);

CREATE TABLE IF NOT EXISTS public.locales
(
    id_local integer NOT NULL DEFAULT nextval('locales_id_local_seq'::regclass),
    nombre character varying(255) COLLATE pg_catalog."default" NOT NULL,
    departamento_id integer NOT NULL,
    CONSTRAINT locales_pkey PRIMARY KEY (id_local)
);

CREATE TABLE IF NOT EXISTS public.proyec_empleado
(
    id integer NOT NULL DEFAULT nextval('proyec_empleado_id_seq'::regclass),
    empleado_rut character varying(12) COLLATE pg_catalog."default",
    proyectos_id integer,
    CONSTRAINT proyec_empleado_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.proyectos
(
    id_proyecto integer NOT NULL DEFAULT nextval('proyectos_id_proyecto_seq'::regclass),
    nombre character varying(255) COLLATE pg_catalog."default" NOT NULL,
    departamento_id integer NOT NULL,
    local_id integer NOT NULL,
    CONSTRAINT proyectos_pkey PRIMARY KEY (id_proyecto)
);

CREATE TABLE IF NOT EXISTS public.empleados_proyectos
(
    empleados_rut character varying(12) COLLATE pg_catalog."default" NOT NULL,
    proyectos_id_proyecto integer NOT NULL DEFAULT nextval('proyectos_id_proyecto_seq'::regclass),
    id serial,
    horas_trabajo date NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS public.cargoempleado
    ADD FOREIGN KEY (departamento_id)
    REFERENCES public.departamentos (id_depa) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.cargoempleado
    ADD FOREIGN KEY (departamento_id)
    REFERENCES public.departamentos (id_depa) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.empleados
    ADD FOREIGN KEY (cargoempleado_cargo)
    REFERENCES public.cargoempleado (cargo) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.proyectos
    ADD FOREIGN KEY (local_id)
    REFERENCES public.locales (id_local) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.proyectos
    ADD FOREIGN KEY (departamento_id)
    REFERENCES public.departamentos (id_depa) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.empleados_proyectos
    ADD FOREIGN KEY (empleados_rut)
    REFERENCES public.empleados (rut) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.empleados_proyectos
    ADD FOREIGN KEY (proyectos_id_proyecto)
    REFERENCES public.proyectos (id_proyecto) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;