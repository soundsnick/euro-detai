--
-- PostgreSQL database dump
--

-- Dumped from database version 10.7 (Ubuntu 10.7-1.pgdg18.04+1)
-- Dumped by pg_dump version 10.7 (Ubuntu 10.7-1.pgdg18.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: subcategories; Type: TABLE; Schema: public; Owner: yernazar
--

CREATE TABLE public.subcategories (
    id bigint NOT NULL,
    category_id integer,
    name character varying
);


ALTER TABLE public.subcategories OWNER TO yernazar;

--
-- Name: subcategories_id_seq; Type: SEQUENCE; Schema: public; Owner: yernazar
--

CREATE SEQUENCE public.subcategories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subcategories_id_seq OWNER TO yernazar;

--
-- Name: subcategories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yernazar
--

ALTER SEQUENCE public.subcategories_id_seq OWNED BY public.subcategories.id;


--
-- Name: subcategories id; Type: DEFAULT; Schema: public; Owner: yernazar
--

ALTER TABLE ONLY public.subcategories ALTER COLUMN id SET DEFAULT nextval('public.subcategories_id_seq'::regclass);


--
-- Data for Name: subcategories; Type: TABLE DATA; Schema: public; Owner: yernazar
--

COPY public.subcategories (id, category_id, name) FROM stdin;
1	2	Не задано
3	1	Блок цилиндров
4	1	Головка блока цилиндров
5	1	Двигатель
6	4	АКПП 3ст.
7	4	АКПП 4ст.
8	4	АКПП 5ст.
9	4	АКПП 6ст.
10	4	АКПП 7ст.
11	4	АКПП 8ст.
12	4	Вариатор
13	4	КПП Робот
14	2	МКПП 4ст.
15	2	МКПП 5ст.
16	2	МКПП 6ст.
17	2	Раздаточная КПП
\.


--
-- Name: subcategories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yernazar
--

SELECT pg_catalog.setval('public.subcategories_id_seq', 17, true);


--
-- Name: subcategories subcategories_pkey; Type: CONSTRAINT; Schema: public; Owner: yernazar
--

ALTER TABLE ONLY public.subcategories
    ADD CONSTRAINT subcategories_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

