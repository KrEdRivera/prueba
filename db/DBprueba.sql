--
-- PostgreSQL database dump
--

-- Dumped from database version 16.8
-- Dumped by pg_dump version 16.8

-- Started on 2025-04-24 11:25:14

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 216 (class 1259 OID 24589)
-- Name: productos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.productos (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    precio numeric(10,2) NOT NULL,
    descripcion text,
    stock integer DEFAULT 0,
    fecha_creacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.productos OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 24588)
-- Name: productos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.productos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.productos_id_seq OWNER TO postgres;

--
-- TOC entry 4789 (class 0 OID 0)
-- Dependencies: 215
-- Name: productos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.productos_id_seq OWNED BY public.productos.id;


--
-- TOC entry 4634 (class 2604 OID 24592)
-- Name: productos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos ALTER COLUMN id SET DEFAULT nextval('public.productos_id_seq'::regclass);


--
-- TOC entry 4783 (class 0 OID 24589)
-- Dependencies: 216
-- Data for Name: productos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.productos (id, nombre, precio, descripcion, stock, fecha_creacion) FROM stdin;
1	Laptop Pro 15"	1499.99	Laptop de alta gama con pantalla de 15 pulgadas	5	2023-10-01 10:00:00
2	Smartphone X	799.50	Smartphone con cámara de alta resolución	12	2023-10-02 11:30:00
3	Tablet Plus	499.00	Tablet con gran capacidad de almacenamiento y batería de larga duración	8	2023-10-03 09:15:00
4	Auriculares Bluetooth	199.99	Auriculares inalámbricos con cancelación de ruido	20	2023-10-04 14:45:00
5	Monitor 27"	350.75	Monitor LED de 27 pulgadas con resolución 4K	7	2023-10-05 16:20:00
6	Teclado Mecánico	89.90	Teclado retroiluminado con switches mecánicos	15	2023-10-06 12:10:00
7	Mouse Inalámbrico	49.99	Mouse ergonómico con conexión Bluetooth	25	2023-10-07 13:55:00
8	Disco Duro Externo 1TB	120.00	Almacenamiento externo con USB 3.0	10	2023-10-08 08:30:00
9	Impresora Multifuncional	250.00	Impresora con funciones de escáner, copiado y fax	6	2023-10-09 17:05:00
13	Smartwatch Series 5 EX	200.00	Reloj inteligente con monitor de actividad y notificaciones... EX2 70	5	2025-04-24 05:00:30.771775
\.


--
-- TOC entry 4790 (class 0 OID 0)
-- Dependencies: 215
-- Name: productos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.productos_id_seq', 14, true);


--
-- TOC entry 4638 (class 2606 OID 24598)
-- Name: productos productos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (id);


-- Completed on 2025-04-24 11:25:14

--
-- PostgreSQL database dump complete
--

