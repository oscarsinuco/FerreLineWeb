--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: almacen; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE almacen (
    id_almacen integer NOT NULL,
    id_sede integer NOT NULL,
    nombre character varying(30) NOT NULL,
    cantidad integer NOT NULL,
    fecha_llegada date NOT NULL,
    fecha_salida date NOT NULL
);


ALTER TABLE public.almacen OWNER TO postgres;

--
-- Name: barrio; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE barrio (
    id_barrio integer NOT NULL,
    id_ciudad integer,
    nombre character varying(30) NOT NULL
);


ALTER TABLE public.barrio OWNER TO postgres;

--
-- Name: categoria; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE categoria (
    codigo_c integer NOT NULL,
    nombre character varying(30) NOT NULL,
    descripcion character varying(100) NOT NULL
);


ALTER TABLE public.categoria OWNER TO postgres;

--
-- Name: categoria_producto; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE categoria_producto (
    codigo_c integer NOT NULL,
    codigo_p integer NOT NULL
);


ALTER TABLE public.categoria_producto OWNER TO postgres;

--
-- Name: ciudad; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE ciudad (
    id_ciudad integer NOT NULL,
    id_departamento integer NOT NULL,
    nombre character varying(40) NOT NULL
);


ALTER TABLE public.ciudad OWNER TO postgres;

--
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cliente (
    cedula_c integer NOT NULL,
    id_barrio integer NOT NULL,
    nombre character varying(30) NOT NULL,
    apellido1 character varying(30) NOT NULL,
    apellido2 character varying(30) NOT NULL,
    direccion character varying(50) NOT NULL,
    sexo character varying(20) NOT NULL,
    profesion character varying(40) NOT NULL,
    telefono character varying(20) NOT NULL,
    correo character varying(50) NOT NULL,
    fecha_nacimiento date NOT NULL,
    contrasena character varying(50) NOT NULL
);


ALTER TABLE public.cliente OWNER TO postgres;

--
-- Name: departamento; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE departamento (
    id_departamento integer NOT NULL,
    id_region integer NOT NULL,
    nombre character varying(50) NOT NULL
);


ALTER TABLE public.departamento OWNER TO postgres;

--
-- Name: director; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE director (
    cedula integer NOT NULL,
    id_barrio integer NOT NULL,
    nombre character varying(30) NOT NULL,
    apellido1 character varying(30) NOT NULL,
    apellido2 character varying(30) NOT NULL,
    direccion character varying(100) NOT NULL,
    telefono character varying(20) NOT NULL,
    sexo character varying(20) NOT NULL,
    correo character varying(50) NOT NULL
);


ALTER TABLE public.director OWNER TO postgres;

--
-- Name: empleado; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE empleado (
    id_empleado integer NOT NULL,
    id_barrio integer NOT NULL,
    id_nomina integer NOT NULL,
    nombre character varying(30) NOT NULL,
    apellido1 character varying(30) NOT NULL,
    apellido2 character varying(30) NOT NULL,
    direccion character varying(100) NOT NULL,
    cedula character varying(20) NOT NULL,
    sexo character varying(20) NOT NULL,
    cargo character varying(30) NOT NULL,
    ruc character varying(20) NOT NULL,
    telefono character varying(20) NOT NULL,
    correo character varying(50) NOT NULL,
    fecha_nacimiento date NOT NULL,
    contrasena character varying(50) NOT NULL
);


ALTER TABLE public.empleado OWNER TO postgres;

--
-- Name: empleado_id_empleado_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE empleado_id_empleado_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.empleado_id_empleado_seq OWNER TO postgres;

--
-- Name: empleado_id_empleado_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE empleado_id_empleado_seq OWNED BY empleado.id_empleado;


--
-- Name: factura; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE factura (
    id_factura integer NOT NULL,
    fecha_compra date NOT NULL,
    cantidad_productos integer NOT NULL,
    descuento numeric NOT NULL,
    total numeric NOT NULL
);


ALTER TABLE public.factura OWNER TO postgres;

--
-- Name: jefe; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE jefe (
    cedula_j integer NOT NULL,
    nombre character varying(30),
    apellido1 character varying(30),
    apellido2 character varying,
    direccion character varying,
    telefono character varying,
    sexo character varying,
    correo character varying,
    id_barrio integer NOT NULL,
    fecha_nacimiento date NOT NULL,
    contrasena character varying(50) NOT NULL
);


ALTER TABLE public.jefe OWNER TO postgres;

--
-- Name: marca; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE marca (
    codigo_m integer NOT NULL,
    nombre character varying(30) NOT NULL,
    descripcion character varying(100) NOT NULL,
    telefono character varying(20) NOT NULL
);


ALTER TABLE public.marca OWNER TO postgres;

--
-- Name: mensajero; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE mensajero (
    cedula_m integer NOT NULL,
    id_barrio integer NOT NULL,
    id_nomina integer NOT NULL,
    nombre character varying(30) NOT NULL,
    apellido1 character varying(30) NOT NULL,
    apellido2 character varying(30) NOT NULL,
    direccion character varying(100) NOT NULL,
    sexo character varying(20) NOT NULL,
    cargo character varying(30) NOT NULL,
    ruc character varying(20) NOT NULL,
    telefono character varying(20) NOT NULL,
    correo character varying(40) NOT NULL,
    fecha_nacimiento date NOT NULL
);


ALTER TABLE public.mensajero OWNER TO postgres;

--
-- Name: mensajero_cedula_m_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE mensajero_cedula_m_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mensajero_cedula_m_seq OWNER TO postgres;

--
-- Name: mensajero_cedula_m_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE mensajero_cedula_m_seq OWNED BY mensajero.cedula_m;


--
-- Name: mensajero_vehiculo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE mensajero_vehiculo (
    cedula_m integer NOT NULL,
    placa character varying NOT NULL,
    fecha date NOT NULL,
    hora character varying(20) NOT NULL,
    descripcion character varying(100) NOT NULL
);


ALTER TABLE public.mensajero_vehiculo OWNER TO postgres;

--
-- Name: nomina; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE nomina (
    id_nomina integer NOT NULL,
    fecha_inicio date NOT NULL,
    fecha_fin date NOT NULL,
    fondo_total numeric
);


ALTER TABLE public.nomina OWNER TO postgres;

--
-- Name: pedido; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pedido (
    id_pedido integer NOT NULL,
    cedula_c integer NOT NULL,
    codigo_u integer NOT NULL,
    codigo_p integer NOT NULL,
    id_factura integer NOT NULL,
    cedula_m integer NOT NULL,
    fecha date NOT NULL,
    cantidad integer NOT NULL,
    descuento numeric NOT NULL,
    precio_unitario numeric NOT NULL,
    iva numeric NOT NULL
);


ALTER TABLE public.pedido OWNER TO postgres;

--
-- Name: producto; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE producto (
    codigo_p integer NOT NULL,
    nombre character varying(100) NOT NULL,
    medida character varying(30),
    marca character varying(30),
    descripcion character varying(50),
    fecha_fabricacion date,
    id_almacen integer
);


ALTER TABLE public.producto OWNER TO postgres;

--
-- Name: proveedor; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE proveedor (
    id_proveedor integer NOT NULL,
    nombre character varying(30),
    direccion character varying(100),
    telefono character varying(20)
);


ALTER TABLE public.proveedor OWNER TO postgres;

