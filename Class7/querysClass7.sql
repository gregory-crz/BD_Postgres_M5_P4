BEGIN;
-- se crean las tablas para la base de datos
drop table if exists cliente;
CREATE TABLE IF NOT EXISTS public.cliente
(
    id serial,
    nombre character varying(255) NOT NULL,
    rut character varying(12) NOT NULL,
    direccion character varying(255),
    PRIMARY KEY (id)
);
drop table if exists factura;
CREATE TABLE IF NOT EXISTS public.factura
(
    nro_factura serial,
    fecha date NOT NULL,
    subtotal integer NOT NULL,
    iva integer NOT NULL,
    total integer NOT NULL,
    cliente_id integer NOT NULL,
    PRIMARY KEY (nro_factura)
);
drop table if exists producto;
CREATE TABLE IF NOT EXISTS public.producto
(
    id_producto serial,
    nombre character varying(255) NOT NULL,
    descripcion character varying(255) NOT NULL,
    stock integer NOT NULL,
    valor integer NOT NULL,
    categoria_id integer NOT NULL,
    PRIMARY KEY (id_producto)
);
drop table if exists categoria;
CREATE TABLE IF NOT EXISTS public.categoria
(
    id_categoria serial,
    nombre character varying(255) NOT NULL,
    descripcion character varying(255) NOT NULL,
    PRIMARY KEY (id_categoria)
);
drop table if exists factura_producto;
CREATE TABLE IF NOT EXISTS public.factura_producto
(
    factura_nro_factura serial,
    producto_id_producto serial,
    cantidad integer,
    valor_producto integer
);

ALTER TABLE IF EXISTS public.factura
    ADD FOREIGN KEY (cliente_id)
    REFERENCES public.cliente (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.producto
    ADD FOREIGN KEY (categoria_id)
    REFERENCES public.categoria (id_categoria) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.factura_producto
    ADD FOREIGN KEY (factura_nro_factura)
    REFERENCES public.factura (nro_factura) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.factura_producto
    ADD FOREIGN KEY (producto_id_producto)
    REFERENCES public.producto (id_producto) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;

-- se insertan datos en las tablas clientes, productos, categoria
insert into cliente (nombre, rut, direccion)
values ('pedrito calvo', '20111224', 'calle falsa 1213'),
       ('maria perez', '1313133', 'calle falsa 1213'),
	   ('sofia cardenas', '34242424', 'calle falsa 1213');
	   
insert into categoria (nombre, descripcion)
values ('linea blaca', 'productos para electronicos funcionales'),
       ('decohogar', 'productos de decoracion de interior'),
	   ('computacon y tecnologia', 'productos tecnologicos'),
	   ('herramientas', 'productos de contruccion');


insert into producto (nombre, descripcion, stock, valor, categoria_id)
values ('notebook', 'marca asus modelo rog', 50, 9000000, 3),
       ('celular', 'xaomi 11t pro', 80, 256000,3),
	   ('monitor', 'hp refactor', 20, 300000, 3),
	   ('hervidor', 'thomas', 50, 25000, 4);
	   
-- se comiensa con la transaccion para insetar facturas 	   
begin transaction;
insert into factura (fecha, subtotal, iva, total, cliente_id)
values ('2020-06-03',9560000, 1.9, 12000000, 1),
       ('2020-07-03',560000, 1.9, 620000, 2),
	   ('2020-05-03',25000, 1.9, 28000, 3);
insert into factura_producto (factura_nro_factura, producto_id_producto)
values (1,1), (1,2), (1,3),
       (2,2), (2,3),
	   (3,4);          
commit;

-- se comiensa con las consultas solicitada en trabajo asincronico clase 7
select * 
from cliente
join factura on cliente.id=factura.cliente_id
order by total desc limit 1;


select distinct nombre
from cliente
join factura on factura.cliente_id= cliente.id
where total > 60000;

select nombre
from cliente
join factura on factura.cliente_id = cliente.id
join factura_producto on factura_producto.factura_nro_factura = factura.nro_factura
group by nombre
having sum(cantidad) >=5;