--
-- PostgreSQL database dump
--

\restrict d4EnTAibxW9cQlwwXU5nRzgzcGJl2B6XVzrsYgWfxY47sa4UoJkUulQ9QXVKv8M

-- Dumped from database version 16.10 (Ubuntu 16.10-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.10 (Ubuntu 16.10-0ubuntu0.24.04.1)

-- Started on 2025-10-02 21:51:00 -03

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

--
-- TOC entry 847 (class 1247 OID 16445)
-- Name: fm_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.fm_type AS ENUM (
    'in',
    'out'
);


ALTER TYPE public.fm_type OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 218 (class 1259 OID 16457)
-- Name: expenses_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.expenses_types (
    et_id integer NOT NULL,
    et_name character varying(50) NOT NULL
);


ALTER TABLE public.expenses_types OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16456)
-- Name: expenses_types_et_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.expenses_types_et_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.expenses_types_et_id_seq OWNER TO postgres;

--
-- TOC entry 3516 (class 0 OID 0)
-- Dependencies: 217
-- Name: expenses_types_et_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.expenses_types_et_id_seq OWNED BY public.expenses_types.et_id;


--
-- TOC entry 222 (class 1259 OID 16479)
-- Name: financial_movements; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.financial_movements (
    fm_id integer NOT NULL,
    fm_source integer NOT NULL,
    fm_expense_type integer,
    fm_type public.fm_type,
    fm_amount numeric NOT NULL,
    fm_description text,
    fm_date date DEFAULT CURRENT_DATE
);


ALTER TABLE public.financial_movements OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16478)
-- Name: financial_movements_fm_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.financial_movements_fm_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.financial_movements_fm_id_seq OWNER TO postgres;

--
-- TOC entry 3517 (class 0 OID 0)
-- Dependencies: 221
-- Name: financial_movements_fm_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.financial_movements_fm_id_seq OWNED BY public.financial_movements.fm_id;


--
-- TOC entry 216 (class 1259 OID 16450)
-- Name: financial_sources; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.financial_sources (
    fs_id integer NOT NULL,
    fs_name character varying(50) NOT NULL
);


ALTER TABLE public.financial_sources OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16449)
-- Name: financial_sources_fs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.financial_sources_fs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.financial_sources_fs_id_seq OWNER TO postgres;

--
-- TOC entry 3518 (class 0 OID 0)
-- Dependencies: 215
-- Name: financial_sources_fs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.financial_sources_fs_id_seq OWNED BY public.financial_sources.fs_id;


--
-- TOC entry 220 (class 1259 OID 16464)
-- Name: total_capital; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.total_capital (
    total_id integer NOT NULL,
    fs_id integer NOT NULL,
    total_amount_pesos numeric NOT NULL,
    total_amount_usd numeric NOT NULL,
    total_date date DEFAULT CURRENT_DATE
);


ALTER TABLE public.total_capital OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16463)
-- Name: total_capital_total_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.total_capital_total_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.total_capital_total_id_seq OWNER TO postgres;

--
-- TOC entry 3519 (class 0 OID 0)
-- Dependencies: 219
-- Name: total_capital_total_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.total_capital_total_id_seq OWNED BY public.total_capital.total_id;


--
-- TOC entry 3344 (class 2604 OID 16460)
-- Name: expenses_types et_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.expenses_types ALTER COLUMN et_id SET DEFAULT nextval('public.expenses_types_et_id_seq'::regclass);


--
-- TOC entry 3347 (class 2604 OID 16482)
-- Name: financial_movements fm_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.financial_movements ALTER COLUMN fm_id SET DEFAULT nextval('public.financial_movements_fm_id_seq'::regclass);


--
-- TOC entry 3343 (class 2604 OID 16453)
-- Name: financial_sources fs_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.financial_sources ALTER COLUMN fs_id SET DEFAULT nextval('public.financial_sources_fs_id_seq'::regclass);


