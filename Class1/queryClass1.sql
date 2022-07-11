BEGIN;


CREATE TABLE IF NOT EXISTS compania.departamento
(
    id_depa integer NOT NULL,
    nombre_depa character(40) NOT NULL,
    empleado_id integer NOT NULL,
    proyecto_id integer NOT NULL,
    local_id integer NOT NULL,
    PRIMARY KEY (id_depa)
);

CREATE TABLE IF NOT EXISTS compania.proyectos
(
    id_proyecto integer NOT NULL,
    nombre_proyecto character(40) NOT NULL,
    local_id integer,
    empleado_id integer NOT NULL
);

CREATE TABLE IF NOT EXISTS compania."tipoEmpleado"
(
    id_user integer NOT NULL,
    cargo character(20) NOT NULL,
    empleado_id integer NOT NULL,
    depa_id integer NOT NULL,
    PRIMARY KEY (id_user)
);

CREATE TABLE IF NOT EXISTS compania.empleado
(
    id_empleado integer NOT NULL,
    nombre_empleado character(100) NOT NULL,
    rut_empleado character(10) NOT NULL,
    direccion_empleado character(60) NOT NULL,
    sexo_empleado "char" NOT NULL,
    anonacimiento date,
    salario character,
    PRIMARY KEY (id_empleado)
);

CREATE TABLE IF NOT EXISTS compania.dependientes
(
    id_dependientes integer NOT NULL,
    nombre character(100),
    rut character(10),
    sexo "char",
    fhechanacimiento date,
    relacion character(20),
    empleado_id integer,
    PRIMARY KEY (id_dependientes)
);

CREATE TABLE IF NOT EXISTS compania."proyectos_tipoEmpleado"
(
    proyectos_empleado_id integer NOT NULL,
    "tipoEmpleado_id_user" integer NOT NULL
);

ALTER TABLE IF EXISTS compania.proyectos
    ADD FOREIGN KEY (id_proyecto)
    REFERENCES compania.departamento (proyecto_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS compania."tipoEmpleado"
    ADD FOREIGN KEY (empleado_id)
    REFERENCES compania.empleado (id_empleado) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS compania."tipoEmpleado"
    ADD FOREIGN KEY (id_user)
    REFERENCES compania.departamento (empleado_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS compania.dependientes
    ADD FOREIGN KEY (empleado_id)
    REFERENCES compania.empleado (id_empleado) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS compania."proyectos_tipoEmpleado"
    ADD FOREIGN KEY (proyectos_empleado_id)
    REFERENCES compania.proyectos (empleado_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS compania."proyectos_tipoEmpleado"
    ADD FOREIGN KEY ("tipoEmpleado_id_user")
    REFERENCES compania."tipoEmpleado" (id_user) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;