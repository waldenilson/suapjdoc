--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.2
-- Dumped by pg_dump version 9.5.2

-- Started on 2016-11-22 16:36:11

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12355)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2194 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 148154)
-- Name: auth_group; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE auth_group OWNER TO admin;

--
-- TOC entry 182 (class 1259 OID 148157)
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO admin;

--
-- TOC entry 2195 (class 0 OID 0)
-- Dependencies: 182
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- TOC entry 183 (class 1259 OID 148159)
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO admin;

--
-- TOC entry 184 (class 1259 OID 148162)
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO admin;

--
-- TOC entry 2196 (class 0 OID 0)
-- Dependencies: 184
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- TOC entry 185 (class 1259 OID 148164)
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO admin;

--
-- TOC entry 186 (class 1259 OID 148167)
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO admin;

--
-- TOC entry 2197 (class 0 OID 0)
-- Dependencies: 186
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- TOC entry 187 (class 1259 OID 148169)
-- Name: auth_user; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE auth_user (
    password character varying(128) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(75) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    id integer NOT NULL
);


ALTER TABLE auth_user OWNER TO admin;

--
-- TOC entry 188 (class 1259 OID 148172)
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE auth_user_groups OWNER TO admin;

--
-- TOC entry 189 (class 1259 OID 148175)
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_groups_id_seq OWNER TO admin;

--
-- TOC entry 2198 (class 0 OID 0)
-- Dependencies: 189
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- TOC entry 190 (class 1259 OID 148177)
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_id_seq OWNER TO admin;

--
-- TOC entry 2199 (class 0 OID 0)
-- Dependencies: 190
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- TOC entry 191 (class 1259 OID 148179)
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_user_user_permissions OWNER TO admin;

--
-- TOC entry 192 (class 1259 OID 148182)
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_user_permissions_id_seq OWNER TO admin;

--
-- TOC entry 2200 (class 0 OID 0)
-- Dependencies: 192
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- TOC entry 194 (class 1259 OID 148248)
-- Name: documento; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE documento (
    id integer NOT NULL,
    numero integer,
    ano integer,
    setor character varying(80),
    remetente character varying(80),
    instituicao_destinatario character varying(80),
    destinatario character varying(80),
    signatario character varying(80),
    cargo_signatario character varying(80),
    data_documento date,
    assunto character varying(80),
    mensagem text,
    auth_user_id integer,
    data_cadastro timestamp with time zone,
    tipo character varying(80)
);


ALTER TABLE documento OWNER TO admin;

--
-- TOC entry 193 (class 1259 OID 148246)
-- Name: documento_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE documento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE documento_id_seq OWNER TO admin;

--
-- TOC entry 2201 (class 0 OID 0)
-- Dependencies: 193
-- Name: documento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE documento_id_seq OWNED BY documento.id;


--
-- TOC entry 2018 (class 2604 OID 148184)
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- TOC entry 2019 (class 2604 OID 148185)
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 2020 (class 2604 OID 148186)
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- TOC entry 2021 (class 2604 OID 148187)
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- TOC entry 2022 (class 2604 OID 148188)
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- TOC entry 2023 (class 2604 OID 148189)
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- TOC entry 2024 (class 2604 OID 148251)
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY documento ALTER COLUMN id SET DEFAULT nextval('documento_id_seq'::regclass);


--
-- TOC entry 2173 (class 0 OID 148154)
-- Dependencies: 181
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO auth_group (id, name) VALUES (1, 'Super');
INSERT INTO auth_group (id, name) VALUES (2, 'Administrador');
INSERT INTO auth_group (id, name) VALUES (13, 'Operador');


--
-- TOC entry 2202 (class 0 OID 0)
-- Dependencies: 182
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('auth_group_id_seq', 15, true);


--
-- TOC entry 2175 (class 0 OID 148159)
-- Dependencies: 183
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- TOC entry 2203 (class 0 OID 0)
-- Dependencies: 184
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 146, true);


