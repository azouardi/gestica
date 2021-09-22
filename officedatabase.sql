PGDMP     5    4                y           Office    12.3    12.3 �              0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    378039    Office    DATABASE     �   CREATE DATABASE "Office" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'French_France.1252' LC_CTYPE = 'French_France.1252';
    DROP DATABASE "Office";
                postgres    false            �            1259    378167    account_emailaddress    TABLE     �   CREATE TABLE public.account_emailaddress (
    id bigint NOT NULL,
    email character varying(254) NOT NULL,
    verified boolean NOT NULL,
    "primary" boolean NOT NULL,
    user_id integer NOT NULL
);
 (   DROP TABLE public.account_emailaddress;
       public         heap    postgres    false            �            1259    378212    account_emailaddress_id_seq    SEQUENCE     �   CREATE SEQUENCE public.account_emailaddress_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.account_emailaddress_id_seq;
       public          postgres    false    218                       0    0    account_emailaddress_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.account_emailaddress_id_seq OWNED BY public.account_emailaddress.id;
          public          postgres    false    220            �            1259    378177    account_emailconfirmation    TABLE     �   CREATE TABLE public.account_emailconfirmation (
    id bigint NOT NULL,
    created timestamp with time zone NOT NULL,
    sent timestamp with time zone,
    key character varying(64) NOT NULL,
    email_address_id bigint NOT NULL
);
 -   DROP TABLE public.account_emailconfirmation;
       public         heap    postgres    false            �            1259    378238     account_emailconfirmation_id_seq    SEQUENCE     �   CREATE SEQUENCE public.account_emailconfirmation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.account_emailconfirmation_id_seq;
       public          postgres    false    219                       0    0     account_emailconfirmation_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.account_emailconfirmation_id_seq OWNED BY public.account_emailconfirmation.id;
          public          postgres    false    221            �            1259    378682    accounts_portefolio    TABLE     �   CREATE TABLE public.accounts_portefolio (
    id uuid NOT NULL,
    active boolean NOT NULL,
    date_created timestamp with time zone,
    lettremission_id uuid,
    rolecollaborateur_id bigint,
    user_id bigint
);
 '   DROP TABLE public.accounts_portefolio;
       public         heap    postgres    false            �            1259    378671    accounts_profile    TABLE       CREATE TABLE public.accounts_profile (
    id bigint NOT NULL,
    name character varying(200),
    phone character varying(200),
    email character varying(200),
    file character varying(100),
    date_created timestamp with time zone,
    user_id integer
);
 $   DROP TABLE public.accounts_profile;
       public         heap    postgres    false            �            1259    378669    accounts_profile_id_seq    SEQUENCE     �   CREATE SEQUENCE public.accounts_profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.accounts_profile_id_seq;
       public          postgres    false    253                       0    0    accounts_profile_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.accounts_profile_id_seq OWNED BY public.accounts_profile.id;
          public          postgres    false    252                       1259    379143    accounts_pwsafe    TABLE     2  CREATE TABLE public.accounts_pwsafe (
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
       public         heap    postgres    false            �            1259    378661    accounts_scope    TABLE     l   CREATE TABLE public.accounts_scope (
    id bigint NOT NULL,
    "Scope" character varying(100) NOT NULL
);
 "   DROP TABLE public.accounts_scope;
       public         heap    postgres    false            �            1259    378659    accounts_scope_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.accounts_scope_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.accounts_scope_id_seq;
       public          postgres    false    251                       0    0    accounts_scope_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.accounts_scope_id_seq OWNED BY public.accounts_scope.id;
          public          postgres    false    250                       1259    379172    accounts_validator    TABLE     �   CREATE TABLE public.accounts_validator (
    id uuid NOT NULL,
    active boolean NOT NULL,
    date_created timestamp with time zone,
    lettremission_id uuid,
    user_id bigint
);
 &   DROP TABLE public.accounts_validator;
       public         heap    postgres    false            �            1259    378071 
   auth_group    TABLE     f   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
    DROP TABLE public.auth_group;
       public         heap    postgres    false            �            1259    378069    auth_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public          postgres    false    209                       0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
          public          postgres    false    208            �            1259    378081    auth_group_permissions    TABLE     �   CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         heap    postgres    false            �            1259    378079    auth_group_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public          postgres    false    211                       0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
          public          postgres    false    210            �            1259    378063    auth_permission    TABLE     �   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         heap    postgres    false            �            1259    378061    auth_permission_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public          postgres    false    207                       0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
          public          postgres    false    206            �            1259    378089 	   auth_user    TABLE     �  CREATE TABLE public.auth_user (
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
       public         heap    postgres    false            �            1259    378099    auth_user_groups    TABLE     ~   CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);
 $   DROP TABLE public.auth_user_groups;
       public         heap    postgres    false            �            1259    378097    auth_user_groups_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.auth_user_groups_id_seq;
       public          postgres    false    215                       0    0    auth_user_groups_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;
          public          postgres    false    214            �            1259    378087    auth_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.auth_user_id_seq;
       public          postgres    false    213                       0    0    auth_user_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;
          public          postgres    false    212            �            1259    378107    auth_user_user_permissions    TABLE     �   CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);
 .   DROP TABLE public.auth_user_user_permissions;
       public         heap    postgres    false            �            1259    378105 !   auth_user_user_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.auth_user_user_permissions_id_seq;
       public          postgres    false    217                       0    0 !   auth_user_user_permissions_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;
          public          postgres    false    216                       1259    387715    csvs_csv    TABLE     �   CREATE TABLE public.csvs_csv (
    id bigint NOT NULL,
    file_name character varying(100),
    uploaded timestamp with time zone NOT NULL,
    activated boolean NOT NULL
);
    DROP TABLE public.csvs_csv;
       public         heap    postgres    false                       1259    387713    csvs_csv_id_seq    SEQUENCE     x   CREATE SEQUENCE public.csvs_csv_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.csvs_csv_id_seq;
       public          postgres    false    283                       0    0    csvs_csv_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.csvs_csv_id_seq OWNED BY public.csvs_csv.id;
          public          postgres    false    282                       1259    387507    customers_bankacount    TABLE     �  CREATE TABLE public.customers_bankacount (
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
       public         heap    postgres    false            �            1259    378243    customers_city    TABLE     h   CREATE TABLE public.customers_city (
    id bigint NOT NULL,
    city character varying(50) NOT NULL
);
 "   DROP TABLE public.customers_city;
       public         heap    postgres    false            �            1259    378241    customers_city_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.customers_city_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.customers_city_id_seq;
       public          postgres    false    223                       0    0    customers_city_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.customers_city_id_seq OWNED BY public.customers_city.id;
          public          postgres    false    222            �            1259    378251    customers_company    TABLE     �  CREATE TABLE public.customers_company (
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
       public         heap    postgres    false            �            1259    378381    customers_contact    TABLE     
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
       public         heap    postgres    false            �            1259    378261    customers_country    TABLE     �   CREATE TABLE public.customers_country (
    code_country character varying(3) NOT NULL,
    country character varying(50) NOT NULL
);
 %   DROP TABLE public.customers_country;
       public         heap    postgres    false            �            1259    378268    customers_currency    TABLE     �   CREATE TABLE public.customers_currency (
    currency_code character varying(3) NOT NULL,
    currency character varying(50) NOT NULL
);
 &   DROP TABLE public.customers_currency;
       public         heap    postgres    false            �            1259    378275    customers_legalform    TABLE     �   CREATE TABLE public.customers_legalform (
    code_lf integer NOT NULL,
    lf_name character varying(20) NOT NULL,
    full_lf_name character varying(300) NOT NULL
);
 '   DROP TABLE public.customers_legalform;
       public         heap    postgres    false            �            1259    378282    customers_nationality    TABLE     �   CREATE TABLE public.customers_nationality (
    code_nationality character varying(3) NOT NULL,
    nationality character varying(50) NOT NULL
);
 )   DROP TABLE public.customers_nationality;
       public         heap    postgres    false            �            1259    378289    customers_office    TABLE     �   CREATE TABLE public.customers_office (
    code_lf integer NOT NULL,
    office character varying(100) NOT NULL,
    company_id uuid
);
 $   DROP TABLE public.customers_office;
       public         heap    postgres    false            �            1259    378296    customers_person    TABLE     6  CREATE TABLE public.customers_person (
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
       public         heap    postgres    false                       1259    387523    customers_prospect    TABLE     �   CREATE TABLE public.customers_prospect (
    date_contact date NOT NULL,
    id uuid NOT NULL,
    statut integer NOT NULL,
    comment text,
    contact_id uuid,
    office_id integer
);
 &   DROP TABLE public.customers_prospect;
       public         heap    postgres    false            �            1259    378376    customers_representative    TABLE     �   CREATE TABLE public.customers_representative (
    id uuid NOT NULL,
    date_nomination timestamp with time zone NOT NULL,
    terminate_role boolean NOT NULL,
    company_id uuid,
    person_id uuid,
    rolerepresentative_id bigint
);
 ,   DROP TABLE public.customers_representative;
       public         heap    postgres    false            �            1259    378371    customers_representativecompany    TABLE       CREATE TABLE public.customers_representativecompany (
    id uuid NOT NULL,
    date_nomination timestamp with time zone NOT NULL,
    terminate_role boolean NOT NULL,
    company_id uuid,
    representativelink_id uuid,
    rolerepresentative_id bigint
);
 3   DROP TABLE public.customers_representativecompany;
       public         heap    postgres    false            �            1259    378321    customers_representativelink    TABLE     �   CREATE TABLE public.customers_representativelink (
    id uuid NOT NULL,
    date_nomination timestamp with time zone NOT NULL,
    company_id uuid
);
 0   DROP TABLE public.customers_representativelink;
       public         heap    postgres    false            �            1259    378306    customers_rolerepresentative    TABLE     �   CREATE TABLE public.customers_rolerepresentative (
    id bigint NOT NULL,
    rolerepresentative character varying(200) NOT NULL
);
 0   DROP TABLE public.customers_rolerepresentative;
       public         heap    postgres    false            �            1259    378304 #   customers_rolerepresentative_id_seq    SEQUENCE     �   CREATE SEQUENCE public.customers_rolerepresentative_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.customers_rolerepresentative_id_seq;
       public          postgres    false    232                       0    0 #   customers_rolerepresentative_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.customers_rolerepresentative_id_seq OWNED BY public.customers_rolerepresentative.id;
          public          postgres    false    231            �            1259    378366    customers_shareholder    TABLE     �   CREATE TABLE public.customers_shareholder (
    id uuid NOT NULL,
    action integer NOT NULL,
    company_id uuid,
    person_id uuid
);
 )   DROP TABLE public.customers_shareholder;
       public         heap    postgres    false            �            1259    378361    customers_shareholdercompany    TABLE     �   CREATE TABLE public.customers_shareholdercompany (
    id uuid NOT NULL,
    action integer NOT NULL,
    company_id uuid,
    shareholderlink_id uuid
);
 0   DROP TABLE public.customers_shareholdercompany;
       public         heap    postgres    false            �            1259    378314    customers_shareholderlink    TABLE     �   CREATE TABLE public.customers_shareholderlink (
    id uuid NOT NULL,
    date_participation timestamp with time zone NOT NULL,
    company_id uuid
);
 -   DROP TABLE public.customers_shareholderlink;
       public         heap    postgres    false                        1259    378715    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
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
       public         heap    postgres    false            �            1259    378713    django_admin_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public          postgres    false    256                       0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
          public          postgres    false    255            �            1259    378053    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         heap    postgres    false            �            1259    378051    django_content_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public          postgres    false    205                       0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
          public          postgres    false    204            �            1259    378042    django_migrations    TABLE     �   CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         heap    postgres    false            �            1259    378040    django_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public          postgres    false    203                        0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
          public          postgres    false    202                       1259    378746    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         heap    postgres    false                       1259    378758    django_site    TABLE     �   CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);
    DROP TABLE public.django_site;
       public         heap    postgres    false                       1259    378756    django_site_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.django_site_id_seq;
       public          postgres    false    259            !           0    0    django_site_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;
          public          postgres    false    258                       1259    387446    editions_docmodel    TABLE     �   CREATE TABLE public.editions_docmodel (
    code_docmodel character varying(3) NOT NULL,
    name character varying(100) NOT NULL,
    footer boolean NOT NULL,
    header boolean NOT NULL,
    file character varying(100)
);
 %   DROP TABLE public.editions_docmodel;
       public         heap    postgres    false                       1259    387458    editions_docmodelword    TABLE       CREATE TABLE public.editions_docmodelword (
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
       public         heap    postgres    false                       1259    387456    editions_docmodelword_id_seq    SEQUENCE     �   CREATE SEQUENCE public.editions_docmodelword_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.editions_docmodelword_id_seq;
       public          postgres    false    274            "           0    0    editions_docmodelword_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.editions_docmodelword_id_seq OWNED BY public.editions_docmodelword.id;
          public          postgres    false    273                       1259    387451    editions_socialdoc    TABLE     �   CREATE TABLE public.editions_socialdoc (
    id uuid NOT NULL,
    date_doc timestamp with time zone NOT NULL,
    lettremission_id uuid
);
 &   DROP TABLE public.editions_socialdoc;
       public         heap    postgres    false                       1259    387707    editions_stc    TABLE     �   CREATE TABLE public.editions_stc (
    id bigint NOT NULL,
    matricule character varying(10) NOT NULL,
    month integer NOT NULL,
    year integer NOT NULL
);
     DROP TABLE public.editions_stc;
       public         heap    postgres    false                       1259    387705    editions_stc_id_seq    SEQUENCE     |   CREATE SEQUENCE public.editions_stc_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.editions_stc_id_seq;
       public          postgres    false    281            #           0    0    editions_stc_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.editions_stc_id_seq OWNED BY public.editions_stc.id;
          public          postgres    false    280            �            1259    378576    ordres_lettremission    TABLE     \  CREATE TABLE public.ordres_lettremission (
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
       public         heap    postgres    false                       1259    387545    ordres_lettremissionlink    TABLE     �   CREATE TABLE public.ordres_lettremissionlink (
    id uuid NOT NULL,
    date_recrutement timestamp with time zone NOT NULL,
    lettremission_id uuid,
    prospect_id uuid
);
 ,   DROP TABLE public.ordres_lettremissionlink;
       public         heap    postgres    false            �            1259    378533    ordres_moduleservice    TABLE     x   CREATE TABLE public.ordres_moduleservice (
    id bigint NOT NULL,
    moduleservice character varying(200) NOT NULL
);
 (   DROP TABLE public.ordres_moduleservice;
       public         heap    postgres    false            �            1259    378531    ordres_moduleservice_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ordres_moduleservice_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.ordres_moduleservice_id_seq;
       public          postgres    false    241            $           0    0    ordres_moduleservice_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.ordres_moduleservice_id_seq OWNED BY public.ordres_moduleservice.id;
          public          postgres    false    240            �            1259    378541    ordres_ordre    TABLE     �   CREATE TABLE public.ordres_ordre (
    id uuid NOT NULL,
    ordre_date date NOT NULL,
    comment character varying(200),
    statut integer NOT NULL,
    file character varying(100) NOT NULL,
    company_id uuid,
    office_id integer
);
     DROP TABLE public.ordres_ordre;
       public         heap    postgres    false            �            1259    378548    ordres_outlay    TABLE     �   CREATE TABLE public.ordres_outlay (
    id bigint NOT NULL,
    outlay character varying(100) NOT NULL,
    text character varying(300),
    moduleservice_id bigint
);
 !   DROP TABLE public.ordres_outlay;
       public         heap    postgres    false            �            1259    378546    ordres_outlay_id_seq    SEQUENCE     }   CREATE SEQUENCE public.ordres_outlay_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.ordres_outlay_id_seq;
       public          postgres    false    244            %           0    0    ordres_outlay_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.ordres_outlay_id_seq OWNED BY public.ordres_outlay.id;
          public          postgres    false    243            �            1259    378571    ordres_outlayitem    TABLE     �   CREATE TABLE public.ordres_outlayitem (
    id uuid NOT NULL,
    amount double precision,
    ordre_id uuid,
    outlay_id bigint,
    quantity double precision
);
 %   DROP TABLE public.ordres_outlayitem;
       public         heap    postgres    false            �            1259    378558    ordres_service    TABLE     �   CREATE TABLE public.ordres_service (
    id bigint NOT NULL,
    service character varying(100) NOT NULL,
    text character varying(300),
    moduleservice_id bigint
);
 "   DROP TABLE public.ordres_service;
       public         heap    postgres    false            �            1259    378556    ordres_service_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.ordres_service_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.ordres_service_id_seq;
       public          postgres    false    246            &           0    0    ordres_service_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.ordres_service_id_seq OWNED BY public.ordres_service.id;
          public          postgres    false    245                       1259    387674    ordres_servicedescription    TABLE     �   CREATE TABLE public.ordres_servicedescription (
    id bigint NOT NULL,
    text character varying(300),
    service_id bigint
);
 -   DROP TABLE public.ordres_servicedescription;
       public         heap    postgres    false                       1259    387672     ordres_servicedescription_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ordres_servicedescription_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.ordres_servicedescription_id_seq;
       public          postgres    false    279            '           0    0     ordres_servicedescription_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.ordres_servicedescription_id_seq OWNED BY public.ordres_servicedescription.id;
          public          postgres    false    278            �            1259    378566    ordres_serviceitem    TABLE     �   CREATE TABLE public.ordres_serviceitem (
    id uuid NOT NULL,
    amount double precision,
    taxe double precision NOT NULL,
    ordre_id uuid,
    service_id bigint,
    quantity double precision
);
 &   DROP TABLE public.ordres_serviceitem;
       public         heap    postgres    false                       1259    378767    tasks_benefit    TABLE     �   CREATE TABLE public.tasks_benefit (
    code_benefit character varying(3) NOT NULL,
    name character varying(200) NOT NULL
);
 !   DROP TABLE public.tasks_benefit;
       public         heap    postgres    false            
           1259    378801    tasks_benefititem    TABLE     �   CREATE TABLE public.tasks_benefititem (
    id uuid NOT NULL,
    active boolean NOT NULL,
    benefitlink_id uuid,
    date_start date,
    code_benefit_id character varying(3)
);
 %   DROP TABLE public.tasks_benefititem;
       public         heap    postgres    false                       1259    378772    tasks_benefitlink    TABLE     [   CREATE TABLE public.tasks_benefitlink (
    id uuid NOT NULL,
    lettremission_id uuid
);
 %   DROP TABLE public.tasks_benefitlink;
       public         heap    postgres    false                       1259    378811    tasks_benefitrequested    TABLE     ?  CREATE TABLE public.tasks_benefitrequested (
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
 *   DROP TABLE public.tasks_benefitrequested;
       public         heap    postgres    false            	           1259    378796    tasks_claim    TABLE       CREATE TABLE public.tasks_claim (
    id uuid NOT NULL,
    objet character varying(200),
    date_start date NOT NULL,
    statut integer NOT NULL,
    date_end date NOT NULL,
    complement character varying(200),
    invoiced boolean NOT NULL,
    lettremission_id uuid
);
    DROP TABLE public.tasks_claim;
       public         heap    postgres    false                       1259    378779    tasks_period    TABLE     �   CREATE TABLE public.tasks_period (
    id uuid NOT NULL,
    period character varying(6) NOT NULL,
    echeance date NOT NULL
);
     DROP TABLE public.tasks_period;
       public         heap    postgres    false                       1259    378786 
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
       public         heap    postgres    false                       1259    378806    tasks_vatrequested    TABLE     ;  CREATE TABLE public.tasks_vatrequested (
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
       public         heap    postgres    false                       1259    378791 
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
       public         heap    postgres    false            �           2604    378214    account_emailaddress id    DEFAULT     �   ALTER TABLE ONLY public.account_emailaddress ALTER COLUMN id SET DEFAULT nextval('public.account_emailaddress_id_seq'::regclass);
 F   ALTER TABLE public.account_emailaddress ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    218            �           2604    378240    account_emailconfirmation id    DEFAULT     �   ALTER TABLE ONLY public.account_emailconfirmation ALTER COLUMN id SET DEFAULT nextval('public.account_emailconfirmation_id_seq'::regclass);
 K   ALTER TABLE public.account_emailconfirmation ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    219            �           2604    378674    accounts_profile id    DEFAULT     z   ALTER TABLE ONLY public.accounts_profile ALTER COLUMN id SET DEFAULT nextval('public.accounts_profile_id_seq'::regclass);
 B   ALTER TABLE public.accounts_profile ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    252    253    253            �           2604    378664    accounts_scope id    DEFAULT     v   ALTER TABLE ONLY public.accounts_scope ALTER COLUMN id SET DEFAULT nextval('public.accounts_scope_id_seq'::regclass);
 @   ALTER TABLE public.accounts_scope ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    250    251    251            �           2604    378074    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    208    209            �           2604    378084    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    210    211            �           2604    378066    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    207    206    207            �           2604    378092    auth_user id    DEFAULT     l   ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);
 ;   ALTER TABLE public.auth_user ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    212    213    213            �           2604    378102    auth_user_groups id    DEFAULT     z   ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);
 B   ALTER TABLE public.auth_user_groups ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214    215            �           2604    378110    auth_user_user_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);
 L   ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    217    217            �           2604    387718    csvs_csv id    DEFAULT     j   ALTER TABLE ONLY public.csvs_csv ALTER COLUMN id SET DEFAULT nextval('public.csvs_csv_id_seq'::regclass);
 :   ALTER TABLE public.csvs_csv ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    283    282    283            �           2604    378246    customers_city id    DEFAULT     v   ALTER TABLE ONLY public.customers_city ALTER COLUMN id SET DEFAULT nextval('public.customers_city_id_seq'::regclass);
 @   ALTER TABLE public.customers_city ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    223    223            �           2604    378309    customers_rolerepresentative id    DEFAULT     �   ALTER TABLE ONLY public.customers_rolerepresentative ALTER COLUMN id SET DEFAULT nextval('public.customers_rolerepresentative_id_seq'::regclass);
 N   ALTER TABLE public.customers_rolerepresentative ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    232    231    232            �           2604    378718    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    255    256    256            �           2604    378056    django_content_type id    DEFAULT     �   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    205    204    205            �           2604    378045    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    202    203    203            �           2604    378761    django_site id    DEFAULT     p   ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);
 =   ALTER TABLE public.django_site ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    259    258    259            �           2604    387461    editions_docmodelword id    DEFAULT     �   ALTER TABLE ONLY public.editions_docmodelword ALTER COLUMN id SET DEFAULT nextval('public.editions_docmodelword_id_seq'::regclass);
 G   ALTER TABLE public.editions_docmodelword ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    274    273    274            �           2604    387710    editions_stc id    DEFAULT     r   ALTER TABLE ONLY public.editions_stc ALTER COLUMN id SET DEFAULT nextval('public.editions_stc_id_seq'::regclass);
 >   ALTER TABLE public.editions_stc ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    280    281    281            �           2604    378536    ordres_moduleservice id    DEFAULT     �   ALTER TABLE ONLY public.ordres_moduleservice ALTER COLUMN id SET DEFAULT nextval('public.ordres_moduleservice_id_seq'::regclass);
 F   ALTER TABLE public.ordres_moduleservice ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    241    240    241            �           2604    378551    ordres_outlay id    DEFAULT     t   ALTER TABLE ONLY public.ordres_outlay ALTER COLUMN id SET DEFAULT nextval('public.ordres_outlay_id_seq'::regclass);
 ?   ALTER TABLE public.ordres_outlay ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    244    243    244            �           2604    378561    ordres_service id    DEFAULT     v   ALTER TABLE ONLY public.ordres_service ALTER COLUMN id SET DEFAULT nextval('public.ordres_service_id_seq'::regclass);
 @   ALTER TABLE public.ordres_service ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    246    245    246            �           2604    387677    ordres_servicedescription id    DEFAULT     �   ALTER TABLE ONLY public.ordres_servicedescription ALTER COLUMN id SET DEFAULT nextval('public.ordres_servicedescription_id_seq'::regclass);
 K   ALTER TABLE public.ordres_servicedescription ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    278    279    279            �          0    378167    account_emailaddress 
   TABLE DATA           W   COPY public.account_emailaddress (id, email, verified, "primary", user_id) FROM stdin;
    public          postgres    false    218   ��      �          0    378177    account_emailconfirmation 
   TABLE DATA           ]   COPY public.account_emailconfirmation (id, created, sent, key, email_address_id) FROM stdin;
    public          postgres    false    219   �      �          0    378682    accounts_portefolio 
   TABLE DATA           x   COPY public.accounts_portefolio (id, active, date_created, lettremission_id, rolecollaborateur_id, user_id) FROM stdin;
    public          postgres    false    254   7�      �          0    378671    accounts_profile 
   TABLE DATA           _   COPY public.accounts_profile (id, name, phone, email, file, date_created, user_id) FROM stdin;
    public          postgres    false    253   �      �          0    379143    accounts_pwsafe 
   TABLE DATA              COPY public.accounts_pwsafe (id, active, date_created, username, password, lettremission_id, user_id, responsable) FROM stdin;
    public          postgres    false    269   ��      �          0    378661    accounts_scope 
   TABLE DATA           5   COPY public.accounts_scope (id, "Scope") FROM stdin;
    public          postgres    false    251   v�      �          0    379172    accounts_validator 
   TABLE DATA           a   COPY public.accounts_validator (id, active, date_created, lettremission_id, user_id) FROM stdin;
    public          postgres    false    270   ��      �          0    378071 
   auth_group 
   TABLE DATA           .   COPY public.auth_group (id, name) FROM stdin;
    public          postgres    false    209   ��      �          0    378081    auth_group_permissions 
   TABLE DATA           M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public          postgres    false    211   ��      �          0    378063    auth_permission 
   TABLE DATA           N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public          postgres    false    207   !�      �          0    378089 	   auth_user 
   TABLE DATA           �   COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    public          postgres    false    213   Z�      �          0    378099    auth_user_groups 
   TABLE DATA           A   COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
    public          postgres    false    215   ��      �          0    378107    auth_user_user_permissions 
   TABLE DATA           P   COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public          postgres    false    217   ��      
          0    387715    csvs_csv 
   TABLE DATA           F   COPY public.csvs_csv (id, file_name, uploaded, activated) FROM stdin;
    public          postgres    false    283   ��                0    387507    customers_bankacount 
   TABLE DATA           z   COPY public.customers_bankacount (id, bank_name, agency, rib, bic, iban, closed, clos_date, company_id, file) FROM stdin;
    public          postgres    false    275   %�      �          0    378243    customers_city 
   TABLE DATA           2   COPY public.customers_city (id, city) FROM stdin;
    public          postgres    false    223   M�      �          0    378251    customers_company 
   TABLE DATA           B  COPY public.customers_company (id, name, adresse, code_postal, national_law, ice, identifiant_fiscal, cnss, rc, tp, activity, fiscal_year, create_date, share_capital, nominal_value, statut, terminate_date, liquidation_date, file, city, country_id, currency_id, legal_form_id, nationality_id, file_if, file_rc) FROM stdin;
    public          postgres    false    224   j�      �          0    378381    customers_contact 
   TABLE DATA           f   COPY public.customers_contact (id, fonction, email, phone, active, company_id, person_id) FROM stdin;
    public          postgres    false    239   �?      �          0    378261    customers_country 
   TABLE DATA           B   COPY public.customers_country (code_country, country) FROM stdin;
    public          postgres    false    225   �@      �          0    378268    customers_currency 
   TABLE DATA           E   COPY public.customers_currency (currency_code, currency) FROM stdin;
    public          postgres    false    226   �H      �          0    378275    customers_legalform 
   TABLE DATA           M   COPY public.customers_legalform (code_lf, lf_name, full_lf_name) FROM stdin;
    public          postgres    false    227   �P      �          0    378282    customers_nationality 
   TABLE DATA           N   COPY public.customers_nationality (code_nationality, nationality) FROM stdin;
    public          postgres    false    228   �Q      �          0    378289    customers_office 
   TABLE DATA           G   COPY public.customers_office (code_lf, office, company_id) FROM stdin;
    public          postgres    false    229   �W      �          0    378296    customers_person 
   TABLE DATA           �   COPY public.customers_person (id, last_name, first_name, civility, id_card, id_numbre, birth_date, birth_place, adresse, code_postal, resident, city, country_id, nationality_id, file) FROM stdin;
    public          postgres    false    230   OX                0    387523    customers_prospect 
   TABLE DATA           f   COPY public.customers_prospect (date_contact, id, statut, comment, contact_id, office_id) FROM stdin;
    public          postgres    false    276   �X      �          0    378376    customers_representative 
   TABLE DATA           �   COPY public.customers_representative (id, date_nomination, terminate_role, company_id, person_id, rolerepresentative_id) FROM stdin;
    public          postgres    false    238   �Y      �          0    378371    customers_representativecompany 
   TABLE DATA           �   COPY public.customers_representativecompany (id, date_nomination, terminate_role, company_id, representativelink_id, rolerepresentative_id) FROM stdin;
    public          postgres    false    237   �Y      �          0    378321    customers_representativelink 
   TABLE DATA           W   COPY public.customers_representativelink (id, date_nomination, company_id) FROM stdin;
    public          postgres    false    234   �Y      �          0    378306    customers_rolerepresentative 
   TABLE DATA           N   COPY public.customers_rolerepresentative (id, rolerepresentative) FROM stdin;
    public          postgres    false    232   NZ      �          0    378366    customers_shareholder 
   TABLE DATA           R   COPY public.customers_shareholder (id, action, company_id, person_id) FROM stdin;
    public          postgres    false    236   kZ      �          0    378361    customers_shareholdercompany 
   TABLE DATA           b   COPY public.customers_shareholdercompany (id, action, company_id, shareholderlink_id) FROM stdin;
    public          postgres    false    235   �Z      �          0    378314    customers_shareholderlink 
   TABLE DATA           W   COPY public.customers_shareholderlink (id, date_participation, company_id) FROM stdin;
    public          postgres    false    233   �Z      �          0    378715    django_admin_log 
   TABLE DATA           �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public          postgres    false    256   �[      �          0    378053    django_content_type 
   TABLE DATA           C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public          postgres    false    205   ��      �          0    378042    django_migrations 
   TABLE DATA           C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public          postgres    false    203   ��      �          0    378746    django_session 
   TABLE DATA           P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public          postgres    false    257   Ɵ      �          0    378758    django_site 
   TABLE DATA           7   COPY public.django_site (id, domain, name) FROM stdin;
    public          postgres    false    259   ء      �          0    387446    editions_docmodel 
   TABLE DATA           V   COPY public.editions_docmodel (code_docmodel, name, footer, header, file) FROM stdin;
    public          postgres    false    271   �                0    387458    editions_docmodelword 
   TABLE DATA           �   COPY public.editions_docmodelword (id, ordre_parag, type_parag, sort_parag, size_font, space_after_parag, space_befor_parag, alignment_parag, ident_first_ligne, code_docmodel_id, bold_font, undeline_font, variable, texte, italic_font) FROM stdin;
    public          postgres    false    274   ��      �          0    387451    editions_socialdoc 
   TABLE DATA           L   COPY public.editions_socialdoc (id, date_doc, lettremission_id) FROM stdin;
    public          postgres    false    272   D�                0    387707    editions_stc 
   TABLE DATA           B   COPY public.editions_stc (id, matricule, month, year) FROM stdin;
    public          postgres    false    281   a�      �          0    378576    ordres_lettremission 
   TABLE DATA           �   COPY public.ordres_lettremission (id, reference, db_office, entry_date, terminate, leave_date, file, company_id, moduleservice_id, office_id) FROM stdin;
    public          postgres    false    249   ~�                0    387545    ordres_lettremissionlink 
   TABLE DATA           g   COPY public.ordres_lettremissionlink (id, date_recrutement, lettremission_id, prospect_id) FROM stdin;
    public          postgres    false    277   m�      �          0    378533    ordres_moduleservice 
   TABLE DATA           A   COPY public.ordres_moduleservice (id, moduleservice) FROM stdin;
    public          postgres    false    241   ��      �          0    378541    ordres_ordre 
   TABLE DATA           d   COPY public.ordres_ordre (id, ordre_date, comment, statut, file, company_id, office_id) FROM stdin;
    public          postgres    false    242   �      �          0    378548    ordres_outlay 
   TABLE DATA           K   COPY public.ordres_outlay (id, outlay, text, moduleservice_id) FROM stdin;
    public          postgres    false    244   ��      �          0    378571    ordres_outlayitem 
   TABLE DATA           V   COPY public.ordres_outlayitem (id, amount, ordre_id, outlay_id, quantity) FROM stdin;
    public          postgres    false    248   _�      �          0    378558    ordres_service 
   TABLE DATA           M   COPY public.ordres_service (id, service, text, moduleservice_id) FROM stdin;
    public          postgres    false    246   A�                0    387674    ordres_servicedescription 
   TABLE DATA           I   COPY public.ordres_servicedescription (id, text, service_id) FROM stdin;
    public          postgres    false    279   ��      �          0    378566    ordres_serviceitem 
   TABLE DATA           ^   COPY public.ordres_serviceitem (id, amount, taxe, ordre_id, service_id, quantity) FROM stdin;
    public          postgres    false    247   l�      �          0    378767    tasks_benefit 
   TABLE DATA           ;   COPY public.tasks_benefit (code_benefit, name) FROM stdin;
    public          postgres    false    260   f�      �          0    378801    tasks_benefititem 
   TABLE DATA           d   COPY public.tasks_benefititem (id, active, benefitlink_id, date_start, code_benefit_id) FROM stdin;
    public          postgres    false    266   �      �          0    378772    tasks_benefitlink 
   TABLE DATA           A   COPY public.tasks_benefitlink (id, lettremission_id) FROM stdin;
    public          postgres    false    261   �!      �          0    378811    tasks_benefitrequested 
   TABLE DATA           �   COPY public.tasks_benefitrequested (id, year, month, amountrequested, amountreceived, statut, complement, benefitlink_id, lettremission_id) FROM stdin;
    public          postgres    false    268   "F      �          0    378796    tasks_claim 
   TABLE DATA           v   COPY public.tasks_claim (id, objet, date_start, statut, date_end, complement, invoiced, lettremission_id) FROM stdin;
    public          postgres    false    265   ?F      �          0    378779    tasks_period 
   TABLE DATA           <   COPY public.tasks_period (id, period, echeance) FROM stdin;
    public          postgres    false    262   \F      �          0    378786 
   tasks_task 
   TABLE DATA           �   COPY public.tasks_task (code_task, name, category, to_add, numbre_add, frequency, year_civil, repeted, persontype, specific, code_benefit_id) FROM stdin;
    public          postgres    false    263   �F      �          0    378806    tasks_vatrequested 
   TABLE DATA           �   COPY public.tasks_vatrequested (id, year, month, amountrequested, amountreceived, statut, complement, benefitlink_id, lettremission_id) FROM stdin;
    public          postgres    false    267   �K      �          0    378791 
   tasks_work 
   TABLE DATA           �   COPY public.tasks_work (id, date_limit, value, proof, statut, file, period_id, lettremission_id, task_id, supervised) FROM stdin;
    public          postgres    false    264   �K      (           0    0    account_emailaddress_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.account_emailaddress_id_seq', 1, false);
          public          postgres    false    220            )           0    0     account_emailconfirmation_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.account_emailconfirmation_id_seq', 1, false);
          public          postgres    false    221            *           0    0    accounts_profile_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.accounts_profile_id_seq', 2, true);
          public          postgres    false    252            +           0    0    accounts_scope_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.accounts_scope_id_seq', 1, false);
          public          postgres    false    250            ,           0    0    auth_group_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, true);
          public          postgres    false    208            -           0    0    auth_group_permissions_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, true);
          public          postgres    false    210            .           0    0    auth_permission_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_permission_id_seq', 220, true);
          public          postgres    false    206            /           0    0    auth_user_groups_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, true);
          public          postgres    false    214            0           0    0    auth_user_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.auth_user_id_seq', 2, true);
          public          postgres    false    212            1           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);
          public          postgres    false    216            2           0    0    csvs_csv_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.csvs_csv_id_seq', 16, true);
          public          postgres    false    282            3           0    0    customers_city_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.customers_city_id_seq', 1, false);
          public          postgres    false    222            4           0    0 #   customers_rolerepresentative_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.customers_rolerepresentative_id_seq', 1, false);
          public          postgres    false    231            5           0    0    django_admin_log_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 504, true);
          public          postgres    false    255            6           0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 55, true);
          public          postgres    false    204            7           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 74, true);
          public          postgres    false    202            8           0    0    django_site_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.django_site_id_seq', 1, true);
          public          postgres    false    258            9           0    0    editions_docmodelword_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.editions_docmodelword_id_seq', 7, true);
          public          postgres    false    273            :           0    0    editions_stc_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.editions_stc_id_seq', 1, false);
          public          postgres    false    280            ;           0    0    ordres_moduleservice_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.ordres_moduleservice_id_seq', 1, false);
          public          postgres    false    240            <           0    0    ordres_outlay_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.ordres_outlay_id_seq', 6, true);
          public          postgres    false    243            =           0    0    ordres_service_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.ordres_service_id_seq', 1, false);
          public          postgres    false    245            >           0    0     ordres_servicedescription_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.ordres_servicedescription_id_seq', 1, false);
          public          postgres    false    278            �           2606    378200 3   account_emailaddress account_emailaddress_email_key 
   CONSTRAINT     o   ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_email_key UNIQUE (email);
 ]   ALTER TABLE ONLY public.account_emailaddress DROP CONSTRAINT account_emailaddress_email_key;
       public            postgres    false    218            �           2606    378204 .   account_emailaddress account_emailaddress_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.account_emailaddress DROP CONSTRAINT account_emailaddress_pkey;
       public            postgres    false    218            �           2606    378184 ;   account_emailconfirmation account_emailconfirmation_key_key 
   CONSTRAINT     u   ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_key_key UNIQUE (key);
 e   ALTER TABLE ONLY public.account_emailconfirmation DROP CONSTRAINT account_emailconfirmation_key_key;
       public            postgres    false    219            �           2606    378230 8   account_emailconfirmation account_emailconfirmation_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.account_emailconfirmation DROP CONSTRAINT account_emailconfirmation_pkey;
       public            postgres    false    219            �           2606    378686 ,   accounts_portefolio accounts_portefolio_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.accounts_portefolio
    ADD CONSTRAINT accounts_portefolio_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.accounts_portefolio DROP CONSTRAINT accounts_portefolio_pkey;
       public            postgres    false    254            �           2606    378694 N   accounts_portefolio accounts_portefolio_user_id_lettremission_id_e6855540_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.accounts_portefolio
    ADD CONSTRAINT accounts_portefolio_user_id_lettremission_id_e6855540_uniq UNIQUE (user_id, lettremission_id);
 x   ALTER TABLE ONLY public.accounts_portefolio DROP CONSTRAINT accounts_portefolio_user_id_lettremission_id_e6855540_uniq;
       public            postgres    false    254    254            {           2606    378679 &   accounts_profile accounts_profile_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.accounts_profile
    ADD CONSTRAINT accounts_profile_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.accounts_profile DROP CONSTRAINT accounts_profile_pkey;
       public            postgres    false    253            }           2606    378681 -   accounts_profile accounts_profile_user_id_key 
   CONSTRAINT     k   ALTER TABLE ONLY public.accounts_profile
    ADD CONSTRAINT accounts_profile_user_id_key UNIQUE (user_id);
 W   ALTER TABLE ONLY public.accounts_profile DROP CONSTRAINT accounts_profile_user_id_key;
       public            postgres    false    253            �           2606    379147 $   accounts_pwsafe accounts_pwsafe_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.accounts_pwsafe
    ADD CONSTRAINT accounts_pwsafe_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.accounts_pwsafe DROP CONSTRAINT accounts_pwsafe_pkey;
       public            postgres    false    269            �           2606    379149 G   accounts_pwsafe accounts_pwsafe_username_lettremission_id_3c7f44d1_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.accounts_pwsafe
    ADD CONSTRAINT accounts_pwsafe_username_lettremission_id_3c7f44d1_uniq UNIQUE (username, lettremission_id);
 q   ALTER TABLE ONLY public.accounts_pwsafe DROP CONSTRAINT accounts_pwsafe_username_lettremission_id_3c7f44d1_uniq;
       public            postgres    false    269    269            w           2606    378668 '   accounts_scope accounts_scope_Scope_key 
   CONSTRAINT     g   ALTER TABLE ONLY public.accounts_scope
    ADD CONSTRAINT "accounts_scope_Scope_key" UNIQUE ("Scope");
 S   ALTER TABLE ONLY public.accounts_scope DROP CONSTRAINT "accounts_scope_Scope_key";
       public            postgres    false    251            y           2606    378666 "   accounts_scope accounts_scope_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.accounts_scope
    ADD CONSTRAINT accounts_scope_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.accounts_scope DROP CONSTRAINT accounts_scope_pkey;
       public            postgres    false    251            �           2606    379176 *   accounts_validator accounts_validator_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.accounts_validator
    ADD CONSTRAINT accounts_validator_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.accounts_validator DROP CONSTRAINT accounts_validator_pkey;
       public            postgres    false    270            �           2606    379178 L   accounts_validator accounts_validator_user_id_lettremission_id_dd0dd010_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.accounts_validator
    ADD CONSTRAINT accounts_validator_user_id_lettremission_id_dd0dd010_uniq UNIQUE (user_id, lettremission_id);
 v   ALTER TABLE ONLY public.accounts_validator DROP CONSTRAINT accounts_validator_user_id_lettremission_id_dd0dd010_uniq;
       public            postgres    false    270    270            �           2606    378744    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public            postgres    false    209            �           2606    378123 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public            postgres    false    211    211            �           2606    378086 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public            postgres    false    211            �           2606    378076    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public            postgres    false    209            �           2606    378114 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public            postgres    false    207    207            �           2606    378068 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public            postgres    false    207            �           2606    378104 &   auth_user_groups auth_user_groups_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
       public            postgres    false    215            �           2606    378138 @   auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);
 j   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq;
       public            postgres    false    215    215            �           2606    378094    auth_user auth_user_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
       public            postgres    false    213            �           2606    378112 :   auth_user_user_permissions auth_user_user_permissions_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
       public            postgres    false    217            �           2606    378152 Y   auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
       public            postgres    false    217    217            �           2606    378738     auth_user auth_user_username_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);
 J   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
       public            postgres    false    213            �           2606    387720    csvs_csv csvs_csv_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.csvs_csv
    ADD CONSTRAINT csvs_csv_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.csvs_csv DROP CONSTRAINT csvs_csv_pkey;
       public            postgres    false    283            �           2606    387515 L   customers_bankacount customers_bankacount_company_id_bank_name_052b55cc_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.customers_bankacount
    ADD CONSTRAINT customers_bankacount_company_id_bank_name_052b55cc_uniq UNIQUE (company_id, bank_name);
 v   ALTER TABLE ONLY public.customers_bankacount DROP CONSTRAINT customers_bankacount_company_id_bank_name_052b55cc_uniq;
       public            postgres    false    275    275            �           2606    387511 .   customers_bankacount customers_bankacount_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.customers_bankacount
    ADD CONSTRAINT customers_bankacount_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.customers_bankacount DROP CONSTRAINT customers_bankacount_pkey;
       public            postgres    false    275            �           2606    387513 1   customers_bankacount customers_bankacount_rib_key 
   CONSTRAINT     k   ALTER TABLE ONLY public.customers_bankacount
    ADD CONSTRAINT customers_bankacount_rib_key UNIQUE (rib);
 [   ALTER TABLE ONLY public.customers_bankacount DROP CONSTRAINT customers_bankacount_rib_key;
       public            postgres    false    275            �           2606    378250 &   customers_city customers_city_city_key 
   CONSTRAINT     a   ALTER TABLE ONLY public.customers_city
    ADD CONSTRAINT customers_city_city_key UNIQUE (city);
 P   ALTER TABLE ONLY public.customers_city DROP CONSTRAINT customers_city_city_key;
       public            postgres    false    223            �           2606    378248 "   customers_city customers_city_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.customers_city
    ADD CONSTRAINT customers_city_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.customers_city DROP CONSTRAINT customers_city_pkey;
       public            postgres    false    223            �           2606    378260 ,   customers_company customers_company_name_key 
   CONSTRAINT     g   ALTER TABLE ONLY public.customers_company
    ADD CONSTRAINT customers_company_name_key UNIQUE (name);
 V   ALTER TABLE ONLY public.customers_company DROP CONSTRAINT customers_company_name_key;
       public            postgres    false    224            �           2606    378258 (   customers_company customers_company_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.customers_company
    ADD CONSTRAINT customers_company_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.customers_company DROP CONSTRAINT customers_company_pkey;
       public            postgres    false    224            F           2606    378518 F   customers_contact customers_contact_company_id_person_id_63ddd7a1_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.customers_contact
    ADD CONSTRAINT customers_contact_company_id_person_id_63ddd7a1_uniq UNIQUE (company_id, person_id);
 p   ALTER TABLE ONLY public.customers_contact DROP CONSTRAINT customers_contact_company_id_person_id_63ddd7a1_uniq;
       public            postgres    false    239    239            I           2606    378385 (   customers_contact customers_contact_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.customers_contact
    ADD CONSTRAINT customers_contact_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.customers_contact DROP CONSTRAINT customers_contact_pkey;
       public            postgres    false    239            �           2606    378267 /   customers_country customers_country_country_key 
   CONSTRAINT     m   ALTER TABLE ONLY public.customers_country
    ADD CONSTRAINT customers_country_country_key UNIQUE (country);
 Y   ALTER TABLE ONLY public.customers_country DROP CONSTRAINT customers_country_country_key;
       public            postgres    false    225            �           2606    378265 (   customers_country customers_country_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.customers_country
    ADD CONSTRAINT customers_country_pkey PRIMARY KEY (code_country);
 R   ALTER TABLE ONLY public.customers_country DROP CONSTRAINT customers_country_pkey;
       public            postgres    false    225                       2606    378274 2   customers_currency customers_currency_currency_key 
   CONSTRAINT     q   ALTER TABLE ONLY public.customers_currency
    ADD CONSTRAINT customers_currency_currency_key UNIQUE (currency);
 \   ALTER TABLE ONLY public.customers_currency DROP CONSTRAINT customers_currency_currency_key;
       public            postgres    false    226                       2606    378272 *   customers_currency customers_currency_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY public.customers_currency
    ADD CONSTRAINT customers_currency_pkey PRIMARY KEY (currency_code);
 T   ALTER TABLE ONLY public.customers_currency DROP CONSTRAINT customers_currency_pkey;
       public            postgres    false    226                       2606    378281 3   customers_legalform customers_legalform_lf_name_key 
   CONSTRAINT     q   ALTER TABLE ONLY public.customers_legalform
    ADD CONSTRAINT customers_legalform_lf_name_key UNIQUE (lf_name);
 ]   ALTER TABLE ONLY public.customers_legalform DROP CONSTRAINT customers_legalform_lf_name_key;
       public            postgres    false    227                       2606    378279 ,   customers_legalform customers_legalform_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.customers_legalform
    ADD CONSTRAINT customers_legalform_pkey PRIMARY KEY (code_lf);
 V   ALTER TABLE ONLY public.customers_legalform DROP CONSTRAINT customers_legalform_pkey;
       public            postgres    false    227                       2606    378288 ;   customers_nationality customers_nationality_nationality_key 
   CONSTRAINT     }   ALTER TABLE ONLY public.customers_nationality
    ADD CONSTRAINT customers_nationality_nationality_key UNIQUE (nationality);
 e   ALTER TABLE ONLY public.customers_nationality DROP CONSTRAINT customers_nationality_nationality_key;
       public            postgres    false    228                       2606    378286 0   customers_nationality customers_nationality_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.customers_nationality
    ADD CONSTRAINT customers_nationality_pkey PRIMARY KEY (code_nationality);
 Z   ALTER TABLE ONLY public.customers_nationality DROP CONSTRAINT customers_nationality_pkey;
       public            postgres    false    228                       2606    378295 ,   customers_office customers_office_office_key 
   CONSTRAINT     i   ALTER TABLE ONLY public.customers_office
    ADD CONSTRAINT customers_office_office_key UNIQUE (office);
 V   ALTER TABLE ONLY public.customers_office DROP CONSTRAINT customers_office_office_key;
       public            postgres    false    229                       2606    378293 &   customers_office customers_office_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.customers_office
    ADD CONSTRAINT customers_office_pkey PRIMARY KEY (code_lf);
 P   ALTER TABLE ONLY public.customers_office DROP CONSTRAINT customers_office_pkey;
       public            postgres    false    229                       2606    378403 D   customers_person customers_person_last_name_first_name_88406199_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.customers_person
    ADD CONSTRAINT customers_person_last_name_first_name_88406199_uniq UNIQUE (last_name, first_name);
 n   ALTER TABLE ONLY public.customers_person DROP CONSTRAINT customers_person_last_name_first_name_88406199_uniq;
       public            postgres    false    230    230                       2606    378303 &   customers_person customers_person_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.customers_person
    ADD CONSTRAINT customers_person_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.customers_person DROP CONSTRAINT customers_person_pkey;
       public            postgres    false    230            �           2606    387532 H   customers_prospect customers_prospect_contact_id_office_id_d0c39ec2_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.customers_prospect
    ADD CONSTRAINT customers_prospect_contact_id_office_id_d0c39ec2_uniq UNIQUE (contact_id, office_id);
 r   ALTER TABLE ONLY public.customers_prospect DROP CONSTRAINT customers_prospect_contact_id_office_id_d0c39ec2_uniq;
       public            postgres    false    276    276            �           2606    387530 *   customers_prospect customers_prospect_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.customers_prospect
    ADD CONSTRAINT customers_prospect_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.customers_prospect DROP CONSTRAINT customers_prospect_pkey;
       public            postgres    false    276            ?           2606    378498 T   customers_representative customers_representative_company_id_person_id_fa330ece_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.customers_representative
    ADD CONSTRAINT customers_representative_company_id_person_id_fa330ece_uniq UNIQUE (company_id, person_id);
 ~   ALTER TABLE ONLY public.customers_representative DROP CONSTRAINT customers_representative_company_id_person_id_fa330ece_uniq;
       public            postgres    false    238    238            7           2606    378478 _   customers_representativecompany customers_representative_company_id_representativ_476df8f0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.customers_representativecompany
    ADD CONSTRAINT customers_representative_company_id_representativ_476df8f0_uniq UNIQUE (company_id, representativelink_id);
 �   ALTER TABLE ONLY public.customers_representativecompany DROP CONSTRAINT customers_representative_company_id_representativ_476df8f0_uniq;
       public            postgres    false    237    237            B           2606    378380 6   customers_representative customers_representative_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.customers_representative
    ADD CONSTRAINT customers_representative_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.customers_representative DROP CONSTRAINT customers_representative_pkey;
       public            postgres    false    238            :           2606    378375 D   customers_representativecompany customers_representativecompany_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.customers_representativecompany
    ADD CONSTRAINT customers_representativecompany_pkey PRIMARY KEY (id);
 n   ALTER TABLE ONLY public.customers_representativecompany DROP CONSTRAINT customers_representativecompany_pkey;
       public            postgres    false    237            '           2606    378327 H   customers_representativelink customers_representativelink_company_id_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.customers_representativelink
    ADD CONSTRAINT customers_representativelink_company_id_key UNIQUE (company_id);
 r   ALTER TABLE ONLY public.customers_representativelink DROP CONSTRAINT customers_representativelink_company_id_key;
       public            postgres    false    234            )           2606    378325 >   customers_representativelink customers_representativelink_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.customers_representativelink
    ADD CONSTRAINT customers_representativelink_pkey PRIMARY KEY (id);
 h   ALTER TABLE ONLY public.customers_representativelink DROP CONSTRAINT customers_representativelink_pkey;
       public            postgres    false    234                       2606    378311 >   customers_rolerepresentative customers_rolerepresentative_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.customers_rolerepresentative
    ADD CONSTRAINT customers_rolerepresentative_pkey PRIMARY KEY (id);
 h   ALTER TABLE ONLY public.customers_rolerepresentative DROP CONSTRAINT customers_rolerepresentative_pkey;
       public            postgres    false    232            !           2606    378313 P   customers_rolerepresentative customers_rolerepresentative_rolerepresentative_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.customers_rolerepresentative
    ADD CONSTRAINT customers_rolerepresentative_rolerepresentative_key UNIQUE (rolerepresentative);
 z   ALTER TABLE ONLY public.customers_rolerepresentative DROP CONSTRAINT customers_rolerepresentative_rolerepresentative_key;
       public            postgres    false    232            2           2606    378464 N   customers_shareholder customers_shareholder_company_id_person_id_be1b9d8e_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.customers_shareholder
    ADD CONSTRAINT customers_shareholder_company_id_person_id_be1b9d8e_uniq UNIQUE (company_id, person_id);
 x   ALTER TABLE ONLY public.customers_shareholder DROP CONSTRAINT customers_shareholder_company_id_person_id_be1b9d8e_uniq;
       public            postgres    false    236    236            5           2606    378370 0   customers_shareholder customers_shareholder_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.customers_shareholder
    ADD CONSTRAINT customers_shareholder_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.customers_shareholder DROP CONSTRAINT customers_shareholder_pkey;
       public            postgres    false    236            +           2606    378450 \   customers_shareholdercompany customers_shareholdercom_company_id_shareholderli_4bcc8ed3_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.customers_shareholdercompany
    ADD CONSTRAINT customers_shareholdercom_company_id_shareholderli_4bcc8ed3_uniq UNIQUE (company_id, shareholderlink_id);
 �   ALTER TABLE ONLY public.customers_shareholdercompany DROP CONSTRAINT customers_shareholdercom_company_id_shareholderli_4bcc8ed3_uniq;
       public            postgres    false    235    235            .           2606    378365 >   customers_shareholdercompany customers_shareholdercompany_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.customers_shareholdercompany
    ADD CONSTRAINT customers_shareholdercompany_pkey PRIMARY KEY (id);
 h   ALTER TABLE ONLY public.customers_shareholdercompany DROP CONSTRAINT customers_shareholdercompany_pkey;
       public            postgres    false    235            #           2606    378320 B   customers_shareholderlink customers_shareholderlink_company_id_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.customers_shareholderlink
    ADD CONSTRAINT customers_shareholderlink_company_id_key UNIQUE (company_id);
 l   ALTER TABLE ONLY public.customers_shareholderlink DROP CONSTRAINT customers_shareholderlink_company_id_key;
       public            postgres    false    233            %           2606    378318 8   customers_shareholderlink customers_shareholderlink_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.customers_shareholderlink
    ADD CONSTRAINT customers_shareholderlink_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.customers_shareholderlink DROP CONSTRAINT customers_shareholderlink_pkey;
       public            postgres    false    233            �           2606    378724 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public            postgres    false    256            �           2606    378060 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public            postgres    false    205    205            �           2606    378058 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public            postgres    false    205            �           2606    378050 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public            postgres    false    203            �           2606    378753 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public            postgres    false    257            �           2606    378765 ,   django_site django_site_domain_a2e37b91_uniq 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);
 V   ALTER TABLE ONLY public.django_site DROP CONSTRAINT django_site_domain_a2e37b91_uniq;
       public            postgres    false    259            �           2606    378763    django_site django_site_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.django_site DROP CONSTRAINT django_site_pkey;
       public            postgres    false    259            �           2606    387450 (   editions_docmodel editions_docmodel_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.editions_docmodel
    ADD CONSTRAINT editions_docmodel_pkey PRIMARY KEY (code_docmodel);
 R   ALTER TABLE ONLY public.editions_docmodel DROP CONSTRAINT editions_docmodel_pkey;
       public            postgres    false    271            �           2606    387463 0   editions_docmodelword editions_docmodelword_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.editions_docmodelword
    ADD CONSTRAINT editions_docmodelword_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.editions_docmodelword DROP CONSTRAINT editions_docmodelword_pkey;
       public            postgres    false    274            �           2606    387455 *   editions_socialdoc editions_socialdoc_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.editions_socialdoc
    ADD CONSTRAINT editions_socialdoc_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.editions_socialdoc DROP CONSTRAINT editions_socialdoc_pkey;
       public            postgres    false    272            �           2606    387712    editions_stc editions_stc_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.editions_stc
    ADD CONSTRAINT editions_stc_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.editions_stc DROP CONSTRAINT editions_stc_pkey;
       public            postgres    false    281            o           2606    387408 P   ordres_lettremission ordres_lettremission_office_id_company_id_mod_2e10e0b8_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.ordres_lettremission
    ADD CONSTRAINT ordres_lettremission_office_id_company_id_mod_2e10e0b8_uniq UNIQUE (office_id, company_id, moduleservice_id);
 z   ALTER TABLE ONLY public.ordres_lettremission DROP CONSTRAINT ordres_lettremission_office_id_company_id_mod_2e10e0b8_uniq;
       public            postgres    false    249    249    249            q           2606    378580 .   ordres_lettremission ordres_lettremission_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.ordres_lettremission
    ADD CONSTRAINT ordres_lettremission_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.ordres_lettremission DROP CONSTRAINT ordres_lettremission_pkey;
       public            postgres    false    249            t           2606    378582 7   ordres_lettremission ordres_lettremission_reference_key 
   CONSTRAINT     w   ALTER TABLE ONLY public.ordres_lettremission
    ADD CONSTRAINT ordres_lettremission_reference_key UNIQUE (reference);
 a   ALTER TABLE ONLY public.ordres_lettremission DROP CONSTRAINT ordres_lettremission_reference_key;
       public            postgres    false    249            �           2606    387549 6   ordres_lettremissionlink ordres_lettremissionlink_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.ordres_lettremissionlink
    ADD CONSTRAINT ordres_lettremissionlink_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.ordres_lettremissionlink DROP CONSTRAINT ordres_lettremissionlink_pkey;
       public            postgres    false    277            �           2606    387551 X   ordres_lettremissionlink ordres_lettremissionlink_prospect_id_lettremissio_ca215082_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.ordres_lettremissionlink
    ADD CONSTRAINT ordres_lettremissionlink_prospect_id_lettremissio_ca215082_uniq UNIQUE (prospect_id, lettremission_id);
 �   ALTER TABLE ONLY public.ordres_lettremissionlink DROP CONSTRAINT ordres_lettremissionlink_prospect_id_lettremissio_ca215082_uniq;
       public            postgres    false    277    277            L           2606    378540 ;   ordres_moduleservice ordres_moduleservice_moduleservice_key 
   CONSTRAINT        ALTER TABLE ONLY public.ordres_moduleservice
    ADD CONSTRAINT ordres_moduleservice_moduleservice_key UNIQUE (moduleservice);
 e   ALTER TABLE ONLY public.ordres_moduleservice DROP CONSTRAINT ordres_moduleservice_moduleservice_key;
       public            postgres    false    241            N           2606    378538 .   ordres_moduleservice ordres_moduleservice_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.ordres_moduleservice
    ADD CONSTRAINT ordres_moduleservice_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.ordres_moduleservice DROP CONSTRAINT ordres_moduleservice_pkey;
       public            postgres    false    241            R           2606    378545    ordres_ordre ordres_ordre_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.ordres_ordre
    ADD CONSTRAINT ordres_ordre_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.ordres_ordre DROP CONSTRAINT ordres_ordre_pkey;
       public            postgres    false    242            U           2606    378597 A   ordres_outlay ordres_outlay_moduleservice_id_outlay_c43f75fa_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.ordres_outlay
    ADD CONSTRAINT ordres_outlay_moduleservice_id_outlay_c43f75fa_uniq UNIQUE (moduleservice_id, outlay);
 k   ALTER TABLE ONLY public.ordres_outlay DROP CONSTRAINT ordres_outlay_moduleservice_id_outlay_c43f75fa_uniq;
       public            postgres    false    244    244            X           2606    378555 &   ordres_outlay ordres_outlay_outlay_key 
   CONSTRAINT     c   ALTER TABLE ONLY public.ordres_outlay
    ADD CONSTRAINT ordres_outlay_outlay_key UNIQUE (outlay);
 P   ALTER TABLE ONLY public.ordres_outlay DROP CONSTRAINT ordres_outlay_outlay_key;
       public            postgres    false    244            Z           2606    378553     ordres_outlay ordres_outlay_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.ordres_outlay
    ADD CONSTRAINT ordres_outlay_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.ordres_outlay DROP CONSTRAINT ordres_outlay_pkey;
       public            postgres    false    244            j           2606    378575 (   ordres_outlayitem ordres_outlayitem_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.ordres_outlayitem
    ADD CONSTRAINT ordres_outlayitem_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.ordres_outlayitem DROP CONSTRAINT ordres_outlayitem_pkey;
       public            postgres    false    248            ]           2606    378606 D   ordres_service ordres_service_moduleservice_id_service_3822a9f4_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.ordres_service
    ADD CONSTRAINT ordres_service_moduleservice_id_service_3822a9f4_uniq UNIQUE (moduleservice_id, service);
 n   ALTER TABLE ONLY public.ordres_service DROP CONSTRAINT ordres_service_moduleservice_id_service_3822a9f4_uniq;
       public            postgres    false    246    246            _           2606    378563 "   ordres_service ordres_service_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.ordres_service
    ADD CONSTRAINT ordres_service_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.ordres_service DROP CONSTRAINT ordres_service_pkey;
       public            postgres    false    246            b           2606    378565 )   ordres_service ordres_service_service_key 
   CONSTRAINT     g   ALTER TABLE ONLY public.ordres_service
    ADD CONSTRAINT ordres_service_service_key UNIQUE (service);
 S   ALTER TABLE ONLY public.ordres_service DROP CONSTRAINT ordres_service_service_key;
       public            postgres    false    246            �           2606    387679 8   ordres_servicedescription ordres_servicedescription_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.ordres_servicedescription
    ADD CONSTRAINT ordres_servicedescription_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.ordres_servicedescription DROP CONSTRAINT ordres_servicedescription_pkey;
       public            postgres    false    279            �           2606    387681 Q   ordres_servicedescription ordres_servicedescription_text_service_id_480d73c8_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.ordres_servicedescription
    ADD CONSTRAINT ordres_servicedescription_text_service_id_480d73c8_uniq UNIQUE (text, service_id);
 {   ALTER TABLE ONLY public.ordres_servicedescription DROP CONSTRAINT ordres_servicedescription_text_service_id_480d73c8_uniq;
       public            postgres    false    279    279            e           2606    378570 *   ordres_serviceitem ordres_serviceitem_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.ordres_serviceitem
    ADD CONSTRAINT ordres_serviceitem_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.ordres_serviceitem DROP CONSTRAINT ordres_serviceitem_pkey;
       public            postgres    false    247            �           2606    378771     tasks_benefit tasks_benefit_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.tasks_benefit
    ADD CONSTRAINT tasks_benefit_pkey PRIMARY KEY (code_benefit);
 J   ALTER TABLE ONLY public.tasks_benefit DROP CONSTRAINT tasks_benefit_pkey;
       public            postgres    false    260            �           2606    387397 P   tasks_benefititem tasks_benefititem_benefitlink_id_code_benefit_id_dc6d77ce_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.tasks_benefititem
    ADD CONSTRAINT tasks_benefititem_benefitlink_id_code_benefit_id_dc6d77ce_uniq UNIQUE (benefitlink_id, code_benefit_id);
 z   ALTER TABLE ONLY public.tasks_benefititem DROP CONSTRAINT tasks_benefititem_benefitlink_id_code_benefit_id_dc6d77ce_uniq;
       public            postgres    false    266    266            �           2606    378805 (   tasks_benefititem tasks_benefititem_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.tasks_benefititem
    ADD CONSTRAINT tasks_benefititem_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.tasks_benefititem DROP CONSTRAINT tasks_benefititem_pkey;
       public            postgres    false    266            �           2606    378778 8   tasks_benefitlink tasks_benefitlink_lettremission_id_key 
   CONSTRAINT        ALTER TABLE ONLY public.tasks_benefitlink
    ADD CONSTRAINT tasks_benefitlink_lettremission_id_key UNIQUE (lettremission_id);
 b   ALTER TABLE ONLY public.tasks_benefitlink DROP CONSTRAINT tasks_benefitlink_lettremission_id_key;
       public            postgres    false    261            �           2606    378776 (   tasks_benefitlink tasks_benefitlink_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.tasks_benefitlink
    ADD CONSTRAINT tasks_benefitlink_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.tasks_benefitlink DROP CONSTRAINT tasks_benefitlink_pkey;
       public            postgres    false    261            �           2606    378877 T   tasks_benefitrequested tasks_benefitrequested_lettremission_id_benefit_7ea41f23_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.tasks_benefitrequested
    ADD CONSTRAINT tasks_benefitrequested_lettremission_id_benefit_7ea41f23_uniq UNIQUE (lettremission_id, benefitlink_id);
 ~   ALTER TABLE ONLY public.tasks_benefitrequested DROP CONSTRAINT tasks_benefitrequested_lettremission_id_benefit_7ea41f23_uniq;
       public            postgres    false    268    268            �           2606    378815 2   tasks_benefitrequested tasks_benefitrequested_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.tasks_benefitrequested
    ADD CONSTRAINT tasks_benefitrequested_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.tasks_benefitrequested DROP CONSTRAINT tasks_benefitrequested_pkey;
       public            postgres    false    268            �           2606    378800    tasks_claim tasks_claim_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.tasks_claim
    ADD CONSTRAINT tasks_claim_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.tasks_claim DROP CONSTRAINT tasks_claim_pkey;
       public            postgres    false    265            �           2606    378785 $   tasks_period tasks_period_period_key 
   CONSTRAINT     a   ALTER TABLE ONLY public.tasks_period
    ADD CONSTRAINT tasks_period_period_key UNIQUE (period);
 N   ALTER TABLE ONLY public.tasks_period DROP CONSTRAINT tasks_period_period_key;
       public            postgres    false    262            �           2606    378783    tasks_period tasks_period_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.tasks_period
    ADD CONSTRAINT tasks_period_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.tasks_period DROP CONSTRAINT tasks_period_pkey;
       public            postgres    false    262            �           2606    378790    tasks_task tasks_task_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.tasks_task
    ADD CONSTRAINT tasks_task_pkey PRIMARY KEY (code_task);
 D   ALTER TABLE ONLY public.tasks_task DROP CONSTRAINT tasks_task_pkey;
       public            postgres    false    263            �           2606    378863 L   tasks_vatrequested tasks_vatrequested_lettremission_id_benefit_59c26b4b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.tasks_vatrequested
    ADD CONSTRAINT tasks_vatrequested_lettremission_id_benefit_59c26b4b_uniq UNIQUE (lettremission_id, benefitlink_id);
 v   ALTER TABLE ONLY public.tasks_vatrequested DROP CONSTRAINT tasks_vatrequested_lettremission_id_benefit_59c26b4b_uniq;
       public            postgres    false    267    267            �           2606    378810 *   tasks_vatrequested tasks_vatrequested_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.tasks_vatrequested
    ADD CONSTRAINT tasks_vatrequested_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.tasks_vatrequested DROP CONSTRAINT tasks_vatrequested_pkey;
       public            postgres    false    267            �           2606    379124 F   tasks_work tasks_work_period_id_lettremission_id_task_id_63297617_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.tasks_work
    ADD CONSTRAINT tasks_work_period_id_lettremission_id_task_id_63297617_uniq UNIQUE (period_id, lettremission_id, task_id);
 p   ALTER TABLE ONLY public.tasks_work DROP CONSTRAINT tasks_work_period_id_lettremission_id_task_id_63297617_uniq;
       public            postgres    false    264    264    264            �           2606    378795    tasks_work tasks_work_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.tasks_work
    ADD CONSTRAINT tasks_work_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.tasks_work DROP CONSTRAINT tasks_work_pkey;
       public            postgres    false    264            �           1259    378201 (   account_emailaddress_email_03be32b2_like    INDEX     ~   CREATE INDEX account_emailaddress_email_03be32b2_like ON public.account_emailaddress USING btree (email varchar_pattern_ops);
 <   DROP INDEX public.account_emailaddress_email_03be32b2_like;
       public            postgres    false    218            �           1259    378191 %   account_emailaddress_user_id_2c513194    INDEX     i   CREATE INDEX account_emailaddress_user_id_2c513194 ON public.account_emailaddress USING btree (user_id);
 9   DROP INDEX public.account_emailaddress_user_id_2c513194;
       public            postgres    false    218            �           1259    378215 3   account_emailconfirmation_email_address_id_5b7f8c58    INDEX     �   CREATE INDEX account_emailconfirmation_email_address_id_5b7f8c58 ON public.account_emailconfirmation USING btree (email_address_id);
 G   DROP INDEX public.account_emailconfirmation_email_address_id_5b7f8c58;
       public            postgres    false    219            �           1259    378197 +   account_emailconfirmation_key_f43612bd_like    INDEX     �   CREATE INDEX account_emailconfirmation_key_f43612bd_like ON public.account_emailconfirmation USING btree (key varchar_pattern_ops);
 ?   DROP INDEX public.account_emailconfirmation_key_f43612bd_like;
       public            postgres    false    219            ~           1259    378710 -   accounts_portefolio_lettremission_id_d71976d5    INDEX     y   CREATE INDEX accounts_portefolio_lettremission_id_d71976d5 ON public.accounts_portefolio USING btree (lettremission_id);
 A   DROP INDEX public.accounts_portefolio_lettremission_id_d71976d5;
       public            postgres    false    254            �           1259    378711 1   accounts_portefolio_rolecollaborateur_id_7645715a    INDEX     �   CREATE INDEX accounts_portefolio_rolecollaborateur_id_7645715a ON public.accounts_portefolio USING btree (rolecollaborateur_id);
 E   DROP INDEX public.accounts_portefolio_rolecollaborateur_id_7645715a;
       public            postgres    false    254            �           1259    378712 $   accounts_portefolio_user_id_623858b2    INDEX     g   CREATE INDEX accounts_portefolio_user_id_623858b2 ON public.accounts_portefolio USING btree (user_id);
 8   DROP INDEX public.accounts_portefolio_user_id_623858b2;
       public            postgres    false    254            �           1259    379165 )   accounts_pwsafe_lettremission_id_8f576869    INDEX     q   CREATE INDEX accounts_pwsafe_lettremission_id_8f576869 ON public.accounts_pwsafe USING btree (lettremission_id);
 =   DROP INDEX public.accounts_pwsafe_lettremission_id_8f576869;
       public            postgres    false    269            �           1259    379167     accounts_pwsafe_user_id_6b8567f3    INDEX     _   CREATE INDEX accounts_pwsafe_user_id_6b8567f3 ON public.accounts_pwsafe USING btree (user_id);
 4   DROP INDEX public.accounts_pwsafe_user_id_6b8567f3;
       public            postgres    false    269            u           1259    378687 "   accounts_scope_Scope_e7af236c_like    INDEX     v   CREATE INDEX "accounts_scope_Scope_e7af236c_like" ON public.accounts_scope USING btree ("Scope" varchar_pattern_ops);
 8   DROP INDEX public."accounts_scope_Scope_e7af236c_like";
       public            postgres    false    251            �           1259    379189 ,   accounts_validator_lettremission_id_c9100ec9    INDEX     w   CREATE INDEX accounts_validator_lettremission_id_c9100ec9 ON public.accounts_validator USING btree (lettremission_id);
 @   DROP INDEX public.accounts_validator_lettremission_id_c9100ec9;
       public            postgres    false    270            �           1259    379190 #   accounts_validator_user_id_ae93f26f    INDEX     e   CREATE INDEX accounts_validator_user_id_ae93f26f ON public.accounts_validator USING btree (user_id);
 7   DROP INDEX public.accounts_validator_user_id_ae93f26f;
       public            postgres    false    270            �           1259    378745    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public            postgres    false    209            �           1259    378134 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public            postgres    false    211            �           1259    378135 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public            postgres    false    211            �           1259    378120 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public            postgres    false    207            �           1259    378150 "   auth_user_groups_group_id_97559544    INDEX     c   CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);
 6   DROP INDEX public.auth_user_groups_group_id_97559544;
       public            postgres    false    215            �           1259    378149 !   auth_user_groups_user_id_6a12ed8b    INDEX     a   CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);
 5   DROP INDEX public.auth_user_groups_user_id_6a12ed8b;
       public            postgres    false    215            �           1259    378164 1   auth_user_user_permissions_permission_id_1fbb5f2c    INDEX     �   CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);
 E   DROP INDEX public.auth_user_user_permissions_permission_id_1fbb5f2c;
       public            postgres    false    217            �           1259    378163 +   auth_user_user_permissions_user_id_a95ead1b    INDEX     u   CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);
 ?   DROP INDEX public.auth_user_user_permissions_user_id_a95ead1b;
       public            postgres    false    217            �           1259    378739     auth_user_username_6821ab7c_like    INDEX     n   CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);
 4   DROP INDEX public.auth_user_username_6821ab7c_like;
       public            postgres    false    213            �           1259    387522 (   customers_bankacount_company_id_296f0bae    INDEX     o   CREATE INDEX customers_bankacount_company_id_296f0bae ON public.customers_bankacount USING btree (company_id);
 <   DROP INDEX public.customers_bankacount_company_id_296f0bae;
       public            postgres    false    275            �           1259    387521 &   customers_bankacount_rib_5bbdcf51_like    INDEX     z   CREATE INDEX customers_bankacount_rib_5bbdcf51_like ON public.customers_bankacount USING btree (rib varchar_pattern_ops);
 :   DROP INDEX public.customers_bankacount_rib_5bbdcf51_like;
       public            postgres    false    275            �           1259    378386 !   customers_city_city_f5e3b070_like    INDEX     p   CREATE INDEX customers_city_city_f5e3b070_like ON public.customers_city USING btree (city varchar_pattern_ops);
 5   DROP INDEX public.customers_city_city_f5e3b070_like;
       public            postgres    false    223            �           1259    378435 %   customers_company_country_id_d2365eec    INDEX     i   CREATE INDEX customers_company_country_id_d2365eec ON public.customers_company USING btree (country_id);
 9   DROP INDEX public.customers_company_country_id_d2365eec;
       public            postgres    false    224            �           1259    378436 *   customers_company_country_id_d2365eec_like    INDEX     �   CREATE INDEX customers_company_country_id_d2365eec_like ON public.customers_company USING btree (country_id varchar_pattern_ops);
 >   DROP INDEX public.customers_company_country_id_d2365eec_like;
       public            postgres    false    224            �           1259    378437 &   customers_company_currency_id_59caea32    INDEX     k   CREATE INDEX customers_company_currency_id_59caea32 ON public.customers_company USING btree (currency_id);
 :   DROP INDEX public.customers_company_currency_id_59caea32;
       public            postgres    false    224            �           1259    378438 +   customers_company_currency_id_59caea32_like    INDEX     �   CREATE INDEX customers_company_currency_id_59caea32_like ON public.customers_company USING btree (currency_id varchar_pattern_ops);
 ?   DROP INDEX public.customers_company_currency_id_59caea32_like;
       public            postgres    false    224            �           1259    378439 (   customers_company_legal_form_id_674849c0    INDEX     o   CREATE INDEX customers_company_legal_form_id_674849c0 ON public.customers_company USING btree (legal_form_id);
 <   DROP INDEX public.customers_company_legal_form_id_674849c0;
       public            postgres    false    224            �           1259    378392 $   customers_company_name_9162e91f_like    INDEX     v   CREATE INDEX customers_company_name_9162e91f_like ON public.customers_company USING btree (name varchar_pattern_ops);
 8   DROP INDEX public.customers_company_name_9162e91f_like;
       public            postgres    false    224            �           1259    378440 )   customers_company_nationality_id_67a2b28a    INDEX     q   CREATE INDEX customers_company_nationality_id_67a2b28a ON public.customers_company USING btree (nationality_id);
 =   DROP INDEX public.customers_company_nationality_id_67a2b28a;
       public            postgres    false    224            �           1259    378441 .   customers_company_nationality_id_67a2b28a_like    INDEX     �   CREATE INDEX customers_company_nationality_id_67a2b28a_like ON public.customers_company USING btree (nationality_id varchar_pattern_ops);
 B   DROP INDEX public.customers_company_nationality_id_67a2b28a_like;
       public            postgres    false    224            D           1259    378529 %   customers_contact_company_id_b52c4cc4    INDEX     i   CREATE INDEX customers_contact_company_id_b52c4cc4 ON public.customers_contact USING btree (company_id);
 9   DROP INDEX public.customers_contact_company_id_b52c4cc4;
       public            postgres    false    239            G           1259    378530 $   customers_contact_person_id_32cb4479    INDEX     g   CREATE INDEX customers_contact_person_id_32cb4479 ON public.customers_contact USING btree (person_id);
 8   DROP INDEX public.customers_contact_person_id_32cb4479;
       public            postgres    false    239            �           1259    378394 ,   customers_country_code_country_1e3531ba_like    INDEX     �   CREATE INDEX customers_country_code_country_1e3531ba_like ON public.customers_country USING btree (code_country varchar_pattern_ops);
 @   DROP INDEX public.customers_country_code_country_1e3531ba_like;
       public            postgres    false    225            �           1259    378395 '   customers_country_country_47d25431_like    INDEX     |   CREATE INDEX customers_country_country_47d25431_like ON public.customers_country USING btree (country varchar_pattern_ops);
 ;   DROP INDEX public.customers_country_country_47d25431_like;
       public            postgres    false    225            �           1259    378397 )   customers_currency_currency_1e482a08_like    INDEX     �   CREATE INDEX customers_currency_currency_1e482a08_like ON public.customers_currency USING btree (currency varchar_pattern_ops);
 =   DROP INDEX public.customers_currency_currency_1e482a08_like;
       public            postgres    false    226            �           1259    378396 .   customers_currency_currency_code_4b6efc33_like    INDEX     �   CREATE INDEX customers_currency_currency_code_4b6efc33_like ON public.customers_currency USING btree (currency_code varchar_pattern_ops);
 B   DROP INDEX public.customers_currency_currency_code_4b6efc33_like;
       public            postgres    false    226                       1259    378398 )   customers_legalform_lf_name_7a5f07dd_like    INDEX     �   CREATE INDEX customers_legalform_lf_name_7a5f07dd_like ON public.customers_legalform USING btree (lf_name varchar_pattern_ops);
 =   DROP INDEX public.customers_legalform_lf_name_7a5f07dd_like;
       public            postgres    false    227            	           1259    378399 4   customers_nationality_code_nationality_3e44c4e5_like    INDEX     �   CREATE INDEX customers_nationality_code_nationality_3e44c4e5_like ON public.customers_nationality USING btree (code_nationality varchar_pattern_ops);
 H   DROP INDEX public.customers_nationality_code_nationality_3e44c4e5_like;
       public            postgres    false    228            
           1259    378400 /   customers_nationality_nationality_13d9c46d_like    INDEX     �   CREATE INDEX customers_nationality_nationality_13d9c46d_like ON public.customers_nationality USING btree (nationality varchar_pattern_ops);
 C   DROP INDEX public.customers_nationality_nationality_13d9c46d_like;
       public            postgres    false    228                       1259    387695 $   customers_office_company_id_653a34c9    INDEX     g   CREATE INDEX customers_office_company_id_653a34c9 ON public.customers_office USING btree (company_id);
 8   DROP INDEX public.customers_office_company_id_653a34c9;
       public            postgres    false    229                       1259    378401 %   customers_office_office_e103c038_like    INDEX     x   CREATE INDEX customers_office_office_e103c038_like ON public.customers_office USING btree (office varchar_pattern_ops);
 9   DROP INDEX public.customers_office_office_e103c038_like;
       public            postgres    false    229                       1259    378420 $   customers_person_country_id_bb7c8b94    INDEX     g   CREATE INDEX customers_person_country_id_bb7c8b94 ON public.customers_person USING btree (country_id);
 8   DROP INDEX public.customers_person_country_id_bb7c8b94;
       public            postgres    false    230                       1259    378421 )   customers_person_country_id_bb7c8b94_like    INDEX     �   CREATE INDEX customers_person_country_id_bb7c8b94_like ON public.customers_person USING btree (country_id varchar_pattern_ops);
 =   DROP INDEX public.customers_person_country_id_bb7c8b94_like;
       public            postgres    false    230                       1259    378422 (   customers_person_nationality_id_45b2dbf8    INDEX     o   CREATE INDEX customers_person_nationality_id_45b2dbf8 ON public.customers_person USING btree (nationality_id);
 <   DROP INDEX public.customers_person_nationality_id_45b2dbf8;
       public            postgres    false    230                       1259    378423 -   customers_person_nationality_id_45b2dbf8_like    INDEX     �   CREATE INDEX customers_person_nationality_id_45b2dbf8_like ON public.customers_person USING btree (nationality_id varchar_pattern_ops);
 A   DROP INDEX public.customers_person_nationality_id_45b2dbf8_like;
       public            postgres    false    230            �           1259    387543 &   customers_prospect_contact_id_fe9f64b5    INDEX     k   CREATE INDEX customers_prospect_contact_id_fe9f64b5 ON public.customers_prospect USING btree (contact_id);
 :   DROP INDEX public.customers_prospect_contact_id_fe9f64b5;
       public            postgres    false    276            �           1259    387544 %   customers_prospect_office_id_974d0cb2    INDEX     i   CREATE INDEX customers_prospect_office_id_974d0cb2 ON public.customers_prospect USING btree (office_id);
 9   DROP INDEX public.customers_prospect_office_id_974d0cb2;
       public            postgres    false    276            =           1259    378514 ,   customers_representative_company_id_54193de8    INDEX     w   CREATE INDEX customers_representative_company_id_54193de8 ON public.customers_representative USING btree (company_id);
 @   DROP INDEX public.customers_representative_company_id_54193de8;
       public            postgres    false    238            @           1259    378515 +   customers_representative_person_id_2922b303    INDEX     u   CREATE INDEX customers_representative_person_id_2922b303 ON public.customers_representative USING btree (person_id);
 ?   DROP INDEX public.customers_representative_person_id_2922b303;
       public            postgres    false    238            C           1259    378516 7   customers_representative_rolerepresentative_id_42fecf8d    INDEX     �   CREATE INDEX customers_representative_rolerepresentative_id_42fecf8d ON public.customers_representative USING btree (rolerepresentative_id);
 K   DROP INDEX public.customers_representative_rolerepresentative_id_42fecf8d;
       public            postgres    false    238            8           1259    378494 3   customers_representativecompany_company_id_4ad471fb    INDEX     �   CREATE INDEX customers_representativecompany_company_id_4ad471fb ON public.customers_representativecompany USING btree (company_id);
 G   DROP INDEX public.customers_representativecompany_company_id_4ad471fb;
       public            postgres    false    237            ;           1259    378495 >   customers_representativecompany_representativelink_id_1624f777    INDEX     �   CREATE INDEX customers_representativecompany_representativelink_id_1624f777 ON public.customers_representativecompany USING btree (representativelink_id);
 R   DROP INDEX public.customers_representativecompany_representativelink_id_1624f777;
       public            postgres    false    237            <           1259    378496 >   customers_representativecompany_rolerepresentative_id_fb5c0c8d    INDEX     �   CREATE INDEX customers_representativecompany_rolerepresentative_id_fb5c0c8d ON public.customers_representativecompany USING btree (rolerepresentative_id);
 R   DROP INDEX public.customers_representativecompany_rolerepresentative_id_fb5c0c8d;
       public            postgres    false    237                       1259    378424 =   customers_rolerepresentative_rolerepresentative_7c7ff30f_like    INDEX     �   CREATE INDEX customers_rolerepresentative_rolerepresentative_7c7ff30f_like ON public.customers_rolerepresentative USING btree (rolerepresentative varchar_pattern_ops);
 Q   DROP INDEX public.customers_rolerepresentative_rolerepresentative_7c7ff30f_like;
       public            postgres    false    232            0           1259    378475 )   customers_shareholder_company_id_bf06ce33    INDEX     q   CREATE INDEX customers_shareholder_company_id_bf06ce33 ON public.customers_shareholder USING btree (company_id);
 =   DROP INDEX public.customers_shareholder_company_id_bf06ce33;
       public            postgres    false    236            3           1259    378476 (   customers_shareholder_person_id_5be2174f    INDEX     o   CREATE INDEX customers_shareholder_person_id_5be2174f ON public.customers_shareholder USING btree (person_id);
 <   DROP INDEX public.customers_shareholder_person_id_5be2174f;
       public            postgres    false    236            ,           1259    378461 0   customers_shareholdercompany_company_id_5f7ea741    INDEX        CREATE INDEX customers_shareholdercompany_company_id_5f7ea741 ON public.customers_shareholdercompany USING btree (company_id);
 D   DROP INDEX public.customers_shareholdercompany_company_id_5f7ea741;
       public            postgres    false    235            /           1259    378462 8   customers_shareholdercompany_shareholderlink_id_0f97a228    INDEX     �   CREATE INDEX customers_shareholdercompany_shareholderlink_id_0f97a228 ON public.customers_shareholdercompany USING btree (shareholderlink_id);
 L   DROP INDEX public.customers_shareholdercompany_shareholderlink_id_0f97a228;
       public            postgres    false    235            �           1259    378735 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public            postgres    false    256            �           1259    378736 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public            postgres    false    256            �           1259    378755 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public            postgres    false    257            �           1259    378754 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public            postgres    false    257            �           1259    378766     django_site_domain_a2e37b91_like    INDEX     n   CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);
 4   DROP INDEX public.django_site_domain_a2e37b91_like;
       public            postgres    false    259            �           1259    387464 -   editions_docmodel_code_docmodel_75ee40cf_like    INDEX     �   CREATE INDEX editions_docmodel_code_docmodel_75ee40cf_like ON public.editions_docmodel USING btree (code_docmodel varchar_pattern_ops);
 A   DROP INDEX public.editions_docmodel_code_docmodel_75ee40cf_like;
       public            postgres    false    271            �           1259    387476 /   editions_docmodelword_code_docmodel_id_8e1ebb29    INDEX     }   CREATE INDEX editions_docmodelword_code_docmodel_id_8e1ebb29 ON public.editions_docmodelword USING btree (code_docmodel_id);
 C   DROP INDEX public.editions_docmodelword_code_docmodel_id_8e1ebb29;
       public            postgres    false    274            �           1259    387477 4   editions_docmodelword_code_docmodel_id_8e1ebb29_like    INDEX     �   CREATE INDEX editions_docmodelword_code_docmodel_id_8e1ebb29_like ON public.editions_docmodelword USING btree (code_docmodel_id varchar_pattern_ops);
 H   DROP INDEX public.editions_docmodelword_code_docmodel_id_8e1ebb29_like;
       public            postgres    false    274            �           1259    387470 ,   editions_socialdoc_lettremission_id_33c3d059    INDEX     w   CREATE INDEX editions_socialdoc_lettremission_id_33c3d059 ON public.editions_socialdoc USING btree (lettremission_id);
 @   DROP INDEX public.editions_socialdoc_lettremission_id_33c3d059;
       public            postgres    false    272            k           1259    378656 (   ordres_lettremission_company_id_438b6bbc    INDEX     o   CREATE INDEX ordres_lettremission_company_id_438b6bbc ON public.ordres_lettremission USING btree (company_id);
 <   DROP INDEX public.ordres_lettremission_company_id_438b6bbc;
       public            postgres    false    249            l           1259    378657 .   ordres_lettremission_moduleservice_id_85831cde    INDEX     {   CREATE INDEX ordres_lettremission_moduleservice_id_85831cde ON public.ordres_lettremission USING btree (moduleservice_id);
 B   DROP INDEX public.ordres_lettremission_moduleservice_id_85831cde;
       public            postgres    false    249            m           1259    378658 '   ordres_lettremission_office_id_0f2982af    INDEX     m   CREATE INDEX ordres_lettremission_office_id_0f2982af ON public.ordres_lettremission USING btree (office_id);
 ;   DROP INDEX public.ordres_lettremission_office_id_0f2982af;
       public            postgres    false    249            r           1259    378655 ,   ordres_lettremission_reference_750d89bd_like    INDEX     �   CREATE INDEX ordres_lettremission_reference_750d89bd_like ON public.ordres_lettremission USING btree (reference varchar_pattern_ops);
 @   DROP INDEX public.ordres_lettremission_reference_750d89bd_like;
       public            postgres    false    249            �           1259    387562 2   ordres_lettremissionlink_lettremission_id_bb061c21    INDEX     �   CREATE INDEX ordres_lettremissionlink_lettremission_id_bb061c21 ON public.ordres_lettremissionlink USING btree (lettremission_id);
 F   DROP INDEX public.ordres_lettremissionlink_lettremission_id_bb061c21;
       public            postgres    false    277            �           1259    387563 -   ordres_lettremissionlink_prospect_id_71bc99ad    INDEX     y   CREATE INDEX ordres_lettremissionlink_prospect_id_71bc99ad ON public.ordres_lettremissionlink USING btree (prospect_id);
 A   DROP INDEX public.ordres_lettremissionlink_prospect_id_71bc99ad;
       public            postgres    false    277            J           1259    378583 0   ordres_moduleservice_moduleservice_d9487e15_like    INDEX     �   CREATE INDEX ordres_moduleservice_moduleservice_d9487e15_like ON public.ordres_moduleservice USING btree (moduleservice varchar_pattern_ops);
 D   DROP INDEX public.ordres_moduleservice_moduleservice_d9487e15_like;
       public            postgres    false    241            O           1259    378594     ordres_ordre_company_id_11ddded4    INDEX     _   CREATE INDEX ordres_ordre_company_id_11ddded4 ON public.ordres_ordre USING btree (company_id);
 4   DROP INDEX public.ordres_ordre_company_id_11ddded4;
       public            postgres    false    242            P           1259    378595    ordres_ordre_office_id_711c56fd    INDEX     ]   CREATE INDEX ordres_ordre_office_id_711c56fd ON public.ordres_ordre USING btree (office_id);
 3   DROP INDEX public.ordres_ordre_office_id_711c56fd;
       public            postgres    false    242            S           1259    378604 '   ordres_outlay_moduleservice_id_1b55901d    INDEX     m   CREATE INDEX ordres_outlay_moduleservice_id_1b55901d ON public.ordres_outlay USING btree (moduleservice_id);
 ;   DROP INDEX public.ordres_outlay_moduleservice_id_1b55901d;
       public            postgres    false    244            V           1259    378603 "   ordres_outlay_outlay_f07d327b_like    INDEX     r   CREATE INDEX ordres_outlay_outlay_f07d327b_like ON public.ordres_outlay USING btree (outlay varchar_pattern_ops);
 6   DROP INDEX public.ordres_outlay_outlay_f07d327b_like;
       public            postgres    false    244            g           1259    378636 #   ordres_outlayitem_ordre_id_3777bebd    INDEX     e   CREATE INDEX ordres_outlayitem_ordre_id_3777bebd ON public.ordres_outlayitem USING btree (ordre_id);
 7   DROP INDEX public.ordres_outlayitem_ordre_id_3777bebd;
       public            postgres    false    248            h           1259    378637 $   ordres_outlayitem_outlay_id_ba0705b9    INDEX     g   CREATE INDEX ordres_outlayitem_outlay_id_ba0705b9 ON public.ordres_outlayitem USING btree (outlay_id);
 8   DROP INDEX public.ordres_outlayitem_outlay_id_ba0705b9;
       public            postgres    false    248            [           1259    378613 (   ordres_service_moduleservice_id_f81d374e    INDEX     o   CREATE INDEX ordres_service_moduleservice_id_f81d374e ON public.ordres_service USING btree (moduleservice_id);
 <   DROP INDEX public.ordres_service_moduleservice_id_f81d374e;
       public            postgres    false    246            `           1259    378612 $   ordres_service_service_23232e59_like    INDEX     v   CREATE INDEX ordres_service_service_23232e59_like ON public.ordres_service USING btree (service varchar_pattern_ops);
 8   DROP INDEX public.ordres_service_service_23232e59_like;
       public            postgres    false    246            �           1259    387687 -   ordres_servicedescription_service_id_72e0a86d    INDEX     y   CREATE INDEX ordres_servicedescription_service_id_72e0a86d ON public.ordres_servicedescription USING btree (service_id);
 A   DROP INDEX public.ordres_servicedescription_service_id_72e0a86d;
       public            postgres    false    279            c           1259    378624 $   ordres_serviceitem_ordre_id_8f8e0a5b    INDEX     g   CREATE INDEX ordres_serviceitem_ordre_id_8f8e0a5b ON public.ordres_serviceitem USING btree (ordre_id);
 8   DROP INDEX public.ordres_serviceitem_ordre_id_8f8e0a5b;
       public            postgres    false    247            f           1259    378625 &   ordres_serviceitem_service_id_bb1e292c    INDEX     k   CREATE INDEX ordres_serviceitem_service_id_bb1e292c ON public.ordres_serviceitem USING btree (service_id);
 :   DROP INDEX public.ordres_serviceitem_service_id_bb1e292c;
       public            postgres    false    247            �           1259    378816 (   tasks_benefit_code_benefit_aac1735b_like    INDEX     ~   CREATE INDEX tasks_benefit_code_benefit_aac1735b_like ON public.tasks_benefit USING btree (code_benefit varchar_pattern_ops);
 <   DROP INDEX public.tasks_benefit_code_benefit_aac1735b_like;
       public            postgres    false    260            �           1259    378859 )   tasks_benefititem_benefitlink_id_2f1d11ae    INDEX     q   CREATE INDEX tasks_benefititem_benefitlink_id_2f1d11ae ON public.tasks_benefititem USING btree (benefitlink_id);
 =   DROP INDEX public.tasks_benefititem_benefitlink_id_2f1d11ae;
       public            postgres    false    266            �           1259    387398 *   tasks_benefititem_code_benefit_id_d2b8644f    INDEX     s   CREATE INDEX tasks_benefititem_code_benefit_id_d2b8644f ON public.tasks_benefititem USING btree (code_benefit_id);
 >   DROP INDEX public.tasks_benefititem_code_benefit_id_d2b8644f;
       public            postgres    false    266            �           1259    387399 /   tasks_benefititem_code_benefit_id_d2b8644f_like    INDEX     �   CREATE INDEX tasks_benefititem_code_benefit_id_d2b8644f_like ON public.tasks_benefititem USING btree (code_benefit_id varchar_pattern_ops);
 C   DROP INDEX public.tasks_benefititem_code_benefit_id_d2b8644f_like;
       public            postgres    false    266            �           1259    378888 .   tasks_benefitrequested_benefitlink_id_a9b509ab    INDEX     {   CREATE INDEX tasks_benefitrequested_benefitlink_id_a9b509ab ON public.tasks_benefitrequested USING btree (benefitlink_id);
 B   DROP INDEX public.tasks_benefitrequested_benefitlink_id_a9b509ab;
       public            postgres    false    268            �           1259    378889 0   tasks_benefitrequested_lettremission_id_0c9371e0    INDEX        CREATE INDEX tasks_benefitrequested_lettremission_id_0c9371e0 ON public.tasks_benefitrequested USING btree (lettremission_id);
 D   DROP INDEX public.tasks_benefitrequested_lettremission_id_0c9371e0;
       public            postgres    false    268            �           1259    378848 %   tasks_claim_lettremission_id_7bdd1ad4    INDEX     i   CREATE INDEX tasks_claim_lettremission_id_7bdd1ad4 ON public.tasks_claim USING btree (lettremission_id);
 9   DROP INDEX public.tasks_claim_lettremission_id_7bdd1ad4;
       public            postgres    false    265            �           1259    378822 !   tasks_period_period_e791c752_like    INDEX     p   CREATE INDEX tasks_period_period_e791c752_like ON public.tasks_period USING btree (period varchar_pattern_ops);
 5   DROP INDEX public.tasks_period_period_e791c752_like;
       public            postgres    false    262            �           1259    387405 #   tasks_task_code_benefit_id_611dd4c0    INDEX     e   CREATE INDEX tasks_task_code_benefit_id_611dd4c0 ON public.tasks_task USING btree (code_benefit_id);
 7   DROP INDEX public.tasks_task_code_benefit_id_611dd4c0;
       public            postgres    false    263            �           1259    387406 (   tasks_task_code_benefit_id_611dd4c0_like    INDEX     ~   CREATE INDEX tasks_task_code_benefit_id_611dd4c0_like ON public.tasks_task USING btree (code_benefit_id varchar_pattern_ops);
 <   DROP INDEX public.tasks_task_code_benefit_id_611dd4c0_like;
       public            postgres    false    263            �           1259    378823 "   tasks_task_code_task_537643d9_like    INDEX     r   CREATE INDEX tasks_task_code_task_537643d9_like ON public.tasks_task USING btree (code_task varchar_pattern_ops);
 6   DROP INDEX public.tasks_task_code_task_537643d9_like;
       public            postgres    false    263            �           1259    378874 *   tasks_vatrequested_benefitlink_id_edf110a9    INDEX     s   CREATE INDEX tasks_vatrequested_benefitlink_id_edf110a9 ON public.tasks_vatrequested USING btree (benefitlink_id);
 >   DROP INDEX public.tasks_vatrequested_benefitlink_id_edf110a9;
       public            postgres    false    267            �           1259    378875 ,   tasks_vatrequested_lettremission_id_786bbd79    INDEX     w   CREATE INDEX tasks_vatrequested_lettremission_id_786bbd79 ON public.tasks_vatrequested USING btree (lettremission_id);
 @   DROP INDEX public.tasks_vatrequested_lettremission_id_786bbd79;
       public            postgres    false    267            �           1259    378839    tasks_work_echeance_id_acf563bd    INDEX     [   CREATE INDEX tasks_work_echeance_id_acf563bd ON public.tasks_work USING btree (period_id);
 3   DROP INDEX public.tasks_work_echeance_id_acf563bd;
       public            postgres    false    264            �           1259    378840 $   tasks_work_lettremission_id_93a5077a    INDEX     g   CREATE INDEX tasks_work_lettremission_id_93a5077a ON public.tasks_work USING btree (lettremission_id);
 8   DROP INDEX public.tasks_work_lettremission_id_93a5077a;
       public            postgres    false    264            �           1259    378841    tasks_work_task_id_edd86e4b    INDEX     U   CREATE INDEX tasks_work_task_id_edd86e4b ON public.tasks_work USING btree (task_id);
 /   DROP INDEX public.tasks_work_task_id_edd86e4b;
       public            postgres    false    264            �           1259    378842     tasks_work_task_id_edd86e4b_like    INDEX     n   CREATE INDEX tasks_work_task_id_edd86e4b_like ON public.tasks_work USING btree (task_id varchar_pattern_ops);
 4   DROP INDEX public.tasks_work_task_id_edd86e4b_like;
       public            postgres    false    264            �           2606    378185 J   account_emailaddress account_emailaddress_user_id_2c513194_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_user_id_2c513194_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.account_emailaddress DROP CONSTRAINT account_emailaddress_user_id_2c513194_fk_auth_user_id;
       public          postgres    false    3019    213    218            �           2606    378223 P   account_emailconfirmation account_emailconfirmation_email_address_id_5b7f8c58_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_email_address_id_5b7f8c58_fk FOREIGN KEY (email_address_id) REFERENCES public.account_emailaddress(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.account_emailconfirmation DROP CONSTRAINT account_emailconfirmation_email_address_id_5b7f8c58_fk;
       public          postgres    false    219    3039    218                       2606    378695 N   accounts_portefolio accounts_portefolio_lettremission_id_d71976d5_fk_ordres_le    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts_portefolio
    ADD CONSTRAINT accounts_portefolio_lettremission_id_d71976d5_fk_ordres_le FOREIGN KEY (lettremission_id) REFERENCES public.ordres_lettremission(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.accounts_portefolio DROP CONSTRAINT accounts_portefolio_lettremission_id_d71976d5_fk_ordres_le;
       public          postgres    false    254    3185    249                       2606    378700 R   accounts_portefolio accounts_portefolio_rolecollaborateur_id_7645715a_fk_accounts_    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts_portefolio
    ADD CONSTRAINT accounts_portefolio_rolecollaborateur_id_7645715a_fk_accounts_ FOREIGN KEY (rolecollaborateur_id) REFERENCES public.accounts_scope(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.accounts_portefolio DROP CONSTRAINT accounts_portefolio_rolecollaborateur_id_7645715a_fk_accounts_;
       public          postgres    false    254    251    3193                        2606    378705 O   accounts_portefolio accounts_portefolio_user_id_623858b2_fk_accounts_profile_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts_portefolio
    ADD CONSTRAINT accounts_portefolio_user_id_623858b2_fk_accounts_profile_id FOREIGN KEY (user_id) REFERENCES public.accounts_profile(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.accounts_portefolio DROP CONSTRAINT accounts_portefolio_user_id_623858b2_fk_accounts_profile_id;
       public          postgres    false    253    254    3195                       2606    378688 B   accounts_profile accounts_profile_user_id_49a85d32_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts_profile
    ADD CONSTRAINT accounts_profile_user_id_49a85d32_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.accounts_profile DROP CONSTRAINT accounts_profile_user_id_49a85d32_fk_auth_user_id;
       public          postgres    false    3019    213    253            /           2606    379150 F   accounts_pwsafe accounts_pwsafe_lettremission_id_8f576869_fk_ordres_le    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts_pwsafe
    ADD CONSTRAINT accounts_pwsafe_lettremission_id_8f576869_fk_ordres_le FOREIGN KEY (lettremission_id) REFERENCES public.ordres_lettremission(id) DEFERRABLE INITIALLY DEFERRED;
 p   ALTER TABLE ONLY public.accounts_pwsafe DROP CONSTRAINT accounts_pwsafe_lettremission_id_8f576869_fk_ordres_le;
       public          postgres    false    3185    249    269            0           2606    379160 G   accounts_pwsafe accounts_pwsafe_user_id_6b8567f3_fk_accounts_profile_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts_pwsafe
    ADD CONSTRAINT accounts_pwsafe_user_id_6b8567f3_fk_accounts_profile_id FOREIGN KEY (user_id) REFERENCES public.accounts_profile(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.accounts_pwsafe DROP CONSTRAINT accounts_pwsafe_user_id_6b8567f3_fk_accounts_profile_id;
       public          postgres    false    253    3195    269            1           2606    379179 L   accounts_validator accounts_validator_lettremission_id_c9100ec9_fk_ordres_le    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts_validator
    ADD CONSTRAINT accounts_validator_lettremission_id_c9100ec9_fk_ordres_le FOREIGN KEY (lettremission_id) REFERENCES public.ordres_lettremission(id) DEFERRABLE INITIALLY DEFERRED;
 v   ALTER TABLE ONLY public.accounts_validator DROP CONSTRAINT accounts_validator_lettremission_id_c9100ec9_fk_ordres_le;
       public          postgres    false    270    3185    249            2           2606    379184 M   accounts_validator accounts_validator_user_id_ae93f26f_fk_accounts_profile_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts_validator
    ADD CONSTRAINT accounts_validator_user_id_ae93f26f_fk_accounts_profile_id FOREIGN KEY (user_id) REFERENCES public.accounts_profile(id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public.accounts_validator DROP CONSTRAINT accounts_validator_user_id_ae93f26f_fk_accounts_profile_id;
       public          postgres    false    253    270    3195            �           2606    378129 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public          postgres    false    211    207    3006            �           2606    378124 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public          postgres    false    3011    209    211            �           2606    378115 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public          postgres    false    207    205    3001            �           2606    378144 D   auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
       public          postgres    false    215    3011    209            �           2606    378139 B   auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
       public          postgres    false    215    213    3019            �           2606    378158 S   auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
       public          postgres    false    217    207    3006            �           2606    378153 V   auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
       public          postgres    false    213    3019    217            5           2606    387516 J   customers_bankacount customers_bankacount_company_id_296f0bae_fk_customers    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers_bankacount
    ADD CONSTRAINT customers_bankacount_company_id_296f0bae_fk_customers FOREIGN KEY (company_id) REFERENCES public.customers_company(id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.customers_bankacount DROP CONSTRAINT customers_bankacount_company_id_296f0bae_fk_customers;
       public          postgres    false    3063    224    275            �           2606    378329 D   customers_company customers_company_country_id_d2365eec_fk_customers    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers_company
    ADD CONSTRAINT customers_company_country_id_d2365eec_fk_customers FOREIGN KEY (country_id) REFERENCES public.customers_country(code_country) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.customers_company DROP CONSTRAINT customers_company_country_id_d2365eec_fk_customers;
       public          postgres    false    225    3069    224            �           2606    378335 E   customers_company customers_company_currency_id_59caea32_fk_customers    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers_company
    ADD CONSTRAINT customers_company_currency_id_59caea32_fk_customers FOREIGN KEY (currency_id) REFERENCES public.customers_currency(currency_code) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.customers_company DROP CONSTRAINT customers_company_currency_id_59caea32_fk_customers;
       public          postgres    false    224    226    3075            �           2606    378340 G   customers_company customers_company_legal_form_id_674849c0_fk_customers    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers_company
    ADD CONSTRAINT customers_company_legal_form_id_674849c0_fk_customers FOREIGN KEY (legal_form_id) REFERENCES public.customers_legalform(code_lf) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.customers_company DROP CONSTRAINT customers_company_legal_form_id_674849c0_fk_customers;
       public          postgres    false    3080    224    227                        2606    378346 H   customers_company customers_company_nationality_id_67a2b28a_fk_customers    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers_company
    ADD CONSTRAINT customers_company_nationality_id_67a2b28a_fk_customers FOREIGN KEY (nationality_id) REFERENCES public.customers_nationality(code_nationality) DEFERRABLE INITIALLY DEFERRED;
 r   ALTER TABLE ONLY public.customers_company DROP CONSTRAINT customers_company_nationality_id_67a2b28a_fk_customers;
       public          postgres    false    224    3086    228                       2606    378519 O   customers_contact customers_contact_company_id_b52c4cc4_fk_customers_company_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers_contact
    ADD CONSTRAINT customers_contact_company_id_b52c4cc4_fk_customers_company_id FOREIGN KEY (company_id) REFERENCES public.customers_company(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.customers_contact DROP CONSTRAINT customers_contact_company_id_b52c4cc4_fk_customers_company_id;
       public          postgres    false    239    3063    224                       2606    378524 M   customers_contact customers_contact_person_id_32cb4479_fk_customers_person_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers_contact
    ADD CONSTRAINT customers_contact_person_id_32cb4479_fk_customers_person_id FOREIGN KEY (person_id) REFERENCES public.customers_person(id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public.customers_contact DROP CONSTRAINT customers_contact_person_id_32cb4479_fk_customers_person_id;
       public          postgres    false    3100    230    239                       2606    387690 M   customers_office customers_office_company_id_653a34c9_fk_customers_company_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers_office
    ADD CONSTRAINT customers_office_company_id_653a34c9_fk_customers_company_id FOREIGN KEY (company_id) REFERENCES public.customers_company(id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public.customers_office DROP CONSTRAINT customers_office_company_id_653a34c9_fk_customers_company_id;
       public          postgres    false    229    224    3063                       2606    387576 B   customers_person customers_person_country_id_bb7c8b94_fk_customers    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers_person
    ADD CONSTRAINT customers_person_country_id_bb7c8b94_fk_customers FOREIGN KEY (country_id) REFERENCES public.customers_country(code_country) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.customers_person DROP CONSTRAINT customers_person_country_id_bb7c8b94_fk_customers;
       public          postgres    false    225    3069    230                       2606    387581 F   customers_person customers_person_nationality_id_45b2dbf8_fk_customers    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers_person
    ADD CONSTRAINT customers_person_nationality_id_45b2dbf8_fk_customers FOREIGN KEY (nationality_id) REFERENCES public.customers_nationality(code_nationality) DEFERRABLE INITIALLY DEFERRED;
 p   ALTER TABLE ONLY public.customers_person DROP CONSTRAINT customers_person_nationality_id_45b2dbf8_fk_customers;
       public          postgres    false    3086    228    230            6           2606    387533 Q   customers_prospect customers_prospect_contact_id_fe9f64b5_fk_customers_contact_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers_prospect
    ADD CONSTRAINT customers_prospect_contact_id_fe9f64b5_fk_customers_contact_id FOREIGN KEY (contact_id) REFERENCES public.customers_contact(id) DEFERRABLE INITIALLY DEFERRED;
 {   ALTER TABLE ONLY public.customers_prospect DROP CONSTRAINT customers_prospect_contact_id_fe9f64b5_fk_customers_contact_id;
       public          postgres    false    3145    239    276            7           2606    387538 E   customers_prospect customers_prospect_office_id_974d0cb2_fk_customers    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers_prospect
    ADD CONSTRAINT customers_prospect_office_id_974d0cb2_fk_customers FOREIGN KEY (office_id) REFERENCES public.customers_office(code_lf) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.customers_prospect DROP CONSTRAINT customers_prospect_office_id_974d0cb2_fk_customers;
       public          postgres    false    276    229    3092            
           2606    378479 U   customers_representativecompany customers_representa_company_id_4ad471fb_fk_customers    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers_representativecompany
    ADD CONSTRAINT customers_representa_company_id_4ad471fb_fk_customers FOREIGN KEY (company_id) REFERENCES public.customers_company(id) DEFERRABLE INITIALLY DEFERRED;
    ALTER TABLE ONLY public.customers_representativecompany DROP CONSTRAINT customers_representa_company_id_4ad471fb_fk_customers;
       public          postgres    false    3063    237    224                       2606    378499 N   customers_representative customers_representa_company_id_54193de8_fk_customers    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers_representative
    ADD CONSTRAINT customers_representa_company_id_54193de8_fk_customers FOREIGN KEY (company_id) REFERENCES public.customers_company(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.customers_representative DROP CONSTRAINT customers_representa_company_id_54193de8_fk_customers;
       public          postgres    false    224    3063    238                       2606    378430 R   customers_representativelink customers_representa_company_id_63c45cb7_fk_customers    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers_representativelink
    ADD CONSTRAINT customers_representa_company_id_63c45cb7_fk_customers FOREIGN KEY (company_id) REFERENCES public.customers_company(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.customers_representativelink DROP CONSTRAINT customers_representa_company_id_63c45cb7_fk_customers;
       public          postgres    false    234    3063    224                       2606    378504 M   customers_representative customers_representa_person_id_2922b303_fk_customers    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers_representative
    ADD CONSTRAINT customers_representa_person_id_2922b303_fk_customers FOREIGN KEY (person_id) REFERENCES public.customers_person(id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public.customers_representative DROP CONSTRAINT customers_representa_person_id_2922b303_fk_customers;
       public          postgres    false    230    3100    238                       2606    378484 _   customers_representativecompany customers_representa_representativelink_i_1624f777_fk_customers    FK CONSTRAINT       ALTER TABLE ONLY public.customers_representativecompany
    ADD CONSTRAINT customers_representa_representativelink_i_1624f777_fk_customers FOREIGN KEY (representativelink_id) REFERENCES public.customers_representativelink(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.customers_representativecompany DROP CONSTRAINT customers_representa_representativelink_i_1624f777_fk_customers;
       public          postgres    false    234    237    3113                       2606    378509 X   customers_representative customers_representa_rolerepresentative_i_42fecf8d_fk_customers    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers_representative
    ADD CONSTRAINT customers_representa_rolerepresentative_i_42fecf8d_fk_customers FOREIGN KEY (rolerepresentative_id) REFERENCES public.customers_rolerepresentative(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.customers_representative DROP CONSTRAINT customers_representa_rolerepresentative_i_42fecf8d_fk_customers;
       public          postgres    false    232    238    3102                       2606    378489 _   customers_representativecompany customers_representa_rolerepresentative_i_fb5c0c8d_fk_customers    FK CONSTRAINT       ALTER TABLE ONLY public.customers_representativecompany
    ADD CONSTRAINT customers_representa_rolerepresentative_i_fb5c0c8d_fk_customers FOREIGN KEY (rolerepresentative_id) REFERENCES public.customers_rolerepresentative(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.customers_representativecompany DROP CONSTRAINT customers_representa_rolerepresentative_i_fb5c0c8d_fk_customers;
       public          postgres    false    237    3102    232                       2606    378425 O   customers_shareholderlink customers_shareholde_company_id_1292bf51_fk_customers    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers_shareholderlink
    ADD CONSTRAINT customers_shareholde_company_id_1292bf51_fk_customers FOREIGN KEY (company_id) REFERENCES public.customers_company(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.customers_shareholderlink DROP CONSTRAINT customers_shareholde_company_id_1292bf51_fk_customers;
       public          postgres    false    224    3063    233                       2606    378451 R   customers_shareholdercompany customers_shareholde_company_id_5f7ea741_fk_customers    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers_shareholdercompany
    ADD CONSTRAINT customers_shareholde_company_id_5f7ea741_fk_customers FOREIGN KEY (company_id) REFERENCES public.customers_company(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.customers_shareholdercompany DROP CONSTRAINT customers_shareholde_company_id_5f7ea741_fk_customers;
       public          postgres    false    3063    235    224                       2606    378465 K   customers_shareholder customers_shareholde_company_id_bf06ce33_fk_customers    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers_shareholder
    ADD CONSTRAINT customers_shareholde_company_id_bf06ce33_fk_customers FOREIGN KEY (company_id) REFERENCES public.customers_company(id) DEFERRABLE INITIALLY DEFERRED;
 u   ALTER TABLE ONLY public.customers_shareholder DROP CONSTRAINT customers_shareholde_company_id_bf06ce33_fk_customers;
       public          postgres    false    236    224    3063                       2606    378456 Z   customers_shareholdercompany customers_shareholde_shareholderlink_id_0f97a228_fk_customers    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers_shareholdercompany
    ADD CONSTRAINT customers_shareholde_shareholderlink_id_0f97a228_fk_customers FOREIGN KEY (shareholderlink_id) REFERENCES public.customers_shareholderlink(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.customers_shareholdercompany DROP CONSTRAINT customers_shareholde_shareholderlink_id_0f97a228_fk_customers;
       public          postgres    false    3109    235    233            	           2606    378470 U   customers_shareholder customers_shareholder_person_id_5be2174f_fk_customers_person_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers_shareholder
    ADD CONSTRAINT customers_shareholder_person_id_5be2174f_fk_customers_person_id FOREIGN KEY (person_id) REFERENCES public.customers_person(id) DEFERRABLE INITIALLY DEFERRED;
    ALTER TABLE ONLY public.customers_shareholder DROP CONSTRAINT customers_shareholder_person_id_5be2174f_fk_customers_person_id;
       public          postgres    false    236    3100    230            !           2606    378725 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public          postgres    false    3001    205    256            "           2606    378730 B   django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
       public          postgres    false    213    3019    256            4           2606    387471 Q   editions_docmodelword editions_docmodelwor_code_docmodel_id_8e1ebb29_fk_editions_    FK CONSTRAINT     �   ALTER TABLE ONLY public.editions_docmodelword
    ADD CONSTRAINT editions_docmodelwor_code_docmodel_id_8e1ebb29_fk_editions_ FOREIGN KEY (code_docmodel_id) REFERENCES public.editions_docmodel(code_docmodel) DEFERRABLE INITIALLY DEFERRED;
 {   ALTER TABLE ONLY public.editions_docmodelword DROP CONSTRAINT editions_docmodelwor_code_docmodel_id_8e1ebb29_fk_editions_;
       public          postgres    false    274    3279    271            3           2606    387465 L   editions_socialdoc editions_socialdoc_lettremission_id_33c3d059_fk_ordres_le    FK CONSTRAINT     �   ALTER TABLE ONLY public.editions_socialdoc
    ADD CONSTRAINT editions_socialdoc_lettremission_id_33c3d059_fk_ordres_le FOREIGN KEY (lettremission_id) REFERENCES public.ordres_lettremission(id) DEFERRABLE INITIALLY DEFERRED;
 v   ALTER TABLE ONLY public.editions_socialdoc DROP CONSTRAINT editions_socialdoc_lettremission_id_33c3d059_fk_ordres_le;
       public          postgres    false    3185    272    249                       2606    378640 J   ordres_lettremission ordres_lettremission_company_id_438b6bbc_fk_customers    FK CONSTRAINT     �   ALTER TABLE ONLY public.ordres_lettremission
    ADD CONSTRAINT ordres_lettremission_company_id_438b6bbc_fk_customers FOREIGN KEY (company_id) REFERENCES public.customers_company(id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.ordres_lettremission DROP CONSTRAINT ordres_lettremission_company_id_438b6bbc_fk_customers;
       public          postgres    false    3063    224    249            8           2606    387552 T   ordres_lettremissionlink ordres_lettremission_lettremission_id_bb061c21_fk_ordres_le    FK CONSTRAINT     �   ALTER TABLE ONLY public.ordres_lettremissionlink
    ADD CONSTRAINT ordres_lettremission_lettremission_id_bb061c21_fk_ordres_le FOREIGN KEY (lettremission_id) REFERENCES public.ordres_lettremission(id) DEFERRABLE INITIALLY DEFERRED;
 ~   ALTER TABLE ONLY public.ordres_lettremissionlink DROP CONSTRAINT ordres_lettremission_lettremission_id_bb061c21_fk_ordres_le;
       public          postgres    false    3185    277    249                       2606    378645 P   ordres_lettremission ordres_lettremission_moduleservice_id_85831cde_fk_ordres_mo    FK CONSTRAINT     �   ALTER TABLE ONLY public.ordres_lettremission
    ADD CONSTRAINT ordres_lettremission_moduleservice_id_85831cde_fk_ordres_mo FOREIGN KEY (moduleservice_id) REFERENCES public.ordres_moduleservice(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.ordres_lettremission DROP CONSTRAINT ordres_lettremission_moduleservice_id_85831cde_fk_ordres_mo;
       public          postgres    false    3150    241    249                       2606    378650 I   ordres_lettremission ordres_lettremission_office_id_0f2982af_fk_customers    FK CONSTRAINT     �   ALTER TABLE ONLY public.ordres_lettremission
    ADD CONSTRAINT ordres_lettremission_office_id_0f2982af_fk_customers FOREIGN KEY (office_id) REFERENCES public.customers_office(code_lf) DEFERRABLE INITIALLY DEFERRED;
 s   ALTER TABLE ONLY public.ordres_lettremission DROP CONSTRAINT ordres_lettremission_office_id_0f2982af_fk_customers;
       public          postgres    false    249    3092    229            9           2606    387557 O   ordres_lettremissionlink ordres_lettremission_prospect_id_71bc99ad_fk_customers    FK CONSTRAINT     �   ALTER TABLE ONLY public.ordres_lettremissionlink
    ADD CONSTRAINT ordres_lettremission_prospect_id_71bc99ad_fk_customers FOREIGN KEY (prospect_id) REFERENCES public.customers_prospect(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.ordres_lettremissionlink DROP CONSTRAINT ordres_lettremission_prospect_id_71bc99ad_fk_customers;
       public          postgres    false    277    3300    276                       2606    378584 E   ordres_ordre ordres_ordre_company_id_11ddded4_fk_customers_company_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.ordres_ordre
    ADD CONSTRAINT ordres_ordre_company_id_11ddded4_fk_customers_company_id FOREIGN KEY (company_id) REFERENCES public.customers_company(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.ordres_ordre DROP CONSTRAINT ordres_ordre_company_id_11ddded4_fk_customers_company_id;
       public          postgres    false    224    3063    242                       2606    378589 H   ordres_ordre ordres_ordre_office_id_711c56fd_fk_customers_office_code_lf    FK CONSTRAINT     �   ALTER TABLE ONLY public.ordres_ordre
    ADD CONSTRAINT ordres_ordre_office_id_711c56fd_fk_customers_office_code_lf FOREIGN KEY (office_id) REFERENCES public.customers_office(code_lf) DEFERRABLE INITIALLY DEFERRED;
 r   ALTER TABLE ONLY public.ordres_ordre DROP CONSTRAINT ordres_ordre_office_id_711c56fd_fk_customers_office_code_lf;
       public          postgres    false    3092    242    229                       2606    378598 B   ordres_outlay ordres_outlay_moduleservice_id_1b55901d_fk_ordres_mo    FK CONSTRAINT     �   ALTER TABLE ONLY public.ordres_outlay
    ADD CONSTRAINT ordres_outlay_moduleservice_id_1b55901d_fk_ordres_mo FOREIGN KEY (moduleservice_id) REFERENCES public.ordres_moduleservice(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.ordres_outlay DROP CONSTRAINT ordres_outlay_moduleservice_id_1b55901d_fk_ordres_mo;
       public          postgres    false    244    241    3150                       2606    378626 H   ordres_outlayitem ordres_outlayitem_ordre_id_3777bebd_fk_ordres_ordre_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.ordres_outlayitem
    ADD CONSTRAINT ordres_outlayitem_ordre_id_3777bebd_fk_ordres_ordre_id FOREIGN KEY (ordre_id) REFERENCES public.ordres_ordre(id) DEFERRABLE INITIALLY DEFERRED;
 r   ALTER TABLE ONLY public.ordres_outlayitem DROP CONSTRAINT ordres_outlayitem_ordre_id_3777bebd_fk_ordres_ordre_id;
       public          postgres    false    3154    242    248                       2606    378631 J   ordres_outlayitem ordres_outlayitem_outlay_id_ba0705b9_fk_ordres_outlay_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.ordres_outlayitem
    ADD CONSTRAINT ordres_outlayitem_outlay_id_ba0705b9_fk_ordres_outlay_id FOREIGN KEY (outlay_id) REFERENCES public.ordres_outlay(id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.ordres_outlayitem DROP CONSTRAINT ordres_outlayitem_outlay_id_ba0705b9_fk_ordres_outlay_id;
       public          postgres    false    248    3162    244                       2606    378607 D   ordres_service ordres_service_moduleservice_id_f81d374e_fk_ordres_mo    FK CONSTRAINT     �   ALTER TABLE ONLY public.ordres_service
    ADD CONSTRAINT ordres_service_moduleservice_id_f81d374e_fk_ordres_mo FOREIGN KEY (moduleservice_id) REFERENCES public.ordres_moduleservice(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.ordres_service DROP CONSTRAINT ordres_service_moduleservice_id_f81d374e_fk_ordres_mo;
       public          postgres    false    3150    246    241            :           2606    387682 O   ordres_servicedescription ordres_servicedescri_service_id_72e0a86d_fk_ordres_se    FK CONSTRAINT     �   ALTER TABLE ONLY public.ordres_servicedescription
    ADD CONSTRAINT ordres_servicedescri_service_id_72e0a86d_fk_ordres_se FOREIGN KEY (service_id) REFERENCES public.ordres_service(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.ordres_servicedescription DROP CONSTRAINT ordres_servicedescri_service_id_72e0a86d_fk_ordres_se;
       public          postgres    false    246    279    3167                       2606    378614 J   ordres_serviceitem ordres_serviceitem_ordre_id_8f8e0a5b_fk_ordres_ordre_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.ordres_serviceitem
    ADD CONSTRAINT ordres_serviceitem_ordre_id_8f8e0a5b_fk_ordres_ordre_id FOREIGN KEY (ordre_id) REFERENCES public.ordres_ordre(id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.ordres_serviceitem DROP CONSTRAINT ordres_serviceitem_ordre_id_8f8e0a5b_fk_ordres_ordre_id;
       public          postgres    false    242    3154    247                       2606    378619 N   ordres_serviceitem ordres_serviceitem_service_id_bb1e292c_fk_ordres_service_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.ordres_serviceitem
    ADD CONSTRAINT ordres_serviceitem_service_id_bb1e292c_fk_ordres_service_id FOREIGN KEY (service_id) REFERENCES public.ordres_service(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.ordres_serviceitem DROP CONSTRAINT ordres_serviceitem_service_id_bb1e292c_fk_ordres_service_id;
       public          postgres    false    247    246    3167            )           2606    378849 H   tasks_benefititem tasks_benefititem_benefitlink_id_2f1d11ae_fk_tasks_ben    FK CONSTRAINT     �   ALTER TABLE ONLY public.tasks_benefititem
    ADD CONSTRAINT tasks_benefititem_benefitlink_id_2f1d11ae_fk_tasks_ben FOREIGN KEY (benefitlink_id) REFERENCES public.tasks_benefitlink(id) DEFERRABLE INITIALLY DEFERRED;
 r   ALTER TABLE ONLY public.tasks_benefititem DROP CONSTRAINT tasks_benefititem_benefitlink_id_2f1d11ae_fk_tasks_ben;
       public          postgres    false    266    3224    261            *           2606    387391 I   tasks_benefititem tasks_benefititem_code_benefit_id_d2b8644f_fk_tasks_ben    FK CONSTRAINT     �   ALTER TABLE ONLY public.tasks_benefititem
    ADD CONSTRAINT tasks_benefititem_code_benefit_id_d2b8644f_fk_tasks_ben FOREIGN KEY (code_benefit_id) REFERENCES public.tasks_benefit(code_benefit) DEFERRABLE INITIALLY DEFERRED;
 s   ALTER TABLE ONLY public.tasks_benefititem DROP CONSTRAINT tasks_benefititem_code_benefit_id_d2b8644f_fk_tasks_ben;
       public          postgres    false    3220    266    260            #           2606    379093 J   tasks_benefitlink tasks_benefitlink_lettremission_id_525fd10c_fk_ordres_le    FK CONSTRAINT     �   ALTER TABLE ONLY public.tasks_benefitlink
    ADD CONSTRAINT tasks_benefitlink_lettremission_id_525fd10c_fk_ordres_le FOREIGN KEY (lettremission_id) REFERENCES public.ordres_lettremission(id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.tasks_benefitlink DROP CONSTRAINT tasks_benefitlink_lettremission_id_525fd10c_fk_ordres_le;
       public          postgres    false    261    3185    249            -           2606    378878 P   tasks_benefitrequested tasks_benefitrequest_benefitlink_id_a9b509ab_fk_tasks_ben    FK CONSTRAINT     �   ALTER TABLE ONLY public.tasks_benefitrequested
    ADD CONSTRAINT tasks_benefitrequest_benefitlink_id_a9b509ab_fk_tasks_ben FOREIGN KEY (benefitlink_id) REFERENCES public.tasks_benefitlink(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.tasks_benefitrequested DROP CONSTRAINT tasks_benefitrequest_benefitlink_id_a9b509ab_fk_tasks_ben;
       public          postgres    false    268    3224    261            .           2606    378883 R   tasks_benefitrequested tasks_benefitrequest_lettremission_id_0c9371e0_fk_ordres_le    FK CONSTRAINT     �   ALTER TABLE ONLY public.tasks_benefitrequested
    ADD CONSTRAINT tasks_benefitrequest_lettremission_id_0c9371e0_fk_ordres_le FOREIGN KEY (lettremission_id) REFERENCES public.ordres_lettremission(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.tasks_benefitrequested DROP CONSTRAINT tasks_benefitrequest_lettremission_id_0c9371e0_fk_ordres_le;
       public          postgres    false    249    268    3185            (           2606    378843 >   tasks_claim tasks_claim_lettremission_id_7bdd1ad4_fk_ordres_le    FK CONSTRAINT     �   ALTER TABLE ONLY public.tasks_claim
    ADD CONSTRAINT tasks_claim_lettremission_id_7bdd1ad4_fk_ordres_le FOREIGN KEY (lettremission_id) REFERENCES public.ordres_lettremission(id) DEFERRABLE INITIALLY DEFERRED;
 h   ALTER TABLE ONLY public.tasks_claim DROP CONSTRAINT tasks_claim_lettremission_id_7bdd1ad4_fk_ordres_le;
       public          postgres    false    3185    249    265            $           2606    387400 ;   tasks_task tasks_task_code_benefit_id_611dd4c0_fk_tasks_ben    FK CONSTRAINT     �   ALTER TABLE ONLY public.tasks_task
    ADD CONSTRAINT tasks_task_code_benefit_id_611dd4c0_fk_tasks_ben FOREIGN KEY (code_benefit_id) REFERENCES public.tasks_benefit(code_benefit) DEFERRABLE INITIALLY DEFERRED;
 e   ALTER TABLE ONLY public.tasks_task DROP CONSTRAINT tasks_task_code_benefit_id_611dd4c0_fk_tasks_ben;
       public          postgres    false    3220    260    263            +           2606    378864 J   tasks_vatrequested tasks_vatrequested_benefitlink_id_edf110a9_fk_tasks_ben    FK CONSTRAINT     �   ALTER TABLE ONLY public.tasks_vatrequested
    ADD CONSTRAINT tasks_vatrequested_benefitlink_id_edf110a9_fk_tasks_ben FOREIGN KEY (benefitlink_id) REFERENCES public.tasks_benefitlink(id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.tasks_vatrequested DROP CONSTRAINT tasks_vatrequested_benefitlink_id_edf110a9_fk_tasks_ben;
       public          postgres    false    267    3224    261            ,           2606    378869 L   tasks_vatrequested tasks_vatrequested_lettremission_id_786bbd79_fk_ordres_le    FK CONSTRAINT     �   ALTER TABLE ONLY public.tasks_vatrequested
    ADD CONSTRAINT tasks_vatrequested_lettremission_id_786bbd79_fk_ordres_le FOREIGN KEY (lettremission_id) REFERENCES public.ordres_lettremission(id) DEFERRABLE INITIALLY DEFERRED;
 v   ALTER TABLE ONLY public.tasks_vatrequested DROP CONSTRAINT tasks_vatrequested_lettremission_id_786bbd79_fk_ordres_le;
       public          postgres    false    249    3185    267            %           2606    378829 J   tasks_work tasks_work_lettremission_id_93a5077a_fk_ordres_lettremission_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.tasks_work
    ADD CONSTRAINT tasks_work_lettremission_id_93a5077a_fk_ordres_lettremission_id FOREIGN KEY (lettremission_id) REFERENCES public.ordres_lettremission(id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.tasks_work DROP CONSTRAINT tasks_work_lettremission_id_93a5077a_fk_ordres_lettremission_id;
       public          postgres    false    249    3185    264            '           2606    379103 ;   tasks_work tasks_work_period_id_e4289768_fk_tasks_period_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.tasks_work
    ADD CONSTRAINT tasks_work_period_id_e4289768_fk_tasks_period_id FOREIGN KEY (period_id) REFERENCES public.tasks_period(id) DEFERRABLE INITIALLY DEFERRED;
 e   ALTER TABLE ONLY public.tasks_work DROP CONSTRAINT tasks_work_period_id_e4289768_fk_tasks_period_id;
       public          postgres    false    264    3229    262            &           2606    378834 >   tasks_work tasks_work_task_id_edd86e4b_fk_tasks_task_code_task    FK CONSTRAINT     �   ALTER TABLE ONLY public.tasks_work
    ADD CONSTRAINT tasks_work_task_id_edd86e4b_fk_tasks_task_code_task FOREIGN KEY (task_id) REFERENCES public.tasks_task(code_task) DEFERRABLE INITIALLY DEFERRED;
 h   ALTER TABLE ONLY public.tasks_work DROP CONSTRAINT tasks_work_task_id_edd86e4b_fk_tasks_task_code_task;
       public          postgres    false    3234    263    264            �      x������ � �      �      x������ � �      �   �   x�e�1n�0 �99��+"�C��L�	zտS�J1 �������4:��NiL�"�	Ѐۋ�F�Q.3ߓ_H��j��:� �k�JT5E�:�l�";`��F����P:��ǲ�j�v�ҥ�j��u�!�+�%)�bg�>iJ�&o��|�4� ��W����G{>��_��5����Q޷!<��c#�瞪b����}���f�M�      �   �   x�}�͊�0E��St?$����iW#3.D� f1 !M5����O����]\��$�i�u.>)���{I�րG���ӏ]�}z��4����u.�����]|6��;��8D��B�%��G�C�#�_`"c�'��2f<Si.͇ ��_	;�4vgN�*<�ۯ�Z/�+W[��X�����$��)r����/��� ��N#      �   r   x�5�K
�@ �u��%%�$�L��f>����?��Lԭ��1}��3�������'Y�� !a$G��Mi�u���J������O����(Q���tԘ����&u��� �#ݖ��	�$>      �   h   x�3�t��-(IL���,9�R!�D! 13�ˈL�Js�p^Y�Y����e��X��Y�e��UZ���YX�
Ҟ�Y����eԙW����ef��$�����qqq �(      �   �   x�e�1n1�z��G� �9K��'��k�T�"~A��~D`�C�S�G�XkA��\���	Ёۋ�&��.�}�t�6�2d�pO�%kz����q��t���d ������P���-}Q����T��&�2G�0����q0�*���Ή�ݪe2HaA*>0q�u�=�[q�\Ľ�_K�z�lAy��!�l��U�X�w}_�y~ <L�      �      x�3�t���IL�/J,I--*����� T8�      �      x�3�4�45����� �      �   )  x�}�ݒ�8�����	�:�\�kl�VBOjaC�y��-��qL��;p�H�bS��]���s7���OQ��_w.�: ���s ��lx�aE��l�5��
u��cXn��9���ִ��[s �;��?`٠a�j���p���s�_��	����椟}1RYO��Fj�"@p��Mt�zK��cY���������:������;�4u�/�����n���.8�&�RVGk$���'�+�ٟ������.�Ut���a�*k�we�g� �c{3��Pp���Ł츏e�ͽb$ ��� �@�n��Щ�;��q��8�����9��* �S�D�	����n��1_��֯�&�t��l��8�j���j����u�e���b��*!>�E�@fE@B�Ȧ�H��5	
�׬y,�u�@�_�-���d��p2g�P4�
cֈyY��<�sQ�"[�W	@Ş�q� ZLڮ��UCj����-x�V��e�%�25�I�a�G�i���-����﮿�:\�d����d����̜�xC�̌]C^T���2 Y;"]1��������Z)vŌF���,���Z%��C�[L�E"ޒb-�&�-G�"�Q?�����˭�h�-���C�#)����K���	yD��SP#�f�~
qIˋi*�	�n��lHx6�ɍ����L������ZL�<@�(�6��,Q��	erD�`I�Wv>}�!E�����h�(��������2R�B3c��a�����ݿ���iM�]�S!]�h�sN9�F΃��Mb��Q椦:��/��y��nￊ�V���#Vm��ϩ���P�Th����V�T�ىcf-O��'H�7Zy�9���<ˌܤ�1=ˌT3�G���Ä_Դ�&j)O��	�#�8�z��H,n�>��s���'�iݥ(���.�v�Q~z�F�F�W��4�4&U[��\��t��ߌ����9A�f\^���فx<���w�}�$��|�Mb����~���2ߒM1����43ߑ�4��w�KQ3w���o����ɾ�O�,;N'{;�xQf`Nbkh�zv9{����!I)��A`REG��oet���A:O���k�;˗/'�����V�nS�
[[OTvwf�	�H:̋{�/�+놬���_A�GH�/�LvG��/4���:����|�r ��2bF0�I�Ď`&�"C�hVŻ���>ܪ1T��2ǀqK@�+�m,����n\�[Ѵ֞orl��q�Ɋ.�5*�0+�ӑ�Ι>$O���<n&��Gax�̟��>� �۽��6���f���uqY�[�͞�}��VW�K���CT���F�Qe��7~UD�fۏ�>\ǵhh��K�@�J��B�P���3Ub:�Ψ�l��^(2+��Iq�Ɋ*�5*�0+���[�Lkf���q��I�!ݕ �їH� ӷH�L�)$���h����W��*�?�NH0�g/�@N	�>�=ܭ��{^\/-1���4�~v�� �� ܭ�~���V������	�#�(������l�;�8mc��f�C6���fE6�E��͊Lto��i��~u���������5�6GC�o<�Dq����I��""��g`$�}Vu�=�#��S��ڝ���>&�3�nU�C��B������
�\$�#('��p�A)����LM�_�h=��=��!c�(|��1p���6Xʁ��f�e>�rz���!���
7h d�����}��%����L%8��~�t�ҚC-��qX*5���Z�?C��X��y��S?__��n�os�1{s�"��,:e�r%�:�j�����=g��=�{U��1]�vPzP9=�4=����	��u��:��م-	�z��m�J��#9��js�+˓�<WƲN<��m=�����s�</�#��v��fzʺʽƥb|UB}��.���/}�ھF��� ���p=�.Lz�a � � ���MFB�9Q|~�&>�\%R��S�3D��� �ф���r���U���n֟O      �     x�m�Mk�@���Wx�ML���@�V�I�Z�U
%f]��D�������i`�w��`��U���M��1�Mل������&�#�o�&�ئ	�B4�R�,���r�:,a��U��y_��Sv��'��!F(:�����t��6D �!.���<���Pi�+')L3��	��-Ԭw�!���O?��	^�'-�3?�W����N�،�^��"
��Fӓ�/�o���u�.��n���vXr��^�X�k���n_�Xoo������6�;2B����X��>BfT      �      x�3�4�4����� �Y      �      x������ � �      
   L   x�34�L��I-�O..�)�%���9e�Qz@N##C]]#3C+cC+S3=SSSmC�4�=... T��           x�u��j�0е�Z�%zX������NB���`���N��ʦ�ì�{��r�
Tr)QI�G�G�$N��Q��
�.�����p�;��д� �@�P,=�Q �B> )�C$`�YEE�2��r��r�3@$K�T�2q�b�C�铆;��A�5�oǝi��q#4v��	��>?ׇ�rv��v�n���B��C��RQ���z]�W�R�W�Q����P��$�R�}�g�%���^�@�d �S\�>7�����et[�z����߆��M��X��'��)���_I      �      x������ � �      �      x�̽�nY�%8��
"Y���9葑t�r�3��H ���<���Έ��b^�;��QhԠg5K����^����]��(	��|�$J�۶�X��6����ԙ�B�I���1�d^��VB5N�I1�O���d<G	7��Q��`�f>Y��)L���8ɓu���iͥ����LK�'Z1i�K��N�Dh!rgD������g��<����*�'���%<�u����	��2�������"�����]�.���/V�W�����y���ˋ��v�>9,f���	g<9-�����e�Pי	�ɤ�5=�˸T"U3�Cr0G����(9�,�i:Y�G�IqtT@4���� �.��h�ΆGC|���߆��f�Cg�����p�·��t0G����,:��-�����r+�L�i�@�J�D&4W�fx:ϋ�p2N�?�>��{����b<O���8.f�qz��������f����U�i����[a+Ȼvi��_�7�U����������6��W�mt���j嬫e��g����arVL���h1�O��Qz�g��$M���_�3W�1'�����Hd��m�E+��&�Y��渳�$��tp6��)���i�X�5=�Lg�(\�K�P�$��>ʦ��ԁC�B�g��!s�S���*YI��&���p|��.��;�y�ot��o�`Z�O��dqT�!& �b:|�n%c���}Z�c��-W���t"xF㘱:�Lf�2͢�ӷ����~�v0���H��K����0��tpx2�����Ӄ)�������_��-�o�n�n���3����^'���$�����W��_�W7���D�<��Re��O�Y	��y�ˠˍ�ɨ8���(=;)��EBJ7�������R�;�|�x}o�N0M2V9�N'��9L��:(4�9�y���ZA���ÿ,���^B����\����ͥ�Ƀ�ɪ\��~e`�R(��J��zW�Aj��Mf>>�i:;>=H���R��9M��
�@�4<-N!������l6L��A1�D��ZG��i
���yb�f!3g��3K�h$��p�z2=m=9`����^T��)���[�(�iq�����ܑN%m*D��;�InXf�h��tF�/m2�!�')$}���tv2�B����='.F�_&G����p8L�F�|P,R����	.�Gy��"�L,��� �2�T?"l���W��4
���DwyRwV7u�9_��+��1kڕN�&��k��μ�M֔�UNW��Y2?&?M%�=:|C1�#4���Ƨ�t>��߄Cųy�_�䜋���V�L�-��;��v���֥L^��!�V,��1�'�b}����}��c۽�6�7u���pP�B)˄o��v���ُ�[��:1�Q�tO-�����0�}pz�Rr����Z��3KC�B���߿�-N3��3������{�k�؛�}d'�p���J�̤ufC��Rx�kYW�,���Ƿ�Yf�z:<l}g|��<BFN��i:\*t�a݇�4-��BPx�_�0e���\���s��^���b�_���������d.�W��_�� N}�+��22aYE�!3+���)��-<�|���$~��h��pz�L�Ż�"|��N��O��@�j�HT^��SΡY�S���@����� �Iɸ��V+<�9	td�G��ӳy(<�^m�K��p+KA�}�!{����V��]�c_�\����M�|�O6�&4鲲R��Z���%�׏ ��h��O�r�C����\��(��������8� ���r�$6�2:A�M�s݇Q��
 �����R��_=\�ţI̮0�V)�]x T-���M	=�7>`��?�ET6%[����gJ���_O;��f��T[�x41.	E���*��"��A>�& �(�fn~YV�6�������wr�W����eZ���fU�U������/�bu}.�պ��z���ڿ�R������{�+�vw�\�#�*2�ۋt�W����|�<�.Wu��^/ X�+V��9r^�hBV*�<T�N ��p��M>��bh�Yz@i��b�p�L3��N�^@��1�k�r *h��h�#�9�	�]�q�n^��Y!�IP�w��_������>��kzc�b��V��/��.������^��+���A
H��ee��S�u�+�}a���8�A��gJVw�S��U���
�2�e��z�l�C��U�{�6�/�Oj�S��5��(aR�p�VJ"�d��t�g���q�����s��>O�� ����K� b�2+W�J��I�'��9��N"yG��),|0N��߷�w4O�����s�I��Ӕ�ppJ�h�F	�>wp��#�kv��I���Z������'o�Jز�aT�*U�������隹&�K����0��r��J)�F����t\�?M������E;R@^y����@�4m�, �z9z��f��CU��	U���ɷWLA�ȜW!�m�D�8h���H`�']����6yU�#��\l4C!���@�x�@,jFN����&�G!��������_^t^W���V�}u~�oV�"�=�Ñ �&��T��Ih��G7y�k�@.���(~�v�  � ۔~��k�j����;iH�+�2�U�b���/���U/�	^�` �\z$b�J���ʜM��ُ�����h	�F��/YHF1A @@v�D): �>����?�~=8�/H8�}���c��C�o]��G3�=숤�i8ˌP:C�"��5�I0Y��\��l1�o�ܫݘ��^Ә��{�0k�De��$�TO������������~BX]��^,�~�#��{��d>5������>pU�UH�ac���N�y�[�8�Y����!���y�s�ET��]#��y"�S!#J�qMRL��a��!I�U����w˅���c�+�l�u�����}Evb��-0l�J�k�|��5�]�4��p0�LS���q�JAD]����Ah::�:(�FjB�E�<���S*O4��JR��4̏ߗ��o��h�����M�wӧ�c\�`�G�a;�֙s�g��H�%\d[��ϩsx�I���t�����8��5~��d1�,�EJ�E�*g�i՞��� �A����IH�9c$�O:�}���}j�!���:ܞ�
��v����47�!3�e�ɲ���Ɍ%ob����pM�h��F8~�:��f���ma���
Y`�E��x4�#�S�1�u�-�n������#U��� ��}���*�)i��f��U�#M
�ƣW�P]����R��n�x3LL�s��@Uf2���Q�&Q)��@�(2`xɝ�u�������T2�]%_�픎vE���yR�c������cH�Ww?/�x�������0Do@���
	��e)K�����f6\�ҳ��#x��7�����n[I&1�-�� �4%B~:)1����!��ʴ�'����y�*����&�~�vyw{~�h�lW�[�ҵ�D��6�k��t&�m]��g�pN����Sb��р��{I�N��5*�����"e���w	�i��mT� T�]_�Y�{���1���f:8Mi��,�|���˒#��vu��:=�,f���3�k��C�G��|�I�����O�U���I�2���c��t�Z��S��H��G$��HaL[��%�����b�n]�Om�Zv����_È��H�9�,b��8�5�,C�5����hrЅ�O�6*�j�b"~�(�cz�W*ΐY�$��(3d߱>�s�ŗ�V��׵��.V���S� �eB>�)�y㛬�,��69��)s�hx����UWI�Th��x�sD�>�L���Ʉ>'[�xt�F(�I�&�i:"ټ~]Dl�]����Ӷ-x����ᴥjO���?9H�g���FX����������
�7.hV)]'��t8~�O�>I�3�ţ�ɴ�� ؙ�~E��g��ɶF� @���V�pY4� ���g�Qq������8�b�#��    ����b��Y^�� �.��)m�*��<�̉]�+W7���\��G��4KOi�`��"��dc�թ
Ƈ��s�Nf�}Q�
w��a�H7`ypD���8��R*�y�?��QkH���7��/����2T����N8�<׈%Uw��YY��]{��]|��Lfg�ɜ=�L���DB�zf�E90��` J
���vm���`����Lg���au���,o{Y�q�	e�����4��<��Lռ����͊SJ���t2?��S'��Rx��|px���]N�Y1��8����ǃ�|��I;�u=�Ưo�K�tUl�j���� [e@�03�2E���*��>�$��I8�d;�x+�����^!���>�ٲ�H>sgJ�{�dx�8<�	z7���D��Q3h>Jq�\�MV[8_d�\���ʕM ��D�s���A�p>�d@���u�ZիK�4rF>٪<��󨩺+��eV%`��:S� �09��C�`�</�J�~q���r����&� n��cN
H�D�����&��O��櫓E[N�	A
q;	��ﷲ��O����_�@��B��y]3D~g)U��Ag�le��$��I��C�es� ��Ru �@Ef��<9F���n��if��-w���W���ò)^!��P�y0�y>�? ��ߖH�����N=�s��k ��ٻ�4�wuêZ�up�5�Cx��w�v�f�t���l�՗��,�Y1�����#SO^�\;֪	����+�^o��������ٸ�VK#��M)2at��dB	�*��b֔H���! .Ɠ�]q8YPV�y�$����!�`�
\�p�u*��{yX�qT��( �PV:B}�ދE�$~k���`:�N&���6��߶13h�g�e�Pd�B�KW�������\mW��U��V�gM+�����d�j��x�+�S*u"
�P��mT�,�8�-�p%�щ���� J�V����=[��JIQww���/o�����[Q����"3%p�4>��y���QZTy�$'��&4r�3�����w���&qQ��d;9!�';D�/�)I*f�v����Q���~�����o�y��o��%&�ϻ�Y�δ��5�-��)Z�&(�`��eT�f�}�#~�^],�ag֦W8�΅l֔�Z%�f$h�Pl� �)[>f���8_�nxW��2Bn�I �8Ω�  j���@O�!�+��x�>`��C���{���*t�v
�X�ی�yHz�[��Tn��x�Z%�7��`�A��9�j�?<j�k#
2�P�3�i9��1������V>�M�=�|��_��=�Tu	��Y�s�	 K�s��p�#Q1eH^w���끙|o#��$͘EĵN��媝r�ܲ�RMJ�gۭ������7'�~K54*��+��sU�]/����kpޫ�k ,�qYUS�F�y<D&!_�|]� f>9�mH(1;s1���2���4�n����M��R�P��/kBl��R�)C���QD�v���W�KO���-�?���?<`	�2e%��B���:łɬ��Z6x@����x=ϊ��b6��M�����/�k�NAC�n�I�T�w7��ɻ���M�iۇ�mE&z.@�_U7�Yg�\��ޮnV7=KF������.�ϝ��Y��g��Fl�B{=���������DN��b�*�^|=�#rOo��f%�Z�����6�f
��*�Y��)�4�lQ+޵�(����t�[��>r�Rk.V�����r٫d��*��2�J�q]ó�U�y�s`����"��Y�̣�U��wúհ�������|[V��*�U�DN��B��M���\%�m:[qQݓ�I,�D�A����|2ǩ��� �r9�ԁE�K�u�2#��w���f�ߴ-��l�d�U��p�K���W��7zH�|$���+����:�*!J�UB�M��*!N'G�q�G� �'C��%���zN�:<���v��Dn�p�l����<��o�4 �F�[�j'�PW4���`��5���*ȋ��ں�m����`pᳶ��b6��6�#�s���>�`�d�#���M��iۉ@�յhq9i�?w��驿�>��:=�A���6=\�^������K�n�s�4������W!�2�
� �H�r%�̴�� ����<�݉CR�)m��������iq�*݈�E��!m���,��q�a#@���lm�5��Da�v����G:|�ٱLZw!�k 3��y��*��!��h���K�=��~a�u&����׍N�N������ǂ��=�ݎ5	�ȈF��jc�5v�c�l�AUm�]��wĨ&9��5ɭ8�4��夺��<�j�5��U���F[�!S�i2��M�/2mO���k0ǞTZ�T�H�wRayr�����xF+�V��~���3���teK���{�d
!����M��� ��~����n{c4�n�n�"��m�^�;���_�p�v�l�c���W?�_��~k@4i��@؅��N}U�j�=��[��ϒ1�r+���m|�K۵/�V vŵ��S����@�ڕ�z�@*O�o�1���! X�,yJ���UeB©y!*]�d0���� >QG�:Ѫ����L���QL.!D%�b��©�Lҧ�3\3�
*�{pc�>�E_2?��2�?�����eȖ�棜�yi�2�7��e^�>�	˽���	R�Q1�����o\��5�4P- �R�)I�\ٶ�!ij8&��!�DZ �.���~����<�w����/���on���?:耈�#��$ Lʹ��j�K8k�#��;5*�wC�:\\��.�իt���e�����u�L��SW�_��U�?��ː~���H��9�n��el�HJ�������_#B���9 �NX��s��Cڝx��W�楀�L*Hk��({	ƄRxG�����?��9^�H@,Z�c
���#�F0�A�=q��u����_}���^��8��T��NγօZ��r%-Q�4�L���+f%�sDWC�ܷh�-��F�+Z��K�g/W1///W%�����	]]�b��ௗ�􃲪�/G8ȗ8��ե��JT2e��&)�H�ȏL�s�b�9�Kmk�T�6���~M�
����Mv�rP�Y���b-�|�ՍO��Vb<o��z�¬׫+�*e�m#�"�l��9���g��C���R�XV&�+3������6����	��7���m$��U��c7Z�4�9'�L>��h]����{��eGq��7O�wKL���:k��:d��y��P���T���p���<�BB*�A�v�V�i��Ж{W�J����	�����OT�=��g@���aF�_����'�����׾Z�&A�
�y���Ef�EH*Q«0�9����;a��f�l���}��Ι�M�	J�ꏢ�n ���n�$׺h3Q��<N�m[M[��^�րw����q������,t���#YS2�2U��:%�l�d>9�TJ��,�O1*����g�b����.�/-�C!qϧ$~Y���]lD$���&�4=GS�i, ��!�۞��Xo>-��O�R}��zu����W�ʕ@�����/"��@Cu�+�6�&y� UL��;|'�{%�l�r���f8.j������y;�j�<��G������}F�K!���/��;�7X��
]1��4���z�漓+M�>�m���?
iv������uVzH��<o\�QR���\&C�)���zL�%s+�I~��ǆ�P��UY�Ф���Gm��U/�.�%\-��B¶��#�
��rqYf��*3�Wyō+��YL'�B��n�Ea�<�5��ڵ�E{|�-�G;�񺣐����A�B�ve�{��绛^�Zq���C�)��˚�r��p7Hv��ף�_���t�8�vh�^r�:��k����g��Ւu���t��;h�UڕK�X�#��d�I����7����7�rywy~�B��s��x�)5��6LC�jn�ҼB���M�crM��M$�=��$c[���_�d[ĴAc�9�lD�d$>    $�mIN��@����m�B��~��U�{MBpQy�
�9P�g�ď�� �9���86V��Vob"�鑽��:e]�ɳH˄��T�¦)��m����b��;���������.k�+�� �{�=@2�YAb��ǔ=M�]�����V������8��LZ������Q܏�u��{W���9=���+��r'^h?�kI��&Ӭ��W	��!�L�q�~<Y�'ZXCkjG�x��/�D�u� @nm�E3�Z�%h�Fب"r@CZ�2;�>����%G 2;�)�S���DxY-o��p~���U��	y�D4@ `�ڵ�C��d0y,Ex���*�m���Qm�{H��NNZ�'U;����r;7�L�Ȕ1Q��Z�\��+���ʈ�,��m�L�A<@u�����1�v4C��E������IK�v �x ���puX����~�l��O[͡M���_�|�\���U�ilWWM�X�)]S����Ʉ6�*<���;��+?��N�ׇ�}q=�W4x�����p�ҪZ��*Sh��4e;��D���CT�.����_,o���M��Z�^~�#� �����:��o卿�ϫM��W-��^����v�~%~�6� ,1є4�t��Ik�΋��k�Ҽ��Ǆ	�k��.
�P7:n��C����۵���g��D��
/���]]��w�k����Z���JS+Ģ�Ԅ�e������2�����2Cd�#Q�6�Her�#��YH�r��d?k""U$N����$�cO�����Ʀ����S��G�ek�x�%��[͐?��vR8�'
U�P�rt�]�K�<���0wP���7'�@���`� eP��X������)�u����*k���O��=��}.^��vI�v��v��So��:v�W��`D�dͲ�Z	\����?�Д�]'���X��%ڴ���O�0��J�~��ū��h+"�����-�2�h��p�!�/b%s�ٮ7ڙ�0��WZ~׷�e�w�^4������nU}�?\ey�ؼ��m�^����C�����ٿ���?O�y>Q����Wb��R���?kϴ#>��|̺z���d>�fY-�Ot��V�)�m��5���@�|�& G{�iǙˀ��B6	|Ad-|�`�hdg[D�"?j�h���[|b_>>}/08��!ny�d2����
�/J���x��K����^�p�(��x���qѱ�:����W�h.7�ڄTO���k< ����Eǎ�e����ڗ�ʤȗ]}����&/�E�E_��ܭ�������1�eOA|����@��V��l*S0:�Q�YP���ȏ��P��w��v�Ś�Sn#?��� 	ř��y����B��qA�W6�i�{|xg������}'A��"eƁ�e�E�@��=F�X�8-�O���^�Y�Y
��2QQT��?1O��w6�\���|�0H�vw����~�9�(��^_,=9�K���Mx�`o3����g��d�TpR?e����s�d��fN�8Z"E�-/8O,F�b�2���{a�w���$�D�m繠�y�݈�>����V=�T�S��a��a��|hT�7�R5`�1t��JWK�$#k_�`l���霦L���H��\P��j�΄��4�~r�V��Wv8Si����^��&��1�<�%tw�o��w�
e�	: oi_CL9�Q`�y��)7I�X�K�uo"3IJ	�2O�"�|=�L��	��B�KT[$��P֩Z�ȉ���t~ �1����)@PP\4,����"%-�ԍ4qI�*!C<�f ����/R�Tۖ ��
�Jბ\r��9@l�)T�h�N��Ė� ��u��O+����U���߄��<����2_�)-�6iIV�0)g�t��цF��f����i��H���1��R2����Pl�m�!���FD� �Q=�E�<��Y*CF�G�v!�G��{����tk���`��4UZe�"8^`� �LU��p��M�����dm�������	�]5q�Hgb��L;#Xb��9a���<���@+ݗA�K)w2�^�J۪��ͪ\[�B�0��_"��X�*O���5g�Ȝ�
_|N7(��9R���q #���GsB��s��zkST��mSW�_B����BjhuSS&iEY�W��{�L�`�6Ur0��:��&|��v�È�^}��t�W[c���cQ��0r����o"D�ۯ��&�}٫BY!����n96,P�yV�&g%/�!�r
j�����)L-��0j���T .�oo"��M��8����ϝ��/ C�����\-�l�%n�Zg��ܗ���[��wUuws�� ��@�2�k�hh�R|��T��L)<�r5�'��|xH�K�[�^,�\��B�˒��hs1���H�,T����tهiUw���#��,�j�^V��by�� �T�ї��x �jI�-�A�
����V*�������qp�5B"���3��
w6
�)�6B�Л��c4;�_$�_C�Bi�����6��i���+:�"h��v{0�i�s�p/�1G-:<"���"����<��Hz)bA�*�ʉhJe;�uXkY4sA񎮃9툳�]�-��NK��~}�Z�}{h�������[�j�}�.O���y��|t7`�%+�Ҵ̟%�b6�d��M���� �Yh2�T�)u��.o�S��&�˄�t8�&Z�Xi���p@d-%MUX��4g�&�C^����������p�[��*\l�.!���Ù�2_��:4tH�C�s�gAxi���*o[ho�����z�(����I����T[�A�Ӯ��oA��8���QItH�A�DZ,`=+�=�ps}��"���\��TL�+�YN�U�3�!�E.��~66ǣ���m��Jԗ�(�S9�HγO/R��s3�����NG� -R��TH�"m|�ns.y���ċ����ps��z�%�Wi�&�z�}��Z6�~�#ڿ2tc��<�^K��@<c\h$i�d^��tݘ�X�.��7��1^��`b�H�c�#�Q ��|��|ӑ�0l�u�����=�F�]�\#���Q̳G�$j+�� ��ȼ.��
�:�������wp73H���Rx�qz:�I7+�}���S�:)`���}� ��_R�1����E�#I%&�n�t�A<2���n/�=k���v���%�R �P" �����]��܇ZT�ľ����o�~ЖR�{��"tӔ ��?A��]]К�,���BߞL�|�N0,�M���ϡ\޼`Hބ����iK��]�0+!���X�A���	�6l�W��-��?� ��ց\f����x�T��M��:�ٮ��{�;]z��Vw���:w���.M^�FJn2�x���	�� ��Y1�ǋ�ļ�X���p����L��^��/��.Ў�8���J�� ����X"��=���!M�q�Nƙ$�is�kx�^����ׯ�����G!�Z�_^�.S��s�.���^�ރEлM	6���mz}�o�	|<����?���u��������n����c7r�*�_�7��{>�BԕG��UĶ�uNde�*��e��Ee���p���ؘ=<A�6%J~��F�(^�C$)Q�<���CJ�������ys�"yj�~@�v�딱�ES	�h�L�"n�3�H'Ӎ�9)��b�O���N���bb�)���ė�p�N�.���J*�y+	a EC��s�~�>'��v\wY�{v�����TiA�}�ZZ��M[	?�\�����N8k<ݑ�EW����1WU��R��l ����ƣ�fd|�T��p�}��M���u<PV\_�I�\�˭=���dI�a-P�u,V�	#�h��n�~�B��?n�ū��n��5��~�m�Gk���ޟ��n�~��㏷"�D�{��۰���~�{Nk�7�^�ƁeV���m�Q+C$v��lE2�6v�Fbb���d8/���`��2�/#?@byx29|    �f�ߤ��?ݻV�l�Qpq���'���V��������_�6Ԝ�q��{)i�����Nm�4����Ue04���(�'��pB7��y�M?k�(��ß��'H�q�6��鈷��>]L�D��N��*�fZK�ᒆ��6�f��'K�����Tb�!㖷n�~f�"�{KA�cD�n�:��d�|��d��p�ʼ΂�q�2��CV�����ijD�:�]��h��oҘ��4���LBD诈},B"Bٞ��=sZP�vt?��M�n{��@�	ӹ�@�nJj�<�|�M*��*X�SM�1��oj��d��ZC��!��|p��~<td�����@��q-�6Dh$'("OB7�;@��lv$i��kg�"�֣�;� ���/�W@Y��Q��1O@���
J�wM�Cd���M1����O;o<�qd���Oyd������[U�.�,��&2/MIJ?�jgoCk�W`��)~ڑ����W?�����{���ޔO�x5ΕRA=��DZlӈ,�* �3����7I�v����"G���A��� Z}a��8��[�=9�J"��J�w\�Q:�V�W{ybcd�w�/�����������1h����Ԋn���epP>��A'��ЕdD`4�I�곛������$v�A�vF�D}p�@vc�����8���Y�h@d��p��]����v���i���7�.��jl/ժ=2b`X�负�"�.�y�]�(��*�(QI�_#��Ŵ���8���9�0Em����6�}C�\����s����-4�jL;pG3�.���x;��W���E�� t�B*M'c�˼Qeƹ�,�cQuFS,ߪ��R"hM��7�.�(7�s��&��J�{��R�-Ͷ�:���T���Q�K��sj���
oBU�<�8��QJMj~���vN{�V��{A��S�W��HS���������8��w�3h�j���Gl�9�4Y�MM)7$��'���s�s��=N9G��f&Jߖ8�%-�ʻ;����H�m�[��qm�h�	٧�q�ZfNh�U� �L������NF��.�����.)"� J�"�)�n�W;�-���ξ�����uۄ\]��̶�D��D_�YN�l9��z�Xŭ�|YՀ���tD�w(��!,6.��of�t��u�l���\J4���� ���hmW��%�ju�=������t���g�jW�����sk�t�FW\"��"/RÐP9����Cd�����}��a���z]�)~,N79e�׮|�&n�r+�ȑS�xe�����ft�l�\��w7+J���/�޻z�7�o�w�h/@��n#��fƳ�6�u�.p�,Դ+G��x'i7�7��J^V;k���?��|߀jq�Ėqg������M;ny�>���Ze�������� ��P5�+\�(L7����F�$fFǣ���X�`���0.^%
�l7�D$4_l�bK���Q���b��~�����P��3W�@�qy�+<<�ɻ�i��a�nI�f]��2�o<��D{ꎆ���O�(Lg�d�@�:a�;���=B�V\D�O^~�o��e�Ł�<O]��R%���ꬔ5��;?����=�P�'�ji9��m�ӃR	`�V6t�N��m�}qɜ�'?9)�t��=m�H�֏���U4*WÃ4Y���N� 	�=A�,W�M\�I=ҝݒ�� r=�M�MLi��*IӺ��o�
h��rs����_ռ�����Z� DVV9��<�,0 �� J_wv���g�۩rQt~�F4D��Y'>��9�/Av/�m�B�u�q`[�ҩ�d&�5m�?�@f��)C�7	Mc��������{T�է�0���t+�����:)���(Ndl$N溳���o)�^���Џ�E�v*&ӹ�l�UVZŲF��'��,I�z7��؇�wK����B�xGnGۘP8�"	�tm�S;����h����WHf�X��'t�U�e�0�t�U0Z��̹Z��j�XrRS�<�L��b��^��JM���ǳX��Sl���>��`z�ȸU�#z���� �����w�����nb��P"�%b�Ɍ���+z��M��f!�]"u��8��l8Q0�6E�缽:��Ƒ�%�V�xR�~y�9������@��Z�xz&�&���^;�"��άu{J������8]��>'�П��DbipS6��f��r�uǝi�����8���5���լ=&�}����6F���G�r64�ql$rii��y:�T�Kjfq�����91^��ZĮІ)d�F�B��;d9�19N��
����KXH �m�l,�KP툳�spO�>��,;yi��D�u �Lh}{W��!P������b5���ft
�h�p��I�|x:�ӯҟ�(}6O6y3wJiݥ+F ����2�:�ubH��}��������b?EiV7��e�����fF6�0���0yS
��II$����~����]2��6$��h*�����X �{��R$�q#��H�|3kя6(�����l�2Y�*s��Ym�EeXP,9�����'d�ۊ_�_v/�1�>k��"N˷���>�H�N=P�f�A��>ҩ@�2������<\h���:`~[]��W��ׅ�2�������E	Ӂ`B&J �Z�Z��������v�RJ$&^!e,���vG�X�#�Q�M=�H���*�{�
鄓� 4�`U\Ħ�;h������𰥝%W�ف��W �[?.���u1�D���?��ᐨ>��������6���e�>����W�Y�D)�����Li�g5uG$����t4�1Ã�)oEji𞩔� �O��8�֞��$M�oT�s��=#��PDԵ����E�%���{�J��U��D5Ay׆F��{g����`8�d�E�F�
����3�������9�F#��2��Hћ���\���D]=g�d�͆:�����q������,�5$X�8ja�w�����u�E��� ��o^J͍h�"":�j��jE�����^��]�K�"Ӗ�C%"�sq@� {�Z�2	���pP�SZm�)x�1=�����
��W7C]�<�Bqq��0<j�2�ye���6��s� e��j�h�VS�v0���!�����҃�{|~x�"=)ޥ��w�͌��Tt�5��B�)�RT4��r��6$�^���v�Ծ���G�;����T�%���{v���V􂁖�5��Z���v���iS��R�i���9bV-3�k���J�����l8A���q�)���KE̎�Ӑ7ۚ��Q@]���$�%/�)¡|2R�Ң����n�����j��l�ޅ�ت�:+s[�`F���یk���4&9���dpZ 	��<jw� �ۛ���V��E���s��YF<ӉT�[���jx9y<0�u8ĳ9�r���G%���� � ������,m��wx�U��� B��p�&�����	�{s=�#"7�N���P�W岻�<�)�嗔?�re�(8��%{��zt�m�~_�4��f��*�A�J���Gc���UU2LZ�����/��"��Pp�p["�x���
�ѕ����;pK���ş��X�h�2Іr՛K	aj&��Ĩ5`h����u�B�^6�;:r�c�1��Ld09� �N��ЭNQ_�֓��Kt�pA�6;��^3�!���q:�&��y�:d��]m��778D��6i�H�۩�{.�G�j���m�MF�AjAK�*tp�3"����m�p߇9%��Ѩ�0}�)C�ֽt}����~�H+�8�c�l�>+�1�50"Q�" ��D9]�O�Ȗ�TCL�(,#A6Vm��":���8�o��8��2��ȸ'j�+�Y����
Whך2d��kjd�ɠ8F�6y=��|x�ώ'6�\?�h��E&*���ۙ�������X��=~u�<��ܻ��ʲ�Ėc���2+��gJȆƀO|Bw|g�����$�[�3�<�3nBk�Nw�B�I��#r��C�&:�{�����8�$x�U&*���    �7�e����T4���󘏩�	Y�C�I�h0L�JHtf�%|����! ����O\"���,KL�i8erx�8�_�9���4�¤�}��!{�aN@��~��n@NF5��!s�n�e�6�VARGp6l^�m:��6rCeY�^Ԡ$�m�X����CO���Z_�b!k��E0⸢#Y�FO`6o'|s��Śז\�aqP�t�Sͥrﯴʽ ����ޔrY9A0�����)�F��5Q�/>��H����	��&�P�`o��Bt3��K�o>������b����;������}z#*EV�"_`��
/Br0�O�O��/PcE[gњ$��Y�s��s�g��Ǳ�2���>���]��W����[g�Q@t&�Ԭ"W­�KyB���p���En�iї(�"�6.X~�9� �P �����i�/�)����0t]�f��m]�����<y��m�L��dKK?KT���^|D�+$�%D����|T���.S9��e��y�2G���D�$���ы�GY��G�aL+v�� ]<$#��2ک��7$�jU?ae{�#�DM7���,�%��!u@T͛\��ڗ���k�/;���m�b�e9%�W[�j�p�C<��$Gg������ ���R�%V�6��E�y{��_=�f�:���ږ�����)U�"o�}1MG�XR�XL�D&��.���"�9�6N!�Oi�>�&����nIu�M%㸡�6a��$1���m�f��w�o���"h���A��kYψʕ�ͼ"F�Z�$�SA�Ł��,C2���{������O�/�g���@�4��H7���fa������Y���V�{���)�{�D��_�,_�B`�	�ˌ!bn��5y�5e����Ǔ�/tW���\w��ħC=p�^[��׉h�8؛��h{�[�/q*��*dҕH+�h���o��V*�ʅ�8�����V��m�$�2��-H9��?���a�U�.��˝���v�S'�j�*	�I���jO$+��� kw��;osN���5��T?�T���]�,�e�Ó"�'���NX o	�$5c9�"�}�N@,\�H�oE�w���-�`�1�:�J�bΩ�tO�n�=-�uw.z��!+��P�L*G����������?t8!R�����l49%+9!���,�����C5��]&0<��)*�&VkM��(ѡ|Ҧa�ü���V=���F��Qy*��,%]��/�knj�X)����p0��gq�b������|�P��J���D�.v�GvkO�a��(A�N��0��E&o�!K+�ı���$7�SHq321�"I]e�㡻H`�%{4�ǔV���_��F�EͶ̇F�P��|]W���W�u�m򶘝����!��O�q��@c��Tt;\9zˉe6�&�E�q����ֿ񋿽����k����DV�9-cW>s�˸ѩ�B�������iq�v8�L�m�A��*�(Wwiq���6�~��vY�Fi:��ڧ����� 2R�+'V�����W��9�X{AS�8f�I��2$J�"��E*�E��帑_��7������k�+�\���n)��mȩ���R'�� �N���ɗ�""���K����	m7M���MI�.$���I�v��G���.d�Ս_W��8Y9'�'�_S����LN=sZXW�$�ɸ���p�)���>R8��P���&��)�8��U�p��rF|�a�d��;�WoN�ӣ���Ӑ�p�؛�v=o�ĭ��P�U~���=��Y���YU��25D��PP&Il�xQ9G&���䴣�?�7U:����7ė}��px�|���e����]98������jzw��;���+�0���~(	�f6�!O�	S:K+������D]B�a�����x����e1�&/i\m�Z4yq�9�E,��;<�ێރ��H�*� �P�j��/s�������}�8h�Be>U�b|<�ܴ��@nC1}SL�x�%����oG��ͅ[Z4��BYM{�1'��YG,J�k*1�D'2ڇNW�������ٗ��I����B��d�H�#�,�ʪnhk�N5�Z,q��s��=����<�OS��0��rPpm��d�w��T���' Μ%:)}r˭S�?͆��|]<N�.�"I��e��%���Rp�l\Ҋ!EëL�Undca�er��E�����f��q1��(�8�Нvʅ[Q��XK�\G,t����N��t��T7�t��e�c��U����뵯[e���DݨLZ��x&r�R.�����&@bk�_������ߧ�W "� ���M���B\�sN9#�8�(�\��/D��o��Y�e��I#��Ïc�{�����q�5�Vh�]�����1�#i�ls ��m���-���߃�Q3��(F�3T�%5A����[Ĳ/ƋdN�%�q����u�3`j	�Ȑœ9մ$��dD��1 ��`2{a�Cӹ�֣����1.��\ȩ~yu�!��}�#����B�ގ���kJ@�"��̊iZЍ�^F�u�m��p�v-���t�x��d��M+�M�>�К]ۖ��t6�%QS�����$_��������գͲ�=�Z�+�c�i��3�TU�S֢Q!�.^�>�_��Ĵe��C�#E<� ZϕЌ�_-/�ݢ�{i�R/�^�ls��c\D��j"�U&W��@LM��`6����#��7�w[�s0�6�"{�Jg_,9�hz�+��;��[��^{����v�s��U7���qN��u�� ymeU@�2��hr8�seh��@[S3�g�/�U�(	.%5�$�[h�����㇭�"1	����zU���/�K��)G��4�Uj_<�*�y�j�T^U")~�&�	M|���.�o��b�R�z���������R����[�܎��X^��P���yI�����ڟ�/u6i`�-��I?8CI��@Q�5,�b�`I�<._������G�������m�����B
��P�3Y�%��k��1*��L��d� \]q�V7�e��x�kD<�ӳn~>i_����������2��/̖���DFx�҂x�����mN�s�S��n���T����\ܮʙ�[�� �	���}Y����7č+�������痁NןW����͓�$�*�܋�TH\��j ʼ�t_��	1��d��������	�|A��f��pڝ�l��_���9(b���.�
��&GC��	����d�7��w�|KW���˻��?��ysӝ}���U��%o �Ph,R�Rf��i�kr6����~z��F���@�7���a�聵�fz��g'Y����z�����&X���)Ί��J�L�[<�w2�ﹾ9A>PI�� ͙���v;��Y-�I)�&�A�&˓�[�#�d��)����ڠCC���k�|7BRG�0��j���j�m�s8�����Ųmܷ{D�6u��۬F�Ii��
b��x�,eM����r��t�H��΋�V��͙\��QZG�����>��D�w�Ϩ�#3W��'��+�?��/���z��ϳ�\�<�1^#X4%�|]����
^�N �y�����(��+d���Eߚ�����KHy�������{[��!�\V�u쥺̑�T	�Â��d:;��-�"�èO*�y6��;�p|��Sw�Q������'�+M����Xؗ������LV9�K��������Y��3��dq��b��8 �T��2vDסw.q)x�������	H�P���]��]�1|E�v�ɼj��cʰ��hr�U0��tHW���������6-�=��D���Dmǹ{����w�v��*�)F���΋�LᲚ��J���ɛ���7�g�hvc�OLL!�)j�F�v�ug�B���>���z7^�_�\D�����&3�n��yE�X
o�Y� g5�ɻb:l��8����CiȇxT�/$�@N2ʇ�A!��
e�|g�S�,^RJ�и=Sv����ch{M{Y�:�JA��&�>)163&�2��N����
�� �DKf�A}�U�q���	��gѿ�Ӷ B  ��I<"p�#���j[e�=t�,3FEG8�˗u��Υ;�����l�Y@���Uq���[^ݓۯ5�'_��#���^u��bEc2]��Y)K��|Ŭ3��xcF#�==�kO6�(M��(û"*���E�s�� ���W�f�]�!E��")�>7` ������l1m?h<��<X�zH@�w2����h�T�{�i��G��]{
��u�>\�hp.��8��'��6����Hz�L+O����9�a�n{p:���4m�����`�r����p&�j�朦)�c9��f��4A']9�B/�;��4��"�l|��z�Mg���% >�s'�G�bD����|��SZ��o"�P%��JIgD�_k{��,-����6tò�Ï��?��=<��9��V�>����;x]� au����J'd�3J�ʔ�H���8��.�Tg����+�9��1�qZ{��O�t�|󷶩��P��b6[��l���Z�=$��7Uwܳ�DdMc�u&U�� [!�@�_�0R"
 B��to��K�mQ�z4����H���$�gƱ3�4M~1�jk��zw�����/=����=�v�"B��*N牚�`ՒeV�MV�U"y�;�?*�%"B����\E��^�P�������B�,����sx|h����<����B)�|+� @��p��*�^���m�Q"�ȓ����YU��)T��d�_s��R�Q���Z�^K�pU���G���$���P��d����+f���?��}����~@��;��D��4Z>�^����
