--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

-- Started on 2022-01-06 18:53:18

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
-- TOC entry 219 (class 1259 OID 16911)
-- Name: cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart (
    id integer NOT NULL,
    user_id integer
);


ALTER TABLE public.cart OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16910)
-- Name: cart_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cart_id_seq OWNER TO postgres;

--
-- TOC entry 3377 (class 0 OID 0)
-- Dependencies: 218
-- Name: cart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cart_id_seq OWNED BY public.cart.id;


--
-- TOC entry 220 (class 1259 OID 16970)
-- Name: cart_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart_items (
    user_id integer NOT NULL,
    item_id integer NOT NULL,
    quantity integer
);


ALTER TABLE public.cart_items OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16856)
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    name character varying(50)
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16855)
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO postgres;

--
-- TOC entry 3378 (class 0 OID 0)
-- Dependencies: 209
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- TOC entry 212 (class 1259 OID 16863)
-- Name: items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.items (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    description character varying(1000),
    category_id integer,
    price numeric(10,2),
    quantity integer
);


ALTER TABLE public.items OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16862)
-- Name: items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.items_id_seq OWNER TO postgres;

--
-- TOC entry 3379 (class 0 OID 0)
-- Dependencies: 211
-- Name: items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.items_id_seq OWNED BY public.items.id;


--
-- TOC entry 217 (class 1259 OID 16895)
-- Name: order_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_items (
    order_id integer NOT NULL,
    item_id integer NOT NULL,
    quantity integer
);


ALTER TABLE public.order_items OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16882)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    user_id integer,
    total numeric,
    order_date timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16881)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO postgres;

--
-- TOC entry 3380 (class 0 OID 0)
-- Dependencies: 215
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- TOC entry 214 (class 1259 OID 16875)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    first_name character varying(25) NOT NULL,
    last_name character varying(25) NOT NULL,
    address character varying(100),
    email character varying(50) NOT NULL,
    password character varying(200) NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16874)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 3381 (class 0 OID 0)
-- Dependencies: 213
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 3197 (class 2604 OID 16914)
-- Name: cart id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart ALTER COLUMN id SET DEFAULT nextval('public.cart_id_seq'::regclass);


--
-- TOC entry 3192 (class 2604 OID 16859)
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- TOC entry 3193 (class 2604 OID 16866)
-- Name: items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items ALTER COLUMN id SET DEFAULT nextval('public.items_id_seq'::regclass);


--
-- TOC entry 3195 (class 2604 OID 16885)
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- TOC entry 3194 (class 2604 OID 16878)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3370 (class 0 OID 16911)
-- Dependencies: 219
-- Data for Name: cart; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart (id, user_id) FROM stdin;
\.


--
-- TOC entry 3371 (class 0 OID 16970)
-- Dependencies: 220
-- Data for Name: cart_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart_items (user_id, item_id, quantity) FROM stdin;
100068	3	1
100068	8	2
100068	9	2
100068	4	1
\.


--
-- TOC entry 3361 (class 0 OID 16856)
-- Dependencies: 210
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, name) FROM stdin;
1	Furniture
2	Home Decór
3	Pets
4	Lighting
5	Textiles
6	Outdoor
8	Kitchen
9	Storage
\.


