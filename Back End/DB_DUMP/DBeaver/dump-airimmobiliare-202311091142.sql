--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

-- Started on 2023-11-09 11:42:55

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
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 4840 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 218 (class 1259 OID 16716)
-- Name: aste; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.aste (
    id bigint NOT NULL,
    compratore character varying(255),
    id_annuncio bigint NOT NULL,
    prezzo_attuale integer NOT NULL,
    prezzo_iniziale integer NOT NULL
);


ALTER TABLE public.aste OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16715)
-- Name: aste_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.aste_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.aste_id_seq OWNER TO postgres;

--
-- TOC entry 4841 (class 0 OID 0)
-- Dependencies: 217
-- Name: aste_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.aste_id_seq OWNED BY public.aste.id;


--
-- TOC entry 220 (class 1259 OID 16723)
-- Name: immagini; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.immagini (
    id bigint NOT NULL,
    id_annuncio bigint NOT NULL,
    url character varying(255),
    immobile bigint
);


ALTER TABLE public.immagini OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16722)
-- Name: immagini_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.immagini_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.immagini_id_seq OWNER TO postgres;

--
-- TOC entry 4842 (class 0 OID 0)
-- Dependencies: 219
-- Name: immagini_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.immagini_id_seq OWNED BY public.immagini.id;


--
-- TOC entry 222 (class 1259 OID 16730)
-- Name: immobili; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.immobili (
    id bigint NOT NULL,
    categoria character varying(255),
    descrizione character varying(255),
    id_proprietario bigint NOT NULL,
    in_asta boolean NOT NULL,
    indirizzo character varying(255),
    metri_quadri double precision NOT NULL,
    nome character varying(255),
    prezzo_iniziale double precision NOT NULL,
    venduto boolean NOT NULL,
    asta_id bigint,
    utente_id bigint,
    prezzo_attuale double precision
);


ALTER TABLE public.immobili OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16729)
-- Name: immobili_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.immobili_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.immobili_id_seq OWNER TO postgres;

--
-- TOC entry 4843 (class 0 OID 0)
-- Dependencies: 221
-- Name: immobili_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.immobili_id_seq OWNED BY public.immobili.id;


--
-- TOC entry 215 (class 1259 OID 16500)
-- Name: immobili_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.immobili_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.immobili_seq OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16739)
-- Name: recensioni; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recensioni (
    id bigint NOT NULL,
    autore character varying(255),
    id_immobile bigint NOT NULL,
    id_utente bigint NOT NULL,
    testo character varying(255),
    titolo character varying(255),
    voto smallint,
    immobili_id bigint,
    utenti_id bigint,
    data timestamp(6) without time zone
);


ALTER TABLE public.recensioni OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16738)
-- Name: recensioni_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.recensioni_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.recensioni_id_seq OWNER TO postgres;

--
-- TOC entry 4844 (class 0 OID 0)
-- Dependencies: 223
-- Name: recensioni_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.recensioni_id_seq OWNED BY public.recensioni.id;


--
-- TOC entry 226 (class 1259 OID 16748)
-- Name: utenti; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.utenti (
    id bigint NOT NULL,
    admin boolean NOT NULL,
    banned boolean NOT NULL,
    cognome character varying(255),
    email character varying(255),
    nome character varying(255),
    seller boolean NOT NULL,
    telefono bigint,
    password character varying(255)
);


ALTER TABLE public.utenti OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16747)
-- Name: utenti_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.utenti_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.utenti_id_seq OWNER TO postgres;

--
-- TOC entry 4845 (class 0 OID 0)
-- Dependencies: 225
-- Name: utenti_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.utenti_id_seq OWNED BY public.utenti.id;


--
-- TOC entry 216 (class 1259 OID 16508)
-- Name: utenti_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.utenti_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.utenti_seq OWNER TO postgres;

--
-- TOC entry 4656 (class 2604 OID 16719)
-- Name: aste id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aste ALTER COLUMN id SET DEFAULT nextval('public.aste_id_seq'::regclass);


--
-- TOC entry 4657 (class 2604 OID 16726)
-- Name: immagini id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.immagini ALTER COLUMN id SET DEFAULT nextval('public.immagini_id_seq'::regclass);


--
-- TOC entry 4658 (class 2604 OID 16733)
-- Name: immobili id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.immobili ALTER COLUMN id SET DEFAULT nextval('public.immobili_id_seq'::regclass);