--
-- TOC entry 2177 (class 0 OID 148164)
-- Dependencies: 185
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- TOC entry 2204 (class 0 OID 0)
-- Dependencies: 186
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('auth_permission_id_seq', 107, true);


--
-- TOC entry 2179 (class 0 OID 148169)
-- Dependencies: 187
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- TOC entry 2180 (class 0 OID 148172)
-- Dependencies: 188
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- TOC entry 2205 (class 0 OID 0)
-- Dependencies: 189
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 184, true);


--
-- TOC entry 2206 (class 0 OID 0)
-- Dependencies: 190
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('auth_user_id_seq', 76, true);


--
-- TOC entry 2183 (class 0 OID 148179)
-- Dependencies: 191
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- TOC entry 2207 (class 0 OID 0)
-- Dependencies: 192
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- TOC entry 2186 (class 0 OID 148248)
-- Dependencies: 194
-- Data for Name: documento; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- TOC entry 2208 (class 0 OID 0)
-- Dependencies: 193
-- Name: documento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('documento_id_seq', 1, false);


--
-- TOC entry 2026 (class 2606 OID 148191)
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 2033 (class 2606 OID 148193)
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2029 (class 2606 OID 148195)
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 2036 (class 2606 OID 148197)
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2044 (class 2606 OID 148199)
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 2038 (class 2606 OID 148201)
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- TOC entry 2048 (class 2606 OID 148203)
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2040 (class 2606 OID 148205)
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- TOC entry 2051 (class 2606 OID 148256)
-- Name: pk_documento; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY documento
    ADD CONSTRAINT pk_documento PRIMARY KEY (id);


--
-- TOC entry 2027 (class 1259 OID 148206)
-- Name: auth_group_name_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_group_name_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- TOC entry 2030 (class 1259 OID 148207)
-- Name: auth_group_permissions_group_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_group_permissions_group_id ON auth_group_permissions USING btree (group_id);


--
-- TOC entry 2031 (class 1259 OID 148208)
-- Name: auth_group_permissions_permission_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_group_permissions_permission_id ON auth_group_permissions USING btree (permission_id);


--
-- TOC entry 2034 (class 1259 OID 148209)
-- Name: auth_permission_content_type_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_permission_content_type_id ON auth_permission USING btree (content_type_id);


--
-- TOC entry 2042 (class 1259 OID 148210)
-- Name: auth_user_groups_group_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_user_groups_group_id ON auth_user_groups USING btree (group_id);


--
-- TOC entry 2045 (class 1259 OID 148211)
-- Name: auth_user_groups_user_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_user_groups_user_id ON auth_user_groups USING btree (user_id);


--
-- TOC entry 2046 (class 1259 OID 148213)
-- Name: auth_user_user_permissions_permission_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_user_user_permissions_permission_id ON auth_user_user_permissions USING btree (permission_id);


--
-- TOC entry 2049 (class 1259 OID 148214)
-- Name: auth_user_user_permissions_user_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_user_user_permissions_user_id ON auth_user_user_permissions USING btree (user_id);


--
-- TOC entry 2041 (class 1259 OID 148215)
-- Name: auth_user_username_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_user_username_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- TOC entry 2052 (class 2606 OID 148216)
-- Name: auth_group_permissions_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_fkey FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2054 (class 2606 OID 148221)
-- Name: auth_user_groups_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_fkey FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2055 (class 2606 OID 148226)
-- Name: auth_user_groups_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2056 (class 2606 OID 148231)
-- Name: auth_user_user_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2057 (class 2606 OID 148236)
-- Name: auth_user_user_permissions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2058 (class 2606 OID 148257)
-- Name: fk_documento_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY documento
    ADD CONSTRAINT fk_documento_auth_user FOREIGN KEY (auth_user_id) REFERENCES auth_user(id);


--
-- TOC entry 2053 (class 2606 OID 148241)
-- Name: permission_id_refs_id_6ba0f519; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT permission_id_refs_id_6ba0f519 FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2193 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2016-11-22 16:36:11

--
-- PostgreSQL database dump complete
--