--
-- TOC entry 3363 (class 0 OID 16863)
-- Dependencies: 212
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.items (id, name, description, category_id, price, quantity) FROM stdin;
19	Sofa Cusion Set	\N	2	21.00	60
20	Wall Art 	\N	2	25.00	100
21	Mirror	\N	2	39.00	100
22	Wall Clock	\N	2	45.00	100
23	Candle Stick Set	\N	2	15.00	100
25	Curtains - Red	\N	5	25.00	50
26	Curtains - Blue	\N	5	25.00	50
27	Curtains - Black	\N	5	25.00	50
28	Beadspread	\N	5	35.00	50
30	Fluffy Blanket	\N	5	18.00	100
31	Towel Set	\N	5	17.00	100
34	Deck Chair	\N	6	25.00	50
35	Garden Sofa	\N	6	150.00	50
36	Garden Shed	\N	6	200.00	50
38	Parasol	\N	6	52.00	50
39	Barbecue	\N	6	35.00	120
41	Tent	\N	6	89.00	50
45	Dinnerware Set	\N	8	25.00	50
46	Cutlery Set	\N	8	18.00	50
47	Kitchen Utensils Set	\N	8	15.00	50
48	Microwave	\N	8	49.00	50
50	Clothesrail	\N	9	25.00	199
51	Shoerack	\N	9	19.00	50
2	Scented Candle - Lemon	The invigorating citrus twang of Bergamot blended with White Oud and a hint of Amber is guaranteed to transport you to a garden of earthly delights. It opens with a smokey fragrance of rivered wood, rich in nuances, ranging from sweet to earthy which seduces and is long believed to pacify the mind.	2	9.00	145
1	Scented Candle - Forest	Our luxurious It's a beautiful life Fragrance is very popular and this much-loved fragrance is very similar to the well-known lady’s perfume. Our perfumers have recreated this classic scent, packing it full of a rich blend of scents of Concrete of Iris Pallida, Jasmine Sambac, Orange Blossom and Patchouli Essence. They all combine and complement each other to recreate that much loved feminine perfume scent.	2	9.00	119
17	Outdoor Solar Light	\N	4	15.00	150
24	Photo Frames	\N	2	10.00	300
29	Duvet	\N	5	30.00	50
37	Greenhouse	\N	6	125.00	50
40	Plant Pot	\N	6	15.00	100
49	Storage Box	\N	8	35.00	100
3	Scented Candle - Rose	Rose bushes brimming with flowers one day in May. Some are just opening, others are in full bloom, their petals beaded with dew. Their fragrance fills the air with fresh, floral notes.	2	9.00	148
8	Bone Chew Toy	Entertain your pet with the PetSafe Busy Buddy Bouncy Bone interactive dog toy. The design of the durable nylon bone and rubber ball provide dogs with an extended chewing experience. The treat rings last longer than giving treats alone, and dogs keep chewing the toy well after the irresistible treats are gone.	3	8.00	119
4	Squeaky Toy - Pig	Made from vinyl, the piggy is great for the outdoors, with being able to give them a rinse under the tap after each use. They are perfect for encouraging playing games of catch and fetch both indoors and out.	3	8.00	99
32	Tablecloth	\N	5	12.00	99
10	Wooden Bed	A classic design made for contemporary or classic-style interiors. It’s a bed with timeless appeal handmade with natural, authentic timber to your specifications. There’s ample room for underbed storage in a bed that deserves to be the centrepiece of your bedroom.	1	325.00	46
6	Ball Launcher	Your dog will have a great time playing fetch with the Automatic Ball Launcher. The water-resistant launcher is great for both indoor and outdoor interactive play. With 9 distance settings and 6 angle settings the launcher shoots standard sized tennis balls between 2.5 to 9 metres and up to a 45 degree angle.	3	99.00	22
5	Puppy Toys - Bundle	This is the perfect puppy pack to make the new addition to your family feel at home. It gives them a soft comforter blanket and cord doggie teddy to snuggle up with, and a pack of toys to keep them perfectly entertained.	3	19.00	47
11	Iron Bed	Your bedroom is going to look great with an iron bed, handmade using traditional techniques and materials to a high standard of quality and finish	1	375.00	49
7	Tug of War	These extra strong and durable toys are great for tugging and pulling and will keep your dog amused whilst helping to clean their teeth and massage their gums, so we think it's time to go and Play Ruff. For ultimate ruff and tuff playtime, this extra strong Ruffer and Tuffer Rugged Chew Ball and Rope Dog Toy is the perfect toy to keep your dog entertained with its tight weave of twisted ropes and durable rubber casing, allowing your dog to tug for hours on end keeping them happy and satisfied	3	12.00	49
13	Pendand Light	\N	4	75.00	48
33	Garden Dining Set	\N	6	250.00	47
9	Upholstered Bed	This divan bed comes with an orthopedic mattress that provides a supportive and even sleeping surface	1	350.00	43
16	Floor Lamp	\N	4	72.00	49
14	Chandelier	\N	4	100.00	48
15	Bedside Lamp	\N	4	35.00	48
18	Vase	\N	2	35.00	34
12	Wardrobe with Mirror	In this closet, there is enough space for all of your coats, hats, and many different pieces of everyday clothing that you may want to have at hand. You can also combine the closet with other same colour shoe cabinets to create a whole hallway set the way you like it.	1	250.00	46
\.