�)��<�K���]./|}ެV�y�8����u;?x����M^������{�xF��1��܊䠘,�ߟ>8����vJ�v�$lN�`�	0����H��uO����y��6�.���_�"�򵨁Ր1y@�L �ܕy-���� ���ψ�zs��� �x'g�n~��nP���� '�6f���$��{'ON#4������:�v���\��w���l����j�3�" Ki�GP� ��ʻ(��m3���Oz��BH$��Ȣ[Â��IB�Î�]ǿ�NrS���dQ�$ϭ�*'�M�
E'4�!g3�K���Z�&\h2����"�{w��u���脂����a(΢0b�����Ɛ������}/.h�0Z���:�ڝ�� ��y�<@���>�����"��U��|g�(��R����ź�ÎI]��ED��t��ٛ��1�Aʯ6�,hUI��Ī��}�~��
���E�륀�Нf�����j���
�B�������PKmA�>E�n+K�]�ľ ���pLWm�9�K�tǿ���S��a?n��0���W���օQ�y�](w,�e�-��2��gT��Oo�W�C*[���Qꄆ�_�%J1P��MӮ�!�����U�溬1�_[)+�:wE��ՅA��&�u��䙘��;�1yq܂�e���P���<{��TW�r���?J*��K2�
U��$8N��|�O;8"Q�}�1��O�����Ɠ���C�-���^s&Mt ^��=��`��U���SZaWn7�!Q0� ����X��"�
�*�3��o��
�'r��t>{)X	T�fxV3P��?���\YO��W`d���=nF�Id��#00n�C?zh�KV_����vۧ��7֋�T^i�q��5�Ŗ{k��Ӊ����,?þ ��._,"�'PR���v硿2���������+�	�h�^��&�eT�E0�Gǔ�,��	�e����\�����j��vM��m}Y=ėvC��\�W�+(�Bp'�6�8��k�q�而F_NF���$�      �   �   x���1N1�z�*�+;�����4v⠑XVZvn�9�B�ri�o~��}ro�D,O6P�$SL�X�cy�x?��e9]�<����O#��z�ゥP�$ԖˢLB�RI�Ġauh��F-Ae�4+�j���eBMصK��k��z����*�+�ab���~a��C{:���ͺK���Lr󎻧� VW����҉�v��B��Lp,��[/��b���z��e��:l�ɿ.�.JV#��xX��I�G      �   �  x�m�ˮ����ͧ�r����l�}��H��d댄l����cǀ�A~?�y�|��q���o�u����R���';/zJ�b��ۗ��]H��%eU)=�a�"�����m[�����LR�j���yϭ��w�N�<1�!.r��ޘe��~:�Tm��5��1~@������F��{k�Y��م+����"�+��D�Z��a�� i>�i��j�����Ƈ�x{8��my~3~���t/@�j��z���+E���M�b�ݙ���X%Y�3����rY��-�d�d��M?�N��UjtA�]�l��|�g1���c���Wn���!�lo���L�.�~Q��2?�I{3�!��t&c�N�n=�TbPz-�+
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
,@��3����g�����{L�)DI8���U	 g��7����*�F�0�t�8��������0RC12q8�s��(o�7}5ɍXޣ��n����&5��P;,<��b傁�iH�K���u���5������{�t���q���W-)�MM������2���cv͌k�S&8�a�cP"�`WTIfg�~Iv�ð N��Bx���	~�c����_�~�?���ϟ����O}T��]��dɮ�f��C�;vE3����Z�a�ш+�]���)�3��5�|��I�>t����?����o��'�i	�'�E{��Z:)o�Ee��l:Mi���MZ�sQ)�x��(�Slk���sDe��dcl�(�Fd������bZ��}�ʜ�PT�r?�R��X�A����&G�m�L��3l[�MR�J��S?l�;�1p�����boƟ�8F���{90]mp :�)�uO(�nM���$f-P���lC3���B��Ǽ���E���;�#ճ(��s�M��:�u�2���Sf�<u�L�{�Ƥ{dǼMsJ�z�~��#�	�����I�֣�{Lh��['@v4��\��/Qa��R�Co�,��i@��4h��v�RvA�9�b����c��+�=E��Gn�}{zz����1      �   {   x�E�;�0E�zfl`���r&Ȓ1�JCٰ�%DnH�ޑ���2��o�_a�h/kV����-�H�<��*u �ԡ��>��g�<�GB U:;���y���3=}U���6g�}�"� U?#f      �   ~   x���� ���)xw�c�A41q�rMHZ��>�h�C�E��L�m���K�T����3)j��p;�`X�c.	��;�w{/?;'��$�k�K�G��j咁4i/�s���%0�?1n�_��#�         �   x�UͱqD1Eј�� �^��$p��_e;&|3���	c#X�^����Sày��Z�ـ����dZ�n/�#]з
��|􇿺a�9��[���
��M������}_��D]�Y��dL����L,���C�7Z�b;0fg��,kΊi��wUA֝�T��R�
��)mh����<����E3      �      x������ � �      �      x������ � �      �   ^   x�ȱ�0��La��> $Ag��@�A��6�G�A�N(-�����՜2��7!a� ���&�EN�?� ޖ����
�(a��<�E�,�YJ� �#�      �      x������ � �      �      x������ � �      �   a   x����0���˸� r�������S�I�97|y"x�YMai=��8���}C�
q���ѫ!J��ܪ��l�>�[	i6M����m?�      �   �   x�E�;�1��:��F$�)�s'����D��ʲ��QA�	Z8A�r��l{I���P��mvk��E����u�����*yù'|��-��܉2�6A!u��jY����P��W����l���<��r�V������J)}�1�      �      x��}�r\Ǖ�3�z��c&�_���L�Dr@ʗ���ʘ 9���~l���l�>�Bu��qtS X�2O�^{���3�8�\
�r#�7G�Z�������V��%x�T�L{'Y�R1�T�Ʀ&l;x��|/�������z~�����͗���o����o��n�z�����o�~{�yr���N�N�?���כW���@hq ~&��䌰z蓪1V�XQ�1mJf!�bj�K���ाK�/��z~M]Q��t�	k��Q���Ȏi�4��d&�sA�-�������zu}y:�|H�t�_~���ZP-�e�LkY�<�*��!�bZ�W��,��sa�+E�C͍��MK�bB��cϏmN��'9�UT�&�V��Cw��T�Rѵ���O��'5�Up&�*
���_U,�hY��W<����;���\�Y�Y���.^�hReY)W�����*t�w��O����X�63�c	��:�B�Tx�>	�锝�6�
�5%1����ü��'�V���	��17Y��\��9��<�����ߵ�:��B.���u���]�lB
g"�E�R��/����Umuv>=�W�~�gU栟�>4��b���n˪hs�՗�+�a��5��������[��.�}m��||���7/O6�_�yv�����/���u����vsǳ��pG�)}����M��ڋy�����Ͽ�勣�߿h0�r���ŷ�W�?��=�o���i���oNߝ^�/����@s���>��؇�9��p��0�0� ������1��w�G�ze�R��ȃ'קW�$��������=�w@a���;�g?~�yu��:q�����e��^^Q7e$���h��gtc�p�Pq���\cF�N��>^ӷ��<��۪�)J���Z5�C\��ܜի������զ��g1�u�������M;����������~N]5��U��U(���'��u�j�8�*?�K���"�F�ؗOO?��z�O����Y��Y)�rfVw�����g?^��p�=J?�|�<���x	�U�(��W�x�Ѿ}$������Cg ��ؾ:x���j�qh���t�E�.�-ʃo�_q��?�w�{�Q	q���O^�~�������5��	Tr�I�#�0r��ly����X��������""���u<�pZ/7_����s��H��� ��1��7ǿ{������5y���w�R�"՞�UGZ oJʱ����'o��������i�W �w�����#�b�j���#�=���cG��ЏW��^]a��Ga�LԞSE'�����-���_����OO��.����%~�(��I�:�'��P:5��i�s��Q����H �H���w��0��&ܝL��1���q�j�Y�AY� ڎݱ7�9�"ګ!�m��;874q�񧡋���=�I���4`�����
8��N��u�2�X�M��L|���ܯ&V�5��t���C��?�R���*Z^�q�tni���#��4JO�1��'8Z��)2~�X����C;� ���d�F�Q����H�C+��GA�۷o?�Tj>=��(AB��gs��!w�Qn�֝���^�?C�C���ls|~>���qB�����H{�":5�=J �{������oG�}���Ed-��Q���͑	�:h���bۇ��,�^���Gi}�O[��C�8~l��Qks+h�׏�������h��8�٫Ʌz��w|��5��C(����7�9��e�'ej�M��&�>��n���1��V#�Ɠ���6f� �(�xw_7g�!aT�"��BL � ����l�㣫���g?�pqIN�V�����/9Iw������s��e���� ml��qՉ���O?\��Д�=�?���0Zv�-�!��x���yy?.�ѷ�η}��9~[���y�|E=�s݌3������	Q� ����G���9��lB��>Ҙ����Y� [�A6۾ޚ7�;oV�Y�tnT�Lj�3n�dZ�¢�-Q�|�)��?mEzh�S�r�U�M���T+���#�MJ��i��l��6r]��|ӏ����i4P���L*��3�Ǚ5K%zVw�����OO�o~����/�!��/�7Ϟ����o^~�������� _�i)�h���Φ�,$�X�]p���K� �h9A"����>��+AY�3�8Lo�´Ҝ4�߁�#�i�uL]�%&s�����Z0�r�2���^�qu��c�&l����b.�AyўeV�y�x�<��� ��7l���F3.!C=\���t����/�(c)���"�ܰVr�!�����)���Ys�����!ɿ��.m��[M@�!.��]��
mʂG-9k�������\�j|(M������s��##��%������ֵ� �P2�9L�V��4L1X�rӭ��c���a]��Y�{���٫�'od��S�q�w�H�8����F,��������#;x�����}�;G^�@����Q�#��V/������������v���ճ'����0�+������/�dG`��!����O�~�����܈ptv�� ��567A-��|�����i����ׄru}���u���v��v֏����>���!��d���0�� �3��/�q0#���W�ç��c���^\V���L���}��=�����˼����b����3�<���Y�O�6�ƫ�����rX4���Ό_�T�W��݇-�2{W�y{@��G�~w�(��m/�����i�$�����ԉ{���x�����ǿ{�>w�~��27 M�g7�ٹ�9_�6���2Qvq���_ȟ�B�~�&�{�䷘=��-�\ڥݱ���
�g`�^Y���u8"�=5���|�z�[�C��׮���B��C��y�8��|���PG�)�"�.��A�muh%̶-Cm=dA�jZ�ܶ�!���9�_�-in���ۅ����69�#lt�:���4p}:�5�]�ޡ"~��~yw:�Y¼��Q
駕H���;mLri��tH�����S����R�-�%��"���X��HD�Ԙ��>���V:L�"7��?��cT��1�Ӏ�6�>�����e��J+��W���x}��!�t[4A��Y������^ϫ���-(� ��dP�0�֗�o�:�R|~>>��ͳ�o6/.>nn�4W�g�?������.E����q�N�4������\��B�ڍ1Btئ�l����	�����yw��)%�h|��o�\V<*8me3�
���Fth���vD�{���m���B�!:lQ`˄;�ea��
�9��Dt����v�r1��;ѻ��P���h��ݐ^��\S}�f�a�RHv(��уp����ٓo�*����1a�|)oy7�!�
�����Ec�7�_ovPv'Evx�����F���΅�B�-�$��;ܲC�A0���rk�;��q#
������w$��>�D�l��Evؠ���ݰ-o9ٱ}��mK쀲^aw�1}m�����òW`x�l��jg���~��U��mTu袝6~.5�FoW��|����s�������e�)1��yu��o�:�1b�G�0o~s̞ -�n�U����{��f*97���.b�7���*!�[��!�Q�\�b��k؏��Sq{Z:�2`z�k�w;�T~���1��y�o��K��7�������vGp���>R�PY��� Ŕ�`�.2-�a^FÌ�5ڪ�o�����{�1g<զJ��I�SL7�X��3����V绘{t�0%�M⺦\<��8�c-,*:^�)�:#|���ǘ	��aFt�4n�oH���j�|�����{�=�L�z����b\`E��Y҆3�,��eӢ���G�	��`�����Y"���UR��w1�x4a:>�i����Y�m��\�̥h�MF���B�Qg�cl����Y�̕��3�Fz֊����Jٛ�=M�>�[���P����ᔰ�T�`���+N�c�1h�&L�6�]���Wٲjxl2�h��uh    ������\Z�i��i�<z�"+.�f����;��C�-�
��9sC��R,%G��	��2�t�C#Ok	C�h*Fd��c��Bc�k�l(�e�[n{�y5a�
&�'eE�kU0�Ya��T#Ns�C#?ӈ'̼��M�æ1gt�	Y�O)��w�����	y��|�QL-��+0�Q�F���O��0`>�I�=
�?���q��f�b5��@�G9f:�+OA1+[y������vjA��]W��u��������D��{��i�T�'OYgkV�8��V3��8��1���UR�`Ђ�A �����Ed}������7_a��=޼zu�N����M+�ƳE)􏃉�cT����lS�<U/b=x��ų����k��'�͇N����J��J�^�!�]cfH˸R%���7�07��ܩR�ݤQjx�����Y�Q0G���7�����8��ɫͷ�'/�|j��ӪU���&�y`FPQK�MXR6&"�����ų�׿zy���'y���v�^ɑD���aZ�4��2�W�U�-���w���/�������w�_�<�?��Ӄ0׿�Ҹ�Ӌ�"��oPP�r�e�?xu��7Ϟ��l�}�	>c�z�e-&��@��,&����@� �[�_~w�������'o^���S7���4�
^?W8��Dt�����A��g�'ˋƎ�NG�c��*�Ȕ$T���Lֈ(��w�Ϫ���86m���PNBE ��c3�Ty�����s��Qʚ��t��	��G�Y�в0=O~���;Ǆ��C���W�}�y���7ϟ<{���9MGŬ3x�!���v�Uւ��sɲd��:Oم� x�M���$p���Fpϧr�ܬ�>(Vu��(
�K�rXQ�!��{~kS�jʭ�3�I	���+P����9�̻�{~iW[p2*�*0���p��k6Bg���s9����@��5��<�<]@Q��S����*���u� 7R@�*(�l�i�� �<8���j)��&�f���Ԍ��&T�B�i0��#��d�p���	���-�&�r�(�cDH�{q����,k{��#v�Sǝֶe'�teD(��ZR�9�֤�0>{���|����b`h��u��Fd����b�:��V:�rz�|�?�'x�f`��Ա�FC��y@Z}o3��c��0X+�E��׊ɎM�0+Ykd�RPMloB|���������b��4��ā%a<!=�di)v�o�8i5��a:$Ѳ2�t:4��� ')�-�)���d����pv��[���<�j>x3��?�&��%��\#gFj_[)�T��U�OM�&�!�|�R�f4s�ڌjU���g�@���WM�ݶM�m9�]6_`k�
b���S���h�v|�=�g;M����DF���q�1)��l��/ڸ���*�V��o�X��l����CI4�w 2�-�&Ih�x߁��d�I�jaJp��S�R���ü��+����<r5�C�x�ʕ�gl)�O�4�FF��|����lu�I�F��CI��f=�3yl�r�жE�m��#�M��$��Rh�19�t�qr�IԐ#���kXr	�͸	7�<2;�������B����y[���F��5a��2|Ktu�n!B� 6
V�I�XV�����ɩI����0�h+��%��̹&���֋Fo��xd���GZCj��s*��}u+��0^nMK�\�5�H��ƿBv#U�n�����x)ݸ1�DT�fZ:!�2x�5en�-����w/͘64�t���z*]�'!�ի����
z����q��q��� ě3KI�;�6UDwl$��62<A7,��
�Z�U1�LwR�r=\I�!�f,A���īdMV�I>с�H�-�	��W�y�+�ik%�`4gU��5H+�F�@���"wsP���W��7�t���<Z��Ѕ�R��0D����q��<z�����/X���*R,%�Tg}�;�Un��V�[�9hp 1)�X���d]&�2@�*??A)Z48�j!��"�J1kd�<DH�|�t��<�$�j������Snw�V���ܯ7�!�Vc1u%_��-;���v��!��2F�N��<|�.:��V�pu�#��LuU]x�!1���"�3�� ����J�����%:�̿���Sl����a��t��q�0�pt|��_�g���{l��b�T�Ԗ�����	&:�5R}���W�'��S���%B:�,C�:�x����qE�WF�0,r��[c�W����� u��9> m��T�Vӕx�B9DH�{A����):��|�2j�la.ʬC���4��dy�~p��C]+������R@G�"Aa�Y����í+��NG��n A6�O��l
�%�_���@�_�,��Zk���Ta#ڵj��i��N��.-�y����]vXk��SU�b�g9��)�V������Mː�Rv8m���*-����F.!4%m<&HmWW�Jv8��\*|�B� �N#�U��v�6$������!��a,-	A���:�5� Eci���Pl5��u����~��.$"HGm�jKw3g��,UB�
U���u��<z^J��\�P4ICi�dO�࡮�w���Ɂ��h�`Ab�
/�e�B�M׬;�w~�uEW� 	�s�L'@�0�<��y^L��x�����-�k�1[��Bˈ#F����Rv8��,(Z�ڸgJyK�f#W�K%Ԃ���媎C�j��Ej�@�%��"-����a�!����:��f:�]`U�<Y��� h�M��Aczl���Q�{�G�P�B�-�9HVxK��U�J*���l���Jա�G���A�7�KHs5�P���I��fU������N�":��&ȬJ������\d@؇�P�Ї���0ր�2S���� ���t8����TJ�yEV"AG(QT��0*��s6'�r��>Ouh��#sr���Y32�"X����6fJ1��th�X�i%���l��ܵE��xct�G��k��ꠧ��r0�
	�M;+H�8*Y���M�l�^�M�!.��'���f�$H�h&|�<�d��e��;�œ�����,MEw��J9z)@*��OW�y	��#au������P�"3FZ��p{��Ūh�ө���o�N�T�`�ZC���I��5يu+JJ/�Wp1��� 1���^o*|�����K����m�e�
