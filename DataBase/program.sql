--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: program; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE program WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Greek_Greece.1253' LC_CTYPE = 'Greek_Greece.1253';


ALTER DATABASE program OWNER TO postgres;

\connect program

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: register_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE register_type AS ENUM (
    'facebook',
    'custom'
);


ALTER TYPE register_type OWNER TO postgres;

--
-- Name: trigger_set_timestamp(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION trigger_set_timestamp() RETURNS trigger
    LANGUAGE plpgsql
    AS $$  
BEGIN  
  NEW.i_last_update_date = NOW();
  RETURN NEW;
END;  
$$;


ALTER FUNCTION public.trigger_set_timestamp() OWNER TO postgres;

--
-- Name: greeting_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE greeting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE greeting_id_seq OWNER TO postgres;

--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hibernate_sequence OWNER TO postgres;

--
-- Name: i_education_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE i_education_id_seq
    START WITH 1000000000
    INCREMENT BY 1
    MINVALUE 1000000000
    MAXVALUE 9999999999999
    CACHE 1;


ALTER TABLE i_education_id_seq OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: i_education_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE i_education_info (
    i_education_id bigint DEFAULT nextval('i_education_id_seq'::regclass) NOT NULL,
    i_user_id bigint NOT NULL,
    i_creation_date timestamp(6) without time zone DEFAULT now(),
    i_last_update_date timestamp(6) without time zone DEFAULT now(),
    i_edu_degree character varying(100),
    i_edu_school character varying(100),
    i_edu_type character varying(100),
    i_edu_year character varying(20)
);


ALTER TABLE i_education_info OWNER TO postgres;

--
-- Name: i_location_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE i_location_id_seq
    START WITH 1000000001
    INCREMENT BY 1
    MINVALUE 1000000001
    MAXVALUE 99999999999999
    CACHE 1;


ALTER TABLE i_location_id_seq OWNER TO postgres;

--
-- Name: i_location; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE i_location (
    i_location_id bigint DEFAULT nextval('i_location_id_seq'::regclass) NOT NULL,
    i_user_id bigint NOT NULL,
    i_creation_date timestamp(6) without time zone DEFAULT now(),
    i_last_update_date timestamp(6) without time zone DEFAULT now(),
    i_country_code character varying(5),
    i_country_name character varying(50),
    i_city_name character varying(50),
    i_prefecture character varying(50),
    i_department character varying(50),
    i_street_address character varying(100),
    i_postal_code character varying(10)
);


ALTER TABLE i_location OWNER TO postgres;

--
-- Name: i_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE i_user (
    i_user_id bigint NOT NULL,
    i_creation_date timestamp(6) without time zone DEFAULT now() NOT NULL,
    i_last_update_date timestamp(6) without time zone DEFAULT now() NOT NULL,
    i_first_name character varying(50),
    i_last_name character varying(50),
    i_mobile_number character varying(20),
    i_username character varying(50),
    i_password character varying(50),
    i_email_address character varying(100),
    i_register_type character varying(100)
);


ALTER TABLE i_user OWNER TO postgres;

--
-- Name: i_user_i_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE i_user_i_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE i_user_i_user_id_seq OWNER TO postgres;

--
-- Name: i_user_i_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE i_user_i_user_id_seq OWNED BY i_user.i_user_id;


--
-- Name: i_work_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE i_work_id_seq
    START WITH 1000000000
    INCREMENT BY 1
    MINVALUE 1000000000
    MAXVALUE 999999999999999
    CACHE 1;


ALTER TABLE i_work_id_seq OWNER TO postgres;

--
-- Name: i_work_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE i_work_info (
    i_work_id bigint DEFAULT nextval('i_work_id_seq'::regclass) NOT NULL,
    i_user_id bigint NOT NULL,
    i_creation_date timestamp(6) without time zone DEFAULT now() NOT NULL,
    i_last_update_date timestamp(6) without time zone DEFAULT now(),
    i_work_employer character varying(100),
    i_work_position character varying(100)
);


ALTER TABLE i_work_info OWNER TO postgres;

--
-- Name: i_user i_user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_user ALTER COLUMN i_user_id SET DEFAULT nextval('i_user_i_user_id_seq'::regclass);


--
-- Name: greeting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('greeting_id_seq', 1, false);


--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('hibernate_sequence', 6, true);


--
-- Name: i_education_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('i_education_id_seq', 1000000004, true);


--
-- Data for Name: i_education_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY i_education_info (i_education_id, i_user_id, i_creation_date, i_last_update_date, i_edu_degree, i_edu_school, i_edu_type, i_edu_year) FROM stdin;
1000000003	1000000030	2017-12-10 19:27:42.874321	2017-12-10 19:27:42.874321		Department of Applied Informatics and Multimedia of Crete	College	2012
1000000004	1000000030	2017-12-10 19:27:42.934329	2017-12-10 19:27:42.934329	Advanced Softaware Development Technologies	University of Piraeus	Graduate School	2017
\.


--
-- Data for Name: i_location; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY i_location (i_location_id, i_user_id, i_creation_date, i_last_update_date, i_country_code, i_country_name, i_city_name, i_prefecture, i_department, i_street_address, i_postal_code) FROM stdin;
1000000002	1000000020	2017-10-29 15:07:49.898223	2017-10-29 15:13:11.877639	GR	Greece	Athens	Attica	Attica	Saronos 4	11143
1000000003	1000000020	2017-10-29 16:48:07.275397	2017-10-29 16:48:07.275397	GR	Greece	Kalamata	Messinia	Peloponissos	loggas 8	24100
1000000005	1000000020	2017-10-29 16:51:42.444704	2017-10-29 16:51:42.444704	GR	Greece	Kalamata	Messinia	Peloponissos	loggas 10	24100
1000000006	1000000020	2017-10-29 22:05:11.732534	2017-10-29 22:05:11.732534	GR	Greece	Kalamata	Messinia	Peloponissos	loggas 10	24100
1000000010	1000000023	2017-10-30 20:31:47.543345	2017-10-30 20:31:47.543345	GR	Greece	Kalamata	Messenia	Peloponnisos Dytiki Ellada ke Ionio	Aristomenous 45	24100
1000000011	1000000023	2017-10-30 20:35:56.798602	2017-10-30 20:35:56.798602	GR	Greece	Kalamata	Messenia	Peloponnisos Dytiki Ellada ke Ionio	Aristomenous 45	241 00
1000000012	1000000023	2017-10-30 20:40:59.183897	2017-10-30 20:40:59.183897	GR	Greece	Kalamata	Messenia	Peloponnisos Dytiki Ellada ke Ionio	Aristomenous 45	241 00
1000000013	1000000023	2017-10-30 22:13:09.887235	2017-10-30 22:13:09.887235	GR	Greece	Kalamata	Messenia	Peloponnisos Dytiki Ellada ke Ionio	Aristomenous 45	241 00
1000000014	1000000023	2017-10-30 22:27:02.560862	2017-10-30 22:27:02.560862	GR	Greece	Kalamata	Messenia	Peloponnisos Dytiki Ellada ke Ionio	Aristomenous 45	241 00
1000000015	1000000023	2017-10-30 22:55:44.872372	2017-10-30 22:55:44.872372	GR	Greece	Filadelfeia-Chalkidona	Central Athens	Attica	Marathonos 8	143 43
1000000016	1000000023	2017-10-30 23:05:47.623848	2017-10-30 23:05:47.623848	GR	Greece	Filadelfeia-Chalkidona	Central Athens	Attica	Anakous 60	143 41
1000000017	1000000023	2017-10-30 23:06:59.639967	2017-10-30 23:06:59.639967	GR	Greece	Pireas	Piraeus	Attica	Praxitelous 238	185 36
1000000018	1000000023	2017-10-30 23:10:34.107233	2017-10-30 23:10:34.107233	GR	Greece	West Mani	Messenia	Peloponnisos Dytiki Ellada ke Ionio	Unnamed Road	241 00
1000000019	1000000023	2017-11-03 00:30:52.691688	2017-11-03 00:30:52.691688	GR	Greece	Athens	Central Athens	Attica	Acharnon 458	111 43
1000000020	1000000023	2017-11-03 00:30:54.545794	2017-11-03 00:30:54.545794	GR	Greece	Athens	Central Athens	Attica	Acharnon 458	111 43
1000000021	1000000023	2017-11-03 00:31:50.367987	2017-11-03 00:31:50.367987	GR	Greece	Athens	Central Athens	Attica	Acharnon 458	111 43
1000000022	1000000023	2017-11-03 00:32:50.325416	2017-11-03 00:32:50.325416	GR	Greece	Athens	Central Athens	Attica	Acharnon 458	111 43
1000000023	1000000023	2017-11-03 00:33:50.36485	2017-11-03 00:33:50.36485	GR	Greece	Athens	Central Athens	Attica	Acharnon 458	111 43
1000000024	1000000023	2017-11-03 00:34:50.398284	2017-11-03 00:34:50.398284	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000025	1000000023	2017-11-03 00:35:50.441718	2017-11-03 00:35:50.441718	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000026	1000000023	2017-11-04 23:30:28.230643	2017-11-04 23:30:28.230643	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000028	1000000023	2017-11-04 23:30:28.236644	2017-11-04 23:30:28.236644	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000027	1000000023	2017-11-04 23:30:28.230643	2017-11-04 23:30:28.230643	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000029	1000000023	2017-11-04 23:30:30.690784	2017-11-04 23:30:30.690784	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000030	1000000023	2017-11-04 23:31:49.311281	2017-11-04 23:31:49.311281	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000031	1000000023	2017-11-04 23:32:52.991923	2017-11-04 23:32:52.991923	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000032	1000000023	2017-11-04 23:33:50.62922	2017-11-04 23:33:50.62922	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000033	1000000023	2017-11-04 23:34:52.52276	2017-11-04 23:34:52.52276	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000034	1000000023	2017-11-04 23:35:54.458302	2017-11-04 23:35:54.458302	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000035	1000000023	2017-11-04 23:35:56.125398	2017-11-04 23:35:56.125398	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000036	1000000023	2017-11-04 23:36:53.727692	2017-11-04 23:36:53.727692	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000037	1000000023	2017-11-04 23:36:53.728692	2017-11-04 23:36:53.728692	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000038	1000000023	2017-11-04 23:37:49.118861	2017-11-04 23:37:49.118861	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000040	1000000023	2017-11-04 23:38:55.993686	2017-11-04 23:38:55.993686	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000039	1000000023	2017-11-04 23:38:55.991685	2017-11-04 23:38:55.991685	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000041	1000000023	2017-11-04 23:40:49.124156	2017-11-04 23:40:49.124156	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000042	1000000023	2017-11-04 23:42:54.790344	2017-11-04 23:42:54.790344	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000043	1000000023	2017-11-04 23:42:54.791344	2017-11-04 23:42:54.791344	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000044	1000000023	2017-11-04 23:44:50.221946	2017-11-04 23:44:50.221946	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000045	1000000023	2017-11-04 23:46:50.57783	2017-11-04 23:46:50.57783	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000046	1000000023	2017-11-04 23:48:49.182614	2017-11-04 23:48:49.182614	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000047	1000000023	2017-11-05 00:38:27.199628	2017-11-05 00:38:27.199628	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000048	1000000023	2017-11-05 02:38:10.608822	2017-11-05 02:38:10.608822	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000049	1000000023	2017-11-05 04:38:18.804108	2017-11-05 04:38:18.804108	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000050	1000000023	2017-11-05 06:38:19.850984	2017-11-05 06:38:19.850984	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000051	1000000023	2017-11-05 08:38:20.844857	2017-11-05 08:38:20.844857	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000052	1000000023	2017-11-05 10:38:22.506769	2017-11-05 10:38:22.506769	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000053	1000000023	2017-11-05 12:02:00.795798	2017-11-05 12:02:00.795798	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000054	1000000023	2017-11-05 12:02:58.915123	2017-11-05 12:02:58.915123	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000055	1000000023	2017-11-05 12:03:58.889553	2017-11-05 12:03:58.889553	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000056	1000000023	2017-11-05 12:04:58.849982	2017-11-05 12:04:58.849982	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000057	1000000023	2017-11-05 12:05:58.931419	2017-11-05 12:05:58.931419	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000058	1000000023	2017-11-05 12:07:12.491626	2017-11-05 12:07:12.491626	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000059	1000000023	2017-11-05 12:08:12.430055	2017-11-05 12:08:12.430055	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000060	1000000023	2017-11-05 12:09:12.404485	2017-11-05 12:09:12.404485	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000061	1000000023	2017-11-05 12:10:12.46392	2017-11-05 12:10:12.46392	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000062	1000000023	2017-11-05 12:11:12.42135	2017-11-05 12:11:12.42135	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000063	1000000023	2017-11-05 12:12:12.507786	2017-11-05 12:12:12.507786	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000064	1000000023	2017-11-05 12:13:12.557221	2017-11-05 12:13:12.557221	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000065	1000000023	2017-11-05 12:14:12.497649	2017-11-05 12:14:12.497649	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000066	1000000023	2017-11-05 12:15:12.458079	2017-11-05 12:15:12.458079	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000067	1000000023	2017-11-05 12:16:12.472511	2017-11-05 12:16:12.472511	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000068	1000000023	2017-11-05 12:17:12.539947	2017-11-05 12:17:12.539947	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000069	1000000023	2017-11-05 12:18:12.491376	2017-11-05 12:18:12.491376	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000070	1000000023	2017-11-05 12:19:12.488808	2017-11-05 12:19:12.488808	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000071	1000000023	2017-11-05 12:20:12.612247	2017-11-05 12:20:12.612247	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000072	1000000023	2017-11-05 12:21:12.63268	2017-11-05 12:21:12.63268	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000073	1000000023	2017-11-05 12:22:12.61011	2017-11-05 12:22:12.61011	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000074	1000000023	2017-11-05 12:23:12.660545	2017-11-05 12:23:12.660545	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000075	1000000023	2017-11-05 12:24:12.583972	2017-11-05 12:24:12.583972	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000076	1000000023	2017-11-05 12:25:12.542402	2017-11-05 12:25:12.542402	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000077	1000000023	2017-11-05 12:26:12.676841	2017-11-05 12:26:12.676841	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000078	1000000023	2017-11-05 12:27:12.730276	2017-11-05 12:27:12.730276	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000079	1000000023	2017-11-05 12:28:12.719707	2017-11-05 12:28:12.719707	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000080	1000000023	2017-11-05 12:29:12.750141	2017-11-05 12:29:12.750141	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000081	1000000023	2017-11-05 12:30:12.659567	2017-11-05 12:30:12.659567	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000082	1000000023	2017-11-05 12:31:12.810008	2017-11-05 12:31:12.810008	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000083	1000000023	2017-11-05 12:32:12.728435	2017-11-05 12:32:12.728435	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000084	1000000023	2017-11-05 12:33:12.78087	2017-11-05 12:33:12.78087	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000085	1000000023	2017-11-05 12:34:12.798303	2017-11-05 12:34:12.798303	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000086	1000000023	2017-11-05 12:35:12.868738	2017-11-05 12:35:12.868738	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000087	1000000023	2017-11-05 12:36:12.841169	2017-11-05 12:36:12.841169	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000088	1000000023	2017-11-05 12:37:12.8276	2017-11-05 12:37:12.8276	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000089	1000000023	2017-11-05 12:38:13.036043	2017-11-05 12:38:13.036043	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000090	1000000023	2017-11-05 12:39:12.93847	2017-11-05 12:39:12.93847	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000091	1000000023	2017-11-05 12:40:12.856897	2017-11-05 12:40:12.856897	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000092	1000000023	2017-11-05 12:41:12.938333	2017-11-05 12:41:12.938333	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000093	1000000023	2017-11-05 12:42:13.139777	2017-11-05 12:42:13.139777	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000094	1000000023	2017-11-05 12:43:13.0012	2017-11-05 12:43:13.0012	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000095	1000000023	2017-11-05 12:44:12.995632	2017-11-05 12:44:12.995632	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000096	1000000023	2017-11-05 12:45:13.032066	2017-11-05 12:45:13.032066	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000097	1000000023	2017-11-05 12:46:13.110502	2017-11-05 12:46:13.110502	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000098	1000000023	2017-11-05 12:47:13.04193	2017-11-05 12:47:13.04193	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000099	1000000023	2017-11-05 12:48:13.01036	2017-11-05 12:48:13.01036	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000100	1000000023	2017-11-05 12:49:13.368812	2017-11-05 12:49:13.368812	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000101	1000000023	2017-11-05 12:50:13.054226	2017-11-05 12:50:13.054226	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000102	1000000023	2017-11-05 12:51:13.063658	2017-11-05 12:51:13.063658	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000103	1000000023	2017-11-05 12:52:13.140095	2017-11-05 12:52:13.140095	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000104	1000000023	2017-11-05 12:53:13.230532	2017-11-05 12:53:13.230532	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000105	1000000023	2017-11-05 12:54:13.204962	2017-11-05 12:54:13.204962	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000106	1000000023	2017-11-05 12:55:13.232395	2017-11-05 12:55:13.232395	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000107	1000000023	2017-11-05 12:56:13.221826	2017-11-05 12:56:13.221826	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000108	1000000023	2017-11-05 12:57:13.301263	2017-11-05 12:57:13.301263	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000109	1000000023	2017-11-05 12:58:13.231691	2017-11-05 12:58:13.231691	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000110	1000000023	2017-11-05 12:59:13.261124	2017-11-05 12:59:13.261124	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000111	1000000023	2017-11-05 13:00:13.386563	2017-11-05 13:00:13.386563	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000112	1000000023	2017-11-05 13:01:13.331992	2017-11-05 13:01:13.331992	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000113	1000000023	2017-11-05 13:02:13.250419	2017-11-05 13:02:13.250419	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000114	1000000023	2017-11-05 13:03:13.448862	2017-11-05 13:03:13.448862	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000115	1000000023	2017-11-05 13:04:13.427293	2017-11-05 13:04:13.427293	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000116	1000000023	2017-11-05 13:05:13.376722	2017-11-05 13:05:13.376722	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000117	1000000023	2017-11-05 13:06:13.470159	2017-11-05 13:06:13.470159	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000118	1000000023	2017-11-05 13:07:13.376585	2017-11-05 13:07:13.376585	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000119	1000000023	2017-11-05 13:08:13.465022	2017-11-05 13:08:13.465022	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000120	1000000023	2017-11-05 13:09:13.499456	2017-11-05 13:09:13.499456	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000121	1000000023	2017-11-05 13:10:13.591893	2017-11-05 13:10:13.591893	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000122	1000000023	2017-11-05 13:11:13.534321	2017-11-05 13:11:13.534321	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000123	1000000023	2017-11-05 13:12:13.461749	2017-11-05 13:12:13.461749	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000124	1000000023	2017-11-05 13:13:13.605189	2017-11-05 13:13:13.605189	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000125	1000000023	2017-11-05 13:14:13.683625	2017-11-05 13:14:13.683625	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000126	1000000023	2017-11-05 13:15:13.656056	2017-11-05 13:15:13.656056	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000127	1000000023	2017-11-05 13:16:13.557482	2017-11-05 13:16:13.557482	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000128	1000000023	2017-11-05 13:17:13.702922	2017-11-05 13:17:13.702922	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000129	1000000023	2017-11-05 13:18:13.669352	2017-11-05 13:18:13.669352	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000130	1000000023	2017-11-05 13:19:13.670784	2017-11-05 13:19:13.670784	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000131	1000000023	2017-11-05 13:20:13.766221	2017-11-05 13:20:13.766221	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000132	1000000023	2017-11-05 13:21:13.675648	2017-11-05 13:21:13.675648	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000133	1000000023	2017-11-05 13:22:13.762084	2017-11-05 13:22:13.762084	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000134	1000000023	2017-11-05 13:23:13.819519	2017-11-05 13:23:13.819519	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000135	1000000023	2017-11-05 13:24:13.722946	2017-11-05 13:24:13.722946	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000136	1000000023	2017-11-05 13:25:13.77438	2017-11-05 13:25:13.77438	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000137	1000000023	2017-11-05 13:26:13.803814	2017-11-05 13:26:13.803814	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000138	1000000023	2017-11-05 13:27:13.789245	2017-11-05 13:27:13.789245	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000139	1000000023	2017-11-05 13:28:13.84768	2017-11-05 13:28:13.84768	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000140	1000000023	2017-11-05 17:16:27.265217	2017-11-05 17:16:27.265217	null	null	null	null	null	null	null
1000000141	1000000023	2017-11-05 17:16:32.580521	2017-11-05 17:16:32.580521	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000142	1000000023	2017-11-05 17:17:32.463946	2017-11-05 17:17:32.463946	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000143	1000000023	2017-11-05 17:18:32.407375	2017-11-05 17:18:32.407375	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000144	1000000023	2017-11-05 17:19:32.619818	2017-11-05 17:19:32.619818	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000145	1000000023	2017-11-05 17:20:32.733257	2017-11-05 17:20:32.733257	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000146	1000000023	2017-11-05 17:21:32.668685	2017-11-05 17:21:32.668685	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000147	1000000023	2017-11-05 17:22:32.796124	2017-11-05 17:22:32.796124	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000148	1000000023	2017-11-05 17:23:32.769554	2017-11-05 17:23:32.769554	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000149	1000000023	2017-11-05 17:24:32.931995	2017-11-05 17:24:32.931995	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000150	1000000023	2017-11-05 17:25:32.869424	2017-11-05 17:25:32.869424	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000151	1000000023	2017-11-05 17:26:33.090868	2017-11-05 17:26:33.090868	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000152	1000000023	2017-11-05 17:27:32.957292	2017-11-05 17:27:32.957292	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000153	1000000023	2017-11-05 17:28:32.838717	2017-11-05 17:28:32.838717	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000154	1000000023	2017-11-05 17:29:32.839149	2017-11-05 17:29:32.839149	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000155	1000000023	2017-11-05 17:30:32.889584	2017-11-05 17:30:32.889584	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000156	1000000023	2017-11-05 17:31:32.910017	2017-11-05 17:31:32.910017	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000157	1000000023	2017-11-05 17:32:33.076458	2017-11-05 17:32:33.076458	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000158	1000000023	2017-11-05 17:33:33.022887	2017-11-05 17:33:33.022887	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000159	1000000023	2017-11-05 17:34:32.973316	2017-11-05 17:34:32.973316	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000160	1000000023	2017-11-05 17:35:32.973748	2017-11-05 17:35:32.973748	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000161	1000000023	2017-11-05 17:36:32.944178	2017-11-05 17:36:32.944178	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000162	1000000023	2017-11-05 17:37:32.938609	2017-11-05 17:37:32.938609	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000163	1000000023	2017-11-05 17:38:33.079049	2017-11-05 17:38:33.079049	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000164	1000000023	2017-11-05 17:39:32.979475	2017-11-05 17:39:32.979475	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000165	1000000023	2017-11-05 17:40:33.249922	2017-11-05 17:40:33.249922	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000166	1000000023	2017-11-05 17:41:33.366361	2017-11-05 17:41:33.366361	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000167	1000000023	2017-11-05 17:42:33.156781	2017-11-05 17:42:33.156781	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000168	1000000023	2017-11-05 17:43:33.932257	2017-11-05 17:43:33.932257	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000169	1000000023	2017-11-05 17:44:33.162645	2017-11-05 17:44:33.162645	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000170	1000000023	2017-11-05 17:45:33.124074	2017-11-05 17:45:33.124074	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000171	1000000023	2017-11-05 17:46:33.446524	2017-11-05 17:46:33.446524	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000172	1000000023	2017-11-05 17:47:33.301948	2017-11-05 17:47:33.301948	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000173	1000000023	2017-11-05 17:48:33.435387	2017-11-05 17:48:33.435387	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000174	1000000023	2017-11-05 17:49:33.349814	2017-11-05 17:49:33.349814	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000175	1000000023	2017-11-05 17:50:33.571259	2017-11-05 17:50:33.571259	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000176	1000000023	2017-11-05 17:51:33.329677	2017-11-05 17:51:33.329677	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000177	1000000023	2017-11-05 17:52:33.598124	2017-11-05 17:52:33.598124	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000178	1000000023	2017-11-05 17:54:08.055527	2017-11-05 17:54:08.055527	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000179	1000000023	2017-11-05 17:55:08.119962	2017-11-05 17:55:08.119962	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000180	1000000023	2017-11-05 17:56:08.100393	2017-11-05 17:56:08.100393	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000181	1000000023	2017-11-05 17:57:08.324837	2017-11-05 17:57:08.324837	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000182	1000000023	2017-11-05 17:58:08.193262	2017-11-05 17:58:08.193262	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000183	1000000023	2017-11-05 17:59:08.13969	2017-11-05 17:59:08.13969	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000184	1000000023	2017-11-05 18:00:08.27713	2017-11-05 18:00:08.27713	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000185	1000000023	2017-11-05 18:01:08.315564	2017-11-05 18:01:08.315564	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000186	1000000023	2017-11-05 18:02:08.264993	2017-11-05 18:02:08.264993	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000187	1000000023	2017-11-05 18:03:08.202421	2017-11-05 18:03:08.202421	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000188	1000000023	2017-11-05 18:04:08.244855	2017-11-05 18:04:08.244855	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000189	1000000023	2017-11-05 18:05:08.420297	2017-11-05 18:05:08.420297	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000190	1000000023	2017-11-05 18:06:08.650742	2017-11-05 18:06:08.650742	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000191	1000000023	2017-11-05 18:07:08.283153	2017-11-05 18:07:08.283153	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000192	1000000023	2017-11-05 18:08:08.309586	2017-11-05 18:08:08.309586	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000193	1000000023	2017-11-05 18:09:08.468027	2017-11-05 18:09:08.468027	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000194	1000000023	2017-11-05 18:10:08.434457	2017-11-05 18:10:08.434457	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000195	1000000023	2017-11-05 18:11:08.578897	2017-11-05 18:11:08.578897	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000196	1000000023	2017-11-05 18:12:08.59633	2017-11-05 18:12:08.59633	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000197	1000000020	2017-11-26 21:53:43.589013	2017-11-26 21:53:43.589013	null	null	null	null	null	null	null
1000000198	1000000020	2017-11-26 22:00:20.444712	2017-11-26 22:00:20.444712	null	null	null	null	null	null	null
1000000199	1000000020	2017-11-26 22:01:20.21713	2017-11-26 22:01:20.21713	null	null	null	null	null	null	null
1000000200	1000000020	2017-11-26 22:02:20.100556	2017-11-26 22:02:20.100556	null	null	null	null	null	null	null
1000000201	1000000020	2017-11-26 22:03:20.453008	2017-11-26 22:03:20.453008	null	null	null	null	null	null	null
1000000202	1000000020	2017-11-26 22:04:20.262428	2017-11-26 22:04:20.262428	null	null	null	null	null	null	null
1000000203	1000000020	2017-11-26 22:05:20.174855	2017-11-26 22:05:20.174855	null	null	null	null	null	null	null
1000000204	1000000020	2017-11-26 22:06:20.214289	2017-11-26 22:06:20.214289	null	null	null	null	null	null	null
1000000205	1000000020	2017-11-26 22:07:20.18772	2017-11-26 22:07:20.18772	null	null	null	null	null	null	null
1000000206	1000000020	2017-11-26 22:08:20.328159	2017-11-26 22:08:20.328159	null	null	null	null	null	null	null
1000000207	1000000020	2017-11-26 22:09:20.346592	2017-11-26 22:09:20.346592	null	null	null	null	null	null	null
1000000208	1000000020	2017-11-26 22:10:20.410028	2017-11-26 22:10:20.410028	null	null	null	null	null	null	null
1000000209	1000000020	2017-11-26 22:11:44.006809	2017-11-26 22:11:44.006809	null	null	null	null	null	null	null
1000000210	1000000020	2017-11-26 22:12:43.685223	2017-11-26 22:12:43.685223	null	null	null	null	null	null	null
1000000211	1000000020	2017-11-26 22:13:43.474642	2017-11-26 22:13:43.474642	null	null	null	null	null	null	null
1000000212	1000000020	2017-11-26 22:14:43.421071	2017-11-26 22:14:43.421071	null	null	null	null	null	null	null
1000000213	1000000020	2017-11-26 22:15:43.455505	2017-11-26 22:15:43.455505	null	null	null	null	null	null	null
1000000214	1000000020	2017-11-26 22:16:43.458937	2017-11-26 22:16:43.458937	null	null	null	null	null	null	null
1000000215	1000000020	2017-11-26 22:17:43.443368	2017-11-26 22:17:43.443368	null	null	null	null	null	null	null
1000000216	1000000020	2017-11-26 22:18:43.599808	2017-11-26 22:18:43.599808	null	null	null	null	null	null	null
1000000217	1000000020	2017-11-26 22:19:43.59724	2017-11-26 22:19:43.59724	null	null	null	null	null	null	null
1000000218	1000000020	2017-11-26 22:20:43.443663	2017-11-26 22:20:43.443663	null	null	null	null	null	null	null
1000000219	1000000020	2017-11-26 22:21:43.984126	2017-11-26 22:21:43.984126	null	null	null	null	null	null	null
1000000220	1000000020	2017-11-26 22:22:43.576534	2017-11-26 22:22:43.576534	null	null	null	null	null	null	null
1000000221	1000000020	2017-11-26 22:23:43.533964	2017-11-26 22:23:43.533964	null	null	null	null	null	null	null
1000000222	1000000020	2017-11-26 22:24:43.645402	2017-11-26 22:24:43.645402	null	null	null	null	null	null	null
1000000223	1000000020	2017-11-26 22:25:43.74884	2017-11-26 22:25:43.74884	null	null	null	null	null	null	null
1000000224	1000000020	2017-11-26 22:26:43.857278	2017-11-26 22:26:43.857278	null	null	null	null	null	null	null
1000000225	1000000020	2017-11-26 22:27:43.561693	2017-11-26 22:27:43.561693	null	null	null	null	null	null	null
1000000226	1000000020	2017-11-26 22:28:43.720133	2017-11-26 22:28:43.720133	null	null	null	null	null	null	null
1000000227	1000000020	2017-11-26 22:29:43.682563	2017-11-26 22:29:43.682563	null	null	null	null	null	null	null
1000000228	1000000020	2017-11-26 22:30:43.695996	2017-11-26 22:30:43.695996	null	null	null	null	null	null	null
1000000229	1000000020	2017-11-26 22:31:43.874438	2017-11-26 22:31:43.874438	null	null	null	null	null	null	null
1000000230	1000000020	2017-11-26 22:32:43.808866	2017-11-26 22:32:43.808866	null	null	null	null	null	null	null
1000000231	1000000020	2017-11-26 22:33:44.191319	2017-11-26 22:33:44.191319	null	null	null	null	null	null	null
1000000232	1000000020	2017-11-26 22:34:43.81373	2017-11-26 22:34:43.81373	null	null	null	null	null	null	null
1000000233	1000000020	2017-11-26 22:35:44.534203	2017-11-26 22:35:44.534203	null	null	null	null	null	null	null
1000000234	1000000020	2017-11-26 22:36:44.071608	2017-11-26 22:36:44.071608	null	null	null	null	null	null	null
1000000235	1000000020	2017-11-26 22:37:44.08004	2017-11-26 22:37:44.08004	null	null	null	null	null	null	null
1000000236	1000000020	2017-11-27 02:54:11.31414	2017-11-27 02:54:11.31414	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000237	1000000020	2017-11-27 02:55:11.390576	2017-11-27 02:55:11.390576	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000238	1000000020	2017-11-27 02:56:11.357006	2017-11-27 02:56:11.357006	GR	Greece	Chalandri	North Athens	Attica	Kosta Varnali 35A	152 33
1000000239	1000000020	2017-11-27 02:57:11.300434	2017-11-27 02:57:11.300434	GR	Greece	Chalandri	North Athens	Attica	Kosta Varnali 35A	152 33
1000000240	1000000020	2017-11-27 02:58:11.352869	2017-11-27 02:58:11.352869	GR	Greece	Chalandri	North Athens	Attica	Kosta Varnali 35A	152 33
1000000241	1000000020	2017-11-27 02:59:11.327299	2017-11-27 02:59:11.327299	null	null	null	null	null	null	null
1000000242	1000000020	2017-11-27 03:00:11.434737	2017-11-27 03:00:11.434737	GR	Greece	Attica	null	Attica	Aspropyrgos	null
1000000243	1000000020	2017-11-27 17:32:43.336508	2017-11-27 17:32:43.336508	GR	Greece	Attica	null	Attica	Aspropyrgos	null
1000000244	1000000020	2017-11-27 17:34:37.943063	2017-11-27 17:34:37.943063	null	null	null	null	null	null	null
1000000245	1000000020	2017-11-27 17:35:33.276228	2017-11-27 17:35:33.276228	GR	Greece	Attica	null	Attica	Aspropyrgos	null
1000000246	1000000020	2017-11-27 17:36:33.737687	2017-11-27 17:36:33.737687	GR	Greece	Attica	null	Attica	Aspropyrgos	null
1000000247	1000000020	2017-11-27 17:37:33.353096	2017-11-27 17:37:33.353096	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000248	1000000020	2017-11-27 17:38:33.294525	2017-11-27 17:38:33.294525	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000249	1000000020	2017-11-27 17:39:33.308957	2017-11-27 17:39:33.308957	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000250	1000000020	2017-11-27 17:40:33.342391	2017-11-27 17:40:33.342391	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000251	1000000020	2017-11-27 17:41:33.567836	2017-11-27 17:41:33.567836	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000252	1000000020	2017-11-27 17:42:33.354255	2017-11-27 17:42:33.354255	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000253	1000000020	2017-11-27 17:43:33.354687	2017-11-27 17:43:33.354687	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000254	1000000020	2017-11-27 17:44:33.37912	2017-11-27 17:44:33.37912	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000255	1000000020	2017-11-27 17:45:33.432555	2017-11-27 17:45:33.432555	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000256	1000000020	2017-11-29 23:31:03.031242	2017-11-29 23:31:03.031242	null	null	null	null	null	null	null
1000000257	1000000020	2017-11-29 23:32:02.983855	2017-11-29 23:32:02.983855	null	null	null	null	null	null	null
1000000258	1000000020	2017-11-29 23:33:03.012478	2017-11-29 23:33:03.012478	null	null	null	null	null	null	null
1000000259	1000000020	2017-11-29 23:33:59.047093	2017-11-29 23:33:59.047093	null	null	null	null	null	null	null
1000000260	1000000020	2017-11-29 23:35:00.536402	2017-11-29 23:35:00.536402	null	null	null	null	null	null	null
1000000261	1000000020	2017-11-29 23:36:19.068874	2017-11-29 23:36:19.068874	null	null	null	null	null	null	null
1000000262	1000000020	2017-11-29 23:36:59.060952	2017-11-29 23:36:59.060952	null	null	null	null	null	null	null
1000000263	1000000020	2017-11-29 23:39:20.306388	2017-11-29 23:39:20.306388	null	null	null	null	null	null	null
1000000264	1000000020	2017-11-29 23:41:54.184428	2017-11-29 23:41:54.184428	null	null	null	null	null	null	null
1000000265	1000000020	2017-11-29 23:42:37.833471	2017-11-29 23:42:37.833471	null	null	null	null	null	null	null
1000000266	1000000020	2017-11-29 23:43:54.286679	2017-11-29 23:43:54.286679	null	null	null	null	null	null	null
1000000267	1000000020	2017-11-29 23:44:34.923339	2017-11-29 23:44:34.923339	null	null	null	null	null	null	null
1000000268	1000000020	2017-11-29 23:47:00.129778	2017-11-29 23:47:00.129778	GR	Greece	Kalamata	Peloponnese	Peloponnisos Dytiki Ellada ke Ionio	Stadiou 4-18, Kalamata 241 00, Greece	241 00
1000000269	1000000020	2017-11-29 23:48:44.056475	2017-11-29 23:48:44.056475	GR	Greece	Kalamata	Peloponnese	Peloponnisos Dytiki Ellada ke Ionio	Athinon 34, Kalamata 241 00, Greece	241 00
1000000270	1000000020	2017-11-29 23:49:06.820866	2017-11-29 23:49:06.820866	GR	Greece	Kalamata	Peloponnese	Peloponnisos Dytiki Ellada ke Ionio	Athinon 95, Kalamata 241 00, Greece	241 00
1000000271	1000000020	2017-11-29 23:50:02.13339	2017-11-29 23:50:02.13339	GR	Greece	Kalamata	Peloponnese	Peloponnisos Dytiki Ellada ke Ionio	Athinon 95, Kalamata 241 00, Greece	241 00
1000000272	1000000020	2017-11-29 23:51:27.208693	2017-11-29 23:51:27.208693	GR	Greece	Kalamata	Peloponnese	Peloponnisos Dytiki Ellada ke Ionio	Athinon 95, Kalamata 241 00, Greece	241 00
1000000273	1000000020	2017-11-29 23:52:03.831844	2017-11-29 23:52:03.831844	GR	Greece	Kalamata	Peloponnese	Peloponnisos Dytiki Ellada ke Ionio	Athinon 95, Kalamata 241 00, Greece	241 00
1000000274	1000000020	2017-12-02 14:34:04.642786	2017-12-02 14:34:04.642786	null	null	null	null	null	null	null
1000000275	1000000020	2017-12-02 14:36:12.055466	2017-12-02 14:36:12.055466	null	null	null	null	null	null	null
1000000276	1000000020	2017-12-02 15:40:10.235853	2017-12-02 15:40:10.235853	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000277	1000000020	2017-12-02 15:41:48.452825	2017-12-02 15:41:48.452825	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000278	1000000020	2017-12-02 15:42:29.329515	2017-12-02 15:42:29.329515	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000279	1000000020	2017-12-02 15:43:08.407478	2017-12-02 15:43:08.407478	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000280	1000000020	2017-12-02 15:49:50.311013	2017-12-02 15:49:50.311013	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000281	1000000020	2017-12-02 16:32:16.864884	2017-12-02 16:32:16.864884	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000282	1000000020	2017-12-02 16:33:13.920129	2017-12-02 16:33:13.920129	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000283	1000000020	2017-12-02 16:34:46.362868	2017-12-02 16:34:46.362868	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000284	1000000020	2017-12-02 16:35:13.912867	2017-12-02 16:35:13.912867	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000285	1000000020	2017-12-02 16:36:13.933988	2017-12-02 16:36:13.933988	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000286	1000000020	2017-12-02 16:37:26.363686	2017-12-02 16:37:26.363686	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000287	1000000020	2017-12-02 16:38:13.911223	2017-12-02 16:38:13.911223	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000288	1000000020	2017-12-02 16:39:13.909342	2017-12-02 16:39:13.909342	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000289	1000000020	2017-12-02 16:40:13.97947	2017-12-02 16:40:13.97947	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000290	1000000020	2017-12-02 16:41:13.918081	2017-12-02 16:41:13.918081	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000291	1000000020	2017-12-02 16:42:53.926281	2017-12-02 16:42:53.926281	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000292	1000000020	2017-12-02 16:43:13.947323	2017-12-02 16:43:13.947323	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000293	1000000020	2017-12-02 16:44:13.957443	2017-12-02 16:44:13.957443	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000294	1000000020	2017-12-02 16:45:33.934599	2017-12-02 16:45:33.934599	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000295	1000000020	2017-12-02 16:46:13.912676	2017-12-02 16:46:13.912676	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000296	1000000020	2017-12-02 16:47:15.000433	2017-12-02 16:47:15.000433	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000297	1000000020	2017-12-02 16:48:13.96192	2017-12-02 16:48:13.96192	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000298	1000000020	2017-12-02 16:49:13.928535	2017-12-02 16:49:13.928535	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000299	1000000029	2017-12-02 16:52:15.302066	2017-12-02 16:52:15.302066	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000300	1000000029	2017-12-02 16:53:15.289684	2017-12-02 16:53:15.289684	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000301	1000000029	2017-12-02 16:54:53.648174	2017-12-02 16:54:53.648174	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000302	1000000029	2017-12-02 16:55:15.285421	2017-12-02 16:55:15.285421	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000303	1000000029	2017-12-02 16:56:15.271539	2017-12-02 16:56:15.271539	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000304	1000000029	2017-12-02 16:57:33.621988	2017-12-02 16:57:33.621988	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000305	1000000029	2017-12-02 16:58:15.278278	2017-12-02 16:58:15.278278	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000306	1000000029	2017-12-02 16:59:15.273396	2017-12-02 16:59:15.273396	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000307	1000000029	2017-12-02 17:00:15.86109	2017-12-02 17:00:15.86109	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000308	1000000029	2017-12-02 17:01:15.274634	2017-12-02 17:01:15.274634	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000309	1000000029	2017-12-02 17:02:15.279254	2017-12-02 17:02:15.279254	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000310	1000000029	2017-12-02 17:03:15.266371	2017-12-02 17:03:15.266371	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000311	1000000029	2017-12-02 17:40:24.162798	2017-12-02 17:40:24.162798	null	null	null	null	null	null	null
1000000312	1000000029	2017-12-02 17:41:20.40594	2017-12-02 17:41:20.40594	null	null	null	null	null	null	null
1000000313	1000000029	2017-12-02 17:42:25.546711	2017-12-02 17:42:25.546711	null	null	null	null	null	null	null
1000000314	1000000029	2017-12-02 17:43:20.358672	2017-12-02 17:43:20.358672	null	null	null	null	null	null	null
1000000315	1000000029	2017-12-02 17:44:20.408297	2017-12-02 17:44:20.408297	null	null	null	null	null	null	null
1000000316	1000000029	2017-12-02 17:45:20.382413	2017-12-02 17:45:20.382413	null	null	null	null	null	null	null
1000000317	1000000030	2017-12-03 18:57:11.100846	2017-12-03 18:57:11.100846	null	null	null	null	null	null	null
1000000318	1000000030	2017-12-10 15:29:41.873298	2017-12-10 15:29:41.873298	null	null	null	null	null	null	null
1000000319	1000000030	2017-12-10 18:53:13.383029	2017-12-10 18:53:13.383029	null	null	null	null	null	null	null
\.


--
-- Name: i_location_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('i_location_id_seq', 1000000319, true);


--
-- Data for Name: i_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY i_user (i_user_id, i_creation_date, i_last_update_date, i_first_name, i_last_name, i_mobile_number, i_username, i_password, i_email_address, i_register_type) FROM stdin;
1000000020	2017-10-12 19:55:19.392707	2017-10-12 19:55:19.392707	Ioannis	Kozompolis	6971903121	giannis		g.kozompolis@gmail.com	\N
1000000021	2017-10-12 19:57:45.490063	2017-10-12 19:57:45.490063	Ioannis 	Kozompolis	6971903121	giannis2		g.kozompolis@gmail.com	\N
1000000022	2017-10-12 20:55:23.476849	2017-10-12 20:55:23.476849	aek	ole	6971903121	aek		giannis1990@gmail.com	\N
1000000023	2017-10-12 21:08:52.548125	2017-10-12 21:08:52.548125	giannis4			giannis4			\N
1000000024	2017-10-14 21:22:11.872753	2017-10-14 21:22:11.872753	giannis5			giannis5			\N
1000000025	2017-10-14 21:27:15.417114	2017-10-14 21:27:15.417114	giannis6			giannis6			\N
1000000026	2017-11-25 21:04:47.794319	2017-11-25 21:04:47.794319	Ioannis	Kozompolis	6971903121	giannis2669		g.kozompolis@gmail.com	\N
1000000027	2017-12-02 16:22:39.382553	2017-12-02 16:22:39.382553	Ioannnis	Kozompolis	6971903121	kozo		g.kozompolis@gmail.com	\N
1000000028	2017-12-02 16:30:33.483257	2017-12-02 16:30:33.483257				kozompolis			\N
1000000029	2017-12-02 16:52:05.125274	2017-12-02 16:52:05.125274				testuser1			\N
1000000030	2017-12-03 17:55:53.547356	2017-12-03 17:55:53.547356	John	Kozo		1127478420719730		g.kozompolis@gmail.com	\N
\.


--
-- Name: i_user_i_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('i_user_i_user_id_seq', 1000000030, true);


--
-- Name: i_work_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('i_work_id_seq', 1000000023, true);


--
-- Data for Name: i_work_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY i_work_info (i_work_id, i_user_id, i_creation_date, i_last_update_date, i_work_employer, i_work_position) FROM stdin;
1000000008	1000000020	2017-12-09 18:07:12.183065	2017-12-09 18:07:12.183065	Almasport	Sales
1000000009	1000000020	2017-12-09 18:13:25.564421	2017-12-09 18:13:25.564421	\N	\N
1000000010	1000000030	2017-12-10 14:28:51.964701	2017-12-10 14:28:51.964701	Velti	QA Engineer
1000000011	1000000030	2017-12-10 15:26:23.561616	2017-12-10 15:26:23.561616	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000012	1000000030	2017-12-10 15:31:11.868226	2017-12-10 15:31:11.868226	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000013	1000000030	2017-12-10 15:32:59.937949	2017-12-10 15:32:59.937949	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000014	1000000030	2017-12-10 15:34:53.439362	2017-12-10 15:34:53.439362	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000015	1000000030	2017-12-10 16:19:59.583499	2017-12-10 16:19:59.583499	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000016	1000000030	2017-12-10 16:21:56.754378	2017-12-10 16:21:56.754378	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000017	1000000030	2017-12-10 16:25:51.281659	2017-12-10 16:25:51.281659	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000018	1000000030	2017-12-10 18:58:47.20742	2017-12-10 18:58:47.20742	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000019	1000000030	2017-12-10 18:58:47.239924	2017-12-10 18:58:47.239924	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000020	1000000030	2017-12-10 19:03:49.897356	2017-12-10 19:03:49.897356	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000021	1000000030	2017-12-10 19:20:44.539699	2017-12-10 19:20:44.539699	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000022	1000000030	2017-12-10 19:24:38.35189	2017-12-10 19:24:38.35189	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000023	1000000030	2017-12-10 19:27:42.773308	2017-12-10 19:27:42.773308	Velti S.A.	Quality Assurance Engineer (QA Engineer)
\.


--
-- Name: i_education_info i_education_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_education_info
    ADD CONSTRAINT i_education_info_pkey PRIMARY KEY (i_education_id);


--
-- Name: i_location i_location_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_location
    ADD CONSTRAINT i_location_pkey PRIMARY KEY (i_location_id);


--
-- Name: i_user i_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_user
    ADD CONSTRAINT i_user_pkey PRIMARY KEY (i_user_id);


--
-- Name: i_work_info i_work_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_work_info
    ADD CONSTRAINT i_work_info_pkey PRIMARY KEY (i_work_id);


--
-- Name: fki_E; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_E" ON i_education_info USING btree (i_user_id);


--
-- Name: fki_i_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_i_user_id ON i_work_info USING btree (i_user_id);


--
-- Name: i_education_info Update_Data; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "Update_Data" BEFORE UPDATE ON i_education_info FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- Name: i_location Update_last_update_date; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "Update_last_update_date" BEFORE UPDATE ON i_location FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- Name: i_user set_timestamp; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER set_timestamp BEFORE UPDATE ON i_user FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- Name: i_work_info set_timestamp; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER set_timestamp BEFORE UPDATE ON i_work_info FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- Name: i_location User ID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_location
    ADD CONSTRAINT "User ID" FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id);


--
-- Name: i_education_info User_id_in_education_info; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_education_info
    ADD CONSTRAINT "User_id_in_education_info" FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: i_work_info fkcoqbcg27jlgcyjfnh4n65uehx; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_work_info
    ADD CONSTRAINT fkcoqbcg27jlgcyjfnh4n65uehx FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id);


--
-- Name: i_location fkg0rrrwit513pw13pr3n3o2u4e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_location
    ADD CONSTRAINT fkg0rrrwit513pw13pr3n3o2u4e FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id);


--
-- Name: i_work_info i_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_work_info
    ADD CONSTRAINT i_user_id FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: i_education_info i_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_education_info
    ADD CONSTRAINT i_user_id FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: register_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE register_type AS ENUM (
    'facebook',
    'custom'
);


ALTER TYPE register_type OWNER TO postgres;

--
-- Name: trigger_set_timestamp(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION trigger_set_timestamp() RETURNS trigger
    LANGUAGE plpgsql
    AS $$  
BEGIN  
  NEW.i_last_update_date = NOW();
  RETURN NEW;
END;  
$$;


ALTER FUNCTION public.trigger_set_timestamp() OWNER TO postgres;

--
-- Name: greeting_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE greeting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE greeting_id_seq OWNER TO postgres;

--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hibernate_sequence OWNER TO postgres;

--
-- Name: i_education_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE i_education_id_seq
    START WITH 1000000000
    INCREMENT BY 1
    MINVALUE 1000000000
    MAXVALUE 9999999999999
    CACHE 1;


ALTER TABLE i_education_id_seq OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: i_education_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE i_education_info (
    i_education_id bigint DEFAULT nextval('i_education_id_seq'::regclass) NOT NULL,
    i_user_id bigint NOT NULL,
    i_creation_date timestamp(6) without time zone DEFAULT now(),
    i_last_update_date timestamp(6) without time zone DEFAULT now(),
    i_edu_degree character varying(100),
    i_edu_school character varying(100),
    i_edu_type character varying(100),
    i_edu_year character varying(20)
);


ALTER TABLE i_education_info OWNER TO postgres;

--
-- Name: i_fb_books_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE i_fb_books_id_seq
    START WITH 1000000000
    INCREMENT BY 1
    MINVALUE 1000000000
    MAXVALUE 9999999999999
    CACHE 1;


ALTER TABLE i_fb_books_id_seq OWNER TO postgres;

--
-- Name: i_fb_books; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE i_fb_books (
    i_fb_books_id bigint DEFAULT nextval('i_fb_books_id_seq'::regclass) NOT NULL,
    i_user_id bigint NOT NULL,
    i_creation_date timestamp(6) without time zone DEFAULT now(),
    i_last_update_date timestamp(6) without time zone DEFAULT now(),
    i_book_name character varying(100),
    i_book_description character varying(400)
);


ALTER TABLE i_fb_books OWNER TO postgres;

--
-- Name: i_fb_events_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE i_fb_events_id_seq
    START WITH 1000000000
    INCREMENT BY 1
    MINVALUE 1000000000
    MAXVALUE 999999999999999
    CACHE 1;


ALTER TABLE i_fb_events_id_seq OWNER TO postgres;

--
-- Name: i_fb_events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE i_fb_events (
    i_fb_events_id bigint DEFAULT nextval('i_fb_events_id_seq'::regclass) NOT NULL,
    i_user_id bigint NOT NULL,
    i_creation_date timestamp(6) without time zone DEFAULT now(),
    i_last_update_date timestamp(6) without time zone DEFAULT now(),
    i_event_name character varying(100),
    i_event_description character varying(400),
    i_event_start_date timestamp(6) without time zone
);


ALTER TABLE i_fb_events OWNER TO postgres;

--
-- Name: i_fb_favorite_teams_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE i_fb_favorite_teams_id_seq
    START WITH 1000000000
    INCREMENT BY 1
    MINVALUE 1000000000
    MAXVALUE 9999999999999
    CACHE 1;


ALTER TABLE i_fb_favorite_teams_id_seq OWNER TO postgres;

--
-- Name: i_fb_favorite_teams; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE i_fb_favorite_teams (
    i_fb_favorite_teams_id bigint DEFAULT nextval('i_fb_favorite_teams_id_seq'::regclass) NOT NULL,
    i_user_id bigint NOT NULL,
    i_creation_date timestamp(6) without time zone DEFAULT now(),
    i_last_update_date timestamp(6) without time zone DEFAULT now(),
    i_team_name character varying(100)
);


ALTER TABLE i_fb_favorite_teams OWNER TO postgres;

--
-- Name: i_fb_music_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE i_fb_music_id_seq
    START WITH 1000000000
    INCREMENT BY 1
    MINVALUE 1000000000
    MAXVALUE 9999999999999
    CACHE 1;


ALTER TABLE i_fb_music_id_seq OWNER TO postgres;

--
-- Name: i_fb_music; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE i_fb_music (
    i_fb_music_id bigint DEFAULT nextval('i_fb_music_id_seq'::regclass) NOT NULL,
    i_user_id bigint NOT NULL,
    i_creation_date timestamp(6) without time zone DEFAULT now(),
    i_last_update_date timestamp(6) without time zone DEFAULT now(),
    i_music_title character varying(100)
);


ALTER TABLE i_fb_music OWNER TO postgres;

--
-- Name: i_interest_pages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE i_interest_pages_id_seq
    START WITH 1000000000
    INCREMENT BY 1
    MINVALUE 1000000000
    MAXVALUE 99999999999999
    CACHE 1;


ALTER TABLE i_interest_pages_id_seq OWNER TO postgres;

--
-- Name: i_interest_fb_pages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE i_interest_fb_pages (
    i_interest_pages_id bigint DEFAULT nextval('i_interest_pages_id_seq'::regclass) NOT NULL,
    i_user_id bigint NOT NULL,
    i_creation_date timestamp(6) without time zone DEFAULT now(),
    i_last_update_date timestamp(6) without time zone DEFAULT now(),
    i_page_name character varying(100),
    i_page_description character varying(400)
);


ALTER TABLE i_interest_fb_pages OWNER TO postgres;

--
-- Name: i_location_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE i_location_id_seq
    START WITH 1000000001
    INCREMENT BY 1
    MINVALUE 1000000001
    MAXVALUE 99999999999999
    CACHE 1;


ALTER TABLE i_location_id_seq OWNER TO postgres;

--
-- Name: i_location; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE i_location (
    i_location_id bigint DEFAULT nextval('i_location_id_seq'::regclass) NOT NULL,
    i_user_id bigint NOT NULL,
    i_creation_date timestamp(6) without time zone DEFAULT now(),
    i_last_update_date timestamp(6) without time zone DEFAULT now(),
    i_country_code character varying(5),
    i_country_name character varying(50),
    i_city_name character varying(50),
    i_prefecture character varying(50),
    i_department character varying(50),
    i_street_address character varying(100),
    i_postal_code character varying(10)
);


ALTER TABLE i_location OWNER TO postgres;

--
-- Name: i_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE i_user (
    i_user_id bigint NOT NULL,
    i_creation_date timestamp(6) without time zone DEFAULT now() NOT NULL,
    i_last_update_date timestamp(6) without time zone DEFAULT now() NOT NULL,
    i_first_name character varying(50),
    i_last_name character varying(50),
    i_mobile_number character varying(20),
    i_username character varying(50),
    i_password character varying(50),
    i_email_address character varying(100),
    i_register_type character varying(100)
);


ALTER TABLE i_user OWNER TO postgres;

--
-- Name: i_user_i_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE i_user_i_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE i_user_i_user_id_seq OWNER TO postgres;

--
-- Name: i_user_i_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE i_user_i_user_id_seq OWNED BY i_user.i_user_id;


--
-- Name: i_work_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE i_work_id_seq
    START WITH 1000000000
    INCREMENT BY 1
    MINVALUE 1000000000
    MAXVALUE 999999999999999
    CACHE 1;


ALTER TABLE i_work_id_seq OWNER TO postgres;

--
-- Name: i_work_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE i_work_info (
    i_work_id bigint DEFAULT nextval('i_work_id_seq'::regclass) NOT NULL,
    i_user_id bigint NOT NULL,
    i_creation_date timestamp(6) without time zone DEFAULT now() NOT NULL,
    i_last_update_date timestamp(6) without time zone DEFAULT now(),
    i_work_employer character varying(100),
    i_work_position character varying(100)
);


ALTER TABLE i_work_info OWNER TO postgres;

--
-- Name: i_user i_user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_user ALTER COLUMN i_user_id SET DEFAULT nextval('i_user_i_user_id_seq'::regclass);


--
-- Name: greeting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('greeting_id_seq', 1, false);


--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('hibernate_sequence', 6, true);


--
-- Name: i_education_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('i_education_id_seq', 1000000004, true);


--
-- Data for Name: i_education_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY i_education_info (i_education_id, i_user_id, i_creation_date, i_last_update_date, i_edu_degree, i_edu_school, i_edu_type, i_edu_year) FROM stdin;
1000000003	1000000030	2017-12-10 19:27:42.874321	2017-12-10 19:27:42.874321		Department of Applied Informatics and Multimedia of Crete	College	2012
1000000004	1000000030	2017-12-10 19:27:42.934329	2017-12-10 19:27:42.934329	Advanced Softaware Development Technologies	University of Piraeus	Graduate School	2017
\.


--
-- Data for Name: i_fb_books; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY i_fb_books (i_fb_books_id, i_user_id, i_creation_date, i_last_update_date, i_book_name, i_book_description) FROM stdin;
1000000000	1000000020	2017-12-13 17:13:27.565242	2017-12-13 17:13:54.776242	The Secret	The secret book only for adults
\.


--
-- Name: i_fb_books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('i_fb_books_id_seq', 1000000000, true);


--
-- Data for Name: i_fb_events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY i_fb_events (i_fb_events_id, i_user_id, i_creation_date, i_last_update_date, i_event_name, i_event_description, i_event_start_date) FROM stdin;
1000000000	1000000020	2017-12-13 16:46:29.113914	2017-12-13 16:49:20.508051	2nd Marathon Kalamatas	Marathon on Kalamata first time ever	\N
1000000001	1000000020	2017-12-13 16:47:54.9875	2017-12-13 16:49:20.508051	2nd Marathon Kalamatas	Marathon on Kalamata first time ever	2017-12-13 16:47:54.9875
\.


--
-- Name: i_fb_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('i_fb_events_id_seq', 1000000001, true);


--
-- Data for Name: i_fb_favorite_teams; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY i_fb_favorite_teams (i_fb_favorite_teams_id, i_user_id, i_creation_date, i_last_update_date, i_team_name) FROM stdin;
1000000000	1000000020	2017-12-13 17:50:42.613253	2017-12-13 17:51:24.465438	AEK F.C.
\.


--
-- Name: i_fb_favorite_teams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('i_fb_favorite_teams_id_seq', 1000000000, true);


--
-- Data for Name: i_fb_music; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY i_fb_music (i_fb_music_id, i_user_id, i_creation_date, i_last_update_date, i_music_title) FROM stdin;
1000000000	1000000020	2017-12-13 17:26:30.425242	2017-12-13 17:26:40.697242	Eminem
1000000001	1000000020	2017-12-13 17:27:14.616468	2017-12-13 17:27:14.616468	Secret
\.


--
-- Name: i_fb_music_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('i_fb_music_id_seq', 1000000001, true);


--
-- Data for Name: i_interest_fb_pages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY i_interest_fb_pages (i_interest_pages_id, i_user_id, i_creation_date, i_last_update_date, i_page_name, i_page_description) FROM stdin;
\.


--
-- Name: i_interest_pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('i_interest_pages_id_seq', 1000000003, true);


--
-- Data for Name: i_location; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY i_location (i_location_id, i_user_id, i_creation_date, i_last_update_date, i_country_code, i_country_name, i_city_name, i_prefecture, i_department, i_street_address, i_postal_code) FROM stdin;
1000000002	1000000020	2017-10-29 15:07:49.898223	2017-10-29 15:13:11.877639	GR	Greece	Athens	Attica	Attica	Saronos 4	11143
1000000003	1000000020	2017-10-29 16:48:07.275397	2017-10-29 16:48:07.275397	GR	Greece	Kalamata	Messinia	Peloponissos	loggas 8	24100
1000000005	1000000020	2017-10-29 16:51:42.444704	2017-10-29 16:51:42.444704	GR	Greece	Kalamata	Messinia	Peloponissos	loggas 10	24100
1000000006	1000000020	2017-10-29 22:05:11.732534	2017-10-29 22:05:11.732534	GR	Greece	Kalamata	Messinia	Peloponissos	loggas 10	24100
1000000010	1000000023	2017-10-30 20:31:47.543345	2017-10-30 20:31:47.543345	GR	Greece	Kalamata	Messenia	Peloponnisos Dytiki Ellada ke Ionio	Aristomenous 45	24100
1000000011	1000000023	2017-10-30 20:35:56.798602	2017-10-30 20:35:56.798602	GR	Greece	Kalamata	Messenia	Peloponnisos Dytiki Ellada ke Ionio	Aristomenous 45	241 00
1000000012	1000000023	2017-10-30 20:40:59.183897	2017-10-30 20:40:59.183897	GR	Greece	Kalamata	Messenia	Peloponnisos Dytiki Ellada ke Ionio	Aristomenous 45	241 00
1000000013	1000000023	2017-10-30 22:13:09.887235	2017-10-30 22:13:09.887235	GR	Greece	Kalamata	Messenia	Peloponnisos Dytiki Ellada ke Ionio	Aristomenous 45	241 00
1000000014	1000000023	2017-10-30 22:27:02.560862	2017-10-30 22:27:02.560862	GR	Greece	Kalamata	Messenia	Peloponnisos Dytiki Ellada ke Ionio	Aristomenous 45	241 00
1000000015	1000000023	2017-10-30 22:55:44.872372	2017-10-30 22:55:44.872372	GR	Greece	Filadelfeia-Chalkidona	Central Athens	Attica	Marathonos 8	143 43
1000000016	1000000023	2017-10-30 23:05:47.623848	2017-10-30 23:05:47.623848	GR	Greece	Filadelfeia-Chalkidona	Central Athens	Attica	Anakous 60	143 41
1000000017	1000000023	2017-10-30 23:06:59.639967	2017-10-30 23:06:59.639967	GR	Greece	Pireas	Piraeus	Attica	Praxitelous 238	185 36
1000000018	1000000023	2017-10-30 23:10:34.107233	2017-10-30 23:10:34.107233	GR	Greece	West Mani	Messenia	Peloponnisos Dytiki Ellada ke Ionio	Unnamed Road	241 00
1000000019	1000000023	2017-11-03 00:30:52.691688	2017-11-03 00:30:52.691688	GR	Greece	Athens	Central Athens	Attica	Acharnon 458	111 43
1000000020	1000000023	2017-11-03 00:30:54.545794	2017-11-03 00:30:54.545794	GR	Greece	Athens	Central Athens	Attica	Acharnon 458	111 43
1000000021	1000000023	2017-11-03 00:31:50.367987	2017-11-03 00:31:50.367987	GR	Greece	Athens	Central Athens	Attica	Acharnon 458	111 43
1000000022	1000000023	2017-11-03 00:32:50.325416	2017-11-03 00:32:50.325416	GR	Greece	Athens	Central Athens	Attica	Acharnon 458	111 43
1000000023	1000000023	2017-11-03 00:33:50.36485	2017-11-03 00:33:50.36485	GR	Greece	Athens	Central Athens	Attica	Acharnon 458	111 43
1000000024	1000000023	2017-11-03 00:34:50.398284	2017-11-03 00:34:50.398284	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000025	1000000023	2017-11-03 00:35:50.441718	2017-11-03 00:35:50.441718	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000026	1000000023	2017-11-04 23:30:28.230643	2017-11-04 23:30:28.230643	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000028	1000000023	2017-11-04 23:30:28.236644	2017-11-04 23:30:28.236644	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000027	1000000023	2017-11-04 23:30:28.230643	2017-11-04 23:30:28.230643	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000029	1000000023	2017-11-04 23:30:30.690784	2017-11-04 23:30:30.690784	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000030	1000000023	2017-11-04 23:31:49.311281	2017-11-04 23:31:49.311281	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000031	1000000023	2017-11-04 23:32:52.991923	2017-11-04 23:32:52.991923	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000032	1000000023	2017-11-04 23:33:50.62922	2017-11-04 23:33:50.62922	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000033	1000000023	2017-11-04 23:34:52.52276	2017-11-04 23:34:52.52276	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000034	1000000023	2017-11-04 23:35:54.458302	2017-11-04 23:35:54.458302	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000035	1000000023	2017-11-04 23:35:56.125398	2017-11-04 23:35:56.125398	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000036	1000000023	2017-11-04 23:36:53.727692	2017-11-04 23:36:53.727692	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000037	1000000023	2017-11-04 23:36:53.728692	2017-11-04 23:36:53.728692	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000038	1000000023	2017-11-04 23:37:49.118861	2017-11-04 23:37:49.118861	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000040	1000000023	2017-11-04 23:38:55.993686	2017-11-04 23:38:55.993686	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000039	1000000023	2017-11-04 23:38:55.991685	2017-11-04 23:38:55.991685	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000041	1000000023	2017-11-04 23:40:49.124156	2017-11-04 23:40:49.124156	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000042	1000000023	2017-11-04 23:42:54.790344	2017-11-04 23:42:54.790344	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000043	1000000023	2017-11-04 23:42:54.791344	2017-11-04 23:42:54.791344	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000044	1000000023	2017-11-04 23:44:50.221946	2017-11-04 23:44:50.221946	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000045	1000000023	2017-11-04 23:46:50.57783	2017-11-04 23:46:50.57783	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000046	1000000023	2017-11-04 23:48:49.182614	2017-11-04 23:48:49.182614	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000047	1000000023	2017-11-05 00:38:27.199628	2017-11-05 00:38:27.199628	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000048	1000000023	2017-11-05 02:38:10.608822	2017-11-05 02:38:10.608822	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000049	1000000023	2017-11-05 04:38:18.804108	2017-11-05 04:38:18.804108	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000050	1000000023	2017-11-05 06:38:19.850984	2017-11-05 06:38:19.850984	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000051	1000000023	2017-11-05 08:38:20.844857	2017-11-05 08:38:20.844857	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000052	1000000023	2017-11-05 10:38:22.506769	2017-11-05 10:38:22.506769	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000053	1000000023	2017-11-05 12:02:00.795798	2017-11-05 12:02:00.795798	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000054	1000000023	2017-11-05 12:02:58.915123	2017-11-05 12:02:58.915123	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000055	1000000023	2017-11-05 12:03:58.889553	2017-11-05 12:03:58.889553	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000056	1000000023	2017-11-05 12:04:58.849982	2017-11-05 12:04:58.849982	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000057	1000000023	2017-11-05 12:05:58.931419	2017-11-05 12:05:58.931419	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000058	1000000023	2017-11-05 12:07:12.491626	2017-11-05 12:07:12.491626	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000059	1000000023	2017-11-05 12:08:12.430055	2017-11-05 12:08:12.430055	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000060	1000000023	2017-11-05 12:09:12.404485	2017-11-05 12:09:12.404485	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000061	1000000023	2017-11-05 12:10:12.46392	2017-11-05 12:10:12.46392	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000062	1000000023	2017-11-05 12:11:12.42135	2017-11-05 12:11:12.42135	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000063	1000000023	2017-11-05 12:12:12.507786	2017-11-05 12:12:12.507786	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000064	1000000023	2017-11-05 12:13:12.557221	2017-11-05 12:13:12.557221	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000065	1000000023	2017-11-05 12:14:12.497649	2017-11-05 12:14:12.497649	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000066	1000000023	2017-11-05 12:15:12.458079	2017-11-05 12:15:12.458079	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000067	1000000023	2017-11-05 12:16:12.472511	2017-11-05 12:16:12.472511	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000068	1000000023	2017-11-05 12:17:12.539947	2017-11-05 12:17:12.539947	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000069	1000000023	2017-11-05 12:18:12.491376	2017-11-05 12:18:12.491376	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000070	1000000023	2017-11-05 12:19:12.488808	2017-11-05 12:19:12.488808	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000071	1000000023	2017-11-05 12:20:12.612247	2017-11-05 12:20:12.612247	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000072	1000000023	2017-11-05 12:21:12.63268	2017-11-05 12:21:12.63268	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000073	1000000023	2017-11-05 12:22:12.61011	2017-11-05 12:22:12.61011	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000074	1000000023	2017-11-05 12:23:12.660545	2017-11-05 12:23:12.660545	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000075	1000000023	2017-11-05 12:24:12.583972	2017-11-05 12:24:12.583972	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000076	1000000023	2017-11-05 12:25:12.542402	2017-11-05 12:25:12.542402	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000077	1000000023	2017-11-05 12:26:12.676841	2017-11-05 12:26:12.676841	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000078	1000000023	2017-11-05 12:27:12.730276	2017-11-05 12:27:12.730276	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000079	1000000023	2017-11-05 12:28:12.719707	2017-11-05 12:28:12.719707	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000080	1000000023	2017-11-05 12:29:12.750141	2017-11-05 12:29:12.750141	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000081	1000000023	2017-11-05 12:30:12.659567	2017-11-05 12:30:12.659567	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000082	1000000023	2017-11-05 12:31:12.810008	2017-11-05 12:31:12.810008	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000083	1000000023	2017-11-05 12:32:12.728435	2017-11-05 12:32:12.728435	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000084	1000000023	2017-11-05 12:33:12.78087	2017-11-05 12:33:12.78087	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000085	1000000023	2017-11-05 12:34:12.798303	2017-11-05 12:34:12.798303	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000086	1000000023	2017-11-05 12:35:12.868738	2017-11-05 12:35:12.868738	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000087	1000000023	2017-11-05 12:36:12.841169	2017-11-05 12:36:12.841169	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000088	1000000023	2017-11-05 12:37:12.8276	2017-11-05 12:37:12.8276	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000089	1000000023	2017-11-05 12:38:13.036043	2017-11-05 12:38:13.036043	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000090	1000000023	2017-11-05 12:39:12.93847	2017-11-05 12:39:12.93847	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000091	1000000023	2017-11-05 12:40:12.856897	2017-11-05 12:40:12.856897	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000092	1000000023	2017-11-05 12:41:12.938333	2017-11-05 12:41:12.938333	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000093	1000000023	2017-11-05 12:42:13.139777	2017-11-05 12:42:13.139777	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000094	1000000023	2017-11-05 12:43:13.0012	2017-11-05 12:43:13.0012	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000095	1000000023	2017-11-05 12:44:12.995632	2017-11-05 12:44:12.995632	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000096	1000000023	2017-11-05 12:45:13.032066	2017-11-05 12:45:13.032066	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000097	1000000023	2017-11-05 12:46:13.110502	2017-11-05 12:46:13.110502	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000098	1000000023	2017-11-05 12:47:13.04193	2017-11-05 12:47:13.04193	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000099	1000000023	2017-11-05 12:48:13.01036	2017-11-05 12:48:13.01036	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000100	1000000023	2017-11-05 12:49:13.368812	2017-11-05 12:49:13.368812	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000101	1000000023	2017-11-05 12:50:13.054226	2017-11-05 12:50:13.054226	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000102	1000000023	2017-11-05 12:51:13.063658	2017-11-05 12:51:13.063658	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000103	1000000023	2017-11-05 12:52:13.140095	2017-11-05 12:52:13.140095	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000104	1000000023	2017-11-05 12:53:13.230532	2017-11-05 12:53:13.230532	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000105	1000000023	2017-11-05 12:54:13.204962	2017-11-05 12:54:13.204962	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000106	1000000023	2017-11-05 12:55:13.232395	2017-11-05 12:55:13.232395	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000107	1000000023	2017-11-05 12:56:13.221826	2017-11-05 12:56:13.221826	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000108	1000000023	2017-11-05 12:57:13.301263	2017-11-05 12:57:13.301263	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000109	1000000023	2017-11-05 12:58:13.231691	2017-11-05 12:58:13.231691	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000110	1000000023	2017-11-05 12:59:13.261124	2017-11-05 12:59:13.261124	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000111	1000000023	2017-11-05 13:00:13.386563	2017-11-05 13:00:13.386563	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000112	1000000023	2017-11-05 13:01:13.331992	2017-11-05 13:01:13.331992	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000113	1000000023	2017-11-05 13:02:13.250419	2017-11-05 13:02:13.250419	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000114	1000000023	2017-11-05 13:03:13.448862	2017-11-05 13:03:13.448862	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000115	1000000023	2017-11-05 13:04:13.427293	2017-11-05 13:04:13.427293	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000116	1000000023	2017-11-05 13:05:13.376722	2017-11-05 13:05:13.376722	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000117	1000000023	2017-11-05 13:06:13.470159	2017-11-05 13:06:13.470159	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000118	1000000023	2017-11-05 13:07:13.376585	2017-11-05 13:07:13.376585	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000119	1000000023	2017-11-05 13:08:13.465022	2017-11-05 13:08:13.465022	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000120	1000000023	2017-11-05 13:09:13.499456	2017-11-05 13:09:13.499456	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000121	1000000023	2017-11-05 13:10:13.591893	2017-11-05 13:10:13.591893	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000122	1000000023	2017-11-05 13:11:13.534321	2017-11-05 13:11:13.534321	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000123	1000000023	2017-11-05 13:12:13.461749	2017-11-05 13:12:13.461749	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000124	1000000023	2017-11-05 13:13:13.605189	2017-11-05 13:13:13.605189	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000125	1000000023	2017-11-05 13:14:13.683625	2017-11-05 13:14:13.683625	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000126	1000000023	2017-11-05 13:15:13.656056	2017-11-05 13:15:13.656056	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000127	1000000023	2017-11-05 13:16:13.557482	2017-11-05 13:16:13.557482	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000128	1000000023	2017-11-05 13:17:13.702922	2017-11-05 13:17:13.702922	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000129	1000000023	2017-11-05 13:18:13.669352	2017-11-05 13:18:13.669352	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000130	1000000023	2017-11-05 13:19:13.670784	2017-11-05 13:19:13.670784	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000131	1000000023	2017-11-05 13:20:13.766221	2017-11-05 13:20:13.766221	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000132	1000000023	2017-11-05 13:21:13.675648	2017-11-05 13:21:13.675648	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000133	1000000023	2017-11-05 13:22:13.762084	2017-11-05 13:22:13.762084	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000134	1000000023	2017-11-05 13:23:13.819519	2017-11-05 13:23:13.819519	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000135	1000000023	2017-11-05 13:24:13.722946	2017-11-05 13:24:13.722946	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000136	1000000023	2017-11-05 13:25:13.77438	2017-11-05 13:25:13.77438	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000137	1000000023	2017-11-05 13:26:13.803814	2017-11-05 13:26:13.803814	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000138	1000000023	2017-11-05 13:27:13.789245	2017-11-05 13:27:13.789245	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000139	1000000023	2017-11-05 13:28:13.84768	2017-11-05 13:28:13.84768	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000140	1000000023	2017-11-05 17:16:27.265217	2017-11-05 17:16:27.265217	null	null	null	null	null	null	null
1000000141	1000000023	2017-11-05 17:16:32.580521	2017-11-05 17:16:32.580521	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000142	1000000023	2017-11-05 17:17:32.463946	2017-11-05 17:17:32.463946	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000143	1000000023	2017-11-05 17:18:32.407375	2017-11-05 17:18:32.407375	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000144	1000000023	2017-11-05 17:19:32.619818	2017-11-05 17:19:32.619818	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000145	1000000023	2017-11-05 17:20:32.733257	2017-11-05 17:20:32.733257	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000146	1000000023	2017-11-05 17:21:32.668685	2017-11-05 17:21:32.668685	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000147	1000000023	2017-11-05 17:22:32.796124	2017-11-05 17:22:32.796124	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000148	1000000023	2017-11-05 17:23:32.769554	2017-11-05 17:23:32.769554	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000149	1000000023	2017-11-05 17:24:32.931995	2017-11-05 17:24:32.931995	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000150	1000000023	2017-11-05 17:25:32.869424	2017-11-05 17:25:32.869424	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000151	1000000023	2017-11-05 17:26:33.090868	2017-11-05 17:26:33.090868	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000152	1000000023	2017-11-05 17:27:32.957292	2017-11-05 17:27:32.957292	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000153	1000000023	2017-11-05 17:28:32.838717	2017-11-05 17:28:32.838717	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000154	1000000023	2017-11-05 17:29:32.839149	2017-11-05 17:29:32.839149	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000155	1000000023	2017-11-05 17:30:32.889584	2017-11-05 17:30:32.889584	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000156	1000000023	2017-11-05 17:31:32.910017	2017-11-05 17:31:32.910017	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000157	1000000023	2017-11-05 17:32:33.076458	2017-11-05 17:32:33.076458	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000158	1000000023	2017-11-05 17:33:33.022887	2017-11-05 17:33:33.022887	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000159	1000000023	2017-11-05 17:34:32.973316	2017-11-05 17:34:32.973316	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000160	1000000023	2017-11-05 17:35:32.973748	2017-11-05 17:35:32.973748	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000161	1000000023	2017-11-05 17:36:32.944178	2017-11-05 17:36:32.944178	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000162	1000000023	2017-11-05 17:37:32.938609	2017-11-05 17:37:32.938609	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000163	1000000023	2017-11-05 17:38:33.079049	2017-11-05 17:38:33.079049	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000164	1000000023	2017-11-05 17:39:32.979475	2017-11-05 17:39:32.979475	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000165	1000000023	2017-11-05 17:40:33.249922	2017-11-05 17:40:33.249922	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000166	1000000023	2017-11-05 17:41:33.366361	2017-11-05 17:41:33.366361	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000167	1000000023	2017-11-05 17:42:33.156781	2017-11-05 17:42:33.156781	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000168	1000000023	2017-11-05 17:43:33.932257	2017-11-05 17:43:33.932257	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000169	1000000023	2017-11-05 17:44:33.162645	2017-11-05 17:44:33.162645	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000170	1000000023	2017-11-05 17:45:33.124074	2017-11-05 17:45:33.124074	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000171	1000000023	2017-11-05 17:46:33.446524	2017-11-05 17:46:33.446524	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000172	1000000023	2017-11-05 17:47:33.301948	2017-11-05 17:47:33.301948	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000173	1000000023	2017-11-05 17:48:33.435387	2017-11-05 17:48:33.435387	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000174	1000000023	2017-11-05 17:49:33.349814	2017-11-05 17:49:33.349814	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000175	1000000023	2017-11-05 17:50:33.571259	2017-11-05 17:50:33.571259	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000176	1000000023	2017-11-05 17:51:33.329677	2017-11-05 17:51:33.329677	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000177	1000000023	2017-11-05 17:52:33.598124	2017-11-05 17:52:33.598124	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000178	1000000023	2017-11-05 17:54:08.055527	2017-11-05 17:54:08.055527	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000179	1000000023	2017-11-05 17:55:08.119962	2017-11-05 17:55:08.119962	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000180	1000000023	2017-11-05 17:56:08.100393	2017-11-05 17:56:08.100393	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000181	1000000023	2017-11-05 17:57:08.324837	2017-11-05 17:57:08.324837	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000182	1000000023	2017-11-05 17:58:08.193262	2017-11-05 17:58:08.193262	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000183	1000000023	2017-11-05 17:59:08.13969	2017-11-05 17:59:08.13969	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000184	1000000023	2017-11-05 18:00:08.27713	2017-11-05 18:00:08.27713	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000185	1000000023	2017-11-05 18:01:08.315564	2017-11-05 18:01:08.315564	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000186	1000000023	2017-11-05 18:02:08.264993	2017-11-05 18:02:08.264993	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000187	1000000023	2017-11-05 18:03:08.202421	2017-11-05 18:03:08.202421	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000188	1000000023	2017-11-05 18:04:08.244855	2017-11-05 18:04:08.244855	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000189	1000000023	2017-11-05 18:05:08.420297	2017-11-05 18:05:08.420297	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000190	1000000023	2017-11-05 18:06:08.650742	2017-11-05 18:06:08.650742	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000191	1000000023	2017-11-05 18:07:08.283153	2017-11-05 18:07:08.283153	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000192	1000000023	2017-11-05 18:08:08.309586	2017-11-05 18:08:08.309586	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000193	1000000023	2017-11-05 18:09:08.468027	2017-11-05 18:09:08.468027	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000194	1000000023	2017-11-05 18:10:08.434457	2017-11-05 18:10:08.434457	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000195	1000000023	2017-11-05 18:11:08.578897	2017-11-05 18:11:08.578897	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000196	1000000023	2017-11-05 18:12:08.59633	2017-11-05 18:12:08.59633	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000197	1000000020	2017-11-26 21:53:43.589013	2017-11-26 21:53:43.589013	null	null	null	null	null	null	null
1000000198	1000000020	2017-11-26 22:00:20.444712	2017-11-26 22:00:20.444712	null	null	null	null	null	null	null
1000000199	1000000020	2017-11-26 22:01:20.21713	2017-11-26 22:01:20.21713	null	null	null	null	null	null	null
1000000200	1000000020	2017-11-26 22:02:20.100556	2017-11-26 22:02:20.100556	null	null	null	null	null	null	null
1000000201	1000000020	2017-11-26 22:03:20.453008	2017-11-26 22:03:20.453008	null	null	null	null	null	null	null
1000000202	1000000020	2017-11-26 22:04:20.262428	2017-11-26 22:04:20.262428	null	null	null	null	null	null	null
1000000203	1000000020	2017-11-26 22:05:20.174855	2017-11-26 22:05:20.174855	null	null	null	null	null	null	null
1000000204	1000000020	2017-11-26 22:06:20.214289	2017-11-26 22:06:20.214289	null	null	null	null	null	null	null
1000000205	1000000020	2017-11-26 22:07:20.18772	2017-11-26 22:07:20.18772	null	null	null	null	null	null	null
1000000206	1000000020	2017-11-26 22:08:20.328159	2017-11-26 22:08:20.328159	null	null	null	null	null	null	null
1000000207	1000000020	2017-11-26 22:09:20.346592	2017-11-26 22:09:20.346592	null	null	null	null	null	null	null
1000000208	1000000020	2017-11-26 22:10:20.410028	2017-11-26 22:10:20.410028	null	null	null	null	null	null	null
1000000209	1000000020	2017-11-26 22:11:44.006809	2017-11-26 22:11:44.006809	null	null	null	null	null	null	null
1000000210	1000000020	2017-11-26 22:12:43.685223	2017-11-26 22:12:43.685223	null	null	null	null	null	null	null
1000000211	1000000020	2017-11-26 22:13:43.474642	2017-11-26 22:13:43.474642	null	null	null	null	null	null	null
1000000212	1000000020	2017-11-26 22:14:43.421071	2017-11-26 22:14:43.421071	null	null	null	null	null	null	null
1000000213	1000000020	2017-11-26 22:15:43.455505	2017-11-26 22:15:43.455505	null	null	null	null	null	null	null
1000000214	1000000020	2017-11-26 22:16:43.458937	2017-11-26 22:16:43.458937	null	null	null	null	null	null	null
1000000215	1000000020	2017-11-26 22:17:43.443368	2017-11-26 22:17:43.443368	null	null	null	null	null	null	null
1000000216	1000000020	2017-11-26 22:18:43.599808	2017-11-26 22:18:43.599808	null	null	null	null	null	null	null
1000000217	1000000020	2017-11-26 22:19:43.59724	2017-11-26 22:19:43.59724	null	null	null	null	null	null	null
1000000218	1000000020	2017-11-26 22:20:43.443663	2017-11-26 22:20:43.443663	null	null	null	null	null	null	null
1000000219	1000000020	2017-11-26 22:21:43.984126	2017-11-26 22:21:43.984126	null	null	null	null	null	null	null
1000000220	1000000020	2017-11-26 22:22:43.576534	2017-11-26 22:22:43.576534	null	null	null	null	null	null	null
1000000221	1000000020	2017-11-26 22:23:43.533964	2017-11-26 22:23:43.533964	null	null	null	null	null	null	null
1000000222	1000000020	2017-11-26 22:24:43.645402	2017-11-26 22:24:43.645402	null	null	null	null	null	null	null
1000000223	1000000020	2017-11-26 22:25:43.74884	2017-11-26 22:25:43.74884	null	null	null	null	null	null	null
1000000224	1000000020	2017-11-26 22:26:43.857278	2017-11-26 22:26:43.857278	null	null	null	null	null	null	null
1000000225	1000000020	2017-11-26 22:27:43.561693	2017-11-26 22:27:43.561693	null	null	null	null	null	null	null
1000000226	1000000020	2017-11-26 22:28:43.720133	2017-11-26 22:28:43.720133	null	null	null	null	null	null	null
1000000227	1000000020	2017-11-26 22:29:43.682563	2017-11-26 22:29:43.682563	null	null	null	null	null	null	null
1000000228	1000000020	2017-11-26 22:30:43.695996	2017-11-26 22:30:43.695996	null	null	null	null	null	null	null
1000000229	1000000020	2017-11-26 22:31:43.874438	2017-11-26 22:31:43.874438	null	null	null	null	null	null	null
1000000230	1000000020	2017-11-26 22:32:43.808866	2017-11-26 22:32:43.808866	null	null	null	null	null	null	null
1000000231	1000000020	2017-11-26 22:33:44.191319	2017-11-26 22:33:44.191319	null	null	null	null	null	null	null
1000000232	1000000020	2017-11-26 22:34:43.81373	2017-11-26 22:34:43.81373	null	null	null	null	null	null	null
1000000233	1000000020	2017-11-26 22:35:44.534203	2017-11-26 22:35:44.534203	null	null	null	null	null	null	null
1000000234	1000000020	2017-11-26 22:36:44.071608	2017-11-26 22:36:44.071608	null	null	null	null	null	null	null
1000000235	1000000020	2017-11-26 22:37:44.08004	2017-11-26 22:37:44.08004	null	null	null	null	null	null	null
1000000236	1000000020	2017-11-27 02:54:11.31414	2017-11-27 02:54:11.31414	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000237	1000000020	2017-11-27 02:55:11.390576	2017-11-27 02:55:11.390576	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000238	1000000020	2017-11-27 02:56:11.357006	2017-11-27 02:56:11.357006	GR	Greece	Chalandri	North Athens	Attica	Kosta Varnali 35A	152 33
1000000239	1000000020	2017-11-27 02:57:11.300434	2017-11-27 02:57:11.300434	GR	Greece	Chalandri	North Athens	Attica	Kosta Varnali 35A	152 33
1000000240	1000000020	2017-11-27 02:58:11.352869	2017-11-27 02:58:11.352869	GR	Greece	Chalandri	North Athens	Attica	Kosta Varnali 35A	152 33
1000000241	1000000020	2017-11-27 02:59:11.327299	2017-11-27 02:59:11.327299	null	null	null	null	null	null	null
1000000242	1000000020	2017-11-27 03:00:11.434737	2017-11-27 03:00:11.434737	GR	Greece	Attica	null	Attica	Aspropyrgos	null
1000000243	1000000020	2017-11-27 17:32:43.336508	2017-11-27 17:32:43.336508	GR	Greece	Attica	null	Attica	Aspropyrgos	null
1000000244	1000000020	2017-11-27 17:34:37.943063	2017-11-27 17:34:37.943063	null	null	null	null	null	null	null
1000000245	1000000020	2017-11-27 17:35:33.276228	2017-11-27 17:35:33.276228	GR	Greece	Attica	null	Attica	Aspropyrgos	null
1000000246	1000000020	2017-11-27 17:36:33.737687	2017-11-27 17:36:33.737687	GR	Greece	Attica	null	Attica	Aspropyrgos	null
1000000247	1000000020	2017-11-27 17:37:33.353096	2017-11-27 17:37:33.353096	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000248	1000000020	2017-11-27 17:38:33.294525	2017-11-27 17:38:33.294525	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000249	1000000020	2017-11-27 17:39:33.308957	2017-11-27 17:39:33.308957	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000250	1000000020	2017-11-27 17:40:33.342391	2017-11-27 17:40:33.342391	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000251	1000000020	2017-11-27 17:41:33.567836	2017-11-27 17:41:33.567836	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000252	1000000020	2017-11-27 17:42:33.354255	2017-11-27 17:42:33.354255	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000253	1000000020	2017-11-27 17:43:33.354687	2017-11-27 17:43:33.354687	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000254	1000000020	2017-11-27 17:44:33.37912	2017-11-27 17:44:33.37912	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000255	1000000020	2017-11-27 17:45:33.432555	2017-11-27 17:45:33.432555	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000256	1000000020	2017-11-29 23:31:03.031242	2017-11-29 23:31:03.031242	null	null	null	null	null	null	null
1000000257	1000000020	2017-11-29 23:32:02.983855	2017-11-29 23:32:02.983855	null	null	null	null	null	null	null
1000000258	1000000020	2017-11-29 23:33:03.012478	2017-11-29 23:33:03.012478	null	null	null	null	null	null	null
1000000259	1000000020	2017-11-29 23:33:59.047093	2017-11-29 23:33:59.047093	null	null	null	null	null	null	null
1000000260	1000000020	2017-11-29 23:35:00.536402	2017-11-29 23:35:00.536402	null	null	null	null	null	null	null
1000000261	1000000020	2017-11-29 23:36:19.068874	2017-11-29 23:36:19.068874	null	null	null	null	null	null	null
1000000262	1000000020	2017-11-29 23:36:59.060952	2017-11-29 23:36:59.060952	null	null	null	null	null	null	null
1000000263	1000000020	2017-11-29 23:39:20.306388	2017-11-29 23:39:20.306388	null	null	null	null	null	null	null
1000000264	1000000020	2017-11-29 23:41:54.184428	2017-11-29 23:41:54.184428	null	null	null	null	null	null	null
1000000265	1000000020	2017-11-29 23:42:37.833471	2017-11-29 23:42:37.833471	null	null	null	null	null	null	null
1000000266	1000000020	2017-11-29 23:43:54.286679	2017-11-29 23:43:54.286679	null	null	null	null	null	null	null
1000000267	1000000020	2017-11-29 23:44:34.923339	2017-11-29 23:44:34.923339	null	null	null	null	null	null	null
1000000268	1000000020	2017-11-29 23:47:00.129778	2017-11-29 23:47:00.129778	GR	Greece	Kalamata	Peloponnese	Peloponnisos Dytiki Ellada ke Ionio	Stadiou 4-18, Kalamata 241 00, Greece	241 00
1000000269	1000000020	2017-11-29 23:48:44.056475	2017-11-29 23:48:44.056475	GR	Greece	Kalamata	Peloponnese	Peloponnisos Dytiki Ellada ke Ionio	Athinon 34, Kalamata 241 00, Greece	241 00
1000000270	1000000020	2017-11-29 23:49:06.820866	2017-11-29 23:49:06.820866	GR	Greece	Kalamata	Peloponnese	Peloponnisos Dytiki Ellada ke Ionio	Athinon 95, Kalamata 241 00, Greece	241 00
1000000271	1000000020	2017-11-29 23:50:02.13339	2017-11-29 23:50:02.13339	GR	Greece	Kalamata	Peloponnese	Peloponnisos Dytiki Ellada ke Ionio	Athinon 95, Kalamata 241 00, Greece	241 00
1000000272	1000000020	2017-11-29 23:51:27.208693	2017-11-29 23:51:27.208693	GR	Greece	Kalamata	Peloponnese	Peloponnisos Dytiki Ellada ke Ionio	Athinon 95, Kalamata 241 00, Greece	241 00
1000000273	1000000020	2017-11-29 23:52:03.831844	2017-11-29 23:52:03.831844	GR	Greece	Kalamata	Peloponnese	Peloponnisos Dytiki Ellada ke Ionio	Athinon 95, Kalamata 241 00, Greece	241 00
1000000274	1000000020	2017-12-02 14:34:04.642786	2017-12-02 14:34:04.642786	null	null	null	null	null	null	null
1000000275	1000000020	2017-12-02 14:36:12.055466	2017-12-02 14:36:12.055466	null	null	null	null	null	null	null
1000000276	1000000020	2017-12-02 15:40:10.235853	2017-12-02 15:40:10.235853	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000277	1000000020	2017-12-02 15:41:48.452825	2017-12-02 15:41:48.452825	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000278	1000000020	2017-12-02 15:42:29.329515	2017-12-02 15:42:29.329515	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000279	1000000020	2017-12-02 15:43:08.407478	2017-12-02 15:43:08.407478	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000280	1000000020	2017-12-02 15:49:50.311013	2017-12-02 15:49:50.311013	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000281	1000000020	2017-12-02 16:32:16.864884	2017-12-02 16:32:16.864884	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000282	1000000020	2017-12-02 16:33:13.920129	2017-12-02 16:33:13.920129	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000283	1000000020	2017-12-02 16:34:46.362868	2017-12-02 16:34:46.362868	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000284	1000000020	2017-12-02 16:35:13.912867	2017-12-02 16:35:13.912867	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000285	1000000020	2017-12-02 16:36:13.933988	2017-12-02 16:36:13.933988	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000286	1000000020	2017-12-02 16:37:26.363686	2017-12-02 16:37:26.363686	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000287	1000000020	2017-12-02 16:38:13.911223	2017-12-02 16:38:13.911223	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000288	1000000020	2017-12-02 16:39:13.909342	2017-12-02 16:39:13.909342	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000289	1000000020	2017-12-02 16:40:13.97947	2017-12-02 16:40:13.97947	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000290	1000000020	2017-12-02 16:41:13.918081	2017-12-02 16:41:13.918081	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000291	1000000020	2017-12-02 16:42:53.926281	2017-12-02 16:42:53.926281	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000292	1000000020	2017-12-02 16:43:13.947323	2017-12-02 16:43:13.947323	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000293	1000000020	2017-12-02 16:44:13.957443	2017-12-02 16:44:13.957443	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000294	1000000020	2017-12-02 16:45:33.934599	2017-12-02 16:45:33.934599	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000295	1000000020	2017-12-02 16:46:13.912676	2017-12-02 16:46:13.912676	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000296	1000000020	2017-12-02 16:47:15.000433	2017-12-02 16:47:15.000433	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000297	1000000020	2017-12-02 16:48:13.96192	2017-12-02 16:48:13.96192	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000298	1000000020	2017-12-02 16:49:13.928535	2017-12-02 16:49:13.928535	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000299	1000000029	2017-12-02 16:52:15.302066	2017-12-02 16:52:15.302066	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000300	1000000029	2017-12-02 16:53:15.289684	2017-12-02 16:53:15.289684	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000301	1000000029	2017-12-02 16:54:53.648174	2017-12-02 16:54:53.648174	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000302	1000000029	2017-12-02 16:55:15.285421	2017-12-02 16:55:15.285421	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000303	1000000029	2017-12-02 16:56:15.271539	2017-12-02 16:56:15.271539	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000304	1000000029	2017-12-02 16:57:33.621988	2017-12-02 16:57:33.621988	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000305	1000000029	2017-12-02 16:58:15.278278	2017-12-02 16:58:15.278278	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000306	1000000029	2017-12-02 16:59:15.273396	2017-12-02 16:59:15.273396	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000307	1000000029	2017-12-02 17:00:15.86109	2017-12-02 17:00:15.86109	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000308	1000000029	2017-12-02 17:01:15.274634	2017-12-02 17:01:15.274634	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000309	1000000029	2017-12-02 17:02:15.279254	2017-12-02 17:02:15.279254	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000310	1000000029	2017-12-02 17:03:15.266371	2017-12-02 17:03:15.266371	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000311	1000000029	2017-12-02 17:40:24.162798	2017-12-02 17:40:24.162798	null	null	null	null	null	null	null
1000000312	1000000029	2017-12-02 17:41:20.40594	2017-12-02 17:41:20.40594	null	null	null	null	null	null	null
1000000313	1000000029	2017-12-02 17:42:25.546711	2017-12-02 17:42:25.546711	null	null	null	null	null	null	null
1000000314	1000000029	2017-12-02 17:43:20.358672	2017-12-02 17:43:20.358672	null	null	null	null	null	null	null
1000000315	1000000029	2017-12-02 17:44:20.408297	2017-12-02 17:44:20.408297	null	null	null	null	null	null	null
1000000316	1000000029	2017-12-02 17:45:20.382413	2017-12-02 17:45:20.382413	null	null	null	null	null	null	null
1000000317	1000000030	2017-12-03 18:57:11.100846	2017-12-03 18:57:11.100846	null	null	null	null	null	null	null
1000000318	1000000030	2017-12-10 15:29:41.873298	2017-12-10 15:29:41.873298	null	null	null	null	null	null	null
1000000319	1000000030	2017-12-10 18:53:13.383029	2017-12-10 18:53:13.383029	null	null	null	null	null	null	null
\.


--
-- Name: i_location_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('i_location_id_seq', 1000000319, true);


--
-- Data for Name: i_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY i_user (i_user_id, i_creation_date, i_last_update_date, i_first_name, i_last_name, i_mobile_number, i_username, i_password, i_email_address, i_register_type) FROM stdin;
1000000020	2017-10-12 19:55:19.392707	2017-10-12 19:55:19.392707	Ioannis	Kozompolis	6971903121	giannis		g.kozompolis@gmail.com	\N
1000000021	2017-10-12 19:57:45.490063	2017-10-12 19:57:45.490063	Ioannis 	Kozompolis	6971903121	giannis2		g.kozompolis@gmail.com	\N
1000000022	2017-10-12 20:55:23.476849	2017-10-12 20:55:23.476849	aek	ole	6971903121	aek		giannis1990@gmail.com	\N
1000000023	2017-10-12 21:08:52.548125	2017-10-12 21:08:52.548125	giannis4			giannis4			\N
1000000024	2017-10-14 21:22:11.872753	2017-10-14 21:22:11.872753	giannis5			giannis5			\N
1000000025	2017-10-14 21:27:15.417114	2017-10-14 21:27:15.417114	giannis6			giannis6			\N
1000000026	2017-11-25 21:04:47.794319	2017-11-25 21:04:47.794319	Ioannis	Kozompolis	6971903121	giannis2669		g.kozompolis@gmail.com	\N
1000000027	2017-12-02 16:22:39.382553	2017-12-02 16:22:39.382553	Ioannnis	Kozompolis	6971903121	kozo		g.kozompolis@gmail.com	\N
1000000028	2017-12-02 16:30:33.483257	2017-12-02 16:30:33.483257				kozompolis			\N
1000000029	2017-12-02 16:52:05.125274	2017-12-02 16:52:05.125274				testuser1			\N
1000000030	2017-12-03 17:55:53.547356	2017-12-03 17:55:53.547356	John	Kozo		1127478420719730		g.kozompolis@gmail.com	\N
\.


--
-- Name: i_user_i_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('i_user_i_user_id_seq', 1000000030, true);


--
-- Name: i_work_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('i_work_id_seq', 1000000023, true);


--
-- Data for Name: i_work_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY i_work_info (i_work_id, i_user_id, i_creation_date, i_last_update_date, i_work_employer, i_work_position) FROM stdin;
1000000008	1000000020	2017-12-09 18:07:12.183065	2017-12-09 18:07:12.183065	Almasport	Sales
1000000009	1000000020	2017-12-09 18:13:25.564421	2017-12-09 18:13:25.564421	\N	\N
1000000010	1000000030	2017-12-10 14:28:51.964701	2017-12-10 14:28:51.964701	Velti	QA Engineer
1000000011	1000000030	2017-12-10 15:26:23.561616	2017-12-10 15:26:23.561616	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000012	1000000030	2017-12-10 15:31:11.868226	2017-12-10 15:31:11.868226	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000013	1000000030	2017-12-10 15:32:59.937949	2017-12-10 15:32:59.937949	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000014	1000000030	2017-12-10 15:34:53.439362	2017-12-10 15:34:53.439362	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000015	1000000030	2017-12-10 16:19:59.583499	2017-12-10 16:19:59.583499	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000016	1000000030	2017-12-10 16:21:56.754378	2017-12-10 16:21:56.754378	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000017	1000000030	2017-12-10 16:25:51.281659	2017-12-10 16:25:51.281659	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000018	1000000030	2017-12-10 18:58:47.20742	2017-12-10 18:58:47.20742	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000019	1000000030	2017-12-10 18:58:47.239924	2017-12-10 18:58:47.239924	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000020	1000000030	2017-12-10 19:03:49.897356	2017-12-10 19:03:49.897356	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000021	1000000030	2017-12-10 19:20:44.539699	2017-12-10 19:20:44.539699	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000022	1000000030	2017-12-10 19:24:38.35189	2017-12-10 19:24:38.35189	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000023	1000000030	2017-12-10 19:27:42.773308	2017-12-10 19:27:42.773308	Velti S.A.	Quality Assurance Engineer (QA Engineer)
\.


--
-- Name: i_education_info i_education_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_education_info
    ADD CONSTRAINT i_education_info_pkey PRIMARY KEY (i_education_id);


--
-- Name: i_fb_books i_fb_books_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_books
    ADD CONSTRAINT i_fb_books_pkey PRIMARY KEY (i_fb_books_id);


--
-- Name: i_fb_events i_fb_events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_events
    ADD CONSTRAINT i_fb_events_pkey PRIMARY KEY (i_fb_events_id);


--
-- Name: i_fb_favorite_teams i_fb_favorite_team_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_favorite_teams
    ADD CONSTRAINT i_fb_favorite_team_pkey PRIMARY KEY (i_fb_favorite_teams_id);


--
-- Name: i_fb_music i_fb_music_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_music
    ADD CONSTRAINT i_fb_music_pkey PRIMARY KEY (i_fb_music_id);


--
-- Name: i_interest_fb_pages i_interest_pages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_interest_fb_pages
    ADD CONSTRAINT i_interest_pages_pkey PRIMARY KEY (i_interest_pages_id);


--
-- Name: i_location i_location_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_location
    ADD CONSTRAINT i_location_pkey PRIMARY KEY (i_location_id);


--
-- Name: i_user i_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_user
    ADD CONSTRAINT i_user_pkey PRIMARY KEY (i_user_id);


--
-- Name: i_work_info i_work_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_work_info
    ADD CONSTRAINT i_work_info_pkey PRIMARY KEY (i_work_id);


--
-- Name: fki_E; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_E" ON i_education_info USING btree (i_user_id);


--
-- Name: fki_F; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_F" ON i_interest_fb_pages USING btree (i_user_id);


--
-- Name: fki_G; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_G" ON i_fb_events USING btree (i_user_id);


--
-- Name: fki_H; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_H" ON i_fb_events USING btree (i_user_id);


--
-- Name: fki_I; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_I" ON i_fb_events USING btree (i_user_id);


--
-- Name: fki_J; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_J" ON i_fb_favorite_teams USING btree (i_user_id);


--
-- Name: fki_i_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_i_user_id ON i_work_info USING btree (i_user_id);


--
-- Name: i_education_info Update_Data; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "Update_Data" BEFORE UPDATE ON i_education_info FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- Name: i_interest_fb_pages Update_Data; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "Update_Data" BEFORE UPDATE ON i_interest_fb_pages FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- Name: i_fb_events Update_Data; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "Update_Data" BEFORE UPDATE ON i_fb_events FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- Name: i_fb_books Update_Data; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "Update_Data" BEFORE UPDATE ON i_fb_books FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- Name: i_fb_music Update_Data; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "Update_Data" BEFORE UPDATE ON i_fb_music FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- Name: i_fb_favorite_teams Update_Data; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "Update_Data" BEFORE UPDATE ON i_fb_favorite_teams FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- Name: i_location Update_last_update_date; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "Update_last_update_date" BEFORE UPDATE ON i_location FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- Name: i_user set_timestamp; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER set_timestamp BEFORE UPDATE ON i_user FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- Name: i_work_info set_timestamp; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER set_timestamp BEFORE UPDATE ON i_work_info FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- Name: i_location User ID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_location
    ADD CONSTRAINT "User ID" FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id);


--
-- Name: i_education_info User_id_in_education_info; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_education_info
    ADD CONSTRAINT "User_id_in_education_info" FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: i_fb_books User_id_in_i_fb_books; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_books
    ADD CONSTRAINT "User_id_in_i_fb_books" FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- Name: i_fb_events User_id_in_i_fb_events; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_events
    ADD CONSTRAINT "User_id_in_i_fb_events" FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- Name: i_fb_favorite_teams User_id_in_i_fb_favorite_teams; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_favorite_teams
    ADD CONSTRAINT "User_id_in_i_fb_favorite_teams" FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- Name: i_fb_music User_id_in_i_fb_music; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_music
    ADD CONSTRAINT "User_id_in_i_fb_music" FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- Name: i_interest_fb_pages User_id_in_interest_pages; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_interest_fb_pages
    ADD CONSTRAINT "User_id_in_interest_pages" FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- Name: i_education_info fkck4ugidmocgo1ugp68cqndwgc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_education_info
    ADD CONSTRAINT fkck4ugidmocgo1ugp68cqndwgc FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id);


--
-- Name: i_work_info fkcoqbcg27jlgcyjfnh4n65uehx; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_work_info
    ADD CONSTRAINT fkcoqbcg27jlgcyjfnh4n65uehx FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id);


--
-- Name: i_location fkg0rrrwit513pw13pr3n3o2u4e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_location
    ADD CONSTRAINT fkg0rrrwit513pw13pr3n3o2u4e FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id);


--
-- Name: i_work_info i_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_work_info
    ADD CONSTRAINT i_user_id FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: i_education_info i_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_education_info
    ADD CONSTRAINT i_user_id FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: i_interest_fb_pages i_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_interest_fb_pages
    ADD CONSTRAINT i_user_id FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- Name: i_fb_events i_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_events
    ADD CONSTRAINT i_user_id FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- Name: i_fb_books i_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_books
    ADD CONSTRAINT i_user_id FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- Name: i_fb_music i_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_music
    ADD CONSTRAINT i_user_id FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- Name: i_fb_favorite_teams i_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_favorite_teams
    ADD CONSTRAINT i_user_id FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: register_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE register_type AS ENUM (
    'facebook',
    'custom'
);


ALTER TYPE register_type OWNER TO postgres;

--
-- Name: trigger_set_timestamp(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION trigger_set_timestamp() RETURNS trigger
    LANGUAGE plpgsql
    AS $$  
BEGIN  
  NEW.i_last_update_date = NOW();
  RETURN NEW;
END;  
$$;


ALTER FUNCTION public.trigger_set_timestamp() OWNER TO postgres;

--
-- Name: greeting_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE greeting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE greeting_id_seq OWNER TO postgres;

--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hibernate_sequence OWNER TO postgres;

--
-- Name: i_education_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE i_education_id_seq
    START WITH 1000000000
    INCREMENT BY 1
    MINVALUE 1000000000
    MAXVALUE 9999999999999
    CACHE 1;


ALTER TABLE i_education_id_seq OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: i_education_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE i_education_info (
    i_education_id bigint DEFAULT nextval('i_education_id_seq'::regclass) NOT NULL,
    i_user_id bigint NOT NULL,
    i_creation_date timestamp(6) without time zone DEFAULT now(),
    i_last_update_date timestamp(6) without time zone DEFAULT now(),
    i_edu_degree character varying(100),
    i_edu_school character varying(100),
    i_edu_type character varying(100),
    i_edu_year character varying(20)
);


ALTER TABLE i_education_info OWNER TO postgres;

--
-- Name: i_fb_books_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE i_fb_books_id_seq
    START WITH 1000000000
    INCREMENT BY 1
    MINVALUE 1000000000
    MAXVALUE 9999999999999
    CACHE 1;


ALTER TABLE i_fb_books_id_seq OWNER TO postgres;

--
-- Name: i_fb_books; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE i_fb_books (
    i_fb_books_id bigint DEFAULT nextval('i_fb_books_id_seq'::regclass) NOT NULL,
    i_user_id bigint NOT NULL,
    i_creation_date timestamp(6) without time zone DEFAULT now(),
    i_last_update_date timestamp(6) without time zone DEFAULT now(),
    i_book_name character varying(100),
    i_book_description character varying(400)
);


ALTER TABLE i_fb_books OWNER TO postgres;

--
-- Name: i_fb_events_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE i_fb_events_id_seq
    START WITH 1000000000
    INCREMENT BY 1
    MINVALUE 1000000000
    MAXVALUE 999999999999999
    CACHE 1;


ALTER TABLE i_fb_events_id_seq OWNER TO postgres;

--
-- Name: i_fb_events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE i_fb_events (
    i_fb_events_id bigint DEFAULT nextval('i_fb_events_id_seq'::regclass) NOT NULL,
    i_user_id bigint NOT NULL,
    i_creation_date timestamp(6) without time zone DEFAULT now(),
    i_last_update_date timestamp(6) without time zone DEFAULT now(),
    i_event_name character varying(100),
    i_event_description character varying(400),
    i_event_start_date timestamp(6) without time zone
);


ALTER TABLE i_fb_events OWNER TO postgres;

--
-- Name: i_fb_favorite_teams_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE i_fb_favorite_teams_id_seq
    START WITH 1000000000
    INCREMENT BY 1
    MINVALUE 1000000000
    MAXVALUE 9999999999999
    CACHE 1;


ALTER TABLE i_fb_favorite_teams_id_seq OWNER TO postgres;

--
-- Name: i_fb_favorite_teams; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE i_fb_favorite_teams (
    i_fb_favorite_teams_id bigint DEFAULT nextval('i_fb_favorite_teams_id_seq'::regclass) NOT NULL,
    i_user_id bigint NOT NULL,
    i_creation_date timestamp(6) without time zone DEFAULT now(),
    i_last_update_date timestamp(6) without time zone DEFAULT now(),
    i_team_name character varying(100)
);


ALTER TABLE i_fb_favorite_teams OWNER TO postgres;

--
-- Name: i_fb_music_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE i_fb_music_id_seq
    START WITH 1000000000
    INCREMENT BY 1
    MINVALUE 1000000000
    MAXVALUE 9999999999999
    CACHE 1;


ALTER TABLE i_fb_music_id_seq OWNER TO postgres;

--
-- Name: i_fb_music; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE i_fb_music (
    i_fb_music_id bigint DEFAULT nextval('i_fb_music_id_seq'::regclass) NOT NULL,
    i_user_id bigint NOT NULL,
    i_creation_date timestamp(6) without time zone DEFAULT now(),
    i_last_update_date timestamp(6) without time zone DEFAULT now(),
    i_music_title character varying(100)
);


ALTER TABLE i_fb_music OWNER TO postgres;

--
-- Name: i_interest_pages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE i_interest_pages_id_seq
    START WITH 1000000000
    INCREMENT BY 1
    MINVALUE 1000000000
    MAXVALUE 99999999999999
    CACHE 1;


ALTER TABLE i_interest_pages_id_seq OWNER TO postgres;

--
-- Name: i_interest_fb_pages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE i_interest_fb_pages (
    i_interest_pages_id bigint DEFAULT nextval('i_interest_pages_id_seq'::regclass) NOT NULL,
    i_user_id bigint NOT NULL,
    i_creation_date timestamp(6) without time zone DEFAULT now(),
    i_last_update_date timestamp(6) without time zone DEFAULT now(),
    i_page_name character varying(100),
    i_page_description character varying(400)
);


ALTER TABLE i_interest_fb_pages OWNER TO postgres;

--
-- Name: i_location_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE i_location_id_seq
    START WITH 1000000001
    INCREMENT BY 1
    MINVALUE 1000000001
    MAXVALUE 99999999999999
    CACHE 1;


ALTER TABLE i_location_id_seq OWNER TO postgres;

--
-- Name: i_location; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE i_location (
    i_location_id bigint DEFAULT nextval('i_location_id_seq'::regclass) NOT NULL,
    i_user_id bigint NOT NULL,
    i_creation_date timestamp(6) without time zone DEFAULT now(),
    i_last_update_date timestamp(6) without time zone DEFAULT now(),
    i_country_code character varying(5),
    i_country_name character varying(50),
    i_city_name character varying(50),
    i_prefecture character varying(50),
    i_department character varying(50),
    i_street_address character varying(100),
    i_postal_code character varying(10)
);


ALTER TABLE i_location OWNER TO postgres;

--
-- Name: i_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE i_user (
    i_user_id bigint NOT NULL,
    i_creation_date timestamp(6) without time zone DEFAULT now() NOT NULL,
    i_last_update_date timestamp(6) without time zone DEFAULT now() NOT NULL,
    i_first_name character varying(50),
    i_last_name character varying(50),
    i_mobile_number character varying(20),
    i_username character varying(50),
    i_password character varying(50),
    i_email_address character varying(100),
    i_register_type character varying(100)
);


ALTER TABLE i_user OWNER TO postgres;

--
-- Name: i_user_i_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE i_user_i_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE i_user_i_user_id_seq OWNER TO postgres;

--
-- Name: i_user_i_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE i_user_i_user_id_seq OWNED BY i_user.i_user_id;


--
-- Name: i_work_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE i_work_id_seq
    START WITH 1000000000
    INCREMENT BY 1
    MINVALUE 1000000000
    MAXVALUE 999999999999999
    CACHE 1;


ALTER TABLE i_work_id_seq OWNER TO postgres;

--
-- Name: i_work_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE i_work_info (
    i_work_id bigint DEFAULT nextval('i_work_id_seq'::regclass) NOT NULL,
    i_user_id bigint NOT NULL,
    i_creation_date timestamp(6) without time zone DEFAULT now() NOT NULL,
    i_last_update_date timestamp(6) without time zone DEFAULT now(),
    i_work_employer character varying(100),
    i_work_position character varying(100)
);


ALTER TABLE i_work_info OWNER TO postgres;

--
-- Name: i_user i_user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_user ALTER COLUMN i_user_id SET DEFAULT nextval('i_user_i_user_id_seq'::regclass);


--
-- Name: greeting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('greeting_id_seq', 1, false);


--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('hibernate_sequence', 6, true);


--
-- Name: i_education_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('i_education_id_seq', 1000000005, true);


--
-- Data for Name: i_education_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY i_education_info (i_education_id, i_user_id, i_creation_date, i_last_update_date, i_edu_degree, i_edu_school, i_edu_type, i_edu_year) FROM stdin;
1000000003	1000000030	2017-12-10 19:27:42.874321	2017-12-10 19:27:42.874321		Department of Applied Informatics and Multimedia of Crete	College	2012
1000000004	1000000030	2017-12-10 19:27:42.934329	2017-12-10 19:27:42.934329	Advanced Softaware Development Technologies	University of Piraeus	Graduate School	2017
1000000005	1000000020	2017-12-14 17:43:17.307915	2017-12-14 17:43:17.307915	Master	University of Piraeus	IT	2017
\.


--
-- Data for Name: i_fb_books; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY i_fb_books (i_fb_books_id, i_user_id, i_creation_date, i_last_update_date, i_book_name, i_book_description) FROM stdin;
1000000000	1000000020	2017-12-13 17:13:27.565242	2017-12-13 17:13:54.776242	The Secret	The secret book only for adults
1000000001	1000000020	2017-12-14 13:23:58.544692	2017-12-14 13:23:58.544692	Pinocio	Pinocio adventures
\.


--
-- Name: i_fb_books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('i_fb_books_id_seq', 1000000001, true);


--
-- Data for Name: i_fb_events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY i_fb_events (i_fb_events_id, i_user_id, i_creation_date, i_last_update_date, i_event_name, i_event_description, i_event_start_date) FROM stdin;
1000000000	1000000020	2017-12-13 16:46:29.113914	2017-12-13 16:49:20.508051	2nd Marathon Kalamatas	Marathon on Kalamata first time ever	\N
1000000001	1000000020	2017-12-13 16:47:54.9875	2017-12-13 16:49:20.508051	2nd Marathon Kalamatas	Marathon on Kalamata first time ever	2017-12-13 16:47:54.9875
1000000003	1000000020	2017-12-14 17:28:41.17431	2017-12-14 17:28:41.17431	Velti Party	Velti party all the time	\N
1000000004	1000000021	2017-12-14 17:29:01.705363	2017-12-14 17:29:01.705363	Velti Party	Velti party all the time	\N
\.


--
-- Name: i_fb_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('i_fb_events_id_seq', 1000000004, true);


--
-- Data for Name: i_fb_favorite_teams; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY i_fb_favorite_teams (i_fb_favorite_teams_id, i_user_id, i_creation_date, i_last_update_date, i_team_name) FROM stdin;
1000000000	1000000020	2017-12-13 17:50:42.613253	2017-12-13 17:51:24.465438	AEK F.C.
\.


--
-- Name: i_fb_favorite_teams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('i_fb_favorite_teams_id_seq', 1000000000, true);


--
-- Data for Name: i_fb_music; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY i_fb_music (i_fb_music_id, i_user_id, i_creation_date, i_last_update_date, i_music_title) FROM stdin;
1000000000	1000000020	2017-12-13 17:26:30.425242	2017-12-13 17:26:40.697242	Eminem
1000000001	1000000020	2017-12-13 17:27:14.616468	2017-12-13 17:27:14.616468	Secret
\.


--
-- Name: i_fb_music_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('i_fb_music_id_seq', 1000000001, true);


--
-- Data for Name: i_interest_fb_pages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY i_interest_fb_pages (i_interest_pages_id, i_user_id, i_creation_date, i_last_update_date, i_page_name, i_page_description) FROM stdin;
\.


--
-- Name: i_interest_pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('i_interest_pages_id_seq', 1000000003, true);


--
-- Data for Name: i_location; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY i_location (i_location_id, i_user_id, i_creation_date, i_last_update_date, i_country_code, i_country_name, i_city_name, i_prefecture, i_department, i_street_address, i_postal_code) FROM stdin;
1000000002	1000000020	2017-10-29 15:07:49.898223	2017-10-29 15:13:11.877639	GR	Greece	Athens	Attica	Attica	Saronos 4	11143
1000000003	1000000020	2017-10-29 16:48:07.275397	2017-10-29 16:48:07.275397	GR	Greece	Kalamata	Messinia	Peloponissos	loggas 8	24100
1000000005	1000000020	2017-10-29 16:51:42.444704	2017-10-29 16:51:42.444704	GR	Greece	Kalamata	Messinia	Peloponissos	loggas 10	24100
1000000006	1000000020	2017-10-29 22:05:11.732534	2017-10-29 22:05:11.732534	GR	Greece	Kalamata	Messinia	Peloponissos	loggas 10	24100
1000000010	1000000023	2017-10-30 20:31:47.543345	2017-10-30 20:31:47.543345	GR	Greece	Kalamata	Messenia	Peloponnisos Dytiki Ellada ke Ionio	Aristomenous 45	24100
1000000011	1000000023	2017-10-30 20:35:56.798602	2017-10-30 20:35:56.798602	GR	Greece	Kalamata	Messenia	Peloponnisos Dytiki Ellada ke Ionio	Aristomenous 45	241 00
1000000012	1000000023	2017-10-30 20:40:59.183897	2017-10-30 20:40:59.183897	GR	Greece	Kalamata	Messenia	Peloponnisos Dytiki Ellada ke Ionio	Aristomenous 45	241 00
1000000013	1000000023	2017-10-30 22:13:09.887235	2017-10-30 22:13:09.887235	GR	Greece	Kalamata	Messenia	Peloponnisos Dytiki Ellada ke Ionio	Aristomenous 45	241 00
1000000014	1000000023	2017-10-30 22:27:02.560862	2017-10-30 22:27:02.560862	GR	Greece	Kalamata	Messenia	Peloponnisos Dytiki Ellada ke Ionio	Aristomenous 45	241 00
1000000015	1000000023	2017-10-30 22:55:44.872372	2017-10-30 22:55:44.872372	GR	Greece	Filadelfeia-Chalkidona	Central Athens	Attica	Marathonos 8	143 43
1000000016	1000000023	2017-10-30 23:05:47.623848	2017-10-30 23:05:47.623848	GR	Greece	Filadelfeia-Chalkidona	Central Athens	Attica	Anakous 60	143 41
1000000017	1000000023	2017-10-30 23:06:59.639967	2017-10-30 23:06:59.639967	GR	Greece	Pireas	Piraeus	Attica	Praxitelous 238	185 36
1000000018	1000000023	2017-10-30 23:10:34.107233	2017-10-30 23:10:34.107233	GR	Greece	West Mani	Messenia	Peloponnisos Dytiki Ellada ke Ionio	Unnamed Road	241 00
1000000019	1000000023	2017-11-03 00:30:52.691688	2017-11-03 00:30:52.691688	GR	Greece	Athens	Central Athens	Attica	Acharnon 458	111 43
1000000020	1000000023	2017-11-03 00:30:54.545794	2017-11-03 00:30:54.545794	GR	Greece	Athens	Central Athens	Attica	Acharnon 458	111 43
1000000021	1000000023	2017-11-03 00:31:50.367987	2017-11-03 00:31:50.367987	GR	Greece	Athens	Central Athens	Attica	Acharnon 458	111 43
1000000022	1000000023	2017-11-03 00:32:50.325416	2017-11-03 00:32:50.325416	GR	Greece	Athens	Central Athens	Attica	Acharnon 458	111 43
1000000023	1000000023	2017-11-03 00:33:50.36485	2017-11-03 00:33:50.36485	GR	Greece	Athens	Central Athens	Attica	Acharnon 458	111 43
1000000024	1000000023	2017-11-03 00:34:50.398284	2017-11-03 00:34:50.398284	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000025	1000000023	2017-11-03 00:35:50.441718	2017-11-03 00:35:50.441718	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000026	1000000023	2017-11-04 23:30:28.230643	2017-11-04 23:30:28.230643	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000028	1000000023	2017-11-04 23:30:28.236644	2017-11-04 23:30:28.236644	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000027	1000000023	2017-11-04 23:30:28.230643	2017-11-04 23:30:28.230643	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000029	1000000023	2017-11-04 23:30:30.690784	2017-11-04 23:30:30.690784	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000030	1000000023	2017-11-04 23:31:49.311281	2017-11-04 23:31:49.311281	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000031	1000000023	2017-11-04 23:32:52.991923	2017-11-04 23:32:52.991923	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000032	1000000023	2017-11-04 23:33:50.62922	2017-11-04 23:33:50.62922	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000033	1000000023	2017-11-04 23:34:52.52276	2017-11-04 23:34:52.52276	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000034	1000000023	2017-11-04 23:35:54.458302	2017-11-04 23:35:54.458302	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000035	1000000023	2017-11-04 23:35:56.125398	2017-11-04 23:35:56.125398	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000036	1000000023	2017-11-04 23:36:53.727692	2017-11-04 23:36:53.727692	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000037	1000000023	2017-11-04 23:36:53.728692	2017-11-04 23:36:53.728692	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000038	1000000023	2017-11-04 23:37:49.118861	2017-11-04 23:37:49.118861	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000040	1000000023	2017-11-04 23:38:55.993686	2017-11-04 23:38:55.993686	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000039	1000000023	2017-11-04 23:38:55.991685	2017-11-04 23:38:55.991685	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000041	1000000023	2017-11-04 23:40:49.124156	2017-11-04 23:40:49.124156	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000042	1000000023	2017-11-04 23:42:54.790344	2017-11-04 23:42:54.790344	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000043	1000000023	2017-11-04 23:42:54.791344	2017-11-04 23:42:54.791344	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000044	1000000023	2017-11-04 23:44:50.221946	2017-11-04 23:44:50.221946	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000045	1000000023	2017-11-04 23:46:50.57783	2017-11-04 23:46:50.57783	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000046	1000000023	2017-11-04 23:48:49.182614	2017-11-04 23:48:49.182614	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000047	1000000023	2017-11-05 00:38:27.199628	2017-11-05 00:38:27.199628	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000048	1000000023	2017-11-05 02:38:10.608822	2017-11-05 02:38:10.608822	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000049	1000000023	2017-11-05 04:38:18.804108	2017-11-05 04:38:18.804108	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000050	1000000023	2017-11-05 06:38:19.850984	2017-11-05 06:38:19.850984	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000051	1000000023	2017-11-05 08:38:20.844857	2017-11-05 08:38:20.844857	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000052	1000000023	2017-11-05 10:38:22.506769	2017-11-05 10:38:22.506769	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000053	1000000023	2017-11-05 12:02:00.795798	2017-11-05 12:02:00.795798	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000054	1000000023	2017-11-05 12:02:58.915123	2017-11-05 12:02:58.915123	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000055	1000000023	2017-11-05 12:03:58.889553	2017-11-05 12:03:58.889553	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000056	1000000023	2017-11-05 12:04:58.849982	2017-11-05 12:04:58.849982	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000057	1000000023	2017-11-05 12:05:58.931419	2017-11-05 12:05:58.931419	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000058	1000000023	2017-11-05 12:07:12.491626	2017-11-05 12:07:12.491626	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000059	1000000023	2017-11-05 12:08:12.430055	2017-11-05 12:08:12.430055	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000060	1000000023	2017-11-05 12:09:12.404485	2017-11-05 12:09:12.404485	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000061	1000000023	2017-11-05 12:10:12.46392	2017-11-05 12:10:12.46392	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000062	1000000023	2017-11-05 12:11:12.42135	2017-11-05 12:11:12.42135	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000063	1000000023	2017-11-05 12:12:12.507786	2017-11-05 12:12:12.507786	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000064	1000000023	2017-11-05 12:13:12.557221	2017-11-05 12:13:12.557221	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000065	1000000023	2017-11-05 12:14:12.497649	2017-11-05 12:14:12.497649	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000066	1000000023	2017-11-05 12:15:12.458079	2017-11-05 12:15:12.458079	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000067	1000000023	2017-11-05 12:16:12.472511	2017-11-05 12:16:12.472511	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000068	1000000023	2017-11-05 12:17:12.539947	2017-11-05 12:17:12.539947	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000069	1000000023	2017-11-05 12:18:12.491376	2017-11-05 12:18:12.491376	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000070	1000000023	2017-11-05 12:19:12.488808	2017-11-05 12:19:12.488808	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000071	1000000023	2017-11-05 12:20:12.612247	2017-11-05 12:20:12.612247	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000072	1000000023	2017-11-05 12:21:12.63268	2017-11-05 12:21:12.63268	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000073	1000000023	2017-11-05 12:22:12.61011	2017-11-05 12:22:12.61011	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000074	1000000023	2017-11-05 12:23:12.660545	2017-11-05 12:23:12.660545	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000075	1000000023	2017-11-05 12:24:12.583972	2017-11-05 12:24:12.583972	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000076	1000000023	2017-11-05 12:25:12.542402	2017-11-05 12:25:12.542402	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000077	1000000023	2017-11-05 12:26:12.676841	2017-11-05 12:26:12.676841	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000078	1000000023	2017-11-05 12:27:12.730276	2017-11-05 12:27:12.730276	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000079	1000000023	2017-11-05 12:28:12.719707	2017-11-05 12:28:12.719707	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000080	1000000023	2017-11-05 12:29:12.750141	2017-11-05 12:29:12.750141	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000081	1000000023	2017-11-05 12:30:12.659567	2017-11-05 12:30:12.659567	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000082	1000000023	2017-11-05 12:31:12.810008	2017-11-05 12:31:12.810008	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000083	1000000023	2017-11-05 12:32:12.728435	2017-11-05 12:32:12.728435	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000084	1000000023	2017-11-05 12:33:12.78087	2017-11-05 12:33:12.78087	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000085	1000000023	2017-11-05 12:34:12.798303	2017-11-05 12:34:12.798303	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000086	1000000023	2017-11-05 12:35:12.868738	2017-11-05 12:35:12.868738	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000087	1000000023	2017-11-05 12:36:12.841169	2017-11-05 12:36:12.841169	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000088	1000000023	2017-11-05 12:37:12.8276	2017-11-05 12:37:12.8276	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000089	1000000023	2017-11-05 12:38:13.036043	2017-11-05 12:38:13.036043	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000090	1000000023	2017-11-05 12:39:12.93847	2017-11-05 12:39:12.93847	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000091	1000000023	2017-11-05 12:40:12.856897	2017-11-05 12:40:12.856897	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000092	1000000023	2017-11-05 12:41:12.938333	2017-11-05 12:41:12.938333	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000093	1000000023	2017-11-05 12:42:13.139777	2017-11-05 12:42:13.139777	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000094	1000000023	2017-11-05 12:43:13.0012	2017-11-05 12:43:13.0012	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000095	1000000023	2017-11-05 12:44:12.995632	2017-11-05 12:44:12.995632	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000096	1000000023	2017-11-05 12:45:13.032066	2017-11-05 12:45:13.032066	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000097	1000000023	2017-11-05 12:46:13.110502	2017-11-05 12:46:13.110502	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000098	1000000023	2017-11-05 12:47:13.04193	2017-11-05 12:47:13.04193	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000099	1000000023	2017-11-05 12:48:13.01036	2017-11-05 12:48:13.01036	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000100	1000000023	2017-11-05 12:49:13.368812	2017-11-05 12:49:13.368812	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000101	1000000023	2017-11-05 12:50:13.054226	2017-11-05 12:50:13.054226	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000102	1000000023	2017-11-05 12:51:13.063658	2017-11-05 12:51:13.063658	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000103	1000000023	2017-11-05 12:52:13.140095	2017-11-05 12:52:13.140095	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000104	1000000023	2017-11-05 12:53:13.230532	2017-11-05 12:53:13.230532	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000105	1000000023	2017-11-05 12:54:13.204962	2017-11-05 12:54:13.204962	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000106	1000000023	2017-11-05 12:55:13.232395	2017-11-05 12:55:13.232395	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000107	1000000023	2017-11-05 12:56:13.221826	2017-11-05 12:56:13.221826	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000108	1000000023	2017-11-05 12:57:13.301263	2017-11-05 12:57:13.301263	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000109	1000000023	2017-11-05 12:58:13.231691	2017-11-05 12:58:13.231691	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000110	1000000023	2017-11-05 12:59:13.261124	2017-11-05 12:59:13.261124	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000111	1000000023	2017-11-05 13:00:13.386563	2017-11-05 13:00:13.386563	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000112	1000000023	2017-11-05 13:01:13.331992	2017-11-05 13:01:13.331992	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000113	1000000023	2017-11-05 13:02:13.250419	2017-11-05 13:02:13.250419	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000114	1000000023	2017-11-05 13:03:13.448862	2017-11-05 13:03:13.448862	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000115	1000000023	2017-11-05 13:04:13.427293	2017-11-05 13:04:13.427293	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000116	1000000023	2017-11-05 13:05:13.376722	2017-11-05 13:05:13.376722	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000117	1000000023	2017-11-05 13:06:13.470159	2017-11-05 13:06:13.470159	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000118	1000000023	2017-11-05 13:07:13.376585	2017-11-05 13:07:13.376585	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000119	1000000023	2017-11-05 13:08:13.465022	2017-11-05 13:08:13.465022	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000120	1000000023	2017-11-05 13:09:13.499456	2017-11-05 13:09:13.499456	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000121	1000000023	2017-11-05 13:10:13.591893	2017-11-05 13:10:13.591893	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000122	1000000023	2017-11-05 13:11:13.534321	2017-11-05 13:11:13.534321	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000123	1000000023	2017-11-05 13:12:13.461749	2017-11-05 13:12:13.461749	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000124	1000000023	2017-11-05 13:13:13.605189	2017-11-05 13:13:13.605189	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000125	1000000023	2017-11-05 13:14:13.683625	2017-11-05 13:14:13.683625	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000126	1000000023	2017-11-05 13:15:13.656056	2017-11-05 13:15:13.656056	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000127	1000000023	2017-11-05 13:16:13.557482	2017-11-05 13:16:13.557482	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000128	1000000023	2017-11-05 13:17:13.702922	2017-11-05 13:17:13.702922	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000129	1000000023	2017-11-05 13:18:13.669352	2017-11-05 13:18:13.669352	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000130	1000000023	2017-11-05 13:19:13.670784	2017-11-05 13:19:13.670784	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000131	1000000023	2017-11-05 13:20:13.766221	2017-11-05 13:20:13.766221	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000132	1000000023	2017-11-05 13:21:13.675648	2017-11-05 13:21:13.675648	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000133	1000000023	2017-11-05 13:22:13.762084	2017-11-05 13:22:13.762084	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000134	1000000023	2017-11-05 13:23:13.819519	2017-11-05 13:23:13.819519	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000135	1000000023	2017-11-05 13:24:13.722946	2017-11-05 13:24:13.722946	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000136	1000000023	2017-11-05 13:25:13.77438	2017-11-05 13:25:13.77438	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000137	1000000023	2017-11-05 13:26:13.803814	2017-11-05 13:26:13.803814	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000138	1000000023	2017-11-05 13:27:13.789245	2017-11-05 13:27:13.789245	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000139	1000000023	2017-11-05 13:28:13.84768	2017-11-05 13:28:13.84768	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000140	1000000023	2017-11-05 17:16:27.265217	2017-11-05 17:16:27.265217	null	null	null	null	null	null	null
1000000141	1000000023	2017-11-05 17:16:32.580521	2017-11-05 17:16:32.580521	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000142	1000000023	2017-11-05 17:17:32.463946	2017-11-05 17:17:32.463946	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000143	1000000023	2017-11-05 17:18:32.407375	2017-11-05 17:18:32.407375	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000144	1000000023	2017-11-05 17:19:32.619818	2017-11-05 17:19:32.619818	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000145	1000000023	2017-11-05 17:20:32.733257	2017-11-05 17:20:32.733257	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000146	1000000023	2017-11-05 17:21:32.668685	2017-11-05 17:21:32.668685	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000147	1000000023	2017-11-05 17:22:32.796124	2017-11-05 17:22:32.796124	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000148	1000000023	2017-11-05 17:23:32.769554	2017-11-05 17:23:32.769554	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000149	1000000023	2017-11-05 17:24:32.931995	2017-11-05 17:24:32.931995	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000150	1000000023	2017-11-05 17:25:32.869424	2017-11-05 17:25:32.869424	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000151	1000000023	2017-11-05 17:26:33.090868	2017-11-05 17:26:33.090868	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000152	1000000023	2017-11-05 17:27:32.957292	2017-11-05 17:27:32.957292	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000153	1000000023	2017-11-05 17:28:32.838717	2017-11-05 17:28:32.838717	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000154	1000000023	2017-11-05 17:29:32.839149	2017-11-05 17:29:32.839149	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000155	1000000023	2017-11-05 17:30:32.889584	2017-11-05 17:30:32.889584	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000156	1000000023	2017-11-05 17:31:32.910017	2017-11-05 17:31:32.910017	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000157	1000000023	2017-11-05 17:32:33.076458	2017-11-05 17:32:33.076458	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000158	1000000023	2017-11-05 17:33:33.022887	2017-11-05 17:33:33.022887	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000159	1000000023	2017-11-05 17:34:32.973316	2017-11-05 17:34:32.973316	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000160	1000000023	2017-11-05 17:35:32.973748	2017-11-05 17:35:32.973748	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000161	1000000023	2017-11-05 17:36:32.944178	2017-11-05 17:36:32.944178	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000162	1000000023	2017-11-05 17:37:32.938609	2017-11-05 17:37:32.938609	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000163	1000000023	2017-11-05 17:38:33.079049	2017-11-05 17:38:33.079049	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000164	1000000023	2017-11-05 17:39:32.979475	2017-11-05 17:39:32.979475	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000165	1000000023	2017-11-05 17:40:33.249922	2017-11-05 17:40:33.249922	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000166	1000000023	2017-11-05 17:41:33.366361	2017-11-05 17:41:33.366361	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000167	1000000023	2017-11-05 17:42:33.156781	2017-11-05 17:42:33.156781	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000168	1000000023	2017-11-05 17:43:33.932257	2017-11-05 17:43:33.932257	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000169	1000000023	2017-11-05 17:44:33.162645	2017-11-05 17:44:33.162645	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000170	1000000023	2017-11-05 17:45:33.124074	2017-11-05 17:45:33.124074	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000171	1000000023	2017-11-05 17:46:33.446524	2017-11-05 17:46:33.446524	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000172	1000000023	2017-11-05 17:47:33.301948	2017-11-05 17:47:33.301948	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000173	1000000023	2017-11-05 17:48:33.435387	2017-11-05 17:48:33.435387	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000174	1000000023	2017-11-05 17:49:33.349814	2017-11-05 17:49:33.349814	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000175	1000000023	2017-11-05 17:50:33.571259	2017-11-05 17:50:33.571259	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000176	1000000023	2017-11-05 17:51:33.329677	2017-11-05 17:51:33.329677	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000177	1000000023	2017-11-05 17:52:33.598124	2017-11-05 17:52:33.598124	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000178	1000000023	2017-11-05 17:54:08.055527	2017-11-05 17:54:08.055527	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000179	1000000023	2017-11-05 17:55:08.119962	2017-11-05 17:55:08.119962	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000180	1000000023	2017-11-05 17:56:08.100393	2017-11-05 17:56:08.100393	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000181	1000000023	2017-11-05 17:57:08.324837	2017-11-05 17:57:08.324837	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000182	1000000023	2017-11-05 17:58:08.193262	2017-11-05 17:58:08.193262	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000183	1000000023	2017-11-05 17:59:08.13969	2017-11-05 17:59:08.13969	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000184	1000000023	2017-11-05 18:00:08.27713	2017-11-05 18:00:08.27713	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000185	1000000023	2017-11-05 18:01:08.315564	2017-11-05 18:01:08.315564	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000186	1000000023	2017-11-05 18:02:08.264993	2017-11-05 18:02:08.264993	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000187	1000000023	2017-11-05 18:03:08.202421	2017-11-05 18:03:08.202421	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000188	1000000023	2017-11-05 18:04:08.244855	2017-11-05 18:04:08.244855	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000189	1000000023	2017-11-05 18:05:08.420297	2017-11-05 18:05:08.420297	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000190	1000000023	2017-11-05 18:06:08.650742	2017-11-05 18:06:08.650742	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000191	1000000023	2017-11-05 18:07:08.283153	2017-11-05 18:07:08.283153	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000192	1000000023	2017-11-05 18:08:08.309586	2017-11-05 18:08:08.309586	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000193	1000000023	2017-11-05 18:09:08.468027	2017-11-05 18:09:08.468027	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000194	1000000023	2017-11-05 18:10:08.434457	2017-11-05 18:10:08.434457	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000195	1000000023	2017-11-05 18:11:08.578897	2017-11-05 18:11:08.578897	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000196	1000000023	2017-11-05 18:12:08.59633	2017-11-05 18:12:08.59633	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000197	1000000020	2017-11-26 21:53:43.589013	2017-11-26 21:53:43.589013	null	null	null	null	null	null	null
1000000198	1000000020	2017-11-26 22:00:20.444712	2017-11-26 22:00:20.444712	null	null	null	null	null	null	null
1000000199	1000000020	2017-11-26 22:01:20.21713	2017-11-26 22:01:20.21713	null	null	null	null	null	null	null
1000000200	1000000020	2017-11-26 22:02:20.100556	2017-11-26 22:02:20.100556	null	null	null	null	null	null	null
1000000201	1000000020	2017-11-26 22:03:20.453008	2017-11-26 22:03:20.453008	null	null	null	null	null	null	null
1000000202	1000000020	2017-11-26 22:04:20.262428	2017-11-26 22:04:20.262428	null	null	null	null	null	null	null
1000000203	1000000020	2017-11-26 22:05:20.174855	2017-11-26 22:05:20.174855	null	null	null	null	null	null	null
1000000204	1000000020	2017-11-26 22:06:20.214289	2017-11-26 22:06:20.214289	null	null	null	null	null	null	null
1000000205	1000000020	2017-11-26 22:07:20.18772	2017-11-26 22:07:20.18772	null	null	null	null	null	null	null
1000000206	1000000020	2017-11-26 22:08:20.328159	2017-11-26 22:08:20.328159	null	null	null	null	null	null	null
1000000207	1000000020	2017-11-26 22:09:20.346592	2017-11-26 22:09:20.346592	null	null	null	null	null	null	null
1000000208	1000000020	2017-11-26 22:10:20.410028	2017-11-26 22:10:20.410028	null	null	null	null	null	null	null
1000000209	1000000020	2017-11-26 22:11:44.006809	2017-11-26 22:11:44.006809	null	null	null	null	null	null	null
1000000210	1000000020	2017-11-26 22:12:43.685223	2017-11-26 22:12:43.685223	null	null	null	null	null	null	null
1000000211	1000000020	2017-11-26 22:13:43.474642	2017-11-26 22:13:43.474642	null	null	null	null	null	null	null
1000000212	1000000020	2017-11-26 22:14:43.421071	2017-11-26 22:14:43.421071	null	null	null	null	null	null	null
1000000213	1000000020	2017-11-26 22:15:43.455505	2017-11-26 22:15:43.455505	null	null	null	null	null	null	null
1000000214	1000000020	2017-11-26 22:16:43.458937	2017-11-26 22:16:43.458937	null	null	null	null	null	null	null
1000000215	1000000020	2017-11-26 22:17:43.443368	2017-11-26 22:17:43.443368	null	null	null	null	null	null	null
1000000216	1000000020	2017-11-26 22:18:43.599808	2017-11-26 22:18:43.599808	null	null	null	null	null	null	null
1000000217	1000000020	2017-11-26 22:19:43.59724	2017-11-26 22:19:43.59724	null	null	null	null	null	null	null
1000000218	1000000020	2017-11-26 22:20:43.443663	2017-11-26 22:20:43.443663	null	null	null	null	null	null	null
1000000219	1000000020	2017-11-26 22:21:43.984126	2017-11-26 22:21:43.984126	null	null	null	null	null	null	null
1000000220	1000000020	2017-11-26 22:22:43.576534	2017-11-26 22:22:43.576534	null	null	null	null	null	null	null
1000000221	1000000020	2017-11-26 22:23:43.533964	2017-11-26 22:23:43.533964	null	null	null	null	null	null	null
1000000222	1000000020	2017-11-26 22:24:43.645402	2017-11-26 22:24:43.645402	null	null	null	null	null	null	null
1000000223	1000000020	2017-11-26 22:25:43.74884	2017-11-26 22:25:43.74884	null	null	null	null	null	null	null
1000000224	1000000020	2017-11-26 22:26:43.857278	2017-11-26 22:26:43.857278	null	null	null	null	null	null	null
1000000225	1000000020	2017-11-26 22:27:43.561693	2017-11-26 22:27:43.561693	null	null	null	null	null	null	null
1000000226	1000000020	2017-11-26 22:28:43.720133	2017-11-26 22:28:43.720133	null	null	null	null	null	null	null
1000000227	1000000020	2017-11-26 22:29:43.682563	2017-11-26 22:29:43.682563	null	null	null	null	null	null	null
1000000228	1000000020	2017-11-26 22:30:43.695996	2017-11-26 22:30:43.695996	null	null	null	null	null	null	null
1000000229	1000000020	2017-11-26 22:31:43.874438	2017-11-26 22:31:43.874438	null	null	null	null	null	null	null
1000000230	1000000020	2017-11-26 22:32:43.808866	2017-11-26 22:32:43.808866	null	null	null	null	null	null	null
1000000231	1000000020	2017-11-26 22:33:44.191319	2017-11-26 22:33:44.191319	null	null	null	null	null	null	null
1000000232	1000000020	2017-11-26 22:34:43.81373	2017-11-26 22:34:43.81373	null	null	null	null	null	null	null
1000000233	1000000020	2017-11-26 22:35:44.534203	2017-11-26 22:35:44.534203	null	null	null	null	null	null	null
1000000234	1000000020	2017-11-26 22:36:44.071608	2017-11-26 22:36:44.071608	null	null	null	null	null	null	null
1000000235	1000000020	2017-11-26 22:37:44.08004	2017-11-26 22:37:44.08004	null	null	null	null	null	null	null
1000000236	1000000020	2017-11-27 02:54:11.31414	2017-11-27 02:54:11.31414	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000237	1000000020	2017-11-27 02:55:11.390576	2017-11-27 02:55:11.390576	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000238	1000000020	2017-11-27 02:56:11.357006	2017-11-27 02:56:11.357006	GR	Greece	Chalandri	North Athens	Attica	Kosta Varnali 35A	152 33
1000000239	1000000020	2017-11-27 02:57:11.300434	2017-11-27 02:57:11.300434	GR	Greece	Chalandri	North Athens	Attica	Kosta Varnali 35A	152 33
1000000240	1000000020	2017-11-27 02:58:11.352869	2017-11-27 02:58:11.352869	GR	Greece	Chalandri	North Athens	Attica	Kosta Varnali 35A	152 33
1000000241	1000000020	2017-11-27 02:59:11.327299	2017-11-27 02:59:11.327299	null	null	null	null	null	null	null
1000000242	1000000020	2017-11-27 03:00:11.434737	2017-11-27 03:00:11.434737	GR	Greece	Attica	null	Attica	Aspropyrgos	null
1000000243	1000000020	2017-11-27 17:32:43.336508	2017-11-27 17:32:43.336508	GR	Greece	Attica	null	Attica	Aspropyrgos	null
1000000244	1000000020	2017-11-27 17:34:37.943063	2017-11-27 17:34:37.943063	null	null	null	null	null	null	null
1000000245	1000000020	2017-11-27 17:35:33.276228	2017-11-27 17:35:33.276228	GR	Greece	Attica	null	Attica	Aspropyrgos	null
1000000246	1000000020	2017-11-27 17:36:33.737687	2017-11-27 17:36:33.737687	GR	Greece	Attica	null	Attica	Aspropyrgos	null
1000000247	1000000020	2017-11-27 17:37:33.353096	2017-11-27 17:37:33.353096	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000248	1000000020	2017-11-27 17:38:33.294525	2017-11-27 17:38:33.294525	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000249	1000000020	2017-11-27 17:39:33.308957	2017-11-27 17:39:33.308957	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000250	1000000020	2017-11-27 17:40:33.342391	2017-11-27 17:40:33.342391	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000251	1000000020	2017-11-27 17:41:33.567836	2017-11-27 17:41:33.567836	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000252	1000000020	2017-11-27 17:42:33.354255	2017-11-27 17:42:33.354255	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000253	1000000020	2017-11-27 17:43:33.354687	2017-11-27 17:43:33.354687	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000254	1000000020	2017-11-27 17:44:33.37912	2017-11-27 17:44:33.37912	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000255	1000000020	2017-11-27 17:45:33.432555	2017-11-27 17:45:33.432555	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000256	1000000020	2017-11-29 23:31:03.031242	2017-11-29 23:31:03.031242	null	null	null	null	null	null	null
1000000257	1000000020	2017-11-29 23:32:02.983855	2017-11-29 23:32:02.983855	null	null	null	null	null	null	null
1000000258	1000000020	2017-11-29 23:33:03.012478	2017-11-29 23:33:03.012478	null	null	null	null	null	null	null
1000000259	1000000020	2017-11-29 23:33:59.047093	2017-11-29 23:33:59.047093	null	null	null	null	null	null	null
1000000260	1000000020	2017-11-29 23:35:00.536402	2017-11-29 23:35:00.536402	null	null	null	null	null	null	null
1000000261	1000000020	2017-11-29 23:36:19.068874	2017-11-29 23:36:19.068874	null	null	null	null	null	null	null
1000000262	1000000020	2017-11-29 23:36:59.060952	2017-11-29 23:36:59.060952	null	null	null	null	null	null	null
1000000263	1000000020	2017-11-29 23:39:20.306388	2017-11-29 23:39:20.306388	null	null	null	null	null	null	null
1000000264	1000000020	2017-11-29 23:41:54.184428	2017-11-29 23:41:54.184428	null	null	null	null	null	null	null
1000000265	1000000020	2017-11-29 23:42:37.833471	2017-11-29 23:42:37.833471	null	null	null	null	null	null	null
1000000266	1000000020	2017-11-29 23:43:54.286679	2017-11-29 23:43:54.286679	null	null	null	null	null	null	null
1000000267	1000000020	2017-11-29 23:44:34.923339	2017-11-29 23:44:34.923339	null	null	null	null	null	null	null
1000000268	1000000020	2017-11-29 23:47:00.129778	2017-11-29 23:47:00.129778	GR	Greece	Kalamata	Peloponnese	Peloponnisos Dytiki Ellada ke Ionio	Stadiou 4-18, Kalamata 241 00, Greece	241 00
1000000269	1000000020	2017-11-29 23:48:44.056475	2017-11-29 23:48:44.056475	GR	Greece	Kalamata	Peloponnese	Peloponnisos Dytiki Ellada ke Ionio	Athinon 34, Kalamata 241 00, Greece	241 00
1000000270	1000000020	2017-11-29 23:49:06.820866	2017-11-29 23:49:06.820866	GR	Greece	Kalamata	Peloponnese	Peloponnisos Dytiki Ellada ke Ionio	Athinon 95, Kalamata 241 00, Greece	241 00
1000000271	1000000020	2017-11-29 23:50:02.13339	2017-11-29 23:50:02.13339	GR	Greece	Kalamata	Peloponnese	Peloponnisos Dytiki Ellada ke Ionio	Athinon 95, Kalamata 241 00, Greece	241 00
1000000272	1000000020	2017-11-29 23:51:27.208693	2017-11-29 23:51:27.208693	GR	Greece	Kalamata	Peloponnese	Peloponnisos Dytiki Ellada ke Ionio	Athinon 95, Kalamata 241 00, Greece	241 00
1000000273	1000000020	2017-11-29 23:52:03.831844	2017-11-29 23:52:03.831844	GR	Greece	Kalamata	Peloponnese	Peloponnisos Dytiki Ellada ke Ionio	Athinon 95, Kalamata 241 00, Greece	241 00
1000000274	1000000020	2017-12-02 14:34:04.642786	2017-12-02 14:34:04.642786	null	null	null	null	null	null	null
1000000275	1000000020	2017-12-02 14:36:12.055466	2017-12-02 14:36:12.055466	null	null	null	null	null	null	null
1000000276	1000000020	2017-12-02 15:40:10.235853	2017-12-02 15:40:10.235853	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000277	1000000020	2017-12-02 15:41:48.452825	2017-12-02 15:41:48.452825	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000278	1000000020	2017-12-02 15:42:29.329515	2017-12-02 15:42:29.329515	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000279	1000000020	2017-12-02 15:43:08.407478	2017-12-02 15:43:08.407478	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000280	1000000020	2017-12-02 15:49:50.311013	2017-12-02 15:49:50.311013	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000281	1000000020	2017-12-02 16:32:16.864884	2017-12-02 16:32:16.864884	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000282	1000000020	2017-12-02 16:33:13.920129	2017-12-02 16:33:13.920129	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000283	1000000020	2017-12-02 16:34:46.362868	2017-12-02 16:34:46.362868	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000284	1000000020	2017-12-02 16:35:13.912867	2017-12-02 16:35:13.912867	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000285	1000000020	2017-12-02 16:36:13.933988	2017-12-02 16:36:13.933988	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000286	1000000020	2017-12-02 16:37:26.363686	2017-12-02 16:37:26.363686	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000287	1000000020	2017-12-02 16:38:13.911223	2017-12-02 16:38:13.911223	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000288	1000000020	2017-12-02 16:39:13.909342	2017-12-02 16:39:13.909342	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000289	1000000020	2017-12-02 16:40:13.97947	2017-12-02 16:40:13.97947	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000290	1000000020	2017-12-02 16:41:13.918081	2017-12-02 16:41:13.918081	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000291	1000000020	2017-12-02 16:42:53.926281	2017-12-02 16:42:53.926281	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000292	1000000020	2017-12-02 16:43:13.947323	2017-12-02 16:43:13.947323	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000293	1000000020	2017-12-02 16:44:13.957443	2017-12-02 16:44:13.957443	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000294	1000000020	2017-12-02 16:45:33.934599	2017-12-02 16:45:33.934599	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000295	1000000020	2017-12-02 16:46:13.912676	2017-12-02 16:46:13.912676	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000296	1000000020	2017-12-02 16:47:15.000433	2017-12-02 16:47:15.000433	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000297	1000000020	2017-12-02 16:48:13.96192	2017-12-02 16:48:13.96192	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000298	1000000020	2017-12-02 16:49:13.928535	2017-12-02 16:49:13.928535	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000299	1000000029	2017-12-02 16:52:15.302066	2017-12-02 16:52:15.302066	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000300	1000000029	2017-12-02 16:53:15.289684	2017-12-02 16:53:15.289684	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000301	1000000029	2017-12-02 16:54:53.648174	2017-12-02 16:54:53.648174	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000302	1000000029	2017-12-02 16:55:15.285421	2017-12-02 16:55:15.285421	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000303	1000000029	2017-12-02 16:56:15.271539	2017-12-02 16:56:15.271539	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000304	1000000029	2017-12-02 16:57:33.621988	2017-12-02 16:57:33.621988	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000305	1000000029	2017-12-02 16:58:15.278278	2017-12-02 16:58:15.278278	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000306	1000000029	2017-12-02 16:59:15.273396	2017-12-02 16:59:15.273396	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000307	1000000029	2017-12-02 17:00:15.86109	2017-12-02 17:00:15.86109	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000308	1000000029	2017-12-02 17:01:15.274634	2017-12-02 17:01:15.274634	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000309	1000000029	2017-12-02 17:02:15.279254	2017-12-02 17:02:15.279254	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000310	1000000029	2017-12-02 17:03:15.266371	2017-12-02 17:03:15.266371	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000311	1000000029	2017-12-02 17:40:24.162798	2017-12-02 17:40:24.162798	null	null	null	null	null	null	null
1000000312	1000000029	2017-12-02 17:41:20.40594	2017-12-02 17:41:20.40594	null	null	null	null	null	null	null
1000000313	1000000029	2017-12-02 17:42:25.546711	2017-12-02 17:42:25.546711	null	null	null	null	null	null	null
1000000314	1000000029	2017-12-02 17:43:20.358672	2017-12-02 17:43:20.358672	null	null	null	null	null	null	null
1000000315	1000000029	2017-12-02 17:44:20.408297	2017-12-02 17:44:20.408297	null	null	null	null	null	null	null
1000000316	1000000029	2017-12-02 17:45:20.382413	2017-12-02 17:45:20.382413	null	null	null	null	null	null	null
1000000317	1000000030	2017-12-03 18:57:11.100846	2017-12-03 18:57:11.100846	null	null	null	null	null	null	null
1000000318	1000000030	2017-12-10 15:29:41.873298	2017-12-10 15:29:41.873298	null	null	null	null	null	null	null
1000000319	1000000030	2017-12-10 18:53:13.383029	2017-12-10 18:53:13.383029	null	null	null	null	null	null	null
\.


--
-- Name: i_location_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('i_location_id_seq', 1000000319, true);


--
-- Data for Name: i_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY i_user (i_user_id, i_creation_date, i_last_update_date, i_first_name, i_last_name, i_mobile_number, i_username, i_password, i_email_address, i_register_type) FROM stdin;
1000000020	2017-10-12 19:55:19.392707	2017-10-12 19:55:19.392707	Ioannis	Kozompolis	6971903121	giannis		g.kozompolis@gmail.com	\N
1000000021	2017-10-12 19:57:45.490063	2017-10-12 19:57:45.490063	Ioannis 	Kozompolis	6971903121	giannis2		g.kozompolis@gmail.com	\N
1000000022	2017-10-12 20:55:23.476849	2017-10-12 20:55:23.476849	aek	ole	6971903121	aek		giannis1990@gmail.com	\N
1000000023	2017-10-12 21:08:52.548125	2017-10-12 21:08:52.548125	giannis4			giannis4			\N
1000000024	2017-10-14 21:22:11.872753	2017-10-14 21:22:11.872753	giannis5			giannis5			\N
1000000025	2017-10-14 21:27:15.417114	2017-10-14 21:27:15.417114	giannis6			giannis6			\N
1000000026	2017-11-25 21:04:47.794319	2017-11-25 21:04:47.794319	Ioannis	Kozompolis	6971903121	giannis2669		g.kozompolis@gmail.com	\N
1000000027	2017-12-02 16:22:39.382553	2017-12-02 16:22:39.382553	Ioannnis	Kozompolis	6971903121	kozo		g.kozompolis@gmail.com	\N
1000000028	2017-12-02 16:30:33.483257	2017-12-02 16:30:33.483257				kozompolis			\N
1000000029	2017-12-02 16:52:05.125274	2017-12-02 16:52:05.125274				testuser1			\N
1000000030	2017-12-03 17:55:53.547356	2017-12-03 17:55:53.547356	John	Kozo		1127478420719730		g.kozompolis@gmail.com	\N
\.


--
-- Name: i_user_i_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('i_user_i_user_id_seq', 1000000030, true);


--
-- Name: i_work_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('i_work_id_seq', 1000000023, true);


--
-- Data for Name: i_work_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY i_work_info (i_work_id, i_user_id, i_creation_date, i_last_update_date, i_work_employer, i_work_position) FROM stdin;
1000000008	1000000020	2017-12-09 18:07:12.183065	2017-12-09 18:07:12.183065	Almasport	Sales
1000000009	1000000020	2017-12-09 18:13:25.564421	2017-12-09 18:13:25.564421	\N	\N
1000000010	1000000030	2017-12-10 14:28:51.964701	2017-12-10 14:28:51.964701	Velti	QA Engineer
1000000011	1000000030	2017-12-10 15:26:23.561616	2017-12-10 15:26:23.561616	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000012	1000000030	2017-12-10 15:31:11.868226	2017-12-10 15:31:11.868226	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000013	1000000030	2017-12-10 15:32:59.937949	2017-12-10 15:32:59.937949	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000014	1000000030	2017-12-10 15:34:53.439362	2017-12-10 15:34:53.439362	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000015	1000000030	2017-12-10 16:19:59.583499	2017-12-10 16:19:59.583499	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000016	1000000030	2017-12-10 16:21:56.754378	2017-12-10 16:21:56.754378	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000017	1000000030	2017-12-10 16:25:51.281659	2017-12-10 16:25:51.281659	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000018	1000000030	2017-12-10 18:58:47.20742	2017-12-10 18:58:47.20742	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000019	1000000030	2017-12-10 18:58:47.239924	2017-12-10 18:58:47.239924	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000020	1000000030	2017-12-10 19:03:49.897356	2017-12-10 19:03:49.897356	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000021	1000000030	2017-12-10 19:20:44.539699	2017-12-10 19:20:44.539699	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000022	1000000030	2017-12-10 19:24:38.35189	2017-12-10 19:24:38.35189	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000023	1000000030	2017-12-10 19:27:42.773308	2017-12-10 19:27:42.773308	Velti S.A.	Quality Assurance Engineer (QA Engineer)
\.


--
-- Name: i_education_info i_education_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_education_info
    ADD CONSTRAINT i_education_info_pkey PRIMARY KEY (i_education_id);


--
-- Name: i_fb_books i_fb_books_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_books
    ADD CONSTRAINT i_fb_books_pkey PRIMARY KEY (i_fb_books_id);


--
-- Name: i_fb_events i_fb_events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_events
    ADD CONSTRAINT i_fb_events_pkey PRIMARY KEY (i_fb_events_id);


--
-- Name: i_fb_favorite_teams i_fb_favorite_team_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_favorite_teams
    ADD CONSTRAINT i_fb_favorite_team_pkey PRIMARY KEY (i_fb_favorite_teams_id);


--
-- Name: i_fb_music i_fb_music_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_music
    ADD CONSTRAINT i_fb_music_pkey PRIMARY KEY (i_fb_music_id);


--
-- Name: i_interest_fb_pages i_interest_pages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_interest_fb_pages
    ADD CONSTRAINT i_interest_pages_pkey PRIMARY KEY (i_interest_pages_id);


--
-- Name: i_location i_location_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_location
    ADD CONSTRAINT i_location_pkey PRIMARY KEY (i_location_id);


--
-- Name: i_user i_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_user
    ADD CONSTRAINT i_user_pkey PRIMARY KEY (i_user_id);


--
-- Name: i_work_info i_work_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_work_info
    ADD CONSTRAINT i_work_info_pkey PRIMARY KEY (i_work_id);


--
-- Name: fki_E; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_E" ON i_education_info USING btree (i_user_id);


--
-- Name: fki_F; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_F" ON i_interest_fb_pages USING btree (i_user_id);


--
-- Name: fki_G; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_G" ON i_fb_events USING btree (i_user_id);


--
-- Name: fki_H; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_H" ON i_fb_events USING btree (i_user_id);


--
-- Name: fki_I; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_I" ON i_fb_events USING btree (i_user_id);


--
-- Name: fki_J; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_J" ON i_fb_favorite_teams USING btree (i_user_id);


--
-- Name: fki_i_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_i_user_id ON i_work_info USING btree (i_user_id);


--
-- Name: i_education_info Update_Data; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "Update_Data" BEFORE UPDATE ON i_education_info FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- Name: i_interest_fb_pages Update_Data; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "Update_Data" BEFORE UPDATE ON i_interest_fb_pages FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- Name: i_fb_events Update_Data; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "Update_Data" BEFORE UPDATE ON i_fb_events FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- Name: i_fb_books Update_Data; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "Update_Data" BEFORE UPDATE ON i_fb_books FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- Name: i_fb_music Update_Data; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "Update_Data" BEFORE UPDATE ON i_fb_music FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- Name: i_fb_favorite_teams Update_Data; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "Update_Data" BEFORE UPDATE ON i_fb_favorite_teams FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- Name: i_location Update_last_update_date; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "Update_last_update_date" BEFORE UPDATE ON i_location FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- Name: i_user set_timestamp; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER set_timestamp BEFORE UPDATE ON i_user FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- Name: i_work_info set_timestamp; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER set_timestamp BEFORE UPDATE ON i_work_info FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- Name: i_location User ID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_location
    ADD CONSTRAINT "User ID" FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id);


--
-- Name: i_education_info User_id_in_education_info; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_education_info
    ADD CONSTRAINT "User_id_in_education_info" FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: i_fb_books User_id_in_i_fb_books; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_books
    ADD CONSTRAINT "User_id_in_i_fb_books" FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- Name: i_fb_events User_id_in_i_fb_events; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_events
    ADD CONSTRAINT "User_id_in_i_fb_events" FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- Name: i_fb_favorite_teams User_id_in_i_fb_favorite_teams; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_favorite_teams
    ADD CONSTRAINT "User_id_in_i_fb_favorite_teams" FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- Name: i_fb_music User_id_in_i_fb_music; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_music
    ADD CONSTRAINT "User_id_in_i_fb_music" FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- Name: i_interest_fb_pages User_id_in_interest_pages; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_interest_fb_pages
    ADD CONSTRAINT "User_id_in_interest_pages" FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- Name: i_education_info fkck4ugidmocgo1ugp68cqndwgc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_education_info
    ADD CONSTRAINT fkck4ugidmocgo1ugp68cqndwgc FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id);


--
-- Name: i_work_info fkcoqbcg27jlgcyjfnh4n65uehx; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_work_info
    ADD CONSTRAINT fkcoqbcg27jlgcyjfnh4n65uehx FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id);


--
-- Name: i_location fkg0rrrwit513pw13pr3n3o2u4e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_location
    ADD CONSTRAINT fkg0rrrwit513pw13pr3n3o2u4e FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id);


--
-- Name: i_work_info i_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_work_info
    ADD CONSTRAINT i_user_id FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: i_education_info i_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_education_info
    ADD CONSTRAINT i_user_id FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: i_interest_fb_pages i_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_interest_fb_pages
    ADD CONSTRAINT i_user_id FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- Name: i_fb_events i_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_events
    ADD CONSTRAINT i_user_id FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- Name: i_fb_books i_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_books
    ADD CONSTRAINT i_user_id FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- Name: i_fb_music i_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_music
    ADD CONSTRAINT i_user_id FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- Name: i_fb_favorite_teams i_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_favorite_teams
    ADD CONSTRAINT i_user_id FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: register_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE register_type AS ENUM (
    'facebook',
    'custom'
);


ALTER TYPE register_type OWNER TO postgres;

--
-- Name: trigger_set_timestamp(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION trigger_set_timestamp() RETURNS trigger
    LANGUAGE plpgsql
    AS $$  
BEGIN  
  NEW.i_last_update_date = NOW();
  RETURN NEW;
END;  
$$;


ALTER FUNCTION public.trigger_set_timestamp() OWNER TO postgres;

--
-- Name: greeting_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE greeting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE greeting_id_seq OWNER TO postgres;

--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hibernate_sequence OWNER TO postgres;

--
-- Name: i_education_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE i_education_id_seq
    START WITH 1000000000
    INCREMENT BY 1
    MINVALUE 1000000000
    MAXVALUE 9999999999999
    CACHE 1;


ALTER TABLE i_education_id_seq OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: i_education_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE i_education_info (
    i_education_id bigint DEFAULT nextval('i_education_id_seq'::regclass) NOT NULL,
    i_user_id bigint NOT NULL,
    i_creation_date timestamp(6) without time zone DEFAULT now(),
    i_last_update_date timestamp(6) without time zone DEFAULT now(),
    i_edu_degree character varying(100),
    i_edu_school character varying(100),
    i_edu_type character varying(100),
    i_edu_year character varying(20)
);


ALTER TABLE i_education_info OWNER TO postgres;

--
-- Name: i_fb_books_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE i_fb_books_id_seq
    START WITH 1000000000
    INCREMENT BY 1
    MINVALUE 1000000000
    MAXVALUE 9999999999999
    CACHE 1;


ALTER TABLE i_fb_books_id_seq OWNER TO postgres;

--
-- Name: i_fb_books; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE i_fb_books (
    i_fb_books_id bigint DEFAULT nextval('i_fb_books_id_seq'::regclass) NOT NULL,
    i_user_id bigint NOT NULL,
    i_creation_date timestamp(6) without time zone DEFAULT now(),
    i_last_update_date timestamp(6) without time zone DEFAULT now(),
    i_book_name character varying(100),
    i_book_description character varying(400)
);


ALTER TABLE i_fb_books OWNER TO postgres;

--
-- Name: i_fb_events_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE i_fb_events_id_seq
    START WITH 1000000000
    INCREMENT BY 1
    MINVALUE 1000000000
    MAXVALUE 999999999999999
    CACHE 1;


ALTER TABLE i_fb_events_id_seq OWNER TO postgres;

--
-- Name: i_fb_events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE i_fb_events (
    i_fb_events_id bigint DEFAULT nextval('i_fb_events_id_seq'::regclass) NOT NULL,
    i_user_id bigint NOT NULL,
    i_creation_date timestamp(6) without time zone DEFAULT now(),
    i_last_update_date timestamp(6) without time zone DEFAULT now(),
    i_event_name character varying(100),
    i_event_description character varying(400),
    i_event_start_date timestamp(6) without time zone
);


ALTER TABLE i_fb_events OWNER TO postgres;

--
-- Name: i_fb_favorite_teams_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE i_fb_favorite_teams_id_seq
    START WITH 1000000000
    INCREMENT BY 1
    MINVALUE 1000000000
    MAXVALUE 9999999999999
    CACHE 1;


ALTER TABLE i_fb_favorite_teams_id_seq OWNER TO postgres;

--
-- Name: i_fb_favorite_teams; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE i_fb_favorite_teams (
    i_fb_favorite_teams_id bigint DEFAULT nextval('i_fb_favorite_teams_id_seq'::regclass) NOT NULL,
    i_user_id bigint NOT NULL,
    i_creation_date timestamp(6) without time zone DEFAULT now(),
    i_last_update_date timestamp(6) without time zone DEFAULT now(),
    i_team_name character varying(100)
);


ALTER TABLE i_fb_favorite_teams OWNER TO postgres;

--
-- Name: i_fb_music_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE i_fb_music_id_seq
    START WITH 1000000000
    INCREMENT BY 1
    MINVALUE 1000000000
    MAXVALUE 9999999999999
    CACHE 1;


ALTER TABLE i_fb_music_id_seq OWNER TO postgres;

--
-- Name: i_fb_music; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE i_fb_music (
    i_fb_music_id bigint DEFAULT nextval('i_fb_music_id_seq'::regclass) NOT NULL,
    i_user_id bigint NOT NULL,
    i_creation_date timestamp(6) without time zone DEFAULT now(),
    i_last_update_date timestamp(6) without time zone DEFAULT now(),
    i_music_title character varying(100)
);


ALTER TABLE i_fb_music OWNER TO postgres;

--
-- Name: i_interest_pages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE i_interest_pages_id_seq
    START WITH 1000000000
    INCREMENT BY 1
    MINVALUE 1000000000
    MAXVALUE 99999999999999
    CACHE 1;


ALTER TABLE i_interest_pages_id_seq OWNER TO postgres;

--
-- Name: i_interest_fb_pages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE i_interest_fb_pages (
    i_interest_pages_id bigint DEFAULT nextval('i_interest_pages_id_seq'::regclass) NOT NULL,
    i_user_id bigint NOT NULL,
    i_creation_date timestamp(6) without time zone DEFAULT now(),
    i_last_update_date timestamp(6) without time zone DEFAULT now(),
    i_page_name character varying(100),
    i_page_description character varying(400)
);


ALTER TABLE i_interest_fb_pages OWNER TO postgres;

--
-- Name: i_location_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE i_location_id_seq
    START WITH 1000000001
    INCREMENT BY 1
    MINVALUE 1000000001
    MAXVALUE 99999999999999
    CACHE 1;


ALTER TABLE i_location_id_seq OWNER TO postgres;

--
-- Name: i_location; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE i_location (
    i_location_id bigint DEFAULT nextval('i_location_id_seq'::regclass) NOT NULL,
    i_user_id bigint NOT NULL,
    i_creation_date timestamp(6) without time zone DEFAULT now(),
    i_last_update_date timestamp(6) without time zone DEFAULT now(),
    i_country_code character varying(5),
    i_country_name character varying(50),
    i_city_name character varying(50),
    i_prefecture character varying(50),
    i_department character varying(50),
    i_street_address character varying(100),
    i_postal_code character varying(10)
);


ALTER TABLE i_location OWNER TO postgres;

--
-- Name: i_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE i_user (
    i_user_id bigint NOT NULL,
    i_creation_date timestamp(6) without time zone DEFAULT now() NOT NULL,
    i_last_update_date timestamp(6) without time zone DEFAULT now() NOT NULL,
    i_first_name character varying(50),
    i_last_name character varying(50),
    i_mobile_number character varying(20),
    i_username character varying(50),
    i_password character varying(50),
    i_email_address character varying(100),
    i_register_type character varying(100)
);


ALTER TABLE i_user OWNER TO postgres;

--
-- Name: i_user_i_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE i_user_i_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE i_user_i_user_id_seq OWNER TO postgres;

--
-- Name: i_user_i_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE i_user_i_user_id_seq OWNED BY i_user.i_user_id;


--
-- Name: i_work_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE i_work_id_seq
    START WITH 1000000000
    INCREMENT BY 1
    MINVALUE 1000000000
    MAXVALUE 999999999999999
    CACHE 1;


ALTER TABLE i_work_id_seq OWNER TO postgres;

--
-- Name: i_work_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE i_work_info (
    i_work_id bigint DEFAULT nextval('i_work_id_seq'::regclass) NOT NULL,
    i_user_id bigint NOT NULL,
    i_creation_date timestamp(6) without time zone DEFAULT now() NOT NULL,
    i_last_update_date timestamp(6) without time zone DEFAULT now(),
    i_work_employer character varying(100),
    i_work_position character varying(100)
);


ALTER TABLE i_work_info OWNER TO postgres;

--
-- Name: i_user i_user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_user ALTER COLUMN i_user_id SET DEFAULT nextval('i_user_i_user_id_seq'::regclass);


--
-- Name: greeting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('greeting_id_seq', 1, false);


--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('hibernate_sequence', 6, true);


--
-- Name: i_education_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('i_education_id_seq', 1000000005, true);


--
-- Data for Name: i_education_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY i_education_info (i_education_id, i_user_id, i_creation_date, i_last_update_date, i_edu_degree, i_edu_school, i_edu_type, i_edu_year) FROM stdin;
1000000003	1000000030	2017-12-10 19:27:42.874321	2017-12-10 19:27:42.874321		Department of Applied Informatics and Multimedia of Crete	College	2012
1000000004	1000000030	2017-12-10 19:27:42.934329	2017-12-10 19:27:42.934329	Advanced Softaware Development Technologies	University of Piraeus	Graduate School	2017
1000000005	1000000020	2017-12-14 17:43:17.307915	2017-12-14 17:43:17.307915	Master	University of Piraeus	IT	2017
\.


--
-- Data for Name: i_fb_books; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY i_fb_books (i_fb_books_id, i_user_id, i_creation_date, i_last_update_date, i_book_name, i_book_description) FROM stdin;
1000000000	1000000020	2017-12-13 17:13:27.565242	2017-12-13 17:13:54.776242	The Secret	The secret book only for adults
1000000001	1000000020	2017-12-14 13:23:58.544692	2017-12-14 13:23:58.544692	Pinocio	Pinocio adventures
\.


--
-- Name: i_fb_books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('i_fb_books_id_seq', 1000000001, true);


--
-- Data for Name: i_fb_events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY i_fb_events (i_fb_events_id, i_user_id, i_creation_date, i_last_update_date, i_event_name, i_event_description, i_event_start_date) FROM stdin;
1000000000	1000000020	2017-12-13 16:46:29.113914	2017-12-13 16:49:20.508051	2nd Marathon Kalamatas	Marathon on Kalamata first time ever	\N
1000000001	1000000020	2017-12-13 16:47:54.9875	2017-12-13 16:49:20.508051	2nd Marathon Kalamatas	Marathon on Kalamata first time ever	2017-12-13 16:47:54.9875
1000000003	1000000020	2017-12-14 17:28:41.17431	2017-12-14 17:28:41.17431	Velti Party	Velti party all the time	\N
1000000004	1000000021	2017-12-14 17:29:01.705363	2017-12-14 17:29:01.705363	Velti Party	Velti party all the time	\N
\.


--
-- Name: i_fb_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('i_fb_events_id_seq', 1000000004, true);


--
-- Data for Name: i_fb_favorite_teams; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY i_fb_favorite_teams (i_fb_favorite_teams_id, i_user_id, i_creation_date, i_last_update_date, i_team_name) FROM stdin;
1000000000	1000000020	2017-12-13 17:50:42.613253	2017-12-13 17:51:24.465438	AEK F.C.
1000000001	1000000020	2017-12-15 12:24:28.46332	2017-12-15 12:24:28.46332	AEK B.C.
\.


--
-- Name: i_fb_favorite_teams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('i_fb_favorite_teams_id_seq', 1000000001, true);


--
-- Data for Name: i_fb_music; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY i_fb_music (i_fb_music_id, i_user_id, i_creation_date, i_last_update_date, i_music_title) FROM stdin;
1000000000	1000000020	2017-12-13 17:26:30.425242	2017-12-13 17:26:40.697242	Eminem
1000000001	1000000020	2017-12-13 17:27:14.616468	2017-12-13 17:27:14.616468	Secret
1000000002	1000000020	2017-12-15 11:35:34.990002	2017-12-15 11:35:34.990002	Eminem
1000000003	1000000020	2017-12-15 11:35:50.489552	2017-12-15 11:35:50.489552	Tonis Sfinos
1000000004	1000000020	2017-12-15 11:57:50.097499	2017-12-15 11:57:50.097499	Tonis Sfinos
\.


--
-- Name: i_fb_music_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('i_fb_music_id_seq', 1000000004, true);


--
-- Data for Name: i_interest_fb_pages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY i_interest_fb_pages (i_interest_pages_id, i_user_id, i_creation_date, i_last_update_date, i_page_name, i_page_description) FROM stdin;
1000000004	1000000020	2017-12-15 12:02:57.03919	2017-12-15 12:02:57.03919	Almasport	Athletic store
\.


--
-- Name: i_interest_pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('i_interest_pages_id_seq', 1000000004, true);


--
-- Data for Name: i_location; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY i_location (i_location_id, i_user_id, i_creation_date, i_last_update_date, i_country_code, i_country_name, i_city_name, i_prefecture, i_department, i_street_address, i_postal_code) FROM stdin;
1000000002	1000000020	2017-10-29 15:07:49.898223	2017-10-29 15:13:11.877639	GR	Greece	Athens	Attica	Attica	Saronos 4	11143
1000000003	1000000020	2017-10-29 16:48:07.275397	2017-10-29 16:48:07.275397	GR	Greece	Kalamata	Messinia	Peloponissos	loggas 8	24100
1000000005	1000000020	2017-10-29 16:51:42.444704	2017-10-29 16:51:42.444704	GR	Greece	Kalamata	Messinia	Peloponissos	loggas 10	24100
1000000006	1000000020	2017-10-29 22:05:11.732534	2017-10-29 22:05:11.732534	GR	Greece	Kalamata	Messinia	Peloponissos	loggas 10	24100
1000000010	1000000023	2017-10-30 20:31:47.543345	2017-10-30 20:31:47.543345	GR	Greece	Kalamata	Messenia	Peloponnisos Dytiki Ellada ke Ionio	Aristomenous 45	24100
1000000011	1000000023	2017-10-30 20:35:56.798602	2017-10-30 20:35:56.798602	GR	Greece	Kalamata	Messenia	Peloponnisos Dytiki Ellada ke Ionio	Aristomenous 45	241 00
1000000012	1000000023	2017-10-30 20:40:59.183897	2017-10-30 20:40:59.183897	GR	Greece	Kalamata	Messenia	Peloponnisos Dytiki Ellada ke Ionio	Aristomenous 45	241 00
1000000013	1000000023	2017-10-30 22:13:09.887235	2017-10-30 22:13:09.887235	GR	Greece	Kalamata	Messenia	Peloponnisos Dytiki Ellada ke Ionio	Aristomenous 45	241 00
1000000014	1000000023	2017-10-30 22:27:02.560862	2017-10-30 22:27:02.560862	GR	Greece	Kalamata	Messenia	Peloponnisos Dytiki Ellada ke Ionio	Aristomenous 45	241 00
1000000015	1000000023	2017-10-30 22:55:44.872372	2017-10-30 22:55:44.872372	GR	Greece	Filadelfeia-Chalkidona	Central Athens	Attica	Marathonos 8	143 43
1000000016	1000000023	2017-10-30 23:05:47.623848	2017-10-30 23:05:47.623848	GR	Greece	Filadelfeia-Chalkidona	Central Athens	Attica	Anakous 60	143 41
1000000017	1000000023	2017-10-30 23:06:59.639967	2017-10-30 23:06:59.639967	GR	Greece	Pireas	Piraeus	Attica	Praxitelous 238	185 36
1000000018	1000000023	2017-10-30 23:10:34.107233	2017-10-30 23:10:34.107233	GR	Greece	West Mani	Messenia	Peloponnisos Dytiki Ellada ke Ionio	Unnamed Road	241 00
1000000019	1000000023	2017-11-03 00:30:52.691688	2017-11-03 00:30:52.691688	GR	Greece	Athens	Central Athens	Attica	Acharnon 458	111 43
1000000020	1000000023	2017-11-03 00:30:54.545794	2017-11-03 00:30:54.545794	GR	Greece	Athens	Central Athens	Attica	Acharnon 458	111 43
1000000021	1000000023	2017-11-03 00:31:50.367987	2017-11-03 00:31:50.367987	GR	Greece	Athens	Central Athens	Attica	Acharnon 458	111 43
1000000022	1000000023	2017-11-03 00:32:50.325416	2017-11-03 00:32:50.325416	GR	Greece	Athens	Central Athens	Attica	Acharnon 458	111 43
1000000023	1000000023	2017-11-03 00:33:50.36485	2017-11-03 00:33:50.36485	GR	Greece	Athens	Central Athens	Attica	Acharnon 458	111 43
1000000024	1000000023	2017-11-03 00:34:50.398284	2017-11-03 00:34:50.398284	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000025	1000000023	2017-11-03 00:35:50.441718	2017-11-03 00:35:50.441718	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000026	1000000023	2017-11-04 23:30:28.230643	2017-11-04 23:30:28.230643	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000028	1000000023	2017-11-04 23:30:28.236644	2017-11-04 23:30:28.236644	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000027	1000000023	2017-11-04 23:30:28.230643	2017-11-04 23:30:28.230643	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000029	1000000023	2017-11-04 23:30:30.690784	2017-11-04 23:30:30.690784	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000030	1000000023	2017-11-04 23:31:49.311281	2017-11-04 23:31:49.311281	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000031	1000000023	2017-11-04 23:32:52.991923	2017-11-04 23:32:52.991923	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000032	1000000023	2017-11-04 23:33:50.62922	2017-11-04 23:33:50.62922	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000033	1000000023	2017-11-04 23:34:52.52276	2017-11-04 23:34:52.52276	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000034	1000000023	2017-11-04 23:35:54.458302	2017-11-04 23:35:54.458302	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000035	1000000023	2017-11-04 23:35:56.125398	2017-11-04 23:35:56.125398	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000036	1000000023	2017-11-04 23:36:53.727692	2017-11-04 23:36:53.727692	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000037	1000000023	2017-11-04 23:36:53.728692	2017-11-04 23:36:53.728692	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000038	1000000023	2017-11-04 23:37:49.118861	2017-11-04 23:37:49.118861	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000040	1000000023	2017-11-04 23:38:55.993686	2017-11-04 23:38:55.993686	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000039	1000000023	2017-11-04 23:38:55.991685	2017-11-04 23:38:55.991685	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000041	1000000023	2017-11-04 23:40:49.124156	2017-11-04 23:40:49.124156	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000042	1000000023	2017-11-04 23:42:54.790344	2017-11-04 23:42:54.790344	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000043	1000000023	2017-11-04 23:42:54.791344	2017-11-04 23:42:54.791344	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000044	1000000023	2017-11-04 23:44:50.221946	2017-11-04 23:44:50.221946	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000045	1000000023	2017-11-04 23:46:50.57783	2017-11-04 23:46:50.57783	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000046	1000000023	2017-11-04 23:48:49.182614	2017-11-04 23:48:49.182614	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000047	1000000023	2017-11-05 00:38:27.199628	2017-11-05 00:38:27.199628	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000048	1000000023	2017-11-05 02:38:10.608822	2017-11-05 02:38:10.608822	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000049	1000000023	2017-11-05 04:38:18.804108	2017-11-05 04:38:18.804108	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000050	1000000023	2017-11-05 06:38:19.850984	2017-11-05 06:38:19.850984	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000051	1000000023	2017-11-05 08:38:20.844857	2017-11-05 08:38:20.844857	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000052	1000000023	2017-11-05 10:38:22.506769	2017-11-05 10:38:22.506769	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000053	1000000023	2017-11-05 12:02:00.795798	2017-11-05 12:02:00.795798	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000054	1000000023	2017-11-05 12:02:58.915123	2017-11-05 12:02:58.915123	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000055	1000000023	2017-11-05 12:03:58.889553	2017-11-05 12:03:58.889553	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000056	1000000023	2017-11-05 12:04:58.849982	2017-11-05 12:04:58.849982	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000057	1000000023	2017-11-05 12:05:58.931419	2017-11-05 12:05:58.931419	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000058	1000000023	2017-11-05 12:07:12.491626	2017-11-05 12:07:12.491626	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000059	1000000023	2017-11-05 12:08:12.430055	2017-11-05 12:08:12.430055	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000060	1000000023	2017-11-05 12:09:12.404485	2017-11-05 12:09:12.404485	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000061	1000000023	2017-11-05 12:10:12.46392	2017-11-05 12:10:12.46392	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000062	1000000023	2017-11-05 12:11:12.42135	2017-11-05 12:11:12.42135	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000063	1000000023	2017-11-05 12:12:12.507786	2017-11-05 12:12:12.507786	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000064	1000000023	2017-11-05 12:13:12.557221	2017-11-05 12:13:12.557221	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000065	1000000023	2017-11-05 12:14:12.497649	2017-11-05 12:14:12.497649	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000066	1000000023	2017-11-05 12:15:12.458079	2017-11-05 12:15:12.458079	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000067	1000000023	2017-11-05 12:16:12.472511	2017-11-05 12:16:12.472511	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000068	1000000023	2017-11-05 12:17:12.539947	2017-11-05 12:17:12.539947	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000069	1000000023	2017-11-05 12:18:12.491376	2017-11-05 12:18:12.491376	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000070	1000000023	2017-11-05 12:19:12.488808	2017-11-05 12:19:12.488808	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000071	1000000023	2017-11-05 12:20:12.612247	2017-11-05 12:20:12.612247	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000072	1000000023	2017-11-05 12:21:12.63268	2017-11-05 12:21:12.63268	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000073	1000000023	2017-11-05 12:22:12.61011	2017-11-05 12:22:12.61011	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000074	1000000023	2017-11-05 12:23:12.660545	2017-11-05 12:23:12.660545	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000075	1000000023	2017-11-05 12:24:12.583972	2017-11-05 12:24:12.583972	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000076	1000000023	2017-11-05 12:25:12.542402	2017-11-05 12:25:12.542402	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000077	1000000023	2017-11-05 12:26:12.676841	2017-11-05 12:26:12.676841	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000078	1000000023	2017-11-05 12:27:12.730276	2017-11-05 12:27:12.730276	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000079	1000000023	2017-11-05 12:28:12.719707	2017-11-05 12:28:12.719707	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000080	1000000023	2017-11-05 12:29:12.750141	2017-11-05 12:29:12.750141	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000081	1000000023	2017-11-05 12:30:12.659567	2017-11-05 12:30:12.659567	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000082	1000000023	2017-11-05 12:31:12.810008	2017-11-05 12:31:12.810008	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000083	1000000023	2017-11-05 12:32:12.728435	2017-11-05 12:32:12.728435	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000084	1000000023	2017-11-05 12:33:12.78087	2017-11-05 12:33:12.78087	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000085	1000000023	2017-11-05 12:34:12.798303	2017-11-05 12:34:12.798303	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000086	1000000023	2017-11-05 12:35:12.868738	2017-11-05 12:35:12.868738	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000087	1000000023	2017-11-05 12:36:12.841169	2017-11-05 12:36:12.841169	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000088	1000000023	2017-11-05 12:37:12.8276	2017-11-05 12:37:12.8276	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000089	1000000023	2017-11-05 12:38:13.036043	2017-11-05 12:38:13.036043	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000090	1000000023	2017-11-05 12:39:12.93847	2017-11-05 12:39:12.93847	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000091	1000000023	2017-11-05 12:40:12.856897	2017-11-05 12:40:12.856897	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000092	1000000023	2017-11-05 12:41:12.938333	2017-11-05 12:41:12.938333	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000093	1000000023	2017-11-05 12:42:13.139777	2017-11-05 12:42:13.139777	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000094	1000000023	2017-11-05 12:43:13.0012	2017-11-05 12:43:13.0012	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000095	1000000023	2017-11-05 12:44:12.995632	2017-11-05 12:44:12.995632	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000096	1000000023	2017-11-05 12:45:13.032066	2017-11-05 12:45:13.032066	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000097	1000000023	2017-11-05 12:46:13.110502	2017-11-05 12:46:13.110502	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000098	1000000023	2017-11-05 12:47:13.04193	2017-11-05 12:47:13.04193	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000099	1000000023	2017-11-05 12:48:13.01036	2017-11-05 12:48:13.01036	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000100	1000000023	2017-11-05 12:49:13.368812	2017-11-05 12:49:13.368812	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000101	1000000023	2017-11-05 12:50:13.054226	2017-11-05 12:50:13.054226	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000102	1000000023	2017-11-05 12:51:13.063658	2017-11-05 12:51:13.063658	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000103	1000000023	2017-11-05 12:52:13.140095	2017-11-05 12:52:13.140095	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000104	1000000023	2017-11-05 12:53:13.230532	2017-11-05 12:53:13.230532	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000105	1000000023	2017-11-05 12:54:13.204962	2017-11-05 12:54:13.204962	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000106	1000000023	2017-11-05 12:55:13.232395	2017-11-05 12:55:13.232395	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000107	1000000023	2017-11-05 12:56:13.221826	2017-11-05 12:56:13.221826	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000108	1000000023	2017-11-05 12:57:13.301263	2017-11-05 12:57:13.301263	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000109	1000000023	2017-11-05 12:58:13.231691	2017-11-05 12:58:13.231691	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000110	1000000023	2017-11-05 12:59:13.261124	2017-11-05 12:59:13.261124	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000111	1000000023	2017-11-05 13:00:13.386563	2017-11-05 13:00:13.386563	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000112	1000000023	2017-11-05 13:01:13.331992	2017-11-05 13:01:13.331992	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000113	1000000023	2017-11-05 13:02:13.250419	2017-11-05 13:02:13.250419	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000114	1000000023	2017-11-05 13:03:13.448862	2017-11-05 13:03:13.448862	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000115	1000000023	2017-11-05 13:04:13.427293	2017-11-05 13:04:13.427293	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000116	1000000023	2017-11-05 13:05:13.376722	2017-11-05 13:05:13.376722	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000117	1000000023	2017-11-05 13:06:13.470159	2017-11-05 13:06:13.470159	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000118	1000000023	2017-11-05 13:07:13.376585	2017-11-05 13:07:13.376585	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000119	1000000023	2017-11-05 13:08:13.465022	2017-11-05 13:08:13.465022	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000120	1000000023	2017-11-05 13:09:13.499456	2017-11-05 13:09:13.499456	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000121	1000000023	2017-11-05 13:10:13.591893	2017-11-05 13:10:13.591893	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000122	1000000023	2017-11-05 13:11:13.534321	2017-11-05 13:11:13.534321	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000123	1000000023	2017-11-05 13:12:13.461749	2017-11-05 13:12:13.461749	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000124	1000000023	2017-11-05 13:13:13.605189	2017-11-05 13:13:13.605189	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000125	1000000023	2017-11-05 13:14:13.683625	2017-11-05 13:14:13.683625	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000126	1000000023	2017-11-05 13:15:13.656056	2017-11-05 13:15:13.656056	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000127	1000000023	2017-11-05 13:16:13.557482	2017-11-05 13:16:13.557482	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000128	1000000023	2017-11-05 13:17:13.702922	2017-11-05 13:17:13.702922	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000129	1000000023	2017-11-05 13:18:13.669352	2017-11-05 13:18:13.669352	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000130	1000000023	2017-11-05 13:19:13.670784	2017-11-05 13:19:13.670784	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000131	1000000023	2017-11-05 13:20:13.766221	2017-11-05 13:20:13.766221	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000132	1000000023	2017-11-05 13:21:13.675648	2017-11-05 13:21:13.675648	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000133	1000000023	2017-11-05 13:22:13.762084	2017-11-05 13:22:13.762084	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000134	1000000023	2017-11-05 13:23:13.819519	2017-11-05 13:23:13.819519	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000135	1000000023	2017-11-05 13:24:13.722946	2017-11-05 13:24:13.722946	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000136	1000000023	2017-11-05 13:25:13.77438	2017-11-05 13:25:13.77438	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000137	1000000023	2017-11-05 13:26:13.803814	2017-11-05 13:26:13.803814	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000138	1000000023	2017-11-05 13:27:13.789245	2017-11-05 13:27:13.789245	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000139	1000000023	2017-11-05 13:28:13.84768	2017-11-05 13:28:13.84768	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000140	1000000023	2017-11-05 17:16:27.265217	2017-11-05 17:16:27.265217	null	null	null	null	null	null	null
1000000141	1000000023	2017-11-05 17:16:32.580521	2017-11-05 17:16:32.580521	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000142	1000000023	2017-11-05 17:17:32.463946	2017-11-05 17:17:32.463946	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000143	1000000023	2017-11-05 17:18:32.407375	2017-11-05 17:18:32.407375	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000144	1000000023	2017-11-05 17:19:32.619818	2017-11-05 17:19:32.619818	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000145	1000000023	2017-11-05 17:20:32.733257	2017-11-05 17:20:32.733257	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000146	1000000023	2017-11-05 17:21:32.668685	2017-11-05 17:21:32.668685	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000147	1000000023	2017-11-05 17:22:32.796124	2017-11-05 17:22:32.796124	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000148	1000000023	2017-11-05 17:23:32.769554	2017-11-05 17:23:32.769554	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000149	1000000023	2017-11-05 17:24:32.931995	2017-11-05 17:24:32.931995	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000150	1000000023	2017-11-05 17:25:32.869424	2017-11-05 17:25:32.869424	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000151	1000000023	2017-11-05 17:26:33.090868	2017-11-05 17:26:33.090868	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000152	1000000023	2017-11-05 17:27:32.957292	2017-11-05 17:27:32.957292	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000153	1000000023	2017-11-05 17:28:32.838717	2017-11-05 17:28:32.838717	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000154	1000000023	2017-11-05 17:29:32.839149	2017-11-05 17:29:32.839149	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000155	1000000023	2017-11-05 17:30:32.889584	2017-11-05 17:30:32.889584	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000156	1000000023	2017-11-05 17:31:32.910017	2017-11-05 17:31:32.910017	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000157	1000000023	2017-11-05 17:32:33.076458	2017-11-05 17:32:33.076458	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000158	1000000023	2017-11-05 17:33:33.022887	2017-11-05 17:33:33.022887	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000159	1000000023	2017-11-05 17:34:32.973316	2017-11-05 17:34:32.973316	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000160	1000000023	2017-11-05 17:35:32.973748	2017-11-05 17:35:32.973748	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000161	1000000023	2017-11-05 17:36:32.944178	2017-11-05 17:36:32.944178	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000162	1000000023	2017-11-05 17:37:32.938609	2017-11-05 17:37:32.938609	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000163	1000000023	2017-11-05 17:38:33.079049	2017-11-05 17:38:33.079049	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000164	1000000023	2017-11-05 17:39:32.979475	2017-11-05 17:39:32.979475	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000165	1000000023	2017-11-05 17:40:33.249922	2017-11-05 17:40:33.249922	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000166	1000000023	2017-11-05 17:41:33.366361	2017-11-05 17:41:33.366361	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000167	1000000023	2017-11-05 17:42:33.156781	2017-11-05 17:42:33.156781	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000168	1000000023	2017-11-05 17:43:33.932257	2017-11-05 17:43:33.932257	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000169	1000000023	2017-11-05 17:44:33.162645	2017-11-05 17:44:33.162645	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000170	1000000023	2017-11-05 17:45:33.124074	2017-11-05 17:45:33.124074	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000171	1000000023	2017-11-05 17:46:33.446524	2017-11-05 17:46:33.446524	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000172	1000000023	2017-11-05 17:47:33.301948	2017-11-05 17:47:33.301948	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000173	1000000023	2017-11-05 17:48:33.435387	2017-11-05 17:48:33.435387	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000174	1000000023	2017-11-05 17:49:33.349814	2017-11-05 17:49:33.349814	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000175	1000000023	2017-11-05 17:50:33.571259	2017-11-05 17:50:33.571259	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000176	1000000023	2017-11-05 17:51:33.329677	2017-11-05 17:51:33.329677	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000177	1000000023	2017-11-05 17:52:33.598124	2017-11-05 17:52:33.598124	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000178	1000000023	2017-11-05 17:54:08.055527	2017-11-05 17:54:08.055527	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000179	1000000023	2017-11-05 17:55:08.119962	2017-11-05 17:55:08.119962	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000180	1000000023	2017-11-05 17:56:08.100393	2017-11-05 17:56:08.100393	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000181	1000000023	2017-11-05 17:57:08.324837	2017-11-05 17:57:08.324837	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000182	1000000023	2017-11-05 17:58:08.193262	2017-11-05 17:58:08.193262	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000183	1000000023	2017-11-05 17:59:08.13969	2017-11-05 17:59:08.13969	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000184	1000000023	2017-11-05 18:00:08.27713	2017-11-05 18:00:08.27713	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000185	1000000023	2017-11-05 18:01:08.315564	2017-11-05 18:01:08.315564	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000186	1000000023	2017-11-05 18:02:08.264993	2017-11-05 18:02:08.264993	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000187	1000000023	2017-11-05 18:03:08.202421	2017-11-05 18:03:08.202421	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000188	1000000023	2017-11-05 18:04:08.244855	2017-11-05 18:04:08.244855	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000189	1000000023	2017-11-05 18:05:08.420297	2017-11-05 18:05:08.420297	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000190	1000000023	2017-11-05 18:06:08.650742	2017-11-05 18:06:08.650742	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000191	1000000023	2017-11-05 18:07:08.283153	2017-11-05 18:07:08.283153	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000192	1000000023	2017-11-05 18:08:08.309586	2017-11-05 18:08:08.309586	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000193	1000000023	2017-11-05 18:09:08.468027	2017-11-05 18:09:08.468027	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000194	1000000023	2017-11-05 18:10:08.434457	2017-11-05 18:10:08.434457	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000195	1000000023	2017-11-05 18:11:08.578897	2017-11-05 18:11:08.578897	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000196	1000000023	2017-11-05 18:12:08.59633	2017-11-05 18:12:08.59633	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000197	1000000020	2017-11-26 21:53:43.589013	2017-11-26 21:53:43.589013	null	null	null	null	null	null	null
1000000198	1000000020	2017-11-26 22:00:20.444712	2017-11-26 22:00:20.444712	null	null	null	null	null	null	null
1000000199	1000000020	2017-11-26 22:01:20.21713	2017-11-26 22:01:20.21713	null	null	null	null	null	null	null
1000000200	1000000020	2017-11-26 22:02:20.100556	2017-11-26 22:02:20.100556	null	null	null	null	null	null	null
1000000201	1000000020	2017-11-26 22:03:20.453008	2017-11-26 22:03:20.453008	null	null	null	null	null	null	null
1000000202	1000000020	2017-11-26 22:04:20.262428	2017-11-26 22:04:20.262428	null	null	null	null	null	null	null
1000000203	1000000020	2017-11-26 22:05:20.174855	2017-11-26 22:05:20.174855	null	null	null	null	null	null	null
1000000204	1000000020	2017-11-26 22:06:20.214289	2017-11-26 22:06:20.214289	null	null	null	null	null	null	null
1000000205	1000000020	2017-11-26 22:07:20.18772	2017-11-26 22:07:20.18772	null	null	null	null	null	null	null
1000000206	1000000020	2017-11-26 22:08:20.328159	2017-11-26 22:08:20.328159	null	null	null	null	null	null	null
1000000207	1000000020	2017-11-26 22:09:20.346592	2017-11-26 22:09:20.346592	null	null	null	null	null	null	null
1000000208	1000000020	2017-11-26 22:10:20.410028	2017-11-26 22:10:20.410028	null	null	null	null	null	null	null
1000000209	1000000020	2017-11-26 22:11:44.006809	2017-11-26 22:11:44.006809	null	null	null	null	null	null	null
1000000210	1000000020	2017-11-26 22:12:43.685223	2017-11-26 22:12:43.685223	null	null	null	null	null	null	null
1000000211	1000000020	2017-11-26 22:13:43.474642	2017-11-26 22:13:43.474642	null	null	null	null	null	null	null
1000000212	1000000020	2017-11-26 22:14:43.421071	2017-11-26 22:14:43.421071	null	null	null	null	null	null	null
1000000213	1000000020	2017-11-26 22:15:43.455505	2017-11-26 22:15:43.455505	null	null	null	null	null	null	null
1000000214	1000000020	2017-11-26 22:16:43.458937	2017-11-26 22:16:43.458937	null	null	null	null	null	null	null
1000000215	1000000020	2017-11-26 22:17:43.443368	2017-11-26 22:17:43.443368	null	null	null	null	null	null	null
1000000216	1000000020	2017-11-26 22:18:43.599808	2017-11-26 22:18:43.599808	null	null	null	null	null	null	null
1000000217	1000000020	2017-11-26 22:19:43.59724	2017-11-26 22:19:43.59724	null	null	null	null	null	null	null
1000000218	1000000020	2017-11-26 22:20:43.443663	2017-11-26 22:20:43.443663	null	null	null	null	null	null	null
1000000219	1000000020	2017-11-26 22:21:43.984126	2017-11-26 22:21:43.984126	null	null	null	null	null	null	null
1000000220	1000000020	2017-11-26 22:22:43.576534	2017-11-26 22:22:43.576534	null	null	null	null	null	null	null
1000000221	1000000020	2017-11-26 22:23:43.533964	2017-11-26 22:23:43.533964	null	null	null	null	null	null	null
1000000222	1000000020	2017-11-26 22:24:43.645402	2017-11-26 22:24:43.645402	null	null	null	null	null	null	null
1000000223	1000000020	2017-11-26 22:25:43.74884	2017-11-26 22:25:43.74884	null	null	null	null	null	null	null
1000000224	1000000020	2017-11-26 22:26:43.857278	2017-11-26 22:26:43.857278	null	null	null	null	null	null	null
1000000225	1000000020	2017-11-26 22:27:43.561693	2017-11-26 22:27:43.561693	null	null	null	null	null	null	null
1000000226	1000000020	2017-11-26 22:28:43.720133	2017-11-26 22:28:43.720133	null	null	null	null	null	null	null
1000000227	1000000020	2017-11-26 22:29:43.682563	2017-11-26 22:29:43.682563	null	null	null	null	null	null	null
1000000228	1000000020	2017-11-26 22:30:43.695996	2017-11-26 22:30:43.695996	null	null	null	null	null	null	null
1000000229	1000000020	2017-11-26 22:31:43.874438	2017-11-26 22:31:43.874438	null	null	null	null	null	null	null
1000000230	1000000020	2017-11-26 22:32:43.808866	2017-11-26 22:32:43.808866	null	null	null	null	null	null	null
1000000231	1000000020	2017-11-26 22:33:44.191319	2017-11-26 22:33:44.191319	null	null	null	null	null	null	null
1000000232	1000000020	2017-11-26 22:34:43.81373	2017-11-26 22:34:43.81373	null	null	null	null	null	null	null
1000000233	1000000020	2017-11-26 22:35:44.534203	2017-11-26 22:35:44.534203	null	null	null	null	null	null	null
1000000234	1000000020	2017-11-26 22:36:44.071608	2017-11-26 22:36:44.071608	null	null	null	null	null	null	null
1000000235	1000000020	2017-11-26 22:37:44.08004	2017-11-26 22:37:44.08004	null	null	null	null	null	null	null
1000000236	1000000020	2017-11-27 02:54:11.31414	2017-11-27 02:54:11.31414	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000237	1000000020	2017-11-27 02:55:11.390576	2017-11-27 02:55:11.390576	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000238	1000000020	2017-11-27 02:56:11.357006	2017-11-27 02:56:11.357006	GR	Greece	Chalandri	North Athens	Attica	Kosta Varnali 35A	152 33
1000000239	1000000020	2017-11-27 02:57:11.300434	2017-11-27 02:57:11.300434	GR	Greece	Chalandri	North Athens	Attica	Kosta Varnali 35A	152 33
1000000240	1000000020	2017-11-27 02:58:11.352869	2017-11-27 02:58:11.352869	GR	Greece	Chalandri	North Athens	Attica	Kosta Varnali 35A	152 33
1000000241	1000000020	2017-11-27 02:59:11.327299	2017-11-27 02:59:11.327299	null	null	null	null	null	null	null
1000000242	1000000020	2017-11-27 03:00:11.434737	2017-11-27 03:00:11.434737	GR	Greece	Attica	null	Attica	Aspropyrgos	null
1000000243	1000000020	2017-11-27 17:32:43.336508	2017-11-27 17:32:43.336508	GR	Greece	Attica	null	Attica	Aspropyrgos	null
1000000244	1000000020	2017-11-27 17:34:37.943063	2017-11-27 17:34:37.943063	null	null	null	null	null	null	null
1000000245	1000000020	2017-11-27 17:35:33.276228	2017-11-27 17:35:33.276228	GR	Greece	Attica	null	Attica	Aspropyrgos	null
1000000246	1000000020	2017-11-27 17:36:33.737687	2017-11-27 17:36:33.737687	GR	Greece	Attica	null	Attica	Aspropyrgos	null
1000000247	1000000020	2017-11-27 17:37:33.353096	2017-11-27 17:37:33.353096	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000248	1000000020	2017-11-27 17:38:33.294525	2017-11-27 17:38:33.294525	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000249	1000000020	2017-11-27 17:39:33.308957	2017-11-27 17:39:33.308957	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000250	1000000020	2017-11-27 17:40:33.342391	2017-11-27 17:40:33.342391	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000251	1000000020	2017-11-27 17:41:33.567836	2017-11-27 17:41:33.567836	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000252	1000000020	2017-11-27 17:42:33.354255	2017-11-27 17:42:33.354255	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000253	1000000020	2017-11-27 17:43:33.354687	2017-11-27 17:43:33.354687	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000254	1000000020	2017-11-27 17:44:33.37912	2017-11-27 17:44:33.37912	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000255	1000000020	2017-11-27 17:45:33.432555	2017-11-27 17:45:33.432555	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000256	1000000020	2017-11-29 23:31:03.031242	2017-11-29 23:31:03.031242	null	null	null	null	null	null	null
1000000257	1000000020	2017-11-29 23:32:02.983855	2017-11-29 23:32:02.983855	null	null	null	null	null	null	null
1000000258	1000000020	2017-11-29 23:33:03.012478	2017-11-29 23:33:03.012478	null	null	null	null	null	null	null
1000000259	1000000020	2017-11-29 23:33:59.047093	2017-11-29 23:33:59.047093	null	null	null	null	null	null	null
1000000260	1000000020	2017-11-29 23:35:00.536402	2017-11-29 23:35:00.536402	null	null	null	null	null	null	null
1000000261	1000000020	2017-11-29 23:36:19.068874	2017-11-29 23:36:19.068874	null	null	null	null	null	null	null
1000000262	1000000020	2017-11-29 23:36:59.060952	2017-11-29 23:36:59.060952	null	null	null	null	null	null	null
1000000263	1000000020	2017-11-29 23:39:20.306388	2017-11-29 23:39:20.306388	null	null	null	null	null	null	null
1000000264	1000000020	2017-11-29 23:41:54.184428	2017-11-29 23:41:54.184428	null	null	null	null	null	null	null
1000000265	1000000020	2017-11-29 23:42:37.833471	2017-11-29 23:42:37.833471	null	null	null	null	null	null	null
1000000266	1000000020	2017-11-29 23:43:54.286679	2017-11-29 23:43:54.286679	null	null	null	null	null	null	null
1000000267	1000000020	2017-11-29 23:44:34.923339	2017-11-29 23:44:34.923339	null	null	null	null	null	null	null
1000000268	1000000020	2017-11-29 23:47:00.129778	2017-11-29 23:47:00.129778	GR	Greece	Kalamata	Peloponnese	Peloponnisos Dytiki Ellada ke Ionio	Stadiou 4-18, Kalamata 241 00, Greece	241 00
1000000269	1000000020	2017-11-29 23:48:44.056475	2017-11-29 23:48:44.056475	GR	Greece	Kalamata	Peloponnese	Peloponnisos Dytiki Ellada ke Ionio	Athinon 34, Kalamata 241 00, Greece	241 00
1000000270	1000000020	2017-11-29 23:49:06.820866	2017-11-29 23:49:06.820866	GR	Greece	Kalamata	Peloponnese	Peloponnisos Dytiki Ellada ke Ionio	Athinon 95, Kalamata 241 00, Greece	241 00
1000000271	1000000020	2017-11-29 23:50:02.13339	2017-11-29 23:50:02.13339	GR	Greece	Kalamata	Peloponnese	Peloponnisos Dytiki Ellada ke Ionio	Athinon 95, Kalamata 241 00, Greece	241 00
1000000272	1000000020	2017-11-29 23:51:27.208693	2017-11-29 23:51:27.208693	GR	Greece	Kalamata	Peloponnese	Peloponnisos Dytiki Ellada ke Ionio	Athinon 95, Kalamata 241 00, Greece	241 00
1000000273	1000000020	2017-11-29 23:52:03.831844	2017-11-29 23:52:03.831844	GR	Greece	Kalamata	Peloponnese	Peloponnisos Dytiki Ellada ke Ionio	Athinon 95, Kalamata 241 00, Greece	241 00
1000000274	1000000020	2017-12-02 14:34:04.642786	2017-12-02 14:34:04.642786	null	null	null	null	null	null	null
1000000275	1000000020	2017-12-02 14:36:12.055466	2017-12-02 14:36:12.055466	null	null	null	null	null	null	null
1000000276	1000000020	2017-12-02 15:40:10.235853	2017-12-02 15:40:10.235853	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000277	1000000020	2017-12-02 15:41:48.452825	2017-12-02 15:41:48.452825	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000278	1000000020	2017-12-02 15:42:29.329515	2017-12-02 15:42:29.329515	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000279	1000000020	2017-12-02 15:43:08.407478	2017-12-02 15:43:08.407478	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000280	1000000020	2017-12-02 15:49:50.311013	2017-12-02 15:49:50.311013	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000281	1000000020	2017-12-02 16:32:16.864884	2017-12-02 16:32:16.864884	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000282	1000000020	2017-12-02 16:33:13.920129	2017-12-02 16:33:13.920129	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000283	1000000020	2017-12-02 16:34:46.362868	2017-12-02 16:34:46.362868	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000284	1000000020	2017-12-02 16:35:13.912867	2017-12-02 16:35:13.912867	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000285	1000000020	2017-12-02 16:36:13.933988	2017-12-02 16:36:13.933988	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000286	1000000020	2017-12-02 16:37:26.363686	2017-12-02 16:37:26.363686	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000287	1000000020	2017-12-02 16:38:13.911223	2017-12-02 16:38:13.911223	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000288	1000000020	2017-12-02 16:39:13.909342	2017-12-02 16:39:13.909342	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000289	1000000020	2017-12-02 16:40:13.97947	2017-12-02 16:40:13.97947	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000290	1000000020	2017-12-02 16:41:13.918081	2017-12-02 16:41:13.918081	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000291	1000000020	2017-12-02 16:42:53.926281	2017-12-02 16:42:53.926281	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000292	1000000020	2017-12-02 16:43:13.947323	2017-12-02 16:43:13.947323	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000293	1000000020	2017-12-02 16:44:13.957443	2017-12-02 16:44:13.957443	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000294	1000000020	2017-12-02 16:45:33.934599	2017-12-02 16:45:33.934599	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000295	1000000020	2017-12-02 16:46:13.912676	2017-12-02 16:46:13.912676	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000296	1000000020	2017-12-02 16:47:15.000433	2017-12-02 16:47:15.000433	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000297	1000000020	2017-12-02 16:48:13.96192	2017-12-02 16:48:13.96192	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000298	1000000020	2017-12-02 16:49:13.928535	2017-12-02 16:49:13.928535	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000299	1000000029	2017-12-02 16:52:15.302066	2017-12-02 16:52:15.302066	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000300	1000000029	2017-12-02 16:53:15.289684	2017-12-02 16:53:15.289684	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000301	1000000029	2017-12-02 16:54:53.648174	2017-12-02 16:54:53.648174	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000302	1000000029	2017-12-02 16:55:15.285421	2017-12-02 16:55:15.285421	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000303	1000000029	2017-12-02 16:56:15.271539	2017-12-02 16:56:15.271539	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000304	1000000029	2017-12-02 16:57:33.621988	2017-12-02 16:57:33.621988	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000305	1000000029	2017-12-02 16:58:15.278278	2017-12-02 16:58:15.278278	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000306	1000000029	2017-12-02 16:59:15.273396	2017-12-02 16:59:15.273396	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000307	1000000029	2017-12-02 17:00:15.86109	2017-12-02 17:00:15.86109	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000308	1000000029	2017-12-02 17:01:15.274634	2017-12-02 17:01:15.274634	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000309	1000000029	2017-12-02 17:02:15.279254	2017-12-02 17:02:15.279254	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000310	1000000029	2017-12-02 17:03:15.266371	2017-12-02 17:03:15.266371	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000311	1000000029	2017-12-02 17:40:24.162798	2017-12-02 17:40:24.162798	null	null	null	null	null	null	null
1000000312	1000000029	2017-12-02 17:41:20.40594	2017-12-02 17:41:20.40594	null	null	null	null	null	null	null
1000000313	1000000029	2017-12-02 17:42:25.546711	2017-12-02 17:42:25.546711	null	null	null	null	null	null	null
1000000314	1000000029	2017-12-02 17:43:20.358672	2017-12-02 17:43:20.358672	null	null	null	null	null	null	null
1000000315	1000000029	2017-12-02 17:44:20.408297	2017-12-02 17:44:20.408297	null	null	null	null	null	null	null
1000000316	1000000029	2017-12-02 17:45:20.382413	2017-12-02 17:45:20.382413	null	null	null	null	null	null	null
1000000317	1000000030	2017-12-03 18:57:11.100846	2017-12-03 18:57:11.100846	null	null	null	null	null	null	null
1000000318	1000000030	2017-12-10 15:29:41.873298	2017-12-10 15:29:41.873298	null	null	null	null	null	null	null
1000000319	1000000030	2017-12-10 18:53:13.383029	2017-12-10 18:53:13.383029	null	null	null	null	null	null	null
\.


--
-- Name: i_location_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('i_location_id_seq', 1000000319, true);


--
-- Data for Name: i_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY i_user (i_user_id, i_creation_date, i_last_update_date, i_first_name, i_last_name, i_mobile_number, i_username, i_password, i_email_address, i_register_type) FROM stdin;
1000000020	2017-10-12 19:55:19.392707	2017-10-12 19:55:19.392707	Ioannis	Kozompolis	6971903121	giannis		g.kozompolis@gmail.com	\N
1000000021	2017-10-12 19:57:45.490063	2017-10-12 19:57:45.490063	Ioannis 	Kozompolis	6971903121	giannis2		g.kozompolis@gmail.com	\N
1000000022	2017-10-12 20:55:23.476849	2017-10-12 20:55:23.476849	aek	ole	6971903121	aek		giannis1990@gmail.com	\N
1000000023	2017-10-12 21:08:52.548125	2017-10-12 21:08:52.548125	giannis4			giannis4			\N
1000000024	2017-10-14 21:22:11.872753	2017-10-14 21:22:11.872753	giannis5			giannis5			\N
1000000025	2017-10-14 21:27:15.417114	2017-10-14 21:27:15.417114	giannis6			giannis6			\N
1000000026	2017-11-25 21:04:47.794319	2017-11-25 21:04:47.794319	Ioannis	Kozompolis	6971903121	giannis2669		g.kozompolis@gmail.com	\N
1000000027	2017-12-02 16:22:39.382553	2017-12-02 16:22:39.382553	Ioannnis	Kozompolis	6971903121	kozo		g.kozompolis@gmail.com	\N
1000000028	2017-12-02 16:30:33.483257	2017-12-02 16:30:33.483257				kozompolis			\N
1000000029	2017-12-02 16:52:05.125274	2017-12-02 16:52:05.125274				testuser1			\N
1000000030	2017-12-03 17:55:53.547356	2017-12-03 17:55:53.547356	John	Kozo		1127478420719730		g.kozompolis@gmail.com	\N
\.


--
-- Name: i_user_i_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('i_user_i_user_id_seq', 1000000030, true);


--
-- Name: i_work_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('i_work_id_seq', 1000000023, true);


--
-- Data for Name: i_work_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY i_work_info (i_work_id, i_user_id, i_creation_date, i_last_update_date, i_work_employer, i_work_position) FROM stdin;
1000000008	1000000020	2017-12-09 18:07:12.183065	2017-12-09 18:07:12.183065	Almasport	Sales
1000000009	1000000020	2017-12-09 18:13:25.564421	2017-12-09 18:13:25.564421	\N	\N
1000000010	1000000030	2017-12-10 14:28:51.964701	2017-12-10 14:28:51.964701	Velti	QA Engineer
1000000011	1000000030	2017-12-10 15:26:23.561616	2017-12-10 15:26:23.561616	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000012	1000000030	2017-12-10 15:31:11.868226	2017-12-10 15:31:11.868226	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000013	1000000030	2017-12-10 15:32:59.937949	2017-12-10 15:32:59.937949	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000014	1000000030	2017-12-10 15:34:53.439362	2017-12-10 15:34:53.439362	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000015	1000000030	2017-12-10 16:19:59.583499	2017-12-10 16:19:59.583499	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000016	1000000030	2017-12-10 16:21:56.754378	2017-12-10 16:21:56.754378	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000017	1000000030	2017-12-10 16:25:51.281659	2017-12-10 16:25:51.281659	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000018	1000000030	2017-12-10 18:58:47.20742	2017-12-10 18:58:47.20742	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000019	1000000030	2017-12-10 18:58:47.239924	2017-12-10 18:58:47.239924	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000020	1000000030	2017-12-10 19:03:49.897356	2017-12-10 19:03:49.897356	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000021	1000000030	2017-12-10 19:20:44.539699	2017-12-10 19:20:44.539699	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000022	1000000030	2017-12-10 19:24:38.35189	2017-12-10 19:24:38.35189	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000023	1000000030	2017-12-10 19:27:42.773308	2017-12-10 19:27:42.773308	Velti S.A.	Quality Assurance Engineer (QA Engineer)
\.


--
-- Name: i_education_info i_education_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_education_info
    ADD CONSTRAINT i_education_info_pkey PRIMARY KEY (i_education_id);


--
-- Name: i_fb_books i_fb_books_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_books
    ADD CONSTRAINT i_fb_books_pkey PRIMARY KEY (i_fb_books_id);


--
-- Name: i_fb_events i_fb_events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_events
    ADD CONSTRAINT i_fb_events_pkey PRIMARY KEY (i_fb_events_id);


--
-- Name: i_fb_favorite_teams i_fb_favorite_team_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_favorite_teams
    ADD CONSTRAINT i_fb_favorite_team_pkey PRIMARY KEY (i_fb_favorite_teams_id);


--
-- Name: i_fb_music i_fb_music_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_music
    ADD CONSTRAINT i_fb_music_pkey PRIMARY KEY (i_fb_music_id);


--
-- Name: i_interest_fb_pages i_interest_pages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_interest_fb_pages
    ADD CONSTRAINT i_interest_pages_pkey PRIMARY KEY (i_interest_pages_id);


--
-- Name: i_location i_location_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_location
    ADD CONSTRAINT i_location_pkey PRIMARY KEY (i_location_id);


--
-- Name: i_user i_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_user
    ADD CONSTRAINT i_user_pkey PRIMARY KEY (i_user_id);


--
-- Name: i_work_info i_work_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_work_info
    ADD CONSTRAINT i_work_info_pkey PRIMARY KEY (i_work_id);


--
-- Name: fki_E; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_E" ON i_education_info USING btree (i_user_id);


--
-- Name: fki_F; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_F" ON i_interest_fb_pages USING btree (i_user_id);


--
-- Name: fki_G; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_G" ON i_fb_events USING btree (i_user_id);


--
-- Name: fki_H; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_H" ON i_fb_events USING btree (i_user_id);


--
-- Name: fki_I; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_I" ON i_fb_events USING btree (i_user_id);


--
-- Name: fki_J; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_J" ON i_fb_favorite_teams USING btree (i_user_id);


--
-- Name: fki_i_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_i_user_id ON i_work_info USING btree (i_user_id);


--
-- Name: i_education_info Update_Data; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "Update_Data" BEFORE UPDATE ON i_education_info FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- Name: i_interest_fb_pages Update_Data; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "Update_Data" BEFORE UPDATE ON i_interest_fb_pages FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- Name: i_fb_events Update_Data; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "Update_Data" BEFORE UPDATE ON i_fb_events FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- Name: i_fb_books Update_Data; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "Update_Data" BEFORE UPDATE ON i_fb_books FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- Name: i_fb_music Update_Data; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "Update_Data" BEFORE UPDATE ON i_fb_music FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- Name: i_fb_favorite_teams Update_Data; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "Update_Data" BEFORE UPDATE ON i_fb_favorite_teams FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- Name: i_location Update_last_update_date; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "Update_last_update_date" BEFORE UPDATE ON i_location FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- Name: i_user set_timestamp; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER set_timestamp BEFORE UPDATE ON i_user FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- Name: i_work_info set_timestamp; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER set_timestamp BEFORE UPDATE ON i_work_info FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- Name: i_location User ID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_location
    ADD CONSTRAINT "User ID" FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id);


--
-- Name: i_education_info User_id_in_education_info; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_education_info
    ADD CONSTRAINT "User_id_in_education_info" FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: i_fb_books User_id_in_i_fb_books; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_books
    ADD CONSTRAINT "User_id_in_i_fb_books" FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- Name: i_fb_events User_id_in_i_fb_events; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_events
    ADD CONSTRAINT "User_id_in_i_fb_events" FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- Name: i_fb_favorite_teams User_id_in_i_fb_favorite_teams; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_favorite_teams
    ADD CONSTRAINT "User_id_in_i_fb_favorite_teams" FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- Name: i_fb_music User_id_in_i_fb_music; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_music
    ADD CONSTRAINT "User_id_in_i_fb_music" FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- Name: i_interest_fb_pages User_id_in_interest_pages; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_interest_fb_pages
    ADD CONSTRAINT "User_id_in_interest_pages" FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- Name: i_education_info fkck4ugidmocgo1ugp68cqndwgc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_education_info
    ADD CONSTRAINT fkck4ugidmocgo1ugp68cqndwgc FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id);


--
-- Name: i_work_info fkcoqbcg27jlgcyjfnh4n65uehx; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_work_info
    ADD CONSTRAINT fkcoqbcg27jlgcyjfnh4n65uehx FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id);


--
-- Name: i_location fkg0rrrwit513pw13pr3n3o2u4e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_location
    ADD CONSTRAINT fkg0rrrwit513pw13pr3n3o2u4e FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id);


--
-- Name: i_work_info i_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_work_info
    ADD CONSTRAINT i_user_id FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: i_education_info i_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_education_info
    ADD CONSTRAINT i_user_id FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: i_interest_fb_pages i_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_interest_fb_pages
    ADD CONSTRAINT i_user_id FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- Name: i_fb_events i_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_events
    ADD CONSTRAINT i_user_id FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- Name: i_fb_books i_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_books
    ADD CONSTRAINT i_user_id FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- Name: i_fb_music i_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_music
    ADD CONSTRAINT i_user_id FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- Name: i_fb_favorite_teams i_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_favorite_teams
    ADD CONSTRAINT i_user_id FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: register_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE register_type AS ENUM (
    'facebook',
    'custom'
);


ALTER TYPE register_type OWNER TO postgres;

--
-- Name: trigger_set_timestamp(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION trigger_set_timestamp() RETURNS trigger
    LANGUAGE plpgsql
    AS $$  
BEGIN  
  NEW.i_last_update_date = NOW();
  RETURN NEW;
END;  
$$;


ALTER FUNCTION public.trigger_set_timestamp() OWNER TO postgres;

--
-- Name: greeting_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE greeting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE greeting_id_seq OWNER TO postgres;

--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hibernate_sequence OWNER TO postgres;

--
-- Name: i_education_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE i_education_id_seq
    START WITH 1000000000
    INCREMENT BY 1
    MINVALUE 1000000000
    MAXVALUE 9999999999999
    CACHE 1;


ALTER TABLE i_education_id_seq OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: i_education_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE i_education_info (
    i_education_id bigint DEFAULT nextval('i_education_id_seq'::regclass) NOT NULL,
    i_user_id bigint NOT NULL,
    i_creation_date timestamp(6) without time zone DEFAULT now(),
    i_last_update_date timestamp(6) without time zone DEFAULT now(),
    i_edu_degree character varying(100),
    i_edu_school character varying(100),
    i_edu_type character varying(100),
    i_edu_year character varying(20)
);


ALTER TABLE i_education_info OWNER TO postgres;

--
-- Name: i_fb_books_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE i_fb_books_id_seq
    START WITH 1000000000
    INCREMENT BY 1
    MINVALUE 1000000000
    MAXVALUE 9999999999999
    CACHE 1;


ALTER TABLE i_fb_books_id_seq OWNER TO postgres;

--
-- Name: i_fb_books; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE i_fb_books (
    i_fb_books_id bigint DEFAULT nextval('i_fb_books_id_seq'::regclass) NOT NULL,
    i_user_id bigint NOT NULL,
    i_creation_date timestamp(6) without time zone DEFAULT now(),
    i_last_update_date timestamp(6) without time zone DEFAULT now(),
    i_book_name character varying(100),
    i_book_description character varying(400)
);


ALTER TABLE i_fb_books OWNER TO postgres;

--
-- Name: i_fb_events_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE i_fb_events_id_seq
    START WITH 1000000000
    INCREMENT BY 1
    MINVALUE 1000000000
    MAXVALUE 999999999999999
    CACHE 1;


ALTER TABLE i_fb_events_id_seq OWNER TO postgres;

--
-- Name: i_fb_events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE i_fb_events (
    i_fb_events_id bigint DEFAULT nextval('i_fb_events_id_seq'::regclass) NOT NULL,
    i_user_id bigint NOT NULL,
    i_creation_date timestamp(6) without time zone DEFAULT now(),
    i_last_update_date timestamp(6) without time zone DEFAULT now(),
    i_event_name character varying(100),
    i_event_description character varying(400),
    i_event_start_date timestamp(6) without time zone
);


ALTER TABLE i_fb_events OWNER TO postgres;

--
-- Name: i_fb_favorite_teams_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE i_fb_favorite_teams_id_seq
    START WITH 1000000000
    INCREMENT BY 1
    MINVALUE 1000000000
    MAXVALUE 9999999999999
    CACHE 1;


ALTER TABLE i_fb_favorite_teams_id_seq OWNER TO postgres;

--
-- Name: i_fb_favorite_teams; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE i_fb_favorite_teams (
    i_fb_favorite_teams_id bigint DEFAULT nextval('i_fb_favorite_teams_id_seq'::regclass) NOT NULL,
    i_user_id bigint NOT NULL,
    i_creation_date timestamp(6) without time zone DEFAULT now(),
    i_last_update_date timestamp(6) without time zone DEFAULT now(),
    i_team_name character varying(100)
);


ALTER TABLE i_fb_favorite_teams OWNER TO postgres;

--
-- Name: i_fb_music_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE i_fb_music_id_seq
    START WITH 1000000000
    INCREMENT BY 1
    MINVALUE 1000000000
    MAXVALUE 9999999999999
    CACHE 1;


ALTER TABLE i_fb_music_id_seq OWNER TO postgres;

--
-- Name: i_fb_music; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE i_fb_music (
    i_fb_music_id bigint DEFAULT nextval('i_fb_music_id_seq'::regclass) NOT NULL,
    i_user_id bigint NOT NULL,
    i_creation_date timestamp(6) without time zone DEFAULT now(),
    i_last_update_date timestamp(6) without time zone DEFAULT now(),
    i_music_title character varying(100)
);


ALTER TABLE i_fb_music OWNER TO postgres;

--
-- Name: i_interest_pages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE i_interest_pages_id_seq
    START WITH 1000000000
    INCREMENT BY 1
    MINVALUE 1000000000
    MAXVALUE 99999999999999
    CACHE 1;


ALTER TABLE i_interest_pages_id_seq OWNER TO postgres;

--
-- Name: i_interest_fb_pages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE i_interest_fb_pages (
    i_interest_pages_id bigint DEFAULT nextval('i_interest_pages_id_seq'::regclass) NOT NULL,
    i_user_id bigint NOT NULL,
    i_creation_date timestamp(6) without time zone DEFAULT now(),
    i_last_update_date timestamp(6) without time zone DEFAULT now(),
    i_page_name character varying(100),
    i_page_description character varying(400)
);


ALTER TABLE i_interest_fb_pages OWNER TO postgres;

--
-- Name: i_location_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE i_location_id_seq
    START WITH 1000000001
    INCREMENT BY 1
    MINVALUE 1000000001
    MAXVALUE 99999999999999
    CACHE 1;


ALTER TABLE i_location_id_seq OWNER TO postgres;

--
-- Name: i_location; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE i_location (
    i_location_id bigint DEFAULT nextval('i_location_id_seq'::regclass) NOT NULL,
    i_user_id bigint NOT NULL,
    i_creation_date timestamp(6) without time zone DEFAULT now(),
    i_last_update_date timestamp(6) without time zone DEFAULT now(),
    i_country_code character varying(5),
    i_country_name character varying(50),
    i_city_name character varying(50),
    i_prefecture character varying(50),
    i_department character varying(50),
    i_street_address character varying(100),
    i_postal_code character varying(10)
);


ALTER TABLE i_location OWNER TO postgres;

--
-- Name: i_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE i_user (
    i_user_id bigint NOT NULL,
    i_creation_date timestamp(6) without time zone DEFAULT now() NOT NULL,
    i_last_update_date timestamp(6) without time zone DEFAULT now() NOT NULL,
    i_first_name character varying(50),
    i_last_name character varying(50),
    i_mobile_number character varying(20),
    i_username character varying(50),
    i_password character varying(50),
    i_email_address character varying(100),
    i_register_type character varying(100)
);


ALTER TABLE i_user OWNER TO postgres;

--
-- Name: i_user_i_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE i_user_i_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE i_user_i_user_id_seq OWNER TO postgres;

--
-- Name: i_user_i_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE i_user_i_user_id_seq OWNED BY i_user.i_user_id;


--
-- Name: i_work_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE i_work_id_seq
    START WITH 1000000000
    INCREMENT BY 1
    MINVALUE 1000000000
    MAXVALUE 999999999999999
    CACHE 1;


ALTER TABLE i_work_id_seq OWNER TO postgres;

--
-- Name: i_work_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE i_work_info (
    i_work_id bigint DEFAULT nextval('i_work_id_seq'::regclass) NOT NULL,
    i_user_id bigint NOT NULL,
    i_creation_date timestamp(6) without time zone DEFAULT now() NOT NULL,
    i_last_update_date timestamp(6) without time zone DEFAULT now(),
    i_work_employer character varying(100),
    i_work_position character varying(100)
);


ALTER TABLE i_work_info OWNER TO postgres;

--
-- Name: i_user i_user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_user ALTER COLUMN i_user_id SET DEFAULT nextval('i_user_i_user_id_seq'::regclass);


--
-- Name: greeting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('greeting_id_seq', 1, false);


--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('hibernate_sequence', 6, true);


--
-- Name: i_education_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('i_education_id_seq', 1000000005, true);


--
-- Data for Name: i_education_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY i_education_info (i_education_id, i_user_id, i_creation_date, i_last_update_date, i_edu_degree, i_edu_school, i_edu_type, i_edu_year) FROM stdin;
1000000003	1000000030	2017-12-10 19:27:42.874321	2017-12-10 19:27:42.874321		Department of Applied Informatics and Multimedia of Crete	College	2012
1000000004	1000000030	2017-12-10 19:27:42.934329	2017-12-10 19:27:42.934329	Advanced Softaware Development Technologies	University of Piraeus	Graduate School	2017
1000000005	1000000020	2017-12-14 17:43:17.307915	2017-12-14 17:43:17.307915	Master	University of Piraeus	IT	2017
\.


--
-- Data for Name: i_fb_books; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY i_fb_books (i_fb_books_id, i_user_id, i_creation_date, i_last_update_date, i_book_name, i_book_description) FROM stdin;
1000000000	1000000020	2017-12-13 17:13:27.565242	2017-12-13 17:13:54.776242	The Secret	The secret book only for adults
1000000001	1000000020	2017-12-14 13:23:58.544692	2017-12-14 13:23:58.544692	Pinocio	Pinocio adventures
\.


--
-- Name: i_fb_books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('i_fb_books_id_seq', 1000000001, true);


--
-- Data for Name: i_fb_events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY i_fb_events (i_fb_events_id, i_user_id, i_creation_date, i_last_update_date, i_event_name, i_event_description, i_event_start_date) FROM stdin;
1000000000	1000000020	2017-12-13 16:46:29.113914	2017-12-13 16:49:20.508051	2nd Marathon Kalamatas	Marathon on Kalamata first time ever	\N
1000000001	1000000020	2017-12-13 16:47:54.9875	2017-12-13 16:49:20.508051	2nd Marathon Kalamatas	Marathon on Kalamata first time ever	2017-12-13 16:47:54.9875
1000000003	1000000020	2017-12-14 17:28:41.17431	2017-12-14 17:28:41.17431	Velti Party	Velti party all the time	\N
1000000004	1000000021	2017-12-14 17:29:01.705363	2017-12-14 17:29:01.705363	Velti Party	Velti party all the time	\N
\.


--
-- Name: i_fb_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('i_fb_events_id_seq', 1000000004, true);


--
-- Data for Name: i_fb_favorite_teams; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY i_fb_favorite_teams (i_fb_favorite_teams_id, i_user_id, i_creation_date, i_last_update_date, i_team_name) FROM stdin;
1000000000	1000000020	2017-12-13 17:50:42.613253	2017-12-13 17:51:24.465438	AEK F.C.
1000000001	1000000020	2017-12-15 12:24:28.46332	2017-12-15 12:24:28.46332	AEK B.C.
\.


--
-- Name: i_fb_favorite_teams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('i_fb_favorite_teams_id_seq', 1000000001, true);


--
-- Data for Name: i_fb_music; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY i_fb_music (i_fb_music_id, i_user_id, i_creation_date, i_last_update_date, i_music_title) FROM stdin;
1000000000	1000000020	2017-12-13 17:26:30.425242	2017-12-13 17:26:40.697242	Eminem
1000000001	1000000020	2017-12-13 17:27:14.616468	2017-12-13 17:27:14.616468	Secret
1000000002	1000000020	2017-12-15 11:35:34.990002	2017-12-15 11:35:34.990002	Eminem
1000000003	1000000020	2017-12-15 11:35:50.489552	2017-12-15 11:35:50.489552	Tonis Sfinos
1000000004	1000000020	2017-12-15 11:57:50.097499	2017-12-15 11:57:50.097499	Tonis Sfinos
\.


--
-- Name: i_fb_music_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('i_fb_music_id_seq', 1000000004, true);


--
-- Data for Name: i_interest_fb_pages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY i_interest_fb_pages (i_interest_pages_id, i_user_id, i_creation_date, i_last_update_date, i_page_name, i_page_description) FROM stdin;
1000000004	1000000020	2017-12-15 12:02:57.03919	2017-12-15 12:02:57.03919	Almasport	Athletic store
\.


--
-- Name: i_interest_pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('i_interest_pages_id_seq', 1000000004, true);


--
-- Data for Name: i_location; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY i_location (i_location_id, i_user_id, i_creation_date, i_last_update_date, i_country_code, i_country_name, i_city_name, i_prefecture, i_department, i_street_address, i_postal_code) FROM stdin;
1000000002	1000000020	2017-10-29 15:07:49.898223	2017-10-29 15:13:11.877639	GR	Greece	Athens	Attica	Attica	Saronos 4	11143
1000000003	1000000020	2017-10-29 16:48:07.275397	2017-10-29 16:48:07.275397	GR	Greece	Kalamata	Messinia	Peloponissos	loggas 8	24100
1000000005	1000000020	2017-10-29 16:51:42.444704	2017-10-29 16:51:42.444704	GR	Greece	Kalamata	Messinia	Peloponissos	loggas 10	24100
1000000006	1000000020	2017-10-29 22:05:11.732534	2017-10-29 22:05:11.732534	GR	Greece	Kalamata	Messinia	Peloponissos	loggas 10	24100
1000000010	1000000023	2017-10-30 20:31:47.543345	2017-10-30 20:31:47.543345	GR	Greece	Kalamata	Messenia	Peloponnisos Dytiki Ellada ke Ionio	Aristomenous 45	24100
1000000011	1000000023	2017-10-30 20:35:56.798602	2017-10-30 20:35:56.798602	GR	Greece	Kalamata	Messenia	Peloponnisos Dytiki Ellada ke Ionio	Aristomenous 45	241 00
1000000012	1000000023	2017-10-30 20:40:59.183897	2017-10-30 20:40:59.183897	GR	Greece	Kalamata	Messenia	Peloponnisos Dytiki Ellada ke Ionio	Aristomenous 45	241 00
1000000013	1000000023	2017-10-30 22:13:09.887235	2017-10-30 22:13:09.887235	GR	Greece	Kalamata	Messenia	Peloponnisos Dytiki Ellada ke Ionio	Aristomenous 45	241 00
1000000014	1000000023	2017-10-30 22:27:02.560862	2017-10-30 22:27:02.560862	GR	Greece	Kalamata	Messenia	Peloponnisos Dytiki Ellada ke Ionio	Aristomenous 45	241 00
1000000015	1000000023	2017-10-30 22:55:44.872372	2017-10-30 22:55:44.872372	GR	Greece	Filadelfeia-Chalkidona	Central Athens	Attica	Marathonos 8	143 43
1000000016	1000000023	2017-10-30 23:05:47.623848	2017-10-30 23:05:47.623848	GR	Greece	Filadelfeia-Chalkidona	Central Athens	Attica	Anakous 60	143 41
1000000017	1000000023	2017-10-30 23:06:59.639967	2017-10-30 23:06:59.639967	GR	Greece	Pireas	Piraeus	Attica	Praxitelous 238	185 36
1000000018	1000000023	2017-10-30 23:10:34.107233	2017-10-30 23:10:34.107233	GR	Greece	West Mani	Messenia	Peloponnisos Dytiki Ellada ke Ionio	Unnamed Road	241 00
1000000019	1000000023	2017-11-03 00:30:52.691688	2017-11-03 00:30:52.691688	GR	Greece	Athens	Central Athens	Attica	Acharnon 458	111 43
1000000020	1000000023	2017-11-03 00:30:54.545794	2017-11-03 00:30:54.545794	GR	Greece	Athens	Central Athens	Attica	Acharnon 458	111 43
1000000021	1000000023	2017-11-03 00:31:50.367987	2017-11-03 00:31:50.367987	GR	Greece	Athens	Central Athens	Attica	Acharnon 458	111 43
1000000022	1000000023	2017-11-03 00:32:50.325416	2017-11-03 00:32:50.325416	GR	Greece	Athens	Central Athens	Attica	Acharnon 458	111 43
1000000023	1000000023	2017-11-03 00:33:50.36485	2017-11-03 00:33:50.36485	GR	Greece	Athens	Central Athens	Attica	Acharnon 458	111 43
1000000024	1000000023	2017-11-03 00:34:50.398284	2017-11-03 00:34:50.398284	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000025	1000000023	2017-11-03 00:35:50.441718	2017-11-03 00:35:50.441718	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000026	1000000023	2017-11-04 23:30:28.230643	2017-11-04 23:30:28.230643	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000028	1000000023	2017-11-04 23:30:28.236644	2017-11-04 23:30:28.236644	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000027	1000000023	2017-11-04 23:30:28.230643	2017-11-04 23:30:28.230643	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000029	1000000023	2017-11-04 23:30:30.690784	2017-11-04 23:30:30.690784	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000030	1000000023	2017-11-04 23:31:49.311281	2017-11-04 23:31:49.311281	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000031	1000000023	2017-11-04 23:32:52.991923	2017-11-04 23:32:52.991923	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000032	1000000023	2017-11-04 23:33:50.62922	2017-11-04 23:33:50.62922	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000033	1000000023	2017-11-04 23:34:52.52276	2017-11-04 23:34:52.52276	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000034	1000000023	2017-11-04 23:35:54.458302	2017-11-04 23:35:54.458302	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000035	1000000023	2017-11-04 23:35:56.125398	2017-11-04 23:35:56.125398	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000036	1000000023	2017-11-04 23:36:53.727692	2017-11-04 23:36:53.727692	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000037	1000000023	2017-11-04 23:36:53.728692	2017-11-04 23:36:53.728692	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000038	1000000023	2017-11-04 23:37:49.118861	2017-11-04 23:37:49.118861	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000040	1000000023	2017-11-04 23:38:55.993686	2017-11-04 23:38:55.993686	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000039	1000000023	2017-11-04 23:38:55.991685	2017-11-04 23:38:55.991685	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000041	1000000023	2017-11-04 23:40:49.124156	2017-11-04 23:40:49.124156	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000042	1000000023	2017-11-04 23:42:54.790344	2017-11-04 23:42:54.790344	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000043	1000000023	2017-11-04 23:42:54.791344	2017-11-04 23:42:54.791344	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000044	1000000023	2017-11-04 23:44:50.221946	2017-11-04 23:44:50.221946	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000045	1000000023	2017-11-04 23:46:50.57783	2017-11-04 23:46:50.57783	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000046	1000000023	2017-11-04 23:48:49.182614	2017-11-04 23:48:49.182614	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000047	1000000023	2017-11-05 00:38:27.199628	2017-11-05 00:38:27.199628	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000048	1000000023	2017-11-05 02:38:10.608822	2017-11-05 02:38:10.608822	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000049	1000000023	2017-11-05 04:38:18.804108	2017-11-05 04:38:18.804108	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000050	1000000023	2017-11-05 06:38:19.850984	2017-11-05 06:38:19.850984	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000051	1000000023	2017-11-05 08:38:20.844857	2017-11-05 08:38:20.844857	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000052	1000000023	2017-11-05 10:38:22.506769	2017-11-05 10:38:22.506769	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000053	1000000023	2017-11-05 12:02:00.795798	2017-11-05 12:02:00.795798	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000054	1000000023	2017-11-05 12:02:58.915123	2017-11-05 12:02:58.915123	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000055	1000000023	2017-11-05 12:03:58.889553	2017-11-05 12:03:58.889553	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000056	1000000023	2017-11-05 12:04:58.849982	2017-11-05 12:04:58.849982	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000057	1000000023	2017-11-05 12:05:58.931419	2017-11-05 12:05:58.931419	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000058	1000000023	2017-11-05 12:07:12.491626	2017-11-05 12:07:12.491626	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000059	1000000023	2017-11-05 12:08:12.430055	2017-11-05 12:08:12.430055	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000060	1000000023	2017-11-05 12:09:12.404485	2017-11-05 12:09:12.404485	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000061	1000000023	2017-11-05 12:10:12.46392	2017-11-05 12:10:12.46392	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000062	1000000023	2017-11-05 12:11:12.42135	2017-11-05 12:11:12.42135	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000063	1000000023	2017-11-05 12:12:12.507786	2017-11-05 12:12:12.507786	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000064	1000000023	2017-11-05 12:13:12.557221	2017-11-05 12:13:12.557221	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000065	1000000023	2017-11-05 12:14:12.497649	2017-11-05 12:14:12.497649	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000066	1000000023	2017-11-05 12:15:12.458079	2017-11-05 12:15:12.458079	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000067	1000000023	2017-11-05 12:16:12.472511	2017-11-05 12:16:12.472511	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000068	1000000023	2017-11-05 12:17:12.539947	2017-11-05 12:17:12.539947	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000069	1000000023	2017-11-05 12:18:12.491376	2017-11-05 12:18:12.491376	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000070	1000000023	2017-11-05 12:19:12.488808	2017-11-05 12:19:12.488808	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000071	1000000023	2017-11-05 12:20:12.612247	2017-11-05 12:20:12.612247	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000072	1000000023	2017-11-05 12:21:12.63268	2017-11-05 12:21:12.63268	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000073	1000000023	2017-11-05 12:22:12.61011	2017-11-05 12:22:12.61011	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000074	1000000023	2017-11-05 12:23:12.660545	2017-11-05 12:23:12.660545	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000075	1000000023	2017-11-05 12:24:12.583972	2017-11-05 12:24:12.583972	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000076	1000000023	2017-11-05 12:25:12.542402	2017-11-05 12:25:12.542402	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000077	1000000023	2017-11-05 12:26:12.676841	2017-11-05 12:26:12.676841	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000078	1000000023	2017-11-05 12:27:12.730276	2017-11-05 12:27:12.730276	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000079	1000000023	2017-11-05 12:28:12.719707	2017-11-05 12:28:12.719707	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000080	1000000023	2017-11-05 12:29:12.750141	2017-11-05 12:29:12.750141	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000081	1000000023	2017-11-05 12:30:12.659567	2017-11-05 12:30:12.659567	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000082	1000000023	2017-11-05 12:31:12.810008	2017-11-05 12:31:12.810008	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000083	1000000023	2017-11-05 12:32:12.728435	2017-11-05 12:32:12.728435	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000084	1000000023	2017-11-05 12:33:12.78087	2017-11-05 12:33:12.78087	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000085	1000000023	2017-11-05 12:34:12.798303	2017-11-05 12:34:12.798303	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000086	1000000023	2017-11-05 12:35:12.868738	2017-11-05 12:35:12.868738	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000087	1000000023	2017-11-05 12:36:12.841169	2017-11-05 12:36:12.841169	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000088	1000000023	2017-11-05 12:37:12.8276	2017-11-05 12:37:12.8276	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000089	1000000023	2017-11-05 12:38:13.036043	2017-11-05 12:38:13.036043	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000090	1000000023	2017-11-05 12:39:12.93847	2017-11-05 12:39:12.93847	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000091	1000000023	2017-11-05 12:40:12.856897	2017-11-05 12:40:12.856897	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000092	1000000023	2017-11-05 12:41:12.938333	2017-11-05 12:41:12.938333	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000093	1000000023	2017-11-05 12:42:13.139777	2017-11-05 12:42:13.139777	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000094	1000000023	2017-11-05 12:43:13.0012	2017-11-05 12:43:13.0012	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000095	1000000023	2017-11-05 12:44:12.995632	2017-11-05 12:44:12.995632	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000096	1000000023	2017-11-05 12:45:13.032066	2017-11-05 12:45:13.032066	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000097	1000000023	2017-11-05 12:46:13.110502	2017-11-05 12:46:13.110502	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000098	1000000023	2017-11-05 12:47:13.04193	2017-11-05 12:47:13.04193	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000099	1000000023	2017-11-05 12:48:13.01036	2017-11-05 12:48:13.01036	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000100	1000000023	2017-11-05 12:49:13.368812	2017-11-05 12:49:13.368812	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000101	1000000023	2017-11-05 12:50:13.054226	2017-11-05 12:50:13.054226	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000102	1000000023	2017-11-05 12:51:13.063658	2017-11-05 12:51:13.063658	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000103	1000000023	2017-11-05 12:52:13.140095	2017-11-05 12:52:13.140095	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000104	1000000023	2017-11-05 12:53:13.230532	2017-11-05 12:53:13.230532	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000105	1000000023	2017-11-05 12:54:13.204962	2017-11-05 12:54:13.204962	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000106	1000000023	2017-11-05 12:55:13.232395	2017-11-05 12:55:13.232395	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000107	1000000023	2017-11-05 12:56:13.221826	2017-11-05 12:56:13.221826	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000108	1000000023	2017-11-05 12:57:13.301263	2017-11-05 12:57:13.301263	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000109	1000000023	2017-11-05 12:58:13.231691	2017-11-05 12:58:13.231691	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000110	1000000023	2017-11-05 12:59:13.261124	2017-11-05 12:59:13.261124	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000111	1000000023	2017-11-05 13:00:13.386563	2017-11-05 13:00:13.386563	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000112	1000000023	2017-11-05 13:01:13.331992	2017-11-05 13:01:13.331992	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000113	1000000023	2017-11-05 13:02:13.250419	2017-11-05 13:02:13.250419	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000114	1000000023	2017-11-05 13:03:13.448862	2017-11-05 13:03:13.448862	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000115	1000000023	2017-11-05 13:04:13.427293	2017-11-05 13:04:13.427293	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000116	1000000023	2017-11-05 13:05:13.376722	2017-11-05 13:05:13.376722	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000117	1000000023	2017-11-05 13:06:13.470159	2017-11-05 13:06:13.470159	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000118	1000000023	2017-11-05 13:07:13.376585	2017-11-05 13:07:13.376585	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000119	1000000023	2017-11-05 13:08:13.465022	2017-11-05 13:08:13.465022	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000120	1000000023	2017-11-05 13:09:13.499456	2017-11-05 13:09:13.499456	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000121	1000000023	2017-11-05 13:10:13.591893	2017-11-05 13:10:13.591893	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000122	1000000023	2017-11-05 13:11:13.534321	2017-11-05 13:11:13.534321	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000123	1000000023	2017-11-05 13:12:13.461749	2017-11-05 13:12:13.461749	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000124	1000000023	2017-11-05 13:13:13.605189	2017-11-05 13:13:13.605189	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000125	1000000023	2017-11-05 13:14:13.683625	2017-11-05 13:14:13.683625	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000126	1000000023	2017-11-05 13:15:13.656056	2017-11-05 13:15:13.656056	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000127	1000000023	2017-11-05 13:16:13.557482	2017-11-05 13:16:13.557482	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000128	1000000023	2017-11-05 13:17:13.702922	2017-11-05 13:17:13.702922	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000129	1000000023	2017-11-05 13:18:13.669352	2017-11-05 13:18:13.669352	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000130	1000000023	2017-11-05 13:19:13.670784	2017-11-05 13:19:13.670784	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000131	1000000023	2017-11-05 13:20:13.766221	2017-11-05 13:20:13.766221	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000132	1000000023	2017-11-05 13:21:13.675648	2017-11-05 13:21:13.675648	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000133	1000000023	2017-11-05 13:22:13.762084	2017-11-05 13:22:13.762084	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000134	1000000023	2017-11-05 13:23:13.819519	2017-11-05 13:23:13.819519	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000135	1000000023	2017-11-05 13:24:13.722946	2017-11-05 13:24:13.722946	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000136	1000000023	2017-11-05 13:25:13.77438	2017-11-05 13:25:13.77438	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000137	1000000023	2017-11-05 13:26:13.803814	2017-11-05 13:26:13.803814	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000138	1000000023	2017-11-05 13:27:13.789245	2017-11-05 13:27:13.789245	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000139	1000000023	2017-11-05 13:28:13.84768	2017-11-05 13:28:13.84768	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000140	1000000023	2017-11-05 17:16:27.265217	2017-11-05 17:16:27.265217	null	null	null	null	null	null	null
1000000141	1000000023	2017-11-05 17:16:32.580521	2017-11-05 17:16:32.580521	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000142	1000000023	2017-11-05 17:17:32.463946	2017-11-05 17:17:32.463946	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000143	1000000023	2017-11-05 17:18:32.407375	2017-11-05 17:18:32.407375	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000144	1000000023	2017-11-05 17:19:32.619818	2017-11-05 17:19:32.619818	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000145	1000000023	2017-11-05 17:20:32.733257	2017-11-05 17:20:32.733257	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000146	1000000023	2017-11-05 17:21:32.668685	2017-11-05 17:21:32.668685	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000147	1000000023	2017-11-05 17:22:32.796124	2017-11-05 17:22:32.796124	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000148	1000000023	2017-11-05 17:23:32.769554	2017-11-05 17:23:32.769554	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000149	1000000023	2017-11-05 17:24:32.931995	2017-11-05 17:24:32.931995	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000150	1000000023	2017-11-05 17:25:32.869424	2017-11-05 17:25:32.869424	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000151	1000000023	2017-11-05 17:26:33.090868	2017-11-05 17:26:33.090868	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000152	1000000023	2017-11-05 17:27:32.957292	2017-11-05 17:27:32.957292	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000153	1000000023	2017-11-05 17:28:32.838717	2017-11-05 17:28:32.838717	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000154	1000000023	2017-11-05 17:29:32.839149	2017-11-05 17:29:32.839149	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000155	1000000023	2017-11-05 17:30:32.889584	2017-11-05 17:30:32.889584	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000156	1000000023	2017-11-05 17:31:32.910017	2017-11-05 17:31:32.910017	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000157	1000000023	2017-11-05 17:32:33.076458	2017-11-05 17:32:33.076458	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000158	1000000023	2017-11-05 17:33:33.022887	2017-11-05 17:33:33.022887	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000159	1000000023	2017-11-05 17:34:32.973316	2017-11-05 17:34:32.973316	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000160	1000000023	2017-11-05 17:35:32.973748	2017-11-05 17:35:32.973748	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000161	1000000023	2017-11-05 17:36:32.944178	2017-11-05 17:36:32.944178	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000162	1000000023	2017-11-05 17:37:32.938609	2017-11-05 17:37:32.938609	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000163	1000000023	2017-11-05 17:38:33.079049	2017-11-05 17:38:33.079049	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000164	1000000023	2017-11-05 17:39:32.979475	2017-11-05 17:39:32.979475	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000165	1000000023	2017-11-05 17:40:33.249922	2017-11-05 17:40:33.249922	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000166	1000000023	2017-11-05 17:41:33.366361	2017-11-05 17:41:33.366361	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000167	1000000023	2017-11-05 17:42:33.156781	2017-11-05 17:42:33.156781	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000168	1000000023	2017-11-05 17:43:33.932257	2017-11-05 17:43:33.932257	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000169	1000000023	2017-11-05 17:44:33.162645	2017-11-05 17:44:33.162645	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000170	1000000023	2017-11-05 17:45:33.124074	2017-11-05 17:45:33.124074	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000171	1000000023	2017-11-05 17:46:33.446524	2017-11-05 17:46:33.446524	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000172	1000000023	2017-11-05 17:47:33.301948	2017-11-05 17:47:33.301948	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000173	1000000023	2017-11-05 17:48:33.435387	2017-11-05 17:48:33.435387	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000174	1000000023	2017-11-05 17:49:33.349814	2017-11-05 17:49:33.349814	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000175	1000000023	2017-11-05 17:50:33.571259	2017-11-05 17:50:33.571259	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000176	1000000023	2017-11-05 17:51:33.329677	2017-11-05 17:51:33.329677	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000177	1000000023	2017-11-05 17:52:33.598124	2017-11-05 17:52:33.598124	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000178	1000000023	2017-11-05 17:54:08.055527	2017-11-05 17:54:08.055527	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000179	1000000023	2017-11-05 17:55:08.119962	2017-11-05 17:55:08.119962	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000180	1000000023	2017-11-05 17:56:08.100393	2017-11-05 17:56:08.100393	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000181	1000000023	2017-11-05 17:57:08.324837	2017-11-05 17:57:08.324837	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000182	1000000023	2017-11-05 17:58:08.193262	2017-11-05 17:58:08.193262	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000183	1000000023	2017-11-05 17:59:08.13969	2017-11-05 17:59:08.13969	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000184	1000000023	2017-11-05 18:00:08.27713	2017-11-05 18:00:08.27713	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000185	1000000023	2017-11-05 18:01:08.315564	2017-11-05 18:01:08.315564	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000186	1000000023	2017-11-05 18:02:08.264993	2017-11-05 18:02:08.264993	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000187	1000000023	2017-11-05 18:03:08.202421	2017-11-05 18:03:08.202421	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000188	1000000023	2017-11-05 18:04:08.244855	2017-11-05 18:04:08.244855	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000189	1000000023	2017-11-05 18:05:08.420297	2017-11-05 18:05:08.420297	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000190	1000000023	2017-11-05 18:06:08.650742	2017-11-05 18:06:08.650742	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000191	1000000023	2017-11-05 18:07:08.283153	2017-11-05 18:07:08.283153	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000192	1000000023	2017-11-05 18:08:08.309586	2017-11-05 18:08:08.309586	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000193	1000000023	2017-11-05 18:09:08.468027	2017-11-05 18:09:08.468027	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000194	1000000023	2017-11-05 18:10:08.434457	2017-11-05 18:10:08.434457	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000195	1000000023	2017-11-05 18:11:08.578897	2017-11-05 18:11:08.578897	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000196	1000000023	2017-11-05 18:12:08.59633	2017-11-05 18:12:08.59633	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000197	1000000020	2017-11-26 21:53:43.589013	2017-11-26 21:53:43.589013	null	null	null	null	null	null	null
1000000198	1000000020	2017-11-26 22:00:20.444712	2017-11-26 22:00:20.444712	null	null	null	null	null	null	null
1000000199	1000000020	2017-11-26 22:01:20.21713	2017-11-26 22:01:20.21713	null	null	null	null	null	null	null
1000000200	1000000020	2017-11-26 22:02:20.100556	2017-11-26 22:02:20.100556	null	null	null	null	null	null	null
1000000201	1000000020	2017-11-26 22:03:20.453008	2017-11-26 22:03:20.453008	null	null	null	null	null	null	null
1000000202	1000000020	2017-11-26 22:04:20.262428	2017-11-26 22:04:20.262428	null	null	null	null	null	null	null
1000000203	1000000020	2017-11-26 22:05:20.174855	2017-11-26 22:05:20.174855	null	null	null	null	null	null	null
1000000204	1000000020	2017-11-26 22:06:20.214289	2017-11-26 22:06:20.214289	null	null	null	null	null	null	null
1000000205	1000000020	2017-11-26 22:07:20.18772	2017-11-26 22:07:20.18772	null	null	null	null	null	null	null
1000000206	1000000020	2017-11-26 22:08:20.328159	2017-11-26 22:08:20.328159	null	null	null	null	null	null	null
1000000207	1000000020	2017-11-26 22:09:20.346592	2017-11-26 22:09:20.346592	null	null	null	null	null	null	null
1000000208	1000000020	2017-11-26 22:10:20.410028	2017-11-26 22:10:20.410028	null	null	null	null	null	null	null
1000000209	1000000020	2017-11-26 22:11:44.006809	2017-11-26 22:11:44.006809	null	null	null	null	null	null	null
1000000210	1000000020	2017-11-26 22:12:43.685223	2017-11-26 22:12:43.685223	null	null	null	null	null	null	null
1000000211	1000000020	2017-11-26 22:13:43.474642	2017-11-26 22:13:43.474642	null	null	null	null	null	null	null
1000000212	1000000020	2017-11-26 22:14:43.421071	2017-11-26 22:14:43.421071	null	null	null	null	null	null	null
1000000213	1000000020	2017-11-26 22:15:43.455505	2017-11-26 22:15:43.455505	null	null	null	null	null	null	null
1000000214	1000000020	2017-11-26 22:16:43.458937	2017-11-26 22:16:43.458937	null	null	null	null	null	null	null
1000000215	1000000020	2017-11-26 22:17:43.443368	2017-11-26 22:17:43.443368	null	null	null	null	null	null	null
1000000216	1000000020	2017-11-26 22:18:43.599808	2017-11-26 22:18:43.599808	null	null	null	null	null	null	null
1000000217	1000000020	2017-11-26 22:19:43.59724	2017-11-26 22:19:43.59724	null	null	null	null	null	null	null
1000000218	1000000020	2017-11-26 22:20:43.443663	2017-11-26 22:20:43.443663	null	null	null	null	null	null	null
1000000219	1000000020	2017-11-26 22:21:43.984126	2017-11-26 22:21:43.984126	null	null	null	null	null	null	null
1000000220	1000000020	2017-11-26 22:22:43.576534	2017-11-26 22:22:43.576534	null	null	null	null	null	null	null
1000000221	1000000020	2017-11-26 22:23:43.533964	2017-11-26 22:23:43.533964	null	null	null	null	null	null	null
1000000222	1000000020	2017-11-26 22:24:43.645402	2017-11-26 22:24:43.645402	null	null	null	null	null	null	null
1000000223	1000000020	2017-11-26 22:25:43.74884	2017-11-26 22:25:43.74884	null	null	null	null	null	null	null
1000000224	1000000020	2017-11-26 22:26:43.857278	2017-11-26 22:26:43.857278	null	null	null	null	null	null	null
1000000225	1000000020	2017-11-26 22:27:43.561693	2017-11-26 22:27:43.561693	null	null	null	null	null	null	null
1000000226	1000000020	2017-11-26 22:28:43.720133	2017-11-26 22:28:43.720133	null	null	null	null	null	null	null
1000000227	1000000020	2017-11-26 22:29:43.682563	2017-11-26 22:29:43.682563	null	null	null	null	null	null	null
1000000228	1000000020	2017-11-26 22:30:43.695996	2017-11-26 22:30:43.695996	null	null	null	null	null	null	null
1000000229	1000000020	2017-11-26 22:31:43.874438	2017-11-26 22:31:43.874438	null	null	null	null	null	null	null
1000000230	1000000020	2017-11-26 22:32:43.808866	2017-11-26 22:32:43.808866	null	null	null	null	null	null	null
1000000231	1000000020	2017-11-26 22:33:44.191319	2017-11-26 22:33:44.191319	null	null	null	null	null	null	null
1000000232	1000000020	2017-11-26 22:34:43.81373	2017-11-26 22:34:43.81373	null	null	null	null	null	null	null
1000000233	1000000020	2017-11-26 22:35:44.534203	2017-11-26 22:35:44.534203	null	null	null	null	null	null	null
1000000234	1000000020	2017-11-26 22:36:44.071608	2017-11-26 22:36:44.071608	null	null	null	null	null	null	null
1000000235	1000000020	2017-11-26 22:37:44.08004	2017-11-26 22:37:44.08004	null	null	null	null	null	null	null
1000000236	1000000020	2017-11-27 02:54:11.31414	2017-11-27 02:54:11.31414	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000237	1000000020	2017-11-27 02:55:11.390576	2017-11-27 02:55:11.390576	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000238	1000000020	2017-11-27 02:56:11.357006	2017-11-27 02:56:11.357006	GR	Greece	Chalandri	North Athens	Attica	Kosta Varnali 35A	152 33
1000000239	1000000020	2017-11-27 02:57:11.300434	2017-11-27 02:57:11.300434	GR	Greece	Chalandri	North Athens	Attica	Kosta Varnali 35A	152 33
1000000240	1000000020	2017-11-27 02:58:11.352869	2017-11-27 02:58:11.352869	GR	Greece	Chalandri	North Athens	Attica	Kosta Varnali 35A	152 33
1000000241	1000000020	2017-11-27 02:59:11.327299	2017-11-27 02:59:11.327299	null	null	null	null	null	null	null
1000000242	1000000020	2017-11-27 03:00:11.434737	2017-11-27 03:00:11.434737	GR	Greece	Attica	null	Attica	Aspropyrgos	null
1000000243	1000000020	2017-11-27 17:32:43.336508	2017-11-27 17:32:43.336508	GR	Greece	Attica	null	Attica	Aspropyrgos	null
1000000244	1000000020	2017-11-27 17:34:37.943063	2017-11-27 17:34:37.943063	null	null	null	null	null	null	null
1000000245	1000000020	2017-11-27 17:35:33.276228	2017-11-27 17:35:33.276228	GR	Greece	Attica	null	Attica	Aspropyrgos	null
1000000246	1000000020	2017-11-27 17:36:33.737687	2017-11-27 17:36:33.737687	GR	Greece	Attica	null	Attica	Aspropyrgos	null
1000000247	1000000020	2017-11-27 17:37:33.353096	2017-11-27 17:37:33.353096	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000248	1000000020	2017-11-27 17:38:33.294525	2017-11-27 17:38:33.294525	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000249	1000000020	2017-11-27 17:39:33.308957	2017-11-27 17:39:33.308957	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000250	1000000020	2017-11-27 17:40:33.342391	2017-11-27 17:40:33.342391	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000251	1000000020	2017-11-27 17:41:33.567836	2017-11-27 17:41:33.567836	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000252	1000000020	2017-11-27 17:42:33.354255	2017-11-27 17:42:33.354255	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000253	1000000020	2017-11-27 17:43:33.354687	2017-11-27 17:43:33.354687	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000254	1000000020	2017-11-27 17:44:33.37912	2017-11-27 17:44:33.37912	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000255	1000000020	2017-11-27 17:45:33.432555	2017-11-27 17:45:33.432555	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000256	1000000020	2017-11-29 23:31:03.031242	2017-11-29 23:31:03.031242	null	null	null	null	null	null	null
1000000257	1000000020	2017-11-29 23:32:02.983855	2017-11-29 23:32:02.983855	null	null	null	null	null	null	null
1000000258	1000000020	2017-11-29 23:33:03.012478	2017-11-29 23:33:03.012478	null	null	null	null	null	null	null
1000000259	1000000020	2017-11-29 23:33:59.047093	2017-11-29 23:33:59.047093	null	null	null	null	null	null	null
1000000260	1000000020	2017-11-29 23:35:00.536402	2017-11-29 23:35:00.536402	null	null	null	null	null	null	null
1000000261	1000000020	2017-11-29 23:36:19.068874	2017-11-29 23:36:19.068874	null	null	null	null	null	null	null
1000000262	1000000020	2017-11-29 23:36:59.060952	2017-11-29 23:36:59.060952	null	null	null	null	null	null	null
1000000263	1000000020	2017-11-29 23:39:20.306388	2017-11-29 23:39:20.306388	null	null	null	null	null	null	null
1000000264	1000000020	2017-11-29 23:41:54.184428	2017-11-29 23:41:54.184428	null	null	null	null	null	null	null
1000000265	1000000020	2017-11-29 23:42:37.833471	2017-11-29 23:42:37.833471	null	null	null	null	null	null	null
1000000266	1000000020	2017-11-29 23:43:54.286679	2017-11-29 23:43:54.286679	null	null	null	null	null	null	null
1000000267	1000000020	2017-11-29 23:44:34.923339	2017-11-29 23:44:34.923339	null	null	null	null	null	null	null
1000000268	1000000020	2017-11-29 23:47:00.129778	2017-11-29 23:47:00.129778	GR	Greece	Kalamata	Peloponnese	Peloponnisos Dytiki Ellada ke Ionio	Stadiou 4-18, Kalamata 241 00, Greece	241 00
1000000269	1000000020	2017-11-29 23:48:44.056475	2017-11-29 23:48:44.056475	GR	Greece	Kalamata	Peloponnese	Peloponnisos Dytiki Ellada ke Ionio	Athinon 34, Kalamata 241 00, Greece	241 00
1000000270	1000000020	2017-11-29 23:49:06.820866	2017-11-29 23:49:06.820866	GR	Greece	Kalamata	Peloponnese	Peloponnisos Dytiki Ellada ke Ionio	Athinon 95, Kalamata 241 00, Greece	241 00
1000000271	1000000020	2017-11-29 23:50:02.13339	2017-11-29 23:50:02.13339	GR	Greece	Kalamata	Peloponnese	Peloponnisos Dytiki Ellada ke Ionio	Athinon 95, Kalamata 241 00, Greece	241 00
1000000272	1000000020	2017-11-29 23:51:27.208693	2017-11-29 23:51:27.208693	GR	Greece	Kalamata	Peloponnese	Peloponnisos Dytiki Ellada ke Ionio	Athinon 95, Kalamata 241 00, Greece	241 00
1000000273	1000000020	2017-11-29 23:52:03.831844	2017-11-29 23:52:03.831844	GR	Greece	Kalamata	Peloponnese	Peloponnisos Dytiki Ellada ke Ionio	Athinon 95, Kalamata 241 00, Greece	241 00
1000000274	1000000020	2017-12-02 14:34:04.642786	2017-12-02 14:34:04.642786	null	null	null	null	null	null	null
1000000275	1000000020	2017-12-02 14:36:12.055466	2017-12-02 14:36:12.055466	null	null	null	null	null	null	null
1000000276	1000000020	2017-12-02 15:40:10.235853	2017-12-02 15:40:10.235853	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000277	1000000020	2017-12-02 15:41:48.452825	2017-12-02 15:41:48.452825	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000278	1000000020	2017-12-02 15:42:29.329515	2017-12-02 15:42:29.329515	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000279	1000000020	2017-12-02 15:43:08.407478	2017-12-02 15:43:08.407478	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000280	1000000020	2017-12-02 15:49:50.311013	2017-12-02 15:49:50.311013	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000281	1000000020	2017-12-02 16:32:16.864884	2017-12-02 16:32:16.864884	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000282	1000000020	2017-12-02 16:33:13.920129	2017-12-02 16:33:13.920129	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000283	1000000020	2017-12-02 16:34:46.362868	2017-12-02 16:34:46.362868	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000284	1000000020	2017-12-02 16:35:13.912867	2017-12-02 16:35:13.912867	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000285	1000000020	2017-12-02 16:36:13.933988	2017-12-02 16:36:13.933988	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000286	1000000020	2017-12-02 16:37:26.363686	2017-12-02 16:37:26.363686	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000287	1000000020	2017-12-02 16:38:13.911223	2017-12-02 16:38:13.911223	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000288	1000000020	2017-12-02 16:39:13.909342	2017-12-02 16:39:13.909342	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000289	1000000020	2017-12-02 16:40:13.97947	2017-12-02 16:40:13.97947	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000290	1000000020	2017-12-02 16:41:13.918081	2017-12-02 16:41:13.918081	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000291	1000000020	2017-12-02 16:42:53.926281	2017-12-02 16:42:53.926281	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000292	1000000020	2017-12-02 16:43:13.947323	2017-12-02 16:43:13.947323	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000293	1000000020	2017-12-02 16:44:13.957443	2017-12-02 16:44:13.957443	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000294	1000000020	2017-12-02 16:45:33.934599	2017-12-02 16:45:33.934599	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000295	1000000020	2017-12-02 16:46:13.912676	2017-12-02 16:46:13.912676	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000296	1000000020	2017-12-02 16:47:15.000433	2017-12-02 16:47:15.000433	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000297	1000000020	2017-12-02 16:48:13.96192	2017-12-02 16:48:13.96192	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000298	1000000020	2017-12-02 16:49:13.928535	2017-12-02 16:49:13.928535	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000299	1000000029	2017-12-02 16:52:15.302066	2017-12-02 16:52:15.302066	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000300	1000000029	2017-12-02 16:53:15.289684	2017-12-02 16:53:15.289684	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000301	1000000029	2017-12-02 16:54:53.648174	2017-12-02 16:54:53.648174	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000302	1000000029	2017-12-02 16:55:15.285421	2017-12-02 16:55:15.285421	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000303	1000000029	2017-12-02 16:56:15.271539	2017-12-02 16:56:15.271539	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000304	1000000029	2017-12-02 16:57:33.621988	2017-12-02 16:57:33.621988	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000305	1000000029	2017-12-02 16:58:15.278278	2017-12-02 16:58:15.278278	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000306	1000000029	2017-12-02 16:59:15.273396	2017-12-02 16:59:15.273396	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000307	1000000029	2017-12-02 17:00:15.86109	2017-12-02 17:00:15.86109	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000308	1000000029	2017-12-02 17:01:15.274634	2017-12-02 17:01:15.274634	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000309	1000000029	2017-12-02 17:02:15.279254	2017-12-02 17:02:15.279254	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000310	1000000029	2017-12-02 17:03:15.266371	2017-12-02 17:03:15.266371	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000311	1000000029	2017-12-02 17:40:24.162798	2017-12-02 17:40:24.162798	null	null	null	null	null	null	null
1000000312	1000000029	2017-12-02 17:41:20.40594	2017-12-02 17:41:20.40594	null	null	null	null	null	null	null
1000000313	1000000029	2017-12-02 17:42:25.546711	2017-12-02 17:42:25.546711	null	null	null	null	null	null	null
1000000314	1000000029	2017-12-02 17:43:20.358672	2017-12-02 17:43:20.358672	null	null	null	null	null	null	null
1000000315	1000000029	2017-12-02 17:44:20.408297	2017-12-02 17:44:20.408297	null	null	null	null	null	null	null
1000000316	1000000029	2017-12-02 17:45:20.382413	2017-12-02 17:45:20.382413	null	null	null	null	null	null	null
1000000317	1000000030	2017-12-03 18:57:11.100846	2017-12-03 18:57:11.100846	null	null	null	null	null	null	null
1000000318	1000000030	2017-12-10 15:29:41.873298	2017-12-10 15:29:41.873298	null	null	null	null	null	null	null
1000000319	1000000030	2017-12-10 18:53:13.383029	2017-12-10 18:53:13.383029	null	null	null	null	null	null	null
\.


--
-- Name: i_location_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('i_location_id_seq', 1000000319, true);


--
-- Data for Name: i_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY i_user (i_user_id, i_creation_date, i_last_update_date, i_first_name, i_last_name, i_mobile_number, i_username, i_password, i_email_address, i_register_type) FROM stdin;
1000000020	2017-10-12 19:55:19.392707	2017-10-12 19:55:19.392707	Ioannis	Kozompolis	6971903121	giannis		g.kozompolis@gmail.com	\N
1000000021	2017-10-12 19:57:45.490063	2017-10-12 19:57:45.490063	Ioannis 	Kozompolis	6971903121	giannis2		g.kozompolis@gmail.com	\N
1000000022	2017-10-12 20:55:23.476849	2017-10-12 20:55:23.476849	aek	ole	6971903121	aek		giannis1990@gmail.com	\N
1000000023	2017-10-12 21:08:52.548125	2017-10-12 21:08:52.548125	giannis4			giannis4			\N
1000000024	2017-10-14 21:22:11.872753	2017-10-14 21:22:11.872753	giannis5			giannis5			\N
1000000025	2017-10-14 21:27:15.417114	2017-10-14 21:27:15.417114	giannis6			giannis6			\N
1000000026	2017-11-25 21:04:47.794319	2017-11-25 21:04:47.794319	Ioannis	Kozompolis	6971903121	giannis2669		g.kozompolis@gmail.com	\N
1000000027	2017-12-02 16:22:39.382553	2017-12-02 16:22:39.382553	Ioannnis	Kozompolis	6971903121	kozo		g.kozompolis@gmail.com	\N
1000000028	2017-12-02 16:30:33.483257	2017-12-02 16:30:33.483257				kozompolis			\N
1000000029	2017-12-02 16:52:05.125274	2017-12-02 16:52:05.125274				testuser1			\N
1000000030	2017-12-03 17:55:53.547356	2017-12-03 17:55:53.547356	John	Kozo		1127478420719730		g.kozompolis@gmail.com	\N
\.


--
-- Name: i_user_i_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('i_user_i_user_id_seq', 1000000030, true);


--
-- Name: i_work_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('i_work_id_seq', 1000000023, true);


--
-- Data for Name: i_work_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY i_work_info (i_work_id, i_user_id, i_creation_date, i_last_update_date, i_work_employer, i_work_position) FROM stdin;
1000000008	1000000020	2017-12-09 18:07:12.183065	2017-12-09 18:07:12.183065	Almasport	Sales
1000000009	1000000020	2017-12-09 18:13:25.564421	2017-12-09 18:13:25.564421	\N	\N
1000000010	1000000030	2017-12-10 14:28:51.964701	2017-12-10 14:28:51.964701	Velti	QA Engineer
1000000011	1000000030	2017-12-10 15:26:23.561616	2017-12-10 15:26:23.561616	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000012	1000000030	2017-12-10 15:31:11.868226	2017-12-10 15:31:11.868226	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000013	1000000030	2017-12-10 15:32:59.937949	2017-12-10 15:32:59.937949	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000014	1000000030	2017-12-10 15:34:53.439362	2017-12-10 15:34:53.439362	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000015	1000000030	2017-12-10 16:19:59.583499	2017-12-10 16:19:59.583499	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000016	1000000030	2017-12-10 16:21:56.754378	2017-12-10 16:21:56.754378	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000017	1000000030	2017-12-10 16:25:51.281659	2017-12-10 16:25:51.281659	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000018	1000000030	2017-12-10 18:58:47.20742	2017-12-10 18:58:47.20742	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000019	1000000030	2017-12-10 18:58:47.239924	2017-12-10 18:58:47.239924	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000020	1000000030	2017-12-10 19:03:49.897356	2017-12-10 19:03:49.897356	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000021	1000000030	2017-12-10 19:20:44.539699	2017-12-10 19:20:44.539699	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000022	1000000030	2017-12-10 19:24:38.35189	2017-12-10 19:24:38.35189	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000023	1000000030	2017-12-10 19:27:42.773308	2017-12-10 19:27:42.773308	Velti S.A.	Quality Assurance Engineer (QA Engineer)
\.


--
-- Name: i_education_info i_education_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_education_info
    ADD CONSTRAINT i_education_info_pkey PRIMARY KEY (i_education_id);


--
-- Name: i_fb_books i_fb_books_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_books
    ADD CONSTRAINT i_fb_books_pkey PRIMARY KEY (i_fb_books_id);


--
-- Name: i_fb_events i_fb_events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_events
    ADD CONSTRAINT i_fb_events_pkey PRIMARY KEY (i_fb_events_id);


--
-- Name: i_fb_favorite_teams i_fb_favorite_team_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_favorite_teams
    ADD CONSTRAINT i_fb_favorite_team_pkey PRIMARY KEY (i_fb_favorite_teams_id);


--
-- Name: i_fb_music i_fb_music_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_music
    ADD CONSTRAINT i_fb_music_pkey PRIMARY KEY (i_fb_music_id);


--
-- Name: i_interest_fb_pages i_interest_pages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_interest_fb_pages
    ADD CONSTRAINT i_interest_pages_pkey PRIMARY KEY (i_interest_pages_id);


--
-- Name: i_location i_location_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_location
    ADD CONSTRAINT i_location_pkey PRIMARY KEY (i_location_id);


--
-- Name: i_user i_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_user
    ADD CONSTRAINT i_user_pkey PRIMARY KEY (i_user_id);


--
-- Name: i_work_info i_work_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_work_info
    ADD CONSTRAINT i_work_info_pkey PRIMARY KEY (i_work_id);


--
-- Name: fki_E; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_E" ON i_education_info USING btree (i_user_id);


--
-- Name: fki_F; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_F" ON i_interest_fb_pages USING btree (i_user_id);


--
-- Name: fki_G; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_G" ON i_fb_events USING btree (i_user_id);


--
-- Name: fki_H; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_H" ON i_fb_events USING btree (i_user_id);


--
-- Name: fki_I; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_I" ON i_fb_events USING btree (i_user_id);


--
-- Name: fki_J; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_J" ON i_fb_favorite_teams USING btree (i_user_id);


--
-- Name: fki_i_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_i_user_id ON i_work_info USING btree (i_user_id);


--
-- Name: i_education_info Update_Data; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "Update_Data" BEFORE UPDATE ON i_education_info FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- Name: i_interest_fb_pages Update_Data; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "Update_Data" BEFORE UPDATE ON i_interest_fb_pages FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- Name: i_fb_events Update_Data; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "Update_Data" BEFORE UPDATE ON i_fb_events FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- Name: i_fb_books Update_Data; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "Update_Data" BEFORE UPDATE ON i_fb_books FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- Name: i_fb_music Update_Data; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "Update_Data" BEFORE UPDATE ON i_fb_music FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- Name: i_fb_favorite_teams Update_Data; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "Update_Data" BEFORE UPDATE ON i_fb_favorite_teams FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- Name: i_location Update_last_update_date; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "Update_last_update_date" BEFORE UPDATE ON i_location FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- Name: i_user set_timestamp; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER set_timestamp BEFORE UPDATE ON i_user FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- Name: i_work_info set_timestamp; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER set_timestamp BEFORE UPDATE ON i_work_info FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- Name: i_location User ID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_location
    ADD CONSTRAINT "User ID" FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id);


--
-- Name: i_education_info User_id_in_education_info; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_education_info
    ADD CONSTRAINT "User_id_in_education_info" FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: i_fb_books User_id_in_i_fb_books; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_books
    ADD CONSTRAINT "User_id_in_i_fb_books" FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- Name: i_fb_events User_id_in_i_fb_events; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_events
    ADD CONSTRAINT "User_id_in_i_fb_events" FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- Name: i_fb_favorite_teams User_id_in_i_fb_favorite_teams; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_favorite_teams
    ADD CONSTRAINT "User_id_in_i_fb_favorite_teams" FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- Name: i_fb_music User_id_in_i_fb_music; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_music
    ADD CONSTRAINT "User_id_in_i_fb_music" FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- Name: i_interest_fb_pages User_id_in_interest_pages; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_interest_fb_pages
    ADD CONSTRAINT "User_id_in_interest_pages" FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- Name: i_education_info fkck4ugidmocgo1ugp68cqndwgc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_education_info
    ADD CONSTRAINT fkck4ugidmocgo1ugp68cqndwgc FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id);


--
-- Name: i_work_info fkcoqbcg27jlgcyjfnh4n65uehx; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_work_info
    ADD CONSTRAINT fkcoqbcg27jlgcyjfnh4n65uehx FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id);


--
-- Name: i_location fkg0rrrwit513pw13pr3n3o2u4e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_location
    ADD CONSTRAINT fkg0rrrwit513pw13pr3n3o2u4e FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id);


--
-- Name: i_work_info i_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_work_info
    ADD CONSTRAINT i_user_id FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: i_education_info i_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_education_info
    ADD CONSTRAINT i_user_id FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: i_interest_fb_pages i_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_interest_fb_pages
    ADD CONSTRAINT i_user_id FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- Name: i_fb_events i_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_events
    ADD CONSTRAINT i_user_id FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- Name: i_fb_books i_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_books
    ADD CONSTRAINT i_user_id FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- Name: i_fb_music i_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_music
    ADD CONSTRAINT i_user_id FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- Name: i_fb_favorite_teams i_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_favorite_teams
    ADD CONSTRAINT i_user_id FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: register_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE register_type AS ENUM (
    'facebook',
    'custom'
);


ALTER TYPE register_type OWNER TO postgres;

--
-- Name: trigger_set_timestamp(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION trigger_set_timestamp() RETURNS trigger
    LANGUAGE plpgsql
    AS $$  
BEGIN  
  NEW.i_last_update_date = NOW();
  RETURN NEW;
END;  
$$;


ALTER FUNCTION public.trigger_set_timestamp() OWNER TO postgres;

--
-- Name: greeting_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE greeting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE greeting_id_seq OWNER TO postgres;

--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hibernate_sequence OWNER TO postgres;

--
-- Name: i_education_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE i_education_id_seq
    START WITH 1000000000
    INCREMENT BY 1
    MINVALUE 1000000000
    MAXVALUE 9999999999999
    CACHE 1;


ALTER TABLE i_education_id_seq OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: i_education_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE i_education_info (
    i_education_id bigint DEFAULT nextval('i_education_id_seq'::regclass) NOT NULL,
    i_user_id bigint NOT NULL,
    i_creation_date timestamp(6) without time zone DEFAULT now(),
    i_last_update_date timestamp(6) without time zone DEFAULT now(),
    i_edu_degree character varying(100),
    i_edu_school character varying(100),
    i_edu_type character varying(100),
    i_edu_year character varying(20)
);


ALTER TABLE i_education_info OWNER TO postgres;

--
-- Name: i_fb_books_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE i_fb_books_id_seq
    START WITH 1000000000
    INCREMENT BY 1
    MINVALUE 1000000000
    MAXVALUE 9999999999999
    CACHE 1;


ALTER TABLE i_fb_books_id_seq OWNER TO postgres;

--
-- Name: i_fb_books; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE i_fb_books (
    i_fb_books_id bigint DEFAULT nextval('i_fb_books_id_seq'::regclass) NOT NULL,
    i_user_id bigint NOT NULL,
    i_creation_date timestamp(6) without time zone DEFAULT now(),
    i_last_update_date timestamp(6) without time zone DEFAULT now(),
    i_book_name character varying(100),
    i_book_description character varying(1000)
);


ALTER TABLE i_fb_books OWNER TO postgres;

--
-- Name: i_fb_events_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE i_fb_events_id_seq
    START WITH 1000000000
    INCREMENT BY 1
    MINVALUE 1000000000
    MAXVALUE 999999999999999
    CACHE 1;


ALTER TABLE i_fb_events_id_seq OWNER TO postgres;

--
-- Name: i_fb_events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE i_fb_events (
    i_fb_events_id bigint DEFAULT nextval('i_fb_events_id_seq'::regclass) NOT NULL,
    i_user_id bigint NOT NULL,
    i_creation_date timestamp(6) without time zone DEFAULT now(),
    i_last_update_date timestamp(6) without time zone DEFAULT now(),
    i_event_name character varying(100),
    i_event_description character varying(1000),
    i_event_start_date timestamp(6) without time zone
);


ALTER TABLE i_fb_events OWNER TO postgres;

--
-- Name: i_fb_favorite_teams_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE i_fb_favorite_teams_id_seq
    START WITH 1000000000
    INCREMENT BY 1
    MINVALUE 1000000000
    MAXVALUE 9999999999999
    CACHE 1;


ALTER TABLE i_fb_favorite_teams_id_seq OWNER TO postgres;

--
-- Name: i_fb_favorite_teams; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE i_fb_favorite_teams (
    i_fb_favorite_teams_id bigint DEFAULT nextval('i_fb_favorite_teams_id_seq'::regclass) NOT NULL,
    i_user_id bigint NOT NULL,
    i_creation_date timestamp(6) without time zone DEFAULT now(),
    i_last_update_date timestamp(6) without time zone DEFAULT now(),
    i_team_name character varying(100)
);


ALTER TABLE i_fb_favorite_teams OWNER TO postgres;

--
-- Name: i_fb_music_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE i_fb_music_id_seq
    START WITH 1000000000
    INCREMENT BY 1
    MINVALUE 1000000000
    MAXVALUE 9999999999999
    CACHE 1;


ALTER TABLE i_fb_music_id_seq OWNER TO postgres;

--
-- Name: i_fb_music; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE i_fb_music (
    i_fb_music_id bigint DEFAULT nextval('i_fb_music_id_seq'::regclass) NOT NULL,
    i_user_id bigint NOT NULL,
    i_creation_date timestamp(6) without time zone DEFAULT now(),
    i_last_update_date timestamp(6) without time zone DEFAULT now(),
    i_music_title character varying(100)
);


ALTER TABLE i_fb_music OWNER TO postgres;

--
-- Name: i_interest_pages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE i_interest_pages_id_seq
    START WITH 1000000000
    INCREMENT BY 1
    MINVALUE 1000000000
    MAXVALUE 99999999999999
    CACHE 1;


ALTER TABLE i_interest_pages_id_seq OWNER TO postgres;

--
-- Name: i_interest_fb_pages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE i_interest_fb_pages (
    i_interest_pages_id bigint DEFAULT nextval('i_interest_pages_id_seq'::regclass) NOT NULL,
    i_user_id bigint NOT NULL,
    i_creation_date timestamp(6) without time zone DEFAULT now(),
    i_last_update_date timestamp(6) without time zone DEFAULT now(),
    i_page_name character varying(100),
    i_page_description character varying(400)
);


ALTER TABLE i_interest_fb_pages OWNER TO postgres;

--
-- Name: i_location_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE i_location_id_seq
    START WITH 1000000001
    INCREMENT BY 1
    MINVALUE 1000000001
    MAXVALUE 99999999999999
    CACHE 1;


ALTER TABLE i_location_id_seq OWNER TO postgres;

--
-- Name: i_location; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE i_location (
    i_location_id bigint DEFAULT nextval('i_location_id_seq'::regclass) NOT NULL,
    i_user_id bigint NOT NULL,
    i_creation_date timestamp(6) without time zone DEFAULT now(),
    i_last_update_date timestamp(6) without time zone DEFAULT now(),
    i_country_code character varying(5),
    i_country_name character varying(50),
    i_city_name character varying(50),
    i_prefecture character varying(50),
    i_department character varying(50),
    i_street_address character varying(100),
    i_postal_code character varying(10)
);


ALTER TABLE i_location OWNER TO postgres;

--
-- Name: i_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE i_user (
    i_user_id bigint NOT NULL,
    i_creation_date timestamp(6) without time zone DEFAULT now() NOT NULL,
    i_last_update_date timestamp(6) without time zone DEFAULT now() NOT NULL,
    i_first_name character varying(50),
    i_last_name character varying(50),
    i_mobile_number character varying(20),
    i_username character varying(50),
    i_password character varying(50),
    i_email_address character varying(100),
    i_register_type character varying(100)
);


ALTER TABLE i_user OWNER TO postgres;

--
-- Name: i_user_i_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE i_user_i_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE i_user_i_user_id_seq OWNER TO postgres;

--
-- Name: i_user_i_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE i_user_i_user_id_seq OWNED BY i_user.i_user_id;


--
-- Name: i_work_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE i_work_id_seq
    START WITH 1000000000
    INCREMENT BY 1
    MINVALUE 1000000000
    MAXVALUE 999999999999999
    CACHE 1;


ALTER TABLE i_work_id_seq OWNER TO postgres;

--
-- Name: i_work_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE i_work_info (
    i_work_id bigint DEFAULT nextval('i_work_id_seq'::regclass) NOT NULL,
    i_user_id bigint NOT NULL,
    i_creation_date timestamp(6) without time zone DEFAULT now() NOT NULL,
    i_last_update_date timestamp(6) without time zone DEFAULT now(),
    i_work_employer character varying(100),
    i_work_position character varying(100)
);


ALTER TABLE i_work_info OWNER TO postgres;

--
-- Name: i_user i_user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_user ALTER COLUMN i_user_id SET DEFAULT nextval('i_user_i_user_id_seq'::regclass);


--
-- Name: greeting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('greeting_id_seq', 1, false);


--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('hibernate_sequence', 6, true);


--
-- Name: i_education_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('i_education_id_seq', 1000000005, true);


--
-- Data for Name: i_education_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY i_education_info (i_education_id, i_user_id, i_creation_date, i_last_update_date, i_edu_degree, i_edu_school, i_edu_type, i_edu_year) FROM stdin;
1000000003	1000000030	2017-12-10 19:27:42.874321	2017-12-10 19:27:42.874321		Department of Applied Informatics and Multimedia of Crete	College	2012
1000000004	1000000030	2017-12-10 19:27:42.934329	2017-12-10 19:27:42.934329	Advanced Softaware Development Technologies	University of Piraeus	Graduate School	2017
1000000005	1000000020	2017-12-14 17:43:17.307915	2017-12-14 17:43:17.307915	Master	University of Piraeus	IT	2017
\.


--
-- Data for Name: i_fb_books; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY i_fb_books (i_fb_books_id, i_user_id, i_creation_date, i_last_update_date, i_book_name, i_book_description) FROM stdin;
1000000000	1000000020	2017-12-13 17:13:27.565242	2017-12-13 17:13:54.776242	The Secret	The secret book only for adults
1000000001	1000000020	2017-12-14 13:23:58.544692	2017-12-14 13:23:58.544692	Pinocio	Pinocio adventures
\.


--
-- Name: i_fb_books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('i_fb_books_id_seq', 1000000001, true);


--
-- Data for Name: i_fb_events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY i_fb_events (i_fb_events_id, i_user_id, i_creation_date, i_last_update_date, i_event_name, i_event_description, i_event_start_date) FROM stdin;
1000000005	1000000020	2017-12-18 14:21:01.12985	2017-12-18 14:21:01.12985		 	2016-02-26 21:00:00
1000000006	1000000020	2017-12-18 14:41:26.772873	2017-12-18 14:41:26.772873	Giannis	kghuj	2016-02-26 21:00:00
1000000007	1000000020	2017-12-18 15:59:53.699546	2017-12-18 15:59:53.699546	Giannis		2016-02-26 21:00:00
1000000009	1000000020	2017-12-18 16:06:20.101183	2017-12-18 16:06:20.101183	Giannis	NUL	2016-02-26 21:00:00
1000000010	1000000020	2017-12-18 16:06:32.267399	2017-12-18 16:06:32.267399	Giannis		2016-02-26 21:00:00
1000000011	1000000020	2017-12-18 16:06:42.852458	2017-12-18 16:06:42.852458			2016-02-26 21:00:00
1000000012	1000000020	2017-12-18 16:10:23.492519	2017-12-18 16:10:23.492519			\N
1000000013	1000000020	2017-12-18 16:10:44.191589	2017-12-18 16:10:44.191589	null		\N
\.


--
-- Name: i_fb_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('i_fb_events_id_seq', 1000000013, true);


--
-- Data for Name: i_fb_favorite_teams; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY i_fb_favorite_teams (i_fb_favorite_teams_id, i_user_id, i_creation_date, i_last_update_date, i_team_name) FROM stdin;
1000000000	1000000020	2017-12-13 17:50:42.613253	2017-12-13 17:51:24.465438	AEK F.C.
1000000001	1000000020	2017-12-15 12:24:28.46332	2017-12-15 12:24:28.46332	AEK B.C.
\.


--
-- Name: i_fb_favorite_teams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('i_fb_favorite_teams_id_seq', 1000000001, true);


--
-- Data for Name: i_fb_music; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY i_fb_music (i_fb_music_id, i_user_id, i_creation_date, i_last_update_date, i_music_title) FROM stdin;
1000000000	1000000020	2017-12-13 17:26:30.425242	2017-12-13 17:26:40.697242	Eminem
1000000001	1000000020	2017-12-13 17:27:14.616468	2017-12-13 17:27:14.616468	Secret
1000000002	1000000020	2017-12-15 11:35:34.990002	2017-12-15 11:35:34.990002	Eminem
1000000003	1000000020	2017-12-15 11:35:50.489552	2017-12-15 11:35:50.489552	Tonis Sfinos
1000000004	1000000020	2017-12-15 11:57:50.097499	2017-12-15 11:57:50.097499	Tonis Sfinos
\.


--
-- Name: i_fb_music_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('i_fb_music_id_seq', 1000000004, true);


--
-- Data for Name: i_interest_fb_pages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY i_interest_fb_pages (i_interest_pages_id, i_user_id, i_creation_date, i_last_update_date, i_page_name, i_page_description) FROM stdin;
1000000004	1000000020	2017-12-15 12:02:57.03919	2017-12-15 12:02:57.03919	Almasport	Athletic store
\.


--
-- Name: i_interest_pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('i_interest_pages_id_seq', 1000000004, true);


--
-- Data for Name: i_location; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY i_location (i_location_id, i_user_id, i_creation_date, i_last_update_date, i_country_code, i_country_name, i_city_name, i_prefecture, i_department, i_street_address, i_postal_code) FROM stdin;
1000000002	1000000020	2017-10-29 15:07:49.898223	2017-10-29 15:13:11.877639	GR	Greece	Athens	Attica	Attica	Saronos 4	11143
1000000003	1000000020	2017-10-29 16:48:07.275397	2017-10-29 16:48:07.275397	GR	Greece	Kalamata	Messinia	Peloponissos	loggas 8	24100
1000000005	1000000020	2017-10-29 16:51:42.444704	2017-10-29 16:51:42.444704	GR	Greece	Kalamata	Messinia	Peloponissos	loggas 10	24100
1000000006	1000000020	2017-10-29 22:05:11.732534	2017-10-29 22:05:11.732534	GR	Greece	Kalamata	Messinia	Peloponissos	loggas 10	24100
1000000010	1000000023	2017-10-30 20:31:47.543345	2017-10-30 20:31:47.543345	GR	Greece	Kalamata	Messenia	Peloponnisos Dytiki Ellada ke Ionio	Aristomenous 45	24100
1000000011	1000000023	2017-10-30 20:35:56.798602	2017-10-30 20:35:56.798602	GR	Greece	Kalamata	Messenia	Peloponnisos Dytiki Ellada ke Ionio	Aristomenous 45	241 00
1000000012	1000000023	2017-10-30 20:40:59.183897	2017-10-30 20:40:59.183897	GR	Greece	Kalamata	Messenia	Peloponnisos Dytiki Ellada ke Ionio	Aristomenous 45	241 00
1000000013	1000000023	2017-10-30 22:13:09.887235	2017-10-30 22:13:09.887235	GR	Greece	Kalamata	Messenia	Peloponnisos Dytiki Ellada ke Ionio	Aristomenous 45	241 00
1000000014	1000000023	2017-10-30 22:27:02.560862	2017-10-30 22:27:02.560862	GR	Greece	Kalamata	Messenia	Peloponnisos Dytiki Ellada ke Ionio	Aristomenous 45	241 00
1000000015	1000000023	2017-10-30 22:55:44.872372	2017-10-30 22:55:44.872372	GR	Greece	Filadelfeia-Chalkidona	Central Athens	Attica	Marathonos 8	143 43
1000000016	1000000023	2017-10-30 23:05:47.623848	2017-10-30 23:05:47.623848	GR	Greece	Filadelfeia-Chalkidona	Central Athens	Attica	Anakous 60	143 41
1000000017	1000000023	2017-10-30 23:06:59.639967	2017-10-30 23:06:59.639967	GR	Greece	Pireas	Piraeus	Attica	Praxitelous 238	185 36
1000000018	1000000023	2017-10-30 23:10:34.107233	2017-10-30 23:10:34.107233	GR	Greece	West Mani	Messenia	Peloponnisos Dytiki Ellada ke Ionio	Unnamed Road	241 00
1000000019	1000000023	2017-11-03 00:30:52.691688	2017-11-03 00:30:52.691688	GR	Greece	Athens	Central Athens	Attica	Acharnon 458	111 43
1000000020	1000000023	2017-11-03 00:30:54.545794	2017-11-03 00:30:54.545794	GR	Greece	Athens	Central Athens	Attica	Acharnon 458	111 43
1000000021	1000000023	2017-11-03 00:31:50.367987	2017-11-03 00:31:50.367987	GR	Greece	Athens	Central Athens	Attica	Acharnon 458	111 43
1000000022	1000000023	2017-11-03 00:32:50.325416	2017-11-03 00:32:50.325416	GR	Greece	Athens	Central Athens	Attica	Acharnon 458	111 43
1000000023	1000000023	2017-11-03 00:33:50.36485	2017-11-03 00:33:50.36485	GR	Greece	Athens	Central Athens	Attica	Acharnon 458	111 43
1000000024	1000000023	2017-11-03 00:34:50.398284	2017-11-03 00:34:50.398284	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000025	1000000023	2017-11-03 00:35:50.441718	2017-11-03 00:35:50.441718	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000026	1000000023	2017-11-04 23:30:28.230643	2017-11-04 23:30:28.230643	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000028	1000000023	2017-11-04 23:30:28.236644	2017-11-04 23:30:28.236644	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000027	1000000023	2017-11-04 23:30:28.230643	2017-11-04 23:30:28.230643	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000029	1000000023	2017-11-04 23:30:30.690784	2017-11-04 23:30:30.690784	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000030	1000000023	2017-11-04 23:31:49.311281	2017-11-04 23:31:49.311281	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000031	1000000023	2017-11-04 23:32:52.991923	2017-11-04 23:32:52.991923	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000032	1000000023	2017-11-04 23:33:50.62922	2017-11-04 23:33:50.62922	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000033	1000000023	2017-11-04 23:34:52.52276	2017-11-04 23:34:52.52276	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000034	1000000023	2017-11-04 23:35:54.458302	2017-11-04 23:35:54.458302	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000035	1000000023	2017-11-04 23:35:56.125398	2017-11-04 23:35:56.125398	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000036	1000000023	2017-11-04 23:36:53.727692	2017-11-04 23:36:53.727692	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000037	1000000023	2017-11-04 23:36:53.728692	2017-11-04 23:36:53.728692	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000038	1000000023	2017-11-04 23:37:49.118861	2017-11-04 23:37:49.118861	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000040	1000000023	2017-11-04 23:38:55.993686	2017-11-04 23:38:55.993686	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000039	1000000023	2017-11-04 23:38:55.991685	2017-11-04 23:38:55.991685	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000041	1000000023	2017-11-04 23:40:49.124156	2017-11-04 23:40:49.124156	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000042	1000000023	2017-11-04 23:42:54.790344	2017-11-04 23:42:54.790344	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000043	1000000023	2017-11-04 23:42:54.791344	2017-11-04 23:42:54.791344	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000044	1000000023	2017-11-04 23:44:50.221946	2017-11-04 23:44:50.221946	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000045	1000000023	2017-11-04 23:46:50.57783	2017-11-04 23:46:50.57783	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000046	1000000023	2017-11-04 23:48:49.182614	2017-11-04 23:48:49.182614	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000047	1000000023	2017-11-05 00:38:27.199628	2017-11-05 00:38:27.199628	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000048	1000000023	2017-11-05 02:38:10.608822	2017-11-05 02:38:10.608822	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000049	1000000023	2017-11-05 04:38:18.804108	2017-11-05 04:38:18.804108	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000050	1000000023	2017-11-05 06:38:19.850984	2017-11-05 06:38:19.850984	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000051	1000000023	2017-11-05 08:38:20.844857	2017-11-05 08:38:20.844857	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000052	1000000023	2017-11-05 10:38:22.506769	2017-11-05 10:38:22.506769	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000053	1000000023	2017-11-05 12:02:00.795798	2017-11-05 12:02:00.795798	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000054	1000000023	2017-11-05 12:02:58.915123	2017-11-05 12:02:58.915123	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000055	1000000023	2017-11-05 12:03:58.889553	2017-11-05 12:03:58.889553	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000056	1000000023	2017-11-05 12:04:58.849982	2017-11-05 12:04:58.849982	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000057	1000000023	2017-11-05 12:05:58.931419	2017-11-05 12:05:58.931419	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000058	1000000023	2017-11-05 12:07:12.491626	2017-11-05 12:07:12.491626	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000059	1000000023	2017-11-05 12:08:12.430055	2017-11-05 12:08:12.430055	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000060	1000000023	2017-11-05 12:09:12.404485	2017-11-05 12:09:12.404485	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000061	1000000023	2017-11-05 12:10:12.46392	2017-11-05 12:10:12.46392	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000062	1000000023	2017-11-05 12:11:12.42135	2017-11-05 12:11:12.42135	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000063	1000000023	2017-11-05 12:12:12.507786	2017-11-05 12:12:12.507786	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000064	1000000023	2017-11-05 12:13:12.557221	2017-11-05 12:13:12.557221	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000065	1000000023	2017-11-05 12:14:12.497649	2017-11-05 12:14:12.497649	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000066	1000000023	2017-11-05 12:15:12.458079	2017-11-05 12:15:12.458079	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000067	1000000023	2017-11-05 12:16:12.472511	2017-11-05 12:16:12.472511	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000068	1000000023	2017-11-05 12:17:12.539947	2017-11-05 12:17:12.539947	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000069	1000000023	2017-11-05 12:18:12.491376	2017-11-05 12:18:12.491376	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000070	1000000023	2017-11-05 12:19:12.488808	2017-11-05 12:19:12.488808	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000071	1000000023	2017-11-05 12:20:12.612247	2017-11-05 12:20:12.612247	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000072	1000000023	2017-11-05 12:21:12.63268	2017-11-05 12:21:12.63268	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000073	1000000023	2017-11-05 12:22:12.61011	2017-11-05 12:22:12.61011	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000074	1000000023	2017-11-05 12:23:12.660545	2017-11-05 12:23:12.660545	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000075	1000000023	2017-11-05 12:24:12.583972	2017-11-05 12:24:12.583972	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000076	1000000023	2017-11-05 12:25:12.542402	2017-11-05 12:25:12.542402	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000077	1000000023	2017-11-05 12:26:12.676841	2017-11-05 12:26:12.676841	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000078	1000000023	2017-11-05 12:27:12.730276	2017-11-05 12:27:12.730276	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000079	1000000023	2017-11-05 12:28:12.719707	2017-11-05 12:28:12.719707	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000080	1000000023	2017-11-05 12:29:12.750141	2017-11-05 12:29:12.750141	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000081	1000000023	2017-11-05 12:30:12.659567	2017-11-05 12:30:12.659567	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000082	1000000023	2017-11-05 12:31:12.810008	2017-11-05 12:31:12.810008	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000083	1000000023	2017-11-05 12:32:12.728435	2017-11-05 12:32:12.728435	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000084	1000000023	2017-11-05 12:33:12.78087	2017-11-05 12:33:12.78087	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000085	1000000023	2017-11-05 12:34:12.798303	2017-11-05 12:34:12.798303	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000086	1000000023	2017-11-05 12:35:12.868738	2017-11-05 12:35:12.868738	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000087	1000000023	2017-11-05 12:36:12.841169	2017-11-05 12:36:12.841169	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000088	1000000023	2017-11-05 12:37:12.8276	2017-11-05 12:37:12.8276	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000089	1000000023	2017-11-05 12:38:13.036043	2017-11-05 12:38:13.036043	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000090	1000000023	2017-11-05 12:39:12.93847	2017-11-05 12:39:12.93847	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000091	1000000023	2017-11-05 12:40:12.856897	2017-11-05 12:40:12.856897	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000092	1000000023	2017-11-05 12:41:12.938333	2017-11-05 12:41:12.938333	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000093	1000000023	2017-11-05 12:42:13.139777	2017-11-05 12:42:13.139777	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000094	1000000023	2017-11-05 12:43:13.0012	2017-11-05 12:43:13.0012	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000095	1000000023	2017-11-05 12:44:12.995632	2017-11-05 12:44:12.995632	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000096	1000000023	2017-11-05 12:45:13.032066	2017-11-05 12:45:13.032066	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000097	1000000023	2017-11-05 12:46:13.110502	2017-11-05 12:46:13.110502	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000098	1000000023	2017-11-05 12:47:13.04193	2017-11-05 12:47:13.04193	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000099	1000000023	2017-11-05 12:48:13.01036	2017-11-05 12:48:13.01036	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000100	1000000023	2017-11-05 12:49:13.368812	2017-11-05 12:49:13.368812	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000101	1000000023	2017-11-05 12:50:13.054226	2017-11-05 12:50:13.054226	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000102	1000000023	2017-11-05 12:51:13.063658	2017-11-05 12:51:13.063658	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000103	1000000023	2017-11-05 12:52:13.140095	2017-11-05 12:52:13.140095	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000104	1000000023	2017-11-05 12:53:13.230532	2017-11-05 12:53:13.230532	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000105	1000000023	2017-11-05 12:54:13.204962	2017-11-05 12:54:13.204962	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000106	1000000023	2017-11-05 12:55:13.232395	2017-11-05 12:55:13.232395	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000107	1000000023	2017-11-05 12:56:13.221826	2017-11-05 12:56:13.221826	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000108	1000000023	2017-11-05 12:57:13.301263	2017-11-05 12:57:13.301263	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000109	1000000023	2017-11-05 12:58:13.231691	2017-11-05 12:58:13.231691	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000110	1000000023	2017-11-05 12:59:13.261124	2017-11-05 12:59:13.261124	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000111	1000000023	2017-11-05 13:00:13.386563	2017-11-05 13:00:13.386563	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000112	1000000023	2017-11-05 13:01:13.331992	2017-11-05 13:01:13.331992	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000113	1000000023	2017-11-05 13:02:13.250419	2017-11-05 13:02:13.250419	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000114	1000000023	2017-11-05 13:03:13.448862	2017-11-05 13:03:13.448862	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000115	1000000023	2017-11-05 13:04:13.427293	2017-11-05 13:04:13.427293	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000116	1000000023	2017-11-05 13:05:13.376722	2017-11-05 13:05:13.376722	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000117	1000000023	2017-11-05 13:06:13.470159	2017-11-05 13:06:13.470159	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000118	1000000023	2017-11-05 13:07:13.376585	2017-11-05 13:07:13.376585	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000119	1000000023	2017-11-05 13:08:13.465022	2017-11-05 13:08:13.465022	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000120	1000000023	2017-11-05 13:09:13.499456	2017-11-05 13:09:13.499456	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000121	1000000023	2017-11-05 13:10:13.591893	2017-11-05 13:10:13.591893	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000122	1000000023	2017-11-05 13:11:13.534321	2017-11-05 13:11:13.534321	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000123	1000000023	2017-11-05 13:12:13.461749	2017-11-05 13:12:13.461749	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000124	1000000023	2017-11-05 13:13:13.605189	2017-11-05 13:13:13.605189	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000125	1000000023	2017-11-05 13:14:13.683625	2017-11-05 13:14:13.683625	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000126	1000000023	2017-11-05 13:15:13.656056	2017-11-05 13:15:13.656056	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000127	1000000023	2017-11-05 13:16:13.557482	2017-11-05 13:16:13.557482	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000128	1000000023	2017-11-05 13:17:13.702922	2017-11-05 13:17:13.702922	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000129	1000000023	2017-11-05 13:18:13.669352	2017-11-05 13:18:13.669352	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000130	1000000023	2017-11-05 13:19:13.670784	2017-11-05 13:19:13.670784	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000131	1000000023	2017-11-05 13:20:13.766221	2017-11-05 13:20:13.766221	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000132	1000000023	2017-11-05 13:21:13.675648	2017-11-05 13:21:13.675648	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000133	1000000023	2017-11-05 13:22:13.762084	2017-11-05 13:22:13.762084	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000134	1000000023	2017-11-05 13:23:13.819519	2017-11-05 13:23:13.819519	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000135	1000000023	2017-11-05 13:24:13.722946	2017-11-05 13:24:13.722946	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000136	1000000023	2017-11-05 13:25:13.77438	2017-11-05 13:25:13.77438	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000137	1000000023	2017-11-05 13:26:13.803814	2017-11-05 13:26:13.803814	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000138	1000000023	2017-11-05 13:27:13.789245	2017-11-05 13:27:13.789245	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000139	1000000023	2017-11-05 13:28:13.84768	2017-11-05 13:28:13.84768	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000140	1000000023	2017-11-05 17:16:27.265217	2017-11-05 17:16:27.265217	null	null	null	null	null	null	null
1000000141	1000000023	2017-11-05 17:16:32.580521	2017-11-05 17:16:32.580521	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000142	1000000023	2017-11-05 17:17:32.463946	2017-11-05 17:17:32.463946	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000143	1000000023	2017-11-05 17:18:32.407375	2017-11-05 17:18:32.407375	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000144	1000000023	2017-11-05 17:19:32.619818	2017-11-05 17:19:32.619818	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000145	1000000023	2017-11-05 17:20:32.733257	2017-11-05 17:20:32.733257	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000146	1000000023	2017-11-05 17:21:32.668685	2017-11-05 17:21:32.668685	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000147	1000000023	2017-11-05 17:22:32.796124	2017-11-05 17:22:32.796124	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000148	1000000023	2017-11-05 17:23:32.769554	2017-11-05 17:23:32.769554	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000149	1000000023	2017-11-05 17:24:32.931995	2017-11-05 17:24:32.931995	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000150	1000000023	2017-11-05 17:25:32.869424	2017-11-05 17:25:32.869424	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000151	1000000023	2017-11-05 17:26:33.090868	2017-11-05 17:26:33.090868	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000152	1000000023	2017-11-05 17:27:32.957292	2017-11-05 17:27:32.957292	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000153	1000000023	2017-11-05 17:28:32.838717	2017-11-05 17:28:32.838717	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000154	1000000023	2017-11-05 17:29:32.839149	2017-11-05 17:29:32.839149	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000155	1000000023	2017-11-05 17:30:32.889584	2017-11-05 17:30:32.889584	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000156	1000000023	2017-11-05 17:31:32.910017	2017-11-05 17:31:32.910017	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000157	1000000023	2017-11-05 17:32:33.076458	2017-11-05 17:32:33.076458	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000158	1000000023	2017-11-05 17:33:33.022887	2017-11-05 17:33:33.022887	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000159	1000000023	2017-11-05 17:34:32.973316	2017-11-05 17:34:32.973316	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000160	1000000023	2017-11-05 17:35:32.973748	2017-11-05 17:35:32.973748	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000161	1000000023	2017-11-05 17:36:32.944178	2017-11-05 17:36:32.944178	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000162	1000000023	2017-11-05 17:37:32.938609	2017-11-05 17:37:32.938609	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000163	1000000023	2017-11-05 17:38:33.079049	2017-11-05 17:38:33.079049	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000164	1000000023	2017-11-05 17:39:32.979475	2017-11-05 17:39:32.979475	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000165	1000000023	2017-11-05 17:40:33.249922	2017-11-05 17:40:33.249922	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000166	1000000023	2017-11-05 17:41:33.366361	2017-11-05 17:41:33.366361	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000167	1000000023	2017-11-05 17:42:33.156781	2017-11-05 17:42:33.156781	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000168	1000000023	2017-11-05 17:43:33.932257	2017-11-05 17:43:33.932257	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000169	1000000023	2017-11-05 17:44:33.162645	2017-11-05 17:44:33.162645	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000170	1000000023	2017-11-05 17:45:33.124074	2017-11-05 17:45:33.124074	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000171	1000000023	2017-11-05 17:46:33.446524	2017-11-05 17:46:33.446524	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000172	1000000023	2017-11-05 17:47:33.301948	2017-11-05 17:47:33.301948	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000173	1000000023	2017-11-05 17:48:33.435387	2017-11-05 17:48:33.435387	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000174	1000000023	2017-11-05 17:49:33.349814	2017-11-05 17:49:33.349814	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000175	1000000023	2017-11-05 17:50:33.571259	2017-11-05 17:50:33.571259	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000176	1000000023	2017-11-05 17:51:33.329677	2017-11-05 17:51:33.329677	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000177	1000000023	2017-11-05 17:52:33.598124	2017-11-05 17:52:33.598124	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000178	1000000023	2017-11-05 17:54:08.055527	2017-11-05 17:54:08.055527	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000179	1000000023	2017-11-05 17:55:08.119962	2017-11-05 17:55:08.119962	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000180	1000000023	2017-11-05 17:56:08.100393	2017-11-05 17:56:08.100393	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000181	1000000023	2017-11-05 17:57:08.324837	2017-11-05 17:57:08.324837	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000182	1000000023	2017-11-05 17:58:08.193262	2017-11-05 17:58:08.193262	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000183	1000000023	2017-11-05 17:59:08.13969	2017-11-05 17:59:08.13969	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000184	1000000023	2017-11-05 18:00:08.27713	2017-11-05 18:00:08.27713	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000185	1000000023	2017-11-05 18:01:08.315564	2017-11-05 18:01:08.315564	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000186	1000000023	2017-11-05 18:02:08.264993	2017-11-05 18:02:08.264993	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000187	1000000023	2017-11-05 18:03:08.202421	2017-11-05 18:03:08.202421	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000188	1000000023	2017-11-05 18:04:08.244855	2017-11-05 18:04:08.244855	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000189	1000000023	2017-11-05 18:05:08.420297	2017-11-05 18:05:08.420297	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000190	1000000023	2017-11-05 18:06:08.650742	2017-11-05 18:06:08.650742	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000191	1000000023	2017-11-05 18:07:08.283153	2017-11-05 18:07:08.283153	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000192	1000000023	2017-11-05 18:08:08.309586	2017-11-05 18:08:08.309586	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000193	1000000023	2017-11-05 18:09:08.468027	2017-11-05 18:09:08.468027	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000194	1000000023	2017-11-05 18:10:08.434457	2017-11-05 18:10:08.434457	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000195	1000000023	2017-11-05 18:11:08.578897	2017-11-05 18:11:08.578897	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000196	1000000023	2017-11-05 18:12:08.59633	2017-11-05 18:12:08.59633	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000197	1000000020	2017-11-26 21:53:43.589013	2017-11-26 21:53:43.589013	null	null	null	null	null	null	null
1000000198	1000000020	2017-11-26 22:00:20.444712	2017-11-26 22:00:20.444712	null	null	null	null	null	null	null
1000000199	1000000020	2017-11-26 22:01:20.21713	2017-11-26 22:01:20.21713	null	null	null	null	null	null	null
1000000200	1000000020	2017-11-26 22:02:20.100556	2017-11-26 22:02:20.100556	null	null	null	null	null	null	null
1000000201	1000000020	2017-11-26 22:03:20.453008	2017-11-26 22:03:20.453008	null	null	null	null	null	null	null
1000000202	1000000020	2017-11-26 22:04:20.262428	2017-11-26 22:04:20.262428	null	null	null	null	null	null	null
1000000203	1000000020	2017-11-26 22:05:20.174855	2017-11-26 22:05:20.174855	null	null	null	null	null	null	null
1000000204	1000000020	2017-11-26 22:06:20.214289	2017-11-26 22:06:20.214289	null	null	null	null	null	null	null
1000000205	1000000020	2017-11-26 22:07:20.18772	2017-11-26 22:07:20.18772	null	null	null	null	null	null	null
1000000206	1000000020	2017-11-26 22:08:20.328159	2017-11-26 22:08:20.328159	null	null	null	null	null	null	null
1000000207	1000000020	2017-11-26 22:09:20.346592	2017-11-26 22:09:20.346592	null	null	null	null	null	null	null
1000000208	1000000020	2017-11-26 22:10:20.410028	2017-11-26 22:10:20.410028	null	null	null	null	null	null	null
1000000209	1000000020	2017-11-26 22:11:44.006809	2017-11-26 22:11:44.006809	null	null	null	null	null	null	null
1000000210	1000000020	2017-11-26 22:12:43.685223	2017-11-26 22:12:43.685223	null	null	null	null	null	null	null
1000000211	1000000020	2017-11-26 22:13:43.474642	2017-11-26 22:13:43.474642	null	null	null	null	null	null	null
1000000212	1000000020	2017-11-26 22:14:43.421071	2017-11-26 22:14:43.421071	null	null	null	null	null	null	null
1000000213	1000000020	2017-11-26 22:15:43.455505	2017-11-26 22:15:43.455505	null	null	null	null	null	null	null
1000000214	1000000020	2017-11-26 22:16:43.458937	2017-11-26 22:16:43.458937	null	null	null	null	null	null	null
1000000215	1000000020	2017-11-26 22:17:43.443368	2017-11-26 22:17:43.443368	null	null	null	null	null	null	null
1000000216	1000000020	2017-11-26 22:18:43.599808	2017-11-26 22:18:43.599808	null	null	null	null	null	null	null
1000000217	1000000020	2017-11-26 22:19:43.59724	2017-11-26 22:19:43.59724	null	null	null	null	null	null	null
1000000218	1000000020	2017-11-26 22:20:43.443663	2017-11-26 22:20:43.443663	null	null	null	null	null	null	null
1000000219	1000000020	2017-11-26 22:21:43.984126	2017-11-26 22:21:43.984126	null	null	null	null	null	null	null
1000000220	1000000020	2017-11-26 22:22:43.576534	2017-11-26 22:22:43.576534	null	null	null	null	null	null	null
1000000221	1000000020	2017-11-26 22:23:43.533964	2017-11-26 22:23:43.533964	null	null	null	null	null	null	null
1000000222	1000000020	2017-11-26 22:24:43.645402	2017-11-26 22:24:43.645402	null	null	null	null	null	null	null
1000000223	1000000020	2017-11-26 22:25:43.74884	2017-11-26 22:25:43.74884	null	null	null	null	null	null	null
1000000224	1000000020	2017-11-26 22:26:43.857278	2017-11-26 22:26:43.857278	null	null	null	null	null	null	null
1000000225	1000000020	2017-11-26 22:27:43.561693	2017-11-26 22:27:43.561693	null	null	null	null	null	null	null
1000000226	1000000020	2017-11-26 22:28:43.720133	2017-11-26 22:28:43.720133	null	null	null	null	null	null	null
1000000227	1000000020	2017-11-26 22:29:43.682563	2017-11-26 22:29:43.682563	null	null	null	null	null	null	null
1000000228	1000000020	2017-11-26 22:30:43.695996	2017-11-26 22:30:43.695996	null	null	null	null	null	null	null
1000000229	1000000020	2017-11-26 22:31:43.874438	2017-11-26 22:31:43.874438	null	null	null	null	null	null	null
1000000230	1000000020	2017-11-26 22:32:43.808866	2017-11-26 22:32:43.808866	null	null	null	null	null	null	null
1000000231	1000000020	2017-11-26 22:33:44.191319	2017-11-26 22:33:44.191319	null	null	null	null	null	null	null
1000000232	1000000020	2017-11-26 22:34:43.81373	2017-11-26 22:34:43.81373	null	null	null	null	null	null	null
1000000233	1000000020	2017-11-26 22:35:44.534203	2017-11-26 22:35:44.534203	null	null	null	null	null	null	null
1000000234	1000000020	2017-11-26 22:36:44.071608	2017-11-26 22:36:44.071608	null	null	null	null	null	null	null
1000000235	1000000020	2017-11-26 22:37:44.08004	2017-11-26 22:37:44.08004	null	null	null	null	null	null	null
1000000236	1000000020	2017-11-27 02:54:11.31414	2017-11-27 02:54:11.31414	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000237	1000000020	2017-11-27 02:55:11.390576	2017-11-27 02:55:11.390576	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000238	1000000020	2017-11-27 02:56:11.357006	2017-11-27 02:56:11.357006	GR	Greece	Chalandri	North Athens	Attica	Kosta Varnali 35A	152 33
1000000239	1000000020	2017-11-27 02:57:11.300434	2017-11-27 02:57:11.300434	GR	Greece	Chalandri	North Athens	Attica	Kosta Varnali 35A	152 33
1000000240	1000000020	2017-11-27 02:58:11.352869	2017-11-27 02:58:11.352869	GR	Greece	Chalandri	North Athens	Attica	Kosta Varnali 35A	152 33
1000000241	1000000020	2017-11-27 02:59:11.327299	2017-11-27 02:59:11.327299	null	null	null	null	null	null	null
1000000242	1000000020	2017-11-27 03:00:11.434737	2017-11-27 03:00:11.434737	GR	Greece	Attica	null	Attica	Aspropyrgos	null
1000000243	1000000020	2017-11-27 17:32:43.336508	2017-11-27 17:32:43.336508	GR	Greece	Attica	null	Attica	Aspropyrgos	null
1000000244	1000000020	2017-11-27 17:34:37.943063	2017-11-27 17:34:37.943063	null	null	null	null	null	null	null
1000000245	1000000020	2017-11-27 17:35:33.276228	2017-11-27 17:35:33.276228	GR	Greece	Attica	null	Attica	Aspropyrgos	null
1000000246	1000000020	2017-11-27 17:36:33.737687	2017-11-27 17:36:33.737687	GR	Greece	Attica	null	Attica	Aspropyrgos	null
1000000247	1000000020	2017-11-27 17:37:33.353096	2017-11-27 17:37:33.353096	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000248	1000000020	2017-11-27 17:38:33.294525	2017-11-27 17:38:33.294525	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000249	1000000020	2017-11-27 17:39:33.308957	2017-11-27 17:39:33.308957	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000250	1000000020	2017-11-27 17:40:33.342391	2017-11-27 17:40:33.342391	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000251	1000000020	2017-11-27 17:41:33.567836	2017-11-27 17:41:33.567836	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000252	1000000020	2017-11-27 17:42:33.354255	2017-11-27 17:42:33.354255	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000253	1000000020	2017-11-27 17:43:33.354687	2017-11-27 17:43:33.354687	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000254	1000000020	2017-11-27 17:44:33.37912	2017-11-27 17:44:33.37912	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000255	1000000020	2017-11-27 17:45:33.432555	2017-11-27 17:45:33.432555	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000256	1000000020	2017-11-29 23:31:03.031242	2017-11-29 23:31:03.031242	null	null	null	null	null	null	null
1000000257	1000000020	2017-11-29 23:32:02.983855	2017-11-29 23:32:02.983855	null	null	null	null	null	null	null
1000000258	1000000020	2017-11-29 23:33:03.012478	2017-11-29 23:33:03.012478	null	null	null	null	null	null	null
1000000259	1000000020	2017-11-29 23:33:59.047093	2017-11-29 23:33:59.047093	null	null	null	null	null	null	null
1000000260	1000000020	2017-11-29 23:35:00.536402	2017-11-29 23:35:00.536402	null	null	null	null	null	null	null
1000000261	1000000020	2017-11-29 23:36:19.068874	2017-11-29 23:36:19.068874	null	null	null	null	null	null	null
1000000262	1000000020	2017-11-29 23:36:59.060952	2017-11-29 23:36:59.060952	null	null	null	null	null	null	null
1000000263	1000000020	2017-11-29 23:39:20.306388	2017-11-29 23:39:20.306388	null	null	null	null	null	null	null
1000000264	1000000020	2017-11-29 23:41:54.184428	2017-11-29 23:41:54.184428	null	null	null	null	null	null	null
1000000265	1000000020	2017-11-29 23:42:37.833471	2017-11-29 23:42:37.833471	null	null	null	null	null	null	null
1000000266	1000000020	2017-11-29 23:43:54.286679	2017-11-29 23:43:54.286679	null	null	null	null	null	null	null
1000000267	1000000020	2017-11-29 23:44:34.923339	2017-11-29 23:44:34.923339	null	null	null	null	null	null	null
1000000268	1000000020	2017-11-29 23:47:00.129778	2017-11-29 23:47:00.129778	GR	Greece	Kalamata	Peloponnese	Peloponnisos Dytiki Ellada ke Ionio	Stadiou 4-18, Kalamata 241 00, Greece	241 00
1000000269	1000000020	2017-11-29 23:48:44.056475	2017-11-29 23:48:44.056475	GR	Greece	Kalamata	Peloponnese	Peloponnisos Dytiki Ellada ke Ionio	Athinon 34, Kalamata 241 00, Greece	241 00
1000000270	1000000020	2017-11-29 23:49:06.820866	2017-11-29 23:49:06.820866	GR	Greece	Kalamata	Peloponnese	Peloponnisos Dytiki Ellada ke Ionio	Athinon 95, Kalamata 241 00, Greece	241 00
1000000271	1000000020	2017-11-29 23:50:02.13339	2017-11-29 23:50:02.13339	GR	Greece	Kalamata	Peloponnese	Peloponnisos Dytiki Ellada ke Ionio	Athinon 95, Kalamata 241 00, Greece	241 00
1000000272	1000000020	2017-11-29 23:51:27.208693	2017-11-29 23:51:27.208693	GR	Greece	Kalamata	Peloponnese	Peloponnisos Dytiki Ellada ke Ionio	Athinon 95, Kalamata 241 00, Greece	241 00
1000000273	1000000020	2017-11-29 23:52:03.831844	2017-11-29 23:52:03.831844	GR	Greece	Kalamata	Peloponnese	Peloponnisos Dytiki Ellada ke Ionio	Athinon 95, Kalamata 241 00, Greece	241 00
1000000274	1000000020	2017-12-02 14:34:04.642786	2017-12-02 14:34:04.642786	null	null	null	null	null	null	null
1000000275	1000000020	2017-12-02 14:36:12.055466	2017-12-02 14:36:12.055466	null	null	null	null	null	null	null
1000000276	1000000020	2017-12-02 15:40:10.235853	2017-12-02 15:40:10.235853	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000277	1000000020	2017-12-02 15:41:48.452825	2017-12-02 15:41:48.452825	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000278	1000000020	2017-12-02 15:42:29.329515	2017-12-02 15:42:29.329515	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000279	1000000020	2017-12-02 15:43:08.407478	2017-12-02 15:43:08.407478	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000280	1000000020	2017-12-02 15:49:50.311013	2017-12-02 15:49:50.311013	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000281	1000000020	2017-12-02 16:32:16.864884	2017-12-02 16:32:16.864884	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000282	1000000020	2017-12-02 16:33:13.920129	2017-12-02 16:33:13.920129	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000283	1000000020	2017-12-02 16:34:46.362868	2017-12-02 16:34:46.362868	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000284	1000000020	2017-12-02 16:35:13.912867	2017-12-02 16:35:13.912867	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000285	1000000020	2017-12-02 16:36:13.933988	2017-12-02 16:36:13.933988	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000286	1000000020	2017-12-02 16:37:26.363686	2017-12-02 16:37:26.363686	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000287	1000000020	2017-12-02 16:38:13.911223	2017-12-02 16:38:13.911223	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000288	1000000020	2017-12-02 16:39:13.909342	2017-12-02 16:39:13.909342	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000289	1000000020	2017-12-02 16:40:13.97947	2017-12-02 16:40:13.97947	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000290	1000000020	2017-12-02 16:41:13.918081	2017-12-02 16:41:13.918081	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000291	1000000020	2017-12-02 16:42:53.926281	2017-12-02 16:42:53.926281	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000292	1000000020	2017-12-02 16:43:13.947323	2017-12-02 16:43:13.947323	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000293	1000000020	2017-12-02 16:44:13.957443	2017-12-02 16:44:13.957443	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000294	1000000020	2017-12-02 16:45:33.934599	2017-12-02 16:45:33.934599	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000295	1000000020	2017-12-02 16:46:13.912676	2017-12-02 16:46:13.912676	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000296	1000000020	2017-12-02 16:47:15.000433	2017-12-02 16:47:15.000433	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000297	1000000020	2017-12-02 16:48:13.96192	2017-12-02 16:48:13.96192	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000298	1000000020	2017-12-02 16:49:13.928535	2017-12-02 16:49:13.928535	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000299	1000000029	2017-12-02 16:52:15.302066	2017-12-02 16:52:15.302066	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000300	1000000029	2017-12-02 16:53:15.289684	2017-12-02 16:53:15.289684	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000301	1000000029	2017-12-02 16:54:53.648174	2017-12-02 16:54:53.648174	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000302	1000000029	2017-12-02 16:55:15.285421	2017-12-02 16:55:15.285421	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000303	1000000029	2017-12-02 16:56:15.271539	2017-12-02 16:56:15.271539	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000304	1000000029	2017-12-02 16:57:33.621988	2017-12-02 16:57:33.621988	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000305	1000000029	2017-12-02 16:58:15.278278	2017-12-02 16:58:15.278278	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000306	1000000029	2017-12-02 16:59:15.273396	2017-12-02 16:59:15.273396	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000307	1000000029	2017-12-02 17:00:15.86109	2017-12-02 17:00:15.86109	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000308	1000000029	2017-12-02 17:01:15.274634	2017-12-02 17:01:15.274634	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000309	1000000029	2017-12-02 17:02:15.279254	2017-12-02 17:02:15.279254	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000310	1000000029	2017-12-02 17:03:15.266371	2017-12-02 17:03:15.266371	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000311	1000000029	2017-12-02 17:40:24.162798	2017-12-02 17:40:24.162798	null	null	null	null	null	null	null
1000000312	1000000029	2017-12-02 17:41:20.40594	2017-12-02 17:41:20.40594	null	null	null	null	null	null	null
1000000313	1000000029	2017-12-02 17:42:25.546711	2017-12-02 17:42:25.546711	null	null	null	null	null	null	null
1000000314	1000000029	2017-12-02 17:43:20.358672	2017-12-02 17:43:20.358672	null	null	null	null	null	null	null
1000000315	1000000029	2017-12-02 17:44:20.408297	2017-12-02 17:44:20.408297	null	null	null	null	null	null	null
1000000316	1000000029	2017-12-02 17:45:20.382413	2017-12-02 17:45:20.382413	null	null	null	null	null	null	null
1000000317	1000000030	2017-12-03 18:57:11.100846	2017-12-03 18:57:11.100846	null	null	null	null	null	null	null
1000000318	1000000030	2017-12-10 15:29:41.873298	2017-12-10 15:29:41.873298	null	null	null	null	null	null	null
1000000319	1000000030	2017-12-10 18:53:13.383029	2017-12-10 18:53:13.383029	null	null	null	null	null	null	null
\.


--
-- Name: i_location_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('i_location_id_seq', 1000000319, true);


--
-- Data for Name: i_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY i_user (i_user_id, i_creation_date, i_last_update_date, i_first_name, i_last_name, i_mobile_number, i_username, i_password, i_email_address, i_register_type) FROM stdin;
1000000020	2017-10-12 19:55:19.392707	2017-10-12 19:55:19.392707	Ioannis	Kozompolis	6971903121	giannis		g.kozompolis@gmail.com	\N
1000000021	2017-10-12 19:57:45.490063	2017-10-12 19:57:45.490063	Ioannis 	Kozompolis	6971903121	giannis2		g.kozompolis@gmail.com	\N
1000000022	2017-10-12 20:55:23.476849	2017-10-12 20:55:23.476849	aek	ole	6971903121	aek		giannis1990@gmail.com	\N
1000000023	2017-10-12 21:08:52.548125	2017-10-12 21:08:52.548125	giannis4			giannis4			\N
1000000024	2017-10-14 21:22:11.872753	2017-10-14 21:22:11.872753	giannis5			giannis5			\N
1000000025	2017-10-14 21:27:15.417114	2017-10-14 21:27:15.417114	giannis6			giannis6			\N
1000000026	2017-11-25 21:04:47.794319	2017-11-25 21:04:47.794319	Ioannis	Kozompolis	6971903121	giannis2669		g.kozompolis@gmail.com	\N
1000000027	2017-12-02 16:22:39.382553	2017-12-02 16:22:39.382553	Ioannnis	Kozompolis	6971903121	kozo		g.kozompolis@gmail.com	\N
1000000028	2017-12-02 16:30:33.483257	2017-12-02 16:30:33.483257				kozompolis			\N
1000000029	2017-12-02 16:52:05.125274	2017-12-02 16:52:05.125274				testuser1			\N
1000000030	2017-12-03 17:55:53.547356	2017-12-03 17:55:53.547356	John	Kozo		1127478420719730		g.kozompolis@gmail.com	\N
\.


--
-- Name: i_user_i_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('i_user_i_user_id_seq', 1000000030, true);


--
-- Name: i_work_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('i_work_id_seq', 1000000023, true);


--
-- Data for Name: i_work_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY i_work_info (i_work_id, i_user_id, i_creation_date, i_last_update_date, i_work_employer, i_work_position) FROM stdin;
1000000008	1000000020	2017-12-09 18:07:12.183065	2017-12-09 18:07:12.183065	Almasport	Sales
1000000009	1000000020	2017-12-09 18:13:25.564421	2017-12-09 18:13:25.564421	\N	\N
1000000010	1000000030	2017-12-10 14:28:51.964701	2017-12-10 14:28:51.964701	Velti	QA Engineer
1000000011	1000000030	2017-12-10 15:26:23.561616	2017-12-10 15:26:23.561616	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000012	1000000030	2017-12-10 15:31:11.868226	2017-12-10 15:31:11.868226	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000013	1000000030	2017-12-10 15:32:59.937949	2017-12-10 15:32:59.937949	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000014	1000000030	2017-12-10 15:34:53.439362	2017-12-10 15:34:53.439362	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000015	1000000030	2017-12-10 16:19:59.583499	2017-12-10 16:19:59.583499	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000016	1000000030	2017-12-10 16:21:56.754378	2017-12-10 16:21:56.754378	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000017	1000000030	2017-12-10 16:25:51.281659	2017-12-10 16:25:51.281659	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000018	1000000030	2017-12-10 18:58:47.20742	2017-12-10 18:58:47.20742	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000019	1000000030	2017-12-10 18:58:47.239924	2017-12-10 18:58:47.239924	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000020	1000000030	2017-12-10 19:03:49.897356	2017-12-10 19:03:49.897356	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000021	1000000030	2017-12-10 19:20:44.539699	2017-12-10 19:20:44.539699	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000022	1000000030	2017-12-10 19:24:38.35189	2017-12-10 19:24:38.35189	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000023	1000000030	2017-12-10 19:27:42.773308	2017-12-10 19:27:42.773308	Velti S.A.	Quality Assurance Engineer (QA Engineer)
\.


--
-- Name: i_education_info i_education_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_education_info
    ADD CONSTRAINT i_education_info_pkey PRIMARY KEY (i_education_id);


--
-- Name: i_fb_books i_fb_books_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_books
    ADD CONSTRAINT i_fb_books_pkey PRIMARY KEY (i_fb_books_id);


--
-- Name: i_fb_events i_fb_events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_events
    ADD CONSTRAINT i_fb_events_pkey PRIMARY KEY (i_fb_events_id);


--
-- Name: i_fb_favorite_teams i_fb_favorite_team_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_favorite_teams
    ADD CONSTRAINT i_fb_favorite_team_pkey PRIMARY KEY (i_fb_favorite_teams_id);


--
-- Name: i_fb_music i_fb_music_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_music
    ADD CONSTRAINT i_fb_music_pkey PRIMARY KEY (i_fb_music_id);


--
-- Name: i_interest_fb_pages i_interest_pages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_interest_fb_pages
    ADD CONSTRAINT i_interest_pages_pkey PRIMARY KEY (i_interest_pages_id);


--
-- Name: i_location i_location_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_location
    ADD CONSTRAINT i_location_pkey PRIMARY KEY (i_location_id);


--
-- Name: i_user i_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_user
    ADD CONSTRAINT i_user_pkey PRIMARY KEY (i_user_id);


--
-- Name: i_work_info i_work_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_work_info
    ADD CONSTRAINT i_work_info_pkey PRIMARY KEY (i_work_id);


--
-- Name: fki_E; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_E" ON i_education_info USING btree (i_user_id);


--
-- Name: fki_F; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_F" ON i_interest_fb_pages USING btree (i_user_id);


--
-- Name: fki_G; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_G" ON i_fb_events USING btree (i_user_id);


--
-- Name: fki_H; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_H" ON i_fb_events USING btree (i_user_id);


--
-- Name: fki_I; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_I" ON i_fb_events USING btree (i_user_id);


--
-- Name: fki_J; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_J" ON i_fb_favorite_teams USING btree (i_user_id);


--
-- Name: fki_i_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_i_user_id ON i_work_info USING btree (i_user_id);


--
-- Name: i_education_info Update_Data; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "Update_Data" BEFORE UPDATE ON i_education_info FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- Name: i_interest_fb_pages Update_Data; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "Update_Data" BEFORE UPDATE ON i_interest_fb_pages FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- Name: i_fb_events Update_Data; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "Update_Data" BEFORE UPDATE ON i_fb_events FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- Name: i_fb_books Update_Data; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "Update_Data" BEFORE UPDATE ON i_fb_books FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- Name: i_fb_music Update_Data; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "Update_Data" BEFORE UPDATE ON i_fb_music FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- Name: i_fb_favorite_teams Update_Data; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "Update_Data" BEFORE UPDATE ON i_fb_favorite_teams FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- Name: i_location Update_last_update_date; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "Update_last_update_date" BEFORE UPDATE ON i_location FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- Name: i_user set_timestamp; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER set_timestamp BEFORE UPDATE ON i_user FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- Name: i_work_info set_timestamp; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER set_timestamp BEFORE UPDATE ON i_work_info FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- Name: i_location User ID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_location
    ADD CONSTRAINT "User ID" FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id);


--
-- Name: i_education_info User_id_in_education_info; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_education_info
    ADD CONSTRAINT "User_id_in_education_info" FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: i_fb_books User_id_in_i_fb_books; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_books
    ADD CONSTRAINT "User_id_in_i_fb_books" FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- Name: i_fb_events User_id_in_i_fb_events; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_events
    ADD CONSTRAINT "User_id_in_i_fb_events" FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- Name: i_fb_favorite_teams User_id_in_i_fb_favorite_teams; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_favorite_teams
    ADD CONSTRAINT "User_id_in_i_fb_favorite_teams" FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- Name: i_fb_music User_id_in_i_fb_music; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_music
    ADD CONSTRAINT "User_id_in_i_fb_music" FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- Name: i_interest_fb_pages User_id_in_interest_pages; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_interest_fb_pages
    ADD CONSTRAINT "User_id_in_interest_pages" FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- Name: i_education_info fkck4ugidmocgo1ugp68cqndwgc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_education_info
    ADD CONSTRAINT fkck4ugidmocgo1ugp68cqndwgc FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id);


--
-- Name: i_work_info fkcoqbcg27jlgcyjfnh4n65uehx; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_work_info
    ADD CONSTRAINT fkcoqbcg27jlgcyjfnh4n65uehx FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id);


--
-- Name: i_location fkg0rrrwit513pw13pr3n3o2u4e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_location
    ADD CONSTRAINT fkg0rrrwit513pw13pr3n3o2u4e FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id);


--
-- Name: i_work_info i_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_work_info
    ADD CONSTRAINT i_user_id FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: i_education_info i_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_education_info
    ADD CONSTRAINT i_user_id FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: i_interest_fb_pages i_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_interest_fb_pages
    ADD CONSTRAINT i_user_id FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- Name: i_fb_events i_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_events
    ADD CONSTRAINT i_user_id FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- Name: i_fb_books i_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_books
    ADD CONSTRAINT i_user_id FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- Name: i_fb_music i_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_music
    ADD CONSTRAINT i_user_id FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- Name: i_fb_favorite_teams i_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_favorite_teams
    ADD CONSTRAINT i_user_id FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: register_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE register_type AS ENUM (
    'facebook',
    'custom'
);


ALTER TYPE register_type OWNER TO postgres;

--
-- Name: trigger_set_timestamp(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION trigger_set_timestamp() RETURNS trigger
    LANGUAGE plpgsql
    AS $$  
BEGIN  
  NEW.i_last_update_date = NOW();
  RETURN NEW;
END;  
$$;


ALTER FUNCTION public.trigger_set_timestamp() OWNER TO postgres;

--
-- Name: greeting_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE greeting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE greeting_id_seq OWNER TO postgres;

--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hibernate_sequence OWNER TO postgres;

--
-- Name: i_education_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE i_education_id_seq
    START WITH 1000000000
    INCREMENT BY 1
    MINVALUE 1000000000
    MAXVALUE 9999999999999
    CACHE 1;


ALTER TABLE i_education_id_seq OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: i_education_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE i_education_info (
    i_education_id bigint DEFAULT nextval('i_education_id_seq'::regclass) NOT NULL,
    i_user_id bigint NOT NULL,
    i_creation_date timestamp(6) without time zone DEFAULT now(),
    i_last_update_date timestamp(6) without time zone DEFAULT now(),
    i_edu_degree character varying(100),
    i_edu_school character varying(100),
    i_edu_type character varying(100),
    i_edu_year character varying(20)
);


ALTER TABLE i_education_info OWNER TO postgres;

--
-- Name: i_fb_books_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE i_fb_books_id_seq
    START WITH 1000000000
    INCREMENT BY 1
    MINVALUE 1000000000
    MAXVALUE 9999999999999
    CACHE 1;


ALTER TABLE i_fb_books_id_seq OWNER TO postgres;

--
-- Name: i_fb_books; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE i_fb_books (
    i_fb_books_id bigint DEFAULT nextval('i_fb_books_id_seq'::regclass) NOT NULL,
    i_user_id bigint NOT NULL,
    i_creation_date timestamp(6) without time zone DEFAULT now(),
    i_last_update_date timestamp(6) without time zone DEFAULT now(),
    i_book_name character varying(100),
    i_book_description character varying(1000)
);


ALTER TABLE i_fb_books OWNER TO postgres;

--
-- Name: i_fb_events_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE i_fb_events_id_seq
    START WITH 1000000000
    INCREMENT BY 1
    MINVALUE 1000000000
    MAXVALUE 999999999999999
    CACHE 1;


ALTER TABLE i_fb_events_id_seq OWNER TO postgres;

--
-- Name: i_fb_events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE i_fb_events (
    i_fb_events_id bigint DEFAULT nextval('i_fb_events_id_seq'::regclass) NOT NULL,
    i_user_id bigint NOT NULL,
    i_creation_date timestamp(6) without time zone DEFAULT now(),
    i_last_update_date timestamp(6) without time zone DEFAULT now(),
    i_event_name character varying(100),
    i_event_description character varying(1000),
    i_event_start_date timestamp(6) without time zone
);


ALTER TABLE i_fb_events OWNER TO postgres;

--
-- Name: i_fb_favorite_teams_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE i_fb_favorite_teams_id_seq
    START WITH 1000000000
    INCREMENT BY 1
    MINVALUE 1000000000
    MAXVALUE 9999999999999
    CACHE 1;


ALTER TABLE i_fb_favorite_teams_id_seq OWNER TO postgres;

--
-- Name: i_fb_favorite_teams; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE i_fb_favorite_teams (
    i_fb_favorite_teams_id bigint DEFAULT nextval('i_fb_favorite_teams_id_seq'::regclass) NOT NULL,
    i_user_id bigint NOT NULL,
    i_creation_date timestamp(6) without time zone DEFAULT now(),
    i_last_update_date timestamp(6) without time zone DEFAULT now(),
    i_team_name character varying(100)
);


ALTER TABLE i_fb_favorite_teams OWNER TO postgres;

--
-- Name: i_fb_music_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE i_fb_music_id_seq
    START WITH 1000000000
    INCREMENT BY 1
    MINVALUE 1000000000
    MAXVALUE 9999999999999
    CACHE 1;


ALTER TABLE i_fb_music_id_seq OWNER TO postgres;

--
-- Name: i_fb_music; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE i_fb_music (
    i_fb_music_id bigint DEFAULT nextval('i_fb_music_id_seq'::regclass) NOT NULL,
    i_user_id bigint NOT NULL,
    i_creation_date timestamp(6) without time zone DEFAULT now(),
    i_last_update_date timestamp(6) without time zone DEFAULT now(),
    i_music_title character varying(100)
);


ALTER TABLE i_fb_music OWNER TO postgres;

--
-- Name: i_interest_pages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE i_interest_pages_id_seq
    START WITH 1000000000
    INCREMENT BY 1
    MINVALUE 1000000000
    MAXVALUE 99999999999999
    CACHE 1;


ALTER TABLE i_interest_pages_id_seq OWNER TO postgres;

--
-- Name: i_interest_fb_pages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE i_interest_fb_pages (
    i_interest_pages_id bigint DEFAULT nextval('i_interest_pages_id_seq'::regclass) NOT NULL,
    i_user_id bigint NOT NULL,
    i_creation_date timestamp(6) without time zone DEFAULT now(),
    i_last_update_date timestamp(6) without time zone DEFAULT now(),
    i_page_name character varying(100),
    i_page_description character varying(400)
);


ALTER TABLE i_interest_fb_pages OWNER TO postgres;

--
-- Name: i_location_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE i_location_id_seq
    START WITH 1000000001
    INCREMENT BY 1
    MINVALUE 1000000001
    MAXVALUE 99999999999999
    CACHE 1;


ALTER TABLE i_location_id_seq OWNER TO postgres;

--
-- Name: i_location; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE i_location (
    i_location_id bigint DEFAULT nextval('i_location_id_seq'::regclass) NOT NULL,
    i_user_id bigint NOT NULL,
    i_creation_date timestamp(6) without time zone DEFAULT now(),
    i_last_update_date timestamp(6) without time zone DEFAULT now(),
    i_country_code character varying(5),
    i_country_name character varying(50),
    i_city_name character varying(50),
    i_prefecture character varying(50),
    i_department character varying(50),
    i_street_address character varying(100),
    i_postal_code character varying(10)
);


ALTER TABLE i_location OWNER TO postgres;

--
-- Name: i_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE i_user (
    i_user_id bigint NOT NULL,
    i_creation_date timestamp(6) without time zone DEFAULT now() NOT NULL,
    i_last_update_date timestamp(6) without time zone DEFAULT now() NOT NULL,
    i_first_name character varying(50),
    i_last_name character varying(50),
    i_mobile_number character varying(20),
    i_username character varying(50),
    i_password character varying(50),
    i_email_address character varying(100),
    i_register_type character varying(100)
);


ALTER TABLE i_user OWNER TO postgres;

--
-- Name: i_user_i_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE i_user_i_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE i_user_i_user_id_seq OWNER TO postgres;

--
-- Name: i_user_i_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE i_user_i_user_id_seq OWNED BY i_user.i_user_id;


--
-- Name: i_work_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE i_work_id_seq
    START WITH 1000000000
    INCREMENT BY 1
    MINVALUE 1000000000
    MAXVALUE 999999999999999
    CACHE 1;


ALTER TABLE i_work_id_seq OWNER TO postgres;

--
-- Name: i_work_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE i_work_info (
    i_work_id bigint DEFAULT nextval('i_work_id_seq'::regclass) NOT NULL,
    i_user_id bigint NOT NULL,
    i_creation_date timestamp(6) without time zone DEFAULT now() NOT NULL,
    i_last_update_date timestamp(6) without time zone DEFAULT now(),
    i_work_employer character varying(100),
    i_work_position character varying(100)
);


ALTER TABLE i_work_info OWNER TO postgres;

--
-- Name: sys_query_filter_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sys_query_filter_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 10000000000000000
    CACHE 1;


ALTER TABLE sys_query_filter_id_seq OWNER TO postgres;

--
-- Name: sys_query_filter; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE sys_query_filter (
    sys_query_filter_id bigint DEFAULT nextval('sys_query_filter_id_seq'::regclass) NOT NULL,
    sys_query_description text,
    sys_query text
);


ALTER TABLE sys_query_filter OWNER TO postgres;

--
-- Name: sys_segment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sys_segment_id_seq
    START WITH 1000000000
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999999999
    CACHE 1;


ALTER TABLE sys_segment_id_seq OWNER TO postgres;

--
-- Name: sys_segment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE sys_segment (
    sys_segment_id bigint DEFAULT nextval('sys_segment_id_seq'::regclass) NOT NULL,
    sys_segment_name character varying(50),
    sys_segment_description text,
    sys_query_filter_id bigint NOT NULL
);


ALTER TABLE sys_segment OWNER TO postgres;

--
-- Name: sys_segment_client_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sys_segment_client_id_seq
    START WITH 1000000000
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 1000000000000
    CACHE 1;


ALTER TABLE sys_segment_client_id_seq OWNER TO postgres;

--
-- Name: sys_segment_client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE sys_segment_client (
    sys_segment_client_id bigint DEFAULT nextval('sys_segment_client_id_seq'::regclass) NOT NULL,
    sys_segment_id bigint NOT NULL,
    i_user_id bigint,
    sys_client_name character varying(50),
    sys_client_surname character varying(50),
    sys_client_mobile_number character varying(20),
    sys_client_email text
);


ALTER TABLE sys_segment_client OWNER TO postgres;

--
-- Name: i_user i_user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_user ALTER COLUMN i_user_id SET DEFAULT nextval('i_user_i_user_id_seq'::regclass);


--
-- Name: greeting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('greeting_id_seq', 1, false);


--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('hibernate_sequence', 6, true);


--
-- Name: i_education_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('i_education_id_seq', 1000000005, true);


--
-- Data for Name: i_education_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY i_education_info (i_education_id, i_user_id, i_creation_date, i_last_update_date, i_edu_degree, i_edu_school, i_edu_type, i_edu_year) FROM stdin;
1000000003	1000000030	2017-12-10 19:27:42.874321	2017-12-10 19:27:42.874321		Department of Applied Informatics and Multimedia of Crete	College	2012
1000000004	1000000030	2017-12-10 19:27:42.934329	2017-12-10 19:27:42.934329	Advanced Softaware Development Technologies	University of Piraeus	Graduate School	2017
1000000005	1000000020	2017-12-14 17:43:17.307915	2017-12-14 17:43:17.307915	Master	University of Piraeus	IT	2017
\.


--
-- Data for Name: i_fb_books; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY i_fb_books (i_fb_books_id, i_user_id, i_creation_date, i_last_update_date, i_book_name, i_book_description) FROM stdin;
1000000000	1000000020	2017-12-13 17:13:27.565242	2017-12-13 17:13:54.776242	The Secret	The secret book only for adults
1000000001	1000000020	2017-12-14 13:23:58.544692	2017-12-14 13:23:58.544692	Pinocio	Pinocio adventures
\.


--
-- Name: i_fb_books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('i_fb_books_id_seq', 1000000001, true);


--
-- Data for Name: i_fb_events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY i_fb_events (i_fb_events_id, i_user_id, i_creation_date, i_last_update_date, i_event_name, i_event_description, i_event_start_date) FROM stdin;
1000000005	1000000020	2017-12-18 14:21:01.12985	2017-12-18 14:21:01.12985		 	2016-02-26 21:00:00
1000000006	1000000020	2017-12-18 14:41:26.772873	2017-12-18 14:41:26.772873	Giannis	kghuj	2016-02-26 21:00:00
1000000007	1000000020	2017-12-18 15:59:53.699546	2017-12-18 15:59:53.699546	Giannis		2016-02-26 21:00:00
1000000009	1000000020	2017-12-18 16:06:20.101183	2017-12-18 16:06:20.101183	Giannis	NUL	2016-02-26 21:00:00
1000000010	1000000020	2017-12-18 16:06:32.267399	2017-12-18 16:06:32.267399	Giannis		2016-02-26 21:00:00
1000000011	1000000020	2017-12-18 16:06:42.852458	2017-12-18 16:06:42.852458			2016-02-26 21:00:00
1000000012	1000000020	2017-12-18 16:10:23.492519	2017-12-18 16:10:23.492519			\N
1000000013	1000000020	2017-12-18 16:10:44.191589	2017-12-18 16:10:44.191589	null		\N
\.


--
-- Name: i_fb_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('i_fb_events_id_seq', 1000000013, true);


--
-- Data for Name: i_fb_favorite_teams; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY i_fb_favorite_teams (i_fb_favorite_teams_id, i_user_id, i_creation_date, i_last_update_date, i_team_name) FROM stdin;
1000000000	1000000020	2017-12-13 17:50:42.613253	2017-12-13 17:51:24.465438	AEK F.C.
1000000001	1000000020	2017-12-15 12:24:28.46332	2017-12-15 12:24:28.46332	AEK B.C.
\.


--
-- Name: i_fb_favorite_teams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('i_fb_favorite_teams_id_seq', 1000000001, true);


--
-- Data for Name: i_fb_music; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY i_fb_music (i_fb_music_id, i_user_id, i_creation_date, i_last_update_date, i_music_title) FROM stdin;
1000000000	1000000020	2017-12-13 17:26:30.425242	2017-12-13 17:26:40.697242	Eminem
1000000001	1000000020	2017-12-13 17:27:14.616468	2017-12-13 17:27:14.616468	Secret
1000000002	1000000020	2017-12-15 11:35:34.990002	2017-12-15 11:35:34.990002	Eminem
1000000003	1000000020	2017-12-15 11:35:50.489552	2017-12-15 11:35:50.489552	Tonis Sfinos
1000000004	1000000020	2017-12-15 11:57:50.097499	2017-12-15 11:57:50.097499	Tonis Sfinos
\.


--
-- Name: i_fb_music_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('i_fb_music_id_seq', 1000000004, true);


--
-- Data for Name: i_interest_fb_pages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY i_interest_fb_pages (i_interest_pages_id, i_user_id, i_creation_date, i_last_update_date, i_page_name, i_page_description) FROM stdin;
1000000004	1000000020	2017-12-15 12:02:57.03919	2017-12-15 12:02:57.03919	Almasport	Athletic store
\.


--
-- Name: i_interest_pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('i_interest_pages_id_seq', 1000000004, true);


--
-- Data for Name: i_location; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY i_location (i_location_id, i_user_id, i_creation_date, i_last_update_date, i_country_code, i_country_name, i_city_name, i_prefecture, i_department, i_street_address, i_postal_code) FROM stdin;
1000000002	1000000020	2017-10-29 15:07:49.898223	2017-10-29 15:13:11.877639	GR	Greece	Athens	Attica	Attica	Saronos 4	11143
1000000003	1000000020	2017-10-29 16:48:07.275397	2017-10-29 16:48:07.275397	GR	Greece	Kalamata	Messinia	Peloponissos	loggas 8	24100
1000000005	1000000020	2017-10-29 16:51:42.444704	2017-10-29 16:51:42.444704	GR	Greece	Kalamata	Messinia	Peloponissos	loggas 10	24100
1000000006	1000000020	2017-10-29 22:05:11.732534	2017-10-29 22:05:11.732534	GR	Greece	Kalamata	Messinia	Peloponissos	loggas 10	24100
1000000010	1000000023	2017-10-30 20:31:47.543345	2017-10-30 20:31:47.543345	GR	Greece	Kalamata	Messenia	Peloponnisos Dytiki Ellada ke Ionio	Aristomenous 45	24100
1000000011	1000000023	2017-10-30 20:35:56.798602	2017-10-30 20:35:56.798602	GR	Greece	Kalamata	Messenia	Peloponnisos Dytiki Ellada ke Ionio	Aristomenous 45	241 00
1000000012	1000000023	2017-10-30 20:40:59.183897	2017-10-30 20:40:59.183897	GR	Greece	Kalamata	Messenia	Peloponnisos Dytiki Ellada ke Ionio	Aristomenous 45	241 00
1000000013	1000000023	2017-10-30 22:13:09.887235	2017-10-30 22:13:09.887235	GR	Greece	Kalamata	Messenia	Peloponnisos Dytiki Ellada ke Ionio	Aristomenous 45	241 00
1000000014	1000000023	2017-10-30 22:27:02.560862	2017-10-30 22:27:02.560862	GR	Greece	Kalamata	Messenia	Peloponnisos Dytiki Ellada ke Ionio	Aristomenous 45	241 00
1000000015	1000000023	2017-10-30 22:55:44.872372	2017-10-30 22:55:44.872372	GR	Greece	Filadelfeia-Chalkidona	Central Athens	Attica	Marathonos 8	143 43
1000000016	1000000023	2017-10-30 23:05:47.623848	2017-10-30 23:05:47.623848	GR	Greece	Filadelfeia-Chalkidona	Central Athens	Attica	Anakous 60	143 41
1000000017	1000000023	2017-10-30 23:06:59.639967	2017-10-30 23:06:59.639967	GR	Greece	Pireas	Piraeus	Attica	Praxitelous 238	185 36
1000000018	1000000023	2017-10-30 23:10:34.107233	2017-10-30 23:10:34.107233	GR	Greece	West Mani	Messenia	Peloponnisos Dytiki Ellada ke Ionio	Unnamed Road	241 00
1000000019	1000000023	2017-11-03 00:30:52.691688	2017-11-03 00:30:52.691688	GR	Greece	Athens	Central Athens	Attica	Acharnon 458	111 43
1000000020	1000000023	2017-11-03 00:30:54.545794	2017-11-03 00:30:54.545794	GR	Greece	Athens	Central Athens	Attica	Acharnon 458	111 43
1000000021	1000000023	2017-11-03 00:31:50.367987	2017-11-03 00:31:50.367987	GR	Greece	Athens	Central Athens	Attica	Acharnon 458	111 43
1000000022	1000000023	2017-11-03 00:32:50.325416	2017-11-03 00:32:50.325416	GR	Greece	Athens	Central Athens	Attica	Acharnon 458	111 43
1000000023	1000000023	2017-11-03 00:33:50.36485	2017-11-03 00:33:50.36485	GR	Greece	Athens	Central Athens	Attica	Acharnon 458	111 43
1000000024	1000000023	2017-11-03 00:34:50.398284	2017-11-03 00:34:50.398284	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000025	1000000023	2017-11-03 00:35:50.441718	2017-11-03 00:35:50.441718	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000026	1000000023	2017-11-04 23:30:28.230643	2017-11-04 23:30:28.230643	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000028	1000000023	2017-11-04 23:30:28.236644	2017-11-04 23:30:28.236644	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000027	1000000023	2017-11-04 23:30:28.230643	2017-11-04 23:30:28.230643	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000029	1000000023	2017-11-04 23:30:30.690784	2017-11-04 23:30:30.690784	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000030	1000000023	2017-11-04 23:31:49.311281	2017-11-04 23:31:49.311281	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000031	1000000023	2017-11-04 23:32:52.991923	2017-11-04 23:32:52.991923	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000032	1000000023	2017-11-04 23:33:50.62922	2017-11-04 23:33:50.62922	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000033	1000000023	2017-11-04 23:34:52.52276	2017-11-04 23:34:52.52276	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000034	1000000023	2017-11-04 23:35:54.458302	2017-11-04 23:35:54.458302	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000035	1000000023	2017-11-04 23:35:56.125398	2017-11-04 23:35:56.125398	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000036	1000000023	2017-11-04 23:36:53.727692	2017-11-04 23:36:53.727692	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000037	1000000023	2017-11-04 23:36:53.728692	2017-11-04 23:36:53.728692	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000038	1000000023	2017-11-04 23:37:49.118861	2017-11-04 23:37:49.118861	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000040	1000000023	2017-11-04 23:38:55.993686	2017-11-04 23:38:55.993686	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000039	1000000023	2017-11-04 23:38:55.991685	2017-11-04 23:38:55.991685	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000041	1000000023	2017-11-04 23:40:49.124156	2017-11-04 23:40:49.124156	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000042	1000000023	2017-11-04 23:42:54.790344	2017-11-04 23:42:54.790344	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000043	1000000023	2017-11-04 23:42:54.791344	2017-11-04 23:42:54.791344	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000044	1000000023	2017-11-04 23:44:50.221946	2017-11-04 23:44:50.221946	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000045	1000000023	2017-11-04 23:46:50.57783	2017-11-04 23:46:50.57783	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000046	1000000023	2017-11-04 23:48:49.182614	2017-11-04 23:48:49.182614	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000047	1000000023	2017-11-05 00:38:27.199628	2017-11-05 00:38:27.199628	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000048	1000000023	2017-11-05 02:38:10.608822	2017-11-05 02:38:10.608822	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000049	1000000023	2017-11-05 04:38:18.804108	2017-11-05 04:38:18.804108	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000050	1000000023	2017-11-05 06:38:19.850984	2017-11-05 06:38:19.850984	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000051	1000000023	2017-11-05 08:38:20.844857	2017-11-05 08:38:20.844857	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000052	1000000023	2017-11-05 10:38:22.506769	2017-11-05 10:38:22.506769	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000053	1000000023	2017-11-05 12:02:00.795798	2017-11-05 12:02:00.795798	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000054	1000000023	2017-11-05 12:02:58.915123	2017-11-05 12:02:58.915123	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000055	1000000023	2017-11-05 12:03:58.889553	2017-11-05 12:03:58.889553	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000056	1000000023	2017-11-05 12:04:58.849982	2017-11-05 12:04:58.849982	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000057	1000000023	2017-11-05 12:05:58.931419	2017-11-05 12:05:58.931419	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000058	1000000023	2017-11-05 12:07:12.491626	2017-11-05 12:07:12.491626	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000059	1000000023	2017-11-05 12:08:12.430055	2017-11-05 12:08:12.430055	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000060	1000000023	2017-11-05 12:09:12.404485	2017-11-05 12:09:12.404485	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000061	1000000023	2017-11-05 12:10:12.46392	2017-11-05 12:10:12.46392	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000062	1000000023	2017-11-05 12:11:12.42135	2017-11-05 12:11:12.42135	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000063	1000000023	2017-11-05 12:12:12.507786	2017-11-05 12:12:12.507786	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000064	1000000023	2017-11-05 12:13:12.557221	2017-11-05 12:13:12.557221	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000065	1000000023	2017-11-05 12:14:12.497649	2017-11-05 12:14:12.497649	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000066	1000000023	2017-11-05 12:15:12.458079	2017-11-05 12:15:12.458079	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000067	1000000023	2017-11-05 12:16:12.472511	2017-11-05 12:16:12.472511	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000068	1000000023	2017-11-05 12:17:12.539947	2017-11-05 12:17:12.539947	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000069	1000000023	2017-11-05 12:18:12.491376	2017-11-05 12:18:12.491376	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000070	1000000023	2017-11-05 12:19:12.488808	2017-11-05 12:19:12.488808	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000071	1000000023	2017-11-05 12:20:12.612247	2017-11-05 12:20:12.612247	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000072	1000000023	2017-11-05 12:21:12.63268	2017-11-05 12:21:12.63268	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000073	1000000023	2017-11-05 12:22:12.61011	2017-11-05 12:22:12.61011	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000074	1000000023	2017-11-05 12:23:12.660545	2017-11-05 12:23:12.660545	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000075	1000000023	2017-11-05 12:24:12.583972	2017-11-05 12:24:12.583972	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000076	1000000023	2017-11-05 12:25:12.542402	2017-11-05 12:25:12.542402	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000077	1000000023	2017-11-05 12:26:12.676841	2017-11-05 12:26:12.676841	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000078	1000000023	2017-11-05 12:27:12.730276	2017-11-05 12:27:12.730276	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000079	1000000023	2017-11-05 12:28:12.719707	2017-11-05 12:28:12.719707	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000080	1000000023	2017-11-05 12:29:12.750141	2017-11-05 12:29:12.750141	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000081	1000000023	2017-11-05 12:30:12.659567	2017-11-05 12:30:12.659567	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000082	1000000023	2017-11-05 12:31:12.810008	2017-11-05 12:31:12.810008	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000083	1000000023	2017-11-05 12:32:12.728435	2017-11-05 12:32:12.728435	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000084	1000000023	2017-11-05 12:33:12.78087	2017-11-05 12:33:12.78087	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000085	1000000023	2017-11-05 12:34:12.798303	2017-11-05 12:34:12.798303	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000086	1000000023	2017-11-05 12:35:12.868738	2017-11-05 12:35:12.868738	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000087	1000000023	2017-11-05 12:36:12.841169	2017-11-05 12:36:12.841169	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000088	1000000023	2017-11-05 12:37:12.8276	2017-11-05 12:37:12.8276	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000089	1000000023	2017-11-05 12:38:13.036043	2017-11-05 12:38:13.036043	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000090	1000000023	2017-11-05 12:39:12.93847	2017-11-05 12:39:12.93847	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000091	1000000023	2017-11-05 12:40:12.856897	2017-11-05 12:40:12.856897	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000092	1000000023	2017-11-05 12:41:12.938333	2017-11-05 12:41:12.938333	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000093	1000000023	2017-11-05 12:42:13.139777	2017-11-05 12:42:13.139777	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000094	1000000023	2017-11-05 12:43:13.0012	2017-11-05 12:43:13.0012	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000095	1000000023	2017-11-05 12:44:12.995632	2017-11-05 12:44:12.995632	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000096	1000000023	2017-11-05 12:45:13.032066	2017-11-05 12:45:13.032066	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000097	1000000023	2017-11-05 12:46:13.110502	2017-11-05 12:46:13.110502	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000098	1000000023	2017-11-05 12:47:13.04193	2017-11-05 12:47:13.04193	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000099	1000000023	2017-11-05 12:48:13.01036	2017-11-05 12:48:13.01036	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000100	1000000023	2017-11-05 12:49:13.368812	2017-11-05 12:49:13.368812	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000101	1000000023	2017-11-05 12:50:13.054226	2017-11-05 12:50:13.054226	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000102	1000000023	2017-11-05 12:51:13.063658	2017-11-05 12:51:13.063658	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000103	1000000023	2017-11-05 12:52:13.140095	2017-11-05 12:52:13.140095	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000104	1000000023	2017-11-05 12:53:13.230532	2017-11-05 12:53:13.230532	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000105	1000000023	2017-11-05 12:54:13.204962	2017-11-05 12:54:13.204962	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000106	1000000023	2017-11-05 12:55:13.232395	2017-11-05 12:55:13.232395	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000107	1000000023	2017-11-05 12:56:13.221826	2017-11-05 12:56:13.221826	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000108	1000000023	2017-11-05 12:57:13.301263	2017-11-05 12:57:13.301263	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000109	1000000023	2017-11-05 12:58:13.231691	2017-11-05 12:58:13.231691	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000110	1000000023	2017-11-05 12:59:13.261124	2017-11-05 12:59:13.261124	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000111	1000000023	2017-11-05 13:00:13.386563	2017-11-05 13:00:13.386563	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000112	1000000023	2017-11-05 13:01:13.331992	2017-11-05 13:01:13.331992	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000113	1000000023	2017-11-05 13:02:13.250419	2017-11-05 13:02:13.250419	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000114	1000000023	2017-11-05 13:03:13.448862	2017-11-05 13:03:13.448862	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000115	1000000023	2017-11-05 13:04:13.427293	2017-11-05 13:04:13.427293	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000116	1000000023	2017-11-05 13:05:13.376722	2017-11-05 13:05:13.376722	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000117	1000000023	2017-11-05 13:06:13.470159	2017-11-05 13:06:13.470159	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000118	1000000023	2017-11-05 13:07:13.376585	2017-11-05 13:07:13.376585	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000119	1000000023	2017-11-05 13:08:13.465022	2017-11-05 13:08:13.465022	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000120	1000000023	2017-11-05 13:09:13.499456	2017-11-05 13:09:13.499456	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000121	1000000023	2017-11-05 13:10:13.591893	2017-11-05 13:10:13.591893	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000122	1000000023	2017-11-05 13:11:13.534321	2017-11-05 13:11:13.534321	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000123	1000000023	2017-11-05 13:12:13.461749	2017-11-05 13:12:13.461749	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000124	1000000023	2017-11-05 13:13:13.605189	2017-11-05 13:13:13.605189	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000125	1000000023	2017-11-05 13:14:13.683625	2017-11-05 13:14:13.683625	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000126	1000000023	2017-11-05 13:15:13.656056	2017-11-05 13:15:13.656056	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000127	1000000023	2017-11-05 13:16:13.557482	2017-11-05 13:16:13.557482	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000128	1000000023	2017-11-05 13:17:13.702922	2017-11-05 13:17:13.702922	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000129	1000000023	2017-11-05 13:18:13.669352	2017-11-05 13:18:13.669352	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000130	1000000023	2017-11-05 13:19:13.670784	2017-11-05 13:19:13.670784	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000131	1000000023	2017-11-05 13:20:13.766221	2017-11-05 13:20:13.766221	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000132	1000000023	2017-11-05 13:21:13.675648	2017-11-05 13:21:13.675648	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000133	1000000023	2017-11-05 13:22:13.762084	2017-11-05 13:22:13.762084	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000134	1000000023	2017-11-05 13:23:13.819519	2017-11-05 13:23:13.819519	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000135	1000000023	2017-11-05 13:24:13.722946	2017-11-05 13:24:13.722946	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000136	1000000023	2017-11-05 13:25:13.77438	2017-11-05 13:25:13.77438	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000137	1000000023	2017-11-05 13:26:13.803814	2017-11-05 13:26:13.803814	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000138	1000000023	2017-11-05 13:27:13.789245	2017-11-05 13:27:13.789245	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000139	1000000023	2017-11-05 13:28:13.84768	2017-11-05 13:28:13.84768	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000140	1000000023	2017-11-05 17:16:27.265217	2017-11-05 17:16:27.265217	null	null	null	null	null	null	null
1000000141	1000000023	2017-11-05 17:16:32.580521	2017-11-05 17:16:32.580521	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000142	1000000023	2017-11-05 17:17:32.463946	2017-11-05 17:17:32.463946	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000143	1000000023	2017-11-05 17:18:32.407375	2017-11-05 17:18:32.407375	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000144	1000000023	2017-11-05 17:19:32.619818	2017-11-05 17:19:32.619818	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000145	1000000023	2017-11-05 17:20:32.733257	2017-11-05 17:20:32.733257	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000146	1000000023	2017-11-05 17:21:32.668685	2017-11-05 17:21:32.668685	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000147	1000000023	2017-11-05 17:22:32.796124	2017-11-05 17:22:32.796124	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000148	1000000023	2017-11-05 17:23:32.769554	2017-11-05 17:23:32.769554	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000149	1000000023	2017-11-05 17:24:32.931995	2017-11-05 17:24:32.931995	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000150	1000000023	2017-11-05 17:25:32.869424	2017-11-05 17:25:32.869424	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000151	1000000023	2017-11-05 17:26:33.090868	2017-11-05 17:26:33.090868	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000152	1000000023	2017-11-05 17:27:32.957292	2017-11-05 17:27:32.957292	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000153	1000000023	2017-11-05 17:28:32.838717	2017-11-05 17:28:32.838717	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000154	1000000023	2017-11-05 17:29:32.839149	2017-11-05 17:29:32.839149	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000155	1000000023	2017-11-05 17:30:32.889584	2017-11-05 17:30:32.889584	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000156	1000000023	2017-11-05 17:31:32.910017	2017-11-05 17:31:32.910017	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000157	1000000023	2017-11-05 17:32:33.076458	2017-11-05 17:32:33.076458	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000158	1000000023	2017-11-05 17:33:33.022887	2017-11-05 17:33:33.022887	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000159	1000000023	2017-11-05 17:34:32.973316	2017-11-05 17:34:32.973316	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000160	1000000023	2017-11-05 17:35:32.973748	2017-11-05 17:35:32.973748	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000161	1000000023	2017-11-05 17:36:32.944178	2017-11-05 17:36:32.944178	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000162	1000000023	2017-11-05 17:37:32.938609	2017-11-05 17:37:32.938609	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000163	1000000023	2017-11-05 17:38:33.079049	2017-11-05 17:38:33.079049	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000164	1000000023	2017-11-05 17:39:32.979475	2017-11-05 17:39:32.979475	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000165	1000000023	2017-11-05 17:40:33.249922	2017-11-05 17:40:33.249922	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000166	1000000023	2017-11-05 17:41:33.366361	2017-11-05 17:41:33.366361	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000167	1000000023	2017-11-05 17:42:33.156781	2017-11-05 17:42:33.156781	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000168	1000000023	2017-11-05 17:43:33.932257	2017-11-05 17:43:33.932257	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000169	1000000023	2017-11-05 17:44:33.162645	2017-11-05 17:44:33.162645	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000170	1000000023	2017-11-05 17:45:33.124074	2017-11-05 17:45:33.124074	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000171	1000000023	2017-11-05 17:46:33.446524	2017-11-05 17:46:33.446524	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000172	1000000023	2017-11-05 17:47:33.301948	2017-11-05 17:47:33.301948	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000173	1000000023	2017-11-05 17:48:33.435387	2017-11-05 17:48:33.435387	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000174	1000000023	2017-11-05 17:49:33.349814	2017-11-05 17:49:33.349814	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000175	1000000023	2017-11-05 17:50:33.571259	2017-11-05 17:50:33.571259	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000176	1000000023	2017-11-05 17:51:33.329677	2017-11-05 17:51:33.329677	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000177	1000000023	2017-11-05 17:52:33.598124	2017-11-05 17:52:33.598124	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000178	1000000023	2017-11-05 17:54:08.055527	2017-11-05 17:54:08.055527	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000179	1000000023	2017-11-05 17:55:08.119962	2017-11-05 17:55:08.119962	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000180	1000000023	2017-11-05 17:56:08.100393	2017-11-05 17:56:08.100393	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000181	1000000023	2017-11-05 17:57:08.324837	2017-11-05 17:57:08.324837	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000182	1000000023	2017-11-05 17:58:08.193262	2017-11-05 17:58:08.193262	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000183	1000000023	2017-11-05 17:59:08.13969	2017-11-05 17:59:08.13969	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000184	1000000023	2017-11-05 18:00:08.27713	2017-11-05 18:00:08.27713	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000185	1000000023	2017-11-05 18:01:08.315564	2017-11-05 18:01:08.315564	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000186	1000000023	2017-11-05 18:02:08.264993	2017-11-05 18:02:08.264993	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000187	1000000023	2017-11-05 18:03:08.202421	2017-11-05 18:03:08.202421	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000188	1000000023	2017-11-05 18:04:08.244855	2017-11-05 18:04:08.244855	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000189	1000000023	2017-11-05 18:05:08.420297	2017-11-05 18:05:08.420297	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000190	1000000023	2017-11-05 18:06:08.650742	2017-11-05 18:06:08.650742	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000191	1000000023	2017-11-05 18:07:08.283153	2017-11-05 18:07:08.283153	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000192	1000000023	2017-11-05 18:08:08.309586	2017-11-05 18:08:08.309586	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000193	1000000023	2017-11-05 18:09:08.468027	2017-11-05 18:09:08.468027	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000194	1000000023	2017-11-05 18:10:08.434457	2017-11-05 18:10:08.434457	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000195	1000000023	2017-11-05 18:11:08.578897	2017-11-05 18:11:08.578897	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000196	1000000023	2017-11-05 18:12:08.59633	2017-11-05 18:12:08.59633	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000197	1000000020	2017-11-26 21:53:43.589013	2017-11-26 21:53:43.589013	null	null	null	null	null	null	null
1000000198	1000000020	2017-11-26 22:00:20.444712	2017-11-26 22:00:20.444712	null	null	null	null	null	null	null
1000000199	1000000020	2017-11-26 22:01:20.21713	2017-11-26 22:01:20.21713	null	null	null	null	null	null	null
1000000200	1000000020	2017-11-26 22:02:20.100556	2017-11-26 22:02:20.100556	null	null	null	null	null	null	null
1000000201	1000000020	2017-11-26 22:03:20.453008	2017-11-26 22:03:20.453008	null	null	null	null	null	null	null
1000000202	1000000020	2017-11-26 22:04:20.262428	2017-11-26 22:04:20.262428	null	null	null	null	null	null	null
1000000203	1000000020	2017-11-26 22:05:20.174855	2017-11-26 22:05:20.174855	null	null	null	null	null	null	null
1000000204	1000000020	2017-11-26 22:06:20.214289	2017-11-26 22:06:20.214289	null	null	null	null	null	null	null
1000000205	1000000020	2017-11-26 22:07:20.18772	2017-11-26 22:07:20.18772	null	null	null	null	null	null	null
1000000206	1000000020	2017-11-26 22:08:20.328159	2017-11-26 22:08:20.328159	null	null	null	null	null	null	null
1000000207	1000000020	2017-11-26 22:09:20.346592	2017-11-26 22:09:20.346592	null	null	null	null	null	null	null
1000000208	1000000020	2017-11-26 22:10:20.410028	2017-11-26 22:10:20.410028	null	null	null	null	null	null	null
1000000209	1000000020	2017-11-26 22:11:44.006809	2017-11-26 22:11:44.006809	null	null	null	null	null	null	null
1000000210	1000000020	2017-11-26 22:12:43.685223	2017-11-26 22:12:43.685223	null	null	null	null	null	null	null
1000000211	1000000020	2017-11-26 22:13:43.474642	2017-11-26 22:13:43.474642	null	null	null	null	null	null	null
1000000212	1000000020	2017-11-26 22:14:43.421071	2017-11-26 22:14:43.421071	null	null	null	null	null	null	null
1000000213	1000000020	2017-11-26 22:15:43.455505	2017-11-26 22:15:43.455505	null	null	null	null	null	null	null
1000000214	1000000020	2017-11-26 22:16:43.458937	2017-11-26 22:16:43.458937	null	null	null	null	null	null	null
1000000215	1000000020	2017-11-26 22:17:43.443368	2017-11-26 22:17:43.443368	null	null	null	null	null	null	null
1000000216	1000000020	2017-11-26 22:18:43.599808	2017-11-26 22:18:43.599808	null	null	null	null	null	null	null
1000000217	1000000020	2017-11-26 22:19:43.59724	2017-11-26 22:19:43.59724	null	null	null	null	null	null	null
1000000218	1000000020	2017-11-26 22:20:43.443663	2017-11-26 22:20:43.443663	null	null	null	null	null	null	null
1000000219	1000000020	2017-11-26 22:21:43.984126	2017-11-26 22:21:43.984126	null	null	null	null	null	null	null
1000000220	1000000020	2017-11-26 22:22:43.576534	2017-11-26 22:22:43.576534	null	null	null	null	null	null	null
1000000221	1000000020	2017-11-26 22:23:43.533964	2017-11-26 22:23:43.533964	null	null	null	null	null	null	null
1000000222	1000000020	2017-11-26 22:24:43.645402	2017-11-26 22:24:43.645402	null	null	null	null	null	null	null
1000000223	1000000020	2017-11-26 22:25:43.74884	2017-11-26 22:25:43.74884	null	null	null	null	null	null	null
1000000224	1000000020	2017-11-26 22:26:43.857278	2017-11-26 22:26:43.857278	null	null	null	null	null	null	null
1000000225	1000000020	2017-11-26 22:27:43.561693	2017-11-26 22:27:43.561693	null	null	null	null	null	null	null
1000000226	1000000020	2017-11-26 22:28:43.720133	2017-11-26 22:28:43.720133	null	null	null	null	null	null	null
1000000227	1000000020	2017-11-26 22:29:43.682563	2017-11-26 22:29:43.682563	null	null	null	null	null	null	null
1000000228	1000000020	2017-11-26 22:30:43.695996	2017-11-26 22:30:43.695996	null	null	null	null	null	null	null
1000000229	1000000020	2017-11-26 22:31:43.874438	2017-11-26 22:31:43.874438	null	null	null	null	null	null	null
1000000230	1000000020	2017-11-26 22:32:43.808866	2017-11-26 22:32:43.808866	null	null	null	null	null	null	null
1000000231	1000000020	2017-11-26 22:33:44.191319	2017-11-26 22:33:44.191319	null	null	null	null	null	null	null
1000000232	1000000020	2017-11-26 22:34:43.81373	2017-11-26 22:34:43.81373	null	null	null	null	null	null	null
1000000233	1000000020	2017-11-26 22:35:44.534203	2017-11-26 22:35:44.534203	null	null	null	null	null	null	null
1000000234	1000000020	2017-11-26 22:36:44.071608	2017-11-26 22:36:44.071608	null	null	null	null	null	null	null
1000000235	1000000020	2017-11-26 22:37:44.08004	2017-11-26 22:37:44.08004	null	null	null	null	null	null	null
1000000236	1000000020	2017-11-27 02:54:11.31414	2017-11-27 02:54:11.31414	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000237	1000000020	2017-11-27 02:55:11.390576	2017-11-27 02:55:11.390576	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000238	1000000020	2017-11-27 02:56:11.357006	2017-11-27 02:56:11.357006	GR	Greece	Chalandri	North Athens	Attica	Kosta Varnali 35A	152 33
1000000239	1000000020	2017-11-27 02:57:11.300434	2017-11-27 02:57:11.300434	GR	Greece	Chalandri	North Athens	Attica	Kosta Varnali 35A	152 33
1000000240	1000000020	2017-11-27 02:58:11.352869	2017-11-27 02:58:11.352869	GR	Greece	Chalandri	North Athens	Attica	Kosta Varnali 35A	152 33
1000000241	1000000020	2017-11-27 02:59:11.327299	2017-11-27 02:59:11.327299	null	null	null	null	null	null	null
1000000242	1000000020	2017-11-27 03:00:11.434737	2017-11-27 03:00:11.434737	GR	Greece	Attica	null	Attica	Aspropyrgos	null
1000000243	1000000020	2017-11-27 17:32:43.336508	2017-11-27 17:32:43.336508	GR	Greece	Attica	null	Attica	Aspropyrgos	null
1000000244	1000000020	2017-11-27 17:34:37.943063	2017-11-27 17:34:37.943063	null	null	null	null	null	null	null
1000000245	1000000020	2017-11-27 17:35:33.276228	2017-11-27 17:35:33.276228	GR	Greece	Attica	null	Attica	Aspropyrgos	null
1000000246	1000000020	2017-11-27 17:36:33.737687	2017-11-27 17:36:33.737687	GR	Greece	Attica	null	Attica	Aspropyrgos	null
1000000247	1000000020	2017-11-27 17:37:33.353096	2017-11-27 17:37:33.353096	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000248	1000000020	2017-11-27 17:38:33.294525	2017-11-27 17:38:33.294525	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000249	1000000020	2017-11-27 17:39:33.308957	2017-11-27 17:39:33.308957	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000250	1000000020	2017-11-27 17:40:33.342391	2017-11-27 17:40:33.342391	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000251	1000000020	2017-11-27 17:41:33.567836	2017-11-27 17:41:33.567836	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000252	1000000020	2017-11-27 17:42:33.354255	2017-11-27 17:42:33.354255	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000253	1000000020	2017-11-27 17:43:33.354687	2017-11-27 17:43:33.354687	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000254	1000000020	2017-11-27 17:44:33.37912	2017-11-27 17:44:33.37912	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000255	1000000020	2017-11-27 17:45:33.432555	2017-11-27 17:45:33.432555	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000256	1000000020	2017-11-29 23:31:03.031242	2017-11-29 23:31:03.031242	null	null	null	null	null	null	null
1000000257	1000000020	2017-11-29 23:32:02.983855	2017-11-29 23:32:02.983855	null	null	null	null	null	null	null
1000000258	1000000020	2017-11-29 23:33:03.012478	2017-11-29 23:33:03.012478	null	null	null	null	null	null	null
1000000259	1000000020	2017-11-29 23:33:59.047093	2017-11-29 23:33:59.047093	null	null	null	null	null	null	null
1000000260	1000000020	2017-11-29 23:35:00.536402	2017-11-29 23:35:00.536402	null	null	null	null	null	null	null
1000000261	1000000020	2017-11-29 23:36:19.068874	2017-11-29 23:36:19.068874	null	null	null	null	null	null	null
1000000262	1000000020	2017-11-29 23:36:59.060952	2017-11-29 23:36:59.060952	null	null	null	null	null	null	null
1000000263	1000000020	2017-11-29 23:39:20.306388	2017-11-29 23:39:20.306388	null	null	null	null	null	null	null
1000000264	1000000020	2017-11-29 23:41:54.184428	2017-11-29 23:41:54.184428	null	null	null	null	null	null	null
1000000265	1000000020	2017-11-29 23:42:37.833471	2017-11-29 23:42:37.833471	null	null	null	null	null	null	null
1000000266	1000000020	2017-11-29 23:43:54.286679	2017-11-29 23:43:54.286679	null	null	null	null	null	null	null
1000000267	1000000020	2017-11-29 23:44:34.923339	2017-11-29 23:44:34.923339	null	null	null	null	null	null	null
1000000268	1000000020	2017-11-29 23:47:00.129778	2017-11-29 23:47:00.129778	GR	Greece	Kalamata	Peloponnese	Peloponnisos Dytiki Ellada ke Ionio	Stadiou 4-18, Kalamata 241 00, Greece	241 00
1000000269	1000000020	2017-11-29 23:48:44.056475	2017-11-29 23:48:44.056475	GR	Greece	Kalamata	Peloponnese	Peloponnisos Dytiki Ellada ke Ionio	Athinon 34, Kalamata 241 00, Greece	241 00
1000000270	1000000020	2017-11-29 23:49:06.820866	2017-11-29 23:49:06.820866	GR	Greece	Kalamata	Peloponnese	Peloponnisos Dytiki Ellada ke Ionio	Athinon 95, Kalamata 241 00, Greece	241 00
1000000271	1000000020	2017-11-29 23:50:02.13339	2017-11-29 23:50:02.13339	GR	Greece	Kalamata	Peloponnese	Peloponnisos Dytiki Ellada ke Ionio	Athinon 95, Kalamata 241 00, Greece	241 00
1000000272	1000000020	2017-11-29 23:51:27.208693	2017-11-29 23:51:27.208693	GR	Greece	Kalamata	Peloponnese	Peloponnisos Dytiki Ellada ke Ionio	Athinon 95, Kalamata 241 00, Greece	241 00
1000000273	1000000020	2017-11-29 23:52:03.831844	2017-11-29 23:52:03.831844	GR	Greece	Kalamata	Peloponnese	Peloponnisos Dytiki Ellada ke Ionio	Athinon 95, Kalamata 241 00, Greece	241 00
1000000274	1000000020	2017-12-02 14:34:04.642786	2017-12-02 14:34:04.642786	null	null	null	null	null	null	null
1000000275	1000000020	2017-12-02 14:36:12.055466	2017-12-02 14:36:12.055466	null	null	null	null	null	null	null
1000000276	1000000020	2017-12-02 15:40:10.235853	2017-12-02 15:40:10.235853	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000277	1000000020	2017-12-02 15:41:48.452825	2017-12-02 15:41:48.452825	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000278	1000000020	2017-12-02 15:42:29.329515	2017-12-02 15:42:29.329515	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000279	1000000020	2017-12-02 15:43:08.407478	2017-12-02 15:43:08.407478	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000280	1000000020	2017-12-02 15:49:50.311013	2017-12-02 15:49:50.311013	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000281	1000000020	2017-12-02 16:32:16.864884	2017-12-02 16:32:16.864884	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000282	1000000020	2017-12-02 16:33:13.920129	2017-12-02 16:33:13.920129	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000283	1000000020	2017-12-02 16:34:46.362868	2017-12-02 16:34:46.362868	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000284	1000000020	2017-12-02 16:35:13.912867	2017-12-02 16:35:13.912867	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000285	1000000020	2017-12-02 16:36:13.933988	2017-12-02 16:36:13.933988	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000286	1000000020	2017-12-02 16:37:26.363686	2017-12-02 16:37:26.363686	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000287	1000000020	2017-12-02 16:38:13.911223	2017-12-02 16:38:13.911223	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000288	1000000020	2017-12-02 16:39:13.909342	2017-12-02 16:39:13.909342	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000289	1000000020	2017-12-02 16:40:13.97947	2017-12-02 16:40:13.97947	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000290	1000000020	2017-12-02 16:41:13.918081	2017-12-02 16:41:13.918081	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000291	1000000020	2017-12-02 16:42:53.926281	2017-12-02 16:42:53.926281	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000292	1000000020	2017-12-02 16:43:13.947323	2017-12-02 16:43:13.947323	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000293	1000000020	2017-12-02 16:44:13.957443	2017-12-02 16:44:13.957443	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000294	1000000020	2017-12-02 16:45:33.934599	2017-12-02 16:45:33.934599	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000295	1000000020	2017-12-02 16:46:13.912676	2017-12-02 16:46:13.912676	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000296	1000000020	2017-12-02 16:47:15.000433	2017-12-02 16:47:15.000433	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000297	1000000020	2017-12-02 16:48:13.96192	2017-12-02 16:48:13.96192	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000298	1000000020	2017-12-02 16:49:13.928535	2017-12-02 16:49:13.928535	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000299	1000000029	2017-12-02 16:52:15.302066	2017-12-02 16:52:15.302066	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000300	1000000029	2017-12-02 16:53:15.289684	2017-12-02 16:53:15.289684	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000301	1000000029	2017-12-02 16:54:53.648174	2017-12-02 16:54:53.648174	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000302	1000000029	2017-12-02 16:55:15.285421	2017-12-02 16:55:15.285421	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000303	1000000029	2017-12-02 16:56:15.271539	2017-12-02 16:56:15.271539	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000304	1000000029	2017-12-02 16:57:33.621988	2017-12-02 16:57:33.621988	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000305	1000000029	2017-12-02 16:58:15.278278	2017-12-02 16:58:15.278278	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000306	1000000029	2017-12-02 16:59:15.273396	2017-12-02 16:59:15.273396	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000307	1000000029	2017-12-02 17:00:15.86109	2017-12-02 17:00:15.86109	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000308	1000000029	2017-12-02 17:01:15.274634	2017-12-02 17:01:15.274634	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000309	1000000029	2017-12-02 17:02:15.279254	2017-12-02 17:02:15.279254	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000310	1000000029	2017-12-02 17:03:15.266371	2017-12-02 17:03:15.266371	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000311	1000000029	2017-12-02 17:40:24.162798	2017-12-02 17:40:24.162798	null	null	null	null	null	null	null
1000000312	1000000029	2017-12-02 17:41:20.40594	2017-12-02 17:41:20.40594	null	null	null	null	null	null	null
1000000313	1000000029	2017-12-02 17:42:25.546711	2017-12-02 17:42:25.546711	null	null	null	null	null	null	null
1000000314	1000000029	2017-12-02 17:43:20.358672	2017-12-02 17:43:20.358672	null	null	null	null	null	null	null
1000000315	1000000029	2017-12-02 17:44:20.408297	2017-12-02 17:44:20.408297	null	null	null	null	null	null	null
1000000316	1000000029	2017-12-02 17:45:20.382413	2017-12-02 17:45:20.382413	null	null	null	null	null	null	null
1000000317	1000000030	2017-12-03 18:57:11.100846	2017-12-03 18:57:11.100846	null	null	null	null	null	null	null
1000000318	1000000030	2017-12-10 15:29:41.873298	2017-12-10 15:29:41.873298	null	null	null	null	null	null	null
1000000319	1000000030	2017-12-10 18:53:13.383029	2017-12-10 18:53:13.383029	null	null	null	null	null	null	null
\.


--
-- Name: i_location_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('i_location_id_seq', 1000000319, true);


--
-- Data for Name: i_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY i_user (i_user_id, i_creation_date, i_last_update_date, i_first_name, i_last_name, i_mobile_number, i_username, i_password, i_email_address, i_register_type) FROM stdin;
1000000020	2017-10-12 19:55:19.392707	2017-10-12 19:55:19.392707	Ioannis	Kozompolis	6971903121	giannis		g.kozompolis@gmail.com	\N
1000000021	2017-10-12 19:57:45.490063	2017-10-12 19:57:45.490063	Ioannis 	Kozompolis	6971903121	giannis2		g.kozompolis@gmail.com	\N
1000000022	2017-10-12 20:55:23.476849	2017-10-12 20:55:23.476849	aek	ole	6971903121	aek		giannis1990@gmail.com	\N
1000000023	2017-10-12 21:08:52.548125	2017-10-12 21:08:52.548125	giannis4			giannis4			\N
1000000024	2017-10-14 21:22:11.872753	2017-10-14 21:22:11.872753	giannis5			giannis5			\N
1000000025	2017-10-14 21:27:15.417114	2017-10-14 21:27:15.417114	giannis6			giannis6			\N
1000000026	2017-11-25 21:04:47.794319	2017-11-25 21:04:47.794319	Ioannis	Kozompolis	6971903121	giannis2669		g.kozompolis@gmail.com	\N
1000000027	2017-12-02 16:22:39.382553	2017-12-02 16:22:39.382553	Ioannnis	Kozompolis	6971903121	kozo		g.kozompolis@gmail.com	\N
1000000028	2017-12-02 16:30:33.483257	2017-12-02 16:30:33.483257				kozompolis			\N
1000000029	2017-12-02 16:52:05.125274	2017-12-02 16:52:05.125274				testuser1			\N
1000000030	2017-12-03 17:55:53.547356	2017-12-03 17:55:53.547356	John	Kozo		1127478420719730		g.kozompolis@gmail.com	\N
\.


--
-- Name: i_user_i_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('i_user_i_user_id_seq', 1000000030, true);


--
-- Name: i_work_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('i_work_id_seq', 1000000023, true);


--
-- Data for Name: i_work_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY i_work_info (i_work_id, i_user_id, i_creation_date, i_last_update_date, i_work_employer, i_work_position) FROM stdin;
1000000008	1000000020	2017-12-09 18:07:12.183065	2017-12-09 18:07:12.183065	Almasport	Sales
1000000009	1000000020	2017-12-09 18:13:25.564421	2017-12-09 18:13:25.564421	\N	\N
1000000010	1000000030	2017-12-10 14:28:51.964701	2017-12-10 14:28:51.964701	Velti	QA Engineer
1000000011	1000000030	2017-12-10 15:26:23.561616	2017-12-10 15:26:23.561616	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000012	1000000030	2017-12-10 15:31:11.868226	2017-12-10 15:31:11.868226	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000013	1000000030	2017-12-10 15:32:59.937949	2017-12-10 15:32:59.937949	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000014	1000000030	2017-12-10 15:34:53.439362	2017-12-10 15:34:53.439362	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000015	1000000030	2017-12-10 16:19:59.583499	2017-12-10 16:19:59.583499	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000016	1000000030	2017-12-10 16:21:56.754378	2017-12-10 16:21:56.754378	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000017	1000000030	2017-12-10 16:25:51.281659	2017-12-10 16:25:51.281659	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000018	1000000030	2017-12-10 18:58:47.20742	2017-12-10 18:58:47.20742	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000019	1000000030	2017-12-10 18:58:47.239924	2017-12-10 18:58:47.239924	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000020	1000000030	2017-12-10 19:03:49.897356	2017-12-10 19:03:49.897356	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000021	1000000030	2017-12-10 19:20:44.539699	2017-12-10 19:20:44.539699	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000022	1000000030	2017-12-10 19:24:38.35189	2017-12-10 19:24:38.35189	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000023	1000000030	2017-12-10 19:27:42.773308	2017-12-10 19:27:42.773308	Velti S.A.	Quality Assurance Engineer (QA Engineer)
\.


--
-- Data for Name: sys_query_filter; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sys_query_filter (sys_query_filter_id, sys_query_description, sys_query) FROM stdin;
1	Get all users	select * from i_user;
\.


--
-- Name: sys_query_filter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sys_query_filter_id_seq', 1, true);


--
-- Data for Name: sys_segment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sys_segment (sys_segment_id, sys_segment_name, sys_segment_description, sys_query_filter_id) FROM stdin;
4	First_Segment	Segment for testing porpuses	1
5	First_Segment	Segment for testing porpuses	1
\.


--
-- Data for Name: sys_segment_client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sys_segment_client (sys_segment_client_id, sys_segment_id, i_user_id, sys_client_name, sys_client_surname, sys_client_mobile_number, sys_client_email) FROM stdin;
7	4	1000000020	IOANNIS	KOZOMPOLIS	6971903121	g.kozompolis@gmail.com
8	4	1000000021	IOANNIS	KOZOMPOLIS	6971903121	g.kozompolis@gmail.com
\.


--
-- Name: sys_segment_client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sys_segment_client_id_seq', 8, true);


--
-- Name: sys_segment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sys_segment_id_seq', 5, true);


--
-- Name: i_education_info i_education_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_education_info
    ADD CONSTRAINT i_education_info_pkey PRIMARY KEY (i_education_id);


--
-- Name: i_fb_books i_fb_books_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_books
    ADD CONSTRAINT i_fb_books_pkey PRIMARY KEY (i_fb_books_id);


--
-- Name: i_fb_events i_fb_events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_events
    ADD CONSTRAINT i_fb_events_pkey PRIMARY KEY (i_fb_events_id);


--
-- Name: i_fb_favorite_teams i_fb_favorite_team_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_favorite_teams
    ADD CONSTRAINT i_fb_favorite_team_pkey PRIMARY KEY (i_fb_favorite_teams_id);


--
-- Name: i_fb_music i_fb_music_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_music
    ADD CONSTRAINT i_fb_music_pkey PRIMARY KEY (i_fb_music_id);


--
-- Name: i_interest_fb_pages i_interest_pages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_interest_fb_pages
    ADD CONSTRAINT i_interest_pages_pkey PRIMARY KEY (i_interest_pages_id);


--
-- Name: i_location i_location_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_location
    ADD CONSTRAINT i_location_pkey PRIMARY KEY (i_location_id);


--
-- Name: i_user i_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_user
    ADD CONSTRAINT i_user_pkey PRIMARY KEY (i_user_id);


--
-- Name: i_work_info i_work_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_work_info
    ADD CONSTRAINT i_work_info_pkey PRIMARY KEY (i_work_id);


--
-- Name: sys_query_filter sys_query_filter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sys_query_filter
    ADD CONSTRAINT sys_query_filter_pkey PRIMARY KEY (sys_query_filter_id);


--
-- Name: sys_segment_client sys_segment_client_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sys_segment_client
    ADD CONSTRAINT sys_segment_client_pkey PRIMARY KEY (sys_segment_client_id);


--
-- Name: sys_segment sys_segment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sys_segment
    ADD CONSTRAINT sys_segment_pkey PRIMARY KEY (sys_segment_id);


--
-- Name: fki_E; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_E" ON i_education_info USING btree (i_user_id);


--
-- Name: fki_F; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_F" ON i_interest_fb_pages USING btree (i_user_id);


--
-- Name: fki_G; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_G" ON i_fb_events USING btree (i_user_id);


--
-- Name: fki_H; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_H" ON i_fb_events USING btree (i_user_id);


--
-- Name: fki_I; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_I" ON i_fb_events USING btree (i_user_id);


--
-- Name: fki_J; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_J" ON i_fb_favorite_teams USING btree (i_user_id);


--
-- Name: fki_i_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_i_user_id ON i_work_info USING btree (i_user_id);


--
-- Name: fki_i_user_id_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_i_user_id_fkey ON sys_segment_client USING btree (i_user_id);


--
-- Name: fki_sys_query_filter_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_sys_query_filter_fkey ON sys_segment USING btree (sys_query_filter_id);


--
-- Name: fki_sys_segement_id_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_sys_segement_id_fkey ON sys_segment_client USING btree (sys_segment_id);


--
-- Name: i_education_info Update_Data; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "Update_Data" BEFORE UPDATE ON i_education_info FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- Name: i_interest_fb_pages Update_Data; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "Update_Data" BEFORE UPDATE ON i_interest_fb_pages FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- Name: i_fb_events Update_Data; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "Update_Data" BEFORE UPDATE ON i_fb_events FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- Name: i_fb_books Update_Data; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "Update_Data" BEFORE UPDATE ON i_fb_books FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- Name: i_fb_music Update_Data; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "Update_Data" BEFORE UPDATE ON i_fb_music FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- Name: i_fb_favorite_teams Update_Data; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "Update_Data" BEFORE UPDATE ON i_fb_favorite_teams FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- Name: i_location Update_last_update_date; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "Update_last_update_date" BEFORE UPDATE ON i_location FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- Name: i_user set_timestamp; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER set_timestamp BEFORE UPDATE ON i_user FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- Name: i_work_info set_timestamp; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER set_timestamp BEFORE UPDATE ON i_work_info FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- Name: i_location User ID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_location
    ADD CONSTRAINT "User ID" FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id);


--
-- Name: i_education_info User_id_in_education_info; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_education_info
    ADD CONSTRAINT "User_id_in_education_info" FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: i_fb_books User_id_in_i_fb_books; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_books
    ADD CONSTRAINT "User_id_in_i_fb_books" FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- Name: i_fb_events User_id_in_i_fb_events; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_events
    ADD CONSTRAINT "User_id_in_i_fb_events" FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- Name: i_fb_favorite_teams User_id_in_i_fb_favorite_teams; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_favorite_teams
    ADD CONSTRAINT "User_id_in_i_fb_favorite_teams" FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- Name: i_fb_music User_id_in_i_fb_music; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_music
    ADD CONSTRAINT "User_id_in_i_fb_music" FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- Name: i_interest_fb_pages User_id_in_interest_pages; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_interest_fb_pages
    ADD CONSTRAINT "User_id_in_interest_pages" FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- Name: i_education_info fkck4ugidmocgo1ugp68cqndwgc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_education_info
    ADD CONSTRAINT fkck4ugidmocgo1ugp68cqndwgc FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id);


--
-- Name: i_work_info fkcoqbcg27jlgcyjfnh4n65uehx; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_work_info
    ADD CONSTRAINT fkcoqbcg27jlgcyjfnh4n65uehx FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id);


--
-- Name: i_location fkg0rrrwit513pw13pr3n3o2u4e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_location
    ADD CONSTRAINT fkg0rrrwit513pw13pr3n3o2u4e FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id);


--
-- Name: i_work_info i_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_work_info
    ADD CONSTRAINT i_user_id FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: i_education_info i_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_education_info
    ADD CONSTRAINT i_user_id FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: i_interest_fb_pages i_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_interest_fb_pages
    ADD CONSTRAINT i_user_id FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- Name: i_fb_events i_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_events
    ADD CONSTRAINT i_user_id FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- Name: i_fb_books i_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_books
    ADD CONSTRAINT i_user_id FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- Name: i_fb_music i_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_music
    ADD CONSTRAINT i_user_id FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- Name: i_fb_favorite_teams i_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_favorite_teams
    ADD CONSTRAINT i_user_id FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sys_segment_client i_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sys_segment_client
    ADD CONSTRAINT i_user_id_fkey FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id);


--
-- Name: CONSTRAINT i_user_id_fkey ON sys_segment_client; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT i_user_id_fkey ON sys_segment_client IS 'Define foreign key from i_user table';


--
-- Name: sys_segment sys_query_filter_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sys_segment
    ADD CONSTRAINT sys_query_filter_fkey FOREIGN KEY (sys_query_filter_id) REFERENCES sys_query_filter(sys_query_filter_id);


--
-- Name: CONSTRAINT sys_query_filter_fkey ON sys_segment; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT sys_query_filter_fkey ON sys_segment IS 'Define foreign key from sys_query_filter table';


--
-- Name: sys_segment_client sys_segement_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sys_segment_client
    ADD CONSTRAINT sys_segement_id_fkey FOREIGN KEY (sys_segment_id) REFERENCES sys_segment(sys_segment_id);


--
-- Name: CONSTRAINT sys_segement_id_fkey ON sys_segment_client; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT sys_segement_id_fkey ON sys_segment_client IS 'Define foreign key from sys_segment table';


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: register_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE register_type AS ENUM (
    'facebook',
    'custom'
);


ALTER TYPE register_type OWNER TO postgres;

--
-- Name: trigger_set_timestamp(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION trigger_set_timestamp() RETURNS trigger
    LANGUAGE plpgsql
    AS $$  
BEGIN  
  NEW.i_last_update_date = NOW();
  RETURN NEW;
END;  
$$;


ALTER FUNCTION public.trigger_set_timestamp() OWNER TO postgres;

--
-- Name: greeting_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE greeting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE greeting_id_seq OWNER TO postgres;

--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hibernate_sequence OWNER TO postgres;

--
-- Name: i_education_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE i_education_id_seq
    START WITH 1000000000
    INCREMENT BY 1
    MINVALUE 1000000000
    MAXVALUE 9999999999999
    CACHE 1;


ALTER TABLE i_education_id_seq OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: i_education_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE i_education_info (
    i_education_id bigint DEFAULT nextval('i_education_id_seq'::regclass) NOT NULL,
    i_user_id bigint NOT NULL,
    i_creation_date timestamp(6) without time zone DEFAULT now(),
    i_last_update_date timestamp(6) without time zone DEFAULT now(),
    i_edu_degree character varying(100),
    i_edu_school character varying(100),
    i_edu_type character varying(100),
    i_edu_year character varying(20)
);


ALTER TABLE i_education_info OWNER TO postgres;

--
-- Name: i_fb_books_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE i_fb_books_id_seq
    START WITH 1000000000
    INCREMENT BY 1
    MINVALUE 1000000000
    MAXVALUE 9999999999999
    CACHE 1;


ALTER TABLE i_fb_books_id_seq OWNER TO postgres;

--
-- Name: i_fb_books; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE i_fb_books (
    i_fb_books_id bigint DEFAULT nextval('i_fb_books_id_seq'::regclass) NOT NULL,
    i_user_id bigint NOT NULL,
    i_creation_date timestamp(6) without time zone DEFAULT now(),
    i_last_update_date timestamp(6) without time zone DEFAULT now(),
    i_book_name character varying(100),
    i_book_description character varying(1000)
);


ALTER TABLE i_fb_books OWNER TO postgres;

--
-- Name: i_fb_events_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE i_fb_events_id_seq
    START WITH 1000000000
    INCREMENT BY 1
    MINVALUE 1000000000
    MAXVALUE 999999999999999
    CACHE 1;


ALTER TABLE i_fb_events_id_seq OWNER TO postgres;

--
-- Name: i_fb_events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE i_fb_events (
    i_fb_events_id bigint DEFAULT nextval('i_fb_events_id_seq'::regclass) NOT NULL,
    i_user_id bigint NOT NULL,
    i_creation_date timestamp(6) without time zone DEFAULT now(),
    i_last_update_date timestamp(6) without time zone DEFAULT now(),
    i_event_name character varying(100),
    i_event_description character varying(1000),
    i_event_start_date timestamp(6) without time zone
);


ALTER TABLE i_fb_events OWNER TO postgres;

--
-- Name: i_fb_favorite_teams_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE i_fb_favorite_teams_id_seq
    START WITH 1000000000
    INCREMENT BY 1
    MINVALUE 1000000000
    MAXVALUE 9999999999999
    CACHE 1;


ALTER TABLE i_fb_favorite_teams_id_seq OWNER TO postgres;

--
-- Name: i_fb_favorite_teams; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE i_fb_favorite_teams (
    i_fb_favorite_teams_id bigint DEFAULT nextval('i_fb_favorite_teams_id_seq'::regclass) NOT NULL,
    i_user_id bigint NOT NULL,
    i_creation_date timestamp(6) without time zone DEFAULT now(),
    i_last_update_date timestamp(6) without time zone DEFAULT now(),
    i_team_name character varying(100)
);


ALTER TABLE i_fb_favorite_teams OWNER TO postgres;

--
-- Name: i_fb_music_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE i_fb_music_id_seq
    START WITH 1000000000
    INCREMENT BY 1
    MINVALUE 1000000000
    MAXVALUE 9999999999999
    CACHE 1;


ALTER TABLE i_fb_music_id_seq OWNER TO postgres;

--
-- Name: i_fb_music; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE i_fb_music (
    i_fb_music_id bigint DEFAULT nextval('i_fb_music_id_seq'::regclass) NOT NULL,
    i_user_id bigint NOT NULL,
    i_creation_date timestamp(6) without time zone DEFAULT now(),
    i_last_update_date timestamp(6) without time zone DEFAULT now(),
    i_music_title character varying(100)
);


ALTER TABLE i_fb_music OWNER TO postgres;

--
-- Name: i_interest_pages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE i_interest_pages_id_seq
    START WITH 1000000000
    INCREMENT BY 1
    MINVALUE 1000000000
    MAXVALUE 99999999999999
    CACHE 1;


ALTER TABLE i_interest_pages_id_seq OWNER TO postgres;

--
-- Name: i_interest_fb_pages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE i_interest_fb_pages (
    i_interest_pages_id bigint DEFAULT nextval('i_interest_pages_id_seq'::regclass) NOT NULL,
    i_user_id bigint NOT NULL,
    i_creation_date timestamp(6) without time zone DEFAULT now(),
    i_last_update_date timestamp(6) without time zone DEFAULT now(),
    i_page_name character varying(100),
    i_page_description character varying(400)
);


ALTER TABLE i_interest_fb_pages OWNER TO postgres;

--
-- Name: i_location_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE i_location_id_seq
    START WITH 1000000001
    INCREMENT BY 1
    MINVALUE 1000000001
    MAXVALUE 99999999999999
    CACHE 1;


ALTER TABLE i_location_id_seq OWNER TO postgres;

--
-- Name: i_location; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE i_location (
    i_location_id bigint DEFAULT nextval('i_location_id_seq'::regclass) NOT NULL,
    i_user_id bigint NOT NULL,
    i_creation_date timestamp(6) without time zone DEFAULT now(),
    i_last_update_date timestamp(6) without time zone DEFAULT now(),
    i_country_code character varying(5),
    i_country_name character varying(50),
    i_city_name character varying(50),
    i_prefecture character varying(50),
    i_department character varying(50),
    i_street_address character varying(100),
    i_postal_code character varying(10)
);


ALTER TABLE i_location OWNER TO postgres;

--
-- Name: i_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE i_user (
    i_user_id bigint NOT NULL,
    i_creation_date timestamp(6) without time zone DEFAULT now() NOT NULL,
    i_last_update_date timestamp(6) without time zone DEFAULT now() NOT NULL,
    i_first_name character varying(50),
    i_last_name character varying(50),
    i_mobile_number character varying(20),
    i_username character varying(50),
    i_password character varying(50),
    i_email_address character varying(100),
    i_register_type character varying(100)
);


ALTER TABLE i_user OWNER TO postgres;

--
-- Name: i_user_i_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE i_user_i_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE i_user_i_user_id_seq OWNER TO postgres;

--
-- Name: i_user_i_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE i_user_i_user_id_seq OWNED BY i_user.i_user_id;


--
-- Name: i_work_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE i_work_id_seq
    START WITH 1000000000
    INCREMENT BY 1
    MINVALUE 1000000000
    MAXVALUE 999999999999999
    CACHE 1;


ALTER TABLE i_work_id_seq OWNER TO postgres;

--
-- Name: i_work_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE i_work_info (
    i_work_id bigint DEFAULT nextval('i_work_id_seq'::regclass) NOT NULL,
    i_user_id bigint NOT NULL,
    i_creation_date timestamp(6) without time zone DEFAULT now() NOT NULL,
    i_last_update_date timestamp(6) without time zone DEFAULT now(),
    i_work_employer character varying(100),
    i_work_position character varying(100)
);


ALTER TABLE i_work_info OWNER TO postgres;

--
-- Name: sys_query_filter_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sys_query_filter_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 10000000000000000
    CACHE 1;


ALTER TABLE sys_query_filter_id_seq OWNER TO postgres;

--
-- Name: sys_query_filter; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE sys_query_filter (
    sys_query_filter_id bigint DEFAULT nextval('sys_query_filter_id_seq'::regclass) NOT NULL,
    sys_query_description text,
    sys_query text
);


ALTER TABLE sys_query_filter OWNER TO postgres;

--
-- Name: sys_segment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sys_segment_id_seq
    START WITH 1000000000
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999999999
    CACHE 1;


ALTER TABLE sys_segment_id_seq OWNER TO postgres;

--
-- Name: sys_segment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE sys_segment (
    sys_segment_id bigint DEFAULT nextval('sys_segment_id_seq'::regclass) NOT NULL,
    sys_segment_name character varying(50),
    sys_segment_description text,
    sys_query_filter_id bigint NOT NULL
);


ALTER TABLE sys_segment OWNER TO postgres;

--
-- Name: sys_segment_client_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sys_segment_client_id_seq
    START WITH 1000000000
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 1000000000000
    CACHE 1;


ALTER TABLE sys_segment_client_id_seq OWNER TO postgres;

--
-- Name: sys_segment_client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE sys_segment_client (
    sys_segment_client_id bigint DEFAULT nextval('sys_segment_client_id_seq'::regclass) NOT NULL,
    sys_segment_id bigint NOT NULL,
    i_user_id bigint,
    sys_client_name character varying(50),
    sys_client_surname character varying(50),
    sys_client_mobile_number character varying(20),
    sys_client_email text
);


ALTER TABLE sys_segment_client OWNER TO postgres;

--
-- Name: i_user i_user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_user ALTER COLUMN i_user_id SET DEFAULT nextval('i_user_i_user_id_seq'::regclass);


--
-- Name: greeting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('greeting_id_seq', 1, false);


--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('hibernate_sequence', 6, true);


--
-- Name: i_education_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('i_education_id_seq', 1000000005, true);


--
-- Data for Name: i_education_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY i_education_info (i_education_id, i_user_id, i_creation_date, i_last_update_date, i_edu_degree, i_edu_school, i_edu_type, i_edu_year) FROM stdin;
1000000003	1000000030	2017-12-10 19:27:42.874321	2017-12-10 19:27:42.874321		Department of Applied Informatics and Multimedia of Crete	College	2012
1000000004	1000000030	2017-12-10 19:27:42.934329	2017-12-10 19:27:42.934329	Advanced Softaware Development Technologies	University of Piraeus	Graduate School	2017
1000000005	1000000020	2017-12-14 17:43:17.307915	2017-12-14 17:43:17.307915	Master	University of Piraeus	IT	2017
\.


--
-- Data for Name: i_fb_books; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY i_fb_books (i_fb_books_id, i_user_id, i_creation_date, i_last_update_date, i_book_name, i_book_description) FROM stdin;
1000000000	1000000020	2017-12-13 17:13:27.565242	2017-12-13 17:13:54.776242	The Secret	The secret book only for adults
1000000001	1000000020	2017-12-14 13:23:58.544692	2017-12-14 13:23:58.544692	Pinocio	Pinocio adventures
\.


--
-- Name: i_fb_books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('i_fb_books_id_seq', 1000000001, true);


--
-- Data for Name: i_fb_events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY i_fb_events (i_fb_events_id, i_user_id, i_creation_date, i_last_update_date, i_event_name, i_event_description, i_event_start_date) FROM stdin;
1000000007	1000000020	2017-12-18 15:59:53.699546	2017-12-18 15:59:53.699546	Giannis		2016-02-26 21:00:00
1000000009	1000000020	2017-12-18 16:06:20.101183	2017-12-18 16:06:20.101183	Giannis	NUL	2016-02-26 21:00:00
1000000010	1000000020	2017-12-18 16:06:32.267399	2017-12-18 16:06:32.267399	Giannis		2016-02-26 21:00:00
1000000011	1000000020	2017-12-18 16:06:42.852458	2017-12-18 16:06:42.852458			2016-02-26 21:00:00
1000000012	1000000020	2017-12-18 16:10:23.492519	2017-12-18 16:10:23.492519			\N
1000000013	1000000020	2017-12-18 16:10:44.191589	2017-12-18 16:10:44.191589	null		\N
1000000005	1000000020	2017-12-18 14:21:01.12985	2018-01-12 18:44:50.987041	Tonis sfinos	 	2016-02-26 21:00:00
1000000006	1000000020	2017-12-18 14:41:26.772873	2018-01-12 18:44:59.403883	The Best	kghuj	2016-02-26 21:00:00
\.


--
-- Name: i_fb_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('i_fb_events_id_seq', 1000000013, true);


--
-- Data for Name: i_fb_favorite_teams; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY i_fb_favorite_teams (i_fb_favorite_teams_id, i_user_id, i_creation_date, i_last_update_date, i_team_name) FROM stdin;
1000000000	1000000020	2017-12-13 17:50:42.613253	2017-12-13 17:51:24.465438	AEK F.C.
1000000001	1000000020	2017-12-15 12:24:28.46332	2017-12-15 12:24:28.46332	AEK B.C.
\.


--
-- Name: i_fb_favorite_teams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('i_fb_favorite_teams_id_seq', 1000000001, true);


--
-- Data for Name: i_fb_music; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY i_fb_music (i_fb_music_id, i_user_id, i_creation_date, i_last_update_date, i_music_title) FROM stdin;
1000000000	1000000020	2017-12-13 17:26:30.425242	2017-12-13 17:26:40.697242	Eminem
1000000001	1000000020	2017-12-13 17:27:14.616468	2017-12-13 17:27:14.616468	Secret
1000000002	1000000020	2017-12-15 11:35:34.990002	2017-12-15 11:35:34.990002	Eminem
1000000003	1000000020	2017-12-15 11:35:50.489552	2017-12-15 11:35:50.489552	Tonis Sfinos
1000000004	1000000020	2017-12-15 11:57:50.097499	2017-12-15 11:57:50.097499	Tonis Sfinos
\.


--
-- Name: i_fb_music_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('i_fb_music_id_seq', 1000000004, true);


--
-- Data for Name: i_interest_fb_pages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY i_interest_fb_pages (i_interest_pages_id, i_user_id, i_creation_date, i_last_update_date, i_page_name, i_page_description) FROM stdin;
1000000004	1000000020	2017-12-15 12:02:57.03919	2017-12-15 12:02:57.03919	Almasport	Athletic store
\.


--
-- Name: i_interest_pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('i_interest_pages_id_seq', 1000000004, true);


--
-- Data for Name: i_location; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY i_location (i_location_id, i_user_id, i_creation_date, i_last_update_date, i_country_code, i_country_name, i_city_name, i_prefecture, i_department, i_street_address, i_postal_code) FROM stdin;
1000000002	1000000020	2017-10-29 15:07:49.898223	2017-10-29 15:13:11.877639	GR	Greece	Athens	Attica	Attica	Saronos 4	11143
1000000003	1000000020	2017-10-29 16:48:07.275397	2017-10-29 16:48:07.275397	GR	Greece	Kalamata	Messinia	Peloponissos	loggas 8	24100
1000000005	1000000020	2017-10-29 16:51:42.444704	2017-10-29 16:51:42.444704	GR	Greece	Kalamata	Messinia	Peloponissos	loggas 10	24100
1000000006	1000000020	2017-10-29 22:05:11.732534	2017-10-29 22:05:11.732534	GR	Greece	Kalamata	Messinia	Peloponissos	loggas 10	24100
1000000010	1000000023	2017-10-30 20:31:47.543345	2017-10-30 20:31:47.543345	GR	Greece	Kalamata	Messenia	Peloponnisos Dytiki Ellada ke Ionio	Aristomenous 45	24100
1000000011	1000000023	2017-10-30 20:35:56.798602	2017-10-30 20:35:56.798602	GR	Greece	Kalamata	Messenia	Peloponnisos Dytiki Ellada ke Ionio	Aristomenous 45	241 00
1000000012	1000000023	2017-10-30 20:40:59.183897	2017-10-30 20:40:59.183897	GR	Greece	Kalamata	Messenia	Peloponnisos Dytiki Ellada ke Ionio	Aristomenous 45	241 00
1000000013	1000000023	2017-10-30 22:13:09.887235	2017-10-30 22:13:09.887235	GR	Greece	Kalamata	Messenia	Peloponnisos Dytiki Ellada ke Ionio	Aristomenous 45	241 00
1000000014	1000000023	2017-10-30 22:27:02.560862	2017-10-30 22:27:02.560862	GR	Greece	Kalamata	Messenia	Peloponnisos Dytiki Ellada ke Ionio	Aristomenous 45	241 00
1000000015	1000000023	2017-10-30 22:55:44.872372	2017-10-30 22:55:44.872372	GR	Greece	Filadelfeia-Chalkidona	Central Athens	Attica	Marathonos 8	143 43
1000000016	1000000023	2017-10-30 23:05:47.623848	2017-10-30 23:05:47.623848	GR	Greece	Filadelfeia-Chalkidona	Central Athens	Attica	Anakous 60	143 41
1000000017	1000000023	2017-10-30 23:06:59.639967	2017-10-30 23:06:59.639967	GR	Greece	Pireas	Piraeus	Attica	Praxitelous 238	185 36
1000000018	1000000023	2017-10-30 23:10:34.107233	2017-10-30 23:10:34.107233	GR	Greece	West Mani	Messenia	Peloponnisos Dytiki Ellada ke Ionio	Unnamed Road	241 00
1000000019	1000000023	2017-11-03 00:30:52.691688	2017-11-03 00:30:52.691688	GR	Greece	Athens	Central Athens	Attica	Acharnon 458	111 43
1000000020	1000000023	2017-11-03 00:30:54.545794	2017-11-03 00:30:54.545794	GR	Greece	Athens	Central Athens	Attica	Acharnon 458	111 43
1000000021	1000000023	2017-11-03 00:31:50.367987	2017-11-03 00:31:50.367987	GR	Greece	Athens	Central Athens	Attica	Acharnon 458	111 43
1000000022	1000000023	2017-11-03 00:32:50.325416	2017-11-03 00:32:50.325416	GR	Greece	Athens	Central Athens	Attica	Acharnon 458	111 43
1000000023	1000000023	2017-11-03 00:33:50.36485	2017-11-03 00:33:50.36485	GR	Greece	Athens	Central Athens	Attica	Acharnon 458	111 43
1000000024	1000000023	2017-11-03 00:34:50.398284	2017-11-03 00:34:50.398284	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000025	1000000023	2017-11-03 00:35:50.441718	2017-11-03 00:35:50.441718	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000026	1000000023	2017-11-04 23:30:28.230643	2017-11-04 23:30:28.230643	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000028	1000000023	2017-11-04 23:30:28.236644	2017-11-04 23:30:28.236644	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000027	1000000023	2017-11-04 23:30:28.230643	2017-11-04 23:30:28.230643	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000029	1000000023	2017-11-04 23:30:30.690784	2017-11-04 23:30:30.690784	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000030	1000000023	2017-11-04 23:31:49.311281	2017-11-04 23:31:49.311281	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000031	1000000023	2017-11-04 23:32:52.991923	2017-11-04 23:32:52.991923	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000032	1000000023	2017-11-04 23:33:50.62922	2017-11-04 23:33:50.62922	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000033	1000000023	2017-11-04 23:34:52.52276	2017-11-04 23:34:52.52276	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000034	1000000023	2017-11-04 23:35:54.458302	2017-11-04 23:35:54.458302	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000035	1000000023	2017-11-04 23:35:56.125398	2017-11-04 23:35:56.125398	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000036	1000000023	2017-11-04 23:36:53.727692	2017-11-04 23:36:53.727692	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000037	1000000023	2017-11-04 23:36:53.728692	2017-11-04 23:36:53.728692	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000038	1000000023	2017-11-04 23:37:49.118861	2017-11-04 23:37:49.118861	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000040	1000000023	2017-11-04 23:38:55.993686	2017-11-04 23:38:55.993686	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000039	1000000023	2017-11-04 23:38:55.991685	2017-11-04 23:38:55.991685	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000041	1000000023	2017-11-04 23:40:49.124156	2017-11-04 23:40:49.124156	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000042	1000000023	2017-11-04 23:42:54.790344	2017-11-04 23:42:54.790344	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000043	1000000023	2017-11-04 23:42:54.791344	2017-11-04 23:42:54.791344	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000044	1000000023	2017-11-04 23:44:50.221946	2017-11-04 23:44:50.221946	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000045	1000000023	2017-11-04 23:46:50.57783	2017-11-04 23:46:50.57783	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000046	1000000023	2017-11-04 23:48:49.182614	2017-11-04 23:48:49.182614	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000047	1000000023	2017-11-05 00:38:27.199628	2017-11-05 00:38:27.199628	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000048	1000000023	2017-11-05 02:38:10.608822	2017-11-05 02:38:10.608822	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000049	1000000023	2017-11-05 04:38:18.804108	2017-11-05 04:38:18.804108	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000050	1000000023	2017-11-05 06:38:19.850984	2017-11-05 06:38:19.850984	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000051	1000000023	2017-11-05 08:38:20.844857	2017-11-05 08:38:20.844857	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000052	1000000023	2017-11-05 10:38:22.506769	2017-11-05 10:38:22.506769	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000053	1000000023	2017-11-05 12:02:00.795798	2017-11-05 12:02:00.795798	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000054	1000000023	2017-11-05 12:02:58.915123	2017-11-05 12:02:58.915123	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000055	1000000023	2017-11-05 12:03:58.889553	2017-11-05 12:03:58.889553	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000056	1000000023	2017-11-05 12:04:58.849982	2017-11-05 12:04:58.849982	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000057	1000000023	2017-11-05 12:05:58.931419	2017-11-05 12:05:58.931419	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000058	1000000023	2017-11-05 12:07:12.491626	2017-11-05 12:07:12.491626	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000059	1000000023	2017-11-05 12:08:12.430055	2017-11-05 12:08:12.430055	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000060	1000000023	2017-11-05 12:09:12.404485	2017-11-05 12:09:12.404485	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000061	1000000023	2017-11-05 12:10:12.46392	2017-11-05 12:10:12.46392	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000062	1000000023	2017-11-05 12:11:12.42135	2017-11-05 12:11:12.42135	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000063	1000000023	2017-11-05 12:12:12.507786	2017-11-05 12:12:12.507786	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000064	1000000023	2017-11-05 12:13:12.557221	2017-11-05 12:13:12.557221	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000065	1000000023	2017-11-05 12:14:12.497649	2017-11-05 12:14:12.497649	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000066	1000000023	2017-11-05 12:15:12.458079	2017-11-05 12:15:12.458079	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000067	1000000023	2017-11-05 12:16:12.472511	2017-11-05 12:16:12.472511	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000068	1000000023	2017-11-05 12:17:12.539947	2017-11-05 12:17:12.539947	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000069	1000000023	2017-11-05 12:18:12.491376	2017-11-05 12:18:12.491376	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000070	1000000023	2017-11-05 12:19:12.488808	2017-11-05 12:19:12.488808	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000071	1000000023	2017-11-05 12:20:12.612247	2017-11-05 12:20:12.612247	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000072	1000000023	2017-11-05 12:21:12.63268	2017-11-05 12:21:12.63268	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000073	1000000023	2017-11-05 12:22:12.61011	2017-11-05 12:22:12.61011	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000074	1000000023	2017-11-05 12:23:12.660545	2017-11-05 12:23:12.660545	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000075	1000000023	2017-11-05 12:24:12.583972	2017-11-05 12:24:12.583972	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000076	1000000023	2017-11-05 12:25:12.542402	2017-11-05 12:25:12.542402	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000077	1000000023	2017-11-05 12:26:12.676841	2017-11-05 12:26:12.676841	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000078	1000000023	2017-11-05 12:27:12.730276	2017-11-05 12:27:12.730276	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000079	1000000023	2017-11-05 12:28:12.719707	2017-11-05 12:28:12.719707	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000080	1000000023	2017-11-05 12:29:12.750141	2017-11-05 12:29:12.750141	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000081	1000000023	2017-11-05 12:30:12.659567	2017-11-05 12:30:12.659567	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000082	1000000023	2017-11-05 12:31:12.810008	2017-11-05 12:31:12.810008	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000083	1000000023	2017-11-05 12:32:12.728435	2017-11-05 12:32:12.728435	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000084	1000000023	2017-11-05 12:33:12.78087	2017-11-05 12:33:12.78087	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000085	1000000023	2017-11-05 12:34:12.798303	2017-11-05 12:34:12.798303	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000086	1000000023	2017-11-05 12:35:12.868738	2017-11-05 12:35:12.868738	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000087	1000000023	2017-11-05 12:36:12.841169	2017-11-05 12:36:12.841169	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000088	1000000023	2017-11-05 12:37:12.8276	2017-11-05 12:37:12.8276	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000089	1000000023	2017-11-05 12:38:13.036043	2017-11-05 12:38:13.036043	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000090	1000000023	2017-11-05 12:39:12.93847	2017-11-05 12:39:12.93847	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000091	1000000023	2017-11-05 12:40:12.856897	2017-11-05 12:40:12.856897	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000092	1000000023	2017-11-05 12:41:12.938333	2017-11-05 12:41:12.938333	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000093	1000000023	2017-11-05 12:42:13.139777	2017-11-05 12:42:13.139777	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000094	1000000023	2017-11-05 12:43:13.0012	2017-11-05 12:43:13.0012	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000095	1000000023	2017-11-05 12:44:12.995632	2017-11-05 12:44:12.995632	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000096	1000000023	2017-11-05 12:45:13.032066	2017-11-05 12:45:13.032066	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000097	1000000023	2017-11-05 12:46:13.110502	2017-11-05 12:46:13.110502	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000098	1000000023	2017-11-05 12:47:13.04193	2017-11-05 12:47:13.04193	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000099	1000000023	2017-11-05 12:48:13.01036	2017-11-05 12:48:13.01036	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000100	1000000023	2017-11-05 12:49:13.368812	2017-11-05 12:49:13.368812	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000101	1000000023	2017-11-05 12:50:13.054226	2017-11-05 12:50:13.054226	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000102	1000000023	2017-11-05 12:51:13.063658	2017-11-05 12:51:13.063658	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000103	1000000023	2017-11-05 12:52:13.140095	2017-11-05 12:52:13.140095	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000104	1000000023	2017-11-05 12:53:13.230532	2017-11-05 12:53:13.230532	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000105	1000000023	2017-11-05 12:54:13.204962	2017-11-05 12:54:13.204962	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000106	1000000023	2017-11-05 12:55:13.232395	2017-11-05 12:55:13.232395	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000107	1000000023	2017-11-05 12:56:13.221826	2017-11-05 12:56:13.221826	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000108	1000000023	2017-11-05 12:57:13.301263	2017-11-05 12:57:13.301263	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000109	1000000023	2017-11-05 12:58:13.231691	2017-11-05 12:58:13.231691	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000110	1000000023	2017-11-05 12:59:13.261124	2017-11-05 12:59:13.261124	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000111	1000000023	2017-11-05 13:00:13.386563	2017-11-05 13:00:13.386563	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000112	1000000023	2017-11-05 13:01:13.331992	2017-11-05 13:01:13.331992	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000113	1000000023	2017-11-05 13:02:13.250419	2017-11-05 13:02:13.250419	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000114	1000000023	2017-11-05 13:03:13.448862	2017-11-05 13:03:13.448862	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000115	1000000023	2017-11-05 13:04:13.427293	2017-11-05 13:04:13.427293	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000116	1000000023	2017-11-05 13:05:13.376722	2017-11-05 13:05:13.376722	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000117	1000000023	2017-11-05 13:06:13.470159	2017-11-05 13:06:13.470159	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000118	1000000023	2017-11-05 13:07:13.376585	2017-11-05 13:07:13.376585	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000119	1000000023	2017-11-05 13:08:13.465022	2017-11-05 13:08:13.465022	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000120	1000000023	2017-11-05 13:09:13.499456	2017-11-05 13:09:13.499456	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000121	1000000023	2017-11-05 13:10:13.591893	2017-11-05 13:10:13.591893	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000122	1000000023	2017-11-05 13:11:13.534321	2017-11-05 13:11:13.534321	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000123	1000000023	2017-11-05 13:12:13.461749	2017-11-05 13:12:13.461749	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000124	1000000023	2017-11-05 13:13:13.605189	2017-11-05 13:13:13.605189	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000125	1000000023	2017-11-05 13:14:13.683625	2017-11-05 13:14:13.683625	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000126	1000000023	2017-11-05 13:15:13.656056	2017-11-05 13:15:13.656056	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000127	1000000023	2017-11-05 13:16:13.557482	2017-11-05 13:16:13.557482	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000128	1000000023	2017-11-05 13:17:13.702922	2017-11-05 13:17:13.702922	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000129	1000000023	2017-11-05 13:18:13.669352	2017-11-05 13:18:13.669352	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000130	1000000023	2017-11-05 13:19:13.670784	2017-11-05 13:19:13.670784	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000131	1000000023	2017-11-05 13:20:13.766221	2017-11-05 13:20:13.766221	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000132	1000000023	2017-11-05 13:21:13.675648	2017-11-05 13:21:13.675648	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000133	1000000023	2017-11-05 13:22:13.762084	2017-11-05 13:22:13.762084	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000134	1000000023	2017-11-05 13:23:13.819519	2017-11-05 13:23:13.819519	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000135	1000000023	2017-11-05 13:24:13.722946	2017-11-05 13:24:13.722946	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000136	1000000023	2017-11-05 13:25:13.77438	2017-11-05 13:25:13.77438	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000137	1000000023	2017-11-05 13:26:13.803814	2017-11-05 13:26:13.803814	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000138	1000000023	2017-11-05 13:27:13.789245	2017-11-05 13:27:13.789245	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000139	1000000023	2017-11-05 13:28:13.84768	2017-11-05 13:28:13.84768	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000140	1000000023	2017-11-05 17:16:27.265217	2017-11-05 17:16:27.265217	null	null	null	null	null	null	null
1000000141	1000000023	2017-11-05 17:16:32.580521	2017-11-05 17:16:32.580521	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000142	1000000023	2017-11-05 17:17:32.463946	2017-11-05 17:17:32.463946	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000143	1000000023	2017-11-05 17:18:32.407375	2017-11-05 17:18:32.407375	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000144	1000000023	2017-11-05 17:19:32.619818	2017-11-05 17:19:32.619818	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000145	1000000023	2017-11-05 17:20:32.733257	2017-11-05 17:20:32.733257	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000146	1000000023	2017-11-05 17:21:32.668685	2017-11-05 17:21:32.668685	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000147	1000000023	2017-11-05 17:22:32.796124	2017-11-05 17:22:32.796124	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000148	1000000023	2017-11-05 17:23:32.769554	2017-11-05 17:23:32.769554	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000149	1000000023	2017-11-05 17:24:32.931995	2017-11-05 17:24:32.931995	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000150	1000000023	2017-11-05 17:25:32.869424	2017-11-05 17:25:32.869424	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000151	1000000023	2017-11-05 17:26:33.090868	2017-11-05 17:26:33.090868	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000152	1000000023	2017-11-05 17:27:32.957292	2017-11-05 17:27:32.957292	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000153	1000000023	2017-11-05 17:28:32.838717	2017-11-05 17:28:32.838717	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000154	1000000023	2017-11-05 17:29:32.839149	2017-11-05 17:29:32.839149	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000155	1000000023	2017-11-05 17:30:32.889584	2017-11-05 17:30:32.889584	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000156	1000000023	2017-11-05 17:31:32.910017	2017-11-05 17:31:32.910017	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000157	1000000023	2017-11-05 17:32:33.076458	2017-11-05 17:32:33.076458	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000158	1000000023	2017-11-05 17:33:33.022887	2017-11-05 17:33:33.022887	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000159	1000000023	2017-11-05 17:34:32.973316	2017-11-05 17:34:32.973316	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000160	1000000023	2017-11-05 17:35:32.973748	2017-11-05 17:35:32.973748	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000161	1000000023	2017-11-05 17:36:32.944178	2017-11-05 17:36:32.944178	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000162	1000000023	2017-11-05 17:37:32.938609	2017-11-05 17:37:32.938609	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000163	1000000023	2017-11-05 17:38:33.079049	2017-11-05 17:38:33.079049	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000164	1000000023	2017-11-05 17:39:32.979475	2017-11-05 17:39:32.979475	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000165	1000000023	2017-11-05 17:40:33.249922	2017-11-05 17:40:33.249922	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000166	1000000023	2017-11-05 17:41:33.366361	2017-11-05 17:41:33.366361	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000167	1000000023	2017-11-05 17:42:33.156781	2017-11-05 17:42:33.156781	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000168	1000000023	2017-11-05 17:43:33.932257	2017-11-05 17:43:33.932257	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000169	1000000023	2017-11-05 17:44:33.162645	2017-11-05 17:44:33.162645	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000170	1000000023	2017-11-05 17:45:33.124074	2017-11-05 17:45:33.124074	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000171	1000000023	2017-11-05 17:46:33.446524	2017-11-05 17:46:33.446524	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000172	1000000023	2017-11-05 17:47:33.301948	2017-11-05 17:47:33.301948	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000173	1000000023	2017-11-05 17:48:33.435387	2017-11-05 17:48:33.435387	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000174	1000000023	2017-11-05 17:49:33.349814	2017-11-05 17:49:33.349814	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000175	1000000023	2017-11-05 17:50:33.571259	2017-11-05 17:50:33.571259	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000176	1000000023	2017-11-05 17:51:33.329677	2017-11-05 17:51:33.329677	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000177	1000000023	2017-11-05 17:52:33.598124	2017-11-05 17:52:33.598124	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000178	1000000023	2017-11-05 17:54:08.055527	2017-11-05 17:54:08.055527	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000179	1000000023	2017-11-05 17:55:08.119962	2017-11-05 17:55:08.119962	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000180	1000000023	2017-11-05 17:56:08.100393	2017-11-05 17:56:08.100393	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000181	1000000023	2017-11-05 17:57:08.324837	2017-11-05 17:57:08.324837	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000182	1000000023	2017-11-05 17:58:08.193262	2017-11-05 17:58:08.193262	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000183	1000000023	2017-11-05 17:59:08.13969	2017-11-05 17:59:08.13969	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000184	1000000023	2017-11-05 18:00:08.27713	2017-11-05 18:00:08.27713	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000185	1000000023	2017-11-05 18:01:08.315564	2017-11-05 18:01:08.315564	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000186	1000000023	2017-11-05 18:02:08.264993	2017-11-05 18:02:08.264993	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000187	1000000023	2017-11-05 18:03:08.202421	2017-11-05 18:03:08.202421	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000188	1000000023	2017-11-05 18:04:08.244855	2017-11-05 18:04:08.244855	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000189	1000000023	2017-11-05 18:05:08.420297	2017-11-05 18:05:08.420297	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000190	1000000023	2017-11-05 18:06:08.650742	2017-11-05 18:06:08.650742	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000191	1000000023	2017-11-05 18:07:08.283153	2017-11-05 18:07:08.283153	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000192	1000000023	2017-11-05 18:08:08.309586	2017-11-05 18:08:08.309586	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000193	1000000023	2017-11-05 18:09:08.468027	2017-11-05 18:09:08.468027	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000194	1000000023	2017-11-05 18:10:08.434457	2017-11-05 18:10:08.434457	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000195	1000000023	2017-11-05 18:11:08.578897	2017-11-05 18:11:08.578897	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000196	1000000023	2017-11-05 18:12:08.59633	2017-11-05 18:12:08.59633	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000197	1000000020	2017-11-26 21:53:43.589013	2017-11-26 21:53:43.589013	null	null	null	null	null	null	null
1000000198	1000000020	2017-11-26 22:00:20.444712	2017-11-26 22:00:20.444712	null	null	null	null	null	null	null
1000000199	1000000020	2017-11-26 22:01:20.21713	2017-11-26 22:01:20.21713	null	null	null	null	null	null	null
1000000200	1000000020	2017-11-26 22:02:20.100556	2017-11-26 22:02:20.100556	null	null	null	null	null	null	null
1000000201	1000000020	2017-11-26 22:03:20.453008	2017-11-26 22:03:20.453008	null	null	null	null	null	null	null
1000000202	1000000020	2017-11-26 22:04:20.262428	2017-11-26 22:04:20.262428	null	null	null	null	null	null	null
1000000203	1000000020	2017-11-26 22:05:20.174855	2017-11-26 22:05:20.174855	null	null	null	null	null	null	null
1000000204	1000000020	2017-11-26 22:06:20.214289	2017-11-26 22:06:20.214289	null	null	null	null	null	null	null
1000000205	1000000020	2017-11-26 22:07:20.18772	2017-11-26 22:07:20.18772	null	null	null	null	null	null	null
1000000206	1000000020	2017-11-26 22:08:20.328159	2017-11-26 22:08:20.328159	null	null	null	null	null	null	null
1000000207	1000000020	2017-11-26 22:09:20.346592	2017-11-26 22:09:20.346592	null	null	null	null	null	null	null
1000000208	1000000020	2017-11-26 22:10:20.410028	2017-11-26 22:10:20.410028	null	null	null	null	null	null	null
1000000209	1000000020	2017-11-26 22:11:44.006809	2017-11-26 22:11:44.006809	null	null	null	null	null	null	null
1000000210	1000000020	2017-11-26 22:12:43.685223	2017-11-26 22:12:43.685223	null	null	null	null	null	null	null
1000000211	1000000020	2017-11-26 22:13:43.474642	2017-11-26 22:13:43.474642	null	null	null	null	null	null	null
1000000212	1000000020	2017-11-26 22:14:43.421071	2017-11-26 22:14:43.421071	null	null	null	null	null	null	null
1000000213	1000000020	2017-11-26 22:15:43.455505	2017-11-26 22:15:43.455505	null	null	null	null	null	null	null
1000000214	1000000020	2017-11-26 22:16:43.458937	2017-11-26 22:16:43.458937	null	null	null	null	null	null	null
1000000215	1000000020	2017-11-26 22:17:43.443368	2017-11-26 22:17:43.443368	null	null	null	null	null	null	null
1000000216	1000000020	2017-11-26 22:18:43.599808	2017-11-26 22:18:43.599808	null	null	null	null	null	null	null
1000000217	1000000020	2017-11-26 22:19:43.59724	2017-11-26 22:19:43.59724	null	null	null	null	null	null	null
1000000218	1000000020	2017-11-26 22:20:43.443663	2017-11-26 22:20:43.443663	null	null	null	null	null	null	null
1000000219	1000000020	2017-11-26 22:21:43.984126	2017-11-26 22:21:43.984126	null	null	null	null	null	null	null
1000000220	1000000020	2017-11-26 22:22:43.576534	2017-11-26 22:22:43.576534	null	null	null	null	null	null	null
1000000221	1000000020	2017-11-26 22:23:43.533964	2017-11-26 22:23:43.533964	null	null	null	null	null	null	null
1000000222	1000000020	2017-11-26 22:24:43.645402	2017-11-26 22:24:43.645402	null	null	null	null	null	null	null
1000000223	1000000020	2017-11-26 22:25:43.74884	2017-11-26 22:25:43.74884	null	null	null	null	null	null	null
1000000224	1000000020	2017-11-26 22:26:43.857278	2017-11-26 22:26:43.857278	null	null	null	null	null	null	null
1000000225	1000000020	2017-11-26 22:27:43.561693	2017-11-26 22:27:43.561693	null	null	null	null	null	null	null
1000000226	1000000020	2017-11-26 22:28:43.720133	2017-11-26 22:28:43.720133	null	null	null	null	null	null	null
1000000227	1000000020	2017-11-26 22:29:43.682563	2017-11-26 22:29:43.682563	null	null	null	null	null	null	null
1000000228	1000000020	2017-11-26 22:30:43.695996	2017-11-26 22:30:43.695996	null	null	null	null	null	null	null
1000000229	1000000020	2017-11-26 22:31:43.874438	2017-11-26 22:31:43.874438	null	null	null	null	null	null	null
1000000230	1000000020	2017-11-26 22:32:43.808866	2017-11-26 22:32:43.808866	null	null	null	null	null	null	null
1000000231	1000000020	2017-11-26 22:33:44.191319	2017-11-26 22:33:44.191319	null	null	null	null	null	null	null
1000000232	1000000020	2017-11-26 22:34:43.81373	2017-11-26 22:34:43.81373	null	null	null	null	null	null	null
1000000233	1000000020	2017-11-26 22:35:44.534203	2017-11-26 22:35:44.534203	null	null	null	null	null	null	null
1000000234	1000000020	2017-11-26 22:36:44.071608	2017-11-26 22:36:44.071608	null	null	null	null	null	null	null
1000000235	1000000020	2017-11-26 22:37:44.08004	2017-11-26 22:37:44.08004	null	null	null	null	null	null	null
1000000236	1000000020	2017-11-27 02:54:11.31414	2017-11-27 02:54:11.31414	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000237	1000000020	2017-11-27 02:55:11.390576	2017-11-27 02:55:11.390576	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000238	1000000020	2017-11-27 02:56:11.357006	2017-11-27 02:56:11.357006	GR	Greece	Chalandri	North Athens	Attica	Kosta Varnali 35A	152 33
1000000239	1000000020	2017-11-27 02:57:11.300434	2017-11-27 02:57:11.300434	GR	Greece	Chalandri	North Athens	Attica	Kosta Varnali 35A	152 33
1000000240	1000000020	2017-11-27 02:58:11.352869	2017-11-27 02:58:11.352869	GR	Greece	Chalandri	North Athens	Attica	Kosta Varnali 35A	152 33
1000000241	1000000020	2017-11-27 02:59:11.327299	2017-11-27 02:59:11.327299	null	null	null	null	null	null	null
1000000242	1000000020	2017-11-27 03:00:11.434737	2017-11-27 03:00:11.434737	GR	Greece	Attica	null	Attica	Aspropyrgos	null
1000000243	1000000020	2017-11-27 17:32:43.336508	2017-11-27 17:32:43.336508	GR	Greece	Attica	null	Attica	Aspropyrgos	null
1000000244	1000000020	2017-11-27 17:34:37.943063	2017-11-27 17:34:37.943063	null	null	null	null	null	null	null
1000000245	1000000020	2017-11-27 17:35:33.276228	2017-11-27 17:35:33.276228	GR	Greece	Attica	null	Attica	Aspropyrgos	null
1000000246	1000000020	2017-11-27 17:36:33.737687	2017-11-27 17:36:33.737687	GR	Greece	Attica	null	Attica	Aspropyrgos	null
1000000247	1000000020	2017-11-27 17:37:33.353096	2017-11-27 17:37:33.353096	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000248	1000000020	2017-11-27 17:38:33.294525	2017-11-27 17:38:33.294525	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000249	1000000020	2017-11-27 17:39:33.308957	2017-11-27 17:39:33.308957	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000250	1000000020	2017-11-27 17:40:33.342391	2017-11-27 17:40:33.342391	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000251	1000000020	2017-11-27 17:41:33.567836	2017-11-27 17:41:33.567836	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000252	1000000020	2017-11-27 17:42:33.354255	2017-11-27 17:42:33.354255	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000253	1000000020	2017-11-27 17:43:33.354687	2017-11-27 17:43:33.354687	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000254	1000000020	2017-11-27 17:44:33.37912	2017-11-27 17:44:33.37912	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000255	1000000020	2017-11-27 17:45:33.432555	2017-11-27 17:45:33.432555	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000256	1000000020	2017-11-29 23:31:03.031242	2017-11-29 23:31:03.031242	null	null	null	null	null	null	null
1000000257	1000000020	2017-11-29 23:32:02.983855	2017-11-29 23:32:02.983855	null	null	null	null	null	null	null
1000000258	1000000020	2017-11-29 23:33:03.012478	2017-11-29 23:33:03.012478	null	null	null	null	null	null	null
1000000259	1000000020	2017-11-29 23:33:59.047093	2017-11-29 23:33:59.047093	null	null	null	null	null	null	null
1000000260	1000000020	2017-11-29 23:35:00.536402	2017-11-29 23:35:00.536402	null	null	null	null	null	null	null
1000000261	1000000020	2017-11-29 23:36:19.068874	2017-11-29 23:36:19.068874	null	null	null	null	null	null	null
1000000262	1000000020	2017-11-29 23:36:59.060952	2017-11-29 23:36:59.060952	null	null	null	null	null	null	null
1000000263	1000000020	2017-11-29 23:39:20.306388	2017-11-29 23:39:20.306388	null	null	null	null	null	null	null
1000000264	1000000020	2017-11-29 23:41:54.184428	2017-11-29 23:41:54.184428	null	null	null	null	null	null	null
1000000265	1000000020	2017-11-29 23:42:37.833471	2017-11-29 23:42:37.833471	null	null	null	null	null	null	null
1000000266	1000000020	2017-11-29 23:43:54.286679	2017-11-29 23:43:54.286679	null	null	null	null	null	null	null
1000000267	1000000020	2017-11-29 23:44:34.923339	2017-11-29 23:44:34.923339	null	null	null	null	null	null	null
1000000268	1000000020	2017-11-29 23:47:00.129778	2017-11-29 23:47:00.129778	GR	Greece	Kalamata	Peloponnese	Peloponnisos Dytiki Ellada ke Ionio	Stadiou 4-18, Kalamata 241 00, Greece	241 00
1000000269	1000000020	2017-11-29 23:48:44.056475	2017-11-29 23:48:44.056475	GR	Greece	Kalamata	Peloponnese	Peloponnisos Dytiki Ellada ke Ionio	Athinon 34, Kalamata 241 00, Greece	241 00
1000000270	1000000020	2017-11-29 23:49:06.820866	2017-11-29 23:49:06.820866	GR	Greece	Kalamata	Peloponnese	Peloponnisos Dytiki Ellada ke Ionio	Athinon 95, Kalamata 241 00, Greece	241 00
1000000271	1000000020	2017-11-29 23:50:02.13339	2017-11-29 23:50:02.13339	GR	Greece	Kalamata	Peloponnese	Peloponnisos Dytiki Ellada ke Ionio	Athinon 95, Kalamata 241 00, Greece	241 00
1000000272	1000000020	2017-11-29 23:51:27.208693	2017-11-29 23:51:27.208693	GR	Greece	Kalamata	Peloponnese	Peloponnisos Dytiki Ellada ke Ionio	Athinon 95, Kalamata 241 00, Greece	241 00
1000000273	1000000020	2017-11-29 23:52:03.831844	2017-11-29 23:52:03.831844	GR	Greece	Kalamata	Peloponnese	Peloponnisos Dytiki Ellada ke Ionio	Athinon 95, Kalamata 241 00, Greece	241 00
1000000274	1000000020	2017-12-02 14:34:04.642786	2017-12-02 14:34:04.642786	null	null	null	null	null	null	null
1000000275	1000000020	2017-12-02 14:36:12.055466	2017-12-02 14:36:12.055466	null	null	null	null	null	null	null
1000000276	1000000020	2017-12-02 15:40:10.235853	2017-12-02 15:40:10.235853	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000277	1000000020	2017-12-02 15:41:48.452825	2017-12-02 15:41:48.452825	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000278	1000000020	2017-12-02 15:42:29.329515	2017-12-02 15:42:29.329515	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000279	1000000020	2017-12-02 15:43:08.407478	2017-12-02 15:43:08.407478	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000280	1000000020	2017-12-02 15:49:50.311013	2017-12-02 15:49:50.311013	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000281	1000000020	2017-12-02 16:32:16.864884	2017-12-02 16:32:16.864884	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000282	1000000020	2017-12-02 16:33:13.920129	2017-12-02 16:33:13.920129	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000283	1000000020	2017-12-02 16:34:46.362868	2017-12-02 16:34:46.362868	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000284	1000000020	2017-12-02 16:35:13.912867	2017-12-02 16:35:13.912867	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000285	1000000020	2017-12-02 16:36:13.933988	2017-12-02 16:36:13.933988	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000286	1000000020	2017-12-02 16:37:26.363686	2017-12-02 16:37:26.363686	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000287	1000000020	2017-12-02 16:38:13.911223	2017-12-02 16:38:13.911223	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000288	1000000020	2017-12-02 16:39:13.909342	2017-12-02 16:39:13.909342	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000289	1000000020	2017-12-02 16:40:13.97947	2017-12-02 16:40:13.97947	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000290	1000000020	2017-12-02 16:41:13.918081	2017-12-02 16:41:13.918081	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000291	1000000020	2017-12-02 16:42:53.926281	2017-12-02 16:42:53.926281	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000292	1000000020	2017-12-02 16:43:13.947323	2017-12-02 16:43:13.947323	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000293	1000000020	2017-12-02 16:44:13.957443	2017-12-02 16:44:13.957443	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000294	1000000020	2017-12-02 16:45:33.934599	2017-12-02 16:45:33.934599	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000295	1000000020	2017-12-02 16:46:13.912676	2017-12-02 16:46:13.912676	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000296	1000000020	2017-12-02 16:47:15.000433	2017-12-02 16:47:15.000433	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000297	1000000020	2017-12-02 16:48:13.96192	2017-12-02 16:48:13.96192	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000298	1000000020	2017-12-02 16:49:13.928535	2017-12-02 16:49:13.928535	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000299	1000000029	2017-12-02 16:52:15.302066	2017-12-02 16:52:15.302066	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000300	1000000029	2017-12-02 16:53:15.289684	2017-12-02 16:53:15.289684	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000301	1000000029	2017-12-02 16:54:53.648174	2017-12-02 16:54:53.648174	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000302	1000000029	2017-12-02 16:55:15.285421	2017-12-02 16:55:15.285421	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000303	1000000029	2017-12-02 16:56:15.271539	2017-12-02 16:56:15.271539	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000304	1000000029	2017-12-02 16:57:33.621988	2017-12-02 16:57:33.621988	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000305	1000000029	2017-12-02 16:58:15.278278	2017-12-02 16:58:15.278278	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000306	1000000029	2017-12-02 16:59:15.273396	2017-12-02 16:59:15.273396	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000307	1000000029	2017-12-02 17:00:15.86109	2017-12-02 17:00:15.86109	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000308	1000000029	2017-12-02 17:01:15.274634	2017-12-02 17:01:15.274634	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000309	1000000029	2017-12-02 17:02:15.279254	2017-12-02 17:02:15.279254	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000310	1000000029	2017-12-02 17:03:15.266371	2017-12-02 17:03:15.266371	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000311	1000000029	2017-12-02 17:40:24.162798	2017-12-02 17:40:24.162798	null	null	null	null	null	null	null
1000000312	1000000029	2017-12-02 17:41:20.40594	2017-12-02 17:41:20.40594	null	null	null	null	null	null	null
1000000313	1000000029	2017-12-02 17:42:25.546711	2017-12-02 17:42:25.546711	null	null	null	null	null	null	null
1000000314	1000000029	2017-12-02 17:43:20.358672	2017-12-02 17:43:20.358672	null	null	null	null	null	null	null
1000000315	1000000029	2017-12-02 17:44:20.408297	2017-12-02 17:44:20.408297	null	null	null	null	null	null	null
1000000316	1000000029	2017-12-02 17:45:20.382413	2017-12-02 17:45:20.382413	null	null	null	null	null	null	null
1000000317	1000000030	2017-12-03 18:57:11.100846	2017-12-03 18:57:11.100846	null	null	null	null	null	null	null
1000000318	1000000030	2017-12-10 15:29:41.873298	2017-12-10 15:29:41.873298	null	null	null	null	null	null	null
1000000319	1000000030	2017-12-10 18:53:13.383029	2017-12-10 18:53:13.383029	null	null	null	null	null	null	null
\.


--
-- Name: i_location_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('i_location_id_seq', 1000000319, true);


--
-- Data for Name: i_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY i_user (i_user_id, i_creation_date, i_last_update_date, i_first_name, i_last_name, i_mobile_number, i_username, i_password, i_email_address, i_register_type) FROM stdin;
1000000020	2017-10-12 19:55:19.392707	2017-10-12 19:55:19.392707	Ioannis	Kozompolis	6971903121	giannis		g.kozompolis@gmail.com	\N
1000000021	2017-10-12 19:57:45.490063	2017-10-12 19:57:45.490063	Ioannis 	Kozompolis	6971903121	giannis2		g.kozompolis@gmail.com	\N
1000000022	2017-10-12 20:55:23.476849	2017-10-12 20:55:23.476849	aek	ole	6971903121	aek		giannis1990@gmail.com	\N
1000000023	2017-10-12 21:08:52.548125	2017-10-12 21:08:52.548125	giannis4			giannis4			\N
1000000024	2017-10-14 21:22:11.872753	2017-10-14 21:22:11.872753	giannis5			giannis5			\N
1000000025	2017-10-14 21:27:15.417114	2017-10-14 21:27:15.417114	giannis6			giannis6			\N
1000000026	2017-11-25 21:04:47.794319	2017-11-25 21:04:47.794319	Ioannis	Kozompolis	6971903121	giannis2669		g.kozompolis@gmail.com	\N
1000000027	2017-12-02 16:22:39.382553	2017-12-02 16:22:39.382553	Ioannnis	Kozompolis	6971903121	kozo		g.kozompolis@gmail.com	\N
1000000028	2017-12-02 16:30:33.483257	2017-12-02 16:30:33.483257				kozompolis			\N
1000000029	2017-12-02 16:52:05.125274	2017-12-02 16:52:05.125274				testuser1			\N
1000000030	2017-12-03 17:55:53.547356	2017-12-03 17:55:53.547356	John	Kozo		1127478420719730		g.kozompolis@gmail.com	\N
\.


--
-- Name: i_user_i_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('i_user_i_user_id_seq', 1000000030, true);


--
-- Name: i_work_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('i_work_id_seq', 1000000023, true);


--
-- Data for Name: i_work_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY i_work_info (i_work_id, i_user_id, i_creation_date, i_last_update_date, i_work_employer, i_work_position) FROM stdin;
1000000008	1000000020	2017-12-09 18:07:12.183065	2017-12-09 18:07:12.183065	Almasport	Sales
1000000009	1000000020	2017-12-09 18:13:25.564421	2017-12-09 18:13:25.564421	\N	\N
1000000010	1000000030	2017-12-10 14:28:51.964701	2017-12-10 14:28:51.964701	Velti	QA Engineer
1000000011	1000000030	2017-12-10 15:26:23.561616	2017-12-10 15:26:23.561616	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000012	1000000030	2017-12-10 15:31:11.868226	2017-12-10 15:31:11.868226	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000013	1000000030	2017-12-10 15:32:59.937949	2017-12-10 15:32:59.937949	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000014	1000000030	2017-12-10 15:34:53.439362	2017-12-10 15:34:53.439362	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000015	1000000030	2017-12-10 16:19:59.583499	2017-12-10 16:19:59.583499	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000016	1000000030	2017-12-10 16:21:56.754378	2017-12-10 16:21:56.754378	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000017	1000000030	2017-12-10 16:25:51.281659	2017-12-10 16:25:51.281659	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000018	1000000030	2017-12-10 18:58:47.20742	2017-12-10 18:58:47.20742	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000019	1000000030	2017-12-10 18:58:47.239924	2017-12-10 18:58:47.239924	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000020	1000000030	2017-12-10 19:03:49.897356	2017-12-10 19:03:49.897356	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000021	1000000030	2017-12-10 19:20:44.539699	2017-12-10 19:20:44.539699	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000022	1000000030	2017-12-10 19:24:38.35189	2017-12-10 19:24:38.35189	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000023	1000000030	2017-12-10 19:27:42.773308	2017-12-10 19:27:42.773308	Velti S.A.	Quality Assurance Engineer (QA Engineer)
\.


--
-- Data for Name: sys_query_filter; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sys_query_filter (sys_query_filter_id, sys_query_description, sys_query) FROM stdin;
1	Get all users	select * from i_user;
\.


--
-- Name: sys_query_filter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sys_query_filter_id_seq', 1, true);


--
-- Data for Name: sys_segment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sys_segment (sys_segment_id, sys_segment_name, sys_segment_description, sys_query_filter_id) FROM stdin;
4	First_Segment	Segment for testing porpuses	1
5	First_Segment	Segment for testing porpuses	1
\.


--
-- Data for Name: sys_segment_client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sys_segment_client (sys_segment_client_id, sys_segment_id, i_user_id, sys_client_name, sys_client_surname, sys_client_mobile_number, sys_client_email) FROM stdin;
7	4	1000000020	IOANNIS	KOZOMPOLIS	6971903121	g.kozompolis@gmail.com
8	4	1000000021	IOANNIS	KOZOMPOLIS	6971903121	g.kozompolis@gmail.com
\.


--
-- Name: sys_segment_client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sys_segment_client_id_seq', 8, true);


--
-- Name: sys_segment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sys_segment_id_seq', 5, true);


--
-- Name: i_education_info i_education_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_education_info
    ADD CONSTRAINT i_education_info_pkey PRIMARY KEY (i_education_id);


--
-- Name: i_fb_books i_fb_books_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_books
    ADD CONSTRAINT i_fb_books_pkey PRIMARY KEY (i_fb_books_id);


--
-- Name: i_fb_events i_fb_events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_events
    ADD CONSTRAINT i_fb_events_pkey PRIMARY KEY (i_fb_events_id);


--
-- Name: i_fb_favorite_teams i_fb_favorite_team_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_favorite_teams
    ADD CONSTRAINT i_fb_favorite_team_pkey PRIMARY KEY (i_fb_favorite_teams_id);


--
-- Name: i_fb_music i_fb_music_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_music
    ADD CONSTRAINT i_fb_music_pkey PRIMARY KEY (i_fb_music_id);


--
-- Name: i_interest_fb_pages i_interest_pages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_interest_fb_pages
    ADD CONSTRAINT i_interest_pages_pkey PRIMARY KEY (i_interest_pages_id);


--
-- Name: i_location i_location_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_location
    ADD CONSTRAINT i_location_pkey PRIMARY KEY (i_location_id);


--
-- Name: i_user i_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_user
    ADD CONSTRAINT i_user_pkey PRIMARY KEY (i_user_id);


--
-- Name: i_work_info i_work_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_work_info
    ADD CONSTRAINT i_work_info_pkey PRIMARY KEY (i_work_id);


--
-- Name: sys_query_filter sys_query_filter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sys_query_filter
    ADD CONSTRAINT sys_query_filter_pkey PRIMARY KEY (sys_query_filter_id);


--
-- Name: sys_segment_client sys_segment_client_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sys_segment_client
    ADD CONSTRAINT sys_segment_client_pkey PRIMARY KEY (sys_segment_client_id);


--
-- Name: sys_segment sys_segment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sys_segment
    ADD CONSTRAINT sys_segment_pkey PRIMARY KEY (sys_segment_id);


--
-- Name: fki_E; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_E" ON i_education_info USING btree (i_user_id);


--
-- Name: fki_F; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_F" ON i_interest_fb_pages USING btree (i_user_id);


--
-- Name: fki_G; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_G" ON i_fb_events USING btree (i_user_id);


--
-- Name: fki_H; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_H" ON i_fb_events USING btree (i_user_id);


--
-- Name: fki_I; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_I" ON i_fb_events USING btree (i_user_id);


--
-- Name: fki_J; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_J" ON i_fb_favorite_teams USING btree (i_user_id);


--
-- Name: fki_i_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_i_user_id ON i_work_info USING btree (i_user_id);


--
-- Name: fki_i_user_id_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_i_user_id_fkey ON sys_segment_client USING btree (i_user_id);


--
-- Name: fki_sys_query_filter_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_sys_query_filter_fkey ON sys_segment USING btree (sys_query_filter_id);


--
-- Name: fki_sys_segement_id_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_sys_segement_id_fkey ON sys_segment_client USING btree (sys_segment_id);


--
-- Name: i_education_info Update_Data; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "Update_Data" BEFORE UPDATE ON i_education_info FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- Name: i_interest_fb_pages Update_Data; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "Update_Data" BEFORE UPDATE ON i_interest_fb_pages FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- Name: i_fb_events Update_Data; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "Update_Data" BEFORE UPDATE ON i_fb_events FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- Name: i_fb_books Update_Data; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "Update_Data" BEFORE UPDATE ON i_fb_books FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- Name: i_fb_music Update_Data; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "Update_Data" BEFORE UPDATE ON i_fb_music FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- Name: i_fb_favorite_teams Update_Data; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "Update_Data" BEFORE UPDATE ON i_fb_favorite_teams FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- Name: i_location Update_last_update_date; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "Update_last_update_date" BEFORE UPDATE ON i_location FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- Name: i_user set_timestamp; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER set_timestamp BEFORE UPDATE ON i_user FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- Name: i_work_info set_timestamp; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER set_timestamp BEFORE UPDATE ON i_work_info FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- Name: i_location User ID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_location
    ADD CONSTRAINT "User ID" FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id);


--
-- Name: i_education_info User_id_in_education_info; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_education_info
    ADD CONSTRAINT "User_id_in_education_info" FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: i_fb_books User_id_in_i_fb_books; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_books
    ADD CONSTRAINT "User_id_in_i_fb_books" FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- Name: i_fb_events User_id_in_i_fb_events; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_events
    ADD CONSTRAINT "User_id_in_i_fb_events" FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- Name: i_fb_favorite_teams User_id_in_i_fb_favorite_teams; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_favorite_teams
    ADD CONSTRAINT "User_id_in_i_fb_favorite_teams" FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- Name: i_fb_music User_id_in_i_fb_music; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_music
    ADD CONSTRAINT "User_id_in_i_fb_music" FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- Name: i_interest_fb_pages User_id_in_interest_pages; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_interest_fb_pages
    ADD CONSTRAINT "User_id_in_interest_pages" FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- Name: i_education_info fkck4ugidmocgo1ugp68cqndwgc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_education_info
    ADD CONSTRAINT fkck4ugidmocgo1ugp68cqndwgc FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id);


--
-- Name: i_work_info fkcoqbcg27jlgcyjfnh4n65uehx; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_work_info
    ADD CONSTRAINT fkcoqbcg27jlgcyjfnh4n65uehx FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id);


--
-- Name: i_location fkg0rrrwit513pw13pr3n3o2u4e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_location
    ADD CONSTRAINT fkg0rrrwit513pw13pr3n3o2u4e FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id);


--
-- Name: i_work_info i_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_work_info
    ADD CONSTRAINT i_user_id FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: i_education_info i_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_education_info
    ADD CONSTRAINT i_user_id FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: i_interest_fb_pages i_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_interest_fb_pages
    ADD CONSTRAINT i_user_id FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- Name: i_fb_events i_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_events
    ADD CONSTRAINT i_user_id FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- Name: i_fb_books i_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_books
    ADD CONSTRAINT i_user_id FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- Name: i_fb_music i_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_music
    ADD CONSTRAINT i_user_id FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- Name: i_fb_favorite_teams i_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_favorite_teams
    ADD CONSTRAINT i_user_id FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sys_segment_client i_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sys_segment_client
    ADD CONSTRAINT i_user_id_fkey FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id);


--
-- Name: CONSTRAINT i_user_id_fkey ON sys_segment_client; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT i_user_id_fkey ON sys_segment_client IS 'Define foreign key from i_user table';


--
-- Name: sys_segment sys_query_filter_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sys_segment
    ADD CONSTRAINT sys_query_filter_fkey FOREIGN KEY (sys_query_filter_id) REFERENCES sys_query_filter(sys_query_filter_id);


--
-- Name: CONSTRAINT sys_query_filter_fkey ON sys_segment; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT sys_query_filter_fkey ON sys_segment IS 'Define foreign key from sys_query_filter table';


--
-- Name: sys_segment_client sys_segement_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sys_segment_client
    ADD CONSTRAINT sys_segement_id_fkey FOREIGN KEY (sys_segment_id) REFERENCES sys_segment(sys_segment_id);


--
-- Name: CONSTRAINT sys_segement_id_fkey ON sys_segment_client; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT sys_segement_id_fkey ON sys_segment_client IS 'Define foreign key from sys_segment table';


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: campaign_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE campaign_status AS ENUM (
    'ACTIVE',
    'INACTIVE'
);


ALTER TYPE campaign_status OWNER TO postgres;

--
-- Name: campaign_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE campaign_type AS ENUM (
    'SIMPLE_NOTIFICATION',
    'TRIGER_FLOW_NODE',
    'OUTBOUND_FLOW_NODE'
);


ALTER TYPE campaign_type OWNER TO postgres;

--
-- Name: register_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE register_type AS ENUM (
    'facebook',
    'custom'
);


ALTER TYPE register_type OWNER TO postgres;

--
-- Name: trigger_set_timestamp(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION trigger_set_timestamp() RETURNS trigger
    LANGUAGE plpgsql
    AS $$  
BEGIN  
  NEW.i_last_update_date = NOW();
  RETURN NEW;
END;  
$$;


ALTER FUNCTION public.trigger_set_timestamp() OWNER TO postgres;

--
-- Name: trigger_set_timestamp_sys(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION trigger_set_timestamp_sys() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN  
  NEW.sys_last_update_date = NOW();
  RETURN NEW;
END; 
$$;


ALTER FUNCTION public.trigger_set_timestamp_sys() OWNER TO postgres;

--
-- Name: greeting_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE greeting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE greeting_id_seq OWNER TO postgres;

--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hibernate_sequence OWNER TO postgres;

--
-- Name: i_education_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE i_education_id_seq
    START WITH 1000000000
    INCREMENT BY 1
    MINVALUE 1000000000
    MAXVALUE 9999999999999
    CACHE 1;


ALTER TABLE i_education_id_seq OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: i_education_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE i_education_info (
    i_education_id bigint DEFAULT nextval('i_education_id_seq'::regclass) NOT NULL,
    i_user_id bigint NOT NULL,
    i_creation_date timestamp(6) without time zone DEFAULT now(),
    i_last_update_date timestamp(6) without time zone DEFAULT now(),
    i_edu_degree character varying(100),
    i_edu_school character varying(100),
    i_edu_type character varying(100),
    i_edu_year character varying(20)
);


ALTER TABLE i_education_info OWNER TO postgres;

--
-- Name: i_fb_books_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE i_fb_books_id_seq
    START WITH 1000000000
    INCREMENT BY 1
    MINVALUE 1000000000
    MAXVALUE 9999999999999
    CACHE 1;


ALTER TABLE i_fb_books_id_seq OWNER TO postgres;

--
-- Name: i_fb_books; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE i_fb_books (
    i_fb_books_id bigint DEFAULT nextval('i_fb_books_id_seq'::regclass) NOT NULL,
    i_user_id bigint NOT NULL,
    i_creation_date timestamp(6) without time zone DEFAULT now(),
    i_last_update_date timestamp(6) without time zone DEFAULT now(),
    i_book_name character varying(100),
    i_book_description character varying(1000)
);


ALTER TABLE i_fb_books OWNER TO postgres;

--
-- Name: i_fb_events_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE i_fb_events_id_seq
    START WITH 1000000000
    INCREMENT BY 1
    MINVALUE 1000000000
    MAXVALUE 999999999999999
    CACHE 1;


ALTER TABLE i_fb_events_id_seq OWNER TO postgres;

--
-- Name: i_fb_events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE i_fb_events (
    i_fb_events_id bigint DEFAULT nextval('i_fb_events_id_seq'::regclass) NOT NULL,
    i_user_id bigint NOT NULL,
    i_creation_date timestamp(6) without time zone DEFAULT now(),
    i_last_update_date timestamp(6) without time zone DEFAULT now(),
    i_event_name character varying(100),
    i_event_description character varying(1000),
    i_event_start_date timestamp(6) without time zone
);


ALTER TABLE i_fb_events OWNER TO postgres;

--
-- Name: i_fb_favorite_teams_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE i_fb_favorite_teams_id_seq
    START WITH 1000000000
    INCREMENT BY 1
    MINVALUE 1000000000
    MAXVALUE 9999999999999
    CACHE 1;


ALTER TABLE i_fb_favorite_teams_id_seq OWNER TO postgres;

--
-- Name: i_fb_favorite_teams; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE i_fb_favorite_teams (
    i_fb_favorite_teams_id bigint DEFAULT nextval('i_fb_favorite_teams_id_seq'::regclass) NOT NULL,
    i_user_id bigint NOT NULL,
    i_creation_date timestamp(6) without time zone DEFAULT now(),
    i_last_update_date timestamp(6) without time zone DEFAULT now(),
    i_team_name character varying(100)
);


ALTER TABLE i_fb_favorite_teams OWNER TO postgres;

--
-- Name: i_fb_music_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE i_fb_music_id_seq
    START WITH 1000000000
    INCREMENT BY 1
    MINVALUE 1000000000
    MAXVALUE 9999999999999
    CACHE 1;


ALTER TABLE i_fb_music_id_seq OWNER TO postgres;

--
-- Name: i_fb_music; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE i_fb_music (
    i_fb_music_id bigint DEFAULT nextval('i_fb_music_id_seq'::regclass) NOT NULL,
    i_user_id bigint NOT NULL,
    i_creation_date timestamp(6) without time zone DEFAULT now(),
    i_last_update_date timestamp(6) without time zone DEFAULT now(),
    i_music_title character varying(100)
);


ALTER TABLE i_fb_music OWNER TO postgres;

--
-- Name: i_interest_pages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE i_interest_pages_id_seq
    START WITH 1000000000
    INCREMENT BY 1
    MINVALUE 1000000000
    MAXVALUE 99999999999999
    CACHE 1;


ALTER TABLE i_interest_pages_id_seq OWNER TO postgres;

--
-- Name: i_interest_fb_pages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE i_interest_fb_pages (
    i_interest_pages_id bigint DEFAULT nextval('i_interest_pages_id_seq'::regclass) NOT NULL,
    i_user_id bigint NOT NULL,
    i_creation_date timestamp(6) without time zone DEFAULT now(),
    i_last_update_date timestamp(6) without time zone DEFAULT now(),
    i_page_name character varying(100),
    i_page_description character varying(400)
);


ALTER TABLE i_interest_fb_pages OWNER TO postgres;

--
-- Name: i_location_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE i_location_id_seq
    START WITH 1000000001
    INCREMENT BY 1
    MINVALUE 1000000001
    MAXVALUE 99999999999999
    CACHE 1;


ALTER TABLE i_location_id_seq OWNER TO postgres;

--
-- Name: i_location; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE i_location (
    i_location_id bigint DEFAULT nextval('i_location_id_seq'::regclass) NOT NULL,
    i_user_id bigint NOT NULL,
    i_creation_date timestamp(6) without time zone DEFAULT now(),
    i_last_update_date timestamp(6) without time zone DEFAULT now(),
    i_country_code character varying(5),
    i_country_name character varying(50),
    i_city_name character varying(50),
    i_prefecture character varying(50),
    i_department character varying(50),
    i_street_address character varying(100),
    i_postal_code character varying(10)
);


ALTER TABLE i_location OWNER TO postgres;

--
-- Name: i_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE i_user (
    i_user_id bigint NOT NULL,
    i_creation_date timestamp(6) without time zone DEFAULT now() NOT NULL,
    i_last_update_date timestamp(6) without time zone DEFAULT now() NOT NULL,
    i_first_name character varying(50),
    i_last_name character varying(50),
    i_mobile_number character varying(20),
    i_username character varying(50),
    i_password character varying(50),
    i_email_address character varying(100),
    i_register_type character varying(100)
);


ALTER TABLE i_user OWNER TO postgres;

--
-- Name: i_user_i_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE i_user_i_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE i_user_i_user_id_seq OWNER TO postgres;

--
-- Name: i_user_i_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE i_user_i_user_id_seq OWNED BY i_user.i_user_id;


--
-- Name: i_work_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE i_work_id_seq
    START WITH 1000000000
    INCREMENT BY 1
    MINVALUE 1000000000
    MAXVALUE 999999999999999
    CACHE 1;


ALTER TABLE i_work_id_seq OWNER TO postgres;

--
-- Name: i_work_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE i_work_info (
    i_work_id bigint DEFAULT nextval('i_work_id_seq'::regclass) NOT NULL,
    i_user_id bigint NOT NULL,
    i_creation_date timestamp(6) without time zone DEFAULT now() NOT NULL,
    i_last_update_date timestamp(6) without time zone DEFAULT now(),
    i_work_employer character varying(100),
    i_work_position character varying(100)
);


ALTER TABLE i_work_info OWNER TO postgres;

--
-- Name: sys_campaign_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sys_campaign_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999999999999
    CACHE 1;


ALTER TABLE sys_campaign_id_seq OWNER TO postgres;

--
-- Name: sys_campaign; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE sys_campaign (
    sys_campaign_id bigint DEFAULT nextval('sys_campaign_id_seq'::regclass) NOT NULL,
    sys_creation_date timestamp(6) without time zone DEFAULT now(),
    sys_last_update_date timestamp(6) without time zone DEFAULT now(),
    sys_campaign_type campaign_type,
    sys_campaign_status campaign_status,
    sys_campaign_name text,
    sys_campaign_description text,
    sys_flow_node_id bigint,
    sys_json_data text,
    sys_segment_id bigint
);


ALTER TABLE sys_campaign OWNER TO postgres;

--
-- Name: sys_flow_node; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE sys_flow_node (
    sys_flow_node_id bigint NOT NULL,
    sys_json_flow text
);


ALTER TABLE sys_flow_node OWNER TO postgres;

--
-- Name: sys_json_filter; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE sys_json_filter (
    sys_json_id bigint NOT NULL,
    sys_json text
);


ALTER TABLE sys_json_filter OWNER TO postgres;

--
-- Name: sys_json_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sys_json_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sys_json_id_seq OWNER TO postgres;

--
-- Name: sys_query_filter_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sys_query_filter_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 10000000000000000
    CACHE 1;


ALTER TABLE sys_query_filter_id_seq OWNER TO postgres;

--
-- Name: sys_query_filter; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE sys_query_filter (
    sys_query_filter_id bigint DEFAULT nextval('sys_query_filter_id_seq'::regclass) NOT NULL,
    sys_query_description text,
    sys_query text
);


ALTER TABLE sys_query_filter OWNER TO postgres;

--
-- Name: sys_segment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sys_segment_id_seq
    START WITH 1000000000
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999999999
    CACHE 1;


ALTER TABLE sys_segment_id_seq OWNER TO postgres;

--
-- Name: sys_segment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE sys_segment (
    sys_segment_id bigint DEFAULT nextval('sys_segment_id_seq'::regclass) NOT NULL,
    sys_segment_name text,
    sys_segment_description text,
    sys_query_filter_id bigint,
    sys_json_id bigint NOT NULL
);


ALTER TABLE sys_segment OWNER TO postgres;

--
-- Name: sys_segment_client_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sys_segment_client_id_seq
    START WITH 1000000000
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 1000000000000
    CACHE 1;


ALTER TABLE sys_segment_client_id_seq OWNER TO postgres;

--
-- Name: sys_segment_client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE sys_segment_client (
    sys_segment_client_id bigint DEFAULT nextval('sys_segment_client_id_seq'::regclass) NOT NULL,
    sys_segment_id bigint NOT NULL,
    i_user_id bigint,
    sys_client_name character varying(50),
    sys_client_surname character varying(50),
    sys_client_mobile_number character varying(20),
    sys_client_email text
);


ALTER TABLE sys_segment_client OWNER TO postgres;

--
-- Name: i_user i_user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_user ALTER COLUMN i_user_id SET DEFAULT nextval('i_user_i_user_id_seq'::regclass);


--
-- Name: greeting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('greeting_id_seq', 1, false);


--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('hibernate_sequence', 6, true);


--
-- Name: i_education_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('i_education_id_seq', 1000000005, true);


--
-- Data for Name: i_education_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY i_education_info (i_education_id, i_user_id, i_creation_date, i_last_update_date, i_edu_degree, i_edu_school, i_edu_type, i_edu_year) FROM stdin;
1000000003	1000000030	2017-12-10 19:27:42.874321	2017-12-10 19:27:42.874321		Department of Applied Informatics and Multimedia of Crete	College	2012
1000000004	1000000030	2017-12-10 19:27:42.934329	2017-12-10 19:27:42.934329	Advanced Softaware Development Technologies	University of Piraeus	Graduate School	2017
1000000005	1000000020	2017-12-14 17:43:17.307915	2017-12-14 17:43:17.307915	Master	University of Piraeus	IT	2017
\.


--
-- Data for Name: i_fb_books; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY i_fb_books (i_fb_books_id, i_user_id, i_creation_date, i_last_update_date, i_book_name, i_book_description) FROM stdin;
1000000000	1000000020	2017-12-13 17:13:27.565242	2017-12-13 17:13:54.776242	The Secret	The secret book only for adults
1000000001	1000000020	2017-12-14 13:23:58.544692	2017-12-14 13:23:58.544692	Pinocio	Pinocio adventures
\.


--
-- Name: i_fb_books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('i_fb_books_id_seq', 1000000001, true);


--
-- Data for Name: i_fb_events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY i_fb_events (i_fb_events_id, i_user_id, i_creation_date, i_last_update_date, i_event_name, i_event_description, i_event_start_date) FROM stdin;
1000000007	1000000020	2017-12-18 15:59:53.699546	2017-12-18 15:59:53.699546	Giannis		2016-02-26 21:00:00
1000000009	1000000020	2017-12-18 16:06:20.101183	2017-12-18 16:06:20.101183	Giannis	NUL	2016-02-26 21:00:00
1000000010	1000000020	2017-12-18 16:06:32.267399	2017-12-18 16:06:32.267399	Giannis		2016-02-26 21:00:00
1000000011	1000000020	2017-12-18 16:06:42.852458	2017-12-18 16:06:42.852458			2016-02-26 21:00:00
1000000012	1000000020	2017-12-18 16:10:23.492519	2017-12-18 16:10:23.492519			\N
1000000013	1000000020	2017-12-18 16:10:44.191589	2017-12-18 16:10:44.191589	null		\N
1000000005	1000000020	2017-12-18 14:21:01.12985	2018-01-12 18:44:50.987041	Tonis sfinos	 	2016-02-26 21:00:00
1000000006	1000000020	2017-12-18 14:41:26.772873	2018-01-12 18:44:59.403883	The Best	kghuj	2016-02-26 21:00:00
1000000000	1000000020	2017-12-13 16:46:29.113914	2017-12-13 16:49:20.508051	2nd Marathon Kalamatas	Marathon on Kalamata first time ever	\N
1000000001	1000000020	2017-12-13 16:47:54.9875	2017-12-13 16:49:20.508051	2nd Marathon Kalamatas	Marathon on Kalamata first time ever	2017-12-13 16:47:54.9875
\.


--
-- Name: i_fb_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('i_fb_events_id_seq', 1000000013, true);


--
-- Data for Name: i_fb_favorite_teams; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY i_fb_favorite_teams (i_fb_favorite_teams_id, i_user_id, i_creation_date, i_last_update_date, i_team_name) FROM stdin;
1000000000	1000000020	2017-12-13 17:50:42.613253	2017-12-13 17:51:24.465438	AEK F.C.
1000000001	1000000020	2017-12-15 12:24:28.46332	2017-12-15 12:24:28.46332	AEK B.C.
\.


--
-- Name: i_fb_favorite_teams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('i_fb_favorite_teams_id_seq', 1000000001, true);


--
-- Data for Name: i_fb_music; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY i_fb_music (i_fb_music_id, i_user_id, i_creation_date, i_last_update_date, i_music_title) FROM stdin;
1000000000	1000000020	2017-12-13 17:26:30.425242	2017-12-13 17:26:40.697242	Eminem
1000000001	1000000020	2017-12-13 17:27:14.616468	2017-12-13 17:27:14.616468	Secret
1000000002	1000000020	2017-12-15 11:35:34.990002	2017-12-15 11:35:34.990002	Eminem
1000000003	1000000020	2017-12-15 11:35:50.489552	2017-12-15 11:35:50.489552	Tonis Sfinos
1000000004	1000000020	2017-12-15 11:57:50.097499	2017-12-15 11:57:50.097499	Tonis Sfinos
\.


--
-- Name: i_fb_music_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('i_fb_music_id_seq', 1000000004, true);


--
-- Data for Name: i_interest_fb_pages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY i_interest_fb_pages (i_interest_pages_id, i_user_id, i_creation_date, i_last_update_date, i_page_name, i_page_description) FROM stdin;
1000000004	1000000020	2017-12-15 12:02:57.03919	2017-12-15 12:02:57.03919	Almasport	Athletic store
\.


--
-- Name: i_interest_pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('i_interest_pages_id_seq', 1000000004, true);


--
-- Data for Name: i_location; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY i_location (i_location_id, i_user_id, i_creation_date, i_last_update_date, i_country_code, i_country_name, i_city_name, i_prefecture, i_department, i_street_address, i_postal_code) FROM stdin;
1000000002	1000000020	2017-10-29 15:07:49.898223	2017-10-29 15:13:11.877639	GR	Greece	Athens	Attica	Attica	Saronos 4	11143
1000000003	1000000020	2017-10-29 16:48:07.275397	2017-10-29 16:48:07.275397	GR	Greece	Kalamata	Messinia	Peloponissos	loggas 8	24100
1000000005	1000000020	2017-10-29 16:51:42.444704	2017-10-29 16:51:42.444704	GR	Greece	Kalamata	Messinia	Peloponissos	loggas 10	24100
1000000006	1000000020	2017-10-29 22:05:11.732534	2017-10-29 22:05:11.732534	GR	Greece	Kalamata	Messinia	Peloponissos	loggas 10	24100
1000000010	1000000023	2017-10-30 20:31:47.543345	2017-10-30 20:31:47.543345	GR	Greece	Kalamata	Messenia	Peloponnisos Dytiki Ellada ke Ionio	Aristomenous 45	24100
1000000011	1000000023	2017-10-30 20:35:56.798602	2017-10-30 20:35:56.798602	GR	Greece	Kalamata	Messenia	Peloponnisos Dytiki Ellada ke Ionio	Aristomenous 45	241 00
1000000012	1000000023	2017-10-30 20:40:59.183897	2017-10-30 20:40:59.183897	GR	Greece	Kalamata	Messenia	Peloponnisos Dytiki Ellada ke Ionio	Aristomenous 45	241 00
1000000013	1000000023	2017-10-30 22:13:09.887235	2017-10-30 22:13:09.887235	GR	Greece	Kalamata	Messenia	Peloponnisos Dytiki Ellada ke Ionio	Aristomenous 45	241 00
1000000014	1000000023	2017-10-30 22:27:02.560862	2017-10-30 22:27:02.560862	GR	Greece	Kalamata	Messenia	Peloponnisos Dytiki Ellada ke Ionio	Aristomenous 45	241 00
1000000015	1000000023	2017-10-30 22:55:44.872372	2017-10-30 22:55:44.872372	GR	Greece	Filadelfeia-Chalkidona	Central Athens	Attica	Marathonos 8	143 43
1000000016	1000000023	2017-10-30 23:05:47.623848	2017-10-30 23:05:47.623848	GR	Greece	Filadelfeia-Chalkidona	Central Athens	Attica	Anakous 60	143 41
1000000017	1000000023	2017-10-30 23:06:59.639967	2017-10-30 23:06:59.639967	GR	Greece	Pireas	Piraeus	Attica	Praxitelous 238	185 36
1000000018	1000000023	2017-10-30 23:10:34.107233	2017-10-30 23:10:34.107233	GR	Greece	West Mani	Messenia	Peloponnisos Dytiki Ellada ke Ionio	Unnamed Road	241 00
1000000019	1000000023	2017-11-03 00:30:52.691688	2017-11-03 00:30:52.691688	GR	Greece	Athens	Central Athens	Attica	Acharnon 458	111 43
1000000020	1000000023	2017-11-03 00:30:54.545794	2017-11-03 00:30:54.545794	GR	Greece	Athens	Central Athens	Attica	Acharnon 458	111 43
1000000021	1000000023	2017-11-03 00:31:50.367987	2017-11-03 00:31:50.367987	GR	Greece	Athens	Central Athens	Attica	Acharnon 458	111 43
1000000022	1000000023	2017-11-03 00:32:50.325416	2017-11-03 00:32:50.325416	GR	Greece	Athens	Central Athens	Attica	Acharnon 458	111 43
1000000023	1000000023	2017-11-03 00:33:50.36485	2017-11-03 00:33:50.36485	GR	Greece	Athens	Central Athens	Attica	Acharnon 458	111 43
1000000024	1000000023	2017-11-03 00:34:50.398284	2017-11-03 00:34:50.398284	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000025	1000000023	2017-11-03 00:35:50.441718	2017-11-03 00:35:50.441718	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000026	1000000023	2017-11-04 23:30:28.230643	2017-11-04 23:30:28.230643	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000028	1000000023	2017-11-04 23:30:28.236644	2017-11-04 23:30:28.236644	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000027	1000000023	2017-11-04 23:30:28.230643	2017-11-04 23:30:28.230643	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000029	1000000023	2017-11-04 23:30:30.690784	2017-11-04 23:30:30.690784	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000030	1000000023	2017-11-04 23:31:49.311281	2017-11-04 23:31:49.311281	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000031	1000000023	2017-11-04 23:32:52.991923	2017-11-04 23:32:52.991923	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000032	1000000023	2017-11-04 23:33:50.62922	2017-11-04 23:33:50.62922	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000033	1000000023	2017-11-04 23:34:52.52276	2017-11-04 23:34:52.52276	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000034	1000000023	2017-11-04 23:35:54.458302	2017-11-04 23:35:54.458302	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000035	1000000023	2017-11-04 23:35:56.125398	2017-11-04 23:35:56.125398	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000036	1000000023	2017-11-04 23:36:53.727692	2017-11-04 23:36:53.727692	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000037	1000000023	2017-11-04 23:36:53.728692	2017-11-04 23:36:53.728692	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000038	1000000023	2017-11-04 23:37:49.118861	2017-11-04 23:37:49.118861	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000040	1000000023	2017-11-04 23:38:55.993686	2017-11-04 23:38:55.993686	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000039	1000000023	2017-11-04 23:38:55.991685	2017-11-04 23:38:55.991685	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000041	1000000023	2017-11-04 23:40:49.124156	2017-11-04 23:40:49.124156	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000042	1000000023	2017-11-04 23:42:54.790344	2017-11-04 23:42:54.790344	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000043	1000000023	2017-11-04 23:42:54.791344	2017-11-04 23:42:54.791344	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000044	1000000023	2017-11-04 23:44:50.221946	2017-11-04 23:44:50.221946	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000045	1000000023	2017-11-04 23:46:50.57783	2017-11-04 23:46:50.57783	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000046	1000000023	2017-11-04 23:48:49.182614	2017-11-04 23:48:49.182614	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000047	1000000023	2017-11-05 00:38:27.199628	2017-11-05 00:38:27.199628	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000048	1000000023	2017-11-05 02:38:10.608822	2017-11-05 02:38:10.608822	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000049	1000000023	2017-11-05 04:38:18.804108	2017-11-05 04:38:18.804108	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000050	1000000023	2017-11-05 06:38:19.850984	2017-11-05 06:38:19.850984	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000051	1000000023	2017-11-05 08:38:20.844857	2017-11-05 08:38:20.844857	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000052	1000000023	2017-11-05 10:38:22.506769	2017-11-05 10:38:22.506769	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000053	1000000023	2017-11-05 12:02:00.795798	2017-11-05 12:02:00.795798	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000054	1000000023	2017-11-05 12:02:58.915123	2017-11-05 12:02:58.915123	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000055	1000000023	2017-11-05 12:03:58.889553	2017-11-05 12:03:58.889553	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000056	1000000023	2017-11-05 12:04:58.849982	2017-11-05 12:04:58.849982	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000057	1000000023	2017-11-05 12:05:58.931419	2017-11-05 12:05:58.931419	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000058	1000000023	2017-11-05 12:07:12.491626	2017-11-05 12:07:12.491626	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000059	1000000023	2017-11-05 12:08:12.430055	2017-11-05 12:08:12.430055	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000060	1000000023	2017-11-05 12:09:12.404485	2017-11-05 12:09:12.404485	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000061	1000000023	2017-11-05 12:10:12.46392	2017-11-05 12:10:12.46392	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000062	1000000023	2017-11-05 12:11:12.42135	2017-11-05 12:11:12.42135	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000063	1000000023	2017-11-05 12:12:12.507786	2017-11-05 12:12:12.507786	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000064	1000000023	2017-11-05 12:13:12.557221	2017-11-05 12:13:12.557221	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000065	1000000023	2017-11-05 12:14:12.497649	2017-11-05 12:14:12.497649	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000066	1000000023	2017-11-05 12:15:12.458079	2017-11-05 12:15:12.458079	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000067	1000000023	2017-11-05 12:16:12.472511	2017-11-05 12:16:12.472511	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000068	1000000023	2017-11-05 12:17:12.539947	2017-11-05 12:17:12.539947	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000069	1000000023	2017-11-05 12:18:12.491376	2017-11-05 12:18:12.491376	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000070	1000000023	2017-11-05 12:19:12.488808	2017-11-05 12:19:12.488808	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000071	1000000023	2017-11-05 12:20:12.612247	2017-11-05 12:20:12.612247	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000072	1000000023	2017-11-05 12:21:12.63268	2017-11-05 12:21:12.63268	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000073	1000000023	2017-11-05 12:22:12.61011	2017-11-05 12:22:12.61011	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000074	1000000023	2017-11-05 12:23:12.660545	2017-11-05 12:23:12.660545	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000075	1000000023	2017-11-05 12:24:12.583972	2017-11-05 12:24:12.583972	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000076	1000000023	2017-11-05 12:25:12.542402	2017-11-05 12:25:12.542402	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000077	1000000023	2017-11-05 12:26:12.676841	2017-11-05 12:26:12.676841	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000078	1000000023	2017-11-05 12:27:12.730276	2017-11-05 12:27:12.730276	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000079	1000000023	2017-11-05 12:28:12.719707	2017-11-05 12:28:12.719707	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000080	1000000023	2017-11-05 12:29:12.750141	2017-11-05 12:29:12.750141	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000081	1000000023	2017-11-05 12:30:12.659567	2017-11-05 12:30:12.659567	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000082	1000000023	2017-11-05 12:31:12.810008	2017-11-05 12:31:12.810008	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000083	1000000023	2017-11-05 12:32:12.728435	2017-11-05 12:32:12.728435	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000084	1000000023	2017-11-05 12:33:12.78087	2017-11-05 12:33:12.78087	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000085	1000000023	2017-11-05 12:34:12.798303	2017-11-05 12:34:12.798303	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000086	1000000023	2017-11-05 12:35:12.868738	2017-11-05 12:35:12.868738	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000087	1000000023	2017-11-05 12:36:12.841169	2017-11-05 12:36:12.841169	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000088	1000000023	2017-11-05 12:37:12.8276	2017-11-05 12:37:12.8276	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000089	1000000023	2017-11-05 12:38:13.036043	2017-11-05 12:38:13.036043	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000090	1000000023	2017-11-05 12:39:12.93847	2017-11-05 12:39:12.93847	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000091	1000000023	2017-11-05 12:40:12.856897	2017-11-05 12:40:12.856897	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000092	1000000023	2017-11-05 12:41:12.938333	2017-11-05 12:41:12.938333	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000093	1000000023	2017-11-05 12:42:13.139777	2017-11-05 12:42:13.139777	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000094	1000000023	2017-11-05 12:43:13.0012	2017-11-05 12:43:13.0012	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000095	1000000023	2017-11-05 12:44:12.995632	2017-11-05 12:44:12.995632	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000096	1000000023	2017-11-05 12:45:13.032066	2017-11-05 12:45:13.032066	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000097	1000000023	2017-11-05 12:46:13.110502	2017-11-05 12:46:13.110502	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000098	1000000023	2017-11-05 12:47:13.04193	2017-11-05 12:47:13.04193	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000099	1000000023	2017-11-05 12:48:13.01036	2017-11-05 12:48:13.01036	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000100	1000000023	2017-11-05 12:49:13.368812	2017-11-05 12:49:13.368812	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000101	1000000023	2017-11-05 12:50:13.054226	2017-11-05 12:50:13.054226	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000102	1000000023	2017-11-05 12:51:13.063658	2017-11-05 12:51:13.063658	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000103	1000000023	2017-11-05 12:52:13.140095	2017-11-05 12:52:13.140095	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000104	1000000023	2017-11-05 12:53:13.230532	2017-11-05 12:53:13.230532	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000105	1000000023	2017-11-05 12:54:13.204962	2017-11-05 12:54:13.204962	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000106	1000000023	2017-11-05 12:55:13.232395	2017-11-05 12:55:13.232395	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000107	1000000023	2017-11-05 12:56:13.221826	2017-11-05 12:56:13.221826	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000108	1000000023	2017-11-05 12:57:13.301263	2017-11-05 12:57:13.301263	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000109	1000000023	2017-11-05 12:58:13.231691	2017-11-05 12:58:13.231691	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000110	1000000023	2017-11-05 12:59:13.261124	2017-11-05 12:59:13.261124	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000111	1000000023	2017-11-05 13:00:13.386563	2017-11-05 13:00:13.386563	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000112	1000000023	2017-11-05 13:01:13.331992	2017-11-05 13:01:13.331992	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000113	1000000023	2017-11-05 13:02:13.250419	2017-11-05 13:02:13.250419	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000114	1000000023	2017-11-05 13:03:13.448862	2017-11-05 13:03:13.448862	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000115	1000000023	2017-11-05 13:04:13.427293	2017-11-05 13:04:13.427293	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000116	1000000023	2017-11-05 13:05:13.376722	2017-11-05 13:05:13.376722	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000117	1000000023	2017-11-05 13:06:13.470159	2017-11-05 13:06:13.470159	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000118	1000000023	2017-11-05 13:07:13.376585	2017-11-05 13:07:13.376585	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000119	1000000023	2017-11-05 13:08:13.465022	2017-11-05 13:08:13.465022	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000120	1000000023	2017-11-05 13:09:13.499456	2017-11-05 13:09:13.499456	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000121	1000000023	2017-11-05 13:10:13.591893	2017-11-05 13:10:13.591893	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000122	1000000023	2017-11-05 13:11:13.534321	2017-11-05 13:11:13.534321	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000123	1000000023	2017-11-05 13:12:13.461749	2017-11-05 13:12:13.461749	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000124	1000000023	2017-11-05 13:13:13.605189	2017-11-05 13:13:13.605189	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000125	1000000023	2017-11-05 13:14:13.683625	2017-11-05 13:14:13.683625	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000126	1000000023	2017-11-05 13:15:13.656056	2017-11-05 13:15:13.656056	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000127	1000000023	2017-11-05 13:16:13.557482	2017-11-05 13:16:13.557482	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000128	1000000023	2017-11-05 13:17:13.702922	2017-11-05 13:17:13.702922	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000129	1000000023	2017-11-05 13:18:13.669352	2017-11-05 13:18:13.669352	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000130	1000000023	2017-11-05 13:19:13.670784	2017-11-05 13:19:13.670784	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000131	1000000023	2017-11-05 13:20:13.766221	2017-11-05 13:20:13.766221	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000132	1000000023	2017-11-05 13:21:13.675648	2017-11-05 13:21:13.675648	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000133	1000000023	2017-11-05 13:22:13.762084	2017-11-05 13:22:13.762084	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000134	1000000023	2017-11-05 13:23:13.819519	2017-11-05 13:23:13.819519	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000135	1000000023	2017-11-05 13:24:13.722946	2017-11-05 13:24:13.722946	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000136	1000000023	2017-11-05 13:25:13.77438	2017-11-05 13:25:13.77438	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000137	1000000023	2017-11-05 13:26:13.803814	2017-11-05 13:26:13.803814	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000138	1000000023	2017-11-05 13:27:13.789245	2017-11-05 13:27:13.789245	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000139	1000000023	2017-11-05 13:28:13.84768	2017-11-05 13:28:13.84768	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000140	1000000023	2017-11-05 17:16:27.265217	2017-11-05 17:16:27.265217	null	null	null	null	null	null	null
1000000141	1000000023	2017-11-05 17:16:32.580521	2017-11-05 17:16:32.580521	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000142	1000000023	2017-11-05 17:17:32.463946	2017-11-05 17:17:32.463946	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000143	1000000023	2017-11-05 17:18:32.407375	2017-11-05 17:18:32.407375	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000144	1000000023	2017-11-05 17:19:32.619818	2017-11-05 17:19:32.619818	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000145	1000000023	2017-11-05 17:20:32.733257	2017-11-05 17:20:32.733257	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000146	1000000023	2017-11-05 17:21:32.668685	2017-11-05 17:21:32.668685	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000147	1000000023	2017-11-05 17:22:32.796124	2017-11-05 17:22:32.796124	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000148	1000000023	2017-11-05 17:23:32.769554	2017-11-05 17:23:32.769554	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000149	1000000023	2017-11-05 17:24:32.931995	2017-11-05 17:24:32.931995	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000150	1000000023	2017-11-05 17:25:32.869424	2017-11-05 17:25:32.869424	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000151	1000000023	2017-11-05 17:26:33.090868	2017-11-05 17:26:33.090868	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000152	1000000023	2017-11-05 17:27:32.957292	2017-11-05 17:27:32.957292	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000153	1000000023	2017-11-05 17:28:32.838717	2017-11-05 17:28:32.838717	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000154	1000000023	2017-11-05 17:29:32.839149	2017-11-05 17:29:32.839149	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000155	1000000023	2017-11-05 17:30:32.889584	2017-11-05 17:30:32.889584	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000156	1000000023	2017-11-05 17:31:32.910017	2017-11-05 17:31:32.910017	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000157	1000000023	2017-11-05 17:32:33.076458	2017-11-05 17:32:33.076458	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000158	1000000023	2017-11-05 17:33:33.022887	2017-11-05 17:33:33.022887	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000159	1000000023	2017-11-05 17:34:32.973316	2017-11-05 17:34:32.973316	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000160	1000000023	2017-11-05 17:35:32.973748	2017-11-05 17:35:32.973748	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000161	1000000023	2017-11-05 17:36:32.944178	2017-11-05 17:36:32.944178	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000162	1000000023	2017-11-05 17:37:32.938609	2017-11-05 17:37:32.938609	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000163	1000000023	2017-11-05 17:38:33.079049	2017-11-05 17:38:33.079049	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000164	1000000023	2017-11-05 17:39:32.979475	2017-11-05 17:39:32.979475	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000165	1000000023	2017-11-05 17:40:33.249922	2017-11-05 17:40:33.249922	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000166	1000000023	2017-11-05 17:41:33.366361	2017-11-05 17:41:33.366361	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000167	1000000023	2017-11-05 17:42:33.156781	2017-11-05 17:42:33.156781	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000168	1000000023	2017-11-05 17:43:33.932257	2017-11-05 17:43:33.932257	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000169	1000000023	2017-11-05 17:44:33.162645	2017-11-05 17:44:33.162645	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000170	1000000023	2017-11-05 17:45:33.124074	2017-11-05 17:45:33.124074	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000171	1000000023	2017-11-05 17:46:33.446524	2017-11-05 17:46:33.446524	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000172	1000000023	2017-11-05 17:47:33.301948	2017-11-05 17:47:33.301948	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000173	1000000023	2017-11-05 17:48:33.435387	2017-11-05 17:48:33.435387	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000174	1000000023	2017-11-05 17:49:33.349814	2017-11-05 17:49:33.349814	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000175	1000000023	2017-11-05 17:50:33.571259	2017-11-05 17:50:33.571259	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000176	1000000023	2017-11-05 17:51:33.329677	2017-11-05 17:51:33.329677	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000177	1000000023	2017-11-05 17:52:33.598124	2017-11-05 17:52:33.598124	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000178	1000000023	2017-11-05 17:54:08.055527	2017-11-05 17:54:08.055527	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000179	1000000023	2017-11-05 17:55:08.119962	2017-11-05 17:55:08.119962	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000180	1000000023	2017-11-05 17:56:08.100393	2017-11-05 17:56:08.100393	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000181	1000000023	2017-11-05 17:57:08.324837	2017-11-05 17:57:08.324837	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000182	1000000023	2017-11-05 17:58:08.193262	2017-11-05 17:58:08.193262	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000183	1000000023	2017-11-05 17:59:08.13969	2017-11-05 17:59:08.13969	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000184	1000000023	2017-11-05 18:00:08.27713	2017-11-05 18:00:08.27713	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000185	1000000023	2017-11-05 18:01:08.315564	2017-11-05 18:01:08.315564	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000186	1000000023	2017-11-05 18:02:08.264993	2017-11-05 18:02:08.264993	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000187	1000000023	2017-11-05 18:03:08.202421	2017-11-05 18:03:08.202421	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000188	1000000023	2017-11-05 18:04:08.244855	2017-11-05 18:04:08.244855	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000189	1000000023	2017-11-05 18:05:08.420297	2017-11-05 18:05:08.420297	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000190	1000000023	2017-11-05 18:06:08.650742	2017-11-05 18:06:08.650742	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000191	1000000023	2017-11-05 18:07:08.283153	2017-11-05 18:07:08.283153	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000192	1000000023	2017-11-05 18:08:08.309586	2017-11-05 18:08:08.309586	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000193	1000000023	2017-11-05 18:09:08.468027	2017-11-05 18:09:08.468027	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000194	1000000023	2017-11-05 18:10:08.434457	2017-11-05 18:10:08.434457	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000195	1000000023	2017-11-05 18:11:08.578897	2017-11-05 18:11:08.578897	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000196	1000000023	2017-11-05 18:12:08.59633	2017-11-05 18:12:08.59633	GR	Greece	Agioi Anargyroi-Kamatero	West Athens	Attica	Agion Anargiron 36	135 61
1000000197	1000000020	2017-11-26 21:53:43.589013	2017-11-26 21:53:43.589013	null	null	null	null	null	null	null
1000000198	1000000020	2017-11-26 22:00:20.444712	2017-11-26 22:00:20.444712	null	null	null	null	null	null	null
1000000199	1000000020	2017-11-26 22:01:20.21713	2017-11-26 22:01:20.21713	null	null	null	null	null	null	null
1000000200	1000000020	2017-11-26 22:02:20.100556	2017-11-26 22:02:20.100556	null	null	null	null	null	null	null
1000000201	1000000020	2017-11-26 22:03:20.453008	2017-11-26 22:03:20.453008	null	null	null	null	null	null	null
1000000202	1000000020	2017-11-26 22:04:20.262428	2017-11-26 22:04:20.262428	null	null	null	null	null	null	null
1000000203	1000000020	2017-11-26 22:05:20.174855	2017-11-26 22:05:20.174855	null	null	null	null	null	null	null
1000000204	1000000020	2017-11-26 22:06:20.214289	2017-11-26 22:06:20.214289	null	null	null	null	null	null	null
1000000205	1000000020	2017-11-26 22:07:20.18772	2017-11-26 22:07:20.18772	null	null	null	null	null	null	null
1000000206	1000000020	2017-11-26 22:08:20.328159	2017-11-26 22:08:20.328159	null	null	null	null	null	null	null
1000000207	1000000020	2017-11-26 22:09:20.346592	2017-11-26 22:09:20.346592	null	null	null	null	null	null	null
1000000208	1000000020	2017-11-26 22:10:20.410028	2017-11-26 22:10:20.410028	null	null	null	null	null	null	null
1000000209	1000000020	2017-11-26 22:11:44.006809	2017-11-26 22:11:44.006809	null	null	null	null	null	null	null
1000000210	1000000020	2017-11-26 22:12:43.685223	2017-11-26 22:12:43.685223	null	null	null	null	null	null	null
1000000211	1000000020	2017-11-26 22:13:43.474642	2017-11-26 22:13:43.474642	null	null	null	null	null	null	null
1000000212	1000000020	2017-11-26 22:14:43.421071	2017-11-26 22:14:43.421071	null	null	null	null	null	null	null
1000000213	1000000020	2017-11-26 22:15:43.455505	2017-11-26 22:15:43.455505	null	null	null	null	null	null	null
1000000214	1000000020	2017-11-26 22:16:43.458937	2017-11-26 22:16:43.458937	null	null	null	null	null	null	null
1000000215	1000000020	2017-11-26 22:17:43.443368	2017-11-26 22:17:43.443368	null	null	null	null	null	null	null
1000000216	1000000020	2017-11-26 22:18:43.599808	2017-11-26 22:18:43.599808	null	null	null	null	null	null	null
1000000217	1000000020	2017-11-26 22:19:43.59724	2017-11-26 22:19:43.59724	null	null	null	null	null	null	null
1000000218	1000000020	2017-11-26 22:20:43.443663	2017-11-26 22:20:43.443663	null	null	null	null	null	null	null
1000000219	1000000020	2017-11-26 22:21:43.984126	2017-11-26 22:21:43.984126	null	null	null	null	null	null	null
1000000220	1000000020	2017-11-26 22:22:43.576534	2017-11-26 22:22:43.576534	null	null	null	null	null	null	null
1000000221	1000000020	2017-11-26 22:23:43.533964	2017-11-26 22:23:43.533964	null	null	null	null	null	null	null
1000000222	1000000020	2017-11-26 22:24:43.645402	2017-11-26 22:24:43.645402	null	null	null	null	null	null	null
1000000223	1000000020	2017-11-26 22:25:43.74884	2017-11-26 22:25:43.74884	null	null	null	null	null	null	null
1000000224	1000000020	2017-11-26 22:26:43.857278	2017-11-26 22:26:43.857278	null	null	null	null	null	null	null
1000000225	1000000020	2017-11-26 22:27:43.561693	2017-11-26 22:27:43.561693	null	null	null	null	null	null	null
1000000226	1000000020	2017-11-26 22:28:43.720133	2017-11-26 22:28:43.720133	null	null	null	null	null	null	null
1000000227	1000000020	2017-11-26 22:29:43.682563	2017-11-26 22:29:43.682563	null	null	null	null	null	null	null
1000000228	1000000020	2017-11-26 22:30:43.695996	2017-11-26 22:30:43.695996	null	null	null	null	null	null	null
1000000229	1000000020	2017-11-26 22:31:43.874438	2017-11-26 22:31:43.874438	null	null	null	null	null	null	null
1000000230	1000000020	2017-11-26 22:32:43.808866	2017-11-26 22:32:43.808866	null	null	null	null	null	null	null
1000000231	1000000020	2017-11-26 22:33:44.191319	2017-11-26 22:33:44.191319	null	null	null	null	null	null	null
1000000232	1000000020	2017-11-26 22:34:43.81373	2017-11-26 22:34:43.81373	null	null	null	null	null	null	null
1000000233	1000000020	2017-11-26 22:35:44.534203	2017-11-26 22:35:44.534203	null	null	null	null	null	null	null
1000000234	1000000020	2017-11-26 22:36:44.071608	2017-11-26 22:36:44.071608	null	null	null	null	null	null	null
1000000235	1000000020	2017-11-26 22:37:44.08004	2017-11-26 22:37:44.08004	null	null	null	null	null	null	null
1000000236	1000000020	2017-11-27 02:54:11.31414	2017-11-27 02:54:11.31414	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000237	1000000020	2017-11-27 02:55:11.390576	2017-11-27 02:55:11.390576	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000238	1000000020	2017-11-27 02:56:11.357006	2017-11-27 02:56:11.357006	GR	Greece	Chalandri	North Athens	Attica	Kosta Varnali 35A	152 33
1000000239	1000000020	2017-11-27 02:57:11.300434	2017-11-27 02:57:11.300434	GR	Greece	Chalandri	North Athens	Attica	Kosta Varnali 35A	152 33
1000000240	1000000020	2017-11-27 02:58:11.352869	2017-11-27 02:58:11.352869	GR	Greece	Chalandri	North Athens	Attica	Kosta Varnali 35A	152 33
1000000241	1000000020	2017-11-27 02:59:11.327299	2017-11-27 02:59:11.327299	null	null	null	null	null	null	null
1000000242	1000000020	2017-11-27 03:00:11.434737	2017-11-27 03:00:11.434737	GR	Greece	Attica	null	Attica	Aspropyrgos	null
1000000243	1000000020	2017-11-27 17:32:43.336508	2017-11-27 17:32:43.336508	GR	Greece	Attica	null	Attica	Aspropyrgos	null
1000000244	1000000020	2017-11-27 17:34:37.943063	2017-11-27 17:34:37.943063	null	null	null	null	null	null	null
1000000245	1000000020	2017-11-27 17:35:33.276228	2017-11-27 17:35:33.276228	GR	Greece	Attica	null	Attica	Aspropyrgos	null
1000000246	1000000020	2017-11-27 17:36:33.737687	2017-11-27 17:36:33.737687	GR	Greece	Attica	null	Attica	Aspropyrgos	null
1000000247	1000000020	2017-11-27 17:37:33.353096	2017-11-27 17:37:33.353096	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000248	1000000020	2017-11-27 17:38:33.294525	2017-11-27 17:38:33.294525	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000249	1000000020	2017-11-27 17:39:33.308957	2017-11-27 17:39:33.308957	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000250	1000000020	2017-11-27 17:40:33.342391	2017-11-27 17:40:33.342391	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000251	1000000020	2017-11-27 17:41:33.567836	2017-11-27 17:41:33.567836	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000252	1000000020	2017-11-27 17:42:33.354255	2017-11-27 17:42:33.354255	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000253	1000000020	2017-11-27 17:43:33.354687	2017-11-27 17:43:33.354687	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000254	1000000020	2017-11-27 17:44:33.37912	2017-11-27 17:44:33.37912	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000255	1000000020	2017-11-27 17:45:33.432555	2017-11-27 17:45:33.432555	GR	Greece	Ilion	West Athens	Attica	Leoforos Andrea Papandreou 212	131 21
1000000256	1000000020	2017-11-29 23:31:03.031242	2017-11-29 23:31:03.031242	null	null	null	null	null	null	null
1000000257	1000000020	2017-11-29 23:32:02.983855	2017-11-29 23:32:02.983855	null	null	null	null	null	null	null
1000000258	1000000020	2017-11-29 23:33:03.012478	2017-11-29 23:33:03.012478	null	null	null	null	null	null	null
1000000259	1000000020	2017-11-29 23:33:59.047093	2017-11-29 23:33:59.047093	null	null	null	null	null	null	null
1000000260	1000000020	2017-11-29 23:35:00.536402	2017-11-29 23:35:00.536402	null	null	null	null	null	null	null
1000000261	1000000020	2017-11-29 23:36:19.068874	2017-11-29 23:36:19.068874	null	null	null	null	null	null	null
1000000262	1000000020	2017-11-29 23:36:59.060952	2017-11-29 23:36:59.060952	null	null	null	null	null	null	null
1000000263	1000000020	2017-11-29 23:39:20.306388	2017-11-29 23:39:20.306388	null	null	null	null	null	null	null
1000000264	1000000020	2017-11-29 23:41:54.184428	2017-11-29 23:41:54.184428	null	null	null	null	null	null	null
1000000265	1000000020	2017-11-29 23:42:37.833471	2017-11-29 23:42:37.833471	null	null	null	null	null	null	null
1000000266	1000000020	2017-11-29 23:43:54.286679	2017-11-29 23:43:54.286679	null	null	null	null	null	null	null
1000000267	1000000020	2017-11-29 23:44:34.923339	2017-11-29 23:44:34.923339	null	null	null	null	null	null	null
1000000268	1000000020	2017-11-29 23:47:00.129778	2017-11-29 23:47:00.129778	GR	Greece	Kalamata	Peloponnese	Peloponnisos Dytiki Ellada ke Ionio	Stadiou 4-18, Kalamata 241 00, Greece	241 00
1000000269	1000000020	2017-11-29 23:48:44.056475	2017-11-29 23:48:44.056475	GR	Greece	Kalamata	Peloponnese	Peloponnisos Dytiki Ellada ke Ionio	Athinon 34, Kalamata 241 00, Greece	241 00
1000000270	1000000020	2017-11-29 23:49:06.820866	2017-11-29 23:49:06.820866	GR	Greece	Kalamata	Peloponnese	Peloponnisos Dytiki Ellada ke Ionio	Athinon 95, Kalamata 241 00, Greece	241 00
1000000271	1000000020	2017-11-29 23:50:02.13339	2017-11-29 23:50:02.13339	GR	Greece	Kalamata	Peloponnese	Peloponnisos Dytiki Ellada ke Ionio	Athinon 95, Kalamata 241 00, Greece	241 00
1000000272	1000000020	2017-11-29 23:51:27.208693	2017-11-29 23:51:27.208693	GR	Greece	Kalamata	Peloponnese	Peloponnisos Dytiki Ellada ke Ionio	Athinon 95, Kalamata 241 00, Greece	241 00
1000000273	1000000020	2017-11-29 23:52:03.831844	2017-11-29 23:52:03.831844	GR	Greece	Kalamata	Peloponnese	Peloponnisos Dytiki Ellada ke Ionio	Athinon 95, Kalamata 241 00, Greece	241 00
1000000274	1000000020	2017-12-02 14:34:04.642786	2017-12-02 14:34:04.642786	null	null	null	null	null	null	null
1000000275	1000000020	2017-12-02 14:36:12.055466	2017-12-02 14:36:12.055466	null	null	null	null	null	null	null
1000000276	1000000020	2017-12-02 15:40:10.235853	2017-12-02 15:40:10.235853	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000277	1000000020	2017-12-02 15:41:48.452825	2017-12-02 15:41:48.452825	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000278	1000000020	2017-12-02 15:42:29.329515	2017-12-02 15:42:29.329515	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000279	1000000020	2017-12-02 15:43:08.407478	2017-12-02 15:43:08.407478	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000280	1000000020	2017-12-02 15:49:50.311013	2017-12-02 15:49:50.311013	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000281	1000000020	2017-12-02 16:32:16.864884	2017-12-02 16:32:16.864884	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000282	1000000020	2017-12-02 16:33:13.920129	2017-12-02 16:33:13.920129	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000283	1000000020	2017-12-02 16:34:46.362868	2017-12-02 16:34:46.362868	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000284	1000000020	2017-12-02 16:35:13.912867	2017-12-02 16:35:13.912867	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000285	1000000020	2017-12-02 16:36:13.933988	2017-12-02 16:36:13.933988	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000286	1000000020	2017-12-02 16:37:26.363686	2017-12-02 16:37:26.363686	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000287	1000000020	2017-12-02 16:38:13.911223	2017-12-02 16:38:13.911223	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000288	1000000020	2017-12-02 16:39:13.909342	2017-12-02 16:39:13.909342	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000289	1000000020	2017-12-02 16:40:13.97947	2017-12-02 16:40:13.97947	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000290	1000000020	2017-12-02 16:41:13.918081	2017-12-02 16:41:13.918081	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000291	1000000020	2017-12-02 16:42:53.926281	2017-12-02 16:42:53.926281	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000292	1000000020	2017-12-02 16:43:13.947323	2017-12-02 16:43:13.947323	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000293	1000000020	2017-12-02 16:44:13.957443	2017-12-02 16:44:13.957443	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000294	1000000020	2017-12-02 16:45:33.934599	2017-12-02 16:45:33.934599	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000295	1000000020	2017-12-02 16:46:13.912676	2017-12-02 16:46:13.912676	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000296	1000000020	2017-12-02 16:47:15.000433	2017-12-02 16:47:15.000433	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000297	1000000020	2017-12-02 16:48:13.96192	2017-12-02 16:48:13.96192	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000298	1000000020	2017-12-02 16:49:13.928535	2017-12-02 16:49:13.928535	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000299	1000000029	2017-12-02 16:52:15.302066	2017-12-02 16:52:15.302066	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000300	1000000029	2017-12-02 16:53:15.289684	2017-12-02 16:53:15.289684	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000301	1000000029	2017-12-02 16:54:53.648174	2017-12-02 16:54:53.648174	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000302	1000000029	2017-12-02 16:55:15.285421	2017-12-02 16:55:15.285421	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000303	1000000029	2017-12-02 16:56:15.271539	2017-12-02 16:56:15.271539	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000304	1000000029	2017-12-02 16:57:33.621988	2017-12-02 16:57:33.621988	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000305	1000000029	2017-12-02 16:58:15.278278	2017-12-02 16:58:15.278278	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000306	1000000029	2017-12-02 16:59:15.273396	2017-12-02 16:59:15.273396	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000307	1000000029	2017-12-02 17:00:15.86109	2017-12-02 17:00:15.86109	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000308	1000000029	2017-12-02 17:01:15.274634	2017-12-02 17:01:15.274634	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000309	1000000029	2017-12-02 17:02:15.279254	2017-12-02 17:02:15.279254	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000310	1000000029	2017-12-02 17:03:15.266371	2017-12-02 17:03:15.266371	BG	Bulgaria	Bansko	Bansko	Blagoevgrad Province	ul. "Tsar Simeon" 6, 2770 кв. Глазне, Bansko, Bulgaria	2770
1000000311	1000000029	2017-12-02 17:40:24.162798	2017-12-02 17:40:24.162798	null	null	null	null	null	null	null
1000000312	1000000029	2017-12-02 17:41:20.40594	2017-12-02 17:41:20.40594	null	null	null	null	null	null	null
1000000313	1000000029	2017-12-02 17:42:25.546711	2017-12-02 17:42:25.546711	null	null	null	null	null	null	null
1000000314	1000000029	2017-12-02 17:43:20.358672	2017-12-02 17:43:20.358672	null	null	null	null	null	null	null
1000000315	1000000029	2017-12-02 17:44:20.408297	2017-12-02 17:44:20.408297	null	null	null	null	null	null	null
1000000316	1000000029	2017-12-02 17:45:20.382413	2017-12-02 17:45:20.382413	null	null	null	null	null	null	null
1000000317	1000000030	2017-12-03 18:57:11.100846	2017-12-03 18:57:11.100846	null	null	null	null	null	null	null
1000000318	1000000030	2017-12-10 15:29:41.873298	2017-12-10 15:29:41.873298	null	null	null	null	null	null	null
1000000319	1000000030	2017-12-10 18:53:13.383029	2017-12-10 18:53:13.383029	null	null	null	null	null	null	null
\.


--
-- Name: i_location_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('i_location_id_seq', 1000000319, true);


--
-- Data for Name: i_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY i_user (i_user_id, i_creation_date, i_last_update_date, i_first_name, i_last_name, i_mobile_number, i_username, i_password, i_email_address, i_register_type) FROM stdin;
1000000020	2017-10-12 19:55:19.392707	2017-10-12 19:55:19.392707	Ioannis	Kozompolis	6971903121	giannis		g.kozompolis@gmail.com	\N
1000000021	2017-10-12 19:57:45.490063	2017-10-12 19:57:45.490063	Ioannis 	Kozompolis	6971903121	giannis2		g.kozompolis@gmail.com	\N
1000000022	2017-10-12 20:55:23.476849	2017-10-12 20:55:23.476849	aek	ole	6971903121	aek		giannis1990@gmail.com	\N
1000000023	2017-10-12 21:08:52.548125	2017-10-12 21:08:52.548125	giannis4			giannis4			\N
1000000024	2017-10-14 21:22:11.872753	2017-10-14 21:22:11.872753	giannis5			giannis5			\N
1000000025	2017-10-14 21:27:15.417114	2017-10-14 21:27:15.417114	giannis6			giannis6			\N
1000000026	2017-11-25 21:04:47.794319	2017-11-25 21:04:47.794319	Ioannis	Kozompolis	6971903121	giannis2669		g.kozompolis@gmail.com	\N
1000000027	2017-12-02 16:22:39.382553	2017-12-02 16:22:39.382553	Ioannnis	Kozompolis	6971903121	kozo		g.kozompolis@gmail.com	\N
1000000028	2017-12-02 16:30:33.483257	2017-12-02 16:30:33.483257				kozompolis			\N
1000000029	2017-12-02 16:52:05.125274	2017-12-02 16:52:05.125274				testuser1			\N
1000000030	2017-12-03 17:55:53.547356	2017-12-03 17:55:53.547356	John	Kozo		1127478420719730		g.kozompolis@gmail.com	\N
\.


--
-- Name: i_user_i_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('i_user_i_user_id_seq', 1000000030, true);


--
-- Name: i_work_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('i_work_id_seq', 1000000023, true);


--
-- Data for Name: i_work_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY i_work_info (i_work_id, i_user_id, i_creation_date, i_last_update_date, i_work_employer, i_work_position) FROM stdin;
1000000008	1000000020	2017-12-09 18:07:12.183065	2017-12-09 18:07:12.183065	Almasport	Sales
1000000009	1000000020	2017-12-09 18:13:25.564421	2017-12-09 18:13:25.564421	\N	\N
1000000010	1000000030	2017-12-10 14:28:51.964701	2017-12-10 14:28:51.964701	Velti	QA Engineer
1000000011	1000000030	2017-12-10 15:26:23.561616	2017-12-10 15:26:23.561616	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000012	1000000030	2017-12-10 15:31:11.868226	2017-12-10 15:31:11.868226	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000013	1000000030	2017-12-10 15:32:59.937949	2017-12-10 15:32:59.937949	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000014	1000000030	2017-12-10 15:34:53.439362	2017-12-10 15:34:53.439362	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000015	1000000030	2017-12-10 16:19:59.583499	2017-12-10 16:19:59.583499	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000016	1000000030	2017-12-10 16:21:56.754378	2017-12-10 16:21:56.754378	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000017	1000000030	2017-12-10 16:25:51.281659	2017-12-10 16:25:51.281659	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000018	1000000030	2017-12-10 18:58:47.20742	2017-12-10 18:58:47.20742	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000019	1000000030	2017-12-10 18:58:47.239924	2017-12-10 18:58:47.239924	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000020	1000000030	2017-12-10 19:03:49.897356	2017-12-10 19:03:49.897356	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000021	1000000030	2017-12-10 19:20:44.539699	2017-12-10 19:20:44.539699	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000022	1000000030	2017-12-10 19:24:38.35189	2017-12-10 19:24:38.35189	Velti S.A.	Quality Assurance Engineer (QA Engineer)
1000000023	1000000030	2017-12-10 19:27:42.773308	2017-12-10 19:27:42.773308	Velti S.A.	Quality Assurance Engineer (QA Engineer)
\.


--
-- Data for Name: sys_campaign; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sys_campaign (sys_campaign_id, sys_creation_date, sys_last_update_date, sys_campaign_type, sys_campaign_status, sys_campaign_name, sys_campaign_description, sys_flow_node_id, sys_json_data, sys_segment_id) FROM stdin;
\.


--
-- Name: sys_campaign_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sys_campaign_id_seq', 1, false);


--
-- Data for Name: sys_flow_node; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sys_flow_node (sys_flow_node_id, sys_json_flow) FROM stdin;
\.


--
-- Data for Name: sys_json_filter; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sys_json_filter (sys_json_id, sys_json) FROM stdin;
4	{"name":"Test Segment", "description": "Giannis", "country": null, "department":null, "prefecture":null, "city":null, "postal":null, "employer":null, "position":null, "school":null, "degree":null, "year":null, "books":null, "teams":null, "events":null, "music":null, "pages":null}
5	{"name":"Test Segment", "description": "", "country": null, "department":null, "prefecture":null, "city":null, "postal":null, "employer":null, "position":null, "school":null, "degree":null, "year":null, "books":null, "teams":null, "events":null, "music":null, "pages":null}
6	{"name":"Test campaign", "description": "", "country": null, "department":null, "prefecture":null, "city":null, "postal":null, "employer":null, "position":null, "school":null, "degree":null, "year":null, "books":null, "teams":null, "events":null, "music":null, "pages":null}
\.


--
-- Name: sys_json_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sys_json_id_seq', 6, true);


--
-- Data for Name: sys_query_filter; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sys_query_filter (sys_query_filter_id, sys_query_description, sys_query) FROM stdin;
\.


--
-- Name: sys_query_filter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sys_query_filter_id_seq', 1, true);


--
-- Data for Name: sys_segment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sys_segment (sys_segment_id, sys_segment_name, sys_segment_description, sys_query_filter_id, sys_json_id) FROM stdin;
8	Test campaign		\N	6
\.


--
-- Data for Name: sys_segment_client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sys_segment_client (sys_segment_client_id, sys_segment_id, i_user_id, sys_client_name, sys_client_surname, sys_client_mobile_number, sys_client_email) FROM stdin;
\.


--
-- Name: sys_segment_client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sys_segment_client_id_seq', 8, true);


--
-- Name: sys_segment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sys_segment_id_seq', 8, true);


--
-- Name: i_education_info i_education_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_education_info
    ADD CONSTRAINT i_education_info_pkey PRIMARY KEY (i_education_id);


--
-- Name: i_fb_books i_fb_books_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_books
    ADD CONSTRAINT i_fb_books_pkey PRIMARY KEY (i_fb_books_id);


--
-- Name: i_fb_events i_fb_events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_events
    ADD CONSTRAINT i_fb_events_pkey PRIMARY KEY (i_fb_events_id);


--
-- Name: i_fb_favorite_teams i_fb_favorite_team_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_favorite_teams
    ADD CONSTRAINT i_fb_favorite_team_pkey PRIMARY KEY (i_fb_favorite_teams_id);


--
-- Name: i_fb_music i_fb_music_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_music
    ADD CONSTRAINT i_fb_music_pkey PRIMARY KEY (i_fb_music_id);


--
-- Name: i_interest_fb_pages i_interest_pages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_interest_fb_pages
    ADD CONSTRAINT i_interest_pages_pkey PRIMARY KEY (i_interest_pages_id);


--
-- Name: i_location i_location_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_location
    ADD CONSTRAINT i_location_pkey PRIMARY KEY (i_location_id);


--
-- Name: i_user i_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_user
    ADD CONSTRAINT i_user_pkey PRIMARY KEY (i_user_id);


--
-- Name: i_work_info i_work_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_work_info
    ADD CONSTRAINT i_work_info_pkey PRIMARY KEY (i_work_id);


--
-- Name: sys_campaign sys_campaign_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sys_campaign
    ADD CONSTRAINT sys_campaign_pkey PRIMARY KEY (sys_campaign_id);


--
-- Name: sys_flow_node sys_flow_node_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sys_flow_node
    ADD CONSTRAINT sys_flow_node_pkey PRIMARY KEY (sys_flow_node_id);


--
-- Name: sys_json_filter sys_json_filter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sys_json_filter
    ADD CONSTRAINT sys_json_filter_pkey PRIMARY KEY (sys_json_id);


--
-- Name: sys_query_filter sys_query_filter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sys_query_filter
    ADD CONSTRAINT sys_query_filter_pkey PRIMARY KEY (sys_query_filter_id);


--
-- Name: sys_segment_client sys_segment_client_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sys_segment_client
    ADD CONSTRAINT sys_segment_client_pkey PRIMARY KEY (sys_segment_client_id);


--
-- Name: sys_segment sys_segment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sys_segment
    ADD CONSTRAINT sys_segment_pkey PRIMARY KEY (sys_segment_id);


--
-- Name: fki_E; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_E" ON i_education_info USING btree (i_user_id);


--
-- Name: fki_F; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_F" ON i_interest_fb_pages USING btree (i_user_id);


--
-- Name: fki_G; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_G" ON i_fb_events USING btree (i_user_id);


--
-- Name: fki_H; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_H" ON i_fb_events USING btree (i_user_id);


--
-- Name: fki_I; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_I" ON i_fb_events USING btree (i_user_id);


--
-- Name: fki_J; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_J" ON i_fb_favorite_teams USING btree (i_user_id);


--
-- Name: fki_i_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_i_user_id ON i_work_info USING btree (i_user_id);


--
-- Name: fki_i_user_id_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_i_user_id_fkey ON sys_segment_client USING btree (i_user_id);


--
-- Name: fki_sys_flow_node_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_sys_flow_node_fkey ON sys_campaign USING btree (sys_flow_node_id);


--
-- Name: fki_sys_query_filter_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_sys_query_filter_fkey ON sys_segment USING btree (sys_query_filter_id);


--
-- Name: fki_sys_segement_id_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_sys_segement_id_fkey ON sys_segment_client USING btree (sys_segment_id);


--
-- Name: fki_sys_segment_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_sys_segment_fkey ON sys_campaign USING btree (sys_segment_id);


--
-- Name: i_education_info Update_Data; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "Update_Data" BEFORE UPDATE ON i_education_info FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- Name: i_interest_fb_pages Update_Data; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "Update_Data" BEFORE UPDATE ON i_interest_fb_pages FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- Name: i_fb_events Update_Data; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "Update_Data" BEFORE UPDATE ON i_fb_events FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- Name: i_fb_books Update_Data; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "Update_Data" BEFORE UPDATE ON i_fb_books FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- Name: i_fb_music Update_Data; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "Update_Data" BEFORE UPDATE ON i_fb_music FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- Name: i_fb_favorite_teams Update_Data; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "Update_Data" BEFORE UPDATE ON i_fb_favorite_teams FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- Name: i_location Update_last_update_date; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "Update_last_update_date" BEFORE UPDATE ON i_location FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- Name: i_user set_timestamp; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER set_timestamp BEFORE UPDATE ON i_user FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- Name: i_work_info set_timestamp; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER set_timestamp BEFORE UPDATE ON i_work_info FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- Name: i_location User ID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_location
    ADD CONSTRAINT "User ID" FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id);


--
-- Name: i_education_info User_id_in_education_info; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_education_info
    ADD CONSTRAINT "User_id_in_education_info" FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: i_fb_books User_id_in_i_fb_books; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_books
    ADD CONSTRAINT "User_id_in_i_fb_books" FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- Name: i_fb_events User_id_in_i_fb_events; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_events
    ADD CONSTRAINT "User_id_in_i_fb_events" FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- Name: i_fb_favorite_teams User_id_in_i_fb_favorite_teams; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_favorite_teams
    ADD CONSTRAINT "User_id_in_i_fb_favorite_teams" FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- Name: i_fb_music User_id_in_i_fb_music; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_music
    ADD CONSTRAINT "User_id_in_i_fb_music" FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- Name: i_interest_fb_pages User_id_in_interest_pages; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_interest_fb_pages
    ADD CONSTRAINT "User_id_in_interest_pages" FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sys_campaign fkaogilpg50r1bfyh8j0tcq3cwg; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sys_campaign
    ADD CONSTRAINT fkaogilpg50r1bfyh8j0tcq3cwg FOREIGN KEY (sys_flow_node_id) REFERENCES sys_flow_node(sys_flow_node_id);


--
-- Name: i_education_info fkck4ugidmocgo1ugp68cqndwgc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_education_info
    ADD CONSTRAINT fkck4ugidmocgo1ugp68cqndwgc FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id);


--
-- Name: i_work_info fkcoqbcg27jlgcyjfnh4n65uehx; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_work_info
    ADD CONSTRAINT fkcoqbcg27jlgcyjfnh4n65uehx FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id);


--
-- Name: i_location fkg0rrrwit513pw13pr3n3o2u4e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_location
    ADD CONSTRAINT fkg0rrrwit513pw13pr3n3o2u4e FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id);


--
-- Name: i_work_info i_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_work_info
    ADD CONSTRAINT i_user_id FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: i_education_info i_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_education_info
    ADD CONSTRAINT i_user_id FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: i_interest_fb_pages i_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_interest_fb_pages
    ADD CONSTRAINT i_user_id FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- Name: i_fb_events i_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_events
    ADD CONSTRAINT i_user_id FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- Name: i_fb_books i_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_books
    ADD CONSTRAINT i_user_id FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- Name: i_fb_music i_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_music
    ADD CONSTRAINT i_user_id FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- Name: i_fb_favorite_teams i_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY i_fb_favorite_teams
    ADD CONSTRAINT i_user_id FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sys_segment_client i_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sys_segment_client
    ADD CONSTRAINT i_user_id_fkey FOREIGN KEY (i_user_id) REFERENCES i_user(i_user_id);


--
-- Name: CONSTRAINT i_user_id_fkey ON sys_segment_client; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT i_user_id_fkey ON sys_segment_client IS 'Define foreign key from i_user table';


--
-- Name: sys_campaign sys_flow_node_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sys_campaign
    ADD CONSTRAINT sys_flow_node_fkey FOREIGN KEY (sys_flow_node_id) REFERENCES sys_flow_node(sys_flow_node_id);


--
-- Name: sys_segment sys_query_filter_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sys_segment
    ADD CONSTRAINT sys_query_filter_fkey FOREIGN KEY (sys_query_filter_id) REFERENCES sys_query_filter(sys_query_filter_id);


--
-- Name: CONSTRAINT sys_query_filter_fkey ON sys_segment; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT sys_query_filter_fkey ON sys_segment IS 'Define foreign key from sys_query_filter table';


--
-- Name: sys_segment_client sys_segement_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sys_segment_client
    ADD CONSTRAINT sys_segement_id_fkey FOREIGN KEY (sys_segment_id) REFERENCES sys_segment(sys_segment_id);


--
-- Name: CONSTRAINT sys_segement_id_fkey ON sys_segment_client; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT sys_segement_id_fkey ON sys_segment_client IS 'Define foreign key from sys_segment table';


--
-- Name: sys_campaign sys_segment_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sys_campaign
    ADD CONSTRAINT sys_segment_fkey FOREIGN KEY (sys_segment_id) REFERENCES sys_segment(sys_segment_id);


--
-- PostgreSQL database dump complete
--