--
-- TOC entry 3368 (class 0 OID 16895)
-- Dependencies: 217
-- Data for Name: order_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_items (order_id, item_id, quantity) FROM stdin;
58	18	1
60	12	1
\.


--
-- TOC entry 3367 (class 0 OID 16882)
-- Dependencies: 216
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, user_id, total, order_date) FROM stdin;
58	100077	35	2022-01-06 12:48:29.536464+00
59	100077	0	2022-01-06 12:48:45.348166+00
60	100077	250	2022-01-06 12:49:19.477835+00
\.


--
-- TOC entry 3365 (class 0 OID 16875)
-- Dependencies: 214
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, first_name, last_name, address, email, password) FROM stdin;
100067	Mary	Dwight	\N	jd@mail.com	$2b$10$/TfXmhfT0aN42zLGLpNzRekvJjbsGlsOzvBgpm.OqDVEfpAdPT7Di
100068	Tom	Jerry	\N	mail@mail.com	$2b$10$UUVVvHIKx2XJSha3EirIT.J8vjjJSNbLbC3mXb5EvbaKU/y1UoLtG
100077	mary	king	\N	mking@mail.com	$2b$10$L6xYTZRo8SONaU52JFrabOMsXx91ZhTVu6AZ4Tj8eU1MenFIpwOeu
100078	Jose	King	\N	johndoe@mail.com	$2b$10$HjdFpreYJyqI3KFFntS2KOrdWBd4L26N7rdjgUmKP3vukdL.3jjIS
\.


--
-- TOC entry 3382 (class 0 OID 0)
-- Dependencies: 218
-- Name: cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cart_id_seq', 1, false);


--
-- TOC entry 3383 (class 0 OID 0)
-- Dependencies: 209
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 9, true);


--
-- TOC entry 3384 (class 0 OID 0)
-- Dependencies: 211
-- Name: items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.items_id_seq', 51, true);


--
-- TOC entry 3385 (class 0 OID 0)
-- Dependencies: 215
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 60, true);


--
-- TOC entry 3386 (class 0 OID 0)
-- Dependencies: 213
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 100078, true);


--
-- TOC entry 3213 (class 2606 OID 16974)
-- Name: cart_items cart_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_items
    ADD CONSTRAINT cart_items_pkey PRIMARY KEY (user_id, item_id);


--
-- TOC entry 3211 (class 2606 OID 16916)
-- Name: cart cart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_pkey PRIMARY KEY (id);


--
-- TOC entry 3199 (class 2606 OID 16861)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- TOC entry 3201 (class 2606 OID 16868)
-- Name: items items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- TOC entry 3209 (class 2606 OID 16899)
-- Name: order_items order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (order_id, item_id);


--
-- TOC entry 3207 (class 2606 OID 16889)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 3203 (class 2606 OID 16962)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 3205 (class 2606 OID 16880)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3219 (class 2606 OID 16980)
-- Name: cart_items cart_items_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_items
    ADD CONSTRAINT cart_items_item_id_fkey FOREIGN KEY (item_id) REFERENCES public.items(id);


--
-- TOC entry 3220 (class 2606 OID 17013)
-- Name: cart_items cart_items_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_items
    ADD CONSTRAINT cart_items_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 3218 (class 2606 OID 16917)
-- Name: cart cart_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3214 (class 2606 OID 16869)
-- Name: items items_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- TOC entry 3216 (class 2606 OID 16905)
-- Name: order_items order_items_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_item_id_fkey FOREIGN KEY (item_id) REFERENCES public.items(id);


--
-- TOC entry 3217 (class 2606 OID 17028)
-- Name: order_items order_items_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(id) ON DELETE CASCADE;


--
-- TOC entry 3215 (class 2606 OID 17023)
-- Name: orders orders_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


-- Completed on 2022-01-06 18:53:18

--
-- PostgreSQL database dump complete
--

