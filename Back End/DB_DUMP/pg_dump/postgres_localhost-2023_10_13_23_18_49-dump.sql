toc.dat                                                                                             0000600 0004000 0002000 00000034435 14512332071 0014446 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP   1                	    {           airimmobiliare    16.0    16.0 2    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false         �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false         �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false         �           1262    16492    airimmobiliare    DATABASE     �   CREATE DATABASE airimmobiliare WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Italian_Italy.1252';
    DROP DATABASE airimmobiliare;
                postgres    false         �            1259    16716    aste    TABLE     �   CREATE TABLE public.aste (
    id bigint NOT NULL,
    compratore character varying(255),
    id_annuncio bigint NOT NULL,
    prezzo_attuale integer NOT NULL,
    prezzo_iniziale integer NOT NULL
);
    DROP TABLE public.aste;
       public         heap    postgres    false         �            1259    16715    aste_id_seq    SEQUENCE     t   CREATE SEQUENCE public.aste_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.aste_id_seq;
       public          postgres    false    218         �           0    0    aste_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.aste_id_seq OWNED BY public.aste.id;
          public          postgres    false    217         �            1259    16723    immagini    TABLE     �   CREATE TABLE public.immagini (
    id bigint NOT NULL,
    id_annuncio bigint NOT NULL,
    url character varying(255),
    immobile bigint
);
    DROP TABLE public.immagini;
       public         heap    postgres    false         �            1259    16722    immagini_id_seq    SEQUENCE     x   CREATE SEQUENCE public.immagini_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.immagini_id_seq;
       public          postgres    false    220         �           0    0    immagini_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.immagini_id_seq OWNED BY public.immagini.id;
          public          postgres    false    219         �            1259    16730    immobili    TABLE     �  CREATE TABLE public.immobili (
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
    DROP TABLE public.immobili;
       public         heap    postgres    false         �            1259    16729    immobili_id_seq    SEQUENCE     x   CREATE SEQUENCE public.immobili_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.immobili_id_seq;
       public          postgres    false    222         �           0    0    immobili_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.immobili_id_seq OWNED BY public.immobili.id;
          public          postgres    false    221         �            1259    16500    immobili_seq    SEQUENCE     v   CREATE SEQUENCE public.immobili_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.immobili_seq;
       public          postgres    false         �            1259    16739 
   recensioni    TABLE     M  CREATE TABLE public.recensioni (
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
    DROP TABLE public.recensioni;
       public         heap    postgres    false         �            1259    16738    recensioni_id_seq    SEQUENCE     z   CREATE SEQUENCE public.recensioni_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.recensioni_id_seq;
       public          postgres    false    224         �           0    0    recensioni_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.recensioni_id_seq OWNED BY public.recensioni.id;
          public          postgres    false    223         �            1259    16748    utenti    TABLE     .  CREATE TABLE public.utenti (
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
    DROP TABLE public.utenti;
       public         heap    postgres    false         �            1259    16747    utenti_id_seq    SEQUENCE     v   CREATE SEQUENCE public.utenti_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.utenti_id_seq;
       public          postgres    false    226         �           0    0    utenti_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.utenti_id_seq OWNED BY public.utenti.id;
          public          postgres    false    225         �            1259    16508 
   utenti_seq    SEQUENCE     t   CREATE SEQUENCE public.utenti_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 !   DROP SEQUENCE public.utenti_seq;
       public          postgres    false         0           2604    16719    aste id    DEFAULT     b   ALTER TABLE ONLY public.aste ALTER COLUMN id SET DEFAULT nextval('public.aste_id_seq'::regclass);
 6   ALTER TABLE public.aste ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    218    218         1           2604    16726    immagini id    DEFAULT     j   ALTER TABLE ONLY public.immagini ALTER COLUMN id SET DEFAULT nextval('public.immagini_id_seq'::regclass);
 :   ALTER TABLE public.immagini ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    219    220         2           2604    16733    immobili id    DEFAULT     j   ALTER TABLE ONLY public.immobili ALTER COLUMN id SET DEFAULT nextval('public.immobili_id_seq'::regclass);
 :   ALTER TABLE public.immobili ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    222    222         3           2604    16742    recensioni id    DEFAULT     n   ALTER TABLE ONLY public.recensioni ALTER COLUMN id SET DEFAULT nextval('public.recensioni_id_seq'::regclass);
 <   ALTER TABLE public.recensioni ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    223    224         4           2604    16751 	   utenti id    DEFAULT     f   ALTER TABLE ONLY public.utenti ALTER COLUMN id SET DEFAULT nextval('public.utenti_id_seq'::regclass);
 8   ALTER TABLE public.utenti ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    226    225    226         �          0    16716    aste 
   TABLE DATA           \   COPY public.aste (id, compratore, id_annuncio, prezzo_attuale, prezzo_iniziale) FROM stdin;
    public          postgres    false    218       4826.dat �          0    16723    immagini 
   TABLE DATA           B   COPY public.immagini (id, id_annuncio, url, immobile) FROM stdin;
    public          postgres    false    220       4828.dat �          0    16730    immobili 
   TABLE DATA           �   COPY public.immobili (id, categoria, descrizione, id_proprietario, in_asta, indirizzo, metri_quadri, nome, prezzo_iniziale, venduto, asta_id, utente_id, prezzo_attuale) FROM stdin;
    public          postgres    false    222       4830.dat �          0    16739 
   recensioni 
   TABLE DATA           {   COPY public.recensioni (id, autore, id_immobile, id_utente, testo, titolo, voto, immobili_id, utenti_id, data) FROM stdin;
    public          postgres    false    224       4832.dat �          0    16748    utenti 
   TABLE DATA           e   COPY public.utenti (id, admin, banned, cognome, email, nome, seller, telefono, password) FROM stdin;
    public          postgres    false    226       4834.dat �           0    0    aste_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.aste_id_seq', 5, true);
          public          postgres    false    217         �           0    0    immagini_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.immagini_id_seq', 33, true);
          public          postgres    false    219         �           0    0    immobili_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.immobili_id_seq', 16, true);
          public          postgres    false    221         �           0    0    immobili_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.immobili_seq', 1, false);
          public          postgres    false    215         �           0    0    recensioni_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.recensioni_id_seq', 5, true);
          public          postgres    false    223         �           0    0    utenti_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.utenti_id_seq', 16, true);
          public          postgres    false    225         �           0    0 
   utenti_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.utenti_seq', 1, false);
          public          postgres    false    216         6           2606    16721    aste aste_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.aste
    ADD CONSTRAINT aste_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.aste DROP CONSTRAINT aste_pkey;
       public            postgres    false    218         8           2606    16728    immagini immagini_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.immagini
    ADD CONSTRAINT immagini_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.immagini DROP CONSTRAINT immagini_pkey;
       public            postgres    false    220         :           2606    16737    immobili immobili_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.immobili
    ADD CONSTRAINT immobili_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.immobili DROP CONSTRAINT immobili_pkey;
       public            postgres    false    222         @           2606    16746    recensioni recensioni_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.recensioni
    ADD CONSTRAINT recensioni_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.recensioni DROP CONSTRAINT recensioni_pkey;
       public            postgres    false    224         <           2606    16757 %   immobili uk_615qe4ah580tqs5dlrcb35r0o 
   CONSTRAINT     c   ALTER TABLE ONLY public.immobili
    ADD CONSTRAINT uk_615qe4ah580tqs5dlrcb35r0o UNIQUE (asta_id);
 O   ALTER TABLE ONLY public.immobili DROP CONSTRAINT uk_615qe4ah580tqs5dlrcb35r0o;
       public            postgres    false    222         >           2606    16759 %   immobili uk_od777ghoc4o0kwrdoy5sk7b5m 
   CONSTRAINT     e   ALTER TABLE ONLY public.immobili
    ADD CONSTRAINT uk_od777ghoc4o0kwrdoy5sk7b5m UNIQUE (utente_id);
 O   ALTER TABLE ONLY public.immobili DROP CONSTRAINT uk_od777ghoc4o0kwrdoy5sk7b5m;
       public            postgres    false    222         B           2606    16755    utenti utenti_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.utenti
    ADD CONSTRAINT utenti_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.utenti DROP CONSTRAINT utenti_pkey;
       public            postgres    false    226         F           2606    16780 &   recensioni fk1yvghpay14oq90xee8ijg0gwq    FK CONSTRAINT     �   ALTER TABLE ONLY public.recensioni
    ADD CONSTRAINT fk1yvghpay14oq90xee8ijg0gwq FOREIGN KEY (utenti_id) REFERENCES public.utenti(id);
 P   ALTER TABLE ONLY public.recensioni DROP CONSTRAINT fk1yvghpay14oq90xee8ijg0gwq;
       public          postgres    false    4674    226    224         G           2606    16775 &   recensioni fk6xnlofhjtcd7qaxs8i93tmifu    FK CONSTRAINT     �   ALTER TABLE ONLY public.recensioni
    ADD CONSTRAINT fk6xnlofhjtcd7qaxs8i93tmifu FOREIGN KEY (immobili_id) REFERENCES public.immobili(id);
 P   ALTER TABLE ONLY public.recensioni DROP CONSTRAINT fk6xnlofhjtcd7qaxs8i93tmifu;
       public          postgres    false    224    222    4666         D           2606    16770 $   immobili fkdburjmpr7sse511iu6cwh62u7    FK CONSTRAINT     �   ALTER TABLE ONLY public.immobili
    ADD CONSTRAINT fkdburjmpr7sse511iu6cwh62u7 FOREIGN KEY (utente_id) REFERENCES public.utenti(id);
 N   ALTER TABLE ONLY public.immobili DROP CONSTRAINT fkdburjmpr7sse511iu6cwh62u7;
       public          postgres    false    222    4674    226         C           2606    16760 $   immagini fknknp1emml2dsgaduwqeqrn0hh    FK CONSTRAINT     �   ALTER TABLE ONLY public.immagini
    ADD CONSTRAINT fknknp1emml2dsgaduwqeqrn0hh FOREIGN KEY (immobile) REFERENCES public.immobili(id);
 N   ALTER TABLE ONLY public.immagini DROP CONSTRAINT fknknp1emml2dsgaduwqeqrn0hh;
       public          postgres    false    220    4666    222         E           2606    16765 $   immobili fkp3dhvdbpa3qiwpcud7xfef5g1    FK CONSTRAINT     �   ALTER TABLE ONLY public.immobili
    ADD CONSTRAINT fkp3dhvdbpa3qiwpcud7xfef5g1 FOREIGN KEY (asta_id) REFERENCES public.aste(id);
 N   ALTER TABLE ONLY public.immobili DROP CONSTRAINT fkp3dhvdbpa3qiwpcud7xfef5g1;
       public          postgres    false    4662    218    222                                                                                                                                                                                                                                           4826.dat                                                                                            0000600 0004000 0002000 00000000035 14512332071 0014251 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        5	\N	16	1000000	1000000
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   4828.dat                                                                                            0000600 0004000 0002000 00000003333 14512332071 0014257 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	1	https://www.ambientecucinaweb.it/wp-content/uploads/sites/23/2021/02/CASALE-LA-QUERCE_-progetto-arch.-A.-Cipriani-esterno.jpg	1
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


                                                                                                                                                                                                                                                                                                     4830.dat                                                                                            0000600 0004000 0002000 00000004557 14512332071 0014261 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Casale	Splendido Casale Toscano In Vendita	1	f	Via Bruno Buozzi, 19; Loro Ciuffenna; Arezzo; 52011	164	Antico Casale Toscano	2000000	f	\N	1	2000000
7	Villa	Prestigiosa residenza del 1600 in vendita lungo le rive dell’Arno, tra le armoniose colline dell’Appennino Tosco-Romagnolo	2	f	Via Carlo Marx, 10 ; Bibbiena ; Arezzo ; 52011	1525	Villa Bibbiena	3500000	f	\N	\N	3000000
11	Villa	Nel “Complesso Residenziale Pini di Roma” proponiamo in vendita in prestigiosi villini di 2 piani appartamenti di varia tipologia, dal monolocale al quadrilocale, tutti con box di pertinenza, terrazza o giardino con barbecue in muratura.	2	f	Via Quarto di Peperino, 35 ; Roma ; Roma ; 00188	139	Villino Zona Roma	590600	f	\N	\N	590600
12	Appartamento	Appartamento di pregio finemente ristrutturato in vendita nel centro storico di Firenze, nelle vicinanze dei famosi Hotel Excelsior e St. Regis, a pochi minuti da Piazza Goldoni, Piazza Ognissanti e Lungarno Vespucci.	2	f	Piazza Carlo Goldoni, 2 ; Firenze ; Firenze ; 50123	180	Appartamento a Firenze	1200000	f	\N	\N	1200000
13	Attico	Presentiamo in vendita un esclusivo attico di lusso con finiture di altissimo livello, situato nella prestigiosa zona della Crocetta, nel cuore di Torino. Questa straordinaria residenza si estende su due livelli, offrendo uno spazio senza paragoni.	2	f	Via Massena, 103 ; Torino ; Torino ; 10128	495	Attico, Mansarda a Torino	960000	f	\N	\N	960000
14	Attico	Nel quartiere di San Siro, noto per la presenza dello stadio ma anche zona verde e residenziale, densa di Storia e di arte, la Zampetti immobili di Pregio propone in vendita uno splendido ed esclusivo attico di circa 600 mq.	2	f	Via Ippodromo , 67 ; Milano ; Milano ; 20151	300	Attico, Mansarda a Milano	4600000	f	\N	\N	4600000
15	Villa	Villa unica a Milano: design moderno, finiture di lusso, ampi spazi verdi e vista panoramica. L'eleganza si fonde con l'avanguardia in questa residenza esclusiva nel cuore della città.	2	f	Via Asiago , 35 ; Milano ; Milano ; 20127	131	Villa a Milano	1090000	f	\N	\N	1090000
16	Villa	Sulle colline di Bologna a solo 2 chilometri da porta San Mamolo, bella villa unifamigliare ristrutturata e riqualificata con finiture di pregio. La residenza è inserita in elegante giardino privato con alberi ed aiuole ornamentali ed in parte pavimentato	2	t	Via di Roncrio, 34 ; Bologna ; Bologna ; 40123	270	Villa a Bologna	1750000	f	\N	\N	1750000
\.


                                                                                                                                                 4832.dat                                                                                            0000600 0004000 0002000 00000000232 14512332071 0014245 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        2	Angelo F.	1	1	Ho visitato l'immobile e sono rimasto soddisfatto considerando lo stato di esso.	Immobile in Ottimo Stato!	5	1	1	2023-10-08 07:49:41
\.


                                                                                                                                                                                                                                                                                                                                                                      4834.dat                                                                                            0000600 0004000 0002000 00000001617 14512332071 0014257 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        3	f	f	Rossi	officialbangy@gmail.com	Giovanni	f	3276249311	test
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


                                                                                                                 restore.sql                                                                                         0000600 0004000 0002000 00000027431 14512332071 0015371 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

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

DROP DATABASE airimmobiliare;
--
-- Name: airimmobiliare; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE airimmobiliare WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Italian_Italy.1252';


ALTER DATABASE airimmobiliare OWNER TO postgres;

\connect airimmobiliare

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
-- Name: aste_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.aste_id_seq OWNED BY public.aste.id;


--
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
-- Name: immagini_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.immagini_id_seq OWNED BY public.immagini.id;


--
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
-- Name: immobili_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.immobili_id_seq OWNED BY public.immobili.id;


--
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
-- Name: recensioni_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.recensioni_id_seq OWNED BY public.recensioni.id;


--
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
-- Name: utenti_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.utenti_id_seq OWNED BY public.utenti.id;


--
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
-- Name: aste id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aste ALTER COLUMN id SET DEFAULT nextval('public.aste_id_seq'::regclass);


--
-- Name: immagini id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.immagini ALTER COLUMN id SET DEFAULT nextval('public.immagini_id_seq'::regclass);


--
-- Name: immobili id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.immobili ALTER COLUMN id SET DEFAULT nextval('public.immobili_id_seq'::regclass);


--
-- Name: recensioni id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recensioni ALTER COLUMN id SET DEFAULT nextval('public.recensioni_id_seq'::regclass);


--
-- Name: utenti id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utenti ALTER COLUMN id SET DEFAULT nextval('public.utenti_id_seq'::regclass);


--
-- Data for Name: aste; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.aste (id, compratore, id_annuncio, prezzo_attuale, prezzo_iniziale) FROM stdin;
\.
COPY public.aste (id, compratore, id_annuncio, prezzo_attuale, prezzo_iniziale) FROM '$$PATH$$/4826.dat';

--
-- Data for Name: immagini; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.immagini (id, id_annuncio, url, immobile) FROM stdin;
\.
COPY public.immagini (id, id_annuncio, url, immobile) FROM '$$PATH$$/4828.dat';

--
-- Data for Name: immobili; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.immobili (id, categoria, descrizione, id_proprietario, in_asta, indirizzo, metri_quadri, nome, prezzo_iniziale, venduto, asta_id, utente_id, prezzo_attuale) FROM stdin;
\.
COPY public.immobili (id, categoria, descrizione, id_proprietario, in_asta, indirizzo, metri_quadri, nome, prezzo_iniziale, venduto, asta_id, utente_id, prezzo_attuale) FROM '$$PATH$$/4830.dat';

--
-- Data for Name: recensioni; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recensioni (id, autore, id_immobile, id_utente, testo, titolo, voto, immobili_id, utenti_id, data) FROM stdin;
\.
COPY public.recensioni (id, autore, id_immobile, id_utente, testo, titolo, voto, immobili_id, utenti_id, data) FROM '$$PATH$$/4832.dat';

--
-- Data for Name: utenti; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.utenti (id, admin, banned, cognome, email, nome, seller, telefono, password) FROM stdin;
\.
COPY public.utenti (id, admin, banned, cognome, email, nome, seller, telefono, password) FROM '$$PATH$$/4834.dat';

--
-- Name: aste_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.aste_id_seq', 5, true);


--
-- Name: immagini_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.immagini_id_seq', 33, true);


--
-- Name: immobili_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.immobili_id_seq', 16, true);


--
-- Name: immobili_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.immobili_seq', 1, false);


--
-- Name: recensioni_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.recensioni_id_seq', 5, true);


--
-- Name: utenti_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.utenti_id_seq', 16, true);


--
-- Name: utenti_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.utenti_seq', 1, false);


--
-- Name: aste aste_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aste
    ADD CONSTRAINT aste_pkey PRIMARY KEY (id);


--
-- Name: immagini immagini_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.immagini
    ADD CONSTRAINT immagini_pkey PRIMARY KEY (id);


--
-- Name: immobili immobili_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.immobili
    ADD CONSTRAINT immobili_pkey PRIMARY KEY (id);


--
-- Name: recensioni recensioni_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recensioni
    ADD CONSTRAINT recensioni_pkey PRIMARY KEY (id);


--
-- Name: immobili uk_615qe4ah580tqs5dlrcb35r0o; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.immobili
    ADD CONSTRAINT uk_615qe4ah580tqs5dlrcb35r0o UNIQUE (asta_id);


--
-- Name: immobili uk_od777ghoc4o0kwrdoy5sk7b5m; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.immobili
    ADD CONSTRAINT uk_od777ghoc4o0kwrdoy5sk7b5m UNIQUE (utente_id);


--
-- Name: utenti utenti_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utenti
    ADD CONSTRAINT utenti_pkey PRIMARY KEY (id);


--
-- Name: recensioni fk1yvghpay14oq90xee8ijg0gwq; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recensioni
    ADD CONSTRAINT fk1yvghpay14oq90xee8ijg0gwq FOREIGN KEY (utenti_id) REFERENCES public.utenti(id);


--
-- Name: recensioni fk6xnlofhjtcd7qaxs8i93tmifu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recensioni
    ADD CONSTRAINT fk6xnlofhjtcd7qaxs8i93tmifu FOREIGN KEY (immobili_id) REFERENCES public.immobili(id);


--
-- Name: immobili fkdburjmpr7sse511iu6cwh62u7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.immobili
    ADD CONSTRAINT fkdburjmpr7sse511iu6cwh62u7 FOREIGN KEY (utente_id) REFERENCES public.utenti(id);


--
-- Name: immagini fknknp1emml2dsgaduwqeqrn0hh; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.immagini
    ADD CONSTRAINT fknknp1emml2dsgaduwqeqrn0hh FOREIGN KEY (immobile) REFERENCES public.immobili(id);


--
-- Name: immobili fkp3dhvdbpa3qiwpcud7xfef5g1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.immobili
    ADD CONSTRAINT fkp3dhvdbpa3qiwpcud7xfef5g1 FOREIGN KEY (asta_id) REFERENCES public.aste(id);


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       