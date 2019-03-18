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
    fecha_nacimiento date NOT NULL
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
    fecha_nacimiento date NOT NULL
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
    fecha_nacimiento date NOT NULL
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
    id_almacen integer NOT NULL,
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

COPY almacen (id_almacen, id_sede, nombre, cantidad, fecha_llegada, fecha_salida) FROM stdin;
1	1	Almacen santafe	54	2008-12-12	2010-12-19
\.


--
-- Data for Name: barrio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY barrio (id_barrio, id_ciudad, nombre) FROM stdin;
1	1	San alonso
2	1	Alfonso Lopez
3	1	Estoraquez
4	1	La universidad
\.


--
-- Data for Name: categoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY categoria (codigo_c, nombre, descripcion) FROM stdin;
\.


--
-- Data for Name: categoria_producto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY categoria_producto (codigo_c, codigo_p) FROM stdin;
\.


--
-- Data for Name: ciudad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ciudad (id_ciudad, id_departamento, nombre) FROM stdin;
1	1	Bucaramanga
\.


--
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cliente (cedula_c, id_barrio, nombre, apellido1, apellido2, direccion, sexo, profesion, telefono, correo, fecha_nacimiento) FROM stdin;
1102331112	2	Carlos	Santamaria	Moreno	Calle hhaha	M	Carpintero	3124445675	dshjshsd@gmail.com	1996-12-01
\.


--
-- Data for Name: departamento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY departamento (id_departamento, id_region, nombre) FROM stdin;
1	1	Santander
\.


--
-- Data for Name: director; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY director (cedula, id_barrio, nombre, apellido1, apellido2, direccion, telefono, sexo, correo) FROM stdin;
43434	2	dffdfd	fdfdfd	fdffd	fdfdfd	433443	M	dfdfdfd
\.


--
-- Data for Name: empleado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY empleado (id_empleado, id_barrio, id_nomina, nombre, apellido1, apellido2, direccion, cedula, sexo, cargo, ruc, telefono, correo, fecha_nacimiento) FROM stdin;
\.


--
-- Name: empleado_id_empleado_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('empleado_id_empleado_seq', 1, false);


--
-- Data for Name: factura; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY factura (id_factura, fecha_compra, cantidad_productos, descuento, total) FROM stdin;
1	1992-04-02	56	20	4500000
\.


--
-- Data for Name: jefe; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY jefe (cedula_j, nombre, apellido1, apellido2, direccion, telefono, sexo, correo, id_barrio, fecha_nacimiento) FROM stdin;
12223	djds	dsdsds	ddsdsds	dsdsbb	32333322233	M	dfdfdfd	2	1999-01-01
\.


--
-- Data for Name: marca; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY marca (codigo_m, nombre, descripcion, telefono) FROM stdin;
\.


--
-- Data for Name: mensajero; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY mensajero (cedula_m, id_barrio, id_nomina, nombre, apellido1, apellido2, direccion, sexo, cargo, ruc, telefono, correo, fecha_nacimiento) FROM stdin;
1	4	2	Oscar Esneyder	Sinuco	Tirado	Calle xd	M	Tendero	323232	3154573647	oscar_1699@hotmail.com	1999-04-16
\.


--
-- Name: mensajero_cedula_m_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('mensajero_cedula_m_seq', 1, true);


--
-- Data for Name: mensajero_vehiculo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY mensajero_vehiculo (cedula_m, placa, fecha, hora, descripcion) FROM stdin;
\.


--
-- Data for Name: nomina; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY nomina (id_nomina, fecha_inicio, fecha_fin, fondo_total) FROM stdin;
1	2018-01-29	2019-01-29	10000000
2	2015-05-23	2019-05-23	30000000
\.


--
-- Data for Name: pedido; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY pedido (id_pedido, cedula_c, codigo_u, codigo_p, id_factura, cedula_m, fecha, cantidad, descuento, precio_unitario, iva) FROM stdin;
\.