--
-- TOC entry 3345 (class 2604 OID 16467)
-- Name: total_capital total_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.total_capital ALTER COLUMN total_id SET DEFAULT nextval('public.total_capital_total_id_seq'::regclass);


--
-- TOC entry 3506 (class 0 OID 16457)
-- Dependencies: 218
-- Data for Name: expenses_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.expenses_types (et_id, et_name) FROM stdin;
1	ocio
2	alimentos
3	ropa
4	caprichos
5	cigarrillos
6	universidad
7	transporte
8	electrodomesticos
9	kate
10	otros
11	agua
\.


--
-- TOC entry 3510 (class 0 OID 16479)
-- Dependencies: 222
-- Data for Name: financial_movements; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.financial_movements (fm_id, fm_source, fm_expense_type, fm_type, fm_amount, fm_description, fm_date) FROM stdin;
\.


--
-- TOC entry 3504 (class 0 OID 16450)
-- Dependencies: 216
-- Data for Name: financial_sources; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.financial_sources (fs_id, fs_name) FROM stdin;
1	club_serrano
2	mis_viejos
3	otros
\.


--
-- TOC entry 3508 (class 0 OID 16464)
-- Dependencies: 220
-- Data for Name: total_capital; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.total_capital (total_id, fs_id, total_amount_pesos, total_amount_usd, total_date) FROM stdin;
\.


--
-- TOC entry 3520 (class 0 OID 0)
-- Dependencies: 217
-- Name: expenses_types_et_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.expenses_types_et_id_seq', 11, true);


--
-- TOC entry 3521 (class 0 OID 0)
-- Dependencies: 221
-- Name: financial_movements_fm_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.financial_movements_fm_id_seq', 1, false);


--
-- TOC entry 3522 (class 0 OID 0)
-- Dependencies: 215
-- Name: financial_sources_fs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.financial_sources_fs_id_seq', 3, true);


--
-- TOC entry 3523 (class 0 OID 0)
-- Dependencies: 219
-- Name: total_capital_total_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.total_capital_total_id_seq', 1, false);


--
-- TOC entry 3352 (class 2606 OID 16462)
-- Name: expenses_types expenses_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.expenses_types
    ADD CONSTRAINT expenses_types_pkey PRIMARY KEY (et_id);


--
-- TOC entry 3356 (class 2606 OID 16487)
-- Name: financial_movements financial_movements_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.financial_movements
    ADD CONSTRAINT financial_movements_pkey PRIMARY KEY (fm_id);


--
-- TOC entry 3350 (class 2606 OID 16455)
-- Name: financial_sources financial_sources_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.financial_sources
    ADD CONSTRAINT financial_sources_pkey PRIMARY KEY (fs_id);


--
-- TOC entry 3354 (class 2606 OID 16472)
-- Name: total_capital total_capital_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.total_capital
    ADD CONSTRAINT total_capital_pkey PRIMARY KEY (total_id);


--
-- TOC entry 3358 (class 2606 OID 16493)
-- Name: financial_movements financial_movements_fm_expense_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.financial_movements
    ADD CONSTRAINT financial_movements_fm_expense_type_fkey FOREIGN KEY (fm_expense_type) REFERENCES public.expenses_types(et_id);


--
-- TOC entry 3359 (class 2606 OID 16488)
-- Name: financial_movements financial_movements_fm_source_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.financial_movements
    ADD CONSTRAINT financial_movements_fm_source_fkey FOREIGN KEY (fm_source) REFERENCES public.financial_sources(fs_id);


--
-- TOC entry 3357 (class 2606 OID 16473)
-- Name: total_capital total_capital_fs_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.total_capital
    ADD CONSTRAINT total_capital_fs_id_fkey FOREIGN KEY (fs_id) REFERENCES public.financial_sources(fs_id);


-- Completed on 2025-10-02 21:51:01 -03

--
-- PostgreSQL database dump complete
--

\unrestrict d4EnTAibxW9cQlwwXU5nRzgzcGJl2B6XVzrsYgWfxY47sa4UoJkUulQ9QXVKv8M