>/d�T�ʜA�S�����H!fY�C�ۥ^f6�ԝ���j�9����H�H��(�����ˬ|L\�zL�œ~�z,m�%ZqFj]rZ��eNC�^	�A�F(*wk�:�`C%�	^՛���Lj:#;�iL�� ���S�["% YMT��P_�=KWf��B��Q����TP�jX�c��d�&����7ˬB�q�5eO��\"�Pp/ғJ+�����x! ,�M��dq<��Dg�d�D��ы{d�Yf�����<	�qTO��
V�Q��\�vE������/D��Yu*��W<�:m�z��!����R4�^�	sI�o> ���+e��k�2RK<�r�{�%G��&��-�������S:���,B�6���
��_q��l9Vh� ,$�z5M��)�p?�b�|e��tx_8��%h>�1FVo�;T��i��)���Bc�n���kh�q�9y�b("4��D|6e�f���Ċ���N'��-&���c��K��4�E�`�:�ô�B�����L�H��hx�ZZ|�e{�C���{��C\zJ��b�Z]I�����wO�P��4�֞��\5��%� X��5:��h��f3⩅�I)��Um��Jϴv��TR���b&�V�2zFO�;�VӥD�֊���a�6����a�����Jfm;�V.���%�┖��q��<����l\!�퐚�GR��ER�E.i] r�䘯�v�Za�J��Zkn�c.0%�̚C�x�♥�"��F���uZk9]��8�[Mײ�L	zX�U�PS(��X ס��u`l^�H�Zz��O ��    ��T7�"V�}\��TI6V�{/s��O���1�r�/Cz���������^���+2!c�,B�ˀ����0Uѥ�3�b#��ŢMHfUb��7��PdI&F�$��/u�\���i�5�������(��@k��d9"C][�t�9�;](���(�������++ɮ�\����Hp3W�S�M�_�j��4����v�k�t�'j�D:Hf�P��75�N詴 I��U\��ӊXT�
1��*�|�}��Y&��
>?�[����ضT<B�J�F:�7`5���$�Fv�f}��vj�W$w92�H;��
�-5rh�Jg��p|��1]m
�@P��xb��� ��FP�qw֖
��B���PK�E��*:�B7��"{(ru�i�m����SPZ��(�"�#�p:�/�L�ߩ	'�k�C,5ix��M�i,����CR%ʨ�ʾ�R�� ���E�p�?�F�4��������Tk64a�T��io�Љ7�B�!�o�`����,�~�G8�>�T�2I۰��!��(���<���{��\�	��B^��f;<����
���l�Z��TP6��Ƴ-�F$��J{P�Ux_�O'Y�����~I�\���<�`��'��{65�凃1Ad*Yx[��\��=�X�Ht>�Q^�s�Pj�X�SE�VjeW|�^��r�q�-�j�aJI紋��!a��(Ɔ�:K�T364!��`R�J&ӱ"���iTj�'�q6[֦���0�C4������9�G�0&3.����,��.�R�� �ly�����1`���Y=#�qAx���T16�{5�k��k��@���j�����*Rn���2w���	%�s`�¨�m��5X�TE"����\����ME��PMH��&�gx�K1�T66�+?.N�N�tD��B9.����͑^yX��
�2wx3N�o.A��*Zw��@�X��yLn�m�*J-��M��	|VP�Z��
	�_>�S]�ݠ���������)ZDt�d*U-���R��+Ƨ��7P�T6F�t�YM�S�t��F+�G>���!8����Z*��d= ?���%R��h��a�K@XA���z���@76O�4ޘYipt��.TϞ�`�Z��K5Jc9ݒ��`l�n��0S"���@`���Z*�D��R��4���*�WI�aA"E���j�Vl����K����c�XK~A�ڄ@�4�4]Iv�;�T*6���~M�L����H\���T�d$�x���ݎZ�#x9{5o��,�AF.L0P�'-� l�eD�~��Z�क़nε��{�W�D�*��'�esH�����T+6���}Ȏ�͖3�{$|�.��FVW3��~�;��zjc��q���
1]O����dSKub���%q^T8�O��YLε��4����R�� ?�M/-mע�
Ţ�%�H;�U
�d��Wz�!-�(x\r�:�0zJ�)�B;�2sh� b��wH�7�i'�[:�ע������jyj�W��R�~�.J�x�(:1m�v��\TI0Sn���/�����v�x�u`�$O��t�̇�]�A�+�j�Tlh�Ώ�*� @�mP��B�#���Ye^q�K�b���s��F�Z��u8D�`M����S�����;���^�q����ҳ����s��#/YY7QKeb#���E�+:j�L�t�<*�����&$�ZIp�R�� �>�5�I�
6��+�i��!4���I/����sڐK�ģ�q��GU��^G:�W�_����Gzh�Hwe$Mo�T���bj ��T���3 WF��<u�b����6�SFąd�x���J���)�tB��R����)��-/J1^���E�s?+WKUb���mIV �u�!F��=�+58��u���Z��0Sfh��� :�i�)+t�H����z*P\y��(G_l#�4���Ba�"����B��d�6@V�0^�������e$�K*x3�NGV䆥(�r�A-�:��4^O�_]��{T��0�"��dm������R�� /'�Y���u�w�7Pb�m3)Ԧy�+i�R�� �gx+�X�hi�m�\#
*���!!Ů8�"�ު�}FVg�kVL6ZR�tAKpC�t�Ð\�d��"�ޅqA�*�h�V��+��"��50�!�g���!�a��V��PmiۓVurv�jI���������+xM)���r� +4�B�v�K��,���6j�Jl�����\z�	yi��[K<��	���[2��*���q����R�1E��h	
r�T%_W���*�~Z���D���a{-z��P4J���\�
z��~NM�<c.���F�JG�e�F���`�T$6��ivMɤXS���).s��|���D��m�T$6�=�39s�Td*�a7������"k����O`��:���yj2�H��7���?p$�����j�F��=1g�X�Z<�o΁&"EA[	t,���bS*���,�(:~���Q-nt����#�T4:�M���U��ӗ��x5�^И*̊|����X,���Q����]*��tS����ot��V5t��j�����B�ޅ�OCﭢ�z%���ʌ�Aʝ��]t+�҇0�(pQ�K�T�F��-�m�#�	
�}�%ֻC���z��g�Pa+-5y��s��.�i�r�*ņ&�	*��,���i�X+2���{OK�&��.;z�\�{�4-�#��^�ku�W\��j�~.0t���Z��hHJ�H���(����AZ�75�Ƴf��:8m�"����Z:w�r%r/����B��u�4ڀ.���4K:$&Z*P!Q{��(����y񀪡R�F�Ȅ$�TS�0h�.�,�����R�� ?�,���(�JGwjd�a��>i�)�i���
�x=�j�Ȕ��}�5�х}t�y�y��D`�7�Lo�7���̖��2�o��ۦ��z�Z*���� B"Z��] ���F莆6�W��C`fv!�s�.���K�2L���p2U}�x�TFM�Y���hcĲB)����BZF:�m�~��Z���d�t�!I�mvj�+S~*	JVZKꟁWK�a���靂H��*�a��
�q���hqjeuk�2l����OE�襒Z"��(HIe<r�XW����x'ƫ7t.�70;T�*S�/�4����=ӻT64��X�s�BJ&�v;��Ie:���D���֪�갡�0.����J��<��B�X\�*�Vv���^�Q��$���yCw�j:��B,�$ݾ�4��X͙��M�1�tӱ���(�'lq!K��]SAK�a��c�ݚ��KD�<߭�$�P��T�u�'�Y*���a��*�ْ����BG�m+B���J��Z*����j�N"���vj���ƕ �T$F�9�!`s!Z��A�����%�5�N[�P��P�SNHo]�F�3B>樑�V����V<���x5U j �ccyH�PrN%��ت��>�� -U��zJ�����>:i����8Ig0E.�i���.�{��f��n8(T�I�zF��(H���U���݋il8<����)��R��WC�\��-��m� �6S�`B@,taU�b�[�����X�xçw��ḑ3�{E�͒��r����%��--Vz�UM-'��P����Y�/�4�jW��b�����
ޟg����`��PU�#�L�+��L-Vy���ÈZ������!�t�#��R�!ݣ�+��	7���穆����|�|�[W��֖vB�{/V�Q�~��U�r:_�	'�Ⳅt��Bz8�nы7���X��z1��+�K6zz��y#P�N�'[��o�e�j�����U4����KI�%H��x�>)����U�X	F�[�U�T���D�	��jT�5l\�V�\	�U`?��JxUY=\&H7[G�?��i�
\��a���;�h� ��JS0��1����)@'����b)��Ɂ����z�3m�ddɉ�f� �!_Y�Y,#�99�+P�a3��_���	CK#θ~��Z, �  �vQ�_T=�>�&�*�Ƞ�"��Wj�#[K��	%��aɈ$�n�1׿b�(�QY)�#���a�֋ub�6���:"��Rj�9C�5YG�_�-I�0�k����:1�7Sj+�E�	Z�^Ҁ�����q<o?�Ջ5b����8�S��cJx��;� �Aۛ(T�6f��qmr�b�51׉A/)����V�t�4��R%�uj�M/։9�-C�O��h$Y��CW�BJ`ދ�����l/���>�{a��˭8mf��H�Sm�X�b��+9.�HG7�G��h���������WE�G����=�Ҙ5J:'�UE�.�2�����/6�b�n�7�W(`�h��x�Kt�	�T[��B�V/�9�Na��|82�[��LAɹ>�b�^`>�dL��:�%�_)��"��������b��i�[�R���@=�bI�����oH��i�XH��e�ە��6T�SyrJ��lab!�֊Q+��XHF����^E�Qt8"5�TJd5r$���r!�^,$sé}>��-Y3��Ɣ"S̴�
��謌x�G_�2�������G]�k`�p!X���$)���b�51�DQ,��̍���_|��Rt)E���/u��J3G��h�"��h3�������dh�Yl�<�U�]�ef1Ͻ��K�#�;z����Bm6�V�_�+�~�kBfZLDz'i֢�D��+mg �����z�Ҍ৭D�Ka�p77�#��գ�_��ы�d�>3��91��4T~�J��j� D���+�Vor�4�@(	cLf<��}���T���m?�׋�b��y/�*X�RK&�h�b�w�e��)*���r1�Gz6$��B���|����(la��#dK���X.F�sI�bif���A��dJ:��m�CZ�&���/��IzC�V���~3�l"�-���\�X.F�����Tr% Ƙ@�����T�.�F�����+��/s<@�O����6�O@Z�x���P�Fߣ�������<�Q�����`tI�@E8MՂ�}�+�{�Ų��MAS]�A(*8�^J�?μ�։DoIX�ɋ%a�[(�+ 	�@R��r�߈�$7r�A^��Œ0z�ɴ�E���ST������6���hE�r'�^�^(3����t�[�,�Sm���G�SkR�/�Ӌ%aËc��nh���a�+���a�t���ݱщ���t����{������|�7�S�Gf���*��̯�w��COKp1�	�ڛtT���4gT"�Rx�7z�^�ѡ�iڅ����eJ��F��k^�D�u��N/����c��y�H�\-���M{	!G�F;����x׻%ca#5��L��k��������כ����߃k	Q���_�?���k��h��/��\��?|q�?/�_��������7gq�4^�/�����e���e?�ş��?��ջegse8���f,�C�H]<�ח����=��z�s���o[��x��F�#��p�]��������(�2>��? �}mE���+��}3�@����t^)�k �=��w�����S��E���&�M��z�	����G\�YЩ�T܏��e���ö[l��GB�k�`ajt�����h����=LS	qo!n�w�)�7�^�Ѩ�Y��y4�p�s$-#�V����,`[�5C�@`�������Ϯ~��H��r����p��H8t�N��jd�-��-	�T�8}�������F�:�	���'ѷqh�ȸC���:]|~s�[Zq{�􀏛;V��j���϶&������w��ͫ����W����Ç���@$���e[��Z��߿Ͷ@Kz�o*��܇����y����nOoqP��yTj��ӛ��~���ˏ��a|��u��v}�	w� �!U�谂���߅�����j�����t��U	ơ�Tnƀ�?��Gc��z���2JNo�,4u̀x���x�|�o�B@z��.���oI�CɃ�n��-�� E�a���ӭ+r�ܧoۻߖ���i��:��6wM�+~����	�}���f)PC!+ם�Uivv�����W�2~�s�5�N��D� '��&��$�h�:7^'>���ߞ�oO�CG�������^*�$��N��y�w'/�>�������_?���o�Ym�ވ��:�"�Њ��
�R�BKHzZ�Dډ$��Z>O7���d}v��>�#�k������7z���(� ��_}�����QLq$C��0i�g���Sdl��$'�=�����z��*%h��'=�<�
�����S�W�襣�R���ٔ���><�8��|��_ _���D�X��7H�.��Y��cy�BP�=������=�������N3��J��
���Ṣ؎�����J��sz���o�Żw�2/y��	�����E��~�=���!�۔�?�p��1L���؜��7?`���z���vqڟn��wK"���	9�GJ�����r��薫�6�)��_�W�8�pqzy��:V���?�t�Vr������Gx��*��_�xv�㒳�V����'(~sz��#�}�z�1�����H��ɿ���}��{��m�Q��58;����|����~��؜��\�=t�r�E;�᏷%^�C��3\������G��Mc~�1Ϲ���榱p�1xMٕ�c��[���~���ïn�R��X^nI��uyu}�~��,qk\�m���E��]�����~K�c��Vx=]����Տ����c���r�KZ@� g�>���w))-Ep�`��m	�j�w�&%sNPNt���]�@��1YC�y��$D�S���1�XDy{��wV�[л�A֋�n�������>�/<��rҏ�6�7?��{��G�!+����������7�}���7�.Q��t�j�O���]�(A�G�K��� �2�o�7q����v�@S	��S�}/�~��'���]��hV�qCJ�E�����;��������~����Fc      �   �  x�u�K�� ���0S�<�2�
F����G&q�{�l}z���¸�G茱�;(a�r����)B� �D��a���R,�V��ր��X����}�e��0������`�K�-抃O�)K�ܭN�a��H�&S��f�a�
<�석s�oԗ;H�'�8WE侅sJ-�CC�M(� ��u�&�~��A��-��5��|L%�(`�aa�؍sT����B�a
>^A���&>�����x5�����EW]�����ǆ���!�N���NPZ�A�����鶨�ɕ�t�e�%�;t�
^)����뷉�_a�R��� ��W�#��w܂*lwzB�EO��i/+h���(����Ə��m�����fx/g��j�m<�f쿲��n<��J���/�e:��0Ч7�d�	�~�(�Aߎ(?�<!_[�>
X��ߌ�l�����uӽp_�|����?d��      �   6  x��W�n�8}�|E�k�����O�F;c+���/%_���bQ�ڞC�<:��p��P�!|\�� � ߴMh������-��R�RPa�%	����^#�suDС:�[��3�D��b�ח�9�K�ǟ�����BH�$#Zm��9��G��`=)w�h�+e����K�?,�*��Si̡�O��r�B
g�F��S�Jq������Ҵ�!Z΁@�������t��X��t�'1`1q��A+�|uM���s�⏯]s�2�r9��~� ��L��/��.�.�1zʋQ��Ρ����/�0Ĝ"����
��Krᢉ�6�oH�i4YO�����RB�5�W�Ze!��¡��j����v�o�ƂK,fa�\�_��_
�*�c��I g�؅�L��W��T��� ��z���z����h>�[��nu��i9����>��[TVNI!�T &����]�A��|h*.	�oW.Q��}��c�ɽ�0�[N�p{���ֱt�ƻ��0�S�v�(i�S��Є�^Ƙ؋�W̜���{��[�����b�[3��!T��7b0Z$u�ͽz�{�.ת���&|d_���J.����%��;=eNb�7�ư(hs��@Iǂ�V�"X��w45�>��U{�����i����XN�$���m�"�����[�(�F)�g���pR�{>��׺ߥ1ڐ�!W�9��n��n|��/�V��x�bP�[�͟�W��"�}������P�����.=�p��D�(�=馑]�l )��v��n�e��ʖ��Z5�;�V,܇�
38c�QHɺ�?.r
���:ԧ{�*��E(J+�\���U�]��[JW 91��l}A�=T��=�)Ơ|[ �����Ug0ǔ3�|�V�P�g�@6)U��D�m��f�Ov;����-*�W(�&�H������ɒ�vh�N���� �9r�P�.���g`�+��&��S=�L�D.�ǃ��Msv�s�O���Օ�t�$� *��'�Q6�:�1p5��Wm�����{^��I�R�x���IjU!�>���~o���	"�D�J�����!l͐��h�"]{E��Ԅ�'$Àb��)�0$������
���&�n<�ʂfC���cG�2pڎ�Ж�J���=^XAgN��C�'�=�ij��,`g����*�1l'��C��&4��dǁ�lƠ�xS9���.J��It�e`�l�(�D�EFa�'����X�%�>�h�J�H�Ր1ػ$R-y�}i/�=r����K �H�PIN3F�?-���O	���)_P��1�7�-���a��V�/ZyO�jߪ񑼅b�1�g�L:�*��,:�%W
xB�$~Oe�ص���Nunڷ]����6y:� }��+>q�A��Ni*��1��3�S=��{���j@���`�o����w���0/�ܕɧx��J���	���i`��UmX7L�����W���"1@��,Ե��gs\IT�XT"B���u1�IC�����Y���<4Q�x�L�0�U�3�ML=�&�"X��Xy���w�u����8�Y���O��Ǐ�|��      �     x����n�@ ���z=�`f���ŶH�E�R�	Q���3�W�v��&{M�+x�Eë�(X\w5U}I)���ng�T\��i���b��s��$�];��6��}���6;mAk�b����-;����A^�/����ڣ�2�����$��9|�s�MG������&��{ŧ��))oC�{�k�b+���쎥��ޱ�M���Ί�YD��b�I%���ݫ+�A�,/Φ=��0��տ�0A2�(���!�C A���д�0�" 	�� ���Add,R�~5�w)�i۳8��I���z��[��-�B�oh7ʲs�h���.N��1ݽk��?"�,�}!�`�D�
�x+�G�fi��%+�X((K���'=����zX����-x��: ��_�ol�̀{�Ϯ3w���i �Cb���ab���N(S�2r��"�:l �(�"���G��DY��c�L�/E̛�,��4���(WA~0U6�|�2�n麅�;�����t2�|�?{�      �      x�3�L�H�-�I�K��Efs��qqq �<	�      �   v   x�}��! �3SC~�]�&e�`���fK�:hL+0�����5��m��׋��)��4�ȱ�S�47m�~�4�٫%0h�i�P�g�D�%����������4:�H��+ �t0q         �  x��V�n�6]�_qw٨��dR��.�Ӣ��fCSW������j����K;����X�lQ�yι�n���خ����ӵ�6US~�MՕ�I�	W�m%���fs�)��g���s�t�t7�<�D���]�6S��WJ�511����U.�U��0�h��8��`"��jϤ&��8Fج�l�/SĤ\�BK-��W3p0��1$�Hʹ��͇���K�eG'�`��< �<�P��G�D|�,��t�p
�AYT$�5���r���t��h�?{��Β�Rh5��P	\r���6��\�i�\ӠP|���U�Z5&@��%��r@I�H�:U.j�u���w�]FZ�=r�5�Y�E�Ab�~�V�T]���mC������|�u���{NAE0zL(,
r�4��(�����5�6GQ� ���
�h�4n�DJ-H�#�T���+�<\����/�E��q�W��ay�V�'y��H|��wy����cu��#�y']�ǟ	�*�>�w���_K���Q�������� ��M�yX���y���c2���9��3$����i7��}��*�_��X�֐G�ԋ��&�ԫI��u�ے�h�������7c�u�Q�ȼ&�cb�`�ғm����Z�0��?O"0k�}�3����Ȭ���������)�=��Ǜ6�b��`�+���&JB �z��U��rћ���OiW��i��	[�/�ڳ| �G�;!ցFh��<�J�����8Ԥ��!Ȉ1�Q�Y���t�cf%Ng�6L�9��@&	�E��BbI�~�m�E�x���T�dR��tيf�-E��Ӳ%��P�z8U��#�Bf�����wvh_y[��<��f�b��l�C*�}�~WA�`н

7��$�OJ�e@�����|Q��7�������j�F�a�      �      x������ � �            x������ � �      �      x�m�K�$���ǥ�Ľ|?�=���	�+h3m�?�`d摕I)�S��� 	8�0��~�ԮVø����a�k���Z=�X���������Gg��L���������c��:b[��}�+�1��}��4����4�������U��WX�\-EWSYk9��m�z�Gl������V��8�M�W�v]�5wF���n�mk��r��X��_����b���mkI�Y��ú��ri�;{����uW��\v��%�vۊ1w�L����
�׫�ޮh�4���[?��}��d˚���C=�qYW`q��}�`r>��m���|0�W��
-���ݮ���`v�y[��>������b1k�+/���2e��	ѳg��n[yekkKW++�n\m�v���}L?ͱ��-�+���f�a^֮r��W����U9�Rg菭��\��}��=�Փ�8�)��|}�0���e�����=�b�y.�B�0W�m]�TNn����a�|�ڮY+�/!��<�L�5c�v�c+����>�Jln���=GҼ:�v5�������m˦�����c��|��6dz%/l�?�<����&t=i�ld�?	ku�R����V+�d��&B���X�v�/x�t��c��ч 3��}6�Ny���U'<�WI~�75��kk���-�d�5g��/��o뱔��	u�� sх/�wa�F���n9����i)�==�Q�Hc�ga��n��	��e{ǘ��Za�%�5ΉR����o4o��ۓ��F���I���{�Yk���ܚ�i΍'�p�ӵf�6�N4����yl���>�j|#�@W�$H-q�o.�0�{����f�"�X?��jn�Yӧ9�lA+�!��=0��ٸ�O�
��.�+ӗ�\�s<��#�s�ĥ�k����ۮ�y̂����C�ϟ�b��~	1�۫�P��8G+��*Da����xQ��Ȝ��X��oV9l��-��m�9O!G�� R˰��K!m{�J��b��ϯ3��疍sCrl�6�� m�� �14N�2F	��75-�vz�q�Y`1�ͮ[��R�,1�c��/ݶ8���Ulv��-�(Ȇ����j�U�|��Ӈ�g�e]���+��@��p=�0�1t�|���S-+xLtΜI�%gç����,� �`=H��S"qb��7p�L7o���|la�8"A�wo������Ap GL�sj����✊�M���4��j��9�ǖ#��9���ul��KdA����d�>�[[�1�I͆#�ٶk�8"����?[?���-������ä܌�bX�"6/<X�ʹ~�9=���P]�4�T8��dG�9�8�#����-��#e�"3�$@��d��a?�<����#�6{�ޑa�Jl��	fG0;�k��! 4W��\�BKPD���|)H�����*��#`��d{����� �#�]��-oM�*�=H
z�W��0�R>~�T�}�ɣB$l��ϴ.�J3p������rle��� ��[v���B�%�XgI� �!`"���=���.@�J�-�$�=�f��-'[� ��!o�%�A#k����)<�7��Λf���s�f�V�z��,����'3�4� �hE۰U�}�chԀ8�?�3M#�	�&�'%��:��&��T��ʱE&�$�s��l�S��n�?�u\�m��M����d��Ǆϋ'F8[�=^[� W��H�{�H^��xy��Cw��5�r��=@ϯv0"��P �v�+)y{������q��N�VM��x���e�it`r��f|8�*�Z5g6�w�n S���ƏT�)��g9������X^����7�'�"�@��C������w������F}m�l�F̄ʃ���5����9�g]���/ 8���m������6L��7���缢�!�/�{�;y�d?j�.�[L���z�?M|5��#�K�U�88��pC\ʿ~8Wť̸V�p��7��rJ-ͺm��ĕ8؞�l�#~6$�P�\����pC4��Q�؉kv�}���b0H�r��p|�+��6L6�|�]���Hyr��_�=7|���ʽ��<1���
3�E��^���r� ���
��ү]�޾7g��� ���Cb��9�n� BKD�Y,�HM�ν-�l<zς�\q^�h`�ۯ�'�����p���Aj�]����:�����;���c?lԷ�#�������T�!�����I*����r�/�@��<�Y ��P�<�?��L���g��.�\����I8/?F�����`��c�}l�2	��\"��HG�V��I�>���=��0�����B�e��I*��k�.xa�{�A�U��s�I��*�YW�(^�B£�?�.^Jt�#y�y�#�c�����t�����R*b�,�L�B�t��o�إ��x�  ��~���_1��> �[��V$��T�<�*�pP|��3C��qH�Tvc]֕�d	���w{I��a�Z@ 8B8����]b��
�ͽ(6�(�k-�<�y�k�u�����>jb&*��Z2�c��ت?>��4k-�N�a]�T*��;K�}l��R�9YO����_^�̚-J	�ul!=�e��h.��H��+P�W�_�J��||�ى�K��v���6
"��7韤�<�M,�-90�J���G�ɑ�ݰs��~�.ʥd� Y\9�9��^?7B9�~���A8pc*���� ���:���O,�e����<^e�v�ԑ��]�����e�����8��?��.�D��� �g]��>�rX�yURz#�-�Nz��܈�k���C[��3�ʒ�2�"!,�-d1>�y��ʛ�Ju���A��-���.�����؂�}|�����h�ri�<nr�q0HT�� ľ��BAo�\�x H�2�y{;�h��ay�<��xh@��o����p��=R_���C�#@k�[��+IU�Z�h*���|7�����Q��0�(+�4�Z!Cc��U
*��TS`��� n@� �M��{2���u�1[�'�F�c)Alt#�eY�{S�_��:ˏ�^��O_��@�1<�.䮃$����-�'H�GG��	��U6N��IN1�脹�tD� Ia< �$p8����ZSqӦ��ӯ��HU�<	��RjT �)y4�F<X{j�n�)k�[��e�SQi��c8�����F�!7~�a*��`� A�[ұ_�6�ϗ����RC��1`A�mC�q�=/p#���Ɏ��lv�˅��J�D|y�	��#���b.��l�#$�)�0���3[�F�[�Be-��D���1�ж� sx����y��ܻ��뺓�xh�`'�;�zl%�5ܰ�B���4�����H�-�I�Y�)��9���p���������+�纁-ĳ�	�H7�Q%�+*k^@�3�]F��buV�r��T�_��d2�a�
�&��>�mc�XN�Fr_[?\�{�$m�$dNB���u����[�v-p�x��}�p���ϯ-p#ܰ�`�I]	0�vxը�F.����7Tj��U15����c�Nf�Hx�D	�H�c��c�6br�op���_0Fڤ?�2��u���PU΋_�nU�k�����t�F��j%��9��tX3i	z����4K��g]Z�[���Ϋ��O=�����7R:�X��V"�L��Bi9մ�o3�Y�He�ã܌c48?ړ�&��C���;AXP��n�|l��^��UŤ+�9��@Wk�fua�g���!�uS�Euo�s��c�H�k˿�& Gǽ����C�g�,:;�bJF���SW�1�P�>B�#-'qv�(�M�ǖ����@�^Ou�'�����m �e�g��m	������j[�~�3 _oN��F6�V��^�H���[ޒUh�a�!�
$ɝ����,�gI���ݒřg�Ϻ2����ַ�Q`\<0)���s�"	H��k�kG܅l_m/�*�����~M�,#aڣ2���ǖ�plh�)	�"$7����w���M����5��}-�z%/��'��9����-Q��    A�]�W���)rq:DJr�`w�,
�б%r��Zš� ^��_~�S� ��yleuo�=\˷1�y�=᳀+���ʗ�Px�)3K��M�<��`���WM����eġ>��/F��k�o��"^��k�HQ�j3>�k����o�#@ayR�6�����ML���RA�SLIԭ��RW�����jƊO�lqcTbAlׅ���J�����Pl����F7��'�baQ8�Y}z�&{�ѕ.٘�L;<��f9H�+.�
d�a!�~��c���c�a��l4QLw~������x8�k������ƪK���uy|nN���F���<����և�F����U�DZ���T�H�e�>�D�[����Y���JN��p�'�yS��b�����!H���E���W��PA|3�nN��1��v�\E&��	]�� )�_n�(�F�_[�X�;�I'Mj ��ᇅ\I��R]\'� $ sDuun��T]7����=|p�����x�G�ɤT�,
~�Ԡ�r@q��I�O|�Q����m�gĮ���oD��D�n������π ���+a+�n&4F){?��J6����Ar �'�e�U��p�n��e?��D�8炶p䍀�I,I������f��P-8�ty�yиQ ݹ�x(�F�[�[���8Mш�I�zp��95����\��p��z�I|���ݤ�rB���6o
�Qn�(w��U��̮5,��y�����y�-�m&��|�[W<��*�fˌ�Fp��c��K�R��4j�����#�5�y��\	��PC��yo6?hzk(D;U��R��>����I#%��j�Ug���gc�^���2���q�����U�B�j`� ��-p�ԏ�o̑��$�rV�˨m4,^&m��`��3%h�ڬ8���ő��q0G;T<��c���`�^+��.E�z� ��T��(����种i���][�*&E��5�0f~;�ܨ�c�[Ƕ�ч���[��s�|����}�(��ē���j��7�+�Q�_&e����{u��� p���ή~
��"����d�F%,80�G�$�r�C8���*F	���J�� �M@w�(����E�As��Tg~��i'S#U &�=@_��&��S�`{b,[S_��2��e?� K&�z� %��QQRarx/��������kI{
�=�=(�С���R~l�>Rh\W�Ha�Cڨ��kI�@_��>$��:bߖ2:@'r��r��X}�3�O�#�=k)8b��l�� 7�Ś�y�T8j�����Ա�lUt��O0�2��Z+�U��^�(©�C��Ls����Qᐰ�Dү3�؂����䕝�W���YW�8$�ﮱ��.��i2;[���t�*�Q�G�!�~�>5?3����%`�Ј�Wg�b�m���p���Q�64ar^휗5��y����!Z#?����gV�M�i�N��&�:�*�tq�R�9JlևW�[��!�_��[��@e����M�5�k���s
1����Bȅ�
�����p�ג�=ȩu��f�Ѫ9 ���ypqL�&���^�xO�4��ޭ�������z���~��?���|6�2�h5K�ǥ4K�s�V�NM�4���9�Q�?�{��jpdVU���~�����ǚ8T`�Tn�,���VG]�᮱8�� �;<k �YVi��B�Za�03	כr��?���}������&�Qsq�*\��u����1�����VW�k6RK�1%S��x���J�3�y��oi4/xY�O�wH�`�������3hF�2��\Р��|��N��J�0�c�]7��zc�&c�;�(H�S傜	 �`B,b�7Eti�եd�آp28]2��f/�=�i��}�hv��#P5����S�T�OVI�T6$�-�u�w7&���KȲ^�'�ݓ�&��VE����a�Udۥ-�LY$�SvH!O:��Umx����T�����"�n?�����<D�ܤ�@�>͂U�jx��r�Pz� ��#�����h�k���˙��Vc�/r��|1hP�6ћ�����.����Gٺ���y��^�6�t�H��YN�����9~gS> �jZI�z�i�^�Ob4��aܳ.XT��i�Ft�U�"|�� �����������ᣦhV��U�p�Q':n�=o�pe.������a �����(���[
�P�X��>H?���l�����n؟�"��ϔOI��F����w) �T�z4m@�����a�ǖ��+;|���� �V*E�4\��ݳ�j��* �V�ϓ�b/��a^?7l��÷t�P`+�E���Z�3-��"[l[2���6QV��Qݏ )�������q�^�J�v�:D��ɋ9�vI¢%S���B&85N�����j��D`�-͌�_J�R�٠~D0l�hjy�^kk� ��
��|m;��"��>�7�B���V_��;�ĕ�_|#��i�-�HjoA�������Y��Qb&�P�:X��t��j�4�G>Xn<3���E�6"Z�B�mMKd��h4��E�6�e�)~�6YU,7Ͱ�t�y�5⼎vl��~m}�� ������	[wM)�O��P?#k]?�`�5mm+ �:�%����m�+�K�jF�>ܵ���H� 㼃Ŝu5�58͞��Zu8`vb�Yh89�o���g]&Ujvw��;l��-����1�Jifǟ�����w���%4�|0���̨���m��U�t;����HF*/4��1>�@P�Ssf�j,�J�����e6ͺ������h�*��ߚ�D�Z��y�3g��JR<����5:�b�<�*���a���}fF�-c?ܦ ��겨�8�|������:cy�D[KT;��>��zL���i=������׊�[^̼Muķ�8߃&FTRY|Z̮�� ��%:�]�$��c9׊,����{��3V N��-�]�QL�D~��Ã��%�<^껬����FC~�2�-p�}l}pC��	d9�u��%"��b=��-?�&��!�Y�`��P�)�O�HDvr0ʳ���o���`�*ՠ�U��,��is�2d-4��L)K��.�<����}l��������x���]+"3zP�<�o�ѥ��D���{u5.l��0���	H����!d��I3�<|Е3��.e��A���vKA!�K�9�E��kTވ��[���e��V�ΐSu	a�=�����q��G��0� ���)����P	a5��>�-b����l��5�[R8E4"���C@��3���ȥ�(C7�4��q]�Gv�?��.bٿ��4>�ꔡ�I��Q4\S�!�ɮ�G�;��x��Z�"w��D �)���>�e>��Lkm�qֻZ��*�o�p�#��"8����]�+U��yMY���7#��m<���X.�÷�1qv������M13|��+Be����>6[eXe��B�������!A�O,K�}�ƚ/*�j�v��4�ʩ^~d���m
�-j�:�A@a"�s^v�����a���{o�w�I�U��+�W�Z�'aԙ&���I/%�chn��Z��_ ���gU�~�8����`�C��Ips�����{��G-�>x8�d�����&�V�-E�y���7T�����\��7w�l��D��k5UÃ�,�9���E:�[�1�Vy�RV�<��y}ZE&�l���<ڡ8M#h΁43O^VSщC޳�� ���FH�*�vl��g=�_�h�s��SQN�VH��Ԅ/[|1�|��s�h؀���
���]�ar��np#��~8@3Y��(����#��)f���^���á�9n�D<�S+$1bM΀ ���_r
bj��T�UU�v�=�mr��8��� �44��$2�C/)���I_M��{���2��=�d�X��y]-n�=�-���X����5ޣ�mQ�޳�P}�n��*G�ppú���_��{�Ty�蔢
<����˧����*dS����[ӫSf�p-��%��P��>{�9ޢI��4���:��l2�����)��S�� �  }��HE�%[�爫�3`!�6���+zi� � �(�W\��n�̺����N�9�v�l5�J�=?�B����u@�F���� ���)r��S;K]�b� `OO[*b5�L�T{��;�G`�~���~�nD��e?#m	L��G�7�z6�Za��j�u�p�Ky����� �Բ���;���b����7/��C]�+a6݄�PLU)M*Kӯ���!\^�aQ�/���[bO�c܈Ữ��l�N/��dM��jߦ]P��s�ӊ%���`�6[u6���l+y4�xc�ac��������F�=����t.�?W�}���D����{&,�a#�9�c܈�/���4<��J����t+t�t*����4a?���i �s����1|��y|����o���z���_A����)j�՝;{�d?��>ݳ9���$iw�}���]�܈�����s�B"xNM�;��nm6�()3��o�d:�E��G�tgρ ���œJ�_�F��Ɨ�]nV]�
�A�nYK`���y%A�-&��;u�ZS�.�� ����	�H�/�e��'u�{�
��vt�]��J)d��bvq��	O�no]�̵J�����\�&�W߈���ؒVsX��62�V=��uf���B����|��N�=hl��_[��U)!��@u��GR�Գ�[��rK���b����b'�<��P�Ϧ��Fi�F�Wk�a/�AנW4�lsFaL������ѐ^!��ْ��Q7R���ϽG�Q�wH�:m�����T����w�;����^á�d��L;B�j�n���Q��A�v]��	�������/���k;h Z3}��# �n�.�w�&[�F���O�m�kb�}S��B�h�����=<͝��F�T[N��K�Kr\n������_�=�S��U��Q""�m���g\�ǔ�ٮ��u�Y�-��1�i��7�A,�~����$��&N4�ZgS�eV�#�N��0��VB�\�fHk��;���p�XZ]�K��*~�4I�螇��IEMM�=�K4���z9.?T�xj��H��w�o�~lep#���{���;u�����n�4���S��'�6��yR�}zA�_7�����&��3���_x^�2ר��6,��r(`�"�=�+g"�H>�k$��օ�H=�� E;��n������f��mA��F_�H�����h·�TK�.plML��{��)����,wXΖC�Pl������E�M�*P�WݢiJ̀#�B�J0���I�[��v�C�] ��.�]Uv!��� G�
�o6r"�o��0�؃��lG 7��2�R@X��"aସ�p�If�s9$�c�)V�#�Ӏ��< ��^����VUr�m^Ê�����BMYNa%�'�2���y��#�*�]y�F�gn]���Iz@��*��m�6ҵ���dg��V b�.�#�B%�8�&J��=�,]�ي���%�,�>Dj�ᒺ�a��!�eCT�tӠ����h��I`�d! ��"����9��:":�l�`	���+4�c���{ޱ��H�u��3��_���/��_�s�=R�� �Q���t:��d8�u��0T���Fć ���3�e{�q���=���"eL]�X*�]O�� �]
�4}o��I=s����P|f���i�(�- Gy���{YD�i�x���+P*���;�RSO�����-`�(�>�b[��;��p�s�z͖�y����E�y}鏚���qݚ�s&̚$����"�]Ø�V����7��坪�?IE����٪हu�b���nH���j��&ÕU5������\ii�3�i���q>{�)`:��e]��ؚ1.����*@�EĞ��$�"�@�1{�e�gN,b��������M����㙺�7ծ��=Ɨ�q�'Y.rV�9\�d�(� ��S-9��J!���Jw7o�)�yB��J� b���0���f�yi�O�n��Q������.ME�V���P��R>~�#�m����㾾���.f���hq<>��	��[��(������Dqfk���-��ﺳ?�D��q��ҽǄ��Ĩ��Ƒ�(�Y2[=K�F���p��%W���Z8�Q5�h�{���۽k���=��7����Y̻�z������Udklu�W]���[��8�=$���l��g�mJ!դ
pr����
�����d"�ܿu����cP��|�%�\jfY(�#,+�\�A��㇞�X��5� �@�6�{l5��ed!�D�
|>Gu�|4e9��E,ߣ�g]�\�S����Z��~���;j8_� Z���V�\��'��p_�n�^���"����缾�����ʺ�-Dj�˅fu�=����9�N>Q:j���j��<������g]�b�6�Dj�ķ>5H�jU���`�&U��Q���'���1�d�H1��R�&l5�SN����f �j�<��3��lSU�`=�{rQ�ڕP��EA���.�Zm���.p����ţ^[.h8��y��V�[�	��Tn��s
�NUPu۩��Hy�7�8��*�P>�� �<��BN�CȭZ|�pVۮ�>�	�Ʈ2�=��q��q�����O��U"�k��(z!{���K�_:��g_Ŝ9io�X���A��ڻ=���2��ۖ��*����PŽ�zwV��,����ԍS�#�Η����(���ү��X���!�9�=c���hIx޻ҽN������y�y�a���������3Ru~�5�`��t���'Mȃ^*��
� QB�mu��S�D�s�pӔr�^D� �E��0��Ca�; �+����I�~�f@Ԉmҙ�n�D�2NS
	�C��X������.t�����-aƋ��G�k�ep%i�Kb�����&p|�HJPޤ!���qq��m�缧���f��~y����[G�;-!n����g�B��}�Ic� ��~�kDǎe��^wU�Ϻ����<n��t�D���±,7�Y�pl�$y�(dT�^B���*P����=T��{�- �iV�
^H��#���|��=|��MW"�=�����}��ר�%��nĪ�@;d��L��u�=�
�ne_�8��غYNB�&���9D =�t���wU���W�ij��W�R}� �����g�M��E���xsH0�R���ZJ� X��5T�V�����Yɏ&���"3̈́э�4�i_���^�$y��,�ك��ql�[�}�r�_<l)d�0�X�z/�F5�5�[�T�1�Iw��J��:�zݙ:���V�C�U�ы�,�U�@�L�𘲮���V�\�t���&G��^� �腐L��m��`῍���}�x��Uյ�rߗ��ë2��=��'*S���u��:U�r
��]��c����q�U�^�y.���k��<��1�Py�R^��1��@E�����m���?�my�~q���HA�#�0���Us�>ZuT��������_����            x������ � �      �   |   x�%�K�0Eѱ�
6 "�?t=�$�Nf�D��^�@Q�QzB�b�[�+��edq�z�!+_)�\�9�(!#'��x�AK���'�45d~ѧ�]9���[
|W!�&"�W�����>#�      �   `  x���Oj\1��~���Z��--���lR]Y�Ã43�Lr�9�\��v��MW����p�8���;� &�݅���"�����CA'�ɠt���HA�Ȝ�r��ҢZב� �c�� �4i85��UZ����=~}
�p���P���]	Ti@Z�*%/�mZx�uu�`�2p��N3��c%-y&�eAUX�F�P��$+B�1��j�2��x^�3`��iU� !������'���]��>��q��k�X��� v�4G�vm��6�=���b� ���*T�j6zt45��������é���=<?��/������t���|��v�ܮw�6�/LZ��-���n�,      �   �   x���;�1�z|
� 	6l�HK�D��'8#����϶s��(�YTV�Jl��o�<H��G֊'.H�NV|��4w�����X�U�~�x��i�(��$}9��T�z���DZ�)�S�J�9p� ��#WQ<� ^��{�RۿA��!�nX���~^n}GΞ_v>�}ʁ�2O�H������Sŋ�u��I�����
 �u��Z      �   �   x����u@!D��9"_{�Q�/!��[����m�	$8�3"XA}�In<FKb��dν`�eX��X����rB����;"�ݵ�:+�6?g�э���}u{j���e�B���I�^]�ʰ�
0�$.o�ԝ�.�n�oD.""�EF��=�O��.o8���H>ږ"[o�d`�w��y���FV7���
������ U�x)      �   F  x��X�v�8]�_����۱�̎�`��2��Õ�33��k3��?�/���%%�S��r$� p�6�6�6�%j�ņ`;W5k���BUw�>ⷡ�]���֤6�m���Sy����|bq�b��ʤ���r�D�;�e�Q��+-y% ��t�ƅS�CP՚���˰�^�`C��\`{��=�l:�q5Uć�<]�8DNa�-Uj�:(�ִ�������s�������I�@������5�:�P�6oR�Ƌ����d�l�v���b���ص�8d�ʶ6��5��m|��H���?G�&{��7V4�4Q�yP��;m��'�)���s%��3��#�h�lY#^�lT�/�P���M©kr�%�F�v��v����1G3���G���x��Н2�ӐJ(�>Nz{�{�օ�S��LU�AyF�VG�L�+�l� ��OB�^�ma9Ӈ/��$�w�P�Y��"�LO�ꎈ�衵�Y��%���@|0H��5��.�w����2��:���R�ӱ�|�
��� ����Z7���ٸ{| ��@:���9���C�����`�v8�ܛ_��Y��(,���������q.!�9��Km~K���} �����յA�zLF>4Œ��0��X�}o9F��A�uўl=�S��f�؀�j��%���_G������%��q�ݪ��=yc�>x�5Ο1=�T����aU�W۝ _��� ��\��2��̕EV۽��󘃲^�[o�0ҴL������8ܓ��5��!V��=��5'm�=���W̾L��!������JiLAO3�sS��&�35iy1���s�+$�2��U�u�b�Nū��;U�0Cl���w�^�K��Z�9�xV�(��1��"��E�=���ګ{ǔ2�=I�4��j�ly_�D}Z�Bn�C՘S	�&�Y�t��=�5��;�<=^s����	"��FO�#��nPl�Hc�D=�7��T,����j�5��Eڢ�L���w��T�J���3'q�m��;�@��O��E���D}j�Y/Y�,+�@9P����Ȃ���������a[�nly�d�j��l��{Nf-i`Y�4c�#q��aW���݈E\0���$x���И��Q�^�;�PI�I&K#/Eĺ�ݠb_T����	|�X'ǖ��J�v���8Y�T��xE&����0��_n:M�1h�u�3������Y�ƐfM�k)��^�����M?B�=�����(�B�"����a�H��%)���"ǝ���[�T��Y���'�cX�V��:�c���d���O'�@-�pr�����'k۩�����|�Mq1�b�^cZ��GU�壘�P��{�
�����6�ץ+�ߐX�!k�ΰ�-�ѩ�R�t����(�9l^�9-���?p��9-�D*��'��b6�vy��U�v����)�Us{�3����#<�]�Z�?=�,�{;�:�l�vˌ�jbF�P:�Cܶ�0G/����qw��Ԕ�FԘ��'t��|�i(?�<�}1)��(,h\sV�GuL�:�Q�X��#�*o�|N�N.���\D
�k�l�;^�<W�5Z
 
�(8p��������&v~r��X���l����hzR2�����KW����D�0�Y��ß&�T�����/�<�W"Ǹ����8� ]^��Hl�PP���.�p��s������+/�� ���EK������9�ֳ��}|`%�"q]����(i��5��,��R��7��"��\{��CM&f9�N<BA��b��7�>�2{ş
4������x���u��lVO���ӿ��w�Ͼ%�c������.IY��OEo5�y�l����~_�Vc���            x��\Ks�ȑ>�~E]��x%-��}bS�n:$RKR
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
'� �N��U���W3b��۸p2���?��� G��k      �      x������ � �      �      x������ � �      �   [   x�M˱C!��r~:		����	�3'ͮǹ��������qc�ѳ������/p���,Ы��*�6��ܝ�����&��~���Oe      �   �  x����n�8���S��Ҋ��8G��^ĉ!�
�Ld�%)��6{���z�R�l}8��H��7�g���7�o��cuL3*��E�,�%�2v�o\���ß��[�Cd%��I%�F,���1������mߋRH�e�2D�!���pOs���'���	{*nm|~��١ȫcm�h��6�i�� S&�Q%�\�"+[�8]t��i���.�o)���1:e�2j��Q����B�����4�ds
<h�e�gIոY�1+K�2&�N�+� �]FS�g�۳��h� ��s���U�����v%�i�?ShG|)��S-���{�f���r��{m.$����f�E&y�y���aWes�>�+�O^��$�:�fc��L�y�´�����as�.䲯�Js�dD��W���F�pZOjny�H��8ɹ��*=x��S��DL�z�2�
�~�#�zP��G�q[�F�=Thu�tV���W�)�O���q�R�_��]c#��Du����C� /\*���ŞSk�0 +5�=n/����C�#X�7/ �Dd[(%����w߱�<�����~���D����������{ުZ��I|����D������dL�$�(����݃�����v�?��DW��X{L��8�q��=�tN���4^H�z}���7f�
�G��(zΊw�������LWu^�����
�:b�R�S�tF��y�5�Y�B�����I��$>h���%1}o�6�h�\5:�jr~խ�5w�I\��NVR'��f�K��=���5��=����k���A�]�F��k{��#��ױ���j���%`e����^�+����e:A����+��[���i}b�Ğ�LB�m!��<���g9��<��+�h(�}��v�����"��y��#��\�f{)Ԏ� <�����45� ;+`<C*%C1�D���~�������[��5L�<���z��w �z��N=B��J�b!�� �@᳎uW�R���Y�g�_ �}wLt߬��i��z�ϒ�r���F�7���9\w)�-;�.�i��$T��S��|���ah=~��i�	�	p�ZV���������c4C�"�_#]���)�KyC�ݛ,�I*����vT�����BE�Gϧ؎��4qliӞ?�Pu���2N&�z���)3xN�7������%���N���i�1v�x�W�u������� �%      �      x������ � �      �      x���[�+9���\=���e=�~�u�C��\RT��<�\��W��ܱ%	f�t��d{<������g;����Ż����3�������������m�#�pk�{&�#�]�1�4����t�8�z�G�u+,clIs���������Y�Vw��9���8�
��5K��������G�f!�̇�r�QJu%%o�ӎZ]��#��d�8J�!%���k���QMh��#~�`�>���He��M���v�T�7G쁥�i��pD>yF�������h��YK�s���(v�#�ş47�
�/�#��]CK�K<ps�jj���9����}�6��׮�ڃ��.x�<�My��C�iG��}Iر�.aG,a?ڎ�<��.�i]����Ev�e���5��;s�W�+g�>���};.�����]k;�ˍ���hq�e���Vk�_�����Lm�#��Mql�����m���qq_d�65�҈�qsx������c�Z�q�ھȎl��)���~t�#���0�ٕ�x_��k/��n&.C~���ك8�kwn�6�x_N;�!Vm;�mr?Z`Q���W��N;V�ӄm�6K�*����X�Tv��|���\6�V;�1�与��~�O�7v߶���3ݎ}��E�����_��f��j������A-U7�;�1�h���G�6#�m�x�w�\�/^�1�uw��e�v�N<%6�Sf_�m;.������|ת��"�&�6��K����ǵ}�x@��:bT\O��k�-���,��%�վ�� �|�+���,�4�λ4�m;.�옫��m<���h���ݯ��Vg�����ǵ}�!8��.����=\�]��o�'�w�/Q8h7Z�G]��W'��p4�'�x��m;.���֙؈b����V�{�ـ	J���_�k�";fo�w��%�F�%�o�@$7}����Q�K�鞄0[!S!@尪�@!-�?�c;bucž��Q7�-���Goݔ/��ʾ<����e+J�c�-�0̒,;c�_����{#Վ��s[����C�!����r�1kpr��q��c<�ow�m��\�X�k�";�ti�!N�2o����W\���<��(ϥ�Gv3��#�7 2yn�\l!���y����!n�u�e�D�.{�N�GF�����Ȏj�SV=��U������C�u��~m_����@.U�VY!����ⶠ4ggH��A�Ev���"N��t19~4B��֭�S�ϣ.��Y�������h��h��u���۝���qm_��v��yQq*l';����0����}�=:~���!�E~�=kD0������s[#�]��P�w ~@�F���a�z_T3۹k&p���`IqsA#v�}�	<��}�)���*���ش�oH�Qǽ�/����o�(�Y�5���m&ۡR\c�?ƜpySsC��$�s�ؑk��z�Î�=?f�xC���㴰�s�o���H�Fhe o~~UK���H-�D2n��'���/��s>�+k���'��˱m).�ԃ˷���/;�,u$�i�䰶f��$��,e��Ǖ}y��f�.ȡ1�GNP�JP�C	��g����+|�]�cn�'���6y��eO�^��6�sA.�%�W��-��G�~ێ:��A���� �"oU6ֲ,O�y<��3��M?�
���+�qxҟu	Na�m;2����UVR��ם��-YU�&���aظ��b{׾���j���[z/����yyرFN-��l��C̀g��Č����dl�s�Ƹ$�A��d�s����z�P]u�Z�����?v��f�S�mG+�dp� �O�n�Vk,��vLS��a���?�/�O挕��ҵ�v�l�,�=�=�m�:J%\���Z��ʧ���Ɍ3��촄W\���J���%Md�#��$��t�̺�x��O;\��%(6�>���~�`�>��z_�3���HC�N(]{A�btF�S|�G�ͺ��H��r�1{���m�<�}?�v��V�9u:IcD���A�ս��fݑ�X��������yK���خ;8��g]
�C��ƽ}oκ�zT��d�� ������#f����;f��.�y\Vql�~���_0�P��O;���HP��m�U#�E7cX6����0�Y�l� ��#��3�h�Թb�=��Pl��paR�[��f\V%&�hn��Qi�v�n��/�C��(�������"��6���I�.������z���6�|�J�%5�Z7�3�8��ӮW<��Ƃgj��� ��e!��ȶ���z���[����޽H�'$��iYĆ:.S�G�g_<N���z�Ǿm��:�#���@��{��n���E
���u� �Q�Q��1���!�5C�I�!� R%�kU�PYܿ���;�`;G\I�@*�X��; ��|�$��6*�p��o��6ٟ����6��8�XʏF B�zt��"�Zs?�s&��K���,�_��#�@|��n�v�]|񮐊fP��eW{���łU����A��p�rh�DP��c�����y��	PԤ�!�� ���c�ԍkk�|�O�-�֏U4��ۿ2�I��+�A1��܎�
� RN�X2�%����t�_��{���1�l��+�c�Ty�N�o�X��d���Wr~���b=�ж#�14���1�{��V�o���Ù��t�hNWfv������z i���I���59��7Tzٜ�����J���rw��I�s[�@'��(Q��x2'�z�.ܝ@fD��Z�k�)%2�t3��]��)`���,��[w�����P��x�+���t���61C
�p�E�6�z(_� ��6�o�g&�w;�Ec-�ė��sFn+��e���d�%x�����c�q!��8��:�<ײ�!A!�Q�N��?"ѣF���@�^"T�Kra�t'�)�a�~�{��ҁ�d��Rx��$��@��!ϱtM�ʄQY�'w?�4\򐣰�ȀĜY�bi#R�ӎp��d��p�C���5Doa�����a҆�ɎG�\��h�N� ��R�@��o�s�dւ�����/��0 3�`N�''������v�tȉ>V��k ������4eTo��]Х�RQt��@��D8��OKK��b.�? ���%�9~���0��-��yR�Վ$4$�؛���	uh��E�dK�Ė�1$����S���,��	�B�Yl���E2Fk��~����~]W���t[|��c�� ��f_�L��Jd�
 +�dz,%mK]�iG ����#+�E+�1T�I%㺾�����$�,���A����������Î����=8�|q�LƱw��)�`l�HN��&Q��
"$�P4>� �x!��.�a�"I!�øa���S¦����!еF���UXޯ����̩�0!�	T�K��R]��o����H�T��	>%-w(�}����	z��4�?�"�3�-.gS���TkYՔ�����%�D6K+c��K��PD�U��M������U���n�R}�i�
&�>��(<�����!=�3Q����1��x6�6$W����/��1�#Y�[��8�MiG�{eg��|?�w��H~)Q�xb��!�5V@}ف�Bg��r��z��;o|�~�����b�x ���g��9�B�O;
_׳J+�>�����=�VI��~���$(e:����d9�Y�+�9}��yሯ���B{���v1�ɦ@���R!��o_C!zۨ�A�XqV�{x������I�څ��{�r�|�/�X��롦#"C��t�O��_p��vp�qP9�t�j�Ǆ#k�`U�׾�/f2��4��D2 ��D���ü֣��U
P�'nj��5a�`�N��_�H@�N�X/ե�����ný�|�+~�P�=.��eE���{_��<̂!N����	V�I�����y=�Zt�<���c(�����h��?�n�)��1մ�2���d�����:/�J����jM ��9Ɖ�RA/���|�    {˾�z����mV�E�1 ���Ĕ� �R#�̭R�T�w�y��X��+��x}�V>l!Ւ_$��6��w��L�{n�������9�������$�	��ϋ�X ��;�9��m�;q��9��w_�V�{,Q74�P*��lX���y�����1�����+w��<|�/n²!|i�>f����e<8߿�� ��8fj�J�X�!��&�ס��x��Y:�Î
�7Ne�v?�Q��W?��5HF�C��P[p��{^��>PG��l"Zk��:vƹ���:?��!<�{��W��س��2�+�6�04o�?��e����)Yf�~��@�Sy6��J$�2���6�0�ԫs-(%j��x�B��[EJc���������P��*j�G�"޼R�i�w�
M>�7D����V�;���7_��Z�H\b�8� ���4�������?6�h��$�G־d�5�'C���s��4$��:/���������_v'.�#��������6Yfu�I��m�}�<<IR�����7rP��[��8�z��f�]t��E�����`�$~�,���[���j�y�)$�I�l���� � ɰ����c}Q�ͭ�C8 Q��'QLI0�Z<�`��יnR��1�,�c}2_���=k)��:[@�))wh,�x
&�`��3h�.)��
D�|O�D��!tD��`�c����<�L�� |���ӽ�\}��,���$h���m��C�2E�'d�3u玺�����S�e�S.t�vd�ȇ��/�	��n����-6�t��6ì�y�aV1�ԥO�G����%�'r�_?�a��᫕{z�� .t���fq/����`P�~4������L
X�>>-$j���VM-E�n�cl[	n�#/;T[���������(y�i��m�3ﻸ�,B�Y4)�;G���L��g�<�!jl��/��:��dK�-���s|�N�)�:X�tn.�ԭ$L�>�pӖ'%/ P�q���.�p!_���N�b.��d���4Z���Vu���ʨ��6$~���۽�op��Z%s�+׻��=D�������N*@��^C�Lc�*+���cD1�8֦	��ִ�ʉs�^J_��&Y��b7�$QR���D��N��s�%�C��2��-�w�"r_B�5$�3�]<��PAd��*4����/ ���l��"9�N��e<'���};`�6�
�Q�;T�2����׷�\9v�M��k8k�"A����W\��oU����������T ���_�?�.�����3Iz�䴅��4����e�K��`N5����1��~�cc��6l2O�.�@i�ɸ7h��/��fD�F��r��jY�ށѧM����p��B��TIV$v��������d[��>62dYu��� q��2��hj��}�S�I.FZL0�$^����l������I��;��Iq@|%��
������\E,&�?����>2L�����Ǐ��/i�۪����*�!����x��S�!��L�B/��HD��!U����tuJ�����zUG��}��@?��i}d�Bݘ�_�W��K_-Z�y���{q�=�A�J�{����������]W������.mЙ�n߯���C��UBJ�vX��&w��z�.�m�$6�V��W�������r��Զ\�6�N���h��c��Ģ~�6��V�����ڊh.�.!zw�H7�ީϙD�{B�������h)T��oa��t��ZM4g�Y�]��_�� �1��!�j��R���]"�{�F����4�B�HB��nɘx=�3�2#]�)�7gS~$fn��̫�Q���r�y�(���ǌᷙ|b����u�N���鏦 �����	)�����T*�q놠��_ԓ㌫�3{�2X-j"Uko����� ?���1�����h����	�^��:H7� ��=�Ԕo��~O����?b(nMI ����ehs�( ���_��Ncg�q��h�/Qͬm�TK���{߱�3�b�V��l`=(>W���GCX�A���S�P >�С���}i����^n��ToH���}Q��]���m5�a�������m�8�'c0G\Ta�D�N\�f�*Sعc��s�G���_���߫�?ζ�� ��oH9�����k�FJN*�Pp���B�l��N�n�t�1�T��Z����%�R���%�|_)��$u�h���"�N��@+��о(��5cG�w�H�[�\�6��J�?�%��DG������5�� �&��@�]��bw�x��|�6���A0��S�	�$7�*��V��ےgᬰ/�I[5;]��b�z��q���~X�ؠ5A�;Hd���_\���H�������dr��x6�\�T����)�D]@Ǟ,L��/����p��S�-]����_`S����ͣ�� @�N�,�M�B猛nw��~3�պX��֩���p�d� ��>��Ch�� �SJtJ�{�>g�K�����ar��A}�*9����X�1�����uZյ!��/�����!c��E�P��QQp����f0��;��~������\�IN�F�|�|�W�����N�O�!$�p�����j�]�
�,��C�Uzv��y�V�H����p �@��p �5���5���l�:.��XUu��5�D�6z,�܀�U���cH�a�y��4Z��"�j�T����b�58�g<��KJ�d"������JT2ONM``]�\����՛]��~$����6�8rZ�.龨K�O+(�)���>E�a���U�*/?��*sdr����}��'�@����Û`�W4��^���������q�W\����&�I�
m�	v���/��¬I�4*����K'= �4��z�1X�QK	H�l��F�� �����K�Y��t�⚒eE�ۦ�x�	���v�*�G�n�j��:�`���rｂU��1�d�KP���	�l	"/�ͦ��Q�џ-]����vÎ9���0+�Vs&y�?Ú�t��b�ҁ!�x�[��R��p�.K01�®9tw���8h���cć��J�����k_���kTN>�n�%G���hk&�Y��󌑬Ն�����kD����nx���`�y`$�:�]�����K�<b��O�_�"�t��8�d�� ���.�W�[���z5�A��|A@��0�-����ʒ�Q�-�z�6 ���� n�"a���P�PӘUq�u�E��X��Z��<��u�ec:�$;�O��Xx���G%h�eS{��I-])�/�)��!iҕ�N:-=�đ�rٽ��y�`�m0T�����'8�S*��;4��6�����n�mAfpE�%�᷎�c��.�)9�L��zJ"q.>zQw�ve�+dM�^:�aZ#���L|��j#�NB��09@������Z_�u��֠��З��Q�i��plg~qP1A���$��0�
�]�i����Pj���;U0A���\�qd��[?Ul��=�%T�����a N�o<���������U8|�y�c=�t��r�1�:rR�S����d	������d+g:�Y����Z�ݤ9~�,v���=�M[��
�?��`}����^B��6Hu���7�7�Φ������W[��tG4�KIrND�j�@�
�� �f�h��X3$�X�\g��k_^��#�/��2K�����s�~W�]l���Y��Y���s�/�8��z��Mf�g��?�꘭k�J�_�q-�"�:�F��I�Ģ{����,}+��ce���.�HW�q�/��G33�4%9�Hn��@h++��x�5Gq%0��+�)ݐ�6m+�p?�&�%C�� �9$Q�I"�'�oJ�׻J�S�m����ЁM��ھ����6�򋆊ir�N�BQ�ͦ��/�����W)��~U"�l�Å��_�Yl��a�=������}u�.�����iɖnNDhL����:�U��f t�>
�A<�� ����^�65��ֹ��*����x��W�7�s	((��-�y-jr�    2'����� n=���䠆h��w�Z�zPV;8?�[�%���6%;n�K��9���I@؂F���-Ȱ�v�B�	?(�P����]M�a�tڋnس�~�,&K�M'���[oن3�B��B�3�.��.���H�k)�Y&.5���>y.i�US�\s�ޣp`��.3�o���<%���WmQ#%!9C���y��C�������.��OI�x���֔-�l$�q�<ͻ>��
����Wiݕ�9�9�z-\�?�^Y���a׈sl�A����jǥ�9;�%���n��4�Y=}_�մ�E�ڥq5;��p�]9R_�tsIi3��?��~�]�)�o�zX�ڵh�	��gM�фeϯ����1@Ï	����k���K�#m��i?����'r~U�����؏��D��5�v���D�*+t��)12�I�D��5�Z���N]+�\���'cF)u}Q7a?Z�ϔi���-5?�|T��2^�a��}�$�Q��j?��n�"�֎��9>D�~b��^����MI�eR�z�G2�"�^��ݿ(�\���5����l+�ź�">چ�7����q��P�5�&�٪�bгh ��=�r���ش6�v��{��5��F�x��t�7�6]��;@6V-N>��cr���H����_�U�E�Ǿ丒�jN[�N�}:l���uo���������iLʫH�},=@DC�~��1�����v��aG��z�E�C0����iv� �[~sV@�)?�e��Z��m�ڢ�K�"��mu�K`��nI�[��9��ޖG<i�o�0Q�,[4���C����`e���q�v�'��l�x�48�&V%S�Cԡ��ޯ���c?کk֜����V:��Dڻ�4;�l�R�z�@���\�r�����ђ��(Q�,�M����7iՑR��>ھf��񶡧�v�>[	3eu��c��|���"�U;.5[=ɐoz������YU
5�rAM,�+6�g�x8S�Y�wI�ih!�t��6m��7������K3��%�15�#�,��ˆ�;���l	�?	]��\��/��1�ܤVik�gI�6|������/��*�k((� P�����s���%VF�83`��G�b���齐���Fcs�'�?gT?��z4���D�:����Q e�/����x��ޚՍ�^5��U�ĕܜ�Ħ$��M���~�s.��=�eՕc>�8��Z"�5Th5\E��ߢ�n�ď2�5k���%nL]`K!l�W �n��nM�?�#�|i��cmTɈ��O�O�4�j��TZ�io�b��׻)�&JR$U5��z���w|�M-��3vz�y�*�ۺ,tqڦ9 좉�&�,�y�7���!C��ƜK3fUb��9�A3�J���&w����bc�����wT�J	6�HQG�S'���)�f���}�)��5c�,5�	9+P����z���c��U�pi,�35ko��)�/�=�~L�_]�*�<ƥ�S>ڡK=������Ŝ��3�J��ӾC�ߋ�)՟�����a���*8��$9���A˸�	�+�}�����+S���d�,���E!HG�A⶘fV��7`l�7�p�.u}>���U�a��= ��!Д���� 7���؏�`�zٞao���D���1`�j܎���x;�R��sU�H T e�8ؕ��X�����U�-������R�Գ��R�d4Nɰ#t�8�Zly������j���:��ø���S��R	��x�Eu��`��V�K�S�Cdw�չ#M�m�iWI��@Rً��ν\���*��%���4��|J��x8'���s����C�|ՎK-�ڱ��Yoi�YO���ށ��}z�yݯ�^j�x� '��h����t�Z�$!Z�F|�n���
O��?�0��֟?
`b=t)��,f����C.?��0{i(��4�5K�S����`��^��~��~{G�w�������OϝcP����|�(O�ף*o����>�P�:"�xFV�9]���!(]��DPN��7c�$�?����+�g���-%E=�?6��\�ŉ�i+�7��"��'�Ǘ���`
a��ÝU��[uO�!�����~���O��tE�\3��X�H��xާ���V����Pޡ��'t�.�QBM_��q(��IQ�� ����j̻��G��?�#�I����٠�AVH����q;0�����-O,��9\���;n�mL2����"2`�:�w+Hz��"�����p�g0��h�4�.�����u3��^���r	�'|Tu��2�81������%YU��	-��
���<}W����]�4x`����rY���T����O��K�B�X�O���44�ޞ#W�4�=����}��.Iԟ4 [�,�IC#��^����N/j��-��KB��]��8��0>@�I�t�4e��h���G��L�y��n�]	��&M���hLk����fx�����\�?s����a:�5��j�@ZY��*�tI_�+R��T)��)��z��h���א���Jk��ҵK/��JB1k������t�ײ�8� "�;H懺�k���UI�MZ�Ùr�v���v���pNŏ�([_S��G��i�oH]з���. �������R�)a�k�����L~�Qk�ԒU*'���	_�~\�^��S�fIS��Tl�|���e���;�؁�V�"���?ڤK����`��;<M6���4c��P����K���|���F�(�i���d;��y{ێK��US��^����@���U�̽��v\� =��t"�Ќ��mE!(B�6��B��v\� =숚�4�#k�������x=�R�����a�|�*/������B.���8r�� �86�hrI��0���&�->�D��E(�����G�9���O�ȞKڒ�۲>F���	�N�l US����~{�.i:vI-�M���<[�B ��)���p�KZ��&ǵ�
|:(�,e�rd���ü�ޥ��?/�x��Y�������;�.j�T�s4��u�$x��q�`��ã{XZᘑ��<��;޶�ҥ�sL�y���*xjg����-��̐������`�o�]$�h��s�N��?�C�9esێK7��4l�*zQҞ_� �$�HL��D��PGw����-�3�wo\V���C5UNOܨ�i��A��~�q�Z	o�Ѳ+�O{�J� ��_ 4.�Aw��E�k����=��V�;�l��V#�������d��m�%�fQR�S�V{�jݦ0�����~�ϡ���s:9v�un<��&��q?�\����p8��:��1f�h��p��W����?��~:�w�LLO��LM��4U;<1`�w�+v<s����fD��.�
��!���� |���r�P���A�44��B�2z0lS���%;�1�D���t>&�t{C���O;��~������v.]�?��8p��X�����]#vCkت���JqɄOe�W�y,��P�6�$)��*p�e�!�$ss�����䧳�B9@�/�-g\��]��a���rɎ'@قI�8���>I}&3S^�������	�T�!a�e)4�"�;��5Al��
�~��d�s=<4��9���m[��N7"k���pI�q���?����ܕJE2�^�(������x@�R[*i���E�:j�P�V�d�����}vkxI2�X;K�-c��H�`2)�[�1iq�sI2�l�¡��^�Qifbe�7Q�;�����O4PZ%���G�Qն�R�y��4���kҕ��V�WC ;O��]�p�$U��m��Em���g��pִ��W�k���隄�\�f���J�J�g3W�R�@<3��/R\��a�=(��E�6��^�k�4��������\��	8C�J�K=��#���ܰ���5)�C��
�`nxD$F����o{%ҍ�S���x�C^S"R���Uf҈2ш�w�� ��7t&�|LM�/H�`��� ���I�C�,�_S�<6���e5 Yr������J	�7�p��f�F    �/Fw�`��'e 9� ;Fs�}�5����n�.�v[$r�jz�=8�|OH[V]3����K������
���8t"�dR�9u��MR��:���j,_�ak)J�P�m�3~A �[H�ܞ����\��<^74~W�";]q�~,�Ȗ&��Ij���h]S�<jI����F�{��%��m�4k�{ߖ5�6�F��
�ٸ#O	���-yp�A�ԋi_�H�itM̥��L�}��my	��z+�D���_�)tǎ�kW<�#��n�������|�_�)tv�ݖzK��R�`m����3�����B��#Č�Ld�cd�Ѽ-p�C7���G\��R�5}�Úu�tɥ�*�Fឯ'�ӭ�__��/)s=[cXo9_>iF���z�b���L�ǣ� %w��k�n�4u��}W�Np[������8�na�@l��?�T]U!^m���YE��8|R[l�AqN3�$�կ��B.q��&TO,���>4\�<YƻM@>�\j�%�@��T2�`�m�qI�������A=`4<Y�b#671$�7!��.���ϋq��7 ���3�ǚ��M�N۬���=�P:�~Γ����]��P]�bT]�0��_\�]��<�x8<�𣤨� �=��`Hĝ��E�)�r/��j��@>��ˬ��!�8^���2�}��E9�?�|�u(Q�E\�Z�k�]Í�'_\t]��Ȏ�ͫ9�R�e\�*r�M��҇�w��rّI�F/��~4ib�^Ӟ��I�U���\���S���� \5������}��-��'F�P�P��7��a�~�im�������ǟ�$o�DI���F
n��z�զ��#hL��l\��ȞBnjgEX	9����y���elu8�,qu�ΔkKo�ȇM��Y�Jf:��}��E�鯻����`vl*'i+��E;���'�7g<�Ω>g�c"p���ۊ��W/�oq���q�An=�9ĳ꽖UȊ���7��Fw��������?��beU��#��_��x��f��8��*V��3q0a~/��+�K2�sY�^����(�v�Zl�6O�F2�tߎk��Gڳ���Us>I�u����af�ŭ�5���X:,k��D/� z�ĭsv�|q�vQ�r��YrL��i@=ǌ�|�������?�c,z3�P���!�&�ƿ�7^�v�k�Z�*��T'�% "mgD�F��f.J*~�I+����_4
�q���N��������^�p�'׻cC�����50��ơ��\5p�]��eZ��V��A*�5��b���ϋ���!'�P:�&��r�[4�Ј��a�v�O�o�����_�J�xMwG;'��΂��C�O/ݐ?��|��$j��=)�f�vH&?��}�x3}�fBI�X1U�dX�n�kb���ڍ��0m����y��x��?�(<�p��\��=�1�@��UU�m�+��Z��jd˰����M��� ©֫٢Q05�b�lg����rю}H��%�F�D
"�\& \����K7�O��^Ќ��1)DK�S��4g�8/�8��D�i�㝾&��+zjys=.�L?���
��15�M��e�-i"o*ܧSWn��:hx�R�8�b.zd�5���jv���/�q�92�h�t]/&���i4��-�&�'��ԲK����^�q�uj}��j���ތ\�μљZc0?�����׆�"����6iڅ��ě��ӎ��o�[��*�W.�N��s�cvM�dЈ9H��5������'&�v���L����S\Z@������͇�̗ϣT����S��	P�+Tk7��e�N��v��P(N�1j8T��	�㖔�Û����15*]4<3���/���(���j�I�z^j���/�E;�L8Lؕ�I�<�&�郃p~\� �������	Ê�5�Kml���O`8���vO��s;N7��m��M��=`8�|I�����۾@���_�x<�1]�c)VW���GNjs;����B�;����k\�0\���H����ƀuޯg�D�ܳV0������և- �4'Ϙ�6 '�V�0P3=�!�P�ݻr����8���IpH�t� ���I�s�4_��</C}�#w]���V<t�ZJ���#���M.�qֳrS��M�yϟ�b���'�K,�Y�q�%�ͫ�;��4a�����*�MϷ;S�i���Kқ'�5y��]S��E�z�ϊ���e�Kқ�B��s�U#�hH�J
��at�Ю~�W�7�.�7t�I#�M���U�MW޳�S�_Ϻ$�yFW�E�/��У4/�k O�^_L!�"�y��=�^Y����i%�2���_#]�<QI+Л�\����> �,�p�?X�~}���).�v�f[x�E7�f�c̱ �&�/��%�͓��%�9|�Ӫ`mR$��ȡ�"g�]t%��'�=vQt���A�=Cq���4��3s�]Sτ!��ǳ����c8�rwzvD�88'̫��	3��Lx�wް����������24���g�<)�q���7_�7����n�
��r��7��1�����~�����,�؋��'=.�VC�@���-���_
���V݋�svN�O�pM�u�*U�%#����C�m�v@L~&Һ�M�w��jOR��p��6�	�a������9�C�>}m�N�p )-B�_�zƳeL1sq���QK�O��,]�F�BT���@�8�]�ZL͋����u��9!�:�e�ʗ.HIW�9N�Ii�똑�m;.J�N�r�v�}`�C�HN��'���,�������I�(Lz�̘���T�/*��"�נ����?����6�|\ݹ�O:�l9���֨ #�r�i���v��I��bÇ��.=��'��X�E����;A ��J6�c�6���Gl��l��(�{"�C�{]�@�(-�0ߖ�e��{.ʦ���킓4�ϳ���Q5��f�.��1���E��)�49���C��@��+�F|��?zE>��l���\�cp�6_��s����ϓ�m�g��|���+9NmǬ�42@j-��	4,PؕFx���G�\�P=��ګE@^VI��u�4��4�9���[^����%���zL�f�4��l<a�7��)�
(=��.YӸ�5.*�O)�����ERƗ��>A��4o�AK?�Ź��z���^��i���5�U��̲�so�C,t?��i��9d�n�z��|\��}�e�����ơ�w��i���U'�LxK�{H.c���|�S���7�U'���̱�f����MU������69ݏ��a���1X/�E,�C��X@������R���
~�|�OrQju����� ��H\�#�Gܣ�ӿG=)�a�&�:���%n���׉���>q�қg�ҧ����}�th��s��D̒uc�>��m�(�:w)�X�w�ҾL]GxR�۾4<.��F�X��a��(�zd("����|^O1v%O�V��֔>�M5X��1ۦ){CAO��+���G,S	��8Y���Ǉ�<�搎5U���9�~�:�������ܣ�ҫ��o��Lx�@4��߾ߗ�j��G.sQ�u"�UAuR`�$�Û�s�DQl4!�g��Y��񭒵5��������p������P�\�Z&�J�u���uA����l�a�x?�\T =ƞG��YŠ��n�>j��^�{_KL>�rQxs�ӊ�z98.��qcM�rb�����y-�����	]�>l�N�K4-#��.��4�s�.��idp��|Q`r��L*d�8BB_ =���kM����!q�$P?k��(�x�\��+gkĩI�Íd��?{3G����g�uQQqBk�9��,n�pz������U~���19���EA�Y)������}�:��N��j����c�_]��]u'4��(UG"�<S�-�ؓm��]��?�lR�P�玑C$�S���⽸�Q�>|y����N�J�t�3=�s6��
���Y��߿?�xo~�=��\�ժ�a�[O�~�׸    ��q��<�otE0��p��{�5���g������qg<Gx�
i�ys��5A�9���+�e�ʏ���k�<���A���Τ��xeWl�%�^�hu�M.�	N&�8�	\�LN�����}0u͎s= �Y�{��|		\z~�DX���k닲��}�eH�χ�����Ea�	S	#����.�q�;�ߖ�����f��2i`�����⼆���y��䶲�pK�qc�c����������y��K쫂��k�E��X�c�I*�Ϲ/ѽ(�8Etб��=Tf�YE��"M�6+�g_u���-�EsNw�m/�A:�� q�U�@��3����E��y��`��s6n�׶:�&�v��oQ����O��]4�,��dV���ט<M���*��ۊ_$�kb�S���Ov��Xq�H���E�-H�{���>|N��5'aɺM6�p|V�� ����q⿖�<&gl�sӃjBn�أ���a�c,"p�Q��qzI)��&�,U�i�|��N��_%ø/��(���M�oi8��a�F�v��y����8�]���U*T T��z��� pM����l�:���QERzOf�by��� ��:��A��Ã��4Y��f-̮>��� v�ő!R�TRP�nY�-�?1�����JО~�S֛�m�u@��y���;+̵�_�(�:��l��4G8�F�֭1Ej��&�]LN���w~<O�؇p�7��蜬�}�z�+]Y7�z#ݶ���<�X�/1�� T�X�È�i\��g��m;.��Î9b�%R�^�-jz���������v�4w�=C)t���J	��M��?툆��[>vSQ�=�r�n�k��޶�7]�p8��=��4��X$��h)�e�#j��;�����V�)Ar��v\�=�ئ��c��=S?��R6�1&�H���v� ,��G�'A���W�T.w��5MqNz��<�5�Ʒf��pPEێVJ˧�V�����n�V��vק��;_l��P�f=�#�Tgs^�nۑRƒ�g��}��:u&pH�	��W��;�B������-�/G3Fj��v\R>�H�rķ�Oj�t2Y���ĥ���=�������&��r�U��&�W��@���[����K~��]w�kC�{�{�h|z�Ks�p=��
&���cr�X ����T��8��N�E#���w%٦�e_vtOT�2:礵 �%�������~瑃=��}BԔw��SC+�_�լ|N��;�RX���}��g3���/�ĝ; ֖ ݁�\��4���˹`�m8tQT)8X�6$�1z�ג��ƜE�O��G�g�����Ĝ�P��j 9+i*���.0�/�/�:�yߔ����t���_�<�bGj(�xߎkzN��!-���Ȥ�* Ae�I4�Q.�8O1 妫�9e2�i��p�e6��{����p��E�I����oʞ��JZe��m+��_q������p������
�z����M/��֛#K}���Eݤ�lK�d:��J�����b5�b�o@�Ӷ�k���R3���V� 4��u�/��a��_}<�X��@�]M�6��jE�\]{��W���w@�L�+*ѧY�N"�sx�~?=VW~�/�ΝA���E.�7�ճ�YSN���1e��JRvd��jUW�r��n����%��a�5y��&X�>HNSpJ�c�<+Um��V��"Ϥ��:af���I
|�O��z3�'����3ا�ٖ����+%(�	6N{�}l�	"����2"G�->�5T������G�z��#���D�������حT���|q^.� Ϛ��W�US^%��n�:�����_��yM�d�H���K�OQSLHh0����S�dǪK�TK\͉wTi��fՏQ����n���(�.�'��\:Xs}1;����Y�C��>��|d>4�jI����S��vjZ�?F:�ئ,���-Ke��7�w�I���l]+��
y�(lRQ���tw���E��y^|wQ�w{�Z�7Y�z�dY�v����u�9���a=f��]�2Q@�iW9��Q�5��/.�u�D�`_�Vc��o~O�i�|�����v%^�t5q�������S�dGS��8g��U�.����2���ϧ����[<� ��r�	�շȷ�<��<�����g7 �4�gpg���L*�>F��H�^�S���}g����Kp򎪌R��4�����)s~�2�EY��${�C��E�OI���0>���S�f��'8,��e��]-z��o��8W��P|����]�/��p�c3{IHH.�Q=�%&_��Dϋ��3��f��0���V�$R�d��>彦X<1�HB�;[0��Y� ;�uU��ላJ�s="�\]U�z���Ft9R5�؊��/*#פyg��bOƜUgaW�+x���_<�qQ��TfC��#陼���b<�Z������.J��}r@p��V:��!uJu�&����zQ�u����@�0��e����� ������_�Z=0b)����C+	���z6���]1�NuM�t�B�tD�L���_Ն�ٍˬ�w���Kr���Xx�Z"����Q�$�Ɗ�I���r��L�3q��K ~@����̡d�{�o\H���uo]�rB��H��3��Ֆ��LkA�}yL�!���Hwqb�	�9��o^��Xĕ�������f ��Y)��o�Չw��W�ᤆ��QS�u/�b����8*�$�~u눯>�󵢭�U&��CP�������J����Q�y��L�0aq��3�������l����J=V�90,����%���z	P)X��1u!��^��vtU�4T��]u$���p:[c�δ�u[�? ;-�9K��N?���FMP��*҃jN���T��^2#	sF�}Y��m���Y��jm�C�m�D���h�U4a�� �kt�)�o�|6�9��+��G��k�ܣ�:HPtNc�D^�.�o�KM�'�;�m��M^�Y@1����-x��� ���Zy�.ح.D7��:��yy�a9FLӊ&.����Ќ*�b[�_���YK�����o�rh��4���R��-#�^W�����O��9e���,�j�|��g[t_�+��*5�%��s�L��"��9&�M�z�,ǒ��﫛Ivk�?�F�o�S<`�E��b�_� ����5�F6i�R׭���QU����+��;r�k�J�"5�fQA�!a3<���Ez��<l��Y8�bЦj��Ex����D m���>� ��� @ܲ��cK�TyI�C�j�(�W,��\�Z{�k�aW�%� L�0��oK�M1V˪�i�
us6KN�����W�,ؠɶ46H4�%��W�H��W��UQ�9��������opЀ��K��j5%M� ��1=�������sT�m;����p�P3��mF�i�~v��.�\�ih6��wզO�;響.�#�qD�bR��F�e	�d��}5眜�E~�0V�n�$YM^\E�W9� ��a���������Zj��A�:���$mMq-r��=�ތr���/NS�A;��Vmn���������/YK�gOd��؟W\���S��x�H���n��ٷ���}��~_��"U�)y��V�-P<�L����8�;l���[�pf`�)x4��%���T$ R#���۪��$������O/�U��Q��R>�S]]�Uz���J��?\��He��7��pj H���� �ҿճ1�F�]V�i�k�4������z��ι�"y�a��X ����u�xo 9�	l��|?�]f<����h>O�kU4e�^��y�d�7] ����¾�15�^�^�B@A����y�G���.	"����nM� ��MR�C���I*����U͑��qQ��1��'�O��@��st*Q%�g��ԑ�����6���%!�S]]I'����ہ��[�N %]��}��xkX�|�X�j�5�-b�7�_>�b�D�X��y-弹���}���.	"�v����y�2�Kgƪ�:�_2�/��U����H�*�8~.a������;�u�ي� �  z7�B�aA���#��ǅ�-��@�Y�S��o��ǯ�1m�i��RɕTi�*���kF�Pީh��UW��+��E�-�ʿ�p�%�s��&V��X��u5K�鋮�K����,d�8�<(E��a�}uI�����>H��9ŏ���h��)q�I�m���%a�3�K)�L=4=R�F��t��h�Ӱ��yG�t�jO���-�a���͆v�ɗ������ �'ӈ�����{l���F-�Y��m5���OG$�&5��S`��T=��m���Nz��Q��*O;�s/�0Ҹt���٦���(�ߗ͹� �׭.�7����l�@�`��ϋ!�W���i=��?�sU|�����-�b;UR[s�����#�޾�0|���ɋ�� aM"�`�bY#����S˗��/��)�U=h���p�6���y��<��\�ysvuH��#���Ǳ�Cj<�I�F�-�n5�;�ӿ�m)�6��xH���t�V�zb���/�&C�V������	 ~lM��4$���nY}تf������g�w2|��}�o/	��x,m�a45_%j���95ձ⿨K]T=�R���>��\���J��}��p�tq���p�Q�Qє�^U�'�Gv����) 9�Ds�8��/U�X+K�t��>N6B/����b��v8�5ٮ�����kHV;�l�ǹ�����$j@���z���|���}duI�]����/�>�߱`Ov��������^���b��vP%]Tt��t�t��ڵwn���G@��v���(y[��҄r�)_ďKڲWW7��o��m�zXVm�S�N<�苺�%m٫�뵇�PuFW$�h
y� c�?q~Sw�ƌ���kٍ��w��|?�`������"�?RřU���3㣠�.�ivw5��I�Av)�"O.8��� �:߻����a�&��e�Qo��-'�3�ץ����K��]�5=%���ݯ��Ey��c�����+���7��Xp`ίc�k��ۆ�f���+�l��ZM�G�s8x�-e��k�*�$cD���s�(ʹ:�~0;O���g�#">#�R2|���������ii��g�(�7��e`��q>__�N��~7D�$61�f���J�������
���_<�F&�cI/����O<�����p�s&%�EWf�*\)Bb�{2��,Hg�ǹ�ݾ�r�$��8����ح)���v�B����.�Ӏ�Es�c�<*��i<�CZ}G�����R$У�]�<<+�����G{A}`�d��G <HA�7��p�P$��Iw���D����*[jIs�p�U��lh2*�WU�3y�f����؄��s) �XN��8������5��d8^!w�s�)� �z�y���~�2�Es��,�Tϖ?W�z��<���;p�$_��J���\{��6�O$�����Q� \���.���m�%t�В����]w'���U5��;7@Mn���P������8˵_؏���4iQ��%T	�L���G/��� �����k)�;��cÐ�
��Ǝ�^�׊7��Nك�ԗT�̦1�a� ��},�5� I���8��ś?��_�4��%�{[p�y!"�[��)�ߤjۃ�1�4,����ڔ�5�B�,SI�f��E#@��D6��Y4�[����/
|�\�hyF���!��9k�����8���T�J"E��rKtW+�&���q����D�D(��l�`��x�-S�\�5�𐼬��Hn��̪x���T� =i��X�u�p� -���i�����f6��y]{z��}��?��	,�����p��ZXϼ/q(��چH�Γ��1q���D��y���)���&������&��4Y*��� &��N��Z�5�_�`��	҃XM�g
d���!BK��N�SԎ<d��}�s*�3�'Ϲ���t���&p��q�����~�R���� +��U�#﫼�~�Z�u��P���́�`��c]8=��:��0��zq���Z�/���������8�� YB?Y-������ݏ���˻߾|����������??������ß�����DKm���U�Jr�lh$��?p�j����˷KV�`���.�g;pv�N��6�{�D�J�@f��=��Dp7y,L,�f�6%벡��	���M ��� <�
���{HUh1+ޖ�kf-�"�BXi����!��"[���������� �ULP     