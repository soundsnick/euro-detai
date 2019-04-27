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

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: attachments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.attachments (
    id bigint NOT NULL,
    new_id integer,
    image character varying
);


--
-- Name: attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.attachments_id_seq OWNED BY public.attachments.id;


--
-- Name: carcasses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.carcasses (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: carcasses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.carcasses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: carcasses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.carcasses_id_seq OWNED BY public.carcasses.id;


--
-- Name: cities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cities (
    id bigint NOT NULL,
    country character varying,
    name character varying
);


--
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cities_id_seq OWNED BY public.cities.id;


--
-- Name: colors; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.colors (
    id bigint NOT NULL,
    name character varying,
    hex character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: colors_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.colors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: colors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.colors_id_seq OWNED BY public.colors.id;


--
-- Name: commentaries; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.commentaries (
    id bigint NOT NULL,
    email character varying,
    text text,
    new_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id integer,
    status integer
);


--
-- Name: commentaries_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.commentaries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: commentaries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.commentaries_id_seq OWNED BY public.commentaries.id;


--
-- Name: countries; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.countries (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: countries_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.countries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.countries_id_seq OWNED BY public.countries.id;


--
-- Name: feedbacks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.feedbacks (
    id bigint NOT NULL,
    name character varying,
    email character varying,
    text text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    status integer
);


--
-- Name: feedbacks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.feedbacks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: feedbacks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.feedbacks_id_seq OWNED BY public.feedbacks.id;


--
-- Name: fuels; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.fuels (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: fuels_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.fuels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: fuels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.fuels_id_seq OWNED BY public.fuels.id;


--
-- Name: manufacturers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.manufacturers (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: manufacturers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.manufacturers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: manufacturers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.manufacturers_id_seq OWNED BY public.manufacturers.id;


--
-- Name: models; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.models (
    id bigint NOT NULL,
    name character varying,
    manufacturer_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: models_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.models_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: models_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.models_id_seq OWNED BY public.models.id;


--
-- Name: news; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.news (
    id bigint NOT NULL,
    title character varying,
    content text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: news_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.news_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: news_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.news_id_seq OWNED BY public.news.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.orders (
    id bigint NOT NULL,
    name character varying,
    phone character varying,
    city character varying,
    email character varying,
    additional text,
    part_id integer
);


--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: parts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.parts (
    id bigint NOT NULL,
    title character varying,
    image character varying,
    manufacturer_id integer,
    model_id integer,
    year integer,
    volume_id integer,
    mark character varying,
    constr_num character varying,
    carcass_id integer,
    color_id integer,
    description text,
    fuel_id integer,
    options text,
    cost integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: parts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.parts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: parts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.parts_id_seq OWNED BY public.parts.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.roles (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    country_id integer,
    phone character varying,
    password character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    role_id integer,
    name character varying,
    email character varying
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: volumes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.volumes (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: volumes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.volumes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: volumes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.volumes_id_seq OWNED BY public.volumes.id;


--
-- Name: attachments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.attachments ALTER COLUMN id SET DEFAULT nextval('public.attachments_id_seq'::regclass);


--
-- Name: carcasses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.carcasses ALTER COLUMN id SET DEFAULT nextval('public.carcasses_id_seq'::regclass);


--
-- Name: cities id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cities ALTER COLUMN id SET DEFAULT nextval('public.cities_id_seq'::regclass);


--
-- Name: colors id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.colors ALTER COLUMN id SET DEFAULT nextval('public.colors_id_seq'::regclass);


--
-- Name: commentaries id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.commentaries ALTER COLUMN id SET DEFAULT nextval('public.commentaries_id_seq'::regclass);


--
-- Name: countries id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.countries ALTER COLUMN id SET DEFAULT nextval('public.countries_id_seq'::regclass);


--
-- Name: feedbacks id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.feedbacks ALTER COLUMN id SET DEFAULT nextval('public.feedbacks_id_seq'::regclass);


--
-- Name: fuels id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.fuels ALTER COLUMN id SET DEFAULT nextval('public.fuels_id_seq'::regclass);


--
-- Name: manufacturers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.manufacturers ALTER COLUMN id SET DEFAULT nextval('public.manufacturers_id_seq'::regclass);


--
-- Name: models id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.models ALTER COLUMN id SET DEFAULT nextval('public.models_id_seq'::regclass);


--
-- Name: news id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.news ALTER COLUMN id SET DEFAULT nextval('public.news_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: parts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.parts ALTER COLUMN id SET DEFAULT nextval('public.parts_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: volumes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.volumes ALTER COLUMN id SET DEFAULT nextval('public.volumes_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2019-04-03 09:43:51.53147	2019-04-03 09:43:51.53147
\.


--
-- Data for Name: attachments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.attachments (id, new_id, image) FROM stdin;
12	9	33d3099e06Qj0JcV7-WM8.jpg
13	9	330bb2b2a9whatsapp_image_2018-12-11_at_1308351.jpg
\.


--
-- Data for Name: carcasses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.carcasses (id, name, created_at, updated_at) FROM stdin;
1	Не задано	2019-04-05 04:29:23.292358	2019-04-05 04:29:51.225137
3	Хетчбек	2019-04-12 22:26:26.381793	2019-04-13 00:08:23.480984
\.


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.cities (id, country, name) FROM stdin;
1	Россия	Абакан\n
2	Россия	Агинское\n
3	Россия	Алейск (Алтайский кр.)\n
4	Россия	Алтайское\n
5	Россия	Алушта\n
6	Россия	Альметьевск\n
7	Россия	Анапа\n
8	Россия	Ангарск (Иркутская обл.)\n
9	Россия	Анжеро-Судженск\n
10	Россия	Арзамас\n
11	Россия	Армавир\n
12	Россия	Армянск\n
13	Россия	Архангельск\n
14	Россия	Астрахань\n
15	Россия	Ачинск\n
16	Россия	Балаково\n
17	Россия	Барабинск\n
18	Россия	Баранчинский\n
19	Россия	Барнаул\n
20	Россия	Бахчисарай\n
21	Россия	Белгород\n
22	Россия	Белебей\n
23	Россия	Белово\n
24	Россия	Белогорск\n
25	Россия	Белорецк\n
26	Россия	Белоярский\n
27	Россия	Бердск\n
28	Россия	Березники (Пермский кр.)\n
29	Россия	Березовский (Свердловская обл.)\n
30	Россия	Бийск\n
31	Россия	Биробиджан\n
32	Россия	Благовещенск\n
33	Россия	Богучаны\n
34	Россия	Бокситогорск\n
35	Россия	Большая Ижора\n
36	Россия	Бородино\n
37	Россия	Братск\n
38	Россия	Брянск\n
39	Россия	Бугульма\n
40	Россия	Бузулук\n
41	Россия	Ванино (Хабаровский кр.)\n
42	Россия	Великий Новгород\n
43	Россия	Вельск (Архангельская область)\n
44	Россия	Верхний Тагил\n
45	Россия	Верхний Уфалей\n
46	Россия	Верхняя Салда\n
47	Россия	Верхняя Тура\n
48	Россия	Вишневогорск\n
49	Россия	Владивосток\n
50	Россия	Владикавказ\n
51	Россия	Владимир\n
52	Россия	Волгоград\n
53	Россия	Волгодонск\n
54	Россия	Волжск\n
55	Россия	Волжский\n
56	Россия	Вологда\n
57	Россия	Волхов\n
58	Россия	Воронеж\n
59	Россия	Воткинск (Удмуртия)\n
60	Россия	Выборг\n
61	Россия	Высоцк\n
62	Россия	Вязьма\n
63	Россия	Гай\n
64	Россия	Гатчина\n
65	Россия	Геленджик\n
66	Россия	Глазов\n
67	Россия	Горно-Алтайск\n
68	Россия	Грозный\n
69	Россия	Губкинский\n
70	Россия	Джанкой\n
71	Россия	Дзержинск\n
72	Россия	Димитровград\n
73	Россия	Евпатория\n
74	Россия	Екатеринбург\n
75	Россия	Елец\n
76	Россия	Железногорск\n
77	Россия	\n
78	Россия	Забайкальск\n
79	Россия	Заринск (Алтайский кр.)\n
80	Россия	Зеленогорск (Красноярский кр.)\n
81	Россия	Зеленогорск (Ленинградская)\n
82	Россия	Зима (Иркутская обл.)\n
83	Россия	Златоуст\n
84	Россия	Ивангород\n
85	Россия	Иваново\n
86	Россия	Ижевск\n
87	Россия	Иркутск\n
88	Россия	Искитим\n
89	Россия	Ишим\n
90	Россия	Ишимбай\n
91	Россия	Йошкар-Ола\n
92	Россия	Казань\n
93	Россия	Калининград\n
94	Россия	Калуга\n
95	Россия	Каменск-Уральский\n
96	Россия	Каменск-Шахтинский\n
97	Россия	Камень-на-Оби\n
98	Россия	Камышин\n
99	Россия	Канск\n
100	Россия	Карасук\n
101	Россия	Касли\n
102	Россия	Качканар\n
103	Россия	Кемерово\n
104	Россия	Керчь\n
105	Россия	Кингисепп\n
106	Россия	Кириши\n
107	Россия	Киров\n
108	Россия	Кировград\n
109	Россия	Кировск\n
221	Россия	Саки\n
110	Россия	Киселевск\n
111	Россия	Кисловодск\n
112	Россия	Клин\n
113	Россия	Ковров\n
114	Россия	Когалым\n
115	Россия	Коломна\n
116	Россия	Колпино\n
117	Россия	Комсомольск-на-Амуре\n
118	Россия	Кострома\n
119	Россия	Краснодар\n
120	Россия	Красное Село\n
121	Россия	Красноперекопск\n
122	Россия	Краснотурьинск\n
123	Россия	Красноуральск\n
124	Россия	Красноуфимск\n
125	Россия	Красноярск\n
126	Россия	Кувандык\n
127	Россия	Кузнецк\n
128	Россия	Куйбышев\n
129	Россия	Кумертау\n
130	Россия	Кунгур\n
131	Россия	Курган\n
132	Россия	Курск\n
133	Россия	Кушва\n
134	Россия	Кызыл\n
135	Россия	Кыштым\n
136	Россия	Лабытнанги\n
137	Россия	Лангепас\n
138	Россия	Ленинск-Кузнецкий (Кемеровская обл.)\n
139	Россия	Лесной\n
140	Россия	Лесосибирск\n
141	Россия	Ливны\n
142	Россия	Липецк\n
143	Россия	Ломоносов\n
144	Россия	Луга\n
145	Россия	Людиново (Калужская обл.)\n
146	Россия	Магадан\n
147	Россия	Магнитогорск\n
148	Россия	Майкоп\n
149	Россия	Мариинск\n
150	Россия	Маук\n
151	Россия	Махачкала\n
152	Россия	Медногорск\n
153	Россия	Междуреченск\n
154	Россия	\n
155	Россия	Мелеуз\n
156	Россия	Металлострой\n
157	Россия	Миасс\n
158	Россия	Минусинск\n
159	Россия	Мирный (Якутия)\n
160	Россия	Москва\n
161	Россия	Муравленко\n
162	Россия	Мурманск\n
163	Россия	Муром\n
164	Россия	Набережные Челны\n
165	Россия	Надым\n
166	Россия	Назрань\n
167	Россия	Нальчик\n
168	Россия	Нарьян-Мар\n
169	Россия	Находка\n
170	Россия	Невинномысск\n
171	Россия	Невьянск\n
172	Россия	Нерюнгри\n
173	Россия	Нефтекамск\n
174	Россия	Нефтеюганск\n
175	Россия	Нижневартовск\n
176	Россия	Нижнекамск\n
177	Россия	Нижний Новгород\n
178	Россия	Нижний Тагил\n
179	Россия	Нижняя Салда\n
180	Россия	Нижняя Тура\n
181	Россия	Новоалтайск\n
182	Россия	Новокузнецк\n
183	Россия	Новокуйбышевск\n
184	Россия	Новороссийск\n
185	Россия	Новосибирск\n
186	Россия	Новотроицк\n
187	Россия	Новоуральск\n
188	Россия	Новочебоксарск\n
189	Россия	Новый Уренгой\n
190	Россия	Норильск\n
191	Россия	Ноябрьск\n
192	Россия	Нягань\n
193	Россия	Нязепетровск\n
194	Россия	Обнинск\n
195	Россия	Озерск\n
196	Россия	Октябрьский\n
197	Россия	Омск\n
198	Россия	Орел\n
199	Россия	Оренбург\n
200	Россия	Орск\n
201	Россия	Осинники (Кемеровская)\n
202	Россия	Павлово (Нижегородская область)\n
203	Россия	Пенза\n
204	Россия	Первоуральск\n
205	Россия	Пермь\n
206	Россия	Петрозаводск\n
207	Россия	Петропавловск-Камчатский\n
208	Россия	Приморск\n
209	Россия	Приобье\n
210	Россия	Приозерск\n
211	Россия	Прокопьевск\n
212	Россия	Псков\n
213	Россия	Пушкин\n
214	Россия	Пятигорск\n
215	Россия	Радужный\n
216	Россия	Рославль\n
217	Россия	Ростов-на-Дону\n
218	Россия	Рубцовск\n
219	Россия	Рыбинск\n
220	Россия	Рязань\n
222	Россия	Салават\n
223	Россия	Салехард\n
224	Россия	Самара\n
225	Россия	Санкт-Петербург\n
226	Россия	Саранск\n
227	Россия	Сарапул\n
228	Россия	Саратов\n
229	Россия	Саяногорск\n
230	Россия	Саянск\n
231	Россия	\n
232	Россия	Свободный\n
233	Россия	Севастополь\n
234	Россия	Северск\n
235	Россия	Серов\n
236	Россия	Сибай\n
237	Россия	Симферополь\n
238	Россия	Славгород (Алтайский)\n
239	Россия	Славянск-на-Кубани\n
240	Россия	Смоленск\n
241	Россия	Снежинск\n
242	Россия	Советский\n
243	Россия	Соликамск\n
244	Россия	Сосновый Бор\n
245	Россия	Сочи\n
246	Россия	Ставрополь\n
247	Россия	Старый Оскол\n
248	Россия	Стерлитамак\n
249	Россия	Стрежевой\n
250	Россия	Судак\n
251	Россия	Сургут\n
252	Россия	Сызрань\n
253	Россия	Сыктывкар\n
254	Россия	Сясьстрой\n
255	Россия	Таганрог\n
256	Россия	Тайга (Кемеровская обл.)\n
257	Россия	Тамбов\n
258	Россия	Тарко-Сале\n
259	Россия	Таштагол\n
260	Россия	Тверь\n
261	Россия	Тихвин\n
262	Россия	Тобольск\n
263	Россия	Тольятти\n
264	Россия	Томск\n
265	Россия	Тосно\n
266	Россия	Троицк (Челябинская область)\n
267	Россия	Туапсе\n
268	Россия	Туймазы\n
269	Россия	Тула\n
270	Россия	Тюмень\n
271	Россия	Улан-Удэ\n
272	Россия	Ульяновск\n
273	Россия	Урай\n
274	Россия	Усолье-Сибирское\n
275	Россия	Уссурийск\n
276	Россия	Усть-Илимск\n
277	Россия	Усть-Кут\n
278	Россия	Усть-Луга\n
279	Россия	Уфа\n
280	Россия	Ухта\n
281	Россия	Феодосия\n
282	Россия	Хабаровск\n
283	Россия	Ханты-Мансийск\n
284	Россия	Чайковский\n
285	Россия	Чебоксары\n
286	Россия	Челябинск\n
287	Россия	Черепаново (Новосибир. область)\n
288	Россия	Череповец\n
289	Россия	Черкесск\n
290	Россия	Черноморское\n
291	Россия	Чернушка\n
292	Россия	Чита\n
293	Россия	Чусовой\n
294	Россия	Шадринск\n
295	Россия	Шахты\n
296	Россия	Шлиссельбург\n
297	Россия	Шуя\n
298	Россия	Элиста\n
299	Россия	Энгельс\n
300	Россия	Югорск\n
301	Россия	Южно-Сахалинск\n
302	Россия	Южноуральск\n
303	Россия	Юрга\n
304	Россия	Юрюзань\n
305	Россия	Якутск\n
306	Россия	Ялта\n
307	Россия	Ярославль
308	Казахстан	Аксай\n
309	Казахстан	Аксу\n
310	Казахстан	Актау\n
311	Казахстан	Актобе\n
312	Казахстан	Алматы\n
313	Казахстан	Астана\n
314	Казахстан	Атырау\n
315	Казахстан	Байконур\n
316	Казахстан	Балхаш\n
317	Казахстан	Жезказган\n
318	Казахстан	Караганда\n
319	Казахстан	Кокшетау\n
320	Казахстан	Костанай\n
321	Казахстан	Кызылорда\n
322	Казахстан	Павлодар\n
323	Казахстан	Петропавловск\n
324	Казахстан	Семей\n
325	Казахстан	(Семипалатинск)\n
326	Казахстан	Талдыкорган\n
327	Казахстан	Тараз\n
328	Казахстан	Уральск\n
329	Казахстан	Усть-Каменогорск\n
330	Казахстан	Шымкент\n
331	Казахстан	Экибастуз
332	Абхазия	Сухум
333	Армения	Ереван
334	Киргизия	Бишкек\n
335	Киргизия	Ош
\.


--
-- Data for Name: colors; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.colors (id, name, hex, created_at, updated_at) FROM stdin;
4	Зеленый	#00f7a9	2019-04-12 21:39:08.564875	2019-04-12 21:39:08.564875
5	Синий	#2196f3	2019-04-12 21:53:21.09783	2019-04-12 21:53:21.09783
1	Не задано	grey	2019-04-07 23:01:05.37629	2019-04-07 23:01:05.37629
7	Черный	#000000	2019-04-12 22:29:23.252736	2019-04-12 22:29:23.252736
2	Белый	#FFF	2019-04-07 23:01:23.389923	2019-04-13 22:02:19.559043
8	Красный	#ff4545	2019-04-13 22:02:32.494111	2019-04-13 22:02:32.494111
\.


--
-- Data for Name: commentaries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.commentaries (id, email, text, new_id, created_at, updated_at, user_id, status) FROM stdin;
7	\N	Реально стоящий себя продукт, всем советую и рекомендую	9	2019-04-15 06:23:00.62745	2019-04-15 06:23:07.167898	10	1
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.countries (id, name, created_at, updated_at) FROM stdin;
3	Казахстан	2019-04-05 01:33:14.904369	2019-04-05 01:33:14.904369
4	Беларусь	2019-04-05 01:33:18.708089	2019-04-05 01:33:18.708089
1	Не задано	2019-04-13 00:37:13.90151	2019-04-13 00:37:13.90151
\.


--
-- Data for Name: feedbacks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.feedbacks (id, name, email, text, created_at, updated_at, status) FROM stdin;
3	sadadasdad	soundsnic	asdasdadasdadisda daisodaisdjad	2019-04-15 07:46:32.552557	2019-04-16 11:10:19.802277	1
5	YERNAZAR KARABAYEV	soundsnick@gmail.com	Nice car	2019-04-16 11:13:18.858355	2019-04-16 11:13:26.508114	1
\.


--
-- Data for Name: fuels; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.fuels (id, name, created_at, updated_at) FROM stdin;
2	Бензин	2019-04-05 04:21:43.932202	2019-04-05 04:24:37.300204
1	Не задано	2019-04-12 22:26:50.585983	2019-04-12 22:26:50.585983
3	Газ	2019-04-05 04:21:48.537257	2019-04-13 00:12:58.233039
\.


--
-- Data for Name: manufacturers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.manufacturers (id, name, created_at, updated_at) FROM stdin;
6	Toyota	2019-04-12 21:55:06.306822	2019-04-12 21:55:06.306822
7	Ford	2019-04-12 21:55:16.72005	2019-04-12 21:55:16.72005
3	BMW	2019-04-07 22:58:19.589833	2019-04-07 22:58:19.589833
1	Не задано	2019-04-12 22:08:59.272632	2019-04-12 22:08:59.272632
\.


--
-- Data for Name: models; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.models (id, name, manufacturer_id, created_at, updated_at) FROM stdin;
8	Camry	6	2019-04-12 22:00:48.129539	2019-04-12 22:00:48.129539
1	Не задано	1	2019-04-07 22:59:22.914878	2019-04-07 22:59:22.914878
13	Модель хз	1	2019-04-12 22:21:24.261311	2019-04-13 00:09:20.850626
14	Какая то модель	1	2019-04-12 22:36:48.054453	2019-04-13 00:09:30.171452
7	Mustang	7	2019-04-12 22:00:40.4342	2019-04-13 00:12:32.06144
\.


--
-- Data for Name: news; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.news (id, title, content, created_at, updated_at) FROM stdin;
9	ДВС 1Y VW Transporter T3	Отгружен контрактный двигатель (в сборе, без навесного оборудования) 1Y (1.9D, 65hp) к а/м VW Transporter T3, Отправка в г. Краснодар, РФ.\r\n\r\nУзнать о местонахождении груза по номеру накладной - 442-1008358 - можно в соответствующем разделе сайта ТК "Энергия" - nrg-tk.ru/client/tracking.	2019-04-14 08:46:55.837354	2019-04-14 08:46:55.837354
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.orders (id, name, phone, city, email, additional, part_id) FROM stdin;
\.


--
-- Data for Name: parts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.parts (id, title, image, manufacturer_id, model_id, year, volume_id, mark, constr_num, carcass_id, color_id, description, fuel_id, options, cost, created_at, updated_at) FROM stdin;
36	Фары	ffc1b529d0mediamodifier_image (1).jpg	6	8	1923	4		\N	3	5	Черный бмв	3		9000	2019-04-14 08:48:46.391131	2019-04-14 08:48:46.391131
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.roles (id, name, created_at, updated_at) FROM stdin;
0	Пользователь	2019-04-04 22:55:44.023642	2019-04-04 22:57:22.442567
1	Администратор	2019-04-04 22:54:32.21137	2019-04-05 01:30:23.70609
3	Модератор	2019-04-05 01:34:51.445259	2019-04-05 01:34:51.445259
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.schema_migrations (version) FROM stdin;
0
20190403105133
20190403105410
20190403105653
20190403105742
20190403105813
20190403105903
20190404213419
20190404213633
20190404224411
20190407224249
20190414043819
20190414044426
20190415042940
20190415050258
20190415051424
20190415052731
20190415072541
20190415073817
20190415080514
20190415080637
20190415080759
20190416113527
20190416122955
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (id, country_id, phone, password, created_at, updated_at, role_id, name, email) FROM stdin;
12	3	+7(546) 549-8465	00a9b5841abe1dbb0b232a25e75b7d5f0b2a877f3e01e861048f621e47d8b58e	2019-04-15 05:47:32.647887	2019-04-15 05:47:32.647887	0	Ера	cleverbrainth@gmail.com
10	3	+7(705) 227-5715	00a9b5841abe1dbb0b232a25e75b7d5f0b2a877f3e01e861048f621e47d8b58e	2019-04-13 02:25:51.87245	2019-04-13 02:25:51.87245	1	Yernazar	soundsnick@gmail.com
\.


--
-- Data for Name: volumes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.volumes (id, name, created_at, updated_at) FROM stdin;
1	Не задано	2019-04-06 16:27:28.785299	2019-04-06 16:27:28.785299
3	3	2019-04-13 00:13:15.607317	2019-04-13 00:13:21.836045
4	2.3	2019-04-14 01:29:55.750569	2019-04-14 01:29:55.750569
\.


--
-- Name: attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.attachments_id_seq', 13, true);


--
-- Name: carcasses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.carcasses_id_seq', 3, true);


--
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cities_id_seq', 335, true);


--
-- Name: colors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.colors_id_seq', 8, true);


--
-- Name: commentaries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.commentaries_id_seq', 7, true);


--
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.countries_id_seq', 5, true);


--
-- Name: feedbacks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.feedbacks_id_seq', 5, true);


--
-- Name: fuels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.fuels_id_seq', 5, true);


--
-- Name: manufacturers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.manufacturers_id_seq', 16, true);


--
-- Name: models_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.models_id_seq', 14, true);


--
-- Name: news_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.news_id_seq', 9, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.orders_id_seq', 1, true);


--
-- Name: parts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.parts_id_seq', 36, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.roles_id_seq', 5, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 12, true);


--
-- Name: volumes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.volumes_id_seq', 4, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: attachments attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.attachments
    ADD CONSTRAINT attachments_pkey PRIMARY KEY (id);


--
-- Name: carcasses carcasses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.carcasses
    ADD CONSTRAINT carcasses_pkey PRIMARY KEY (id);


--
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- Name: colors colors_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.colors
    ADD CONSTRAINT colors_pkey PRIMARY KEY (id);


--
-- Name: commentaries commentaries_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.commentaries
    ADD CONSTRAINT commentaries_pkey PRIMARY KEY (id);


--
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- Name: feedbacks feedbacks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.feedbacks
    ADD CONSTRAINT feedbacks_pkey PRIMARY KEY (id);


--
-- Name: fuels fuels_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.fuels
    ADD CONSTRAINT fuels_pkey PRIMARY KEY (id);


--
-- Name: manufacturers manufacturers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.manufacturers
    ADD CONSTRAINT manufacturers_pkey PRIMARY KEY (id);


--
-- Name: models models_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.models
    ADD CONSTRAINT models_pkey PRIMARY KEY (id);


--
-- Name: news news_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: parts parts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.parts
    ADD CONSTRAINT parts_pkey PRIMARY KEY (id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: volumes volumes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.volumes
    ADD CONSTRAINT volumes_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

