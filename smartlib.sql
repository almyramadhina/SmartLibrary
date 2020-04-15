PGDMP     *    )                x            SmartLibrary    12.2    12.2                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16393    SmartLibrary    DATABASE     �   CREATE DATABASE "SmartLibrary" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_Indonesia.1252' LC_CTYPE = 'English_Indonesia.1252';
    DROP DATABASE "SmartLibrary";
                postgres    false            �            1259    16394    buku    TABLE     	  CREATE TABLE public.buku (
    id_buku integer NOT NULL,
    judul character(50)[] NOT NULL,
    author character(50)[] NOT NULL,
    lokasi character(5)[] NOT NULL,
    jml_total integer NOT NULL,
    jml_pinjam integer NOT NULL,
    jml_avail integer NOT NULL
);
    DROP TABLE public.buku;
       public         heap    postgres    false            �            1259    16402 	   mahasiswa    TABLE     �   CREATE TABLE public.mahasiswa (
    nim integer NOT NULL,
    nama character(50)[] NOT NULL,
    fakultas character(5)[] NOT NULL,
    prodi character(20)[] NOT NULL,
    angkatan integer NOT NULL,
    status_aktif boolean NOT NULL
);
    DROP TABLE public.mahasiswa;
       public         heap    postgres    false            �            1259    16418 	   transaksi    TABLE     �   CREATE TABLE public.transaksi (
    id_transaksi integer NOT NULL,
    nim integer,
    id_anggota integer,
    tgl_pinjam date NOT NULL,
    tgl_kembali date NOT NULL,
    denda integer,
    status_pinjam boolean NOT NULL,
    id_buku integer
);
    DROP TABLE public.transaksi;
       public         heap    postgres    false            �            1259    16410    umum    TABLE     �   CREATE TABLE public.umum (
    id_anggota integer NOT NULL,
    nama character(50)[] NOT NULL,
    alamat character(300)[] NOT NULL,
    no_hp character(13)[] NOT NULL,
    email character(20)[] NOT NULL,
    pekerjaan character(20)[]
);
    DROP TABLE public.umum;
       public         heap    postgres    false                      0    16394    buku 
   TABLE DATA                 public          postgres    false    202   �                 0    16402 	   mahasiswa 
   TABLE DATA                 public          postgres    false    203   �                 0    16418 	   transaksi 
   TABLE DATA                 public          postgres    false    205                    0    16410    umum 
   TABLE DATA                 public          postgres    false    204          �
           2606    16401    buku buku_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.buku
    ADD CONSTRAINT buku_pkey PRIMARY KEY (id_buku);
 8   ALTER TABLE ONLY public.buku DROP CONSTRAINT buku_pkey;
       public            postgres    false    202            �
           2606    16409    mahasiswa mahasiswa_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.mahasiswa
    ADD CONSTRAINT mahasiswa_pkey PRIMARY KEY (nim);
 B   ALTER TABLE ONLY public.mahasiswa DROP CONSTRAINT mahasiswa_pkey;
       public            postgres    false    203            �
           2606    16422    transaksi transaksi_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.transaksi
    ADD CONSTRAINT transaksi_pkey PRIMARY KEY (id_transaksi);
 B   ALTER TABLE ONLY public.transaksi DROP CONSTRAINT transaksi_pkey;
       public            postgres    false    205            �
           2606    16417    umum umum_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.umum
    ADD CONSTRAINT umum_pkey PRIMARY KEY (id_anggota);
 8   ALTER TABLE ONLY public.umum DROP CONSTRAINT umum_pkey;
       public            postgres    false    204            �
           2606    16433    transaksi id_anggota    FK CONSTRAINT     �   ALTER TABLE ONLY public.transaksi
    ADD CONSTRAINT id_anggota FOREIGN KEY (id_anggota) REFERENCES public.umum(id_anggota) NOT VALID;
 >   ALTER TABLE ONLY public.transaksi DROP CONSTRAINT id_anggota;
       public          postgres    false    204    205    2705            �
           2606    16423    transaksi id_buku    FK CONSTRAINT     ~   ALTER TABLE ONLY public.transaksi
    ADD CONSTRAINT id_buku FOREIGN KEY (id_buku) REFERENCES public.buku(id_buku) NOT VALID;
 ;   ALTER TABLE ONLY public.transaksi DROP CONSTRAINT id_buku;
       public          postgres    false    202    205    2701            �
           2606    16428    transaksi nim    FK CONSTRAINT     w   ALTER TABLE ONLY public.transaksi
    ADD CONSTRAINT nim FOREIGN KEY (nim) REFERENCES public.mahasiswa(nim) NOT VALID;
 7   ALTER TABLE ONLY public.transaksi DROP CONSTRAINT nim;
       public          postgres    false    203    205    2703               
   x���             
   x���             
   x���             
   x���         