--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    galaxy_types_id integer,
    seen_with_eye boolean DEFAULT false
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: galaxy_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_types (
    galaxy_types_id integer NOT NULL,
    description text,
    name character varying(30) NOT NULL
);


ALTER TABLE public.galaxy_types OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_types_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_types_galaxy_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_types_galaxy_types_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_types_galaxy_types_id_seq OWNED BY public.galaxy_types.galaxy_types_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    description text,
    is_spherical boolean DEFAULT true,
    km_from_planet bigint,
    discovered_in integer,
    discovered_by character varying(50)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    description text,
    has_life boolean DEFAULT false,
    age_in_millions_of_years numeric(6,2),
    is_spherical boolean DEFAULT true,
    discovered_in integer,
    discovered_by character varying(30),
    visited_in integer,
    distance_from_earth numeric(10,2),
    planet_types_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: planet_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_types (
    planet_types_id integer NOT NULL,
    description text,
    name character varying(30) NOT NULL
);


ALTER TABLE public.planet_types OWNER TO freecodecamp;

--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_types_planet_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_types_planet_types_id_seq OWNER TO freecodecamp;

--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_types_planet_types_id_seq OWNED BY public.planet_types.planet_types_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    description text,
    estimate_lightyears_distance numeric(8,5)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_types galaxy_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types ALTER COLUMN galaxy_types_id SET DEFAULT nextval('public.galaxy_types_galaxy_types_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_types planet_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types ALTER COLUMN planet_types_id SET DEFAULT nextval('public.planet_types_planet_types_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'The Milky Way', 'Includes our Solar System and spans more than 100,000 light-years. The term "Milky Way" originated from its appearance as a hazy band of light in the night sky, formed by distant stars.', 2, false);
INSERT INTO public.galaxy VALUES (2, 'Andromeda I', 'It is a dwarf spheroidal galaxy (dSph) about 2.40 million light-years away in the constellation Andromeda. Andromeda I is part of the local group of galaxies and a satellite galaxy of the Andromeda Galaxy (M31). It is roughly 3.5 degrees south and slightly east of M31. As of 2005, it is the closest known dSph companion to M31 at an estimated projected distance of ~40 kpc or ~150,000 light-years.', 2, false);
INSERT INTO public.galaxy VALUES (3, 'Maffei 1', 'The closest giant elliptical galaxy', 1, false);
INSERT INTO public.galaxy VALUES (5, 'Hercules A', 'Supergiant elliptical galaxy', 1, false);
INSERT INTO public.galaxy VALUES (6, 'IC 3583', 'Has been found to have a bar of stars running through its center.', 3, false);
INSERT INTO public.galaxy VALUES (4, 'Alpha Centauri', 'An elliptical/lenticular radio galaxy with peculiar morphology and unusual dust lanes', 1, false);
INSERT INTO public.galaxy VALUES (7, 'Canis Major Dwarf', 'The Canis Major Dwarf Galaxy, also known as the Canis Major Overdensity, is a dwarf irregular galaxy situated in the constellation Canis Major. It was discovered in 2003 by an international team of astronomers utilizing data from the Two-Micron All Sky Survey (2MASS), which allowed them to detect stars obscured by interstellar dust.', 4, false);
INSERT INTO public.galaxy VALUES (8, 'Fake', 'A fake dwarf galaxy due to time and negativeseek results', 4, false);


