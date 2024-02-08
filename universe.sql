--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying NOT NULL,
    description text,
    has_life boolean DEFAULT false NOT NULL,
    observed boolean NOT NULL,
    distance_from_earth numeric NOT NULL
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    has_life boolean NOT NULL,
    description text,
    age_in_millions_of_years integer NOT NULL,
    galaxy_types character varying NOT NULL
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying NOT NULL,
    description text,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    planet_id integer
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
    name character varying NOT NULL,
    planet_types character varying NOT NULL,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    star_id integer
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying NOT NULL,
    distance_from_earth numeric,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    galaxy_id integer
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 'Largest asteroid in the asteroid belt', false, true, 2.77);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 'Second-largest body in the asteroid belt', false, true, 2.36);
INSERT INTO public.asteroid VALUES (3, 'Pallas', 'Third-largest asteroid in the asteroid belt', false, true, 2.77);
INSERT INTO public.asteroid VALUES (4, 'Hygiea', 'Fourth-largest asteroid in the asteroid belt', false, true, 3.14);
INSERT INTO public.asteroid VALUES (5, 'Eros', 'Near-Earth asteroid', false, true, 1.45);
INSERT INTO public.asteroid VALUES (6, 'Bennu', 'A potentially hazardous asteroid', false, true, 1.126);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', true, 'Our galaxy containing the solar system', 13700, 'Spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', false, 'Nearest spiral galaxy', 10000, 'Spiral');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', false, 'Part of the Local Group with active star formation', 3000, 'Spiral');
INSERT INTO public.galaxy VALUES (4, 'Sombrero', false, 'Noted for its bright nucleus and large central bulge', 8900, 'Spiral');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', false, 'Classic spiral galaxy, interacting with NGC 5195', 2300, 'Spiral');
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', true, 'Face-on spiral galaxy', 2100, 'Spiral');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Earth''s moon', false, true, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Largest moon of Mars', false, true, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Smaller moon of Mars', false, true, 2);
INSERT INTO public.moon VALUES (4, 'Europa', 'Moon of Jupiter with possible subsurface ocean', false, true, 4);
INSERT INTO public.moon VALUES (5, 'Ganymede', 'Largest moon in the solar system', false, true, 4);
INSERT INTO public.moon VALUES (6, 'Callisto', 'A heavily cratered moon of Jupiter', false, true, 4);
INSERT INTO public.moon VALUES (7, 'Titan', 'Largest moon of Saturn', false, true, 5);
INSERT INTO public.moon VALUES (8, 'Enceladus', 'Moon of Saturn with geysers', false, true, 5);
INSERT INTO public.moon VALUES (9, 'Miranda', 'One of Uranus'' moons', false, true, 6);
INSERT INTO public.moon VALUES (10, 'Triton', 'Largest moon of Neptune', false, true, 7);
INSERT INTO public.moon VALUES (11, 'Charon', 'Largest moon of Pluto', false, true, 8);
INSERT INTO public.moon VALUES (12, 'Dysnomia', 'Moon of the dwarf planet Eris', false, true, 8);
INSERT INTO public.moon VALUES (13, 'Io', 'Volcanically active moon of Jupiter', false, true, 4);
INSERT INTO public.moon VALUES (14, 'Mimas', 'Moon of Saturn known for its large crater', false, true, 5);
INSERT INTO public.moon VALUES (15, 'Oberon', 'Moon of Uranus', false, true, 6);
INSERT INTO public.moon VALUES (16, 'Proteus', 'Second largest moon of Neptune', false, true, 7);
INSERT INTO public.moon VALUES (17, 'Styx', 'A moon of Pluto', false, true, 8);
INSERT INTO public.moon VALUES (18, 'Nix', 'A small moon of Pluto', false, true, 8);
INSERT INTO public.moon VALUES (19, 'Hydra', 'A moon of Pluto', false, true, 8);
INSERT INTO public.moon VALUES (20, 'Kerberos', 'A moon of Pluto', false, true, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Terrestrial', true, true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'Terrestrial', false, true, 1);
INSERT INTO public.planet VALUES (3, 'Venus', 'Terrestrial', false, true, 1);
INSERT INTO public.planet VALUES (4, 'Jupiter', 'Gas Giant', false, true, 1);
INSERT INTO public.planet VALUES (5, 'Saturn', 'Gas Giant', false, true, 1);
INSERT INTO public.planet VALUES (6, 'Uranus', 'Ice Giant', false, true, 1);
INSERT INTO public.planet VALUES (7, 'Neptune', 'Ice Giant', false, true, 1);
INSERT INTO public.planet VALUES (8, 'Pluto', 'Dwarf', false, true, 1);
INSERT INTO public.planet VALUES (9, 'Kepler-22b', 'Exoplanet', false, true, 2);
INSERT INTO public.planet VALUES (10, 'Kepler-69c', 'Exoplanet', false, true, 3);
INSERT INTO public.planet VALUES (11, 'Gliese 667 Cc', 'Exoplanet', false, true, 4);
INSERT INTO public.planet VALUES (12, 'Proxima Centauri b', 'Exoplanet', false, true, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 0, true, true, 4600, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 4.24, false, true, 4600, 1);
INSERT INTO public.star VALUES (3, 'Sirius', 8.6, false, true, 242, 1);
INSERT INTO public.star VALUES (4, 'Alpha Centauri', 4.37, false, true, 5400, 1);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 642.5, false, true, 9, 1);
INSERT INTO public.star VALUES (6, 'Vega', 25, false, true, 455, 1);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