--
-- Name: proveedor_marca; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE proveedor_marca (
    codigo_m integer NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.proveedor_marca OWNER TO postgres;

--
-- Name: proveedor_producto; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE proveedor_producto (
    id integer NOT NULL,
    codigo_p integer NOT NULL
);


ALTER TABLE public.proveedor_producto OWNER TO postgres;

--
-- Name: region; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE region (
    id_region integer NOT NULL,
    nombre character varying(40) NOT NULL
);


ALTER TABLE public.region OWNER TO postgres;

--
-- Name: sede; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE sede (
    id_sede integer NOT NULL,
    nombre character varying(30),
    direccion character varying(50),
    telefono character varying(20),
    id_barrio integer NOT NULL,
    cedula integer NOT NULL
);


ALTER TABLE public.sede OWNER TO postgres;

--
-- Name: unidad; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE unidad (
    codigo_u integer NOT NULL,
    nombre character varying(30),
    descripcion character varying(100)
);


ALTER TABLE public.unidad OWNER TO postgres;

--
-- Name: unidad_producto; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE unidad_producto (
    codigo_u integer NOT NULL,
    codigo_p integer NOT NULL,
    precio integer NOT NULL
);


ALTER TABLE public.unidad_producto OWNER TO postgres;

--
-- Name: vehiculo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE vehiculo (
    placa character varying(10) NOT NULL,
    tipo character varying(30) NOT NULL,
    referencia character varying(30) NOT NULL,
    marca character varying(30) NOT NULL
);


ALTER TABLE public.vehiculo OWNER TO postgres;

--
-- Name: id_empleado; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY empleado ALTER COLUMN id_empleado SET DEFAULT nextval('empleado_id_empleado_seq'::regclass);


--
-- Name: cedula_m; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mensajero ALTER COLUMN cedula_m SET DEFAULT nextval('mensajero_cedula_m_seq'::regclass);


--
-- Data for Name: almacen; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO almacen VALUES (1, 1, 'Almacen santafe', 54, '2008-12-12', '2010-12-19');
INSERT INTO almacen VALUES (2, 2, 'La esperanza ', 78, '2008-02-12', '2008-12-12');
INSERT INTO almacen VALUES (3, 1, 'CASIQUE', 90, '2019-10-01', '2019-10-10');


--
-- Data for Name: barrio; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO barrio VALUES (1, 1, 'San alonso');
INSERT INTO barrio VALUES (2, 1, 'Alfonso Lopez');
INSERT INTO barrio VALUES (3, 1, 'Estoraquez');
INSERT INTO barrio VALUES (4, 1, 'La universidad');
INSERT INTO barrio VALUES (5, 2, 'Buenavista');


--
-- Data for Name: categoria; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: categoria_producto; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: ciudad; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO ciudad VALUES (1, 1, 'Bucaramanga');
INSERT INTO ciudad VALUES (2, 1, 'San Gil');


--
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cliente VALUES (1102331112, 2, 'Carlos', 'Santamaria', 'Moreno', 'Calle hhaha', 'M', 'Carpintero', '3124445675', 'dshjshsd@gmail.com', '1996-12-01','123456');
INSERT INTO cliente VALUES (1102331110, 1, 'JORGE', 'PABLO', 'MONTOLLA', 'Calle con c', 'M', 'Vendedor', '97987987987', 'jorge@gmail.com', '1986-12-02','123456');


--
-- Data for Name: departamento; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO departamento VALUES (1, 1, 'Santander');


--
-- Data for Name: director; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO director VALUES (43434, 2, 'dffdfd', 'fdfdfd', 'fdffd', 'fdfdfd', '433443', 'M', 'dfdfdfd');
INSERT INTO director VALUES (1234567, 1, 'JORGE', 'PABLO', 'MONTOLLA', 'Calle con cra', '97897987', 'M', 'jorge@gmail.com');


--
-- Data for Name: empleado; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO empleado VALUES (1, 1, 1, 'Juan', 'Morales', 'Ardila', 'Calle con carrera', '123123123123', 'M', 'cajero', '89987987', '3214545677', 'morales@gmail.com', '1987-10-10','123456');
INSERT INTO empleado VALUES (432432432, 1, 1, 'JORGE', 'PABLO', 'MONTOLLA', 'uitiutiyt', '765765757', 'M', 'Vendedor', '86876876', '987987', 'jorge@gmail.com', '1986-12-01','123456');


--
-- Name: empleado_id_empleado_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('empleado_id_empleado_seq', 1, false);


--
-- Data for Name: factura; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO factura VALUES (1, '1992-04-02', 56, 20, 4500000);


--
-- Data for Name: jefe; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO jefe VALUES (12223, 'djds', 'dsdsds', 'ddsdsds', 'dsdsbb', '32333322233', 'M', 'dfdfdfd', 2, '1999-01-01','123456');
INSERT INTO jefe VALUES (766765765, 'JORGE', 'PABLO', 'MONTOLLA', 'trtrete', '764764674', 'M', 'jorge@gmail.com', 3, '1986-12-01','123456');


--
-- Data for Name: marca; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: mensajero; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO mensajero VALUES (1, 4, 2, 'Oscar Esneyder', 'Sinuco', 'Tirado', 'Calle xd', 'M', 'Tendero', '323232', '3154573647', 'oscar_1699@hotmail.com', '1999-04-16');
INSERT INTO mensajero VALUES (76576575, 3, 2, 'JORGE', 'PABLO', 'MONTOLLA', 'tryryrytr', 'M', 'Vendedor', '86876876', '987987', 'jorge@gmail.com', '1986-12-02');


--
-- Name: mensajero_cedula_m_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('mensajero_cedula_m_seq', 1, true);


--
-- Data for Name: mensajero_vehiculo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO mensajero_vehiculo VALUES (1, 'XTJ245', '2000-02-02', '00:00', 'iouoiuoiu');


--
-- Data for Name: nomina; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO nomina VALUES (1, '2018-01-29', '2019-01-29', 10000000);
INSERT INTO nomina VALUES (2, '2015-05-23', '2019-05-23', 30000000);


--
-- Data for Name: pedido; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO pedido VALUES (1, 1102331112, 1, 1, 1, 1, '2000-02-02', 90, 67, 67000, 15);
INSERT INTO pedido VALUES (10, 1102331112, 1, 9, 1, 1, '2000-02-02', 90, 67, 67000, 15);
INSERT INTO pedido VALUES (2, 1102331110, 21, 484, 1, 76576575, '2000-02-02', 90, 67, 67000, 15);
INSERT INTO pedido VALUES (11, 1102331112, 5, 346, 1, 1, '2000-02-02', 90, 67, 67000, 15);
INSERT INTO pedido VALUES (14, 1102331110, 6, 36, 1, 1, '2000-02-02', 90, 67, 67000, 15);


--
-- Data for Name: producto; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO producto VALUES (1, 'aceite 3 en 1', 'pequeño', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (2, 'aceite 3 en 1', 'grande', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (3, 'boxer', 'pequeño', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (4, 'boxer', 'mediano', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (5, 'cinta negra', 'grande', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (6, 'cinta negra', 'pequeño', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (7, 'chinches', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (8, 'grafito', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (9, 'cinta para cajas cafe', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (10, 'cinta para cajas transparente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (11, 'teflon agua', 'grande', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (12, 'teflon agua', 'mediano', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (13, 'teflon agua', 'pequeño', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (14, 'ojo magico', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (17, 'baso licuadora', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (18, 'pegante instantaneo', NULL, 'pegadit', NULL, NULL, NULL);
INSERT INTO producto VALUES (19, 'puntillas de acero', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (20, 'cinta doble faz', '1"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (21, 'cinta doble faz', '3/4"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (22, 'cinta doble faz', '1/2"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (84, 'regulador de gas', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (23, 'espatula', '5"', 'bellota', NULL, NULL, NULL);
INSERT INTO producto VALUES (24, 'espatula', '4"', 'bellota', NULL, NULL, NULL);
INSERT INTO producto VALUES (25, 'espatula', '2"', 'hopex', NULL, NULL, NULL);
INSERT INTO producto VALUES (26, 'espatula', '1 1/2"', 'hopex', NULL, NULL, NULL);
INSERT INTO producto VALUES (27, 'tapa bocas', NULL, NULL, 'color negro', NULL, NULL);
INSERT INTO producto VALUES (29, 'chazo plastico', '1/4"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (30, 'chazo plastico', '5/16"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (31, 'chazo plastico', '3/16"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (32, 'chazo plastico', '3/8"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (33, 'cabulla', '1m', 'ata facil', NULL, NULL, NULL);
INSERT INTO producto VALUES (34, 'cabula fique', '1m', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (35, 'amarres plasticos', '35cm', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (36, 'amarres plasticos', '25cm', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (38, 't sanitaria', '2"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (39, 't sanitaria', '1 1/2"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (40, 'codo sanitario', '2"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (41, 'semi codo', '2"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (42, 'codo sanitario cxe', '1 1/2"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (45, 'buje', '3 x 1 1/2"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (44, 'buje', '3 x 2"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (85, 'lazo', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (46, 'union sanitario', '2"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (47, 'union sanitario', '1 1/2"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (48, 'sifon sanitario', '2"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (49, 'buje', '1 1/4 x 1/2"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (50, 'buje', '1 x 3/4"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (51, 'buje', '3/4 x 1/2"', NULL, '

', NULL, NULL);
INSERT INTO producto VALUES (53, 'buje', '1 1/2 x 3/4"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (54, 'buje', '1 1/2 x 1"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (55, 'buje', '1 1/2 x 1 1/4"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (56, 'buje', '1 1/2 x 1/2"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (57, 'buje', '1 1/4 x 3/4"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (58, 'buje', '1 x 1/2"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (60, 'codo', '1"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (61, 'union', '1 1/4"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (62, 'union', '1"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (63, 'codo', '1 1/2"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (64, 'codo', '1 1/4"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (65, 'semi codo', '1 1/2"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (66, 'semi codo', '1"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (67, 'union', '3/4"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (68, 'codo sanitario cxe', '2"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (69, 'semi codo', '1/2"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (52, 'buje', '1 1/4 x 1"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (70, 'estuco plastico', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (71, 'manguera lavadora', NULL, NULL, 'agua limpia', NULL, NULL);
INSERT INTO producto VALUES (72, 'manguera lavadora', NULL, NULL, 'desague', NULL, NULL);
INSERT INTO producto VALUES (73, 'poma universal ducha', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (74, 'poma estriada', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (75, 'poma cuadrante', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (76, 'poma cierre rapido', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (77, 'codo', '1/2"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (78, 't', '3/4"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (79, 'alambre multiuso', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (80, 'cable ethernet', '3m', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (81, 'cable ethernet', '5m', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (82, 'cable ethernet', '10m', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (83, 'toma telefono', NULL, 'legrant - luminex', NULL, NULL, NULL);
INSERT INTO producto VALUES (114, 'toma doble sobre muro', NULL, 'osblack', NULL, NULL, NULL);
INSERT INTO producto VALUES (86, 'manguera gas tejida', '1.20m', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (87, 'manguera gas tejida', '1.5m', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (88, 'manguera gas lisa', '1m', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (89, 'manguera gas lisa', '1.5m', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (90, 'manguera gas lisa', '2m', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (91, 'caja rectangular', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (92, 'interruptor sencillo', NULL, 'ave', NULL, NULL, NULL);
INSERT INTO producto VALUES (93, 'interruptor con toma', NULL, 'ave', NULL, NULL, NULL);
INSERT INTO producto VALUES (94, 'toma doble con polo', NULL, 'ave', NULL, NULL, NULL);
INSERT INTO producto VALUES (95, 'plafon', NULL, 'ave', NULL, NULL, NULL);
INSERT INTO producto VALUES (96, 'cemento blanco', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (97, 'cemento gris', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (98, 'cal', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (99, 'pega perfecto', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (100, 'estuca dos', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (101, 'yeso', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (102, 'binda boquilla color', NULL, 'sika', NULL, NULL, NULL);
INSERT INTO producto VALUES (103, 'probador de corriente', 'grande', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (104, 'probador de corriente', 'pequeño', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (115, 'cable audio y video', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (116, 'toma telefono', NULL, 'legrant luminex', NULL, NULL, NULL);
INSERT INTO producto VALUES (118, 'terminal parabolica', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (117, 'terminal parabolica', NULL, NULL, 'siliconado', NULL, NULL);
INSERT INTO producto VALUES (105, 'taco enchufable', '15v', 'luminex', NULL, NULL, NULL);
INSERT INTO producto VALUES (106, 'taco enchufable', '20v', 'luminex', NULL, NULL, NULL);
INSERT INTO producto VALUES (107, 'taco enchufable', '30v', 'luminex', NULL, NULL, NULL);
INSERT INTO producto VALUES (108, 'taco enchufable', '40v', 'luminex', NULL, NULL, NULL);
INSERT INTO producto VALUES (109, 'interruptor sencillo', NULL, 'avia', NULL, NULL, NULL);
INSERT INTO producto VALUES (110, 'toma doble', NULL, 'levinton', NULL, NULL, NULL);
INSERT INTO producto VALUES (111, 'multi toma 6 puestos', NULL, 'globy', NULL, NULL, NULL);
INSERT INTO producto VALUES (112, 'multi toma 3 puestos', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (113, 'estarter fs-4', '30-40w', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (119, 'union parabolica', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (120, 'terminal tv cable', NULL, NULL, 'requiere ponchadora', NULL, NULL);
INSERT INTO producto VALUES (123, 'soquet', NULL, NULL, 'porcelana', NULL, NULL);
INSERT INTO producto VALUES (121, 't parabolica', NULL, NULL, '2 vias', NULL, NULL);
INSERT INTO producto VALUES (122, 't parabolica', NULL, NULL, '3 vias', NULL, NULL);
INSERT INTO producto VALUES (124, 'mini motor', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (126, 'plafon bombillo linterna', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (127, 'plafon bombillo de aji', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (128, 'terminal rapido', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (129, 't de telefono', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (130, 'splinter', NULL, 'sekuro', NULL, NULL, NULL);
INSERT INTO producto VALUES (131, 'tapones para tomas', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (132, 'cubo telefonico', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (133, 'clavija telefono', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (134, 'interruptor lampara', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (135, 'toma pasta', NULL, 'ave', NULL, NULL, NULL);
INSERT INTO producto VALUES (136, 'clavija pasta', NULL, 'ave', NULL, NULL, NULL);
INSERT INTO producto VALUES (137, 'union telefono', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (138, 'convertidor polo a tierra', NULL, 'codelca', NULL, NULL, NULL);
INSERT INTO producto VALUES (139, 'porta pila 9v', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (140, 'porta pila aa', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (141, 'pila 9v', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (142, 'pila aa', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (143, 'pila aaa', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (144, 'chazo puntilla', '5/16"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (28, 'chazo plastico', '1/2"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (16, 'metro', '5m', NULL, 'economico', NULL, NULL);
INSERT INTO producto VALUES (37, 'palustre', NULL, 'gavilan', NULL, NULL, NULL);
INSERT INTO producto VALUES (125, 'herraje para tacos', NULL, NULL, '2 puestos', NULL, NULL);
INSERT INTO producto VALUES (145, 't pvc', '1/2"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (59, 'buje', '2 x 1"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (146, 'tapon pvc', '1/2"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (147, 'tapon pvc roscado', '1/2"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (148, 'adaptador macho pvc', '1/2"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (149, 'adaptador hembra pvc', '1/2"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (150, 'union pvc', '1/2"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (151, 'brocha', '4"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (152, 'brocha', '3"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (153, 'brocha', '2 1/2"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (154, 'brocha', '2"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (155, 'brocha', '1 1/2"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (156, 'brocha', '1"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (157, 'guantes plasticos', NULL, 'eterna', NULL, NULL, NULL);
INSERT INTO producto VALUES (158, 'cable churco para telefono', 'largo', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (159, 'cable churco para telefono', 'corto', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (160, 'toma', '

', 'codelca', NULL, NULL, NULL);
INSERT INTO producto VALUES (161, 'convertidor pata redonda a pata plana ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (162, 'soquet de enchufuar para bombillo', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (163, 'clavija', 'grande', 'codelca', NULL, NULL, NULL);
INSERT INTO producto VALUES (164, 'clavija', 'pequeña', 'codelca', NULL, NULL, NULL);
INSERT INTO producto VALUES (165, 'clavija polo a tierra', 'grande', 'codelca', NULL, NULL, NULL);
INSERT INTO producto VALUES (166, 'toma aerea polo a tierra', NULL, 'codelca', NULL, NULL, NULL);
INSERT INTO producto VALUES (167, 'benjamin', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (168, 'soket', NULL, NULL, 'instalacion de bombillo', NULL, NULL);
INSERT INTO producto VALUES (169, 'electron losa', NULL, NULL, '"churrusco para calentar agua"', NULL, NULL);
INSERT INTO producto VALUES (170, 'grapas para cable', NULL, NULL, 'parabolica, telefono', NULL, NULL);
INSERT INTO producto VALUES (171, 'tabla rectangular', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (172, 'tabla cuadrada', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (173, 'tabla redonda', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (174, 'creolina', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (175, 'soda caustica', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (176, 'acido muriatico', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (233, 'toma parabolica', NULL, 'legrand galica1', NULL, NULL, NULL);
INSERT INTO producto VALUES (234, 'toma telefono ', NULL, 'legrand galica1', NULL, NULL, NULL);
INSERT INTO producto VALUES (177, 'bisagra omega II', '3"', 'induma', NULL, NULL, NULL);
INSERT INTO producto VALUES (235, 'toma telefono y parabolica', NULL, 'luminex', NULL, NULL, NULL);
INSERT INTO producto VALUES (178, 'pasador aleman', '2"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (236, 'toma doble', NULL, 'legrand ambia', NULL, NULL, NULL);
INSERT INTO producto VALUES (179, 'porta candado', '3"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (180, 'porta candado', '2 1/2"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (181, 'bisagra comun', '2"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (182, 'colpega', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (183, 'anticorrocivo aerosol', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (184, 'pintura novaflex tipo III blanco', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (185, 'rodillo felpa', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (186, 'rodillo espuma', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (187, 'manguera sanitario', NULL, 'grival', NULL, NULL, NULL);
INSERT INTO producto VALUES (188, 'manguera lavaplatos', NULL, 'grival', NULL, NULL, NULL);
INSERT INTO producto VALUES (189, 'asiento sanitario', NULL, 'corona', NULL, NULL, NULL);
INSERT INTO producto VALUES (190, 'sifon botella lavamanos', NULL, 'grival', NULL, NULL, NULL);
INSERT INTO producto VALUES (191, 'manija sanitario', NULL, 'grival', NULL, NULL, NULL);
INSERT INTO producto VALUES (192, 'sifon en p lavaplatos', NULL, 'grival', NULL, NULL, NULL);
INSERT INTO producto VALUES (193, 'valvula regualcion plastica sanitario', NULL, 'grival', NULL, NULL, NULL);
INSERT INTO producto VALUES (194, 'llave lavamanos plateada', NULL, 'grival', NULL, NULL, NULL);
INSERT INTO producto VALUES (195, 'canastilla lavaplatos', NULL, 'grival', NULL, NULL, NULL);
INSERT INTO producto VALUES (196, 'desague sencillo lavamanos', NULL, 'grival', NULL, NULL, NULL);
INSERT INTO producto VALUES (197, 'valvula de entrada sanitario', NULL, 'grival', NULL, NULL, NULL);
INSERT INTO producto VALUES (198, 'sifon flexible gris', NULL, 'grival', NULL, NULL, NULL);
INSERT INTO producto VALUES (199, 'griferia completa sanitario', NULL, 'grival', NULL, NULL, NULL);
INSERT INTO producto VALUES (200, 'llave lavamanos negra', NULL, 'grival', NULL, NULL, NULL);
INSERT INTO producto VALUES (201, 'gafas de proteccion', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (202, 'brocha de fique', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (203, 'novaflex esmalte domestico blanco', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (204, 'novaflex vinilo tipo 1 lavabl', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (206, 'cilicona universal ', NULL, 'toolcraft', NULL, NULL, NULL);
INSERT INTO producto VALUES (205, 'cilicona universal', NULL, 'sika', NULL, NULL, NULL);
INSERT INTO producto VALUES (207, 'extension electrica', '2m', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (208, 'extension electrica', '3m', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (209, 'extension electrica', '4m', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (210, 'extension electrica', '5m', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (211, 'tapa ciega rectangular plastica electrica', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (212, 'tapa ciega redonda plastica electrica', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (213, 'tapa ciega redonda metalica electrica', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (214, 'tapa para toma doble levinton', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (237, 'caja octagonal plastica', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (215, 'bombillo ', '53v', 'ilumax', NULL, NULL, NULL);
INSERT INTO producto VALUES (216, 'bombillo led', '10v', 'ilumax', NULL, NULL, NULL);
INSERT INTO producto VALUES (217, 'bombillo led', '6v', 'ilumax', NULL, NULL, NULL);
INSERT INTO producto VALUES (218, 'bombillo', '25v', 'starluz', NULL, NULL, NULL);
INSERT INTO producto VALUES (219, 'racor hembra bronce', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (220, 'racor macho hembra plastico', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (222, 'cadena amarilla', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (223, 'cadena galvanizada plateada', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (226, 'bombillo vela e14', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (227, 'bombillo vela e12', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (221, 'union de reparacion', '1/2"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (225, 'bombillo vela e27', NULL, NULL, 'para lamparas, rosca normañ', NULL, NULL);
INSERT INTO producto VALUES (230, 'interruptor doble', NULL, 'legrand galica2', NULL, NULL, NULL);
INSERT INTO producto VALUES (229, 'toma interruptor polo', NULL, 'legrand galica2', NULL, NULL, NULL);
INSERT INTO producto VALUES (228, 'toma doble polo', NULL, 'legrand galica2', NULL, NULL, NULL);
INSERT INTO producto VALUES (231, 'toma interruptor', NULL, 'legrand galica1', NULL, NULL, NULL);
INSERT INTO producto VALUES (232, 'interruptor timbre', NULL, 'legrand galica1', NULL, NULL, NULL);
INSERT INTO producto VALUES (238, 'sello lengueta flapper', NULL, 'grival', 'macho', NULL, NULL);
INSERT INTO producto VALUES (240, 'extension grabadora', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (243, 'base licuadora', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (245, 'veneno raton', NULL, 'tres pasitos', NULL, NULL, NULL);
INSERT INTO producto VALUES (247, 'tapon olla de precion negro', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (248, 'tapon olla de precion negro  - rojo', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (241, 'cuchilla licuadora', NULL, 'oster', NULL, NULL, NULL);
INSERT INTO producto VALUES (242, 'tapa licuadora', NULL, 'oster', NULL, NULL, NULL);
INSERT INTO producto VALUES (249, 'ruana licuadora', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (250, 'escualizador licuadora economico', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (251, 'escualizador licuadora original', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (252, 'cuadrante licuadora', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (253, 'guarda cable plancha', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (254, 'boton switche licuadora', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (255, 'empaque licudora oster', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (257, 'poma ducha cuadrante cuadrado original', NULL, 'grival', NULL, NULL, NULL);
INSERT INTO producto VALUES (259, 'bastago mezclador cierre rapido', 'pequeño', 'grival', 'vender conn mostrario', NULL, NULL);
INSERT INTO producto VALUES (261, 'bastago ducha', NULL, 'grival', 'vender con mostrario', NULL, NULL);
INSERT INTO producto VALUES (260, 'empaque nariz lavaplatos', NULL, 'grival', NULL, NULL, NULL);
INSERT INTO producto VALUES (263, 'plafon', NULL, 'luminex', NULL, NULL, NULL);
INSERT INTO producto VALUES (264, 'cuerda tendedero', '1m', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (265, 'masilla epoxica', '30g', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (266, 'masilla epoxica', '50g', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (267, 't electrica', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (268, 'correa para amarres plastico', '10cm', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (270, 'abrazadera 10-06', NULL, 'titan', NULL, NULL, NULL);
INSERT INTO producto VALUES (271, 'abrazadera 10-24', NULL, 'titan', NULL, NULL, NULL);
INSERT INTO producto VALUES (272, 'empaque para racor de maguera', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (273, 'empaque llave terminal', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (274, 'empaque llave ducha', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (275, 'toma doble interruptor doble sobre muro', NULL, 'ave', NULL, NULL, NULL);
INSERT INTO producto VALUES (239, 'sello lengueta bajo consumo', NULL, 'grival', 'hembra', NULL, NULL);
INSERT INTO producto VALUES (244, 'chapa escritorio', NULL, NULL, 'cajon de madera', NULL, NULL);
INSERT INTO producto VALUES (256, 'empaque unidad selle', NULL, 'grival', 'llave lavamanos goteando', NULL, NULL);
INSERT INTO producto VALUES (262, 'tuerca empaque', NULL, 'grival', 'se vende junto al bastago', NULL, NULL);
INSERT INTO producto VALUES (269, 'abrazadera 10-16', NULL, 'titan', 'para manguera de 1/2"', NULL, NULL);
INSERT INTO producto VALUES (276, 'toma doble sobre muro', NULL, 'ave', NULL, NULL, NULL);
INSERT INTO producto VALUES (277, 'interruptor sencillo sobre muro', NULL, 'ave', NULL, NULL, NULL);
INSERT INTO producto VALUES (278, 'toma sencillo sobre muro', NULL, 'ave', NULL, NULL, NULL);
INSERT INTO producto VALUES (279, 'toma telefoo sobre muro', NULL, 'astral', NULL, NULL, NULL);
INSERT INTO producto VALUES (280, 'interruptor doble sobre muro', NULL, 'astral', NULL, NULL, NULL);
INSERT INTO producto VALUES (282, 'ponchada de cable telefono', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (281, 'cable liso telefono', '1m', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (283, 'tubo electrico', '3m', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (284, 'tubo pvc 1/2"', '1cm', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (285, 'tubo pvc 3/4"', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (286, 'tubo pvc 1"', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (287, 'tubo pvc 1 1/4"', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (289, 'tubo pvc 2"', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (290, 'perfil de aluminio', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (292, 'esquineros', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (293, 'canaleta adesiva', 'ancha', 'mercury', NULL, NULL, NULL);
INSERT INTO producto VALUES (294, 'canaleta adesiva', 'delgada', 'mercury', NULL, NULL, NULL);
INSERT INTO producto VALUES (295, 'remache ciego', 'pequeño', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (296, 'broca muro', '3/16"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (297, 'broca muro', '1/4"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (298, 'broca muro', '5/16"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (299, 'broca muro', '3/8"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (300, 'broca metal', '3/32"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (301, 'broca metal', '1/8"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (302, 'broca metal', '5/32"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (358, 'caucho de olla precion universal economico', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (359, 'empaque de olla precion sliconado', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (303, 'broca metal', '3/16"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (304, 'broca metal', '1/4"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (305, 'puntas de taladro', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (306, 'segueta', NULL, 'nicholson', NULL, NULL, NULL);
INSERT INTO producto VALUES (360, 'empaque de olla umca', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (307, 'destornillador estrella', '1/8 x 4"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (309, 'cincel', '1/2 x 8"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (310, 'cincel', '3/8 x 8"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (311, 'cincel', '3/4 x 8"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (315, 'metro', '3m', 'bellota', NULL, NULL, NULL);
INSERT INTO producto VALUES (312, 'cautin', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (313, 'alicate', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (314, 'llave briston', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (316, 'lima triangular', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (318, 'llave mixta', '10', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (319, 'llave mixta', '11', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (320, 'llave mixta', '12', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (322, 'llave mixta', '13', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (321, 'llave mixta', '14', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (324, 'martillo', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (326, 'llave expanciva', '8', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (327, 'llave expanciva', '10', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (325, 'cegueta con marco', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (328, 'llave de tubo', '10', 'pertul', NULL, NULL, NULL);
INSERT INTO producto VALUES (329, 'cepillo de acero', '1"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (330, 'rodillo epoxico', '3"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (331, 'rodillo epoxico', '4"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (332, 'rodillo epoxico', '5"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (333, 'destornillador pala', '1/4 x 6"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (334, 'destornillador pala', '3/16 x 8"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (353, 'sintesolda 10 min', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (336, 'destornillador pala', '3/16 x 3"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (337, 'destornillador pala', '1/8 x 2 1/2"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (338, 'lija', '150', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (339, 'lija', '80', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (340, 'lija', '120', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (341, 'lija', '220', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (342, 'lija', '400', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (343, 'lija', '320', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (346, 'alambre electrico', '10', 'centelsa', 'amarillo', NULL, NULL);
INSERT INTO producto VALUES (349, 'cable economico', '16', 'duplex', NULL, NULL, NULL);
INSERT INTO producto VALUES (374, 'margarita', NULL, NULL, 'gancho para recoger la cortina', NULL, NULL);
INSERT INTO producto VALUES (348, 'cable economico', '14', 'duplex', NULL, NULL, NULL);
INSERT INTO producto VALUES (345, 'alambre electrico', '12', 'centelsa', 'negro y verde', NULL, NULL);
INSERT INTO producto VALUES (347, 'cable economico', '12', 'duplex', NULL, NULL, NULL);
INSERT INTO producto VALUES (373, 'terminal cortina', '1"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (351, 'pegante instantaneo', NULL, 'super blue', NULL, NULL, NULL);
INSERT INTO producto VALUES (352, 'silicona ', '50ml', 'pegadit', NULL, NULL, NULL);
INSERT INTO producto VALUES (354, 'soldadura pvc', 'pequeña', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (355, 'soldadura pvc', 'mediano', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (356, 'limpiador pvc', 'pequeño', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (357, 'caucho de olla precion universal original', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (361, 'tubo cortina', '1"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (362, 'tubo cortina', '3/4"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (363, 'tubo cortina', '1/2"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (364, 'soporte cortina', '1"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (365, 'soporte cortina', '3/4"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (366, 'soporte cortina', '1/2"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (367, 'soporte cortina doble', '1"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (368, 'soporte cortina doble', '3/4"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (369, 'soporte cortina doble', '1/2"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (370, 'plafon de cortina', '1"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (371, 'plafon de cortina', '3/4"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (372, 'plafon de cortina', '1/2"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (375, 'argolla cortina', '1"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (376, 'argolla cortina', '3/4"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (377, 'argolla cortina', '1/2"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (378, 'codo galvanizado', '3/8"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (379, 'codo galvanizado', '1/2"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (380, 'union galvanizada', '1/2"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (381, 'tapon hembra galvanizado', '1/2"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (382, 'tapon macho galvanizado', '1/2"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (383, 'niple todo rosca', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (385, 'niple galvanizado', '10cm', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (384, 'niple galvanizado', '5cm', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (387, 'niple galvanizado', '20cm', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (388, 'niple galvanizado', '25cm', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (392, 't galvanizada', '1/2"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (390, 'niple galvanizado', '35cm', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (391, 'niple galvanizado', '50cm', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (395, 'llana metalica liza', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (394, 'plafon metalico', '3/4"', NULL, 'cortina, tubo pesado', NULL, NULL);
INSERT INTO producto VALUES (405, 'candado', '50mm', 'trek, vyba', NULL, NULL, NULL);
INSERT INTO producto VALUES (411, 'candado', '40mm', 'hermex', 'candado de laton', NULL, NULL);
INSERT INTO producto VALUES (408, 'candado', '25mm', NULL, 'pequeño color negro', NULL, NULL);
INSERT INTO producto VALUES (412, 'candado', '30mm', 'hermex', 'candado de laton', NULL, NULL);
INSERT INTO producto VALUES (397, 'piamigo', '6 x 8"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (398, 'piamigo', '8 x 10"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (399, 'piamigo', '10 x 12"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (400, 'suncho', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (401, 'pila d', NULL, 'tornex', NULL, NULL, NULL);
INSERT INTO producto VALUES (402, 'canaleta adesiva', 'ancha', 'dexon', NULL, NULL, NULL);
INSERT INTO producto VALUES (403, 'canaleta adesiva', 'delgada', 'dexon', NULL, NULL, NULL);
INSERT INTO producto VALUES (404, 'candado', '60mm', 'luxfort', NULL, NULL, NULL);
INSERT INTO producto VALUES (406, 'candado', '40mm', 'luxfort', NULL, NULL, NULL);
INSERT INTO producto VALUES (407, 'candado', '30mm', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (409, 'candado', '20mm', NULL, 'pequeño color negro', NULL, NULL);
INSERT INTO producto VALUES (414, 'llave de paso gas', NULL, NULL, 'mariposa amarilla', NULL, NULL);
INSERT INTO producto VALUES (415, 'llave de paso bola antifraude', NULL, NULL, 'para contador de agua', NULL, NULL);
INSERT INTO producto VALUES (291, 'dilataciones', NULL, NULL, 'win', NULL, NULL);
INSERT INTO producto VALUES (288, 'tubo pvc 1 1/2"', NULL, NULL, 'sanitario "amarillo"', NULL, NULL);
INSERT INTO producto VALUES (386, 'niple galvanizado', '15cm', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (308, 'destornillador estrella', '3/16 x 4"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (335, 'destornillador pala', '3/16 x 6"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (416, 'disco diamantado segmentado ', '4 1/2"', 'corneta', NULL, NULL, NULL);
INSERT INTO producto VALUES (417, 'bombillo para linterna', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (419, 'pito para olla', NULL, 'corona', NULL, NULL, NULL);
INSERT INTO producto VALUES (420, 'soldadura de estaño', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (429, 'duplicado de llaves', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (472, 'duplicado de llaves', NULL, NULL, 'con figuras', NULL, NULL);
INSERT INTO producto VALUES (423, 'barrilito de la manguera de gas tejida', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (424, 'barrilito de la manguera de gas lisa', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (473, 'llaveros', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (389, 'niple galvanizado', '30cm', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (425, 'manguera de gas lisa', '1m', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (426, 'manguera de gas lisa', '1.5m', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (427, 'manguera de gas lisa', '2m', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (428, 'manguera de gas tejida', '1m', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (430, 'manguera de gas tejida', '1.2m', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (431, 'manguera de gas tejida', '1.5m', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (432, 'manguera de gas tejida', '2m', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (433, 'yee para lavadora blanca', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (435, 'bombillo de aji de colores', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (474, 'niple galvanizado', '45cm', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (442, 'brillametal', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (438, 'llave terminal', NULL, 'grival', NULL, NULL, NULL);
INSERT INTO producto VALUES (439, 'llave terminal', NULL, 'pretul', NULL, NULL, NULL);
INSERT INTO producto VALUES (440, 'llave terminal', NULL, 'truper', NULL, NULL, NULL);
INSERT INTO producto VALUES (396, 'llana metalica ranurada', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (475, 'piamigo', '5 x 6"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (443, 'cinta de enmascarar', '1/2"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (444, 'cinta de enmascarar', '3/4"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (445, 'cinta de enmascarar', '1"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (446, 'gancho de cortina', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (413, 'candado', '25mm', 'hermex', 'candado pequeño de hierro,pequeño color gris', NULL, NULL);
INSERT INTO producto VALUES (449, 'ducha baño de boton', NULL, 'plast grifos', NULL, NULL, NULL);
INSERT INTO producto VALUES (450, 'ducha baño lluvia', NULL, 'plast grifos', NULL, NULL, NULL);
INSERT INTO producto VALUES (451, 'rollito del papel higienico', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (452, 'chupas destapa caños', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (453, 'pistola plastica para maguera', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (421, 'cancamo cerrado', '10', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (422, 'cancamo cerrado', '12', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (454, 'rejilla de piso', '4 x 3"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (456, 'valvula para la pila', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (224, 'bombillo nevera', '15v', NULL, 'preferiblemente con mostrario', NULL, NULL);
INSERT INTO producto VALUES (246, 'chapa escritorio cuadrada', NULL, NULL, 'cajon de madera', NULL, NULL);
INSERT INTO producto VALUES (258, 'bastago mezclador cierre rapido', 'grande', 'grival', 'vender con mostrario', NULL, NULL);
INSERT INTO producto VALUES (323, 'cuerda elastica para amarres', NULL, NULL, 'amarrar cajas, parece hecha de retazos de tela', NULL, NULL);
INSERT INTO producto VALUES (393, 'abrazadera palstica', '1/2"', NULL, 'para recoger tubos', NULL, NULL);
INSERT INTO producto VALUES (410, 'candado', '50mm', 'hermex', 'candado de hierro', NULL, NULL);
INSERT INTO producto VALUES (418, 'grapas para espejo', NULL, NULL, '"manitas" para sujetar/poner un espejo', NULL, NULL);
INSERT INTO producto VALUES (434, 'mariposa para llave terminal', NULL, NULL, 'mirar el cuadrante', NULL, NULL);
INSERT INTO producto VALUES (437, 'disco metal', NULL, 'dewalt', 'pulidora, cortar metal', NULL, NULL);
INSERT INTO producto VALUES (447, 'rejilla de piso', '3 x 2"', 'celta', 'rejilla de 2"', NULL, NULL);
INSERT INTO producto VALUES (448, 'grapas para lavamanos', NULL, NULL, 'grapa para montar un lavamanos', NULL, NULL);
INSERT INTO producto VALUES (455, 'tornillo herraje', NULL, NULL, 'para el aciento del sanitario', NULL, NULL);
INSERT INTO producto VALUES (15, 'metro', '3m', NULL, 'economico', NULL, NULL);
INSERT INTO producto VALUES (43, 'buje', '2 x 1 1/2"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (457, 'manguera de gas tejida', '2m', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (458, 'herraje para tacos ', NULL, NULL, '3 puestos', NULL, NULL);
INSERT INTO producto VALUES (459, 'brocha', '1/2"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (460, 'metro', '5m', 'bellota', NULL, NULL, NULL);
INSERT INTO producto VALUES (461, 'metro', '8m', 'bellota', NULL, NULL, NULL);
INSERT INTO producto VALUES (317, 'espatula plastica', '3"', 'truper', NULL, NULL, NULL);
INSERT INTO producto VALUES (462, 'espatula plastica economica', 'pequeña', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (463, 'espatula plastica economica', 'mediana', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (464, 'espatula plastica economica', 'grande', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (465, 'rodillo epoxico', '2"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (466, 'destornillador pala', '1/8 x 4"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (350, 'cable economico', '18', 'duplex', NULL, NULL, NULL);
INSERT INTO producto VALUES (467, 'cable original', '12', 'centelsa', NULL, NULL, NULL);
INSERT INTO producto VALUES (468, 'cable original', '14', 'centelsa', NULL, NULL, NULL);
INSERT INTO producto VALUES (469, 'cable original', '16', 'centelsa', NULL, NULL, NULL);
INSERT INTO producto VALUES (344, 'alambre electrico ', '14', 'centelsa', 'blanco', NULL, NULL);
INSERT INTO producto VALUES (470, 'terminal cortina', '3/4"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (471, 'terminal cortina', '1/2"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (477, 'cancamo cerrado', '14', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (476, 'grapas para suncho', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (478, 'cancamo cerrado', 'pequeño', NULL, 'tamaño menor a 10', NULL, NULL);
INSERT INTO producto VALUES (479, 'cancamo abierto', '1"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (480, 'cancamo abierto', '1 1/2"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (481, 'cancamo abierto', '2"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (482, 'cancamo abierto', 'pequeño', NULL, 'tamaño menor a 1"', NULL, NULL);
INSERT INTO producto VALUES (483, 'pintura en aerosol ', '400ml - 280g', 'toolcraft', NULL, NULL, NULL);
INSERT INTO producto VALUES (484, 'alambre dulce', NULL, NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (436, 'chapa de alcoba', NULL, 'y&y', NULL, NULL, NULL);
INSERT INTO producto VALUES (485, 'llave terminal', NULL, 'truper', NULL, NULL, NULL);
INSERT INTO producto VALUES (441, 'disco diamantado segmentado', '4 - 1/2 x 7/8"', 'diamond', 'cortar concreto, muro', NULL, NULL);
INSERT INTO producto VALUES (486, 'regilla piso', '5 x 3"', NULL, NULL, NULL, NULL);
INSERT INTO producto VALUES (500, 'MARTILLO', '20"', 'Golpe', 'hkjhkhjkh', '2000-10-10', 1);
INSERT INTO producto VALUES (600, 'ESPATULA', '10"', 'Pintucol', 'ksdlskdlj', '2019-10-10', 3);


--
-- Data for Name: proveedor; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: proveedor_marca; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: proveedor_producto; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: region; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO region VALUES (1, 'Andina');


--
-- Data for Name: sede; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO sede VALUES (1, 'Sede uno', 'Callejjasjasj', '3123456789', 2, 43434);
INSERT INTO sede VALUES (2, 'Sede dos', 'Calle con carrera', '123456789', 5, 43434);
INSERT INTO sede VALUES (3, 'SEDE TRES', 'Calle con cra', '987987', 1, 43434);
INSERT INTO sede VALUES (4, 'CEDE ORIENTAL', 'Calle con cra', '310001111', 5, 1234567);


--
-- Data for Name: unidad; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO unidad VALUES (1, 'unidad', NULL);
INSERT INTO unidad VALUES (2, 'caja', '50 unidades');
INSERT INTO unidad VALUES (3, 'caja', '1 libra');
INSERT INTO unidad VALUES (4, 'bola', NULL);
INSERT INTO unidad VALUES (6, 'bolsa', NULL);
INSERT INTO unidad VALUES (7, 'bolsa', '1kg');
INSERT INTO unidad VALUES (8, 'chipa', '18m');
INSERT INTO unidad VALUES (9, 'madeja', '8m');
INSERT INTO unidad VALUES (5, 'metro', '1m');
INSERT INTO unidad VALUES (10, 'bulto', '10kg');
INSERT INTO unidad VALUES (11, 'bulto', '25kg');
INSERT INTO unidad VALUES (12, 'bolsa', '2kg');
INSERT INTO unidad VALUES (13, 'bolsa', '1lb');
INSERT INTO unidad VALUES (14, 'trio', NULL);
INSERT INTO unidad VALUES (15, 'galon', NULL);
INSERT INTO unidad VALUES (16, '1/4 de galon ', NULL);
INSERT INTO unidad VALUES (17, 'bolsa', '100');
INSERT INTO unidad VALUES (18, 'tramo', '3m');
INSERT INTO unidad VALUES (19, 'tramo', '2m');
INSERT INTO unidad VALUES (20, 'par', '2 unidades');
INSERT INTO unidad VALUES (21, 'chipa', '1 rueda');


--
-- Data for Name: unidad_producto; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO unidad_producto VALUES (1, 1, 3000);
INSERT INTO unidad_producto VALUES (1, 2, 5500);
INSERT INTO unidad_producto VALUES (1, 3, 1600);
INSERT INTO unidad_producto VALUES (1, 4, 2500);
INSERT INTO unidad_producto VALUES (1, 5, 2500);
INSERT INTO unidad_producto VALUES (1, 6, 1200);
INSERT INTO unidad_producto VALUES (2, 7, 1200);
INSERT INTO unidad_producto VALUES (1, 8, 2000);
INSERT INTO unidad_producto VALUES (1, 9, 2500);
INSERT INTO unidad_producto VALUES (1, 10, 2000);
INSERT INTO unidad_producto VALUES (1, 11, 2500);
INSERT INTO unidad_producto VALUES (1, 12, 1200);
INSERT INTO unidad_producto VALUES (1, 13, 600);
INSERT INTO unidad_producto VALUES (1, 14, 4500);
INSERT INTO unidad_producto VALUES (1, 15, 3500);
INSERT INTO unidad_producto VALUES (1, 16, 5000);
INSERT INTO unidad_producto VALUES (1, 17, 5000);
INSERT INTO unidad_producto VALUES (1, 18, 3500);
INSERT INTO unidad_producto VALUES (3, 19, 6000);
INSERT INTO unidad_producto VALUES (1, 20, 4500);
INSERT INTO unidad_producto VALUES (1, 21, 3500);
INSERT INTO unidad_producto VALUES (1, 22, 2600);
INSERT INTO unidad_producto VALUES (1, 23, 6000);
INSERT INTO unidad_producto VALUES (1, 24, 5000);
INSERT INTO unidad_producto VALUES (1, 25, 3000);
INSERT INTO unidad_producto VALUES (1, 26, 2500);
INSERT INTO unidad_producto VALUES (1, 27, 750);
INSERT INTO unidad_producto VALUES (1, 29, 50);
INSERT INTO unidad_producto VALUES (1, 28, 100);
INSERT INTO unidad_producto VALUES (1, 30, 100);
INSERT INTO unidad_producto VALUES (1, 31, 100);
INSERT INTO unidad_producto VALUES (1, 32, 100);
INSERT INTO unidad_producto VALUES (4, 33, 3200);
INSERT INTO unidad_producto VALUES (5, 33, 100);
INSERT INTO unidad_producto VALUES (4, 34, 1500);
INSERT INTO unidad_producto VALUES (6, 35, 15500);
INSERT INTO unidad_producto VALUES (1, 35, 200);
INSERT INTO unidad_producto VALUES (6, 36, 10500);
INSERT INTO unidad_producto VALUES (1, 36, 150);
INSERT INTO unidad_producto VALUES (1, 37, 14500);
INSERT INTO unidad_producto VALUES (1, 38, 4000);
INSERT INTO unidad_producto VALUES (1, 39, 3500);
INSERT INTO unidad_producto VALUES (1, 40, 2500);
INSERT INTO unidad_producto VALUES (1, 41, 3000);
INSERT INTO unidad_producto VALUES (1, 42, 2500);
INSERT INTO unidad_producto VALUES (1, 43, 1500);
INSERT INTO unidad_producto VALUES (1, 44, 2800);
INSERT INTO unidad_producto VALUES (1, 45, 2800);
INSERT INTO unidad_producto VALUES (1, 46, 1500);
INSERT INTO unidad_producto VALUES (1, 47, 1400);
INSERT INTO unidad_producto VALUES (1, 48, 4000);
INSERT INTO unidad_producto VALUES (1, 51, 600);
INSERT INTO unidad_producto VALUES (1, 55, 2200);
INSERT INTO unidad_producto VALUES (1, 49, 1800);
INSERT INTO unidad_producto VALUES (1, 50, 700);
INSERT INTO unidad_producto VALUES (1, 54, 2500);
INSERT INTO unidad_producto VALUES (1, 52, 1200);
INSERT INTO unidad_producto VALUES (1, 53, 1600);
INSERT INTO unidad_producto VALUES (1, 58, 1000);
INSERT INTO unidad_producto VALUES (1, 56, 1600);
INSERT INTO unidad_producto VALUES (1, 57, 1200);
INSERT INTO unidad_producto VALUES (1, 59, 3000);
INSERT INTO unidad_producto VALUES (1, 60, 1200);
INSERT INTO unidad_producto VALUES (1, 61, 1500);
INSERT INTO unidad_producto VALUES (1, 62, 1000);
INSERT INTO unidad_producto VALUES (1, 63, 2000);
INSERT INTO unidad_producto VALUES (1, 64, 2000);
INSERT INTO unidad_producto VALUES (1, 65, 2500);
INSERT INTO unidad_producto VALUES (1, 66, 1200);
INSERT INTO unidad_producto VALUES (1, 67, 800);
INSERT INTO unidad_producto VALUES (1, 68, 3000);
INSERT INTO unidad_producto VALUES (1, 69, 600);
INSERT INTO unidad_producto VALUES (7, 70, 3800);
INSERT INTO unidad_producto VALUES (1, 71, 10500);
INSERT INTO unidad_producto VALUES (1, 72, 10500);
INSERT INTO unidad_producto VALUES (1, 73, 4000);
INSERT INTO unidad_producto VALUES (1, 74, 4000);
INSERT INTO unidad_producto VALUES (1, 75, 4000);
INSERT INTO unidad_producto VALUES (1, 76, 2500);
INSERT INTO unidad_producto VALUES (1, 77, 600);
INSERT INTO unidad_producto VALUES (1, 78, 1000);
INSERT INTO unidad_producto VALUES (8, 79, 4500);
INSERT INTO unidad_producto VALUES (1, 80, 4500);
INSERT INTO unidad_producto VALUES (1, 81, 6500);
INSERT INTO unidad_producto VALUES (1, 82, 11000);
INSERT INTO unidad_producto VALUES (1, 83, 7000);
INSERT INTO unidad_producto VALUES (1, 84, 10000);
INSERT INTO unidad_producto VALUES (5, 85, 400);
INSERT INTO unidad_producto VALUES (9, 85, 3000);
INSERT INTO unidad_producto VALUES (1, 86, 17000);
INSERT INTO unidad_producto VALUES (1, 87, 18000);
INSERT INTO unidad_producto VALUES (1, 457, 24000);
INSERT INTO unidad_producto VALUES (1, 88, 8600);
INSERT INTO unidad_producto VALUES (1, 89, 9000);
INSERT INTO unidad_producto VALUES (1, 90, 11000);
INSERT INTO unidad_producto VALUES (1, 91, 700);
INSERT INTO unidad_producto VALUES (1, 92, 5500);
INSERT INTO unidad_producto VALUES (1, 93, 8500);
INSERT INTO unidad_producto VALUES (1, 94, 5500);
INSERT INTO unidad_producto VALUES (1, 95, 2500);
INSERT INTO unidad_producto VALUES (7, 96, 1700);
INSERT INTO unidad_producto VALUES (7, 97, 1000);
INSERT INTO unidad_producto VALUES (7, 98, 1500);
INSERT INTO unidad_producto VALUES (10, 98, 10000);
INSERT INTO unidad_producto VALUES (7, 99, 1000);
INSERT INTO unidad_producto VALUES (11, 99, 14700);
INSERT INTO unidad_producto VALUES (7, 100, 1700);
INSERT INTO unidad_producto VALUES (7, 101, 1500);
INSERT INTO unidad_producto VALUES (12, 102, 10800);
INSERT INTO unidad_producto VALUES (1, 103, 3500);
INSERT INTO unidad_producto VALUES (1, 104, 2500);
INSERT INTO unidad_producto VALUES (1, 105, 11500);
INSERT INTO unidad_producto VALUES (1, 106, 11500);
INSERT INTO unidad_producto VALUES (1, 107, 14000);
INSERT INTO unidad_producto VALUES (1, 108, 14000);
INSERT INTO unidad_producto VALUES (1, 110, 4000);
INSERT INTO unidad_producto VALUES (1, 111, 9000);
INSERT INTO unidad_producto VALUES (1, 112, 6500);
INSERT INTO unidad_producto VALUES (1, 113, 600);
INSERT INTO unidad_producto VALUES (1, 114, 3000);
INSERT INTO unidad_producto VALUES (1, 115, 3500);
INSERT INTO unidad_producto VALUES (1, 116, 7000);
INSERT INTO unidad_producto VALUES (1, 117, 650);
INSERT INTO unidad_producto VALUES (1, 118, 350);
INSERT INTO unidad_producto VALUES (1, 119, 500);
INSERT INTO unidad_producto VALUES (1, 120, 1000);
INSERT INTO unidad_producto VALUES (1, 121, 1300);
INSERT INTO unidad_producto VALUES (1, 122, 1500);
INSERT INTO unidad_producto VALUES (1, 123, 2000);
INSERT INTO unidad_producto VALUES (1, 124, 3000);
INSERT INTO unidad_producto VALUES (1, 125, 4500);
INSERT INTO unidad_producto VALUES (1, 458, 6000);
INSERT INTO unidad_producto VALUES (1, 126, 500);
INSERT INTO unidad_producto VALUES (1, 127, 500);
INSERT INTO unidad_producto VALUES (1, 128, 1200);
INSERT INTO unidad_producto VALUES (1, 129, 1500);
INSERT INTO unidad_producto VALUES (1, 130, 3000);
INSERT INTO unidad_producto VALUES (1, 131, 300);
INSERT INTO unidad_producto VALUES (1, 132, 1500);
INSERT INTO unidad_producto VALUES (1, 133, 1500);
INSERT INTO unidad_producto VALUES (1, 134, 1000);
INSERT INTO unidad_producto VALUES (1, 135, 1700);
INSERT INTO unidad_producto VALUES (1, 136, 1200);
INSERT INTO unidad_producto VALUES (1, 137, 1500);
INSERT INTO unidad_producto VALUES (1, 138, 3000);
INSERT INTO unidad_producto VALUES (1, 139, 800);
INSERT INTO unidad_producto VALUES (1, 140, 1200);
INSERT INTO unidad_producto VALUES (1, 143, 700);
INSERT INTO unidad_producto VALUES (1, 141, 4500);
INSERT INTO unidad_producto VALUES (1, 142, 700);
INSERT INTO unidad_producto VALUES (1, 144, 200);
INSERT INTO unidad_producto VALUES (1, 145, 700);
INSERT INTO unidad_producto VALUES (1, 146, 600);
INSERT INTO unidad_producto VALUES (1, 147, 600);
INSERT INTO unidad_producto VALUES (1, 148, 600);
INSERT INTO unidad_producto VALUES (1, 149, 600);
INSERT INTO unidad_producto VALUES (1, 150, 600);
INSERT INTO unidad_producto VALUES (1, 151, 8500);
INSERT INTO unidad_producto VALUES (1, 152, 6500);
INSERT INTO unidad_producto VALUES (1, 156, 2500);
INSERT INTO unidad_producto VALUES (1, 155, 3500);
INSERT INTO unidad_producto VALUES (1, 154, 4500);
INSERT INTO unidad_producto VALUES (1, 158, 3000);
INSERT INTO unidad_producto VALUES (1, 153, 5500);
INSERT INTO unidad_producto VALUES (1, 459, 1500);
INSERT INTO unidad_producto VALUES (1, 157, 3500);
INSERT INTO unidad_producto VALUES (1, 159, 2000);
INSERT INTO unidad_producto VALUES (1, 160, 3500);
INSERT INTO unidad_producto VALUES (1, 161, 1500);
INSERT INTO unidad_producto VALUES (1, 162, 1500);
INSERT INTO unidad_producto VALUES (1, 163, 2300);
INSERT INTO unidad_producto VALUES (1, 164, 2000);
INSERT INTO unidad_producto VALUES (1, 165, 5000);
INSERT INTO unidad_producto VALUES (1, 166, 4000);
INSERT INTO unidad_producto VALUES (1, 167, 3500);
INSERT INTO unidad_producto VALUES (1, 168, 2000);
INSERT INTO unidad_producto VALUES (1, 169, 3000);
INSERT INTO unidad_producto VALUES (1, 170, 1200);
INSERT INTO unidad_producto VALUES (1, 171, 1000);
INSERT INTO unidad_producto VALUES (1, 172, 600);
INSERT INTO unidad_producto VALUES (1, 173, 1000);
INSERT INTO unidad_producto VALUES (1, 174, 3000);
INSERT INTO unidad_producto VALUES (13, 175, 4500);
INSERT INTO unidad_producto VALUES (1, 176, 2500);
INSERT INTO unidad_producto VALUES (14, 177, 6000);
INSERT INTO unidad_producto VALUES (1, 178, 2000);
INSERT INTO unidad_producto VALUES (1, 179, 2500);
INSERT INTO unidad_producto VALUES (1, 180, 2000);
INSERT INTO unidad_producto VALUES (1, 181, 800);
INSERT INTO unidad_producto VALUES (1, 182, 4500);
INSERT INTO unidad_producto VALUES (1, 183, 8500);
INSERT INTO unidad_producto VALUES (15, 184, 20000);
INSERT INTO unidad_producto VALUES (1, 185, 4000);
INSERT INTO unidad_producto VALUES (1, 186, 3500);
INSERT INTO unidad_producto VALUES (1, 187, 3000);
INSERT INTO unidad_producto VALUES (1, 188, 3000);
INSERT INTO unidad_producto VALUES (1, 189, 20000);
INSERT INTO unidad_producto VALUES (1, 190, 7500);
INSERT INTO unidad_producto VALUES (1, 191, 11500);
INSERT INTO unidad_producto VALUES (1, 192, 7000);
INSERT INTO unidad_producto VALUES (1, 193, 13000);
INSERT INTO unidad_producto VALUES (1, 194, 16000);
INSERT INTO unidad_producto VALUES (1, 195, 10000);
INSERT INTO unidad_producto VALUES (1, 196, 8800);
INSERT INTO unidad_producto VALUES (1, 197, 19000);
INSERT INTO unidad_producto VALUES (1, 198, 12000);
INSERT INTO unidad_producto VALUES (1, 199, 33500);
INSERT INTO unidad_producto VALUES (1, 200, 12000);
INSERT INTO unidad_producto VALUES (1, 201, 3000);
INSERT INTO unidad_producto VALUES (1, 202, 2000);
INSERT INTO unidad_producto VALUES (16, 203, 16700);
INSERT INTO unidad_producto VALUES (16, 204, 16000);
INSERT INTO unidad_producto VALUES (1, 205, 9800);
INSERT INTO unidad_producto VALUES (1, 206, 7500);
INSERT INTO unidad_producto VALUES (1, 207, 4500);
INSERT INTO unidad_producto VALUES (1, 208, 5500);
INSERT INTO unidad_producto VALUES (1, 209, 6500);
INSERT INTO unidad_producto VALUES (1, 210, 7500);
INSERT INTO unidad_producto VALUES (1, 211, 500);
INSERT INTO unidad_producto VALUES (1, 212, 500);
INSERT INTO unidad_producto VALUES (1, 213, 500);
INSERT INTO unidad_producto VALUES (1, 214, 500);
INSERT INTO unidad_producto VALUES (1, 215, 3000);
INSERT INTO unidad_producto VALUES (1, 216, 7000);
INSERT INTO unidad_producto VALUES (1, 217, 6000);
INSERT INTO unidad_producto VALUES (1, 218, 2500);
INSERT INTO unidad_producto VALUES (1, 219, 4500);
INSERT INTO unidad_producto VALUES (1, 220, 1000);
INSERT INTO unidad_producto VALUES (1, 221, 4000);
INSERT INTO unidad_producto VALUES (5, 222, 3000);
INSERT INTO unidad_producto VALUES (5, 223, 10800);
INSERT INTO unidad_producto VALUES (1, 224, 2000);
INSERT INTO unidad_producto VALUES (1, 225, 1500);
INSERT INTO unidad_producto VALUES (1, 226, 1500);
INSERT INTO unidad_producto VALUES (1, 227, 1500);
INSERT INTO unidad_producto VALUES (1, 228, 5500);
INSERT INTO unidad_producto VALUES (1, 229, 8500);
INSERT INTO unidad_producto VALUES (1, 230, 6500);
INSERT INTO unidad_producto VALUES (1, 231, 10800);
INSERT INTO unidad_producto VALUES (1, 232, 7000);
INSERT INTO unidad_producto VALUES (1, 233, 7000);
INSERT INTO unidad_producto VALUES (1, 234, 7000);
INSERT INTO unidad_producto VALUES (1, 235, 12000);
INSERT INTO unidad_producto VALUES (1, 236, 7000);
INSERT INTO unidad_producto VALUES (1, 237, 800);
INSERT INTO unidad_producto VALUES (1, 239, 9000);
INSERT INTO unidad_producto VALUES (1, 238, 6800);
INSERT INTO unidad_producto VALUES (1, 240, 2000);
INSERT INTO unidad_producto VALUES (1, 241, 12000);
INSERT INTO unidad_producto VALUES (1, 242, 3000);
INSERT INTO unidad_producto VALUES (1, 243, 3000);
INSERT INTO unidad_producto VALUES (1, 244, 3000);
INSERT INTO unidad_producto VALUES (1, 245, 1000);
INSERT INTO unidad_producto VALUES (1, 246, 4000);
INSERT INTO unidad_producto VALUES (1, 247, 1500);
INSERT INTO unidad_producto VALUES (1, 248, 2000);
INSERT INTO unidad_producto VALUES (1, 249, 500);
INSERT INTO unidad_producto VALUES (1, 250, 2500);
INSERT INTO unidad_producto VALUES (1, 251, 4500);
INSERT INTO unidad_producto VALUES (1, 252, 2000);
INSERT INTO unidad_producto VALUES (1, 253, 2000);
INSERT INTO unidad_producto VALUES (1, 254, 1000);
INSERT INTO unidad_producto VALUES (1, 255, 1000);
INSERT INTO unidad_producto VALUES (1, 256, 5200);
INSERT INTO unidad_producto VALUES (1, 257, 12700);
INSERT INTO unidad_producto VALUES (1, 258, 11500);
INSERT INTO unidad_producto VALUES (1, 259, 11500);
INSERT INTO unidad_producto VALUES (1, 260, 3800);
INSERT INTO unidad_producto VALUES (1, 261, 14700);
INSERT INTO unidad_producto VALUES (1, 262, 5000);
INSERT INTO unidad_producto VALUES (1, 263, 2500);
INSERT INTO unidad_producto VALUES (5, 264, 400);
INSERT INTO unidad_producto VALUES (8, 264, 4500);
INSERT INTO unidad_producto VALUES (1, 265, 2000);
INSERT INTO unidad_producto VALUES (1, 266, 2500);
INSERT INTO unidad_producto VALUES (1, 267, 3000);
INSERT INTO unidad_producto VALUES (14, 268, 100);
INSERT INTO unidad_producto VALUES (17, 268, 1500);
INSERT INTO unidad_producto VALUES (1, 269, 800);
INSERT INTO unidad_producto VALUES (1, 270, 1500);
INSERT INTO unidad_producto VALUES (1, 271, 1500);
INSERT INTO unidad_producto VALUES (1, 272, 200);
INSERT INTO unidad_producto VALUES (1, 273, 200);
INSERT INTO unidad_producto VALUES (1, 274, 200);
INSERT INTO unidad_producto VALUES (1, 276, 3000);
INSERT INTO unidad_producto VALUES (1, 277, 2500);
INSERT INTO unidad_producto VALUES (1, 278, 2500);
INSERT INTO unidad_producto VALUES (1, 279, 2500);
INSERT INTO unidad_producto VALUES (1, 280, 3000);
INSERT INTO unidad_producto VALUES (5, 281, 500);
INSERT INTO unidad_producto VALUES (1, 282, 1500);
INSERT INTO unidad_producto VALUES (18, 283, 2500);
INSERT INTO unidad_producto VALUES (5, 284, 2600);
INSERT INTO unidad_producto VALUES (5, 285, 3600);
INSERT INTO unidad_producto VALUES (5, 286, 4000);
INSERT INTO unidad_producto VALUES (5, 287, 5000);
INSERT INTO unidad_producto VALUES (5, 288, 6000);
INSERT INTO unidad_producto VALUES (5, 289, 7000);
INSERT INTO unidad_producto VALUES (5, 290, 1500);
INSERT INTO unidad_producto VALUES (18, 291, 3000);
INSERT INTO unidad_producto VALUES (18, 292, 2000);
INSERT INTO unidad_producto VALUES (19, 293, 4000);
INSERT INTO unidad_producto VALUES (19, 294, 3000);
INSERT INTO unidad_producto VALUES (1, 295, 100);
INSERT INTO unidad_producto VALUES (1, 296, 3500);
INSERT INTO unidad_producto VALUES (1, 297, 4500);
INSERT INTO unidad_producto VALUES (1, 298, 5500);
INSERT INTO unidad_producto VALUES (1, 299, 8000);
INSERT INTO unidad_producto VALUES (1, 300, 3000);
INSERT INTO unidad_producto VALUES (1, 301, 3500);
INSERT INTO unidad_producto VALUES (1, 302, 4000);
INSERT INTO unidad_producto VALUES (1, 303, 5000);
INSERT INTO unidad_producto VALUES (1, 304, 7500);
INSERT INTO unidad_producto VALUES (1, 305, 1500);
INSERT INTO unidad_producto VALUES (1, 306, 4000);
INSERT INTO unidad_producto VALUES (1, 307, 3000);
INSERT INTO unidad_producto VALUES (1, 308, 4500);
INSERT INTO unidad_producto VALUES (1, 309, 6000);
INSERT INTO unidad_producto VALUES (1, 310, 4500);
INSERT INTO unidad_producto VALUES (1, 311, 8000);
INSERT INTO unidad_producto VALUES (1, 312, 8500);
INSERT INTO unidad_producto VALUES (1, 313, 10000);
INSERT INTO unidad_producto VALUES (1, 314, 1500);
INSERT INTO unidad_producto VALUES (1, 315, 6000);
INSERT INTO unidad_producto VALUES (1, 460, 9000);
INSERT INTO unidad_producto VALUES (1, 461, 20000);
INSERT INTO unidad_producto VALUES (1, 316, 3600);
INSERT INTO unidad_producto VALUES (1, 317, 1500);
INSERT INTO unidad_producto VALUES (1, 462, 600);
INSERT INTO unidad_producto VALUES (1, 463, 700);
INSERT INTO unidad_producto VALUES (1, 464, 800);
INSERT INTO unidad_producto VALUES (1, 318, 2500);
INSERT INTO unidad_producto VALUES (1, 319, 2500);
INSERT INTO unidad_producto VALUES (1, 320, 2500);
INSERT INTO unidad_producto VALUES (1, 321, 4500);
INSERT INTO unidad_producto VALUES (1, 322, 4500);
INSERT INTO unidad_producto VALUES (5, 323, 200);
INSERT INTO unidad_producto VALUES (1, 324, 11500);
INSERT INTO unidad_producto VALUES (1, 325, 12500);
INSERT INTO unidad_producto VALUES (1, 326, 11500);
INSERT INTO unidad_producto VALUES (1, 327, 16500);
INSERT INTO unidad_producto VALUES (1, 328, 16500);
INSERT INTO unidad_producto VALUES (1, 329, 4500);
INSERT INTO unidad_producto VALUES (1, 465, 2500);
INSERT INTO unidad_producto VALUES (1, 330, 2800);
INSERT INTO unidad_producto VALUES (1, 331, 3000);
INSERT INTO unidad_producto VALUES (1, 332, 3500);
INSERT INTO unidad_producto VALUES (1, 333, 3000);
INSERT INTO unidad_producto VALUES (1, 334, 3000);
INSERT INTO unidad_producto VALUES (1, 336, 2000);
INSERT INTO unidad_producto VALUES (1, 335, 2500);
INSERT INTO unidad_producto VALUES (1, 337, 1000);
INSERT INTO unidad_producto VALUES (1, 466, 1500);
INSERT INTO unidad_producto VALUES (1, 339, 1500);
INSERT INTO unidad_producto VALUES (1, 338, 1500);
INSERT INTO unidad_producto VALUES (1, 340, 1500);
INSERT INTO unidad_producto VALUES (1, 341, 1300);
INSERT INTO unidad_producto VALUES (1, 342, 1300);
INSERT INTO unidad_producto VALUES (1, 343, 1300);
INSERT INTO unidad_producto VALUES (5, 347, 2000);
INSERT INTO unidad_producto VALUES (5, 467, 3000);
INSERT INTO unidad_producto VALUES (5, 468, 2000);
INSERT INTO unidad_producto VALUES (5, 469, 1600);
INSERT INTO unidad_producto VALUES (5, 346, 2000);
INSERT INTO unidad_producto VALUES (5, 348, 1000);
INSERT INTO unidad_producto VALUES (5, 349, 700);
INSERT INTO unidad_producto VALUES (5, 350, 500);
INSERT INTO unidad_producto VALUES (5, 345, 1500);
INSERT INTO unidad_producto VALUES (5, 344, 1000);
INSERT INTO unidad_producto VALUES (1, 351, 1000);
INSERT INTO unidad_producto VALUES (1, 352, 3500);
INSERT INTO unidad_producto VALUES (1, 353, 7800);
INSERT INTO unidad_producto VALUES (1, 354, 3500);
INSERT INTO unidad_producto VALUES (1, 355, 6500);
INSERT INTO unidad_producto VALUES (1, 357, 2000);
INSERT INTO unidad_producto VALUES (1, 358, 600);
INSERT INTO unidad_producto VALUES (1, 359, 3500);
INSERT INTO unidad_producto VALUES (1, 360, 4500);
INSERT INTO unidad_producto VALUES (18, 361, 15000);
INSERT INTO unidad_producto VALUES (5, 361, 5000);
INSERT INTO unidad_producto VALUES (5, 362, 4000);
INSERT INTO unidad_producto VALUES (18, 362, 12000);
INSERT INTO unidad_producto VALUES (5, 363, 3000);
INSERT INTO unidad_producto VALUES (18, 363, 9000);
INSERT INTO unidad_producto VALUES (1, 364, 800);
INSERT INTO unidad_producto VALUES (1, 365, 700);
INSERT INTO unidad_producto VALUES (1, 366, 600);
INSERT INTO unidad_producto VALUES (1, 367, 1700);
INSERT INTO unidad_producto VALUES (1, 368, 1700);
INSERT INTO unidad_producto VALUES (1, 369, 1700);
INSERT INTO unidad_producto VALUES (1, 370, 800);
INSERT INTO unidad_producto VALUES (1, 371, 700);
INSERT INTO unidad_producto VALUES (1, 372, 600);
INSERT INTO unidad_producto VALUES (1, 373, 700);
INSERT INTO unidad_producto VALUES (1, 470, 600);
INSERT INTO unidad_producto VALUES (1, 471, 400);
INSERT INTO unidad_producto VALUES (1, 374, 1500);
INSERT INTO unidad_producto VALUES (1, 375, 400);
INSERT INTO unidad_producto VALUES (1, 376, 350);
INSERT INTO unidad_producto VALUES (1, 377, 250);
INSERT INTO unidad_producto VALUES (1, 378, 2500);
INSERT INTO unidad_producto VALUES (1, 379, 2500);
INSERT INTO unidad_producto VALUES (1, 380, 2000);
INSERT INTO unidad_producto VALUES (1, 381, 1500);
INSERT INTO unidad_producto VALUES (1, 382, 1500);
INSERT INTO unidad_producto VALUES (1, 472, 3500);
INSERT INTO unidad_producto VALUES (1, 473, 5000);
INSERT INTO unidad_producto VALUES (1, 384, 1500);
INSERT INTO unidad_producto VALUES (1, 383, 1300);
INSERT INTO unidad_producto VALUES (1, 385, 2000);
INSERT INTO unidad_producto VALUES (1, 386, 2500);
INSERT INTO unidad_producto VALUES (1, 429, 3000);
INSERT INTO unidad_producto VALUES (1, 387, 3000);
INSERT INTO unidad_producto VALUES (1, 388, 3500);
INSERT INTO unidad_producto VALUES (1, 389, 4000);
INSERT INTO unidad_producto VALUES (1, 390, 4500);
INSERT INTO unidad_producto VALUES (1, 391, 6500);
INSERT INTO unidad_producto VALUES (1, 474, 5000);
INSERT INTO unidad_producto VALUES (1, 392, 3000);
INSERT INTO unidad_producto VALUES (1, 393, 250);
INSERT INTO unidad_producto VALUES (1, 394, 2000);
INSERT INTO unidad_producto VALUES (1, 395, 8000);
INSERT INTO unidad_producto VALUES (1, 396, 9000);
INSERT INTO unidad_producto VALUES (20, 475, 3000);
INSERT INTO unidad_producto VALUES (20, 397, 3500);
INSERT INTO unidad_producto VALUES (20, 398, 4000);
INSERT INTO unidad_producto VALUES (20, 399, 6000);
INSERT INTO unidad_producto VALUES (5, 400, 150);
INSERT INTO unidad_producto VALUES (1, 401, 4000);
INSERT INTO unidad_producto VALUES (1, 476, 100);
INSERT INTO unidad_producto VALUES (19, 402, 7800);
INSERT INTO unidad_producto VALUES (19, 403, 4500);
INSERT INTO unidad_producto VALUES (1, 404, 9000);
INSERT INTO unidad_producto VALUES (1, 405, 7000);
INSERT INTO unidad_producto VALUES (1, 406, 5000);
INSERT INTO unidad_producto VALUES (1, 407, 3000);
INSERT INTO unidad_producto VALUES (1, 408, 2500);
INSERT INTO unidad_producto VALUES (1, 410, 8000);
INSERT INTO unidad_producto VALUES (1, 411, 12000);
INSERT INTO unidad_producto VALUES (1, 412, 8500);
INSERT INTO unidad_producto VALUES (1, 413, 4500);
INSERT INTO unidad_producto VALUES (1, 414, 12500);
INSERT INTO unidad_producto VALUES (1, 415, 15000);
INSERT INTO unidad_producto VALUES (1, 416, 6000);
INSERT INTO unidad_producto VALUES (1, 417, 500);
INSERT INTO unidad_producto VALUES (1, 418, 300);
INSERT INTO unidad_producto VALUES (1, 419, 8000);
INSERT INTO unidad_producto VALUES (5, 420, 1500);
INSERT INTO unidad_producto VALUES (1, 421, 250);
INSERT INTO unidad_producto VALUES (1, 422, 300);
INSERT INTO unidad_producto VALUES (1, 477, 400);
INSERT INTO unidad_producto VALUES (1, 478, 100);
INSERT INTO unidad_producto VALUES (1, 479, 150);
INSERT INTO unidad_producto VALUES (1, 480, 300);
INSERT INTO unidad_producto VALUES (1, 481, 400);
INSERT INTO unidad_producto VALUES (1, 482, 100);
INSERT INTO unidad_producto VALUES (1, 423, 3500);
INSERT INTO unidad_producto VALUES (1, 424, 2500);
INSERT INTO unidad_producto VALUES (1, 425, 8600);
INSERT INTO unidad_producto VALUES (1, 426, 9000);
INSERT INTO unidad_producto VALUES (1, 427, 11000);
INSERT INTO unidad_producto VALUES (1, 430, 17000);
INSERT INTO unidad_producto VALUES (1, 432, 24000);
INSERT INTO unidad_producto VALUES (1, 483, 7000);
INSERT INTO unidad_producto VALUES (21, 484, 100);
INSERT INTO unidad_producto VALUES (1, 433, 3600);
INSERT INTO unidad_producto VALUES (1, 434, 2500);
INSERT INTO unidad_producto VALUES (1, 435, 800);
INSERT INTO unidad_producto VALUES (1, 436, 13000);
INSERT INTO unidad_producto VALUES (1, 437, 4500);
INSERT INTO unidad_producto VALUES (1, 438, 20500);
INSERT INTO unidad_producto VALUES (1, 439, 10000);
INSERT INTO unidad_producto VALUES (1, 440, 12500);
INSERT INTO unidad_producto VALUES (1, 441, 9000);
INSERT INTO unidad_producto VALUES (1, 442, 4000);
INSERT INTO unidad_producto VALUES (1, 443, 2500);
INSERT INTO unidad_producto VALUES (1, 444, 3500);
INSERT INTO unidad_producto VALUES (1, 445, 4500);
INSERT INTO unidad_producto VALUES (1, 446, 50);
INSERT INTO unidad_producto VALUES (1, 447, 2000);
INSERT INTO unidad_producto VALUES (1, 454, 4000);
INSERT INTO unidad_producto VALUES (1, 486, 4000);
INSERT INTO unidad_producto VALUES (20, 448, 2200);
INSERT INTO unidad_producto VALUES (1, 449, 7500);
INSERT INTO unidad_producto VALUES (1, 450, 10000);
INSERT INTO unidad_producto VALUES (1, 451, 1500);
INSERT INTO unidad_producto VALUES (1, 452, 4000);
INSERT INTO unidad_producto VALUES (1, 453, 3000);
INSERT INTO unidad_producto VALUES (20, 455, 2000);
INSERT INTO unidad_producto VALUES (1, 456, 1500);


--
-- Data for Name: vehiculo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO vehiculo VALUES ('XTJ245', 'Carga', 'No se jjajaja', 'Tampoco se xd');


--
-- Name: almacen_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY almacen
    ADD CONSTRAINT almacen_pkey PRIMARY KEY (id_almacen);


--
-- Name: barrio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY barrio
    ADD CONSTRAINT barrio_pkey PRIMARY KEY (id_barrio);


--
-- Name: categoria_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (codigo_c);


--
-- Name: categoria_producto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY categoria_producto
    ADD CONSTRAINT categoria_producto_pkey PRIMARY KEY (codigo_c, codigo_p);


--
-- Name: ciudad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ciudad
    ADD CONSTRAINT ciudad_pkey PRIMARY KEY (id_ciudad);


--
-- Name: cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (cedula_c);


--
-- Name: departamento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY departamento
    ADD CONSTRAINT departamento_pkey PRIMARY KEY (id_departamento);


--
-- Name: director_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY director
    ADD CONSTRAINT director_pkey PRIMARY KEY (cedula);


--
-- Name: empleado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY empleado
    ADD CONSTRAINT empleado_pkey PRIMARY KEY (id_empleado);


--
-- Name: factura_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY factura
    ADD CONSTRAINT factura_pkey PRIMARY KEY (id_factura);


--
-- Name: jefe_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY jefe
    ADD CONSTRAINT jefe_pkey PRIMARY KEY (cedula_j);


--
-- Name: marca_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY marca
    ADD CONSTRAINT marca_pkey PRIMARY KEY (codigo_m);


--
-- Name: mensajero_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY mensajero
    ADD CONSTRAINT mensajero_pkey PRIMARY KEY (cedula_m);


--
-- Name: mensajero_vehiculo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY mensajero_vehiculo
    ADD CONSTRAINT mensajero_vehiculo_pkey PRIMARY KEY (cedula_m, placa);


--
-- Name: nomina_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY nomina
    ADD CONSTRAINT nomina_pkey PRIMARY KEY (id_nomina);


--
-- Name: pedido_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pedido
    ADD CONSTRAINT pedido_pkey PRIMARY KEY (id_pedido);


--
-- Name: producto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY producto
    ADD CONSTRAINT producto_pkey PRIMARY KEY (codigo_p);


--
-- Name: proveedor_marca_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY proveedor_marca
    ADD CONSTRAINT proveedor_marca_pkey PRIMARY KEY (codigo_m, id);


--
-- Name: proveedor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY proveedor
    ADD CONSTRAINT proveedor_pkey PRIMARY KEY (id_proveedor);


--
-- Name: proveedor_producto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY proveedor_producto
    ADD CONSTRAINT proveedor_producto_pkey PRIMARY KEY (id, codigo_p);


--
-- Name: region_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY region
    ADD CONSTRAINT region_pkey PRIMARY KEY (id_region);


--
-- Name: sede_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sede
    ADD CONSTRAINT sede_pkey PRIMARY KEY (id_sede);


--
-- Name: unidad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY unidad
    ADD CONSTRAINT unidad_pkey PRIMARY KEY (codigo_u);


--
-- Name: unidad_producto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY unidad_producto
    ADD CONSTRAINT unidad_producto_pkey PRIMARY KEY (codigo_u, codigo_p);


--
-- Name: vehiculo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY vehiculo
    ADD CONSTRAINT vehiculo_pkey PRIMARY KEY (placa);


--
-- Name: almacen_id_sede_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY almacen
    ADD CONSTRAINT almacen_id_sede_fkey FOREIGN KEY (id_sede) REFERENCES sede(id_sede) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: barrio_id_ciudad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY barrio
    ADD CONSTRAINT barrio_id_ciudad_fkey FOREIGN KEY (id_ciudad) REFERENCES ciudad(id_ciudad) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: categoria_producto_codigo_c_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categoria_producto
    ADD CONSTRAINT categoria_producto_codigo_c_fkey FOREIGN KEY (codigo_c) REFERENCES categoria(codigo_c);


--
-- Name: categoria_producto_codigo_p_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categoria_producto
    ADD CONSTRAINT categoria_producto_codigo_p_fkey FOREIGN KEY (codigo_p) REFERENCES producto(codigo_p);


--
-- Name: ciudad_id_departamento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ciudad
    ADD CONSTRAINT ciudad_id_departamento_fkey FOREIGN KEY (id_departamento) REFERENCES departamento(id_departamento) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: cliente_id_barrio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT cliente_id_barrio_fkey FOREIGN KEY (id_barrio) REFERENCES barrio(id_barrio) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: departamento_id_region_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY departamento
    ADD CONSTRAINT departamento_id_region_fkey FOREIGN KEY (id_region) REFERENCES region(id_region) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: director_id_barrio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY director
    ADD CONSTRAINT director_id_barrio_fkey FOREIGN KEY (id_barrio) REFERENCES barrio(id_barrio) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: empleado_id_barrio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY empleado
    ADD CONSTRAINT empleado_id_barrio_fkey FOREIGN KEY (id_barrio) REFERENCES barrio(id_barrio) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: empleado_id_nomina_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY empleado
    ADD CONSTRAINT empleado_id_nomina_fkey FOREIGN KEY (id_nomina) REFERENCES nomina(id_nomina) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: jefe_id_barrio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jefe
    ADD CONSTRAINT jefe_id_barrio_fkey FOREIGN KEY (id_barrio) REFERENCES barrio(id_barrio) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: mensajero_id_barrio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mensajero
    ADD CONSTRAINT mensajero_id_barrio_fkey FOREIGN KEY (id_barrio) REFERENCES barrio(id_barrio) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: mensajero_id_nomina_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mensajero
    ADD CONSTRAINT mensajero_id_nomina_fkey FOREIGN KEY (id_nomina) REFERENCES nomina(id_nomina) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: mensajero_vehiculo_cedula_m_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mensajero_vehiculo
    ADD CONSTRAINT mensajero_vehiculo_cedula_m_fkey FOREIGN KEY (cedula_m) REFERENCES mensajero(cedula_m) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: mensajero_vehiculo_placa_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mensajero_vehiculo
    ADD CONSTRAINT mensajero_vehiculo_placa_fkey FOREIGN KEY (placa) REFERENCES vehiculo(placa) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: pedido_cedula_c_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pedido
    ADD CONSTRAINT pedido_cedula_c_fkey FOREIGN KEY (cedula_c) REFERENCES cliente(cedula_c) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: pedido_cedula_m_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pedido
    ADD CONSTRAINT pedido_cedula_m_fkey FOREIGN KEY (cedula_m) REFERENCES mensajero(cedula_m) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: pedido_codigo_u_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pedido
    ADD CONSTRAINT pedido_codigo_u_fkey FOREIGN KEY (codigo_u, codigo_p) REFERENCES unidad_producto(codigo_u, codigo_p) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: pedido_id_factura_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pedido
    ADD CONSTRAINT pedido_id_factura_fkey FOREIGN KEY (id_factura) REFERENCES factura(id_factura) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: producto_id_almacen_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY producto
    ADD CONSTRAINT producto_id_almacen_fkey FOREIGN KEY (id_almacen) REFERENCES almacen(id_almacen);


--
-- Name: proveedor_marca_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY proveedor_marca
    ADD CONSTRAINT proveedor_marca_fkey FOREIGN KEY (codigo_m) REFERENCES marca(codigo_m);


--
-- Name: proveedor_marca_id_pkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY proveedor_marca
    ADD CONSTRAINT proveedor_marca_id_pkey FOREIGN KEY (id) REFERENCES proveedor(id_proveedor);


--
-- Name: proveedor_producto_codigo_p_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY proveedor_producto
    ADD CONSTRAINT proveedor_producto_codigo_p_fkey FOREIGN KEY (codigo_p) REFERENCES producto(codigo_p);


--
-- Name: proveedor_producto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY proveedor_producto
    ADD CONSTRAINT proveedor_producto_id_fkey FOREIGN KEY (id) REFERENCES proveedor(id_proveedor);


--
-- Name: sede_cedula_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sede
    ADD CONSTRAINT sede_cedula_fkey FOREIGN KEY (cedula) REFERENCES director(cedula) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: sede_id_barrio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sede
    ADD CONSTRAINT sede_id_barrio_fkey FOREIGN KEY (id_barrio) REFERENCES barrio(id_barrio) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: unidad_producto_codigo_p_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY unidad_producto
    ADD CONSTRAINT unidad_producto_codigo_p_fkey FOREIGN KEY (codigo_p) REFERENCES producto(codigo_p);


--
-- Name: unidad_producto_codigo_u_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY unidad_producto
    ADD CONSTRAINT unidad_producto_codigo_u_fkey FOREIGN KEY (codigo_u) REFERENCES unidad(codigo_u);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