--
-- Data for Name: producto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY producto (codigo_p, nombre, medida, marca, descripcion, fecha_fabricacion, id_almacen) FROM stdin;
1	aceite 3 en 1	pequeño	\N	\N	\N	\N
2	aceite 3 en 1	grande	\N	\N	\N	\N
3	boxer	pequeño	\N	\N	\N	\N
4	boxer	mediano	\N	\N	\N	\N
5	cinta negra	grande	\N	\N	\N	\N
6	cinta negra	pequeño	\N	\N	\N	\N
7	chinches	\N	\N	\N	\N	\N
8	grafito	\N	\N	\N	\N	\N
9	cinta para cajas cafe	\N	\N	\N	\N	\N
10	cinta para cajas transparente	\N	\N	\N	\N	\N
11	teflon agua	grande	\N	\N	\N	\N
12	teflon agua	mediano	\N	\N	\N	\N
13	teflon agua	pequeño	\N	\N	\N	\N
14	ojo magico	\N	\N	\N	\N	\N
17	baso licuadora	\N	\N	\N	\N	\N
18	pegante instantaneo	\N	pegadit	\N	\N	\N
19	puntillas de acero	\N	\N	\N	\N	\N
20	cinta doble faz	1"	\N	\N	\N	\N
21	cinta doble faz	3/4"	\N	\N	\N	\N
22	cinta doble faz	1/2"	\N	\N	\N	\N
84	regulador de gas	\N	\N	\N	\N	\N
23	espatula	5"	bellota	\N	\N	\N
24	espatula	4"	bellota	\N	\N	\N
25	espatula	2"	hopex	\N	\N	\N
26	espatula	1 1/2"	hopex	\N	\N	\N
27	tapa bocas	\N	\N	color negro	\N	\N
29	chazo plastico	1/4"	\N	\N	\N	\N
30	chazo plastico	5/16"	\N	\N	\N	\N
31	chazo plastico	3/16"	\N	\N	\N	\N
32	chazo plastico	3/8"	\N	\N	\N	\N
33	cabulla	1m	ata facil	\N	\N	\N
34	cabula fique	1m	\N	\N	\N	\N
35	amarres plasticos	35cm	\N	\N	\N	\N
36	amarres plasticos	25cm	\N	\N	\N	\N
38	t sanitaria	2"	\N	\N	\N	\N
39	t sanitaria	1 1/2"	\N	\N	\N	\N
40	codo sanitario	2"	\N	\N	\N	\N
41	semi codo	2"	\N	\N	\N	\N
42	codo sanitario cxe	1 1/2"	\N	\N	\N	\N
45	buje	3 x 1 1/2"	\N	\N	\N	\N
44	buje	3 x 2"	\N	\N	\N	\N
85	lazo	\N	\N	\N	\N	\N
46	union sanitario	2"	\N	\N	\N	\N
47	union sanitario	1 1/2"	\N	\N	\N	\N
48	sifon sanitario	2"	\N	\N	\N	\N
49	buje	1 1/4 x 1/2"	\N	\N	\N	\N
50	buje	1 x 3/4"	\N	\N	\N	\N
51	buje	3/4 x 1/2"	\N	\r\n	\N	\N
53	buje	1 1/2 x 3/4"	\N	\N	\N	\N
54	buje	1 1/2 x 1"	\N	\N	\N	\N
55	buje	1 1/2 x 1 1/4"	\N	\N	\N	\N
56	buje	1 1/2 x 1/2"	\N	\N	\N	\N
57	buje	1 1/4 x 3/4"	\N	\N	\N	\N
58	buje	1 x 1/2"	\N	\N	\N	\N
60	codo	1"	\N	\N	\N	\N
61	union	1 1/4"	\N	\N	\N	\N
62	union	1"	\N	\N	\N	\N
63	codo	1 1/2"	\N	\N	\N	\N
64	codo	1 1/4"	\N	\N	\N	\N
65	semi codo	1 1/2"	\N	\N	\N	\N
66	semi codo	1"	\N	\N	\N	\N
67	union	3/4"	\N	\N	\N	\N
68	codo sanitario cxe	2"	\N	\N	\N	\N
69	semi codo	1/2"	\N	\N	\N	\N
52	buje	1 1/4 x 1"	\N	\N	\N	\N
70	estuco plastico	\N	\N	\N	\N	\N
71	manguera lavadora	\N	\N	agua limpia	\N	\N
72	manguera lavadora	\N	\N	desague	\N	\N
73	poma universal ducha	\N	\N	\N	\N	\N
74	poma estriada	\N	\N	\N	\N	\N
75	poma cuadrante	\N	\N	\N	\N	\N
76	poma cierre rapido	\N	\N	\N	\N	\N
77	codo	1/2"	\N	\N	\N	\N
78	t	3/4"	\N	\N	\N	\N
79	alambre multiuso	\N	\N	\N	\N	\N
80	cable ethernet	3m	\N	\N	\N	\N
81	cable ethernet	5m	\N	\N	\N	\N
82	cable ethernet	10m	\N	\N	\N	\N
83	toma telefono	\N	legrant - luminex	\N	\N	\N
114	toma doble sobre muro	\N	osblack	\N	\N	\N
86	manguera gas tejida	1.20m	\N	\N	\N	\N
87	manguera gas tejida	1.5m	\N	\N	\N	\N
88	manguera gas lisa	1m	\N	\N	\N	\N
89	manguera gas lisa	1.5m	\N	\N	\N	\N
90	manguera gas lisa	2m	\N	\N	\N	\N
91	caja rectangular	\N	\N	\N	\N	\N
92	interruptor sencillo	\N	ave	\N	\N	\N
93	interruptor con toma	\N	ave	\N	\N	\N
94	toma doble con polo	\N	ave	\N	\N	\N
95	plafon	\N	ave	\N	\N	\N
96	cemento blanco	\N	\N	\N	\N	\N
97	cemento gris	\N	\N	\N	\N	\N
98	cal	\N	\N	\N	\N	\N
99	pega perfecto	\N	\N	\N	\N	\N
100	estuca dos	\N	\N	\N	\N	\N
101	yeso	\N	\N	\N	\N	\N
102	binda boquilla color	\N	sika	\N	\N	\N
103	probador de corriente	grande	\N	\N	\N	\N
104	probador de corriente	pequeño	\N	\N	\N	\N
115	cable audio y video	\N	\N	\N	\N	\N
116	toma telefono	\N	legrant luminex	\N	\N	\N
118	terminal parabolica	\N	\N	\N	\N	\N
117	terminal parabolica	\N	\N	siliconado	\N	\N
105	taco enchufable	15v	luminex	\N	\N	\N
106	taco enchufable	20v	luminex	\N	\N	\N
107	taco enchufable	30v	luminex	\N	\N	\N
108	taco enchufable	40v	luminex	\N	\N	\N
109	interruptor sencillo	\N	avia	\N	\N	\N
110	toma doble	\N	levinton	\N	\N	\N
111	multi toma 6 puestos	\N	globy	\N	\N	\N
112	multi toma 3 puestos	\N	\N	\N	\N	\N
113	estarter fs-4	30-40w	\N	\N	\N	\N
119	union parabolica	\N	\N	\N	\N	\N
120	terminal tv cable	\N	\N	requiere ponchadora	\N	\N
123	soquet	\N	\N	porcelana	\N	\N
121	t parabolica	\N	\N	2 vias	\N	\N
122	t parabolica	\N	\N	3 vias	\N	\N
124	mini motor	\N	\N	\N	\N	\N
126	plafon bombillo linterna	\N	\N	\N	\N	\N
127	plafon bombillo de aji	\N	\N	\N	\N	\N
128	terminal rapido	\N	\N	\N	\N	\N
129	t de telefono	\N	\N	\N	\N	\N
130	splinter	\N	sekuro	\N	\N	\N
131	tapones para tomas	\N	\N	\N	\N	\N
132	cubo telefonico	\N	\N	\N	\N	\N
133	clavija telefono	\N	\N	\N	\N	\N
134	interruptor lampara	\N	\N	\N	\N	\N
135	toma pasta	\N	ave	\N	\N	\N
136	clavija pasta	\N	ave	\N	\N	\N
137	union telefono	\N	\N	\N	\N	\N
138	convertidor polo a tierra	\N	codelca	\N	\N	\N
139	porta pila 9v	\N	\N	\N	\N	\N
140	porta pila aa	\N	\N	\N	\N	\N
141	pila 9v	\N	\N	\N	\N	\N
142	pila aa	\N	\N	\N	\N	\N
143	pila aaa	\N	\N	\N	\N	\N
144	chazo puntilla	5/16"	\N	\N	\N	\N
28	chazo plastico	1/2"	\N	\N	\N	\N
16	metro	5m	\N	economico	\N	\N
37	palustre	\N	gavilan	\N	\N	\N
125	herraje para tacos	\N	\N	2 puestos	\N	\N
145	t pvc	1/2"	\N	\N	\N	\N
59	buje	2 x 1"	\N	\N	\N	\N
146	tapon pvc	1/2"	\N	\N	\N	\N
147	tapon pvc roscado	1/2"	\N	\N	\N	\N
148	adaptador macho pvc	1/2"	\N	\N	\N	\N
149	adaptador hembra pvc	1/2"	\N	\N	\N	\N
150	union pvc	1/2"	\N	\N	\N	\N
151	brocha	4"	\N	\N	\N	\N
152	brocha	3"	\N	\N	\N	\N
153	brocha	2 1/2"	\N	\N	\N	\N
154	brocha	2"	\N	\N	\N	\N
155	brocha	1 1/2"	\N	\N	\N	\N
156	brocha	1"	\N	\N	\N	\N
157	guantes plasticos	\N	eterna	\N	\N	\N
158	cable churco para telefono	largo	\N	\N	\N	\N
159	cable churco para telefono	corto	\N	\N	\N	\N
160	toma	\r\n	codelca	\N	\N	\N
161	convertidor pata redonda a pata plana 	\N	\N	\N	\N	\N
162	soquet de enchufuar para bombillo	\N	\N	\N	\N	\N
163	clavija	grande	codelca	\N	\N	\N
164	clavija	pequeña	codelca	\N	\N	\N
165	clavija polo a tierra	grande	codelca	\N	\N	\N
166	toma aerea polo a tierra	\N	codelca	\N	\N	\N
167	benjamin	\N	\N	\N	\N	\N
168	soket	\N	\N	instalacion de bombillo	\N	\N
169	electron losa	\N	\N	"churrusco para calentar agua"	\N	\N
170	grapas para cable	\N	\N	parabolica, telefono	\N	\N
171	tabla rectangular	\N	\N	\N	\N	\N
172	tabla cuadrada	\N	\N	\N	\N	\N
173	tabla redonda	\N	\N	\N	\N	\N
174	creolina	\N	\N	\N	\N	\N
175	soda caustica	\N	\N	\N	\N	\N
176	acido muriatico	\N	\N	\N	\N	\N
233	toma parabolica	\N	legrand galica1	\N	\N	\N
234	toma telefono 	\N	legrand galica1	\N	\N	\N
177	bisagra omega II	3"	induma	\N	\N	\N
235	toma telefono y parabolica	\N	luminex	\N	\N	\N
178	pasador aleman	2"	\N	\N	\N	\N
236	toma doble	\N	legrand ambia	\N	\N	\N
179	porta candado	3"	\N	\N	\N	\N
180	porta candado	2 1/2"	\N	\N	\N	\N
181	bisagra comun	2"	\N	\N	\N	\N
182	colpega	\N	\N	\N	\N	\N
183	anticorrocivo aerosol	\N	\N	\N	\N	\N
184	pintura novaflex tipo III blanco	\N	\N	\N	\N	\N
185	rodillo felpa	\N	\N	\N	\N	\N
186	rodillo espuma	\N	\N	\N	\N	\N
187	manguera sanitario	\N	grival	\N	\N	\N
188	manguera lavaplatos	\N	grival	\N	\N	\N
189	asiento sanitario	\N	corona	\N	\N	\N
190	sifon botella lavamanos	\N	grival	\N	\N	\N
191	manija sanitario	\N	grival	\N	\N	\N
192	sifon en p lavaplatos	\N	grival	\N	\N	\N
193	valvula regualcion plastica sanitario	\N	grival	\N	\N	\N
194	llave lavamanos plateada	\N	grival	\N	\N	\N
195	canastilla lavaplatos	\N	grival	\N	\N	\N
196	desague sencillo lavamanos	\N	grival	\N	\N	\N
197	valvula de entrada sanitario	\N	grival	\N	\N	\N
198	sifon flexible gris	\N	grival	\N	\N	\N
199	griferia completa sanitario	\N	grival	\N	\N	\N
200	llave lavamanos negra	\N	grival	\N	\N	\N
201	gafas de proteccion	\N	\N	\N	\N	\N
202	brocha de fique	\N	\N	\N	\N	\N
203	novaflex esmalte domestico blanco	\N	\N	\N	\N	\N
204	novaflex vinilo tipo 1 lavabl	\N	\N	\N	\N	\N
206	cilicona universal 	\N	toolcraft	\N	\N	\N
205	cilicona universal	\N	sika	\N	\N	\N
207	extension electrica	2m	\N	\N	\N	\N
208	extension electrica	3m	\N	\N	\N	\N
209	extension electrica	4m	\N	\N	\N	\N
210	extension electrica	5m	\N	\N	\N	\N
211	tapa ciega rectangular plastica electrica	\N	\N	\N	\N	\N
212	tapa ciega redonda plastica electrica	\N	\N	\N	\N	\N
213	tapa ciega redonda metalica electrica	\N	\N	\N	\N	\N
214	tapa para toma doble levinton	\N	\N	\N	\N	\N
237	caja octagonal plastica	\N	\N	\N	\N	\N
215	bombillo 	53v	ilumax	\N	\N	\N
216	bombillo led	10v	ilumax	\N	\N	\N
217	bombillo led	6v	ilumax	\N	\N	\N
218	bombillo	25v	starluz	\N	\N	\N
219	racor hembra bronce	\N	\N	\N	\N	\N
220	racor macho hembra plastico	\N	\N	\N	\N	\N
222	cadena amarilla	\N	\N	\N	\N	\N
223	cadena galvanizada plateada	\N	\N	\N	\N	\N
226	bombillo vela e14	\N	\N	\N	\N	\N
227	bombillo vela e12	\N	\N	\N	\N	\N
221	union de reparacion	1/2"	\N	\N	\N	\N
225	bombillo vela e27	\N	\N	para lamparas, rosca normañ	\N	\N
230	interruptor doble	\N	legrand galica2	\N	\N	\N
229	toma interruptor polo	\N	legrand galica2	\N	\N	\N
228	toma doble polo	\N	legrand galica2	\N	\N	\N
231	toma interruptor	\N	legrand galica1	\N	\N	\N
232	interruptor timbre	\N	legrand galica1	\N	\N	\N
238	sello lengueta flapper	\N	grival	macho	\N	\N
240	extension grabadora	\N	\N	\N	\N	\N
243	base licuadora	\N	\N	\N	\N	\N
245	veneno raton	\N	tres pasitos	\N	\N	\N
247	tapon olla de precion negro	\N	\N	\N	\N	\N
248	tapon olla de precion negro  - rojo	\N	\N	\N	\N	\N
241	cuchilla licuadora	\N	oster	\N	\N	\N
242	tapa licuadora	\N	oster	\N	\N	\N
249	ruana licuadora	\N	\N	\N	\N	\N
250	escualizador licuadora economico	\N	\N	\N	\N	\N
251	escualizador licuadora original	\N	\N	\N	\N	\N
252	cuadrante licuadora	\N	\N	\N	\N	\N
253	guarda cable plancha	\N	\N	\N	\N	\N
254	boton switche licuadora	\N	\N	\N	\N	\N
255	empaque licudora oster	\N	\N	\N	\N	\N
257	poma ducha cuadrante cuadrado original	\N	grival	\N	\N	\N
259	bastago mezclador cierre rapido	pequeño	grival	vender conn mostrario	\N	\N
261	bastago ducha	\N	grival	vender con mostrario	\N	\N
260	empaque nariz lavaplatos	\N	grival	\N	\N	\N
263	plafon	\N	luminex	\N	\N	\N
264	cuerda tendedero	1m	\N	\N	\N	\N
265	masilla epoxica	30g	\N	\N	\N	\N
266	masilla epoxica	50g	\N	\N	\N	\N
267	t electrica	\N	\N	\N	\N	\N
268	correa para amarres plastico	10cm	\N	\N	\N	\N
270	abrazadera 10-06	\N	titan	\N	\N	\N
271	abrazadera 10-24	\N	titan	\N	\N	\N
272	empaque para racor de maguera	\N	\N	\N	\N	\N
273	empaque llave terminal	\N	\N	\N	\N	\N
274	empaque llave ducha	\N	\N	\N	\N	\N
275	toma doble interruptor doble sobre muro	\N	ave	\N	\N	\N
239	sello lengueta bajo consumo	\N	grival	hembra	\N	\N
244	chapa escritorio	\N	\N	cajon de madera	\N	\N
256	empaque unidad selle	\N	grival	llave lavamanos goteando	\N	\N
262	tuerca empaque	\N	grival	se vende junto al bastago	\N	\N
269	abrazadera 10-16	\N	titan	para manguera de 1/2"	\N	\N
276	toma doble sobre muro	\N	ave	\N	\N	\N
277	interruptor sencillo sobre muro	\N	ave	\N	\N	\N
278	toma sencillo sobre muro	\N	ave	\N	\N	\N
279	toma telefoo sobre muro	\N	astral	\N	\N	\N
280	interruptor doble sobre muro	\N	astral	\N	\N	\N
282	ponchada de cable telefono	\N	\N	\N	\N	\N
281	cable liso telefono	1m	\N	\N	\N	\N
283	tubo electrico	3m	\N	\N	\N	\N
284	tubo pvc 1/2"	1cm	\N	\N	\N	\N
285	tubo pvc 3/4"	\N	\N	\N	\N	\N
286	tubo pvc 1"	\N	\N	\N	\N	\N
287	tubo pvc 1 1/4"	\N	\N	\N	\N	\N
289	tubo pvc 2"	\N	\N	\N	\N	\N
290	perfil de aluminio	\N	\N	\N	\N	\N
292	esquineros	\N	\N	\N	\N	\N
293	canaleta adesiva	ancha	mercury	\N	\N	\N
294	canaleta adesiva	delgada	mercury	\N	\N	\N
295	remache ciego	pequeño	\N	\N	\N	\N
296	broca muro	3/16"	\N	\N	\N	\N
297	broca muro	1/4"	\N	\N	\N	\N
298	broca muro	5/16"	\N	\N	\N	\N
299	broca muro	3/8"	\N	\N	\N	\N
300	broca metal	3/32"	\N	\N	\N	\N
301	broca metal	1/8"	\N	\N	\N	\N
302	broca metal	5/32"	\N	\N	\N	\N
358	caucho de olla precion universal economico	\N	\N	\N	\N	\N
359	empaque de olla precion sliconado	\N	\N	\N	\N	\N
303	broca metal	3/16"	\N	\N	\N	\N
304	broca metal	1/4"	\N	\N	\N	\N
305	puntas de taladro	\N	\N	\N	\N	\N
306	segueta	\N	nicholson	\N	\N	\N
360	empaque de olla umca	\N	\N	\N	\N	\N
307	destornillador estrella	1/8 x 4"	\N	\N	\N	\N
309	cincel	1/2 x 8"	\N	\N	\N	\N
310	cincel	3/8 x 8"	\N	\N	\N	\N
311	cincel	3/4 x 8"	\N	\N	\N	\N
315	metro	3m	bellota	\N	\N	\N
312	cautin	\N	\N	\N	\N	\N
313	alicate	\N	\N	\N	\N	\N
314	llave briston	\N	\N	\N	\N	\N
316	lima triangular	\N	\N	\N	\N	\N
318	llave mixta	10	\N	\N	\N	\N
319	llave mixta	11	\N	\N	\N	\N
320	llave mixta	12	\N	\N	\N	\N
322	llave mixta	13	\N	\N	\N	\N
321	llave mixta	14	\N	\N	\N	\N
324	martillo	\N	\N	\N	\N	\N
326	llave expanciva	8	\N	\N	\N	\N
327	llave expanciva	10	\N	\N	\N	\N
325	cegueta con marco	\N	\N	\N	\N	\N
328	llave de tubo	10	pertul	\N	\N	\N
329	cepillo de acero	1"	\N	\N	\N	\N
330	rodillo epoxico	3"	\N	\N	\N	\N
331	rodillo epoxico	4"	\N	\N	\N	\N
332	rodillo epoxico	5"	\N	\N	\N	\N
333	destornillador pala	1/4 x 6"	\N	\N	\N	\N
334	destornillador pala	3/16 x 8"	\N	\N	\N	\N
353	sintesolda 10 min	\N	\N	\N	\N	\N
336	destornillador pala	3/16 x 3"	\N	\N	\N	\N
337	destornillador pala	1/8 x 2 1/2"	\N	\N	\N	\N
338	lija	150	\N	\N	\N	\N
339	lija	80	\N	\N	\N	\N
340	lija	120	\N	\N	\N	\N
341	lija	220	\N	\N	\N	\N
342	lija	400	\N	\N	\N	\N
343	lija	320	\N	\N	\N	\N
346	alambre electrico	10	centelsa	amarillo	\N	\N
349	cable economico	16	duplex	\N	\N	\N
374	margarita	\N	\N	gancho para recoger la cortina	\N	\N
348	cable economico	14	duplex	\N	\N	\N
345	alambre electrico	12	centelsa	negro y verde	\N	\N
347	cable economico	12	duplex	\N	\N	\N
373	terminal cortina	1"	\N	\N	\N	\N
351	pegante instantaneo	\N	super blue	\N	\N	\N
352	silicona 	50ml	pegadit	\N	\N	\N
354	soldadura pvc	pequeña	\N	\N	\N	\N
355	soldadura pvc	mediano	\N	\N	\N	\N
356	limpiador pvc	pequeño	\N	\N	\N	\N
357	caucho de olla precion universal original	\N	\N	\N	\N	\N
361	tubo cortina	1"	\N	\N	\N	\N
362	tubo cortina	3/4"	\N	\N	\N	\N
363	tubo cortina	1/2"	\N	\N	\N	\N
364	soporte cortina	1"	\N	\N	\N	\N
365	soporte cortina	3/4"	\N	\N	\N	\N
366	soporte cortina	1/2"	\N	\N	\N	\N
367	soporte cortina doble	1"	\N	\N	\N	\N
368	soporte cortina doble	3/4"	\N	\N	\N	\N
369	soporte cortina doble	1/2"	\N	\N	\N	\N
370	plafon de cortina	1"	\N	\N	\N	\N
371	plafon de cortina	3/4"	\N	\N	\N	\N
372	plafon de cortina	1/2"	\N	\N	\N	\N
375	argolla cortina	1"	\N	\N	\N	\N
376	argolla cortina	3/4"	\N	\N	\N	\N
377	argolla cortina	1/2"	\N	\N	\N	\N
378	codo galvanizado	3/8"	\N	\N	\N	\N
379	codo galvanizado	1/2"	\N	\N	\N	\N
380	union galvanizada	1/2"	\N	\N	\N	\N
381	tapon hembra galvanizado	1/2"	\N	\N	\N	\N
382	tapon macho galvanizado	1/2"	\N	\N	\N	\N
383	niple todo rosca	\N	\N	\N	\N	\N
385	niple galvanizado	10cm	\N	\N	\N	\N
384	niple galvanizado	5cm	\N	\N	\N	\N
387	niple galvanizado	20cm	\N	\N	\N	\N
388	niple galvanizado	25cm	\N	\N	\N	\N
392	t galvanizada	1/2"	\N	\N	\N	\N
390	niple galvanizado	35cm	\N	\N	\N	\N
391	niple galvanizado	50cm	\N	\N	\N	\N
395	llana metalica liza	\N	\N	\N	\N	\N
394	plafon metalico	3/4"	\N	cortina, tubo pesado	\N	\N
405	candado	50mm	trek, vyba	\N	\N	\N
411	candado	40mm	hermex	candado de laton	\N	\N
408	candado	25mm	\N	pequeño color negro	\N	\N
412	candado	30mm	hermex	candado de laton	\N	\N
397	piamigo	6 x 8"	\N	\N	\N	\N
398	piamigo	8 x 10"	\N	\N	\N	\N
399	piamigo	10 x 12"	\N	\N	\N	\N
400	suncho	\N	\N	\N	\N	\N
401	pila d	\N	tornex	\N	\N	\N
402	canaleta adesiva	ancha	dexon	\N	\N	\N
403	canaleta adesiva	delgada	dexon	\N	\N	\N
404	candado	60mm	luxfort	\N	\N	\N
406	candado	40mm	luxfort	\N	\N	\N
407	candado	30mm	\N	\N	\N	\N
409	candado	20mm	\N	pequeño color negro	\N	\N
414	llave de paso gas	\N	\N	mariposa amarilla	\N	\N
415	llave de paso bola antifraude	\N	\N	para contador de agua	\N	\N
291	dilataciones	\N	\N	win	\N	\N
288	tubo pvc 1 1/2"	\N	\N	sanitario "amarillo"	\N	\N
386	niple galvanizado	15cm	\N	\N	\N	\N
308	destornillador estrella	3/16 x 4"	\N	\N	\N	\N
335	destornillador pala	3/16 x 6"	\N	\N	\N	\N
416	disco diamantado segmentado 	4 1/2"	corneta	\N	\N	\N
417	bombillo para linterna	\N	\N	\N	\N	\N
419	pito para olla	\N	corona	\N	\N	\N
420	soldadura de estaño	\N	\N	\N	\N	\N
429	duplicado de llaves	\N	\N	\N	\N	\N
472	duplicado de llaves	\N	\N	con figuras	\N	\N
423	barrilito de la manguera de gas tejida	\N	\N	\N	\N	\N
424	barrilito de la manguera de gas lisa	\N	\N	\N	\N	\N
473	llaveros	\N	\N	\N	\N	\N
389	niple galvanizado	30cm	\N	\N	\N	\N
425	manguera de gas lisa	1m	\N	\N	\N	\N
426	manguera de gas lisa	1.5m	\N	\N	\N	\N
427	manguera de gas lisa	2m	\N	\N	\N	\N
428	manguera de gas tejida	1m	\N	\N	\N	\N
430	manguera de gas tejida	1.2m	\N	\N	\N	\N
431	manguera de gas tejida	1.5m	\N	\N	\N	\N
432	manguera de gas tejida	2m	\N	\N	\N	\N
433	yee para lavadora blanca	\N	\N	\N	\N	\N
435	bombillo de aji de colores	\N	\N	\N	\N	\N
474	niple galvanizado	45cm	\N	\N	\N	\N
442	brillametal	\N	\N	\N	\N	\N
438	llave terminal	\N	grival	\N	\N	\N
439	llave terminal	\N	pretul	\N	\N	\N
440	llave terminal	\N	truper	\N	\N	\N
396	llana metalica ranurada	\N	\N	\N	\N	\N
475	piamigo	5 x 6"	\N	\N	\N	\N
443	cinta de enmascarar	1/2"	\N	\N	\N	\N
444	cinta de enmascarar	3/4"	\N	\N	\N	\N
445	cinta de enmascarar	1"	\N	\N	\N	\N
446	gancho de cortina	\N	\N	\N	\N	\N
413	candado	25mm	hermex	candado pequeño de hierro,pequeño color gris	\N	\N
449	ducha baño de boton	\N	plast grifos	\N	\N	\N
450	ducha baño lluvia	\N	plast grifos	\N	\N	\N
451	rollito del papel higienico	\N	\N	\N	\N	\N
452	chupas destapa caños	\N	\N	\N	\N	\N
453	pistola plastica para maguera	\N	\N	\N	\N	\N
421	cancamo cerrado	10	\N	\N	\N	\N
422	cancamo cerrado	12	\N	\N	\N	\N
454	rejilla de piso	4 x 3"	\N	\N	\N	\N
456	valvula para la pila	\N	\N	\N	\N	\N
224	bombillo nevera	15v	\N	preferiblemente con mostrario	\N	\N
246	chapa escritorio cuadrada	\N	\N	cajon de madera	\N	\N
258	bastago mezclador cierre rapido	grande	grival	vender con mostrario	\N	\N
323	cuerda elastica para amarres	\N	\N	amarrar cajas, parece hecha de retazos de tela	\N	\N
393	abrazadera palstica	1/2"	\N	para recoger tubos	\N	\N
410	candado	50mm	hermex	candado de hierro	\N	\N
418	grapas para espejo	\N	\N	"manitas" para sujetar/poner un espejo	\N	\N
434	mariposa para llave terminal	\N	\N	mirar el cuadrante	\N	\N
437	disco metal	\N	dewalt	pulidora, cortar metal	\N	\N
447	rejilla de piso	3 x 2"	celta	rejilla de 2"	\N	\N
448	grapas para lavamanos	\N	\N	grapa para montar un lavamanos	\N	\N
455	tornillo herraje	\N	\N	para el aciento del sanitario	\N	\N
15	metro	3m	\N	economico	\N	\N
43	buje	2 x 1 1/2"	\N	\N	\N	\N
457	manguera de gas tejida	2m	\N	\N	\N	\N
458	herraje para tacos 	\N	\N	3 puestos	\N	\N
459	brocha	1/2"	\N	\N	\N	\N
460	metro	5m	bellota	\N	\N	\N
461	metro	8m	bellota	\N	\N	\N
317	espatula plastica	3"	truper	\N	\N	\N
462	espatula plastica economica	pequeña	\N	\N	\N	\N
463	espatula plastica economica	mediana	\N	\N	\N	\N
464	espatula plastica economica	grande	\N	\N	\N	\N
465	rodillo epoxico	2"	\N	\N	\N	\N
466	destornillador pala	1/8 x 4"	\N	\N	\N	\N
350	cable economico	18	duplex	\N	\N	\N
467	cable original	12	centelsa	\N	\N	\N
468	cable original	14	centelsa	\N	\N	\N
469	cable original	16	centelsa	\N	\N	\N
344	alambre electrico 	14	centelsa	blanco	\N	\N
470	terminal cortina	3/4"	\N	\N	\N	\N
471	terminal cortina	1/2"	\N	\N	\N	\N
477	cancamo cerrado	14	\N	\N	\N	\N
476	grapas para suncho	\N	\N	\N	\N	\N
478	cancamo cerrado	pequeño	\N	tamaño menor a 10	\N	\N
479	cancamo abierto	1"	\N	\N	\N	\N
480	cancamo abierto	1 1/2"	\N	\N	\N	\N
481	cancamo abierto	2"	\N	\N	\N	\N
482	cancamo abierto	pequeño	\N	tamaño menor a 1"	\N	\N
483	pintura en aerosol 	400ml - 280g	toolcraft	\N	\N	\N
484	alambre dulce	\N	\N	\N	\N	\N
436	chapa de alcoba	\N	y&y	\N	\N	\N
485	llave terminal	\N	truper	\N	\N	\N
441	disco diamantado segmentado	4 - 1/2 x 7/8"	diamond	cortar concreto, muro	\N	\N
486	regilla piso	5 x 3"	\N	\N	\N	\N
\.