--
-- TOC entry 4659 (class 2604 OID 16742)
-- Name: recensioni id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recensioni ALTER COLUMN id SET DEFAULT nextval('public.recensioni_id_seq'::regclass);


--
-- TOC entry 4660 (class 2604 OID 16751)
-- Name: utenti id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utenti ALTER COLUMN id SET DEFAULT nextval('public.utenti_id_seq'::regclass);


--
-- TOC entry 4826 (class 0 OID 16716)
-- Dependencies: 218
-- Data for Name: aste; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.aste (id, compratore, id_annuncio, prezzo_attuale, prezzo_iniziale) FROM stdin;
5	\N	16	1000500	1000000
\.


--
-- TOC entry 4828 (class 0 OID 16723)
-- Dependencies: 220
-- Data for Name: immagini; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.immagini (id, id_annuncio, url, immobile) FROM stdin;
1	1	https://www.ambientecucinaweb.it/wp-content/uploads/sites/23/2021/02/CASALE-LA-QUERCE_-progetto-arch.-A.-Cipriani-esterno.jpg	1
2	7	https://i.ibb.co/sq58bZs/488967934.jpg	\N
3	7	https://i.ibb.co/ftVG90n/488967937.jpg	\N
4	11	https://i.ibb.co/zr2mDZq/a4711389e4399c337074ea26bbfbda3a.jpg	\N
5	11	https://i.ibb.co/4WRpnfk/95008a592fc359a993c59ef63ef8994c.jpg	\N
6	11	https://i.ibb.co/ft6CkWY/bc952d6d3e08f683f8b40e39a10b3769.jpg	\N
7	11	https://i.ibb.co/FBGjPnL/8bcb25a082d1ab8b5920e06ceb6529d8.jpg	\N
8	12	https://i.ibb.co/30RK4Dv/508284095.jpg	\N
9	12	https://i.ibb.co/F8gXdzb/508284112.jpg	\N
10	12	https://i.ibb.co/tJ1xgYD/508284133.jpg	\N
11	12	https://i.ibb.co/WG9sZ91/508284119.jpg	\N
12	12	https://i.ibb.co/kBXWLPY/508284153.jpg	\N
13	13	https://i.ibb.co/QjDPKGK/511640759.jpg	\N
14	13	https://i.ibb.co/mqC1mtH/511803240.jpg	\N
15	13	https://i.ibb.co/mDCZR9q/508953119.jpg	\N
16	13	https://i.ibb.co/kXSHK9q/508953127.jpg	\N
17	13	https://i.ibb.co/Rj7YS21/512245836.jpg	\N
18	14	https://i.ibb.co/SrsTwDN/550832154.jpg	\N
19	14	https://i.ibb.co/5RyYq0N/550832020.jpg	\N
20	14	https://i.ibb.co/5BWH1T8/550832144.jpg	\N
21	14	https://i.ibb.co/VQQ5xL1/550832133.jpg	\N
22	14	https://i.ibb.co/Y36q0QL/550832109.jpg	\N
23	14	https://i.ibb.co/g3CdWr5/550832136.jpg	\N
24	14	https://i.ibb.co/3h53vBX/550832138.jpg	\N
25	15	https://i.ibb.co/ysfpvXK/457903789.jpg	\N
26	15	https://i.ibb.co/3cwymR0/457903779.jpg	\N
27	15	https://i.ibb.co/gDQBG2D/457903838.jpg	\N
28	15	https://i.ibb.co/rGvGXBK/457903843.jpg	\N
29	15	https://i.ibb.co/nRcTTqS/457903839.jpg	\N
30	16	https://i.ibb.co/GVm9130/493946146.jpg	\N
31	16	https://i.ibb.co/K2CqWgN/493946153.jpg	\N
32	16	https://i.ibb.co/K5BR1Vn/471384328.jpg	\N
33	16	https://i.ibb.co/dMgsTZV/503115823.jpg	\N
\.


