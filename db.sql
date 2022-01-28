--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

-- Started on 2022-01-25 16:38:28

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
1	Scented Candle - Forest	Our luxurious It's a beautiful life Fragrance is very popular and this much-loved fragrance is very similar to the well-known lady’s perfume. Our perfumers have recreated this classic scent, packing it full of a rich blend of scents of Concrete of Iris Pallida, Jasmine Sambac, Orange Blossom and Patchouli Essence. They all combine and complement each other to recreate that much loved feminine perfume scent.	2	9.00	116
15	Bedside Lamp	A fresh and unique lighting feature for your bedroom or living space, the Quatrefoil Table Lamp is designed with a cylindrical concrete base and finished with a pure white shade. A Moroccan-inspired quatrefoil overlay in pale-grey decorates its stand, emanating exotic elegance as it brightens your space.	4	35.00	42
34	Deck Chair	Our High Quality Deckchairs are a cut above your average deckchair. If you're looking for classic good looks with sustainability built-in, these chairs are for you.	6	25.00	48
16	Floor Lamp	Add a modern touch to your home with this industrial inspired floor lamp. Finished in a dark, nickel paint and antique brass detail, this lamp would be a perfect focal point to any room.	4	72.00	40
2	Scented Candle - Lemon	The invigorating citrus twang of Bergamot blended with White Oud and a hint of Amber is guaranteed to transport you to a garden of earthly delights. It opens with a smokey fragrance of rivered wood, rich in nuances, ranging from sweet to earthy which seduces and is long believed to pacify the mind.	2	9.00	145
17	Outdoor Solar Light	This pair of brilliantly bright solar spotlights are sure to make your garden shine! With the ability to light a distance of up to 25 metres, these warm white spotlights come close to the brightness of mains powered lighting. The 4.5m of cable between each light and the solar panel means you can display them with ease! Simply position the solar panel in a sunny spot during the day and after a full day of charge you can expect up to 10 hours of glow each evening.	4	15.00	148
22	Wall Clock	Metallic hands in a brass finish and matching hour markers contrast beautifully with the understated clock face on the Arne wall clock. Hang it on the wall by the keyhole	2	45.00	100
40	Plant Pot	Serax makes your home look more beautiful, adds personality to your interior, and creates unforgettable moments. They only work with passionate designers all over the globe. From Vietnam through Antwerp to Portugal, their products are manufactured exclusively by skilled craftsmen 	6	15.00	98
30	Fluffy Blanket	The softest, faux fur throw you'll ever touch. I Love Blue is a stunning statement that'll instantly add an element of cosy comfort to any space. It's double-sized and fits two underneath! 	5	18.00	100
3	Scented Candle - Rose	Rose bushes brimming with flowers one day in May. Some are just opening, others are in full bloom, their petals beaded with dew. Their fragrance fills the air with fresh, floral notes.	2	9.00	147
47	Kitchen Utensils Set	A set of six kitchen utensils made of heat-resistant nylon and silicone. A handy slot in each handle allows you to hang it up for easy storage.	8	15.00	50
26	Curtains - Blue	This pure linen curtain panel carries our Best Quality label, bringing you the best of La Redoute. Fashioned from a pure, pre-washed linen fabric, it has a slight naturally crinkled effect and a perfectly balanced drape.	5	25.00	49
8	Bone Chew Toy	Entertain your pet with the PetSafe Busy Buddy Bouncy Bone interactive dog toy. The design of the durable nylon bone and rubber ball provide dogs with an extended chewing experience. The treat rings last longer than giving treats alone, and dogs keep chewing the toy well after the irresistible treats are gone.	3	8.00	118
14	Chandelier	A timeless light suitable for many spaces, the Basilia light has arms that are complimented with a touch of crystal and the fitting is topped with a narrow, vintage white, faux silk shade. Height is adjustable, dimmable and suitable for use with LED lamps.	4	100.00	41
6	Ball Launcher	Your dog will have a great time playing fetch with the Automatic Ball Launcher. The water-resistant launcher is great for both indoor and outdoor interactive play. With 9 distance settings and 6 angle settings the launcher shoots standard sized tennis balls between 2.5 to 9 metres and up to a 45 degree angle.	3	99.00	21
5	Puppy Toys - Bundle	This is the perfect puppy pack to make the new addition to your family feel at home. It gives them a soft comforter blanket and cord doggie teddy to snuggle up with, and a pack of toys to keep them perfectly entertained.	3	19.00	42
10	Wooden Bed	A classic design made for contemporary or classic-style interiors. It’s a bed with timeless appeal handmade with natural, authentic timber to your specifications. There’s ample room for underbed storage in a bed that deserves to be the centrepiece of your bedroom.	1	325.00	46
7	Tug of War	These extra strong and durable toys are great for tugging and pulling and will keep your dog amused whilst helping to clean their teeth and massage their gums, so we think it's time to go and Play Ruff. For ultimate ruff and tuff playtime, this extra strong Ruffer and Tuffer Rugged Chew Ball and Rope Dog Toy is the perfect toy to keep your dog entertained with its tight weave of twisted ropes and durable rubber casing, allowing your dog to tug for hours on end keeping them happy and satisfied	3	12.00	48
4	Squeaky Toy - Pig	Made from vinyl, the piggy is great for the outdoors, with being able to give them a rinse under the tap after each use. They are perfect for encouraging playing games of catch and fetch both indoors and out.	3	8.00	97
11	Iron Bed	Your bedroom is going to look great with an iron bed, handmade using traditional techniques and materials to a high standard of quality and finish	1	375.00	49
9	Upholstered Bed	This divan bed comes with an orthopedic mattress that provides a supportive and even sleeping surface	1	350.00	43
12	Wardrobe with Mirror	In this closet, there is enough space for all of your coats, hats, and many different pieces of everyday clothing that you may want to have at hand. You can also combine the closet with other same colour shoe cabinets to create a whole hallway set the way you like it.	1	250.00	46
18	Vase	Showcase your blooming bouquets in this conical ceramic vase, featuring white curved line on a deep green ceramic glaze	2	35.00	34
19	Sofa Cusion Set	This set of 4 cushion pad inserts can be used with a variety of scatter cushion covers. Each cushion pad in this set has a square shape and is made with 100 Hollowfibre polyester in a hard-wearing double-stitched polypropylene cover.	2	21.00	60
20	Wall Art 	Abstract watercolour painting in grey, blue and beige. With abstract art in light and serene colours you can create a room with a calm atmosphere. Together with Watercolor Scenery No1, this print also makes a perfect pair.	2	25.00	100
21	Mirror	Minimalist mirror that's exclusive to Urban Outfitters. Features a sleek design with a curved ark shape and chunky oak frame. This vanity mirror makes the perfect addition to any wall in your living space.	2	39.00	100
23	Candle Stick Set	Made with a contemporary design, this candle holder has a marble effect base perfect for adding a glamorous touch to any room of the house. This piece can be displayed on its own, or amongst other ornaments.	2	15.00	100
24	Photo Frames	Our Danta antique black frame has a stunning finish that frames a photograph perfectly. The hand-forged metal framework and stand surrounds the elegant glass aperture	2	10.00	300
25	Curtains - Red	This pure linen curtain panel carries our Best Quality label, bringing you the best of La Redoute. Fashioned from a pure, pre-washed linen fabric, it has a slight naturally crinkled effect and a perfectly balanced drape.	5	25.00	50
27	Curtains - Black	This pure linen curtain panel carries our Best Quality label, bringing you the best of La Redoute. Fashioned from a pure, pre-washed linen fabric, it has a slight naturally crinkled effect and a perfectly balanced drape.	5	25.00	50
28	Beadspread	A traditional pattern in warm colours typical of the south. For Cilou, our designers at La Redoute Interiors drew their inspiration from Provence. For a "southern" atmosphere full of warmth, with the scent of holidays.	5	35.00	50
29	Duvet	If you’re prone to allergies or irritations, our Synthetic Soft Touch Duvet may be the answer. Filled with 100 Microfibre, this cosy duvet boasts the softness and loft of Down while being anti-allergy for a healthier nights’ sleep.	5	30.00	50
31	Towel Set	Time for a refresh? Made from 100 cotton, they're crafted using a zero-twist pile that leaves them feeling soft and plush, wash after wash. Incredibly absorbent	5	17.00	100
32	Tablecloth	Mina stain resistant tablecloth featuring an art deco style palmette motif on a prussian blue background! details. 70 cotton, 30 polyester, anti-stain treatment.	5	12.00	99
33	Garden Dining Set	The Cloverly 6 Seat Seat Dining set from Harbour Lifestyle is the perfect addition for your outdoor space.  The Cloverly chair has been ergonomically shaped with the use of an aluminium frame, making this set entirely maintenance free.	6	250.00	47
35	Garden Sofa	The spacious corner sofa offers plenty of space for all your guests to relax in style. However, the real star of this set is the adjustable table. Simply press the easy to use lever and the table can be adjusted from a casual dining table to a coffee table. This height adjustable table allows you to dine and also relax with just a tea/coffee, giving lots of practicality to the furniture.	6	150.00	50
36	Garden Shed	This high quality garden shed has an attractive rustic design in a soft honey brown which will blend perfectly into the scenery of your garden. Made of high quality, slow grown pine, it boasts 34 millimetre square framing for a sturdy and reliable design and has been dip coated with a base coat, so it’s ready for painting straight away if necessary. Supplied with all of its fixings and roof felt, the double doors feature a hasp and staple so they’re ready to be padlocked as soon as it’s built	6	200.00	50
37	Greenhouse	If you're looking for a solid aluminium greenhouse that does what it says on the tin, then you simply can't go wrong with a Venus ! To make this greenhouse really solid we recommend you add a Vitavia steel base, as it keeps the greenhouse square and rigid when erected onto a nice level surface like slabs or concrete.	6	125.00	50
38	Parasol	This parasol is easily erected via a crank handle and a quick release pin which allows you to angle your parasol to project a shadow over your chosen area and hold it in place quickly and easily. You can tilt this parasol from side to side, allowing you to get more protection from the sun as it moves through the sky. You can also rotate this parasol 360 degrees simply press on the foot pedal to rotate.	6	52.00	50
39	Barbecue	MULTIPURPOSE - This DAWOO outdoor fire pit is ideal for cool evenings, providing cozy warmth, lithe light which makes a beautiful, captivating, comfortable atmosphere. Sturdy design with special pattern ideal for warmth, BBQ and cooling drinks and food in patio/garden/yard	6	35.00	120
41	Tent	The Tent is a large and spacious fully waterproof tent. Designed to sleep 6 people, this tent has 3 separate bedroom areas with sewn in groundsheet and 1 large stand-up height central living area with detachable groundsheet - perfect for a family holiday this summer	6	89.00	50
45	Dinnerware Set	Featuring a Beckington design, this dinner set features an elegant coloured glazed finish for a modern touch. Beautifully crafted from stoneware this dinner set is dishwasher safe and microwave friendly. Other matching crockery is available.	8	25.00	50
46	Cutlery Set	Perfectly proportioned, our Form cutlery is made from solid 18/10 stainless steel. Each item is hand polished for a high shine, including the prongs on the forks.\r\n\r\nThe knives in this range are made from hardened 13/0 stainless steel which keeps the blades stronger and sharper for longer.	8	18.00	50
48	Microwave	This microwave has a small 20 litre capacity. It has a 800 Watt power output too. There are 9 programmes to help make mealtimes easier. Plus, the simple touch controls mean you can easily adjust the settings. Please remember to check the dimensions of this product before you purchase.\r\n\r\n	8	49.00	50
49	Storage Box	Fits most of Shelves These cubes fit perfectly in most standard storage shelves. Use alone or with a cube bookshelf, cabinet, shelves, shelving system. Compatible with  shelf unit series.\r\n	8	35.00	100
50	Clothesrail	Fast access to your fashion staples. The Habitat Arnie clothes rail shows off your wardrobe. In a sleek, black metal, it is a minimalist's dream. Arnie is a simple way to get your clothing collection organised and curb any clutter habits. It can hold up to 35kg and is finished with stoppers either end, to prevent clothes from slipping off. We've not forgotten your shoes either. Neatly store them at the bottom, so they're easy to grab on your way out. Browse with ease.	9	25.00	199
51	Shoerack	A stylish storage space for shoes that are stacked and stacked until it transforms into a sleek shelving unit, this versatile piece keeps racking up the reasons to buy it! What’s more, it’s easy to assemble with eight screws in five minutes flat.	9	19.00	50
13	Pendand Light	The beautiful LED pendant light Hayley radiates luxurious flair and elegance. With its nine light sources, it can also illuminate larger areas of the room well and leaves a unique impression on the viewer. The light is distributed homogeneously in the room, so that the radiation is indirect and glare-free.	4	75.00	47
\.


