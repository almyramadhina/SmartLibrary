--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2
-- Dumped by pg_dump version 12.2

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
-- Name: buku; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.buku (
    id_buku integer NOT NULL,
    judul character(50)[] NOT NULL,
    author character(50)[] NOT NULL,
    lokasi character(5)[] NOT NULL,
    jml_total integer NOT NULL,
    jml_pinjam integer NOT NULL,
    jml_avail integer NOT NULL
);


ALTER TABLE public.buku OWNER TO postgres;

--
-- Name: mahasiswa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mahasiswa (
    nim integer NOT NULL,
    nama character(50)[] NOT NULL,
    fakultas character(5)[] NOT NULL,
    prodi character(20)[] NOT NULL,
    angkatan integer NOT NULL,
    status_aktif boolean NOT NULL
);


ALTER TABLE public.mahasiswa OWNER TO postgres;

--
-- Name: transaksi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transaksi (
    id_transaksi integer NOT NULL,
    nim integer,
    id_anggota integer,
    tgl_pinjam date NOT NULL,
    tgl_kembali date NOT NULL,
    denda integer,
    status_pinjam boolean NOT NULL,
    id_buku integer
);


ALTER TABLE public.transaksi OWNER TO postgres;

--
-- Name: umum; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.umum (
    id_anggota integer NOT NULL,
    nama character(50)[] NOT NULL,
    alamat character(300)[] NOT NULL,
    no_hp character(13)[] NOT NULL,
    email character(20)[] NOT NULL,
    pekerjaan character(20)[]
);


ALTER TABLE public.umum OWNER TO postgres;

--
-- Data for Name: buku; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.buku (id_buku, judul, author, lokasi, jml_total, jml_pinjam, jml_avail) FROM stdin;
\.


--
-- Data for Name: mahasiswa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mahasiswa (nim, nama, fakultas, prodi, angkatan, status_aktif) FROM stdin;
\.


--
-- Data for Name: transaksi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transaksi (id_transaksi, nim, id_anggota, tgl_pinjam, tgl_kembali, denda, status_pinjam, id_buku) FROM stdin;
\.


--
-- Data for Name: umum; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.umum (id_anggota, nama, alamat, no_hp, email, pekerjaan) FROM stdin;
\.


--
-- Name: buku buku_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.buku
    ADD CONSTRAINT buku_pkey PRIMARY KEY (id_buku);


--
-- Name: mahasiswa mahasiswa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mahasiswa
    ADD CONSTRAINT mahasiswa_pkey PRIMARY KEY (nim);


--
-- Name: transaksi transaksi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaksi
    ADD CONSTRAINT transaksi_pkey PRIMARY KEY (id_transaksi);


--
-- Name: umum umum_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.umum
    ADD CONSTRAINT umum_pkey PRIMARY KEY (id_anggota);


--
-- Name: transaksi id_anggota; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaksi
    ADD CONSTRAINT id_anggota FOREIGN KEY (id_anggota) REFERENCES public.umum(id_anggota) NOT VALID;


--
-- Name: transaksi id_buku; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaksi
    ADD CONSTRAINT id_buku FOREIGN KEY (id_buku) REFERENCES public.buku(id_buku) NOT VALID;


--
-- Name: transaksi nim; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaksi
    ADD CONSTRAINT nim FOREIGN KEY (nim) REFERENCES public.mahasiswa(nim) NOT VALID;


--
-- PostgreSQL database dump complete
--

