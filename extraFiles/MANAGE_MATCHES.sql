PGDMP     
                    z           SOCCER    9.3.1    9.3.1     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           1262    16393    SOCCER    DATABASE     �   CREATE DATABASE "SOCCER" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
    DROP DATABASE "SOCCER";
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    5            �           0    0    public    ACL     �   REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
                  postgres    false    5            �            3079    11750    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    174            �            1259    16542    match    TABLE       CREATE TABLE match (
    id bigint NOT NULL,
    description character varying(255),
    match_date timestamp without time zone,
    match_time time without time zone,
    team_a character varying(255),
    team_b character varying(255),
    sport character varying(1)
);
    DROP TABLE public.match;
       public         postgres    false    5            �            1259    16540    match_id_seq    SEQUENCE     n   CREATE SEQUENCE match_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.match_id_seq;
       public       postgres    false    5    171            �           0    0    match_id_seq    SEQUENCE OWNED BY     /   ALTER SEQUENCE match_id_seq OWNED BY match.id;
            public       postgres    false    170            �            1259    16553 
   match_odds    TABLE     �   CREATE TABLE match_odds (
    id bigint NOT NULL,
    odd double precision,
    specifier character varying(255),
    match_id bigint
);
    DROP TABLE public.match_odds;
       public         postgres    false    5            �            1259    16551    match_odds_id_seq    SEQUENCE     s   CREATE SEQUENCE match_odds_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.match_odds_id_seq;
       public       postgres    false    5    173            �           0    0    match_odds_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE match_odds_id_seq OWNED BY match_odds.id;
            public       postgres    false    172            &           2604    16545    id    DEFAULT     V   ALTER TABLE ONLY match ALTER COLUMN id SET DEFAULT nextval('match_id_seq'::regclass);
 7   ALTER TABLE public.match ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    170    171    171            '           2604    16556    id    DEFAULT     `   ALTER TABLE ONLY match_odds ALTER COLUMN id SET DEFAULT nextval('match_odds_id_seq'::regclass);
 <   ALTER TABLE public.match_odds ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    172    173    173            �          0    16542    match 
   TABLE DATA               X   COPY match (id, description, match_date, match_time, team_a, team_b, sport) FROM stdin;
    public       postgres    false    171   �       �           0    0    match_id_seq    SEQUENCE SET     4   SELECT pg_catalog.setval('match_id_seq', 13, true);
            public       postgres    false    170            �          0    16553 
   match_odds 
   TABLE DATA               ;   COPY match_odds (id, odd, specifier, match_id) FROM stdin;
    public       postgres    false    173   �       �           0    0    match_odds_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('match_odds_id_seq', 1, false);
            public       postgres    false    172            -           2606    16558    match_odds_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY match_odds
    ADD CONSTRAINT match_odds_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.match_odds DROP CONSTRAINT match_odds_pkey;
       public         postgres    false    173    173            )           2606    16550 
   match_pkey 
   CONSTRAINT     G   ALTER TABLE ONLY match
    ADD CONSTRAINT match_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.match DROP CONSTRAINT match_pkey;
       public         postgres    false    171    171            +           2606    16560    uniquematch 
   CONSTRAINT     [   ALTER TABLE ONLY match
    ADD CONSTRAINT uniquematch UNIQUE (match_date, team_a, team_b);
 ;   ALTER TABLE ONLY public.match DROP CONSTRAINT uniquematch;
       public         postgres    false    171    171    171    171            .           2606    16561    fk95q20mrlhen1b5nvm70rjdcgd    FK CONSTRAINT     x   ALTER TABLE ONLY match_odds
    ADD CONSTRAINT fk95q20mrlhen1b5nvm70rjdcgd FOREIGN KEY (match_id) REFERENCES match(id);
 P   ALTER TABLE ONLY public.match_odds DROP CONSTRAINT fk95q20mrlhen1b5nvm70rjdcgd;
       public       postgres    false    171    173    1833            �   J   x�34��v�p���4202�50�52R00�20 "NC+c0�����И����& 	�T�c����� ���      �      x�3�4�3�4�44�����\1z\\\ -�l     