--
-- Data for Name: galaxy_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_types VALUES (1, 'These systems exhibit certain characteristic properties. They have complete rotational symmetry; i.e., they are figures of revolution with two equal principal axes. They have a third smaller axis that is the presumed axis of rotation. The surface brightness of ellipticals at optical wavelengths decreases monotonically outward.', 'Elliptical galaxies');
INSERT INTO public.galaxy_types VALUES (3, 'Most representatives of this class consist of grainy, highly irregular assemblages of luminous areas. They have neither noticeable symmetry nor an obvious central nucleus, and they are generally bluer in colour than are the arms and disks of spiral galaxies. An extremely small number of them, however, are red and have a smooth, though nonsymmetrical, shape.', 'Irregular galaxies');
INSERT INTO public.galaxy_types VALUES (2, 'Spirals are characterized by circular symmetry, a bright nucleus surrounded by a thin outer disk, and a superimposed spiral structure. They are divided into two parallel classes: normal spirals and barred spirals. The normal spirals have arms that emanate from the nucleus, while barred spirals have a bright linear feature called a bar that straddles the nucleus, with the arms unwinding from the ends of the bar.', 'Spiral galaxies');
INSERT INTO public.galaxy_types VALUES (4, 'A dwarf galaxy is a small galaxy that typically contains between 1,000 to several billion stars, significantly fewer than larger galaxies like the Milky Way, which has about 200–400 billion stars', 'Dwarf');
INSERT INTO public.galaxy_types VALUES (5, 'Fake galaxy', 'Fake');
INSERT INTO public.galaxy_types VALUES (6, 'TV galaxy', 'TV');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Amalthea', 5, NULL, true, 181300, 1892, 'E. Barnard');
INSERT INTO public.moon VALUES (2, 'Ananke', 5, NULL, true, 21200000, 1951, 'S. Nicholson');
INSERT INTO public.moon VALUES (3, 'Aoede', 5, NULL, true, 23807655, 2003, 'S. Sheppard, D. Jewitt, & J. Kleyna');
INSERT INTO public.moon VALUES (4, 'Arche', 5, NULL, true, 23064000, 2002, 'S. Sheppard');
INSERT INTO public.moon VALUES (5, 'Autonoe', 5, NULL, true, 24122000, 2001, 'S. Sheppard, D. Jewitt, & J. Kleyna');
INSERT INTO public.moon VALUES (6, 'Callisto', 5, NULL, true, 1883000, 1610, 'Galileo');
INSERT INTO public.moon VALUES (7, 'Carme', 5, NULL, true, 22600000, 1938, 'S. Nicholson');
INSERT INTO public.moon VALUES (8, 'Carpo', 5, NULL, true, 17100000, 2003, 'S. Sheppard, D. Jewitt, & J. Kleyna');
INSERT INTO public.moon VALUES (9, 'Chaldene', 5, NULL, true, 23179000, 2000, 'S. Sheppard, D. Jewitt, Y. Fernandez, & G. Magnier');
INSERT INTO public.moon VALUES (10, 'Cyllene', 5, NULL, true, 24000000, 2003, 'S. Sheppard, D. Jewitt, & J. Kleyna');
INSERT INTO public.moon VALUES (11, 'Elara', 5, NULL, true, 11737000, 1905, 'C. Perrine');
INSERT INTO public.moon VALUES (12, 'Erinome', 5, NULL, true, 23279000, 2000, 'S. Sheppard, D. Jewitt, Y. Fernandez, & G. Magnier');
INSERT INTO public.moon VALUES (13, 'Euanthe', 5, NULL, true, 21017000, 2001, 'S. Sheppard, D. Jewitt, & J. Kleyna');
INSERT INTO public.moon VALUES (14, 'Eukelade', 5, NULL, true, 24557295, 2003, 'S. Sheppard, D. Jewitt, & J. Kleyna');
INSERT INTO public.moon VALUES (15, 'Euporie', 5, NULL, true, 19394000, 2001, 'S. Sheppard, D. Jewitt, & J. Kleyna');
INSERT INTO public.moon VALUES (16, 'Europa', 5, NULL, true, 670900, 1610, 'Galileo');
INSERT INTO public.moon VALUES (17, 'Eurydome', 5, NULL, true, 23219000, 2001, 'S. Sheppard, D. Jewitt, & J. Kleyna');
INSERT INTO public.moon VALUES (18, 'Ganymede', 5, NULL, true, 1070000, 1610, 'Galileo');
INSERT INTO public.moon VALUES (19, 'Harpalyke', 5, NULL, true, 21105000, 2000, 'S. Sheppard, D. Jewitt, Y. Fernandez, & G. Magnier');
INSERT INTO public.moon VALUES (20, 'Hegemone', 5, NULL, true, 24514095, 2003, 'S. Sheppard, D. Jewitt, & J. Kleyna');
INSERT INTO public.moon VALUES (21, 'Helike', 5, NULL, true, 10972830, 2003, 'S. Sheppard, D. Jewitt, & J. Kleyna');
INSERT INTO public.moon VALUES (22, 'Hermippe', 5, NULL, true, 21252000, 2001, 'S. Sheppard, D. Jewitt, & J. Kleyna');
INSERT INTO public.moon VALUES (23, 'Himalia', 5, NULL, true, 11480000, 1904, 'C. Perrine');
INSERT INTO public.moon VALUES (24, 'Io', 5, NULL, true, 421600, 1610, 'Galileo');
INSERT INTO public.moon VALUES (25, 'Iocaste', 5, NULL, true, 21269000, 2000, 'S. Sheppard, D. Jewitt, Y. Fernandez, & G. Magnier');
INSERT INTO public.moon VALUES (26, 'Isonone', 5, NULL, true, 23217000, 2000, 'S. Sheppard, D. Jewitt, Y. Fernandez, & G. Magnier');
INSERT INTO public.moon VALUES (27, 'Kallichore', 5, NULL, true, 22395390, 2003, 'S. Sheppard, D. Jewitt, & J. Kleyna');
INSERT INTO public.moon VALUES (28, 'Kalyke', 5, NULL, true, 23583000, 2000, 'S. Sheppard, D. Jewitt, Y. Fernandez, & G. Magnier');
INSERT INTO public.moon VALUES (29, 'Kore', 5, NULL, true, 24543000, 2003, 'S. Sheppard, D. Jewitt, & J. Kleyna');
INSERT INTO public.moon VALUES (30, 'Leda', 5, NULL, true, 11094000, 1974, 'C. Kowal');
INSERT INTO public.moon VALUES (31, 'Lysithea', 5, NULL, true, 11720000, 1938, 'S. Nicholson');
INSERT INTO public.moon VALUES (32, 'Magaclite', 5, NULL, true, 23806000, 2000, 'S. Sheppard, D. Jewitt, Y. Fernandez, & G. Magnier');
INSERT INTO public.moon VALUES (33, 'Metis', 5, NULL, true, 127960, 1979, 'S. Sunnott');
INSERT INTO public.moon VALUES (34, 'Mneme', 5, NULL, true, 21069000, 2003, 'Scott S. Sheppard & B. Gladman');
INSERT INTO public.moon VALUES (35, 'Orthosie', 5, NULL, true, 21168000, 2001, 'S. Sheppard, D. Jewitt, & J. Kleyna');
INSERT INTO public.moon VALUES (36, 'Pasiphae', 5, NULL, true, 23500000, 1908, 'P. Melotte');
INSERT INTO public.moon VALUES (37, 'Pasithee', 5, NULL, true, 23029000, 2001, 'S. Sheppard, D. Jewitt, & J. Kleyna');
INSERT INTO public.moon VALUES (38, 'Praxidike', 5, NULL, true, 21147000, 2000, 'S. Sheppard, D. Jewitt, Y. Fernandez, & G. Magnier');
INSERT INTO public.moon VALUES (39, 'Sinope', 5, NULL, true, 23700700, 1914, 'S. Nicholson');
INSERT INTO public.moon VALUES (40, 'Sponde', 5, NULL, true, 23808000, 2001, 'S. Sheppard, D. Jewitt, & J. Kleyna');
INSERT INTO public.moon VALUES (41, 'S/2000 J11', 5, NULL, true, 12555000, 2000, 'S. Sheppard, D. Jewitt, Y. Fernandez, & G. Magnier');
INSERT INTO public.moon VALUES (42, 'S/2003 J2', 5, NULL, true, 28570410, 2003, 'S. Sheppard, D. Jewitt, & J. Kleyna');
INSERT INTO public.moon VALUES (43, '1S/2003 J3', 5, NULL, true, 18339885, 2003, 'S. Sheppard, D. Jewitt, & J. Kleyna');
INSERT INTO public.moon VALUES (44, 'S/2003 J4', 5, NULL, true, 23257920, 2003, 'S. Sheppard, D. Jewitt, & J. Kleyna');
INSERT INTO public.moon VALUES (45, 'S/2003 J5', 5, NULL, true, 24084180, 2003, 'S. Sheppard, D. Jewitt, & J. Kleyna');
INSERT INTO public.moon VALUES (46, 'S/2003 J9', 5, NULL, true, 22441680, 2003, 'S. Sheppard, D. Jewitt, & J. Kleyna');
INSERT INTO public.moon VALUES (47, 'S/2003 J10', 5, NULL, true, 24249600, 2003, 'S. Sheppard, D. Jewitt, & J. Kleyna');
INSERT INTO public.moon VALUES (48, 'S/2003 J12', 5, NULL, true, 19002480, 2003, 'S. Sheppard, D. Jewitt, & J. Kleyna');
INSERT INTO public.moon VALUES (49, 'S/2003 J15', 5, NULL, true, 22000000, 2003, 'S. Sheppard, D. Jewitt, & J. Kleyna');
INSERT INTO public.moon VALUES (50, 'S/2003 J16', 5, NULL, true, 21000000, 2003, 'S. Sheppard, D. Jewitt, & J. Kleyna');
INSERT INTO public.moon VALUES (51, 'S/2003 J17', 5, NULL, true, 22000000, 2003, 'S. Sheppard, D. Jewitt, & J. Kleyna');
INSERT INTO public.moon VALUES (52, 'S/2003 J18', 5, NULL, true, 20700000, 2003, 'S. Sheppard, D. Jewitt, & J. Kleyna');
INSERT INTO public.moon VALUES (53, 'S/2003 J19', 5, NULL, true, 22800000, 2003, 'S. Sheppard, D. Jewitt, & J. Kleyna');
INSERT INTO public.moon VALUES (54, 'S/2003 J 23', 5, NULL, true, 23563000, 2003, 'S. Sheppard, D. Jewitt, & J. Kleyna');
INSERT INTO public.moon VALUES (55, 'S/2010 J 1', 5, NULL, true, 23314335, 2010, 'S. Sheppard, D. Jewitt, & J. Kleyna');
INSERT INTO public.moon VALUES (56, 'S/2010 J 2', 5, NULL, true, 20307150, 2010, 'Veillet');
INSERT INTO public.moon VALUES (57, 'S/2011 J 2', 5, NULL, true, 23329710, 2011, 'S. Sheppard, D. Jewitt, & J. Kleyna');
INSERT INTO public.moon VALUES (58, 'S/2011 J 1', 5, NULL, true, 20155290, 2011, 'Jacobson et al.');
INSERT INTO public.moon VALUES (59, 'Taygete', 5, NULL, true, 23360000, 2000, 'S. Sheppard, D. Jewitt, Y. Fernandez, & G. Magnier');
INSERT INTO public.moon VALUES (60, 'Thebe', 5, NULL, true, 221900, 1979, 'S. Synnott');
INSERT INTO public.moon VALUES (61, 'Thelxinoe', 5, NULL, true, 21162000, 2003, 'Scott S. Sheppard & B. Gladman');
INSERT INTO public.moon VALUES (62, 'Themisto', 5, NULL, true, 7507000, 1975, 'C. Kowal & E. Roemer');
INSERT INTO public.moon VALUES (63, 'Thyone', 5, NULL, true, 21312000, 2001, 'S. Sheppard, D. Jewitt, & J. Kleyna');
INSERT INTO public.moon VALUES (64, 'Aegir', 6, NULL, true, 20735000, 2005, 'D. Jewitt, S. Sheppard, J. Kleyna');
INSERT INTO public.moon VALUES (65, 'Albiorix', 6, NULL, true, 16392000, 2000, 'Gladman et al.');
INSERT INTO public.moon VALUES (66, 'Anthe', 6, NULL, true, 197700, 2004, 'Cassini Imaging Team');
INSERT INTO public.moon VALUES (67, 'Atlas', 6, NULL, true, 137640, 1980, 'R. Terrile');
INSERT INTO public.moon VALUES (68, 'Bebhionn', 6, NULL, true, 17119000, 2005, 'D. Jewitt, S. Sheppard, J. Kleyna');
INSERT INTO public.moon VALUES (69, 'Bergelmir', 6, NULL, true, 19338000, 2005, 'D. Jewitt, S. Sheppard, J. Kleyna');
INSERT INTO public.moon VALUES (70, 'Bestla', 6, NULL, true, 20129000, 2005, 'D. Jewitt, S. Sheppard, J. Kleyna');
INSERT INTO public.moon VALUES (71, 'Calypso', 6, NULL, true, 294660, 1980, 'B. Smith');
INSERT INTO public.moon VALUES (72, 'Daphnis', 6, NULL, true, 136500, 2005, 'Cassini Imaging Science Team');
INSERT INTO public.moon VALUES (73, 'Dione', 6, NULL, true, 377400, 1684, 'G. Cassini');
INSERT INTO public.moon VALUES (74, 'Enceladus', 6, NULL, true, 238020, 1789, 'W. Herschel');
INSERT INTO public.moon VALUES (75, 'Epimetheus', 6, NULL, true, 151422, 1966, 'R. Walker');
INSERT INTO public.moon VALUES (76, 'Erriapo', 6, NULL, true, 17611000, 2000, 'Intl. Team of 8 Astronomers');
INSERT INTO public.moon VALUES (77, 'Farbauti', 6, NULL, true, 20390000, 2005, 'D. Jewitt, S. Sheppard, J. Kleyna');
INSERT INTO public.moon VALUES (78, 'Fenrir', 6, NULL, true, 22453000, 2005, 'D. Jewitt, S. Sheppard, J. Kleyna');
INSERT INTO public.moon VALUES (79, 'Fornjot', 6, NULL, true, 25108000, 2005, 'D. Jewitt, S. Sheppard, J. Kleyna');
INSERT INTO public.moon VALUES (80, 'Greip', 6, NULL, true, 18206000, 2006, 'S. Sheppard, D. Jewitt, J. Kleyna');
INSERT INTO public.moon VALUES (81, 'Hati', 6, NULL, true, 19856000, 2005, 'D. Jewitt, S. Sheppard, J. Kleyna');
INSERT INTO public.moon VALUES (82, 'Helene', 6, NULL, true, 377400, 1980, 'Laques & Lecacheux');
INSERT INTO public.moon VALUES (83, 'Hyperion', 6, NULL, true, 1481000, 1848, 'W. Bond');
INSERT INTO public.moon VALUES (84, 'Hyrokkin', 6, NULL, true, 18437000, 2006, 'S. Sheppard, D. Jewitt, J. Kleyna');
INSERT INTO public.moon VALUES (85, 'Iapetus', 6, NULL, true, 3561300, 1671, 'G. Cassini');
INSERT INTO public.moon VALUES (86, 'Ijiraq', 6, NULL, true, 11440000, 2000, 'Intl. Team of 8 Astronomers');
INSERT INTO public.moon VALUES (87, 'Janus', 6, NULL, true, 151472, 1966, 'A. Dollfus');
INSERT INTO public.moon VALUES (88, 'Jarnsaxa', 6, NULL, true, 18811000, 2006, 'S. Sheppard, D. Jewitt, J. Kleyna');
INSERT INTO public.moon VALUES (89, 'Kari', 6, NULL, true, 22118000, 2006, 'S. Sheppard, D. Jewitt, J. Kleyna');
INSERT INTO public.moon VALUES (90, 'Kiviuq', 6, NULL, true, 11365000, 2000, 'Intl. Team of 8 Astronomers');
INSERT INTO public.moon VALUES (91, 'Loge', 6, NULL, true, 23065000, 2006, 'S. Sheppard, D. Jewitt, J. Kleyna');
INSERT INTO public.moon VALUES (92, 'Methone', 6, NULL, true, 194000, 2004, 'C.C. Porco et al./Cassini');
INSERT INTO public.moon VALUES (93, 'Mimas', 6, NULL, true, 185520, 1789, 'W. Herschel');
INSERT INTO public.moon VALUES (94, 'Mundilfari', 6, NULL, true, 18709000, 2000, 'Intl. Team of 8 Astronomers');
INSERT INTO public.moon VALUES (95, 'Narvi', 6, NULL, true, 18719000, 2003, 'Scott S. Sheppard, David Jewitt, and Jan Kleyna');
INSERT INTO public.moon VALUES (96, 'Paaliaq', 6, NULL, true, 15199000, 2000, 'Intl. Team of 8 Astronomers');
INSERT INTO public.moon VALUES (97, 'Pallene', 6, NULL, true, 211000, 2004, 'C.C. Porco et al./Cassini');
INSERT INTO public.moon VALUES (98, 'Pan', 6, NULL, true, 133630, 1990, 'M. Showalter');
INSERT INTO public.moon VALUES (99, 'Pandora', 6, NULL, true, 141700, 1980, 'S. Collins');
INSERT INTO public.moon VALUES (100, 'Phoebe', 6, NULL, true, 12952000, 1898, 'W. Pickering');
INSERT INTO public.moon VALUES (101, 'Polydeuces', 6, NULL, true, 377400, 2004, 'C.C. Porco et al./Cassini');
INSERT INTO public.moon VALUES (102, 'Prometheus', 6, NULL, true, 139350, 1980, 'S. Collins');
INSERT INTO public.moon VALUES (103, 'Rhea', 6, NULL, true, 527040, 1672, 'G. Cassini');
INSERT INTO public.moon VALUES (104, 'Siarnaq', 6, NULL, true, 18160000, 2000, 'Intl. Team of 8 Astronomers');
INSERT INTO public.moon VALUES (105, 'Skathi', 6, NULL, true, 15645000, 2000, 'Intl. Team of 8 Astronomers');
INSERT INTO public.moon VALUES (106, 'Skoll', 6, NULL, true, 17665000, 2006, 'S. Sheppard, D. Jewitt, J. Kleyna');
INSERT INTO public.moon VALUES (107, 'Surtur', 6, NULL, true, 22707000, 2006, 'S. Sheppard, D. Jewitt, J. Kleyna');
INSERT INTO public.moon VALUES (108, 'Suttungr', 6, NULL, true, 19470000, 2000, 'Gladman et al.');
INSERT INTO public.moon VALUES (109, 'S/2004 S07', 6, NULL, true, 19800000, 2004, 'D. Jewitt, S. Sheppard, J. Kleyna');
INSERT INTO public.moon VALUES (110, 'S/2004 S12', 6, NULL, true, 19650000, 2004, 'D. Jewitt, S. Sheppard, J. Kleyna');
INSERT INTO public.moon VALUES (111, 'S/2004 S13', 6, NULL, true, 18450000, 2004, 'D. Jewitt, S. Sheppard, J. Kleyna');
INSERT INTO public.moon VALUES (112, 'S/2004 S17', 6, NULL, true, 18600000, 2004, 'D. Jewitt, S. Sheppard, J. Kleyna');
INSERT INTO public.moon VALUES (113, 'S/2006 S1', 6, NULL, true, 18981135, 2006, 'S. Sheppard, D. Jewitt, J. Kleyna');
INSERT INTO public.moon VALUES (114, 'S/2006 S3', 6, NULL, true, 21132000, 2006, 'S. Sheppard, D. Jewitt, J. Kleyna');
INSERT INTO public.moon VALUES (115, 'S/2007 S2', 6, NULL, true, 16560000, 2007, 'S. Sheppard, D. Jewitt, J. Kleyna');
INSERT INTO public.moon VALUES (116, 'S/2007 S3', 6, NULL, true, 20518500, 2007, 'S. Sheppard, D. Jewitt, J. Kleyna');
INSERT INTO public.moon VALUES (117, 'Tarqeq', 6, NULL, true, 18009000, 2007, 'S. Sheppard, D. Jewitt, J. Kleyna');
INSERT INTO public.moon VALUES (118, 'Tarvos', 6, NULL, true, 18239000, 2000, 'Intl. Team of 8 Astronomers');
INSERT INTO public.moon VALUES (119, 'Telesto', 6, NULL, true, 294660, 1980, 'B. Smith');
INSERT INTO public.moon VALUES (120, 'Tethys', 6, NULL, true, 294660, 1684, 'G. Cassini');
INSERT INTO public.moon VALUES (121, 'Thrymr', 6, NULL, true, 20470000, 2000, 'Intl. Team of 8 Astronomers');
INSERT INTO public.moon VALUES (122, 'Titan', 6, NULL, true, 1221850, 1655, 'C. Huygens');
INSERT INTO public.moon VALUES (123, 'Ymir', 6, NULL, true, 23096000, 2000, 'Intl. Team of 8 Astronomers');
INSERT INTO public.moon VALUES (124, 'Ariel', 7, NULL, true, 191240, 1851, 'W. Lassell');
INSERT INTO public.moon VALUES (125, 'Belinda', 7, NULL, true, 75260, 1986, 'Voyager 2');
INSERT INTO public.moon VALUES (126, 'Bianca', 7, NULL, true, 75260, 1986, 'Voyager 2');
INSERT INTO public.moon VALUES (127, 'Caliban', 7, NULL, true, 7200000, 1997, 'Gladman, Nicholson, Burns, & Kavelaars');
INSERT INTO public.moon VALUES (128, 'Cordelia', 7, NULL, true, 49750, 1986, 'Voyager 2');
INSERT INTO public.moon VALUES (129, 'Cressida', 7, NULL, true, 61770, 1986, 'Voyager 2');
INSERT INTO public.moon VALUES (130, 'Cupid', 7, NULL, true, 74800, 2003, 'M. Showalter & J. Lissauer');
INSERT INTO public.moon VALUES (131, 'Desdemona', 7, NULL, true, 62660, 1986, 'Voyager 2');
INSERT INTO public.moon VALUES (132, 'Ferdinand', 7, NULL, true, 20901000, 2001, 'M. Holman & B. Gladman et al');
INSERT INTO public.moon VALUES (133, 'Francisco', 7, NULL, true, 4276000, 2001, 'M. Holman & B. Gladman et al');
INSERT INTO public.moon VALUES (134, 'Juliet', 7, NULL, true, 64360, 1986, 'Voyager 2');
INSERT INTO public.moon VALUES (135, 'Mab', 7, NULL, true, 97734, 2003, 'M. Showalter & J. Lissauer');
INSERT INTO public.moon VALUES (136, 'Margaret', 7, NULL, true, 14688700, 2003, 'S. Sheppard');
INSERT INTO public.moon VALUES (137, 'Miranda', 7, NULL, true, 129780, 1948, 'G. Kuiper');
INSERT INTO public.moon VALUES (138, 'Oberon', 7, NULL, true, 582600, 1787, 'W. Herschel');
INSERT INTO public.moon VALUES (139, 'Ophelia', 7, NULL, true, 53440, 1986, 'Voyager 2');
INSERT INTO public.moon VALUES (140, 'Perdita', 7, NULL, true, 76420, 1986, 'E. Karkoschka/Voyager 2');
INSERT INTO public.moon VALUES (141, 'Portia', 7, NULL, true, 66085, 1986, 'Voyager 2');
INSERT INTO public.moon VALUES (142, 'Prospero', 7, NULL, true, 16256000, 1999, 'Kavelaars, Gladman, Holman et al');
INSERT INTO public.moon VALUES (143, 'Puck', 7, NULL, true, 86010, 1985, 'Voyager 2');
INSERT INTO public.moon VALUES (144, 'Rosalind', 7, NULL, true, 69941, 1986, 'Voyager 2');
INSERT INTO public.moon VALUES (145, 'Setebos', 7, NULL, true, 17418000, 1999, 'Kavelaars, Gladman, Holman et al');
INSERT INTO public.moon VALUES (146, 'Stephano', 7, NULL, true, 8004000, 1999, 'Kavelaars, Gladman, Holman et al');
INSERT INTO public.moon VALUES (147, 'Sycorax', 7, NULL, true, 12200000, 1997, 'Gladman, Nicholson, Burns, & Kavelaars');
INSERT INTO public.moon VALUES (148, 'Titania', 7, NULL, true, 435840, 1787, 'W. Herschel');
INSERT INTO public.moon VALUES (149, 'Trinculo', 7, NULL, true, 8578000, 2001, 'M. Holman, J. Kavelaars & D. Milisavljevic');
INSERT INTO public.moon VALUES (150, 'Umbriel', 7, NULL, true, 265970, 1851, 'W. Lassel');
INSERT INTO public.moon VALUES (151, 'Despina', 8, NULL, true, 62000, 1989, 'Voyager 2');
INSERT INTO public.moon VALUES (152, 'Galatea', 8, NULL, true, 52500, 1989, 'Voyager 2');
INSERT INTO public.moon VALUES (153, 'Halimede', 8, NULL, true, 15686000, 2002, 'M. Holman & J.J. Kavelaars');
INSERT INTO public.moon VALUES (154, 'Larissa', 8, NULL, true, 73600, 1989, 'Voyager 2');
INSERT INTO public.moon VALUES (155, 'Laomedeia', 8, NULL, true, 22613200, 2002, 'M. Holman & J.J. Kavelaars');
INSERT INTO public.moon VALUES (156, 'Naiad', 8, NULL, true, 48200, 1989, 'Voyager 2');
INSERT INTO public.moon VALUES (157, 'Nereid', 8, NULL, true, 5513400, 1949, 'G. Kuiper');
INSERT INTO public.moon VALUES (158, 'Neso', 8, NULL, true, 47279670, 2002, 'Holman & Gladman et al');
INSERT INTO public.moon VALUES (159, 'Proteus', 8, NULL, true, 117600, 1989, 'Voyager 2');
INSERT INTO public.moon VALUES (160, 'Psamathe', 8, NULL, true, 46738000, 2003, 'D. Jewitt, J. Kleyna & S. Sheppard');
INSERT INTO public.moon VALUES (161, 'Sao', 8, NULL, true, 22337190, 2002, 'M. Holman & J.J. Kavelaars');
INSERT INTO public.moon VALUES (162, 'Thalassa', 8, NULL, true, 50000, 1989, 'Voyager 2');
INSERT INTO public.moon VALUES (163, 'Triton', 8, NULL, true, 354800, 1846, 'W. Lassel');
INSERT INTO public.moon VALUES (164, 'Moon',1,'Our almost faithfull companion during night time',true, 384, 1962,'Gian Domenico Cassini');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 'Earth is the third planet from the Sun and the subject of historical misconception for centuries.[4][5] Earth was never formally -discovered- because it was never an unrecognized entity by humans. However, its shared identity with other bodies as a "planet" is a historically recent discovery.', true, 4.54, true, -280, 'Aristarchus of Samos', 0, 0.00, 5);
INSERT INTO public.planet VALUES (2, 'Mercury', 1, 'The first planet from the Sun and the smallest in the Solar System. It is a rocky planet with a trace atmosphere and a surface gravity slightly higher than that of Mars. The surface of Mercury is similar to Earths Moon, being heavily cratered.', false, 4500.00, true, -265, 'Timocharis', 1973, 48.00, 1);
INSERT INTO public.planet VALUES (3, 'Venus', 1, 'The second planet from the Sun. It is often called Earths "twin" or "sister" among the planets of the Solar System for its orbit being the closest to Earths, both being terrestrial planets, and having the most similar and nearly equal size, mass, and surface gravity. Venus, though, is significantly different, especially as it has no liquid water, and its atmosphere is far thicker and denser than that of any other rocky body in the Solar System. The atmosphere is composed mostly of carbon dioxide and has a thick cloud layer of sulfuric acid that spans the whole planet. At the mean surface level, the atmosphere reaches a temperature of 737 K (464 °C; 867 °F) and a pressure 92 times greater than Earths at sea level, turning the lowest layer of the atmosphere into a supercritical fluid.', false, 4500.00, true, 1581, 'Galileo Galilei', 1962, 256.00, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 1, ' Mars has a radius about half of that of Earth. Most of the planet is red due to iron oxide in Martian soil, and the polar regions are covered in white ice caps made of water and carbon dioxide. Mars has an atmosphere composed mostly of carbon dioxide, with surface pressure 0.6% of that of Earth, which is sufficient to support some weather phenomena. During the Mars year (687 Earth days), there are large surface temperature swings on the surface between −78.5 to 5.7 °C (−109.3 to 42.3 °F). The surface is peppered with volcanoes and rift valleys, and has a rich collection of minerals.[130][131] Mars has a highly differentiated internal structure, and lost its magnetosphere 4 billion years ago.', false, 4600.00, true, 1609, 'Galileo Galilei', 1976, 140.00, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'The biggest and most massive planet in the Solar System. On its surface, there are orange-brown and white cloud bands moving via the principles of atmospheric circulation, with giant storms swirling on the surface such as the Great Red Spot and white ovals. Jupiter possesses a strong enough magnetosphere to redirect ionizing radiation and cause auroras on its poles', false, 4.57, true, 1610, 'Galileo Galilei', 1972, 715.00, 2);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Saturn has a distinctive visible ring system orbiting around its equator composed of small ice and rock particles. Like Jupiter, it is mostly made of hydrogen and helium. At its north and south poles, Saturn has peculiar hexagon-shaped storms larger than the diameter of Earth. Saturn has a magnetosphere capable of producing weak auroras.', false, 4.54, true, 1610, 'Galileo Galilei', 1979, 886.00, 2);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Uniquely among the planets, orbits the Sun on its side with an axial tilt >90°. This gives the planet extreme seasonal variation as each pole points alternately toward and then away from the Sun. Uranus outer layer has a muted cyan color, but underneath these clouds are many mysteries about its climate, such as unusually low internal heat and erratic cloud formation.', false, 4.54, true, 1781, 'William Herschel', 1986, 1.80, 3);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'The furthest planet known in the Solar System. Its outer atmosphere has a slightly muted cyan color, with occasional storms on the surface that look like dark spots. Like Uranus, many atmospheric phenomena of Neptune are unexplained, such as the thermospheres abnormally high temperature or the strong tilt (47°) of its magnetosphere.', false, 4.54, true, 1846, 'Johann Galle', 1989, 4.54, 3);
INSERT INTO public.planet VALUES (9, 'Andronica', 7, 'Planet name used  in series LOST IN SPACE', true, 9999.00, false, 1960, 'Dr. Smith', NULL, 9999.00, 7);
INSERT INTO public.planet VALUES (10, 'Beta', 7, 'Planet with humans and andoids used  in series LOST IN SPACE', true, 9999.00, false, 1960, 'Dr. Smith', NULL, 9999.00, 7);
INSERT INTO public.planet VALUES (11, 'Geonosis', 7, 'Geonosis is a desert planet in the Star Wars fictional universe. Located in the Outer Rim, it orbits the star Ea. The Clone Wars, a major feature of the Star Wars universe, began when the Galactic Republic invaded Geonosis, then in the hands of the Separatist Confederacy of Independent Systems.', true, 9999.00, false, 1960, 'Dr. Smith', NULL, 9999.00, 7);
INSERT INTO public.planet VALUES (12, 'Antares 6', 7, 'Mentioned in "Treasure of the Lost Planet," it is the planet where Beelibones is "dead and moldering."', false, 9999.00, false, 1960, 'Dr. Smith', NULL, 9999.00, 7);


