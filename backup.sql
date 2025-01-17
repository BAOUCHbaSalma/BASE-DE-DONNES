PGDMP                       }           CID_DB    16.4    16.4 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16394    CID_DB    DATABASE     {   CREATE DATABASE "CID_DB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'French_France.1252';
    DROP DATABASE "CID_DB";
                postgres    false            �            1259    16395    affaire    TABLE     v  CREATE TABLE public.affaire (
    id_affaire bigint NOT NULL,
    date_arret date,
    date_debut date NOT NULL,
    date_fin date NOT NULL,
    date_recommencement date,
    libelle_affaire character varying(255) NOT NULL,
    num_marche character varying(255) NOT NULL,
    part_cid double precision NOT NULL,
    prix_global double precision NOT NULL,
    status_affaire character varying(255) NOT NULL,
    client_id bigint NOT NULL,
    division_principale_id bigint NOT NULL,
    pole_principale_id bigint NOT NULL,
    chef_projet_id bigint,
    CONSTRAINT affaire_status_affaire_check CHECK (((status_affaire)::text = ANY (ARRAY[('EN_CREATION'::character varying)::text, ('CDP_DECIDE'::character varying)::text, ('EN_PRODUCTION'::character varying)::text, ('INTERROMPU'::character varying)::text, ('TERMINE'::character varying)::text, ('ANNULE'::character varying)::text])))
);
    DROP TABLE public.affaire;
       public         heap    postgres    false            �            1259    16759 
   avancement    TABLE     �  CREATE TABLE public.avancement (
    id_avancement bigint NOT NULL,
    commentaire character varying(1000),
    date_mise_a_jour timestamp(6) without time zone,
    chef_projet_id bigint,
    id_mission bigint,
    estatus character varying(255),
    montant_avancement_avec_rapport double precision,
    montant_avancement_sans_rapport double precision,
    montant_proposer_avec_rapport double precision,
    montant_proposer_sans_rapport double precision,
    CONSTRAINT avancement_estatus_check CHECK (((estatus)::text = ANY ((ARRAY['Initial'::character varying, 'Modifier'::character varying, 'Annuler'::character varying, 'Valider'::character varying])::text[])))
);
    DROP TABLE public.avancement;
       public         heap    postgres    false            �            1259    16758    avancement_id_avancement_seq    SEQUENCE     �   CREATE SEQUENCE public.avancement_id_avancement_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.avancement_id_avancement_seq;
       public          postgres    false    250            �           0    0    avancement_id_avancement_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.avancement_id_avancement_seq OWNED BY public.avancement.id_avancement;
          public          postgres    false    249            �            1259    41382    avancementst    TABLE     %  CREATE TABLE public.avancementst (
    id_avancement_st bigint NOT NULL,
    commentaire character varying(1000),
    date_mise_a_jour timestamp(6) without time zone,
    estatus character varying(255),
    montant_avancement double precision,
    montant_proposer double precision,
    chef_projet_id bigint,
    id_mission bigint,
    CONSTRAINT avancementst_estatus_check CHECK (((estatus)::text = ANY ((ARRAY['Initial'::character varying, 'Modifier'::character varying, 'Annuler'::character varying, 'Valider'::character varying])::text[])))
);
     DROP TABLE public.avancementst;
       public         heap    postgres    false            �            1259    41381 !   avancementst_id_avancement_st_seq    SEQUENCE     �   CREATE SEQUENCE public.avancementst_id_avancement_st_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.avancementst_id_avancement_st_seq;
       public          postgres    false    254            �           0    0 !   avancementst_id_avancement_st_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.avancementst_id_avancement_st_seq OWNED BY public.avancementst.id_avancement_st;
          public          postgres    false    253            �            1259    16401    client    TABLE     �   CREATE TABLE public.client (
    id_client bigint NOT NULL,
    nom_client character varying(255) NOT NULL,
    id_pays bigint
);
    DROP TABLE public.client;
       public         heap    postgres    false            �            1259    16404    client_id_client_seq    SEQUENCE     }   CREATE SEQUENCE public.client_id_client_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.client_id_client_seq;
       public          postgres    false    216            �           0    0    client_id_client_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.client_id_client_seq OWNED BY public.client.id_client;
          public          postgres    false    217            �            1259    16405    division    TABLE     �   CREATE TABLE public.division (
    id_division bigint NOT NULL,
    nom_division character varying(255) NOT NULL,
    id_pole bigint NOT NULL
);
    DROP TABLE public.division;
       public         heap    postgres    false            �            1259    16408    division_id_division_seq    SEQUENCE     �   CREATE SEQUENCE public.division_id_division_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.division_id_division_seq;
       public          postgres    false    218            �           0    0    division_id_division_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.division_id_division_seq OWNED BY public.division.id_division;
          public          postgres    false    219            �            1259    16409    encaissement    TABLE     $  CREATE TABLE public.encaissement (
    id_encaissement bigint NOT NULL,
    date_encaissement date,
    document_facture character varying(255) NOT NULL,
    montant_encaisse double precision NOT NULL,
    id_facture bigint,
    document_data oid,
    document_type character varying(255)
);
     DROP TABLE public.encaissement;
       public         heap    postgres    false            �            1259    16412     encaissement_id_encaissement_seq    SEQUENCE     �   CREATE SEQUENCE public.encaissement_id_encaissement_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.encaissement_id_encaissement_seq;
       public          postgres    false    220            �           0    0     encaissement_id_encaissement_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.encaissement_id_encaissement_seq OWNED BY public.encaissement.id_encaissement;
          public          postgres    false    221            �            1259    16413    facturation    TABLE     �   CREATE TABLE public.facturation (
    id_facture bigint NOT NULL,
    date_facturation date,
    document_facture character varying(255) NOT NULL,
    montant_facture double precision NOT NULL,
    id_mission bigint
);
    DROP TABLE public.facturation;
       public         heap    postgres    false            �            1259    16416    facturation_id_facture_seq    SEQUENCE     �   CREATE SEQUENCE public.facturation_id_facture_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.facturation_id_facture_seq;
       public          postgres    false    222            �           0    0    facturation_id_facture_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.facturation_id_facture_seq OWNED BY public.facturation.id_facture;
          public          postgres    false    223            �            1259    33173    historique_mission    TABLE       CREATE TABLE public.historique_mission (
    id bigint NOT NULL,
    date date,
    encaisement double precision,
    facturation double precision,
    mission_id bigint NOT NULL,
    avancement_avec_rapport double precision,
    avancement_sans_rapport double precision,
    division_id bigint,
    heurs time(6) without time zone,
    avancement_sous_traitance double precision
);
 &   DROP TABLE public.historique_mission;
       public         heap    postgres    false            �            1259    33172    historique_mission_id_seq    SEQUENCE     �   CREATE SEQUENCE public.historique_mission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.historique_mission_id_seq;
       public          postgres    false    252            �           0    0    historique_mission_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.historique_mission_id_seq OWNED BY public.historique_mission.id;
          public          postgres    false    251            �            1259    16645    mission    TABLE     �  CREATE TABLE public.mission (
    id_mission bigint NOT NULL,
    compte_client double precision NOT NULL,
    date_arret date,
    date_debut date NOT NULL,
    date_fin date NOT NULL,
    date_recommencement date,
    libelle_mission character varying(255) NOT NULL,
    part_div_principale double precision,
    part_mission_cid double precision NOT NULL,
    prix_mission_total double precision NOT NULL,
    prix_mission_unitaire double precision,
    quantite integer,
    affaire_id bigint NOT NULL,
    principal_division_id bigint NOT NULL,
    unite_id bigint NOT NULL,
    status smallint,
    estatus character varying(255),
    date_modification_mission date,
    CONSTRAINT mission_estatus_check CHECK (((estatus)::text = ANY ((ARRAY['Initial'::character varying, 'Annuler'::character varying, 'Valider'::character varying])::text[]))),
    CONSTRAINT mission_status_check CHECK (((status >= 0) AND (status <= 2)))
);
    DROP TABLE public.mission;
       public         heap    postgres    false            �            1259    16704    mission_chef_projet    TABLE     �   CREATE TABLE public.mission_chef_projet (
    id bigint NOT NULL,
    date_affectation date NOT NULL,
    chef_projet_id bigint NOT NULL,
    mission_id bigint NOT NULL
);
 '   DROP TABLE public.mission_chef_projet;
       public         heap    postgres    false            �            1259    16703    mission_chef_projet_id_seq    SEQUENCE     �   CREATE SEQUENCE public.mission_chef_projet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.mission_chef_projet_id_seq;
       public          postgres    false    248            �           0    0    mission_chef_projet_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.mission_chef_projet_id_seq OWNED BY public.mission_chef_projet.id;
          public          postgres    false    247            �            1259    16422    mission_division    TABLE     �   CREATE TABLE public.mission_division (
    id bigint NOT NULL,
    part_mission double precision,
    division_id bigint NOT NULL,
    mission_id bigint NOT NULL
);
 $   DROP TABLE public.mission_division;
       public         heap    postgres    false            �            1259    16425    mission_division_id_seq    SEQUENCE     �   CREATE SEQUENCE public.mission_division_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.mission_division_id_seq;
       public          postgres    false    224            �           0    0    mission_division_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.mission_division_id_seq OWNED BY public.mission_division.id;
          public          postgres    false    225            �            1259    16644    mission_id_mission_seq    SEQUENCE        CREATE SEQUENCE public.mission_id_mission_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.mission_id_mission_seq;
       public          postgres    false    246            �           0    0    mission_id_mission_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.mission_id_mission_seq OWNED BY public.mission.id_mission;
          public          postgres    false    245            �            1259    16427    mission_partenaire    TABLE     �   CREATE TABLE public.mission_partenaire (
    id bigint NOT NULL,
    part_mission double precision,
    mission_id bigint NOT NULL,
    partenaire_id bigint NOT NULL
);
 &   DROP TABLE public.mission_partenaire;
       public         heap    postgres    false            �            1259    16430    mission_partenaire_id_seq    SEQUENCE     �   CREATE SEQUENCE public.mission_partenaire_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.mission_partenaire_id_seq;
       public          postgres    false    226            �           0    0    mission_partenaire_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.mission_partenaire_id_seq OWNED BY public.mission_partenaire.id;
          public          postgres    false    227            �            1259    16431    mission_sous_traitant    TABLE       CREATE TABLE public.mission_sous_traitant (
    id bigint NOT NULL,
    part_mission double precision,
    mission_id bigint NOT NULL,
    sous_traitant_id bigint NOT NULL,
    utilisateur_id bigint,
    estatus character varying(255),
    montant_avancement double precision,
    montant_proposer double precision,
    CONSTRAINT mission_sous_traitant_estatus_check CHECK (((estatus)::text = ANY ((ARRAY['Initial'::character varying, 'Modifier'::character varying, 'Annuler'::character varying, 'Valider'::character varying])::text[])))
);
 )   DROP TABLE public.mission_sous_traitant;
       public         heap    postgres    false            �            1259    16434    mission_sous_traitant_id_seq    SEQUENCE     �   CREATE SEQUENCE public.mission_sous_traitant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.mission_sous_traitant_id_seq;
       public          postgres    false    228            �           0    0    mission_sous_traitant_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.mission_sous_traitant_id_seq OWNED BY public.mission_sous_traitant.id;
          public          postgres    false    229            �            1259    16435 
   partenaire    TABLE     z   CREATE TABLE public.partenaire (
    id_partenaire bigint NOT NULL,
    nom_partenaire character varying(255) NOT NULL
);
    DROP TABLE public.partenaire;
       public         heap    postgres    false            �            1259    16438    partenaire_id_partenaire_seq    SEQUENCE     �   CREATE SEQUENCE public.partenaire_id_partenaire_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.partenaire_id_partenaire_seq;
       public          postgres    false    230            �           0    0    partenaire_id_partenaire_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.partenaire_id_partenaire_seq OWNED BY public.partenaire.id_partenaire;
          public          postgres    false    231            �            1259    16439    pays    TABLE     l   CREATE TABLE public.pays (
    id_pays bigint NOT NULL,
    libelle_pays character varying(100) NOT NULL
);
    DROP TABLE public.pays;
       public         heap    postgres    false            �            1259    16442    pays_id_pays_seq    SEQUENCE     y   CREATE SEQUENCE public.pays_id_pays_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.pays_id_pays_seq;
       public          postgres    false    232            �           0    0    pays_id_pays_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.pays_id_pays_seq OWNED BY public.pays.id_pays;
          public          postgres    false    233            �            1259    16443    pole    TABLE     l   CREATE TABLE public.pole (
    id_pole bigint NOT NULL,
    libelle_pole character varying(255) NOT NULL
);
    DROP TABLE public.pole;
       public         heap    postgres    false            �            1259    16446    pole_id_pole_seq    SEQUENCE     y   CREATE SEQUENCE public.pole_id_pole_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.pole_id_pole_seq;
       public          postgres    false    234            �           0    0    pole_id_pole_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.pole_id_pole_seq OWNED BY public.pole.id_pole;
          public          postgres    false    235            �            1259    16447    role    TABLE     �   CREATE TABLE public.role (
    id_role bigint NOT NULL,
    nom_role character varying(255) NOT NULL,
    redirection_link character varying(255) NOT NULL,
    requires_division boolean NOT NULL,
    requires_pole boolean NOT NULL
);
    DROP TABLE public.role;
       public         heap    postgres    false            �            1259    16452    role_id_role_seq    SEQUENCE     y   CREATE SEQUENCE public.role_id_role_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.role_id_role_seq;
       public          postgres    false    236            �           0    0    role_id_role_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.role_id_role_seq OWNED BY public.role.id_role;
          public          postgres    false    237            �            1259    16453    sous_traitant    TABLE     {   CREATE TABLE public.sous_traitant (
    id_soustrait bigint NOT NULL,
    nom_soustrait character varying(255) NOT NULL
);
 !   DROP TABLE public.sous_traitant;
       public         heap    postgres    false            �            1259    16456    sous_traitant_id_soustrait_seq    SEQUENCE     �   CREATE SEQUENCE public.sous_traitant_id_soustrait_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.sous_traitant_id_soustrait_seq;
       public          postgres    false    238            �           0    0    sous_traitant_id_soustrait_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.sous_traitant_id_soustrait_seq OWNED BY public.sous_traitant.id_soustrait;
          public          postgres    false    239            �            1259    16457    unite    TABLE     k   CREATE TABLE public.unite (
    id_unite bigint NOT NULL,
    nom_unite character varying(255) NOT NULL
);
    DROP TABLE public.unite;
       public         heap    postgres    false            �            1259    16460    unite_id_unite_seq    SEQUENCE     {   CREATE SEQUENCE public.unite_id_unite_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.unite_id_unite_seq;
       public          postgres    false    240            �           0    0    unite_id_unite_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.unite_id_unite_seq OWNED BY public.unite.id_unite;
          public          postgres    false    241            �            1259    16461    utilisateur    TABLE     �  CREATE TABLE public.utilisateur (
    id_utilisateur bigint NOT NULL,
    adresse character varying(255) NOT NULL,
    date_naissance date NOT NULL,
    email character varying(255) NOT NULL,
    num_telephone character varying(20),
    sexe character(1) NOT NULL,
    username character varying(100) NOT NULL,
    division bigint,
    pays bigint,
    pole bigint,
    role character varying(255),
    password character varying(255)
);
    DROP TABLE public.utilisateur;
       public         heap    postgres    false            �            1259    16466    utilisateur_id_utilisateur_seq    SEQUENCE     �   CREATE SEQUENCE public.utilisateur_id_utilisateur_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.utilisateur_id_utilisateur_seq;
       public          postgres    false    242            �           0    0    utilisateur_id_utilisateur_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.utilisateur_id_utilisateur_seq OWNED BY public.utilisateur.id_utilisateur;
          public          postgres    false    243            �            1259    16467    utilisateur_roles    TABLE     k   CREATE TABLE public.utilisateur_roles (
    utilisateur_id bigint NOT NULL,
    role_id bigint NOT NULL
);
 %   DROP TABLE public.utilisateur_roles;
       public         heap    postgres    false            �           2604    16762    avancement id_avancement    DEFAULT     �   ALTER TABLE ONLY public.avancement ALTER COLUMN id_avancement SET DEFAULT nextval('public.avancement_id_avancement_seq'::regclass);
 G   ALTER TABLE public.avancement ALTER COLUMN id_avancement DROP DEFAULT;
       public          postgres    false    250    249    250            �           2604    41385    avancementst id_avancement_st    DEFAULT     �   ALTER TABLE ONLY public.avancementst ALTER COLUMN id_avancement_st SET DEFAULT nextval('public.avancementst_id_avancement_st_seq'::regclass);
 L   ALTER TABLE public.avancementst ALTER COLUMN id_avancement_st DROP DEFAULT;
       public          postgres    false    254    253    254            �           2604    16470    client id_client    DEFAULT     t   ALTER TABLE ONLY public.client ALTER COLUMN id_client SET DEFAULT nextval('public.client_id_client_seq'::regclass);
 ?   ALTER TABLE public.client ALTER COLUMN id_client DROP DEFAULT;
       public          postgres    false    217    216            �           2604    16471    division id_division    DEFAULT     |   ALTER TABLE ONLY public.division ALTER COLUMN id_division SET DEFAULT nextval('public.division_id_division_seq'::regclass);
 C   ALTER TABLE public.division ALTER COLUMN id_division DROP DEFAULT;
       public          postgres    false    219    218            �           2604    16472    encaissement id_encaissement    DEFAULT     �   ALTER TABLE ONLY public.encaissement ALTER COLUMN id_encaissement SET DEFAULT nextval('public.encaissement_id_encaissement_seq'::regclass);
 K   ALTER TABLE public.encaissement ALTER COLUMN id_encaissement DROP DEFAULT;
       public          postgres    false    221    220            �           2604    16473    facturation id_facture    DEFAULT     �   ALTER TABLE ONLY public.facturation ALTER COLUMN id_facture SET DEFAULT nextval('public.facturation_id_facture_seq'::regclass);
 E   ALTER TABLE public.facturation ALTER COLUMN id_facture DROP DEFAULT;
       public          postgres    false    223    222            �           2604    33176    historique_mission id    DEFAULT     ~   ALTER TABLE ONLY public.historique_mission ALTER COLUMN id SET DEFAULT nextval('public.historique_mission_id_seq'::regclass);
 D   ALTER TABLE public.historique_mission ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    251    252    252            �           2604    16648    mission id_mission    DEFAULT     x   ALTER TABLE ONLY public.mission ALTER COLUMN id_mission SET DEFAULT nextval('public.mission_id_mission_seq'::regclass);
 A   ALTER TABLE public.mission ALTER COLUMN id_mission DROP DEFAULT;
       public          postgres    false    246    245    246            �           2604    16707    mission_chef_projet id    DEFAULT     �   ALTER TABLE ONLY public.mission_chef_projet ALTER COLUMN id SET DEFAULT nextval('public.mission_chef_projet_id_seq'::regclass);
 E   ALTER TABLE public.mission_chef_projet ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    247    248    248            �           2604    16475    mission_division id    DEFAULT     z   ALTER TABLE ONLY public.mission_division ALTER COLUMN id SET DEFAULT nextval('public.mission_division_id_seq'::regclass);
 B   ALTER TABLE public.mission_division ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    224            �           2604    16476    mission_partenaire id    DEFAULT     ~   ALTER TABLE ONLY public.mission_partenaire ALTER COLUMN id SET DEFAULT nextval('public.mission_partenaire_id_seq'::regclass);
 D   ALTER TABLE public.mission_partenaire ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    226            �           2604    16477    mission_sous_traitant id    DEFAULT     �   ALTER TABLE ONLY public.mission_sous_traitant ALTER COLUMN id SET DEFAULT nextval('public.mission_sous_traitant_id_seq'::regclass);
 G   ALTER TABLE public.mission_sous_traitant ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    229    228            �           2604    16478    partenaire id_partenaire    DEFAULT     �   ALTER TABLE ONLY public.partenaire ALTER COLUMN id_partenaire SET DEFAULT nextval('public.partenaire_id_partenaire_seq'::regclass);
 G   ALTER TABLE public.partenaire ALTER COLUMN id_partenaire DROP DEFAULT;
       public          postgres    false    231    230            �           2604    16479    pays id_pays    DEFAULT     l   ALTER TABLE ONLY public.pays ALTER COLUMN id_pays SET DEFAULT nextval('public.pays_id_pays_seq'::regclass);
 ;   ALTER TABLE public.pays ALTER COLUMN id_pays DROP DEFAULT;
       public          postgres    false    233    232            �           2604    16480    pole id_pole    DEFAULT     l   ALTER TABLE ONLY public.pole ALTER COLUMN id_pole SET DEFAULT nextval('public.pole_id_pole_seq'::regclass);
 ;   ALTER TABLE public.pole ALTER COLUMN id_pole DROP DEFAULT;
       public          postgres    false    235    234            �           2604    16481    role id_role    DEFAULT     l   ALTER TABLE ONLY public.role ALTER COLUMN id_role SET DEFAULT nextval('public.role_id_role_seq'::regclass);
 ;   ALTER TABLE public.role ALTER COLUMN id_role DROP DEFAULT;
       public          postgres    false    237    236            �           2604    16482    sous_traitant id_soustrait    DEFAULT     �   ALTER TABLE ONLY public.sous_traitant ALTER COLUMN id_soustrait SET DEFAULT nextval('public.sous_traitant_id_soustrait_seq'::regclass);
 I   ALTER TABLE public.sous_traitant ALTER COLUMN id_soustrait DROP DEFAULT;
       public          postgres    false    239    238            �           2604    16483    unite id_unite    DEFAULT     p   ALTER TABLE ONLY public.unite ALTER COLUMN id_unite SET DEFAULT nextval('public.unite_id_unite_seq'::regclass);
 =   ALTER TABLE public.unite ALTER COLUMN id_unite DROP DEFAULT;
       public          postgres    false    241    240            �           2604    16484    utilisateur id_utilisateur    DEFAULT     �   ALTER TABLE ONLY public.utilisateur ALTER COLUMN id_utilisateur SET DEFAULT nextval('public.utilisateur_id_utilisateur_seq'::regclass);
 I   ALTER TABLE public.utilisateur ALTER COLUMN id_utilisateur DROP DEFAULT;
       public          postgres    false    243    242            �          0    16395    affaire 
   TABLE DATA           �   COPY public.affaire (id_affaire, date_arret, date_debut, date_fin, date_recommencement, libelle_affaire, num_marche, part_cid, prix_global, status_affaire, client_id, division_principale_id, pole_principale_id, chef_projet_id) FROM stdin;
    public          postgres    false    215   ��       �          0    16759 
   avancement 
   TABLE DATA           �   COPY public.avancement (id_avancement, commentaire, date_mise_a_jour, chef_projet_id, id_mission, estatus, montant_avancement_avec_rapport, montant_avancement_sans_rapport, montant_proposer_avec_rapport, montant_proposer_sans_rapport) FROM stdin;
    public          postgres    false    250   �       �          0    41382    avancementst 
   TABLE DATA           �   COPY public.avancementst (id_avancement_st, commentaire, date_mise_a_jour, estatus, montant_avancement, montant_proposer, chef_projet_id, id_mission) FROM stdin;
    public          postgres    false    254   N�       �          0    16401    client 
   TABLE DATA           @   COPY public.client (id_client, nom_client, id_pays) FROM stdin;
    public          postgres    false    216   k�       �          0    16405    division 
   TABLE DATA           F   COPY public.division (id_division, nom_division, id_pole) FROM stdin;
    public          postgres    false    218   ��       �          0    16409    encaissement 
   TABLE DATA           �   COPY public.encaissement (id_encaissement, date_encaissement, document_facture, montant_encaisse, id_facture, document_data, document_type) FROM stdin;
    public          postgres    false    220   �       �          0    16413    facturation 
   TABLE DATA           r   COPY public.facturation (id_facture, date_facturation, document_facture, montant_facture, id_mission) FROM stdin;
    public          postgres    false    222   ��       �          0    33173    historique_mission 
   TABLE DATA           �   COPY public.historique_mission (id, date, encaisement, facturation, mission_id, avancement_avec_rapport, avancement_sans_rapport, division_id, heurs, avancement_sous_traitance) FROM stdin;
    public          postgres    false    252   ��       �          0    16645    mission 
   TABLE DATA           9  COPY public.mission (id_mission, compte_client, date_arret, date_debut, date_fin, date_recommencement, libelle_mission, part_div_principale, part_mission_cid, prix_mission_total, prix_mission_unitaire, quantite, affaire_id, principal_division_id, unite_id, status, estatus, date_modification_mission) FROM stdin;
    public          postgres    false    246   .�       �          0    16704    mission_chef_projet 
   TABLE DATA           _   COPY public.mission_chef_projet (id, date_affectation, chef_projet_id, mission_id) FROM stdin;
    public          postgres    false    248   /�       �          0    16422    mission_division 
   TABLE DATA           U   COPY public.mission_division (id, part_mission, division_id, mission_id) FROM stdin;
    public          postgres    false    224   ��       �          0    16427    mission_partenaire 
   TABLE DATA           Y   COPY public.mission_partenaire (id, part_mission, mission_id, partenaire_id) FROM stdin;
    public          postgres    false    226   �       �          0    16431    mission_sous_traitant 
   TABLE DATA           �   COPY public.mission_sous_traitant (id, part_mission, mission_id, sous_traitant_id, utilisateur_id, estatus, montant_avancement, montant_proposer) FROM stdin;
    public          postgres    false    228   (�       �          0    16435 
   partenaire 
   TABLE DATA           C   COPY public.partenaire (id_partenaire, nom_partenaire) FROM stdin;
    public          postgres    false    230   ��       �          0    16439    pays 
   TABLE DATA           5   COPY public.pays (id_pays, libelle_pays) FROM stdin;
    public          postgres    false    232   ��       �          0    16443    pole 
   TABLE DATA           5   COPY public.pole (id_pole, libelle_pole) FROM stdin;
    public          postgres    false    234   6�       �          0    16447    role 
   TABLE DATA           e   COPY public.role (id_role, nom_role, redirection_link, requires_division, requires_pole) FROM stdin;
    public          postgres    false    236   j�       �          0    16453    sous_traitant 
   TABLE DATA           D   COPY public.sous_traitant (id_soustrait, nom_soustrait) FROM stdin;
    public          postgres    false    238   ��       �          0    16457    unite 
   TABLE DATA           4   COPY public.unite (id_unite, nom_unite) FROM stdin;
    public          postgres    false    240   �       �          0    16461    utilisateur 
   TABLE DATA           �   COPY public.utilisateur (id_utilisateur, adresse, date_naissance, email, num_telephone, sexe, username, division, pays, pole, role, password) FROM stdin;
    public          postgres    false    242   <�       �          0    16467    utilisateur_roles 
   TABLE DATA           D   COPY public.utilisateur_roles (utilisateur_id, role_id) FROM stdin;
    public          postgres    false    244   )       �           0    0    avancement_id_avancement_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.avancement_id_avancement_seq', 50, true);
          public          postgres    false    249            �           0    0 !   avancementst_id_avancement_st_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.avancementst_id_avancement_st_seq', 1, false);
          public          postgres    false    253            �           0    0    client_id_client_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.client_id_client_seq', 6, true);
          public          postgres    false    217            �           0    0    division_id_division_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.division_id_division_seq', 1, false);
          public          postgres    false    219            �           0    0     encaissement_id_encaissement_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.encaissement_id_encaissement_seq', 15, true);
          public          postgres    false    221            �           0    0    facturation_id_facture_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.facturation_id_facture_seq', 38, true);
          public          postgres    false    223            �           0    0    historique_mission_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.historique_mission_id_seq', 121, true);
          public          postgres    false    251            �           0    0    mission_chef_projet_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.mission_chef_projet_id_seq', 19, true);
          public          postgres    false    247            �           0    0    mission_division_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.mission_division_id_seq', 24, true);
          public          postgres    false    225            �           0    0    mission_id_mission_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.mission_id_mission_seq', 27, true);
          public          postgres    false    245            �           0    0    mission_partenaire_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.mission_partenaire_id_seq', 3, true);
          public          postgres    false    227            �           0    0    mission_sous_traitant_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.mission_sous_traitant_id_seq', 14, true);
          public          postgres    false    229            �           0    0    partenaire_id_partenaire_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.partenaire_id_partenaire_seq', 3, true);
          public          postgres    false    231            �           0    0    pays_id_pays_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.pays_id_pays_seq', 1, false);
          public          postgres    false    233            �           0    0    pole_id_pole_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.pole_id_pole_seq', 1, false);
          public          postgres    false    235            �           0    0    role_id_role_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.role_id_role_seq', 1, false);
          public          postgres    false    237            �           0    0    sous_traitant_id_soustrait_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.sous_traitant_id_soustrait_seq', 5, true);
          public          postgres    false    239            �           0    0    unite_id_unite_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.unite_id_unite_seq', 2, true);
          public          postgres    false    241            �           0    0    utilisateur_id_utilisateur_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.utilisateur_id_utilisateur_seq', 13, true);
          public          postgres    false    243            �           2606    16486    affaire affaire_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.affaire
    ADD CONSTRAINT affaire_pkey PRIMARY KEY (id_affaire);
 >   ALTER TABLE ONLY public.affaire DROP CONSTRAINT affaire_pkey;
       public            postgres    false    215            �           2606    16766    avancement avancement_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.avancement
    ADD CONSTRAINT avancement_pkey PRIMARY KEY (id_avancement);
 D   ALTER TABLE ONLY public.avancement DROP CONSTRAINT avancement_pkey;
       public            postgres    false    250            �           2606    41390    avancementst avancementst_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.avancementst
    ADD CONSTRAINT avancementst_pkey PRIMARY KEY (id_avancement_st);
 H   ALTER TABLE ONLY public.avancementst DROP CONSTRAINT avancementst_pkey;
       public            postgres    false    254            �           2606    16488    client client_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (id_client);
 <   ALTER TABLE ONLY public.client DROP CONSTRAINT client_pkey;
       public            postgres    false    216            �           2606    16490    division division_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.division
    ADD CONSTRAINT division_pkey PRIMARY KEY (id_division);
 @   ALTER TABLE ONLY public.division DROP CONSTRAINT division_pkey;
       public            postgres    false    218            �           2606    16492    encaissement encaissement_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.encaissement
    ADD CONSTRAINT encaissement_pkey PRIMARY KEY (id_encaissement);
 H   ALTER TABLE ONLY public.encaissement DROP CONSTRAINT encaissement_pkey;
       public            postgres    false    220            �           2606    16494    facturation facturation_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.facturation
    ADD CONSTRAINT facturation_pkey PRIMARY KEY (id_facture);
 F   ALTER TABLE ONLY public.facturation DROP CONSTRAINT facturation_pkey;
       public            postgres    false    222            �           2606    33178 *   historique_mission historique_mission_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.historique_mission
    ADD CONSTRAINT historique_mission_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.historique_mission DROP CONSTRAINT historique_mission_pkey;
       public            postgres    false    252            �           2606    16709 ,   mission_chef_projet mission_chef_projet_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.mission_chef_projet
    ADD CONSTRAINT mission_chef_projet_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.mission_chef_projet DROP CONSTRAINT mission_chef_projet_pkey;
       public            postgres    false    248            �           2606    16496 &   mission_division mission_division_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.mission_division
    ADD CONSTRAINT mission_division_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.mission_division DROP CONSTRAINT mission_division_pkey;
       public            postgres    false    224            �           2606    16498 *   mission_partenaire mission_partenaire_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.mission_partenaire
    ADD CONSTRAINT mission_partenaire_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.mission_partenaire DROP CONSTRAINT mission_partenaire_pkey;
       public            postgres    false    226            �           2606    16650    mission mission_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.mission
    ADD CONSTRAINT mission_pkey PRIMARY KEY (id_mission);
 >   ALTER TABLE ONLY public.mission DROP CONSTRAINT mission_pkey;
       public            postgres    false    246            �           2606    16502 0   mission_sous_traitant mission_sous_traitant_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.mission_sous_traitant
    ADD CONSTRAINT mission_sous_traitant_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.mission_sous_traitant DROP CONSTRAINT mission_sous_traitant_pkey;
       public            postgres    false    228            �           2606    16504    partenaire partenaire_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.partenaire
    ADD CONSTRAINT partenaire_pkey PRIMARY KEY (id_partenaire);
 D   ALTER TABLE ONLY public.partenaire DROP CONSTRAINT partenaire_pkey;
       public            postgres    false    230            �           2606    16506    pays pays_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.pays
    ADD CONSTRAINT pays_pkey PRIMARY KEY (id_pays);
 8   ALTER TABLE ONLY public.pays DROP CONSTRAINT pays_pkey;
       public            postgres    false    232            �           2606    16508    pole pole_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.pole
    ADD CONSTRAINT pole_pkey PRIMARY KEY (id_pole);
 8   ALTER TABLE ONLY public.pole DROP CONSTRAINT pole_pkey;
       public            postgres    false    234            �           2606    16510    role role_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id_role);
 8   ALTER TABLE ONLY public.role DROP CONSTRAINT role_pkey;
       public            postgres    false    236            �           2606    16512     sous_traitant sous_traitant_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.sous_traitant
    ADD CONSTRAINT sous_traitant_pkey PRIMARY KEY (id_soustrait);
 J   ALTER TABLE ONLY public.sous_traitant DROP CONSTRAINT sous_traitant_pkey;
       public            postgres    false    238            �           2606    16514 (   utilisateur uk_kq7nt5wyq9v9lpcpgxag2f24a 
   CONSTRAINT     g   ALTER TABLE ONLY public.utilisateur
    ADD CONSTRAINT uk_kq7nt5wyq9v9lpcpgxag2f24a UNIQUE (username);
 R   ALTER TABLE ONLY public.utilisateur DROP CONSTRAINT uk_kq7nt5wyq9v9lpcpgxag2f24a;
       public            postgres    false    242            �           2606    16516 (   utilisateur uk_rma38wvnqfaf66vvmi57c71lo 
   CONSTRAINT     d   ALTER TABLE ONLY public.utilisateur
    ADD CONSTRAINT uk_rma38wvnqfaf66vvmi57c71lo UNIQUE (email);
 R   ALTER TABLE ONLY public.utilisateur DROP CONSTRAINT uk_rma38wvnqfaf66vvmi57c71lo;
       public            postgres    false    242            �           2606    16518    unite unite_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.unite
    ADD CONSTRAINT unite_pkey PRIMARY KEY (id_unite);
 :   ALTER TABLE ONLY public.unite DROP CONSTRAINT unite_pkey;
       public            postgres    false    240            �           2606    16520    utilisateur utilisateur_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.utilisateur
    ADD CONSTRAINT utilisateur_pkey PRIMARY KEY (id_utilisateur);
 F   ALTER TABLE ONLY public.utilisateur DROP CONSTRAINT utilisateur_pkey;
       public            postgres    false    242            �           2606    16522 (   utilisateur_roles utilisateur_roles_pkey 
   CONSTRAINT     {   ALTER TABLE ONLY public.utilisateur_roles
    ADD CONSTRAINT utilisateur_roles_pkey PRIMARY KEY (utilisateur_id, role_id);
 R   ALTER TABLE ONLY public.utilisateur_roles DROP CONSTRAINT utilisateur_roles_pkey;
       public            postgres    false    244    244                       2606    16656 #   mission fk28ymq8fe9qbr866toei9a2ku7    FK CONSTRAINT     �   ALTER TABLE ONLY public.mission
    ADD CONSTRAINT fk28ymq8fe9qbr866toei9a2ku7 FOREIGN KEY (affaire_id) REFERENCES public.affaire(id_affaire);
 M   ALTER TABLE ONLY public.mission DROP CONSTRAINT fk28ymq8fe9qbr866toei9a2ku7;
       public          postgres    false    215    246    4812                       2606    16671 ,   mission_division fk2iqn7m8kgeuju56eo9rrsldq1    FK CONSTRAINT     �   ALTER TABLE ONLY public.mission_division
    ADD CONSTRAINT fk2iqn7m8kgeuju56eo9rrsldq1 FOREIGN KEY (mission_id) REFERENCES public.mission(id_mission);
 V   ALTER TABLE ONLY public.mission_division DROP CONSTRAINT fk2iqn7m8kgeuju56eo9rrsldq1;
       public          postgres    false    224    4848    246            �           2606    16533 "   client fk32j9t0u73auk2x1edktxknaii    FK CONSTRAINT     �   ALTER TABLE ONLY public.client
    ADD CONSTRAINT fk32j9t0u73auk2x1edktxknaii FOREIGN KEY (id_pays) REFERENCES public.pays(id_pays);
 L   ALTER TABLE ONLY public.client DROP CONSTRAINT fk32j9t0u73auk2x1edktxknaii;
       public          postgres    false    232    216    4830                       2606    16538 '   utilisateur fk41gqs88txnr4m3a8pqkfjmsmg    FK CONSTRAINT     �   ALTER TABLE ONLY public.utilisateur
    ADD CONSTRAINT fk41gqs88txnr4m3a8pqkfjmsmg FOREIGN KEY (pays) REFERENCES public.pays(id_pays);
 Q   ALTER TABLE ONLY public.utilisateur DROP CONSTRAINT fk41gqs88txnr4m3a8pqkfjmsmg;
       public          postgres    false    4830    232    242            	           2606    16548 '   utilisateur fk5bpr02rt2n3gnkxqxfq2g2r1w    FK CONSTRAINT     �   ALTER TABLE ONLY public.utilisateur
    ADD CONSTRAINT fk5bpr02rt2n3gnkxqxfq2g2r1w FOREIGN KEY (pole) REFERENCES public.pole(id_pole);
 Q   ALTER TABLE ONLY public.utilisateur DROP CONSTRAINT fk5bpr02rt2n3gnkxqxfq2g2r1w;
       public          postgres    false    4832    234    242                       2606    16715 /   mission_chef_projet fk724wblwwyeu225aq2d39tmukx    FK CONSTRAINT     �   ALTER TABLE ONLY public.mission_chef_projet
    ADD CONSTRAINT fk724wblwwyeu225aq2d39tmukx FOREIGN KEY (mission_id) REFERENCES public.mission(id_mission);
 Y   ALTER TABLE ONLY public.mission_chef_projet DROP CONSTRAINT fk724wblwwyeu225aq2d39tmukx;
       public          postgres    false    248    4848    246                       2606    16681 1   mission_sous_traitant fk8ks6jatywiuojmm4px6h99xdw    FK CONSTRAINT     �   ALTER TABLE ONLY public.mission_sous_traitant
    ADD CONSTRAINT fk8ks6jatywiuojmm4px6h99xdw FOREIGN KEY (mission_id) REFERENCES public.mission(id_mission);
 [   ALTER TABLE ONLY public.mission_sous_traitant DROP CONSTRAINT fk8ks6jatywiuojmm4px6h99xdw;
       public          postgres    false    4848    228    246                       2606    16558 .   mission_partenaire fk93gmy17ikas71tix19t2nhj9i    FK CONSTRAINT     �   ALTER TABLE ONLY public.mission_partenaire
    ADD CONSTRAINT fk93gmy17ikas71tix19t2nhj9i FOREIGN KEY (partenaire_id) REFERENCES public.partenaire(id_partenaire);
 X   ALTER TABLE ONLY public.mission_partenaire DROP CONSTRAINT fk93gmy17ikas71tix19t2nhj9i;
       public          postgres    false    4828    230    226                       2606    16563 -   utilisateur_roles fk94bkkdvxts25rebhksd97r94x    FK CONSTRAINT     �   ALTER TABLE ONLY public.utilisateur_roles
    ADD CONSTRAINT fk94bkkdvxts25rebhksd97r94x FOREIGN KEY (role_id) REFERENCES public.role(id_role);
 W   ALTER TABLE ONLY public.utilisateur_roles DROP CONSTRAINT fk94bkkdvxts25rebhksd97r94x;
       public          postgres    false    244    236    4834                       2606    16568 ,   mission_division fk98xtw6y0fa0fb2rrxy8swfpbr    FK CONSTRAINT     �   ALTER TABLE ONLY public.mission_division
    ADD CONSTRAINT fk98xtw6y0fa0fb2rrxy8swfpbr FOREIGN KEY (division_id) REFERENCES public.division(id_division);
 V   ALTER TABLE ONLY public.mission_division DROP CONSTRAINT fk98xtw6y0fa0fb2rrxy8swfpbr;
       public          postgres    false    4816    224    218                       2606    16573 -   utilisateur_roles fk9lop304xtodorgho9w56lpjhn    FK CONSTRAINT     �   ALTER TABLE ONLY public.utilisateur_roles
    ADD CONSTRAINT fk9lop304xtodorgho9w56lpjhn FOREIGN KEY (utilisateur_id) REFERENCES public.utilisateur(id_utilisateur);
 W   ALTER TABLE ONLY public.utilisateur_roles DROP CONSTRAINT fk9lop304xtodorgho9w56lpjhn;
       public          postgres    false    4844    244    242            �           2606    16578 $   division fkcig18mo60bsnlj48nrhjwfs6j    FK CONSTRAINT     �   ALTER TABLE ONLY public.division
    ADD CONSTRAINT fkcig18mo60bsnlj48nrhjwfs6j FOREIGN KEY (id_pole) REFERENCES public.pole(id_pole);
 N   ALTER TABLE ONLY public.division DROP CONSTRAINT fkcig18mo60bsnlj48nrhjwfs6j;
       public          postgres    false    218    234    4832                       2606    16583 1   mission_sous_traitant fkcrlq1xc5q0glnu8bob6j67gb2    FK CONSTRAINT     �   ALTER TABLE ONLY public.mission_sous_traitant
    ADD CONSTRAINT fkcrlq1xc5q0glnu8bob6j67gb2 FOREIGN KEY (sous_traitant_id) REFERENCES public.sous_traitant(id_soustrait);
 [   ALTER TABLE ONLY public.mission_sous_traitant DROP CONSTRAINT fkcrlq1xc5q0glnu8bob6j67gb2;
       public          postgres    false    4836    228    238                       2606    33189 1   mission_sous_traitant fkcul4b0bebullb0n63eeloylhp    FK CONSTRAINT     �   ALTER TABLE ONLY public.mission_sous_traitant
    ADD CONSTRAINT fkcul4b0bebullb0n63eeloylhp FOREIGN KEY (utilisateur_id) REFERENCES public.utilisateur(id_utilisateur);
 [   ALTER TABLE ONLY public.mission_sous_traitant DROP CONSTRAINT fkcul4b0bebullb0n63eeloylhp;
       public          postgres    false    4844    228    242                       2606    16710 /   mission_chef_projet fkd16dbaka281123xhx3mhq726j    FK CONSTRAINT     �   ALTER TABLE ONLY public.mission_chef_projet
    ADD CONSTRAINT fkd16dbaka281123xhx3mhq726j FOREIGN KEY (chef_projet_id) REFERENCES public.utilisateur(id_utilisateur);
 Y   ALTER TABLE ONLY public.mission_chef_projet DROP CONSTRAINT fkd16dbaka281123xhx3mhq726j;
       public          postgres    false    242    248    4844                       2606    33184 .   historique_mission fkdpwi0y67i3iu4y61mlr9ilfm1    FK CONSTRAINT     �   ALTER TABLE ONLY public.historique_mission
    ADD CONSTRAINT fkdpwi0y67i3iu4y61mlr9ilfm1 FOREIGN KEY (division_id) REFERENCES public.division(id_division);
 X   ALTER TABLE ONLY public.historique_mission DROP CONSTRAINT fkdpwi0y67i3iu4y61mlr9ilfm1;
       public          postgres    false    252    218    4816                       2606    41391 (   avancementst fkdsq8h831qfp26aawa4qqhwq9r    FK CONSTRAINT     �   ALTER TABLE ONLY public.avancementst
    ADD CONSTRAINT fkdsq8h831qfp26aawa4qqhwq9r FOREIGN KEY (chef_projet_id) REFERENCES public.utilisateur(id_utilisateur);
 R   ALTER TABLE ONLY public.avancementst DROP CONSTRAINT fkdsq8h831qfp26aawa4qqhwq9r;
       public          postgres    false    4844    254    242                       2606    16767 &   avancement fkeirwtehebf19c7knbacfosl8v    FK CONSTRAINT     �   ALTER TABLE ONLY public.avancement
    ADD CONSTRAINT fkeirwtehebf19c7knbacfosl8v FOREIGN KEY (chef_projet_id) REFERENCES public.utilisateur(id_utilisateur);
 P   ALTER TABLE ONLY public.avancement DROP CONSTRAINT fkeirwtehebf19c7knbacfosl8v;
       public          postgres    false    4844    250    242            
           2606    16588 '   utilisateur fkfmffytkdu4f3cq2h61dpu7hvp    FK CONSTRAINT     �   ALTER TABLE ONLY public.utilisateur
    ADD CONSTRAINT fkfmffytkdu4f3cq2h61dpu7hvp FOREIGN KEY (division) REFERENCES public.division(id_division);
 Q   ALTER TABLE ONLY public.utilisateur DROP CONSTRAINT fkfmffytkdu4f3cq2h61dpu7hvp;
       public          postgres    false    242    218    4816                        2606    16651 '   facturation fkggb3uvf4xs5s5fw8stt2bgssj    FK CONSTRAINT     �   ALTER TABLE ONLY public.facturation
    ADD CONSTRAINT fkggb3uvf4xs5s5fw8stt2bgssj FOREIGN KEY (id_mission) REFERENCES public.mission(id_mission);
 Q   ALTER TABLE ONLY public.facturation DROP CONSTRAINT fkggb3uvf4xs5s5fw8stt2bgssj;
       public          postgres    false    246    4848    222                       2606    33179 .   historique_mission fkh2ni5675lowvdnbro5qxtj8ur    FK CONSTRAINT     �   ALTER TABLE ONLY public.historique_mission
    ADD CONSTRAINT fkh2ni5675lowvdnbro5qxtj8ur FOREIGN KEY (mission_id) REFERENCES public.mission(id_mission);
 X   ALTER TABLE ONLY public.historique_mission DROP CONSTRAINT fkh2ni5675lowvdnbro5qxtj8ur;
       public          postgres    false    252    246    4848            �           2606    16598 #   affaire fkhv1xsj68vc4mv3po7ewb7uw7s    FK CONSTRAINT     �   ALTER TABLE ONLY public.affaire
    ADD CONSTRAINT fkhv1xsj68vc4mv3po7ewb7uw7s FOREIGN KEY (division_principale_id) REFERENCES public.division(id_division);
 M   ALTER TABLE ONLY public.affaire DROP CONSTRAINT fkhv1xsj68vc4mv3po7ewb7uw7s;
       public          postgres    false    215    4816    218                       2606    16676 .   mission_partenaire fkjxtdr88shtv0guvl0tmo51v06    FK CONSTRAINT     �   ALTER TABLE ONLY public.mission_partenaire
    ADD CONSTRAINT fkjxtdr88shtv0guvl0tmo51v06 FOREIGN KEY (mission_id) REFERENCES public.mission(id_mission);
 X   ALTER TABLE ONLY public.mission_partenaire DROP CONSTRAINT fkjxtdr88shtv0guvl0tmo51v06;
       public          postgres    false    246    226    4848                       2606    41396 (   avancementst fkmxcugxkukv1r69vd5nddk6apx    FK CONSTRAINT     �   ALTER TABLE ONLY public.avancementst
    ADD CONSTRAINT fkmxcugxkukv1r69vd5nddk6apx FOREIGN KEY (id_mission) REFERENCES public.mission(id_mission);
 R   ALTER TABLE ONLY public.avancementst DROP CONSTRAINT fkmxcugxkukv1r69vd5nddk6apx;
       public          postgres    false    4848    254    246            �           2606    16608 #   affaire fkn8qf79r9xdbqkuojftiv6kmpv    FK CONSTRAINT     �   ALTER TABLE ONLY public.affaire
    ADD CONSTRAINT fkn8qf79r9xdbqkuojftiv6kmpv FOREIGN KEY (chef_projet_id) REFERENCES public.utilisateur(id_utilisateur);
 M   ALTER TABLE ONLY public.affaire DROP CONSTRAINT fkn8qf79r9xdbqkuojftiv6kmpv;
       public          postgres    false    4844    242    215            �           2606    16613 #   affaire fkp4vyn5xv1kvyyuqu54yrbv1l4    FK CONSTRAINT     �   ALTER TABLE ONLY public.affaire
    ADD CONSTRAINT fkp4vyn5xv1kvyyuqu54yrbv1l4 FOREIGN KEY (pole_principale_id) REFERENCES public.pole(id_pole);
 M   ALTER TABLE ONLY public.affaire DROP CONSTRAINT fkp4vyn5xv1kvyyuqu54yrbv1l4;
       public          postgres    false    234    4832    215                       2606    16772 &   avancement fkpbasnxloqfnltciavjgg4hd6n    FK CONSTRAINT     �   ALTER TABLE ONLY public.avancement
    ADD CONSTRAINT fkpbasnxloqfnltciavjgg4hd6n FOREIGN KEY (id_mission) REFERENCES public.mission(id_mission);
 P   ALTER TABLE ONLY public.avancement DROP CONSTRAINT fkpbasnxloqfnltciavjgg4hd6n;
       public          postgres    false    4848    246    250            �           2606    16618 "   affaire fkpng8up2jhs51cr05ggnwlw1y    FK CONSTRAINT     �   ALTER TABLE ONLY public.affaire
    ADD CONSTRAINT fkpng8up2jhs51cr05ggnwlw1y FOREIGN KEY (client_id) REFERENCES public.client(id_client);
 L   ALTER TABLE ONLY public.affaire DROP CONSTRAINT fkpng8up2jhs51cr05ggnwlw1y;
       public          postgres    false    215    4814    216                       2606    16666 #   mission fkppdlxub1wu0j9qfnxe1wydfp6    FK CONSTRAINT     �   ALTER TABLE ONLY public.mission
    ADD CONSTRAINT fkppdlxub1wu0j9qfnxe1wydfp6 FOREIGN KEY (unite_id) REFERENCES public.unite(id_unite);
 M   ALTER TABLE ONLY public.mission DROP CONSTRAINT fkppdlxub1wu0j9qfnxe1wydfp6;
       public          postgres    false    240    246    4838                       2606    16661 #   mission fkqbgccawpssglcf4co3jihv7kq    FK CONSTRAINT     �   ALTER TABLE ONLY public.mission
    ADD CONSTRAINT fkqbgccawpssglcf4co3jihv7kq FOREIGN KEY (principal_division_id) REFERENCES public.division(id_division);
 M   ALTER TABLE ONLY public.mission DROP CONSTRAINT fkqbgccawpssglcf4co3jihv7kq;
       public          postgres    false    218    4816    246            �           2606    16638 (   encaissement fkrtg4whpa62yygw0qkgp3klsee    FK CONSTRAINT     �   ALTER TABLE ONLY public.encaissement
    ADD CONSTRAINT fkrtg4whpa62yygw0qkgp3klsee FOREIGN KEY (id_facture) REFERENCES public.facturation(id_facture);
 R   ALTER TABLE ONLY public.encaissement DROP CONSTRAINT fkrtg4whpa62yygw0qkgp3klsee;
       public          postgres    false    220    222    4820            �     x����ʛ@�o�bo�2�?�)�-FJ�"�@�������Jo�{��U�d��g�y����KI��D�
&��� �^��ϖ��K������#��5@���۪��㇒���{$b~"S��OT��C���'�x�)v�fI�sd�[��Yn�r��)dR�����NV+Ւ���l�|)5Y�S�\h���sM�j�ڛ���(�Δ�n���=��m?���̅�+�q�3��I���0�T�=��+�g�4`r'����O��������!SB MgN�&��=�?iw٦����{m��:Q���T�c�Ô���ĉ�)��H�KL��y��$��8_��&@F��)d<�>��*U0�6�C�
g�͹$ϾՈ�,����i�N���5����m��e*3���*�V�p�g����ф����elm
��Uj�,�4�]Q����*]!� c����I�Mwo����I�&k���,��_��c���hl����ڵjG�K��x�_��v���}v      �   0  x�u�M��8�׮S�J )�H�� 3�Ye3H2@���ϓl�.[�r5�����GRZ�O߿������_O֦�eJ%H�,������~|��sa"����y���5n�I�`�w��aE�!�/����)5�d�R�.���2O�hYZ�$^h��@6T��ϜM�!�{|'0#���ӯCS�?E��F�2���o"�?~|���4���[�;jԸ$�Q4z�Sԯ��dnb�JbB�FN��;W�5KaDه���Z�
_$�Y=U��<Q5���&)���o���܋C�DuDW�}w�N!��d:A���P��Z���ZRh��|ud����m`�r��)�Uاv���xVoNP��ֆr�A�2T��_U}�@��5�:ZCf6��JG� �dR�֑&������M(�g�2A��� "�շ,�;�t%�I�gs
�<�̵�~R�>�S�P_��'mF�3E��H��b$�$:��!(�_��S����#�$����q�Y*���C?f���� [�O(�FcLA�ȽsN�xO�F�Ҁ�W��<&��!�ҊFӂ	ZK�!|�|;��{�8/��V��q&�k�;Z�!g�z�\��Z&^�*6�DXu�7>�9R�r_��m_�%��a����#�˞�u�\@�BR5�yL�h���_�a�v*���U�2��~�Q��Yu`(���j#ǧ,�Sa3�|��Z�~TeJ�i����{l�qM��[
��*e������_T��������:�t��Zo0�ya�������ݧ�m2�z�ɵI�{}�H��5l�yY��t7��LkyO�w�o�m���5i�Q��d�}�������#       �      x������ � �      �   L   x�3�L̨L�46��2����H�MM�421�2��s��t�M8S+RsrR�<C.S��Ĝ\�CC.3NG��=... �4�      �   *   x�3�L�,3�4�21�9���@#N#.CÐӐ+F��� �;�      �   �   x�Uϻ�0�9���e �6�cDj�Vm7��H},|~� �<�sm�X�9��9N��~M� ���k��y.��4#��|G��^�&�1I�;J�r�!Ҿ꺶��s{뛪>�^��+ՅK� ��Xk�5#���Z�L�-���_l�P�ck��H�M���잺D���P�:R�.nLI      �   �   x��бn� ������;0fo�NU�JM�ʒc����R��/VH��%�|����,C�ZHD��>
)�����!L�ԋ�0/�0!��Y��x�9/L�y�e򾉧3`-'��(Q�ːR�I�	pw KF�RFw�m�c�2PLs�~�U�3wc
��G�+�[�y`�n���zZ!m!F*�в��1?C\�)��X��%���Ҧsd�S8�:1��n	ʱ<X�^@�X�m��V:��S���wv�im��
zo8�?);uW      �   J  x���[�c!D�a/A~�^Ĭ`���)�p	j�����P1U6����"~Qq,��'X�ϱ�ؓ�HAJ��|-���K��N������q�zJ�9P���U߶�����8/�D.[)S]SP6	��NO����t��Fo��N%��G%�r�g!L���xHùg!�k5Sj��i�R��yHN_�	�Ӱ����C{�2,A�����սNY��$�Ί>i�n7zמt���':�4<��܉�)N|��.b��A����ys{/��](���߷��c66��pů%�҇�o�?4w�]%Ę�x���9É3J�N}+�Wt��oב�q4ǀ��*��>��n��"$X�%�8����>��Ru��xr�'�k)����vH��sR��B��ͤW����GE@�5��#�u�I��O���z��?����l
��qk���)AG{�/o��C�f�a2���/�l|��?���]?�-�hH�~�e����[��ѿ֕	���Ֆ�����
6�*�/���[/�U(��3_���nYh����ܰ?E�����9�/1��������7��	��^��m���[
>�[�����g�      �   �  x���Kn�0���)x3���E[�A�u��h� b���W��:�(S$L��Q�~r�'I���y�� �9t�������i��|į$aN�!^=�kr�C�#"S�I�M�����ϧV߀����
�n!�а9�b?������A��V`�c�,�R���HT�s��T)�Aܝ@Q���5�^G@�ɞ� {[*r5o�]*�x:\��H9�-'�K$��ĳ�r���a��)	��G�DL���TS%�g*�	���9-ZJ���Q�����B,7.Cn��L�7��<�����Qs�?��}=���%x��Y#��T��F۔�WySҀ��4������n/V�����2U/l�)�8�{3��*��G| ����������v�S�=T�ڶD1u6��=^��⵱�wAw���\gks�j�Ry�2�9Dx�� �S.��f���q�+Ī~����LSN<<l�v*_9���Q���헖�xQ�\~����_őiz      �   \   x�]��	�0���.Ϙ������GZ��89j15���j�"�m���c[��Ƚi�X�o�����iM��>Ͳ6>�e�pXvܧ��B� �      �   `   x�5��� D�3[L��^�Q�0���ߘ,��\L�{`V��n�g�,����M��0-��	�c���Y&����R��r���x. /R�l      �      x������ � �      �   �   x�U���0D��� ��4�'��T����pjD��{���@U��0⾽_��U�rݕ�L���p��l�h�y�AT��p��!������#!w����i8��G���m�_�.��)��"K����p�ED��8      �       x�3���/KM�2�L���2�tq����� M`O      �   :  x�U��r�8F��Sh�+MI)��8�8n��c)��To 	C!�$��`6���������\0vu� ����N�H��W�5�kZS�M���h�8X�M��Z1¢5��N!�Sٝ)kq�zSo|����W9C���fh��	����z�������q�|U�VZF�|��]wJ�f��6�*9"�mp�Bz�ae��/��,S�fkv�A碃��K�S����f��)	���s[��oL!�=#�:��:��)K�D���T��F"�5a�')' _�C����lx�N�?���������$#'�НW��$��:$qĪ4)�S"����f��4���4�z���D�5��ߔ2R���G"�f��Hʧ9r?|���L�ۭ��ۙ(�i:G�r��B���߭d���������ѢX�u*�[����KS���{*kp�ք0#��-�?]���f�i�B�W2n�ޙ��
��B���V��h�#���\ݟ�|���ǽT�|�޹`�f`(-�"UM���k4����±�J��\����
�OѭOg8�1�e��~�������[��n�x���L-UT���`�ȉ�0+�	�'���Ew�L&W�t��T]��[�l��u��b�.$ꝑ{T8WK�z4zу�$;���J:�/�s�4&�D �(��V�%�Q�2��כ�$z��)���h���T��Ƅfk���ُ���"ؒ�եlX�
���ŎG�2�G�X#�D�=��y�:��O���M[���.n�]NW�g��,8��_��t���PW��<n��d��l}d���r�ܺg��k"ned����$hљ�6��Orum�n=z�n��ד���C�d.ʒat!�H?ܼvv�mmݴ>h�y����3���+C���Ƭ���s�^��7\��4k�9�2.���y"r�ܸPN��"�|)9-�F�Q0J��m�����k�!�[��s��7�ژC2,�k�&#�F.{:�i�!�K �YJ;M
*o��I�kXy�ڔ���N{�9��[(o.Õ�m�Ȥ$�`���o��2�ă�~��}� ȏ;9��1�4�t��W�����C�;�j&�*8pD�&�1:�q5v2C���h���u��+/��Џ����Ɍsuǃ��,Լ����N༃�8�|h	�T���V�dޓ���қ����xmR���ݛ��k��@�,�p�o�!_�����]o�o���������!�?���<|����M����>��v����ʵ�������}�(�����ղ'Jև=���@�4���:-��P?�)f�eљZt�����o@&�c����s�RAJV���
,/���� ������zI
x^���g-����|���,���C����x�~V�� u/_�:���M�H��z�ol��$�$'���0/�ɏz͠�����d2�\o�5U�-p�/B���gy �I1� ��S`^R�,��KVtm���_ ���<�
@zɯE��� մ�td�z���\}z��2P�)�t2@�`j�!3G��LS�[��hy�2@��?����կT�e��ܿ����v+�z�g�������~VV      �   $   x�3�,��IU0�2�0���!c.Ä+F��� �=	�      �   k   x�3�tL��������M�0�8Ӹ�8�S�R�"��%E�%�e�UΎ@%%\���i
)�
�90� ��\�%�,�83j��g	P���(?+�& ������ ��,Z      �   !   x�3�,.6�2�F\�@Ҙ�H�p��qqq b�!      �      x�3���2��N����� %Q      �   �  x���[��@���_ᅗ�΁�])`*bQ��l�q�����]�}Ab�i�{��B��{��&��f#�姌}�x�1�!�"B"F`C�u�J%�r
��r�3)>� ��*�R0���3�r[���1��
�����ȍ�]�MՍ�gd��v���uI�k�GJ��{�S�˛��@(�)/h�� *�[��G��M�v4���e�����?i&����f����X�ϒ��ȩ��NI$�S#b�m���P��ߛ_��X���C%�)-h����w��#+�V��;��0�&��^F{Z𜎚��ܰ,BCD�8-��ETj�8�F 5Hz󴞜ɫ��܅�Z�����Ȗ5� _�h�3�2z�f�o�}?`��BZ=�:��J��eh.݁�BZ?�
���{S�w�ɷ�!	�k��{D ���<�GH�W� �](�M�܊�"�g)���W=m����vs��n���nL�a`/�  �r��      �   )   x�3���24�4�2��4�22�4�22��221z\\\ Y��     