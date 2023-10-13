--
-- PostgreSQL database dump
--

-- Dumped from database version 14.3
-- Dumped by pg_dump version 14.3

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
-- Name: persons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.persons (
    id integer NOT NULL,
    birth_year character varying,
    eye_color character varying,
    films text,
    gender character varying,
    hair_color character varying,
    height character varying,
    homeworld character varying,
    mass character varying,
    name character varying,
    skin_color character varying,
    species text,
    starships text,
    vehicles text
);


ALTER TABLE public.persons OWNER TO postgres;

--
-- Name: persons_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.persons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.persons_id_seq OWNER TO postgres;

--
-- Name: persons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.persons_id_seq OWNED BY public.persons.id;


--
-- Name: persons id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persons ALTER COLUMN id SET DEFAULT nextval('public.persons_id_seq'::regclass);


--
-- Data for Name: persons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.persons (id, birth_year, eye_color, films, gender, hair_color, height, homeworld, mass, name, skin_color, species, starships, vehicles) FROM stdin;
1	unknown	orange	The Phantom Menace	male	none	112	Malastare	40	Sebulba	grey, red	Dug		
2	unknown	brown	Attack of the Clones	female	brown	157	Naboo	unknown	Cordé	light			
3	62BBY	brown	The Phantom Menace	male	black	183	Naboo	unknown	Quarsh Panaka	dark			
4	82BBY	yellow	The Empire Strikes Back, Return of the Jedi, The Phantom Menace, Attack of the Clones, Revenge of the Sith	male	grey	170	Naboo	75	Palpatine	pale			
5	82BBY	blue	Attack of the Clones	male	brown	183	Tatooine	unknown	Cliegg Lars	fair			
6	unknown	yellow	Attack of the Clones	male	none	198	Ojom	102	Dexter Jettster	brown	Besalisk		
7	72BBY	brown	The Phantom Menace, Attack of the Clones, Revenge of the Sith	male	none	188	Haruun Kal	84	Mace Windu	dark			
8	unknown	black	Return of the Jedi	male	none	160	Sullust	68	Nien Nunb	grey	Sullustan	Millennium Falcon	
9	72BBY	brown	The Phantom Menace, Attack of the Clones	female	black	163	Tatooine	unknown	Shmi Skywalker	fair			
10	92BBY	blue	The Phantom Menace	male	brown	193	unknown	89	Qui-Gon Jinn	fair			Tribubble bongo
11	unknown	red	The Phantom Menace, Attack of the Clones, Revenge of the Sith	male	none	191	Cato Neimoidia	90	Nute Gunray	mottled green	Neimodian		
12	92BBY	yellow	The Phantom Menace, Attack of the Clones, Revenge of the Sith	male	white	198	Cerea	82	Ki-Adi-Mundi	pale	Cerean		
13	54BBY	yellow	The Phantom Menace	male	none	175	Dathomir	80	Darth Maul	red	Zabrak	Scimitar	Sith speeder
14	unknown	black	Attack of the Clones	male	none	229	Kamino	88	Lama Su	grey	Kaminoan		
15	31.5BBY	brown	The Empire Strikes Back, Return of the Jedi, Attack of the Clones	male	black	183	Kamino	78.2	Boba Fett	fair		Slave 1	
16	unknown	pink	Return of the Jedi	male	none	180	Ryloth	unknown	Bib Fortuna	pale	Twi'lek		
17	unknown	black	The Phantom Menace, Attack of the Clones, Revenge of the Sith	male	none	196	Glee Anselm	87	Kit Fisto	green	Nautolan		
18	15BBY	red	The Empire Strikes Back	none	none	200	unknown	140	IG-88	metal	Droid		
19	unknown	black	Attack of the Clones	female	none	213	Kamino	unknown	Taun We	grey	Kaminoan		
20	48BBY	hazel	The Phantom Menace, Attack of the Clones, Revenge of the Sith	female	none	178	Ryloth	55	Ayla Secura	blue	Twi'lek		
21	unknown	brown	The Phantom Menace, Revenge of the Sith	male	black	171	Iridonia	unknown	Eeth Koth	brown	Zabrak		
22	53BBY	red	The Empire Strikes Back	male	none	190	Trandosha	113	Bossk	green	Trandoshan		
23	unknown	unknown	The Phantom Menace	male	none	79	Aleen Minor	15	Ratts Tyerel	grey, blue	Aleena		
24	unknown	yellow	The Phantom Menace	male	none	94	Vulpter	45	Dud Bolt	blue, grey	Vulptereen		
25	unknown	blue	Attack of the Clones	female	white	167	Coruscant	unknown	Jocasta Nu	fair	Human		
26	unknown	red, blue	Attack of the Clones, Revenge of the Sith	female	none	96	unknown	unknown	R4-P17	silver, red			
27	unknown	blue	The Phantom Menace, Revenge of the Sith	female	none	184	Coruscant	50	Adi Gallia	dark	Tholothian		
28	unknown	black	The Phantom Menace	male	none	122	Troiken	unknown	Gasgano	white, blue	Xexto		
29	unknown	unknown	Attack of the Clones	male	none	193	Skako	48	Wat Tambor	green, grey	Skakoan		
30	unknown	orange	The Phantom Menace, Revenge of the Sith	male	none	188	Iktotch	unknown	Saesee Tiin	pale	Iktotchi		
31	unknown	gold	Attack of the Clones	male	none	191	Muunilinst	unknown	San Hill	grey	Muun		
32	unknown	orange	The Phantom Menace	male	none	163	Tund	65	Ben Quadinaros	grey, green, yellow	Toong		
33	unknown	yellow	The Phantom Menace	male	none	264	Quermia	unknown	Yarael Poof	white	Quermian		
34	unknown	black	Attack of the Clones, Revenge of the Sith	female	none	178	Shili	57	Shaak Ti	red, blue, white	Togruta		
35	22BBY	black	The Phantom Menace, Attack of the Clones, Revenge of the Sith	male	none	188	Dorin	80	Plo Koon	orange	Kel Dor	Jedi starfighter	
36	unknown	green, yellow	Revenge of the Sith	male	none	216	Kalee	159	Grievous	brown, white	Kaleesh	Belbullab-22 starfighter	Tsmeu-6 personal wheel bike
37	unknown	blue	The Phantom Menace, Attack of the Clones	male	none	196	Champala	unknown	Mas Amedda	blue	Chagrian		
38	unknown	blue	Revenge of the Sith	male	brown	234	Kashyyyk	136	Tarfful	brown	Wookie		
\.


--
-- Name: persons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.persons_id_seq', 38, true);


--
-- Name: persons persons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persons
    ADD CONSTRAINT persons_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