--
-- Data for Name: planet_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_types VALUES (1, 'A terrestrial planet with an arid surface consistency similar to Earths deserts.', 'Desert planet');
INSERT INTO public.planet_types VALUES (2, 'A massive planet composed primarily of hydrogen and helium.', 'Gas giant');
INSERT INTO public.planet_types VALUES (3, 'A giant planet composed mainly of ice—volatile substances heavier than hydrogen and helium, such as water, methane, and ammonia—as opposed to gas (hydrogen and helium).', 'Ice giant');
INSERT INTO public.planet_types VALUES (4, 'A planet that consists primarily of an iron-rich core with little or no mantle.', 'Iron planet');
INSERT INTO public.planet_types VALUES (5, 'A theoretical planet which has a substantial fraction of its mass made of water.', 'Ocean planet');
INSERT INTO public.planet_types VALUES (6, 'A type of planet created for the purpose of finishing this project.', 'Fake Planet');
INSERT INTO public.planet_types VALUES (7, 'TV or Movies planet names', 'TV');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'Star of our solar system', 0.00002);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 'Sirius, also known as the Dog Star, is the brightest star in the night sky', 8.60000);
INSERT INTO public.star VALUES (3, 'Vega', 1, 'Vega is the brightest star in the northern constellation of Lyra. It has the Bayer designation α Lyrae, which is Latinised to Alpha Lyrae and abbreviated Alpha Lyr or α Lyr. This star is relatively close to the Sun, and one of the most luminous stars in the Suns neighborhood, being intrinsically brighter than any star nearer to the sun. It is the fifth-brightest star in the night sky, and the second-brightest star in the northern celestial hemisphere, after Arcturus.', 25.00000);
INSERT INTO public.star VALUES (4, 'Toliman', 4, ' Alpha Centauri B (α Cen B), is an orange main sequence star located in the constellation Centaurus. It is one of the three components of the Alpha Centauri system, the nearest star system to the Sun.', 4.24650);
INSERT INTO public.star VALUES (5, 'Kornephoros', 5, 'Kornephoros, also known as Beta Herculis, is a giant yellow star located in the constellation Hercules. It is the brightest star in the constellation and has a visual magnitude of +2.78. Kornephoros is a binary star system, with its companion being a red dwarf star that is not visible to the naked eye. The primary star has a mass of about three times that of the Sun and has expanded to 17 times its radius.', 139.00000);
INSERT INTO public.star VALUES (6, 'Alpha Herculis', 5, 'Rasalgethi, also known as Alpha Herculis, is a red supergiant star located in the constellation Hercules. It has an apparent magnitude of approximately 3.35, making it one of the brightest stars in its constellation. Rasalgethi is notable for its variable brightness, which changes by about a magnitude every 128 days.', 380.00000);
INSERT INTO public.star VALUES (7, 'Fake Twinkling', 8, 'Fake star belonging to the fake galaxy', 999.00000);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: galaxy_types_galaxy_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_types_galaxy_types_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 163, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_types_planet_types_id_seq', 7, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_types galaxy_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_pkey PRIMARY KEY (galaxy_types_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet_types planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_types_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique__galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique__galaxy_name UNIQUE (name);


--
-- Name: galaxy_types unique__galaxy_types_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT unique__galaxy_types_name UNIQUE (name);


--
-- Name: moon unique__moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique__moon_name UNIQUE (name);


--
-- Name: planet unique__planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique__planet_name UNIQUE (name);


--
-- Name: planet_types unique__planet_types_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT unique__planet_types_name UNIQUE (name);


--
-- Name: star unique__star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique__star_name UNIQUE (name);


--
-- Name: galaxy fk_galaxy_galaxy_types; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT fk_galaxy_galaxy_types FOREIGN KEY (galaxy_types_id) REFERENCES public.galaxy_types(galaxy_types_id);


--
-- Name: planet fk_planet_planet_types; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_planet_types FOREIGN KEY (planet_types_id) REFERENCES public.planet_types(planet_types_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