--
-- Data for Name: proveedor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY proveedor (id_proveedor, nombre, direccion, telefono) FROM stdin;
\.


--
-- Data for Name: proveedor_marca; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY proveedor_marca (codigo_m, id) FROM stdin;
\.


--
-- Data for Name: proveedor_producto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY proveedor_producto (id, codigo_p) FROM stdin;
\.


--
-- Data for Name: region; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY region (id_region, nombre) FROM stdin;
1	Andina
\.


--
-- Data for Name: sede; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sede (id_sede, nombre, direccion, telefono, id_barrio, cedula) FROM stdin;
1	Sede uno	Callejjasjasj	3123456789	2	43434
\.


--
-- Data for Name: unidad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY unidad (codigo_u, nombre, descripcion) FROM stdin;
1	unidad	\N
2	caja	50 unidades
3	caja	1 libra
4	bola	\N
6	bolsa	\N
7	bolsa	1kg
8	chipa	18m
9	madeja	8m
5	metro	1m
10	bulto	10kg
11	bulto	25kg
12	bolsa	2kg
13	bolsa	1lb
14	trio	\N
15	galon	\N
16	1/4 de galon 	\N
17	bolsa	100
18	tramo	3m
19	tramo	2m
20	par	2 unidades
21	chipa	1 rueda
\.


