PGDMP         ,                }         
   demo_holod    15.1    15.1 W    u           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            v           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            w           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            x           1262    127826 
   demo_holod    DATABASE     ~   CREATE DATABASE demo_holod WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE demo_holod;
                postgres    false            �            1259    127847    edinitsy_izmereniya    TABLE     �   CREATE TABLE public.edinitsy_izmereniya (
    edinitsa_id integer NOT NULL,
    nazvanie character varying(20) NOT NULL,
    oboznachenie character varying(10) NOT NULL
);
 '   DROP TABLE public.edinitsy_izmereniya;
       public         heap    postgres    false            �            1259    127846 #   edinitsy_izmereniya_edinitsa_id_seq    SEQUENCE     �   CREATE SEQUENCE public.edinitsy_izmereniya_edinitsa_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.edinitsy_izmereniya_edinitsa_id_seq;
       public          postgres    false    219            y           0    0 #   edinitsy_izmereniya_edinitsa_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.edinitsy_izmereniya_edinitsa_id_seq OWNED BY public.edinitsy_izmereniya.edinitsa_id;
          public          postgres    false    218            �            1259    127858 	   materialy    TABLE     �  CREATE TABLE public.materialy (
    material_id integer NOT NULL,
    nazvanie character varying(100) NOT NULL,
    tip_materiala_id integer,
    postavshchik_id integer,
    tsena_za_edinitsu numeric(10,2) NOT NULL,
    kolichestvo_na_sklade numeric(12,3) NOT NULL,
    minimalnoe_kolichestvo numeric(12,3) NOT NULL,
    kolichestvo_v_upakovke numeric(10,3),
    edinitsa_id integer
);
    DROP TABLE public.materialy;
       public         heap    postgres    false            �            1259    127857    materialy_material_id_seq    SEQUENCE     �   CREATE SEQUENCE public.materialy_material_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.materialy_material_id_seq;
       public          postgres    false    221            z           0    0    materialy_material_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.materialy_material_id_seq OWNED BY public.materialy.material_id;
          public          postgres    false    220            �            1259    128232    menedzhery_menedzher_id_seq    SEQUENCE     �   CREATE SEQUENCE public.menedzhery_menedzher_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.menedzhery_menedzher_id_seq;
       public          postgres    false            �            1259    128236 
   menedzhery    TABLE     �   CREATE TABLE public.menedzhery (
    menedzher_id integer DEFAULT nextval('public.menedzhery_menedzher_id_seq'::regclass) NOT NULL,
    fio character varying(100) NOT NULL,
    kontakt_data text
);
    DROP TABLE public.menedzhery;
       public         heap    postgres    false    228            �            1259    128203    partnery_partner_id_seq    SEQUENCE     �   CREATE SEQUENCE public.partnery_partner_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.partnery_partner_id_seq;
       public          postgres    false            �            1259    128204    partnery    TABLE     �  CREATE TABLE public.partnery (
    partner_id integer DEFAULT nextval('public.partnery_partner_id_seq'::regclass) NOT NULL,
    naimenovanie character varying(100) NOT NULL,
    yur_adres text,
    inn character varying(12) NOT NULL,
    fio_direktora character varying(100),
    telefon character varying(15),
    email character varying(100),
    logo bytea,
    reyting integer,
    mesta_prodazh text,
    istoriya_reallyatsii text
);
    DROP TABLE public.partnery;
       public         heap    postgres    false    226            �            1259    127837    postavshchiki    TABLE     m  CREATE TABLE public.postavshchiki (
    postavshchik_id integer NOT NULL,
    nazvanie character varying(100) NOT NULL,
    tip_postavshchika character varying(50) NOT NULL,
    inn character varying(12) NOT NULL,
    reyting integer,
    data_nachala_raboty date NOT NULL,
    CONSTRAINT postavshchiki_reyting_check CHECK (((reyting >= 1) AND (reyting <= 10)))
);
 !   DROP TABLE public.postavshchiki;
       public         heap    postgres    false            �            1259    127836 !   postavshchiki_postavshchik_id_seq    SEQUENCE     �   CREATE SEQUENCE public.postavshchiki_postavshchik_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.postavshchiki_postavshchik_id_seq;
       public          postgres    false    217            {           0    0 !   postavshchiki_postavshchik_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.postavshchiki_postavshchik_id_seq OWNED BY public.postavshchiki.postavshchik_id;
          public          postgres    false    216            �            1259    127880    produktsiya    TABLE     �  CREATE TABLE public.produktsiya (
    produkt_id integer NOT NULL,
    artikul character varying(20) NOT NULL,
    nazvanie character varying(100) NOT NULL,
    opisanie text,
    minimalnaya_tsena numeric(12,2) NOT NULL,
    dlina_upakovki numeric(6,2),
    shirina_upakovki numeric(6,2),
    vysota_upakovki numeric(6,2),
    ves_bez_upakovki numeric(8,3),
    ves_s_upakovkoy numeric(8,3),
    vremya_izgotovleniya interval,
    sebestoimost numeric(12,2) NOT NULL
);
    DROP TABLE public.produktsiya;
       public         heap    postgres    false            �            1259    127879    produktsiya_produkt_id_seq    SEQUENCE     �   CREATE SEQUENCE public.produktsiya_produkt_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.produktsiya_produkt_id_seq;
       public          postgres    false    223            |           0    0    produktsiya_produkt_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.produktsiya_produkt_id_seq OWNED BY public.produktsiya.produkt_id;
          public          postgres    false    222            �            1259    128235    sklad_sklad_id_seq    SEQUENCE     {   CREATE SEQUENCE public.sklad_sklad_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.sklad_sklad_id_seq;
       public          postgres    false            �            1259    128268    sklad    TABLE     �   CREATE TABLE public.sklad (
    sklad_id integer DEFAULT nextval('public.sklad_sklad_id_seq'::regclass) NOT NULL,
    material_id integer NOT NULL,
    kolichestvo numeric(12,3) NOT NULL,
    data_postupleniya date NOT NULL,
    data_vyibytija date
);
    DROP TABLE public.sklad;
       public         heap    postgres    false    231            �            1259    127891    sostav_produktsii    TABLE     �   CREATE TABLE public.sostav_produktsii (
    sostav_id integer NOT NULL,
    produkt_id integer,
    material_id integer,
    kolichestvo numeric(10,3) NOT NULL,
    edinitsa_id integer
);
 %   DROP TABLE public.sostav_produktsii;
       public         heap    postgres    false            �            1259    127890    sostav_produktsii_sostav_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sostav_produktsii_sostav_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.sostav_produktsii_sostav_id_seq;
       public          postgres    false    225            }           0    0    sostav_produktsii_sostav_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.sostav_produktsii_sostav_id_seq OWNED BY public.sostav_produktsii.sostav_id;
          public          postgres    false    224            �            1259    128234    sotrudniki_sotrudnik_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sotrudniki_sotrudnik_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.sotrudniki_sotrudnik_id_seq;
       public          postgres    false            �            1259    128260 
   sotrudniki    TABLE     {  CREATE TABLE public.sotrudniki (
    sotrudnik_id integer DEFAULT nextval('public.sotrudniki_sotrudnik_id_seq'::regclass) NOT NULL,
    fio character varying(100) NOT NULL,
    data_rozhdeniya date NOT NULL,
    pasport_dannye text,
    bankovskie_rekvizity text,
    semeynoye_polozhenie character varying(20),
    sostoyanie_zdorovya text,
    login text,
    password text
);
    DROP TABLE public.sotrudniki;
       public         heap    postgres    false    230            �            1259    127828    tipy_materialov    TABLE     �   CREATE TABLE public.tipy_materialov (
    tip_materiala_id integer NOT NULL,
    nazvanie character varying(50) NOT NULL,
    procent_poteri numeric(5,2) NOT NULL
);
 #   DROP TABLE public.tipy_materialov;
       public         heap    postgres    false            �            1259    127827 $   tipy_materialov_tip_materiala_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tipy_materialov_tip_materiala_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.tipy_materialov_tip_materiala_id_seq;
       public          postgres    false    215            ~           0    0 $   tipy_materialov_tip_materiala_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.tipy_materialov_tip_materiala_id_seq OWNED BY public.tipy_materialov.tip_materiala_id;
          public          postgres    false    214            �            1259    128233    zayavki_zayavka_id_seq    SEQUENCE        CREATE SEQUENCE public.zayavki_zayavka_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.zayavki_zayavka_id_seq;
       public          postgres    false            �            1259    128244    zayavki    TABLE     )  CREATE TABLE public.zayavki (
    zayavka_id integer DEFAULT nextval('public.zayavki_zayavka_id_seq'::regclass) NOT NULL,
    partner_id integer NOT NULL,
    menedzher_id integer,
    data_zayavki date NOT NULL,
    status character varying(20),
    suma numeric(12,2),
    produkt_id integer
);
    DROP TABLE public.zayavki;
       public         heap    postgres    false    229            �           2604    127850    edinitsy_izmereniya edinitsa_id    DEFAULT     �   ALTER TABLE ONLY public.edinitsy_izmereniya ALTER COLUMN edinitsa_id SET DEFAULT nextval('public.edinitsy_izmereniya_edinitsa_id_seq'::regclass);
 N   ALTER TABLE public.edinitsy_izmereniya ALTER COLUMN edinitsa_id DROP DEFAULT;
       public          postgres    false    219    218    219            �           2604    127861    materialy material_id    DEFAULT     ~   ALTER TABLE ONLY public.materialy ALTER COLUMN material_id SET DEFAULT nextval('public.materialy_material_id_seq'::regclass);
 D   ALTER TABLE public.materialy ALTER COLUMN material_id DROP DEFAULT;
       public          postgres    false    220    221    221            �           2604    127840    postavshchiki postavshchik_id    DEFAULT     �   ALTER TABLE ONLY public.postavshchiki ALTER COLUMN postavshchik_id SET DEFAULT nextval('public.postavshchiki_postavshchik_id_seq'::regclass);
 L   ALTER TABLE public.postavshchiki ALTER COLUMN postavshchik_id DROP DEFAULT;
       public          postgres    false    217    216    217            �           2604    127883    produktsiya produkt_id    DEFAULT     �   ALTER TABLE ONLY public.produktsiya ALTER COLUMN produkt_id SET DEFAULT nextval('public.produktsiya_produkt_id_seq'::regclass);
 E   ALTER TABLE public.produktsiya ALTER COLUMN produkt_id DROP DEFAULT;
       public          postgres    false    222    223    223            �           2604    127894    sostav_produktsii sostav_id    DEFAULT     �   ALTER TABLE ONLY public.sostav_produktsii ALTER COLUMN sostav_id SET DEFAULT nextval('public.sostav_produktsii_sostav_id_seq'::regclass);
 J   ALTER TABLE public.sostav_produktsii ALTER COLUMN sostav_id DROP DEFAULT;
       public          postgres    false    225    224    225            �           2604    127831     tipy_materialov tip_materiala_id    DEFAULT     �   ALTER TABLE ONLY public.tipy_materialov ALTER COLUMN tip_materiala_id SET DEFAULT nextval('public.tipy_materialov_tip_materiala_id_seq'::regclass);
 O   ALTER TABLE public.tipy_materialov ALTER COLUMN tip_materiala_id DROP DEFAULT;
       public          postgres    false    215    214    215            b          0    127847    edinitsy_izmereniya 
   TABLE DATA           R   COPY public.edinitsy_izmereniya (edinitsa_id, nazvanie, oboznachenie) FROM stdin;
    public          postgres    false    219   �s       d          0    127858 	   materialy 
   TABLE DATA           �   COPY public.materialy (material_id, nazvanie, tip_materiala_id, postavshchik_id, tsena_za_edinitsu, kolichestvo_na_sklade, minimalnoe_kolichestvo, kolichestvo_v_upakovke, edinitsa_id) FROM stdin;
    public          postgres    false    221   t       o          0    128236 
   menedzhery 
   TABLE DATA           E   COPY public.menedzhery (menedzher_id, fio, kontakt_data) FROM stdin;
    public          postgres    false    232   4u       j          0    128204    partnery 
   TABLE DATA           �   COPY public.partnery (partner_id, naimenovanie, yur_adres, inn, fio_direktora, telefon, email, logo, reyting, mesta_prodazh, istoriya_reallyatsii) FROM stdin;
    public          postgres    false    227   Qu       `          0    127837    postavshchiki 
   TABLE DATA           x   COPY public.postavshchiki (postavshchik_id, nazvanie, tip_postavshchika, inn, reyting, data_nachala_raboty) FROM stdin;
    public          postgres    false    217   nu       f          0    127880    produktsiya 
   TABLE DATA           �   COPY public.produktsiya (produkt_id, artikul, nazvanie, opisanie, minimalnaya_tsena, dlina_upakovki, shirina_upakovki, vysota_upakovki, ves_bez_upakovki, ves_s_upakovkoy, vremya_izgotovleniya, sebestoimost) FROM stdin;
    public          postgres    false    223   kv       r          0    128268    sklad 
   TABLE DATA           f   COPY public.sklad (sklad_id, material_id, kolichestvo, data_postupleniya, data_vyibytija) FROM stdin;
    public          postgres    false    235   �v       h          0    127891    sostav_produktsii 
   TABLE DATA           i   COPY public.sostav_produktsii (sostav_id, produkt_id, material_id, kolichestvo, edinitsa_id) FROM stdin;
    public          postgres    false    225   �v       q          0    128260 
   sotrudniki 
   TABLE DATA           �   COPY public.sotrudniki (sotrudnik_id, fio, data_rozhdeniya, pasport_dannye, bankovskie_rekvizity, semeynoye_polozhenie, sostoyanie_zdorovya, login, password) FROM stdin;
    public          postgres    false    234   �v       ^          0    127828    tipy_materialov 
   TABLE DATA           U   COPY public.tipy_materialov (tip_materiala_id, nazvanie, procent_poteri) FROM stdin;
    public          postgres    false    215   4w       p          0    128244    zayavki 
   TABLE DATA           o   COPY public.zayavki (zayavka_id, partner_id, menedzher_id, data_zayavki, status, suma, produkt_id) FROM stdin;
    public          postgres    false    233   �w                  0    0 #   edinitsy_izmereniya_edinitsa_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.edinitsy_izmereniya_edinitsa_id_seq', 6, true);
          public          postgres    false    218            �           0    0    materialy_material_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.materialy_material_id_seq', 14, true);
          public          postgres    false    220            �           0    0    menedzhery_menedzher_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.menedzhery_menedzher_id_seq', 1, false);
          public          postgres    false    228            �           0    0    partnery_partner_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.partnery_partner_id_seq', 1, false);
          public          postgres    false    226            �           0    0 !   postavshchiki_postavshchik_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.postavshchiki_postavshchik_id_seq', 6, true);
          public          postgres    false    216            �           0    0    produktsiya_produkt_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.produktsiya_produkt_id_seq', 1, false);
          public          postgres    false    222            �           0    0    sklad_sklad_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.sklad_sklad_id_seq', 1, false);
          public          postgres    false    231            �           0    0    sostav_produktsii_sostav_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.sostav_produktsii_sostav_id_seq', 1, false);
          public          postgres    false    224            �           0    0    sotrudniki_sotrudnik_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.sotrudniki_sotrudnik_id_seq', 1, true);
          public          postgres    false    230            �           0    0 $   tipy_materialov_tip_materiala_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.tipy_materialov_tip_materiala_id_seq', 4, true);
          public          postgres    false    214            �           0    0    zayavki_zayavka_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.zayavki_zayavka_id_seq', 1, false);
          public          postgres    false    229            �           2606    127854 4   edinitsy_izmereniya edinitsy_izmereniya_nazvanie_key 
   CONSTRAINT     s   ALTER TABLE ONLY public.edinitsy_izmereniya
    ADD CONSTRAINT edinitsy_izmereniya_nazvanie_key UNIQUE (nazvanie);
 ^   ALTER TABLE ONLY public.edinitsy_izmereniya DROP CONSTRAINT edinitsy_izmereniya_nazvanie_key;
       public            postgres    false    219            �           2606    127856 8   edinitsy_izmereniya edinitsy_izmereniya_oboznachenie_key 
   CONSTRAINT     {   ALTER TABLE ONLY public.edinitsy_izmereniya
    ADD CONSTRAINT edinitsy_izmereniya_oboznachenie_key UNIQUE (oboznachenie);
 b   ALTER TABLE ONLY public.edinitsy_izmereniya DROP CONSTRAINT edinitsy_izmereniya_oboznachenie_key;
       public            postgres    false    219            �           2606    127852 ,   edinitsy_izmereniya edinitsy_izmereniya_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY public.edinitsy_izmereniya
    ADD CONSTRAINT edinitsy_izmereniya_pkey PRIMARY KEY (edinitsa_id);
 V   ALTER TABLE ONLY public.edinitsy_izmereniya DROP CONSTRAINT edinitsy_izmereniya_pkey;
       public            postgres    false    219            �           2606    127863    materialy materialy_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.materialy
    ADD CONSTRAINT materialy_pkey PRIMARY KEY (material_id);
 B   ALTER TABLE ONLY public.materialy DROP CONSTRAINT materialy_pkey;
       public            postgres    false    221            �           2606    128243    menedzhery menedzhery_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.menedzhery
    ADD CONSTRAINT menedzhery_pkey PRIMARY KEY (menedzher_id);
 D   ALTER TABLE ONLY public.menedzhery DROP CONSTRAINT menedzhery_pkey;
       public            postgres    false    232            �           2606    128213    partnery partnery_inn_key 
   CONSTRAINT     S   ALTER TABLE ONLY public.partnery
    ADD CONSTRAINT partnery_inn_key UNIQUE (inn);
 C   ALTER TABLE ONLY public.partnery DROP CONSTRAINT partnery_inn_key;
       public            postgres    false    227            �           2606    128211    partnery partnery_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.partnery
    ADD CONSTRAINT partnery_pkey PRIMARY KEY (partner_id);
 @   ALTER TABLE ONLY public.partnery DROP CONSTRAINT partnery_pkey;
       public            postgres    false    227            �           2606    127845 #   postavshchiki postavshchiki_inn_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.postavshchiki
    ADD CONSTRAINT postavshchiki_inn_key UNIQUE (inn);
 M   ALTER TABLE ONLY public.postavshchiki DROP CONSTRAINT postavshchiki_inn_key;
       public            postgres    false    217            �           2606    127843     postavshchiki postavshchiki_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.postavshchiki
    ADD CONSTRAINT postavshchiki_pkey PRIMARY KEY (postavshchik_id);
 J   ALTER TABLE ONLY public.postavshchiki DROP CONSTRAINT postavshchiki_pkey;
       public            postgres    false    217            �           2606    127889 #   produktsiya produktsiya_artikul_key 
   CONSTRAINT     a   ALTER TABLE ONLY public.produktsiya
    ADD CONSTRAINT produktsiya_artikul_key UNIQUE (artikul);
 M   ALTER TABLE ONLY public.produktsiya DROP CONSTRAINT produktsiya_artikul_key;
       public            postgres    false    223            �           2606    127887    produktsiya produktsiya_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.produktsiya
    ADD CONSTRAINT produktsiya_pkey PRIMARY KEY (produkt_id);
 F   ALTER TABLE ONLY public.produktsiya DROP CONSTRAINT produktsiya_pkey;
       public            postgres    false    223            �           2606    128273    sklad sklad_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.sklad
    ADD CONSTRAINT sklad_pkey PRIMARY KEY (sklad_id);
 :   ALTER TABLE ONLY public.sklad DROP CONSTRAINT sklad_pkey;
       public            postgres    false    235            �           2606    127896 (   sostav_produktsii sostav_produktsii_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.sostav_produktsii
    ADD CONSTRAINT sostav_produktsii_pkey PRIMARY KEY (sostav_id);
 R   ALTER TABLE ONLY public.sostav_produktsii DROP CONSTRAINT sostav_produktsii_pkey;
       public            postgres    false    225            �           2606    128267    sotrudniki sotrudniki_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.sotrudniki
    ADD CONSTRAINT sotrudniki_pkey PRIMARY KEY (sotrudnik_id);
 D   ALTER TABLE ONLY public.sotrudniki DROP CONSTRAINT sotrudniki_pkey;
       public            postgres    false    234            �           2606    127835 ,   tipy_materialov tipy_materialov_nazvanie_key 
   CONSTRAINT     k   ALTER TABLE ONLY public.tipy_materialov
    ADD CONSTRAINT tipy_materialov_nazvanie_key UNIQUE (nazvanie);
 V   ALTER TABLE ONLY public.tipy_materialov DROP CONSTRAINT tipy_materialov_nazvanie_key;
       public            postgres    false    215            �           2606    127833 $   tipy_materialov tipy_materialov_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.tipy_materialov
    ADD CONSTRAINT tipy_materialov_pkey PRIMARY KEY (tip_materiala_id);
 N   ALTER TABLE ONLY public.tipy_materialov DROP CONSTRAINT tipy_materialov_pkey;
       public            postgres    false    215            �           2606    128249    zayavki zayavki_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.zayavki
    ADD CONSTRAINT zayavki_pkey PRIMARY KEY (zayavka_id);
 >   ALTER TABLE ONLY public.zayavki DROP CONSTRAINT zayavki_pkey;
       public            postgres    false    233            �           2606    127874 $   materialy materialy_edinitsa_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.materialy
    ADD CONSTRAINT materialy_edinitsa_id_fkey FOREIGN KEY (edinitsa_id) REFERENCES public.edinitsy_izmereniya(edinitsa_id);
 N   ALTER TABLE ONLY public.materialy DROP CONSTRAINT materialy_edinitsa_id_fkey;
       public          postgres    false    3248    221    219            �           2606    127869 (   materialy materialy_postavshchik_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.materialy
    ADD CONSTRAINT materialy_postavshchik_id_fkey FOREIGN KEY (postavshchik_id) REFERENCES public.postavshchiki(postavshchik_id);
 R   ALTER TABLE ONLY public.materialy DROP CONSTRAINT materialy_postavshchik_id_fkey;
       public          postgres    false    217    3242    221            �           2606    127864 )   materialy materialy_tip_materiala_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.materialy
    ADD CONSTRAINT materialy_tip_materiala_id_fkey FOREIGN KEY (tip_materiala_id) REFERENCES public.tipy_materialov(tip_materiala_id);
 S   ALTER TABLE ONLY public.materialy DROP CONSTRAINT materialy_tip_materiala_id_fkey;
       public          postgres    false    221    215    3238            �           2606    128274    sklad sklad_material_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sklad
    ADD CONSTRAINT sklad_material_id_fkey FOREIGN KEY (material_id) REFERENCES public.materialy(material_id) ON DELETE CASCADE;
 F   ALTER TABLE ONLY public.sklad DROP CONSTRAINT sklad_material_id_fkey;
       public          postgres    false    235    221    3250            �           2606    127907 4   sostav_produktsii sostav_produktsii_edinitsa_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sostav_produktsii
    ADD CONSTRAINT sostav_produktsii_edinitsa_id_fkey FOREIGN KEY (edinitsa_id) REFERENCES public.edinitsy_izmereniya(edinitsa_id);
 ^   ALTER TABLE ONLY public.sostav_produktsii DROP CONSTRAINT sostav_produktsii_edinitsa_id_fkey;
       public          postgres    false    225    3248    219            �           2606    127902 4   sostav_produktsii sostav_produktsii_material_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sostav_produktsii
    ADD CONSTRAINT sostav_produktsii_material_id_fkey FOREIGN KEY (material_id) REFERENCES public.materialy(material_id);
 ^   ALTER TABLE ONLY public.sostav_produktsii DROP CONSTRAINT sostav_produktsii_material_id_fkey;
       public          postgres    false    225    221    3250            �           2606    127897 3   sostav_produktsii sostav_produktsii_produkt_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sostav_produktsii
    ADD CONSTRAINT sostav_produktsii_produkt_id_fkey FOREIGN KEY (produkt_id) REFERENCES public.produktsiya(produkt_id);
 ]   ALTER TABLE ONLY public.sostav_produktsii DROP CONSTRAINT sostav_produktsii_produkt_id_fkey;
       public          postgres    false    225    3254    223            �           2606    128255 !   zayavki zayavki_menedzher_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.zayavki
    ADD CONSTRAINT zayavki_menedzher_id_fkey FOREIGN KEY (menedzher_id) REFERENCES public.menedzhery(menedzher_id) ON DELETE SET NULL;
 K   ALTER TABLE ONLY public.zayavki DROP CONSTRAINT zayavki_menedzher_id_fkey;
       public          postgres    false    232    233    3262            �           2606    128250    zayavki zayavki_partner_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.zayavki
    ADD CONSTRAINT zayavki_partner_id_fkey FOREIGN KEY (partner_id) REFERENCES public.partnery(partner_id) ON DELETE CASCADE;
 I   ALTER TABLE ONLY public.zayavki DROP CONSTRAINT zayavki_partner_id_fkey;
       public          postgres    false    227    233    3260            �           2606    128279    zayavki zayavki_produkt_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.zayavki
    ADD CONSTRAINT zayavki_produkt_id_fkey FOREIGN KEY (produkt_id) REFERENCES public.produktsiya(produkt_id) ON DELETE SET NULL;
 I   ALTER TABLE ONLY public.zayavki DROP CONSTRAINT zayavki_produkt_id_fkey;
       public          postgres    false    233    3254    223            b   B   x�3估��/컰�bÅ�\���eĉ,��˘�j�Ŧ�@�	'P|+���+F��� ��)�      d     x���AN�0E��]�'�t��8����;nP��Th����	�,ЌD+5������y�IF��D�i�ߌ���v�A^���(c:Oz��'6��2��2ʱd)�2�'9n~	B^Y
)�����w�E�+"���&�#�^��������� �*u RmeMZ��?EAޔT`�ED�kf�l~͕/#�hD��S_]��-)��=�Mۅ`jö�E�(�����37v}ڸT�Ȭ[d.��Y�mUJ�5�d��+{�s�^k߇      o      x������ � �      j      x������ � �      `   �   x�E�MN1F��)z� �o����LWDa�Jp���*m�p��7��"%�����^e.K\��	���z肋��:�;^��6Sr��B�]��[��ӍSǀ��=N�_�\8�R�gʕ͖[�	�7���\���Pg�g-˙~�aMX�C%��&M3F&���B������S�r�����$§���4���q�6�FM�<b��<LŃ�ڲ��sSrI���Vɲ&j���1����      f      x������ � �      r      x������ � �      h      x������ � �      q   b   x�3�0��֋M.컰I�Q@���b;������!q�������)�����������m�^�{a��&΋�@�[/lr�^�
� &�b���� Qc4y      ^   c   x�̽	�0E�:o
'q��4��N D!��Ἅ|v��m+IG��xt&W�F���ĥ��}$8^v���dji��dN�V���ƿ��"�n�8�      p      x������ � �     