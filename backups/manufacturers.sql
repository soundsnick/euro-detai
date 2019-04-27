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
-- Name: manufacturers; Type: TABLE; Schema: public; Owner: yernazar
--

CREATE TABLE public.manufacturers (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    image character varying,
    text text
);


ALTER TABLE public.manufacturers OWNER TO yernazar;

--
-- Name: manufacturers_id_seq; Type: SEQUENCE; Schema: public; Owner: yernazar
--

CREATE SEQUENCE public.manufacturers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.manufacturers_id_seq OWNER TO yernazar;

--
-- Name: manufacturers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yernazar
--

ALTER SEQUENCE public.manufacturers_id_seq OWNED BY public.manufacturers.id;


--
-- Name: manufacturers id; Type: DEFAULT; Schema: public; Owner: yernazar
--

ALTER TABLE ONLY public.manufacturers ALTER COLUMN id SET DEFAULT nextval('public.manufacturers_id_seq'::regclass);


--
-- Data for Name: manufacturers; Type: TABLE DATA; Schema: public; Owner: yernazar
--

COPY public.manufacturers (id, name, created_at, updated_at, image, text) FROM stdin;
1	Не задано	2019-04-12 22:08:59.272632	2019-04-12 22:08:59.272632	\N	\N
33	Hyundai	2019-04-25 19:06:01.328552	2019-04-25 19:06:01.328552	\N	\N
57	Seat	2019-04-25 19:08:10.771244	2019-04-25 19:08:10.771244	auto_46.jpg	\N
58	Skoda	2019-04-25 19:08:13.499262	2019-04-25 19:08:13.499262	auto_47.jpg	\N
59	Smart	2019-04-25 19:08:15.991974	2019-04-25 19:08:15.991974	auto_48.jpg	\N
18	Alfa Romeo	2019-04-25 19:04:53.660897	2019-04-25 19:04:53.660897	auto_2.jpg	\N
19	Audi	2019-04-25 19:05:03.356096	2019-04-25 19:05:03.356096	auto_3.jpg	\N
20	BMW	2019-04-25 19:05:08.258751	2019-04-25 19:05:08.258751	auto_4.jpg	\N
21	Buick	2019-04-25 19:05:11.901804	2019-04-25 19:05:11.901804	auto_5.jpg	\N
22	Cadillac	2019-04-25 19:05:17.921279	2019-04-25 19:05:17.921279	auto_6.jpg	\N
23	Chevrolet	2019-04-25 19:05:21.37231	2019-04-25 19:05:21.37231	auto_8.jpg	\N
24	Chrysler	2019-04-25 19:05:24.92701	2019-04-25 19:05:24.92701	auto_9.jpg	\N
25	Citroen	2019-04-25 19:05:28.774129	2019-04-25 19:05:28.774129	auto_10.jpg	\N
26	Dacia	2019-04-25 19:05:33.668488	2019-04-25 19:05:33.668488	auto_11.jpg	\N
27	Daewoo	2019-04-25 19:05:41.757219	2019-04-25 19:05:41.757219	auto_12.jpg	\N
28	Daihatsu	2019-04-25 19:05:45.659571	2019-04-25 19:05:45.659571	auto_13.jpg	\N
29	Dodge	2019-04-25 19:05:48.671313	2019-04-25 19:05:48.671313	auto_14.jpg	\N
30	Fiat	2019-04-25 19:05:51.530013	2019-04-25 19:05:51.530013	auto_15.jpg	\N
31	Ford	2019-04-25 19:05:54.416888	2019-04-25 19:05:54.416888	auto_16.jpg	\N
32	Honda	2019-04-25 19:05:57.292282	2019-04-25 19:05:57.292282	auto_18.jpg	\N
34	Infiniti	2019-04-25 19:06:04.812448	2019-04-25 19:06:04.812448	auto_20.jpg	\N
35	Isuzu	2019-04-25 19:06:08.856021	2019-04-25 19:06:08.856021	auto_21.jpg	\N
36	Iveco	2019-04-25 19:06:12.397915	2019-04-25 19:06:12.397915	auto_22.jpg	\N
37	Jaguar	2019-04-25 19:06:18.763833	2019-04-25 19:06:18.763833	auto_23.jpg	\N
38	Jeep	2019-04-25 19:06:22.832385	2019-04-25 19:06:22.832385	auto_24.jpg	\N
40	Lancia	2019-04-25 19:06:28.812541	2019-04-25 19:06:28.812541	auto_25.jpg	\N
41	Land Rover	2019-04-25 19:06:33.282723	2019-04-25 19:06:33.282723	auto_26.jpg	\N
42	LDV (DAF)	2019-04-25 19:06:40.437565	2019-04-25 19:06:40.437565	auto_27.jpg	\N
43	Lexus	2019-04-25 19:06:44.14854	2019-04-25 19:06:44.14854	auto_28.jpg	\N
44	Mazda	2019-04-25 19:06:47.890928	2019-04-25 19:06:47.890928	auto_30.jpg	\N
45	Mercedes	2019-04-25 19:06:52.540934	2019-04-25 19:07:02.691173	auto_31.jpg	\N
46	Mini	2019-04-25 19:07:07.774068	2019-04-25 19:07:07.774068	auto_32.jpg	\N
47	Mitsubishi	2019-04-25 19:07:11.294883	2019-04-25 19:07:18.21898	auto_33.jpg	\N
48	Nissan	2019-04-25 19:07:23.400642	2019-04-25 19:07:23.400642	auto_34.jpg	\N
49	Opel	2019-04-25 19:07:26.017654	2019-04-25 19:07:30.693756	auto_35.jpg	\N
50	Peugeot	2019-04-25 19:07:36.404786	2019-04-25 19:07:36.404786	auto_36.jpg	\N
51	Plymouth	2019-04-25 19:07:45.725427	2019-04-25 19:07:45.725427	auto_37.jpg	\N
52	Pontiac	2019-04-25 19:07:48.95034	2019-04-25 19:07:48.95034	auto_38.jpg	\N
53	Porsche	2019-04-25 19:07:53.770572	2019-04-25 19:07:53.770572	auto_39.jpg	\N
54	Renault	2019-04-25 19:07:56.863389	2019-04-25 19:07:56.863389	auto_41.jpg	\N
55	Rover	2019-04-25 19:08:03.805679	2019-04-25 19:08:03.805679	auto_42.jpg	\N
56	Saab	2019-04-25 19:08:07.603742	2019-04-25 19:08:07.603742	auto_43.jpg	\N
60	Ssang Yong	2019-04-25 19:08:20.138264	2019-04-25 19:08:20.138264	auto_49.jpg	\N
61	Subaru	2019-04-25 19:08:23.715011	2019-04-25 19:08:23.715011	auto_50.jpg	\N
62	Suzuki	2019-04-25 19:08:28.653532	2019-04-25 19:08:28.653532	auto_51.jpg	\N
63	Toyota	2019-04-25 19:08:32.210139	2019-04-25 19:08:32.210139	auto_52.jpg	\N
64	Volkswagen	2019-04-25 19:08:37.975896	2019-04-25 19:08:37.975896	auto_53.jpg	\N
65	Volvo	2019-04-25 19:08:40.849585	2019-04-25 19:08:40.849585	auto_54.jpg	\N
17	Acura	2019-04-25 19:04:43.134805	2019-04-26 20:38:04.795397	auto_1.jpg\n	asdasdasdadad
39	KIA	2019-04-25 19:06:25.873835	2019-04-26 20:38:52.741663	\N	Мы занимаемся продажей бу контрактных запчастей для автомобилей Киа, выпущенных для европейского и американского рынков. Все детали - б/у оригинальные. Получены в результате разборки машинокомплектов, выкупаемых в вышеупомянутых регионах. Силовые агрегаты, коробки передач и другие основные детали проходят проверку на работоспособность и соответствие условиям нормальной эксплуатации непосредственно на авто перед его разборкой. Благодаря этому Вы можете быть уверены, что при заказе у нас получите хорошие рабочие запчасти, способные прослужить Вам и Вашему Кия не один год!
\.


--
-- Name: manufacturers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yernazar
--

SELECT pg_catalog.setval('public.manufacturers_id_seq', 65, true);


--
-- Name: manufacturers manufacturers_pkey; Type: CONSTRAINT; Schema: public; Owner: yernazar
--

ALTER TABLE ONLY public.manufacturers
    ADD CONSTRAINT manufacturers_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