--
-- TOC entry 3368 (class 0 OID 16895)
-- Dependencies: 217
-- Data for Name: order_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_items (order_id, item_id, quantity) FROM stdin;
87	15	1
88	34	1
\.


--
-- TOC entry 3367 (class 0 OID 16882)
-- Dependencies: 216
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, user_id, total, order_date) FROM stdin;
87	100085	35	2022-01-25 11:23:14.581853+00
88	100085	25	2022-01-25 13:19:07.841384+00
\.


--
-- TOC entry 3365 (class 0 OID 16875)
-- Dependencies: 214
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, first_name, last_name, address, email, password) FROM stdin;
100085	John	Doe	1 Yemen Road, Yemen	jd@mail.com	$2b$10$PsD63PD2WkUR4426jA65pOHiuH7IjnhD/lFup7uFhqiT0Kx5lZqma
100087	432354	2141423	\N	424725@Wp.pl	$2b$10$.fwHGytXLHrCYZhhjU5IBuA/AG18T9oIzYyTntEXjpEjpmVXTEwCu
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

SELECT pg_catalog.setval('public.orders_id_seq', 88, true);


--
-- TOC entry 3386 (class 0 OID 0)
-- Dependencies: 213
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 100087, true);


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


-- Completed on 2022-01-25 16:38:29

--
-- PostgreSQL database dump complete
--

