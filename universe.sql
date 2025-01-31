--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    diameter_in_km numeric(6,2) NOT NULL,
    composition text NOT NULL,
    star_id integer NOT NULL
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
    description text,
    shape text,
    age_in_millions_of_years integer
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
    age_in_millions_of_years integer,
    planet_id integer NOT NULL
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
    description text,
    distance_from_earth numeric(15,2),
    is_spherical boolean,
    has_life boolean,
    age_in_millions_of_years integer,
    star_id integer NOT NULL
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
    description text,
    temperature_in_celsius numeric(20,2),
    galaxy_id integer NOT NULL
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

INSERT INTO public.asteroid VALUES (1, 'Ceres', 939.40, 'carbonáceo', 1);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 525.40, 'rocoso', 1);
INSERT INTO public.asteroid VALUES (3, 'Pallas', 512.00, 'carbonáceo', 1);
INSERT INTO public.asteroid VALUES (4, 'Eros', 16.84, 'metálico', 2);
INSERT INTO public.asteroid VALUES (5, 'Psyche', 226.00, 'metálico', 3);
INSERT INTO public.asteroid VALUES (6, 'Bennu', 0.49, 'carbonáceo', 4);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Vía Láctea', 'Nuestra galaxia espiral', 'Espiral', 13600);
INSERT INTO public.galaxy VALUES (2, 'Andrómeda', 'Galaxia más cercana a la Vía Láctea', 'Espiral', 10000);
INSERT INTO public.galaxy VALUES (3, 'Messier 87', 'Galaxia elíptica gigante', 'Elíptica', 14000);
INSERT INTO public.galaxy VALUES (4, 'Triángulo', 'Tercera galaxia más grande del grupo local', 'Espiral', 13000);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Galaxia con un halo prominente', 'Espiral', 9000);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 'Galaxia peculiar con un núcleo activo', 'Elíptica', 12000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 'Único satélite natural de la Tierra', 4500, 1);
INSERT INTO public.moon VALUES (2, 'Fobos', 'Luna de Marte', 4500, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Luna de Marte', 4500, 2);
INSERT INTO public.moon VALUES (4, 'Europa', 'Luna helada de Júpiter', 4500, 3);
INSERT INTO public.moon VALUES (5, 'Ganimedes', 'Mayor luna de Júpiter', 4500, 3);
INSERT INTO public.moon VALUES (6, 'Calisto', 'Luna de Júpiter', 4500, 3);
INSERT INTO public.moon VALUES (7, 'Titán', 'Mayor luna de Saturno', 4500, 4);
INSERT INTO public.moon VALUES (8, 'Encélado', 'Luna con géiseres de hielo', 4500, 4);
INSERT INTO public.moon VALUES (9, 'Dione', 'Luna de Saturno', 4500, 4);
INSERT INTO public.moon VALUES (10, 'Rea', 'Luna de Saturno', 4500, 4);
INSERT INTO public.moon VALUES (11, 'Kepler-22b Moon 1', 'Luna hipotética de Kepler-22b', 4000, 5);
INSERT INTO public.moon VALUES (12, 'Gliese 581g Moon 1', 'Luna de Gliese 581g', 3000, 6);
INSERT INTO public.moon VALUES (13, 'Gliese 581g Moon 2', 'Otra luna de Gliese 581g', 3000, 6);
INSERT INTO public.moon VALUES (14, 'HD 209458 b Moon 1', 'Luna de HD 209458 b', 5000, 7);
INSERT INTO public.moon VALUES (15, 'WASP-12b Moon 1', 'Luna de WASP-12b', 4000, 8);
INSERT INTO public.moon VALUES (16, 'TRAPPIST-1d Moon 1', 'Luna de TRAPPIST-1d', 3500, 9);
INSERT INTO public.moon VALUES (17, 'TRAPPIST-1d Moon 2', 'Otra luna de TRAPPIST-1d', 3500, 9);
INSERT INTO public.moon VALUES (18, 'TRAPPIST-1e Moon 1', 'Luna de TRAPPIST-1e', 3500, 10);
INSERT INTO public.moon VALUES (19, 'Vega Prime Moon 1', 'Luna de Vega Prime', 2000, 11);
INSERT INTO public.moon VALUES (20, 'Rigel B Moon 1', 'Luna de Rigel B', 2500, 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Tierra', 'Nuestro hogar', 0.00, true, true, 4500, 1);
INSERT INTO public.planet VALUES (2, 'Marte', 'El planeta rojo', 225000000.50, true, false, 4500, 1);
INSERT INTO public.planet VALUES (3, 'Júpiter', 'Gigante gaseoso', 778500000.75, true, false, 4500, 1);
INSERT INTO public.planet VALUES (4, 'Saturno', 'Planeta con anillos prominentes', 1427000000.99, true, false, 4500, 1);
INSERT INTO public.planet VALUES (5, 'Kepler-22b', 'Exoplaneta en zona habitable', 600000000.25, true, false, 4000, 2);
INSERT INTO public.planet VALUES (6, 'Gliese 581g', 'Exoplaneta potencialmente habitable', 20000000.80, true, false, 3000, 2);
INSERT INTO public.planet VALUES (7, 'HD 209458 b', 'Júpiter caliente', 153000000.33, true, false, 5000, 3);
INSERT INTO public.planet VALUES (8, 'WASP-12b', 'Exoplaneta en desintegración', 1400000000.45, true, false, 4000, 3);
INSERT INTO public.planet VALUES (9, 'TRAPPIST-1d', 'Exoplaneta rocoso', 40000000.60, true, false, 3500, 4);
INSERT INTO public.planet VALUES (10, 'TRAPPIST-1e', 'Exoplaneta en la zona habitable', 41000000.99, true, false, 3500, 4);
INSERT INTO public.planet VALUES (11, 'Vega Prime', 'Planeta en el sistema Vega', 10000000.10, true, false, 2000, 5);
INSERT INTO public.planet VALUES (12, 'Rigel B', 'Planeta orbitando Rigel', 12000000.20, true, false, 2500, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 'Nuestra estrella', 5778.00, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 'La estrella más brillante del cielo nocturno', 9940.50, 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 'Gigante roja en la constelación de Orión', 3500.25, 1);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 'Estrella más cercana al Sol', 3042.75, 2);
INSERT INTO public.star VALUES (5, 'Vega', 'Estrella brillante en la constelación de Lira', 9602.33, 3);
INSERT INTO public.star VALUES (6, 'Rigel', 'Supergigante azul en la constelación de Orión', 12100.99, 4);


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
-- Name: asteroid asteroid_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