--
-- Data for Name: unidad_producto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY unidad_producto (codigo_u, codigo_p, precio) FROM stdin;
1	1	3000
1	2	5500
1	3	1600
1	4	2500
1	5	2500
1	6	1200
2	7	1200
1	8	2000
1	9	2500
1	10	2000
1	11	2500
1	12	1200
1	13	600
1	14	4500
1	15	3500
1	16	5000
1	17	5000
1	18	3500
3	19	6000
1	20	4500
1	21	3500
1	22	2600
1	23	6000
1	24	5000
1	25	3000
1	26	2500
1	27	750
1	29	50
1	28	100
1	30	100
1	31	100
1	32	100
4	33	3200
5	33	100
4	34	1500
6	35	15500
1	35	200
6	36	10500
1	36	150
1	37	14500
1	38	4000
1	39	3500
1	40	2500
1	41	3000
1	42	2500
1	43	1500
1	44	2800
1	45	2800
1	46	1500
1	47	1400
1	48	4000
1	51	600
1	55	2200
1	49	1800
1	50	700
1	54	2500
1	52	1200
1	53	1600
1	58	1000
1	56	1600
1	57	1200
1	59	3000
1	60	1200
1	61	1500
1	62	1000
1	63	2000
1	64	2000
1	65	2500
1	66	1200
1	67	800
1	68	3000
1	69	600
7	70	3800
1	71	10500
1	72	10500
1	73	4000
1	74	4000
1	75	4000
1	76	2500
1	77	600
1	78	1000
8	79	4500
1	80	4500
1	81	6500
1	82	11000
1	83	7000
1	84	10000
5	85	400
9	85	3000
1	86	17000
1	87	18000
1	457	24000
1	88	8600
1	89	9000
1	90	11000
1	91	700
1	92	5500
1	93	8500
1	94	5500
1	95	2500
7	96	1700
7	97	1000
7	98	1500
10	98	10000
7	99	1000
11	99	14700
7	100	1700
7	101	1500
12	102	10800
1	103	3500
1	104	2500
1	105	11500
1	106	11500
1	107	14000
1	108	14000
1	110	4000
1	111	9000
1	112	6500
1	113	600
1	114	3000
1	115	3500
1	116	7000
1	117	650
1	118	350
1	119	500
1	120	1000
1	121	1300
1	122	1500
1	123	2000
1	124	3000
1	125	4500
1	458	6000
1	126	500
1	127	500
1	128	1200
1	129	1500
1	130	3000
1	131	300
1	132	1500
1	133	1500
1	134	1000
1	135	1700
1	136	1200
1	137	1500
1	138	3000
1	139	800
1	140	1200
1	143	700
1	141	4500
1	142	700
1	144	200
1	145	700
1	146	600
1	147	600
1	148	600
1	149	600
1	150	600
1	151	8500
1	152	6500
1	156	2500
1	155	3500
1	154	4500
1	158	3000
1	153	5500
1	459	1500
1	157	3500
1	159	2000
1	160	3500
1	161	1500
1	162	1500
1	163	2300
1	164	2000
1	165	5000
1	166	4000
1	167	3500
1	168	2000
1	169	3000
1	170	1200
1	171	1000
1	172	600
1	173	1000
1	174	3000
13	175	4500
1	176	2500
14	177	6000
1	178	2000
1	179	2500
1	180	2000
1	181	800
1	182	4500
1	183	8500
15	184	20000
1	185	4000
1	186	3500
1	187	3000
1	188	3000
1	189	20000
1	190	7500
1	191	11500
1	192	7000
1	193	13000
1	194	16000
1	195	10000
1	196	8800
1	197	19000
1	198	12000
1	199	33500
1	200	12000
1	201	3000
1	202	2000
16	203	16700
16	204	16000
1	205	9800
1	206	7500
1	207	4500
1	208	5500
1	209	6500
1	210	7500
1	211	500
1	212	500
1	213	500
1	214	500
1	215	3000
1	216	7000
1	217	6000
1	218	2500
1	219	4500
1	220	1000
1	221	4000
5	222	3000
5	223	10800
1	224	2000
1	225	1500
1	226	1500
1	227	1500
1	228	5500
1	229	8500
1	230	6500
1	231	10800
1	232	7000
1	233	7000
1	234	7000
1	235	12000
1	236	7000
1	237	800
1	239	9000
1	238	6800
1	240	2000
1	241	12000
1	242	3000
1	243	3000
1	244	3000
1	245	1000
1	246	4000
1	247	1500
1	248	2000
1	249	500
1	250	2500
1	251	4500
1	252	2000
1	253	2000
1	254	1000
1	255	1000
1	256	5200
1	257	12700
1	258	11500
1	259	11500
1	260	3800
1	261	14700
1	262	5000
1	263	2500
5	264	400
8	264	4500
1	265	2000
1	266	2500
1	267	3000
14	268	100
17	268	1500
1	269	800
1	270	1500
1	271	1500
1	272	200
1	273	200
1	274	200
1	276	3000
1	277	2500
1	278	2500
1	279	2500
1	280	3000
5	281	500
1	282	1500
18	283	2500
5	284	2600
5	285	3600
5	286	4000
5	287	5000
5	288	6000
5	289	7000
5	290	1500
18	291	3000
18	292	2000
19	293	4000
19	294	3000
1	295	100
1	296	3500
1	297	4500
1	298	5500
1	299	8000
1	300	3000
1	301	3500
1	302	4000
1	303	5000
1	304	7500
1	305	1500
1	306	4000
1	307	3000
1	308	4500
1	309	6000
1	310	4500
1	311	8000
1	312	8500
1	313	10000
1	314	1500
1	315	6000
1	460	9000
1	461	20000
1	316	3600
1	317	1500
1	462	600
1	463	700
1	464	800
1	318	2500
1	319	2500
1	320	2500
1	321	4500
1	322	4500
5	323	200
1	324	11500
1	325	12500
1	326	11500
1	327	16500
1	328	16500
1	329	4500
1	465	2500
1	330	2800
1	331	3000
1	332	3500
1	333	3000
1	334	3000
1	336	2000
1	335	2500
1	337	1000
1	466	1500
1	339	1500
1	338	1500
1	340	1500
1	341	1300
1	342	1300
1	343	1300
5	347	2000
5	467	3000
5	468	2000
5	469	1600
5	346	2000
5	348	1000
5	349	700
5	350	500
5	345	1500
5	344	1000
1	351	1000
1	352	3500
1	353	7800
1	354	3500
1	355	6500
1	357	2000
1	358	600
1	359	3500
1	360	4500
18	361	15000
5	361	5000
5	362	4000
18	362	12000
5	363	3000
18	363	9000
1	364	800
1	365	700
1	366	600
1	367	1700
1	368	1700
1	369	1700
1	370	800
1	371	700
1	372	600
1	373	700
1	470	600
1	471	400
1	374	1500
1	375	400
1	376	350
1	377	250
1	378	2500
1	379	2500
1	380	2000
1	381	1500
1	382	1500
1	472	3500
1	473	5000
1	384	1500
1	383	1300
1	385	2000
1	386	2500
1	429	3000
1	387	3000
1	388	3500
1	389	4000
1	390	4500
1	391	6500
1	474	5000
1	392	3000
1	393	250
1	394	2000
1	395	8000
1	396	9000
20	475	3000
20	397	3500
20	398	4000
20	399	6000
5	400	150
1	401	4000
1	476	100
19	402	7800
19	403	4500
1	404	9000
1	405	7000
1	406	5000
1	407	3000
1	408	2500
1	410	8000
1	411	12000
1	412	8500
1	413	4500
1	414	12500
1	415	15000
1	416	6000
1	417	500
1	418	300
1	419	8000
5	420	1500
1	421	250
1	422	300
1	477	400
1	478	100
1	479	150
1	480	300
1	481	400
1	482	100
1	423	3500
1	424	2500
1	425	8600
1	426	9000
1	427	11000
1	430	17000
1	432	24000
1	483	7000
21	484	100
1	433	3600
1	434	2500
1	435	800
1	436	13000
1	437	4500
1	438	20500
1	439	10000
1	440	12500
1	441	9000
1	442	4000
1	443	2500
1	444	3500
1	445	4500
1	446	50
1	447	2000
1	454	4000
1	486	4000
20	448	2200
1	449	7500
1	450	10000
1	451	1500
1	452	4000
1	453	3000
20	455	2000
1	456	1500
\.


--
-- Data for Name: vehiculo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY vehiculo (placa, tipo, referencia, marca) FROM stdin;
XTJ245	Carga	No se jjajaja	Tampoco se xd
\.


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