--
-- TOC entry 4830 (class 0 OID 16730)
-- Dependencies: 222
-- Data for Name: immobili; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.immobili (id, categoria, descrizione, id_proprietario, in_asta, indirizzo, metri_quadri, nome, prezzo_iniziale, venduto, asta_id, utente_id, prezzo_attuale) FROM stdin;
1	Casale	Splendido Casale Toscano In Vendita	1	f	Via Bruno Buozzi, 19; Loro Ciuffenna; Arezzo; 52011	164	Antico Casale Toscano	2000000	f	\N	1	2000000
7	Villa	Prestigiosa residenza del 1600 in vendita lungo le rive dell’Arno, tra le armoniose colline dell’Appennino Tosco-Romagnolo	2	f	Via Carlo Marx, 10 ; Bibbiena ; Arezzo ; 52011	1525	Villa Bibbiena	3500000	f	\N	\N	3000000
11	Villa	Nel “Complesso Residenziale Pini di Roma” proponiamo in vendita in prestigiosi villini di 2 piani appartamenti di varia tipologia, dal monolocale al quadrilocale, tutti con box di pertinenza, terrazza o giardino con barbecue in muratura.	2	f	Via Quarto di Peperino, 35 ; Roma ; Roma ; 00188	139	Villino Zona Roma	590600	f	\N	\N	590600
12	Appartamento	Appartamento di pregio finemente ristrutturato in vendita nel centro storico di Firenze, nelle vicinanze dei famosi Hotel Excelsior e St. Regis, a pochi minuti da Piazza Goldoni, Piazza Ognissanti e Lungarno Vespucci.	2	f	Piazza Carlo Goldoni, 2 ; Firenze ; Firenze ; 50123	180	Appartamento a Firenze	1200000	f	\N	\N	1200000
13	Attico	Presentiamo in vendita un esclusivo attico di lusso con finiture di altissimo livello, situato nella prestigiosa zona della Crocetta, nel cuore di Torino. Questa straordinaria residenza si estende su due livelli, offrendo uno spazio senza paragoni.	2	f	Via Massena, 103 ; Torino ; Torino ; 10128	495	Attico, Mansarda a Torino	960000	f	\N	\N	960000
14	Attico	Nel quartiere di San Siro, noto per la presenza dello stadio ma anche zona verde e residenziale, densa di Storia e di arte, la Zampetti immobili di Pregio propone in vendita uno splendido ed esclusivo attico di circa 600 mq.	2	f	Via Ippodromo , 67 ; Milano ; Milano ; 20151	300	Attico, Mansarda a Milano	4600000	f	\N	\N	4600000
15	Villa	Villa unica a Milano: design moderno, finiture di lusso, ampi spazi verdi e vista panoramica. L’eleganza si fonde con l’avanguardia in questa residenza esclusiva nel cuore della città.	2	f	Via Asiago , 35 ; Milano ; Milano ; 20127	131	Villa a Milano	1090000	f	\N	\N	1090000
16	Villa	Sulle colline di Bologna a solo 2 chilometri da porta San Mamolo, bella villa unifamigliare ristrutturata e riqualificata con finiture di pregio. La residenza è inserita in elegante giardino privato con alberi ed aiuole ornamentali ed in parte pavimentato	2	t	Via di Roncrio, 34 ; Bologna ; Bologna ; 40123	270	Villa a Bologna	1750000	f	\N	\N	1750000
\.


--
-- TOC entry 4832 (class 0 OID 16739)
-- Dependencies: 224
-- Data for Name: recensioni; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recensioni (id, autore, id_immobile, id_utente, testo, titolo, voto, immobili_id, utenti_id, data) FROM stdin;
2	Angelo F.	1	1	Ho visitato l’immobile e sono rimasto soddisfatto considerando lo stato di esso.	Immobile in Ottimo Stato!	5	1	1	2023-10-08 07:49:41
\.


--
-- TOC entry 4834 (class 0 OID 16748)
-- Dependencies: 226
-- Data for Name: utenti; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.utenti (id, admin, banned, cognome, email, nome, seller, telefono, password) FROM stdin;
3	f	f	Rossi	officialbangy@gmail.com	Giovanni	f	3276249311	test
10	f	f	Cookies	cookietest@gmail.com	Cookino	t	3276249311	test
5	f	f	Bianchi	kitsxned@gmail.com	Antonio	f	3276249311	test
9	f	f	Verdi	testingform@gmail.com	Peppino	t	3317508535	test
4	f	f	Rossi	kitsned@gmail.com	Francesco	f	3276249311	test
6	f	f	Verdi	testing123@gmail.com	Luigi	t	3276249311	test
2	f	f	Rossi	x9bangy@gmail.com	Mario	t	3276249311	test
1	t	f	Fittipaldi	angelopiofittipaldi@outlook.it	Angelo Francesco Pio	t	3276249311	admin
11	f	f	test	register.test@gmail.com	register	f	3276249311	test
12	f	f	test1	register.test1@gmail.com	register1	f	3276249311	test
13	f	f	test3	register.test3@gmail.com	register3	f	3276249311	test
14	f	f	test4	register.test4seller@gmail.com	register4	t	3276249311	test
15	f	f	test5	register.test5errors@gmail.com	register5	t	3276249311	test
16	f	t	Testing	testingpayload@gmail.com	Testing	t	3276249311	test
\.


