PGDMP         ,                y           Office    12.2    12.3 �   
           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    52635    Office    DATABASE     �   CREATE DATABASE "Office" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'French_France.1252' LC_CTYPE = 'French_France.1252';
    DROP DATABASE "Office";
                postgres    false            �            1259    52636    account_emailaddress    TABLE     �   CREATE TABLE public.account_emailaddress (
    id bigint NOT NULL,
    email character varying(254) NOT NULL,
    verified boolean NOT NULL,
    "primary" boolean NOT NULL,
    user_id integer NOT NULL
);
 (   DROP TABLE public.account_emailaddress;
       public         heap    postgres    false                       1259    53618    account_emailaddress_id_seq    SEQUENCE     �   CREATE SEQUENCE public.account_emailaddress_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.account_emailaddress_id_seq;
       public          postgres    false    202                       0    0    account_emailaddress_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.account_emailaddress_id_seq OWNED BY public.account_emailaddress.id;
          public          postgres    false    281            �            1259    52641    account_emailconfirmation    TABLE     �   CREATE TABLE public.account_emailconfirmation (
    id bigint NOT NULL,
    created timestamp with time zone NOT NULL,
    sent timestamp with time zone,
    key character varying(64) NOT NULL,
    email_address_id bigint NOT NULL
);
 -   DROP TABLE public.account_emailconfirmation;
       public         heap    postgres    false                       1259    53630     account_emailconfirmation_id_seq    SEQUENCE     �   CREATE SEQUENCE public.account_emailconfirmation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.account_emailconfirmation_id_seq;
       public          postgres    false    203                       0    0     account_emailconfirmation_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.account_emailconfirmation_id_seq OWNED BY public.account_emailconfirmation.id;
          public          postgres    false    282            �            1259    52646    accounts_portefolio    TABLE     �   CREATE TABLE public.accounts_portefolio (
    id uuid NOT NULL,
    active boolean NOT NULL,
    date_created timestamp with time zone,
    lettremission_id uuid,
    rolecollaborateur_id bigint,
    user_id bigint
);
 '   DROP TABLE public.accounts_portefolio;
       public         heap    postgres    false            �            1259    52649    accounts_profile    TABLE       CREATE TABLE public.accounts_profile (
    id bigint NOT NULL,
    name character varying(200),
    phone character varying(200),
    email character varying(200),
    file character varying(100),
    date_created timestamp with time zone,
    user_id integer
);
 $   DROP TABLE public.accounts_profile;
       public         heap    postgres    false            �            1259    52655    accounts_profile_id_seq    SEQUENCE     �   CREATE SEQUENCE public.accounts_profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.accounts_profile_id_seq;
       public          postgres    false    205                       0    0    accounts_profile_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.accounts_profile_id_seq OWNED BY public.accounts_profile.id;
          public          postgres    false    206            �            1259    52657    accounts_pwsafe    TABLE     2  CREATE TABLE public.accounts_pwsafe (
    id uuid NOT NULL,
    active boolean NOT NULL,
    date_created timestamp with time zone,
    username character varying(100) NOT NULL,
    password character varying(50) NOT NULL,
    lettremission_id uuid,
    user_id bigint,
    responsable boolean NOT NULL
);
 #   DROP TABLE public.accounts_pwsafe;
       public         heap    postgres    false            �            1259    52660    accounts_scope    TABLE     l   CREATE TABLE public.accounts_scope (
    id bigint NOT NULL,
    "Scope" character varying(100) NOT NULL
);
 "   DROP TABLE public.accounts_scope;
       public         heap    postgres    false            �            1259    52663    accounts_scope_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.accounts_scope_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.accounts_scope_id_seq;
       public          postgres    false    208                       0    0    accounts_scope_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.accounts_scope_id_seq OWNED BY public.accounts_scope.id;
          public          postgres    false    209            �            1259    52665    accounts_validator    TABLE     �   CREATE TABLE public.accounts_validator (
    id uuid NOT NULL,
    active boolean NOT NULL,
    date_created timestamp with time zone,
    lettremission_id uuid,
    user_id bigint
);
 &   DROP TABLE public.accounts_validator;
       public         heap    postgres    false            �            1259    52668 
   auth_group    TABLE     f   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
    DROP TABLE public.auth_group;
       public         heap    postgres    false            �            1259    52671    auth_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public          postgres    false    211                       0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
          public          postgres    false    212            �            1259    52673    auth_group_permissions    TABLE     �   CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         heap    postgres    false            �            1259    52676    auth_group_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public          postgres    false    213                       0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
          public          postgres    false    214            �            1259    52678    auth_permission    TABLE     �   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         heap    postgres    false            �            1259    52681    auth_permission_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public          postgres    false    215                       0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
          public          postgres    false    216            �            1259    52683 	   auth_user    TABLE     �  CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);
    DROP TABLE public.auth_user;
       public         heap    postgres    false            �            1259    52689    auth_user_groups    TABLE     ~   CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);
 $   DROP TABLE public.auth_user_groups;
       public         heap    postgres    false            �            1259    52692    auth_user_groups_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.auth_user_groups_id_seq;
       public          postgres    false    218                       0    0    auth_user_groups_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;
          public          postgres    false    219            �            1259    52694    auth_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.auth_user_id_seq;
       public          postgres    false    217                       0    0    auth_user_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;
          public          postgres    false    220            �            1259    52696    auth_user_user_permissions    TABLE     �   CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);
 .   DROP TABLE public.auth_user_user_permissions;
       public         heap    postgres    false            �            1259    52699 !   auth_user_user_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.auth_user_user_permissions_id_seq;
       public          postgres    false    221                       0    0 !   auth_user_user_permissions_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;
          public          postgres    false    222            �            1259    52701    csvs_csv    TABLE     �   CREATE TABLE public.csvs_csv (
    id bigint NOT NULL,
    file_name character varying(100),
    uploaded timestamp with time zone NOT NULL,
    activated boolean NOT NULL
);
    DROP TABLE public.csvs_csv;
       public         heap    postgres    false            �            1259    52704    csvs_csv_id_seq    SEQUENCE     x   CREATE SEQUENCE public.csvs_csv_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.csvs_csv_id_seq;
       public          postgres    false    223                       0    0    csvs_csv_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.csvs_csv_id_seq OWNED BY public.csvs_csv.id;
          public          postgres    false    224            �            1259    52706    customers_bankacount    TABLE     �  CREATE TABLE public.customers_bankacount (
    id uuid NOT NULL,
    bank_name character varying(100) NOT NULL,
    agency character varying(100) NOT NULL,
    rib character varying(24) NOT NULL,
    bic character varying(8) NOT NULL,
    iban character varying(2) NOT NULL,
    closed boolean NOT NULL,
    clos_date timestamp with time zone,
    company_id uuid,
    file character varying(100)
);
 (   DROP TABLE public.customers_bankacount;
       public         heap    postgres    false            �            1259    52709    customers_city    TABLE     h   CREATE TABLE public.customers_city (
    id bigint NOT NULL,
    city character varying(50) NOT NULL
);
 "   DROP TABLE public.customers_city;
       public         heap    postgres    false            �            1259    52712    customers_city_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.customers_city_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.customers_city_id_seq;
       public          postgres    false    226                       0    0    customers_city_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.customers_city_id_seq OWNED BY public.customers_city.id;
          public          postgres    false    227            �            1259    52714    customers_company    TABLE     �  CREATE TABLE public.customers_company (
    id uuid NOT NULL,
    name character varying(100) NOT NULL,
    adresse text,
    code_postal character varying(50),
    national_law boolean NOT NULL,
    ice character varying(15),
    identifiant_fiscal character varying(10),
    cnss character varying(10),
    rc character varying(10),
    tp character varying(10),
    activity text,
    fiscal_year integer NOT NULL,
    create_date date,
    share_capital double precision NOT NULL,
    nominal_value double precision NOT NULL,
    statut integer NOT NULL,
    terminate_date date,
    liquidation_date date,
    file character varying(100),
    city character varying(100) NOT NULL,
    country_id character varying(3),
    currency_id character varying(3),
    legal_form_id integer,
    nationality_id character varying(3),
    file_if character varying(100),
    file_rc character varying(100)
);
 %   DROP TABLE public.customers_company;
       public         heap    postgres    false            �            1259    52720    customers_contact    TABLE     
  CREATE TABLE public.customers_contact (
    id uuid NOT NULL,
    fonction character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    phone character varying(100) NOT NULL,
    active boolean NOT NULL,
    company_id uuid,
    person_id uuid
);
 %   DROP TABLE public.customers_contact;
       public         heap    postgres    false            �            1259    52723    customers_country    TABLE     �   CREATE TABLE public.customers_country (
    code_country character varying(3) NOT NULL,
    country character varying(50) NOT NULL
);
 %   DROP TABLE public.customers_country;
       public         heap    postgres    false            �            1259    52726    customers_currency    TABLE     �   CREATE TABLE public.customers_currency (
    currency_code character varying(3) NOT NULL,
    currency character varying(50) NOT NULL
);
 &   DROP TABLE public.customers_currency;
       public         heap    postgres    false            �            1259    52729    customers_legalform    TABLE     �   CREATE TABLE public.customers_legalform (
    code_lf integer NOT NULL,
    lf_name character varying(20) NOT NULL,
    full_lf_name character varying(300) NOT NULL
);
 '   DROP TABLE public.customers_legalform;
       public         heap    postgres    false            �            1259    52732    customers_nationality    TABLE     �   CREATE TABLE public.customers_nationality (
    code_nationality character varying(3) NOT NULL,
    nationality character varying(50) NOT NULL
);
 )   DROP TABLE public.customers_nationality;
       public         heap    postgres    false            �            1259    52735    customers_office    TABLE     �   CREATE TABLE public.customers_office (
    code_lf integer NOT NULL,
    office character varying(100) NOT NULL,
    company_id uuid
);
 $   DROP TABLE public.customers_office;
       public         heap    postgres    false            �            1259    52738    customers_person    TABLE     6  CREATE TABLE public.customers_person (
    id uuid NOT NULL,
    last_name character varying(100) NOT NULL,
    first_name character varying(100) NOT NULL,
    civility integer NOT NULL,
    id_card integer,
    id_numbre character varying(20),
    birth_date date,
    birth_place character varying(50),
    adresse character varying(300),
    code_postal character varying(50),
    resident boolean NOT NULL,
    city character varying(100) NOT NULL,
    country_id character varying(3),
    nationality_id character varying(3),
    file character varying(100)
);
 $   DROP TABLE public.customers_person;
       public         heap    postgres    false                       1259    53654    customers_prospect    TABLE     �   CREATE TABLE public.customers_prospect (
    date_contact date NOT NULL,
    id uuid NOT NULL,
    statut integer NOT NULL,
    comment text,
    contact_id uuid,
    office_id integer
);
 &   DROP TABLE public.customers_prospect;
       public         heap    postgres    false            �            1259    52750    customers_representative    TABLE     �   CREATE TABLE public.customers_representative (
    id uuid NOT NULL,
    date_nomination timestamp with time zone NOT NULL,
    terminate_role boolean NOT NULL,
    company_id uuid,
    person_id uuid,
    rolerepresentative_id bigint
);
 ,   DROP TABLE public.customers_representative;
       public         heap    postgres    false            �            1259    52753    customers_representativecompany    TABLE       CREATE TABLE public.customers_representativecompany (
    id uuid NOT NULL,
    date_nomination timestamp with time zone NOT NULL,
    terminate_role boolean NOT NULL,
    company_id uuid,
    representativelink_id uuid,
    rolerepresentative_id bigint
);
 3   DROP TABLE public.customers_representativecompany;
       public         heap    postgres    false            �            1259    52756    customers_representativelink    TABLE     �   CREATE TABLE public.customers_representativelink (
    id uuid NOT NULL,
    date_nomination timestamp with time zone NOT NULL,
    company_id uuid
);
 0   DROP TABLE public.customers_representativelink;
       public         heap    postgres    false            �            1259    52759    customers_rolerepresentative    TABLE     �   CREATE TABLE public.customers_rolerepresentative (
    id bigint NOT NULL,
    rolerepresentative character varying(200) NOT NULL
);
 0   DROP TABLE public.customers_rolerepresentative;
       public         heap    postgres    false            �            1259    52762 #   customers_rolerepresentative_id_seq    SEQUENCE     �   CREATE SEQUENCE public.customers_rolerepresentative_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.customers_rolerepresentative_id_seq;
       public          postgres    false    239                       0    0 #   customers_rolerepresentative_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.customers_rolerepresentative_id_seq OWNED BY public.customers_rolerepresentative.id;
          public          postgres    false    240            �            1259    52764    customers_shareholder    TABLE     �   CREATE TABLE public.customers_shareholder (
    id uuid NOT NULL,
    action integer NOT NULL,
    company_id uuid,
    person_id uuid
);
 )   DROP TABLE public.customers_shareholder;
       public         heap    postgres    false            �            1259    52767    customers_shareholdercompany    TABLE     �   CREATE TABLE public.customers_shareholdercompany (
    id uuid NOT NULL,
    action integer NOT NULL,
    company_id uuid,
    shareholderlink_id uuid
);
 0   DROP TABLE public.customers_shareholdercompany;
       public         heap    postgres    false            �            1259    52770    customers_shareholderlink    TABLE     �   CREATE TABLE public.customers_shareholderlink (
    id uuid NOT NULL,
    date_participation timestamp with time zone NOT NULL,
    company_id uuid
);
 -   DROP TABLE public.customers_shareholderlink;
       public         heap    postgres    false            �            1259    52773    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);
 $   DROP TABLE public.django_admin_log;
       public         heap    postgres    false            �            1259    52780    django_admin_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public          postgres    false    244                       0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
          public          postgres    false    245            �            1259    52782    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         heap    postgres    false            �            1259    52785    django_content_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public          postgres    false    246                       0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
          public          postgres    false    247            �            1259    52787    django_migrations    TABLE     �   CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         heap    postgres    false            �            1259    52793    django_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public          postgres    false    248                       0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
          public          postgres    false    249            �            1259    52795    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         heap    postgres    false            �            1259    52801    django_site    TABLE     �   CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);
    DROP TABLE public.django_site;
       public         heap    postgres    false            �            1259    52804    django_site_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.django_site_id_seq;
       public          postgres    false    251                       0    0    django_site_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;
          public          postgres    false    252            �            1259    52806    editions_docmodel    TABLE     �   CREATE TABLE public.editions_docmodel (
    code_docmodel character varying(3) NOT NULL,
    name character varying(100) NOT NULL,
    footer boolean NOT NULL,
    header boolean NOT NULL,
    file character varying(100)
);
 %   DROP TABLE public.editions_docmodel;
       public         heap    postgres    false            �            1259    52809    editions_docmodelword    TABLE       CREATE TABLE public.editions_docmodelword (
    id bigint NOT NULL,
    ordre_parag integer,
    type_parag integer,
    sort_parag integer,
    size_font numeric(4,2),
    space_after_parag numeric(4,2),
    space_befor_parag numeric(4,2),
    alignment_parag character varying(10),
    ident_first_ligne numeric(4,2),
    code_docmodel_id character varying(3),
    bold_font boolean NOT NULL,
    undeline_font boolean NOT NULL,
    variable boolean NOT NULL,
    texte text,
    italic_font boolean NOT NULL
);
 )   DROP TABLE public.editions_docmodelword;
       public         heap    postgres    false            �            1259    52815    editions_docmodelword_id_seq    SEQUENCE     �   CREATE SEQUENCE public.editions_docmodelword_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.editions_docmodelword_id_seq;
       public          postgres    false    254                       0    0    editions_docmodelword_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.editions_docmodelword_id_seq OWNED BY public.editions_docmodelword.id;
          public          postgres    false    255                        1259    52817    editions_socialdoc    TABLE     �   CREATE TABLE public.editions_socialdoc (
    id uuid NOT NULL,
    date_doc timestamp with time zone NOT NULL,
    lettremission_id uuid
);
 &   DROP TABLE public.editions_socialdoc;
       public         heap    postgres    false                       1259    52820    editions_stc    TABLE     �   CREATE TABLE public.editions_stc (
    id bigint NOT NULL,
    matricule character varying(10) NOT NULL,
    month integer NOT NULL,
    year integer NOT NULL
);
     DROP TABLE public.editions_stc;
       public         heap    postgres    false                       1259    52823    editions_stc_id_seq    SEQUENCE     |   CREATE SEQUENCE public.editions_stc_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.editions_stc_id_seq;
       public          postgres    false    257                        0    0    editions_stc_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.editions_stc_id_seq OWNED BY public.editions_stc.id;
          public          postgres    false    258                       1259    52825    ordres_lettremission    TABLE     \  CREATE TABLE public.ordres_lettremission (
    id uuid NOT NULL,
    reference character varying(50) NOT NULL,
    db_office character varying(10),
    entry_date date NOT NULL,
    terminate boolean NOT NULL,
    leave_date date,
    file character varying(100) NOT NULL,
    company_id uuid,
    moduleservice_id bigint,
    office_id integer
);
 (   DROP TABLE public.ordres_lettremission;
       public         heap    postgres    false                       1259    52828    ordres_lettremissionlink    TABLE     �   CREATE TABLE public.ordres_lettremissionlink (
    id uuid NOT NULL,
    date_recrutement timestamp with time zone NOT NULL,
    lettremission_id uuid,
    prospect_id uuid
);
 ,   DROP TABLE public.ordres_lettremissionlink;
       public         heap    postgres    false                       1259    52831    ordres_moduleservice    TABLE     x   CREATE TABLE public.ordres_moduleservice (
    id bigint NOT NULL,
    moduleservice character varying(200) NOT NULL
);
 (   DROP TABLE public.ordres_moduleservice;
       public         heap    postgres    false                       1259    52834    ordres_moduleservice_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ordres_moduleservice_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.ordres_moduleservice_id_seq;
       public          postgres    false    261            !           0    0    ordres_moduleservice_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.ordres_moduleservice_id_seq OWNED BY public.ordres_moduleservice.id;
          public          postgres    false    262                       1259    52836    ordres_ordre    TABLE     �   CREATE TABLE public.ordres_ordre (
    id uuid NOT NULL,
    ordre_date date NOT NULL,
    comment character varying(200),
    statut integer NOT NULL,
    file character varying(100) NOT NULL,
    company_id uuid,
    office_id integer
);
     DROP TABLE public.ordres_ordre;
       public         heap    postgres    false                       1259    52839    ordres_outlay    TABLE     �   CREATE TABLE public.ordres_outlay (
    id bigint NOT NULL,
    outlay character varying(100) NOT NULL,
    text character varying(300),
    moduleservice_id bigint
);
 !   DROP TABLE public.ordres_outlay;
       public         heap    postgres    false            	           1259    52842    ordres_outlay_id_seq    SEQUENCE     }   CREATE SEQUENCE public.ordres_outlay_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.ordres_outlay_id_seq;
       public          postgres    false    264            "           0    0    ordres_outlay_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.ordres_outlay_id_seq OWNED BY public.ordres_outlay.id;
          public          postgres    false    265            
           1259    52844    ordres_outlayitem    TABLE     �   CREATE TABLE public.ordres_outlayitem (
    id uuid NOT NULL,
    amount double precision,
    ordre_id uuid,
    outlay_id bigint,
    quantity double precision
);
 %   DROP TABLE public.ordres_outlayitem;
       public         heap    postgres    false                       1259    52847    ordres_service    TABLE     �   CREATE TABLE public.ordres_service (
    id bigint NOT NULL,
    service character varying(100) NOT NULL,
    text character varying(300),
    moduleservice_id bigint
);
 "   DROP TABLE public.ordres_service;
       public         heap    postgres    false                       1259    52850    ordres_service_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.ordres_service_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.ordres_service_id_seq;
       public          postgres    false    267            #           0    0    ordres_service_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.ordres_service_id_seq OWNED BY public.ordres_service.id;
          public          postgres    false    268                       1259    52852    ordres_servicedescription    TABLE     �   CREATE TABLE public.ordres_servicedescription (
    id bigint NOT NULL,
    text character varying(300),
    service_id bigint
);
 -   DROP TABLE public.ordres_servicedescription;
       public         heap    postgres    false                       1259    52855     ordres_servicedescription_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ordres_servicedescription_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.ordres_servicedescription_id_seq;
       public          postgres    false    269            $           0    0     ordres_servicedescription_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.ordres_servicedescription_id_seq OWNED BY public.ordres_servicedescription.id;
          public          postgres    false    270                       1259    52857    ordres_serviceitem    TABLE     �   CREATE TABLE public.ordres_serviceitem (
    id uuid NOT NULL,
    amount double precision,
    taxe double precision NOT NULL,
    ordre_id uuid,
    service_id bigint,
    quantity double precision
);
 &   DROP TABLE public.ordres_serviceitem;
       public         heap    postgres    false                       1259    52860    tasks_benefit    TABLE     �   CREATE TABLE public.tasks_benefit (
    code_benefit character varying(3) NOT NULL,
    name character varying(200) NOT NULL
);
 !   DROP TABLE public.tasks_benefit;
       public         heap    postgres    false                       1259    52863    tasks_benefititem    TABLE     �   CREATE TABLE public.tasks_benefititem (
    id uuid NOT NULL,
    active boolean NOT NULL,
    benefitlink_id uuid,
    date_start date,
    code_benefit_id character varying(3)
);
 %   DROP TABLE public.tasks_benefititem;
       public         heap    postgres    false                       1259    52866    tasks_benefitlink    TABLE     [   CREATE TABLE public.tasks_benefitlink (
    id uuid NOT NULL,
    lettremission_id uuid
);
 %   DROP TABLE public.tasks_benefitlink;
       public         heap    postgres    false                       1259    52869    tasks_benefitrequested    TABLE     �   CREATE TABLE public.tasks_benefitrequested (
    id uuid NOT NULL,
    amountrequested double precision,
    amountreceived double precision,
    statut integer NOT NULL,
    complement character varying(200),
    worklink_id uuid
);
 *   DROP TABLE public.tasks_benefitrequested;
       public         heap    postgres    false                       1259    52872    tasks_claim    TABLE     �   CREATE TABLE public.tasks_claim (
    id uuid NOT NULL,
    objet character varying(200),
    date_start date NOT NULL,
    statut integer NOT NULL,
    date_end date,
    complement text,
    invoiced boolean NOT NULL,
    lettremission_id uuid
);
    DROP TABLE public.tasks_claim;
       public         heap    postgres    false                       1259    52875    tasks_period    TABLE     �   CREATE TABLE public.tasks_period (
    id uuid NOT NULL,
    period character varying(6) NOT NULL,
    echeance date NOT NULL
);
     DROP TABLE public.tasks_period;
       public         heap    postgres    false                       1259    52878 
   tasks_task    TABLE     a  CREATE TABLE public.tasks_task (
    code_task character varying(3) NOT NULL,
    name character varying(150) NOT NULL,
    category integer NOT NULL,
    to_add integer,
    numbre_add integer,
    frequency integer,
    year_civil boolean,
    repeted boolean,
    persontype integer,
    specific boolean,
    code_benefit_id character varying(3)
);
    DROP TABLE public.tasks_task;
       public         heap    postgres    false                       1259    52881    tasks_vatrequested    TABLE     ;  CREATE TABLE public.tasks_vatrequested (
    id uuid NOT NULL,
    year integer NOT NULL,
    month integer NOT NULL,
    amountrequested double precision,
    amountreceived double precision,
    statut integer NOT NULL,
    complement character varying(200),
    benefitlink_id uuid,
    lettremission_id uuid
);
 &   DROP TABLE public.tasks_vatrequested;
       public         heap    postgres    false                       1259    52884 
   tasks_work    TABLE     N  CREATE TABLE public.tasks_work (
    id uuid NOT NULL,
    date_limit date NOT NULL,
    value double precision,
    proof character varying(200),
    statut integer NOT NULL,
    file character varying(100) NOT NULL,
    period_id uuid,
    lettremission_id uuid,
    task_id character varying(3),
    supervised boolean NOT NULL
);
    DROP TABLE public.tasks_work;
       public         heap    postgres    false            �           2604    53620    account_emailaddress id    DEFAULT     �   ALTER TABLE ONLY public.account_emailaddress ALTER COLUMN id SET DEFAULT nextval('public.account_emailaddress_id_seq'::regclass);
 F   ALTER TABLE public.account_emailaddress ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    281    202            �           2604    53632    account_emailconfirmation id    DEFAULT     �   ALTER TABLE ONLY public.account_emailconfirmation ALTER COLUMN id SET DEFAULT nextval('public.account_emailconfirmation_id_seq'::regclass);
 K   ALTER TABLE public.account_emailconfirmation ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    282    203            �           2604    52889    accounts_profile id    DEFAULT     z   ALTER TABLE ONLY public.accounts_profile ALTER COLUMN id SET DEFAULT nextval('public.accounts_profile_id_seq'::regclass);
 B   ALTER TABLE public.accounts_profile ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    206    205            �           2604    52890    accounts_scope id    DEFAULT     v   ALTER TABLE ONLY public.accounts_scope ALTER COLUMN id SET DEFAULT nextval('public.accounts_scope_id_seq'::regclass);
 @   ALTER TABLE public.accounts_scope ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    208            �           2604    52891    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    212    211            �           2604    52892    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    213            �           2604    52893    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215            �           2604    52894    auth_user id    DEFAULT     l   ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);
 ;   ALTER TABLE public.auth_user ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    217            �           2604    52895    auth_user_groups id    DEFAULT     z   ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);
 B   ALTER TABLE public.auth_user_groups ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218            �           2604    52896    auth_user_user_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);
 L   ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    221            �           2604    52897    csvs_csv id    DEFAULT     j   ALTER TABLE ONLY public.csvs_csv ALTER COLUMN id SET DEFAULT nextval('public.csvs_csv_id_seq'::regclass);
 :   ALTER TABLE public.csvs_csv ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    223            �           2604    52898    customers_city id    DEFAULT     v   ALTER TABLE ONLY public.customers_city ALTER COLUMN id SET DEFAULT nextval('public.customers_city_id_seq'::regclass);
 @   ALTER TABLE public.customers_city ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    226            �           2604    52899    customers_rolerepresentative id    DEFAULT     �   ALTER TABLE ONLY public.customers_rolerepresentative ALTER COLUMN id SET DEFAULT nextval('public.customers_rolerepresentative_id_seq'::regclass);
 N   ALTER TABLE public.customers_rolerepresentative ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    240    239            �           2604    52900    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    245    244            �           2604    52901    django_content_type id    DEFAULT     �   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    247    246            �           2604    52902    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    249    248            �           2604    52903    django_site id    DEFAULT     p   ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);
 =   ALTER TABLE public.django_site ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    252    251            �           2604    52904    editions_docmodelword id    DEFAULT     �   ALTER TABLE ONLY public.editions_docmodelword ALTER COLUMN id SET DEFAULT nextval('public.editions_docmodelword_id_seq'::regclass);
 G   ALTER TABLE public.editions_docmodelword ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    255    254            �           2604    52905    editions_stc id    DEFAULT     r   ALTER TABLE ONLY public.editions_stc ALTER COLUMN id SET DEFAULT nextval('public.editions_stc_id_seq'::regclass);
 >   ALTER TABLE public.editions_stc ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    258    257            �           2604    52906    ordres_moduleservice id    DEFAULT     �   ALTER TABLE ONLY public.ordres_moduleservice ALTER COLUMN id SET DEFAULT nextval('public.ordres_moduleservice_id_seq'::regclass);
 F   ALTER TABLE public.ordres_moduleservice ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    262    261            �           2604    52907    ordres_outlay id    DEFAULT     t   ALTER TABLE ONLY public.ordres_outlay ALTER COLUMN id SET DEFAULT nextval('public.ordres_outlay_id_seq'::regclass);
 ?   ALTER TABLE public.ordres_outlay ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    265    264            �           2604    52908    ordres_service id    DEFAULT     v   ALTER TABLE ONLY public.ordres_service ALTER COLUMN id SET DEFAULT nextval('public.ordres_service_id_seq'::regclass);
 @   ALTER TABLE public.ordres_service ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    268    267            �           2604    52909    ordres_servicedescription id    DEFAULT     �   ALTER TABLE ONLY public.ordres_servicedescription ALTER COLUMN id SET DEFAULT nextval('public.ordres_servicedescription_id_seq'::regclass);
 K   ALTER TABLE public.ordres_servicedescription ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    270    269            �          0    52636    account_emailaddress 
   TABLE DATA           W   COPY public.account_emailaddress (id, email, verified, "primary", user_id) FROM stdin;
    public          postgres    false    202   1�      �          0    52641    account_emailconfirmation 
   TABLE DATA           ]   COPY public.account_emailconfirmation (id, created, sent, key, email_address_id) FROM stdin;
    public          postgres    false    203   ��      �          0    52646    accounts_portefolio 
   TABLE DATA           x   COPY public.accounts_portefolio (id, active, date_created, lettremission_id, rolecollaborateur_id, user_id) FROM stdin;
    public          postgres    false    204   ��      �          0    52649    accounts_profile 
   TABLE DATA           _   COPY public.accounts_profile (id, name, phone, email, file, date_created, user_id) FROM stdin;
    public          postgres    false    205   ��      �          0    52657    accounts_pwsafe 
   TABLE DATA              COPY public.accounts_pwsafe (id, active, date_created, username, password, lettremission_id, user_id, responsable) FROM stdin;
    public          postgres    false    207   V�      �          0    52660    accounts_scope 
   TABLE DATA           5   COPY public.accounts_scope (id, "Scope") FROM stdin;
    public          postgres    false    208   ��      �          0    52665    accounts_validator 
   TABLE DATA           a   COPY public.accounts_validator (id, active, date_created, lettremission_id, user_id) FROM stdin;
    public          postgres    false    210   P�      �          0    52668 
   auth_group 
   TABLE DATA           .   COPY public.auth_group (id, name) FROM stdin;
    public          postgres    false    211   �      �          0    52673    auth_group_permissions 
   TABLE DATA           M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public          postgres    false    213   *      �          0    52678    auth_permission 
   TABLE DATA           N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public          postgres    false    215   �      �          0    52683 	   auth_user 
   TABLE DATA           �   COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    public          postgres    false    217   �      �          0    52689    auth_user_groups 
   TABLE DATA           A   COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
    public          postgres    false    218   �      �          0    52696    auth_user_user_permissions 
   TABLE DATA           P   COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public          postgres    false    221   H      �          0    52701    csvs_csv 
   TABLE DATA           F   COPY public.csvs_csv (id, file_name, uploaded, activated) FROM stdin;
    public          postgres    false    223   e      �          0    52706    customers_bankacount 
   TABLE DATA           z   COPY public.customers_bankacount (id, bank_name, agency, rib, bic, iban, closed, clos_date, company_id, file) FROM stdin;
    public          postgres    false    225   �      �          0    52709    customers_city 
   TABLE DATA           2   COPY public.customers_city (id, city) FROM stdin;
    public          postgres    false    226   �      �          0    52714    customers_company 
   TABLE DATA           B  COPY public.customers_company (id, name, adresse, code_postal, national_law, ice, identifiant_fiscal, cnss, rc, tp, activity, fiscal_year, create_date, share_capital, nominal_value, statut, terminate_date, liquidation_date, file, city, country_id, currency_id, legal_form_id, nationality_id, file_if, file_rc) FROM stdin;
    public          postgres    false    228         �          0    52720    customers_contact 
   TABLE DATA           f   COPY public.customers_contact (id, fonction, email, phone, active, company_id, person_id) FROM stdin;
    public          postgres    false    229   �o      �          0    52723    customers_country 
   TABLE DATA           B   COPY public.customers_country (code_country, country) FROM stdin;
    public          postgres    false    230   �p      �          0    52726    customers_currency 
   TABLE DATA           E   COPY public.customers_currency (currency_code, currency) FROM stdin;
    public          postgres    false    231   Bx      �          0    52729    customers_legalform 
   TABLE DATA           M   COPY public.customers_legalform (code_lf, lf_name, full_lf_name) FROM stdin;
    public          postgres    false    232   ��      �          0    52732    customers_nationality 
   TABLE DATA           N   COPY public.customers_nationality (code_nationality, nationality) FROM stdin;
    public          postgres    false    233   ��      �          0    52735    customers_office 
   TABLE DATA           G   COPY public.customers_office (code_lf, office, company_id) FROM stdin;
    public          postgres    false    234   ��      �          0    52738    customers_person 
   TABLE DATA           �   COPY public.customers_person (id, last_name, first_name, civility, id_card, id_numbre, birth_date, birth_place, adresse, code_postal, resident, city, country_id, nationality_id, file) FROM stdin;
    public          postgres    false    235   �                0    53654    customers_prospect 
   TABLE DATA           f   COPY public.customers_prospect (date_contact, id, statut, comment, contact_id, office_id) FROM stdin;
    public          postgres    false    283   M�      �          0    52750    customers_representative 
   TABLE DATA           �   COPY public.customers_representative (id, date_nomination, terminate_role, company_id, person_id, rolerepresentative_id) FROM stdin;
    public          postgres    false    236   Ԫ      �          0    52753    customers_representativecompany 
   TABLE DATA           �   COPY public.customers_representativecompany (id, date_nomination, terminate_role, company_id, representativelink_id, rolerepresentative_id) FROM stdin;
    public          postgres    false    237   �      �          0    52756    customers_representativelink 
   TABLE DATA           W   COPY public.customers_representativelink (id, date_nomination, company_id) FROM stdin;
    public          postgres    false    238   �      �          0    52759    customers_rolerepresentative 
   TABLE DATA           N   COPY public.customers_rolerepresentative (id, rolerepresentative) FROM stdin;
    public          postgres    false    239   +�      �          0    52764    customers_shareholder 
   TABLE DATA           R   COPY public.customers_shareholder (id, action, company_id, person_id) FROM stdin;
    public          postgres    false    241   H�      �          0    52767    customers_shareholdercompany 
   TABLE DATA           b   COPY public.customers_shareholdercompany (id, action, company_id, shareholderlink_id) FROM stdin;
    public          postgres    false    242   �      �          0    52770    customers_shareholderlink 
   TABLE DATA           W   COPY public.customers_shareholderlink (id, date_participation, company_id) FROM stdin;
    public          postgres    false    243   ��      �          0    52773    django_admin_log 
   TABLE DATA           �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public          postgres    false    244   ��      �          0    52782    django_content_type 
   TABLE DATA           C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public          postgres    false    246   �      �          0    52787    django_migrations 
   TABLE DATA           C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public          postgres    false    248   �      �          0    52795    django_session 
   TABLE DATA           P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public          postgres    false    250   �      �          0    52801    django_site 
   TABLE DATA           7   COPY public.django_site (id, domain, name) FROM stdin;
    public          postgres    false    251   �      �          0    52806    editions_docmodel 
   TABLE DATA           V   COPY public.editions_docmodel (code_docmodel, name, footer, header, file) FROM stdin;
    public          postgres    false    253   �      �          0    52809    editions_docmodelword 
   TABLE DATA           �   COPY public.editions_docmodelword (id, ordre_parag, type_parag, sort_parag, size_font, space_after_parag, space_befor_parag, alignment_parag, ident_first_ligne, code_docmodel_id, bold_font, undeline_font, variable, texte, italic_font) FROM stdin;
    public          postgres    false    254   �      �          0    52817    editions_socialdoc 
   TABLE DATA           L   COPY public.editions_socialdoc (id, date_doc, lettremission_id) FROM stdin;
    public          postgres    false    256   W      �          0    52820    editions_stc 
   TABLE DATA           B   COPY public.editions_stc (id, matricule, month, year) FROM stdin;
    public          postgres    false    257   t      �          0    52825    ordres_lettremission 
   TABLE DATA           �   COPY public.ordres_lettremission (id, reference, db_office, entry_date, terminate, leave_date, file, company_id, moduleservice_id, office_id) FROM stdin;
    public          postgres    false    259   �      �          0    52828    ordres_lettremissionlink 
   TABLE DATA           g   COPY public.ordres_lettremissionlink (id, date_recrutement, lettremission_id, prospect_id) FROM stdin;
    public          postgres    false    260   �M      �          0    52831    ordres_moduleservice 
   TABLE DATA           A   COPY public.ordres_moduleservice (id, moduleservice) FROM stdin;
    public          postgres    false    261   �M      �          0    52836    ordres_ordre 
   TABLE DATA           d   COPY public.ordres_ordre (id, ordre_date, comment, statut, file, company_id, office_id) FROM stdin;
    public          postgres    false    263   ;N      �          0    52839    ordres_outlay 
   TABLE DATA           K   COPY public.ordres_outlay (id, outlay, text, moduleservice_id) FROM stdin;
    public          postgres    false    264   �O      �          0    52844    ordres_outlayitem 
   TABLE DATA           V   COPY public.ordres_outlayitem (id, amount, ordre_id, outlay_id, quantity) FROM stdin;
    public          postgres    false    266   �P      �          0    52847    ordres_service 
   TABLE DATA           M   COPY public.ordres_service (id, service, text, moduleservice_id) FROM stdin;
    public          postgres    false    267   �Q      �          0    52852    ordres_servicedescription 
   TABLE DATA           I   COPY public.ordres_servicedescription (id, text, service_id) FROM stdin;
    public          postgres    false    269   �X      �          0    52857    ordres_serviceitem 
   TABLE DATA           ^   COPY public.ordres_serviceitem (id, amount, taxe, ordre_id, service_id, quantity) FROM stdin;
    public          postgres    false    271   �t      �          0    52860    tasks_benefit 
   TABLE DATA           ;   COPY public.tasks_benefit (code_benefit, name) FROM stdin;
    public          postgres    false    272   �u      �          0    52863    tasks_benefititem 
   TABLE DATA           d   COPY public.tasks_benefititem (id, active, benefitlink_id, date_start, code_benefit_id) FROM stdin;
    public          postgres    false    273   lv      �          0    52866    tasks_benefitlink 
   TABLE DATA           A   COPY public.tasks_benefitlink (id, lettremission_id) FROM stdin;
    public          postgres    false    274   M�      �          0    52869    tasks_benefitrequested 
   TABLE DATA           v   COPY public.tasks_benefitrequested (id, amountrequested, amountreceived, statut, complement, worklink_id) FROM stdin;
    public          postgres    false    275   ��                 0    52872    tasks_claim 
   TABLE DATA           v   COPY public.tasks_claim (id, objet, date_start, statut, date_end, complement, invoiced, lettremission_id) FROM stdin;
    public          postgres    false    276   ��                0    52875    tasks_period 
   TABLE DATA           <   COPY public.tasks_period (id, period, echeance) FROM stdin;
    public          postgres    false    277   5�                0    52878 
   tasks_task 
   TABLE DATA           �   COPY public.tasks_task (code_task, name, category, to_add, numbre_add, frequency, year_civil, repeted, persontype, specific, code_benefit_id) FROM stdin;
    public          postgres    false    278   ��                0    52881    tasks_vatrequested 
   TABLE DATA           �   COPY public.tasks_vatrequested (id, year, month, amountrequested, amountreceived, statut, complement, benefitlink_id, lettremission_id) FROM stdin;
    public          postgres    false    279   r�                0    52884 
   tasks_work 
   TABLE DATA           �   COPY public.tasks_work (id, date_limit, value, proof, statut, file, period_id, lettremission_id, task_id, supervised) FROM stdin;
    public          postgres    false    280   ��      %           0    0    account_emailaddress_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.account_emailaddress_id_seq', 2, true);
          public          postgres    false    281            &           0    0     account_emailconfirmation_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.account_emailconfirmation_id_seq', 1, false);
          public          postgres    false    282            '           0    0    accounts_profile_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.accounts_profile_id_seq', 15, true);
          public          postgres    false    206            (           0    0    accounts_scope_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.accounts_scope_id_seq', 1, false);
          public          postgres    false    209            )           0    0    auth_group_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, true);
          public          postgres    false    212            *           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 31, true);
          public          postgres    false    214            +           0    0    auth_permission_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_permission_id_seq', 220, true);
          public          postgres    false    216            ,           0    0    auth_user_groups_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 12, true);
          public          postgres    false    219            -           0    0    auth_user_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.auth_user_id_seq', 15, true);
          public          postgres    false    220            .           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);
          public          postgres    false    222            /           0    0    csvs_csv_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.csvs_csv_id_seq', 16, true);
          public          postgres    false    224            0           0    0    customers_city_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.customers_city_id_seq', 1, false);
          public          postgres    false    227            1           0    0 #   customers_rolerepresentative_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.customers_rolerepresentative_id_seq', 1, false);
          public          postgres    false    240            2           0    0    django_admin_log_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 519, true);
          public          postgres    false    245            3           0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 55, true);
          public          postgres    false    247            4           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 80, true);
          public          postgres    false    249            5           0    0    django_site_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.django_site_id_seq', 1, true);
          public          postgres    false    252            6           0    0    editions_docmodelword_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.editions_docmodelword_id_seq', 7, true);
          public          postgres    false    255            7           0    0    editions_stc_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.editions_stc_id_seq', 1, false);
          public          postgres    false    258            8           0    0    ordres_moduleservice_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.ordres_moduleservice_id_seq', 1, false);
          public          postgres    false    262            9           0    0    ordres_outlay_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.ordres_outlay_id_seq', 6, true);
          public          postgres    false    265            :           0    0    ordres_service_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.ordres_service_id_seq', 1, false);
          public          postgres    false    268            ;           0    0     ordres_servicedescription_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.ordres_servicedescription_id_seq', 1, false);
          public          postgres    false    270            �           2606    52911 3   account_emailaddress account_emailaddress_email_key 
   CONSTRAINT     o   ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_email_key UNIQUE (email);
 ]   ALTER TABLE ONLY public.account_emailaddress DROP CONSTRAINT account_emailaddress_email_key;
       public            postgres    false    202            �           2606    53617 .   account_emailaddress account_emailaddress_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.account_emailaddress DROP CONSTRAINT account_emailaddress_pkey;
       public            postgres    false    202            �           2606    52915 ;   account_emailconfirmation account_emailconfirmation_key_key 
   CONSTRAINT     u   ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_key_key UNIQUE (key);
 e   ALTER TABLE ONLY public.account_emailconfirmation DROP CONSTRAINT account_emailconfirmation_key_key;
       public            postgres    false    203            �           2606    53629 8   account_emailconfirmation account_emailconfirmation_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.account_emailconfirmation DROP CONSTRAINT account_emailconfirmation_pkey;
       public            postgres    false    203            �           2606    52919 ,   accounts_portefolio accounts_portefolio_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.accounts_portefolio
    ADD CONSTRAINT accounts_portefolio_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.accounts_portefolio DROP CONSTRAINT accounts_portefolio_pkey;
       public            postgres    false    204            �           2606    52921 N   accounts_portefolio accounts_portefolio_user_id_lettremission_id_e6855540_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.accounts_portefolio
    ADD CONSTRAINT accounts_portefolio_user_id_lettremission_id_e6855540_uniq UNIQUE (user_id, lettremission_id);
 x   ALTER TABLE ONLY public.accounts_portefolio DROP CONSTRAINT accounts_portefolio_user_id_lettremission_id_e6855540_uniq;
       public            postgres    false    204    204            �           2606    52923 &   accounts_profile accounts_profile_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.accounts_profile
    ADD CONSTRAINT accounts_profile_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.accounts_profile DROP CONSTRAINT accounts_profile_pkey;
       public            postgres    false    205            �           2606    52925 -   accounts_profile accounts_profile_user_id_key 
   CONSTRAINT     k   ALTER TABLE ONLY public.accounts_profile
    ADD CONSTRAINT accounts_profile_user_id_key UNIQUE (user_id);
 W   ALTER TABLE ONLY public.accounts_profile DROP CONSTRAINT accounts_profile_user_id_key;
       public            postgres    false    205            �           2606    52927 $   accounts_pwsafe accounts_pwsafe_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.accounts_pwsafe
    ADD CONSTRAINT accounts_pwsafe_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.accounts_pwsafe DROP CONSTRAINT accounts_pwsafe_pkey;
       public            postgres    false    207            �           2606    52929 G   accounts_pwsafe accounts_pwsafe_username_lettremission_id_3c7f44d1_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.accounts_pwsafe
    ADD CONSTRAINT accounts_pwsafe_username_lettremission_id_3c7f44d1_uniq UNIQUE (username, lettremission_id);
 q   ALTER TABLE ONLY public.accounts_pwsafe DROP CONSTRAINT accounts_pwsafe_username_lettremission_id_3c7f44d1_uniq;
       public            postgres    false    207    207            �           2606    52931 '   accounts_scope accounts_scope_Scope_key 
   CONSTRAINT     g   ALTER TABLE ONLY public.accounts_scope
    ADD CONSTRAINT "accounts_scope_Scope_key" UNIQUE ("Scope");
 S   ALTER TABLE ONLY public.accounts_scope DROP CONSTRAINT "accounts_scope_Scope_key";
       public            postgres    false    208            �           2606    52933 "   accounts_scope accounts_scope_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.accounts_scope
    ADD CONSTRAINT accounts_scope_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.accounts_scope DROP CONSTRAINT accounts_scope_pkey;
       public            postgres    false    208            �           2606    52935 *   accounts_validator accounts_validator_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.accounts_validator
    ADD CONSTRAINT accounts_validator_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.accounts_validator DROP CONSTRAINT accounts_validator_pkey;
       public            postgres    false    210            �           2606    52937 L   accounts_validator accounts_validator_user_id_lettremission_id_dd0dd010_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.accounts_validator
    ADD CONSTRAINT accounts_validator_user_id_lettremission_id_dd0dd010_uniq UNIQUE (user_id, lettremission_id);
 v   ALTER TABLE ONLY public.accounts_validator DROP CONSTRAINT accounts_validator_user_id_lettremission_id_dd0dd010_uniq;
       public            postgres    false    210    210            �           2606    52939    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public            postgres    false    211            �           2606    52941 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public            postgres    false    213    213            �           2606    52943 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public            postgres    false    213            �           2606    52945    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public            postgres    false    211            �           2606    52947 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public            postgres    false    215    215            �           2606    52949 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public            postgres    false    215            �           2606    52951 &   auth_user_groups auth_user_groups_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
       public            postgres    false    218            �           2606    52953 @   auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);
 j   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq;
       public            postgres    false    218    218            �           2606    52955    auth_user auth_user_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
       public            postgres    false    217            �           2606    52957 :   auth_user_user_permissions auth_user_user_permissions_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
       public            postgres    false    221            �           2606    52959 Y   auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
       public            postgres    false    221    221            �           2606    52961     auth_user auth_user_username_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);
 J   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
       public            postgres    false    217            �           2606    52963    csvs_csv csvs_csv_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.csvs_csv
    ADD CONSTRAINT csvs_csv_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.csvs_csv DROP CONSTRAINT csvs_csv_pkey;
       public            postgres    false    223                       2606    52965 L   customers_bankacount customers_bankacount_company_id_bank_name_052b55cc_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.customers_bankacount
    ADD CONSTRAINT customers_bankacount_company_id_bank_name_052b55cc_uniq UNIQUE (company_id, bank_name);
 v   ALTER TABLE ONLY public.customers_bankacount DROP CONSTRAINT customers_bankacount_company_id_bank_name_052b55cc_uniq;
       public            postgres    false    225    225                       2606    52967 .   customers_bankacount customers_bankacount_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.customers_bankacount
    ADD CONSTRAINT customers_bankacount_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.customers_bankacount DROP CONSTRAINT customers_bankacount_pkey;
       public            postgres    false    225                       2606    52969 1   customers_bankacount customers_bankacount_rib_key 
   CONSTRAINT     k   ALTER TABLE ONLY public.customers_bankacount
    ADD CONSTRAINT customers_bankacount_rib_key UNIQUE (rib);
 [   ALTER TABLE ONLY public.customers_bankacount DROP CONSTRAINT customers_bankacount_rib_key;
       public            postgres    false    225            
           2606    52971 &   customers_city customers_city_city_key 
   CONSTRAINT     a   ALTER TABLE ONLY public.customers_city
    ADD CONSTRAINT customers_city_city_key UNIQUE (city);
 P   ALTER TABLE ONLY public.customers_city DROP CONSTRAINT customers_city_city_key;
       public            postgres    false    226                       2606    52973 "   customers_city customers_city_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.customers_city
    ADD CONSTRAINT customers_city_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.customers_city DROP CONSTRAINT customers_city_pkey;
       public            postgres    false    226                       2606    52975 ,   customers_company customers_company_name_key 
   CONSTRAINT     g   ALTER TABLE ONLY public.customers_company
    ADD CONSTRAINT customers_company_name_key UNIQUE (name);
 V   ALTER TABLE ONLY public.customers_company DROP CONSTRAINT customers_company_name_key;
       public            postgres    false    228                       2606    52977 (   customers_company customers_company_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.customers_company
    ADD CONSTRAINT customers_company_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.customers_company DROP CONSTRAINT customers_company_pkey;
       public            postgres    false    228                       2606    52979 F   customers_contact customers_contact_company_id_person_id_63ddd7a1_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.customers_contact
    ADD CONSTRAINT customers_contact_company_id_person_id_63ddd7a1_uniq UNIQUE (company_id, person_id);
 p   ALTER TABLE ONLY public.customers_contact DROP CONSTRAINT customers_contact_company_id_person_id_63ddd7a1_uniq;
       public            postgres    false    229    229                       2606    52981 (   customers_contact customers_contact_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.customers_contact
    ADD CONSTRAINT customers_contact_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.customers_contact DROP CONSTRAINT customers_contact_pkey;
       public            postgres    false    229            "           2606    52983 /   customers_country customers_country_country_key 
   CONSTRAINT     m   ALTER TABLE ONLY public.customers_country
    ADD CONSTRAINT customers_country_country_key UNIQUE (country);
 Y   ALTER TABLE ONLY public.customers_country DROP CONSTRAINT customers_country_country_key;
       public            postgres    false    230            $           2606    52985 (   customers_country customers_country_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.customers_country
    ADD CONSTRAINT customers_country_pkey PRIMARY KEY (code_country);
 R   ALTER TABLE ONLY public.customers_country DROP CONSTRAINT customers_country_pkey;
       public            postgres    false    230            (           2606    52987 2   customers_currency customers_currency_currency_key 
   CONSTRAINT     q   ALTER TABLE ONLY public.customers_currency
    ADD CONSTRAINT customers_currency_currency_key UNIQUE (currency);
 \   ALTER TABLE ONLY public.customers_currency DROP CONSTRAINT customers_currency_currency_key;
       public            postgres    false    231            *           2606    52989 *   customers_currency customers_currency_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY public.customers_currency
    ADD CONSTRAINT customers_currency_pkey PRIMARY KEY (currency_code);
 T   ALTER TABLE ONLY public.customers_currency DROP CONSTRAINT customers_currency_pkey;
       public            postgres    false    231            -           2606    52991 3   customers_legalform customers_legalform_lf_name_key 
   CONSTRAINT     q   ALTER TABLE ONLY public.customers_legalform
    ADD CONSTRAINT customers_legalform_lf_name_key UNIQUE (lf_name);
 ]   ALTER TABLE ONLY public.customers_legalform DROP CONSTRAINT customers_legalform_lf_name_key;
       public            postgres    false    232            /           2606    52993 ,   customers_legalform customers_legalform_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.customers_legalform
    ADD CONSTRAINT customers_legalform_pkey PRIMARY KEY (code_lf);
 V   ALTER TABLE ONLY public.customers_legalform DROP CONSTRAINT customers_legalform_pkey;
       public            postgres    false    232            3           2606    52995 ;   customers_nationality customers_nationality_nationality_key 
   CONSTRAINT     }   ALTER TABLE ONLY public.customers_nationality
    ADD CONSTRAINT customers_nationality_nationality_key UNIQUE (nationality);
 e   ALTER TABLE ONLY public.customers_nationality DROP CONSTRAINT customers_nationality_nationality_key;
       public            postgres    false    233            5           2606    52997 0   customers_nationality customers_nationality_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.customers_nationality
    ADD CONSTRAINT customers_nationality_pkey PRIMARY KEY (code_nationality);
 Z   ALTER TABLE ONLY public.customers_nationality DROP CONSTRAINT customers_nationality_pkey;
       public            postgres    false    233            9           2606    52999 ,   customers_office customers_office_office_key 
   CONSTRAINT     i   ALTER TABLE ONLY public.customers_office
    ADD CONSTRAINT customers_office_office_key UNIQUE (office);
 V   ALTER TABLE ONLY public.customers_office DROP CONSTRAINT customers_office_office_key;
       public            postgres    false    234            ;           2606    53001 &   customers_office customers_office_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.customers_office
    ADD CONSTRAINT customers_office_pkey PRIMARY KEY (code_lf);
 P   ALTER TABLE ONLY public.customers_office DROP CONSTRAINT customers_office_pkey;
       public            postgres    false    234            ?           2606    53003 D   customers_person customers_person_last_name_first_name_88406199_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.customers_person
    ADD CONSTRAINT customers_person_last_name_first_name_88406199_uniq UNIQUE (last_name, first_name);
 n   ALTER TABLE ONLY public.customers_person DROP CONSTRAINT customers_person_last_name_first_name_88406199_uniq;
       public            postgres    false    235    235            C           2606    53005 &   customers_person customers_person_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.customers_person
    ADD CONSTRAINT customers_person_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.customers_person DROP CONSTRAINT customers_person_pkey;
       public            postgres    false    235            �           2606    53663 H   customers_prospect customers_prospect_contact_id_office_id_d0c39ec2_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.customers_prospect
    ADD CONSTRAINT customers_prospect_contact_id_office_id_d0c39ec2_uniq UNIQUE (contact_id, office_id);
 r   ALTER TABLE ONLY public.customers_prospect DROP CONSTRAINT customers_prospect_contact_id_office_id_d0c39ec2_uniq;
       public            postgres    false    283    283            �           2606    53661 *   customers_prospect customers_prospect_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.customers_prospect
    ADD CONSTRAINT customers_prospect_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.customers_prospect DROP CONSTRAINT customers_prospect_pkey;
       public            postgres    false    283            F           2606    53011 T   customers_representative customers_representative_company_id_person_id_fa330ece_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.customers_representative
    ADD CONSTRAINT customers_representative_company_id_person_id_fa330ece_uniq UNIQUE (company_id, person_id);
 ~   ALTER TABLE ONLY public.customers_representative DROP CONSTRAINT customers_representative_company_id_person_id_fa330ece_uniq;
       public            postgres    false    236    236            L           2606    53013 _   customers_representativecompany customers_representative_company_id_representativ_476df8f0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.customers_representativecompany
    ADD CONSTRAINT customers_representative_company_id_representativ_476df8f0_uniq UNIQUE (company_id, representativelink_id);
 �   ALTER TABLE ONLY public.customers_representativecompany DROP CONSTRAINT customers_representative_company_id_representativ_476df8f0_uniq;
       public            postgres    false    237    237            I           2606    53015 6   customers_representative customers_representative_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.customers_representative
    ADD CONSTRAINT customers_representative_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.customers_representative DROP CONSTRAINT customers_representative_pkey;
       public            postgres    false    236            O           2606    53017 D   customers_representativecompany customers_representativecompany_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.customers_representativecompany
    ADD CONSTRAINT customers_representativecompany_pkey PRIMARY KEY (id);
 n   ALTER TABLE ONLY public.customers_representativecompany DROP CONSTRAINT customers_representativecompany_pkey;
       public            postgres    false    237            S           2606    53019 H   customers_representativelink customers_representativelink_company_id_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.customers_representativelink
    ADD CONSTRAINT customers_representativelink_company_id_key UNIQUE (company_id);
 r   ALTER TABLE ONLY public.customers_representativelink DROP CONSTRAINT customers_representativelink_company_id_key;
       public            postgres    false    238            U           2606    53021 >   customers_representativelink customers_representativelink_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.customers_representativelink
    ADD CONSTRAINT customers_representativelink_pkey PRIMARY KEY (id);
 h   ALTER TABLE ONLY public.customers_representativelink DROP CONSTRAINT customers_representativelink_pkey;
       public            postgres    false    238            W           2606    53023 >   customers_rolerepresentative customers_rolerepresentative_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.customers_rolerepresentative
    ADD CONSTRAINT customers_rolerepresentative_pkey PRIMARY KEY (id);
 h   ALTER TABLE ONLY public.customers_rolerepresentative DROP CONSTRAINT customers_rolerepresentative_pkey;
       public            postgres    false    239            Z           2606    53025 P   customers_rolerepresentative customers_rolerepresentative_rolerepresentative_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.customers_rolerepresentative
    ADD CONSTRAINT customers_rolerepresentative_rolerepresentative_key UNIQUE (rolerepresentative);
 z   ALTER TABLE ONLY public.customers_rolerepresentative DROP CONSTRAINT customers_rolerepresentative_rolerepresentative_key;
       public            postgres    false    239            ]           2606    53027 N   customers_shareholder customers_shareholder_company_id_person_id_be1b9d8e_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.customers_shareholder
    ADD CONSTRAINT customers_shareholder_company_id_person_id_be1b9d8e_uniq UNIQUE (company_id, person_id);
 x   ALTER TABLE ONLY public.customers_shareholder DROP CONSTRAINT customers_shareholder_company_id_person_id_be1b9d8e_uniq;
       public            postgres    false    241    241            `           2606    53029 0   customers_shareholder customers_shareholder_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.customers_shareholder
    ADD CONSTRAINT customers_shareholder_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.customers_shareholder DROP CONSTRAINT customers_shareholder_pkey;
       public            postgres    false    241            b           2606    53031 \   customers_shareholdercompany customers_shareholdercom_company_id_shareholderli_4bcc8ed3_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.customers_shareholdercompany
    ADD CONSTRAINT customers_shareholdercom_company_id_shareholderli_4bcc8ed3_uniq UNIQUE (company_id, shareholderlink_id);
 �   ALTER TABLE ONLY public.customers_shareholdercompany DROP CONSTRAINT customers_shareholdercom_company_id_shareholderli_4bcc8ed3_uniq;
       public            postgres    false    242    242            e           2606    53033 >   customers_shareholdercompany customers_shareholdercompany_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.customers_shareholdercompany
    ADD CONSTRAINT customers_shareholdercompany_pkey PRIMARY KEY (id);
 h   ALTER TABLE ONLY public.customers_shareholdercompany DROP CONSTRAINT customers_shareholdercompany_pkey;
       public            postgres    false    242            h           2606    53035 B   customers_shareholderlink customers_shareholderlink_company_id_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.customers_shareholderlink
    ADD CONSTRAINT customers_shareholderlink_company_id_key UNIQUE (company_id);
 l   ALTER TABLE ONLY public.customers_shareholderlink DROP CONSTRAINT customers_shareholderlink_company_id_key;
       public            postgres    false    243            j           2606    53037 8   customers_shareholderlink customers_shareholderlink_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.customers_shareholderlink
    ADD CONSTRAINT customers_shareholderlink_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.customers_shareholderlink DROP CONSTRAINT customers_shareholderlink_pkey;
       public            postgres    false    243            m           2606    53039 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public            postgres    false    244            p           2606    53041 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public            postgres    false    246    246            r           2606    53043 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public            postgres    false    246            t           2606    53045 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public            postgres    false    248            w           2606    53047 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public            postgres    false    250            {           2606    53049 ,   django_site django_site_domain_a2e37b91_uniq 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);
 V   ALTER TABLE ONLY public.django_site DROP CONSTRAINT django_site_domain_a2e37b91_uniq;
       public            postgres    false    251            }           2606    53051    django_site django_site_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.django_site DROP CONSTRAINT django_site_pkey;
       public            postgres    false    251            �           2606    53053 (   editions_docmodel editions_docmodel_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.editions_docmodel
    ADD CONSTRAINT editions_docmodel_pkey PRIMARY KEY (code_docmodel);
 R   ALTER TABLE ONLY public.editions_docmodel DROP CONSTRAINT editions_docmodel_pkey;
       public            postgres    false    253            �           2606    53055 0   editions_docmodelword editions_docmodelword_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.editions_docmodelword
    ADD CONSTRAINT editions_docmodelword_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.editions_docmodelword DROP CONSTRAINT editions_docmodelword_pkey;
       public            postgres    false    254            �           2606    53057 *   editions_socialdoc editions_socialdoc_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.editions_socialdoc
    ADD CONSTRAINT editions_socialdoc_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.editions_socialdoc DROP CONSTRAINT editions_socialdoc_pkey;
       public            postgres    false    256            �           2606    53059    editions_stc editions_stc_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.editions_stc
    ADD CONSTRAINT editions_stc_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.editions_stc DROP CONSTRAINT editions_stc_pkey;
       public            postgres    false    257            �           2606    53061 P   ordres_lettremission ordres_lettremission_office_id_company_id_mod_2e10e0b8_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.ordres_lettremission
    ADD CONSTRAINT ordres_lettremission_office_id_company_id_mod_2e10e0b8_uniq UNIQUE (office_id, company_id, moduleservice_id);
 z   ALTER TABLE ONLY public.ordres_lettremission DROP CONSTRAINT ordres_lettremission_office_id_company_id_mod_2e10e0b8_uniq;
       public            postgres    false    259    259    259            �           2606    53063 .   ordres_lettremission ordres_lettremission_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.ordres_lettremission
    ADD CONSTRAINT ordres_lettremission_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.ordres_lettremission DROP CONSTRAINT ordres_lettremission_pkey;
       public            postgres    false    259            �           2606    53065 7   ordres_lettremission ordres_lettremission_reference_key 
   CONSTRAINT     w   ALTER TABLE ONLY public.ordres_lettremission
    ADD CONSTRAINT ordres_lettremission_reference_key UNIQUE (reference);
 a   ALTER TABLE ONLY public.ordres_lettremission DROP CONSTRAINT ordres_lettremission_reference_key;
       public            postgres    false    259            �           2606    53067 6   ordres_lettremissionlink ordres_lettremissionlink_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.ordres_lettremissionlink
    ADD CONSTRAINT ordres_lettremissionlink_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.ordres_lettremissionlink DROP CONSTRAINT ordres_lettremissionlink_pkey;
       public            postgres    false    260            �           2606    53069 X   ordres_lettremissionlink ordres_lettremissionlink_prospect_id_lettremissio_ca215082_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.ordres_lettremissionlink
    ADD CONSTRAINT ordres_lettremissionlink_prospect_id_lettremissio_ca215082_uniq UNIQUE (prospect_id, lettremission_id);
 �   ALTER TABLE ONLY public.ordres_lettremissionlink DROP CONSTRAINT ordres_lettremissionlink_prospect_id_lettremissio_ca215082_uniq;
       public            postgres    false    260    260            �           2606    53071 ;   ordres_moduleservice ordres_moduleservice_moduleservice_key 
   CONSTRAINT        ALTER TABLE ONLY public.ordres_moduleservice
    ADD CONSTRAINT ordres_moduleservice_moduleservice_key UNIQUE (moduleservice);
 e   ALTER TABLE ONLY public.ordres_moduleservice DROP CONSTRAINT ordres_moduleservice_moduleservice_key;
       public            postgres    false    261            �           2606    53073 .   ordres_moduleservice ordres_moduleservice_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.ordres_moduleservice
    ADD CONSTRAINT ordres_moduleservice_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.ordres_moduleservice DROP CONSTRAINT ordres_moduleservice_pkey;
       public            postgres    false    261            �           2606    53075    ordres_ordre ordres_ordre_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.ordres_ordre
    ADD CONSTRAINT ordres_ordre_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.ordres_ordre DROP CONSTRAINT ordres_ordre_pkey;
       public            postgres    false    263            �           2606    53077 A   ordres_outlay ordres_outlay_moduleservice_id_outlay_c43f75fa_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.ordres_outlay
    ADD CONSTRAINT ordres_outlay_moduleservice_id_outlay_c43f75fa_uniq UNIQUE (moduleservice_id, outlay);
 k   ALTER TABLE ONLY public.ordres_outlay DROP CONSTRAINT ordres_outlay_moduleservice_id_outlay_c43f75fa_uniq;
       public            postgres    false    264    264            �           2606    53079 &   ordres_outlay ordres_outlay_outlay_key 
   CONSTRAINT     c   ALTER TABLE ONLY public.ordres_outlay
    ADD CONSTRAINT ordres_outlay_outlay_key UNIQUE (outlay);
 P   ALTER TABLE ONLY public.ordres_outlay DROP CONSTRAINT ordres_outlay_outlay_key;
       public            postgres    false    264            �           2606    53081     ordres_outlay ordres_outlay_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.ordres_outlay
    ADD CONSTRAINT ordres_outlay_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.ordres_outlay DROP CONSTRAINT ordres_outlay_pkey;
       public            postgres    false    264            �           2606    53083 (   ordres_outlayitem ordres_outlayitem_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.ordres_outlayitem
    ADD CONSTRAINT ordres_outlayitem_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.ordres_outlayitem DROP CONSTRAINT ordres_outlayitem_pkey;
       public            postgres    false    266            �           2606    53085 D   ordres_service ordres_service_moduleservice_id_service_3822a9f4_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.ordres_service
    ADD CONSTRAINT ordres_service_moduleservice_id_service_3822a9f4_uniq UNIQUE (moduleservice_id, service);
 n   ALTER TABLE ONLY public.ordres_service DROP CONSTRAINT ordres_service_moduleservice_id_service_3822a9f4_uniq;
       public            postgres    false    267    267            �           2606    53087 "   ordres_service ordres_service_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.ordres_service
    ADD CONSTRAINT ordres_service_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.ordres_service DROP CONSTRAINT ordres_service_pkey;
       public            postgres    false    267            �           2606    53089 )   ordres_service ordres_service_service_key 
   CONSTRAINT     g   ALTER TABLE ONLY public.ordres_service
    ADD CONSTRAINT ordres_service_service_key UNIQUE (service);
 S   ALTER TABLE ONLY public.ordres_service DROP CONSTRAINT ordres_service_service_key;
       public            postgres    false    267            �           2606    53091 8   ordres_servicedescription ordres_servicedescription_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.ordres_servicedescription
    ADD CONSTRAINT ordres_servicedescription_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.ordres_servicedescription DROP CONSTRAINT ordres_servicedescription_pkey;
       public            postgres    false    269            �           2606    53093 Q   ordres_servicedescription ordres_servicedescription_text_service_id_480d73c8_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.ordres_servicedescription
    ADD CONSTRAINT ordres_servicedescription_text_service_id_480d73c8_uniq UNIQUE (text, service_id);
 {   ALTER TABLE ONLY public.ordres_servicedescription DROP CONSTRAINT ordres_servicedescription_text_service_id_480d73c8_uniq;
       public            postgres    false    269    269            �           2606    53095 *   ordres_serviceitem ordres_serviceitem_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.ordres_serviceitem
    ADD CONSTRAINT ordres_serviceitem_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.ordres_serviceitem DROP CONSTRAINT ordres_serviceitem_pkey;
       public            postgres    false    271            �           2606    53097     tasks_benefit tasks_benefit_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.tasks_benefit
    ADD CONSTRAINT tasks_benefit_pkey PRIMARY KEY (code_benefit);
 J   ALTER TABLE ONLY public.tasks_benefit DROP CONSTRAINT tasks_benefit_pkey;
       public            postgres    false    272            �           2606    53099 P   tasks_benefititem tasks_benefititem_benefitlink_id_code_benefit_id_dc6d77ce_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.tasks_benefititem
    ADD CONSTRAINT tasks_benefititem_benefitlink_id_code_benefit_id_dc6d77ce_uniq UNIQUE (benefitlink_id, code_benefit_id);
 z   ALTER TABLE ONLY public.tasks_benefititem DROP CONSTRAINT tasks_benefititem_benefitlink_id_code_benefit_id_dc6d77ce_uniq;
       public            postgres    false    273    273            �           2606    53101 (   tasks_benefititem tasks_benefititem_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.tasks_benefititem
    ADD CONSTRAINT tasks_benefititem_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.tasks_benefititem DROP CONSTRAINT tasks_benefititem_pkey;
       public            postgres    false    273            �           2606    53103 8   tasks_benefitlink tasks_benefitlink_lettremission_id_key 
   CONSTRAINT        ALTER TABLE ONLY public.tasks_benefitlink
    ADD CONSTRAINT tasks_benefitlink_lettremission_id_key UNIQUE (lettremission_id);
 b   ALTER TABLE ONLY public.tasks_benefitlink DROP CONSTRAINT tasks_benefitlink_lettremission_id_key;
       public            postgres    false    274            �           2606    53105 (   tasks_benefitlink tasks_benefitlink_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.tasks_benefitlink
    ADD CONSTRAINT tasks_benefitlink_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.tasks_benefitlink DROP CONSTRAINT tasks_benefitlink_pkey;
       public            postgres    false    274            �           2606    53109 2   tasks_benefitrequested tasks_benefitrequested_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.tasks_benefitrequested
    ADD CONSTRAINT tasks_benefitrequested_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.tasks_benefitrequested DROP CONSTRAINT tasks_benefitrequested_pkey;
       public            postgres    false    275            �           2606    53634 =   tasks_benefitrequested tasks_benefitrequested_worklink_id_key 
   CONSTRAINT        ALTER TABLE ONLY public.tasks_benefitrequested
    ADD CONSTRAINT tasks_benefitrequested_worklink_id_key UNIQUE (worklink_id);
 g   ALTER TABLE ONLY public.tasks_benefitrequested DROP CONSTRAINT tasks_benefitrequested_worklink_id_key;
       public            postgres    false    275            �           2606    53111    tasks_claim tasks_claim_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.tasks_claim
    ADD CONSTRAINT tasks_claim_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.tasks_claim DROP CONSTRAINT tasks_claim_pkey;
       public            postgres    false    276            �           2606    53113 $   tasks_period tasks_period_period_key 
   CONSTRAINT     a   ALTER TABLE ONLY public.tasks_period
    ADD CONSTRAINT tasks_period_period_key UNIQUE (period);
 N   ALTER TABLE ONLY public.tasks_period DROP CONSTRAINT tasks_period_period_key;
       public            postgres    false    277            �           2606    53115    tasks_period tasks_period_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.tasks_period
    ADD CONSTRAINT tasks_period_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.tasks_period DROP CONSTRAINT tasks_period_pkey;
       public            postgres    false    277            �           2606    53117    tasks_task tasks_task_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.tasks_task
    ADD CONSTRAINT tasks_task_pkey PRIMARY KEY (code_task);
 D   ALTER TABLE ONLY public.tasks_task DROP CONSTRAINT tasks_task_pkey;
       public            postgres    false    278            �           2606    53119 L   tasks_vatrequested tasks_vatrequested_lettremission_id_benefit_59c26b4b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.tasks_vatrequested
    ADD CONSTRAINT tasks_vatrequested_lettremission_id_benefit_59c26b4b_uniq UNIQUE (lettremission_id, benefitlink_id);
 v   ALTER TABLE ONLY public.tasks_vatrequested DROP CONSTRAINT tasks_vatrequested_lettremission_id_benefit_59c26b4b_uniq;
       public            postgres    false    279    279            �           2606    53121 *   tasks_vatrequested tasks_vatrequested_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.tasks_vatrequested
    ADD CONSTRAINT tasks_vatrequested_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.tasks_vatrequested DROP CONSTRAINT tasks_vatrequested_pkey;
       public            postgres    false    279            �           2606    53123 F   tasks_work tasks_work_period_id_lettremission_id_task_id_63297617_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.tasks_work
    ADD CONSTRAINT tasks_work_period_id_lettremission_id_task_id_63297617_uniq UNIQUE (period_id, lettremission_id, task_id);
 p   ALTER TABLE ONLY public.tasks_work DROP CONSTRAINT tasks_work_period_id_lettremission_id_task_id_63297617_uniq;
       public            postgres    false    280    280    280            �           2606    53125    tasks_work tasks_work_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.tasks_work
    ADD CONSTRAINT tasks_work_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.tasks_work DROP CONSTRAINT tasks_work_pkey;
       public            postgres    false    280            �           1259    53126 (   account_emailaddress_email_03be32b2_like    INDEX     ~   CREATE INDEX account_emailaddress_email_03be32b2_like ON public.account_emailaddress USING btree (email varchar_pattern_ops);
 <   DROP INDEX public.account_emailaddress_email_03be32b2_like;
       public            postgres    false    202            �           1259    53127 %   account_emailaddress_user_id_2c513194    INDEX     i   CREATE INDEX account_emailaddress_user_id_2c513194 ON public.account_emailaddress USING btree (user_id);
 9   DROP INDEX public.account_emailaddress_user_id_2c513194;
       public            postgres    false    202            �           1259    53621 3   account_emailconfirmation_email_address_id_5b7f8c58    INDEX     �   CREATE INDEX account_emailconfirmation_email_address_id_5b7f8c58 ON public.account_emailconfirmation USING btree (email_address_id);
 G   DROP INDEX public.account_emailconfirmation_email_address_id_5b7f8c58;
       public            postgres    false    203            �           1259    53129 +   account_emailconfirmation_key_f43612bd_like    INDEX     �   CREATE INDEX account_emailconfirmation_key_f43612bd_like ON public.account_emailconfirmation USING btree (key varchar_pattern_ops);
 ?   DROP INDEX public.account_emailconfirmation_key_f43612bd_like;
       public            postgres    false    203            �           1259    53130 -   accounts_portefolio_lettremission_id_d71976d5    INDEX     y   CREATE INDEX accounts_portefolio_lettremission_id_d71976d5 ON public.accounts_portefolio USING btree (lettremission_id);
 A   DROP INDEX public.accounts_portefolio_lettremission_id_d71976d5;
       public            postgres    false    204            �           1259    53131 1   accounts_portefolio_rolecollaborateur_id_7645715a    INDEX     �   CREATE INDEX accounts_portefolio_rolecollaborateur_id_7645715a ON public.accounts_portefolio USING btree (rolecollaborateur_id);
 E   DROP INDEX public.accounts_portefolio_rolecollaborateur_id_7645715a;
       public            postgres    false    204            �           1259    53132 $   accounts_portefolio_user_id_623858b2    INDEX     g   CREATE INDEX accounts_portefolio_user_id_623858b2 ON public.accounts_portefolio USING btree (user_id);
 8   DROP INDEX public.accounts_portefolio_user_id_623858b2;
       public            postgres    false    204            �           1259    53133 )   accounts_pwsafe_lettremission_id_8f576869    INDEX     q   CREATE INDEX accounts_pwsafe_lettremission_id_8f576869 ON public.accounts_pwsafe USING btree (lettremission_id);
 =   DROP INDEX public.accounts_pwsafe_lettremission_id_8f576869;
       public            postgres    false    207            �           1259    53134     accounts_pwsafe_user_id_6b8567f3    INDEX     _   CREATE INDEX accounts_pwsafe_user_id_6b8567f3 ON public.accounts_pwsafe USING btree (user_id);
 4   DROP INDEX public.accounts_pwsafe_user_id_6b8567f3;
       public            postgres    false    207            �           1259    53135 "   accounts_scope_Scope_e7af236c_like    INDEX     v   CREATE INDEX "accounts_scope_Scope_e7af236c_like" ON public.accounts_scope USING btree ("Scope" varchar_pattern_ops);
 8   DROP INDEX public."accounts_scope_Scope_e7af236c_like";
       public            postgres    false    208            �           1259    53136 ,   accounts_validator_lettremission_id_c9100ec9    INDEX     w   CREATE INDEX accounts_validator_lettremission_id_c9100ec9 ON public.accounts_validator USING btree (lettremission_id);
 @   DROP INDEX public.accounts_validator_lettremission_id_c9100ec9;
       public            postgres    false    210            �           1259    53137 #   accounts_validator_user_id_ae93f26f    INDEX     e   CREATE INDEX accounts_validator_user_id_ae93f26f ON public.accounts_validator USING btree (user_id);
 7   DROP INDEX public.accounts_validator_user_id_ae93f26f;
       public            postgres    false    210            �           1259    53138    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public            postgres    false    211            �           1259    53139 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public            postgres    false    213            �           1259    53140 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public            postgres    false    213            �           1259    53141 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public            postgres    false    215            �           1259    53142 "   auth_user_groups_group_id_97559544    INDEX     c   CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);
 6   DROP INDEX public.auth_user_groups_group_id_97559544;
       public            postgres    false    218            �           1259    53143 !   auth_user_groups_user_id_6a12ed8b    INDEX     a   CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);
 5   DROP INDEX public.auth_user_groups_user_id_6a12ed8b;
       public            postgres    false    218            �           1259    53144 1   auth_user_user_permissions_permission_id_1fbb5f2c    INDEX     �   CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);
 E   DROP INDEX public.auth_user_user_permissions_permission_id_1fbb5f2c;
       public            postgres    false    221            �           1259    53145 +   auth_user_user_permissions_user_id_a95ead1b    INDEX     u   CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);
 ?   DROP INDEX public.auth_user_user_permissions_user_id_a95ead1b;
       public            postgres    false    221            �           1259    53146     auth_user_username_6821ab7c_like    INDEX     n   CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);
 4   DROP INDEX public.auth_user_username_6821ab7c_like;
       public            postgres    false    217                        1259    53147 (   customers_bankacount_company_id_296f0bae    INDEX     o   CREATE INDEX customers_bankacount_company_id_296f0bae ON public.customers_bankacount USING btree (company_id);
 <   DROP INDEX public.customers_bankacount_company_id_296f0bae;
       public            postgres    false    225                       1259    53148 &   customers_bankacount_rib_5bbdcf51_like    INDEX     z   CREATE INDEX customers_bankacount_rib_5bbdcf51_like ON public.customers_bankacount USING btree (rib varchar_pattern_ops);
 :   DROP INDEX public.customers_bankacount_rib_5bbdcf51_like;
       public            postgres    false    225                       1259    53149 !   customers_city_city_f5e3b070_like    INDEX     p   CREATE INDEX customers_city_city_f5e3b070_like ON public.customers_city USING btree (city varchar_pattern_ops);
 5   DROP INDEX public.customers_city_city_f5e3b070_like;
       public            postgres    false    226                       1259    53150 %   customers_company_country_id_d2365eec    INDEX     i   CREATE INDEX customers_company_country_id_d2365eec ON public.customers_company USING btree (country_id);
 9   DROP INDEX public.customers_company_country_id_d2365eec;
       public            postgres    false    228                       1259    53151 *   customers_company_country_id_d2365eec_like    INDEX     �   CREATE INDEX customers_company_country_id_d2365eec_like ON public.customers_company USING btree (country_id varchar_pattern_ops);
 >   DROP INDEX public.customers_company_country_id_d2365eec_like;
       public            postgres    false    228                       1259    53152 &   customers_company_currency_id_59caea32    INDEX     k   CREATE INDEX customers_company_currency_id_59caea32 ON public.customers_company USING btree (currency_id);
 :   DROP INDEX public.customers_company_currency_id_59caea32;
       public            postgres    false    228                       1259    53153 +   customers_company_currency_id_59caea32_like    INDEX     �   CREATE INDEX customers_company_currency_id_59caea32_like ON public.customers_company USING btree (currency_id varchar_pattern_ops);
 ?   DROP INDEX public.customers_company_currency_id_59caea32_like;
       public            postgres    false    228                       1259    53154 (   customers_company_legal_form_id_674849c0    INDEX     o   CREATE INDEX customers_company_legal_form_id_674849c0 ON public.customers_company USING btree (legal_form_id);
 <   DROP INDEX public.customers_company_legal_form_id_674849c0;
       public            postgres    false    228                       1259    53155 $   customers_company_name_9162e91f_like    INDEX     v   CREATE INDEX customers_company_name_9162e91f_like ON public.customers_company USING btree (name varchar_pattern_ops);
 8   DROP INDEX public.customers_company_name_9162e91f_like;
       public            postgres    false    228                       1259    53156 )   customers_company_nationality_id_67a2b28a    INDEX     q   CREATE INDEX customers_company_nationality_id_67a2b28a ON public.customers_company USING btree (nationality_id);
 =   DROP INDEX public.customers_company_nationality_id_67a2b28a;
       public            postgres    false    228                       1259    53157 .   customers_company_nationality_id_67a2b28a_like    INDEX     �   CREATE INDEX customers_company_nationality_id_67a2b28a_like ON public.customers_company USING btree (nationality_id varchar_pattern_ops);
 B   DROP INDEX public.customers_company_nationality_id_67a2b28a_like;
       public            postgres    false    228                       1259    53158 %   customers_contact_company_id_b52c4cc4    INDEX     i   CREATE INDEX customers_contact_company_id_b52c4cc4 ON public.customers_contact USING btree (company_id);
 9   DROP INDEX public.customers_contact_company_id_b52c4cc4;
       public            postgres    false    229                       1259    53159 $   customers_contact_person_id_32cb4479    INDEX     g   CREATE INDEX customers_contact_person_id_32cb4479 ON public.customers_contact USING btree (person_id);
 8   DROP INDEX public.customers_contact_person_id_32cb4479;
       public            postgres    false    229                       1259    53160 ,   customers_country_code_country_1e3531ba_like    INDEX     �   CREATE INDEX customers_country_code_country_1e3531ba_like ON public.customers_country USING btree (code_country varchar_pattern_ops);
 @   DROP INDEX public.customers_country_code_country_1e3531ba_like;
       public            postgres    false    230                        1259    53161 '   customers_country_country_47d25431_like    INDEX     |   CREATE INDEX customers_country_country_47d25431_like ON public.customers_country USING btree (country varchar_pattern_ops);
 ;   DROP INDEX public.customers_country_country_47d25431_like;
       public            postgres    false    230            %           1259    53162 )   customers_currency_currency_1e482a08_like    INDEX     �   CREATE INDEX customers_currency_currency_1e482a08_like ON public.customers_currency USING btree (currency varchar_pattern_ops);
 =   DROP INDEX public.customers_currency_currency_1e482a08_like;
       public            postgres    false    231            &           1259    53163 .   customers_currency_currency_code_4b6efc33_like    INDEX     �   CREATE INDEX customers_currency_currency_code_4b6efc33_like ON public.customers_currency USING btree (currency_code varchar_pattern_ops);
 B   DROP INDEX public.customers_currency_currency_code_4b6efc33_like;
       public            postgres    false    231            +           1259    53164 )   customers_legalform_lf_name_7a5f07dd_like    INDEX     �   CREATE INDEX customers_legalform_lf_name_7a5f07dd_like ON public.customers_legalform USING btree (lf_name varchar_pattern_ops);
 =   DROP INDEX public.customers_legalform_lf_name_7a5f07dd_like;
       public            postgres    false    232            0           1259    53165 4   customers_nationality_code_nationality_3e44c4e5_like    INDEX     �   CREATE INDEX customers_nationality_code_nationality_3e44c4e5_like ON public.customers_nationality USING btree (code_nationality varchar_pattern_ops);
 H   DROP INDEX public.customers_nationality_code_nationality_3e44c4e5_like;
       public            postgres    false    233            1           1259    53166 /   customers_nationality_nationality_13d9c46d_like    INDEX     �   CREATE INDEX customers_nationality_nationality_13d9c46d_like ON public.customers_nationality USING btree (nationality varchar_pattern_ops);
 C   DROP INDEX public.customers_nationality_nationality_13d9c46d_like;
       public            postgres    false    233            6           1259    53167 $   customers_office_company_id_653a34c9    INDEX     g   CREATE INDEX customers_office_company_id_653a34c9 ON public.customers_office USING btree (company_id);
 8   DROP INDEX public.customers_office_company_id_653a34c9;
       public            postgres    false    234            7           1259    53168 %   customers_office_office_e103c038_like    INDEX     x   CREATE INDEX customers_office_office_e103c038_like ON public.customers_office USING btree (office varchar_pattern_ops);
 9   DROP INDEX public.customers_office_office_e103c038_like;
       public            postgres    false    234            <           1259    53169 $   customers_person_country_id_bb7c8b94    INDEX     g   CREATE INDEX customers_person_country_id_bb7c8b94 ON public.customers_person USING btree (country_id);
 8   DROP INDEX public.customers_person_country_id_bb7c8b94;
       public            postgres    false    235            =           1259    53170 )   customers_person_country_id_bb7c8b94_like    INDEX     �   CREATE INDEX customers_person_country_id_bb7c8b94_like ON public.customers_person USING btree (country_id varchar_pattern_ops);
 =   DROP INDEX public.customers_person_country_id_bb7c8b94_like;
       public            postgres    false    235            @           1259    53171 (   customers_person_nationality_id_45b2dbf8    INDEX     o   CREATE INDEX customers_person_nationality_id_45b2dbf8 ON public.customers_person USING btree (nationality_id);
 <   DROP INDEX public.customers_person_nationality_id_45b2dbf8;
       public            postgres    false    235            A           1259    53172 -   customers_person_nationality_id_45b2dbf8_like    INDEX     �   CREATE INDEX customers_person_nationality_id_45b2dbf8_like ON public.customers_person USING btree (nationality_id varchar_pattern_ops);
 A   DROP INDEX public.customers_person_nationality_id_45b2dbf8_like;
       public            postgres    false    235            �           1259    53674 &   customers_prospect_contact_id_fe9f64b5    INDEX     k   CREATE INDEX customers_prospect_contact_id_fe9f64b5 ON public.customers_prospect USING btree (contact_id);
 :   DROP INDEX public.customers_prospect_contact_id_fe9f64b5;
       public            postgres    false    283            �           1259    53675 %   customers_prospect_office_id_974d0cb2    INDEX     i   CREATE INDEX customers_prospect_office_id_974d0cb2 ON public.customers_prospect USING btree (office_id);
 9   DROP INDEX public.customers_prospect_office_id_974d0cb2;
       public            postgres    false    283            D           1259    53175 ,   customers_representative_company_id_54193de8    INDEX     w   CREATE INDEX customers_representative_company_id_54193de8 ON public.customers_representative USING btree (company_id);
 @   DROP INDEX public.customers_representative_company_id_54193de8;
       public            postgres    false    236            G           1259    53176 +   customers_representative_person_id_2922b303    INDEX     u   CREATE INDEX customers_representative_person_id_2922b303 ON public.customers_representative USING btree (person_id);
 ?   DROP INDEX public.customers_representative_person_id_2922b303;
       public            postgres    false    236            J           1259    53177 7   customers_representative_rolerepresentative_id_42fecf8d    INDEX     �   CREATE INDEX customers_representative_rolerepresentative_id_42fecf8d ON public.customers_representative USING btree (rolerepresentative_id);
 K   DROP INDEX public.customers_representative_rolerepresentative_id_42fecf8d;
       public            postgres    false    236            M           1259    53178 3   customers_representativecompany_company_id_4ad471fb    INDEX     �   CREATE INDEX customers_representativecompany_company_id_4ad471fb ON public.customers_representativecompany USING btree (company_id);
 G   DROP INDEX public.customers_representativecompany_company_id_4ad471fb;
       public            postgres    false    237            P           1259    53179 >   customers_representativecompany_representativelink_id_1624f777    INDEX     �   CREATE INDEX customers_representativecompany_representativelink_id_1624f777 ON public.customers_representativecompany USING btree (representativelink_id);
 R   DROP INDEX public.customers_representativecompany_representativelink_id_1624f777;
       public            postgres    false    237            Q           1259    53180 >   customers_representativecompany_rolerepresentative_id_fb5c0c8d    INDEX     �   CREATE INDEX customers_representativecompany_rolerepresentative_id_fb5c0c8d ON public.customers_representativecompany USING btree (rolerepresentative_id);
 R   DROP INDEX public.customers_representativecompany_rolerepresentative_id_fb5c0c8d;
       public            postgres    false    237            X           1259    53181 =   customers_rolerepresentative_rolerepresentative_7c7ff30f_like    INDEX     �   CREATE INDEX customers_rolerepresentative_rolerepresentative_7c7ff30f_like ON public.customers_rolerepresentative USING btree (rolerepresentative varchar_pattern_ops);
 Q   DROP INDEX public.customers_rolerepresentative_rolerepresentative_7c7ff30f_like;
       public            postgres    false    239            [           1259    53182 )   customers_shareholder_company_id_bf06ce33    INDEX     q   CREATE INDEX customers_shareholder_company_id_bf06ce33 ON public.customers_shareholder USING btree (company_id);
 =   DROP INDEX public.customers_shareholder_company_id_bf06ce33;
       public            postgres    false    241            ^           1259    53183 (   customers_shareholder_person_id_5be2174f    INDEX     o   CREATE INDEX customers_shareholder_person_id_5be2174f ON public.customers_shareholder USING btree (person_id);
 <   DROP INDEX public.customers_shareholder_person_id_5be2174f;
       public            postgres    false    241            c           1259    53184 0   customers_shareholdercompany_company_id_5f7ea741    INDEX        CREATE INDEX customers_shareholdercompany_company_id_5f7ea741 ON public.customers_shareholdercompany USING btree (company_id);
 D   DROP INDEX public.customers_shareholdercompany_company_id_5f7ea741;
       public            postgres    false    242            f           1259    53185 8   customers_shareholdercompany_shareholderlink_id_0f97a228    INDEX     �   CREATE INDEX customers_shareholdercompany_shareholderlink_id_0f97a228 ON public.customers_shareholdercompany USING btree (shareholderlink_id);
 L   DROP INDEX public.customers_shareholdercompany_shareholderlink_id_0f97a228;
       public            postgres    false    242            k           1259    53186 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public            postgres    false    244            n           1259    53187 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public            postgres    false    244            u           1259    53188 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public            postgres    false    250            x           1259    53189 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public            postgres    false    250            y           1259    53190     django_site_domain_a2e37b91_like    INDEX     n   CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);
 4   DROP INDEX public.django_site_domain_a2e37b91_like;
       public            postgres    false    251            ~           1259    53191 -   editions_docmodel_code_docmodel_75ee40cf_like    INDEX     �   CREATE INDEX editions_docmodel_code_docmodel_75ee40cf_like ON public.editions_docmodel USING btree (code_docmodel varchar_pattern_ops);
 A   DROP INDEX public.editions_docmodel_code_docmodel_75ee40cf_like;
       public            postgres    false    253            �           1259    53192 /   editions_docmodelword_code_docmodel_id_8e1ebb29    INDEX     }   CREATE INDEX editions_docmodelword_code_docmodel_id_8e1ebb29 ON public.editions_docmodelword USING btree (code_docmodel_id);
 C   DROP INDEX public.editions_docmodelword_code_docmodel_id_8e1ebb29;
       public            postgres    false    254            �           1259    53193 4   editions_docmodelword_code_docmodel_id_8e1ebb29_like    INDEX     �   CREATE INDEX editions_docmodelword_code_docmodel_id_8e1ebb29_like ON public.editions_docmodelword USING btree (code_docmodel_id varchar_pattern_ops);
 H   DROP INDEX public.editions_docmodelword_code_docmodel_id_8e1ebb29_like;
       public            postgres    false    254            �           1259    53194 ,   editions_socialdoc_lettremission_id_33c3d059    INDEX     w   CREATE INDEX editions_socialdoc_lettremission_id_33c3d059 ON public.editions_socialdoc USING btree (lettremission_id);
 @   DROP INDEX public.editions_socialdoc_lettremission_id_33c3d059;
       public            postgres    false    256            �           1259    53195 (   ordres_lettremission_company_id_438b6bbc    INDEX     o   CREATE INDEX ordres_lettremission_company_id_438b6bbc ON public.ordres_lettremission USING btree (company_id);
 <   DROP INDEX public.ordres_lettremission_company_id_438b6bbc;
       public            postgres    false    259            �           1259    53196 .   ordres_lettremission_moduleservice_id_85831cde    INDEX     {   CREATE INDEX ordres_lettremission_moduleservice_id_85831cde ON public.ordres_lettremission USING btree (moduleservice_id);
 B   DROP INDEX public.ordres_lettremission_moduleservice_id_85831cde;
       public            postgres    false    259            �           1259    53197 '   ordres_lettremission_office_id_0f2982af    INDEX     m   CREATE INDEX ordres_lettremission_office_id_0f2982af ON public.ordres_lettremission USING btree (office_id);
 ;   DROP INDEX public.ordres_lettremission_office_id_0f2982af;
       public            postgres    false    259            �           1259    53198 ,   ordres_lettremission_reference_750d89bd_like    INDEX     �   CREATE INDEX ordres_lettremission_reference_750d89bd_like ON public.ordres_lettremission USING btree (reference varchar_pattern_ops);
 @   DROP INDEX public.ordres_lettremission_reference_750d89bd_like;
       public            postgres    false    259            �           1259    53199 2   ordres_lettremissionlink_lettremission_id_bb061c21    INDEX     �   CREATE INDEX ordres_lettremissionlink_lettremission_id_bb061c21 ON public.ordres_lettremissionlink USING btree (lettremission_id);
 F   DROP INDEX public.ordres_lettremissionlink_lettremission_id_bb061c21;
       public            postgres    false    260            �           1259    53200 -   ordres_lettremissionlink_prospect_id_71bc99ad    INDEX     y   CREATE INDEX ordres_lettremissionlink_prospect_id_71bc99ad ON public.ordres_lettremissionlink USING btree (prospect_id);
 A   DROP INDEX public.ordres_lettremissionlink_prospect_id_71bc99ad;
       public            postgres    false    260            �           1259    53201 0   ordres_moduleservice_moduleservice_d9487e15_like    INDEX     �   CREATE INDEX ordres_moduleservice_moduleservice_d9487e15_like ON public.ordres_moduleservice USING btree (moduleservice varchar_pattern_ops);
 D   DROP INDEX public.ordres_moduleservice_moduleservice_d9487e15_like;
       public            postgres    false    261            �           1259    53202     ordres_ordre_company_id_11ddded4    INDEX     _   CREATE INDEX ordres_ordre_company_id_11ddded4 ON public.ordres_ordre USING btree (company_id);
 4   DROP INDEX public.ordres_ordre_company_id_11ddded4;
       public            postgres    false    263            �           1259    53203    ordres_ordre_office_id_711c56fd    INDEX     ]   CREATE INDEX ordres_ordre_office_id_711c56fd ON public.ordres_ordre USING btree (office_id);
 3   DROP INDEX public.ordres_ordre_office_id_711c56fd;
       public            postgres    false    263            �           1259    53204 '   ordres_outlay_moduleservice_id_1b55901d    INDEX     m   CREATE INDEX ordres_outlay_moduleservice_id_1b55901d ON public.ordres_outlay USING btree (moduleservice_id);
 ;   DROP INDEX public.ordres_outlay_moduleservice_id_1b55901d;
       public            postgres    false    264            �           1259    53205 "   ordres_outlay_outlay_f07d327b_like    INDEX     r   CREATE INDEX ordres_outlay_outlay_f07d327b_like ON public.ordres_outlay USING btree (outlay varchar_pattern_ops);
 6   DROP INDEX public.ordres_outlay_outlay_f07d327b_like;
       public            postgres    false    264            �           1259    53206 #   ordres_outlayitem_ordre_id_3777bebd    INDEX     e   CREATE INDEX ordres_outlayitem_ordre_id_3777bebd ON public.ordres_outlayitem USING btree (ordre_id);
 7   DROP INDEX public.ordres_outlayitem_ordre_id_3777bebd;
       public            postgres    false    266            �           1259    53207 $   ordres_outlayitem_outlay_id_ba0705b9    INDEX     g   CREATE INDEX ordres_outlayitem_outlay_id_ba0705b9 ON public.ordres_outlayitem USING btree (outlay_id);
 8   DROP INDEX public.ordres_outlayitem_outlay_id_ba0705b9;
       public            postgres    false    266            �           1259    53208 (   ordres_service_moduleservice_id_f81d374e    INDEX     o   CREATE INDEX ordres_service_moduleservice_id_f81d374e ON public.ordres_service USING btree (moduleservice_id);
 <   DROP INDEX public.ordres_service_moduleservice_id_f81d374e;
       public            postgres    false    267            �           1259    53209 $   ordres_service_service_23232e59_like    INDEX     v   CREATE INDEX ordres_service_service_23232e59_like ON public.ordres_service USING btree (service varchar_pattern_ops);
 8   DROP INDEX public.ordres_service_service_23232e59_like;
       public            postgres    false    267            �           1259    53210 -   ordres_servicedescription_service_id_72e0a86d    INDEX     y   CREATE INDEX ordres_servicedescription_service_id_72e0a86d ON public.ordres_servicedescription USING btree (service_id);
 A   DROP INDEX public.ordres_servicedescription_service_id_72e0a86d;
       public            postgres    false    269            �           1259    53211 $   ordres_serviceitem_ordre_id_8f8e0a5b    INDEX     g   CREATE INDEX ordres_serviceitem_ordre_id_8f8e0a5b ON public.ordres_serviceitem USING btree (ordre_id);
 8   DROP INDEX public.ordres_serviceitem_ordre_id_8f8e0a5b;
       public            postgres    false    271            �           1259    53212 &   ordres_serviceitem_service_id_bb1e292c    INDEX     k   CREATE INDEX ordres_serviceitem_service_id_bb1e292c ON public.ordres_serviceitem USING btree (service_id);
 :   DROP INDEX public.ordres_serviceitem_service_id_bb1e292c;
       public            postgres    false    271            �           1259    53213 (   tasks_benefit_code_benefit_aac1735b_like    INDEX     ~   CREATE INDEX tasks_benefit_code_benefit_aac1735b_like ON public.tasks_benefit USING btree (code_benefit varchar_pattern_ops);
 <   DROP INDEX public.tasks_benefit_code_benefit_aac1735b_like;
       public            postgres    false    272            �           1259    53214 )   tasks_benefititem_benefitlink_id_2f1d11ae    INDEX     q   CREATE INDEX tasks_benefititem_benefitlink_id_2f1d11ae ON public.tasks_benefititem USING btree (benefitlink_id);
 =   DROP INDEX public.tasks_benefititem_benefitlink_id_2f1d11ae;
       public            postgres    false    273            �           1259    53215 *   tasks_benefititem_code_benefit_id_d2b8644f    INDEX     s   CREATE INDEX tasks_benefititem_code_benefit_id_d2b8644f ON public.tasks_benefititem USING btree (code_benefit_id);
 >   DROP INDEX public.tasks_benefititem_code_benefit_id_d2b8644f;
       public            postgres    false    273            �           1259    53216 /   tasks_benefititem_code_benefit_id_d2b8644f_like    INDEX     �   CREATE INDEX tasks_benefititem_code_benefit_id_d2b8644f_like ON public.tasks_benefititem USING btree (code_benefit_id varchar_pattern_ops);
 C   DROP INDEX public.tasks_benefititem_code_benefit_id_d2b8644f_like;
       public            postgres    false    273            �           1259    53219 %   tasks_claim_lettremission_id_7bdd1ad4    INDEX     i   CREATE INDEX tasks_claim_lettremission_id_7bdd1ad4 ON public.tasks_claim USING btree (lettremission_id);
 9   DROP INDEX public.tasks_claim_lettremission_id_7bdd1ad4;
       public            postgres    false    276            �           1259    53220 !   tasks_period_period_e791c752_like    INDEX     p   CREATE INDEX tasks_period_period_e791c752_like ON public.tasks_period USING btree (period varchar_pattern_ops);
 5   DROP INDEX public.tasks_period_period_e791c752_like;
       public            postgres    false    277            �           1259    53221 #   tasks_task_code_benefit_id_611dd4c0    INDEX     e   CREATE INDEX tasks_task_code_benefit_id_611dd4c0 ON public.tasks_task USING btree (code_benefit_id);
 7   DROP INDEX public.tasks_task_code_benefit_id_611dd4c0;
       public            postgres    false    278            �           1259    53222 (   tasks_task_code_benefit_id_611dd4c0_like    INDEX     ~   CREATE INDEX tasks_task_code_benefit_id_611dd4c0_like ON public.tasks_task USING btree (code_benefit_id varchar_pattern_ops);
 <   DROP INDEX public.tasks_task_code_benefit_id_611dd4c0_like;
       public            postgres    false    278            �           1259    53223 "   tasks_task_code_task_537643d9_like    INDEX     r   CREATE INDEX tasks_task_code_task_537643d9_like ON public.tasks_task USING btree (code_task varchar_pattern_ops);
 6   DROP INDEX public.tasks_task_code_task_537643d9_like;
       public            postgres    false    278            �           1259    53224 *   tasks_vatrequested_benefitlink_id_edf110a9    INDEX     s   CREATE INDEX tasks_vatrequested_benefitlink_id_edf110a9 ON public.tasks_vatrequested USING btree (benefitlink_id);
 >   DROP INDEX public.tasks_vatrequested_benefitlink_id_edf110a9;
       public            postgres    false    279            �           1259    53225 ,   tasks_vatrequested_lettremission_id_786bbd79    INDEX     w   CREATE INDEX tasks_vatrequested_lettremission_id_786bbd79 ON public.tasks_vatrequested USING btree (lettremission_id);
 @   DROP INDEX public.tasks_vatrequested_lettremission_id_786bbd79;
       public            postgres    false    279            �           1259    53226    tasks_work_echeance_id_acf563bd    INDEX     [   CREATE INDEX tasks_work_echeance_id_acf563bd ON public.tasks_work USING btree (period_id);
 3   DROP INDEX public.tasks_work_echeance_id_acf563bd;
       public            postgres    false    280            �           1259    53227 $   tasks_work_lettremission_id_93a5077a    INDEX     g   CREATE INDEX tasks_work_lettremission_id_93a5077a ON public.tasks_work USING btree (lettremission_id);
 8   DROP INDEX public.tasks_work_lettremission_id_93a5077a;
       public            postgres    false    280            �           1259    53228    tasks_work_task_id_edd86e4b    INDEX     U   CREATE INDEX tasks_work_task_id_edd86e4b ON public.tasks_work USING btree (task_id);
 /   DROP INDEX public.tasks_work_task_id_edd86e4b;
       public            postgres    false    280            �           1259    53229     tasks_work_task_id_edd86e4b_like    INDEX     n   CREATE INDEX tasks_work_task_id_edd86e4b_like ON public.tasks_work USING btree (task_id varchar_pattern_ops);
 4   DROP INDEX public.tasks_work_task_id_edd86e4b_like;
       public            postgres    false    280            �           2606    53230 J   account_emailaddress account_emailaddress_user_id_2c513194_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_user_id_2c513194_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.account_emailaddress DROP CONSTRAINT account_emailaddress_user_id_2c513194_fk_auth_user_id;
       public          postgres    false    202    217    3054            �           2606    53622 P   account_emailconfirmation account_emailconfirmation_email_address_id_5b7f8c58_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_email_address_id_5b7f8c58_fk FOREIGN KEY (email_address_id) REFERENCES public.account_emailaddress(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.account_emailconfirmation DROP CONSTRAINT account_emailconfirmation_email_address_id_5b7f8c58_fk;
       public          postgres    false    202    203    3001            �           2606    53240 N   accounts_portefolio accounts_portefolio_lettremission_id_d71976d5_fk_ordres_le    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts_portefolio
    ADD CONSTRAINT accounts_portefolio_lettremission_id_d71976d5_fk_ordres_le FOREIGN KEY (lettremission_id) REFERENCES public.ordres_lettremission(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.accounts_portefolio DROP CONSTRAINT accounts_portefolio_lettremission_id_d71976d5_fk_ordres_le;
       public          postgres    false    204    259    3216            �           2606    53245 R   accounts_portefolio accounts_portefolio_rolecollaborateur_id_7645715a_fk_accounts_    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts_portefolio
    ADD CONSTRAINT accounts_portefolio_rolecollaborateur_id_7645715a_fk_accounts_ FOREIGN KEY (rolecollaborateur_id) REFERENCES public.accounts_scope(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.accounts_portefolio DROP CONSTRAINT accounts_portefolio_rolecollaborateur_id_7645715a_fk_accounts_;
       public          postgres    false    208    3030    204            �           2606    53250 O   accounts_portefolio accounts_portefolio_user_id_623858b2_fk_accounts_profile_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts_portefolio
    ADD CONSTRAINT accounts_portefolio_user_id_623858b2_fk_accounts_profile_id FOREIGN KEY (user_id) REFERENCES public.accounts_profile(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.accounts_portefolio DROP CONSTRAINT accounts_portefolio_user_id_623858b2_fk_accounts_profile_id;
       public          postgres    false    205    3017    204            �           2606    53255 B   accounts_profile accounts_profile_user_id_49a85d32_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts_profile
    ADD CONSTRAINT accounts_profile_user_id_49a85d32_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.accounts_profile DROP CONSTRAINT accounts_profile_user_id_49a85d32_fk_auth_user_id;
       public          postgres    false    3054    205    217            �           2606    53260 F   accounts_pwsafe accounts_pwsafe_lettremission_id_8f576869_fk_ordres_le    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts_pwsafe
    ADD CONSTRAINT accounts_pwsafe_lettremission_id_8f576869_fk_ordres_le FOREIGN KEY (lettremission_id) REFERENCES public.ordres_lettremission(id) DEFERRABLE INITIALLY DEFERRED;
 p   ALTER TABLE ONLY public.accounts_pwsafe DROP CONSTRAINT accounts_pwsafe_lettremission_id_8f576869_fk_ordres_le;
       public          postgres    false    259    3216    207            �           2606    53265 G   accounts_pwsafe accounts_pwsafe_user_id_6b8567f3_fk_accounts_profile_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts_pwsafe
    ADD CONSTRAINT accounts_pwsafe_user_id_6b8567f3_fk_accounts_profile_id FOREIGN KEY (user_id) REFERENCES public.accounts_profile(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.accounts_pwsafe DROP CONSTRAINT accounts_pwsafe_user_id_6b8567f3_fk_accounts_profile_id;
       public          postgres    false    205    3017    207            �           2606    53270 L   accounts_validator accounts_validator_lettremission_id_c9100ec9_fk_ordres_le    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts_validator
    ADD CONSTRAINT accounts_validator_lettremission_id_c9100ec9_fk_ordres_le FOREIGN KEY (lettremission_id) REFERENCES public.ordres_lettremission(id) DEFERRABLE INITIALLY DEFERRED;
 v   ALTER TABLE ONLY public.accounts_validator DROP CONSTRAINT accounts_validator_lettremission_id_c9100ec9_fk_ordres_le;
       public          postgres    false    259    3216    210            �           2606    53275 M   accounts_validator accounts_validator_user_id_ae93f26f_fk_accounts_profile_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts_validator
    ADD CONSTRAINT accounts_validator_user_id_ae93f26f_fk_accounts_profile_id FOREIGN KEY (user_id) REFERENCES public.accounts_profile(id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public.accounts_validator DROP CONSTRAINT accounts_validator_user_id_ae93f26f_fk_accounts_profile_id;
       public          postgres    false    205    210    3017            �           2606    53280 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public          postgres    false    215    213    3052            �           2606    53285 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public          postgres    false    211    213    3041            �           2606    53290 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public          postgres    false    215    3186    246                        2606    53295 D   auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
       public          postgres    false    3041    211    218                       2606    53300 B   auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
       public          postgres    false    3054    218    217                       2606    53305 S   auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
       public          postgres    false    3052    221    215                       2606    53310 V   auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
       public          postgres    false    221    217    3054                       2606    53315 J   customers_bankacount customers_bankacount_company_id_296f0bae_fk_customers    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers_bankacount
    ADD CONSTRAINT customers_bankacount_company_id_296f0bae_fk_customers FOREIGN KEY (company_id) REFERENCES public.customers_company(id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.customers_bankacount DROP CONSTRAINT customers_bankacount_company_id_296f0bae_fk_customers;
       public          postgres    false    228    225    3096                       2606    53320 D   customers_company customers_company_country_id_d2365eec_fk_customers    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers_company
    ADD CONSTRAINT customers_company_country_id_d2365eec_fk_customers FOREIGN KEY (country_id) REFERENCES public.customers_country(code_country) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.customers_company DROP CONSTRAINT customers_company_country_id_d2365eec_fk_customers;
       public          postgres    false    230    3108    228                       2606    53325 E   customers_company customers_company_currency_id_59caea32_fk_customers    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers_company
    ADD CONSTRAINT customers_company_currency_id_59caea32_fk_customers FOREIGN KEY (currency_id) REFERENCES public.customers_currency(currency_code) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.customers_company DROP CONSTRAINT customers_company_currency_id_59caea32_fk_customers;
       public          postgres    false    231    3114    228                       2606    53330 G   customers_company customers_company_legal_form_id_674849c0_fk_customers    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers_company
    ADD CONSTRAINT customers_company_legal_form_id_674849c0_fk_customers FOREIGN KEY (legal_form_id) REFERENCES public.customers_legalform(code_lf) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.customers_company DROP CONSTRAINT customers_company_legal_form_id_674849c0_fk_customers;
       public          postgres    false    228    3119    232                       2606    53335 H   customers_company customers_company_nationality_id_67a2b28a_fk_customers    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers_company
    ADD CONSTRAINT customers_company_nationality_id_67a2b28a_fk_customers FOREIGN KEY (nationality_id) REFERENCES public.customers_nationality(code_nationality) DEFERRABLE INITIALLY DEFERRED;
 r   ALTER TABLE ONLY public.customers_company DROP CONSTRAINT customers_company_nationality_id_67a2b28a_fk_customers;
       public          postgres    false    3125    233    228            	           2606    53340 O   customers_contact customers_contact_company_id_b52c4cc4_fk_customers_company_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers_contact
    ADD CONSTRAINT customers_contact_company_id_b52c4cc4_fk_customers_company_id FOREIGN KEY (company_id) REFERENCES public.customers_company(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.customers_contact DROP CONSTRAINT customers_contact_company_id_b52c4cc4_fk_customers_company_id;
       public          postgres    false    229    3096    228            
           2606    53345 M   customers_contact customers_contact_person_id_32cb4479_fk_customers_person_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers_contact
    ADD CONSTRAINT customers_contact_person_id_32cb4479_fk_customers_person_id FOREIGN KEY (person_id) REFERENCES public.customers_person(id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public.customers_contact DROP CONSTRAINT customers_contact_person_id_32cb4479_fk_customers_person_id;
       public          postgres    false    229    3139    235                       2606    53350 M   customers_office customers_office_company_id_653a34c9_fk_customers_company_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers_office
    ADD CONSTRAINT customers_office_company_id_653a34c9_fk_customers_company_id FOREIGN KEY (company_id) REFERENCES public.customers_company(id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public.customers_office DROP CONSTRAINT customers_office_company_id_653a34c9_fk_customers_company_id;
       public          postgres    false    3096    234    228                       2606    53355 B   customers_person customers_person_country_id_bb7c8b94_fk_customers    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers_person
    ADD CONSTRAINT customers_person_country_id_bb7c8b94_fk_customers FOREIGN KEY (country_id) REFERENCES public.customers_country(code_country) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.customers_person DROP CONSTRAINT customers_person_country_id_bb7c8b94_fk_customers;
       public          postgres    false    3108    235    230                       2606    53360 F   customers_person customers_person_nationality_id_45b2dbf8_fk_customers    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers_person
    ADD CONSTRAINT customers_person_nationality_id_45b2dbf8_fk_customers FOREIGN KEY (nationality_id) REFERENCES public.customers_nationality(code_nationality) DEFERRABLE INITIALLY DEFERRED;
 p   ALTER TABLE ONLY public.customers_person DROP CONSTRAINT customers_person_nationality_id_45b2dbf8_fk_customers;
       public          postgres    false    3125    233    235            6           2606    53664 Q   customers_prospect customers_prospect_contact_id_fe9f64b5_fk_customers_contact_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers_prospect
    ADD CONSTRAINT customers_prospect_contact_id_fe9f64b5_fk_customers_contact_id FOREIGN KEY (contact_id) REFERENCES public.customers_contact(id) DEFERRABLE INITIALLY DEFERRED;
 {   ALTER TABLE ONLY public.customers_prospect DROP CONSTRAINT customers_prospect_contact_id_fe9f64b5_fk_customers_contact_id;
       public          postgres    false    3102    283    229            7           2606    53669 E   customers_prospect customers_prospect_office_id_974d0cb2_fk_customers    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers_prospect
    ADD CONSTRAINT customers_prospect_office_id_974d0cb2_fk_customers FOREIGN KEY (office_id) REFERENCES public.customers_office(code_lf) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.customers_prospect DROP CONSTRAINT customers_prospect_office_id_974d0cb2_fk_customers;
       public          postgres    false    3131    283    234                       2606    53375 U   customers_representativecompany customers_representa_company_id_4ad471fb_fk_customers    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers_representativecompany
    ADD CONSTRAINT customers_representa_company_id_4ad471fb_fk_customers FOREIGN KEY (company_id) REFERENCES public.customers_company(id) DEFERRABLE INITIALLY DEFERRED;
    ALTER TABLE ONLY public.customers_representativecompany DROP CONSTRAINT customers_representa_company_id_4ad471fb_fk_customers;
       public          postgres    false    237    3096    228                       2606    53380 N   customers_representative customers_representa_company_id_54193de8_fk_customers    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers_representative
    ADD CONSTRAINT customers_representa_company_id_54193de8_fk_customers FOREIGN KEY (company_id) REFERENCES public.customers_company(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.customers_representative DROP CONSTRAINT customers_representa_company_id_54193de8_fk_customers;
       public          postgres    false    228    236    3096                       2606    53385 R   customers_representativelink customers_representa_company_id_63c45cb7_fk_customers    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers_representativelink
    ADD CONSTRAINT customers_representa_company_id_63c45cb7_fk_customers FOREIGN KEY (company_id) REFERENCES public.customers_company(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.customers_representativelink DROP CONSTRAINT customers_representa_company_id_63c45cb7_fk_customers;
       public          postgres    false    228    3096    238                       2606    53390 M   customers_representative customers_representa_person_id_2922b303_fk_customers    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers_representative
    ADD CONSTRAINT customers_representa_person_id_2922b303_fk_customers FOREIGN KEY (person_id) REFERENCES public.customers_person(id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public.customers_representative DROP CONSTRAINT customers_representa_person_id_2922b303_fk_customers;
       public          postgres    false    235    236    3139                       2606    53395 _   customers_representativecompany customers_representa_representativelink_i_1624f777_fk_customers    FK CONSTRAINT       ALTER TABLE ONLY public.customers_representativecompany
    ADD CONSTRAINT customers_representa_representativelink_i_1624f777_fk_customers FOREIGN KEY (representativelink_id) REFERENCES public.customers_representativelink(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.customers_representativecompany DROP CONSTRAINT customers_representa_representativelink_i_1624f777_fk_customers;
       public          postgres    false    3157    238    237                       2606    53400 X   customers_representative customers_representa_rolerepresentative_i_42fecf8d_fk_customers    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers_representative
    ADD CONSTRAINT customers_representa_rolerepresentative_i_42fecf8d_fk_customers FOREIGN KEY (rolerepresentative_id) REFERENCES public.customers_rolerepresentative(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.customers_representative DROP CONSTRAINT customers_representa_rolerepresentative_i_42fecf8d_fk_customers;
       public          postgres    false    236    239    3159                       2606    53405 _   customers_representativecompany customers_representa_rolerepresentative_i_fb5c0c8d_fk_customers    FK CONSTRAINT       ALTER TABLE ONLY public.customers_representativecompany
    ADD CONSTRAINT customers_representa_rolerepresentative_i_fb5c0c8d_fk_customers FOREIGN KEY (rolerepresentative_id) REFERENCES public.customers_rolerepresentative(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.customers_representativecompany DROP CONSTRAINT customers_representa_rolerepresentative_i_fb5c0c8d_fk_customers;
       public          postgres    false    239    3159    237                       2606    53410 O   customers_shareholderlink customers_shareholde_company_id_1292bf51_fk_customers    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers_shareholderlink
    ADD CONSTRAINT customers_shareholde_company_id_1292bf51_fk_customers FOREIGN KEY (company_id) REFERENCES public.customers_company(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.customers_shareholderlink DROP CONSTRAINT customers_shareholde_company_id_1292bf51_fk_customers;
       public          postgres    false    228    3096    243                       2606    53415 R   customers_shareholdercompany customers_shareholde_company_id_5f7ea741_fk_customers    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers_shareholdercompany
    ADD CONSTRAINT customers_shareholde_company_id_5f7ea741_fk_customers FOREIGN KEY (company_id) REFERENCES public.customers_company(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.customers_shareholdercompany DROP CONSTRAINT customers_shareholde_company_id_5f7ea741_fk_customers;
       public          postgres    false    3096    228    242                       2606    53420 K   customers_shareholder customers_shareholde_company_id_bf06ce33_fk_customers    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers_shareholder
    ADD CONSTRAINT customers_shareholde_company_id_bf06ce33_fk_customers FOREIGN KEY (company_id) REFERENCES public.customers_company(id) DEFERRABLE INITIALLY DEFERRED;
 u   ALTER TABLE ONLY public.customers_shareholder DROP CONSTRAINT customers_shareholde_company_id_bf06ce33_fk_customers;
       public          postgres    false    228    241    3096                       2606    53425 Z   customers_shareholdercompany customers_shareholde_shareholderlink_id_0f97a228_fk_customers    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers_shareholdercompany
    ADD CONSTRAINT customers_shareholde_shareholderlink_id_0f97a228_fk_customers FOREIGN KEY (shareholderlink_id) REFERENCES public.customers_shareholderlink(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.customers_shareholdercompany DROP CONSTRAINT customers_shareholde_shareholderlink_id_0f97a228_fk_customers;
       public          postgres    false    3178    243    242                       2606    53430 U   customers_shareholder customers_shareholder_person_id_5be2174f_fk_customers_person_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers_shareholder
    ADD CONSTRAINT customers_shareholder_person_id_5be2174f_fk_customers_person_id FOREIGN KEY (person_id) REFERENCES public.customers_person(id) DEFERRABLE INITIALLY DEFERRED;
    ALTER TABLE ONLY public.customers_shareholder DROP CONSTRAINT customers_shareholder_person_id_5be2174f_fk_customers_person_id;
       public          postgres    false    241    3139    235                       2606    53435 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public          postgres    false    244    3186    246                       2606    53440 B   django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
       public          postgres    false    3054    217    244                       2606    53445 Q   editions_docmodelword editions_docmodelwor_code_docmodel_id_8e1ebb29_fk_editions_    FK CONSTRAINT     �   ALTER TABLE ONLY public.editions_docmodelword
    ADD CONSTRAINT editions_docmodelwor_code_docmodel_id_8e1ebb29_fk_editions_ FOREIGN KEY (code_docmodel_id) REFERENCES public.editions_docmodel(code_docmodel) DEFERRABLE INITIALLY DEFERRED;
 {   ALTER TABLE ONLY public.editions_docmodelword DROP CONSTRAINT editions_docmodelwor_code_docmodel_id_8e1ebb29_fk_editions_;
       public          postgres    false    3200    253    254                       2606    53450 L   editions_socialdoc editions_socialdoc_lettremission_id_33c3d059_fk_ordres_le    FK CONSTRAINT     �   ALTER TABLE ONLY public.editions_socialdoc
    ADD CONSTRAINT editions_socialdoc_lettremission_id_33c3d059_fk_ordres_le FOREIGN KEY (lettremission_id) REFERENCES public.ordres_lettremission(id) DEFERRABLE INITIALLY DEFERRED;
 v   ALTER TABLE ONLY public.editions_socialdoc DROP CONSTRAINT editions_socialdoc_lettremission_id_33c3d059_fk_ordres_le;
       public          postgres    false    256    259    3216                       2606    53455 J   ordres_lettremission ordres_lettremission_company_id_438b6bbc_fk_customers    FK CONSTRAINT     �   ALTER TABLE ONLY public.ordres_lettremission
    ADD CONSTRAINT ordres_lettremission_company_id_438b6bbc_fk_customers FOREIGN KEY (company_id) REFERENCES public.customers_company(id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.ordres_lettremission DROP CONSTRAINT ordres_lettremission_company_id_438b6bbc_fk_customers;
       public          postgres    false    3096    259    228            !           2606    53460 T   ordres_lettremissionlink ordres_lettremission_lettremission_id_bb061c21_fk_ordres_le    FK CONSTRAINT     �   ALTER TABLE ONLY public.ordres_lettremissionlink
    ADD CONSTRAINT ordres_lettremission_lettremission_id_bb061c21_fk_ordres_le FOREIGN KEY (lettremission_id) REFERENCES public.ordres_lettremission(id) DEFERRABLE INITIALLY DEFERRED;
 ~   ALTER TABLE ONLY public.ordres_lettremissionlink DROP CONSTRAINT ordres_lettremission_lettremission_id_bb061c21_fk_ordres_le;
       public          postgres    false    260    3216    259                       2606    53465 P   ordres_lettremission ordres_lettremission_moduleservice_id_85831cde_fk_ordres_mo    FK CONSTRAINT     �   ALTER TABLE ONLY public.ordres_lettremission
    ADD CONSTRAINT ordres_lettremission_moduleservice_id_85831cde_fk_ordres_mo FOREIGN KEY (moduleservice_id) REFERENCES public.ordres_moduleservice(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.ordres_lettremission DROP CONSTRAINT ordres_lettremission_moduleservice_id_85831cde_fk_ordres_mo;
       public          postgres    false    259    261    3230                        2606    53470 I   ordres_lettremission ordres_lettremission_office_id_0f2982af_fk_customers    FK CONSTRAINT     �   ALTER TABLE ONLY public.ordres_lettremission
    ADD CONSTRAINT ordres_lettremission_office_id_0f2982af_fk_customers FOREIGN KEY (office_id) REFERENCES public.customers_office(code_lf) DEFERRABLE INITIALLY DEFERRED;
 s   ALTER TABLE ONLY public.ordres_lettremission DROP CONSTRAINT ordres_lettremission_office_id_0f2982af_fk_customers;
       public          postgres    false    259    234    3131            "           2606    53480 E   ordres_ordre ordres_ordre_company_id_11ddded4_fk_customers_company_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.ordres_ordre
    ADD CONSTRAINT ordres_ordre_company_id_11ddded4_fk_customers_company_id FOREIGN KEY (company_id) REFERENCES public.customers_company(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.ordres_ordre DROP CONSTRAINT ordres_ordre_company_id_11ddded4_fk_customers_company_id;
       public          postgres    false    228    263    3096            #           2606    53485 H   ordres_ordre ordres_ordre_office_id_711c56fd_fk_customers_office_code_lf    FK CONSTRAINT     �   ALTER TABLE ONLY public.ordres_ordre
    ADD CONSTRAINT ordres_ordre_office_id_711c56fd_fk_customers_office_code_lf FOREIGN KEY (office_id) REFERENCES public.customers_office(code_lf) DEFERRABLE INITIALLY DEFERRED;
 r   ALTER TABLE ONLY public.ordres_ordre DROP CONSTRAINT ordres_ordre_office_id_711c56fd_fk_customers_office_code_lf;
       public          postgres    false    263    3131    234            $           2606    53490 B   ordres_outlay ordres_outlay_moduleservice_id_1b55901d_fk_ordres_mo    FK CONSTRAINT     �   ALTER TABLE ONLY public.ordres_outlay
    ADD CONSTRAINT ordres_outlay_moduleservice_id_1b55901d_fk_ordres_mo FOREIGN KEY (moduleservice_id) REFERENCES public.ordres_moduleservice(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.ordres_outlay DROP CONSTRAINT ordres_outlay_moduleservice_id_1b55901d_fk_ordres_mo;
       public          postgres    false    261    264    3230            %           2606    53495 H   ordres_outlayitem ordres_outlayitem_ordre_id_3777bebd_fk_ordres_ordre_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.ordres_outlayitem
    ADD CONSTRAINT ordres_outlayitem_ordre_id_3777bebd_fk_ordres_ordre_id FOREIGN KEY (ordre_id) REFERENCES public.ordres_ordre(id) DEFERRABLE INITIALLY DEFERRED;
 r   ALTER TABLE ONLY public.ordres_outlayitem DROP CONSTRAINT ordres_outlayitem_ordre_id_3777bebd_fk_ordres_ordre_id;
       public          postgres    false    266    3234    263            &           2606    53500 J   ordres_outlayitem ordres_outlayitem_outlay_id_ba0705b9_fk_ordres_outlay_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.ordres_outlayitem
    ADD CONSTRAINT ordres_outlayitem_outlay_id_ba0705b9_fk_ordres_outlay_id FOREIGN KEY (outlay_id) REFERENCES public.ordres_outlay(id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.ordres_outlayitem DROP CONSTRAINT ordres_outlayitem_outlay_id_ba0705b9_fk_ordres_outlay_id;
       public          postgres    false    266    264    3242            '           2606    53505 D   ordres_service ordres_service_moduleservice_id_f81d374e_fk_ordres_mo    FK CONSTRAINT     �   ALTER TABLE ONLY public.ordres_service
    ADD CONSTRAINT ordres_service_moduleservice_id_f81d374e_fk_ordres_mo FOREIGN KEY (moduleservice_id) REFERENCES public.ordres_moduleservice(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.ordres_service DROP CONSTRAINT ordres_service_moduleservice_id_f81d374e_fk_ordres_mo;
       public          postgres    false    267    3230    261            (           2606    53510 O   ordres_servicedescription ordres_servicedescri_service_id_72e0a86d_fk_ordres_se    FK CONSTRAINT     �   ALTER TABLE ONLY public.ordres_servicedescription
    ADD CONSTRAINT ordres_servicedescri_service_id_72e0a86d_fk_ordres_se FOREIGN KEY (service_id) REFERENCES public.ordres_service(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.ordres_servicedescription DROP CONSTRAINT ordres_servicedescri_service_id_72e0a86d_fk_ordres_se;
       public          postgres    false    267    269    3251            )           2606    53515 J   ordres_serviceitem ordres_serviceitem_ordre_id_8f8e0a5b_fk_ordres_ordre_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.ordres_serviceitem
    ADD CONSTRAINT ordres_serviceitem_ordre_id_8f8e0a5b_fk_ordres_ordre_id FOREIGN KEY (ordre_id) REFERENCES public.ordres_ordre(id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.ordres_serviceitem DROP CONSTRAINT ordres_serviceitem_ordre_id_8f8e0a5b_fk_ordres_ordre_id;
       public          postgres    false    271    3234    263            *           2606    53520 N   ordres_serviceitem ordres_serviceitem_service_id_bb1e292c_fk_ordres_service_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.ordres_serviceitem
    ADD CONSTRAINT ordres_serviceitem_service_id_bb1e292c_fk_ordres_service_id FOREIGN KEY (service_id) REFERENCES public.ordres_service(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.ordres_serviceitem DROP CONSTRAINT ordres_serviceitem_service_id_bb1e292c_fk_ordres_service_id;
       public          postgres    false    271    267    3251            +           2606    53525 H   tasks_benefititem tasks_benefititem_benefitlink_id_2f1d11ae_fk_tasks_ben    FK CONSTRAINT     �   ALTER TABLE ONLY public.tasks_benefititem
    ADD CONSTRAINT tasks_benefititem_benefitlink_id_2f1d11ae_fk_tasks_ben FOREIGN KEY (benefitlink_id) REFERENCES public.tasks_benefitlink(id) DEFERRABLE INITIALLY DEFERRED;
 r   ALTER TABLE ONLY public.tasks_benefititem DROP CONSTRAINT tasks_benefititem_benefitlink_id_2f1d11ae_fk_tasks_ben;
       public          postgres    false    3277    273    274            ,           2606    53530 I   tasks_benefititem tasks_benefititem_code_benefit_id_d2b8644f_fk_tasks_ben    FK CONSTRAINT     �   ALTER TABLE ONLY public.tasks_benefititem
    ADD CONSTRAINT tasks_benefititem_code_benefit_id_d2b8644f_fk_tasks_ben FOREIGN KEY (code_benefit_id) REFERENCES public.tasks_benefit(code_benefit) DEFERRABLE INITIALLY DEFERRED;
 s   ALTER TABLE ONLY public.tasks_benefititem DROP CONSTRAINT tasks_benefititem_code_benefit_id_d2b8644f_fk_tasks_ben;
       public          postgres    false    273    3266    272            -           2606    53535 J   tasks_benefitlink tasks_benefitlink_lettremission_id_525fd10c_fk_ordres_le    FK CONSTRAINT     �   ALTER TABLE ONLY public.tasks_benefitlink
    ADD CONSTRAINT tasks_benefitlink_lettremission_id_525fd10c_fk_ordres_le FOREIGN KEY (lettremission_id) REFERENCES public.ordres_lettremission(id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.tasks_benefitlink DROP CONSTRAINT tasks_benefitlink_lettremission_id_525fd10c_fk_ordres_le;
       public          postgres    false    3216    259    274            .           2606    53640 S   tasks_benefitrequested tasks_benefitrequested_worklink_id_7da0ebef_fk_tasks_work_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.tasks_benefitrequested
    ADD CONSTRAINT tasks_benefitrequested_worklink_id_7da0ebef_fk_tasks_work_id FOREIGN KEY (worklink_id) REFERENCES public.tasks_work(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.tasks_benefitrequested DROP CONSTRAINT tasks_benefitrequested_worklink_id_7da0ebef_fk_tasks_work_id;
       public          postgres    false    280    3306    275            /           2606    53550 >   tasks_claim tasks_claim_lettremission_id_7bdd1ad4_fk_ordres_le    FK CONSTRAINT     �   ALTER TABLE ONLY public.tasks_claim
    ADD CONSTRAINT tasks_claim_lettremission_id_7bdd1ad4_fk_ordres_le FOREIGN KEY (lettremission_id) REFERENCES public.ordres_lettremission(id) DEFERRABLE INITIALLY DEFERRED;
 h   ALTER TABLE ONLY public.tasks_claim DROP CONSTRAINT tasks_claim_lettremission_id_7bdd1ad4_fk_ordres_le;
       public          postgres    false    276    259    3216            0           2606    53555 ;   tasks_task tasks_task_code_benefit_id_611dd4c0_fk_tasks_ben    FK CONSTRAINT     �   ALTER TABLE ONLY public.tasks_task
    ADD CONSTRAINT tasks_task_code_benefit_id_611dd4c0_fk_tasks_ben FOREIGN KEY (code_benefit_id) REFERENCES public.tasks_benefit(code_benefit) DEFERRABLE INITIALLY DEFERRED;
 e   ALTER TABLE ONLY public.tasks_task DROP CONSTRAINT tasks_task_code_benefit_id_611dd4c0_fk_tasks_ben;
       public          postgres    false    3266    278    272            1           2606    53560 J   tasks_vatrequested tasks_vatrequested_benefitlink_id_edf110a9_fk_tasks_ben    FK CONSTRAINT     �   ALTER TABLE ONLY public.tasks_vatrequested
    ADD CONSTRAINT tasks_vatrequested_benefitlink_id_edf110a9_fk_tasks_ben FOREIGN KEY (benefitlink_id) REFERENCES public.tasks_benefitlink(id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.tasks_vatrequested DROP CONSTRAINT tasks_vatrequested_benefitlink_id_edf110a9_fk_tasks_ben;
       public          postgres    false    274    3277    279            2           2606    53565 L   tasks_vatrequested tasks_vatrequested_lettremission_id_786bbd79_fk_ordres_le    FK CONSTRAINT     �   ALTER TABLE ONLY public.tasks_vatrequested
    ADD CONSTRAINT tasks_vatrequested_lettremission_id_786bbd79_fk_ordres_le FOREIGN KEY (lettremission_id) REFERENCES public.ordres_lettremission(id) DEFERRABLE INITIALLY DEFERRED;
 v   ALTER TABLE ONLY public.tasks_vatrequested DROP CONSTRAINT tasks_vatrequested_lettremission_id_786bbd79_fk_ordres_le;
       public          postgres    false    279    259    3216            3           2606    53570 J   tasks_work tasks_work_lettremission_id_93a5077a_fk_ordres_lettremission_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.tasks_work
    ADD CONSTRAINT tasks_work_lettremission_id_93a5077a_fk_ordres_lettremission_id FOREIGN KEY (lettremission_id) REFERENCES public.ordres_lettremission(id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.tasks_work DROP CONSTRAINT tasks_work_lettremission_id_93a5077a_fk_ordres_lettremission_id;
       public          postgres    false    259    280    3216            4           2606    53575 ;   tasks_work tasks_work_period_id_e4289768_fk_tasks_period_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.tasks_work
    ADD CONSTRAINT tasks_work_period_id_e4289768_fk_tasks_period_id FOREIGN KEY (period_id) REFERENCES public.tasks_period(id) DEFERRABLE INITIALLY DEFERRED;
 e   ALTER TABLE ONLY public.tasks_work DROP CONSTRAINT tasks_work_period_id_e4289768_fk_tasks_period_id;
       public          postgres    false    3289    280    277            5           2606    53580 >   tasks_work tasks_work_task_id_edd86e4b_fk_tasks_task_code_task    FK CONSTRAINT     �   ALTER TABLE ONLY public.tasks_work
    ADD CONSTRAINT tasks_work_task_id_edd86e4b_fk_tasks_task_code_task FOREIGN KEY (task_id) REFERENCES public.tasks_task(code_task) DEFERRABLE INITIALLY DEFERRED;
 h   ALTER TABLE ONLY public.tasks_work DROP CONSTRAINT tasks_work_task_id_edd86e4b_fk_tasks_task_code_task;
       public          postgres    false    280    278    3294            �   B   x�3�L��+.�)I�+12vH--�OIM�,�K���L�,��2BRbh`W��X��YWh����� i��      �      x������ � �      �      x���K�%9rE�����i��h��
��\�(A�$�Bu"��ţ�4�3�>�F�1?ɂ�KMO;m?a���}n���\���'����+��o��O��w�,�?����P���9ϙV��#������a)����gh|��g�Y�g�T?������������W��`�f��27��:��r{Xo�x|��X�~�
��Q��؟t�~F뱙��4��m�kS�_>��߱�����Z����rO�˞^g|rh������m��ji96˓V+O�y<>�yJ�X��r�#t�ZzR��=��]Y�t�GZ&�ĕg�a>V�{R��w`�9q�����y��N���3%�'�l��ӟ�6|r�o��Sbk7�0��S���cHc����⟗��z�:G`�(���W�O�ş<��i;��Z�'��;���!��6WG�>��v�_{�����Ι��v���0zl:����?��k=��Y������s��b���e�����vj}�g�k���,Ι��Y�|̖��kx�3��p-�y���*��~*�lu�=#���]j��e��}�z��T]$]����ݪ1�i^&��s�!/�|�-��;m缕��z���O�$f�|p7����2}�>��ܟ���F�OY�p7L�<{��k3�7�ωu��L��;�F�����H��_�Hvʬk����q���H���ؗ:���+��#�D1�gL�G�vYi�K�v�^��'��S��K->a��Z��O�� u���MǶT�e�&�D��2��6�'B:djJ�Q9�f*���Y;n7I呧Pt�ԛ?&�\�h�k|�2 ���܏��2{4��,��.Ss����Ԧ�}�L�		����K$r��O�z���d+F�p�7AG[-��g�@&Wή���S�k�xI�H�V ��e/�&�4I�ڳ��և7�� ��ɳ��A�F�%� `�K�)��d�Q�>�k�~���r�Zu��q��9�6p��I�/��c�n/J�n蘂	���tw���e�T��2�R�m��HL�� ��Q#`C��|�Ӂp�x��8§���F�'k�o�C"���e
u�}�Ұ���Œ��!r���i����V���U��d�%Ҍ}pFT���ۀ��CI{�a��v���[#F�g��bۓ������<#4��i0*��O;��y�mE���{�K)d��p�����C�]����T�k��T�d!�_S]�Ȼ������"�i<óp����n�Ӑ�
�thd��t\���pg�bnG�Ѐt%h��4�)0���5h�� -�|\/	מZ��Ё���h`v�-� ��D%���S!^F�4+��7�%e=��GFԳ�ۜ��pP��.�NYh��<��gP/L�;�� 48 E�`���D+%��KY�!��[�+��D�&�kmh���{�Uj�h
+��Y�$�������`yE|���D"�M\�j���y�\��k)�Vб$\��<�n8��@�4�6�ѻI�pў�lh�*8L=Ex��PMj�	���0'Zy�wR'&-��٤(�ҟ�`:([�l^������qԏrH$R&U�̔a�_�a{�>�4\��' �nE?G�M��8��4�_=�������"���l����>Pg_���\q�0G�
0�@��˚?��il��ƲD�ܨI88�t�vQ��	�R'?��EQ�4���p��ι�h�֘R�E6ǰ`��r*�K~�N:l>���/ �QiJ������2k$���Ȫ�(&@����vh�q�������D�7΀t?ظsz�0����z@�P�6#�]�
p�5^l�Ő�����PƁ��|�J�5��$�j&G��7���+vru<��8P��́hp~Z<�H����$������5���y�a{dg�Y.Tp���d)�ɩy��"z��w�^��0��r
��A}���ȝ�\/̅��N�]>|��Xk:bo����o7"q��e�f04���L�D�A�\:gqv�ex�g��B�Z�n|���{|Y|t<���QH�0 [���nZ٧��=���*m!\H��rq����N���iL'��E7,��m����ɦ+W��&��x9�p:tI��o��&c��4�!b�8��|��u�N�HKj�@w ��_�HƎ���}�t	��W���ua�m �c;aɲ�~#({p��8�7��nIU8Ɗ�ӆ�^�	��ijl�&�P��'����J@�م4I����ٰ17���B&RY��q�'�/��%��n৽I��W�;OW˜�SQ�'�|�II(�R�U��%�����a� ?'�)�c��LrE"��e�u�p&�`6��Є�	��b'��b�Uopl�
��S#C�}x�-�=��r���_��Ri����8�h'�.@�6��<�j�Ѫ9`�a}.j�
����eѱ����ђv�	L[��c�9;�e`7A�12�l=ʵ����N$�k`��P�&��1�}b���
;0��e��4684�OZ_�I��CR���T���AD�[�-��Yz��ЎL��O�Ƀ���a˽x�i#��P,p�~�(���2p�t�v���A_l���;ɫ�A��V$m�O�_D�>�&R8?�-?	}���)6oH[�L\�qo�3��P
��o�:d�W��!� w�a�U�ȋh�!x����oѹ�7%�Jsȵ�����ŃvK�amk�9l���S��oi�ҥ�0fB��丒l5?��E���3�0�vNVH26��������࠯g����7�YF�%U���7Z�,<����r����:	�&�n�I�������|+~��c���
��:�ݪ]b�)^��TQI*��c@�RL��ʞ���m�g#a?��(e�@B������t�^<�T|��]*��p��I�m�n�򙐂�BJ� �(���"{A�O��^�!#��B���e��O~O���@2ǳ�{�;;�=X���8�.0���
ʳ�4�:�Z ���bb��_t���F�0Q�Ђ������
���Ra�Мis*bԷ��5C���t)ŵ��5����W��un�z��'���I���dP��Y�)�mxS����ܦ�䃼�C�	 �����,r��~j��@������Q��9�SMF�q�����r>a��e7�"���O)�=��v� �6%��G�����D��Ռ\�`s�3���V�g�PP������P�Xl����	k���\�M��<�rl���$h�FucR��x��ut0I�(��W�� ʱ��U���!(�2h _��3�e��e.�p6g��viqQ/���s2���q0�/��$^�qc���|0u�:�Z[#��9�UB��:�Rq�r"�<�L2�V���B|����h���F�"L���a���2k��K�FN���׷`k������u8��u��o�S��#��BW���N�j��W�[Q��]��(�W./έ���."������R��]�n�\s�()|�,��T���l��p1��c�4�	g�J�`���R��-ެN'��g���2F]��K�ξS+��s�<���d��Ȍ�$(j�s�s���Ɓ�U6I��@�&�gȝ�^��ڏDXgܛ.ǖ�{D�ʁ�vYL#��g5B�=QŊ�q��Gի8\Jp��Jj�)=�~;a��g�E�z��-�)������p�����qx!���m��,C��EJ���ExX��ci���7���ָ���,w��BQi{�.rEۥ�	7~����SW�ϻiX�i�6d[r ��5?�R+Jh~w�k��l}b��w��Ȅ�zAs��nF���R C��È0EX�X��kCW"�����^�:Ie�`L0lV*��p	5�'��_�5���2��&��~�` 1A��=������g3�Fa��4Hj�4��4�u�G��k�pM*!��UZ�
�R�e�<
�����=T����O���ؗ�j��ֽ��!r�C)f"���V+rY�^tT�r�uf}�[!�6� �  �/�N�̑x�Ȁv<*��D��\p^)u�P , Wβ#����E��	�I�k;mϿ�i���<�|��狺�����4�
��wST!�P�w�hΝ�	�f[!�gշ�#+���ϡa˦��@7��!#j[������\K�D��<-���H;��;�`�Ɔu.5��v����?5�b��'q���O{LM�T{7��#�w�#*ǎ�U#2"ҩOW_���,�/��k�H��s9w_�4�v����f\|9���<��0�z���>�Z�9���Y���&�,��"mp1yG?z���8T��K��v��c�����%����~2[>d��`rD����W)j{�L�� i��L2��h���������5lǖ��_���ſx#vZ0�s��H��K�xF�#�V.w�g5{+�Z1#���<���F����O(���lN��o�rx\�{�x����,}�\u�n)
�ak����%�V�{9���W�!�ISY=u��:F��� 
̉���i�����!8�&ZN��r��k{�;�g#!o�_�b*�B��:���G����o	'�16���s_��'c��D����c��c$8��v�0-r?~��c�1��[�y���p�p�ٰ��L�����ƙ�'��Am�e��9:�.�A�}u�%�&�v�i=*�&ҡ�PiA�^�m9����Z�-D��*ai;2����\D�gTX_�pӱ!�����i1�Z��X0��/�>��@�y�.�"�-����J}M��X���!Gy�^KU�e��@<j���s!�Kj��[� ������s�٘!>-����.X��������Rs��+j0����3J�x�Ȗ�jxx��ջ/+_�h)�&�$,4(vU��"h0�W���J�jɼE�)NY�خ�r	���e�����3�����#�U����wL��q�NӔdU_z겝fu��A������B��9j�>��f�DF����8�I������h�6��W�e��1����cn�1�:뻝| j��)Eul�һ�W�ˁm��e;vJ�������Z�ǳ�"��Ûj��|f��m�7�>���ǣ���� +��U�N�A@+B(R�}�hK`�5�HE����F�w�N+a��p��A�-l�jg��IARE|��=���z��̢�ϒ)�qh@pz� �!w寎�n�H� jA�g�"�wl����ձޤ���h������X[�4ǋE �y�[����$��O�:%�L�J몲�ɼ����3�D�߄�$"50,�"b���w�
���>����)��;u����ŕj��salϗ��£�=%���(������~�{_t5����d��У��v�PL���4	�>��A$�tK�w�����m�Ptg��[u��k�������<�ű�80�)��\������	*`(NO�w�d�����C�D3r��iō�U�|{U�� ,��#Z\24���U_�U�,J���0�L�~n�eVq2�+p�0ؒ"j.W���"Ƨv;L����U7/�%"�I��ET��jV��'�٬�Yu�l��HА}~��v��^��u��é��gӔ���La(�-vh,?*�:�S�틶��D�y
ո�h.$��B6�Y/v�5���H~gf�n��4.�� ���|�q�-HU5���@ �ڎ��8oӟ~gK8�}T���Q��vn}�-1���B�^B����o�CN�)�k�5���~�Ń9OMj����A�IN��k0�{l�/X��N0M��T3�:���+��0NҌ��oLs_�T E�t��UH,�N4���� ]0���#�Dh�׭�!2Ss�,�+�ʐ���jk�U�k�85�R�'|�1#_�F�K��]j��Q*|h'�8����zp�6�r�B�,� �����,Y�CrZ����u��_ͪ��e�3�UBr|S��6s������Lz	b<;�У�)얢(�iQ5`����{|����4�j�[��v����yԾ�N�R�s��~q"�Lz�����J��l���}���="��E�^������ˍ��"��W3U],�yM�����k�-� ���&Vp�h=�m��3!a�D?�ʊj,�3I�x���(��Vu\Jh7�9 �(���;�Vr��2	��S���PXa+��p���xO#���4�g��W����>��%j����ԭf����v�y��:D�E�����<��H�"u.t]�h�û�WV,J'��3e���vU�MI!qI t+�P���pfyW�_?�&V�4�S��T�_�=�u�����*7:hd��D��KP;G�-_��!��V٧�R�ׅ?6{�K0o�,E|�2�I�)u3<�%"��t&�6�J�yH�x�j�ߘF�������<	��
�0ų֛�]/��"7�fsq<��Jۗ���t�'v =}/D����h�a�p;6��F�`H�ƚI![���h��Wjs�����R�Z���$m�Kr�P]���+���=I�qM��XS�{��qݐ�Q�*�Ł�X������".��O��W���-�	�cG��-�
�?\�CZU>FYۭ����;�j��jr��K�Q���u�.�����U2�ꉜ�>o#IհU��X�tQ� >τ�6!���jܹ�ğߙO���9�w?E��T5Iz1��R��zH�0$�	e&�2j&�}�bo"6|S��3#���l�ǂA�h+UI�o.^�M�'i�/�T	E�$�<9��:��oi�_�Q9s��x�dԒ��U��ֱ8Z*gq�I�'{p}]��盠N?,������ν�D�^�m+�T� ��z0�Sc$��nz�d#k�F��_0@�Ε���i�b����tA�����5�k"?���Y�A����������ƹ5��� {�~c����9�-{N8�����p���y� ܫ?X��y���V���FYw���y�Up�`.��f^4k�ᕤ�{����m��	�:~��wCr�Y����Hy�|E���[��6�tp�і��Y��q�J��W�ցXO?Y/����
��βFT6b�ܬ�6�|������[��x����"7޷unK�;�>�_�Y����<�"�'�x�t8WA\�sǄ�����h��Ϸ�^~i�o�9h�Zýؗ��zA�f��4L�n�dͦ^�\��>�FG���E	�o� �F���0hD�y�����P�ƞK�,t�(Ax��׊�Bf/��&�hb��N��L�$JAK�"ݡ߸/�;�J��_�^с-m��H�k%�0ME�=��*b�ܪ�u)I��f~�gN,�ɦJ�o��a[��٤��ڦ����� ��׾�P��.�ޱ��D�M�/�ݎ�I�md��w�%"�3w�W;!]�|қ��G�k��ۏ؞�s�$X[�\�nu����u�ЪzOv�a��E�F?����0�Y�[f��C㍶[�D�7��
`Ps� ��a�nW�V�E�)�����e����"S��]V�PVhzb��nK�׋�͈�B���4^�U���?��3���c�Ω���A\�n3�uJ���8��P���Jא�p:6�?���G��:�-/����"����y�HnС\*����X9)^�6�	�\
"����	�(*y��~j#&M!�	%��o����8���3�����Okj ��·��[yk?[:����%Е�ɩm��6����c���H�Y����~E�>��O�4��8а�@��bh��M>>�������ÿ�S	��c����???�4�r      �   �  x���Ko�@���_�}�;w�3��G��+�E�&��#�)���wlW-�C)�W#���sf(���|����,YD�9��Ѳ,��me���N�r�=��`Y�"�@��>��`	$s��&�z
M�C����$��N��G�ۂ����0f8�4�ʓ(|��"�Gq�F.� JՅ,`��۳�U^5��6;~��ey*�����lO�b��JGn���k����U�_�ơ4 �)V�HO��=X�\?��Y�Lh�]� ~�#����+�5�����./��?���b>��V�
Éa" ��U��YX��o�.�i�!c����p�Ā2��p$hZK������Ѥ6��1H�1�|vv�a��Xw�q�@MDc0�l���Y�'��8����kQ������(����V~8�dq��� ����x!��F�MY����ϱ]L�Ek�2��J�v��n6�y[wN�Q��TЮ��k��A�9ǘ����������p��jp���3W}#?���Q}�T3�i�����V�p�O�:��e�'�U
$�*��af�8��?�0�R
��
��(<��ժmC86�������'{X��Z�{:H�V���W/5\ח����=@/�*d��w6�^1t��$i/��<KGEnO�|A!���a�КBS������Y��R      �   r   x�5�K
�@ �u��%%I�N�gq3�����?��Lԭ��>|��3���>���A�' $��(vaݕv��N�\I���?^?��?�9���ñ澢I�<"�"��H�%�tթ$@      �   h   x�3�t��-(IL���,9�R!�D! 13�ˈL�Js�p^Y�Y����e��X��Y�e��UZ���YX�
Ҟ�Y����eԙW����ef��$�����qqq �(      �      x���I�]9�E���y�	�4�Zj�v�ԹO����� ����h�m�Le6~]7|�.���,�;;��\Ǟa���O�18o.���O�B�w���/������װ\^�?���3̒��3���i9ϴ�+v��n�U]K+�z[�{�g��|����|��ȉvZ	��u�H�n��]lc�tC���o�e���ڼ�e7"��̢��-�}��oL��Z�ˣ��v�������֏����m����el7nf��F������E�i!�QݰC̍�{�F�̵���$;ק���br���o���R����HLi�~���/6��w��>X�g��;�w4�0�������
������֊�ս���d�G����Cks��	�Mmn�-S}d�l4�܊~��b��}�l�������%O9��)"J�~��՟]��Yx����K�%T�ԝw_d������+���\<{�^,��B��y�4Vq���yN�VZݭ�^����Rk�>���L�򢣺*h6����
��'���Y�eS���f�|H�����I|ն8��O��8�E��fs[)�'��VZ�5e׺�K���l>fzi"k����v�B]�Q�Yt���m�D���UƸ���9����w���Qӈ#�F�����{&-����^w��p�,��o��<*#��듺��S�ٺ�W�)�ޏʸ.5i9������Y�E�_�[;qSǑ�LԱ��ܾ��z#�= ,��)dUMT��c��Y�MO�	�wR�{�H ��Q������1oK~ݿ���]��,Tʥ�!L�D�n��O����2���<����F@E��X+���������,��e���Y�Vk
p�u�䂦�EB�����-1�����|2��]Z�Zw okdu�ti�F	ט(؋B4���@���F,����
�( ���� di;�^z�~\%%.��إ��,�������d�[7�}-�7Vv�C��@��H|�2�y��+��̃὚�r+'���c/4W���b���ŧg��25Ț�\�q��,�F��d�$n(��N�>O���X��7G���h��b�|����4GQ��)����	X�����K���G�A�'����V�Q#�v�6n����f`���C�"L7v��WR{@��_#��цڹP`*4à�O!4��h�~�"}Z�fpyB[O��\N����W?�Njֹ����N�
�����:E���*\<2R#���|��6��,�)_��vMD<��#3/99w=�	u3��NE�-X�Y�����L�X�]J|h��xpE(����p��P��μ sD�u�Js>9l�b��)��H)�E�RZhs��nM�F��dQ�ȕSD�<��%�F�%X���]l��s����v�Wӟ[�ӣP�V�����u8�ln��7J�o�ɞ�_��P��w�p�U�^�$5HM`Y��|�� �m��G;�A�� 9�{��r�f>�!��X�E��@4�C�Q!eMW�e{�޳�8�'�����j�V��r�y6VBPn����Q&i.x<�z��9�O��q�:���ѧ��R�1��,{^��&@����,a7VDs|��?����ɦ���:�� ��v��;��6<�0�9h�]�q->H%�A�h��e`�p�q��2O�c�O�Q���"x�v���W!�(�;�� W1`��V'�I��oшl̓��@fZh�Y�R^C��7�t�5��ٜ9H�dO�$`j�t�L�d��h	����������:��P����Ԏ?PJ�(|�����e����p�]	M��\X�\�dk��f?�D��]�ۭ�}V�'�U&���X)*)B>���Ѵ��i+t��'��YA�����̊��掴J�nRo�5`��7�T�g�:L��A;�f�x]�h;6 ���FL{�/W0?[��uw6�v2�gB5Rj!�Oa:��%��Z�E	�B�`�mQ`���R��f�ѭ&���ؓ"n���W«U��A��aY�
Qd��XB�����d:�/�BەPB_����|
��L,���]����Eե;�'��!��&?�w��'%����/��w��`��#RϮ
@�`rP���b���ޮ����EF/HP\��l��A+�A����&���z�Ғ�D���6�-�%���`�{�� ��c�h���Q�]��u��o�nU^�^�SB�~�>�-f �})~��`��L���
�$�d����@��:��	>W�*��=�_EI�#7�*M!���|�K��>���G�wI����X�X�\��]=��6�(8�z�%�N�F��y$?���Tb��ъ�%����C�
�������l4���(�bQ�h=K���!���>e��)w�g��>�r����s��(
�q�����K�aX���YE�����}�2Z_g��Rة�{§���e�9{�����Q�O���c���F�G�eg��3�g�:M�c�^'!����V�"]�au����������qPbl�jI����9 ��wx�W���T�Q����5��G��4���߳��N)�HA�8���y,b��3�oU� �{C��T8
\�X��H�T��6@�J���@�������ƅcN�2���u�,�n��7~v-(s�j���;Z�޸E��!���Ճ�_%Â`��1V��70�j��~(��D����(��s�f);2;ɝY*��}���[���#)D�in
"7��b���S#��	��XD#ar���JQqiu۟�.��4��x��֠T�;/����",��N�\z�r4*�8 wω��rRHS~�N�
�I���o��=�;��Qn�؃� I��Z1�j����ds2���jf
j�3_S|��f��5/^�Q��������YQ�b���W-���_N-�#���GZ�Iɐ�NMi�FX0U�X��.h���9�Ш�V_�U��7����sv}le��}���KSv�]�٘=�V 5I9Oc�+����/�:;�p�x��:!��קW	Z��/*�{���+�r5~?��[��eO�K��N{�d{Ͱ3r]D��3c;?�]Q��z��#z}M~zr���(F�/Ӎ����ɽ�ژ�B����K���I�|�/p�f�40l����>vR�o�.�*d1!V�`�Iu�#����@��ċ&�qAq�x�?�1������r����\!
�a�DP�n�� �q٢z�1؊����^�ϲ˙�ǑBYP��K�ջ�(⫆�*sD���2h�Å��t���{��n�-cN�<��:��"!�2�,�In�t�[Q���_����\|��.T���,���KC܍Ceɮ�Q��{W�q��Ks��C[�;z,>S&8�]$Y�ՠ� ��u�ko,xEڬ��=E�8��ϙ:�Y��xg�B��%���&����w����ߥ�H��7◇�eӅ/`__��zD�)�"�x��
�4�r�~�[�_���AȤi�έ�m�}���7�W�X�����I�]TAc���=�CH�h��:�0h��N6P�H+��,�M<$.�2h���ݙV�*�4��mx���=�},r{��@!>
5@�c��-�m��Q�{#j�}9��a�E��X�����!�@�rr��Bi0S��Lvr����e6�R�"l��������j����|=\Z�`�9��6)<C#^�鬮#��/�M�?� ���T?_E!���M%!BԜ��T�f�" �ㇱu�&�C�!١ivQ��)�f����II8����?k+�K�*H���U��T�}-2��1�-k�%����(�HIw��E.�$ߡL���liv�p�q��ˣQ0P;D.��;Fm4\��Fȶ�&���m�Yc��~z�}�����q� ��@T���6;N�6 �lb��f�P­|��s$�rb�a1_@ ��+)���O�(�Yԭ�e��{�i��Q1��v*|�8�B�l]x����׀�ǚI��u��Ҝ�Y��#z	<�选����u�(3��7�f���8(��x!��=��  �TH
��y��h����a���wr�# �  �国�����Qa U�BC0�j���7�o�s�e\��~-��i=?�<�*���2.'$'S���V���نuՕ:�n�}<����k�N��Ȫ9'i��*Є��:Da�
r����ż`J�
��$��.�:x�� `���w4����ʷ�#гȲ�C�ؙ�����X{��SW�I�{��Seݟ�=��%���m{�B����=����V� �����r��w��ʓ@ln>�")})9qm�.���B� jơ��H�V�ϤB�&V1ȼ_�Ɂ�P�����K��w6H㸊2�\|w{9�2��U��uT;u9l�P��m��iii�s��}!�|�ň�<m"����&E�Ǧ"�����<�'�ͥ|kru�,j��"��=}�#	�/3���g�~Q��`uH]��.�v"�_���}��ăE42��	�޳���oV��h����ũ�	��^k��}@��0���aj��ъ6/�X?�@ާ�$QU<�8�I򕮾��Dᴎ8���GÐc��6�8pp�J�mI��X�G�\�u��7���24�M�-hWו��i�XMJ�}}C�J?�"A��1�.���6F}�i{���8I#; �=Q:�VK.VG�YO�puDG���K,L}����4Fb�!p 5
X��7���x��XS7�n����m1b�f	�E,M��<:�4�o6�����wY !�Nw_�w�'�S=gd� T�
���eM���� �����
��0�BA�<��zu�\�u�f=�S�<h�t#j�R	����j���FЏmX�s�KN�Es�p�ct�.q4c6�Q��hfݪ#-B=4L}5��t3���d^��t޺+"Zv�q�PG=��wf�5�	Əd�`ۋo�&S�Sn�Ǯ�%���p���H}
v ����%�w�D�*��n�l4�/Dv�����ÅM�.�GSޗ�8���i�I��&:���S;4��zV�:�jM8Ip;��BW���^"�J}6��S�[�H�9�(�<z��>���vQ|~���#Q�� �]�ս�N��1��F�C�k}�Y�3%���wGi|g�����pȝ:���L�*��;�v���.�mAW���y'��"լ��a���}D,;D�#�!N��J=]Q�,�JHt��Q�����NO{|e��B1���D��Y=� ��g��S�w��є}��skdk1�tk�2�y�n��e��S?�~s��Y�P��\������RW�K������G�Ť�𬦻I=��=��w<���6��ّ]i��iH��1Ԫx�ߘQ�H�tU�r
8��Uj�����Y�`?wf�X���-���#Վ<�S����Gud�Xu���x��%�2,H�J&1j: *8am�S�6S��������� �@�      �      x�3�t���IL�/J,I--*����� T8�      �   [   x����0��a�^�'ݥ��Q����5bd!ZMľЈcX�^A�JN��c�^D�i8jJ���*mehz�K`kN��<HK��v��� �=i      �   )  x�}�ݒ�8�����	�:�\�kl�VBOjaC�y��-��qL��;p�H�bS��]���s7���OQ��_w.�: ���s ��lx�aE��l�5��
u��cXn��9���ִ��[s �;��?`٠a�j���p���s�_��	����椟}1RYO��Fj�"@p��Mt�zK��cY���������:������;�4u�/�����n���.8�&�RVGk$���'�+�ٟ������.�Ut���a�*k�we�g� �c{3��Pp���Ł츏e�ͽb$ ��� �@�n��Щ�;��q��8�����9��* �S�D�	����n��1_��֯�&�t��l��8�j���j����u�e���b��*!>�E�@fE@B�Ȧ�H��5	
�׬y,�u�@�_�-���d��p2g�P4�
cֈyY��<�sQ�"[�W	@Ş�q� ZLڮ��UCj����-x�V��e�%�25�I�a�G�i���-����﮿�:\�d����d����̜�xC�̌]C^T���2 Y;"]1��������Z)vŌF���,���Z%��C�[L�E"ޒb-�&�-G�"�Q?�����˭�h�-���C�#)����K���	yD��SP#�f�~
qIˋi*�	�n��lHx6�ɍ����L������ZL�<@�(�6��,Q��	erD�`I�Wv>}�!E�����h�(��������2R�B3c��a�����ݿ���iM�]�S!]�h�sN9�F΃��Mb��Q椦:��/��y��nￊ�V���#Vm��ϩ���P�Th����V�T�ىcf-O��'H�7Zy�9���<ˌܤ�1=ˌT3�G���Ä_Դ�&j)O��	�#�8�z��H,n�>��s���'�iݥ(���.�v�Q~z�F�F�W��4�4&U[��\��t��ߌ����9A�f\^���فx<���w�}�$��|�Mb����~���2ߒM1����43ߑ�4��w�KQ3w���o����ɾ�O�,;N'{;�xQf`Nbkh�zv9{����!I)��A`REG��oet���A:O���k�;˗/'�����V�nS�
[[OTvwf�	�H:̋{�/�+놬���_A�GH�/�LvG��/4���:����|�r ��2bF0�I�Ď`&�"C�hVŻ���>ܪ1T��2ǀqK@�+�m,����n\�[Ѵ֞orl��q�Ɋ.�5*�0+�ӑ�Ι>$O���<n&��Gax�̟��>� �۽��6���f���uqY�[�͞�}��VW�K���CT���F�Qe��7~UD�fۏ�>\ǵhh��K�@�J��B�P���3Ub:�Ψ�l��^(2+��Iq�Ɋ*�5*�0+���[�Lkf���q��I�!ݕ �їH� ӷH�L�)$���h����W��*�?�NH0�g/�@N	�>�=ܭ��{^\/-1���4�~v�� �� ܭ�~���V������	�#�(������l�;�8mc��f�C6���fE6�E��͊Lto��i��~u���������5�6GC�o<�Dq����I��""��g`$�}Vu�=�#��S��ڝ���>&�3�nU�C��B������
�\$�#('��p�A)����LM�_�h=��=��!c�(|��1p���6Xʁ��f�e>�rz���!���
7h d�����}��%����L%8��~�t�ҚC-��qX*5���Z�?C��X��y��S?__��n�os�1{s�"��,:e�r%�:�j�����=g��=�{U��1]�vPzP9=�4=����	��u��:��م-	�z��m�J��#9��js�+˓�<WƲN<��m=�����s�</�#��v��fzʺʽƥb|UB}��.���/}�ھF��� ���p=�.Lz�a � � ���MFB�9Q|~�&>�\%R��S�3D��� �ф���r���U���n֟O      �   !  x���ێ�X������*���ޘt2P(����L2AEAT@ԧ����l{jW������+;o�/�?��ET�"�Wu|bQl�f@7����Gd^ej��Ձ�S���T�j �͚qBͨ?����8]`D���|��� �C^�L��#���,*����-�R�̓m�G��� �!�E���~�	�$._�~�C� �cVP�\"����c�lf��v�
��`c����iT��hlϓ �Q:2v�K8Y&�!	Dw��
v\:�>��9�S.p��oC�ۺ��_R|�@��C&]1�c
rw��|�9�A��S�o����~�_7��s���>먃����2<M-���$�������巫S(P
(�o�Ɵ(���n�_� $ �2�n*����bG;���C��q�@g�����+�(�Kvn��d��K�J~���Ko�3#����:�cD��m�^��� �����^��"��F�D%^��P#{y��z��3��Q�
�����/��vq6�o��8S�c��8��FqO@�:!� g�@6d�g;��$~�@y�@c�xC ��i���)F�l��6U���N�i�`����T��<���V6���O�jw���F ��H��H	yC0�<M�0
�� �OnK(r��N�1I�N�B#���na;.���*��g�wH��8�~+l�/�������90���u���t32)E`K���S��z�nȟQ��TYt��7o�1���lf��h�N��%��M��l��`,Q��t�^���'nc�8��,��Rr�/�>?)`GVf�x����{(�I~����	�W��O,k�@�^��=F�GV�u��:�[%��Uⴊ�	p�a@,d��Ӥs�^��0�0��
����	����],�q�'��4�P�)w�j|���i	�AHo)�1�P��h�Õ�v�Ί��n�$OӖ�:�l��繻�5<pL���Nż�1՞�{����"��2�C���/O} �2i�!zU�Iz ����X��@',��Ρ�j@f���Q�o���]���H{�ӫ�)�n��-XM47�@n�,� {���`�r~'�bPT'T���'y�C:�[t���kjY���27��*���`�njzw��Y�%a�0���`a��ck�v�����P�[�K�2�p{�l�zEv����f��A��?�%���o	�p��Xo�l%��vKMs:�Nu��&t���u�6�ic���%� g�n.7��\nuW�=B��S�z P ��=���������/�����[�ݚ��	�ƀ�g>���o����_��      �   9   x���  �e#������K	,�%�,4��$oR�ԅ���Zʌz|��>]t	t      �      x������ � �      �   L   x�34�L��I-�O..�)�%���9e�Qz@N##C]]#3CK+cC+S3=SSSm#�4�=... T��      �     x�u��j�0е�Z�%zX������NB���`���N��ʦ�ì�{��r�
Tr)QI�G�G�$N��Q��
�.�����p�;��д� �@�P,=�Q �B> )�C$`�YEE�2��r��r�3@$K�T�2q�b�C�铆;��A�5�oǝi��q#4v��	��>?ׇ�rv��v�n���B��C��RQ���z]�W�R�W�Q����P��$�R�}�g�%���^�@�d �S\�>7�����et[�z����߆��M��X��'��)���_I      �      x������ � �      �      x�̽�nY�%8��
"Y���9葑t�r�3��H ���<���Έ��b^�;��QhԠg5K����^����]��(	��|�$J�۶�X��6����ԙ�B�I���1�d^��VB5N�I1�O���d<G	7��Q��`�f>Y��)L���8ɓu���iͥ����LK�'Z1i�K��N�Dh!rgD������g��<����*�'���%<�u����	��2�������"�����]�.���/V�W�����y���ˋ��v�>9,f���	g<9-�����e�Pי	�ɤ�5=�˸T"U3�Cr0G����(9�,�i:Y�G�IqtT@4���� �.��h�ΆGC|���߆��f�Cg�����p�·��t0G����,:��-�����r+�L�i�@�J�D&4W�fx:ϋ�p2N�?�>��{����b<O���8.f�qz��������f����U�i����[a+Ȼvi��_�7�U����������6��W�mt���j嬫e��g����arVL���h1�O��Qz�g��$M���_�3W�1'�����Hd��m�E+��&�Y��渳�$��tp6��)���i�X�5=�Lg�(\�K�P�$��>ʦ��ԁC�B�g��!s�S���*YI��&���p|��.��;�y�ot��o�`Z�O��dqT�!& �b:|�n%c���}Z�c��-W���t"xF㘱:�Lf�2͢�ӷ����~�v0���H��K����0��tpx2�����Ӄ)�������_��-�o�n�n���3����^'���$�����W��_�W7���D�<��Re��O�Y	��y�ˠˍ�ɨ8���(=;)��EBJ7�������R�;�|�x}o�N0M2V9�N'��9L��:(4�9�y���ZA���ÿ,���^B����\����ͥ�Ƀ�ɪ\��~e`�R(��J��zW�Aj��Mf>>�i:;>=H���R��9M��
�@�4<-N!������l6L��A1�D��ZG��i
���yb�f!3g��3K�h$��p�z2=m=9`����^T��)���[�(�iq�����ܑN%m*D��;�InXf�h��tF�/m2�!�')$}���tv2�B����='.F�_&G����p8L�F�|P,R����	.�Gy��"�L,��� �2�T?"l���W��4
���DwyRwV7u�9_��+��1kڕN�&��k��μ�M֔�UNW��Y2?&?M%�=:|C1�#4���Ƨ�t>��߄Cųy�_�䜋���V�L�-��;��v���֥L^��!�V,��1�'�b}����}��c۽�6�7u���pP�B)˄o��v���ُ�[��:1�Q�tO-�����0�}pz�Rr����Z��3KC�B���߿�-N3��3������{�k�؛�}d'�p���J�̤ufC��Rx�kYW�,���Ƿ�Yf�z:<l}g|��<BFN��i:\*t�a݇�4-��BPx�_�0e���\���s��^���b�_���������d.�W��_�� N}�+��22aYE�!3+���)��-<�|���$~��h��pz�L�Ż�"|��N��O��@�j�HT^��SΡY�S���@����� �Iɸ��V+<�9	td�G��ӳy(<�^m�K��p+KA�}�!{����V��]�c_�\����M�|�O6�&4鲲R��Z���%�׏ ��h��O�r�C����\��(��������8� ���r�$6�2:A�M�s݇Q��
 �����R��_=\�ţI̮0�V)�]x T-���M	=�7>`��?�ET6%[����gJ���_O;��f��T[�x41.	E���*��"��A>�& �(�fn~YV�6�������wr�W����eZ���fU�U������/�bu}.�պ��z���ڿ�R������{�+�vw�\�#�*2�ۋt�W����|�<�.Wu��^/ X�+V��9r^�hBV*�<T�N ��p��M>��bh�Yz@i��b�p�L3��N�^@��1�k�r *h��h�#�9�	�]�q�n^��Y!�IP�w��_������>��kzc�b��V��/��.������^��+���A
H��ee��S�u�+�}a���8�A��gJVw�S��U���
�2�e��z�l�C��U�{�6�/�Oj�S��5��(aR�p�VJ"�d��t�g���q�����s��>O�� ����K� b�2+W�J��I�'��9��N"yG��),|0N��߷�w4O�����s�I��Ӕ�ppJ�h�F	�>wp��#�kv��I���Z������'o�Jز�aT�*U�������隹&�K����0��r��J)�F����t\�?M������E;R@^y����@�4m�, �z9z��f��CU��	U���ɷWLA�ȜW!�m�D�8h���H`�']����6yU�#��\l4C!���@�x�@,jFN����&�G!��������_^t^W���V�}u~�oV�"�=�Ñ �&��T��Ih��G7y�k�@.���(~�v�  � ۔~��k�j����;iH�+�2�U�b���/���U/�	^�` �\z$b�J���ʜM��ُ�����h	�F��/YHF1A @@v�D): �>����?�~=8�/H8�}���c��C�o]��G3�=숤�i8ˌP:C�"��5�I0Y��\��l1�o�ܫݘ��^Ә��{�0k�De��$�TO������������~BX]��^,�~�#��{��d>5������>pU�UH�ac���N�y�[�8�Y����!���y�s�ET��]#��y"�S!#J�qMRL��a��!I�U����w˅���c�+�l�u�����}Evb�?�j�F��p�
�u����7�e	�����s�;"՟M��.[O|�|	��8�j-~��d1�,�EJ�4�f*��Iq��,��p�����D�|��=ih����}j�!���:ܞ�
�v����57��$��2�e��u�-J��V�c��Z'��9t$*��u�
����k涅m.�fd%�1ъ�ќ�0FIǸ�ɶh�5/N��3:�4��� -�}���*�)I�����U�#-�ƣW��]ٽ��R�	@f�x3LL�/��@U����}z���R��R��6|Q2d|�*ɝ�u�E���d�І.s�Wg;��]��hSO��u�,"�;_^R?I����e�*���m�C��� x�/KY��^�ேp���,=;{:b�lu������)��Q-�Dh��	��I����8��Ʉ�T�<<tU��FT��8^6��P��������Ю8 /B�k����mpd�e�LVۺ�+rϒ�2�G�b�����ȝ��m�"��"�L��)�;�5Z V�<(�q��~��i�jLma��NSڧ2�*����Z���@�ģNO&�����I��P�5��mR��7��gU��TƲ���c��teV��2��MH�7�dIy�0���
�ş�������n���^+�t�[�kaDVz���	�x�|�+���+�Pz�}2{7�t���6Ń
�ڪ���6�EiØ��Q�3d�Q�%��f�G��q�eFǶU��u����U�$��q
$�*�G:%3o|�U��e^�&G�7�cn���T��*g�
���b��ǐ�Y�;��g�dk��`����l���#����E�p����p�4m�`G;>�>Zj�������{6*Ji�U�(+ب)K I8�P{�f��u2XL��P���Y��~@0��M�=��<��c��>5N���|�s�\l�0	�E�|�K�>+X����������ދ��|V����!w7˫_��4�����y�E�~���]�+W7���\��G��4KO�}>G���-�uuY������ܨ��d���]e{X��|��G�Z, ���R    #��~�!�V���oV_�G���e�>��o=#�p\y�5J�fǳ��!$�{��]|��LfgԹ�=��������NF((���x�R0 %�B��ڊ(7��Vi���y�z������Y����X�:ӹ��it�y�Y��y%������f���d~��,�!������_��>���bqDݴQ1���y�0��v`�z6�_�ڗ�i���0�Xֹ�Avƀ�afde��4��UN�X}\I�m�`��v��V$f�q���*��-�ٲ�+sgJ�{�dx�8<�	z7��dD��Q3hH!%w16Ym�|��Q�H��&�W]��9��Y�t8�|2CNl�:v��Ճ�R�"�lU��y�Tݕ�VI�2��H{�)c�md��TC�`�</�J�~q���r����&� n��cN
H�D7��
s���?�n��N)���4G!n'��S��Vv�����i�����d��l��5C�w��Q�yt��V�HNr뛤��0DZ6
 O-U�Pd�9���a��>�fV��Rp����x��?,����	5Tӝ���� ���m�Dk���q���C>7 j�& �H�5�KC~qP7��u]W �]s�8��8}�l�i�J���VAZ}ٱ;�b��
X\=2��ϵc��p)�ʻR��ֻ|.��m-4Rjߔ"F�i������*fM���X���b<I����eU��O�:)~H������1_������E^GØ�� ��e�#��! �5X$�Hⷦ�N���m'~Է�������A�>��B�"��geX��*��7wW��j��5�&<kXQ���&SUS�ƫ ]��RiQ��o�Zda��m�+i�N��fQ"���%$t����VJ���l�|�xy�7���������ԕ�)����y樯ɽ��Ңʫ&9yw6���a���׀�+֫�5����4��	�?����@OIR1����vg�d�����m��.�P� }[�Ȼm|�@,1Q~�|κt���Ȯ�oY�M��7A��M.�����������b�;�%�w.�`�����6#ACt�b��Mْ��x0[�E���wû�n�rCN1�qN�P۶��x�)^�4���� ���~��Kv��W������/k`5n3*�!��2S�mBn�Ik�����>��`��<���(Ȥ�gz:@9�ϐ����$���v/[�|6�t��gU>
/�DS�%l�ge�E$�,����}�DŔ!yݵ
үf
�0Ғx4c�:%[D����/�e	���<϶[;��)�oN���jhT��W��窦��U)6]��W_�@X�㲪�Z�X�x�LB����
%@�|r�*�Pbv�@NW�e�ӷi�i�b+.#ӛ"��`�$ą_ք��!5�j�F��U�3�^]/=�߷8�trR�F��@!lʔ�̚
��{�&���k���S�����<+&��F7}�z�W�l�u�	7����2�ȩ�0.4n6hgqw�!dO��Ӷ3ۊL����n|��|����]ݬnz��(U��K�]F�;@)��q��l}����z4�1��d9�%�y1���0U6b��zG����
���Ǔ�m���iT��F�G1R.i,٢V�kMQƽl/�|�r�}���\�~=����W�B{UJ�eV�2㺆gϫL����إ`=E�A��x�G��Q��Bu�P�P[a9����n�UL�D��v %�.A�O9�J�w�t�6⢺'E�X&�������|2�)��� �r9�ԁE�K��p�2#��w���f�ߴ-��l�d�U��p�K���W��7zH�|$���+����:�*!J�UB�M��*!N'G�q�G� �'C��_%���zN�:<���v���Dn�`�l����<��o�4
�F�[�j'�PW4��`��5���*ȋ��ں�m���젭4��*F��=�!t`�i�'ԁs'#a��hN&N�=�h��E#��I�����[�KO�M��_���.׷����2������xo\rw[��d��U���
��aU�y�@�3(Y�e�eUaEȄ��Nؑ�Mi����E�8O��V�F�9i;p5e1%�Cx��fk� ���$
+4ۏ�E�>��ώ!�z�^��6�W�W�$�(ٵG+��_
��Dv��{�35��ntrtp:�&��?o��Y�v�IFF4B=U���ck�ds�j��"�t�E5�Ѥ�In��i�/'��%���箉ծ����(0����RM�1�nJ|�yh�x����_�9��Ҫ��"�F*��
˓�F�?�3Zq����k߷�Q5U��+[�vx� ޫ&S錰��m�?�1�~���� |u���kw�Y�m��hݡ|���;����۾����"\�[{�q@�7� �.,-hp�z�T������}&x���[��xl�W\ڮ}�B �+�5�Y�n�����Ԯ��Ry2ӎ����Zfy��S�Ff>�*N�Q�R&��O�N���:BԉV%����fjg���j`r	 *눴M�d�>��ᚑWPy�@�#�����,������`�Q��p���.C��5�t�K۔YȽɠ�,�*��LX�ue�O����Y�K��tsx��`�駁j��LI��ʶIk?�1m�	&���t1�^����Ȉ���3�~}�o�}s��|��9�@D\g�_&i`R�e�eW;]��Y��5ݩQq�Q���ruw�^�ӏ�.�pU��G`��e��������_�R��\����6��8��v�İ(/c��@RBm$4$�:
����t�j{{��Ѯ��-���4/4?d:PAZ{(UE�K0&��;*��]������rEbѺS��`l'�7�1����k�#\���{�6����4��9ԥBt�p��.�*�+ii`����^B��m1+9�#�z��E�nuP5R]�]'X<{���xyy�*�^��M���:�t��w����Ue�xa8�q@��e�.EVW��y(�4I1G�G~�`:H�{��^j[�����߀c�k�V(���h����rΒX�k�滯n|�F��y�]Ӄe�^]�W)�m�8��e��eȑ5�<�5�Ư���Ʋ2A��X��Ʀ�/s�	��N('��A^P��h#A$��m�ظт�1��9�e��\F�bͶ����_.;ʃ�o�yj�[�`�Ԏ�Y#h�_�!�>ϳ��:0���j�����繕	R����5N�~����U�M�x�<N�d��w�-�R��?j��3�u�me=�l�����z7	�U��k�]-2C�9R�^����� �	�(5+f�L���u��mZ-HP:VMw�@=��,�%Y��E���L�q�l�j�
F�R����w�[��e��`��C-�Ț�!��
��)�dS%��Y�f�~�Q1<�Є�h8���Žw�ib)��x>%�˂f��#� Vn7��9�"_Lc�������'�z�i1$}ڕ���V֫�����jW�����MM�A �B�_!W�A4�k(��`z<����+�lfS��L�6�qQs�����QT�����<���hD\`3*�X
	$��}�uGlݨ����h�%芁�|���Q��G���0�\i��ymk�o�QH��g�t4����@�L�y�2`��
���2�OѦ��cG-ɘ[M��786���ծ�&mo���i��z��pw-�hѭ���U����2��V���+n\ٸ��b:�°���2.
��������� ծ5.(���o�.ڙ��e����b�+����?�����Њ�\�ȯO��6�X�4����A��vX��J�L����C���C�im�\��\�>�䬖��%�[�8�A��Ү\:���9�%�O��_���?��	�˻���2��{����X�N����QBVs����hrP�kz��o"���&'�ءlT'��&�"f	kΉW"�&#�!I�h+ppz@��ng.h+���?�J�k���_U���؀*>�%~�pWa��Y��ı����z�M���~��)���N�EZ&ަ�6M���m�?    �{M�9����8���tYk_)�\�Xhh/ (������b�B<?��i2��'��2���k,�m�dҲM��hm7H��~<p@�{d޻b����i�(�����5�/�굤Q\�iV�@���h�b&�8k?�,�C�-��5��v<݉�S���W  ���	O-d��E#l�w�!-z��Qa�����# ��ꔉթ^Ћp^"���7�u8�Z��*����H"�  0R�ڊ	�RV��!G
M2�<�"<P�}�ζE�Ϩ{��=�qb''-�ӓ���i|���d&ydʘ�9z-t�^���M�ceD����6p&� ����\���v;�!��"���mqW�%J; �B<���n�),��KK�{�������&T�wԯ^�_��~���4����j�ϔ��XgtF�ˌdBDBR��LɕNf����پ���<E�s�k8oiD��ff�)4�l����ZJ"���ݩV�x�j�/���v���CY�n/?�w�ow�zg�����_��զ�٫�yy/EFˈP;@�?�He��hJg:E�$��H���ϵ�i�[�cݵM^�i�����!MWM������3�v��e�T^ޮ�������q-�Cx��bQVj��2WC���m�ӎ�xrZ|�!2���GC�29���,$�9hu��5q('Z�o��b�ڱ��vHjw�cS��j�)��#S���r<����f�DV;)����I�]9:�m�.�%Z�ʍzP�;(�����b d�h0v�2��a,��l�����:v���������T�I��ƞ͂������`{�$X�|M�R덈��yq;�+zM0"uW�fYm�.`�xH�	hhJk����HQ,��mڊj���HQ�^�|?���UGó���n��[�P4�D����� ���l���K�؇�+-?�����2��u/�X�pi�DJ7�*�>����nl^U�6�O�_���̡��	A���_�q��'�<�(�A�Tۀ�y����l����}��g��DL�f]=�ly!�M����':��_+�6�����U�� �a��=����e@�yEL!�� ���\0d4��-"�t���
4��歏>�/��\����z2���[^�%F��E]���%y�}ɀ�^/�8��n�Rs<�����E�L��+E4��nmB�'���5�P�����c��2�n�	_}�KjeR�ˮ>��~E���㢯j��w����{��2�� �Ǌ��d �D+�^6��� �(�,���m�G�`���;Q<;�bM�)���Y�[Q����_�?�T��O!�։ٸ �+��״}�=>���G�HYھ�� �������ײ�"e�@H��a,c��'��A/��t�,�f��(�h���'��;W.IP�?>l	�ӿ��,���f�_o(
n@��KO�ҿ�p%��̩��� �7���O�2���!�Gf��S!��H��u˃M��Ѽñ�;���^���f2	#�qC[�y.hiy47b�F���8��C�9��fD�xX�iX��U�M�TXdA�0���(����>b�g:�)�o �!�:E���3!�:�@��ܼ����Ղ�P����G��~�IF�g�>Oo	�]��5���BYc��[��SN�GE��u�8�j�MB�?�Rd�ś�L�R�G��Ħ#_�&��fBz�PD���l$��u�.rbeqvC{�Â�:l���� $�}G
�|<[ 8��HI�-u#M\ҠJ�O��|pb�TF+ն%�p�§R�`$���g�t�U:ڧ�},�%<�sA{�;�����
���vլ�7��4b�bA��W%GJˠMZ�U4L�Y(]�z����Y`��k��-��bzDt��L-�"�!�<e�z�3��<�.FԆm�)��b�ʐ�ڐ�]��~���t7>�ںx%Xe%M�V���2��2S�a\0i��k<�i;� Y�u=6�y8b�h�DM�7��ل�{,�3���zxN�y�C$���:x���_�e��2�]�L���Ҷ*�v�*ז�PC3m�׀�%2֦JƓ����g͙/2'�����nh��$u��%��ќ��Ĝ"���U${����P-{���Z�Ԕ�IZQAV�)�5>ؠM��������W{k�;��է� �A�}�5V�	�8���#g��1�&B4��zn�ߗ�*$��[	8����c�e�g�orV����� ��f�lqx���������O�b���&Y��4?o����K������04.^������6�0Qⶭu�??�}��=��W�p~{WUw7����t(��6���)�ǏJ��̔��: Wsyr0�χ���t?������"�ε<,D7,�둋6�q*(�Dn�Bu[�Mבm�Vuw�A��9��r���e..���{A�})���0�����$� l��i���Zy�+�_#$қ�<Ӫ��qg���rn#$���>F�s�E"�5�/����}n���]`I��c ��jia���6��`
��sԢ�#��,b�a0;+��c���"Ԩ򸡜�`��T��9Q���E34���ӎ8��޵����������ڷ��7����~تU{�bwy"���{�壻�,YA��e�,i�� �,o�P5�����B���O���vy�~�=o\&���6�b�J�#L�"k)i��Z-(�9�6��:��ݕp�x�����mwD�b�u	>�@7μ���8�֙��C�ʜ�<�KӔ�Wy�B{�D��NΛ7D��8M�OR�8f��ښbܘv}��}"w�0����,�H�C�j&�b�Y�h����S��Y/��RT�b��_��r⴯*��g�q-r6�4����8��lK�W��|E���yD�}z��՞�yծ�m�(v:��i��4�BZi��{t�s�s��&^T�_��ˏ��.a�J�4!�#�3Tײ�����������W�a�Z�L��B#I3&��h���$��vp��QM���Z$�иD:kQ��z I��曎�a+�[�O{�X��6����i�o�b�=Z$Q[i�����XD�uYeU���/M��dF�o�����A2Оx�n������M�YyH�+�����IC�@Q^o���Q��,I*1�v��S�	��,t{��Yk���;�o �(Y����<�U� �>ԢR ���`8݌��􃶔��;�這���n�	R��ʀ֜f�,7��D���t�a9m���0~���C�&4��e��EN[�f��8�Y	�mh�f�xx�ƢBp�O �a{�qxOoI���a����0MT�ě���m���i �v�(�=@ދ���#�8������Թk\�wi�6Rr������M�� �LΊ�|8^�&���j������/`u�*-~	Ww�v����Wz�t@ �������Ԁ(i2��v2�$�O��^ë�"���~E�_h�?
iׂH���v��m��t���b��)��mJ��o���N8���/�?�Q���O?/�Ww�������W!�����ݣ�ao��<Ϭ"��s"+#VI�-�m.*�L���Xd����	2��(Q���4�F�:"I�:G�����P�������]�Λ���S;��^�{]-�J(G3�d�q�0��E:��n$`�IQ�}Ҵ�tr���N�̨��&�d���trw���TR��[I)�������9I6�ҺK��س�M��褥�K��K��Z�o�J���7�Fhw�Y��n,��-�'8�����n��Nf`��0�4#㣥¿�K�Snҏ���A���:N���^n���'K*�k�
�c�RL�D��~pc��>�q�/^�fv�������o�>Z�Go��,lwc������� `��ކ��Ş�{�/BX���5|(�R�o� �Z"���g+���i�6{�'�y�ocĕ�}1��Ó��4�~�&�����޵jfێ���`D�'�8�d����g����R����&����KI+���tj��~^g�XH�*������D!>I���] �l��    �X��E�^�t4<A�8�sشY?OG�=��b'��vJ�@U�4�X��4�%�a4{�yJ ���[^n*���po�[�C?�m�׽���1"w�^��juA2\>N}�WC8Qe^g�Ѹat�!��B��W�45��	��.Nh4�� �7i��	�v�D�w@]!"�W�>�?�lOOО9-(o�?;��܂&`�=��L �������.%5bm>��ix,©&����7��CT2�e�� ��|>8�G?�:*{��[�a�]"4���'��	��W6;���ގڵ�F�d�Q��V��k��+����K٘�'��т�wXf%���&w�!�S����O��⧝7��8�x����<2�|���
ԭ��
ݍ-E
���$��D����5�+�E�?�HE���U�����������yXoʧ}��J�����a� -�iD�{����OG������x�S�B^���L��E�x��0Cg�)ʞt%��z�N%���.��(�i�߫�<�1��;�w�y��z�VZ�����`�GRjE��d�28(���N{�J2"0�$���{��^J;� L;#o�>8} ���ĂX��n��d���f4 2�h8�����	`m�~��4��	��m���?5	��j�10�Wt��h�Y����j��e�t�����z���b��LvB���x�����^�a� |���t����t����f5���t�|�C��M�+�ۆ�"�T �R!���1�eި2�\��ֱ�:�)�oU�h)��&��[�M��̹��Z�J~���yS)��f[z�@��g*�`�(�%�w�9���v�7�*U�@��(��&5�pǅs�d�'��U+e� D�)
��x�d��e����{����}{�;��V�Ў��#�Ϝn�,�Rƅ���������ܹ����#�uu3%�oK�����H���V�X�m$F��߭��ĸ�d4؄�S�8Q-3'4Ϫ��RE&�`z|v�v'�EK���p��\���R%	I�]�۫�q��Dg������mB�.�bf�K��p���,'z���=f��VW��j@�Yq:��;_��o�7�f:u�^6I�� .%�N>�D���vv��+Z�Q���On���M:�x�3A�+_��{ѹ5� �N�+.Db���aH��QA�š2d���ߏ�?N۰
��n�.�?���2�kW>s�z��T��)\�*L�v�3:S�w��yΌ���\��߿?�]�˛�7��;U� UM�EV3�Y]�ƺ|�Fjڕ��~������m�/���e��BD>�o@�8Lbˈ�{^���d�z���K�U6~���z�+	��U�O��U��p��:odHbft<�<�iy�e
��/!��5Q���w�vsJDB���)�$h=�%N�/V�n��GA �|-%�:s��������㜼;����Dh�u)#�f�#nL���hx������t�J�d�f�sh*�#4j�E�!�������]�^h,��ԕ�*U"�ڪ�JYS@h��#�LN�ۃ��|򭖖��ۆ�8=(� �keCw�D��V����Iz��O���S�v�tl��:�^E�r5<H�Պ�^�$�0���qU��U����#��-�z	"���I�Ĕ��B�4���.����&�� 7Gߞ[.�%P����I��Bde%��Ѡ�˃�P�y�t�u�p�g��L|��z�!E�'mT@C�����u�ӟ���d�ޖ�P!t\���)��Lfr_�f�y d&+Ϛ2�y��4&������G5^}:	�==�J�r;���r�X��D�F�d�;�	�����K���\�j�b2���F[e�U,k4�}���D�w�ɏ}hz�To�=1/��w�v��	��*�0HA��:�s��ȉ��9�p�d���կ}BGY^�C�@p\��ʜ�eɫF��%'�0��ѐ�-f)�En��Ԅ��0y<���=Ŷ����1m 
�G��[��1���//��z�izw{�m��&�q�%2[�1 F��X�!M0����ؤ�m�%R�鏣�φ��mS�x�۫#�*a�[b�`��'�闷��{���t���E��g�h�����,B�p���Z���t�����UN��s����M$�7e3�l�].Zwܙ����Y�CJz^��~[�N�Q��c"�WI�zncT��}�`*gCC�F"���̜���J���f�y��lq@���k��E�
mh�"A�k$,�~�C���T٭@�Ho�����&���Վ8�9�a�S�̲���;pLDZ�4�ַwe����[�.V��mF����N�4̇��1�*����g���Ih�7s���]�b�  �hi-��cYG �d�߷�l^�(
�)�S�fu�^^�Z@�k��mfdC
C��7��
Q��D��!>��{�	m�%C�iC2)���{�I�@щ`��X,E��7�I-��7��h�B�*+��6.���2�H��HPT�Œ������xB������e�c��`~,�|[���Ê����h����#�
$*#�n/����������U�~�/z]�)��
��Y�[�0&d�P�u�����_�aHn�-�Db�R�����aw���=2U��C������W��N8	@#	V�El*�Ӂ���_[�Yr5��n����������"Ύ�[SJ��_����ِ��cN퀾�ۘ�m���^��Ә���^9p%��A�1[���ɔ�!qVSGp4@�I+�LG�3<(�Z��V���Jy����=0�cm퉎�A���F�>G@:��3�ɱ �@	ED]뽽\]�_�m��*�T�q9QyKT��qmh`)�w��;�.�3Jf_dht�0o���8#�[M�A��!�hh4R�(��T���n���m�L���sfL��l��3ˉ�X��q[�,N��ZC��S��fyW�\��XG\t-�
P�H����܈6+"�ïF��V��x��e�����T)2m�:T"R;t����+���Eo�0�զ��7�C�;Q@ ���@��u3�EΣ+w�ãֱ+�WFX:iÈ�1WPX�V��a5�msP9��i�+=����w.ғ�]z:z��̨8IE�Xso(4�-EEC�+��PhjC�5Ͱ �@jGH��>�pt���8L["YH�g��OkE/hY_���yn��{�v1� 5��v�j�#f�23�����I�N�͆D���k��R��T��m!0y��9)�ЅQ�K�X�"�'#/-\��v�Z߬����6�]�.�����2�f�H��͸V�a��Mc������!M�� 8Σvw ���.qlA���P$~�9KI�e�3�H��_ɫ����]�C<�#-׿�T2�k|	�9�X�Ѹ��	~��A�]�*)"��o�)� �7�8"r��$:����qU.��,�s�r_~I���-WF��S[�˫G�����5J�kVy�2Q��.x4VY�ZU%����e�꺈��!�/"�%��%R�J�/��]	l��N��t[�kQ�)��E���/m(W�����f��H�Zc�V�	_�,���e���#g?����D��"�t����u;a=�	�DW~tm���5��j����j�i���Cf�Q�Ֆ�zs�C��o����D������x$�&�/ޖ�dT��A�ĪB�9#��[��V
�}�S����	�Ǜ2�k�[@�7�Z^�~�w����S;&���쳒SX#e-BNqz@��ň��l�N5���2$ac�V1!;+�_���������,C}���q�ƽҝe^� |��p�v�)CF�����F��c�j���}1ɇG��xbC���#��jXd��Y���K�O[M�����WWͣνK��,KKl9�Z�
!���}��l�a��'t�w��9��P H"��18�S:c�&�&o�t�-D�4~�0"��>��i�㽷뻺/�CJ��^e�"@+��|�]�nLE(�X8����A/���=��$�Ô1��Dg6]�Gx�lq0 }�=��u �l�
Ͳ�ě�S&���3�u����h1N��)L�������tq    ����W���&0�dTC��2�Z�k#m4 UqgC��ަ�:m#7T�u�EJ�F���w^?��ٯ��N)���Q�!�+:�%h�f�v�7G�_�ym����H�8�\Z�!��J��bO��X�g���M)��뚚��atYY������h�Ի8{�`\n�� 	���J*�A7�h����n�ON.�H�}��: yj,ݧ�0�Rd%�*�� ��"$��������0V��p�I�x�%>��<�|�{�)�zy������zy���=Xa��ufDg�J�*r%�ZK��'��	7_�\䶙}�b-r�n��W��@�{�~�V�2�2����3A�l���֥�}����>9��{�v�t�N���D��J��G�BB]B@tNz�G5�y�2��a^�Y�W,s�(�MĐM�9���z���{�ƴb�;��C�11�_*���n�pC2�V�V��8"M�t�:x�2�P�X"PDռɥO~�}�I��6n����,��f.�_�S�z���68ĳ9�Irt��l�������-5Zb%o�_������si�S*��mY�, �@�<�Re,���tT�%ŏ�Id�!*�r�+��h�������!ar۞�a1�T���T2�jn��H������l�npW�f�λ/����d������\Y��+b���J�;4]X��2$�ѐH���N����4��x��n�Hs�t� ��nh;�-�ܟ����o%�g�������Iğ�e���q/��@��"斮�\��YSV�>k �x<i�Bw�x{Q��pH|:���ŀ\��v���i߉��׾UN���B&]����v�:���Ai���\���� x��~a�KږL�.��܂�ÚM�c����*PE�2\�����n`�:u⭖��� ������D�R;X	�vWo��6�t�HX�M��OE;�ؕ�RZ�8<)"{�lpP���� LR3�#*�G����e�$�o���Vd{7�hڂ� f1���$.朊aK�����Zw�W��R��̤r4[ �h�h*|�ij�C�"NxlO�F�S��bJ��b�[M�L<T���e�ؚ�Rjb��$/j��'m9���_�ju��
�itY�g����RҥL�R��&��29N��|�*6�L��'���m.L��bG�q�g����ډd�D_
�!�\d�&r���I���ArSq?�7#��,���UV:���[��GzLiU˛��ŀ��l$^�l�|h4E���u��Jy�QW�&o���Y:."������4֊IE�Õ����Xfco��Q���h�������^���ʜnHdU��2v�3繌��($*9y��x�Go�����V��r�ru��w�o���?n�5m��3��}�?��ː"s ��rbչy�z���s��45]�c����Yj C�T*�yY��[t�Y���xӻ
��^�6���Ʌ���6����چ����)ur0Z��ᴘ�|)*"��-o�Tk.��p���ޔd�B�/Q�Tl��{��/�Bv[��u�+���s�x��5��I���3��uUI⟌����hg0������#�c��5�HmB���B���n\�g:	!għ�N��q��d�:=���;i狽	k��&I�:?�]�׫�����/�N�U��+SC$�[
e���Ў�sd[NN;J�3S�ë+:qC|ه��������^F
�+ؕ�?\]^����w7H�Ӛ�BC����lf3�0��t�A�� �qH�%�i{�x:�g�<�_�m��Ֆ��~��E���sX��{�ã���=8����R
�͡��2��qψ���'o��v-$Q�S�*�ǣA�M�
�6��7�d1�'_�O��v��\��E��p*�մ�s�͝uĢd����@t"�}�teK�kz{��}o�����*4��`!M&��;q!���ꆶ��T3��G>�ѓ�Ⱥ���4U���)� �F�H&y��Ie��ix��Y��2��'��:����l�i�'����r*�4\&n�^Ҩ+���%�R4��T^�F6�X&Ǚ\$�љ�n�� �N[N��3���i�\��8����5q�@7����L�^9Mu�O�\^v=0�^P�{�ɻ^��uP�i�Lԍʤ�q.�g"G.��*���ot ����?�L�~�}:[�p"��no�t �.,�<�$�3�C���ȥ��B$��v����Q���4�:�8ƿw ���q�p�Z#je���e��8x���?�V���6�������B�.��=�5؉Ra��:CU[R$��.�E,�b�H��^2���\��1��P�Y<�SMKB�JF��QP�&�=4�m=��0�AP���"k0Ʌ��Wg!R)�w9"�n/t�����1���.r�̬����h.�eT�Q�F.�iג�m�J��7q|PJ�ܴ��T!�c�ٵm�HAMg�[5E�H��G��\<-�no8]=�,��#����?��9sMUep>e-r�������E=OL[�9�<R��z ��p�\	͘)���2�-꾗�� ����60Q;:�E�j�&2X%`rU.l��Ԕf3|�aO`>bz|czq��5=�h�/�7A�4q�ŒS��Ǿr	�3?��no�o�=wL�Xu�?k�t�]g���VVa.�K�&��8W�����55CyF�B��[ōb��RR�Hҹ�6ݠ�_?~��)�𼯛�W����������q��JCY��%�3�2�7��M�U%���hr�����������.�!uP���H-N����J� �_���%��H��U:���ߑ�������Rg���R����#�3���]�"/F< �dp���%�1��{����=�L��A����/��Q��>�%�X�߽���Ҟ�T(�A�
�U���`uSY�����Fă9=�����Ћ�)���^�]-��:��lY/�:?�Kd��*-�7�!��N��:G>�+<�f;�N��������I�5`\`��9�ڗ��]}�Aܸ�m	_�|~�t�y���^�<yHb��̽M�ĕ�i� ��I���#;NF����͐�t�m9
��	Q��{� �n��"6���¯�kr4�
�`�.h~M��y�|̷Dpu�=��[�A9�:�77ݙ�'�����X�J^�����"�(e��������&g�a\�釡W-!jmDz#i]f�X�o�w�}v��I٭��K�o�o���j���N{Y��T@��D���y'����d�# ������ќ�x8l�s�y��Ѳ����ob$n�<I��9�@��r�ML�:4$:���w#$u�
�?m���8��F�ư�<�sY����_,��}�G���kS���j䎙��:�� �(:�g�R��z;<>!_LǏ�X�!༘l�:ڜ�E\�u$Q��n�#nO$~w���<2s��P2K�������"���':��<[ʕ�#�5�ES���U�q�����R��_{��"�ـA@�B֊�Z���1�MM����ak��=���u�0��eU]�^��	K�@=,H!xH��Ӟ^��A,RQ;���"�g�N�Ǘ�<uge�����^}R����.�L큅}�<P1�x�d�Ӹdz0�}O> i^�E{8#�NGm�+L��Nň*cGtz���goo�(��А���՚��%	q�u�WDlי̫�=�ۯ�&�[�OO�te�H�Ϩ���lӒ�#yIln;N�v��G��\�>q�lw=���b4����h�.�)k�d zz����}�zf�f7&�������Fl$i�[w�-����m}�wc����e�EdJ+�l2��fI�WD�����pVs��+���=��[?<���|��Au�B��$�|h�ɻ�P& �w��>u��%��� ��3eWZ^=>��״G������D�k�c3c�.�͑��n<��`�
�J��d�H���ZE!�G[�� �xF�=m뫛�#�>b*/��U�Cg�1cTt��Ӹ|Y�N�\��	}�_˶��LϏP\���=��ZyAp��
:�K��U�Q(V4&ӥA:^��������W�:� �  �:�7f4R��s��d����ދ1�+�2����(^d8��k�Mq�iF�5�R49-��,�s"x�*9�����s-Oȃ���x' �	Hȍ�6NU�g�F�|4��ѵ��>_���Պ�B/��J�}��j#\hi�<��1�˴�4�^Й�Q��Ch�O��v!{:��F-g
��a
gҨvh�i����=��LAk�.HtҕC(�⿣��HS/��&q�����t6*�\��?w�{dP)FdZ-/���:�o�&Ҿ	UbZ��tF�Q����G��b�x~�o�A7,{8��������3��#�o�������ו�
�VW ���tBf<0��LY�d^L�#	�bJu־�Ȼ"��z���W��4QMg�7k���^
%-f�E,A̶J*���Ck�
Zu�={QHTp!A�4�^gRU�;"�2��u#%� "�L��|�$_X�E�G��8�$�aL�zf;H��s��&���w�y�����#�/�ݣi�."����t���V-YfU�d���P%�'�����"_"!"ԋ	��U�� ��˚�n��,D��X���?��G�����΃�	��)�~��� (	'���x�h�V%�<I�}��?�U察B�{O��5w�)�ޫ5�����WU	>Lq���L�<����HƩ���b�z�S��w
�{�T���[?@D��I������-M�?ʐ!��c��8�q /��������jU�����zY���O�`��J�������޹��g�SkͭH���b���#��k��m�(I���� #l�8����[���/���n���n��e/b)_�X�$���A"��]�ג�I�
�O�����'1�b�wr6�槨�U(��7p�nc6��L���w���4B�9�,P�7+��nW�O�ů�p��>�ɶ^I����>3.(r��F{%`b�����j�6s������)A��'��A2ݍ,�5,���$T<�8޵p���$7O�nO�U_!�A����1�rb��PtBqV0S�����i&�9�M/��w'KY��Q�N(X	|<��,
#�����n��X��X����V���:C>��-qA#h� � �śbJ���ݿ1���q����<9:���}�������vNW�������N�C6��%2zM`�7�TY]"�0�W�i(�	>/��	�p��Z��ݨa(��|Ewl��唦�jx�T9v"�F-�����+����<`�	�U[M����>�=�eg�s��u�w���h��?=����n��-�g��g)E��(4�xhUo���gG��=ۍvZ��@�~ډH��Ew���LT�J;���oΤ+֘�$/�5�5d7,�����발$�ǣQ�S2�w� KV��Q���������(��	�����쬰���E��/#��yb 5\���������j�F˜�������(^�{g����Nr�q"u�;�B�&�8�5�ka��B}���]��<�7���뷐x�;�O�����;�.�M���bF����"|ȏ+�@JC1mB �D��@v>�Z���y�ת4W�##�J�*�g��P�0�dViD�[j�Ûo���2���8��XJ��y`�v�����Zu�e�\���-��Z1$}S�\(m
��׀Qp��O�W���|��*�:�Bi{�kcl��/���V���b~L�~p��yqQ7`�]�[ޏcz�[0���#���|�اć�����E�
t�QQ�Jq� �P�r�-��Q�ɴ��e�����?��v�`U�kv���o���#ez%~��8j�ӻ�B:�bF�$}C�@�Rl�{�����.8:m_��Z�]^mV��/��N��U�]����y3*	�*�!��t�}���8#�v4���e���O�痡[<�*���p�G-ZS���Ll�3F�0�Z�-�r�M���Ph����� �7����D��&�sl�M
�<ɤL�MJ�&��5ͦװ���'�������b�"�� ?N!@덈�0<o����E����E�Y�d�"��8d6���mكl'��eHzyK!N���7e��u�Iu	��:�C�햀����]?�p����$~�M�<dl�.�L���t�Sw(�
bz �{]���:s5�^��9hv˶�IZ���al����z��������x{"3���#c>C�erx�(�!�[�U;��
������-~�v����展K��EL���������>>��f� 9}A7      �   �   x��1�  �N�Q��fb\����'mDh�71��sx1}�]�i�^X���� ����[/�Avõ~?f�L�%����ٝ_+VjN�L	���u٨�3��Rߘ��I��{+���xeZE�)B�_0Q8�@��;�Aj>���_3      �   �  x�m�ˮ����ͧ�r����l�}��H��d댄l����cǀ�A~?�y�|��q���o�u����R���';/zJ�b��ۗ��]H��%eU)=�a�"�����m[�����LR�j���yϭ��w�N�<1�!.r��ޘe��~:�Tm��5��1~@������F��{k�Y��م+����"�+��D�Z��a�� i>�i��j�����Ƈ�x{8��my~3~���t/@�j��z���+E���M�b�ݙ���X%Y�3����rY��-�d�d��M?�N��UjtA�]�l��|�g1���c���Wn���!�lo���L�.�~Q��2?�I{3�!��t&c�N�n=�TbPz-�+
<�d'�yгK�j'a�lҠ�ǽ�zn�;Y��$�~#qy�,n�|o�l�9o.�/I�W|I�o_���Z��ҟ���������??���p��M�&J�a�:�g/�Gt��bݲ���!���j�%ힾ���o^�k��n�;=��T���������޾z����f����ޭN��Y�a���Rq���[���^���?v�Ӌ$��F�iF�:=QB�D�Kս�{�A��Vun�ӟ����SA\Vd����"�+���ᢩE��+3Z��9�:������2��O�p�_�.X�*3��5] /N��k��g�,�֝���A'��o�n� b��F�kՃ�Aʑ���W�����F�z��`<�u�rKA���^2�]�*�
.�=�h�Vޠ�ɷ"MR���c@����\8��e9b{!�B��k����H9o� ��}{����C�h��YU�]E�F�����UG腬V�V���d�^j��+e��(u��dQmk�g����1��!{6F�.Dp<���[E�O�7"@5���5�%j�{`M;{����Z��!��S/���/cM��LnZ�y�|*�fN��O��=
Ԟ�tդ�V'�������n��S����fwq���؅Z�ՠ��q�-Gs�eEa���2JD����W�l!'�?�1VVv��-�B�W��S����tn�ҜU�{���Δ`�Αk��x��u��2����=�v-��C̔�%O�ݣ���I�Fi>�A�O�V��^�E)` \]���]��!G������fVd���N���ŤĜ^=
G��� `�jIjp#��xX��6,oR��&N'=Z��z'2�};5�� x��������}˴�/�U"[uS"�������V6�ai��\M�nD�X�(�n�!�྽���m�(7F �ʅ^���#���tm�Y��ᘱ�`��"^a��ʃ&|�o���j�4�vM>��޿�����w���?<}���ǧ��<��uf��4!ɳtM�.�Y���K:�6�L#��A!�5��;����󋓖����Yx/�{�8��z�� j��Y�x�/�	"c���h��a�O�c�
�q�k�-���H�}ga�m�؜�B`|�̅FP��77���h>���rs�N���C��B߬�CS&�����P7[�F��Ś�����vh$pG)��tq#̽�g�:س�P�fA��������.���*��ʝ+S��-�,.�t09�;���	d�E�QiW�XJ��n��Z04���U��U|��3���m
�O2�#ah��6�A� W�F,|�7;\��k��)�E�j�`o�f��1H�8�V)Y��K�4\$#c���F�,xmc��,A��`	����eX�]�D��,c>z��\V��ŝ(��=��?���#�� bq{-�}o�i#�%�?ɠ����qc����/��^�@ݠ2\�HF���j�_���X�5н��N�x�en ��88s!�(��#,m#���`���r��������q���&��/I����A      �   ?  x�uW������@h'v9���Di�/z� #�$� �Y)�?p�n�#m����؉���P��um0���n6�O��q�)ى�9�oٸ��w�e��^Sg�u���KR'�Sm��J�y�ѵ��R��'��BW�)[�4��*��}/�Rh���4{�sv|�͕S'��f/��v��N�}�i^Yߪ�8l�>{D�^+�eC���
���3�b5oxG]'"�jCl*�U��Y6��Ts���J@Y��z��pP�����!k�/E{���GN]?&n_�����Ԙ4�xs	ﰜM����4J��7;�"K��u_~��C=!����+y������Ģ3t���0�WiS��(�����q��7����U������)���W���&}k��	u7&�J^������F�y2R����5G�1Y�ү_D��&${�m�8]���pb�W򒕂M0��(L�� -^,F���M.=o����J�R�V>���ol���g����v��r��:* �(����S�܎���w?��Х�J����|��U��PDN��	�>˭�g�  P�BM�FP�{�\v�7xȷS�Հ������r��N
X��4&c-;mbh���q�qw��dԶRðH��$�⑉����$HȄWGӓl��9x�݄$�k;4�l����J�-�w�O3����D	�,!�ܢ=;�ﮀs�e)y�[������#'~�	M�|Ӌ�B�k��������G� ��]�FX��6a}k�i�rh�mƎ���'S.�`�z�N�	��ͭ_}tt�d֔(έ��������X#�X{GQ�Yl�o�B��'��4�����45ϖ�Xd��I���? ����܂�v��9dJ�����%YC�4��"�3�YBD�US������+PjUM�i
��[5�*z����V�:ɒ�Jwdע���K��?.=�o&�����a�����5�MN~���M'������+v�'o���p)ɴd!o��Ԇ�GB�����=�Bض�;(V�N�pm�.��E������,�BȪR�-bz����=o/̠A_h�E�VC��$�s�	v�`�DqW���R��Ͻ����0�݉w�I����G�%U=�r�� �(ZYUd��W(Bs�0��0)w�V1�ķO��V���ɀ3�j�D�u�/�����=05#u5�jk�Ợ1�c�l?�<�ԋ卟@ �x6�h�5����Х�B>�ބ%����$�>p�vN���x1�j#��ۋ�QJ����qIƩ��my�U�&�$B�6Q-fb�P;���w�94����&�tz�	����9ē���������Nu��}h��]����������O(�61^d:�I���B���8�6�l�pIڷ&l���S�|pb��zps�a%�̄S��`���;lU���瓬/?�T60~�Է��k>���:���ʰ�tX�*a���	��L
�9�����7����'eh��F�>px�%7F�y��R���+����vMK����N��1&�#DU����av�>i��ǋ~��l�(߰�J"WX#%ͧ.�\7���/��gy�{k2�('y��f5��1�f��=����s��y'�Ϗx	�y���&Õi�<��o���'GS��=�r�}��۳��	K���#��3%��.�����W���y�f�=>�~p]�g�н1K ~&��1�-/y��v'�b���S'-��0	`Y ��C��Y`"-D#���ql�}[�
�m���������_��CЋbA��г3>�2�Q�ZZ-Е�y5q�a��A��
���
���Oױ[���3�Zd�\�Ù�<s4��Y����Șze�nTu�V��e����h���ێ�@
ۭxv��";����g�R��������O�6;s�J<P,K��_��
�~��iu��hv��P0F�`��8�;�*�D��$V��dɊQ:��<�.�1�Q}p�aT���Ӫ��g������jvg�^k��.t=N�Z��{cH�v���XA�%�DK��-��!�Y�d#�-߾}H؟C)����      �      x���Mn� ��p
NP����M�HFF�U�(��#ap[�m����uH7��E7��㽙7Sm���qX�dN�7L�2�stH(~ôfR�!��o��#�[f$3�Z��B��=�;��~��|��C�/豢=��~y��^|�"r��7�C����u�#3�4�sc�����teelD�����\����c��bW"U!�T����+E�D���ј�B�VSN�A��>�#��D���6t�GH���s����      �   �  x�MV�r�6���Px��Cp	�В��n���89G��_p9�G���C�26��<zz��%�/�,�z�e[O����X)��e�F�M=�{�I9�m�z�E�Ҍ��6�9�JT�d��`W@^O���σtC�{��a��	�Gݤ��,h	��ğn
�wrIF���a�o�q�� ��_��]!� g��=mIЩ���]Ǳb�E���U��F��*q���O5/�K?�B�FK���f�l���Z� �	��"T���.�v�Sv-��!���{8�08���uC�`T<\È�LґA�<��6r �[B�nu��,���S|�liA9�KǂI~����n�商����^ciN��nGG@J���W����@v����W	%*�Y#�����}�}�����ٺ��b���J�a�ݼL&
Q3}�ڥh#���&��Ñ�f�<,X_��dF��v�&^١�=����~��k^���M�ɿ�-�Z�5*O�����=x9W1�]�d�BT@ަB )oɿg���5�g/�G~t@f���,����\�I69��d�P�NʺL���Z�lVP 
�b�S�;5�!�W�C�:�8}^�٠��n�K�.�ٌ�΁��l��.�������UmR7��5(��=�N^��#dR�J�������-����&ޗ=�>�RW��U��2�HW _c�{��
��8��"�2oI:��(s�{v�n����v��S�zv��foɧ�M� u��EZ��Hm��_�����ķ�j_�(��(:��TP	8z��2�W��[Z��#��-ᇂ������*�j�Y�
,@��3����g�����{L�)DI8���U	 g��7����*�F�0�t�8��������0RC12q8�s��(o�7}5ɍXޣ��n����&5��P;,<��b傁�iH�K���u���5������{�t���q���W-)�MM������2���cv͌k�S&8�a�cP"�`WTIfg�~Iv�ð N��Bx���	~�c����_�~�?���ϟ����O}T��]��dɮ�f��C�;vE3����Z�a�ш+�]���)�3��5�|��I�>t����?����o��'�i	�'�E{��Z:)o�Ee��l:Mi���MZ�sQ)�x��(�Slk���sDe��dcl�(�Fd������bZ��}�ʜ�PT�r?�R��X�A����&G�m�L��3l[�MR�J��S?l�;�1p�����boƟ�8F���{90]mp :�)�uO(�nM���$f-P���lC3���B��Ǽ���E���;�#ճ(��s�M��:�u�2���Sf�<u�L�{�Ƥ{dǼMsJ�z�~��#�	�����I�֣�{Lh��['@v4��\��/Qa��R�Co�,��i@��4h��v�RvA�9�b����c��+�=E��Gn�}{zz����1      �   �   x���;� ��V��E��x5d���L@��C��t���'���8��쎪�U+�	C�5��P}�[�ؒ�3��oP�|�&��Z�s�:~jvmbJ˖�xL�UJ����$��}\�>�O�/J�9i29      �      x��{Mw�ȱ���{�9O~�K��DH�&)�UǛ���+��GQ�\��n����V��,�L����� Ud�����}Z]�Vyq��Ȁ��krޤ�"�&�R�k�*�wJ�y��M��b�.g���d��_ڐ�D&\�FF��%�i�r�J�$"�l��m8ll������d������g����%$��']�p������d:oMj�,K�����-O��Xۅ�j��jU]΋u�*G�j]�svUs6�w��D�3����!,7)�<���m���?k{���� ���39g=������a�y>E�p���N�8_�6��N����YyQ�-�d1��r�V��d��1���r§8��M|:&��@���e��߷�&r�Cc���e�O��V%�K�.��O�&�i�r�ם���u�Ŀ�j�m�v8����rkr� !Rn�����?��8����	{��z�Ц����m�:�ש��O5B�:״i��Q<���urS^դ\%th�U1����Pl�>W�f�L%�~� ����7���?#��G��4+���$l��NA�Rw�i��s:1�#���8�(u�hq7����/��pƷ������K*E�ܽ�~�Dd}hn��	��!��p: N��f�*͜i@��&�ӼUVx��Vɤ���bq7-�Ur=-fդ��
a))	C��6Y���޽�?$�*�-�8l����O����䏞&q�u�����JW��tY�;�H��8��,�X�kv�@Ł"*!��҄
	���%���ф�/����ݼ�!�u�Ѭ���3��T����rr�zL�l�e3��ô�W�dR����}|/�0($g��*{F%������������5Gn��}���{T�Y�h��ɴ( �3$.J"Uyû�s��<YR�Ĭ}�V��˃B(�|��9"���1?}<��Ix���Á	Ä�v@t�_���Y�8W7��XX� �"-�t��������b�<,�V��#�q��6�R�R���1V�0}X�|�/�M��� -"��ѹ���9���r����A2�[��2J�M����V�F7�m��e�Bʔ����-�ݸ���ۥ\�B%�/>�2���X�c�f����G���gtltdJq{��m���3�����6u*�no�j�:�!�v�,4I��(�|ܵ���7���3"]*dsl��x�ƿ�ψ\}ؽ����_�q�4�e+3!S65�� ����b	�N�&a��|�\�)�Qk���m����1Joۃ�sEa�9e;��S���˦c��c��Ġ���6=F����㗟�/`���������d<��g�ƣ�Q$��`�p�I�m�T)S�B����i��ɒ���<Y���uS�>g��^P����\f��F��j�P�����K�I|һ˻j6+�&2�HΊ�e�f~�+)ti��j��p�t�l�ς̸kdR�@��̗�p��q�u�)���&\2�o~�̧��Ds鐂�3p����O`T'�=)���Z∴���ːz��T�e
� u$Ӣ&�bR��*M&MD[P����FjV�g7z�����״�].��]@R�`�g�������V��*m| �7Y��{�5�[�J��U1�&C�9��d*s�"�fQ�X8��@<�`ցZ�:��r�9R+��<j�h8�6��Q�kPLM���}��5V��J�P%M� ���z�M��!��W�摺�z@��2|
C�^6�g�X{HK��
�C��F�(%��ֹ6��l�X��e�ê�tT.qb8��?35�$�y�/.�I�l
,l�(<~؀U�k�C@u>����;��w̢!����>m�˴����T�ֺ����Ҝ��f�Cz�n����m<��P㱑}�[
����o���ld�m�B���*� �J�S8�k�̭��&8��բM���?�gmg �3oR�7H�p��nqx��Eb�<�n3�ɞ�!�����p.��a�?����s:�}�MF� dj$��+��\gy���(8���	�j��ZZ����-�0'�L_��Pܓ������ж�Q8|�/��9�_;��Z�(��l�~��_K$"M_�����@XB����t�z���R�%Ȥ5o��FJ���"=R����)�(<������'d�oY��j]����lV�@��	R���M�֮m� 9�ΠI�	~��\BE�y���k���B���B+>(��,�-�k����H�^�s6/��K���
ry_>,��ϴ��>A��B�$T��a�\݉TߦA�7�y��}�y�}���8�6�Ǩ���#"�+�>��=�U�:[�"5�g�~M4��愦��n�LӉ�	�̅�Y�Gm�����[�ZV�M99Ƨ�$��|9� Q��wG�G:�~�rhmau������1qh!5oBj<7�Ģ�2�zE�H�z|�f �2EB{��$����ߏ�5Q빆�N�FS�Zfi�«�R���Ndp�8�e�&wkJ�2��V����䶸��;���U�?N�D����"O圵}AMp#��w���˟��]��T(��?� R�<�8�n�<���p(�7�I�w}�ZP!���Qt�I!��g�ș��x�I�8�� �����2村�Rv)�V#_�:�mW&kKJ�nU���sT��rqSQ���g�AiA=fV<�,��k����%��C��N�{�g�G��=��@(r�5��7�Ȍt]�#=�拤��<�����VG0���=Ѡ�"e�2�� �.a�P��~93�x�u:�;KY-�\�2L�ki``�o\���ɴZ�Gٌ?��>�za���<KN8B�r�O�[G�i�n=�e���L�&7��{�ຩ�O�cΥ�(}:�,}����}�_�!���bù�?ܱ�<��<�zk�i4z,��eΛ&��ȃ�\RL�@�����(/�.���C��U��;j��]���Z7�m����cP�qlu:��m��.���2HD	�����k�'<N�mZ.G��t��_����À%
�1NrD},\ibV��넭�]3����,��#��3:�:4�R�CBjtf2����G�49�z��b�̻�r̥��0��9����}c���e9Gm(9D=L�xCҀ�J�\�,�볊"8�WN�r�\����j�u�PU0�	[���HrC�5�'<��D��-!q������p���?��\�	��4��A��*BԹnD
V�J�h�B�j���sh��brU �vl>nR*�#.j�4����{����,f�H��}��s���u�(^dT�p�'�	WgҺ�|)[.Hɐi��֯�M�����.�ґ�(��T�dtvC,�s{a�]��g߽@٠*�٫�
�����\4�g�tf���:�.+}G�}V�eB��Dje�R�҂$)�d"ī�X��7#�o�2Z�/�R�<L{���C�\���0����kBrA,��@�"��觽�AzѴW��A�:N{�?ǽ���T��2C�v�)Cފ&�==A��ϑв%k�Q�R�;��A;��� n��?�	��=GE�ECe`~�kgH�m	���C�5�WUR�-��O��b$
	=GD?���f�?p ���l�;�K�2Fmw��G34�c5)d����Jv�Wo!��Lj=�x�j�p�Y���	�[r��Hz���.μij=�My=�X�ªV��uU=�'�l>�cכ��ӗ?���,�!�
d�{�����@d��_1�Z�
󎌝	ti �����7�9�|q7/��ռ� 3%e?��D�ܜa�+��Ĭ<|@�~8v���߻7�k���h9CS�/2L۪�>X�լ�}m��n��sx:"SC���Gx>4�E��G���f�r��lC����w�6u�
u�i7�t�>�rF�2�~��j�4�%��~&m��:X���a��>���P�%F�Y*��j�)�INJ�I��	R/;8�\�4�Z�c灴�.&�=qMþ�UY��?�
����q�BSD�)��+��/���9cN|�B���
���1    ���4�%���!�lk�j���Tߍ��p.���~1r0�F�*Eϛ�=����7�����4&~���Hpt���}ے���蓢�3��� �0_'�'9B�+K�ar�p�$`�l��+.�kki�b�bAM��bm:�^�� �(��Z�Yxσ�-0��(.�A�Fef8�c�h9&�G�Жf@�;�v�Ax�?��C?��m�(�Lf��R���s�Y��(�L	�Kn�Z�-O�^������S��ӷo_~�̛��Sus�^H�Ƥ~3H"�hJ��G5R����$!ǻ�feko]2��{@^C�����Tk6*h��L���5vN)���z�8�������@"�\�Y���%�Pː�R�u'�]��8ς���7ګ���v]EwUMI>N�H��27FJ1'q�)\�Rt�Ė�9�a��h�Oa��1��\�[qlkgCG��у�SѦ&�z�K-����a6D,w�����TtYz�����hW[O��������??m���o�z�2�w��-ğ�N�N"���;�B��<Of%�
Z�<�ϢcI3�Jlt>'����#�|�q���z�?n�6oB2MC~|��3��TM�e�>2�L����8���6���ɫ�	~�w/���(��:e�<W5<��-��ֆ|��m'��LE2/P���쯿j�@�:n��IO�4W�l�M�U�����e9%�ڲ�-�>l�D���2�Q��d
��Һ��犃нTy�s+f0�0zŒ����)�!�]��{�,�txv�FDa3_Q蘌��?���Z�F5�s������'WuஆT��x)��!��_Y�J
�+7h �
�����U���,N�zx��I����	�&jӗ`1��-�.�����@��($q�ٛhF���/�S����0��u�3.���L e5h���o�K!��E�!���yF�]N�����]��X�D8�~"�3�6E�=2��B��m��S��T��Gwҧ��۴u״64��dF���N�]]s��������Lˍo!!Y�m�#2�-����]~�{�n��C���Nk��&�\�Rڲvp)��9o�L����췱5��e9���_��,z�����-���hs}ٷ��_�}K3�}��~���
��Mw/��A�%rq��'�n��_Q6|Z��Z�����ˡ`[�Z+a�FU��k=���}+�Vr���%xag�
m�������b������������m��锂�T����-��J�*H}D��l2���d�^p�,�P��3z�}R��3�.�����Aش��p��m`F��KMG�k��i��.�Zn�C��}�C�.+6�S���@QL�B�`���$��{i��h\%~�o�-D>������oJ6�C�`y��н,���].ѩT�i��DԾ<�0��,ּ6-��!�s�K����\N���>q��,j�!�[Љ�C;u	2�Z� �}q�e��l�>[�Y���J�"3�h��x�_��E卋���	G�b�1�ԩ!e݋o�r2�U?�2� 5��o���R7�]N�H����C�d�J��kz�)A�?����_��?Eׁ��NAt��4yqM)il]Cg�{�(WU���NF ��(���6�nu���T(��"���+O��n0�Ӓq�Q��A�
���~սg)����4�Д:7�"���E�(�`��E�V�K�+��5�EKP~D����o���Y��NԈf�RǕM����5�3�
w��)?@�Щ���qk49N�.���hzr�L�09�^��gt-� +�V�d�z]|W�bZD@	K�fJ���K���/�+���������x�1}��^��S'��p%~췛7)�vF�S�zZ��4ȥ�C���v������b����ǜ[�ݱ��_}�y����1�"E�{�v��g��f�M]7�%SAC16��z��-����h8]����j�׏tyB��3�ICS�i��t�����Τ:Nx-31�d����DӘ��D�u֋��.ki����X�S��6뚐)�����V�ǀ��W�/A���W������II��i�B�s���<m3r�M��y��6���h�`��CW��}����_���~�鼉	կYxv�f�*�i/���a���_���Co����i�io��A���;�pkUG�����#hdH��zGD��O�aňD
�亘��d�ݳ��#$�(��> ���U�Go1�3�w˳�� � q�h2]��@p�a��zq7-���Z��d<qR��t�����3vA���Ā�j�+�ʎ.Y�
�!�__g���	H*�нnшd"�rq�n��(�=�l��l>��a��#���.�K������hCڄ'���~>D��N�شy�*�`%�/a8�kI�w��̸�Q�W���b����qҦ��si�����d$�����Kf�.Pn�D�I���F���dO@�\��IQ��)���$(�H�����F�CQD�� �~���{2^��eJ���Ͳ@�-'l�psӷs\�:8��)�5���kԬ��]�!DlT�[��E�'\Y��x�w3�syȐO���wRЄ�#�
:��~��a��86*/<����'��v��,v�V&o 5�A����(u�d_ɬ��]�n�D�SV��,��Hx�_�(�O�����1�Ýٚ�8�S[#:����Qm�h�p�i�~��&'6Y'�U�i���r�q+2���8���f�c��o���'�s�9,FC�R-Ȱශes��%7첚������M�Ž�>sX�<.�ҊC�Ϭ��o��6_�9.#�"�-o�n�M���@���|��pR�k'����Fg�}��������p�L�?<×�����i�=������C�?=EU�\G�[˥Fv�:u^{pf+i�q�����Jy"�\C����\�L+�������w0Sv����W|��PCi�/�:�9oR��`a$�'�/���$}���77�rTғR�.Nq�*o�Co����Y��8��~��S��l�1����������0G�?<�]ܴT���M��!~���3޵P��7��ѣ
�tZ.#��LY��o{�@VX'���{���l��	I�ux������/�$˳�甏�������Y��C�AE��L�٨��jN���Of��x=2�mqt����(��}��Rw5���x��,�A�;k�J�~ޓ}��ݹHw.�j�`����s���D6X�z̍�`���\��I�V��H�wrb~7l�_*�e��������BJvyW�E�0R!���/f�
ŸX0p�y���b��-z޿9^�(#�5Q��wy�w4(i`b--�xa�� �M�ܖ˲�_,f����d�`7��+`�+a��|��]�m$���S�,�7G���Y�&�S�n���JO;)�� >D�5�m��|�7M��HK�bDDk���x�De��>&��ǎ�7��Ǒ��������>˨�5��4kh��$�2mt �D
'h�ң8�>*�j� 
y����1�{���0��b�U���#�������������6۶���A���Y�^�"��@��^�b�WՈ���6�����)ŝVr��j]�b/��_"g�K6l8�
˹��%�Yud�o_�T[�4l(m Jަ�5$ιid��lrU8�ֹ����x3��3� �ӆz�����(x���o�!���&����Z>m$N�ռ�t:��M��C�^�	���bv��F�m�2g�ef(lq፮���Q��a����p��*���9��t`��Z�W��<�Z����D|���xg���tU���"����9��P75������ ݨЃ:V vm�j�mm�u���4�j5\U�'�8<'$��;�,ƛjz��o�㉆��)AZ^�����o���J8%�����D�$�bGkE�QI	����t��gbx0��G��-X���O�d���Aj�=����`�&��>��������{�z3�.d!#�殦m�J���p'��δ�'�l��f�t_)�S+5��U6�'h   �k6�$��Oh�1�S�$�jp��?�C�����$�b�|N8޴��q�	XhhˉS�P7������:�um��k�Wǔ�M8��(6�ù.ń���i�XOG�:ֱF�%h�x��p��Mʻ�Avg$�h��1$ÂP(����q}�[������X��v�d�vIA�����o�j��n�z gvC��m��L�z�"��A�I!�&&.޿���Ǹ�����dã��b�XF�rpr��nӚ��i/����͒s��+�yF
q��� ��J��v(�ɒ�-R�{W��ޗ�~�m�u��_ࣔ���v��Ͷ�s�|����#q��1oh��::��႞|p/K�e���e��x�E�Ɇ��i~��Q��=��o,6@�U�lJ˽ۿ5��5Yq䍱4��w����B�q��E㺩fE$�U�7��aDT�$�]|82xq
QAɅ��n1Y��-��rY�zi�����qF����h�Ƀ������`j���1��ft��b���wHO��\\3�c�G�����_���^��         w   x�˱�0 �ڞ��H�#[%E��F��*C�������@f��:#��lKsb��Y�L�����Α�N��{�~�mݟ�u߮�S7wlP�!�{`2��J�j�,���%���"      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x���I�춒E��^P���&h���:�)�+�o���2� ���1�M;���)���s��n�'x�k���?O=������W�G�nd�]�%�Zv��G��#��j����5�����V[��a�!��}p9����Kg�Z�M�>i���:n�y]�뺶�u��B]{�ݞj.�Fg�����r��k+��]�{ҵb�wJ~�d�nl�.�d'ｮ�o�QR��ϴz��}v��v>ۡ_��x����Y�
Eg�u����7���k#��w+�Cv���l�y�J������ܝ�H�&d�+.}Ǜb(m>e���Y���y-c���{�ޣ'l;�;�e9xW��.�T��6Y1���&��<����k�h�g��(o�-�=�1�����2�˷y��3Y6_Bh��w���Mf���c%۹5>�n��T���څ��ٶ0]c��},k�ħx-�|�)�pO���`q����,�������Sy���O�b�'Vz��J���f���^(�qrLw���}ɝ� ��#P��p�
��E�걾�ʘ�����b�=��vXq�D߿�����/�s\?��ym��֡�k�v�����bN��J�ϑ���%�6��xBt��\(��B�2�J_r.�0�=��z}�x�D�i���׮��1��J��*����)�!�q�"����P>���9�A�23[L8���0�_B�
��}q�T���3�%Z�"�w�Y��:9�L	��WߎK�Ǔ�.s�Կ|�bf����S}8𤻛k��V�;�Q*:�gxe��	��}:s�w�o�uO	�r`TUk��{�%;���d�P��l	�2�� �׶R�=ϧœ�%j���Zqm��,-�l����.H�o;�ei�y(�	��
"lp=��$ز���cVJ����OT�������P�-�HoVP(�4���t��/�C�9��A˰d����2 �`@{o	��]w�uQf$���'�����ߗ�7KM�B�� ��Y�+{�{Ř@��D�ݙ���U� �Gy�X���*��(ڀҢ����ekFͬ�{���J!�"�<��7�r�"�u���U��@?@`�ͬ�H?���A5�$`Ag�a+O�|ډY��-e� ���Np���, .$�����4�@�<�q]+��p�#-�ҿ�Lc�.��TI�a�4I\m=���Է q�|R+-wn@�>�cj�D�)�5�B���^���=	��9`���
Zđ�ܽ^7���&�A�@��A��z�><�_0ɡ��BsГ(��  ���\�X&iU�ϛ�ĥ�r�v��`�歧Gވޢ��(ω�����Ͻ=\КD*G���,�6�eC��k�1��hy$Å�M���5�~_�mܔ�p^�>Ю{�d]p�/ﻡ�A��yH"��.�I��>��91W$�<)o��C���i��%<+x����2�re^�̃��PY���}����v&��6���G>u`���9����������ּ+�� d�cHX�xX-ҕ�XRV�OK�k%�g��������:�8�r�6�ǽk���5�3��^�Eֆˏ6�&'��ݢ
:��)�k�EH;�a��3��Er>�m�#���JA{�:�֌�w�Ն���r�d,�������\]�m7�8�*���\��<��9����s/���%��Ǝ��<$!����D%�D�����D��O3¹<��+N�S����v�0�0/��a�`��c��al���,�1!p�s��b9`l���
A��J8��Q3�p����@���*�,' �Z�#���T�C���p�����W`�� zae�R�� �O:�v0	E�,?q�fy}eZD\�z_`L�zB�cP�����P��*�X�4���Id��Խ�yV	�BFd}P7��!�*���(Zx삠/Wzy\|����qKO���F���D/�А�ԃm�e��-�iѩ�ơ�ś1�/}�1z��I�o�Rs(Ɖ~B����$ρZ���э^ +���Ja�����(j�wP�I�@��&?����d���ǠS� �!�NHD��MT/`���] ��%p�_�x�0��޺�R+��$�P�L�4�ŶP�1�8s���@?`�56�f��=���9���Chi<*�j������R@���,$�����`J�ӨX�5.
���M�:�` 0
��H��L(7oZ�@��%�q�u��`���ه,fX�^K���*��ܦ&�mE��kI�d:C������;P�/Ź<*�]-K�Wy����G�����c�
Do�����GT{�#EfC�1�O�r.J��ߤ��@��k�?}� eD�ĉ�?bs�%�
���@���O~f{�I� �D�i��ցuDF�0���6Y��*��H}�ك;K��]�� #�o��v#�Om�
U`g�)��em '|�-]&�bj��4���Q@b�}������tAsN�=T����6�>(F�9~S?L��='W$E��1x?w�}ɾ���Ӕ�H>���0F�u��o��_�_�F(6Re���a#vd�c��
_�����+� )g{6�L� �4��K;ǋ4	���7^܊��䦍 e����I�V<�BٺHs��Ёq�Qo���j:�p5%��w�j���?w(kИ�*튄��4U���42��&���$��CM�|� �m�V���t}g��4���syR~�Ջ�,2D��cF�Ϙ9E���7�/"+L#�"1�:Fe�W���?�	W��w48J���a�~^1!f�M}�V����8KT-�Ʋd[�o:���;)7��84AO�ȥ�~�Us7l��j��;�����G$�t ���1�x&�0�:��fK���c/	�%<�Y�p�"�1�Bx�5�ٖ�a=���Q�s�o�5Jͦ�������E%l��VEC�.n,�Z�M�a͟Md��><)���BB_��"��f��͈Ј&���琨1L��k ��w8y"bSiUD"=�ٚ�H[(]�����ǟ*~�r��8I���o��D2�W��05On
�D �y�-��Jy�8u��)�h���aD<*?� "eD�M{��e�t�P��H6�;KS�(ב[�++b�?Y�C�C�X��j���N�b�߹�Y��B�J�a����C�;F��FAk�0�	u5�YhJ�1�ԁG�,�����u���_�O��$z�{���<�@����_��^��W��4�$`(�jŽ�{Q�%�2:<I��q-׃r�k�?�Ø3��Esf0�����~`�-�>�6��Π�-nC���� ��m\[z=/2�ct�V6�*2�`;������@��d|�(�ߖo-a��K�Al�f(�f� b?�!�kr���UD�oA����u��`Ip"��P�M��i�>������S?xNC1SV�<
]k��V�F7v �6[O�BN�B��4�+W�	�͓
T���%�~���O�C�h��M�H�d��y�8a69��֯K��8=$\��t$�,,���i�wCM���"u͏��P%ֺԀ���~_���/�p�&H4�H�q�6��uƅ10�f�0��|XY��[�/=��:'�P
:�G8]���pSM��l��:@��M��,�j�)���w����oV�l��%�(�v� �1:˔t��-(]��-��n 	����[Fi݈�(�c8C�5�Y�N��C�ē�.�12(��V�h_i˩�p?�n6,;}������ 4hzU���:���X�g3Dl��.�Va�ļ])�qhKc�� ;�)�6��f�:�:L��-T��a�uM�|yj"���>�^O� (p��wg�
���N���Qy�wӏ��`����y`�/�����vHC�6�::���u��#��h �ﯭ���:���
��+M���eJptGS�5nY���W�&m��C��?� �?5�E�tLt � b�V<�&Cw���%OÓV�$�!�:����V� ����;��7��+��t��ڛTuϿ/y��H���a�a�����z��寧 C �  ���7rŸ�$<���Ga� ��ir"y����h�M�c���.0�A�.�_�3�b�c�c�9�F���UgA:A 1��n��Pn�g�ŔcM����(H�e�o#�[�V�Y�V8x����N4�F|�F(�B��gRk�˃�h�ԕz��~Z������yRwC�gD�ܷ�ޣ#J#1}K,��:��n���9F�8_Ͱic���t�P��JFH���DiT�6Ӽ���/���|w�\���G�k�j��dD�n]��46����.�+���m���!�46�Q��ۇ�>��)��W�G'�[&Mb����
hP%��+���&e%ͨ�ڄ�I�%��#��eY���
��I|���}I*wĂ�_�4�C���h�n���� vW]�!>��%��农�hgi<��@`0�̒��d3�K��N��2Cd#ٹ:��������M<��)~�؟�D�X�~�z�fAx
خ��Ǝ��DN�~��HSs>
ĝb
��q��tKH@������wGc%��m�ɬ^�O�r3���0�顽��?�.�,e��U"���}BkK���\�ڮ�iA��a�[��~XS7F�ͪ��I���)E�j�D�L �:?�:���m��ꇚj���z���r��E��F1��}^ȑ]m�'!�|��Ж�B8�t����ʊF<�lZ���M�.\%kv�X���u�
a���tt�F(s��h�V$4��x���"�1�^v���I� R�cݚ��y�J:̮~�J����t�4Esu^@����݄����4Ԃw�0�����%*��M5�C֢�V�������%�yu{K
�J�W]���p1�ޝ�ǲ��3]�y#"����?��V��{Ѽ�j5
�oa�w�oܖ�Qá7�^�;��3�?�������7I���7�pY襽��`��[.��(�[gֺ:|�|J#���NӃg�I BS��R����b��'�>����/�*5�EX�{�U��dw?�-�9&��� �Sߟ�iɲ����鰑�(�����ͱuކ}ݺA2����̔��������M@謜�ĸ��
�;��L��\ڑήu��G˒R���2�e���$�8�@��5�� �\XiQ�]=�VѬ����(ō�d������\�
(���C5`�蘧�g��n�V(��s�&9~�F���¼�^��[Y�8$
j�ĺ�Jah���^�/ax*`��3m�Ȟ�uǪK
�lњ?Ύ�&�8r͌�$��<hdoS}�P��!�4B¢�t�����R�l\�<�vl��b�c�?%�B������	�t0m q��xҞ�/�H�H�����T���ۋ�3Ӏ.���t�;M[F�:E��mI�= a�����(��w����h�}����?]��jq5���s����;��؂�� *:�K�#�����}\��".�Β���J�Q�w��
ly��x�]�ե����E/��5�b�M�z�+��y����M=Z�x������*Y�h�����EGz^Mn�9���u?�����A�;��dN��)��.�(wb֩��G{������<c;�o�ܳ�S)������n�n���ԕ�8�m^ǳ'�|�05�g�,z�:­ζ���a�xg���U.����퀀����b��.S�Gח���H-ȋs�Q��Eo�wٵ���	i?�Y��fi
N����K�/���	ա�1��s�*��>{il������	�j�W����y�}��KA+��{�M�eϓD���u��ӧ/�~�X�P�iaUC��Vӵ����}^��Z��k*5_�[M�z4?���S�A��&�I$�����IbY�A#���kAWw�t�P�d������9�Ju�n'�*�#�g�OdC_��:x�m��5�%�l�}hh|�n��%��ؖ&g�3���8��X��M��Aŋ �^�gR�8yE_�+&fo|�C-��z]/
8��Jr����/��6�A�w���tz�RH��؋�<)��	J�l��;at�	���ϑx�.�>x(ۖ5�_MC��'�}��tO;{�AJ4��]�P���y�}Upt�B'�����s�?��%��5�b���x���2�x���ً�&4�a�������ZR#�����z��t.�;0��	������?�_ɇ�C�m��n��ϵ������x�f�����nT�^1�P�Kb_���?������0uY�?�����f���%歺*�̙
B�vu��z���|�T�b/?�s�N�aI,�z�����X��am�����»���*�-9[�UъW���;@ƀ���x$CZ=�ly�.�Dʡ�?|
͕��b*�'�� ����kD�u�"�mŎi&9�3�d�wnR��bki� uYy�0����Ȑ�t}�k��x���(�֗j�D�U��"Ҧ�c�`��gk$x��PO�N}�d$�w1�	o�@��I,]�q E�4U�H�6pgi��}%�,�!xH}�g���{��[jP�%��w���O�yͨo`��fI��3�Cac���2�����L�L�}��ŉ ����7��-x�-�|�	��
:�Nw��{w�m���1��s��w����ռ3�}~Z�]�D�I�}�G�x*%�V�{��}Rʈ7�s���֡J]����W��@O�}y��Mҁ�A��<��9�mbQG�I�Y
�K���9��f�wN���@�;��t޴ױk1-���*��K�t!4O��$0#Fwn��A3d������}t ��E;M8R�c���e$Ow�1Z ��uǫ���T,�ƺ���tOo�{�}��?�yu���8;c\zל�R׽��פ#7����� ��'���~M� ��AD"�A�P�[S�_W�F5^������@_h�����]�
+Mڱ'����]_`���?ch�_軥�������(J}      �   a   x����0���˸� r�������S�I�97|y"x�YMai=��8���}C�
q���ѫ!J��ܪ��l�>�[	i6M����m?�      �   ^   x�ʻ� �XT���4�y�jq"@�_�����AG�E�Hd�\�c$]�&��͏֋vI?�K�~Ŏ����h���C�mx�=�gc��;K)/a��      �      x��}�rǵ�3�z��c&�_�4/2|x���c;y����#��9�G�<��������I�1��(�^;+s_�޹3KH.�	���#��������A�E�<K�p���,Z��t�VcS�<��s>�W����b��^\����u���◫��9yv�x����ǫ_��=~~�zt��Ǜ����n>���7�W���@hq ~!��䌰z��1V�XQ�1mJf!�bj�K���ാK�ﯮ�zqCCQ_2���C�j)5>���i��LD�\[^�Nϛ��w����l=E�Kƥ;��ӲeׂjY0-�gZ��R�U����?c\f~\��h\)*jn��f�nZ������x~hu��1�i��
5i�x�2���`��������cr�1�I��3ITQX�>`��b!G�W?�٤��X?���Lϥ����������&U���pJ:�z�BgLp��d[��%n3�Q8�0}�a0*4�a
=&�;�����f�U���$�c<Pq������*򟱀Bt�&mי+�8ǒ�g�QC�2��vZG�\��2��W�k�%���x��Td�Kk,㟪��Χ����o�����e��>�X,|;�۲*���C����}X���E	�DN��y��e��⾶z_>>}������ɋ7ON_�9y��������ɣ�O�gW+�8?R��)��a���8�y���}��-^�P�WG��}ՠP����W�/ϮW��{<*_����xSW��ޝ�ԯ������@s�����>��8��m�!����a�a0Aj3�C�i�C����ő�^�Ԩ-��������gg�"=�|�g�PX%�}��ُ_�^]a�A\�>�|s�W�4�������6Zs��XÉ�p��U�J����g~o���AB�J���C镳�T3<�����y�^�xuYޟ�\�J]�x�[׫���^��^�����.`�W����/i��A��f���V��In{C�^�<. �ʏ�
?���g�>���g�^�S�`�V�V�à����<=�x��˷[q2�=�)��;D A4H UPJ|���5�.^dȷ�_{�Ry��嫃G'�OI�Ø�gT0�C-�wa�(������'~�$�ܣ:���);��^�~��]����6ڇ	Tr�I�#�0r�������;����솆��""���M��pV�V_�����4Ց���A��c��o�����˳�27g��U�<�F�=?���@�*������׏޾�?շ��Շ�\�a��޽�����<���=׫�?��gJ��B�8^]]�z}�E�y�y5Q{N���Bnk�<|sv/�>>���<?(�����s�#8t�O�	�t���ĵx� ����>)�*eF����:���w�S�{:�;�0�Z�9K=0+`��p��p����jg� ��D��y����w�Dz��~�0s��>;���廳��C�q�<Vp�)0� �%�=��ɪ���K��B������,��sɆx��}�5]K�s��H�� ���d��|���q��@�?��c�s�+<?Q��a$,�=ol��=����,�{����ϥ泋aX$��6GJr��a�伧���9�(�u��㋋)�2���6G�c1�!�Q����o_��z;���o�/�@k�w2�=�m�L8�A�%�c�1����슌?}�{~���:š�t>F�՝��?��=�(g3:1. b�br�&z�-_�WB� wº�����*�<�,����"�>��nH��2��j���|�}|���3���w�s!�!$�J[���Q��	@��ku�Mp|tT�z�ӏ�W�?��;Mz_r��F!�=���L��v���	� ���cՉ����?^^�Дӝ�{wI�ď�y5̖��s�x'k<sprQޏ�;������|s!�o������4���qb&���O����b� ��xԈx��ǟ��Ahu;F��=>��-��d��u���f�����E7a����IMs�m�L^X��%j�2�"9|�U�����y�Z��ǽ�V�:G���,5�X���m�|q��v�&���`R>�fR���=άY*ѳ*�SE��]>8~|zr����'/� ��/�7O����g/����f� ��� _֢i*�h���Φ�,$�XX]�J9xJ� ��r�D�3�-�}��%V��Lg�qX���i�9i�߁�3�	�LuL]�%&s�����Z0�r�2���(�lu��c�&l����b.��yўeV�y�x�<��v��7�r^Gi����%d�����.aeDi�8�X��&�H8�V+9��E���@��,9�W���ِ�_O~��i��H!.��]�c�6e�����\isFp�e��g�S5>��^~w|��z� ���a��ayc�=#�u-*�1��e�ˣUd�6UV������q@�΀�P��|�߽@n�����74��M�9�_�;MDl���
`X#���z]��y�-<��S��}���#/��� �`�(��b�b�v����㩲>��8~��h��T������v�k?��u�mb6k��ߞ ���������~�"ak$�lI�	.LS�7���񣷯	�������0��E(�4�ͪK��?���!�ˤ���0�� ������y0#���W��g?`���^^U��m-���}��z���[�����kzl�5z�Ϝ�scd�C<;_=���uE���P4��n����!���p���y�\M�9�! ika��yC\oF!��vw6H�F"�	aS֧A�S����ۆ�6�)���	��*�F¼m��L�n��k	�|�Wm�^�yC���n���=��05��[��`�$l0��������� y,6�u�^�FlO���OY� ���X���ڕ���/�o`:�"`ha];Χ�O7��z
T����:�FVǬ���2$�K
��SEs#�c`�N�0�3��/*in�t��ԛ���Bvk�k|��� ����(?E����֠����Yp���u�rw9�)aނw�Q
�J�?89ek�6&�T���(#�B���)Z�Onw�R��%�/TE|{[X�v���I�!a����ڶ��%S���O����j�x#�t�� �)&eT⎦w�UZ�ͺr����-Z�0�۠	ҾNz�#:�'��z]MN��|Գ� �Zׅ�\���X�����u�y��������E�--�����O, G�%I۶BѱB��o���vz����˿PhV�1F������AyprJ����f=���C��)%��|0��뺭x�p4��j�B�6�1���#���4o�p�N,�vh�c-
�2��2��o���DtDY?m��?���.��و��PÙefs�nH��f���l5�an��옐�F�Eb]O^�G��*����1a[}-�x7�1 ��I	��¯N^��P�Ev�Q]�F�ڇ�^�1-60�`�>��tˎYl�����(w&�c� nD!��|ݦ��h��ǟ��m۱Ȏ5h������!;���Ϧ�(�v�p��f3(Kp_�`X�o�v�A[����/��Z07BU�\��Ư[MI��n���w�D����u�R��-`�d�)�n)&��v�Bu�ƈi�ü���=BZ6@�ͫĝ�Q�1R����h�뻈^A�6����L{ǈ��֚� 6��~������ұ+K�������ߢu����z�oo�s�3�9��	؛�͎��g;�H�Ce-�S��a<�ȴL�y3.�h�ʾɻ�B�ƈ�09�6Uj�N���b���B��1���:�b�˄)�Hm�5��Yt�1kaQ�� MI���.��L���3b8�q�|�@*��U3竵5��޳�΄�'L�
/�V�K�l�%m8�r�]6-�]�=�0��:�N�!�`1�%�(�`Y� u0�z���gG��C�v�8i�e��F��������Ɉ\�.��!Ø�,#oxV+se:�̢������9�R��}π&LƭSkr(�D�s�tJhQ�Y�֌��'�1�,h�&T�6�]���Wٲjxl2�h��u���    	SG����.3�<y�8EV\�dgkU;��cFLJ5�s��R+�XJ�vq"Qe
i�cF�j	C�h*Fd��c��Bc�k�l(�e�[n{�3�j��`<)+�\��a�
�zR�P8U�.fǌ�ڌx��k��y�4�N�2!��)%�tw�̞�#!�іfS���
LCk�u�Y '�/!�tk��݄��q��f�b5��@�G9V:�-OA1+[y�����նzA��]W�u�������BE��{��i�T�'OYgk�8�@[�xH*v��G�Ei��,H�P��r 9pY�o>>����)�����ի�w�� �ϋVR�g�R�%r�Y��/<�M%�T�����͋'����5V��F�#~�䱸ҬôҡWm�kט�2�T�Ũv���
��Enu��i��8 =t>kV|l�!���&\R6��9}�z~|��ѧJ�V��c�AM-N 4i�I٘�0P�;xt���œ��׿~y���y���p��hDЃ��Z�wpɫ����L�;��ۗ�N���a�߼���뗧��O�� ���ki\���VN
&�70(�\p����:}���G�#��O>��g���%k1i��ĥf��dX���|���p���w��N^|�z�����?U���Ӫ+x�\�H�G���B@\�i��l/b;QJ��#��"Sf�,`q�c25h#�P��a�>��j�ql�L�����@��f2"��vŃ�΅�ik��qvF8v>J�����y�t��9&l���L������'�ߟ<z��S�9�/�[>�CQA����7�e�zv��ف���u���ݞC�=��1s�V��X�	ԢD0t/k�aE�=����	\L-�)��LJ0 �-4X��1nj��ͼ��&p�7pQ0F�\�!@7�}x�F�к�{.g�kp#��x�|� �*OP��D �%t����n��U7R@�*0�l�4�C�Q�����3p���=�1�q�ބ�B� � V�|�_�B���?A{>a��18p$����;
���^��nP����3�;�i�Nk۲��2"�r.)��HkR�O��=���>]L�xH10���{]@�Y��%�X�ϻ_J�z���"�A��	;��'v,�ѐ)`�V�+�w��8kE���Z�ر	�V%k�,W
��-���q0|<�&��X�>��C#q`I�O�DO*YZ�]�;vL��j8n��tH�ee8th�ɩ�NR�[rS��a��<y����_�t��ثy��͘�7��4��.	��93R��J)H��rL��}�gD�C��FR�f4s�ڌzU���g�@Si�ӻ���lӑ-����t-PC,���^A� ۮ����lG�N�"2R%O����2��FL��K9ʝ�m��:�֎�	�6�
�8�D�q �]P!7�HDK-������ OWU���ҔRT�ꥅ^P�0�䑫Ń�T��=c�H�|
��522~��ޑ-�Z��D��H�|!	�Ҭ'wf"��YοT���V~<�4�M++���Y����M���DwZÜK xm�R$�L���@3�;O�NIi{�&'��:̹a��2|Kxu�n!�� 6
V�I�X���`��S�%+9a��.�|��2����:t�^�0z{$�#[e �`<�P1�a�Ω�J��-��c�r�Z"�BV�����`�+hg1R����;/�7f������ֆN��L�eKuzq���fL@��`E��J��I���C��"<����1yi�X*n\����͊���$�� �*�;7�w��6)2<A7,Qe�B-���m�;)ar9\I�1^�؂P�׉Wɚ�P�$|���"���&��o��w��☶VrFsVqZ���k�ĉh*r7�ڟ���*5��Z�.��GK�0Pj�����F�1\e&�^��B7ì��Vay��Kɼ �B�Y����*7݈V+�-���l 1)�X���d]&�0A�U~��h���DV���*Ŭ���Ay�=O�1`-�k�K����	K9�>��v7ne������k56SW�����Ұ�Ai)4�ha>�R�c�0���>�BҎN+E��
�c<S_U^t��}p�xx �J�Nq�L�M����E��G�دSl���a��t���6a����|�~a<��`t�f�c��D$㥢�����M,�o`�c�ƀ�����
���sJ֑�DP�e�\g(O\�ѱa��e��������B���#}k���{���_�����{�@ۤ<��t%^�`��^д���E���Z��-d����\(�Y�j_iuC-��0���(E�t�t��WR�Jъq�n�d����^,���t�d��4���ZB�5�?	����":Vk-s�*"tD�V��7��	:���E5o�q��ˎ�Zg��T���Y��sJ�-"u�6�}S���������q���AtgQ3�� 4%m<&PmW�Jvlڭcr��	
�o9�;��W^�yېD��/}���;��ђ�=|��a��0K{�U�b���/�����6����A�����!/K����DU�0{�wf={ ^J��\�`4I�i�dOE�P�;���Ɂ�h�`Ad�/�e�B�MW�;��늮6���i�2� 6�����y�0Ɏ�{���������4-��8b�
�_��c�^��ʂ�u��{����i6rU�y��[���_�������~���'P	Ǻkd�HK+k%`DXtP������{3�.ЪD�,zIG�8N�&�報<���¨��{�G�P�B�-�9PVxK��U�J,���l���J�1k�8�Ǎ�Rn����j��Dy����ja���~:=������ �*<<�;�gos�y`�c҄>,-h���,3e�)8�36S��үI�1鰮�J$�%��RcJ�Tq���].z�穎Yi��Ȝ��8k���Y��b����L)�\x��Y56f��ؘ�Mt����o�a�?"p-�w�:�龩��B�a��
�8j�J��fb�-�tSw�N
��T�Mf3y�#H�h&|�<�Ȩ���1\<������T�{ꔣ����t՞���=Vw�!st=�/���d�HUk�/X��F@9�Z�����f����.�(�����*=AE�b�E�b�����+��R�RQ�R},�7>NxF{�%xd�~A7���
�.d�T�ʜ��S����H!VYޗ�ۥ��l:�;Y�jȫ��x���##An�LF �N[�[��c��c�� .�����ci/Q��u�iaY�m�h�0�y�E�n���4�Ph�W�f��獚�Ȏg� P2F5{�|K�$��z�ꋺ�te�[�ur�r2��*5�j���/D!Y�	�|�ʛy�B���2O��\"�Pp/�K+��`3f�� �7��$[���':� K&U;d�(��f���0�8�$�O�Q?	�+����U�Z�L�t�^ �������(��U�"}�� ��V��K���}���0!a��[�H��?��JY��صn	��	Q9�=ㅒ#�bE�C]ʋMǮ��#�tl��Y8�
mn�-�;5��6Lǲ�ء���L���4	d<Ц�-�x�-�z���5|�X�K�|
s���w����~�S6�
���fڎ]�ˌ��+�C����ٔ�>`P+D>'Ȥ��tB0��b��i8 <���O�]�
j�sXPL�1\���I��4�MR�@�'*�{�>�3=åw��Q;��J*kWJ�1=����ҔZz���u�/9�Z��іF��6�O-�LJ���^�v�Z�Y;���R�5�R1�\�i	=#�����VӥD�֊��١�\���E��P-�>���YێQ+��ВuIqJKMļQ���	�U�pL6.��5�G�PՋ��\R] t�䘯�v�Za�B����܌�\�J�5u�=�3K�#DLY��?�=z�:f��t�z��o5]�h3%�̫��P
�0A�c�z�c��Dr��    ͬxI-�X��Y�P�qæN����{�+M}j�wW͍a�����B��:F�m/�BD�`\�	e�\������.����6���.mB2��Խ�E#K21:� �}���:�;��FV4�������a�M�#2ԥ���X���Ӆ2��h�2x����n���A(�PIv�5*�qm��xj�	A�A���|4�縰��5f:��@"$3ihj
ٛn'��Z��^�*�c�SE,*I��fm�х�>S�,�}�=�����32�l�x�c��t6o`�Hƚ�pI�e����� ^����8�#�,6j��L����*�%�҇��wza��զ�Q0�j7OlA�<����7��\#�[��!Z ��l��H�ZE�Q�&Cx[dE.����x��>����`F����!�'}�gif�D81]�b�IÓG�o���"�?$U���.�k����jZ��sja�k� Ǩ���{x�\�� �ʩ%6���ޔ�oP/jWCJ�0}����'����`�!�ڔ�Hچ�+�8\"�Dɬ<�!}��'xυ����(�m����j��p�Ά-eXse<�k<��mD�P���e\���t�,�[�Dɹ���cFީq��gS#�Q~8(H������͹������D��U:'�k!{��J-����|@�:ν����@L)���v�"�9$,��ذ�g)�z�r���j�`2���m`�M�V[<��ٲ����=A��p0{9��3zDc2���R,��u��Ȗ'x��T�� FY����1^�w׹��ޫ1^^_��8M]'`{H��T5U�r�o��m7p��D(�����F�m3�^����*�'�����^Ԃ��������	I�~�D��}*����x������@Gt�/��RK���镇b��m7�n����� �W�UEu7j4�E���ߖ����>/�NO�c�
��*$�~]�d��jLu�v��گ���x��O�"�$Sy�jQ��r5^1?�Ǿ����1�������j���k�5�X�<��t�q��4�\�� /&��#k�P�P"eɎ6�ָ��~i������	��+�"M�.tڅ�ٳ�& �Z���R���@N��G:7�z��g�)����`����k�D��R��4���j�WI�bA$E���j�Wl����K����c�XK~AQmB HW��D����k��t�&|&�`�`$.��n�U2�c<ԆZ��nG����\{5o��,�AF.L0P�'�W��2"xU��M����RL7�Z��{�W�D�*��'�esH�a{5�+6���}Ȏ�͖3�{$|�.�����f����w�V���h8P+x��cuT���(x�-��&�����/�C��!|�(L���\� PAc�|J�5��k�饥�Z\P�X�TR���Y��O�a��E�	�KNTgf��O	8�PhXf.`XK���_�̴�-��k�SOV�^���zyj�w��V�~n]��;�`Qtb��� �������hч�k���9�}ցI�<���EPjv	Xs�/����V�A�]?��� ����k��d<c(Z�jd�y�Yϵ��n
��)��k%*�p:0��A�xkIU��>Z�����z�3�5���J�2�s�t��f��d�n����F�靋�WtԈ�j�yT	!M<H��ਹ6��}�k>l8�5v�S��!4���Jϵ��k��!��G�q��GU��^G:�W�_���;6M���*���H�������bj ��T_��g [5��%�ݎ�fڜNJP���A�?�k!#tç��	�J�N��N��(�x�
9���\�u��j��%Y� �E��ob�Ԯ����_���Jj�Sla���fG{AtD	� KV�&�8����zjP\x��ɃQ���F�ir!0t:�Y�poLb].���u�ڄ�����/��@.���:Y�����q5�(F�t��x=�~u�#�Q������ ޒ�!"/_�Vs�b����:$�V�xGy%VA�6�Bm�'����5��zo��-m��kDAm�>7$���g>�$6�[5����lr͊�F%�J�7�NG:��BC��k�]RV!E�T��oB� ���J�`Q�>��}����F�m�!�Ֆ�=��cЛV�H��n<�%F��o^�kJ�t%����Д2M�=.%z��wۨ�.�^N�rY��'䥩k�n-��&P1[�dl�UZ����:���	x5��1c�v!�
��J�.d�s]b�T���D���a{-z��P4J���\�z�p�:5�32����@���*ᖑb����\�� /��5%c	L�:+���-�s�^
�n���&�A�t����]R����`Dj�{涊�e��[>�����	�ɠ#�Z޴���`#�,�6V�5ʤ�9s�b$!�0�9��m%б�""K�yL�2r������~ج��FAG٩�>RKE����oA�[�>}��l�W��K�U��/��0���2*#_r�s�b��n�6�B���n=�S%Q��ߪ���5�(6��0^�i�U4\��pa�AZ��0H����n�c�!Ld \A�R�.ղ��r�l[�h�Br~���!tom�>�+�\��V*5y��sL�/�iYs�:�r#��0=�!�zpZD;֊5�����#b��Iĺr`0dG�+t���=�
��?vQ�~Ǖ���׭�nV�`KyxJ��PC2����7Is�M"�x��@�]����\$��Y��s�@+"�\��.��Zw,���R��afI��DK,$jo�\�� �.P7T
������$k� M҅���s���k��7aj@ʨ��ѝYa���O�d�zZ,D����^OU-#��йO��5����R !O<5/�a����M0ӛ��!3�e8����7��mS�|�W�5�"�5@(@Dk�!�$��ø�����'��k�B��8]H)�s�@m�˛�.d���3�j�/�D�5�ӭ�ƈe�R^�h���t�
�vO5�6��IA�C���6��W�4��$0Yiu,�^�u���R��w
� 1���YB*Hw�*{Qqj��5�6����OF�襒Z"��(�Ie<r�X���x'ƫ7t.�70;t�*LS� /�4����=�;�6��J�o,ʹE!%������2��pq"�{vk�\w� "L��D��m�Ҩ;�e��,��J���]���0�W|�(:�l�y��]��N�x��:�D�� ͺ�:F�֙��M˱�tӱ���(�'lq!K��]bAs�a��c�ݚ��KD���[�I��£�X�|O�3�"6�XoBK�U�'�%?M۩��6�V�V���Q5�$6����+��3�DN�"=��2�#]�}�Al�I��9�"`s!���3H5K
k��^���!��N"����>��g�|�Q##�ȡ�5�-<��x5u j@�ccyH��rN-��ت��>���u��zJ�����>:i���8Ig0E.�i���ζ{��,�P��pP�œn��Q�I��r!�v{���px }�SvKq(:'��H� �1^규^�e���Li�	�Ѕ1ԥ��o��fX�l����1���F�0��7K
0<2�E��;����4��E���jj9���J�������0|���U��f��^M����y֊)j	�ph�%Q�?��������l���<��?�k���LG;2�.E�=�|�ӋD��7�8O=4t�5�k�3ݺ���������l��S�2���B,8Q�%�;�қ��u�^�ѝ��.0G�[��Z��.�����d��@q:=�l�3�!,�)��N0!�������KI�%�0Б�V}R"�-P���j���7ʫ������
9ը�kظ,�X�f��~�Z*�Uh�p� �ly���O�%P�Z���u[�~������y�܏��x�[� KͶ��:9P<�T�x�-��,9�!�,"5@9��ś�V0�_'t
<�b4���u�9a�4 �  ������60�o���������5�VY@F�(<�R��2�
F"�_�%#�<��2�4\��	�DGe��|��/�n=�'F��e���ݗR#����:��BnI���]��N�����R[�/�N�����Ȩ�GPu��h�y��-��qީ��qҧ�ǒ�F�;� ��ۛ(T�6f��qiq�l��X���/)�����
�
�t�SW� �:5�?��g��ݖ!�O��p$Y���W�BJ`݋���'�c�^lF�}���8K�[q�(�t�~�>��Z?���>1�Wr,�HG7�G��h���������WE�t��jn���ƬQ�8��*jwP�H�� ����,W}��g���p[Ƹy?�B�D��;^���oK��-�z����u
#ٔ��`��1����x�h
F`����g������%c��y�,i�J�G7a��d �M���g���O;�R�:�쉊%�SHL�C�!�[6��F2G/_�]�*oC�<�'���&@�h������d��P��Ы��2�G�F�J��F�D1� .$г�dn8�ϧ��%k��������3�T����_��g��H��on�5��Q��XR\���&� �J,�=�iF"�>QKG�<s�i8���]J�����=�i��`��WS<mF����t�2��F�3^�څ��l!�k/l������^�D�a!�P�ƟU����N3�_�5!3��Iڃ�����~���p��<R�v����t)��Ƃp�ya�z)����=�KF�k˦2'f�3�����Z�F�	D�(:!� ߱�M!L	��P�d�S��:�N�x���3x=�.Fo�Y�%Q+]jɄ��^�@�nT�̞��R0�m#x�gC�+�<ݡ·�YjQ���\M1B��o�г�b�N#i~aX��4A�G�02%�^� �1Z�&���/��IzC�V���q3�l"�-���\=�.F��幩�J@�1�|���{�]ލ gmF�v��+_�� 94"<�nF:�٠>i	�A�6�}ӛms�;t��x G���b���1$�5�4U$��n�ҳmaÛ���$�P�p ��"*�?μ�։DoIX�ɳ-a�[(�+0"(��0�r�߈�$7r�A^��ٖ0z��T~�O^�)����AAoa��E���X��_�v�/�Y+���t�[�,�So���G�SkR�/�ӳ-aËc��nh���a�+�����t���ݱщ���tW����s:��*nt����
u #�_���a<-�U�4h:$D�7���i��Eڥ��w���~1G���e�^*
G�)}Kt��y��Rԅ^:=�.F�F��'��#�npqT�-�ӛ�B��vD%_>�[��Jx��L��k)꣗oأ�_�n_�:�x|�%Dy���}��-^�P�WG��}�0m����W�����M�Z���9|uW��M�꿭�zq�.]���\��_������>P��v���ٌ-Hi����*��Է�����E�46=�m�v���9���؅��_����@��R�������͡|�zE��o����N絑ڱP��}��}u$�:�.����� o�O7�O�fSqIgA��Sq?�W�Vt�n��O	E�������~�x�>&�@������a�]L}$�!������%\h���_=�,�R��:i�>aW�9����H��j�FJO6�XkH�P����������?^M�ޞ#f��C'�t��!�o��oI(����ݧ�����(u8ҷ��
�w�xH82���ͫNg���|K�#n��q3`K�V�Cͫ_?�lm��=���7�z~��zy���-�3w-+�4������kC�ǒ������>��~syvQ��O���J?oO}�v|a8�I��ǟ������[�ğj�W����0ruH�6:,�m=��p5�� �^�=��5:z�*%4�S��������4b�P%��
��E30�C��a<R>;�O1@z����Y�/I�CɃ�nI���@,#�=D�n]���>}��~[�3�y��?k��.��W�I�I��,4��f)P�!+�]�Ejv~�����W�*�p��zg1D!
r������H8�@}$n� N|���_�ؗ'���|��q�$o�.�S�4��'�Њ<��ӗ��<=Y=?~q���>y�lQ&�3^�e�"� E�H!_
)TB�Si'��F�|�n)�����L�5|�@֮�����h�0�?�$�V~�7ϳe�f�b�#r����>���?�!cg� 9���'�/����Rr����P x�ѳɃ�H,�)�ޜQ�rM/ş�*�ϧ������ɠ�����������XW%"�z�B:tu���~��C�/��l����Ho�.V/[;�Xþ��+���Ṣ���W��J��sz���O��w�*�y�Q���"@jeø�d�^^5�w�����9�E���Ә���G���T/Wr�.�������I3�H�rB��#%��r�a��a�t�ը�Y�����_�<��~��o�Z?�|�Vr���J��%�����o:��i�ُ��с��oN�� ٷϩ��̿p�OJ�%�N������o�yP�+�Q��������?����o?��� ?�����=t�r�E[����o�!~�5]�������0?+�s��{���v���hʮ�]������ߟ�}w����rc�sXW�7��w?�`�]��D�R���X�������~K�c����z�Zk��O����c���r�5Z@� g�>�v��&)-Ep�`��m�zy|��&%sNPNt��]#ҁ0�c��r���F��$�c
1������.�x����F��A�ZoǢ���o?�]x:���6��~r���i��@��<���Ο}���Kn���(*��5�Ƨ�ߎt�T� ߣ��C\j������L�v�v�h�#!7v۬����l���_v�vdD�ҎRB�����ߙ�~��.� ��s�Ӵ;x��q���wώߜ�|�z�d����G'�N6?x}������?P4���p*78/��8�^	�lچ��T��c�]��/�ǫr6�!�����M3���M���+��+cEJ��zEװ�x������R�<���'�)�*aO oV�?=�[x}[[]�ě�S�oѦ#�n']9.��QJ�'h����1l�;�����;y��t�FU�����B̍%j3��7�}�}�����&�/[=����oN_>�ud��y�R������M��1��m��b�����$���g�GO^�yr�����w������`Ǜ�DB�{3����%K_����t����#��^}���X�#Vi�����&����w����w��3nT�h�����ޘ��<�<?���*Ҷ���f��W�ή�i�lT5Ȱ�2�n�(��C�p;2���CiU�!���P䈩��LFؕ���VtF�ad����������      �   �  x�u�K�� ���0S�<�2�
F����G&q�{�l}z���¸�G茱�;(a�r����)B� �D��a���R,�V��ր��X����}�e��0������`�K�-抃O�)K�ܭN�a��H�&S��f�a�
<�석s�oԗ;H�'�8WE侅sJ-�CC�M(� ��u�&�~��A��-��5��|L%�(`�aa�؍sT����B�a
>^A���&>�����x5�����EW]�����ǆ���!�N���NPZ�A�����鶨�ɕ�t�e�%�;t�
^)����뷉�_a�R��� ��W�#��w܂*lwzB�EO��i/+h���(����Ə��m�����fx/g��j�m<�f쿲��n<��J���/�e:��0Ч7�d�	�~�(�Aߎ(?�<!_[�>
X��ߌ�l�����uӽp_�|����?d��      �   �  x��X�nۺ}v�"�83��[6@����%W����?C�B�u���i�d����0p8}h�>��tB���.t����0߅}SKS�����?�᡹����Dth���և� �5#�����������c��e%$Z���h����#Bh����h�#y����K;>M����Sj�aO��t�J
g�F�]]�J����������!Z��@d�����?��^��휢�tzLb�b��A��q�9�n���y����;rr9����A\�Y~��O|�\ڇ\���/�D��9�v��v�t�}����UY�ΜZ�-\��?}A�L�����h�&~J��8C�*I��7��87S���8���q�0\b1�����u���y���pU��H�����ܝ�0�S@;���/�45o��������>�Γ<;-�r�ؘ�_9����S+���mn�/�h>��
�		�oWNQ����c��G�a�E�	p�k7~),]��7P�v1�d\0J�5
u���|�1&�b��Y�>�7���ݯۣ.f�5+�B3���MF��n��^��˵�?���e|TI�*Q����S �ē���s�s��â�]w�����*�Z��� É{4�=��Ml����3j�Nw<b248�l���#�n������bL�Jk�"�,�_N2>W����m��ɐ�F��~�n��7>~�/<�ދ�Š\���_�3����>��ULBP(�Rŝ�\���2\�0%��}&R����<@�����m�y�*[#V�g�|��X�7�p<��RF!��%��8����^�О�O�(�,2+����.O��"��&]���b����ߩy�},S�F�[ �թge���1��"��Լ�3h ��*����m߾��ŧq;�f�T-��O(�&�HU�^���M�dM�;4R�zˬ6(t�\3&�e�A����,6Xd~N���8 N��׃��Ks�x�6>���糖�t�&��*"���N~�IE
��|����~v��^3�ǧ������M�PY����nl�w7�L�$"V����3ao�s�4��v(R�+:��.|�!#L��IS)aH̆�á	��M
��*�K���㉰c@v��ĩ�奒D�t�@�j�VЙ�8���	k�l�Z*N��F�Խ�����c|(����ƅ��g5�y�([0���T���(QW�)�D�\�����Q-ZfAlbbc�M�uq�*�"�VC�`�H��C�����ȵ��{F��"UB%9i,���h�TU|JȔeM�"��D�d��T����b~��{�M����{(��nqVɤs�J�*��d�`�B�oI��6�&�k��WTN�s��|�����Ѧ�@���6S����ۜW;I�%���)�'ñ=��q쮱V�NR��G~�&�ݍh����둸�ci�i �4ɼ;�j5�֯[Ӈ|a�4_m<.��K�/��B�e�?�c&QicQ�P	�ZO�bp���-���O�PqʳPT���L�0Ũ�+g
;�z9M�D�R�9�7�~8YgH<)�jf��tL�O�~�xP��Uo���n�m��'�3�͌_�kǂO�W3��ɲ�������J�~�ݍ�ƺI��|bqS����	��S����佌�����dǪl�D|��(E㶗M�c��Kg1�E����!�O��۷���U      �   4  x��ٮ�蒅�O=E޷��'ۿ}g�j	y���O��;��Nf��Z���/B��"V���*-وw�&��.<q��OfҪ��p����E��%�D�]]=�_�kY�������mV��x�����f�MC�?�a��v|��l�ܔ�<�H���5:�m�T������1o�֍��׌�j_��v�%b�	�x����6�K��dud4�f�w@E7ܟ�Z�)_ǜ�w�.�Պao>��Ki�LM���e��E�q�`߾�@p��o�#��p�� �G]cج��]�36�I��+{�q ���Q#r¶�&o�+eԍ7��m�� �ع����>���\h�/�$`~F�X��Dd��w�1��=�s+�Q��lcs��hsFa�N�R��Q�`M�S�\���Ҿ*D�Q�ړj�-w����� +0d~>XJ�$d"�k:6��:�҆sX~ ��2�.�-E���Nq�
j>�ȩ���ǖ��8pUg����-]��	�o���D_}F�� ��"�8�N�<�'����wD���AXǺE�����JmC-~�́���Oe��w��\���/D|����0����o'q�ynlvq�=�;$��b���X"�-�ź���z�[�ٖtv.�+G{���Y���1s`�CӘT�g�x*��>�9��ѡ	N|���d�Ĺ4W.�ߦ�ZL��b���ve;���7�ay	I:��-�Dޱ�l���&h�J�;���<��?Q����}<3R{�64%��ʷ:����j+��z?�X<tjk������O��>x�e���0;��Y��m�u4%���"Jb�]�m�4r΢G�F3�M���h'��*g[�;�_Me�VsԘz:�I��`��n`��&$]�`9`��# ���^��/��Z���^�g
��`�����5�,Y���ȑ�t���Þ9-�3�Sx���f��,/A +��6V�_�y嗾d��G-�N�/D���@gD<�������.C��jXU}�¨p}7���5��Ie�i;���-�e�L�;xq,��h���'}*�^g/���27Z������5j]�?^y��]Gl+|N�Ž��佲��a6��J��T�N�2/u�}>rx���`llk7��������^�5�z���e͈���|^�"����Ӌ2s�&��<].�EC���l����2�ߝ��A( (0�������uR���iـ�Й��YcQ;�J�3bx��X(c#��0���Ek�<�SP:�;�����@p�={�dui���n�޲���RN\�-���\z�?��ΦO̢$!W�i��C$�B���9wp�m~KDI�
tȟ��'>)�M�{���[���,G�K����.�j�?�Ϋ#�`f�ǟ�F\gL�NN8�ؚ�*���}�K\����Lh��jw�"���s�mGO/H�{�������;�g�v�[�'!�>�~���\U�#�33�gۘ��:�J���u�Q!�V�qN�5��t�n���ݭӀ�޾q�u�[&Xn�K3���`��,9{�+-D�4a��\�������:c��[osxj�$�s��&�B���k��[Y��d)R�_��fs���!���7e���
T�ih-+��V�d��꛱�Oo���M;���J6�t�0�;<�F�|�Ep��J)K�ODir���*L���.�s�8�ԆMM��?.�Uo0RI�S������=g����Ǔo�er�*��+���9��?���_��l����ź}c����L��/��Q���2x3��M㬻�A��p?*���>d��Z���O�cr�#�D�
|@
8�>5ȮF�v�r�nY��>�,����i���9���D5����	��e[�mi9�x�/L|7��_��Rs� ���������B&+��v��-�Vb9v�;��H"�O�����~��8ӕ6�c���\'��0�[M�$�o�� ȼ�2�����\0q�ܝR��c�A�L�H	�I�gw�0�yX�N����1ceg��V׆[��t%�E)�F�ϟ������M9��݌;�YYCd%U�Y�Z-,��@�g믪�&�sb���7z}<ը� pvRE;=rT?-#=�~��R�@󦉿�)�[�������V�z<��$JQl�U�4����f#�r}l�y����}j��/�X&�ҋ\��VE�d(����v��AS��yh�ly��� ����'1�����b���BH�1������!#ڒ�\��oVfj�z M��
w|��ݏ�7y��:7��q���wv?b��L��q��miu�ݰ��R]��D�$�n<�˾�D%1���m��j+9����^��ċ��e����)�w֑��\��p�3׾X��;��:�b->�p������x�}@�2��D]�&fb5�"F0����w!i�4�s��h���}��$S�qTt�ժɩ~�?H�K���&�Ȟ8�Zn}k�8�j�d��֡�^Y�K�N7�����ڲ;yt����R~{(�Mih��}D䀕�f�	$rӖڑ�[�=f�X�5L�P���v��DU����=˭گ_�yBϧ�8o� =�OU�@���v�C�,�3��CId6��P�݉���y}��LM1���`7E,�<F��_�,�7��I��	��j�'��cZ���_�r��n��Ǉ��R�}u����X��,�,g��Զ>c.�"����c���z܈K{c��`���+��3���������g��s�N#�~�[i�&�X��Sl�ɜ���h����S{$Y�6"�ԕ�5�^��9Qw���R�z��f�1�KӉ���#�Y���?0k��q�����OL�
�F
�����1W^���Ś����jP��ָ5�t��'L������&ژ��G=�� iV,
h�b7B�G��o��.<�\�����]tI�w����5uV�X�p�uN�Q�t�As�|px�͟Eˀ�^}�h[.!���m�3���'�}���B�$r���$�Qv�4��7n0'��&C94�؆Ӵ���]63������7�x�:�zx���+>ܒ&p�{��޲`q�]]�	Bi}/�A���~7�ԃ�����Q�$����֏�e��^�
�P�0'��V�L����x��\%��T�)��kfw�-�I��z�H�Ӽ�3��LF���j6��*:��Nj6&H=ԥ���������Vw��rp ����A��������[�i��7N�TqE˥c����a�w�&�4���󧞮��r�rj��b�L�����K�v�\CO�ǝJfF���3���;5|H�=�@��^_�6s���zѸ;z$_?�R�����E�w��ߏ?���� �
�]      �      x�3�L�H�-�I�K��Efs��qqq �<	�      �   �   x�340�t9�2�������Լ��ĊT� L��I-�OM�,���+���OI�)�w.MJ-�O?�2?��ʒ��T���t.CNG?�P�O?W_OgOO�@����g�+���
KS��s�
�ҹb���� 
_6�      �   �  x��R�N�0];_q?�BMZ�c�"�)���l�$%vp���o̎mw��O��M�v��r�8>��c_�"c��㱘q	�\���s�}��q"�y����"�a��[�FM��(�_~�A�v�hH%�����-������NŴ���w5�Y���7g˫�S��z^E�K��fͣU�_�����R8�Pv���>��5�X��N���l��p��+��_C�K�3"���Vt|	��<rQ:3� j�$z���8���"�AL�(���oo����rP�D[�u�ݭ�#X)me����ABM�-u�n�T�S�Ӧ�5���MM����Z��,߲�bt�lKC-�4�o���rNLQ�u�l�����#q4��-	�e�7���A4����T���䜽j�`���Q'��v\'���\��!���D����W���      �      x������ � �      �      x������ � �      �      x�m�K�$9���Qw�n��Y��	z��	F��?����=KB*=+2���� h���j0W��_a�r�<�]Me���Z����?�m����3�^&^6������1�ȽƑ�lڼ¶�j��k�0��}u���?�_˕�#��W�]}�z�܆��֒�m��Gg����ז˥��e��W(�]m;sٽ{�����m+��]3�2��+�^��z��I��fbo��r��V�-k>�f-���e]��U�Ղ�e��k跭:���������b�J����fW�Ǳ����؊?��+���2��(Sfؚ={6mN붕W���t�����fk�o������[�>��-�Ҍ>���U�����S�쪜F�3��V�v��qϾX�����Rp����a���m˲����{l���\���a�0ۺ���ܪ�ŕ����]�6�~���YW�A����W�籕����r[%67z�W��#i^�S��M}�]\��e����|y۱�s�J���%/l�?�<����&t=i�ld�?	ku�R����V+�d��6����X�v�/x�t��c��ч 3��}6�Ny���Uw��U���M�!��Z/��|3Yv��A�9��F���RҎ&��ڪ��х/�wa�F���n9����i)�k�dGM#�i��9ﻩ'���c��k�E�4�8'FH�s��Ѽm�nO�r!Z'U�3�=f�5��;pkVDħ97���U[Lך�ڜ;�x��G���~P����k ]� ��E��4��񎒳�	���Z`9�`l����fM��D�9��C���{`83`�q+��*�]�W�/m�8�x",xG`�?�Kמ�/~U�]���9����"Z��x~�+P��K��^mw����9Z)DT!
S��ǋB�D�l������a�_l���hG�y
9���Z�ō]
i��VJ����{hx~�y\=�l�
�c��/� �h[����qŐ1J����i ��󍳐��� �lv��Z���g�1[ ���m����ZŶag��R��l�ڋ��\5���8}Hy�X֕������	�
�sc@���X�Ma1ղ��D��I�dA\rf0|��I[���փ�?%'F�z��t��a��f�#�~�FN����p�4<��yl-Ω(�Hф��y�NC���=���{l9�ٙc�j]�V���A>y�J��P0��uӟ�l8m�&1�#�.|?��
��<`}l����O�&�f����y��"n��ͩ>N?��u	8�Rላ�-C�㈎`v�o�|v���B��@ � Y\2��n����_�����@zG�M<+��z�'����������\��s|
-	B���< ���N�b����l����q�f���`v�/��5eo�T� ) ��^E�cìK���R��!'�
��ي>Ӻ��.y���[��[`ȱ�a>�8v;lٙ�Z�$c�%y����Ȓ��p;\�� +ɶ�\��"�]:��l��J�I�����������n����ްRx8��%q�9<gki��|�B�|l}2sK�L�V�[��8V�F���#�0�4�Po��<�>��N�;���$G,�rl��?I��l|#[|�T8��Oi�j[!zS)�z� 7Y��1���Ζ��@��,��c+���=�� '^�l����q�2���i���+Ć��H`8#����JJޞ���yl��a�d����U��0^d�v���wG���\!�_ μE�J�V͙�����㿸�#U`J��Y�z�� � (�W��r���~e[��h>~(�!�_y:[c�δ���_�(���� �MBӈ�Py�۾�ۡ�^6g��k[�ޒ��4��r�|�׆	[��q���W�=d_���`s'O���G-�s�i>��[o��৉�>�~D~w�\�J�=��n�K��窸�׊"�R��URNi���Y�-����3�m�x�/��k�C8<��n�f1�� ;q�.���_R�P�|c��yEtӆ�ƒ�����&R�\`��w��>��r/f4O���Č'E��頗� ��$�D��{�2�B��k׸���Y�:=��o����q� ���wK</R�B�so�8�޳�fW��.�A��+���f<�=���|l��_��dW&�|���n��*�Ǝ�u����刺@m`k-#)��i�}�1vs��8|=����K8�{9!Oc�g28��ϥ&S�<����>�qD"y��OÄQ0��}4X 8���r�۵LB�'%��#R�������x�e�&peO�,L|�$�h��gٵz�J 8�����^��^Do�z�/�DaR�JF~�U-������(ꏿ��]��F��s^����?�m#]��0zD����(�#�!��'�?���=v)e($ @4��!�W/� G��V�e�	*"����?_���P*x�R=��X�u%+YBn`���^�$c�� ��-�eyׅ�&�B|s/ʁ�&
�Z;&�j���y��]>,⫠����J<)p�����8B<���o$�ZK��ܰ�b�
b�%�>��L����'h�Rt�/tf���:� ��[��|�4UW�n����+¯@%Nm>����E�����S	c	�Zrl��ƍ�O�F��&Ֆ�j%��_�#��H��n�9@V�.ʥd� Y\9�9��^?7B9�~���A8pc*���� ���:���O,�e����<^e�v�ԑ��]�����e�����8��?��.�D��� �g]��>�rX�yURz#�-�Nz��܈�k���C[��3�ʒ�2�"!,�-d1>�y��ʛ�Ju���A��-���.�����؂�}|�����h�ri�<nr�q0HT�� ľ��BAo�\�x H�2�y{;�h��ay�<��xh@��o����p��=R_���C�#@k�[��W��0�Z�Th���nD���!�p�a@QVVi�B�Ɩ��T
��D��G܀�0�4>k�dN7?�7b8��O|�l�R���F�˲��� ��u�[���3��p6��cx�]�]I:�7�1[DO��6��Do��l�����b*�	s��"A��x@�I�p ���i���M�-p#�_[/���yrۥ�� VS�h��x��Բ"��S�f�0U�Ƨ��:	�pl��ō�Cn���T|��A����c�*m�/*�_�s�J�ǀY�������X��>$;Zo�ٙ/n��*����'�j�x0����ֲ��� �@�@&3�|l��~l�
��xR�J���Cۊ���I�����^r�6ү�N>⡍�� �\�>豕��tpÚ-�V��t��oh�r"ݶ�&�fq.�`�r�Z�3���*7�D����&p#��Ge����y9 Q�Lv����Y!4���SA�f����-*p���� ��qb9��}m}�p��af��%��9m���}�wzn�n4������R ������>����tp�ނ�#T$u%���M<�U�B��&�7�P!��W��`D�C�E;��"�-%p#���/?�}�ۈ�Q ���d#M�4i��˜"�!�+CU9/6@|��U=�}�W7ҍ�?��ď�x/�aͤ%���J�.�,�b�uaXh	�n��*:��ʯz ��ױn�tl����D� ��r�i��fг�����G��hp~�'�Mܱ�~]w������_	�H���"3��IWVs*D���������zo�C2��*����*6���s����זmM@�,�{��́�@��/Xtv�Ŕ��!�+���cD�8}��GZN��pQ�>�-�>�Ձ'���<,Oh-���� ~���6?�&�0589Eն�Fg@�ޜ���l�����b�)���%��n�*�CPH�;})��Y����9nq�%+�3��uep#ۯ�o����x`R`M��[E�$��.׎$�پ�^�U`)z�G��YF´G;dp#��-����~R6�EHn�xW�f��?�(x���k�<Z�J^�mO��sl��[�n��^�L=�
mA%R��t������h=X:�cK�.���C��Hs����V������    �z��oc��j{�gW~��ʗ�Px�)3K��M�<��`���WM����eġ>��/F��k�o��"^��k�HQ�j3>�k����O�#@ayR�6�����ML���RA�SLIԭ��RW�����jƊO�lqcTbAlׅ���J�����Pl����F7��'�baQ8�Y}z�&{�ѕ.٘�L;<��f9H�+.�
d�a!�~��c���c�a��l4QLw~������x8�k������ƪK���uy|nN���F���<����և�F����U�DZ��T�H�e�>�D�[����Y���JN��p�'�yS��b�����!H���E���W��PA|3�nN��1��v�\E&��	]�� )�_n�(�F�_[�X�;�I'Mj ��ᇅ\I��R]\'� $ sDuun��T]7����=|p�����x�G�ɤT�,
~�Ԡ�r@q��I�O|�Q����m�gĮ���oD��D�n������π ���+a+�n&4F){?��J6����Ar �'�e�U��p�n��e?��D�8炶p䍀�I,I������f��P-8�ty�yиQ ݹ�x(�F�[�[���8Mш�I�zp��95����\��p��z�I|���ݤ�rB���6o
�Qn�(w��U��̮5,��y�����y�-�m&��|�[W<��*�fˌ�Fp��c��K�R��4j�����#�5�y��\	��PC��yo6?hzk(D;U��R��>����I#%��j�Ug���gc�^���2���q�����U�B�j`� ��-p�ԏ�o̑��$�rV�˨m4,^&m��`��3%h�ڬ8���ő��q0G;T<��c���`�^+��.E�z� ��T��(����种i���][�*&E��5�0f~;�ܨ�c�[Ƕ�ч���[��s�|����}�(��ē���j��7�+�Q�_&e����{u��� p���ή~
��"����d�F%,80�G�$�r�C8���*F	���J�� �M@w�(����E�As��Tg~��i'S#U &�=@_��&��S�`{b,[S_��2��e?� K&�z� %��QQRarx/��������kI{
�=�=(�С���R~l�>Rh\W�Ha�Cڨ��kI�@_��>$��:bߖ2:@'r��r��X}�3�O�#�=k)8b��l�� 7�Ś�y�T8j�����Ա�lUt���^��-�٪�o�Y
�����]�!�h��fz�ਇpHX~"�יElA�T���r����X���+���w��Rd��4���]�~:`�o�#��l�R����Y�~�0uhDʫ�3C1�6VtQ~8���O�	�09�v���ּ�Q~����~yww�3�׌�݆�u���
�p�]�Y��8A��%6��+�-e���/��GW��^����ܵ|��tۆ9����T!�BB�`_q�o|8�k���Ժ�o�͏�h��|C���<�8�dAfp�g��i
~`��KFGHY@��B=Y�`?��{Or>��?l���%��R�%���9_�X��T�����(���=�`582�*�KH�`�V�c�*0*7~� qQ�z���.�p�X�I^���5�,��4�Q�h�0|����M9��kr�>�S�Q{�`���8H���:�������}t�+�5�%֘��YX<	�ql�?����4����'�;��I0�����V�4#E͆\.hPAC>M��[E�F�ױŮ�����1u����m�ݩrA�V0!��"������alQ� 8�.��J�����4�Ѿ�s4�
����u��r�)J*Ə'�$v*���灻G��%dY
�ד��IN�i��ꆏ���0�*���B�,�);���'�I�6�ـU�j*����~�h��AN�{^�Bn�`�F�f��W5�E~�\=�^=����|~�d�Z�ZuG���r�a�՘���_T�M���~��7��x�9�Q�n�ţze��W��-].�i�ӦG|���E��ٔ� ��VҬ^v��P���*q����x��]�tU��e;���y�8�14:p��)�U%cզt�ŉ�[y�8\��d�~��o@g�*~"
8>��8�?ֆ���d�@5��(�w��g���3�S�*��k#�]
 :Uz�M�&��n�������.i0ȫU�J�&E��-p�����f�
������x��mFx����~��-�8�Jo�,(~��L�����ǖ��$��MT���4|��pT����n<s�����ҾݣQ�s�b�]��h����Cǹ�I N�� 0�w��ڼ�؅cK3��ҿ�w6�[6��C����A:H�B>%_[���H��O����g����-q��߈x|d�5��[P=����b#y���q���#ԠBw5ݳ�'��ց��h�eѷ��V��m[��CC�=�oy���iYj�߫MV�M3�3]lj�8��[���_[�cH|�ƨ��x���]�BJ��*�ԏ���Z��4vM[�
C��yA	�33z��J�ҭ�ф�w���5R>�8�`1g]�yN��j�V����)FNNA��gf�YׇI�������`.A��pEj|���R@���jF�e���]n}d	�"�"��33j�c |� xA9���20���͵|���C��Ԝ�:���(f:žy�M��o�fs�<�e��)�f+Q�m:g��̙����c'(x�έ�5�J���t�(�h���z���)H����,j#�(�@�"t��!£�XEF�&���(��p�S�4~Zw��寭�"�3oS��5������T���%.���v��G};I��Xε"�B�33�^���U �$`˅�CWb��&��%��`�sI#���.�!*��������c�xfF[���`Y�j�kb��XO�$G����j}�=��=�h
����.�BFyV�_��ms@8S[8p�Rš4²j����9m\��e�fq�)eɡB��U��'ybٻ�-�Q�>>���v��۠�aEdFj��t��2�tq��T��`�������3rc=��w]�=��}7iF����rӥ,74��n)"(�ti6���p���Q|P�c�������Ê�r�.!l��8 �Au2.�(0&��=20p*!�����E,?s���-��vK
��FD�b"v����s�^�����e�F���2�k��U�}�E,�7����^�2�t"i;�!��k*� $]7�U��s�v�wP�!�A�΢1�HD0��6��Ϻ�7��i��1�zW�R�m��q�w\g_����78�)�6t�f�x��'���E~�V8&�NZ�r�Zܸ)f��w�bE��}�pއ�f��lWU�ءq�W�=$H��ei��Xs�C�^��NҒF^9�ˏlW|�M��E�Rg9(L�y��Փ��a<px���a7� �JY|�*[��$�:�$��9��Cp�m�V���d������������vh��!	n.����X�r���%��A���w��$Ҋ���^@#���u����J�_���Q���-�"��ރq��}�jxP�E7Gѱ�H�Y`>�*O[�*��=�O���ĝ�ޠv�G;�i�9��`����j*:q�{�ē��	"�B忎-6���6���t�2q*�)�
	���e�/��o[z�05�]��V�K<L�Z��� n����hf �4e�5p$�Y"�l�t���_p8�9�Mb��gwj�$"C����7B�KNAL-��*���ݮ�'R�MN�@�� ��ƿ�D{�%e��|� 髉�q�q�]���G9ぬ!k^>���M��B�E���p#���{Գ-j��{��O��s�B�hnX�{���Uwo�*��RT���4x�w�T���T�l��~kzu�l��3�d����g5�[4�6�&�VT�c��M���#>:�p~�ϒ����d��=51rF,D�F�uE/D�TTE��˷��Yt��I5'� �  &]	��WHձ��n��h?��ıV�"ENSzjg��ycBL��iKE���I�j�z��,����/���>��g�-��IQ�(�FUϦ^+�v[M�O��nbu� o�=��y��"�Z�qrx���[l��=��e�p�KUb%̦����*�Iei�����b2"��k2,����Z�tK쩁~l�1|�������E����]]T�۴j��w��{Z�$p���L�f��fT0�m%�&o,#6l��C�y�q�!�������EC��*��wߛH�6�xτ%{C l$3�vl�1��֜����sT	R3#�>��n���N�_�&�G��7�p�P�a4<���8��ؘ��-�xQoP��#H34"��1E����sgo�쇾ܧ{6G��$펶ot�<��6�����w|QHϩ	r'?ԭ�F%ef���L��6�����9dw6�xR�|�܈_��r6��BC�ͪˡ[=H�-k	lR�?�$(Y��$�p�.Uk
��[D�=y9����L����o]��Ԏ���\)�,rZ�. ��"�����+��V���"��Ss�k�d���u�r[���b?Ԧ@f۪g<5����]XӝX�WՕ���[�ɳ� �M?|�k+r�*%D���.�:�Hj�zV�c�T]�`I�W��T"��@�������7܈ m���jM�#�E2��ƛm�(l�)� �A�uw4�+D �6[Ҝ�[#J�F
����H>��R��N��e!l�խF�3�]�����p���$9ĎЮGyl�)~x���EP�]�`�Ff$-�����������L_1��iD�����ݠ��������m[�u�T��Pu.�;t�gOsg4A�Q�4Ֆ�-����D�s�zŦ��E�씰tE��<i���l�%���1e�j�kj�F�f{Kfrc����}K��o�*	�����ͨ���t����S?$�縕� &��Z����w5�;�V�����_?M)���azRAS�~�M��^N����%���=k����[��ow��y��N]�&��� ]�A�tAt����I���<)�>������SD`�K�����/<
/B�k�a�	��t90h��Õ3`$��5��s��g���ve���~J7�{���t�ǀ����W��@�V�XQq4�[f�%x8�&�D�=Oܔ��NW��;,g�!m(6{�q���ߢ�&H(۫n�4�f�]!J%�D�xH�$ڭ�tR��!�.��{�*��Ŏ�g�#�ʷ9���7�Oj��
�QU�#��OqxM) ,�b�0pV\���$3ڹ�����+��i��G� �{��OP	���
9�6�aE�Qw�^�rX��,��	֎`���<V�D宼T#�3��Az�$= c�H��n����\�3yNw+1�]��_��Q%K�}���l��l���h"��pI���͐���!�h�i���_� 4r�$�o�����N]K[��uo��s6�	��_������=���_���x���/px	˗�N�҆�����rK��(@�X��yG2��e��FM#�C��\әǲ ���8�����v�2�.o,�k���TN�.��Z���7e⤞�^K�Pq(>3���g������T�Ͻ,"��4E�T[�(���e����H�B
����e{�-~�u��8�9N�f���	��f�"xӼ��G�Q��8�n� ˹fM{J[wE�aLA+����[���NUԟ�"N�J��lUp�ܺE�VډS7$��q5�A��ʪ�a�j�kr��4����x�8�=|�0OĲ.LKl����Q��b��CJ�� pT��=�2�3'��|�Vj��P�&��Y��L�ٛj�G��K�8�,9��.�^�O�[��٩��B���l���7߂�<!}؋
�m�z�KE�|��4ŧ\7�ɨD�QMDU��"t+n�St(�r)?��6����q_�Iw^�d��t{�8�W����-Eu��QT^CX�8���ԃQ���Vޅ�o�ѣl���t�1��:1��r�q�=ʹo��V�R����z'��n�U����oTM6��~l�v���5{���`��t�n������8s�[�|�UW얮"o	���=[�왅}�RH5��\=ꥫBEo���y0��9�o�����E8�u	.��Y
��J,�w�!����+�n�EM�6�C@���[�a�B*�`����Q]9MY�~m��h�Y�'W�T+�1�V��_����Nė�!�֫��U%��	e5�W�z���<���{��9�o�hnA�@����v��r�Y]��G���;pN��OT�����$��A%O��p�{��Y׷�طM����7�OR�D���(ظIbb�!���/��{L0(R'�Ԥ	[���8� ��+Ϧ��~7�T�X�\�v� ��zQ���˴VGd���ܨ/nx�ז�K�l���U��vG���!���p���j�ST�v*zuR��M;μd�J8���/��#�!���r��.܃ն���mB����{O,uܪe\/x�#{哿j�H���6��^�޼�:� �R�W����W1gN�[=tDoy�C�}��nOq:�L ����J��9/Tq��ޝ� $��24u�T��Ȫ��g���1J=�����8�&�v�8oNs�X�_�0�B���t��rp�@h�e~Xt��(�w1���E݃�s�z���*�_l%�IS���m��/H��p['�|��<�4��Q4Ȇc�z/�{�P��H�
��zҺ�5b�t&�� ��Ӕ�C���)�|�$�����#4��cK���������z\I���z�|=Gq�	� ��7i�#�m\��?[�9��g;���_š��`F���Q�N�A�[�@?���C�cz�d�ػ&�/���ѱcY����C�鳮o�j&�[��)<=%B�p,K�o�9��I^<J����.m�
���!3wU��~�n���WR=��o�C�-��l� 8sӕs�Ah��)�mC'�5j|l	3����+�Y/*�fa]|���[��1�{1�n����I��s@8�E�����C���.��z��E�A�U�T_+@g��)�t���r:�85��������* ��yU>���E�6uyV���|k��A3atc?��D���o�W3I��=Kb��~r[��Ab߻�[JƀY/�#����QM��#C���D�U�b�t�0�R��N�^w��-�ǽ����zBd�b Kv�$�;�4B<���s�U5W9�$c���5}�W3�6z!$�{��7X�oc?�~_0��|wUu���������@{�=���T�x]a�N�������vd��r�m�_l���x�Ku=w���4��|��!T��Ԁ��b�n��PQos���u�u�h���{[��_�(�0R��H4L�jv���V�����0� ���}���8'�F�(z�D|��Y��r��[5u�!3�>ﯫz[/����.OS�pO4)�}�8�O4r�������:��7����������wU���1�%{�\�w7�4
3:��N��w�L@Ma
۶�λE��`m���rQ�f7��z�HU�P�c���9�<���*���x�gbet��9K'Rn_��&.ҧ9P������q]g��C�R��pԢ�?X]��[j�}������/n��6}m}0����t�ػ��5�h8�*��MK���r�� Q�˦,6'�P�.sl$6�e]k"~t1!��B���h�M��ҹ/�?��������su      �      x������ � �      �   |   x�%�K�0Eѱ�
6 "�?t=�$�Nf�D��^�@Q�QzB�b�[�+��edq�z�!+_)�\�9�(!#'��x�AK���'�45d~ѧ�]9���[
|W!�&"�W�����>#�      �   �  x��R�n�1��=E_��HQ?��@��@ө(`P�dpl���RdHХ!R�;)R�Ha�ԡ�cT"��B�Ki���_�����i����G���U��P���@���Z)Xfi.,�S���B�ء�IF���$9�Rxt����s3�h*��@I�tk"�)O��-E��k����V��H�hyt}������Ӈ{�nzt�j1p�^���*`��H��-�
V��p:ff��0�%oV��+��g����u�����_	��_��m�ysi�I� >(�s����9(��m�5Me�b ?��T�uQ��h��Tz�b�փ��?�>_l.�����}RR��$s=2�Q�0��w��m��S��kH��v˹��h��ې�P�4p���,����3      �   �   x���;�1�z|
� 	6l�HK�D��'8#����϶s��(�YTV�Jl��o�<H��G֊'.H�NV|��4w�����X�U�~�x��i�(��$}9��T�z���DZ�)�S�J�9p� ��#WQ<� ^��{�RۿA��!�nX���~^n}GΞ_v>�}ʁ�2O�H������Sŋ�u��I�����
 �u��Z      �   �   x����u@!D��9"_{�Q�/!��[����m�	$8�3"XA}�In<FKb��dν`�eX��X����rB����;"�ݵ�:+�6?g�э���}u{j���e�B���I�^]�ʰ�
0�$.o�ԝ�.�n�oD.""�EF��=�O��.o8���H>ږ"[o�d`�w��y���FV7���
������ U�x)      �   F  x��X�v�8]�_����۱�̎�`��2��Õ�33��k3��?�/���%%�S��r$� p�6�6�6�%j�ņ`;W5k���BUw�>ⷡ�]���֤6�m���Sy����|bq�b��ʤ���r�D�;�e�Q��+-y% ��t�ƅS�CP՚���˰�^�`C��\`{��=�l:�q5Uć�<]�8DNa�-Uj�:(�ִ�������s�������I�@������5�:�P�6oR�Ƌ����d�l�v���b���ص�8d�ʶ6��5��m|��H���?G�&{��7V4�4Q�yP��;m��'�)���s%��3��#�h�lY#^�lT�/�P���M©kr�%�F�v��v����1G3���G���x��Н2�ӐJ(�>Nz{�{�օ�S��LU�AyF�VG�L�+�l� ��OB�^�ma9Ӈ/��$�w�P�Y��"�LO�ꎈ�衵�Y��%���@|0H��5��.�w����2��:���R�ӱ�|�
��� ����Z7���ٸ{| ��@:���9���C�����`�v8�ܛ_��Y��(,���������q.!�9��Km~K���} �����յA�zLF>4Œ��0��X�}o9F��A�uўl=�S��f�؀�j��%���_G������%��q�ݪ��=yc�>x�5Ο1=�T����aU�W۝ _��� ��\��2��̕EV۽��󘃲^�[o�0ҴL������8ܓ��5��!V��=��5'm�=���W̾L��!������JiLAO3�sS��&�35iy1���s�+$�2��U�u�b�Nū��;U�0Cl���w�^�K��Z�9�xV�(��1��"��E�=���ګ{ǔ2�=I�4��j�ly_�D}Z�Bn�C՘S	�&�Y�t��=�5��;�<=^s����	"��FO�#��nPl�Hc�D=�7��T,����j�5��Eڢ�L���w��T�J���3'q�m��;�@��O��E���D}j�Y/Y�,+�@9P����Ȃ���������a[�nly�d�j��l��{Nf-i`Y�4c�#q��aW���݈E\0���$x���И��Q�^�;�PI�I&K#/Eĺ�ݠb_T����	|�X'ǖ��J�v���8Y�T��xE&����0��_n:M�1h�u�3������Y�ƐfM�k)��^�����M?B�=�����(�B�"����a�H��%)���"ǝ���[�T��Y���'�cX�V��:�c���d���O'�@-�pr�����'k۩�����|�Mq1�b�^cZ��GU�壘�P��{�
�����6�ץ+�ߐX�!k�ΰ�-�ѩ�R�t����(�9l^�9-���?p��9-�D*��'��b6�vy��U�v����)�Us{�3����#<�]�Z�?=�,�{;�:�l�vˌ�jbF�P:�Cܶ�0G/����qw��Ԕ�FԘ��'t��|�i(?�<�}1)��(,h\sV�GuL�:�Q�X��#�*o�|N�N.���\D
�k�l�;^�<W�5Z
 
�(8p��������&v~r��X���l����hzR2�����KW����D�0�Y��ß&�T�����/�<�W"Ǹ����8� ]^��Hl�PP���.�p��s������+/�� ���EK������9�ֳ��}|`%�"q]����(i��5��,��R��7��"��\{��CM&f9�N<BA��b��7�>�2{ş
4������x���u��lVO���ӿ��w�Ͼ%�c������.IY��OEo5�y�l����~_�Vc���      �      x��\Ks�ȑ>�~E]��x%-��}bS�n:$RKR
{c/	I�@�=>��?ao>�n>8b���_��e@��%M;<�fefUee�h����4�o�Q��t�~���N�i��g�}d��Ƒ��e���_⯙��A�"A8�*�zz�~L�x�����F��U  �O��;�k՟��u��7]먩�IpD^�4��"����;o����؛>x��D��h)s'~�֏������rܣ��-�ې�����|3�E��v��0\?�'��b��%�#V���E��E������3;#��oo�T7N
�a��3f�Y�٤^$�]��=�8G���o��:��`\���a�,�oꐆ�7]��@����j�1�8��,&~R�\���l���N.9��|5ӓ$��"/�i<���T�ZO����`<fȶ�.�u9��{�i����U���������i���G�d�4��O��] ���M8b[�������i��7Lˊ�;�(0��@���,��m"Ҏ-��IxRf&���Eq4%�-�E�G�"x�m��,�����,$�"=������W=�n�%c66�O��;�Y�;0@7I��;�;�i�Me��-���Y��fz�1	�_�IΉ9�~�*�=��t+�GG�.��ӕ1W�� ]�L{sL4f�S����8��t=�4]?��SS�K���|���=}5��w{��q\$��K�,;��3Kaj�{�(I.���޻��K��ْ��UW]�i��l�'R�?���;�	� q}?d���@}B��Bj�R`�:pt �8��:m���x|�z��A���,�H�5,>�̡�xƂ)�:r-��Q'�.�b����`�E"���Α����4�HGu6�ƉфĢ���RHHnC�w� ^�֑ib IT lH�$U�rNtx��3u��t��3�1ԁ��1K�Y�SF��m�O��'46P�R�46��ߥ�	�^{����kl����^˓�w8[�����@aA78w���R�_h~Fw���Ɍd����ii=��$ӣ�{�t	s�H�ȣ)�)�>�������O���c��j�A�d�3�(��[���D`�V~��*?'����JN�yIU��x�c���!� �%	�����*a���� �{NJO����a���2�q�4jʓ�K����&��E,!��,!���YBH�*K�&��>�����_�� y���Q�M<�o�]�w��^��ږ�I���՘;o!�����81P�4�qVL�Kf����F3vD������4}�e���B��oE~pY]2�׿�E� �u��� ����e�Ư�e�f�ˠ/�����B�Wc6_i�F��_�c5����?e�w�)`_��|�h�@kՔ,�f�ϰ�n�(C����  X�c�9jٯ�H���"��b;CH�7�Bo�{�/��m��IE!�|҆���C���kG���'�"����y�<ȣ����cȅ�cg_w���G:�?{wl������7�nOI���Hą�;Fh�OqDW6-�Bٔ.�̓�m����lvuE��]Sf��G����j��:o�hC�|�����@�_�n�.H�Mo�;��A<u&���X��Gm[��mg"@z0���u���|�ܩ��Yx����F�/��`�L�Uo/k0aX�Otqѻ�/O����u�2L�+�d��^*�@j�w���ȗ�Li@�j/�7���-��U�E�R�ܴ�y�-��e��(��V�n%[�P�i�/�IK�o��X����&���m?\G�N������<����$U��&��#���"MLr�7�x�4��쎘 � ��x����4�X�t�~�/��?%�.&�_�Q�k��h��W�"�}}'���������!� 7c��Y�(����h��%J�G�5�yڔXe�2����s��E�-̮L��;��0�R`� �^S��)��B���xǑ��e���ʤ�=�/�n^2c^�ɘ�_x+�C�o8(d��흶!�ح�,���a�3DD^�1�9���"���HG���)��p���/���i��=�;8&�|>j��"�ݥqD�ڮY�S�fהTg۱����vq�P�*\P�B��V4��3�y6�����1��MV��n��|�`��s�f"ozx=�7�ɨ�ǝ�Ψ�#y"�<����u��M|#��FM���Έ4���R��Q�a����
���I�z6ML@v��0�Nk��W��>�Q��s^l4��>���'�o�4!��_�sY� ��jL��j���-�A�}/�!��A:��c����:���l+�ҽ��~������'.hr���WN�ڬ(�@�Mz�A�Qv���˶�����y��n��b�Hp���6]�6QO�ҙб���dD*Yh6T���%m�����HS�"6)��m��J�Q�����7ƋK�osŕ�)��D�P�Ah��m��{��]�S�i<�҆�	�+]��=�!�kV���؜ܪ���麴3!/_6�]>�(�)\q�>�*�$M5!m�0���ɓ8`O���g0k	�p�qS��A��ӟ	��r~ȕrK�wo�i��2�d7ao�����~��@������{�� ��U ���2C��k�S�}Mu
x/���㽝�dyK�#	�\�E��B�Q�+����d� w��$��{E��Q2�q�4	TX5Ζ�U�Aq��'pf�\P��%�d�p+�EX.cyA*<�_�m��Z���4��I`�K�3V{��%��>m���P��,�9i�&��zK���y9�� ڨ�k��c?ZŁ.���#����&G����Q#���8��ҙe^DD�|��82Ge N��+����@�9w��B`����쑼��f� ����z�՚\&�f�j���ȁRrk�q'��;	���I��N����D�͚�47����/D $eC��@��p%P��u��ph��?z�
�8���'+�蓮�Nh�j�7��-n׏�>�\�ʾ`���
��+t���"C�F^�~Q]�Q�;��/.i3R�-u��6��.��� ��CSE�US7�2���\G$R�V�qt�:��9�>���y9T��p�<r[KœJ������U�W�QJw��KQ'7�t_��b��Sz����ge�!�H5^�qb,2^��I����2��6Y��3m)�p�*��#��~y�X�������m���Y����V�����&}�fw`����i�I�n6��d&~�p��Q0�!Mjm� △=tB��0�����������n�<1�P�+�1ǏHdM��>�/{��!v�xl�)D�v�0���+	�
Zk���A ��\���W��jar������r/���n5�p�PRN���j�hS";�N���\��*eM�)1����ꢢ�EE� ���,҄R�a�L�h�Kn3����^�`)��1�D���i��t�L ���x��ī�0��G�Pc�J���'����i�����7�<Ifb�+�&l�����!67ID4@����Y�[@!���ON��,2"��/28��_�>M��k"	)G�<]�ՙ�u�B�r�K�gC$��WR�71�8*�j���%e����wSLc�Xt�I>���.M=ʐI���bv�ǒ	[5���vR��p�E�����Y_t
]�)t��jkt���9��đh�$H�K���7?S��ft�#N&�C�m�-ipׄ�	�(P�$����.Xu�按;�7K��Y��Y|7�1�	`
#.�t��rn��Xσ�
=_T�e�:TG��4�"B�������q����+
R��΢U��Kn��2�F��u��?�'��!���>���5���5�xz�V�j2�Ʉ$Aj*��bk����#�����%�\c}��U�&[���7�SJ!�әB��X�~�+K���-���)��!��t���t߱�c��N2tܓ�Ƶ;c���K�	�,ӡL���]���3ѻ]# �@�r����N��ҳR�Ro�5���(����jāa"EF�m�T�]f�� ���.{��w_tK�*�7�d�~Td_��̥)�_� �  ��:c�LN��ϩ��� �k���N}�T7G}eGGU�s�gZs��_Ҧ�*�s�Mw�Ļ����8+�k�k_BX�������fD4S ��n*��s&M��N����^W�4�I����j�(�tN�h|�*�91��e �f H>V"��ޱD!�(+��:�H�	�� :RӲc�jh6�Ds��dΟ���Lz��ހ��F��E�����G��Ug�鋎����]n�P61�u���#��q+���^��;�8���ĳ��.�:�3���u��_Bi/�(*���.�d�-@YP���y����MO��/�SL�p&Z�,��3�.��o5����%`�T8 a������1�p0��l�dx=ѝk}1|Di�;LFË���׷]ݙN3���t(���r��x7�tZfksQ�$��})\�E��sVq��~&�����)��'�=;�����cy�9��绑v��7n҂(^\��R�ߔ��Zj�Hf�w5��z}C���q���#�T86�l{PڨN��Q��;-�e��si��7�OLG�Q�|�`�9ɻUqRɉ�@��M&������/wQ��WNU��T�g�ǡ�g��g��u����&��4
Iդ4�}n��� W|���`<���鼧G�.i�1�������%>aEIs��j�K�2y�݆�i�͝i:Hē-ew���ٙ4�c�YP	$W�Rq3K�l�y���3�͎F>�����y�3���_���r#�f��eK�iX�u(�\����^�]#'���u˰�)i�ї]2��)�	b�ԟ�c+:Y���.ٽ>N��m�s7t�uwV	.,�M�G�I��K���ÒM4Pd��L|v����\��N��+���N��z�%�|jt������;��8ß�D��=�{&�D�.2��&��%RZ�1:���\$��JFX5��M�� �;ʓ�2MV���I��p`�+�� y��o�x�徴�X���C|���q�%��5H�6������[�؉��T@{VA �W�n��2�&Z˽Q�^"����K�m��<�P0Km�'W���l^5�qj���n?��B��4�B`�m��,��f���4�t=��MD@.�0����V�}&��17��/�a��M� �����E	S0 �t�a�6�7�H�"��\W�/�+��q�5{u�Ϗ;{�]�;�6^rw>�/��j����hc��������%͢xm�6���V�W�j%^^�1k�xNbj,)$���U�~>H&�j�^ي�����_܊,�{;�7����xK7��OG�����(=��U�Ņ�K�_�,�2H�

����ʣ�~4~�����C9>|���1Fkk��GBQ��s���~�F�>�r*N7�f[�X"��8a�9 ���������\f�}� �ϣy�è\�D�3ek��`w6�+û�GM��h�(�!�_����-��ɞ�lo����k��Z�Z���b"U�Z۴��rI%/x�o��Tā���5����T"�����[x��&6h��J]�P����9ir���P����{��VM]l�[5$4��,w�|a�@�Z	���4��>��i,J��cY�`�%{��B�OB�yRb��HZp�q��� ��0�hW?U����_�q�I�%i�F�Փ�(�� �fC����6=<����KX�EWg�\�K,����{��	զ�c��/�Q�,���ց�o�ƞy�z��K��SV�P�x֋���_�1�7T���u�)�c}���̟T�n̎�cլv�������1�#ڤ��͟�m7���<�q�0���B����6�׶�Ǩp�[o��^�%Й�3����/RJ�ޢq�`������h�J� O>\W� -M*����D�=���0�WC0�?E?�p�D���.{L'�ߓ����Bn�n��,\�H����\��{	b�*t�Ee��4��B8����f^���I1�F�=����ӫQ�߉��W��C~�qm��G;�����]�g�bx��Q��uq,����C�9���(�n�+��.�2doF�BZ��L��>@� Ր܍��IM�6�ڻ��{1�M�����D�ꮔe�%�N٩��M���ԭ�N�☔v [����5�5��`��YQ�@Kٚ ��)id�e|��7Ɔ��]��;�9��� &.���x���}h�N��{���z��r�*�������t������M���O��x#c�k)W�Z݊�����Q�V�?#�1g�톞�Ѩ�sUv���q�R
�EP�E|/Mr�0��b�V����e�_;^%A4|}{�Qr=�������#�EZqD�dȥ!{3$2&Cur6C�w�����1q�e�IC��d"�zX���<�C�����'P^i���|��g�x�z��g�7x�?Pnum{���)��O5	r���|�c�֋#`��5����JU�ݢ�_�񛍭�����2C��\rZ��hE~dG����eȣKc̥� ��V�F�"9�m_&)dXR�)���lViC����-M���R�M�B''ՅE�yʡڿR4�-� �[�~T��9˞��@<�͓B#�'�x��	���!
Z��%��t����4V�OC�Rd���'�DKJ�7�GY�
ɼ����ɤ��!?�����=��5K��=/3e�U���LV�N��L���<�qP1�G�$��p_sd�{��5�����7��(����{#����H3t�xL]�H^͘!J��ʐ'��u���а��C�7��y�_��:,�� �`��r��o�Gf�`�1B��>~�M#p�,5i/Ljr� 2Wݣ ���>�yO �9����E�Vm�`VI��؆n� 'a����Z�	��'bw��"�}�7��:!8{J'hD�7i�#�&�T���?:Z� ".�sw��u�h�����N,��d'�����������      �   �   x����mD1cm/\��^��:�/��k8�_Jb0�Tڛy����
k�-��i"'5�w���MӒ���o��r�x��0�Ԭ��J���F�~ %���b
��l�TI�g���0�/B�g��ِ.�,�H�O���WxL�ʃ�~>�o�e�b���LPs3D��}bFzS���g�~د�
D��ڦ�'Hb�����HB�o������]�N�Lr� ���4�z�^�ok�jN      �   �   x�E��
�0@��+2�ER�s�:�\jz�@rSn[�?�ߑ3!��s��5��q�p��;����J�g�=���1&�.���6��pX��l�J7�&�Ǣ�ԣy�(��W�UY9���̮�1���h@tއ�u6~	�c�9�]�<      �      x���Ir$9���?�b-�����	���߃�;#�pVe�dF8�0@��j4y�4k�z��
����.�K��dg�����_4�ײ�5��W�k\͙xu_�4����1�2��ǿ}YSRts]��v��_��Gߣ�bK���ۙ��W�y\��z��������W�,m�e�e�Y��|��a�^�j+��[3�,l�,�]ɦ�\u'v�3]͚q��W�}v]/^�6�Z�L�*K7߯���Jl)۾�
��Mc9����WX+�%5]ivo�se{/m���-owYc
��z���tl���`�RC�ӻkLׯ9�6w�v5&����,�L�ӵv�<=OX�[�φ{�qO�Y:�je�1�ᬻ��q�Ze���#/-�t ��K�Mo|[)�
��[��2cy����o����N\�-��B��+u�ֶcF����5�ׁ�6�%�:g��W�q��rڭ�K�=C2�\<���(����Z>�fò��{��K��c.m\�N�Ϗ�v��g�,�O��}��]���W�\��&���p�>�6��]68�³_��}�`�3B��T�k[��h�����B��c�L8����S&}!`���FQV��F%B�]#?��
�X��q�]�����*~�<�c��ebd��̫t�C��(~�0��n�X:�L������RRne�5m����˜ք�6+׸+��"�p�y��-Kb�K�ɂa�p��|M�ݒ�6%�s���𩤫�Y�f���귙!�^cց�����p¡F>a<K��k��$7��h�O5�R���@��v�*�w��B4��\U�K^�YQ������0[��S�QK ��2��/�Ջ����.��i�Vo|��~�k��Ys �؋�~����tyI�R��V�-����/�9�e[(I�
���WcH#d�S�.΍/,M`6.���M�k�"�t$O�Zu��-��O\���qy�fP���ȠATwB;��5�]�b���D	�e�t�DT昢0$��u�uYCc-M�U�)�0�_:�dms���C�r�6s_��]|�Ew���2^�f����m���Y:�v �>����>�4����F���+B|H�Bqd�΍�ly�3� 4������n���f��`����LnZ��Q�+�EΚB��!�d��Cf��Ƴ�n���̅�1.�^���dOB��������ۊ.�:y�zn�����L#�A:>ט��ga�]����!��u$!�Z	;^�=r[<�cd�j嶣!&A�ڞ��,��V:u�O�BK ���W1)�f,m�nù��́��A&�n�~��!��>{':�"�@V�diO�K�Y�k�V�H�Z�Q�9$����0����0�	��Ǯ%lR�;� �ː�̕]?I�N��%�rH�S�����A���ABO�ݒ ��H�-!���g��(�On�%�ݓ�W�ү�fl�۞�|��ݻ&����8ĞE��#���3z�Lmh��>Y�s%�G�B5����h�Y:�5���G��|�Ƀ:�j
�?��n�  ��(4x��	���z\n=K��ҽ���s��HZ�,���!��V\���.
��vo�0��"ߕG$�ty�L�7�}��X:��y����l�������	����^o���s}��~�E�d�ĵ!�.Q3o@oF��	5AcA���e$�1Z2����u �E`��[(g�wH=��J�yi�܈��C�#�.�Z�b�h����~��I���/�fҚCH�I �W�[�$�@��<#9i9�u���D��LG��s��>���-b	=Xēk���cF�-�R(�8�S�C�o�#��Z��r�B �-���b~��|~�1/W��bc�����f{���5{�����?�h��,i�";�n�XH�R��]GN���o�&T*[���5�x�n�d`�9�? 0�!{Z�?��Uʔ�Lj�ʩ
#r (Z�o5:k�z��ݻ����S�D�|gQ�#e�C#$'��#k.�9��Q$��tmT7�J��,m_b)Q#�w�F@L�IUH��w3��u�?w?���1�4t�99�������eE6��l��$֫�ia
��NxM����4W�T�`Ţ�nr+�gi�J��L�Ñ���ᬻHa�&�c:^ƣ�q3��N�y$��ƚ#!�j��t}�z�� 3tH��+���=Q�<u�C*�1���Iy3�M}��6w����Ugyt�{G�B�v���/�X�x�`7�i���\��l�������p���ߒdR
��`n{ڵy�n̐cN��M���p��f�F���
܃!�e_�q1H��=&�n�1<�F"�f�iՒ�Ă&�R�j��\�\ρ�׮��	[uᡈ����S/Rh�t��u���$�u%d{v(� ����0�+ˁf�I�j|����������:��@*��Pp(���c��3��s�&t��]�K`l�/�6dYi �8�'E��Ll��H#��oAW�lͣ���� 	a�y8�Z�D�|@�����5�C@�e y�T<N&xɌgi��o�xwaH\(f�h�R�ʸq0D!�a�s�G�m�N��Q�m�#��<�:C�:�&�IT���7�^��c���X�bi�T�'��I��|g�s ~�=��\#�KfE4%w�q�+����{H� 9���$X��2�]�W��J���Jс��w�������Y'F'Q��B�؈K�h���w\���Khu\�$���0�����
���݉!=�msAs�؎�s�h�
�~?���A�L2�0�҉���E�b�ɚ�����ϥ�x-��EN�]*��Kfn�s͎c8�4]U��T%��T�:S[v�{|ǳ�
9/��%1X�s��P��4j}\��h�2��l��|�P��v��A����r0/�B(��F�� e���VӁ���W�r��f&,0k�g���ën� ZO1af`��6Ԥ�� =�IA�^�$�O�8f�����.09�=�8?�-'���M$���@*��h�'�$�0|�$��it}���v%����B�ħԂ�B;�4�mv90�g�S<ɊB��]������g|�~s#Z���x�I!�."�0�nW�{�r-���*$s�|lK�.x�?��~�yU�z?E�"�J���\���}����oK�N��2�k��� �_K�����V�$�E���ݚRX����;p�����jU�r��(��>������m�%9	���"�c���FԱ�_��cz��	��e��Cy/m�*|�/P���!- �fsL��Fh��j~A�I׈*Qi) NO���"4sS��k��1w����$n#��V6Ü���ǂs� �Am�'B��_sQK�W/�A�H���$�u ��fѪ�m(9��;����y�?���5���`��J����N E;g]!G�̃����f��q�C�?3���Í��"���`�c"�#�˴��'$�*B�d#_�s�t|��;Bx`�ilD����-�:�a�[�@�iAv �7�e�����~/���EW

��hi6����L��ʀe��������*�LH��b���t�hr%^���1t����U	����XV�$D�Ն�A:�V�˨]�s�bɉ?���b"8tc�MʹT��x����	ULTM$�n������K�
-�76Ǫ2� >ΖO���+dO��dyT�<��1�Z����Ҩ/ÆbQ�ـ��dpRղ ��L�,!�V��A5M���cVtt�u�u�'Ĳ���3�J �i"uR�����T����c�@>Q���:ky���Pi@�J!*p�D"c)��6����J!�[y؎�i��k�$zW!��1HM`�[C�ɽ�0�������� 8.�W_��u��E�:�
�c�~6��c#LyW�0�q "��^���X��92d6��5���m��?�
�0Yf�w�WN\0yO��p�7D�-T���#/�Io�{/��u��u��}=K��B�,����As�Բo���,���A���,���cIU�uВo�    �V�=�Өi�ř*ky����\�:-{_���t��ĉ"��FI?�ѬŌ)9'�`1�v��Tg(Þ陂K�K3�<��=���1
�rW��H�Z��&>p]���ȢV�A(�T\��vȩ���D{5�zH��#��C�^Eu�ti%ݓ
��B��n �f��u�S
GUH8�S���9j�@�㴍K��,�B��ݺz�^p��g~X�`�UEszm��F8��K Ǒ8���]�� �U� �8��f������'wFQ�H�C�sF�\��,��#_�n��wjK"W]J����������.;"[pz@��)�Y�o�h<:�"���WXۈd=��� �"}Wq^��c����]&$%fEBXh�-���>�� �W���'�� �l�(�7�������j�O9	��� L2�O�g�;�n������hei8��y��U�$,��ɂz
Aܥ���aۓ�4�F�k�e��/ͧ6D�����9�|՞�K����d'ŁLџzx+a����;������Kܸ�@��$+r�e���`��)!��"K#��
Ӫ��̀F�y0b^و9r6I���⦼�0	�E��ӑ���'�+���~V��V��2�T��2	��F�y�N���|9��PZ������9k���C�j���&e�3*'��i�����<M�C��U/��%F� �{��h�����$C2��^Ujp�{լ�]1C�%��UB���4�H;'��.����T�g�3r275�T�3� �=Uh������95��D�Wѫ�U�"��@"<�-���.(y��o����w�>X��'t >h�* ���=�����@B����!nd�-�X�=ZY��CRTu���j:e��U�q��G�O��9������x'�� �T��0B#Qӹ�Uk ��� F���1	),$E^�Y�=�C\$S��<O>hje�4̖�]=�A_f~����^�{�\S�3�\Z��&"o�͓�S�z�Y����^�n=1IR�\T���Q-���@��Z���J�_�� ���P��,��Y��Y�����;C�X6� �Ձ�I=���Y�@�
��j6jz��$�G��@L@9�gU	��/L2�Vt�ʕ���v=�o�B/J��b��3�� ��`^����|�|��`�B������&�42=qA("��Գ*�)
ID`#o7:�Ks�h�U�H�����u]�;�~ʵĊz�DBT[>��w�6�� o՗QM��V`�Tz���K�Q�iJ��Pe�e~�������Q�$�' �2w�T��Ty1�ڔ~.�9�q[Fig%�*�g�uy�
R��f����*����0x4��+��"��Ņc��M�5j&��#����ը�����+ ���K^������ѷDU��QA��6v_�+�yd��@U�����.�Ę��QA��|���fq��r�,n�i�������<�Nc�Z���Z��������hL��{鵋Jk0�[*�v�́�Mi�֙ ��A0����4P��2#A�,p�E��ρ4��hX%zP��;5Z
VJl��?�^���b;:���պpǖn�OP+"Щ���XlU�� ���1�;��V5v���>��Zy#�~��D���	���$�,�hQ��Q��%��K�;���I��>�k���*Ic��(�1#�[�'\M����`�:lgiY;X�l�O�k�dyy]��-Pz`�֋&��U���qS�3���+�:K#�q�ԬL�gPJ8���0Q~���!Fm�j
5�1wލ�`������Mg�鰇�Э�3d����;�1�t�:3� I��N�
rs��"�u	Ŭ��ѿ�)U�*,jdc3ǉ����5�ڞF�CmG����Ws�;�4ھ;w�`H�w�ٶU�w!�ΤE���E�8��>�Y�t��AՒMv�tQQ)N���Fe��V�f��nq�m����q@������y�*	y������x%"VF��n_Κ��ܹ���2�Ҧǩ	"3�&\}�G%5=L��T�&;�v�>"R�ρ�s����q���n�e�=O%WT.TAmt����Hu��>��
�LI��JF������z&�\?jv���1�_�lq�iVJD\Χi�h�v*��^P��[&5OY�x������ąS�TS��?�w&-0����~�6&�UG\�AGi���?�l�c��� �r̤Xd��h���F���1{�q��*�4;�Z��Ͼ0�1�:ҧm��+���2��?��T'1�u0�/h`��t�N�81
�p����r�+��m�8,
���^�P��a����߷{H�{��Ud��t"��2 �����Hߠ���"�E����܅䇏�j����U��Ik�΃C���m0�k�8{a�9�I=,a�/�%��X�1l�6�M�������,����O����B2��k�	,G��q�u2X��B�07�5E�s�hQ������a�����59���F��Y��Kٸ�ӝC4�C�J5��Vi��
3^�T�r��V��GK���Ĉ�U��>��0�5�d9�u��sA؛x8Yv)����ߚϼΚ�.��h�M@�QHF��g ۷����jWS�$��> ��E�?	���]�!��CՎ"�jm4�<rU.y��M�'x>� PHx���"��o��Փrl8g���9n�%s8���I�~���g�K�`f�|�ݶ_��45��ᾍ<M3��\t;��I �PƟ��u?	��p����Sv���Q�o������2��g����[���Px�T���'��C!j�8Mm	�E�T�'� �����q�qiN#"�fq&Gv�D$TW�����l C�C�`N@:Jdd���QOP�w-��]5)�6���{V;���v��`?�*�^.����`M�=]��8�)� �q��z���J$����흶q1�S�Q`q��J8.�djF1/}�5ʧl��N0�o|��͸m�l����d6��AwQ��Q��;VsF��k����e�����kԛ|�f�(ID�3�h>�����q�{U[SKN�6�y�]&�	8{:Ґ2Bu;"G��j����1��[]?�Q��|j&)��Wq�H/��z]������m>1G��8�Y%D�j��)Ƶ�E�U��`s������h���n���U4]�5c�5����q�!��K�1D/jxDT�¿5	n[�'�O���avot�Q%q-ܒ�͔�}>�@�m�)P�tȖ�zEE��e�$�G3�Vx�@N�%A�̜I�	�o΄�G3�>r�z3�ؘ��U_�8����#'�&����2ꏐ����SMC�����Y��"O�&g��\!P��K�o��gi�#�UV�o�+띻qY�n���:d���	�X�󱤊�!�@��������W<\㿋�m�ߪ#�Pa����zi�Ǩ�]`glTא��������6q]�g�	_(e����饖��.�ݟ6ݍ|�����Ы��+%�Ee�{S�?�g��`�V�T�(ƮYz�@�̍�P��yHz-����"���F�^3f7F�֫�h��K��,ؒ7�c>j�i�G��$������tt`|s�oŝ}بz���^À>Pl�@TbU�(��F�� #�W'	3��h�3��4!C��l�U�
/�*�"���Y��k(ѳ#�_Z��Fՙ�{�8ooL�H�e-uE4������tUY�醐�$!���k���n��!���N��� �[^��AL�{��-M�I�k �(F5WewNA/Q��M�i��8c��l>�N�O�t	���+!����������N�������@���`�g�5�6wz�%8�S��������q��g�5�RO�OT���N%D����k��=D��.�����}���&�RՌYV�֥�]Ζ�{͟���C��\�=����"��nu���q���K=eTd�K|CEZ�@XF/��X�V��u�ޅ���,ʫ�5c��8`��r�ݣnaFfv5�gћ�U6�T!\��4���w�$�@p����1�-�We�P~�t�>oT� �  ����ygN�Pd87	:���U��~��#iQ�t��<֣�$K��`��W�*������.Kʗh�;�n�8��y��~��H���5���>*�L�;���AK��o�����/C0YڢZ	��.�.�=u}oǣ��p���m|���j��^6�?4s��{���k���b��<eI���~�;�s�t�U{�~�\�V��4];+�7ת�-�����Κ���4O�N��c��4J�F}6����e�^sb��lԈ�k�6��*>����A�4@��4��~YA��ƲQ��:٨��]��_S�g����:���Y�iŴ����no��;�!�(�e�u�To����1��-���bd�O�B��Y�a:���^�ܻv�n��\�z=���z`���H���k���Sxu��]A�{L�,�L��!�hRu���3B�./^����$CK7B fM�m�W'���`�!sn�8�>K�W\�=Z�8O����_T�*8t����Y�ۑ�#�lH��'ȇ�tzKz�W�F] )�����4ʙ%�����ϻ���`���y�A���)��>�f�����q�X���x�S/o�2[OS�4��W�L��6=y��eU��s���n�Տ�zEM�3��Y�@mBY�D�����!=C�*w�]��Ad���ௐ�����V&T`:�T���\��W鵄��ح3�W�F�U�Q�p����r�O5 0c:��yˇ��GA�S�7+�F��T��&����Ջ_z�I؋l�)�bϻ�8ƻ����ðja5$xȲ$`�j�rx���~M�����AIo�f�T,�%�����j��8O���S��BĀ�K�5��]�Uu�~��4��M�;A���h _�n�xH�+!��Q�y/Y5u�m0*6��6����S�7<C@�;��s��u|�ɟچZ��$��*H#&hw���R���z�YԄ&���d�ĀY��L�^j!ѭ���x^Y���&M�a~��n<��kܵ�����&]FW�_�='�<�����!�I�t~C���-����Ҽ�ѺW�T�a�/�/*���*pD��k�����4)3���﷓�`�z�b�;̂AP���{%�|z.OP�.���GT�9�׫8�.Ƒ2�G�+A��4B��1�w(��ݯ�\#��"����c��Hl+��UY�{���w55���Z�k�_'tI���ʂ����������a�      �      x�5�Ir�6E��]��<�%��?B�W;��ı� ���5��n��\>w�}q+�y|Y>�an췕p]��=��:e������k�#��ZJn��E=ן����ew3΋)��f-��Y���M���!�7R�6���z��WYSX���K9���y�n�na��f���E~�ti����'os8y���>�sъ<)^w�Y���v�&�_ϣ\.�ǭu�H����>�JL���"n�'���V��>%4�C�ޱ�z�s����,�]VZ[;oc*��Yx�\����w��}ͻ����v:k��`�\�#�x���ްy�+�W�<�G�n����gR��tB�_*.�}]o�u���N/�Z��K�;��2�ύ�YX�m��S�4��SK�����}�����i���g�y���z���{y��������-�=�ڊ�;�1��T���ݸ�M`��ŧZ��h���z݃��3w��2xnTfn��������GRER#��FdM��ݚw)]68禈Wb��mL3�x9�������p��qo��Қ1�b�)��V�{�Γ;����ۗ8�^���R'�1Rewm0P��Gx�ڞO��'��ȼ�ɧ��K5ܼ��>ޜy���P�A9~y1�ɍ�.���|��2siD�e���=�t�(F���0��@�L�������ʞ��s�3�4Ꙥ�+_į��bw���/�9�`�PH��T����E��n)�Ț�v�;��N��X�+ӽ�_C^��gv���xR'U�;�9��sA�p��a��$e��m��M���QW)���2���F�KV�]���5�j,ͦv#u]�c�J��o �q�R�d��P���t����STڋ'�lK�>O�(���&�����X���g[F%�9W����3YY����l>+��+U�����d�f���\��j�	�'��T��r��f��;���c���p;��=�MH�������r�S�.�Pf|������a�� �S8]؇"xo��u�%KF Zn�t\9Dk�`I��n%3#��+�h�ED�Z�&��5B�"UM���>�q�
a�z�>��Oy	h����t��Zky��b��f+�w)dQ^�d�5�m<xP��zO��U���vIn����;;�Wn1���kT�N'}CcG���no
���=`�m8���pC/�i�X�����X!��*1�" 9N�2���^���H�]=�o� �,������LB�a�wd�8l�K����w<�E`A����r@�����d����v��2�k�Z5��`R�d��	�7BT�Ϟ�j�ń{iTj#3���� �^ b�<��WVpduB5@,�	ҫP}�,J�x�x; ��'����c%`~�4��OI�8� �d�I_%M9,�'>p<�8�tOl���R���C PS��R���Kd�(���!)Zz/���1�
tE�my�ʒ�
���%�L��E���l��/��%ŢKDd�yp�ٰZB-P	 ����|�B��j�]�)+�[�z�څt� ��_�����~�X/ص채�� ��"V�rU���M)���p�������
?�A�I�Ur���>C����	af���+�#)�3�z��(�� +���p��g'Ŗ���<H��|�RW�⧞��ݤ)�HԊ\��s7�Q͗޳���Kd��,�T=t�T�1�~��qH� ��t���o"l粨{ή= >�>���P-A�a�sHy��R���G��\)��Ʋ	�6�5GV|�������3�H�, �)�\��\ɍ�e!��`�
5�U��|�;1Ji%?#B<x�)�K��"��
! F�F�%` k���hv��V6�n��\_Ά�EhS�U��&Q݁t��e�'��-	-��&������{���!�w�TD��H`GҌ���{}�D�%vr%�.��$�����.� 
,�[���K ?q�t�+h6�u��+͵%��;�FOqB��v=q%���뺛�(]q���;��QQ��t;
/��P)&3��Qj�?��֡��f�<	���k�)��R����QO��D^J�C���t*b���*�SR�{R����F@�I=���ӣ�+�W�6��tI+%%5���TA��,(���r�	?��D
�v7�V�WJ�q��EU�#�tL�h�2���9AH�"���`(.d����D� �es"����W������q�j�}P�=� J;@�2�קԯ|Q�b��=�^A'�`�����#x1)o�.9�$�-r
u�aE�$����<f~K��6-j5I�;��23��d9ˆ�Xe6i�8	6Ko��R������{̄�"{�(��2q�d�"���g@�����IȘH%�!���W��D����cn�r� R��)"�U�� ]��ڻ�.�{D��	�H[��Ol��)�� <^����
/�6���v	<0G�������ƩST�N�
p�N0s����Hf���$����z�l�m��9)�"��!����ȲAE�cv���Ǔl�nAl��W%ӳ2E�Yٖ�|⽑	�	睹͒+��D6i�O��k��Q��1�!�G��	��+C�������S�\��,��EsIa��L��/T��yH�k����AJcw*\���fá$�Atrي'Gמ�`�D�?�5�)
-I� ��AJ�Y��ȒқHЃdґqd�j�B�-\N5-�$��\�5m�<����P���D@�S�� � [�ۉDb�T(�ta�Rp�!�Y��󚊞ٕ��.��H ;�8X��9�E���Aob"����U��m3��,�u`�TXb��S%���gm�;d�p�kƢ�Œ�0{�&w
���w��Óv�2��,������y;E���QU$�=N^���`Le�:,3�B�Z�N��O�6ɧ��O�4<9�(����C������Z�3�r� �Ξ-x��RчO��ʖ�;��)�A�"n�֤;�/��� ԰��v���,�%���"�B �����̂�����@n"��d�����ٞ���2eU��� ��(#�Jq�Y���'ef���^+��{z]9����i�R(c��T#�X	�B�F��=�.|=h �`q���2n�����g�9�[����̕�� :?�����
 پ��xZ��{��������CcRq�Dס�ק*�EKY�/��f�I��YG�yŉ�o���i���=^��m�:��#���������y������GL�Q�d� x;'x���C9C�s͚�C�jd&�vȃ���Q7`�����@�N��f�QI���j FR�i����E	�M�GN�.l���ƅ�*%��l�:��D	�<6(�-�ڧ�@"�ju�t^���̅��� ߔj��������s����N��Q��dz�E_�p�0gI�w�U%�l7����	�{`�E:��О���v���d}$��(1�݋Wj �D��������?����Y�v=�^��FP���k�t�d�iq��
"��_L3��c��� ���K�QE��Eici�L&{�!)���%�FSq!g
 �pmdաpU2�A0���%��I`�2��PA�R�H�{P����#��^7.Y��'��ڼz9�šb1)�s�K���v#�&�w����#5��8�/o�P��E����<�e"t�Z��uID � �i[�"?T�;W�	��c��qJ��҆z�1 �%Nѕ�ۀ|n9� ��	�ArA�/ɯ|�r]A,pp\0��BR����<����-J&��V�S�ҙ��	��'�᰿͌�<aM�����6�}͇�a����5�K�MV!�W	/�A�|Yz3t����a�
&��B�-\Nۢ.
��
��`E�$z��'�`@C�����{m'9)��eN�erO����?��}{����aJ�,���O�h����r���BLX�`'�wJ2(.���սD�y/�����n
�/�I���w�L�Q�O�+���/�rO�]��[��2�W��c��Oe5�Jz��-6�~ԏ�>`
�    ��̶��b0�z�B� �N� �����W�n�]�]h:JYRb}W^=J���oN���Ì&o�g�y�:& EN��U��܃���Z�!��8���A�����t~����S�$(	Ŵ츔Ot>��T��P%8
�G���_�zj_?sq@���2GH�i	w�2G�h^�� /ЅU �0�1l�hj,E_ ��u��~ ���W밭xZ��-|�� ���nm&u�iDˀ��JfFu���Ph�B���Uބ�`="�t�'E����)1�Fp����
������֚ ��_��m�6�'�B��3I���Wqv��)^��4�z	k�{=jtLL?"����mf�!��邍.�/�U�����M����.���g[���������΄�0�#�-~�}o�Ƞ3�"N�U��I���(A�{6�f���}�gq�>lRqQF�`�J��ޓ���I�o����� �v�𝕭�{!vI����[]R�,6X�-����V3�BQ�K⌘�'�cIP:�|�1!r���Q7�ǩ����%qϸ�g4Й|ՙcn�} ]
������I�IUD�^�?t�5�l~o���4<eys(���+�pf8�O��γF�Ku	CJ�6���q:_7�fZbN���[i�Q�:r����kR8�g�()-��dsF��6�PY�"��{.ᬇٱB'���IM�{�r0���T�4H�3:��5@���/����1dC�V�L_ѡ{˘(7�R)�4M3FzI�0�2S�8���(@�}�
���$0x��sX�R�c�o���T�ռ�]�s�o"���MMO�'w��#=�#������w_�/�C�Sq�8��໥�iw��,���AzHBt��i^�5�����v6�,�!�^	(��X��.�PD, Ǡ)� �m�q�����e���@!�O�c��]ES�-!�Ao�	L|=eI9l0nD'������F����GNsP2�-T�R��zQ�eP!��T z�o}#�kI�[���K�Q��-��]�!U=��Zjfg|��8��2OG`���ĉx���<+�.6G���FAjZ�͆VQ�����v��������{'��C���;Q^J��
z �dR�W}����~�L��t�@"`s�z��uS�7����A���Z�Tޡy�I�P�lK�G]�+�[n��Ў�_�Y7�@������¨-!w�~M*�yA���h�>2	���1��;�t�9	VL�	��HߒRE眈9j
x-��(0���pUpx%�*�D��2�>GK�$����XH�z0c�
�g$��΅r��ద#u�eȠ%J��sQ9j�u��Ro��GM*��X\��!G�E}r>��;8d��:Yy���`� 8��t�/8�
Y!���Pi�4r\���� ���8��76�H񎃓Z�<J�.��Dǲ �������Z:��<{�gԥY5T-;��n�
>!���h��h�p[ĕ�NNMJ-C��]S�wC� Sl��d���r����o�""�ŗR���������e���7����wĀ'N�L�!�9��(��8A����XF�����^�� �����<{��/������)�('[���udp�:X#��k~t|����^���$�q�>��Ԗ%�3��cP���ac��Y�D�T���E�k�@	^�,8� �Il�$�;��������#��?� �&�����	 a�Re<�KP{ �) a��蒥���(�$cߑ:���?<��R��ҬR�(ADR��PD#W�<��!�]���=Rs�"����%�AJ��T!� ;�!�-�_�p�s�l� |ڶ��5ѳ��#t\8�D,�_����,w|CV�E*x���^caǣf�B$w���jH�2�yd�~|���)��KD'5�����e!UI�g��9$�Sɫ˳M��e���"iԎ[�POZ{��

����p<��1t�^H�Qe����OB�Cݩ%s��R�0��0�~�l�^G�]�x�q�͓uf��Q��{j�OG�_���Na�e��C�7�[�9MHw�������11�ɺQ���5aq�J'�\jg$(nc+)����������� NTN�e4� ���f|6�Q�o�����Mg�����ľ��7ۑԶ�[Ӌ��d�տ�i�8��ޞ�O'����;_0��ϒ�`+��A�X#��c`�<�N�4����z8��6�B���ٓ�FQ�S�WtXJ싥25�������#��h:P,���MB��Ȑ�5%���e�P�{�$[�8�9��-�i�V�E�5X���xH�#*C���&R�~j�aG�9j�W?TÉAs9@�Kql�~ǀ�b�k��9V86�0˵�`ߊ�����0���΢#)�h�3�C)
z~Fk�Z��jiV�>^���H�ӿַ�������@�g������Z�D�!��z�WM ��I�C�k-�fi藷'
�D�"��%���=ǋ��U2Z�^,JwM��YM�W�*9��)(�w����C��kh��;1&5�r@�'�_�@�'���=��Eu�,��X�ć
���|�g�L�m}#��Q^�4B�1|�tX(�Z��_�Jl���;j�6+ه�B=���,u�cB5��5��R�:O֝���X�YMT��9{�y�̀�)����� F�mEѯ����T�;�9�覇aԡ�� i���;��0`L�t���tT }_��i<YA։w�E6���Hm>�����w�)5��-�5�����[î�H��0�y$4F���0�|�2�_�k����_C��6���R�ը_ɝ<�Wȡ��m��I� ������>��&j����ky�2G�u���[�kiH:7�CjOH�aF�B}8��_8��t���F_w�?jGBy���Sg�����znRu�s�s ǭ��*��4a=%���5���0�\��ƙ�{N�a���:�,��W�}�:��؅��vO�׹V��Z���@,�ĩ�y1�Y����N.'5уREGB�A����%׃��D"���y��*�����c���:3�8ϧ�(���8�>�	l�LW�E�/��~ͱ��K:�W���qSM�ܿ�t�S#m[u �Ԯ��Y�N�P��T;Nɠ�̬9��M�i[�;^����<ކ�P�[�x�-u���`����TQ�$;���W4���5��x�gV����p��E5� i�5��
������ �7�wtXѲ�m!��4��5��g:󪻶E�\(������/�.�Y�k^���댪�#"�!��ڜ3ق2�X)NIc�XP,)b��D٘�uu!�щD�e:H�Z��ź���#;��;Y#����Y��< nqe	���+�	:J����8����Ѷ��	0��|(�XNM���P�����t�(����\�Sh�n�������\"a�Fy��e��5�e���������ͬ��-̆1��!�6�@��?���&e��X#�z�C�5#�k�}�������0'YE	�}ժ\��>,��fEK�\�N�}<M�P�'v�qªe[��J��A�W��=5Zc$d��TB����7b���w���`A%�Z �7��U�� ��P�QS	�s���	e'7�A�ɷY�jd��|��[ГCӭ���w$(�~$�[���l��>��B�j��S�P�G{?5�±X����E{W����)4���o���?�E�E5=�L��yy4�+e����:*�N��t�����s!����)o&+�%q��]�u^�,u5w���@tI��D��bQ���TK�DM�'�;Ӭ~�� j����춦Ws慯S��&���`�{HQ�4ӕeh��UKGa�j	t�ŵ�I�=�H��
@Ġk��o���A�[m���b_	!�qO*�O�ŲL�����4�[����� ��}e��P�\&GP\� �8�1j\�bk������i���El   �C�hP�FK=��޿|M���^�F'�����m��4��������GcIԧ�F��"�4׿F,[�5l��z�P�����pO�j��i��'$���jŠS7"��(��q'c���������a���� *���]=`��d	;{��%��҂�s�9�؊��2hd|Oj}�T:#�:B��S�¹�z��6v��FT��; .F�:4Y�/Jp�BQ�#��q��������и��ڂ`?��л�x�Cˤ75�IO�K���OB��G_�2#Z�9����4���͌'�0(�mhYR��,���ʜ�Ӹe��q�:���C�s'M�p;�P�L��<}3�;�ʲ�C�(2�}D��-M-U�ܐ���:/Y��[��F�&8�$@{u7�L߿�,������r"�P<�����B��PS~�,���W�r�;S���QI�Y��{4�"�P�N'���h�t�	a�*n���Jr|34��#-�{��1��(Y����5���Q}�A�[[g�������t�o�ǓyS_���64����%=�5���̺IT�f	X�qe��E���#ʠ�������چ7*?�o���x2q�}�D�y�V1�Ƈ�K�+�t�Ig�K�(�Pt��E��,���(�A����KHN�xno}��ڎ����C���)�&�2�i%|��9�֢��N����`�*eTej�L걊����j��]��/��Y�9Wu�uD5�c�> yC����9���^����
��H�1�p��Y�]�a���}�O��x�YF$[\A�����ڂ��T�ԩ��K�ٕɈQ}�zU�������h�b�s-����a����}�2�4d�o�K��a��`�r��h��d�tպ��9���^jFs�g��xiImM*��Mb���9}[�C�w>n9����=�xJV6C��Y'�_�Rh�d��Ҵ�S�O�5����	��tP�����<th|�P�W�X�A_rk��B:�Ǡ���
'� �N��U���W3b��۸p2���?��� G��k      �      x������ � �          �   x�=ʱ�0�ڞ�9_��S#
�4v���H
1̑�P�W>H�1�?S����1Qk�5��8$sƒ�
wؿ���yc������'V�ް�.���c�{±�X���fB�L:H���(�sO�hL �;���?[�*O         Y   x�E˱�0�:����$�����G0�l�;uӧ�Bf����C5��I�B&$\6 C��2�Lh���������YX�Ʋ�u�Z?��         �  x����n�8���S��Ҋ��8G��^ĉ!�
�Ld�%)��6{���z�R�l}8��H��7�g���7�o��cuL3*��E�,�%�2v�o\���ß��[�Cd%��I%�F,���1������mߋRH�e�2D�!���pOs���'���	{*nm|~��١ȫcm�h��6�i�� S&�Q%�\�"+[�8]t��i���.�o)���1:e�2j��Q����B�����4�ds
<h�e�gIոY�1+K�2&�N�+� �]FS�g�۳��h� ��s���U�����v%�i�?ShG|)��S-���{�f���r��{m.$����f�E&y�y���aWes�>�+�O^��$�:�fc��L�y�´�����as�.䲯�Js�dD��W���F�pZOjny�H��8ɹ��*=x��S��DL�z�2�
�~�#�zP��G�q[�F�=Thu�tV���W�)�O���q�R�_��]c#��Du����C� /\*���ŞSk�0 +5�=n/����C�#X�7/ �Dd[(%����w߱�<�����~���D����������{ުZ��I|����D������dL�$�(����݃�����v�?��DW��X{L��8�q��=�tN���4^H�z}���7f�
�G��(zΊw�������LWu^�����
�:b�R�S�tF��y�5�Y�B�����I��$>h���%1}o�6�h�\5:�jr~խ�5w�I\��NVR'��f�K��=���5��=����k���A�]�F��k{��#��ױ���j���%`e����^�+����e:A����+��[���i}b�Ğ�LB�m!��<���g9��<��+�h(�}��v�����"��y��#��\�f{)Ԏ� <�����45� ;+`<C*%C1�D���~�������[��5L�<���z��w �z��N=B��J�b!�� �@᳎uW�R���Y�g�_ �}wLt߬��i��z�ϒ�r���F�7���9\w)�-;�.�i��$T��S��|���ah=~��i�	�	p�ZV���������c4C�"�_#]���)�KyC�ݛ,�I*����vT�����BE�Gϧ؎��4qliӞ?�Pu���2N&�z���)3xN�7������%���N���i�1v�x�W�u������� �%            x������ � �            x���I�$9�������D�M�
����P��=��J��(����p i�"�R���Ǖ���z���q3-�B5���qƹ�����1���������C�?)�a��t[�SJϥ�n���ʫ�����,O��?��T�Zά��������vu=���a��T��d��s��{�����Ѯ'�5��ܟ>c}\n��mkI��:�/;�1������⣒�3ݦ5�}��uĘ�k&<�U6������M�f7{�ֱ�\������:Kne�'���hՏ�_����|0�i)�K�X��w{:�a��|�����JqG�8���BO�mxSk���{������%~���P�x�l��-���~�?��:�O���n?a���1w)խ�l��a�����C����/�a|v��G�����:c�1;M�<���]�X����:|3�'�L<��ܜ@]��Ė�j�ɑ�c�/�晵w��ln���`�Y��O����+<�����͹��ˌ6��/��/>���Pcmd=ޔ��oC�i乞�?��R�yL�.�����zW���uLv��?}�e$;Ly��VJ˳λs.�ۧ���f�5gw��c�ikFv���קv��2Z�>��_�#%��%N��~k�SgO�-�#���#��)������S����m����N��Y�l�=��!.���2G�g�1�Y�3u����k�_�gu��#���>R�)������K���9~�����\.���L��HP�6�g�,^7�x���mx_����Ԕ��&@�AR��QK���j��v� h����b�ݼ���v�%�%�H���6z�{�h��֑F�������� �SwO�>�iIu������\��
��oI�?���xJgV
A��I��m�`J�C����>q5\0&}8I���򞅌�7��lƮ�>dFR������;�Mj=~����T��|��&~�R�Usθi���}89ER�uʷ����݌-Ӽ��N^mq+(��/�< ��'Og�ޙ�wvgb�%�%����Q��t`I[}���c[���̉�Z�xq����&��Ņ}ǧ8I\�a�}��$�������i���m�Kf?�`	��ϩ����u�����=�$�ѣ�`�.l"J������8���qZ�%��ҟ]�޾7g�_����w"�aפ ��2,y�!3+>��ca��,)�ek�SS��Z�s��/�m8CI���=�A�*>c��n燼�&=���mJЙ�<.`��o~	;V�,ќ��~�W���<'�����=^/�yp̓��Й�z�w�d�{���j�LB�{�/�B�y3g�E%��������O��;%��N��p6�o<mc��a9�������a�Vȋ{�_�({n3O\��c��F����V�v�](���bS�d r턓�l�#��{	f�&��c��	5�kz�8'�y��{2_SjX�����eli�����3�T�`Mp�Q���0.Z�����*�+�X|��<@������~�n��BziB�2���jN �M��k���e9���`X�>�0Сp�ߟ;�vX� I��	�S�"e���N�
�{T����	��>	��f���uX��Y�S(��au~!lfpŌy6y��x� ��D�����5����f��"�'� �@\��������65������i5�1�&��}|�o���������Q�����ݞ��tq,�'�fW(y�s��3<�/h��{<6�n@�>-�8#zb��ol����E+�n�D4���A�)���.�Ӝ8�X>|�ng��Sh9Eh��[w�G̽��A!��ŝ%��m��%��v�!�����S��M�C������?�H"���Y2D���6��-����Ά�S�!��fW"�8n�m�����1�j>{'���WbJ���1��xL�� �pY��n��[Bu�s���rO��i�D�0+�#D�w=N"Y��z��ȜC�#�<MEÒZs-�_�����@�v��V�b1ѕ��u������>�e�x��b�[ ����_~Y���^��}�	�aD8�WY��X�~��3�E6��0����Adg��y�a��JXf!�N����d���XC�ҹLUz&$lL�N��	$���c�CA	��'���,�a`�Z���_��!.U��@ l{�a��Ƈ��_��`��q�PA��Y�u�[��X�{�h�&;L4W�8��:*a�+����7�����I-m-�G������������]�;x� r��g��_`2?�ϲ*���blۖL���u�B,X[�;���Hc�/�ml��:�Pq�
�E��������Z��]\�9���XO�%�Q���������va��\SŮ@HP`��S8Ѵ���*��|,��?����� ���g�Ӫsi|�" c��������q�8��ي6: <7񴁹���Fɾ8/�g��
�m�Э�Wz���g�|:��J�bqd���.�~ۋU	����>�5�$�R/5�_��}��UgU�Ұ�9�|C��%,�/�jc�Tp�&��l�*�j�����#���|���K�̋+���8㺵$w�O�N�ʞ�{�Nu�r\��'��dǡC�0����mG�Ս�������~0�{����ejif��~%8�8H�TPX1�̽J����+������|���F{��~؏�k \?$]�(Au��j��7��I��Em9B��M�e�1���8���9P�6[�P�d a�.:P���]-�O+�Z��e2^��l�k�|?��r]�LR\-��Zڔ�ه�}�!�*�u48�,���b���s��𗭫6"�;v�Vp|$���4�)�ɷcU/!�&>���Y�l}���$���M�&�^i�?��]���/�k���o\S���\�r�U����5���G��~��#�awh����qPpy� 5�@!�Ǌ���z�����m�E��,#�����k�I�����/�f�Pcj#�N�ߊqt\8,�o���Q�r�*$�J=l2���c-��^��{�2��=�m��uJ�e�n|��?��L�R	���T$�?�a�D��I�o�ӝB)fDI�i��	�,���p���wD�0�P'<����L7�,��?|:	ة�n���̪��媯~��������/١��t3H=V8\����Dq��TZ$'�i1c�&������i��.8pF�w��7��q!�`[��Ho|���*��hJ&���s����=�_پ̠"1�d1���Z��p����ƩT�DuJ{�0D�V�����S�A�b��/�Ԃ�uX��J���}�%;���A�<�V �mw0��9xT �����V2�`.0t��<�;c�kjY��-ȑx
	l�*�XS���P�M,���Rn�/H^͐��0m�;�52���������@��Ц��ýz�F���T�Aڋ���c�㟿�5�*�Cd%�gƤV���9˗�t�7��<��`��ή��cF-�gt��$;�@�>K�>u����x��v)��].63ُ���g1�j4����q$�\~�Q����Vp�)$|��%������y$���UWy�٩=j!Z��s!h�,��"L��ᓙ�t����g� ��y����d���Q�A�}�7�{�A�G�������P!	PX�ۿ�l�KXF�;ǔ�/?'�qx�Y����Ɇe'G�7��A:'���d��K�ǣV$\����aD�;?�K���>�] ����q�>�lG�)`}����4���Ml�����8����������;�y��2g��֥�������szJe�N�[�|}o~��X���~�d�uB�,Z^����[�cȊ^!��3Y�CVOyW�e?p��}��.@;�	W����h�o<�6 |~b8%p�R餛:�?8���<���=h�w�Ngu#TM	+u���w߀}�ę�tZ�,A ��Z����{|ZB+q���r�uaD�=Wt�F��C�}{(g�n�����S�.    ����4�9�%Pa� �}����8j���Y�Z*-��>�V_p�ཏP�����@P�UV�Ʉտy��H����σ=q��É){�N��c��Y��XJ��tG��`�M����w֨������mU""�:?H��K}�l�,T��_a����4����ǌ�����~/�
�����6�}=h�`:�g�2c��� 1{������:�;�:�$ϒsxl ��<�A�y@��̧���f~����f��{�����u`��<������	;�:t�~_��w{L�꧛�#�������������a���.)@P+B1��i���!���`|�ihA�#�g�Rg61��7~������ut�J��|����$QvM����f?��v�zڛ�Y�x��j ��Q'$fr@��6��U���s���";;���_�A�D�h�j��h��y����J��üA��d��ղ��j��Y}�r�����
>r+�H��x�y7�B&T���b�����e��x���ĸR��X����&��9�n�{���dˏG�n�����~4��
j��+����6���t�S�}<YV8h�bD�nNrY,�C�DC&8��n����z��j����;����b��a?\#���2��~�+Bz�8M�D�J@�Z�mg���(������x���m �������a��<1���	E�5��K�`���� ׭P�2�Ø�����)%}�[����u�>H��pY�G��y --ݛz�m J�3�f'��~�-(���̡K7s�U�`�k����7~$8hϰ������aB�c5D���b�/K�>��~K��i[���4���Z���oz�$���iW����O�g��y>��un��+&ιf��+ۨX5Tg[Aj����#�f�Y���{�g'� ��"T3`.;V�U?���K�ۖ����(b��|+�2 ������^/�?�.����֘*j��������i� g��)� ���Q$��K��/�uK@�����ѹ$�9�������=&͂�)�e�:Ӕ�A��r~Ѽ�svm33R��B)��+2��x:������o��WO���}��_��'o�))X�N�O�j���;�U����7�IVZ������n���t���*���:Lּ0��Э�)�w.X�\��6�([ ׁ�}��s��)�R������I{a����Vg���V��+O6Ux�N�D����!�~�7%-TUճ��C���������o����"�D%������Se��W�r��4�
��E�P�_�EMJ)d'�s���ޡ��uʺ9H�� �rKx���ǖU���]�A"@�^�c(��:�)d�L>s|EW�ͨ���H�'�v*@MH��#�K��b{ԭY�{.�/�Ks��$yp}Z)�� �{ސ�Ʀ[�Vկ�&��({�lׂ���A��]�%�JP���R�䯺4mʹv}�ߏ&AXh�����s�Ф�����I�i8v�`+���u�f˪ ����<��#S�%�����`?��VZ�OP�Mj��R�4ojr�q~|��;2I%\�f�bOJӝ�	N8��}�Y���V����T�ajSd6�#��Ŷ��Eg��,$2���#�̿���fc��As���S�4��a�R��86���c�Z�M}z������Wb�t7��JXE�2�c�L��_~��w:A� ����c��O��	!σ��3��x�RG ����!]����Dɉ<a�p3>��]�h��M�W �2%�[/�Ijg������hɬ�T����>}�ߠخIf��{�����J�T.���5��4o�"�_��}\��G�`V��qj�ek4��5� ��}\��8�1��X?8Hx�VB����< �0�v�#�u�m�i��It�I�z)k�y���RG@� ���V} H,r���v�a�@�����RG��1o<\O-��A��%�H���
�1��q�#N]{�Z1e4\�M��1��+���ɥ��ُ�L"�`*�H����q\��.��}_���8vW���⸇?u�,����ی���RG��S(��)PF�����X��w�.�t��gj���WZl3bҳO�I��}��h�êp�g])z�r+�pu��.7��ǥ�@8�/�:���i����8��C�m/��g_��m8���b￾���豲+�M�Ǉ��;�O�Y�u��* ����x�. �k�?��RG��G�0u�����2N� ��cyϳ/u.��L��3	�R��Ds� �:�~��:?;��M��U�?^i���[��v���RG@��?�(]W�*�5͕�	��Я}�#pp!H�Vh3��kʟPޟ՗���0��NG��u{N�S���U�?bO6�=󬣺�8�RG��S�ԋ(�s�·?�`2�W���r�{�q�#p�q�F���U_'���LS�"�g��ǝ������z`������ٌ#�����r�#�u�}I|R�R��m*f�j�p��t�#p�jMv���<����5�S}��a.u¹�'j�P����A�MIͱ��K��NG���Ƶ������uL�Yc���C�إ�����[ϴ	�����S!�9?�>�K�#¡�$&��r������GëHa���K���,i�z+�=� ۦ�[+�F��ü؝���ߦ���Z-�]i	����\�����x��8�����0*m���p���q�#�ӵ���XC�_;��F��������奎��ca�-|^;<cE�](��ri���ץ�tr3`��>�4��.><m�}�<���NG��S�l=�M�@��, q��R�:�o{�d���r�����=����.u���e��	AL:�pt&Hͳe�X�~�'��8�p��]����[W��_Y�v����|{�#p�0èT��S�]��Q�#m����xz�#�'�T���Q`%��)������x�NG����j��Q%�j���3������q�#p�6_;�/��+��0iݳ-�c�x���]��L,��k�K}� k��o�p	F2��ǥ��/�E�"ݙy�4�R��Ẏ��;��
ޤ�{R�q���X��)af�S�����suǨ)u74�����#r,5~�����#p�� ��e��C"]�X֌ͷ[��7~�#p�z�>E0�+������[29֜}ߧt�#p���ߵO���;L���N����Ƈ��K�����@�$��:Ԕ��Ձ&�o/u~<������^�����Ұ�t��0�q�#p���~�s��3h䤫_
��o�QF{O/uN��� ��@	������л���ǥ����I#V�f�b��Y��ⵙϙ�}��RG���h����PP�j��h���M�����:�G�3���%�D樖~��\�D�=�;��ow\K�85jd�>�6� ]}��x�RG��� * Gg4��t���*v�͆	�y.w:��B�*�jD�H�KP�Y.�?�7������+��qM���jBd4�V���,w:g?�9�fW�[�-�(w�'���p�#p�z�M�O�4�e������9���|�#p��;��� ���$�.��zX�۔����8�v���Zx����[}�'���`��NG���wsJqK�������,�	���ǱK�_�w�Ɨ4U�����|����P����#�ʞ`>5-o�+����g�K?��@�=9�X�l;�A�"=�D��П|�#p�m�����#���.(����
3`��qХ���gWHд���#�9�Q+�����0/v�#p�~,	�Ԉ�\���)�M��_k|У��8�����a�\��y��;V31�r�tN]�������}za�;����gD��RG��1��X^��ᕵ���5��a?�t�n�dn��G�dhDɥ����^��{��[�V��#\�ԟ��cIs)��V�0t�#���z�����[:���4U�an�RGଃ�cT�L[�"���{@������:�    �����SPCa��R�Jr���oY�����:'߂�JI��t�"
�6����z����^��u�F�>�泷���i o ���=o��8|�Lc�A{�\�t&2��~�6����Aw:��0��;խ[l>�6M�n!Q���7\�� ��X$����q�'��?�V�}o��:��Trj��G5���Е3nlո�b���^��!'��?W$.+ڑ��TI���8�(5&ՊR���RK�T�!��'u���@w:'����yB�j^}E����f r����\.u����j�}�u�+5�_A���l{1����������Q�dL�#�����ת�j�Ͼ��ݿ�uג�B��V:��4���\G�O�?�s�n�JzSһ	;f_sp�~�c�:�T�^��+���Ud� i��/v�#p�ޓ]8y9>�~��iR��=��#���@��㎎Q?ql��N��-�ڗ:g���}eq��V�V�tu�W�>������{{<�1���\�p��%�Z����/u��.V"�h�����I:A�@�~y��RG���ⷮC�A��")�`f��z~ήz��:�\JpFu�ԿN�����ŴA��]�;��}��RrYC��N.��O��ʇ��K��oWU��p��8���<it���~.�:'��m#8�����+V`b��[?c��^���l�=�z�#��ӆ���ǚ?�_��xԌvH'O�!��	�!?��m��a��NG�ǳYo��S�c��k�~�~��~?�t>��E��şg�XN�����0�v�#��~߂�E��/^�6]J�y�RW�ޱ�����V��V�cI�	'�I}ָ���K��/�ʩi��n��T��.K���������s� A��(���1�
�{ ���1���w:�za�y��[D<T�L�r<�HP:�>��_���-)�
�R<Uwy���=������+�����"ŏ�5� LL&�8�ӿ�^��8�υ�0�H�e���Z��9��O��_�����HUłkt/F��zA�hE|��K�t�_L� ir�R���CF���q��q�#�up~�ԝ���{�ni���"r6�����Hg�puu��U���B�E�^	�Ԃ_1�ߏK��R�ӻ�亓�8��E@^c���N/u��l}3��~�(K�䁸�&�d�������8� �-ć�'� ���h�i{�V�������H�^��$�Y���k�~<�6����m��w:���UO�� �=��*�M��Y� ���z�:�\�n�W,���E�4*SC�N�,��^ǥ���a�F�#9��f����ug6���W�ya�w:g?VmC��֝��F�{�}��A����~\����0z�}v�JEA� Ws�uHy��:.u�=-;0N��U?�keSE�$��ｂvz�#pΥ,5�a��a�B� 9M�콝�`w:��}�{�V:5[�� �}�c��ltӻ��q�#p�%��H%�n�����l�vc��|�ޟ˥���!wl���!��}�	��R�n���r�#p��X�+�J��	�^�w�
 Ҙ����z�w:Z� �i �i[�w�k���A�}@~�}�o/u��ƶ
yN觪[E�GZ���Ã����cw:�:�C]l�jIГ+m��7�͹��c�:��g;@$�Ǟ�Y���γ��I��q�#p�%�=�QS���P���Wd�Ɩ\�{�q�#p�m*y�	�|
5vhB��٥@P� ����NG��Q�+`�Tw���*U9���|ϣ.u�"|�,�����<�uɵ�S�km��~\�|
qP`#�j"7���Z"K����إ���q�ק��w$�ie�D�0�}~���:�i��`��=�Z?jHb��&���NG��-��KJ�A���s6˿���w�����RG���e\F�Y�!������m���z�.u�&��ْ@"SlE �`%����RG��ۑr�pb�c�J�_��Ʊ�9�~�:'�ٴ�3�Q���qu����)�وo�qᝎ���3\�t���1��&p.}ȷw:��:UH1L5���)�1�3�Xm�H���K���AR�^cS��.(9��(&��������bN�'qL%5�5���k&����8���f� �)a�q��u�;a��c ����H?��M���9�F�غ$y�������q�#p�o�W	�|�Ҋ�׳M;�߯�RG��u�������u>ޕ�lڠ��|�#p��Vk�)���c��;��{�#p�:f��C����*����Ro&w�Ϸ�:��Ľ�Z�ӹ�	?
������t�=߿�8x���ꆝ��1b�>
zW�L!�1�{�������~�<1Vu�)�=ڙ�-���:g00H��Hǁ��Xj�QL��yԥ����d *������G��4�QS;�{��#p��\9B��^�0��>��[M���<�RG����A��4��y72�ѲV����ӽ�sw:gSF�Pj5R��)��}f�v�|�NG��������٫�~һo��:�1�E��o/u�ogL��jӕ�=�k�i��W����K�c���"$y����|���?M���}坎�ɷ������_"�Q�]u�����~{�#�;�]'��YN�Vs']חz��Hv����7q�JG���Y�(A7C��u����� �s���K��/S�u��v�+��u�g������\�t.�K�ɺ�Z��QSL�^�]��=���8�Θ��ӭ�F�	�5t_	�Ҙ����.uN��+�I�p��d!�4]D������tN\���j�3�cN#�zfw��t��s�:��1vm^DK�1H!��>5{��z���}\����c3]�X�cA�Wc�M�Ck\��ǥ���x���}��Z����[^Xm%�?�tN�������6���'ƽ�LNgF�`W:�{�2�8���"avM�{6k��}Tn��q�#��Ci��VñS�#�ĳ9ޝև{�K�c{�.u��S_RW��V,V:yv~�s�:'��D��|i�x���9!oC135��{;��8�C C�#F����S-)��Tk&�Lx�+/u��2�wQJ�G��(�1\�}\����@�*Ԁװ�(p,�H�~�:���J  ������䭇h3���_�~ۜ*i��y�b9�QM�����?���q�#p�_��!\h�t��x��>�qs$������RG��?�y�I���U�P񣂒������r�#p�i�{���l{t&�Z�ʓ��ᵚC����NG��G1+�l����d��ZB^*&~�Aw:'��࿪f��2�����M��G�y�w:�z��]�������4"7On|���:?;�=��q�i��S����R [���t�o� CR�x^ e���k���?�}^�ހo��9�q�:���_��{�����8�aH��vA���R7��a��!|�������;�F���4�N���*˩n[���NG��E�"� ;-��=p2ȅ�,�?�]��R�M��żs�5�d�i�e���˛��+�_�ϋ Q��*�4�����4}��_���tN~��&ܖ�_�|8�����b��u����RG��G����k������ I�к����top*Se�4=��&6!�	��F7��^�;H,F|Ns�Sz}��&�9�d��q�t~��!8���Z�7q[�3tƘ�y�RG����AG�lu��VWh�6�ߒ������IǵΚ�j��R��
������}�#p�,b��yӮ�ۢ+E��H�&�:��ǥ���7m)����� !  u`�T��|�/�:�>��V\<J�J�V0%,d���?v�#���)��R�V0�C�cOo��%`�<v�#�W�}TóAsZ�"�(��?�&~��w:'��تǔ���w����8��C��qХ���Sp� ���B��LP���,˻<�NG�w�QfQ�Y���5�V���� ��Q?�.u~sZ��NK�tXu���Y��!��    �r�#�TA�؇Q�Ћ����S�$�igz��.u>���V���'m]��]�[r�!���:�߆a@K�0�{�}L�cY�u@KL�K������clT�i>^��P�uX0�i���\�ı+��2A�����V����O'��]$���>.u~�RV�Բ���n\?yjːےv���tN�r�����E�Ib��:�Z��k���t~�Q�q2�z!t���O*n���q�#p�OJTa��)zaaj�yt�C��x�RG�ďZ�Tw%�h��^�o�,��?��RG�cI����5��ý�_�����s�#p�m�.&�§��M/�`-����|�#�oX%���L���(h���.$ \)�?�K�S/�zMEy�Bʷ#J� ��?��v�#Pu.$�8|f��,7�!�	J�b��-�t���h�Q�M���x��3�����z}�:Z�Iva���"z��G�cD�eI����t�Ӡ�����l�/�#�Ҭ
1��a.u�'C��.�5�v��h,|�59����r.u�������y'q�U�4�o*�Y��ǥ���ѷ���j5��:I�X���i>�<��z�:��7@b1?Y�`����<6v(&���K�z�Z�j�W�����ߠ\z'�(�S+�+���:���ץY��>y�h좖�K���:h�:'�&U��|������jP�Ȧ=	?5���_�:?��z��T�E��T_�&ns����p.u�}�dي����g\Ŏ�2Ec�ދ��8���p��!�)�u�KL��d�{���~{�#�uX�5r����$I�
b(1������RG@��]/}��Ԋ��n��Ud� �y��:g?\[]t�I�{L5I����x@L��/u�#PO�e�z[}$����.�8B�lĔ�|?.u�:�3G/�I�%�;�o����|�ƍ��ݷK�z�=�*����Li�y]��]�����NG��1����<���t.�i��������-����u�D�Qʅݨ��/��8x,��N
��sV:�C�k�.t��������$W�7!/�ރ�$�aM�u"�2�-/uN\o����n�ٺS�S(�bsy�.u���6ʙ&?s�꘮j�Ϛ��ۦ?��������ϛU�*� �غ�:0B��Υ����}&��.�AsZ)o }�B2E�=�y��8�1�����j$��WЍ-Ϟ
����/�흎��N���(��8-�>�Wǎ�޿�w:'�v��BĽ;<dF��Gۀo%�Zz��:�G���|֫z/2as�s�ouξ��w:�7w"	~�a
֡>G�-v���a��8�JG��G�F��Ki>[��jK����U��[^��u���bJ9��D�b�d �'��>�_���G��ϭ�l�dHN`�p��&�M���;���8�1U�ʷd��,rSRZ��;͗:�\B��o{�¨zrS�6�%�a�*d���8�=uMɨ
�w��tj�3�ٺ��x�_.u�H���u��kѐ��D��u�ޟ˥��/�KV���"�5���N�|�.�C������ ��NU�R�T)�ԥ���|x��NG���]IE�Y�*-��2ܒ�&�6�����8�C�DO���;�"�a��U�
����r�#�u�>�)�]}c����
(� �ޯ�RG�Ե��4��5+�E�- ��P�Ayo�:gقK�}K�#A*Zn�Gwa���:�>�����:aI�C
����=U�����#p�9 *�}d���� �%��<I�=��8���Q�1���//&c�1g3���r�#px��W]�]��c)�g�Pr[�t�:���o1�O��M��F�S������ǥ����f��&mE�h�H<�HKs��{��:������A�@�$��k���;���C���8v:H��6�~��վ��`e-���K���2
XO1��Z��c�n��.B��C����եr�Q�����ӷN�$ ����8�RG��u'��~X"��Rz' Bg؉)����>�RG���~�3ko��@]�R"a��(����;��_�v��w��5��%�mTǟ��>᥎�ُ��k=#����C2����\�}��8<��N����PЬ+1��^#�0��u�K���Qme���8��p�b��u�;���I'<����d�eY9�W��|�_.uι,�!������JӠ�9�2��0�N��8����N���v��N��Ĝ����R>��q�#p�6�Y���A�j�z��XR�zo�:���������A��( ��ýǥ�@��;$=\� tŪ� �nX�v���vz�#���`U��CT�^F��6k��f�_ǥ����d�����ZV��&R���\���>�\���RΧu��^��6?�Z�.��>�^��];�-б�S?uᘋ)ƀ���{�K��7��c�U�C�=z�q)�{c�~��K�s����b8�*;��(�ǐ�؏�Z>�Ox�#p�ȑ}�R���s^��MMB��4u��������.��o�R���
��E�>b��{Zw:ZGb��u�ƿ�^s "�� �6����NG���7ئ$%����%�F�P�ݪ����RG��9���7Ww��ӊ8Z�F��1�Q�>�;�s.�5H߄b�I�'�L���^���zΝo�̮�u�<�q��Is㽝^����>A�� ���u9��O=��a?�tNmW�X������|�XpN۹�_���w�tι`A����ר�.���<����]���NG��aD���b�h���~��, ��Ƈ�����]�9��UpHJJ�=�U�k��q�RG�ı��-\�ֹ$�^�Ө@H����K���t#���ZS�庮0��0(�K+�}�ť������?B{�D�BT[o�T6�y﷗:���߭�й�ς^
Ҽ�棺e_���ܝ��YG�Mý�J��Vk5�{�}��]�����C+>R=c�>��q�J����t�#p�G4�a)g>�]�)��ED����:'���n�lǵ@mp����:Ӈw�/u~u)�^��[�W��W-�yf`~���#p�m����U����m�IW�k���W^���&�J�k[-^��~Z���PQ3~����8u\}j4j���)̦I�=,����{�;�?j`�F�mQ��稰�뭫_9}�s��8��v�KG���}�sW�;Y=+�<�ч��/u~~�@jY�*a����!?Z�y_���8�v����*��J���[�Ժ⋩;�z���^��:T�J@{�\�cg���mP���u\���Ś��g��%��'n�:��}���������Q�zo͎g/��Z�㗼�#p�i,fx]]9A٥�3��0�/��}奎����d�!|�~MKna ����[�N.uN<Mf��w��~rP�aS��nz���q�RG�ď�ڌZ3���h4U��V��H����������p֭�z��>�=䕲������8v�#p�D�L<gg^Fz� w�g�;9��~����-n
��罂`�?�N'y�����o��t[��"�!��ˤ!=�R�H6���w:'~�׻F�V��Y�x�&����CХ����U�՜2�&���IU�Nu}����8�Q�j�>��z������-��>���t~}����c�����Ӥ@�1��|������Dh���]z'Qԏ/А�&r��K޿�8� 8�l�������'=ń�>ı+�������r֜E�|���	��п~�#`��%w�O�C�E�'��jR�.��Ç��;����0?�����'WJol��.�i]���q�#�ۏ�SG���v:?�]U�Eh��NGଣ�C^QT�x�'��"\g����;��W-�0u��$�N'�:y��e0��a��NG෎E�����^c��� 'Ρa����;���
e����(�b�����s�W:gx�qf෧��AD%5M��e ������NG�"�֐�F`�r��-��p9��Ǳ;����#�    ����t�g���H���Aw:��aMU�;J,�I���Gw�nYhLy_����ه�qɀ�2���A��t�.��kE���8�+9�}�ѻ+�P��?w��%׼��;�_� ���S��Pa�#*�Z�;��an�NG��� ���$�	]��d'򨅽���q�#��R�2����Z*��M��Zl�rt�#�ۏb�0$_}�U_{4��)}���#p�1FqY��)ac�5/�FW�-�C�NG��/1���!�&�n��ɮ�V��w:���]O��gK�|/>�������b1�ǅw:?� y]������W	1�jb����t~y�vk�r�6��[��EMS��ʳ��^��8�N��+����V���!1��i��ZG�)�|��D����.k`��\>��+����~�z^�~K��O��f��F�������NsM�|�U���Q��`J�t�j��^��u��R�7���YR
��G��>��;�?� �;�0���GئDQ������a��JG��O�������G=��>6'�8"u+$��O�NG������4J��G9�,GO�q�t~8hnN�Ds����KC�; c�2���t~���2�Fw��aV�5��<`�?�P����O��O���`��
���H+��^�/������aC��)��p���sU�g�����;�.ܰ�XpԢ֙s�� �a};Hn�=.������te`�Z"�P��U��3,q�����S���Tb�˧ߡ�_/>k����A��JG�?�.�r.Ө�@
��m�mOUl���t~��!�"}��'�[�nG������S��S�^�d��Ϭ�|��Q�5~!�Ag�JG���cŋ�.]9'��9���������O�JG��/�&�x��x��
	_�d����[���NG��O9�^@��{�儓X2A��,}����������u<�a�O�+<j<��ѼϷW:?���I�S|ΑI�ʐ{�Z�
��}�#���4���'��f�`d����~{�#�˷6�޽PzԽGҌ�'lp����;�_�K�\�jPG���J��й�)��t�:�Fˉ]8t6�n�"%�'���*��ܝ��/��ͱq�������v`:,���������n���s�H����w�J�v�s����}�Ҵp�l�� (���a'�>����������J����x4a��r�#�˷�{����i2�E�Ѥ���+�_�^�S��O�l>J��č�$}��W:��ɋ���r-�� ���$�B~�3�����tKA�ΪҮI�g��	3x��{�;���]Ӗ��N�Q�Yy��'\*�c7:����N��
W�d/���}a�[�yԝ��\�-��=��z�bs|kscxU�]�w:���}�3w4l�c]E�ik�jَ_洮t~�k�)����3*#2:�.��>���!s*Q��Q��5O���P�mm�O|�JG�w.����N�젧�A�Q���8�r�t��WZ��* t�U��ȿ�����u�+��~�,�梏�&ɀ�q[%�%��?�핎����z[���(J�d�'�5�R��ׯt��df�zMC-�N��y"`�������W:yT�V@��SU���s�&&�6|�����������Q��Ӌ����`���t��W�X��V�Za�pz�m������t~~��7�淮�@��>��&��R?���t�:��"T�4v���O3*$[5F|������1x��8v�O�$4:ԥ�ۣs�������1�K�"
5��h�n��� ��?�I���pr�3�Fj秿�H�4G][S�d�E����+�.T�U���� ��s�92DԾ�sw:?�(�9~�I]��D�+^r�����w:�x:�9a0cP=�HW<�q��}m���vz�#�ۉ,d�TԵ.]����1[3�m��:�t~q�Y���lE�jysjҀq����_����ހ%V;�Z�g:/��#C��4{}��w:?|��'��P�u7�������������6\vV�<8�N�d���*�û	w:�|�&�J� ?��S5�E6���y�q�#�Ӓ@n���5/F�:��$a��&�|x��JG�O���tC�:n࠽t��r���[����R�����5һ�z�+���~軸���u��ջM�K��/��& �tΏ�>��t�#���Q]��մ0AK�y�770o�b���q�#��c���^��<W5L}����I/����^�NG��/v��nO{xe���a�ʎ�5>�G]���s.-�씪���=�W-�+���������=���,*vj�=r�l��~xG�JG��/ՠ�]� ��=-���u��:�L���wW�t��{5�j�W�����\��~{�#��M�	0J��$�{���m6��A��NG��o]UO�r���Z͚��������>�����ex�w.O2�靀�J%k������q�#��-��>�ќxdR�( ȷZp_�K���c�{�7����K�*>���O�p��#�gf��ړ����J��r��)��nӝ���\t{]ي�Å�	�#�>S������NG���ڰN}���xS"��#?�mK����NL5 jF�����i�`�����+�t��֢S�Ԭ	{Q-�/��'	�}��w:�u��gU�s�Y#�9��(Æ���;�_3}6�u%���3zh�铈��˜ŝ���^ݱ +W�;Ez�\s-�Ȅ�:��>�+�_]�����'���x*]� 9������蕎��^�kf��~�z�Xk+R?�#����;���S��Qu>tiJ����}�7:�>�N��3���ݨR�ɫ�2?�8����زm��<C�]������/X���%����)������� �5��L�m�TGx��t~~�A�=�(y���{�x*����ý靎�/�9~{幸�F�ƱSh7��V��5���3e���T��CӠ2���F/A��c�?�1����izڵ��`r#��1���[����?�T՟��މ��2d���3M\�[�����|H'����?V�C�W=�]�����_Ʊ;'�X��B��7�
Ǐ��R�������~�:��mI�6����4�F3kBGKz��K�����!B[5�k�5cuu�Mw��?���:.u�Ռ�Y�F��xq��k�=`l	���RG@�H�Zƥ������s�ۘ����q�#�u���N�X�{���ΰ��6��>.u�X�Ƴ1�	2j������P��~?.u�C��ңm!̘�X��9�j���RG@��C \����Q�K�$~�z{�ܔ_��RG��撼�V���2I�7�_��3�+���K�_<յ*��xͭ�[��*� �����<_�靎��S030��bu�����^���JM���q�#�u�H*��<z�K4@&�ghK4�����K��}d�Z!�/�|5��(���*	:���K�ò��hӪ_*Z�5���7����;�/��NG���4X��NT�����=����Gk��^ǥ��ֱV��n=0�Ԭ���@�kd'}E�ҿ��w:'�rDj�Ь� BR�����[Pֶ��q�#�u��� ��ҙX]#ꯪ{�l'!��ߏ;����u��9�ţ,�ԌG�������8xl�u�����_�$��Y�A��վ_ǥ����-�MV����M��$�>3	����NG��G�ّ���Y?
h)��G4�,���q�#�ul��4���@j�j�#��������;��?��S��؏!)��g%𗔇S����r�#pΥ�����9����.w2@ec}�O/uN��%��w�~^#�E-<^-#��_����8�QS�*W��u�*�)�T=�e�����u\�^i]�S<?Ў�!��*�i����~o�:Z��鲄���'��Ud�X&Zp���d8�|����j~T�#C`	g
�}\�;�C��['*̧? ��=Dc�5�    ù\�\Rq�)YWκ�j�Hgb�N��o���K��´M�3��yu�\�s�H��go�{\x�#��[~��J��h�&rJ�Bq���=.��8��!mz��cм��O��X�+���{<v�#p�F��S���oK��3dʪ�N2���K��/�cp֘��uu�����$����_��x
�
䩊bd��	%H0 >��K�S��z�ZsA��HG�z����?�upН���k��@���Ww )����杳���NG���]���g�Q-�V�Y%J��k��饎�9��*�M�1�$U�7c���=���8�v�{W�PW$N��P��l��Gy.�:g.��y~hjnB��� �=�P��饎��s�4<lҫ,�����C�k��~�:�>��l���Zޢ��5O�Z\v%��{����K�_}̱	Xg�`y�s����έpۼ��K�ó5_�Uǵz|ejJW�A�E�j�|.w:?|ZjP8��N�d;!4({��/u�oN�"*���Il��'����b���K��/>'��������o	BH���|�#p�f� ���_4w�~D�9�~��|��w:'ϩe֘M��=�4���N]��ǧ�:�ni�-��Yϻ��*��j�]���~{�#p�T���eV1̮u���������_�?�t���P�V�aU��R�zQs�d�b0�^�����ot�j���B�X�|[�߿�8�}x���HTwЋEUc}.9/Ŝ5��xz�#p�����VW��>|��E*�{��.uN�d���Fv�a��S��Ș�{��8q�lO��Z�燐��}����=���RG�#�_D������[����f���>�]��x�=N�y�eh�N#�N��P� ����RG�?FəO!���aiH5v��8a�R��8v�#���jeז�� �F�1UB01u}�����RG��1��ϻoF�WY2ד-R�~��;�_��b=@,})�mR�F�S�k�8�NG��uVA
P���֩_�(_`B�OIɽ��K�O����l���Z%��&�W�ڹB{{.w:�>�-�)�j�QW��|_��}�C��8|�y����j5SwW˜#��T��E�}���8���6z��s$V3�%�4?����t�������4ow�L~�=����������E���To�g�T��9��Ty.w:��ً"N~�4`���Ό}��S����q�RG��g�������ӕg%��>��K��/*���T��`�����,k\4	4zt�#p��������o��qo�8����>�\��|��ܽ���t��z���A ~�}(w:��A!��Ɩ>n���JD8n����^x�#��TI�E �����*�/�ꌚ�fR��ǝ����B4�jΙO�,���F^��۔���RG����kɫ��n����	�0���~z�#p�T�����Q��S�cC�6f�$�����RG�����G�g45�}?�Q/d�x����x��N��p�����*�A��ի���?ڮ,Y�7�(̸/��z�#���Sh�R��z�^e�qܱ8.�E�# ����>{J+��{	�>�9v��@��RG@�K���0��ǈ.��\.���b/��u:b���l�Bg�ֳ���q�l�;�M~_�#��}�V�WF	�	c�|��/��"���;�'S�"�=�%as#>���6��>�J��n���<n���[J	 � �i�]ăt:�:6�'6)2�T/-����k�ܮ+u�z��98����Z��h���b9�SR��~�k ɥ�8�������K�^�S�����6;Α�����d�'�N����1����'\���xZ��`>�d���@�y��RG�w�Q�,��޲Q7~1����Ls���:R�;
@[O0y�o��P�@��(u��o�T:o�)�3[=pn��2x�`ܧmՊ���:�:��8���9�v���QB��J�m��q~���܏�A2%�	��cd�>nM�0;��t�OU:r.�2�	�U�N�����5 ����:r.�s�3D�la��d��b̸0��E�# �Â�V �Ȭf`Q�����������xyv����� ,���n��.�y�N�#��S E7#Hd])Fq�M�vg�NV��}Z8�����T`F,�b�� �����-���܏ֽ�Y����`�
?{���p�GV�i��G_,?Je%	�m�H���)u$����Kx<�:���4�,y�t�n�:�+���X��H1�����������RG@�#�2�-r��xH0a��.�vsΞ�������L~��[TP=�$N+`�`�E]�NG���'�����J�_k*�� ���o�����7����� �p{��X����uQϯ�x�>�Ȗ�0�.|T�g$ػ�4��E�#��+��$��s"�T���r�o�:£(��Gtc�YJ̋�E�1 �E��NG@�ř�V��!�[�f��m�߹�_�x�L?������p͑l�O�CJ��_�RG�K��.. /v��6�f������9���P�x��m#��`b���M?G'k�ڐ��E�#�u4�9�o+HK�-�*n��4�y�����|ve�,�XZB��̠E/z4���z������i�{�rOI����?k��@����xJ/}�� ���f�lbߎ:ξ'{X��>��:�:\y�z�|�͒�'-�0��U�<������[��n����=�@�����<^�RG��`��!O�,���B  v��)����:�:�n9I����3 ���[ "D
-�hǹS��]l2d�JB��o�I�F|�%�8�:�#�<�ʆ�%)�@\ؤ����\���T�# v=r�lQ`k�~��<��AV�_\����t��K��	eA{��ܕ��S�̓#N����NG@�鮫u��Y�H�M�|+�ϳ�������u(u���p0�bU S�p�n(A�J��T�# �X�Ig�� �t��-e�̹Q���cv�=&b�;���>Hp��$C?��� ���N�n�hx��A%�s�1��F)����V�(%�� ��n���᧺;��J�#L�|��X�'[�u��3ykp,`�~N�# �0x 1OY��F��R�4�|:�X��p�GJ�Wc_4�)�bP����8��:��&X��;0�Z����qao��|�ǔ:b�9�|�K�TKwqO���(�����RG@�~�=���+�d�:|۳= 2�wX{n?�:b?�a:[�X2Y_��p��b����(u^~�Y� �w>��=+��T�2ќ�1����9�*g=s2��P7�ru+�i7����U��=10���l�l�1l�����?���w�#�3BR�A�-:�#�i���cx]�# v,X��쏴�b�����1��k��S����c��{��ga������\mG,�'+u�\&��pe�P�� ���sQ�+���m�ea�;�N�M\Z_���~�3,�)��O�PϷo�����C�# ~���S��ES5FRa���5j9�J�0؄��"��9ġ��őe��9�V����U��y�$c/(��qcy��-��y\J�# ���ϲ�	�Q����,e{�pL1�p�+�:³�6.���<[�;�N�w�t~.J�ٱ�a>���`X1]9T�RR�W*uĞz
���!5�D������Oam��RG���ӱ]�l���$� ��+a�s;���S�x�#/���`dفO ����*u$�� <�f=�zp��&�%1���eҹ�S��x�l��t���c�G�:-��7(u޸%#������J'��'��8T��\t:b�&dw���7��F3k*li��b:Yv?p,3�
16�NL/�K{�����8� ��c�
�_\��e{�
\%k����RG��ͪ�T����D����܎)uĞ���U���`ZqLp��\    9\�S�����5C�U2l<h��f?��.�\�|?t:��U�5RO�#���â6��~������d�0K�ے���u�4�p�ou:�� �"��� �NWR��b=�c*�ֱa�8��Y�`H���*&���N��������,��f�%��=�0ve/\�r�n�:�{)w v}$�)�/��b�T3�z�J����H�.�,Bc�#�����-P�'�t�\�������Q�}���k�B:��C9�*����,�!�Fr��y���G������Q���H��:��d8��\����;��:ُZ`c@�w�:z`�ɶ�����U�H�r����A��6�aVX���9܏�Z�s>���n3�R���p�L(i>�O���~�t��K£�=5L�t�_L}�~���/��RG@�K6@b|U��<l ���|�a�YM>��J�7~��2Y8���'�03���/�X/�:���
{�DϢ�0��c����5g�E��RG��/u2X�8��B�F�+�o�6���]��t:�~��x5r�y�%^��R+�� �E�A�# ~�%8��p�g`���F�bu�8U��\t:�^@�+.&�����U��w[:(�E݅NG@�K�Ge�x/�Y�޹ӻKd���<n���{�����aiDkx��	�-�E�����:r.&���s���A�����r��vq)�����ȕ����l�������d{���sQ������֍T�y��k���q��J����?����E�G�r&�j�FT�	_�-�:� N�DT����P�[�V�������^��ـ��\�\ �9�x��Y�әqnו:�?�ǅau�ߜK�R"��]#��T�# v��o���yO���o6>`x�������8bz_
���»��=��a������ȻݛM�� �g� .�Y�����ؔ:�cšc5ӖB,�:�
%Y���~(u޼X��HK���<X@b�](�q~_�# �6�!R�`r4�����	Ќ�>s�7u�*�c0�3V���`=�?\�VL;��)ud?fn���C^��@�a�?�^|ۺ�oP���0pz�q ��flE�>&&<�X!8�:�7������5��s�t��
!�L˞�[���[���Y�G�ҩ��e�Y��x\�)u�ߚ��KXKŬ��+�L���:PuN�~N�#���G��[�ؘ�kT�oW��|i~_�# ~n�*��,<F��b="�u���twP�oh=��j�X-�	
}�9z@�|�S����t^?ǹ7��v�f2NQ+�P�;@0lY�<���x�؂�Z��>t8۞X\^e���s���s)��(�	�Ź�����m*v�|?�:£��2�%����:�-��-�xQ/���z����c�|�y�!��1��"���<���x�,Xk��٫����~3-TQ����*�e���^	[��y{���Q�.�V��?t:r.@J~�񬢓ʩΝ\��9kk��1����[���^��y8?h�v��nlI|N�# v��xˬ�\s��ͳ�'�pw�~S7����gJ�P1K=�>}c�jY�|��z~?�:rO�²z�g�('���ҙ�e����c:�&�O6�o�S�y��+�����.��NG@��D`�AX_��4���7���ס��uL���Y5�P+3�
`+�����/��RG@�X�l�n$�z)���e
��6�x��W��q܄��C6���>x3saSq�/��:��1�©@��-Y�~w{�U�9��=����}��a�R��`D��M`��"���x����щ��-��9�	䡕O;;���{�o�?9�]t�ZC�^2�j"��w.,ҵ�ю�t�-��l�L��>sc������'�C�#޼:��yU��-���^�U���Mu��P��s)4��lmg��K�L��X��~(u�������*q:�炳�3`uv1y��P��~�A�ʜ*����ܰ��a�����{���:��1I�n��hÒ+�Q��^ڞ�C�#�u�0�LVKް�y��_��.�?�q���@���]�L4t� ����FjO���c'�C�# �0��0�JH��@�7q�	݅�y�n�:\ǎ��9��Ź�~������x��xJ��d��[�+-[�qL�¦�Y�����t�\,^���%D�����o�}]���*u��9|a?<���X���;��ŻU�Ȼ�
L�7�)���"�����v~Ou:A�t6{0��Zꡘ՟ʔ�g�P��|n?�:\���cu�t|_�E'
�P��p���\�:��4,�J�+�fKh���tiP�~��S�����9g�L@��*�[��ǎGk�c�xJ�c�=U��l��,i3Hŧ�I���C�# 淚h	���0�]�����/���=U�>M�i��.�]D���\7b|��c'xL�# ����
_�@� �" B�dq��-@��\�:�u`K-�#� N+i��d�?���u�t�\vdyr}����l�
ς�u�jڹ�S�o��`w<��Pe�����X�d�Y��ܿ�t��יL-��4�����q]X
 ��9�:��:�u��&���~t��m!���>���:��	����N������&E���֡�;f�ƃr,�K��$x�����+Ӝ��RG@��p; z�{���+��`S����U��vl�� �[���>���6y�p�?�:A�b��NX-[C�Q��'�B������{6(.)(S�C�R���5�U/�NG@�-���0y,S��v��¹�Z� ���C�# �t3;��.G����s���@��s���:
^�b��t���z)X] �j�d���P��]�9�<J��o�3���*�9�8�/J� �
�@$OrLuK	x��62��s�����Ұ��zkSξ03Eq'w3B��>��J��~$3n��������|�n`�ٟ�u�����2\1��CF$�g�L/؎d����RG@�K�c�	� ^��ʐ�$�rl^�2�����~8N��~*��uoآ�Ƃw�9�K)u���@ݳ���xZ�]X<�s�}Ü���������B,��o@�ޘ�`Qir��yW�# �Â�q^�cE徾)KbJ�A?���P��=�kTK Fp�����H���`�y�RG���2"�5��B(��G9��q�D������ࠞ�� ��T|��3'�3{���:�:�ng�{L��3D�	�Y9j������e��xP)H~[QX���
c���>/Jُ:M\��;X���LP૗�0��T�# ����b�%i�8�N:����`�g|_�# ���`$#���98���W��X�?��;��;����qn��Th��*%���^�"O���w��U>��,p?,��q6-~�5������'���= m2o�FP�;k����E�# qK� P����'�>5��Ҫ��jn]�}��@x��;�r{2�,U�a�]Ϙ����9NV�����2��bذ��!t!�nt��7(u���t�q�D�b���3��8/���V�# ��%���hX��7�Fʦ��c�0�s���x���%���&�gdLmw�P�Ȼu.5z&�Y���� v�R�E<Y�# �v��Q_�d�++��#]��Y��)N���=����9 �狫� ě��ڽ]��td���r�=�?X���0I�|_�# ���<;}g)�"�b?�0���9�Ż��H�Gl)�޸�����֛M�Q���E�# �Ť�8&H�ߨ�X��F����O�E�# �r��_���,���G\������+uĞVCf9��c�. ~Ӎ��Gu9*�7>�:�#�rX_X�&�o�[��®�t�x�u�a�8�`�P��y��&��pq\�����ltm24F���&��Ӵ'snO�:�=�T�@1����H@�'|n3����x�G�����Z��    "!gs�H ����\h@�줞�c_���0��x�z��y\J�# �h �s��r6i�x�]�ޖ��\�u���������+1T�-��Y��nj���O��d?t:�����0���'^ǻ�m�\3v�W*u�\*')gO����o�V�ܿ~ӓ������v}��6�j������](W������.p�h
�(����T�s͸M�xL�#�c-���I*o���>Xw1b-;6�/��NG��k�,��j"�	_�5�,�����s;���u��V#���Y�ߧ­��t ��,���������J�%���J�x+��f{+�J�R�aș"ĕ	d��Y@AX1���C�# |?�����Y7�n�0'�4�. ����x�@���0�	�>O� ��s��a�:o�#��¹�º��Z�A��ܞ*u^�	��&�����:����M_�JG@xv���Y���s�s�A��S����W*u佰�u8��:�ˁZ9=6�\v���Jɿ�i�2�8!���5�lk���s���{j8���g{��E)i�9�mA��HK�������lqKS�
C�*�X ��|�v�ŻU���0U�c1hX	R;3��Q���{�?.�1[���0f&��s�ɸ���NG@�-_m�0y��#�s��@(��.�_�S���[o�A�qpc�\�(0��E�SqI�yH�#�ڱ�op��� �d�Y���̙��[���܏c,�<{Q_
X����8��4~\���t���uwa܁u㜃G˚;{D=���ulJ��nd���A<,�J�LǼ�ڜ �/�?�:o}�o	��V✢���S�St-�q�ǔ:o9��=s����)P'5A�o���:_?��'�z��Ro�{�3n��u:�6`;�F��μ�s��ѻbo�NG����S��YDS�pH��S]��c*���y�����'�:&'u�a�R�u���������<u,5ˆ�9�ewxj3��T:���f�E~U>��i�.��5���*�~N�#�������%��vV>��R�z�J�儳«�@�='�8�g�*�������*u�\�-��-�<`�r����ۆ��ȋ)u�z������>`���'^<��rnO�:�^*b� X�sd�*N(�s�n��\�:�o��� .��Ä�r;�[R3A�9�S��~P8�fR�	�G��g�6a�����E��z(:��wkw���92�ʨQ'ՙٰ�����`J�(y��G\��(�	iz7`��T�uCR5��P�����ŒO�eމ��x�v�[ ��o��_�RG J�%�5�����nVS��ͮ�l=����P��7Ŗ��$�WR�(�Nf\#��]&��u(u�����Ԩ�>>����ּ����\�:r?�&k1E�7p�Vc��{���������P�Ȼ���:��w���LpE��0��yj?t:Q�Q������R?O!t*�$����~(ud?��nEZ0�����_k�e���y���@���Jba�؝��ɐ�^��m����RG���3�A�-뚀#;;����{��C�#��cdʽ�b�$���w��80�	#���RG J}���B
;y��b�8	,f�L*�����NG@Υ��>�Hj�yV@i;Y��p������~���F��Q��K2�Pra���C�#�#��[B��|�K� A]Z�ܞ�t��A���#a��p�<�b)P�v��8X�RG����PE�x,SGq���wâ������Ȼ���kt�yQ����Ϸ��<%��=U��:@����)�v�������`S���*u �t�����~ސv̛F�w�o����NG@���8�z+�J ��y4��d[F���\�:�O#�S�(摱&oؿ?�N�����*u��9��
\��A�m�~�7��.�?]�����:�4X�\��;Kݱ"�d3kl}�\���R�g�r*��LmvϦ����Ӆ����:
�oH4h9���1�h��p�_�:�~ Dφ���E=%V|�Y��c�|J�[@��?
�v�M��jO2��9�J�/&L�UDȸ�m1(�g�����s����캁�3��L)v��+�c؄Ud)�<��:9�/��sq�D���C���tӁe�=�J��8ǁ@f��=-@؛|e��Q��7���8>l"�ޗ�l�����:�:\GYi[�_�g����w�W�A�`{8?�����\ӠC����*�}�+|%�;�J�٭��c��%��?��Q�p�,6@���t��Պe�4`8�����"�������P�p3R�˱Wٰ��� �К������1������u�`�!��:A3,P��1���RG@�QSc,�����`l��U ���8�cJ��[����Ի`舕S\+5�uk��tJ���'�d���6���@��0J9��'�*�p�|K�q�����4�3 �s{���wke#s�A5`��L�M�8�J�/��`�)��OB���#��#>^�RG@��h���<��0�t�s����M�X�RG@�\�M`�ߒ���.�U�c�i��E�# ���-�A�X��GV\�\8�f����RG��Ό�c�l�m��F��Onz|�u�~_�# q��C�m?���&�m��:�p~.J�k�
>aj�{��舓9�)�b<�?�/J��&�X�Q���R�F�<~�a|��RG@��>>�z�B����YO� �]8�������{x��M)��oi&�皇rγ�:�_��:[�q
�*p�EZe j��ҹ]W�|�Ʀ'�%,���!�p�n�u~.Jy� l�r����׀��'Y���鍦�����ر�[�<��(���POp¨�6/��:�+�18]�0.�p��u[r�� ��"���x�����x\Ef����A�q��8Y�# 8hWg�P/���L�Y'�@������S:�*�7n�G#��S�W2���g?�݋#H��{Q��~���I����(�g��pƚ��paO�:³K�j����Ap�cF\!�+[�.�?t:r.O3�e_t�m~�'�אB���~�t��.M檲�Z�"Ձ�q� Sƺ������u���evCKܒs��� �&Ǖ�E~_�# �w��`�V�y2X��x?b������a�:����:��4z�f]�`4;�T��=U����.�j�}�����'�3y���EW�# �� Er&C��:F��&�5F������\Y̱����4p��̫�^�.x�NG@��^^F�ɺ�u�
d;7>::<�p���:�^bb��!N�o��/��V߭�1��~(ud?r�u�w���w��8'� A����������SN=��N�|���X�����R�# �a�.^6rF$��%Y��9�����`��)��6Aĩ''=,x��uJ:��g�΄>�(�6i?�
V���+wΣ�:³�(�	�x���U7è�l��{���:/q��|�%syزc�r�vѦ��E|L�#���80�4.�^v���jsm��������NG@�ysN@�L~�w��9�sF��|����CaAL���[rן܍ύE���t���\d�`K;>kȬ?u70}�s����L�T�,pMM뛑��������V�# ���:I�y?��d�n� Iڸ,�~N�# ��Y�͜j�i�0h)�7�<Vh ��8H�# v��A�5O���í�>EP��3�:�S��v��0!!�MX�
�����]c��~������1�g� �#��/�;-���:�J�o�{��x��0�,�@�\�^xOV�������m��GfWke�AJ�K��E��RG@�,�fJ1�O�W�Q�������9��J�/��Y�8ؒ��3  ;P6X����U����Ix%�(,�
���r�ؖ���RG��|���
%g�y&�X)	�9�9�cJ��U�1����0�@D������     \��t:��r�n ��{Tak* }��xO��V�# ��D��pp�ui� -�".���/��NG�S�h��7�/vW<��='�S����{
H:<��R��Ѧ���ɵ��{���+u����)���k4xde7�ňp�xm��:�c#�ϫD�����\+S���)u$���u�2=ח
��U9],�V���RG��[��Pw�5B����wR9�X����RG@�ǰ�{����%�lf2||�֋��RG@���	V�a7H�[�=�{���q���E]�NG@��Pky��/�S��c����ڋ��RG����R8�u� ?q��X��^���td?@�(8��:\O�$������E�~~?�:£���Z\���<���:��^��*u��0f�)�;���%H�_sp��|~.J��J�S�X�I[K�k���8�cJ���A'���Q�>Xl��g���"����j�g=�0����܀N�*��EݧNG@�i�+s��.RB��� e����&>����Q���1�W�+����Y��NZ�#�l�1�B=�0ax�nx�i��o���ht q.�q�
�����:@vn�ס�xׁ�3`P-�$�_6��aD��A,a}|��x*�wú	���>H)Yiٌ�&����u�t�u���-8�<)>ꪴ"�g`I=L�����P���`�6T3a�V���.�G�U��ס��Υ��K'�(:^�i9�SK�_�9^�JG�]�)¥�� ��i���4zb��8�*��\bnŶ��:y�j��>n�r����s�����c9��f�	u�]��t**�v��������:T:�:���Uq1�CM��pEv��WI�V�#��S8�Iʕ7�@����?���8����=��������;0.ը��p]������������|�R|M�U�c� Y���f<:��];�*���Ka0�
��������8�����S�����[������:��b��L~e�Q�����~ht>{=�4[ ��1u6��3pmJ6����C�#���圳^IA�����ZI�vL�#����4��[)����S����m�v�s;����#���4@pɁ%���?L*y~?T:�{���j��8n���yS���ʭ�������X>��N|1�-7�[��X;����~_�#�Ǳ:n�4D�$;v�$.�)؄9�c*�w��w=΋b���:cL0��T�#��92��t���:�Q]�.��u�t>;����~�&x�4�L��`����ϩt���C�f8jԗWi�vw0�]{���ϩt��0���A�!����Fp6�-�_����g?@� ��a�c�n�HO�Eܟs����xT���ꅼ�uJn����T�9.T�|�6�hY	�����Q��݂1�7��v]�#�c�FS�Xs~e�с�M�a����yn�U:�:��`Cj���"Yp�	�v����S����oM�fQ��"dL�鮱��`K�U�,8Y�#�K�y����� �yz��#�jl��s����pH�.R%":y�1�6�ӗ�5��S����n�-�pg��p\����E|L�#��S�߼p�q1Y̹<���7_��|N�#���H²j���8�n&7X�jm?_�JG�ۏ��fjӐ����,�a8)�s����-��V��ʒ�,�����`���wѶ
D�9�����j���U	(�s{�������Y��2�T"u�E��N�K�<�*�o?b��z���'�4s��f-���%snOU:�=��H�$8�d)A|�6;�,�9����gOWZg��k:�5@H���3Q���t>|����c>x�6�����p6ݺ�èt>���8���h<-��&cK�5B��P�|�(�lֲ���Q��_�rB � S��ܞjt�u�^=~s8��|%�{�xd֦<Z�^�9���/l�n����WS"�τ��x��\�[���g?v����:~�ū�.a�.\�s���� U����>�u˹��Pa!�?��{Q���l3�B��:�ȹ����������*�/�ae%��R7�RZ���2��94Ьs;����K�$[<B����"R͖%�îrn?T:~6����s��?�"�i{,��~�t��%G�x�D�8����Lb�L���jt>\ȔX���N�&�T�� ��ۼ9����]�����)�9E��G����T����E�#����P��H$.��dq�|����s|�����a�jw�cܺN���K٩x;�|*�ώU�ʎ��U��s^R�3Xqܸ�ӝ�S����v����9l]�aV��0����t>�1�e!�#�V������2��\�y��JG����S���Y��[�H��ߋJG�]���f���{�D��¸�C>���~x�R���ϣX^e&|�����\�aT:���#��bp*��7��6��q����~�t��#��㓒�D2~�J2`� �k���d���������I��������60 Ɵ�[���wOwr�� ��:����a� ��p����JG�/�ሎp+X�6!�a|�9�f����V�#�����``\�8�P;װs�/��u�t��m��B �Xp3̣U_�9�W�|qK0z��8��iln��+Ü]��5:_��6�|��V�� �@Fc�πB��t>?�J[k�ǰ��	�eR�=�
̴f��sT�|��Q�x�\��7��Eq��u����^+����42��o�XSl@1�¿�t>�1)B;�b��\����{�tQ�����%2 HWd>��GaD����b��ܿ�t>��߾`����	�AJ��`�2�|��k�t��G�l��+�`U��	96c������#�!� yv��[�q��i`{/x�FG���R^~���`2@��p���rn?T:�~8|� �,B�E��_YW���7�T�#�P6J9V�*n�ZHA7��0.�Ź(t�|�X���䆥͔G��^��]�����n��P�8z�TE"���@k�{8��*���6������-;�_���5�s~�������3ɩ��GE����\�`�/�FG�{�i��xV7�~!���$���g;�*��z܏��J���|3Y�ΝaJO��C�#�WOW��rU�z�8�f�n��˰���E�#�/t �*��b ��i�fP���.�0*���z����� D��7�c�6W�W/��JG��W��P,'��L�;�� ��߼[����n��Qz��\sRa�D�з��]��0*�/dM%"~���G�P�V��}��.�c*�8�*7�JGG�¶�����/��*�o?��Ē猼������������t���9��}�l=,~K ��W˶���FG�/��c��Fah�D΍L��q�_ԡ�t�8��xDO�d �
��c��I�E jW.��5:.ށ��3�-�>��q��-� ��������6w''I)����^�ΘdK9��*������W+�Qٳ�r~T�������?4:_�������[�w���2-�Ќ�@��l��+�*�x�j��l{v���JG�������:��'�"S���f�C�#����K�l$`ȳ��3���v�Y/�*���m->������9#�0p��T�9�*����S���Q $S$8S���8������|�w&�}�T;L�n^\�Ci|�
��k��|��@�Ë~[��O��`�u�8����JG����~�lK|�9�����V�M~_�#������T�bN��ҜI������ϩt�{jY�*BM��p��/f66c*�v�OU:��#�1p˺����T�b�X,���GV���dN솣�@и�%9�ᖤ�����:T:�t\L��������}��Ѻ���8�}�j��c�ԇ�ul���li���.�J'���,��    *p��e���_6�Ӄ��� �1�[[���,I`�'T���\⺨��8��5�d�W����oۖ���cJ��p�ɱ5�sͧej�l�[��fx�y~O�:N�N\b�NL��Ng���XB�'�td�%\L`Z�!u��d���d=���RG��(8#ǧU��<��8g/����kY�/ps�<����V1�(�^�n��V�_�8�o�W�<;���E�ű8�ႀ�����RG���xj3�!
s������n����NG@�GM :���&t�u�L�w����UP�ȹ � i�gS�"�ñm�[�ń<R��d����K�}{f�)<^qH�JMA����P�p���J�(�՟�^@g�l��w�".������@F��3�L�^���:��	�s��:�-��N`i!G���� 4���s;��;���V./
���yd��Uf�^�i�t����'�o
��q$�I�kl�0���t��Z��O��YzǢ�J�z-��R���t�Ε�Φ���X�Ӊ�NՇ��S�� ��X��k���lM���0�u�e= X��u$\��v�R�,������V�# �3��e�
[ܲ��`��i#�M-�s���xq��bn��'�C[X,mq��u�/���:"���a8U̳聩<�ؾ+{&������S�o�&�J�F��8ˢ�_��<
lf�5U�?`.(���n��v�#]�q�:��� 8��2C�"�y���:@�ޣ��tJ�s1��lI�y�h�,v���*���k�_8�
�-2UX�%���3�^�E]�RG@��+��bU!�a�*Ŝg��5�.t{�:b�]e_c(ü:W��ä�`� ������[�\Iy��| |^�3����ʺ�A:�׎�^\cA!�X�M��ne7fYxn?�:rO;�{+L�K���"���G��z?��:<�%s��Q�W�����\������'T��{&�Po�|8cS�e��L�o�4݅ΕNG@�G5�&lɮC���l��ʭ���<�RG@p�X��w3��\|�{�Iӂ@�#^�Ou:�nݎ�G^�!����Z���iRѾй��ȹ�s�,�R�Z�
����U��RJ'u��K�['Z:�.�
���sJ���W����O���=͆a��7�/*���VW<��gFż@1���[uJ����K��neλ%'�)����]'����5-S��8zca���?/ʠ�8�E�R�#��z��3��g�7��<���؉U��d��V�# 8ٯ�@b)�,��L5��FkF!�iyd����x�b�/�v�ȯ�.������ߋRG@�����-�)�0��R��`B������pL��L{��狔:�'˶��y�N�# 8Ȃ���`k��k������U?�/J�A����X�ehQ!.<LgЎT/�O�:b?�����)N�mI��%~� `�h	�# ���+U�����f��	�0��=U��q�֧��-:
(W��/ܹzܝ�#�����9�j�[�q�a؅�$̨DH@��_��t��:�����U�s[��z�
@]ʼ�!Q��:v�=�{)˜f<^('E챃����|
��`T�	<�n��0�,�mP�_�H���V" k�ه�Ďk����U���v�;�V��Ё��I��U��db�����[C�M���Y�
��Pw��8<�bڀ����x��#Q��d��2��9�5�������J����k��=�c�zƹ���A|�E}�RG@���ay����|vVLwC�P�����u����^%�*L���p���<��l7�C�# �v�@ݞ\H�����^q����[c������ۀI�T�K�sf���<�>�RGୗ�xZ�+o<���*W	����.ދRG@�A6��װK�WR$��yشn�9oP�ȻPf�A�r ���$~n}\��*u��Y�v���`ɖ}@��(ą��RG@xT����񉐩M@B`EΛ�#&���_��8h� ��H�ٺ�#q��=9�L�ud}óS�`�
WJlF@H��U���F�A�#��o#+ب��%�?}�#�M`9a�.t{�:�P���R`}�f_Ҥ�ŉ��tqOu:b�zf;!ޒ������w��)ud��E5��DG����7�#��/t��:bO}�uuNwgr]��6X?�q���|�RG@����6��Wg����x,xс۝��RG�����E�%��g��U�z��B/G�# �#�%#n����b��?�d;�Y��k�k���Y_�|e���xZ0y���y�RG@⸕���cw BzH���k>/t��:����p@?=W�cK�����1 ���/�E�#��K�=9�A��C���(p5�=c��]�NG@�0��R�Sp2���]�f����u^��Weˎ�l�3�����,�JA��'+u�{����Jd��0���a-X�E�NG@��ٶ���]<�ie_�����@��q�RG@�O�q^t3�''\�t�M8)�b��?�������D���*e�oq�)�J���E߫RG@�K��iŧK������%wf�Kߩ]�(u�\ܔ���0����Q|���A{������Sl�e�=qr��,�����:o�:|J���N��uW�*M�g���pqO�:/.d=4�|��.g�S�f8]P�_�.���
�5��ݱe�m��{��_L�# ������$�m���ɯ�ox�b�/�rt:�^z���:6�5C��ıv��
�_���h@9|{`k;S�����4v��ZG������P�ڱ�0l���gT��:�+�ʞ���)U�����>�ZG@�`:s��l�6Y2^2,�h`W���.���:���i&3Ro���)L]Y�#�t��C�# qK��K!�P�� K��9I;��z/�+u$�i`mv����ԯ�O������x�GV���^�E�I�~t�J�D/S&��E��RG൧�W�q�v`Ipo�bW�[�C�����u��y��AF��Ö����E�RG@�sBтS��%@Y��� @1��u�J���Z��ω.GX�a�:p2i�E]�NG���Z)��!�dI䠬�$�׭�� �����xIp����얥3I�2�#]:_�RG����+?~y��9��+}]�X�}�����b�n�;�g9��Y�*��y/Jy�yy�U(~J_R�]��.ip��+�s��/���X3Kg�Z�W�b�Ϯ���$�����X2�͔�f$���	����C�#�up�(&Q8��F�О6��7@O���P�#�%��cW6Fh�X���\�W���:��&�P}Ku��#r�;�4b�0����Rg`�f���Ғ����o����e���(����|�k��-G�#�Bl#���os�U��=m�5<�O&�g=L��a�ag��օ�NG@�-�D�'�s�n����R§�U��RG���w�<�0U#��H�e�<�0.�+�:\�d]�bJd�f7�5Kڽ(]��NV��:܄�����e���&��lJ���� �1pgA�݃��S�D\�8r�n��/�RG@�����̟�}0��A�bڍP��:rOs[u��0��9�q���[n�NG�K����e�'x4���#��U;�8�J/������`-�=D��}�qn1_�9*u���^3���?04V���-���s~O�:��H���qF�O@��`��.�s��:r?��eV|
[�Y��r�8K]����	�� ��;tf�)��^� f�@c�C��[������KC�3�$1ex�d�G���.�Pt:�^v��x.���J�}F���u�����o�`�}U������$�@����7��*�#0�������J)sŹ$�~����l����9\�ªL3Y�@��-,��	 ���/��t:���q��`�#�WV���'@��7z�:y��pٌO��uE����
�"����u��W0:\ֱ�Ő/��|�!�9.��t:    /���ҞD��0�y�ȩ�].��RG�}/mV�@]�ZDf<9a�͓]�ZG@��j�<Q�����\X� ��ָ`.x�RG@x����ҽ��9α��������1?���7�F��e�w`۬�f��w�����u %J�:���xW����F�w�ǧ�<6X���-��C���մ!ᯜ�_�:��&��b=]f�-[�*;?fv��Lߟ�x���N,d�������b��RgV�BWR�# qC�k�Mgk{c�tc��E~_�#���n�x�:SZ)�:�1��
z���:rO�s0��Y���2NǊ����\���t�\���}Ӳ�oR�u	�SV3 �6�~N�# �#:8@!I�˃��l�3�T�K8�_�Ȼ���l,�������@��"�Ms��:��Uˁ,e�Lg�(�;�%��s\�������b��ه��(�$q:��^<��:/��<����������8���/�J��7�2�A����ؿO3 �sOu(:9�#<>�d��-*��=��,r��z1wE�# 8hhEa�.�s���p#���RG���ɮǎ���:��v;����s9�kP-� �SA<�A�ڒJ�yS�����h�LҽD=i�Aɝ4���?��ĕ:o��a��w񪠄�[��&����E��RG@�ޖ?���8�	���<�p��|?�:bׁ<!�b��� (���6�G���W��yM��ȺO�U�	���AͿ��:z+U�.��;���eN�7�M��������^W�9+]"AKa�ĥ��K7�C�# ~�tk�W��	�pq$ܲv��7���q�9��;�.��� ��j�q�B�B�@�# �c�48��������̙�k�}kJ��ǭf���u�e�O��e(s�u:�?&��5�E���Φ.mW��ySO���0AlY�WD���a;ȓ [����ZG@Υ|�Vn�TL(�c(3�;�BgB�#���zIvJ|���xU51��1kǸ����x�^.��E��Ā&�<�\ʋ���:bOg�+��05��fc�'�O@��J���Q��u9���\"K���Q)�|s��t�3���;M���o�vk?�u��o��:�:lm��OJ�o*�c�~�4l)����(����=�\)� ��z՘ۼ�}��1�����5"�"%ze��o�}v~ؾ�k��e��,Q4O�W9�*����:r?���<
�IɊaE=����w��.���:����P'�o9�n:X�R|�e��[����u@j|M����Q\�n��0`xܔw������uV����q+�~�hPi�zl��{������c��U���7�ܮ+u'&n0�ǱxK굫�Rl��Į�_�>ݛڑlf�$�������Q(ƏuĞ:v%U���R �P�����x��^����� @�ֲ%��A�a��Ծ q\����=�ș#W�e�j���A�5\�����u����c��T�vo�uvGQ���{(u$�`#��B=�G&+y��<�G��cJ����3���3��'#��VXʤ
ůu�\��λ�yѓW�ԥe9"��_�Ȼ�5��/Ϟ�����s,���/`��:o������f�{���gv��a���)u�~��-��-C-��{����7��:�/ ��%��̰ļ1�j�:�}.��NG@�� g�Ʃ���ꩳ��B��|�o�:r?��������6�c]�s-�v���~(u�\V��%�����0��"!���K��B�A�#����~��'S5EtqLԳg6�\��RG൧0y��3̞V�ZVS���=؋{��\��X��E�J���9�X���%,�u��o,���b��❃�y��b��������9C��8����+A1XI3��p .\�G�t���~��V´����y!n֛���A���# <{��Y�U_�d�[:N��)�T�@�# ~��7�q�(�z� ���0 әuQ���8n7~���Q�I�N�Z�.��RG@������җd�;�6�8�� ��/���:�S�0�pE�h�űM�g~��l����O#��XR]�4r��e�,S�-�ZG��n���Ih_O��L?�`
g���W���c�G��K�2>���Ф�|Oͻ�|�RG@�-\@
��P��͐���[m���f��RGཧDA�>���.��
3���:��]|����ǌ�0<����訫���3��/�܋����[縀9�y|_��i,��������~�K��x����f�t@�Ń�V�1@�k���փ-+K�,�Y�S-�[����WW���u�T���9a`�wm�5k���AJYG��`N�Ÿ������,�6��u1�W�#�����2|q%��mx�����-/��:����������;/��9��p�j�2Ҙ�����~d8x��鲒o���Cz��B��w^����s)ٌ�� �*��Ftpp�ڰ/�J���C�p��j���:G���n{�rQ����:j���e���`�K$�M9ƌ+�/��J� y�D2�����^�n�JH~�]������2W;�uV�8,yF=N��z�J�C����W��K�a��:�K����� ��x�dj�:�9��%��90}3K1y���{.){���H�[��Z����u�_L�#�ul�A�>���0*�������Mw�����:&�Ud�+�O�O]�q����p��=U�p,rT=M��
�9����c�L�y��@�:�nc@�����f\
��{��5A:/��Jy/��2<�!� Z����j����t�~��D+7q!��� �>�;(u��]�W��@?P8p:`�^<:���{�����{�l�:��l�P���B�\�#�� ��P5h��{'�{͏s�u�s�����+��=�R/l���^�]�5*u���
d���}8��9Ǫ�]F6Z�s���x�-���T1��|4�3D�(!��.�-�:A�-M�w8I
�ų�Q�&Pʽ)�kY|�`" \�z��3���u��|��:��Z��Xm%��;�~S�d �UA|����E�# v�-����0-��Î�a\X��b:�L"`<n��Tw��P�Aؿ���NG H��p��}�$y1�Le�EfI
�z7x]�# ����x�f�aV�N�  =mMW���.��:YG������>��-<��^,QbJ���V�# vl��6�EU�Ɂ�����.u�8H�# ����Ś3  �R���}V̶v������u�N�'{�-��L�@�\��5�\G@�m�h�]�k"������P�/�Ou:�nC2L�نu��[�W].�ۋ>�� �1p�3������'�y֨l����xL�# �t8� �[֏�-aT+��q��5�t:���>��E���`x`>WX�6?�e�6�SE)P���<Sb/��7s#u:\G	ˀe�Js�J g.^�=9����u����6G|q(�s��� ʌ7������ZG@��ó�t�E�2��80S.��:���«N"�_�Yk��&>r_�����[<�_3��]Ok�ڮN��ٜ�?�����n��kz��u�KcZ(�](�wQǦ��{�~&�����R�]��u�:�c0�+Y���@������`����������]#����R�b���fu�o�:o�tPc�j�ܕf�z]��0/��u:b�}�l#$��x/����D�*�ZG@x��@����[�`�2�x)&�~�# q�.�@@�!Sb����ťb�]�^��NG@������S#���ɞm%0��W�s�# �����y�.�Pe�����c�|����<�-���3^wp��fA3���Yԏ������T}`�V1���hڀgbqʬ��y1�P�# �QF2��VNzO��\�+�T�k�[­|I)0��H����v1�6�    ���:����\�)s���ݩ��k�I@�t1�^�# �1�_�"��ǿD�r2���9Å��RG��G:#�K ���:�[R�ܶ�|nO�:bOm�=2��[����$��p�]��)u�\�]w�O�ʇM���Om�~�.��:o~� �� l�9��eh� k��.�RG��K�ʴ����v.��DȄ_,4�B�M�# v,o&XcO]8|��o0�yr���k9�c`C�1\pXx�}[�v�E��NG@�K�,C����|�Ȩ��,pu$w1o^�#޺>`��q.�:��P�$`�[���.�H�t^<֘��֑�K*\X�e���{��<�RG@�i2�~�� eqO=��d񀓷�zJ:��p|��*MGHtJ�s$l�>��r�_���䘷' �d`��O867��;ǀگud@~����$�n6#�[�S��/�J�#�`Lʦ7o�!5u7X%��/�J����3�$Ժ�7��$w��E��RG@�>L,�g���bω�l&x"���ͷv�_t:�_Q�L�~K�Z��ց���_��)ud./	8&�v\��^��Ŷ}m�����Ѫ�=��vָ�U2;�ͤȯu�8`&�zbƵ#u�֨��ゲ_�k���<�0I������_ J�A�t�7M�u����<\%�P*)�C�l�}�8����� x���@�}�u���x����u�w��5����,�d�4�g�k�A���|qE����=�� �����q:���Ŕ����#���1&�>ꄽ9��Jُ0V���f�WRt��0@gv6�,�΋yZ:y/%��wP�璩ܨ��n-����|B���ر1V�˟��([9re�g������7s�u:���m͍��Œ��HR�.n6q��	u:��v�H���G�\������E��RG@����y��j���x��x���ZG@�-��I<��h��$�v��^�1�<,G���P �{��fJ���UWgzz($�(��	o�߀C���U��&O��x�4 �������#����_&\�*u�N���J�����@A��^�)�tğf_�c�����^�C7���5Ɵ��;!0봑�R��f�Y������{1wV�#����w �Nc��]��\��P(��ϯ�x߳~%�Ϣ��9e6;��*�����[km�:8��D��ހE=�������RG�ŧ�Oz��Tc�G��� N��M��RG�}�����\������ֺ])m��d�����ݛs���Y�������^�B����O�1#���i<��B�3���Q��sL,�*����8��g&�l�M7�A�#�惀�F��LQ'�E�����Ohs�:�p��z��˼�2
���/#�fc4�:��N4���$��9�T*Z���\��(u��!���K�&
L��	��<?��x��W�c�v��o��!ѐ��9J�����ͺ>\n�c��+;@Y ��������x�,f��=�c�̯c˨��N������[7���)�xm�f��16�\�y�c����_wlhϕ"�|�i���n��1]�C�# �2w�ҍ����dص�lئ|1GB�# u[~����ӕe�)�<0�c�}���J�7�����JyGf���U�}�#�s?���s����I�q.�����:�TbQ���u�\��S����QY�3!/��Ŝ ���[�[���Y��u��l`�EE�qS�����9���:%�:�M�s��	�Ԅ�r3�Q�# � ϔ�k���b���)�-gͼЇQ�H�K�V�,%<����|p�u%�#��@d}D���c�2u4���A���}�f.�NG JvB�����7���r,��ƭ�@��@�������/C��&�&����c��cJ���>2�K\��ιo^A���E|��p&�+��XÇv\��n꥔:\��9��,�@,ͬ���Q��b��RG��H�$�Y�e5S'�|��>��S�# ��J�X>)�/�@�;~�NC����D�O�l�E��K��.\{KbG�����td?����P��O�T��偳��:��sُ�7ߜ�]i����;Ϧsޠ���������"$����߄rp�"����Roiz޸�	�by4%V`�޸P�x����~0C����%�/N��5�p�y�W�����O����/� �jn��*u��-۱��%�cI�-�U7n~�#]�9*u�Xt�\�9�Ax��4��~��:Q�+{���)�sF���g���(:hJ��S�1�3�w�'���p<�f+�M��RG@��d�M�:��T�2!���X�O�:�O��&������e1�5qn������[��?5�����C����	Wܖ��l������0�>en��?Ŧ=&����żF�����s�����<OI�����k��������� �����N��E��B�kGQ����RG@���;I�T'o�q6)? Tq��M���:�cՍ�2X(�����&pB���5�o�u:��8�p�������� �#6��[����c�ܙe�4���N����5s�:�O3Xg�Ny��`�PZ�4�xQ�����X��>ۤT�:��=>&�&�v~.J�(u9�#��VJ����oIuj�9�(y~_�:����}X��(�d�[��Qc_�R��:|Ml�%岕�Ex�lwY΃�ۋ�����R����W�;����[8x>2��S�����U�M����dV^.Aq�ٙ���^�NG@��:� ��_�	�����i�s4u:� �j���_�-�1�>�{��}���_"�@h��@��bb��!0��a�y)���k�/��O�v�?�*� XR����i��Ƚe=_�������T�g�V8��J� ���!v�`�q�q�,�5���}Q��~$� !S�Rzǭ������w�B�T�#��1�ٹL��ә|	�� >?�9>U��:�m��� +E|L��!��~.s�ו:³���s$�ߛ���)�'wP���L�8�R��<�5ږ�ͳ�qrDba�nf�U��S��~ ��&S�~���v)����]�J*u�x��(B4�G~����Z����8������(vT�d���޶j)k�{_n �\��t$޲��ym��A})�[^2��Z�]�FG@��vX@�yo��J�=���w�q��# ��0�]ؔT`�/��aY�bu،/�u:�������Ϛ���۪3���
F�A�# <
��3a�#�7ph`). �L�{��_�H>(-� ?����,J����t��fz��P�# x̙=��X[1�K|�IO��.^��:³[0d�ꔺq����~f��Xhtn�J��=���Q�O������˂��~����|�>�K��� �pag��z�B�A�# ��Ĭ;
���]8=|���f�?���_�-���§�
|�S���V��E?�NG@�)��#f�V�V^����&]�}*u�� ��<>�̯�_�lr�~�^}n��t:r.�l3�~8�N�����M�]���wP�ȹ�:{�Gm�܄E�W� ���q\̟S��#�+� �Gs �`���ϊ��.�t:��ؘļT���e��f�	���.t%�:/oȹ1ڧ�'�1K�7,k����ⅾ�RG@�X�[��]�5nV^��lpb�M��RJ��?;�\,�D߾�:3���J��]�5���i�}n����kcĂ���{���sq���poW=fa	����82s�_��?V@�*�R�qp�}��<�J3y)���ˣp{�`���$��^����@B��t:r.����.�b|be�݁�m��b�NG@�G3�m����~��-0O�֡�"�� ������`�?��~@1.�޲t�k���1�[Ɇ'���;��9E-M�X8"��u:���G����    �On�"�n��s�xQ/����K�����������p!�}aJ�� Rx6Cm�{^'��|~b[ׯu޼C�A$w�I�[�? �ju\ԍ+u>� �G@6���y #������n��NG@�����D�Q���]�Q���)�,�B9��JYG�s����L֟���J~i�V.�
t:���ʱrTA��?��kl�^���k��"�(ud.��y�a�u���D2��!��˸�yJ��
��'�3R�TÒJ���bG�u�]=u
]BS�G�9p'�m�*��p3'@�# ���q�H�� �ųE����ŁÝ��t^~��g��ea9���<O�������	���[/�=�^zLd�a�|13�o�,���y:�����o;��*Qze^�4X��h��v�3�����>�ĉs�_��&q��v���p.:0)Z�Jj? ��m�7��B�# xlb�.,�>n�,�@�2#�E��RG�}G^��V�%3Í	���ǀ��ZG@��
"�%�/i��`�C�8��w1�����Hg���W��!̲ëfp���t:��0��4��� �n��fn��t:ro����sZq��e~�3�-������0y��1�y:69t�o��� 	$^����[O7Rf�k�����v2��eYt:�J�S V/z�q?Y*~���p�d�#]�a�:�ސC����=�Գt��	}f��#��}*u�\j��2���ea�Β�4&�학.�*u$���k��Fi�lQ� ����̡\�7(u$�Ϙ�_lt%t�	Wk�NU�g]�m�tu�E�� �K�I��<��E]�NG�D��ɻz{��hr�OM>��~�t�N=�~��PP69��ﳻ���>�_��}k9N>M���M��7�'�@����U��JG@�t��ޜ���=}��n��2}Q?��� Pv޳:�����i`ͦ�_̝U����f-�(�I��� ��K�Mq�Xu�J9�Ήs�Y��8��E�7���M����S�{�ٓ'^�{6=��}n�00/���:r.i�I"��StL�6Ć����Nu:җ��3y�q�%��.q��1�K��ZG��;��y:��߼��a���"���Hħ�y����Br$`k�78�d���E�# 밓M����F&�s���#�lz�:���B�0����=���$���!��T���9�� �f��F2�<;���ړ}�^����@�=k��c��8����N"��E��RG��3Ty��Ҳ#��l3���\7ym�� �Qf.B,�-,��Ӧs|h��f���S��;]>E���eS�*�N�c+��s�s���HR�2�d�I�'�8��4"��/�c:�c�t��ؗ�/eO 5�L��|���:\�p�,w�^o^�W��Nqx���bJ��Ovl���l�g���Z����G��_�p&���'�!��#5�c#۩܅��RG@�m�k��$��qS�"�ͺ���o���:r.��:�=�q�9�$�
�K���F3n�#�tğڌHƳ^���@P[H�K[�E�#���p,�W\����2�Hհ.a�m���NG��ر"�$���-�~��{�:5J��6y���Z*�g�N����k�m�^��R�#�u �JG8�t�=��=
܉�	�w���|J�S�vڰ���੎źO6����B�I�# � Z���[J	K�(j�/���.��u:�?\�~��=�IJ�:ב-��N�:o���I����W��	��,��o�G�tį׾��$Q\!8� �X�>�x GtQ����8�/0J
Q%�i|���6���\�:� �'@dgfoι�'����M~L�# �a���Ϙ�CC�B�'7��X	�?����ȣ"����=�����[��q�RG@�qz��!�ι<,ݭL=ONoN�>�ZG@Υ4��1!B�����������s����}� ǒ�}R?ූ�ۧR8��i��H�����E,���\fbm'�`��E_�NG���V���'}���8|6­���y�S�H|����n�l�t`y�}��h.֡��x���m�����}S��e?�g���P�.���Q�-��ˮ��=�O ���RG@�-H�
L �D
�<�]�o�;~�0�_�S������τ�������'
��A�xs�>���<�7�'��>>��	��f��E�RG���aX�K"tC4��M��^���E��C�# x=�L�u9l���Ή�� �[\�tQק���� �`���/�I��j���ZG ��f�M��Re�p��w��^��t��얹M,)d�_
|4�5�z����� 7��D\ق�����RI�_�����u�Ǝ��M	?�P_:ad��9�s|��x�~�6�N�s2WB{����ml�uį3+�q�M�9d��QoNo�=����:��$g��-T����z
l�=�� �~�#�u R��yv#��,�*^���g'������ǀݲ��z��_��g�`@���:�J��#PP�0?#�-�����͒��.�RG���R���*��*K̹,,���d/굕:��Emb�R�p��&vcp�W��9��_��|�Զ;�M�WN�~���~"�E��RG@�Gk��	��}k �:>��851O\�# �e�fR��[f�<K:��N�1�|�/T�ȹd�*�����h�i��ev��f��NG@�0i�'\^c��S�����p�s���ZG@�).K�]?�R-�%[���,�JL ���x��:y�OW��>�~d_�,�k�@c�@V�w�!}k��րs�13_���t�\�6�=����:�
^�Ȼ"pyN�xGV���u��R"K�3�����,�;>J�ZG@�Kmfx�VcI�Ja����1O�qQ���x�%	U�9�mQ���W6{�ky�)�-�ѓ%+���|T�cg��V�ȹ�Jv� 2!�|�[�d|��Й���_�@���s��}�����"��\���䃂s�L��̧o���`�
bĻ��MݧNG@�l�r,d�R�"+���r�\�)u$�W��Vِ������lO"!5��S����?��,1�l.-5�o�v��u�:�wX|Z� ���o��P���`0�_������V�p���e�f��>&5��\`i}|:���v�i�1S�l�g�|a��o��}_�# �H��`B��<�0[h)|���\Q����Gs`��©s<8��M�'�]7C��OV��}q��� �,��SZC�y���E=�NG����[T��-�=��l���7� ���[o�S��:R�2C��2���S	��k�/y���̖D;��#��m�������M����,�V�ݸ�Ӄx�	Si7��*�s65g�T#�E�$T�p��l���E�# 8�s�j�t"Ο� ��t�~W��W�:.��t޼C��v��y���v�s�þ�������|޳���<-Kޢek������^��*ud=*2 �t���|���� ��#�ZG@�G/�I�J`�$K��2���ԋ�J����ǈóEe%��	��%�jB\c�~��t:£\����1R�Ki~�\�#;jj՛�>���� �m�6�"#�0�� �a�s���<J��~t�w�T�p�|,�]�����9B��)2H�k���;|Y�y'T�Ƚ��x�ǻ�+��oヰ��1t�����?�lcA�YLꎊ� ��kQ.�*u����k��&���
����ۊ8�����x�qSA$������Dq�^�f��ż$����[�S�-�3�N�>&�RG�������M�L�I�H��pa���9Q��}����S�m��c O#�b�c��QJ�7��rbAG�bH1��op�@}���kT��~�׬	Ǐ8�Y�FȄ�/�.���@�#����@�c��SCd�s�9�4\�E+u$�Ķ
���e)����<    �ZL�嵇��S��������z�'^P����<����/��H�+��BYä	u��/f��
�sEu:�{�I�Ҹ����@m#�y�l�Q�)u^;�%�ɬ��}q�,������28�|1wV�# ��K��2EF^��6�r�n�sQ��y�V���Y dn�.�dw��#I����[k�dN����S/��]��=d�ZG@�ZX�d&�WN�Fg���쳸��J�c�� qԙ`���V;V��+|v�R��������8P�?;�=�mp@�]�7�t>�@�ٺ��H��������j T.x�RG������i-�b$8��q/[
�# �1�!Kز(����Ε�G���T�H|W��)
������)ZfaC1�# ��t�u�|,�u҉.o15PRrF��x���d�s�{&�v�����
<p@`�y���O��@�|aq0a�%�3Å���L�2� !�<�(u�X�F�C�}�Pk�i�P��GV�d��pl�b=K�⠞�P�����T�#�;����T�d�{g:5�c"do��u��W�I�\�����1��T��κ/�+u��������<�z~�N���X���:Y�`�s�E5$8!'�qAɭ� �%]��t����Ҙ��>3����q_`����/�Օ:\G�K5��}�{��يY3HG�v�u���S��������h�3�?J�# �֖�ໟ-���Y(#��H65��'+uį;o�K2������º�2#Q���J�#EP��������9�0%F[�O7n�at:r_z`D�xL����E2՗o�����+u�0�QY+�D�����!���9�� �R�#��c�����XxܥC�ZG@�-����,��<�%c�z� /��T�#�uLf�c����_=��/�^@58�k�s=����*z9��@9�0�a�~]�#�u��]5��T�ꜛ�,�;�E ��wP��}�"��>6�WDp���7.�z���������/6V��)�{`���c�~�# �D�5��^L�P���A1 ����)u��X���'��V̆���M�p��B_J�# �QY����k&�,� ��$�$�~]��t$�`7�#��&���>"5Li����_��:VJc$
\����p.��'\9��s����H�9�(��zÖ��)l��}�ӫ�?��LM�X?Ô��M���7��:�c|�����L#�{K�+������(u$�D�����X�YP�IC���=�S����۶����̮�'�� ><���,w1�S�#�߾����QJ�q_�ďtq$΂�|N�#��}88g�.�Y6�6΍tk�t���������}�?崦�<�� ��v�B3�/�E�#����a��qT�s25 �㊝���yJ�s���7��E�0�7�YcU0��l8��J��y�I���w1�> ���{�aL�u�:�c�|'\�K�@�/���sb���J��ű9Ճ}'�T��LX��a/�C�# �1���&�j�JKv�t�^���*�Թ�P�p��=��%tK��Ռ��:��Z3�Fo\�# ���6���R:,�R��?9[s��\�(���ةn�X�,�r�DMɪmkA���J�������%-��^��Kb��mpyxL�# ��O�k�������̵�q�p���J�4�����U�o�}��u[J���(Wj�ى�!T�)���1��[��]]�# �_,�@$���*�-�3Aok��z7su:���8���	eK ��.�������~�8<M:���@�|_,e.���cz�# �Ű6.�~ V�b���Í]1�]|������^�	��hO�	x��m��ֺ��q����SD��,�<	T��S��\�#��8��x�� ��v��I���)sޓ�-(uds�*3;1���a$p`��00���E�A�# ���Gs.q�߷`�`:	�ea�b�?����C-�H��uX9�F���ů�9EJ�7?�&P����= �<yp�	_/���:�׳�����h�J��&e{ac��}���:��G����Sb"x��G�sTIq��/�Mu:�+�z5���s�a2�C�ۦ�n�4+ud?�m��p�h����`g�9��ۛ�^:ُ2���[Ni�"Ϟ!�fڕ�Y��������	��8Zy�к�M� �w_�E]�RG����t��,QϠ�MHO�gFH@q���*u��-�P�'��?0i�9�<V��/tz�:�ǌ�>��Cd�e'����
���<�*u�8WpX������x�ȑ�z���/�RG���@Ա��e]C(�â��4�bu�b.�NG@��~4>)6��V8��C��	T�|jٞ�[����}�_�L�S���c�1����~��{�# ����!j���U8��a��s��/J᷒�j�'d��m6�e, \��(u^�A�y>�e�'��6��:5.�O�:��58fo�A⧎��d0װ���V�#��bm�M��Џ	^��qp�Xa˜�1����7�D�l%?�%�9��7�s��u:o�TYs�q��q��"TL�>Q
���:��0mAhA�ɳq���$�L��r���:��~�6����d�n$�-P�E��RG@�_�'Li��#�ѧ!2!(�����ZGେ)�,���|B�m,�gB���,pܯu$�!�{��fY�����G�F
h
L��:£�V�0%�������c��-{W�\G@��Z���,F
3���f�5a[��o^�# 8~P-�͝���z���Q�9�W�ȹ������Xdߚ/�#�c݀��ZG@�Q�MV���s��x��`�pWjv��J�7Og���8\�Y*Nd@���#v�7(u��b�S-�IT�p�pyOlN�[�:/� hL4��:�;�}���yQ�����T3%�6���Pe�����=����:b�>F|���.���K���c/tϕ:b�ގ:9�C���=�б�!�mf�y)����OsH[�/[T*�x�_�G[���S���� �����yֱ�Re��u�3�E�NG@�K۾t|7���G`_t�(,XW��g���ސY~�hϼ>�p�|��Д-KLt^Ա�t^�<�*aJ���7�P6��l����P��}T��=��+N~���:���.�RJ��ݷ�q�H�]=Q�[}�Pm����T�# �S@��~�|N�dRa|L\�����J����'x���g�_ev��/��2.���:�O����=]M�G��S^�]�(u�u8��X�>,�� �}�� ��xQ����f��& R�a��+ԕdѸ�alw�����B�똻K�S�A�>Yࣿ��<H�a�ݐ'������p�lȸ���4�[֍34�u�jD`~n�oU:o�!�z
�2��5�h9�e�u�O\�# ~l�щ�}���A�ma�8rc^�g�tZ ���`록R�$�`F�m��Ŝw���[ˬ������|!��[��̂�nJ��n��{zL��z�.o&0�ж�v�u3'@�#��k�X�b=�������!�h�s���<VG�L�;�9���E��ǥ6�n��~��x�a���@31I�~�N/ܼ�5?B��+��x�@�w:�޿�o���LmD0r�����@H�1�\��x.��G.N_;����b���^�&�L�>(� el�o�u��[���P����$�Ʒ���B,y4|��XI��H��:T:�:\ˈD��6�j �eR9�7p�`��C�#�����\&c�����n�\�������:T:�:`<1nֆ�T�RaV��V����t*�w��Ie8Ρ�Q8	dʆ-�G�s��}*����(GǮE����	oX�.|���?��ס�x�Q�Y�Rl6E�W��:��~���j�����xױm�$R�\88��k�P�+��6v�C�#�ُͮ�X��V̌��%���Ӻ=    ��ס�����RA����q��7����F�������0���xJHD��9NW3���?�c*�w�6�.�1�R/8�1��v��(��s?��xב�ݽ��p2��k�)j hV�����T�#�E��up�S��)����f�'<ߟ>݁}ht>�X�j�7����c��vm�Q3Z.�������ǈ��;�s�&x9x��a[ ���؟jt>~�#�0E)�,�rB�G�9M<_�JG�so���3w%�D��6ި�߬��E�#�����7������lC������~ht>�!�������9ߓI&��.�C�#��ca��ܳo�0?��-�N=�*���_Wv6��|�A���0��s;U�|�XĿI��ϟb|[TR��=��*�Ϲ��?�L�����b���!���}I���x�a;�a������5��|�r)f��{��x�a`A�|����(�G���q���8�/*�o��UԔ�jݕsV�Hgu�e/�_�[����X����ҙ�	������O;�v��t>�5X�6[�O9�~�)�lSD�rn*�O�e���m���#s��Q2��Xm���P�|��	��X�5X�#��e�-���s�����GGL�)>ѱ�i � xD��6`�aT�wP�|��\-:Rf+�&!���qx�/B�c�����c[�*�'/�fnݰ�爺���p�U:�&6.��\�&����Zؒ����s��|�c���D'��Q6Gဂ&��6�ܟ�t>~=�bV?��˖�����e�Q�@xL�#��ٳV2�$� �=�:ƹ.|ù��t����Q����Q�Ȧ�*��ދ�-��JG�s.���^/�c�o)���.��x�?T:~;7XK��S�4?��v9�VR���*�ｍ0& c�Y�N	�Ζa���,Xg��*�w�g���̨�7�:��T��X�;�s*��:\4�� ��ԼY5�yI���hk8�/*�Ͻ�T��r��!ޖ�̼�-��j������9�	� MY��'���9ީ�1��X��:T:_^����@����Yz�C�`��9���/>m�O&:�{T,|j`��t) ��u_T:?����96ߣ�?��p����)�z�OU:�u���X�+�8[d�]�%OX�9�T�|�>����78��a� bӳn\��U:�@96�
`y���� a�<i�y~]�#�Y�+�����2Թbe?��^{uD��sQ�|y��ѳф'�)� .=���.�FG��O�`�z�$9O\:4,nz 뼉/*�o^�ț������O�u���]�u]�[���'��kL�:��Э�+1�Ȝ�u���'޶UKǬ���d-�� ߎ_�M\��JG�s. �fQ��П"�>�.��şۇJG��o��Z��O�	����䨴�U���P�|paR)���/pHP%�4��:�r��=[�#��.P�M"Y�G��e�B�`��f��'�C�#�3��ѵf�6��n��Œgl�<����{���=VfTEȯ�Á���xC;������9�&��Rg��w|t��q�.��wyD�_�2�����������'�t�8y���: 0��2�#��6�]H��>:���3�BmL�����?&��R���t>x�G�+�F�x�#h�R��8@��s��|�rB4�A!HI�vٱ�gc
��8�S���7�ePr�^vq��:��,�V���R�#��y%�D�1n�O����H_=�뻞�B����\��˸�;�'�Pa���2��sã4:�2���CsH���JY&���s������͐X���ߨ�u��+X:s��qN�#��i�ʪW�T��
�H6�)���.�C�#�S��N���t��G���m�/�u�/N�l^� l�b�G�8>Xf���N��|����O*<�ُ�� �ԝ���\T:�wb&Uq�tUF	t`߬�t��8����G�e��?��������}I�9��]�q�JG����0�z��Cb�"����b<���s;U�|�� �% ˟�'g��T��`�6�9����Zy���L�>Ȕ/>f�����FG�ЭȔ��P�>)"2�M�k��cS�|xC��W�}��� 4"�ɰ2�G7�u���ǯ�u��l���zJ���/L�;�U�|x�Eɠ�q�r1^,�o�3=��~ht>~�цB
���s��b���=g��������nq��A��M2n0R�Xb`�E��FG���m�kP%�]���H��ln�l����JG���X9����E���x��TK�C�������7T �#�*��i��D�|�>�&|�T:ߺ����n�OXjF��� c�u��t>��O��I^�c��,�� >#��|~oU:�sa;���ʩ@s0���Tؼ_�����*�O>WsS��.����a+fyj0��M���|Υƞa#O�O�d)�E��Ņe����JG�8رaE��r�[0lM5p%��\�{ht�y���+]Q�OFRI�@��L]m�r�O5:;��;yϖ���<?�#'g�eS����T�#���iZ�6�./��;��kD9-y:���x�a��SG�6cH�r6�����JG���s=���y��N�:�i�ѨfP�E��FG�[g`��O�wX�Ҥ'��*8���f�O���*L��xW�u�z_6]�aT:����)���*S<\KD���0�y�?T:ހ;��ٽ�z~���À�͙�Pw�n����[66��M,�*���l,+۳��U:�saiE�z"�D�h�j���vj�Ц��w1���M�}ߘ�@��gƗ�;�碎M�#��;X�9E�����~Ro�gT֊��Y{�OU:��:�W�*�5>j�`����`Ib�E��FG��� �Tf�!G楘�c*���S��q�JG�s.3�R� �7�.2�۞�₭0�s�����0���o-��b�	3Zp�=�C��G��|��Ec�X3|�Doi�gKպs�����1|�dI�,,Y�!1Lb*L�ϋ�����/�8��Y��ݸ3�����6\�T:߼%x�a��g��7�������/�m�y��?q�$���C�!�8������qW� }u.��ͱ�|X��y�pw��'F�,�׆m�ř���hST�]Ǟy#��8��YP#o��a�����u���2|�|J)�E��	/n�0 �ud֐��xSd;X+� ���~�4���_�����p��r�Ϲ�t{k���>먮g J���|��g�Δb�o�����[�Ƃ� M�3>�q�/��]��+u�RN����}�i����Z��g����s,z��"��~�j�̫¡'a�%����"q���������dp�LE�w�q��~�a�5� ��c�i��Ft#����&�㢵I?��)��; Q�(s}�-d��#�uY �qc:�η=���*�m>��w�E��Z�Κ�<G���g�5bv�9,Ya�na50�2�� ��B��IK-;�#˂W@ث��]��I1���h��� ZL������؇�k�~12�K��H��Y��׏��~2�K��RԱ�⒠}�6���Kx���_��<�1��ڂA+�q��y���_�ү���!`��ɉO$�"�I{m�����y���_�:��|�ٜ�M��J

8b(̞����ү��'V�¢�n��[6�ś:��6�C�׃�;�bͨ0�|2 r�a�� ���c���_R7�
qC�f�L��g�"صf�:?�_�s�͚����s�v�����J��r�:�$��, �i�M�CBW�ia�Q�pЁ�����Ô�{���KZl)���{�����͹(�zx�a�ȠP#����}?���(�E�ϯ؇ί�U�ո�p��;�}�hW&��_��H|j����ë�9���G�Q{� ן��_���a�I���One��l��
@L1���Qp    ��%��~ �"C��`1��	F6��{���\G�vN��g�Gl�B�Ǔ|��r9?�_�:�h��ߛ:���� ��z&�`����Q�뛑��=��R��:p�+s�� ��_�u�~7
�N`uy��^n]���P��(�BmN�L8U��G|������S�_�:f���h��ȣ��Q,�[܈~a�ߙ��u�S��EZ�%������ge�!+�����\�TF�?(�!sߊ��٫��9��~�׭�~�9�ɪu�H��܆��,�[�S���+�.��c.=�Yd��)��e!&�_�uYGr�����kN=�ZSeQ�\&��9N��uYǠ�Ięy����$��;ku����}�7����dֱM�[c]BݝS����ʯ�:`%���|rv��K��8� ��~��e�^����X��jpS�+��������æ��c��N��9���2�K���}������5�[�)k�c.!�z��_���:���rxy�%�'׍%�j۞��_�Ù��JU��'Wϧ�ԵS>ᦟ�[�_��Kf~LN���o�ħ�w�%R���~]�a��϶��R�e��Qr�|�/���oC�ۈ�c��;|t��u�.q:Ϲ}(��[��fi�%��r�D_b�`���\�~��Q,!q@#����az�Ľ��)W����ԡ�
�_d�(���-L�R,��f����3�.�uW\v�v1#Ȅ8��9q��`�����k�����'{�&u*�>����5������o�I�g���-J-�:Y�fw�����گ���l�k��"�(�K�u�qok�1]��t~]�P,N�5���y�.J��.4�i�����үK>Γz�_����~�:�`0����#�̯s۔P)�8<2����1p���}��u(���Ok��}f�\ѹ;\����f���ߏ���K��?�A��%�my��X�
��_�ad"r��>����c��=Tc�q_�S�_�O���`��s6fc�K ߧ����ͱ��_�u��G���-yK���(��٩��;�J��u�\��}p�z[����d�x��U�uy�Kl�K�����f�����fb�z���P�uy^F%Ŧ~!O8 ��}�۞����u���@���J��b�+�2M�e:p�_�׭�L�Y�l�i����-��_���:Ұ&��s%ֱ5��!�hj��f/�J��u�1���L����&;�c�3+Ş�[�_�w�mL�n k���Xo�	���sؓp�J��uTN�m�=�E�L��!�m6��y:�_��y�6�8.J��0cX|�-&��-u~=J_4���e���+���.W����G�s�q�k7����n~� ]0�q�~���:�O���T�u�'�����Ny)�_?���0D}:�����`�O8�ZK=��J�.����2(K���?X�8��!ЌQ�9>U���8�pzU�T]��_�6nY��C����W�E �����ұ�Ɠ��|ls�y)�_�:�ȼǆ2��!?�*�R����75~�׹�����_��m9�uƗ���9�4���P��$��E�z�;�?��gX*:�s5~�׹�i`n	�}�t
p<���� ��گs}Q�=��41OG)������5��ү'�S��gN����ff^�ϗ�$y��u9�=ja�4����V̽W�n�5ү�MevN/G��a�y��s��Θ�ֲ��$���N�d
s ��d��C3~��B�_�y|%�ԗ}|�nN����Q̭����ү�|B?f�
,���v��}���L����u�9w/f�g��|!�{�]}r�������e�&L(�Fi����~$�G1�"~���y�үs���H$�'���'^#'i�4���]�:���ݔ���z�l��Ef��قT�{��?��b� �.��7p�d�2O��� ��_�u��;��3���!-���e{)� �_�S�_���l��Վ�ڡ7��y.�-�-~�E��ү��.Ʋ^8gU�p.��^7��|QO���\��6�1����TG��q�5ԿzKܷ�o�P�7����l	�Oir�9g��g��\���?<���P�7}�1���ܒ�x�F} K������ס�o��õ�=�V�fDĐ}�������x����:r��������Z��`����9S�x���C5��]GJ�|�{7
��5f5<���Q��P�7��i��	��(�Y)fR��"G��C5��]GYU�n��oX�󳱓�P�����_6���D6{v�魋��[�\ ���}�:�vs�|���x�ag�}���������)m�'��3?F)zO���41z�ӹ��Y}�aG����C�%Ta��̄˟�x�9��s���� �̽�ԇ�~��AE@H�����:TsV?v� �Z��C �f�ǦxO�i��v~_4sV?~,O/�Ȳ�(=;�z�X���<ʹ}h�~�zt9�ى�7v�-�9����^�՜Տ}����Fh��3���e |����j��ǯ/\�<��Ȋ��tW�T���u��~�Ge��Ol�> (�������sn��9�;�hl2�5�Zi���;�t>?��%��:y�(
� nd)�r^���XW�z]���{�����ow��8H5��]G����{X�ՙ��ˀ���� p���j�뻎:� ���>�9zf�����c�IE�����{��.n� �X����z�r�8��9�|?4�^�u�Pzo�"���(�:5�!Yˡ��P�{���)���բ�a]0��e� �T���C٧%�Ô6)�M��M;ifu�-�g���f��g?Bp��3G})�8�<r�Xϋuh�ξ�趭J��9�"�rK�G��j(�U�y�S���~tۆ��*G�Q:��}��\ �6��;�9���wg�)@�
�?2�G� =�C��mD������:(���;Ȉ�=8���h��Հ���t�?4sx?�#��"�G�B�3c2�2$�s|.x�f�ׯ�Ҩ�>7������j��0kf�<���U��-+m�XN�	��EI��
�qnP������a��<?X��h�w1��u���`�[�T8�7�;�Z�.1� ]|�z���@��F����Z�Iv�S������]�5�Cp p
U� {Ω���O;��q�b�K&�G#_��^�����e���2Wc��p�:�Dr�~�1R�7�'D�WF�D!Ν�k��ܟj�4p!ȣ�pg���-uH�Hsc�˛x��9��:�v�6�+ ����$ꃎ\��������u͜��2���i<�)N�#+&{�Bca`�߂cW���ԙǅ�*t��i�}��~�t�l �ԥ͔�f3p1?�34�Oٖ�x����/�4�@�F��F��%�X@��X���j^�׏u @ [���ȣd=8����S͋����X`y�W����<�-���?ǅ�r<T�l�K�Ś�{��,;}��{ۂ��>E$����؁מ\�
ե�u��V�hSвq>r��vc�E��%C���|�jn�ǏnZ�٢g �Mv��mx�E�=_�jn�g?�o�Y��(a0
Mο]ٺ�	����+�q��a)�|��R�d�~��6pBS�:6�WMe��Y&��_�1�����.��M<q3�q��H2��/��/��j����O&/j�<#)J�de��^6H��}Q����Gr`/x'�:i��3<�8Jή�|���O|�@k-��T�
���g�T��)�u��V�����w΁j>�9�����=Âp��.��9�|�B�h�0u@��O��lvsa�9�������[��8<�P!��M�i���<�j��'���8O�6'#����njp����.�M5s�?�4���:�_����Ǧ5��.�t��Us�?y�42�A�����֚ڳJ�0i��r~.�9��l�;�K�k���q��J���5s�?�0����\h(����z���̍�{�����ٱr��ÿ��1_� ��N��p�w�7Ƈ
��8e��(3���o�����ක�s�����>0�Z}���y����+zg
>j9�G&G�l�8��<���'��/�;��`�>�zJ�    ����)�~�+��?�@�L��~�����s�Q�덝j���y�9���P�h���O���z��܏�����NL��0�k^� �������<�?���2����5�q�L�h0�[��P5O�s_V;���{N*�����a��s��v��'��s����Ê+�{��o\a���t�o�����Ħ���\c����,I��}��4H\����	������y�C5���oK���U�?��_G��8mHA��܏)u����p*r"�5��,ZNj�VZ�|���{��"�3�q.,����ŭ}��ȥP�<R���I"�<ȩ����cBDȟ�͞�4�!r��.G5���i�����Fz�^@�8ǈ���<ǧ�9��8@�aV�4/�f�ԼD��`.�9��H�T���ȏ��߶*�J�~L5���>g�Aq�K�Cd*F�i���e��x;M�`�p�b_f�J�������{�u�Q�����(��l���3Iɝ�Sռ��}�D��^,b��%�c?@X{�}q.�y��<n��N������sY)��ݲ��ު���>Li,V��E�h1�Ñ@h����y|Q͛�����|H>�y�銕d�E��Z�ѹ��̛����x��3K��v�|���ٜ��=�snd3e�E?�
apx@h\��W�����[X��M�hl�=r2�[���{���k%���e�|�����)�v��{��� 7���s�Y�Vz�ql��xSͽ�䥬���jp��ʊ~��Ռ���Uͽ�ة�M���?�ƙj��MqE���{�ԃ�:%�8|�?#���zxb��E�:��y�X�<�l�"���U�#=�
������
�Yȧ�"�m!<ƈkv�oك>cuTG ����d���%��\8��:�]��6�/p.<K鞹7~׷��AJ}�Wg[���p C"�ə���񶋺O�>�[�K��)�%^�s�a��lJJ�Y/�`����\����Ȍ�1��\ ��{�����g!�Qw��c0���U=@�U&�Lb����,�mc�DN[]���1$������&�D����H���x��Zs�F����kp�G�����m�/���r*+�IX�]�|J���D�g�'�\���8�4w��1����-~k�3a����띓�C`y��+��x�v`��At+�s���bߛ��һ���-gZ�!"4K�9�v B��4q���X������~I�
J���t��i��? ��đL������d�R��E����a�=����\(QY]+r��ㆍc��,������r�mu�E�Kf
������2�l�0~�R��ǊI�����T���� #&l���<�y�M ���(��(C�,�V"s�v�?�v.V˼�N���������\�<�M�Q|�*4���~�f���mr�����c �ٙ��p_�b Ȏ�-��[\}|O���)5�[���=������ �##�I�j�	<��������.� ���%	? �m�+�m��/����K��q�j�`T�e�}�T��M��t�`��-h � ���g|�gk���Z���9;96���Z��c<T��]�
��|�x�� �O��}p��ݏR�_a�q2b
>���9zn�<C�]��aV�K��H�h8G�_�(�`��ڑ�YM]"�@�G����+�$!�a�S�ȉ�k$`������~X,!LVp�
����g����7t2�
~�J9��y�8���X�f��a��Yln�;���s��5�ω�K�;�c
h���}C����g��q��c	�����Y�y��;�<`��eЯG� G�K���匶���R5�:�}�Ε:+G(޼��͑�
�.����^�!pޱL��_e�5D@&O�M���ş�!&�Z/��Bh�~���r݀��p��鏿p�o��c�)KU[��{�Yhq�/�S�{7��\��"�Oʯ���o����a��zS%"���+ٕ
��E]s>�����{[����8�l"@�׏Yg�K���S!�#<93�F:�A	l�cX���'_�-������S���':P?�?�a����+�b��� �6F�=E��)~����b�Š����"{`W�j-::>]M���#v	A)]�O��=�.J�wQ�K��ǻ�>�9�w} ����D���:��@����K�i;PljZ�-;�����Ŝ�Jc��u�C\���l��,-��X�����i x=�s��nb�
�B��3��C8�kw!9�nD(�m�qC����[��ܓ����l��o.׾/�&Z�������W��_��e�1�?���z|ۤXh�����egZO.���e�+��,�f����2�U8��L�ç#G�&���w�B>�� ܦm�����!r�CV2p.3����eW-~�/^_XZd����.H2�~��py�fl<�c������3��zbP���������!�J��p��00oÙ��	��8G.��:ov���+/��Rv$ί��oP�J�8ߣp�$e� d;�z�s��u���8W�Si��g��Ϋ���o~`���4V�G��`�d���մ���G	�-.���/�}+ɢ+&N���ǳ{�]ܰ&�%���l����uQ�5jI��� �a3�hPG��q����4�ٱ�rF���@�l�u��,-�3�X��D �,�����$��}�-�^&<3I=\M+{=��6��r��,<E�KJ����\���3GR�o��
@���y:�����zu`��7ص�̀� �|W���
0y�e��pP�a;�-!BbPe#Yx��y�O�0y�u����1�O����s̈����LV!f{k���s슘p�������R�Hg�81c�:� "��\bfc�*p�~���X�Y���$��E��f�xVO|T��J\ƹ�c{��V��PI�X*�]��xk}�~���u�B�(�Q���d5uYj)��ҿq�'��ZJ��W��=�܏ ���o3m����
�79����c��nMt�j��h:���m��i�JQ��x���D�+�� ?�_��z��9��O����`�|�e�3�"/U���W�@���"_ ����싃Ҍ���N�ၘ�_�`�#���aIN�L��x�Z��8,��7ν5e�cL�l�WR\���E�>7�
��C�E=F4|6w Y $�U�k�k��7ja0aĦL��^iq�,��9����p�O�L��9���1J�ؘ�p!�dە�6:�� ���}e�H�_��c�����z�h6�dq捧RB����Ϲ�TX:CJN�V\cs��5}�z�g12�ϱ��A��)"�޶�m[i�/?&��$��'(F�o��n�_�ta3uj�5�g�/��	����� a΁��[h5��� lo �\��o�w�T,�دNd6�O��5TD�`�v�K���fJ�tCټ@���_ԯ�2�M�3����﵊�e܂o��kr�>�
�K�9�b�����cA���N7�H}�C��4��	=�o�L8 ��&�W����P��s�k1������Q(*]{[<P����:�����a�#@gk�&@�@����;^�R7�|�q'���%p�
�?�>*����:���\�[	$7�Z�T�1��xJ��"�������|SG�q#�t�P��u(u����	[xo'���59�����]��P��_� ���cQ�v����?ھ4G�g�Dh_����Gxft�����HH`ИT�S��v��v8��n�<�aX�>%�WR�J��o \�:��G�1�n ϱ��1ñ~�����H��X� �ʹ�*u�������#���x�V��J5��T�X�wD�+{��_��!�Wl +������ty��(��l�
�rXw 6���ӿ�ԁ}�ty�l�t�I��l�S3x��6�[>>�R7P����1ps
(r��ro$L<R#��8��;]~�B�����Kc��w    ��x�|n:�@y-��de�@�19��\[�u���J�@�������,屽8{VD�1�9S����@��g51�4vZ-�;G|�/��N7�^��ǽu	(�^�,�[���_*���S�n�Ĺb����M�-�c���&�S�p8{���n���}J��m�~kPg����x�G9��J�@�#��*��-�
�x�P��m���:�@��hX�ɉ-o!+|���M�e�s���|yC���
�)��[a���,�h������9�v��AƳa&��v��\�Ĺ@�/��R7Pp2�<h�,M0Y�6�\���X��C�(�4 �'ė�9�JupA�ۭ|:��J�@��4 ,򫨗���f������ϴ���R7P�m]sv݅%����� �����b���R7P�>��ikuФ��� QV��q�G)u�s�il��9e��R��W;7�+��{��|��
��%RWO�c������%��P��}���aׇL�K�#�	�D�k��)u�s Q3�������u�q�����R7P�zao=X���8��fKu���MA&�s���<��)`�H���:����P_���s���;��)pϢ����7+6�*�x]�(y��V$�Wʹ���1������R7P�)�����K�;p��0�1`��0��x]�(8(����"�"Y��0�(��*u�P��z|`R2������<��|�R7P�G� �U�2e��P��p��M�6�/p�N7P��}≁Hv��y�����@��"����o�X%�1�J�.o2� ���"�+u�X�ˏ������Zp��.�� `����
N63wϹFO ��^��"8ֹ��ʽL.�10�/|)����_2��OG� ��t��1R�oa��A4�!�Y �R/�N7P��t�[�G������ŝ��\䥔��o���ħ��3��n����P��}Q���� ��%�;�>L��+��A��u�n�ˣ�lƄ�����T۸:�u,bϮ�R�(v:�{l�B�k���S�moC�.�~����o��R�Sg���{�Ȝ�������xK��)�#Pߏ��6������E�T�(��#����*>�)I���Ѫ凳9�K)u_?��C,f^*�~;�P�V����{Q��}�p�p#uH �&�K���Դs��?�x,)W�Hy ���ew��!�W�t�90�RKI�$���e�� )����|��b��I��"|� ef���9��:��7O��p 
�1�zL����e��5é��[�n��c��t�3�T�ǗT�=�u_��n���bN���#]��v�i8�o���q�R7P�G�������i����P_1n2�p�ו��R�̸�>o���}�L�9�2_&��MF�(簅d�6Ӕ�N��࡞���
T��T�(�v &&��ս�!4��%0^=x�/��R7P�Gs�P��6��I�`q����q�R7P��3B��}� �)Si'�Y�{����ʽ���$:hl��c�}	��C ��_��9�n�䃢m�P���~��ck~�.�Q&���q�N7P�A/A�����T]@����E��R7P���+l@�%������f.(�¯�t�NM�&G5k��V��C����e�Ӈ9�S�n��wr��fO�d�F����\[�������i=��gN��X{�~��Tx&-?�J�@���5�̪q��Rr�g�Oό�9R�J>w[��,��e{?���x&u\�}�n��)Eʳ���.{#Y����Tl��\�E�S��~�-��zVe�uP'�D����>��J�@��̞�c���4d��91�g�nC�z���|�,�qKO<��Q_�OWrX�1�u�?t��r��Eb�?6�>>�Ӗd^�9r�=��J��7oR��pt��N�綉�"?g��~L�(q'We4�[��#�!�~��u������ٯ���
H�����.��:��J�@��y��y ��:�KV:s��v}�:����m�D�L��� ;o�d�y�U��}4��@h'����23�ɲ�*Ο�R7P���e�g�U;���m�=`�eq�]?J�@���}��� �Ф��f�4~K�T��G�t�yT�x˭��Ճ��I�gHms��G��>t�����L��0�c�r��X0�"3��R7P�8�� ��b��T��w�4�N�\�d�n��VBrC,ޔ�[��b]�S� [w?�R������)@O4G� ����l��G�t%_���m�:�sp���B���]�/�a����__� #p�S�l!�r0���;��)u�������0���k�)\�SMXVZBù�P�J��%z��E���y$\D�<ei�9�AJ�@�ɩ�<-��4Q"��l%p=�o��J^� ����)I�Wb�3��P�0]��t�y��m����Q��{���8q��CQ����D	,��E��w��=E������0J�@�Q������C`?���R[لy��u����fK4�gV���H`��$a˹_W��� ���/�,��XA�r��e����R7P�~����� &��ML����f�����R���s�4�ʬA�î�Z��d;.0�w�b�Q��Ɨ�feo��\R��[��^�nfm.��J�@�n�ř6��;\qJ�H�A��г3��C�(qn��.,�:�"�C���>��ۅ}�t���6��]k���7B��ٹn*<�N��
+#����~�p:#7\����9���ro��%�i����j�5�����W�J�4�� 7=voYRX7+�-ԜR7����{�>�* ���F|�%8���۳^���tů��Bx��T�&�d��;<5|/��:�@������H��ԑ{� ��p�]̛*u߸�)G�.�*Jbm� ���{�<�۩N7P�-,ϋ<Y�����!R�t�X��f=�S�n��qI`��{��x�L�N͞�{K���E�(��U���b]^��__c�� �����n�<�B����bʆ�p2�:]�x.z�ȯ�t߼��П�*��xd�z!�rc�=�;(uŏ�G�$�'����7�;g��E�N7���;s��b�2�#xb�����v_ԑU���^���3�׈�٩\
� �#��s���|�`\3L�7���t����#~3���n�;��%!�,�&J밽�r�ϖ�<�/J�@��;���]��?H�x�� ���*-�b�D�(�p�(1���p��U��y����/�������"�x����Pt&��EL���+u�>i���+�̡�3���1�|���R7P�ˢ�ĔE�"EE�����g����y(u%�7`#ģg�<P��Q�8*�UG��|_���}�
�n�ŋ���7f�w��|\��)u��:���g��}�C�ϼw	�^�7(u�W����J�-�u1�Yo�L��[�n���̋�}xq���klT�Mǚ���/J�@�2��B�-'!�>�4�g]�<�)u���	?���7�v'�M"��k>�AJ�@�/~F��Q]�"���� (��9J�@��m�
�J)���FN�g�B�d|�y�S�~��%� p��
�C�E6ֹf�y�R7P�\J��y�C ���NS��mf`�s;���� �W�I$Yq��s�>{�N=0����P��} C��$�����)��p8G>��J�@��V�Ʌ1�r�QZ�&L�YD<(Ο�J70���6T@r.&���)�@e;`~��?�n�{��/��gS@F����x�".�vsZ*���f �Ȗ{�[��as�L��{So�b����[� m���>�$�։PW�L�C.�V��}�I?.w$P�i�ߚbp���*���>r1u0d#��-M�X�Mj��ˋ��B7�=�[xVk����|������.�J7�=M�5)��St�n><�s��wT�:�����y �j����AN}r� ���n�*���g��V�����pғ2�H    �]�����|ρ�4�/Tf��5��X��k��$_� �n��?\J�����aM�Þj=`;h9H��}���� t-u|cߖ���5���7��
�����ٙ3P��R'����Zˀ���V���H�xfc��b� -��K���.�-5���}I�ɱ�H;e�v�x;�3m E�ۇF7��)&�| v�+`�$�����l����t���8�N��"}���|g��a�J��������o�oJnTf�Udj��f^�����P�~8�*H.\T�u�{�}��nx-��n��?6E�q��9t�u���/X�\�\�nht?�<��_9>�UI.Q��-\̫�t��3�a�h����s�r�uC�׳U���?;�WdJ��?�)=�M�ʊ'����E����L����J�Le�n8_-LG���U�~x�Z� ���fBF���IԎ���it�s ��Wh�r����t�|��F���ǆ�`b��W�oo��dF���t������0I e$yt&=�3-�cv�|QR�~���ʕ�෤:��D�U�m�ۚ��E��J7�ǳq@��lE�
稅p���#���S���t��Kq�1� ��p�+�X@
�b.I��}8���c�2��G⑁z�:���J70��W�B�Gy��̿ u�F� e���t?;-���~���U��~'sqoU��.����LqR�!l&�;�eJ����E�C����Z���X*�o;���A��\�^�S�n��?p�[gW�`�D�)>�N����kt?<f�0��������^��� �p������Ӳ� m��+'r��^ E�u����|�Q�.���!�&�簛tƌ�V �y~L������Q(i�zoc��p�Bl7ud�n�o;��pZ���J�1$z����y�U�~���6v6�p��GQ ��VsQ�V�~�0v:&K���{�Mk)�>S�<J��������S���O�@��Y.I�s�*��/ĤKh �6�#s"2��q�\��T��?�A��+S����'�@sQ'T�~�6�X-�b]J�Հ�ɇ=�j��t?� �i���_�c��ь��M]]����F �<�wd� d�
�pr�����~1����/x��l[� )�Q�s\�����t5:��#��&���r��v1O�����N����>��3�� �M�q1_����� �#��[�,�d+�s���%^�(�n�w|�~�k��l��zxT�fx{�ê���m��2�MI'�8RP~�]���U�~��p�lac7�a=��;r,1o{~_T���<�*�3�~SPN�о�wǴ����T�~��V���sL���C7l{j��b~N���S��N�D�7fB�x�Z4�1����U���<�5@	 ����y �u��NYs�GB�{g�Ԫ"� K��q������:)t�s�S��,�uS^ʴ�_��=G�n�w<x�(2�҂q'G 7��pQ�W�������]��w�t�^�R��]诫t��zB���}&�[B�k��/���.�yjt?ސG1T�n��3\UP-�7�����/�`U���9�H���3��!u����wNw�����b�� �Z��`&İ��6�-]-~L���a��[�}��{�Z���R&��E�B7���J�\�:���� ��t׶6̎ ����J7��s��Ɓ}0�Mݣ�P�Y�rv���]�8H�����2���ʦP>���D99㽯������\M�S������ׁl�JƏ�C9�*���׷/�����!w��
gjA�Ǿ�ۤ��������N���V�I��b$K��������mf��"��a�H�"�0�(��q����Z���O�\-s�B�� ����t?;�����0�-�Q�2�(uǴ�����;xx�ѱQ%x>��@�Zs�?����\(yUV)�He/<�\!Y:�^�������ො��ƞ�< ��^�E���it������3�.���']S��B����U���[[�9Ҥ_o�'�-?Α��f�c�����6��YP7���	_�巆ɣ������ǿ-f��^pl��-I��|�}��T�����,wW�K�����q��v���✙�:�^x7�.��ư����mN��@���#>8Pl.Vc�F�B�4q�Z����J7��,��D\w6Y�X��������}&�M��E����Vxz�/r��~K�n�g�ެ�l/��u ���@��K`QL���_��񆖳7	DRF��dğ�ދc��د����1f�Ff9B=�z8,>�.�Je}[*��_]l��؊8��Cw���u,����G�t��V�ǳ�a�g�,�9�4mgr�o����PX3�M"LJ�%��v��p�����~��%7	��,�tڇe+b�[�:�s*��_�ȿ`K]��s���j�w�������b������'�=�]p�f��J7��/�R������4+��]I�n��>��/�Ii.�4 G�{Z�v����:�Ve�N���hٝ�	�jo��*��iB��	!�K�ſN��	
z��\������֘�Ƌ|��S��/ �z�_W�~89��qߚ��&OU���j&�]�m�t??f���jp������"��h�^�)�t?���J�m�B��G�΍#�{ ��x���=��p����d��n�{*���҅S���\���g�M��p�����n��������D	��}k䕔3}���L��������}ٌO�,�W�JL�D��#�����ͽ&��=8�M;��c��׉_�r_w��
�����ia� ���B(�[s�-�8�q�^T��_�a�x�e�~lAi�g�M��8�v�<4��_���+�c�zQ��b��w���v~oU���������8���ܫ1�p���n��<�vAp<�
G I�S�(��������*��_ݣ���@/�R���8�R����(�n�o~����W�������/`E ��~K�n���~�z�����;�K0K�g��s�t�sp���"�g��0�R ��Y�;������mE���� �K���ІWř��<�J7��l��/��� �'K��oK�Y.��t�sd���Bb%D���-�g�����J7��/TJd�{�������X��-�Y�����~�J�}\l��k�}X��9 �b�������؀{͗�@3xs:ן�hҞ��t?���b22ν�SLĨM%#wQ',
��_^�;�`@��2
S������1��*���:+��3@$i҈�L�M��K҅~�J7��s��dU>������[�W�^������l�cwW`������Ҹ�����pa!.�����ug�����֎,n^��n���&�D���RO8V\vV��u�6C�؛����?&k-On,��{>L?�טU|��8Y�����+z|՜�l2,!����z:/��5��?>��9�y�B�1���7�,B̅S�����
� 6����� y�.��*��_���	1ť���
��=�p%\�L{�ק���ޜ�~�lyGSKƍ���W��=�*��_=��m�I!tk��>Ǝ~g�� �v1?����:��
���BcJ�¸����ԋ�8�J7�7W����o2�*��3����e�tqoU��_��G Y�0����>j�4�i��7�v���ދ��eP3��Fx�fJ�4o� ��ȯkt�tx��űoK:QY��p3q������J7�ח�:��~p?�_�Y��	��(�<�t}�|����mp�FGtN-��ƥ=X�n���k��l�[��)��HXmۀ��������u����t�,��NB����.�b���C��_;3�p�pCؚ� ؄b���?��s(u�yX7��M��;��6�Sl��'��J�@/��eM��Қq!�������_���~    �n��:�� �gi�e�X����I�||�n �Q3hBP�0�EÔ� ��1��J�@�#�J��:z/��,���*~Y��N���<��w`�PB�B!���h{5�����s(uy�_ߘ��&�*8��R�����=�>J�@9G+�򽼭�lU�2ٰnypm��}Q��wnmr��w�#]h	���5Rw+�Y���R7P�)�Ò��h�����S�n����N7������x�� ��S �{��;J�@�Ã@z�L�dkpu�yR���N���r��Թ��s�A���M�\~��c;�S�n��#ro>��Ƚ�x�P�j�ep�w��:�@�/+�В{��)uN&�f*����s���s �%��]P���I����jl��T��s̘��ن)�F����&�����{�������v3�26��$�9�,��p��P��_��y��x�����,�9J�����R7���;Z9��M��E�4n<;�{u������o\ hK���\9�TvD�u �T3:�/J�@�����8�՝�lf~���ʱ&�<�������կ��0�S����Ej���A|���{���gn�)���	��`��G)u�y��o�J�}�o`B�K���f=�sJ�@�/�Q�K���Nt"��	~�xa�J�@�Qs��@��X8�=͙MS�=��E�U����%�5����xC�DWo5Wo���r��g}�����\lW.u-�����J�@�	��n�/�<��18����cJ�@�sc��U�۳5"$C�Ö�dfvӧ����9����?����Ƀ�)d�՘�0:s��u��r�׾���OǨ"�J���s���J�G����<;�w�C�Ys�����N7P�A�J`�S���0�,�#�i��znJ�@�e��ln);���4��#����(u��m H��l�6�;�O <E'�@���C�(vʙ�ř�ăR9�^� �.�_�a���o����˟�)���J�`��q�q��P��{��-���m�ϕ<Kހ�M�v���R�=���%
�e!�^�b�y�W�Jܷ�xzp
��ޢ+	趇��4��U�A����-�*��3���G+��7��F(3�qou���P@�E�+H+��H��`C�b��W*u�W��&+� 7�Tvj���m���E�R���q� ����j�ڌ�h��2
�}�^����^Z�&�Z���W��P�!%������P��y�@�:�����#O�����:��n���a�]���2j��%E�(� n^�=�sJ�@ɟ�����o�r�ru�-��C����N7P��h����-��G@jv�&�;����t�߂�V��g�8�&�&[��-g����V����L)rv�p$��R��O�&Ԛ���=��:�@���j�2C����5�ћ
��}��1�n��9��f��=WV�
79l�������C�(y�1C��D���t���7c=�n��/:�@��ұ6F�+�la�Dص:C�ssΣ���o�卋: ���q�7�_ÃH�4��s���s�K��!�0+��eƛXv��¯+uş��˓���s�,&#����Z9�q��u���?����`qO,�G�9S�˭m��?�����B�fF�-����#�~�^�J�n�[o`�!��6���ݨ��ȝs˜�C�(y��Ӈt0�N	l�Rm��"��n��S�n�ࠖ-�;�R�	T�3�{n9����(����֠~�.[�2'�j`��q����n�<�n�p�"�'SG��ʰ�U9p�<t��/�� #���ɹV�)j �a l3x�y�S��y�1��P��O��gp4 �)���A�(q<_TO󠫙YJ5�c)�q��:�cJ�@����.S2���!�X6(Xڍ��"��������]g"���{e�@�^@�(Pw�ǔ��o�?��[�9�^8���\�J�ݝ��n��锺S}|b?�g]ݯ�Xƞ�>��� �n��9��=���ǪS!!8�����R7��'���+��(�Su�-0�����)u�8�	��pI5>
��L�x`� �xQ7���}�}(�0\B8\��H܄ �(zQ��J�@�A%3��Y"���i,R������y(u�~���v�Ҕ
yeJ�qvu��g^�y\�n��lP8v>>k��f�z]�$���i���|N�(�@m�`Ex��q]|e���;���n���
z�q��f���Z�b�f�{���v�t�����`qGq���U���O�/3��~L��ց8D�*GC�,�x
D�]8�9��y�C�����SPgg�=* riv�\�d𫋼�J7P��s34�BȾ5�[U�¡ſ�����R7P�#G~]zU�E����u����Ox��u��ro)*@�{�F!
���;\-b�<��n��<�Jl�U���|���y�}�#��G�o\�(�Ź�H�V|�-���J	9D���O� ��t��a�eÝ�v�@^^
<�O&D�s�uu�n��}� ;B�9�;��\��v�ix׹}(u�NSR��A�d	��SȌq��T��9N��
>����9��~�E�K����{r���N����&��e�G$�\d���&�Qz�v����͂C�H�w֘�����An� �?�/J�����.�SQ e�\�$�ு�w�OV��{���]U�+���0 CLT�=^�C���BrI
��^@�ڧf��4��;�zc:�@�/ ���,���a�+�g��78�h��y(u%��V��n��d]�*瑧�A��M��N7P�1'����#G����g��EW�(��DXʶB7i�i�(�p.�E>H����)q�Q�.x�,�Q�	�cR������xk�nTNt)`$�>�|�ev"����tJ�@y/N�R�(�7-�<��wv\v{~_���/��v35�V�{��j]p�������J�@�/q�m�z�d=�JŁ������sT�
o0��L͸̒bs��b�X�ە���C���[��2Y�V"Jk32�ױ�C5��|�N7���7��'Ra�I�by�Ղ�o�م}�t���{| ����s���-��e���P�J����#�+�U��`�c��;v�9R���6�Tp[����k��6O�2�w1ר�����z���~�������tş��Bɴ.�%�!�|t��0�.�R7�{Ğ8��H�M��i�^/����y�R7Pp2"���iK��`��C��������t�<�sѲ���I�_��M�Q�b�Q����a����/\��?` �w�㺘�P��?���l p�ymJ�T��f0�X�m>�J�@�/ܖD���	R9gߙ��P%�^��n�k8�u�L=�-�����E��^���|�_l�\��%$�&"�7t;<�����U��{��U���}[V�����߰����R7Px%P���_�}���>`7���V��(u�O�ͅf��s�I'/�k���t\���R��9��6�˚��	'�S��o�L�y�R����6�½���[vX��'��H��R7P�}Ft�UF�;��ɾ��!���u�n���F�
�(V����2� XN1��R7P�R��H�P�˯�%��g+u%Z���(x ���(�����z]�_���ҧT�i\����E����C���}Z�T��ֳ� ���d�GM�|R68?g���E���-��Iq#�t�e�H!�>3�˅S�
>ͬY;�*۟~r���~V���x:�@�{�F�����L�U�70���Re��	�����ڠ�H�hǖ���hPP��p����T����62���E4r��K"�\� ���S��sI!-�]Y���{ş>\7Z���tJ�@��
���R��-J�'��X��"o��|�/n�p@��<g�T�F= Y�0�>��|�xY�J�6���l/�}�k\��y(u�g[������Ȓi,)��&����8���zS�^������o��    t�y8��H֙E�[W6�z8`��ō�~]�(q.��]���Ąݸo^$~�I6�Թ��J7����9�r��g����	�^���9T���9�|�`J�Mg�3�T��Μ�8�t�sLc�t���S���j������m.�&�t�sp�2P?(���k�,×�Gi��oU����kʒW���,��4����^b�n�{� �"_���g��z:��\���s=z�n�{�:٨�*�aꙤ�9�k�0�{~oU���s�䱑���0����XmTj��9S�~� ���mO���}�����$�q�^T���}D�@c�5����C��(���F*�C���#�7]M��v(��#X�D��ɞ��n�{_��������YȚ'��������|ϱ��(�ɣ�O�=�f�֌p�ӫ�|����r �Q��:�{�u��f�yq�n���q73`"�yTBp,|�vw�U �v��S�n�{`a�[Τ������rè)����}ht��2�/;�Ğx}��/S���8|��z�?T��߽uH"�o��@���-իwn;���ht��Tlrv�ty��q^7/��4~�p~oU���98�Pxe�
lȔ@�l6��}�sd��*�����G���f�4iwql��l�:�_W�~��u�ֲD��bY�@t�9�����a�J��ClO��8��-�7<��*���P�:��_?}ܖ8"�KZa;��9T��>�aNO�>ٗ�fbJL�������C����ɠ��\�%Cho�J9��6G-b��V�����'�e+�b!�q������_x`����.�e@������|kcr����>�s�����5��5RP�G8؎�������z�t�sx8�AMO��}�m1��2���}Q���띎� �͸�-P��g�#d3��~u�n�g�	?�)B6�R���0{0���:�g����#Q@�\��V"v<N�VX�5��}I*���y�� Dp�rg1�*���;������6�`�l�i��N��*p�w����n�Ϗm*]X�z�)�ɰ�����u�3��1�n�g����E��.�8��z���A~��}Q�~�#Lv�WR!L� a�M���j�E�C�����ȇ��'X���?�ّ:.�ͫt�ÍI �EWr��@Q����9S�~��y�� [�����ƹ5�W��R��s<�����܎�?k���L�_JN%a�gU����P���}\^p(�VUܗ��X��ުt���?#���w��F?�j!�|�J7�{M#�<ƹ62Gd�?��l��#��C���Ro���Q��1�Qq�vbۛ�<[�����a |����N����@���NU��_��Xد�G�,G���>�2��G�y�U�~|���p6SG��g&s;�>)fW���3�n�w��d��s��̀0%�ÈH4���J7�30f=�gd�zhb���q�X�����泦gH���Ca��S��9�qN���1�N��Y����t����I���/��F7��s��|8Br���)_������m]��n��?M�����S�_�J�+`���??�J7���I0dCq�`�z����@�r����:�J7��c�#����Q�hn��������~�����&p���`��g�`\��<�hty\X��qK�!sZ�%���]���J7��/,�r1@�n~}�%��������ŞD�n���^9RMa���u��x(G�U��^�S�n�g���B��oܰyN�hi��[��J7���0s+8p2�L�BV�6��a#`��v�����4c��B��|f�m�w�ݖ���J7���	?>@,vd��I5�c)�9� �۩F7�ç/�W�u���Q�������S���U�~q�ȃ�?�C0����O)�D���;�t�|�*9;������׏q|��W���t�x��=~��FB0��cEp��ŋ=���_=�(��~�l���D@�{�s�������9[>0J��
<�r�k��s�l:�c*���������jNŰ%�a�h�z�T����Gd}~,P��WR���υ�s~_T����n�\2^L�=�˂W�0Pb������-~�5�1s~��!��C��,51\��n�wo- ����>�!q�Iy�a��^�_4��___,��"62�;��<u��7k��E�F7��s6�q���B8�IXdaK�#.{~�n���8�������"���&�t�y~]�����lQ�܏<)�3�l�x������=T���6���*�0u���^@��́X?��t������@�8rN�UJ��<"<*H׺����5gF�Qx�9�
TD�Z� R�E_�J7�����G�|0=�LʻAE�@A���F7�_ޡ@�'GB��:S�yVP<�~QGV�~ϣ��a���-<�rރ�\\�NtQQ�~�(\�H/:*�bT���QL͔���J7��;��J�mŏ���K��o�OU���_O�l����k��CT��/i!E�4��_�]�a��5d�61���?����s������
0�e�9`�]1�X����9.T�~x��0����0�`�.į��\�+t�����lG}���b�g�f��h���t�|I��oO�*ܔ,#0`��&�������X`N  �.~�޷�!~�)�*��t?5{��?�*[�+=|��#� ˾�[�t?����Χ�DX�-\�����#T9�T��xCjM�=�����? LAE�ψ�ym�n��OM��RVD�qo$` ���%�v�^T������)t�_�i�����`G�j����B��=�d��y�1�O�r���gU���}�n�����y�`�?��FZ��p}��r��T��>��c�@Y����<j���ۚ���T��ݗ�f�Pőg�3<uG� �6I�5����~*���1��_�ܥ�v�2�����U�~8�`Qp��*�7���( �q�ټ����~����d��(�ĎO��Y���E�T����T�;�z�4%��u�X��al�^����;d �0Y�,���?�gsp-�s<����@=�����>���T��-^��4��_>���
��*�F�sS�?��7p9��C���#D�����ϔ%HK|&e�8E�����t�1 �$}[�/���f��V�)��s�t}o����Ɓ�F�xm��T��2�pn
��ϟ�s�-s��A�&�v� zy�G����@��<~ɞ��P���`M_�E��yht?��á�?&�?�Pdb�t��9�P�~|����e�*���:��q�~s�\��n�Wo1�s��8�tl�S/����n����ejdf)�#�N�h���پ�WW�~�\�_�Y7������ց��}�t����+��:ٻµ#ޥ��i��qN����'��[o3�M�C��(p�p�����R��٩��ƶ������c��0`��yѧ����i�����e�G��Ǌ���9�[�t?������}L���;.M&5K庋��J7��:���$uP�����@�k��������@�bo*�A����=\GlJ+�:�J7��c���Xe�5 װ7��s�\�(�n���"�1w����0uz�������{����yDP��x_�ҫ7����HW��+t�{��<��-n���c1c��ct�������x%%��-r��%�:���=ܠy)�n��i�w"��R����l��}Q'T�~�ηIo�R�+�s��������s?���w��X�r��t�:���ax���y?�J7�_��=n���ͺ�;�q^����n௯���3F��F��u�$>�N�ދ�����s-7�ۍɥ�"Q`�0�:VW��*��Ϗ9�_�w�BG}�ځ�g��F=^ةJ7�W��p2L-N��J�D�aq٭m��y�J7��s;0�X�����@�A�A����_�    ;ht?\X�ȕ�����R��r*����E�C���g�m|3���B\��'�Lo}+p��¯�t����vam��ĺB-�5 @�.���J7���hqF[	��_H�1� mD9��	�n�w_*�B8��9藶����
��Ï���n�w��W�dqhl���# ���8��_W�~vjBvԕ,�bҺ[�3���`.t�4���9`Υ;6�#�9o�qx;������y�n௏~����W��t*��X���圿������[|3l�3SFB�i�K�jbqIϹ�jt��s�OJ��+�����QAd��*���9�8|��#{Vٺ�8n�"��\�J�=��4	�~x��c�C�_��'2��?��*]����!<�$YhV�)�#'D�m\����豽�H�D�j �˄�10�D��;��E�J���A��7� 7I?�$�������tо����I�o"�%{�ڐ��b��<���>;���l��s�Q��2����q��¯+t��s�������j6���Ѭ� ���U�)��(�����΅�`�\��Ϊ�V�&��S����N� NH^I6�)�nei/�b*=���9����h�-��p8���B���c���N������_��`0}}*��Ϗy`G�Wϣ��'�K�&�8s�?���yϱ��V��Vg]�4|UX8rF�Bl��:��*��ﾸV�#8��.Ã���{������r�sL��Q�����v Ȥ�ȷ���*=��N�H8���"�����(F8��&���G~��rBhf�c댑��� ��\*��_Wͽ~~�*.���z9�^@1���gl���9�!���zÖԀg��d�\�����f��{��B�*���S ).���%�?������}�j���l��AeLi�	�wQ���7|�c�R� 	8jWY��f-�T�6���U}}�9�K0��<Ɓ�QSf,��`a�}��1U_�woE��)�~�͕��f.wb1}J����;s�L��"��^_Ad�e_S������>zb�T�TH�F	Ε���ɦ��/�����7ӂ�T{&�]xXCb�2��7c�M_��o�=���q���k��++�#�L��z�S��C���m�义L�6�|#�Bضn���>��,g3�̓[�y�e����j`V�x]�?�΁���G)�.�
�*6�	Z&�@����i�߽eK%�곓���rc�G�C�Z��x]���'8ن����J�*K8�R\�u�+��#��֦����<��>GJr/3�@��7�=;x�����@@{���m��:�jo�{�N�	#gbYʣ��㙽�}��pQ���	x�a�Y�1U(Rvxqx@���c1%"�������1̦*+G^��E�~�hlFXu�����g� �2'������������,�uzl�������{/�@ 0[0m�/�w�ҁ�*����3q2W�V�cN���K�ȏit�?�X!�6��Y�)��� -���{Q�������r�׳�-]�=d�0|.�ۼ��kt��s����� dʞ�x�I�H���Ƌ�	*��ϯO\����~�Z���moX�E���|��8�O,9O��+�~��! x1��x1ǧ�����f��Q��f�"��0s��Q�k~}6�=��XHă�,�[�; ���E�C�����:ٿ��zJ�L�F�0������P�'�����evY2U�{`X�
��a9e]�P�'�� ұfЋ:��E����=��p������F?�Å�n �� �2?ƹ�D�a&����>-�~�Ϗ�	 X)��B�S����r�mgP�s���-��:ޔ!>����Lo@ĳֶ��*�BG@�[�Ź��dU�����͛� �E�1a���n�{�����PX"�k�D���!,��S�n��O��V����f,��e\�@��o�MU������׆#�(�xSi���.�~]�[��G��`E��ȍ��m���@d�_ԣT�ş�paZV�\%cʷ�� ,����Ŝ�J���Q�8�*Cԃ@T�{!#- ���r9ǅ*����#�B�-)M f^[�ޱ�<���amp
�G �)�v��XmM��>�n���h�=��E3�����x�x�wP���0#�� H}~��q�xez�@ �˅��F����T����#sc@��W\exB�]I�n�oA�i�6�1�.7߭� ȅ��F��{.��,jq�oγ�=�� /��\�%)t�?;R���
��9O�+�=��*b�������s˵�S.����dӔ�.W�s?�����kq��2o��5|��v��k��+�^��"���l�l��nܼS�.��o�T:���u�����-]^	L>D�w6`���ktz?���G����z�<<��l�B���;�������<���e��^����7����>��㬻v�$0�_�":�����X�\��>�/��8,#	uC����Vm� n�f�J������l"K��e�����žW�.�g>Y �������^@'<��]m5�ޠу�x%/�l,g�9Bb��TL9.����R��~��q3 X�Q,�'NE�<e�	8�^W��~y\�E��>�����y|d���^�	Uz���0K�M��),@�%:Έ,�q��M߅B���kG�����
�9s�-kWȳ녞�F�������,9/�]p�Κ��V'Hׅ��F������qI_ߘRj�_��[����`���j����NيX�*��ٍ+Ό�y�A���Gn��9�V�a*���n�B��N=�/��:�y6[�37 ���������~�ց�dp�%���P����c��'�й?U��~vZ�S)�˒jp���k��	 ~��"���a��K�i������Ɣ�#H�,Q�~|����܍HRdN�S?y�hC~L����(�ÌL-V�`ο3�5�������3`wW&XKܣ��Ѿkvn�s?��a��w�+V^� �)��^������tXu�l3�ݒb�]2�m���E�A�����=3K�uᤓN�u(����*��>`����p^,���������uX�{�x�������@)>��Z�K��E�J��Woh�/�Y����-����T���X���/ �L����J۸�����s	��v1��a���������ȓ,�L�7��/�+U:����9,`pӉ�?F܏sa�hˮ�~��/�9��yz�R�R6����u*�y��M����i �iƸ�Z�_��e0!�V���>���<`-y���I�Y7e .�9������³�u1޲e��Xi����T��t�Ǧ��������:��c�l��p�j�{�Uz������Z`@�7�~����cq7�/��Tz����=�c�~v�s)�G ���W���o}ˏ�OS-�bJ��E��|�}ś��
]�_���:J��L����G�7y���w_|]�������xL�uG�|���[�����b�]���ٍ��� �s�E2{��K�+��9�]�=E�ō��:�)�Wn�\�ѕ���^Be d[��w(\��M4���}����?&p��V��G��$�-7n��}8*ůo�#�"�^U�1�⬰	�I��E=J����ъJδ����6pS�(�Y��s|��Q����c� �ۜ��	u�2�W��/�4:�>�n�&��4�щD���L�A^�[����^̬_��-�c�p�2�jiu\�kty�ć���;�@�����Q��C�����uZ���Q�H�c�g����W�(��ꈨ�-}�R!�]3%�T�W)��NU:�_|q �TO��S�\r��%��M�)녮�FG����g���8�΍��! �Ќ0�M��JG��\8�3�aI�V�:<k�0 N�bO�JG�W'n�7P��es�N,��T>u���(~~�v�E_�T�W�L	R3�n�+�s���Q��{�J^����҄ ��c����o��4:��{	�����ڎ-9nR�O<�4���_    /��q��񥈴%�̜�ٸ~�#��Q���gb+Q�<Gdjq�ȸ��Dz�]k������®���&|��H��Q��>6����_�g]u�s�C	͵QR���Mt�/X������{�_�
|��P.�5��%K���BG�����7�~����A����فs��M����[�!'�Z9?�=�p�\�5S�b^����wo���k�o�σ�+��Rn3"&�s~��Q��G.�jR\��e<�[��C@���8H������q/>n�հ%X� =8.h�E��J7��K��W���|r�J@n��6Z�Xͅ��t�s�����<ᰌs	tSh3��_���tudA_�k�?92��!fn�`���9T��_|�#%D�1�djo�0�|P�O�b�J7��G<{������f��Z½��ɚ�l��*�F�����c�B@�]l^��T���9@k��Y��*�0�g� h4h]荫��sd�h�q�89 (��fN �NN�����9J�=x�I
����\��fX]��� �~��t��=�Y��Gu���J7ٶ��/*���ӗXc �olED�ǉ|�i
�\�n����s�a��7��l�d�(*	'k.����s�̄�<����j�|n���K�R����G���]٢��&��,<�*�����y�W鱽�h�땄�k������T�%z<�|Q�V�}�17�#^a܍z㝛pW}@���+��E��j��;G�>�ֆ"�e0�O��p����)t��slp�r=�˫ed�(����뺘�U����i�\0ߖ�J�0�N��Ou�E�|�{�H��$�s����< ��U0���y�j>�{/u�U����$�/�G0�ήH�9�P�G}�#'R��#G�H1��9\��.����j��m5� �N�tQ�W&ʢv�Z�����G���l�Qi�Q� yl8�l��ГV�}��S�r�M)#Q��q�®ث{1ר���X�5����H�1�9�zs��ԋ������y q�p�,CQB����o��zq_T���9<�P�擌����@�Vá�s<�����i]�l�Y�M� O�A�ki�s ɻ\���p>4�l��^��a�A�̓��׶R��J����s���e��g��f��&+H��.�_Գ5s8�9��m`-�r�
�~X�y�5y�!�rQS��|��y��H�Oz����[�^ִ՞�l����<�F��}�dq��[��>�˰��{�4s'_����e+��\:�]��2�Q�e.�f���������zy/0��d	Ls�}a��z�����c)� ^�dCɴ��
[�Kx_�bNK�G��c�&K)6.mx�����]Tk��K���a�a����l�\�Q��$�!��̼�;���p���;������Ep'��m��ŽU��vJK�d�a~�b�\��G�#��qU?�g��q"�h��P,>XF���G��q?;M=D��e��u�� ��8 mk��;��i�q?� Oq}�g0�"�0�;@P�����*}���sax[��>	G�xb\��AS��~�!�ܼ+��^bP[�� K���3�E_����s���*M���DgG��5^��_�U�凃8�T���<�=��
��n������9��0��ۉ(U�W���[}�]�]h�?��^Bm2���ą1�%T�\�ө���J�E��#�O�z�2P��C�����4wp
�)�e�䒱��o�d��}��<j �J ��>�v+&%P=(Q ��L�o��G/~X x^�'ÓT�
e���M�R�o�������M��28:T<"�ہrd���>���:۝A��	����u�������>?V7� pP�ąۃ�<Nʄ���m_�g���}��Qw�/��S&�{n���O��W�d&�F�P$�uî�� ����R_�C�͍*C�Q2mK�{�ZM�Bā���R_�/�mJm��ɕ$���ޠy1�u�<Tz�.D�X��˓�x\i����R��s*���N��ˢ���[�KPaǪ)�z/��U�l����;Q�����~���]�+���s�z�}�Q�/�"ϐ>i��)�`��,'�t_t�l��S.lM�ۋ &�Gq	]��5�g��ߠ�g�7�1��v�;�}u�2���;S��/�ճ�R:G���ҏ�X�eÅ�����ٯ}d��X
=�Ի������#���Jj��r�P�$��Ҥ�dJ��(��{��yd]=[��3��u�ą�"����q�!PD�����iu���J�/C�\���M�1]=�{6㯝���`�-Si�$��N��.�.T�l9`akL����Wn��9�����0.�+u�����8���KmϽ+�5���������a�+��6��P����CA�������{YeM� �J��m�j&�)� �dD�=V�z��ש�b@,�̇TYopO�+�%�.�#�����0=���Hݯ��>�7���
rn�z�_�B`�n�49U���詃#���"?��g����!P�)��9�
��-Ap[/�g��t�t0�ȍ��ƅ��+���ճ_ڃ�AZJsY�mU&]3�D�iC��?�g�q�l�3aq��<P,����A�;Uճ_;0�Dr%��V�z���GTH~]�U�l9��o�V��j�;?�
S���[��g�9��#0v�W����f����� ��<[W��p!.��7GS]�z�O6��(G��}]=��Q�r81�Ϣ/[_ED�+�W���ճ���p���������s���mq�������K����V���Y����,��q1_��g�~=���*�q��P�� ҟy�:[����ճ�����ƽ��j�R);�ǚF��8@�������ֺ�;r?2�W:Sr1�E�t�EFW�~��>M
�o�)�Xh���9�P�z9�z��ǀ
f4��䷃�<0�۸�5V �?�g���|�Weq�!p�w�����mpm]�m��ٯ�0��ѡ����~�,bh�)Ė�.��t��7�پkw�]"E�8ܚM���0�9-U=��c��,gc���-1��W��z�0�BOIW���i�>�:/v�$m�d*���<_��g����?����k\VT'�s+�E�CW�~�ǆˠ�T��s��(������3/uQ��ճ�4�-�X����Tv�,���_
���>OU=۾�.dJ�Wg�ǍO���+������m!�m"�N�7�iN8n��pċ�O]=��K���)��
�-��蠗�(�b.IW�~�cU<%���A�1I��'��N��ڸ���ճ�8gf��vH��8y�X��d�!t�ϯ�g������m�̯����0�6�EB�<?��g���:��V����Ƃï3S6\,xe \���t������i�Y�"�Sk�v^��ճߺ�����Jr$�q����?4w���?B��="kɔ#�F��++B)���"S�ݹ߽2��]kW��2+�s5Tz��?\t�|���2�
0/���3p^�����_O�q`���h�\�brjse�y_��~���'O�b)�}�����h���ϩ�l���|M��Ro?���v���B��}�}�G��+��B����7���*�g�89�[I���R%������C�g���wn\�~Ғ?%ٲo �͞�S��}���.����B�ұ�����{�}׈��?г�݇�$@�䘊���ͱ�.x�M�`@�x*=�^��l&�#L8��3��9�8F_]��G�~*=�^��.n�Q�֯;֡ 4� ���:Tz��l��=��'�9�ӕͶ���/�3���P���:r�v �m��#34�y.'�'N�����P������k��Qڜ�'�=�����ǹ�h���Ι���r��ڜ�����.SF�]���}�c-N^��B�#�c���d�ĴJ}�ۭJ�~��iEvs�w�|�p���l�[��u���{0[�&��������ξp#����?^�J�~�i��7�Mlq�*u�vM�K���ۋJ���S 2X.{���&����f�Jd?�v�����y'$P̖��Q    �ԑ9n�0��W���P���:`L�GGQ�CY�����Z~�]���}���S@�R)֏�Z��օ5�ps��Uz�c/n�q'�*���y��vߜ�q�ޏסҳ�Q�v�l�s�y�6�g&�r�lt�����SS��,]�{R�NǏ:N��������J�~��E g|G���(���',x/������ҳ�u��lbT�S����a>�cl<��8�A*=�s.8 �kX��Z�lOP�i|;����=��ُ��:�pDmR7./ƫ�_��.��9����:�
�r����9*��:\a������3'`n,?<�Pxy���w�7N���ܟ���g?�ŷd��TY���a}�e48��➪��G�ve�gb�C"�-�:�l�d}�_Tz��qca7�Vh�Lq��ڞD0����~h��7��ʮR��l],Ah� �B/�E�g?v$��?66E޿tN�����L�a�s��ѳ�uX��Di���6��ec�,�X�C:�����[�����Rl�ٱ�\�-�c��/*=��cLb�DiS�.d��C�J��C�g����p�<O=��7^%km������S����˒qI0�gb�`���@�:[r>�c*=���G�pΓj[P.��N����J��ė�)]ӱ�!�AT*Spm����b?Tz�c�.�X�+�y 싃_�Y�`+��X���F�~�Qg��VNi��� 2�uaw�j���P�ٟs�(~^�2��Q��A:���q��Q��O�#�2�\�6d��mG�ڮ�z�wP��� �X���>�����,��^؋J�~xÄ	���������:��������~��Y'ֱ��
,�d�q�6E�s��ѳ�՘����c��l	N��֜ sy��C�g?�p�B���� ���K6�m����<J�g?���v VO��d�+\�@!��e��=U��O�s`	kt|�	���AP~�������V�g?� ��𥈁�G�U�?��{jop�J�~�ֻ�=�x��@����d��l��S�<������9i��*�t�(�$��h�H!�������ٟ�:�/���*󅎓q6��L�nu��d����Ӛ�1�e_W�wI��;��9?������`�n�^�"�LlJ
�[6;�9�T�ٟ|�U��͌�a/���\)�˞� ����-L5V�)�L��ů
�<��9R�ٟ�e[����|O89���!hf�����C�g��5����tRa2nCQ
��&���P��v�ꂵ2�,�|/���3�I��v�Գ=�>;᭶����2�̱�qD��p�8H�gs�Wm��/A�9�s:1��|J=�눋�� J��XBCĶT"��s�Գ�s�%������Tka���eM����*�l�{m�'��u��l�[2LD�V{��^���\P�9�kH�7����#����~(�l��%�����΁gcɠ�@r�o��5�Z��:8��H��x;HunxX����:�z��c� �ٮ�!7���~ 1����9^W���?���n-,�|v�v�%�>�rf|�����\>`«q$|��9#�br����=�3P���ǀ�g��@�?�O��%���ʋ8�Գ���l�,rp�#Y9
������@�Y����u�����R����l,ysJ>&��1��}���@��9�Z�9VN���.���P�g����8�@�f�S�����؋:��-�2<*PX.���/�����ڞ� 9�ȏ��l�/	>f�c-ԝ����� �R#1Ӌ�>��}�#�T͇Ha/,zH�g��c��ֳ�8�l���8wvI�`RP ����e�ۋR��:V� # ��O��������KD(8�J=[��Xc�8"(�3�����@ ��NI�g��",�
���yѽ�/K��Z4��?U����[������� �������:�J=[�Ǆy2������'��m-�4@�s�Գ����dǋ٥y1 ��'��F�XM8�J=��/���b�5<N

�s�Yd������ق��#E(p�|�PWf���kk9��v�Ёtz���ˡ^�������+o��@ǹ�P�ٲ� Xd|�@�-�����g��R��w~pl�Q�㲟#�4�9�l���R����ap���2ŉ������3=[�6��$�.P<�K�~�A�7|���S��\G��eX����6X/` v�6������l��]=�ŝz6"1�`�������8�Գ�W���t�'m�CA�>�;�8Y�g>�ޙ!Yޛ&�O��AT�'"Q?��)�lY�ǥ���p;���J3�d�t��V�g�-lЧ+�ž�2w���Zkr���Ёtz����r��>��� �왒3�ߨ�����R�{q�/����Y �͚|�	�k��E}�Rϖsi�i�ݛ|+j��WM��cMo��:�z��¾���֔P��:6�&��Я����l��7�n`��w��-Gr��L�E}�N��1��oa�үorN�GН���c��~L�g˹ 4�59U, #�\i�b	]��gKܟm����;�F��pB�s��_��r?(
qz謷��ce�a�Q��
���sQ��³�Kg���'S,���*�\Lj���-�Rr��l��1�-ճ+�jq\��}n�J=[�%�*`:��_������7q���s��ق�G��)��E�����jm\�/�Ouz��?6Sa������}Y;���G��/s�z�ė�E��pi�N�s4}�<���k�ɏ)�l�c|�m�wn0��Y/-Gs�'�\z��P�ْw0]&�b���T�x�H� �q��y:��-�{�Y�17�x�.����-��k��z6�1+VըZ��r��Ӟ��y�����-�Z͸uY���۸��J��������vJ=������f\>��2��8���=�6p7!�C�gK?�=�Ot&�,�!�IGt9m�xJ=��7^+XK!N� !����������:�z�� ��ߎ+u�|2�a�~�N}=?��-�af��B�54����/��s�鹽��l�3W¬�ee_5�<;!"T�o ���u(��{!� G��0,�].���<^�Rϖs�"^�f���f�>�� nYݛv���-}�J2�=b��Я��������:�z��g�M�xD�}� ���d����L���Nϖ>Fp'���IYT�?�5O����֯סӳ���@G���<-��
,k����5����Գ�yIl�����!`�� B�+m���x�O�z���F.��nN[	�R/��s*b�G�;��J=[�`��ð���w�'�(�^��C�g�}�����u1�3���zd���[��}��n)��^�]��4Źv@1�f��� ��-� ����}vd�5_��'��F���R��5)�m9�?ʖ
�c��3����~�?�z��9��惨�h�`��.�c���͹�P�قOY�aP3�n<U�:%��.�<����n�z�����J/&jB�P	! ��d8�h�>_�Nϖ>W5��&C ��L�Gl�� �]l��y�u������Z���y.�<�<4L�]����n�z��'���Y�^97� Ŗ� 3�(�����E�gK��V�5X���cx�e_!��n�`?tz���#���L�s��շ�9#�(���\�z��Y DT�S��."��L�m�Z���E�g�s5"�,�{��XL-���������^tz���2A����T��|<��X+����Rϖ9��� �یc��ہH��:*�r/�~L�go .��\!L�8-�S�i���9����w|���(-�f$�S��7y�dd�|��z��B���(a���4���8v�6�S��<�)��{��`�3m��
ip20'�Qٕ���t8Y�g�}��B
[|�B��)&�3�T�m����-}���ݎ��I����tgjo&�s�U����L)�u҃ES��ة�r��fv��T�g�����/y?v�ae\"?��L��T�gK�C Y1RX<.sVkB(Z�t0 8�t�וz��c&��es~T�\L+
Z�V�    9����b/��7l�m��N{�R��� ��y)��-�tf4&���G��+��n|�u����-���"97�с`��V��3+���RϾ��rtC7�s�hS>>�+�1�;��J=���t ��A�g>�Qr^�x�/�E�g���PB����ϑsw�|�nI�b2/�:=��A�-�X��z�e��,�FZ��/p�R��f�k�kd�2uЙ��LJ�|�O�z��?5�#�p��\���[�����A�g��+a�,���Ӛ�?�4 G>���:=[֑vK��3�<r >ŕ���;�|�ouz��K���I��dnxe����a�s�Գe�@E�DV}���OG`�+[�\j $��C�gK|�k%rj]M3𧁏���t����u��-��y�y���U 	,l�ʙ<�4���u(�l����F>W%�l�|�W�����קԳ�\���a])s�vf�P��ݏ���c�>��X�7�G��`���p�AwË��J=;���C� ��hU���6>̴5]{�.I�gsޖŁIN�u��/��$�HslD�����u8\ií��7d�Jq2��tl$�^�eQ��\b>�o��X�Ձ'a�������؋N��F�Ɔ��˭3l"��0�E����u�)�g��E�}�}p�� ��	��>5:=�����Z�:�-�9�umN�70�E�s��-~��Å\�3�y?��R�^;%���:z���u  wv�� /�o0����W_@�}�/��)�l�ck��uk�<`���׵�	�0�����x��8��u��@v�G�-e1M���QJ=��H�����L��߲/������O.�~L�gs��=L�_7�P�R���G�{���y=�Rϖut��+�<�&p�Y�l�\��z�]�gs6������bBx��,��b�R��:��ӊ�S1��,��6 �8���-q�b�@@t��Pjw��uک�e�|�O�z��K�OٸJ#�N�ҕ�ʫԲ�����E�g�_�˯*S_H����9�C�%�?�7.��un�4����b����J��.��}��-�7�P����@��o�,��p�s��ԳíW�Tlz��T�:�F����Ly�wT�g����G�-|W0�o��3k��J�.���r.&DϾp�+,& ��|kvֵ��|�?�zv�:��S2Bh=����;�1/RW�?�z���a[�6�:6�B��09�*��M�`��n]t.,���L$�����+D��V�g�?u���6�N�u[���^v,������RϾ�B[�a'�\���������(H!����l�/.��vM߅b� S��sRQ/�)�l�#����`8W��D�F�g�ͽx�ӳ�\�4��u�	ٱ��`Q.nI���;�Nϖ{:bb2|�!Yź`/&�P>zΣ�z��m��)���0B|vLt���[��-y\�@&ۙ��t3�A�_�[S���_2 ��w$7X��"�����to�z�܏%�*L�)�	�Y4��4ȑ\���:=[�\\3d�	E��o�A.���J=[xv�c@�K�P���s5���Rϖ�Ԍ%[�N'
�$�}�\F��ҋ~l:=[Υ��g5p`wag����:�����l�S�!e �M�ԔH�\�p���}�/X�gK>� )�DA��z�q��{�X=��Rϖ87���_U0/Հ���2X����^�wP��7^ǚ7���c��R�9���"��ӳ�~D3��Fr~v���%���:��_�ϖs�	��~[������(\*��^�L�/�{��l�����ywYN��ڠ�љ�����-�z�܏۰n��l�Vb?���)�	�s�U��b�5�4��Jd��	_|���b�>ǅJ=[���&�LYv�#�4-^�!������6_����9\i,��NA3^�qV�ٲ�4�(�x��醒3n8�ǲ�s�_�����osu� *{�U ��%��e�۩�~�}�h.L���>*u�um|�������P�٢��J��nΑX�)_j���;7�3��@϶wK@��+ �*_�u��x�^����[���u���{��%�����;�Gvf�p��7��C�gۧ�����oX�� Say�]�V�����סҳ�u,�j�|m��/��eӖ��\��}�h�~6��|ϸmt�>#����Z��N�Y��ϕ�J��&�N�D "z��ux�S�+fc��0�I����g�::X�u��HA34���:GC2�s<��*}�^��L+�+e�_ ����[�������~� �&���R!F�ػ	\&wvLx�1z,��:�:GV���G�`@��~l�_G+��)u�@��A�@e�[�Պo9yֱF���z-y�'i�u����}��߯#%81�_mv�檆��	���!���6�>��:G��a8��^�Cu.p��{�����1v.����g�=eY�����~]Swq���+xVpt�sf������`�|~?�3୼��OX_�� =�� ���9�i9y�𝖗�=4qP�3|OY=�s{�5�4����wQ�E�s*�)2q�~��CD�{�Q�� q���#W^�瑃�"�}vg� � `��(�<�v��p��;Sz��f�K��Z@i��TU��*=��]����3`b�ɛlM�~}P�����y֡�i����3.B��sO#~�Y����3x�|L��Yl�����x��G�:7����������gޏk��noE��;+(6	�v��Qw��E�����u;�1�ƽ=��u�s��q%#*���s������Ȁ����U��m���d���<�>�	��?�'|&�KxxOY��̜��t�vo�&����u�= �2Y�^�$�=|�e��Nٵ0�V�=nV)��9���~LU����X~�܆U޿UėU���nVs�W�q� �1�����D�>�q6������i<��~O��ai;��l/�S��� ��3��إ�s��`- RB,F�g�BYa�Λ��͟���"MMmq2|�,�j�oP�2��~�f���d�O�)�D�	;�h����^�9�=s�l�f���-
��� �wyq.���n̺����i�?�ˇ�N_U��4b@b����SB�vO���׹_��~	|��AI�^������c�{����%i������=�o��A�-�ZP��r@�@�� �Z�����@���-�z� �{���N�v�hG��Ħ��ϻ^�s��&�U}�خ��E69$nI�cXV;�r���,SADw3ܻ��6(N���7��Vv� �X�m�Aw��@7�_W��=�����.��æ���Z����B8ǅ�z�{`Tf���4��&B3Ύ��]`�w��ou��z:���[�g��RkaL���ox+�&`C�n��ޘX�֏�{�s��|J�9JN������[X�eZ���u3�f�O��B�oؿ�˴��R��)���PD1CD��Z@/��>�Q���%`�%�3�Z��yZ��,̊�|?Tu�����VC���{pěOpH�ZY%��_�1U��c�{��V�}C��~�N_68/{���?
�@a�Ly�¢�j���V��8�>��eg�5�i�V0}xr�@�ߺ����>�2�3��Ϥ����u��,�Qq�/�����/c0�ٮ��|TXQ<�V�{�S��=��,)�lc��-���^��>����j��>~}Ƙ&x��u�p��mE�r�s�E܏oQZ���rd�%6E&�ql0�9��,&'��r7(�c�F�RF/?ϯ{��!��P�8�j`�n�fct)}y�͙r�ƲrX��gP0>�9Q��=�Ӗ�_d�~�g���o;yl��(��uLS2"�F�'�/�P���QQ���JĢ�A��MJF�3��g�#��"��`��Ұ�eK	��������B��}9��<�;�3�+�yܧ���]0�,�] �.X�h���Ӈ7ppVc��%��,ʹd��[|C���ۭ����m�фv�7qd��XTAp#�%���i�����{�:�C�i�;�� &  s篠�lip�_Tu}O|��$�j����\;i͚�1ҹ+|`X�c�]�`���uX�'h�W=��#�0�d�>��M�*dzj�`5�x�?6�L��h��=��}c�����B\E9��l��/u�����t�~�a�ES��؋G���K�ReB��մA�$]?_��l�/��#6w5�YSr�Ο8�9>��.�e~aϑM�]()�|�܏�Qm��?���an���|�����G��:��v���:�gK�U4c����d*�g�;�a��È6�N�s.�>��8B�p)��	��8��� 9,��h�\�O[f�N�}g,��-�W�S�a���v �+U�>�{_/�GM�ǵ/��dsU���'�U<���؋[��T=�:)�2��b���;?U=��?�����[��r?�ə�sS�/tSM=�W�w��QZ�M����$b�ռ�[� ��a������+��-��s����?�ap@����	�N�ɀ��~�_\a]؊ȗ-�����?��q�����e����0k�u��na[n:����G�Qw�wظ��H�O�̸"�~p2n#@)��6�sLpy�~/���9��!0�͒E�b�d�>�h�cnsEy֑<�V����Q��qӪ���&�hꓟs)@���[S�er��1-Xy��9�A����g�̓sV=����2���)nӋx�1�R �icusټU3 X��]4� R�Y�L#�39*���$��ó1C�,9��Yd��3�Գ�����(`9������f]��0	>8�p��~�굟�p&��٘�H�צ^��2w$��W 	X�e
�z)lNط\��b���Y9�rM89֟�	/D���P@�\5��TU7��d�@�V�$�X���������\Tu��ΰ�"k�q.M�0��n�� w������?�q��Lq�>=�	�*\�9���?~�,[Y%��s�'~t�$���y�TU'��uhtĹ�iZ����&�-��������N�S��t	fJ�!$��0Y8{n/�:�O}P�wc���y�5���&�3�n�9�V�I�c��Y�UX�1`��N55g���<�n����h��I�!H�zp(��O|DD�R��:lJ7��ýŊ��{��<��^��_Z�lua��&CѼ�F �v������R�5��g]�������^�\��S �9�	��� ���H������X�舻�-xO%#CYق�"�������������Ǻ��� �zQ��_�v�@�ҏt�Ɓ���j�ˇ���M��������������     