--
-- TOC entry 4846 (class 0 OID 0)
-- Dependencies: 217
-- Name: aste_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.aste_id_seq', 5, true);


--
-- TOC entry 4847 (class 0 OID 0)
-- Dependencies: 219
-- Name: immagini_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.immagini_id_seq', 33, true);


--
-- TOC entry 4848 (class 0 OID 0)
-- Dependencies: 221
-- Name: immobili_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.immobili_id_seq', 16, true);


--
-- TOC entry 4849 (class 0 OID 0)
-- Dependencies: 215
-- Name: immobili_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.immobili_seq', 1, false);


--
-- TOC entry 4850 (class 0 OID 0)
-- Dependencies: 223
-- Name: recensioni_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.recensioni_id_seq', 5, true);


--
-- TOC entry 4851 (class 0 OID 0)
-- Dependencies: 225
-- Name: utenti_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.utenti_id_seq', 16, true);


--
-- TOC entry 4852 (class 0 OID 0)
-- Dependencies: 216
-- Name: utenti_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.utenti_seq', 1, false);


--
-- TOC entry 4662 (class 2606 OID 16721)
-- Name: aste aste_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aste
    ADD CONSTRAINT aste_pkey PRIMARY KEY (id);


--
-- TOC entry 4664 (class 2606 OID 16728)
-- Name: immagini immagini_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.immagini
    ADD CONSTRAINT immagini_pkey PRIMARY KEY (id);


--
-- TOC entry 4666 (class 2606 OID 16737)
-- Name: immobili immobili_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.immobili
    ADD CONSTRAINT immobili_pkey PRIMARY KEY (id);


--
-- TOC entry 4672 (class 2606 OID 16746)
-- Name: recensioni recensioni_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recensioni
    ADD CONSTRAINT recensioni_pkey PRIMARY KEY (id);


--
-- TOC entry 4668 (class 2606 OID 16757)
-- Name: immobili uk_615qe4ah580tqs5dlrcb35r0o; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.immobili
    ADD CONSTRAINT uk_615qe4ah580tqs5dlrcb35r0o UNIQUE (asta_id);


--
-- TOC entry 4670 (class 2606 OID 16759)
-- Name: immobili uk_od777ghoc4o0kwrdoy5sk7b5m; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.immobili
    ADD CONSTRAINT uk_od777ghoc4o0kwrdoy5sk7b5m UNIQUE (utente_id);


--
-- TOC entry 4674 (class 2606 OID 16755)
-- Name: utenti utenti_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utenti
    ADD CONSTRAINT utenti_pkey PRIMARY KEY (id);


--
-- TOC entry 4678 (class 2606 OID 16780)
-- Name: recensioni fk1yvghpay14oq90xee8ijg0gwq; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recensioni
    ADD CONSTRAINT fk1yvghpay14oq90xee8ijg0gwq FOREIGN KEY (utenti_id) REFERENCES public.utenti(id);


--
-- TOC entry 4679 (class 2606 OID 16775)
-- Name: recensioni fk6xnlofhjtcd7qaxs8i93tmifu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recensioni
    ADD CONSTRAINT fk6xnlofhjtcd7qaxs8i93tmifu FOREIGN KEY (immobili_id) REFERENCES public.immobili(id);


--
-- TOC entry 4676 (class 2606 OID 16770)
-- Name: immobili fkdburjmpr7sse511iu6cwh62u7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.immobili
    ADD CONSTRAINT fkdburjmpr7sse511iu6cwh62u7 FOREIGN KEY (utente_id) REFERENCES public.utenti(id);


--
-- TOC entry 4675 (class 2606 OID 16760)
-- Name: immagini fknknp1emml2dsgaduwqeqrn0hh; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.immagini
    ADD CONSTRAINT fknknp1emml2dsgaduwqeqrn0hh FOREIGN KEY (immobile) REFERENCES public.immobili(id);


--
-- TOC entry 4677 (class 2606 OID 16765)
-- Name: immobili fkp3dhvdbpa3qiwpcud7xfef5g1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.immobili
    ADD CONSTRAINT fkp3dhvdbpa3qiwpcud7xfef5g1 FOREIGN KEY (asta_id) REFERENCES public.aste(id);


-- Completed on 2023-11-09 11:42:55

--
-- PostgreSQL database dump complete
--

