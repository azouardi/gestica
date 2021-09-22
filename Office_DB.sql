PGDMP                         y           Office    12.3    12.3 �   �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    378039    Office    DATABASE     �   CREATE DATABASE "Office" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'French_France.1252' LC_CTYPE = 'French_France.1252';
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
       public          postgres    false    218            �           0    0    account_emailaddress_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.account_emailaddress_id_seq OWNED BY public.account_emailaddress.id;
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
       public          postgres    false    219            �           0    0     account_emailconfirmation_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.account_emailconfirmation_id_seq OWNED BY public.account_emailconfirmation.id;
          public          postgres    false    221                        1259    378682    accounts_portefolio    TABLE     �   CREATE TABLE public.accounts_portefolio (
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
       public          postgres    false    255            �           0    0    accounts_profile_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.accounts_profile_id_seq OWNED BY public.accounts_profile.id;
          public          postgres    false    254                       1259    379143    accounts_pwsafe    TABLE     2  CREATE TABLE public.accounts_pwsafe (
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
       public          postgres    false    253            �           0    0    accounts_scope_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.accounts_scope_id_seq OWNED BY public.accounts_scope.id;
          public          postgres    false    252                       1259    379172    accounts_validator    TABLE     �   CREATE TABLE public.accounts_validator (
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
       public          postgres    false    209            �           0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
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
       public          postgres    false    211            �           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
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
       public          postgres    false    207            �           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
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
       public          postgres    false    215            �           0    0    auth_user_groups_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;
          public          postgres    false    214            �            1259    378087    auth_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.auth_user_id_seq;
       public          postgres    false    213            �           0    0    auth_user_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;
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
       public          postgres    false    217            �           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;
          public          postgres    false    216            �            1259    378353    customers_bankacount    TABLE     "  CREATE TABLE public.customers_bankacount (
    id bigint NOT NULL,
    bank_name character varying(100) NOT NULL,
    agency character varying(100) NOT NULL,
    rib character varying(24) NOT NULL,
    closed boolean NOT NULL,
    clos_date timestamp with time zone,
    company_id uuid
);
 (   DROP TABLE public.customers_bankacount;
       public         heap    postgres    false            �            1259    378351    customers_bankacount_id_seq    SEQUENCE     �   CREATE SEQUENCE public.customers_bankacount_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.customers_bankacount_id_seq;
       public          postgres    false    236            �           0    0    customers_bankacount_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.customers_bankacount_id_seq OWNED BY public.customers_bankacount.id;
          public          postgres    false    235            �            1259    378243    customers_city    TABLE     h   CREATE TABLE public.customers_city (
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
       public          postgres    false    223            �           0    0    customers_city_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.customers_city_id_seq OWNED BY public.customers_city.id;
          public          postgres    false    222            �            1259    378251    customers_company    TABLE     ?  CREATE TABLE public.customers_company (
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
    nationality_id character varying(3)
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
       public         heap    postgres    false            �            1259    378289    customers_office    TABLE     s   CREATE TABLE public.customers_office (
    code_lf integer NOT NULL,
    office character varying(100) NOT NULL
);
 $   DROP TABLE public.customers_office;
       public         heap    postgres    false            �            1259    378296    customers_person    TABLE     �  CREATE TABLE public.customers_person (
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
    city_id bigint,
    country_id character varying(3),
    nationality_id character varying(3)
);
 $   DROP TABLE public.customers_person;
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
       public          postgres    false    232            �           0    0 #   customers_rolerepresentative_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.customers_rolerepresentative_id_seq OWNED BY public.customers_rolerepresentative.id;
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
       public         heap    postgres    false                       1259    378715    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
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
       public         heap    postgres    false                       1259    378713    django_admin_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public          postgres    false    258            �           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
          public          postgres    false    257            �            1259    378053    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
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
       public          postgres    false    205            �           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
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
       public          postgres    false    203            �           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
          public          postgres    false    202                       1259    378746    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         heap    postgres    false                       1259    378758    django_site    TABLE     �   CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);
    DROP TABLE public.django_site;
       public         heap    postgres    false                       1259    378756    django_site_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.django_site_id_seq;
       public          postgres    false    261            �           0    0    django_site_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;
          public          postgres    false    260                       1259    387446    editions_docmodel    TABLE     �   CREATE TABLE public.editions_docmodel (
    code_docmodel character varying(3) NOT NULL,
    name character varying(100) NOT NULL
);
 %   DROP TABLE public.editions_docmodel;
       public         heap    postgres    false                       1259    387458    editions_docmodelword    TABLE     _  CREATE TABLE public.editions_docmodelword (
    id bigint NOT NULL,
    ordre_parag integer,
    type_parag integer,
    sort_parag integer,
    size_font numeric(4,2),
    space_after_parag numeric(4,2),
    space_befor_parag numeric(4,2),
    alignment_parag integer,
    ident_first_ligne numeric(4,2),
    code_docmodel_id character varying(3)
);
 )   DROP TABLE public.editions_docmodelword;
       public         heap    postgres    false                       1259    387456    editions_docmodelword_id_seq    SEQUENCE     �   CREATE SEQUENCE public.editions_docmodelword_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.editions_docmodelword_id_seq;
       public          postgres    false    276            �           0    0    editions_docmodelword_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.editions_docmodelword_id_seq OWNED BY public.editions_docmodelword.id;
          public          postgres    false    275                       1259    387451    editions_socialdoc    TABLE     �   CREATE TABLE public.editions_socialdoc (
    id uuid NOT NULL,
    date_doc timestamp with time zone NOT NULL,
    lettremission_id uuid
);
 &   DROP TABLE public.editions_socialdoc;
       public         heap    postgres    false            �            1259    378576    ordres_lettremission    TABLE     \  CREATE TABLE public.ordres_lettremission (
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
       public          postgres    false    243            �           0    0    ordres_moduleservice_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.ordres_moduleservice_id_seq OWNED BY public.ordres_moduleservice.id;
          public          postgres    false    242            �            1259    378541    ordres_ordre    TABLE     �   CREATE TABLE public.ordres_ordre (
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
       public          postgres    false    246            �           0    0    ordres_outlay_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.ordres_outlay_id_seq OWNED BY public.ordres_outlay.id;
          public          postgres    false    245            �            1259    378571    ordres_outlayitem    TABLE     �   CREATE TABLE public.ordres_outlayitem (
    id uuid NOT NULL,
    amount double precision,
    ordre_id uuid,
    outlay_id bigint
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
       public          postgres    false    248            �           0    0    ordres_service_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.ordres_service_id_seq OWNED BY public.ordres_service.id;
          public          postgres    false    247            �            1259    378566    ordres_serviceitem    TABLE     �   CREATE TABLE public.ordres_serviceitem (
    id uuid NOT NULL,
    amount double precision,
    taxe double precision NOT NULL,
    ordre_id uuid,
    service_id bigint
);
 &   DROP TABLE public.ordres_serviceitem;
       public         heap    postgres    false                       1259    378767    tasks_benefit    TABLE     �   CREATE TABLE public.tasks_benefit (
    code_benefit character varying(3) NOT NULL,
    name character varying(200) NOT NULL
);
 !   DROP TABLE public.tasks_benefit;
       public         heap    postgres    false                       1259    378801    tasks_benefititem    TABLE     �   CREATE TABLE public.tasks_benefititem (
    id uuid NOT NULL,
    active boolean NOT NULL,
    benefitlink_id uuid,
    date_start date,
    code_benefit_id character varying(3)
);
 %   DROP TABLE public.tasks_benefititem;
       public         heap    postgres    false                       1259    378772    tasks_benefitlink    TABLE     [   CREATE TABLE public.tasks_benefitlink (
    id uuid NOT NULL,
    lettremission_id uuid
);
 %   DROP TABLE public.tasks_benefitlink;
       public         heap    postgres    false                       1259    378811    tasks_benefitrequested    TABLE     ?  CREATE TABLE public.tasks_benefitrequested (
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
       public         heap    postgres    false                       1259    378796    tasks_claim    TABLE       CREATE TABLE public.tasks_claim (
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
       public         heap    postgres    false                       1259    378779    tasks_period    TABLE     �   CREATE TABLE public.tasks_period (
    id uuid NOT NULL,
    period character varying(6) NOT NULL,
    echeance date NOT NULL
);
     DROP TABLE public.tasks_period;
       public         heap    postgres    false            	           1259    378786 
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
       public         heap    postgres    false                       1259    378806    tasks_vatrequested    TABLE     ;  CREATE TABLE public.tasks_vatrequested (
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
       public         heap    postgres    false            
           1259    378791 
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
       public          postgres    false    255    254    255            �           2604    378664    accounts_scope id    DEFAULT     v   ALTER TABLE ONLY public.accounts_scope ALTER COLUMN id SET DEFAULT nextval('public.accounts_scope_id_seq'::regclass);
 @   ALTER TABLE public.accounts_scope ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    253    252    253            �           2604    378074    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    208    209    209            �           2604    378084    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    210    211    211            �           2604    378066    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    206    207    207            �           2604    378092    auth_user id    DEFAULT     l   ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);
 ;   ALTER TABLE public.auth_user ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    213    212    213            �           2604    378102    auth_user_groups id    DEFAULT     z   ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);
 B   ALTER TABLE public.auth_user_groups ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214    215            �           2604    378110    auth_user_user_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);
 L   ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    217    217            �           2604    378356    customers_bankacount id    DEFAULT     �   ALTER TABLE ONLY public.customers_bankacount ALTER COLUMN id SET DEFAULT nextval('public.customers_bankacount_id_seq'::regclass);
 F   ALTER TABLE public.customers_bankacount ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    235    236    236            �           2604    378246    customers_city id    DEFAULT     v   ALTER TABLE ONLY public.customers_city ALTER COLUMN id SET DEFAULT nextval('public.customers_city_id_seq'::regclass);
 @   ALTER TABLE public.customers_city ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    222    223            �           2604    378309    customers_rolerepresentative id    DEFAULT     �   ALTER TABLE ONLY public.customers_rolerepresentative ALTER COLUMN id SET DEFAULT nextval('public.customers_rolerepresentative_id_seq'::regclass);
 N   ALTER TABLE public.customers_rolerepresentative ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    232    231    232            �           2604    378718    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    257    258    258            �           2604    378056    django_content_type id    DEFAULT     �   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    205    204    205            �           2604    378045    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    203    202    203            �           2604    378761    django_site id    DEFAULT     p   ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);
 =   ALTER TABLE public.django_site ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    260    261    261            �           2604    387461    editions_docmodelword id    DEFAULT     �   ALTER TABLE ONLY public.editions_docmodelword ALTER COLUMN id SET DEFAULT nextval('public.editions_docmodelword_id_seq'::regclass);
 G   ALTER TABLE public.editions_docmodelword ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    276    275    276            �           2604    378536    ordres_moduleservice id    DEFAULT     �   ALTER TABLE ONLY public.ordres_moduleservice ALTER COLUMN id SET DEFAULT nextval('public.ordres_moduleservice_id_seq'::regclass);
 F   ALTER TABLE public.ordres_moduleservice ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    242    243    243            �           2604    378551    ordres_outlay id    DEFAULT     t   ALTER TABLE ONLY public.ordres_outlay ALTER COLUMN id SET DEFAULT nextval('public.ordres_outlay_id_seq'::regclass);
 ?   ALTER TABLE public.ordres_outlay ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    246    245    246            �           2604    378561    ordres_service id    DEFAULT     v   ALTER TABLE ONLY public.ordres_service ALTER COLUMN id SET DEFAULT nextval('public.ordres_service_id_seq'::regclass);
 @   ALTER TABLE public.ordres_service ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    248    247    248            �          0    378167    account_emailaddress 
   TABLE DATA           W   COPY public.account_emailaddress (id, email, verified, "primary", user_id) FROM stdin;
    public          postgres    false    218   ��      �          0    378177    account_emailconfirmation 
   TABLE DATA           ]   COPY public.account_emailconfirmation (id, created, sent, key, email_address_id) FROM stdin;
    public          postgres    false    219   �      �          0    378682    accounts_portefolio 
   TABLE DATA           x   COPY public.accounts_portefolio (id, active, date_created, lettremission_id, rolecollaborateur_id, user_id) FROM stdin;
    public          postgres    false    256   2�      �          0    378671    accounts_profile 
   TABLE DATA           _   COPY public.accounts_profile (id, name, phone, email, file, date_created, user_id) FROM stdin;
    public          postgres    false    255   �      �          0    379143    accounts_pwsafe 
   TABLE DATA              COPY public.accounts_pwsafe (id, active, date_created, username, password, lettremission_id, user_id, responsable) FROM stdin;
    public          postgres    false    271   ��      �          0    378661    accounts_scope 
   TABLE DATA           5   COPY public.accounts_scope (id, "Scope") FROM stdin;
    public          postgres    false    253   F�      �          0    379172    accounts_validator 
   TABLE DATA           a   COPY public.accounts_validator (id, active, date_created, lettremission_id, user_id) FROM stdin;
    public          postgres    false    272   ��      �          0    378071 
   auth_group 
   TABLE DATA           .   COPY public.auth_group (id, name) FROM stdin;
    public          postgres    false    209   W�      �          0    378081    auth_group_permissions 
   TABLE DATA           M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public          postgres    false    211   ��      �          0    378063    auth_permission 
   TABLE DATA           N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public          postgres    false    207   ��      �          0    378089 	   auth_user 
   TABLE DATA           �   COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    public          postgres    false    213   "�      �          0    378099    auth_user_groups 
   TABLE DATA           A   COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
    public          postgres    false    215   Q�      �          0    378107    auth_user_user_permissions 
   TABLE DATA           P   COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public          postgres    false    217   t�      �          0    378353    customers_bankacount 
   TABLE DATA           i   COPY public.customers_bankacount (id, bank_name, agency, rib, closed, clos_date, company_id) FROM stdin;
    public          postgres    false    236   ��      �          0    378243    customers_city 
   TABLE DATA           2   COPY public.customers_city (id, city) FROM stdin;
    public          postgres    false    223   ��      �          0    378251    customers_company 
   TABLE DATA           0  COPY public.customers_company (id, name, adresse, code_postal, national_law, ice, identifiant_fiscal, cnss, rc, tp, activity, fiscal_year, create_date, share_capital, nominal_value, statut, terminate_date, liquidation_date, file, city, country_id, currency_id, legal_form_id, nationality_id) FROM stdin;
    public          postgres    false    224   ˯      �          0    378381    customers_contact 
   TABLE DATA           f   COPY public.customers_contact (id, fonction, email, phone, active, company_id, person_id) FROM stdin;
    public          postgres    false    241   Q      �          0    378261    customers_country 
   TABLE DATA           B   COPY public.customers_country (code_country, country) FROM stdin;
    public          postgres    false    225   n      �          0    378268    customers_currency 
   TABLE DATA           E   COPY public.customers_currency (currency_code, currency) FROM stdin;
    public          postgres    false    226         �          0    378275    customers_legalform 
   TABLE DATA           M   COPY public.customers_legalform (code_lf, lf_name, full_lf_name) FROM stdin;
    public          postgres    false    227   a      �          0    378282    customers_nationality 
   TABLE DATA           N   COPY public.customers_nationality (code_nationality, nationality) FROM stdin;
    public          postgres    false    228   q      �          0    378289    customers_office 
   TABLE DATA           ;   COPY public.customers_office (code_lf, office) FROM stdin;
    public          postgres    false    229   S      �          0    378296    customers_person 
   TABLE DATA           �   COPY public.customers_person (id, last_name, first_name, civility, id_card, id_numbre, birth_date, birth_place, adresse, code_postal, resident, city_id, country_id, nationality_id) FROM stdin;
    public          postgres    false    230   �      �          0    378376    customers_representative 
   TABLE DATA           �   COPY public.customers_representative (id, date_nomination, terminate_role, company_id, person_id, rolerepresentative_id) FROM stdin;
    public          postgres    false    240   �      �          0    378371    customers_representativecompany 
   TABLE DATA           �   COPY public.customers_representativecompany (id, date_nomination, terminate_role, company_id, representativelink_id, rolerepresentative_id) FROM stdin;
    public          postgres    false    239   �      �          0    378321    customers_representativelink 
   TABLE DATA           W   COPY public.customers_representativelink (id, date_nomination, company_id) FROM stdin;
    public          postgres    false    234   
      �          0    378306    customers_rolerepresentative 
   TABLE DATA           N   COPY public.customers_rolerepresentative (id, rolerepresentative) FROM stdin;
    public          postgres    false    232   x      �          0    378366    customers_shareholder 
   TABLE DATA           R   COPY public.customers_shareholder (id, action, company_id, person_id) FROM stdin;
    public          postgres    false    238   �      �          0    378361    customers_shareholdercompany 
   TABLE DATA           b   COPY public.customers_shareholdercompany (id, action, company_id, shareholderlink_id) FROM stdin;
    public          postgres    false    237   �      �          0    378314    customers_shareholderlink 
   TABLE DATA           W   COPY public.customers_shareholderlink (id, date_participation, company_id) FROM stdin;
    public          postgres    false    233   #      �          0    378715    django_admin_log 
   TABLE DATA           �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public          postgres    false    258   �      �          0    378053    django_content_type 
   TABLE DATA           C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public          postgres    false    205   �U      �          0    378042    django_migrations 
   TABLE DATA           C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public          postgres    false    203   �W      �          0    378746    django_session 
   TABLE DATA           P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public          postgres    false    259   \      �          0    378758    django_site 
   TABLE DATA           7   COPY public.django_site (id, domain, name) FROM stdin;
    public          postgres    false    261   �]      �          0    387446    editions_docmodel 
   TABLE DATA           @   COPY public.editions_docmodel (code_docmodel, name) FROM stdin;
    public          postgres    false    273   �]      �          0    387458    editions_docmodelword 
   TABLE DATA           �   COPY public.editions_docmodelword (id, ordre_parag, type_parag, sort_parag, size_font, space_after_parag, space_befor_parag, alignment_parag, ident_first_ligne, code_docmodel_id) FROM stdin;
    public          postgres    false    276   �]      �          0    387451    editions_socialdoc 
   TABLE DATA           L   COPY public.editions_socialdoc (id, date_doc, lettremission_id) FROM stdin;
    public          postgres    false    274   �]      �          0    378576    ordres_lettremission 
   TABLE DATA           �   COPY public.ordres_lettremission (id, reference, db_office, entry_date, terminate, leave_date, file, company_id, moduleservice_id, office_id) FROM stdin;
    public          postgres    false    251   	^      �          0    378533    ordres_moduleservice 
   TABLE DATA           A   COPY public.ordres_moduleservice (id, moduleservice) FROM stdin;
    public          postgres    false    243   �      �          0    378541    ordres_ordre 
   TABLE DATA           d   COPY public.ordres_ordre (id, ordre_date, comment, statut, file, company_id, office_id) FROM stdin;
    public          postgres    false    244   i�      �          0    378548    ordres_outlay 
   TABLE DATA           K   COPY public.ordres_outlay (id, outlay, text, moduleservice_id) FROM stdin;
    public          postgres    false    246   ��      �          0    378571    ordres_outlayitem 
   TABLE DATA           L   COPY public.ordres_outlayitem (id, amount, ordre_id, outlay_id) FROM stdin;
    public          postgres    false    250   ��      �          0    378558    ordres_service 
   TABLE DATA           M   COPY public.ordres_service (id, service, text, moduleservice_id) FROM stdin;
    public          postgres    false    248   ��      �          0    378566    ordres_serviceitem 
   TABLE DATA           T   COPY public.ordres_serviceitem (id, amount, taxe, ordre_id, service_id) FROM stdin;
    public          postgres    false    249   ݌      �          0    378767    tasks_benefit 
   TABLE DATA           ;   COPY public.tasks_benefit (code_benefit, name) FROM stdin;
    public          postgres    false    262   ��      �          0    378801    tasks_benefititem 
   TABLE DATA           d   COPY public.tasks_benefititem (id, active, benefitlink_id, date_start, code_benefit_id) FROM stdin;
    public          postgres    false    268   ��      �          0    378772    tasks_benefitlink 
   TABLE DATA           A   COPY public.tasks_benefitlink (id, lettremission_id) FROM stdin;
    public          postgres    false    263   ��      �          0    378811    tasks_benefitrequested 
   TABLE DATA           �   COPY public.tasks_benefitrequested (id, year, month, amountrequested, amountreceived, statut, complement, benefitlink_id, lettremission_id) FROM stdin;
    public          postgres    false    270   ��      �          0    378796    tasks_claim 
   TABLE DATA           v   COPY public.tasks_claim (id, objet, date_start, statut, date_end, complement, invoiced, lettremission_id) FROM stdin;
    public          postgres    false    267   �      �          0    378779    tasks_period 
   TABLE DATA           <   COPY public.tasks_period (id, period, echeance) FROM stdin;
    public          postgres    false    264   %�      �          0    378786 
   tasks_task 
   TABLE DATA           �   COPY public.tasks_task (code_task, name, category, to_add, numbre_add, frequency, year_civil, repeted, persontype, specific, code_benefit_id) FROM stdin;
    public          postgres    false    265   ��      �          0    378806    tasks_vatrequested 
   TABLE DATA           �   COPY public.tasks_vatrequested (id, year, month, amountrequested, amountreceived, statut, complement, benefitlink_id, lettremission_id) FROM stdin;
    public          postgres    false    269   d�      �          0    378791 
   tasks_work 
   TABLE DATA           �   COPY public.tasks_work (id, date_limit, value, proof, statut, file, period_id, lettremission_id, task_id, supervised) FROM stdin;
    public          postgres    false    266   ��      �           0    0    account_emailaddress_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.account_emailaddress_id_seq', 1, false);
          public          postgres    false    220            �           0    0     account_emailconfirmation_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.account_emailconfirmation_id_seq', 1, false);
          public          postgres    false    221            �           0    0    accounts_profile_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.accounts_profile_id_seq', 2, true);
          public          postgres    false    254            �           0    0    accounts_scope_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.accounts_scope_id_seq', 1, false);
          public          postgres    false    252            �           0    0    auth_group_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, true);
          public          postgres    false    208            �           0    0    auth_group_permissions_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, true);
          public          postgres    false    210            �           0    0    auth_permission_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_permission_id_seq', 200, true);
          public          postgres    false    206            �           0    0    auth_user_groups_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, true);
          public          postgres    false    214            �           0    0    auth_user_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.auth_user_id_seq', 2, true);
          public          postgres    false    212            �           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);
          public          postgres    false    216            �           0    0    customers_bankacount_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.customers_bankacount_id_seq', 1, false);
          public          postgres    false    235            �           0    0    customers_city_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.customers_city_id_seq', 1, false);
          public          postgres    false    222            �           0    0 #   customers_rolerepresentative_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.customers_rolerepresentative_id_seq', 1, false);
          public          postgres    false    231            �           0    0    django_admin_log_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 440, true);
          public          postgres    false    257            �           0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 50, true);
          public          postgres    false    204            �           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 54, true);
          public          postgres    false    202            �           0    0    django_site_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.django_site_id_seq', 1, true);
          public          postgres    false    260            �           0    0    editions_docmodelword_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.editions_docmodelword_id_seq', 1, false);
          public          postgres    false    275            �           0    0    ordres_moduleservice_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.ordres_moduleservice_id_seq', 1, false);
          public          postgres    false    242            �           0    0    ordres_outlay_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.ordres_outlay_id_seq', 1, false);
          public          postgres    false    245            �           0    0    ordres_service_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.ordres_service_id_seq', 1, false);
          public          postgres    false    247            �           2606    378200 3   account_emailaddress account_emailaddress_email_key 
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
       public            postgres    false    219            j           2606    378686 ,   accounts_portefolio accounts_portefolio_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.accounts_portefolio
    ADD CONSTRAINT accounts_portefolio_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.accounts_portefolio DROP CONSTRAINT accounts_portefolio_pkey;
       public            postgres    false    256            n           2606    378694 N   accounts_portefolio accounts_portefolio_user_id_lettremission_id_e6855540_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.accounts_portefolio
    ADD CONSTRAINT accounts_portefolio_user_id_lettremission_id_e6855540_uniq UNIQUE (user_id, lettremission_id);
 x   ALTER TABLE ONLY public.accounts_portefolio DROP CONSTRAINT accounts_portefolio_user_id_lettremission_id_e6855540_uniq;
       public            postgres    false    256    256            e           2606    378679 &   accounts_profile accounts_profile_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.accounts_profile
    ADD CONSTRAINT accounts_profile_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.accounts_profile DROP CONSTRAINT accounts_profile_pkey;
       public            postgres    false    255            g           2606    378681 -   accounts_profile accounts_profile_user_id_key 
   CONSTRAINT     k   ALTER TABLE ONLY public.accounts_profile
    ADD CONSTRAINT accounts_profile_user_id_key UNIQUE (user_id);
 W   ALTER TABLE ONLY public.accounts_profile DROP CONSTRAINT accounts_profile_user_id_key;
       public            postgres    false    255            �           2606    379147 $   accounts_pwsafe accounts_pwsafe_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.accounts_pwsafe
    ADD CONSTRAINT accounts_pwsafe_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.accounts_pwsafe DROP CONSTRAINT accounts_pwsafe_pkey;
       public            postgres    false    271            �           2606    379149 G   accounts_pwsafe accounts_pwsafe_username_lettremission_id_3c7f44d1_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.accounts_pwsafe
    ADD CONSTRAINT accounts_pwsafe_username_lettremission_id_3c7f44d1_uniq UNIQUE (username, lettremission_id);
 q   ALTER TABLE ONLY public.accounts_pwsafe DROP CONSTRAINT accounts_pwsafe_username_lettremission_id_3c7f44d1_uniq;
       public            postgres    false    271    271            a           2606    378668 '   accounts_scope accounts_scope_Scope_key 
   CONSTRAINT     g   ALTER TABLE ONLY public.accounts_scope
    ADD CONSTRAINT "accounts_scope_Scope_key" UNIQUE ("Scope");
 S   ALTER TABLE ONLY public.accounts_scope DROP CONSTRAINT "accounts_scope_Scope_key";
       public            postgres    false    253            c           2606    378666 "   accounts_scope accounts_scope_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.accounts_scope
    ADD CONSTRAINT accounts_scope_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.accounts_scope DROP CONSTRAINT accounts_scope_pkey;
       public            postgres    false    253            �           2606    379176 *   accounts_validator accounts_validator_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.accounts_validator
    ADD CONSTRAINT accounts_validator_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.accounts_validator DROP CONSTRAINT accounts_validator_pkey;
       public            postgres    false    272            �           2606    379178 L   accounts_validator accounts_validator_user_id_lettremission_id_dd0dd010_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.accounts_validator
    ADD CONSTRAINT accounts_validator_user_id_lettremission_id_dd0dd010_uniq UNIQUE (user_id, lettremission_id);
 v   ALTER TABLE ONLY public.accounts_validator DROP CONSTRAINT accounts_validator_user_id_lettremission_id_dd0dd010_uniq;
       public            postgres    false    272    272            �           2606    378744    auth_group auth_group_name_key 
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
       public            postgres    false    213                       2606    378358 .   customers_bankacount customers_bankacount_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.customers_bankacount
    ADD CONSTRAINT customers_bankacount_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.customers_bankacount DROP CONSTRAINT customers_bankacount_pkey;
       public            postgres    false    236                       2606    378360 1   customers_bankacount customers_bankacount_rib_key 
   CONSTRAINT     k   ALTER TABLE ONLY public.customers_bankacount
    ADD CONSTRAINT customers_bankacount_rib_key UNIQUE (rib);
 [   ALTER TABLE ONLY public.customers_bankacount DROP CONSTRAINT customers_bankacount_rib_key;
       public            postgres    false    236            �           2606    378250 &   customers_city customers_city_city_key 
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
       public            postgres    false    224            0           2606    378518 F   customers_contact customers_contact_company_id_person_id_63ddd7a1_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.customers_contact
    ADD CONSTRAINT customers_contact_company_id_person_id_63ddd7a1_uniq UNIQUE (company_id, person_id);
 p   ALTER TABLE ONLY public.customers_contact DROP CONSTRAINT customers_contact_company_id_person_id_63ddd7a1_uniq;
       public            postgres    false    241    241            3           2606    378385 (   customers_contact customers_contact_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.customers_contact
    ADD CONSTRAINT customers_contact_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.customers_contact DROP CONSTRAINT customers_contact_pkey;
       public            postgres    false    241            �           2606    378267 /   customers_country customers_country_country_key 
   CONSTRAINT     m   ALTER TABLE ONLY public.customers_country
    ADD CONSTRAINT customers_country_country_key UNIQUE (country);
 Y   ALTER TABLE ONLY public.customers_country DROP CONSTRAINT customers_country_country_key;
       public            postgres    false    225            �           2606    378265 (   customers_country customers_country_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.customers_country
    ADD CONSTRAINT customers_country_pkey PRIMARY KEY (code_country);
 R   ALTER TABLE ONLY public.customers_country DROP CONSTRAINT customers_country_pkey;
       public            postgres    false    225            �           2606    378274 2   customers_currency customers_currency_currency_key 
   CONSTRAINT     q   ALTER TABLE ONLY public.customers_currency
    ADD CONSTRAINT customers_currency_currency_key UNIQUE (currency);
 \   ALTER TABLE ONLY public.customers_currency DROP CONSTRAINT customers_currency_currency_key;
       public            postgres    false    226            �           2606    378272 *   customers_currency customers_currency_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY public.customers_currency
    ADD CONSTRAINT customers_currency_pkey PRIMARY KEY (currency_code);
 T   ALTER TABLE ONLY public.customers_currency DROP CONSTRAINT customers_currency_pkey;
       public            postgres    false    226            �           2606    378281 3   customers_legalform customers_legalform_lf_name_key 
   CONSTRAINT     q   ALTER TABLE ONLY public.customers_legalform
    ADD CONSTRAINT customers_legalform_lf_name_key UNIQUE (lf_name);
 ]   ALTER TABLE ONLY public.customers_legalform DROP CONSTRAINT customers_legalform_lf_name_key;
       public            postgres    false    227            �           2606    378279 ,   customers_legalform customers_legalform_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.customers_legalform
    ADD CONSTRAINT customers_legalform_pkey PRIMARY KEY (code_lf);
 V   ALTER TABLE ONLY public.customers_legalform DROP CONSTRAINT customers_legalform_pkey;
       public            postgres    false    227            �           2606    378288 ;   customers_nationality customers_nationality_nationality_key 
   CONSTRAINT     }   ALTER TABLE ONLY public.customers_nationality
    ADD CONSTRAINT customers_nationality_nationality_key UNIQUE (nationality);
 e   ALTER TABLE ONLY public.customers_nationality DROP CONSTRAINT customers_nationality_nationality_key;
       public            postgres    false    228            �           2606    378286 0   customers_nationality customers_nationality_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.customers_nationality
    ADD CONSTRAINT customers_nationality_pkey PRIMARY KEY (code_nationality);
 Z   ALTER TABLE ONLY public.customers_nationality DROP CONSTRAINT customers_nationality_pkey;
       public            postgres    false    228            �           2606    378295 ,   customers_office customers_office_office_key 
   CONSTRAINT     i   ALTER TABLE ONLY public.customers_office
    ADD CONSTRAINT customers_office_office_key UNIQUE (office);
 V   ALTER TABLE ONLY public.customers_office DROP CONSTRAINT customers_office_office_key;
       public            postgres    false    229            �           2606    378293 &   customers_office customers_office_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.customers_office
    ADD CONSTRAINT customers_office_pkey PRIMARY KEY (code_lf);
 P   ALTER TABLE ONLY public.customers_office DROP CONSTRAINT customers_office_pkey;
       public            postgres    false    229            �           2606    378403 D   customers_person customers_person_last_name_first_name_88406199_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.customers_person
    ADD CONSTRAINT customers_person_last_name_first_name_88406199_uniq UNIQUE (last_name, first_name);
 n   ALTER TABLE ONLY public.customers_person DROP CONSTRAINT customers_person_last_name_first_name_88406199_uniq;
       public            postgres    false    230    230                        2606    378303 &   customers_person customers_person_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.customers_person
    ADD CONSTRAINT customers_person_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.customers_person DROP CONSTRAINT customers_person_pkey;
       public            postgres    false    230            )           2606    378498 T   customers_representative customers_representative_company_id_person_id_fa330ece_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.customers_representative
    ADD CONSTRAINT customers_representative_company_id_person_id_fa330ece_uniq UNIQUE (company_id, person_id);
 ~   ALTER TABLE ONLY public.customers_representative DROP CONSTRAINT customers_representative_company_id_person_id_fa330ece_uniq;
       public            postgres    false    240    240            !           2606    378478 _   customers_representativecompany customers_representative_company_id_representativ_476df8f0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.customers_representativecompany
    ADD CONSTRAINT customers_representative_company_id_representativ_476df8f0_uniq UNIQUE (company_id, representativelink_id);
 �   ALTER TABLE ONLY public.customers_representativecompany DROP CONSTRAINT customers_representative_company_id_representativ_476df8f0_uniq;
       public            postgres    false    239    239            ,           2606    378380 6   customers_representative customers_representative_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.customers_representative
    ADD CONSTRAINT customers_representative_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.customers_representative DROP CONSTRAINT customers_representative_pkey;
       public            postgres    false    240            $           2606    378375 D   customers_representativecompany customers_representativecompany_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.customers_representativecompany
    ADD CONSTRAINT customers_representativecompany_pkey PRIMARY KEY (id);
 n   ALTER TABLE ONLY public.customers_representativecompany DROP CONSTRAINT customers_representativecompany_pkey;
       public            postgres    false    239                       2606    378327 H   customers_representativelink customers_representativelink_company_id_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.customers_representativelink
    ADD CONSTRAINT customers_representativelink_company_id_key UNIQUE (company_id);
 r   ALTER TABLE ONLY public.customers_representativelink DROP CONSTRAINT customers_representativelink_company_id_key;
       public            postgres    false    234                       2606    378325 >   customers_representativelink customers_representativelink_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.customers_representativelink
    ADD CONSTRAINT customers_representativelink_pkey PRIMARY KEY (id);
 h   ALTER TABLE ONLY public.customers_representativelink DROP CONSTRAINT customers_representativelink_pkey;
       public            postgres    false    234                       2606    378311 >   customers_rolerepresentative customers_rolerepresentative_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.customers_rolerepresentative
    ADD CONSTRAINT customers_rolerepresentative_pkey PRIMARY KEY (id);
 h   ALTER TABLE ONLY public.customers_rolerepresentative DROP CONSTRAINT customers_rolerepresentative_pkey;
       public            postgres    false    232                       2606    378313 P   customers_rolerepresentative customers_rolerepresentative_rolerepresentative_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.customers_rolerepresentative
    ADD CONSTRAINT customers_rolerepresentative_rolerepresentative_key UNIQUE (rolerepresentative);
 z   ALTER TABLE ONLY public.customers_rolerepresentative DROP CONSTRAINT customers_rolerepresentative_rolerepresentative_key;
       public            postgres    false    232                       2606    378464 N   customers_shareholder customers_shareholder_company_id_person_id_be1b9d8e_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.customers_shareholder
    ADD CONSTRAINT customers_shareholder_company_id_person_id_be1b9d8e_uniq UNIQUE (company_id, person_id);
 x   ALTER TABLE ONLY public.customers_shareholder DROP CONSTRAINT customers_shareholder_company_id_person_id_be1b9d8e_uniq;
       public            postgres    false    238    238                       2606    378370 0   customers_shareholder customers_shareholder_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.customers_shareholder
    ADD CONSTRAINT customers_shareholder_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.customers_shareholder DROP CONSTRAINT customers_shareholder_pkey;
       public            postgres    false    238                       2606    378450 \   customers_shareholdercompany customers_shareholdercom_company_id_shareholderli_4bcc8ed3_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.customers_shareholdercompany
    ADD CONSTRAINT customers_shareholdercom_company_id_shareholderli_4bcc8ed3_uniq UNIQUE (company_id, shareholderlink_id);
 �   ALTER TABLE ONLY public.customers_shareholdercompany DROP CONSTRAINT customers_shareholdercom_company_id_shareholderli_4bcc8ed3_uniq;
       public            postgres    false    237    237                       2606    378365 >   customers_shareholdercompany customers_shareholdercompany_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.customers_shareholdercompany
    ADD CONSTRAINT customers_shareholdercompany_pkey PRIMARY KEY (id);
 h   ALTER TABLE ONLY public.customers_shareholdercompany DROP CONSTRAINT customers_shareholdercompany_pkey;
       public            postgres    false    237                       2606    378320 B   customers_shareholderlink customers_shareholderlink_company_id_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.customers_shareholderlink
    ADD CONSTRAINT customers_shareholderlink_company_id_key UNIQUE (company_id);
 l   ALTER TABLE ONLY public.customers_shareholderlink DROP CONSTRAINT customers_shareholderlink_company_id_key;
       public            postgres    false    233            	           2606    378318 8   customers_shareholderlink customers_shareholderlink_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.customers_shareholderlink
    ADD CONSTRAINT customers_shareholderlink_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.customers_shareholderlink DROP CONSTRAINT customers_shareholderlink_pkey;
       public            postgres    false    233            q           2606    378724 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public            postgres    false    258            �           2606    378060 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
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
       public            postgres    false    203            u           2606    378753 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public            postgres    false    259            y           2606    378765 ,   django_site django_site_domain_a2e37b91_uniq 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);
 V   ALTER TABLE ONLY public.django_site DROP CONSTRAINT django_site_domain_a2e37b91_uniq;
       public            postgres    false    261            {           2606    378763    django_site django_site_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.django_site DROP CONSTRAINT django_site_pkey;
       public            postgres    false    261            �           2606    387450 (   editions_docmodel editions_docmodel_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.editions_docmodel
    ADD CONSTRAINT editions_docmodel_pkey PRIMARY KEY (code_docmodel);
 R   ALTER TABLE ONLY public.editions_docmodel DROP CONSTRAINT editions_docmodel_pkey;
       public            postgres    false    273            �           2606    387463 0   editions_docmodelword editions_docmodelword_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.editions_docmodelword
    ADD CONSTRAINT editions_docmodelword_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.editions_docmodelword DROP CONSTRAINT editions_docmodelword_pkey;
       public            postgres    false    276            �           2606    387455 *   editions_socialdoc editions_socialdoc_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.editions_socialdoc
    ADD CONSTRAINT editions_socialdoc_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.editions_socialdoc DROP CONSTRAINT editions_socialdoc_pkey;
       public            postgres    false    274            Y           2606    387408 P   ordres_lettremission ordres_lettremission_office_id_company_id_mod_2e10e0b8_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.ordres_lettremission
    ADD CONSTRAINT ordres_lettremission_office_id_company_id_mod_2e10e0b8_uniq UNIQUE (office_id, company_id, moduleservice_id);
 z   ALTER TABLE ONLY public.ordres_lettremission DROP CONSTRAINT ordres_lettremission_office_id_company_id_mod_2e10e0b8_uniq;
       public            postgres    false    251    251    251            [           2606    378580 .   ordres_lettremission ordres_lettremission_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.ordres_lettremission
    ADD CONSTRAINT ordres_lettremission_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.ordres_lettremission DROP CONSTRAINT ordres_lettremission_pkey;
       public            postgres    false    251            ^           2606    378582 7   ordres_lettremission ordres_lettremission_reference_key 
   CONSTRAINT     w   ALTER TABLE ONLY public.ordres_lettremission
    ADD CONSTRAINT ordres_lettremission_reference_key UNIQUE (reference);
 a   ALTER TABLE ONLY public.ordres_lettremission DROP CONSTRAINT ordres_lettremission_reference_key;
       public            postgres    false    251            6           2606    378540 ;   ordres_moduleservice ordres_moduleservice_moduleservice_key 
   CONSTRAINT        ALTER TABLE ONLY public.ordres_moduleservice
    ADD CONSTRAINT ordres_moduleservice_moduleservice_key UNIQUE (moduleservice);
 e   ALTER TABLE ONLY public.ordres_moduleservice DROP CONSTRAINT ordres_moduleservice_moduleservice_key;
       public            postgres    false    243            8           2606    378538 .   ordres_moduleservice ordres_moduleservice_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.ordres_moduleservice
    ADD CONSTRAINT ordres_moduleservice_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.ordres_moduleservice DROP CONSTRAINT ordres_moduleservice_pkey;
       public            postgres    false    243            <           2606    378545    ordres_ordre ordres_ordre_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.ordres_ordre
    ADD CONSTRAINT ordres_ordre_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.ordres_ordre DROP CONSTRAINT ordres_ordre_pkey;
       public            postgres    false    244            ?           2606    378597 A   ordres_outlay ordres_outlay_moduleservice_id_outlay_c43f75fa_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.ordres_outlay
    ADD CONSTRAINT ordres_outlay_moduleservice_id_outlay_c43f75fa_uniq UNIQUE (moduleservice_id, outlay);
 k   ALTER TABLE ONLY public.ordres_outlay DROP CONSTRAINT ordres_outlay_moduleservice_id_outlay_c43f75fa_uniq;
       public            postgres    false    246    246            B           2606    378555 &   ordres_outlay ordres_outlay_outlay_key 
   CONSTRAINT     c   ALTER TABLE ONLY public.ordres_outlay
    ADD CONSTRAINT ordres_outlay_outlay_key UNIQUE (outlay);
 P   ALTER TABLE ONLY public.ordres_outlay DROP CONSTRAINT ordres_outlay_outlay_key;
       public            postgres    false    246            D           2606    378553     ordres_outlay ordres_outlay_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.ordres_outlay
    ADD CONSTRAINT ordres_outlay_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.ordres_outlay DROP CONSTRAINT ordres_outlay_pkey;
       public            postgres    false    246            T           2606    378575 (   ordres_outlayitem ordres_outlayitem_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.ordres_outlayitem
    ADD CONSTRAINT ordres_outlayitem_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.ordres_outlayitem DROP CONSTRAINT ordres_outlayitem_pkey;
       public            postgres    false    250            G           2606    378606 D   ordres_service ordres_service_moduleservice_id_service_3822a9f4_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.ordres_service
    ADD CONSTRAINT ordres_service_moduleservice_id_service_3822a9f4_uniq UNIQUE (moduleservice_id, service);
 n   ALTER TABLE ONLY public.ordres_service DROP CONSTRAINT ordres_service_moduleservice_id_service_3822a9f4_uniq;
       public            postgres    false    248    248            I           2606    378563 "   ordres_service ordres_service_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.ordres_service
    ADD CONSTRAINT ordres_service_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.ordres_service DROP CONSTRAINT ordres_service_pkey;
       public            postgres    false    248            L           2606    378565 )   ordres_service ordres_service_service_key 
   CONSTRAINT     g   ALTER TABLE ONLY public.ordres_service
    ADD CONSTRAINT ordres_service_service_key UNIQUE (service);
 S   ALTER TABLE ONLY public.ordres_service DROP CONSTRAINT ordres_service_service_key;
       public            postgres    false    248            O           2606    378570 *   ordres_serviceitem ordres_serviceitem_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.ordres_serviceitem
    ADD CONSTRAINT ordres_serviceitem_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.ordres_serviceitem DROP CONSTRAINT ordres_serviceitem_pkey;
       public            postgres    false    249            ~           2606    378771     tasks_benefit tasks_benefit_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.tasks_benefit
    ADD CONSTRAINT tasks_benefit_pkey PRIMARY KEY (code_benefit);
 J   ALTER TABLE ONLY public.tasks_benefit DROP CONSTRAINT tasks_benefit_pkey;
       public            postgres    false    262            �           2606    387397 P   tasks_benefititem tasks_benefititem_benefitlink_id_code_benefit_id_dc6d77ce_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.tasks_benefititem
    ADD CONSTRAINT tasks_benefititem_benefitlink_id_code_benefit_id_dc6d77ce_uniq UNIQUE (benefitlink_id, code_benefit_id);
 z   ALTER TABLE ONLY public.tasks_benefititem DROP CONSTRAINT tasks_benefititem_benefitlink_id_code_benefit_id_dc6d77ce_uniq;
       public            postgres    false    268    268            �           2606    378805 (   tasks_benefititem tasks_benefititem_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.tasks_benefititem
    ADD CONSTRAINT tasks_benefititem_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.tasks_benefititem DROP CONSTRAINT tasks_benefititem_pkey;
       public            postgres    false    268            �           2606    378778 8   tasks_benefitlink tasks_benefitlink_lettremission_id_key 
   CONSTRAINT        ALTER TABLE ONLY public.tasks_benefitlink
    ADD CONSTRAINT tasks_benefitlink_lettremission_id_key UNIQUE (lettremission_id);
 b   ALTER TABLE ONLY public.tasks_benefitlink DROP CONSTRAINT tasks_benefitlink_lettremission_id_key;
       public            postgres    false    263            �           2606    378776 (   tasks_benefitlink tasks_benefitlink_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.tasks_benefitlink
    ADD CONSTRAINT tasks_benefitlink_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.tasks_benefitlink DROP CONSTRAINT tasks_benefitlink_pkey;
       public            postgres    false    263            �           2606    378877 T   tasks_benefitrequested tasks_benefitrequested_lettremission_id_benefit_7ea41f23_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.tasks_benefitrequested
    ADD CONSTRAINT tasks_benefitrequested_lettremission_id_benefit_7ea41f23_uniq UNIQUE (lettremission_id, benefitlink_id);
 ~   ALTER TABLE ONLY public.tasks_benefitrequested DROP CONSTRAINT tasks_benefitrequested_lettremission_id_benefit_7ea41f23_uniq;
       public            postgres    false    270    270            �           2606    378815 2   tasks_benefitrequested tasks_benefitrequested_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.tasks_benefitrequested
    ADD CONSTRAINT tasks_benefitrequested_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.tasks_benefitrequested DROP CONSTRAINT tasks_benefitrequested_pkey;
       public            postgres    false    270            �           2606    378800    tasks_claim tasks_claim_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.tasks_claim
    ADD CONSTRAINT tasks_claim_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.tasks_claim DROP CONSTRAINT tasks_claim_pkey;
       public            postgres    false    267            �           2606    378785 $   tasks_period tasks_period_period_key 
   CONSTRAINT     a   ALTER TABLE ONLY public.tasks_period
    ADD CONSTRAINT tasks_period_period_key UNIQUE (period);
 N   ALTER TABLE ONLY public.tasks_period DROP CONSTRAINT tasks_period_period_key;
       public            postgres    false    264            �           2606    378783    tasks_period tasks_period_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.tasks_period
    ADD CONSTRAINT tasks_period_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.tasks_period DROP CONSTRAINT tasks_period_pkey;
       public            postgres    false    264            �           2606    378790    tasks_task tasks_task_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.tasks_task
    ADD CONSTRAINT tasks_task_pkey PRIMARY KEY (code_task);
 D   ALTER TABLE ONLY public.tasks_task DROP CONSTRAINT tasks_task_pkey;
       public            postgres    false    265            �           2606    378863 L   tasks_vatrequested tasks_vatrequested_lettremission_id_benefit_59c26b4b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.tasks_vatrequested
    ADD CONSTRAINT tasks_vatrequested_lettremission_id_benefit_59c26b4b_uniq UNIQUE (lettremission_id, benefitlink_id);
 v   ALTER TABLE ONLY public.tasks_vatrequested DROP CONSTRAINT tasks_vatrequested_lettremission_id_benefit_59c26b4b_uniq;
       public            postgres    false    269    269            �           2606    378810 *   tasks_vatrequested tasks_vatrequested_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.tasks_vatrequested
    ADD CONSTRAINT tasks_vatrequested_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.tasks_vatrequested DROP CONSTRAINT tasks_vatrequested_pkey;
       public            postgres    false    269            �           2606    379124 F   tasks_work tasks_work_period_id_lettremission_id_task_id_63297617_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.tasks_work
    ADD CONSTRAINT tasks_work_period_id_lettremission_id_task_id_63297617_uniq UNIQUE (period_id, lettremission_id, task_id);
 p   ALTER TABLE ONLY public.tasks_work DROP CONSTRAINT tasks_work_period_id_lettremission_id_task_id_63297617_uniq;
       public            postgres    false    266    266    266            �           2606    378795    tasks_work tasks_work_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.tasks_work
    ADD CONSTRAINT tasks_work_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.tasks_work DROP CONSTRAINT tasks_work_pkey;
       public            postgres    false    266            �           1259    378201 (   account_emailaddress_email_03be32b2_like    INDEX     ~   CREATE INDEX account_emailaddress_email_03be32b2_like ON public.account_emailaddress USING btree (email varchar_pattern_ops);
 <   DROP INDEX public.account_emailaddress_email_03be32b2_like;
       public            postgres    false    218            �           1259    378191 %   account_emailaddress_user_id_2c513194    INDEX     i   CREATE INDEX account_emailaddress_user_id_2c513194 ON public.account_emailaddress USING btree (user_id);
 9   DROP INDEX public.account_emailaddress_user_id_2c513194;
       public            postgres    false    218            �           1259    378215 3   account_emailconfirmation_email_address_id_5b7f8c58    INDEX     �   CREATE INDEX account_emailconfirmation_email_address_id_5b7f8c58 ON public.account_emailconfirmation USING btree (email_address_id);
 G   DROP INDEX public.account_emailconfirmation_email_address_id_5b7f8c58;
       public            postgres    false    219            �           1259    378197 +   account_emailconfirmation_key_f43612bd_like    INDEX     �   CREATE INDEX account_emailconfirmation_key_f43612bd_like ON public.account_emailconfirmation USING btree (key varchar_pattern_ops);
 ?   DROP INDEX public.account_emailconfirmation_key_f43612bd_like;
       public            postgres    false    219            h           1259    378710 -   accounts_portefolio_lettremission_id_d71976d5    INDEX     y   CREATE INDEX accounts_portefolio_lettremission_id_d71976d5 ON public.accounts_portefolio USING btree (lettremission_id);
 A   DROP INDEX public.accounts_portefolio_lettremission_id_d71976d5;
       public            postgres    false    256            k           1259    378711 1   accounts_portefolio_rolecollaborateur_id_7645715a    INDEX     �   CREATE INDEX accounts_portefolio_rolecollaborateur_id_7645715a ON public.accounts_portefolio USING btree (rolecollaborateur_id);
 E   DROP INDEX public.accounts_portefolio_rolecollaborateur_id_7645715a;
       public            postgres    false    256            l           1259    378712 $   accounts_portefolio_user_id_623858b2    INDEX     g   CREATE INDEX accounts_portefolio_user_id_623858b2 ON public.accounts_portefolio USING btree (user_id);
 8   DROP INDEX public.accounts_portefolio_user_id_623858b2;
       public            postgres    false    256            �           1259    379165 )   accounts_pwsafe_lettremission_id_8f576869    INDEX     q   CREATE INDEX accounts_pwsafe_lettremission_id_8f576869 ON public.accounts_pwsafe USING btree (lettremission_id);
 =   DROP INDEX public.accounts_pwsafe_lettremission_id_8f576869;
       public            postgres    false    271            �           1259    379167     accounts_pwsafe_user_id_6b8567f3    INDEX     _   CREATE INDEX accounts_pwsafe_user_id_6b8567f3 ON public.accounts_pwsafe USING btree (user_id);
 4   DROP INDEX public.accounts_pwsafe_user_id_6b8567f3;
       public            postgres    false    271            _           1259    378687 "   accounts_scope_Scope_e7af236c_like    INDEX     v   CREATE INDEX "accounts_scope_Scope_e7af236c_like" ON public.accounts_scope USING btree ("Scope" varchar_pattern_ops);
 8   DROP INDEX public."accounts_scope_Scope_e7af236c_like";
       public            postgres    false    253            �           1259    379189 ,   accounts_validator_lettremission_id_c9100ec9    INDEX     w   CREATE INDEX accounts_validator_lettremission_id_c9100ec9 ON public.accounts_validator USING btree (lettremission_id);
 @   DROP INDEX public.accounts_validator_lettremission_id_c9100ec9;
       public            postgres    false    272            �           1259    379190 #   accounts_validator_user_id_ae93f26f    INDEX     e   CREATE INDEX accounts_validator_user_id_ae93f26f ON public.accounts_validator USING btree (user_id);
 7   DROP INDEX public.accounts_validator_user_id_ae93f26f;
       public            postgres    false    272            �           1259    378745    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
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
       public            postgres    false    213                       1259    378448 (   customers_bankacount_company_id_296f0bae    INDEX     o   CREATE INDEX customers_bankacount_company_id_296f0bae ON public.customers_bankacount USING btree (company_id);
 <   DROP INDEX public.customers_bankacount_company_id_296f0bae;
       public            postgres    false    236                       1259    378447 &   customers_bankacount_rib_5bbdcf51_like    INDEX     z   CREATE INDEX customers_bankacount_rib_5bbdcf51_like ON public.customers_bankacount USING btree (rib varchar_pattern_ops);
 :   DROP INDEX public.customers_bankacount_rib_5bbdcf51_like;
       public            postgres    false    236            �           1259    378386 !   customers_city_city_f5e3b070_like    INDEX     p   CREATE INDEX customers_city_city_f5e3b070_like ON public.customers_city USING btree (city varchar_pattern_ops);
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
       public            postgres    false    224            .           1259    378529 %   customers_contact_company_id_b52c4cc4    INDEX     i   CREATE INDEX customers_contact_company_id_b52c4cc4 ON public.customers_contact USING btree (company_id);
 9   DROP INDEX public.customers_contact_company_id_b52c4cc4;
       public            postgres    false    241            1           1259    378530 $   customers_contact_person_id_32cb4479    INDEX     g   CREATE INDEX customers_contact_person_id_32cb4479 ON public.customers_contact USING btree (person_id);
 8   DROP INDEX public.customers_contact_person_id_32cb4479;
       public            postgres    false    241            �           1259    378394 ,   customers_country_code_country_1e3531ba_like    INDEX     �   CREATE INDEX customers_country_code_country_1e3531ba_like ON public.customers_country USING btree (code_country varchar_pattern_ops);
 @   DROP INDEX public.customers_country_code_country_1e3531ba_like;
       public            postgres    false    225            �           1259    378395 '   customers_country_country_47d25431_like    INDEX     |   CREATE INDEX customers_country_country_47d25431_like ON public.customers_country USING btree (country varchar_pattern_ops);
 ;   DROP INDEX public.customers_country_country_47d25431_like;
       public            postgres    false    225            �           1259    378397 )   customers_currency_currency_1e482a08_like    INDEX     �   CREATE INDEX customers_currency_currency_1e482a08_like ON public.customers_currency USING btree (currency varchar_pattern_ops);
 =   DROP INDEX public.customers_currency_currency_1e482a08_like;
       public            postgres    false    226            �           1259    378396 .   customers_currency_currency_code_4b6efc33_like    INDEX     �   CREATE INDEX customers_currency_currency_code_4b6efc33_like ON public.customers_currency USING btree (currency_code varchar_pattern_ops);
 B   DROP INDEX public.customers_currency_currency_code_4b6efc33_like;
       public            postgres    false    226            �           1259    378398 )   customers_legalform_lf_name_7a5f07dd_like    INDEX     �   CREATE INDEX customers_legalform_lf_name_7a5f07dd_like ON public.customers_legalform USING btree (lf_name varchar_pattern_ops);
 =   DROP INDEX public.customers_legalform_lf_name_7a5f07dd_like;
       public            postgres    false    227            �           1259    378399 4   customers_nationality_code_nationality_3e44c4e5_like    INDEX     �   CREATE INDEX customers_nationality_code_nationality_3e44c4e5_like ON public.customers_nationality USING btree (code_nationality varchar_pattern_ops);
 H   DROP INDEX public.customers_nationality_code_nationality_3e44c4e5_like;
       public            postgres    false    228            �           1259    378400 /   customers_nationality_nationality_13d9c46d_like    INDEX     �   CREATE INDEX customers_nationality_nationality_13d9c46d_like ON public.customers_nationality USING btree (nationality varchar_pattern_ops);
 C   DROP INDEX public.customers_nationality_nationality_13d9c46d_like;
       public            postgres    false    228            �           1259    378401 %   customers_office_office_e103c038_like    INDEX     x   CREATE INDEX customers_office_office_e103c038_like ON public.customers_office USING btree (office varchar_pattern_ops);
 9   DROP INDEX public.customers_office_office_e103c038_like;
       public            postgres    false    229            �           1259    378419 !   customers_person_city_id_29d45925    INDEX     a   CREATE INDEX customers_person_city_id_29d45925 ON public.customers_person USING btree (city_id);
 5   DROP INDEX public.customers_person_city_id_29d45925;
       public            postgres    false    230            �           1259    378420 $   customers_person_country_id_bb7c8b94    INDEX     g   CREATE INDEX customers_person_country_id_bb7c8b94 ON public.customers_person USING btree (country_id);
 8   DROP INDEX public.customers_person_country_id_bb7c8b94;
       public            postgres    false    230            �           1259    378421 )   customers_person_country_id_bb7c8b94_like    INDEX     �   CREATE INDEX customers_person_country_id_bb7c8b94_like ON public.customers_person USING btree (country_id varchar_pattern_ops);
 =   DROP INDEX public.customers_person_country_id_bb7c8b94_like;
       public            postgres    false    230            �           1259    378422 (   customers_person_nationality_id_45b2dbf8    INDEX     o   CREATE INDEX customers_person_nationality_id_45b2dbf8 ON public.customers_person USING btree (nationality_id);
 <   DROP INDEX public.customers_person_nationality_id_45b2dbf8;
       public            postgres    false    230            �           1259    378423 -   customers_person_nationality_id_45b2dbf8_like    INDEX     �   CREATE INDEX customers_person_nationality_id_45b2dbf8_like ON public.customers_person USING btree (nationality_id varchar_pattern_ops);
 A   DROP INDEX public.customers_person_nationality_id_45b2dbf8_like;
       public            postgres    false    230            '           1259    378514 ,   customers_representative_company_id_54193de8    INDEX     w   CREATE INDEX customers_representative_company_id_54193de8 ON public.customers_representative USING btree (company_id);
 @   DROP INDEX public.customers_representative_company_id_54193de8;
       public            postgres    false    240            *           1259    378515 +   customers_representative_person_id_2922b303    INDEX     u   CREATE INDEX customers_representative_person_id_2922b303 ON public.customers_representative USING btree (person_id);
 ?   DROP INDEX public.customers_representative_person_id_2922b303;
       public            postgres    false    240            -           1259    378516 7   customers_representative_rolerepresentative_id_42fecf8d    INDEX     �   CREATE INDEX customers_representative_rolerepresentative_id_42fecf8d ON public.customers_representative USING btree (rolerepresentative_id);
 K   DROP INDEX public.customers_representative_rolerepresentative_id_42fecf8d;
       public            postgres    false    240            "           1259    378494 3   customers_representativecompany_company_id_4ad471fb    INDEX     �   CREATE INDEX customers_representativecompany_company_id_4ad471fb ON public.customers_representativecompany USING btree (company_id);
 G   DROP INDEX public.customers_representativecompany_company_id_4ad471fb;
       public            postgres    false    239            %           1259    378495 >   customers_representativecompany_representativelink_id_1624f777    INDEX     �   CREATE INDEX customers_representativecompany_representativelink_id_1624f777 ON public.customers_representativecompany USING btree (representativelink_id);
 R   DROP INDEX public.customers_representativecompany_representativelink_id_1624f777;
       public            postgres    false    239            &           1259    378496 >   customers_representativecompany_rolerepresentative_id_fb5c0c8d    INDEX     �   CREATE INDEX customers_representativecompany_rolerepresentative_id_fb5c0c8d ON public.customers_representativecompany USING btree (rolerepresentative_id);
 R   DROP INDEX public.customers_representativecompany_rolerepresentative_id_fb5c0c8d;
       public            postgres    false    239                       1259    378424 =   customers_rolerepresentative_rolerepresentative_7c7ff30f_like    INDEX     �   CREATE INDEX customers_rolerepresentative_rolerepresentative_7c7ff30f_like ON public.customers_rolerepresentative USING btree (rolerepresentative varchar_pattern_ops);
 Q   DROP INDEX public.customers_rolerepresentative_rolerepresentative_7c7ff30f_like;
       public            postgres    false    232                       1259    378475 )   customers_shareholder_company_id_bf06ce33    INDEX     q   CREATE INDEX customers_shareholder_company_id_bf06ce33 ON public.customers_shareholder USING btree (company_id);
 =   DROP INDEX public.customers_shareholder_company_id_bf06ce33;
       public            postgres    false    238                       1259    378476 (   customers_shareholder_person_id_5be2174f    INDEX     o   CREATE INDEX customers_shareholder_person_id_5be2174f ON public.customers_shareholder USING btree (person_id);
 <   DROP INDEX public.customers_shareholder_person_id_5be2174f;
       public            postgres    false    238                       1259    378461 0   customers_shareholdercompany_company_id_5f7ea741    INDEX        CREATE INDEX customers_shareholdercompany_company_id_5f7ea741 ON public.customers_shareholdercompany USING btree (company_id);
 D   DROP INDEX public.customers_shareholdercompany_company_id_5f7ea741;
       public            postgres    false    237                       1259    378462 8   customers_shareholdercompany_shareholderlink_id_0f97a228    INDEX     �   CREATE INDEX customers_shareholdercompany_shareholderlink_id_0f97a228 ON public.customers_shareholdercompany USING btree (shareholderlink_id);
 L   DROP INDEX public.customers_shareholdercompany_shareholderlink_id_0f97a228;
       public            postgres    false    237            o           1259    378735 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public            postgres    false    258            r           1259    378736 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public            postgres    false    258            s           1259    378755 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public            postgres    false    259            v           1259    378754 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public            postgres    false    259            w           1259    378766     django_site_domain_a2e37b91_like    INDEX     n   CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);
 4   DROP INDEX public.django_site_domain_a2e37b91_like;
       public            postgres    false    261            �           1259    387464 -   editions_docmodel_code_docmodel_75ee40cf_like    INDEX     �   CREATE INDEX editions_docmodel_code_docmodel_75ee40cf_like ON public.editions_docmodel USING btree (code_docmodel varchar_pattern_ops);
 A   DROP INDEX public.editions_docmodel_code_docmodel_75ee40cf_like;
       public            postgres    false    273            �           1259    387476 /   editions_docmodelword_code_docmodel_id_8e1ebb29    INDEX     }   CREATE INDEX editions_docmodelword_code_docmodel_id_8e1ebb29 ON public.editions_docmodelword USING btree (code_docmodel_id);
 C   DROP INDEX public.editions_docmodelword_code_docmodel_id_8e1ebb29;
       public            postgres    false    276            �           1259    387477 4   editions_docmodelword_code_docmodel_id_8e1ebb29_like    INDEX     �   CREATE INDEX editions_docmodelword_code_docmodel_id_8e1ebb29_like ON public.editions_docmodelword USING btree (code_docmodel_id varchar_pattern_ops);
 H   DROP INDEX public.editions_docmodelword_code_docmodel_id_8e1ebb29_like;
       public            postgres    false    276            �           1259    387470 ,   editions_socialdoc_lettremission_id_33c3d059    INDEX     w   CREATE INDEX editions_socialdoc_lettremission_id_33c3d059 ON public.editions_socialdoc USING btree (lettremission_id);
 @   DROP INDEX public.editions_socialdoc_lettremission_id_33c3d059;
       public            postgres    false    274            U           1259    378656 (   ordres_lettremission_company_id_438b6bbc    INDEX     o   CREATE INDEX ordres_lettremission_company_id_438b6bbc ON public.ordres_lettremission USING btree (company_id);
 <   DROP INDEX public.ordres_lettremission_company_id_438b6bbc;
       public            postgres    false    251            V           1259    378657 .   ordres_lettremission_moduleservice_id_85831cde    INDEX     {   CREATE INDEX ordres_lettremission_moduleservice_id_85831cde ON public.ordres_lettremission USING btree (moduleservice_id);
 B   DROP INDEX public.ordres_lettremission_moduleservice_id_85831cde;
       public            postgres    false    251            W           1259    378658 '   ordres_lettremission_office_id_0f2982af    INDEX     m   CREATE INDEX ordres_lettremission_office_id_0f2982af ON public.ordres_lettremission USING btree (office_id);
 ;   DROP INDEX public.ordres_lettremission_office_id_0f2982af;
       public            postgres    false    251            \           1259    378655 ,   ordres_lettremission_reference_750d89bd_like    INDEX     �   CREATE INDEX ordres_lettremission_reference_750d89bd_like ON public.ordres_lettremission USING btree (reference varchar_pattern_ops);
 @   DROP INDEX public.ordres_lettremission_reference_750d89bd_like;
       public            postgres    false    251            4           1259    378583 0   ordres_moduleservice_moduleservice_d9487e15_like    INDEX     �   CREATE INDEX ordres_moduleservice_moduleservice_d9487e15_like ON public.ordres_moduleservice USING btree (moduleservice varchar_pattern_ops);
 D   DROP INDEX public.ordres_moduleservice_moduleservice_d9487e15_like;
       public            postgres    false    243            9           1259    378594     ordres_ordre_company_id_11ddded4    INDEX     _   CREATE INDEX ordres_ordre_company_id_11ddded4 ON public.ordres_ordre USING btree (company_id);
 4   DROP INDEX public.ordres_ordre_company_id_11ddded4;
       public            postgres    false    244            :           1259    378595    ordres_ordre_office_id_711c56fd    INDEX     ]   CREATE INDEX ordres_ordre_office_id_711c56fd ON public.ordres_ordre USING btree (office_id);
 3   DROP INDEX public.ordres_ordre_office_id_711c56fd;
       public            postgres    false    244            =           1259    378604 '   ordres_outlay_moduleservice_id_1b55901d    INDEX     m   CREATE INDEX ordres_outlay_moduleservice_id_1b55901d ON public.ordres_outlay USING btree (moduleservice_id);
 ;   DROP INDEX public.ordres_outlay_moduleservice_id_1b55901d;
       public            postgres    false    246            @           1259    378603 "   ordres_outlay_outlay_f07d327b_like    INDEX     r   CREATE INDEX ordres_outlay_outlay_f07d327b_like ON public.ordres_outlay USING btree (outlay varchar_pattern_ops);
 6   DROP INDEX public.ordres_outlay_outlay_f07d327b_like;
       public            postgres    false    246            Q           1259    378636 #   ordres_outlayitem_ordre_id_3777bebd    INDEX     e   CREATE INDEX ordres_outlayitem_ordre_id_3777bebd ON public.ordres_outlayitem USING btree (ordre_id);
 7   DROP INDEX public.ordres_outlayitem_ordre_id_3777bebd;
       public            postgres    false    250            R           1259    378637 $   ordres_outlayitem_outlay_id_ba0705b9    INDEX     g   CREATE INDEX ordres_outlayitem_outlay_id_ba0705b9 ON public.ordres_outlayitem USING btree (outlay_id);
 8   DROP INDEX public.ordres_outlayitem_outlay_id_ba0705b9;
       public            postgres    false    250            E           1259    378613 (   ordres_service_moduleservice_id_f81d374e    INDEX     o   CREATE INDEX ordres_service_moduleservice_id_f81d374e ON public.ordres_service USING btree (moduleservice_id);
 <   DROP INDEX public.ordres_service_moduleservice_id_f81d374e;
       public            postgres    false    248            J           1259    378612 $   ordres_service_service_23232e59_like    INDEX     v   CREATE INDEX ordres_service_service_23232e59_like ON public.ordres_service USING btree (service varchar_pattern_ops);
 8   DROP INDEX public.ordres_service_service_23232e59_like;
       public            postgres    false    248            M           1259    378624 $   ordres_serviceitem_ordre_id_8f8e0a5b    INDEX     g   CREATE INDEX ordres_serviceitem_ordre_id_8f8e0a5b ON public.ordres_serviceitem USING btree (ordre_id);
 8   DROP INDEX public.ordres_serviceitem_ordre_id_8f8e0a5b;
       public            postgres    false    249            P           1259    378625 &   ordres_serviceitem_service_id_bb1e292c    INDEX     k   CREATE INDEX ordres_serviceitem_service_id_bb1e292c ON public.ordres_serviceitem USING btree (service_id);
 :   DROP INDEX public.ordres_serviceitem_service_id_bb1e292c;
       public            postgres    false    249            |           1259    378816 (   tasks_benefit_code_benefit_aac1735b_like    INDEX     ~   CREATE INDEX tasks_benefit_code_benefit_aac1735b_like ON public.tasks_benefit USING btree (code_benefit varchar_pattern_ops);
 <   DROP INDEX public.tasks_benefit_code_benefit_aac1735b_like;
       public            postgres    false    262            �           1259    378859 )   tasks_benefititem_benefitlink_id_2f1d11ae    INDEX     q   CREATE INDEX tasks_benefititem_benefitlink_id_2f1d11ae ON public.tasks_benefititem USING btree (benefitlink_id);
 =   DROP INDEX public.tasks_benefititem_benefitlink_id_2f1d11ae;
       public            postgres    false    268            �           1259    387398 *   tasks_benefititem_code_benefit_id_d2b8644f    INDEX     s   CREATE INDEX tasks_benefititem_code_benefit_id_d2b8644f ON public.tasks_benefititem USING btree (code_benefit_id);
 >   DROP INDEX public.tasks_benefititem_code_benefit_id_d2b8644f;
       public            postgres    false    268            �           1259    387399 /   tasks_benefititem_code_benefit_id_d2b8644f_like    INDEX     �   CREATE INDEX tasks_benefititem_code_benefit_id_d2b8644f_like ON public.tasks_benefititem USING btree (code_benefit_id varchar_pattern_ops);
 C   DROP INDEX public.tasks_benefititem_code_benefit_id_d2b8644f_like;
       public            postgres    false    268            �           1259    378888 .   tasks_benefitrequested_benefitlink_id_a9b509ab    INDEX     {   CREATE INDEX tasks_benefitrequested_benefitlink_id_a9b509ab ON public.tasks_benefitrequested USING btree (benefitlink_id);
 B   DROP INDEX public.tasks_benefitrequested_benefitlink_id_a9b509ab;
       public            postgres    false    270            �           1259    378889 0   tasks_benefitrequested_lettremission_id_0c9371e0    INDEX        CREATE INDEX tasks_benefitrequested_lettremission_id_0c9371e0 ON public.tasks_benefitrequested USING btree (lettremission_id);
 D   DROP INDEX public.tasks_benefitrequested_lettremission_id_0c9371e0;
       public            postgres    false    270            �           1259    378848 %   tasks_claim_lettremission_id_7bdd1ad4    INDEX     i   CREATE INDEX tasks_claim_lettremission_id_7bdd1ad4 ON public.tasks_claim USING btree (lettremission_id);
 9   DROP INDEX public.tasks_claim_lettremission_id_7bdd1ad4;
       public            postgres    false    267            �           1259    378822 !   tasks_period_period_e791c752_like    INDEX     p   CREATE INDEX tasks_period_period_e791c752_like ON public.tasks_period USING btree (period varchar_pattern_ops);
 5   DROP INDEX public.tasks_period_period_e791c752_like;
       public            postgres    false    264            �           1259    387405 #   tasks_task_code_benefit_id_611dd4c0    INDEX     e   CREATE INDEX tasks_task_code_benefit_id_611dd4c0 ON public.tasks_task USING btree (code_benefit_id);
 7   DROP INDEX public.tasks_task_code_benefit_id_611dd4c0;
       public            postgres    false    265            �           1259    387406 (   tasks_task_code_benefit_id_611dd4c0_like    INDEX     ~   CREATE INDEX tasks_task_code_benefit_id_611dd4c0_like ON public.tasks_task USING btree (code_benefit_id varchar_pattern_ops);
 <   DROP INDEX public.tasks_task_code_benefit_id_611dd4c0_like;
       public            postgres    false    265            �           1259    378823 "   tasks_task_code_task_537643d9_like    INDEX     r   CREATE INDEX tasks_task_code_task_537643d9_like ON public.tasks_task USING btree (code_task varchar_pattern_ops);
 6   DROP INDEX public.tasks_task_code_task_537643d9_like;
       public            postgres    false    265            �           1259    378874 *   tasks_vatrequested_benefitlink_id_edf110a9    INDEX     s   CREATE INDEX tasks_vatrequested_benefitlink_id_edf110a9 ON public.tasks_vatrequested USING btree (benefitlink_id);
 >   DROP INDEX public.tasks_vatrequested_benefitlink_id_edf110a9;
       public            postgres    false    269            �           1259    378875 ,   tasks_vatrequested_lettremission_id_786bbd79    INDEX     w   CREATE INDEX tasks_vatrequested_lettremission_id_786bbd79 ON public.tasks_vatrequested USING btree (lettremission_id);
 @   DROP INDEX public.tasks_vatrequested_lettremission_id_786bbd79;
       public            postgres    false    269            �           1259    378839    tasks_work_echeance_id_acf563bd    INDEX     [   CREATE INDEX tasks_work_echeance_id_acf563bd ON public.tasks_work USING btree (period_id);
 3   DROP INDEX public.tasks_work_echeance_id_acf563bd;
       public            postgres    false    266            �           1259    378840 $   tasks_work_lettremission_id_93a5077a    INDEX     g   CREATE INDEX tasks_work_lettremission_id_93a5077a ON public.tasks_work USING btree (lettremission_id);
 8   DROP INDEX public.tasks_work_lettremission_id_93a5077a;
       public            postgres    false    266            �           1259    378841    tasks_work_task_id_edd86e4b    INDEX     U   CREATE INDEX tasks_work_task_id_edd86e4b ON public.tasks_work USING btree (task_id);
 /   DROP INDEX public.tasks_work_task_id_edd86e4b;
       public            postgres    false    266            �           1259    378842     tasks_work_task_id_edd86e4b_like    INDEX     n   CREATE INDEX tasks_work_task_id_edd86e4b_like ON public.tasks_work USING btree (task_id varchar_pattern_ops);
 4   DROP INDEX public.tasks_work_task_id_edd86e4b_like;
       public            postgres    false    266            �           2606    378185 J   account_emailaddress account_emailaddress_user_id_2c513194_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_user_id_2c513194_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.account_emailaddress DROP CONSTRAINT account_emailaddress_user_id_2c513194_fk_auth_user_id;
       public          postgres    false    218    2991    213            �           2606    378223 P   account_emailconfirmation account_emailconfirmation_email_address_id_5b7f8c58_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_email_address_id_5b7f8c58_fk FOREIGN KEY (email_address_id) REFERENCES public.account_emailaddress(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.account_emailconfirmation DROP CONSTRAINT account_emailconfirmation_email_address_id_5b7f8c58_fk;
       public          postgres    false    218    219    3011            �           2606    378695 N   accounts_portefolio accounts_portefolio_lettremission_id_d71976d5_fk_ordres_le    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts_portefolio
    ADD CONSTRAINT accounts_portefolio_lettremission_id_d71976d5_fk_ordres_le FOREIGN KEY (lettremission_id) REFERENCES public.ordres_lettremission(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.accounts_portefolio DROP CONSTRAINT accounts_portefolio_lettremission_id_d71976d5_fk_ordres_le;
       public          postgres    false    251    256    3163            �           2606    378700 R   accounts_portefolio accounts_portefolio_rolecollaborateur_id_7645715a_fk_accounts_    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts_portefolio
    ADD CONSTRAINT accounts_portefolio_rolecollaborateur_id_7645715a_fk_accounts_ FOREIGN KEY (rolecollaborateur_id) REFERENCES public.accounts_scope(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.accounts_portefolio DROP CONSTRAINT accounts_portefolio_rolecollaborateur_id_7645715a_fk_accounts_;
       public          postgres    false    3171    253    256            �           2606    378705 O   accounts_portefolio accounts_portefolio_user_id_623858b2_fk_accounts_profile_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts_portefolio
    ADD CONSTRAINT accounts_portefolio_user_id_623858b2_fk_accounts_profile_id FOREIGN KEY (user_id) REFERENCES public.accounts_profile(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.accounts_portefolio DROP CONSTRAINT accounts_portefolio_user_id_623858b2_fk_accounts_profile_id;
       public          postgres    false    3173    256    255            �           2606    378688 B   accounts_profile accounts_profile_user_id_49a85d32_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts_profile
    ADD CONSTRAINT accounts_profile_user_id_49a85d32_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.accounts_profile DROP CONSTRAINT accounts_profile_user_id_49a85d32_fk_auth_user_id;
       public          postgres    false    255    2991    213            �           2606    379150 F   accounts_pwsafe accounts_pwsafe_lettremission_id_8f576869_fk_ordres_le    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts_pwsafe
    ADD CONSTRAINT accounts_pwsafe_lettremission_id_8f576869_fk_ordres_le FOREIGN KEY (lettremission_id) REFERENCES public.ordres_lettremission(id) DEFERRABLE INITIALLY DEFERRED;
 p   ALTER TABLE ONLY public.accounts_pwsafe DROP CONSTRAINT accounts_pwsafe_lettremission_id_8f576869_fk_ordres_le;
       public          postgres    false    271    251    3163            �           2606    379160 G   accounts_pwsafe accounts_pwsafe_user_id_6b8567f3_fk_accounts_profile_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts_pwsafe
    ADD CONSTRAINT accounts_pwsafe_user_id_6b8567f3_fk_accounts_profile_id FOREIGN KEY (user_id) REFERENCES public.accounts_profile(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.accounts_pwsafe DROP CONSTRAINT accounts_pwsafe_user_id_6b8567f3_fk_accounts_profile_id;
       public          postgres    false    255    271    3173            �           2606    379179 L   accounts_validator accounts_validator_lettremission_id_c9100ec9_fk_ordres_le    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts_validator
    ADD CONSTRAINT accounts_validator_lettremission_id_c9100ec9_fk_ordres_le FOREIGN KEY (lettremission_id) REFERENCES public.ordres_lettremission(id) DEFERRABLE INITIALLY DEFERRED;
 v   ALTER TABLE ONLY public.accounts_validator DROP CONSTRAINT accounts_validator_lettremission_id_c9100ec9_fk_ordres_le;
       public          postgres    false    272    251    3163                        2606    379184 M   accounts_validator accounts_validator_user_id_ae93f26f_fk_accounts_profile_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts_validator
    ADD CONSTRAINT accounts_validator_user_id_ae93f26f_fk_accounts_profile_id FOREIGN KEY (user_id) REFERENCES public.accounts_profile(id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public.accounts_validator DROP CONSTRAINT accounts_validator_user_id_ae93f26f_fk_accounts_profile_id;
       public          postgres    false    272    255    3173            �           2606    378129 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public          postgres    false    2978    207    211            �           2606    378124 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public          postgres    false    211    209    2983            �           2606    378115 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public          postgres    false    207    205    2973            �           2606    378144 D   auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
       public          postgres    false    209    215    2983            �           2606    378139 B   auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
       public          postgres    false    213    215    2991            �           2606    378158 S   auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
       public          postgres    false    207    2978    217            �           2606    378153 V   auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
       public          postgres    false    2991    217    213            �           2606    378442 J   customers_bankacount customers_bankacount_company_id_296f0bae_fk_customers    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers_bankacount
    ADD CONSTRAINT customers_bankacount_company_id_296f0bae_fk_customers FOREIGN KEY (company_id) REFERENCES public.customers_company(id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.customers_bankacount DROP CONSTRAINT customers_bankacount_company_id_296f0bae_fk_customers;
       public          postgres    false    236    224    3035            �           2606    378329 D   customers_company customers_company_country_id_d2365eec_fk_customers    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers_company
    ADD CONSTRAINT customers_company_country_id_d2365eec_fk_customers FOREIGN KEY (country_id) REFERENCES public.customers_country(code_country) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.customers_company DROP CONSTRAINT customers_company_country_id_d2365eec_fk_customers;
       public          postgres    false    224    3041    225            �           2606    378335 E   customers_company customers_company_currency_id_59caea32_fk_customers    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers_company
    ADD CONSTRAINT customers_company_currency_id_59caea32_fk_customers FOREIGN KEY (currency_id) REFERENCES public.customers_currency(currency_code) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.customers_company DROP CONSTRAINT customers_company_currency_id_59caea32_fk_customers;
       public          postgres    false    224    3047    226            �           2606    378340 G   customers_company customers_company_legal_form_id_674849c0_fk_customers    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers_company
    ADD CONSTRAINT customers_company_legal_form_id_674849c0_fk_customers FOREIGN KEY (legal_form_id) REFERENCES public.customers_legalform(code_lf) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.customers_company DROP CONSTRAINT customers_company_legal_form_id_674849c0_fk_customers;
       public          postgres    false    227    224    3052            �           2606    378346 H   customers_company customers_company_nationality_id_67a2b28a_fk_customers    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers_company
    ADD CONSTRAINT customers_company_nationality_id_67a2b28a_fk_customers FOREIGN KEY (nationality_id) REFERENCES public.customers_nationality(code_nationality) DEFERRABLE INITIALLY DEFERRED;
 r   ALTER TABLE ONLY public.customers_company DROP CONSTRAINT customers_company_nationality_id_67a2b28a_fk_customers;
       public          postgres    false    228    3058    224            �           2606    378519 O   customers_contact customers_contact_company_id_b52c4cc4_fk_customers_company_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers_contact
    ADD CONSTRAINT customers_contact_company_id_b52c4cc4_fk_customers_company_id FOREIGN KEY (company_id) REFERENCES public.customers_company(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.customers_contact DROP CONSTRAINT customers_contact_company_id_b52c4cc4_fk_customers_company_id;
       public          postgres    false    224    241    3035            �           2606    378524 M   customers_contact customers_contact_person_id_32cb4479_fk_customers_person_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers_contact
    ADD CONSTRAINT customers_contact_person_id_32cb4479_fk_customers_person_id FOREIGN KEY (person_id) REFERENCES public.customers_person(id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public.customers_contact DROP CONSTRAINT customers_contact_person_id_32cb4479_fk_customers_person_id;
       public          postgres    false    3072    241    230            �           2606    378404 G   customers_person customers_person_city_id_29d45925_fk_customers_city_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers_person
    ADD CONSTRAINT customers_person_city_id_29d45925_fk_customers_city_id FOREIGN KEY (city_id) REFERENCES public.customers_city(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.customers_person DROP CONSTRAINT customers_person_city_id_29d45925_fk_customers_city_id;
       public          postgres    false    230    223    3023            �           2606    378409 B   customers_person customers_person_country_id_bb7c8b94_fk_customers    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers_person
    ADD CONSTRAINT customers_person_country_id_bb7c8b94_fk_customers FOREIGN KEY (country_id) REFERENCES public.customers_country(code_country) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.customers_person DROP CONSTRAINT customers_person_country_id_bb7c8b94_fk_customers;
       public          postgres    false    225    230    3041            �           2606    378414 F   customers_person customers_person_nationality_id_45b2dbf8_fk_customers    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers_person
    ADD CONSTRAINT customers_person_nationality_id_45b2dbf8_fk_customers FOREIGN KEY (nationality_id) REFERENCES public.customers_nationality(code_nationality) DEFERRABLE INITIALLY DEFERRED;
 p   ALTER TABLE ONLY public.customers_person DROP CONSTRAINT customers_person_nationality_id_45b2dbf8_fk_customers;
       public          postgres    false    228    3058    230            �           2606    378479 U   customers_representativecompany customers_representa_company_id_4ad471fb_fk_customers    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers_representativecompany
    ADD CONSTRAINT customers_representa_company_id_4ad471fb_fk_customers FOREIGN KEY (company_id) REFERENCES public.customers_company(id) DEFERRABLE INITIALLY DEFERRED;
    ALTER TABLE ONLY public.customers_representativecompany DROP CONSTRAINT customers_representa_company_id_4ad471fb_fk_customers;
       public          postgres    false    3035    224    239            �           2606    378499 N   customers_representative customers_representa_company_id_54193de8_fk_customers    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers_representative
    ADD CONSTRAINT customers_representa_company_id_54193de8_fk_customers FOREIGN KEY (company_id) REFERENCES public.customers_company(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.customers_representative DROP CONSTRAINT customers_representa_company_id_54193de8_fk_customers;
       public          postgres    false    224    240    3035            �           2606    378430 R   customers_representativelink customers_representa_company_id_63c45cb7_fk_customers    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers_representativelink
    ADD CONSTRAINT customers_representa_company_id_63c45cb7_fk_customers FOREIGN KEY (company_id) REFERENCES public.customers_company(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.customers_representativelink DROP CONSTRAINT customers_representa_company_id_63c45cb7_fk_customers;
       public          postgres    false    3035    224    234            �           2606    378504 M   customers_representative customers_representa_person_id_2922b303_fk_customers    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers_representative
    ADD CONSTRAINT customers_representa_person_id_2922b303_fk_customers FOREIGN KEY (person_id) REFERENCES public.customers_person(id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public.customers_representative DROP CONSTRAINT customers_representa_person_id_2922b303_fk_customers;
       public          postgres    false    240    230    3072            �           2606    378484 _   customers_representativecompany customers_representa_representativelink_i_1624f777_fk_customers    FK CONSTRAINT       ALTER TABLE ONLY public.customers_representativecompany
    ADD CONSTRAINT customers_representa_representativelink_i_1624f777_fk_customers FOREIGN KEY (representativelink_id) REFERENCES public.customers_representativelink(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.customers_representativecompany DROP CONSTRAINT customers_representa_representativelink_i_1624f777_fk_customers;
       public          postgres    false    239    234    3085            �           2606    378509 X   customers_representative customers_representa_rolerepresentative_i_42fecf8d_fk_customers    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers_representative
    ADD CONSTRAINT customers_representa_rolerepresentative_i_42fecf8d_fk_customers FOREIGN KEY (rolerepresentative_id) REFERENCES public.customers_rolerepresentative(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.customers_representative DROP CONSTRAINT customers_representa_rolerepresentative_i_42fecf8d_fk_customers;
       public          postgres    false    232    240    3074            �           2606    378489 _   customers_representativecompany customers_representa_rolerepresentative_i_fb5c0c8d_fk_customers    FK CONSTRAINT       ALTER TABLE ONLY public.customers_representativecompany
    ADD CONSTRAINT customers_representa_rolerepresentative_i_fb5c0c8d_fk_customers FOREIGN KEY (rolerepresentative_id) REFERENCES public.customers_rolerepresentative(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.customers_representativecompany DROP CONSTRAINT customers_representa_rolerepresentative_i_fb5c0c8d_fk_customers;
       public          postgres    false    232    239    3074            �           2606    378425 O   customers_shareholderlink customers_shareholde_company_id_1292bf51_fk_customers    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers_shareholderlink
    ADD CONSTRAINT customers_shareholde_company_id_1292bf51_fk_customers FOREIGN KEY (company_id) REFERENCES public.customers_company(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.customers_shareholderlink DROP CONSTRAINT customers_shareholde_company_id_1292bf51_fk_customers;
       public          postgres    false    224    3035    233            �           2606    378451 R   customers_shareholdercompany customers_shareholde_company_id_5f7ea741_fk_customers    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers_shareholdercompany
    ADD CONSTRAINT customers_shareholde_company_id_5f7ea741_fk_customers FOREIGN KEY (company_id) REFERENCES public.customers_company(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.customers_shareholdercompany DROP CONSTRAINT customers_shareholde_company_id_5f7ea741_fk_customers;
       public          postgres    false    224    237    3035            �           2606    378465 K   customers_shareholder customers_shareholde_company_id_bf06ce33_fk_customers    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers_shareholder
    ADD CONSTRAINT customers_shareholde_company_id_bf06ce33_fk_customers FOREIGN KEY (company_id) REFERENCES public.customers_company(id) DEFERRABLE INITIALLY DEFERRED;
 u   ALTER TABLE ONLY public.customers_shareholder DROP CONSTRAINT customers_shareholde_company_id_bf06ce33_fk_customers;
       public          postgres    false    224    238    3035            �           2606    378456 Z   customers_shareholdercompany customers_shareholde_shareholderlink_id_0f97a228_fk_customers    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers_shareholdercompany
    ADD CONSTRAINT customers_shareholde_shareholderlink_id_0f97a228_fk_customers FOREIGN KEY (shareholderlink_id) REFERENCES public.customers_shareholderlink(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.customers_shareholdercompany DROP CONSTRAINT customers_shareholde_shareholderlink_id_0f97a228_fk_customers;
       public          postgres    false    237    3081    233            �           2606    378470 U   customers_shareholder customers_shareholder_person_id_5be2174f_fk_customers_person_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers_shareholder
    ADD CONSTRAINT customers_shareholder_person_id_5be2174f_fk_customers_person_id FOREIGN KEY (person_id) REFERENCES public.customers_person(id) DEFERRABLE INITIALLY DEFERRED;
    ALTER TABLE ONLY public.customers_shareholder DROP CONSTRAINT customers_shareholder_person_id_5be2174f_fk_customers_person_id;
       public          postgres    false    3072    230    238            �           2606    378725 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public          postgres    false    258    2973    205            �           2606    378730 B   django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
       public          postgres    false    2991    258    213                       2606    387471 Q   editions_docmodelword editions_docmodelwor_code_docmodel_id_8e1ebb29_fk_editions_    FK CONSTRAINT     �   ALTER TABLE ONLY public.editions_docmodelword
    ADD CONSTRAINT editions_docmodelwor_code_docmodel_id_8e1ebb29_fk_editions_ FOREIGN KEY (code_docmodel_id) REFERENCES public.editions_docmodel(code_docmodel) DEFERRABLE INITIALLY DEFERRED;
 {   ALTER TABLE ONLY public.editions_docmodelword DROP CONSTRAINT editions_docmodelwor_code_docmodel_id_8e1ebb29_fk_editions_;
       public          postgres    false    3257    276    273                       2606    387465 L   editions_socialdoc editions_socialdoc_lettremission_id_33c3d059_fk_ordres_le    FK CONSTRAINT     �   ALTER TABLE ONLY public.editions_socialdoc
    ADD CONSTRAINT editions_socialdoc_lettremission_id_33c3d059_fk_ordres_le FOREIGN KEY (lettremission_id) REFERENCES public.ordres_lettremission(id) DEFERRABLE INITIALLY DEFERRED;
 v   ALTER TABLE ONLY public.editions_socialdoc DROP CONSTRAINT editions_socialdoc_lettremission_id_33c3d059_fk_ordres_le;
       public          postgres    false    274    251    3163            �           2606    378640 J   ordres_lettremission ordres_lettremission_company_id_438b6bbc_fk_customers    FK CONSTRAINT     �   ALTER TABLE ONLY public.ordres_lettremission
    ADD CONSTRAINT ordres_lettremission_company_id_438b6bbc_fk_customers FOREIGN KEY (company_id) REFERENCES public.customers_company(id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.ordres_lettremission DROP CONSTRAINT ordres_lettremission_company_id_438b6bbc_fk_customers;
       public          postgres    false    3035    224    251            �           2606    378645 P   ordres_lettremission ordres_lettremission_moduleservice_id_85831cde_fk_ordres_mo    FK CONSTRAINT     �   ALTER TABLE ONLY public.ordres_lettremission
    ADD CONSTRAINT ordres_lettremission_moduleservice_id_85831cde_fk_ordres_mo FOREIGN KEY (moduleservice_id) REFERENCES public.ordres_moduleservice(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.ordres_lettremission DROP CONSTRAINT ordres_lettremission_moduleservice_id_85831cde_fk_ordres_mo;
       public          postgres    false    251    3128    243            �           2606    378650 I   ordres_lettremission ordres_lettremission_office_id_0f2982af_fk_customers    FK CONSTRAINT     �   ALTER TABLE ONLY public.ordres_lettremission
    ADD CONSTRAINT ordres_lettremission_office_id_0f2982af_fk_customers FOREIGN KEY (office_id) REFERENCES public.customers_office(code_lf) DEFERRABLE INITIALLY DEFERRED;
 s   ALTER TABLE ONLY public.ordres_lettremission DROP CONSTRAINT ordres_lettremission_office_id_0f2982af_fk_customers;
       public          postgres    false    251    3063    229            �           2606    378584 E   ordres_ordre ordres_ordre_company_id_11ddded4_fk_customers_company_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.ordres_ordre
    ADD CONSTRAINT ordres_ordre_company_id_11ddded4_fk_customers_company_id FOREIGN KEY (company_id) REFERENCES public.customers_company(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.ordres_ordre DROP CONSTRAINT ordres_ordre_company_id_11ddded4_fk_customers_company_id;
       public          postgres    false    224    244    3035            �           2606    378589 H   ordres_ordre ordres_ordre_office_id_711c56fd_fk_customers_office_code_lf    FK CONSTRAINT     �   ALTER TABLE ONLY public.ordres_ordre
    ADD CONSTRAINT ordres_ordre_office_id_711c56fd_fk_customers_office_code_lf FOREIGN KEY (office_id) REFERENCES public.customers_office(code_lf) DEFERRABLE INITIALLY DEFERRED;
 r   ALTER TABLE ONLY public.ordres_ordre DROP CONSTRAINT ordres_ordre_office_id_711c56fd_fk_customers_office_code_lf;
       public          postgres    false    229    244    3063            �           2606    378598 B   ordres_outlay ordres_outlay_moduleservice_id_1b55901d_fk_ordres_mo    FK CONSTRAINT     �   ALTER TABLE ONLY public.ordres_outlay
    ADD CONSTRAINT ordres_outlay_moduleservice_id_1b55901d_fk_ordres_mo FOREIGN KEY (moduleservice_id) REFERENCES public.ordres_moduleservice(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.ordres_outlay DROP CONSTRAINT ordres_outlay_moduleservice_id_1b55901d_fk_ordres_mo;
       public          postgres    false    243    3128    246            �           2606    378626 H   ordres_outlayitem ordres_outlayitem_ordre_id_3777bebd_fk_ordres_ordre_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.ordres_outlayitem
    ADD CONSTRAINT ordres_outlayitem_ordre_id_3777bebd_fk_ordres_ordre_id FOREIGN KEY (ordre_id) REFERENCES public.ordres_ordre(id) DEFERRABLE INITIALLY DEFERRED;
 r   ALTER TABLE ONLY public.ordres_outlayitem DROP CONSTRAINT ordres_outlayitem_ordre_id_3777bebd_fk_ordres_ordre_id;
       public          postgres    false    244    250    3132            �           2606    378631 J   ordres_outlayitem ordres_outlayitem_outlay_id_ba0705b9_fk_ordres_outlay_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.ordres_outlayitem
    ADD CONSTRAINT ordres_outlayitem_outlay_id_ba0705b9_fk_ordres_outlay_id FOREIGN KEY (outlay_id) REFERENCES public.ordres_outlay(id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.ordres_outlayitem DROP CONSTRAINT ordres_outlayitem_outlay_id_ba0705b9_fk_ordres_outlay_id;
       public          postgres    false    246    3140    250            �           2606    378607 D   ordres_service ordres_service_moduleservice_id_f81d374e_fk_ordres_mo    FK CONSTRAINT     �   ALTER TABLE ONLY public.ordres_service
    ADD CONSTRAINT ordres_service_moduleservice_id_f81d374e_fk_ordres_mo FOREIGN KEY (moduleservice_id) REFERENCES public.ordres_moduleservice(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.ordres_service DROP CONSTRAINT ordres_service_moduleservice_id_f81d374e_fk_ordres_mo;
       public          postgres    false    248    243    3128            �           2606    378614 J   ordres_serviceitem ordres_serviceitem_ordre_id_8f8e0a5b_fk_ordres_ordre_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.ordres_serviceitem
    ADD CONSTRAINT ordres_serviceitem_ordre_id_8f8e0a5b_fk_ordres_ordre_id FOREIGN KEY (ordre_id) REFERENCES public.ordres_ordre(id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.ordres_serviceitem DROP CONSTRAINT ordres_serviceitem_ordre_id_8f8e0a5b_fk_ordres_ordre_id;
       public          postgres    false    3132    249    244            �           2606    378619 N   ordres_serviceitem ordres_serviceitem_service_id_bb1e292c_fk_ordres_service_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.ordres_serviceitem
    ADD CONSTRAINT ordres_serviceitem_service_id_bb1e292c_fk_ordres_service_id FOREIGN KEY (service_id) REFERENCES public.ordres_service(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.ordres_serviceitem DROP CONSTRAINT ordres_serviceitem_service_id_bb1e292c_fk_ordres_service_id;
       public          postgres    false    248    249    3145            �           2606    378849 H   tasks_benefititem tasks_benefititem_benefitlink_id_2f1d11ae_fk_tasks_ben    FK CONSTRAINT     �   ALTER TABLE ONLY public.tasks_benefititem
    ADD CONSTRAINT tasks_benefititem_benefitlink_id_2f1d11ae_fk_tasks_ben FOREIGN KEY (benefitlink_id) REFERENCES public.tasks_benefitlink(id) DEFERRABLE INITIALLY DEFERRED;
 r   ALTER TABLE ONLY public.tasks_benefititem DROP CONSTRAINT tasks_benefititem_benefitlink_id_2f1d11ae_fk_tasks_ben;
       public          postgres    false    263    3202    268            �           2606    387391 I   tasks_benefititem tasks_benefititem_code_benefit_id_d2b8644f_fk_tasks_ben    FK CONSTRAINT     �   ALTER TABLE ONLY public.tasks_benefititem
    ADD CONSTRAINT tasks_benefititem_code_benefit_id_d2b8644f_fk_tasks_ben FOREIGN KEY (code_benefit_id) REFERENCES public.tasks_benefit(code_benefit) DEFERRABLE INITIALLY DEFERRED;
 s   ALTER TABLE ONLY public.tasks_benefititem DROP CONSTRAINT tasks_benefititem_code_benefit_id_d2b8644f_fk_tasks_ben;
       public          postgres    false    268    262    3198            �           2606    379093 J   tasks_benefitlink tasks_benefitlink_lettremission_id_525fd10c_fk_ordres_le    FK CONSTRAINT     �   ALTER TABLE ONLY public.tasks_benefitlink
    ADD CONSTRAINT tasks_benefitlink_lettremission_id_525fd10c_fk_ordres_le FOREIGN KEY (lettremission_id) REFERENCES public.ordres_lettremission(id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.tasks_benefitlink DROP CONSTRAINT tasks_benefitlink_lettremission_id_525fd10c_fk_ordres_le;
       public          postgres    false    3163    263    251            �           2606    378878 P   tasks_benefitrequested tasks_benefitrequest_benefitlink_id_a9b509ab_fk_tasks_ben    FK CONSTRAINT     �   ALTER TABLE ONLY public.tasks_benefitrequested
    ADD CONSTRAINT tasks_benefitrequest_benefitlink_id_a9b509ab_fk_tasks_ben FOREIGN KEY (benefitlink_id) REFERENCES public.tasks_benefitlink(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.tasks_benefitrequested DROP CONSTRAINT tasks_benefitrequest_benefitlink_id_a9b509ab_fk_tasks_ben;
       public          postgres    false    3202    270    263            �           2606    378883 R   tasks_benefitrequested tasks_benefitrequest_lettremission_id_0c9371e0_fk_ordres_le    FK CONSTRAINT     �   ALTER TABLE ONLY public.tasks_benefitrequested
    ADD CONSTRAINT tasks_benefitrequest_lettremission_id_0c9371e0_fk_ordres_le FOREIGN KEY (lettremission_id) REFERENCES public.ordres_lettremission(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.tasks_benefitrequested DROP CONSTRAINT tasks_benefitrequest_lettremission_id_0c9371e0_fk_ordres_le;
       public          postgres    false    270    251    3163            �           2606    378843 >   tasks_claim tasks_claim_lettremission_id_7bdd1ad4_fk_ordres_le    FK CONSTRAINT     �   ALTER TABLE ONLY public.tasks_claim
    ADD CONSTRAINT tasks_claim_lettremission_id_7bdd1ad4_fk_ordres_le FOREIGN KEY (lettremission_id) REFERENCES public.ordres_lettremission(id) DEFERRABLE INITIALLY DEFERRED;
 h   ALTER TABLE ONLY public.tasks_claim DROP CONSTRAINT tasks_claim_lettremission_id_7bdd1ad4_fk_ordres_le;
       public          postgres    false    3163    251    267            �           2606    387400 ;   tasks_task tasks_task_code_benefit_id_611dd4c0_fk_tasks_ben    FK CONSTRAINT     �   ALTER TABLE ONLY public.tasks_task
    ADD CONSTRAINT tasks_task_code_benefit_id_611dd4c0_fk_tasks_ben FOREIGN KEY (code_benefit_id) REFERENCES public.tasks_benefit(code_benefit) DEFERRABLE INITIALLY DEFERRED;
 e   ALTER TABLE ONLY public.tasks_task DROP CONSTRAINT tasks_task_code_benefit_id_611dd4c0_fk_tasks_ben;
       public          postgres    false    265    3198    262            �           2606    378864 J   tasks_vatrequested tasks_vatrequested_benefitlink_id_edf110a9_fk_tasks_ben    FK CONSTRAINT     �   ALTER TABLE ONLY public.tasks_vatrequested
    ADD CONSTRAINT tasks_vatrequested_benefitlink_id_edf110a9_fk_tasks_ben FOREIGN KEY (benefitlink_id) REFERENCES public.tasks_benefitlink(id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.tasks_vatrequested DROP CONSTRAINT tasks_vatrequested_benefitlink_id_edf110a9_fk_tasks_ben;
       public          postgres    false    269    263    3202            �           2606    378869 L   tasks_vatrequested tasks_vatrequested_lettremission_id_786bbd79_fk_ordres_le    FK CONSTRAINT     �   ALTER TABLE ONLY public.tasks_vatrequested
    ADD CONSTRAINT tasks_vatrequested_lettremission_id_786bbd79_fk_ordres_le FOREIGN KEY (lettremission_id) REFERENCES public.ordres_lettremission(id) DEFERRABLE INITIALLY DEFERRED;
 v   ALTER TABLE ONLY public.tasks_vatrequested DROP CONSTRAINT tasks_vatrequested_lettremission_id_786bbd79_fk_ordres_le;
       public          postgres    false    3163    251    269            �           2606    378829 J   tasks_work tasks_work_lettremission_id_93a5077a_fk_ordres_lettremission_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.tasks_work
    ADD CONSTRAINT tasks_work_lettremission_id_93a5077a_fk_ordres_lettremission_id FOREIGN KEY (lettremission_id) REFERENCES public.ordres_lettremission(id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.tasks_work DROP CONSTRAINT tasks_work_lettremission_id_93a5077a_fk_ordres_lettremission_id;
       public          postgres    false    251    3163    266            �           2606    379103 ;   tasks_work tasks_work_period_id_e4289768_fk_tasks_period_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.tasks_work
    ADD CONSTRAINT tasks_work_period_id_e4289768_fk_tasks_period_id FOREIGN KEY (period_id) REFERENCES public.tasks_period(id) DEFERRABLE INITIALLY DEFERRED;
 e   ALTER TABLE ONLY public.tasks_work DROP CONSTRAINT tasks_work_period_id_e4289768_fk_tasks_period_id;
       public          postgres    false    3207    264    266            �           2606    378834 >   tasks_work tasks_work_task_id_edd86e4b_fk_tasks_task_code_task    FK CONSTRAINT     �   ALTER TABLE ONLY public.tasks_work
    ADD CONSTRAINT tasks_work_task_id_edd86e4b_fk_tasks_task_code_task FOREIGN KEY (task_id) REFERENCES public.tasks_task(code_task) DEFERRABLE INITIALLY DEFERRED;
 h   ALTER TABLE ONLY public.tasks_work DROP CONSTRAINT tasks_work_task_id_edd86e4b_fk_tasks_task_code_task;
       public          postgres    false    266    3212    265            �      x������ � �      �      x������ � �      �   �   x�e�;n 1E�z���#��Ϭ%��gٿ�I)�G7m�����H�	=�!�.[ф�	Ѐ��a|�nu�O��z�`0��&��>���1䢋K���=`�� 7Dv�X�'	�T���S�v�Pz5�]�j�2@�:��{��Z�Z��QY�)�7���c�," �˷�&�_�_��x�ى��@ݧ��G�\]����N�վ�R��K�      �   �   x�}�͊�0E��St?$����iW#3.D� f1 !M5����O����]\��$�i�u.>)���{I�րG���ӏ]�}z��4����u.�����]|6��;��8D��B�%��G�C�#�_`"c�'��2f<Si.͇ ��_	;�4vgN�*<�ۯ�Z/�+W[��X�����$��)r����/��� ��N#      �   I  x���;n1E�U�8 )�"gY�}�����>�q� v����ё�V���p�>!J)5��N�*�kcd���Fv"�)� J������q��׎��RA{ES��| i�=�E-�t��t9_�+���ji���W#Ȕ��
����N���_��(N�S󡤬q�>��{�G
&�l��cZ/��P�7J:,��2)��G� ����m���.U��>�R��8�C覎1>�~�����C�D�$لR��T�(���[��C�����ו�p�fV��4��eN��3�QU5n_O�u,:2HNE�`��֎#f|����,��d�Y��2~?�}��X��      �   h   x�3�t��-(IL���,9�R!�D! 13�ˈL�Js�p^Y�Y����e��X��Y�e��UZ���YX�
Ҟ�Y����eԙW����ef��$�����qqq �(      �   �  x���;�1D��Sln���D�>�&%����5�1�&�u ��~,�>���d�j�j
��b�QQ�����X�񃬙5�ېM�������!��‬�A#�0�B��=���~!��ب��H�/���{BO$�T����\��c�o�FjVo6-d�Ita�a���*l�it�΂���:����7���������R��<��&_>�y'Eø�<�H��0��y>@�ʑ=8��C:��w�~5��|����8��`X�t�1~z�$%s�i�;�>;16-w�Z�$�`R�%�Ȅ�t�OOz�4RO�{�Q��g�&�g(ݺ�\߳�����Ϭrf)�X��s�н��+�5�,�=wՕb����]rBȒ�rƔ�����&r��1Ə���������K      �      x�3�t���IL�/J,I--*����� T8�      �      x�3�4�45����� �      �   i  x�}�ݒ�8�����	�:?���ت�����S��k[��㘾#�w�8�,�T���}�_.�i���u�ST����]�˲��g���!� ^�iX�!� ~��o���B���1,����{Qk:P�9 ٝa;�X6hأZ2x4�)��\�ףh���>�9�g_�T֓ l��Z�\�t���R����XV��}��'`o��q��<~�&���������[�<�b�)��5��l�����������L�`�*�~�T�0_�5Ļ2�3b튱���XW(���F�s\��#;�cYCx�	 �4b! &�y�~<Lj��~���Ź*��B㡲�`Nq��
��T�&QaB=�k��Ľ{��q�����']�/�v��Dh���vE��.��tm�R�:Ͳ�yv1�v���l �" !BdSd$JӚ�
�k�<��:N�2��eic ه���1����1��1/�p��q.*.q�l�J *��uh1ih[)�%���l;��+xT+��r�%Ӳ5�I�a�G�i���-�����n��:\�{���9��ŝ�9���[C^�H�xQ�ԎEW�%5#r�q��bW�h��_�2�ώ�*!����bb,��k�41o92)��i���u^nEEe#���� A��tn
C�#,ݛ�&��NA��{���)�%�3Tv�	�n��lHx6�ɍ����L������*&tUv�'��M� K�bsB�Q&XB3ĵ�O߄~H��M-�"��
�C)m|=u4��������X�i�-���b�[���55�?�3��卖=��Co优��$�qXeNj����2���˰������Ҙq?\�k˨�>�B��2B)ک�vyU�T�ىkf�'�
�$��<ˌr��\�eFnR����eF��������a�/j��~�F��x���,������O��ܢ]6�����4 �����b�h�a�w�h��`y��H�NcR�Un�E}H�����*=�]�4o����8A�]���8x�.�⺻LR���$���ln�t����l��ߦ���L��7��_����eU}��xMv�N��~�e�u:��}ċ2s�C�ѳ��S<�p�I��H�c�.:��|�@h�#6�}�6_^�?�X�|;�P�@�<�x��v��`Wت�z���3[MXG��`^��~�P_.�4d}$��b2=B�~1d�;"�}1�=�֩�S4T�����ʈ� ';���S�	�Y�b�X|���P�K@��C,M����jRg�qnE�Z{~ȱm�b��'+��Q��Yqؘ��u�t�<if��q3y�>��sg��}���  ޞ�$��f5S�����J>�n�>�G崺�S��$��
O�7����*{̿��"*4�~��:�EC�/�f(��"g@��"hr�`ԉE�:�f�9Z{�ɬ�,'��'+��ר@ì�7�#o�3�������R4'y�tW�tTF_"	�TL�"	3����F�ٶ��_EKU�v��`2�^���}bzxZ3����Y*1����4�yv�� �� <��~���V�TZ��H���A�GHz�L�G����v����M;N��n�1�Y��nQ`t�"����fZ���_]/��kx�åh���8�h����h �7^B�1I�Q�E$|�yF��ª���B|$V{�=���1Z{R�U��du�W���P�T����#��d/�GPN6#���J�n$��D�4^�u^������0t�F�c��1^>�`1(���������a*Z*Bn \�� �F�	,�4��K �MÙNp>���颥�C#n�q�*=���Z�?C��X���m�߯/��n�s�1{s�"��,:e�r%�:�j{����=��*���5p�      �     x�m�Ko�@���+\�3�<�a��I�4B��ڈ�4i������__lLӅwu��s�a�_2�_�&Ɣ����L�΋m��Oy��
�Cl:	�F�i)�iq�b�:�`�Tu��~_��SvZ���!F=��0� ��aa!�	s������
�[xLU)�L�VR����- �Aأ�î�t�.�>��f:|YΟ�8σpP�Z�;�b=��y���F�S�/'o�������I?m�w�ZA�ŕހXj�k���f�u������u�9�G��@J~uZ�a� G�f[      �      x�3�4�4����� �Y      �      x������ � �      �      x������ � �      �      x������ � �      �      x�̽KoY�&����jd�(��{1+��EZ����"��fvM���"����eǾ7�+��z1�ޥ�I����5s�S"��I�D�c���wxc����t�LJ�d��6�27��u�J�Ѭ<+��d<������8�y8}3�,�eʆ�t8?I�d��9sZs)r��e"���VLZ�&��,Z�������|2��ÿп^����d0LX��\g9�X�0�+����ט��./��?��w��U��������?�˻���^]߅���y��Yq4*ƃ"�'g�q��G��	��i2r�Iozr�q�D0�aF�������89�,�i:Y����iq|\@(gg��0�.��h����_��������g����t��鼜�g�Ѩ�_�%DX���s�[��(	��V2�.��&� �p�0Lh��Jy6ϋy9�'�=~�?͇�b<O���8)f�8=N��Cyu��]��ru��u����V�
���|����o.�ժyN�:�XZ�(!���`3�y��VW�QκFV!�qz�O;���b:H���b6���Qz���x��&�t���������ZI��N$2�'����	k��
�r�Yf�j:<���Ŕ����x[,���o��Y'�咄 �a2�����
���4�C�B�g��!s�S���*YK��&�������|2}�?��X1>��=���Y:�,��"d��VL���V&�Jߡ��1���r�a�xB'r��3��Hc�)�,�y8}[��W����hr~>$�/�N��AT��pp:����g���)�������_��/�o�n�n���7����\'���d~�������/Z_�W����}Vy^W��*!$�n�
n.�LWA��#�Qq4I�qz~ZLϊ�mT�������Rޙ6I{�x�`�N0�U9�N'��9��z'4�9�y���u"*�������َ8�A����B47��,�O��չ�Z�����P<�v������V��
||ֳtvrv�o�K�:}s��>=�RyV�A��z��lV��⨘ob �n���LP-Ԏ�<1d�������]n�^���L�:G�jW�>��^�=�>;��W���������(�Z��Ԉ2�w<�ܰ�j�fM�4�y_�d2=F��ORH�4���t2���7)^uN[������KeY��b>,)����ģ����1@&�s
o���%��6��%���3��`yF�н(^ԗ�mn/֫���}x�v:��L�<BȼѰ�Z��k�fm�Y�t��%��2�y������ao\����~�����O�s.8l��[A&	���H�1*��똼&	C�㳌���\^Ԅ��2>t�i6l�6��M�U�P�B˄oۺq����O���F=�(B�H�����0�{dz�RrD���6���JCfA���?��-�2ݣ�Ӳ���z�����=�R�\x`_eҊ&��!�I)<׍lj|��x���rFX�����;����qV��I��4��Ok:���pa||�W���S�&�=>��>�Wi�(�Y1���s��
������u�ۯ�; ��#	���2aYM� 3+������-|�|���$~��hCz9=K��!�ɳ�]��	�	�N������x(R5D�)N��H�)�Ц�"�l�!��E�c Ҥd�@lNZ�� &׆�ڱ���`�B���� �-��W7:#G�IQ�ޢ��j��o����/�18/o�^���m�}��5�!\貪V �5�m�%��O ��h��O�n�CX����\옛ȉ�����ː�8� ȹr�$0d":ATM�9�Aşh4�:�4��oN�����!żk�W>����[��G��g�㈯&�d�G�L��G��Y�J�Hwi�r��&��H2����4H�%Ñ�����:ܥ�#��������Uzw��u�6!��]5��&�h>��k�\�܄�p�^����ëz�����^�ʿ�_.��������2]�����_��=���~�_���V{D,�5k�̇�	�H�m�*嘇#
�5	�=.g���䓠�*z��眥G��-�; �	'�4���*$I��r���ˁ�����p�M����6��)u�y��v��&���&ܮ�w��c��۹�w� �?o�	������^�]T7��%
��l�r�|�gY� �4Fx��Jp�C�?�?M`����iң��e���6iq��t������W�g��.�t��|u�k����$�CI
���y�$tiʡ�JI�t�l�ې��!0\�mu��0��ϭ� ����K�8T2�Z_��Z��I�!��9�	�K"y�G����y8N��߷��3O�x�����r�Ig�P�Ӕ��pdJ�h�F	�>wd?�#�Jv^��xqy��wV���L�+a�:�	�$�
�	���<�|B�<~,@���9�'��E1*N�q�,?Mj��R��D�Q@Ry4��@4]V+ �r��;yQu���_�����w͐�+/2��>�m�D�g��$'����	 ؁i�n��q `[.6ڠ�O�j�I�V`�!'g>���qH���������ꗗ�_�_�Wk�����g�e/a8�;�}�[ʐ9	����&�y#[Hd4Yg����u�Ӈ��M����)�i�a!Y �D6ŝ��YdB�����ru߄z�O�n�q0�-=(o�CRA��6Kh�x�S9�~�f�J���E�cֵ �4������N�@������`� �<U�-���e����m����1{�d�m9ˌP:C�!�
�0lG0ٸ����|1��7	c��n��q�G�i̳�<��mlb����;�Y*P'��̊X�F����|N;�a������\^������P�&�� �y �8������CB�-| <pb̫�b�Q̸�.�O!��;��>N:d����	�	�Pڅ8j�b��n;�$�W�Kj2�-�Q�E����x�@_5�����Mx��Q�-ph�*�j�=|��-`Z��4�z0M�)E��8֋ �>_}ڹ ��ʲ��]�7�a$�ʔ��L&#��f9c�%�G��7pUt����)[�ݾ\�1�Q�dH�����9�3	��#�
N��"��T'�5��4��:d|Ȣ�ŀ����7��|�8*���}�TV~�I���@a*Dev�H6ʈ��"}��<�c��ʘ<��" ^��݅����VK��C�����{Ye��au�i3�E�[�8�|rR΢a����a!��Ư;�\ �w��u1!�@����thJ:ƵN�%ͭ[������ ������������J�Ũ���t5�Ho�l��5�O���g��D�,ޔ���l8� ��K��)
X#*ah��%C�
o"�s���^�CQ��6�h@_o�Wg;��]���K^ԁ��!Exz���~���/˗�Je|ml��lb2�e�x�n}U�ʷ���W���Yz~�r\���F�w^�*�$F�>����CN'�"�b0/ߖd�S*�N�}������2��K%���nywq�l��S�u#3����ڬ����T� D�YR�)�}��"v��1�R��Q�S�댪�"zL�(D�c`VBlZ "�<)�qw��,�{SV՚��@3���Ue��>�C�e��+�������N3@��9!�^���#j"�ۤ6���ϟU���G�2���c��r�X��K�e~Hp��@~I��0��d����?uŚ�����:��S�o�#�d��H{9b'"��9,��B�5����hrԇ�O�%O*ti�V"~�(�cz�	*ΐ�����2dʱ~�s��י�V�����o��=��(t��!�̼�mV�VVye�����+�?�gR���j�� zs��2����Ʉ>'˂`t�(��H�'�i:"��~]D� ]��c��i׀;�����R��@i��C�8��[���Ve��a������B���J7�p1-�o��I�'���@�w|<��  /��+��ɇ�8ٵ�h�8O��:b��� �����>*B��ۿo�G�ܑo���~��o�׿    "�������y�E�D�D���ֵkZ�rx��_���$��3j���Q��y�*��z1B�x0�?7*d6Y��pK٣�b���Gu�MJğ'���'jȈC������K��"��
����mo��+�5"BE��xVՀ�x��+`_C2���9ugO��h'���`?b�(&8ޭ�G���Ү��rÞl��x���� |X���˻=�akC�d:��(��3�D1S������d��Rd �"=��O�"���;Ī~q2�
�`�Ί|�1��FŨ|W���ɦ0��n���5�_�Z�����f1��ֹDA~ɀ~aTdS�:4�U
N]�����&E����0L���^!5��8�٪�Hsg*�c�,��ϼ}�f�'=�6�4Y��P.��-�+�S.\׼��&�K}�ӻ��ٚ��O>�!g���6���.�i�׵*�Ƹ��ճ��>#� s�י2��ɑ+X2m ���y%U����� ��/��->��2Di��I�:�Y$�}�݉q�6v?��6Ü,�ԟ��(|���N�J�?��h��,��l�Зm�m�a���R�2�����
�En}��K�Ss�v��R���B=�[�<=*�\��p���4�Z�B6W�i��k���a����O�};��<��C9��%�5��ƵvS;��j tpm D�4��W����nY�覩���X1�w8{��Í$A��m�c����X�e1z���+�>�z݂�ڱN5�O��]y������}���$���ڷ�Ȅс�%�[�_Ձ�5��B2|T,4��O�w�`�8�lh��IJ�ŏ�%yY�
\L9��5�]�$,P},c.J��������h��a�j"��B7�7���^��m3���m��6}V��D���ҫ�}.����gs�Nt�բ��gm�i�iíd�n��x���3*<"��X��}ԉ��8�-Sp%�щ���� D�N���^�-�o壨w�Ay���˻u�m������X��[K��
�W�g����{�*-�n��w���1�f� ��Ɓ�Y����Kã��ϓ��)�ds�Y7�w�O�H��:�"<s�9ӷň��Ƈ��e��p�OF�߉|���ţ	S�&(�p��DT� ���&>�v��\�������!ج�,�)��H����̼E�R�"�9��QY������grܐK@q�S�/ O�F�@�N�W4��*}>xn��<�$5�����왫�`/n3*�!e���2S�mCn�1��o��Q���O�3�j�?=Ai��br�n���	/$99���
�����e'�Ϧ�^nv�⯫gAC/���`a>�r.2�w�Mn�� �s��
��X�~;�R��]�������)�!�\us�[�P�H��l�S�3q�"g���d�o��Eœ��5�\�t�9@~m_����K5�n��"�<>~&!Y�|S�
�d>9�-�&1;�%g��*4��4�f��I�MA�R8P��/kB`�ZA�)C�C�ޭ�2b�^�,=��wX�lrZ�ED�� ",�T����2q�&��i��ѠG�����<+�&��&6}��}�N�\��n�
��!�%�)ޣUh�l�M��f3�}6]�md��8p�������:�����nu���[&0�R-��w}����*�->���^����t�@�l��F9-&�2U6b��J���ޔ�f��ӓ��6'f
�t- *�Y���)�4�,O+�7�(G��/�v��H,ʫ�\����7@��=��U%=�Y]yH���;�3�[�'W��y��?^��|�_�z�{ڊ�iη�mk�bZ%J�) � ,	�wʙ�U�ۦ���")^ĒF�ԷP �H��8�S�L���3H� �������������I���i��M�rH1ʶ�W����W�b}믟|�GN�S��U ��Cay�g��$��6��2*�M'ǰh���!''��ge%�	`ٛuN��5<���n���4l�P��[�/�X�!�-#Cm���lhj���l0H�Z�@R5$Ū`mS7���bv�x ����bV��6m�s���:�]�d��Mài��@��u17�V�����3[��MzNC���]:X�]�����?m��U4�w{�C���zmX,�W)�~����kY�AC�/!I���y�jS��z�o�	N�'��S�-@N�%m�x�,��q�`#:/��Qm�5��C�����x��:|q��"�y.;hp1����:������Y�<�O@�>B+���^����u��㣳r|<����TP}�/��&11u/m,�Ʈp�*��1��M6 �<��&UG��Z����_�i�+H���ΠW�L{�UQy�<��)�Z���<4d<y{\̋oA��ѩ���!�F��˓��F�?�M�^������P��:wp���`)�n�U�)jF��76���A|9���>u/@X�u�h(�­0E6b�v�2Z�H]���p�vQ����K_�rq��-����[)��58u0=��������'c<�V:�S�����o DM@݊kMK��nc�����j�9Ԟ���v##��#B@�Y4������΄���BԺ��p��aV���G=����_��@����՛\��q�>Zi�~-ɝ��p��
�pW �T�!x0<�>c8~��s��D���߮B��3_�t�+�VYȽɠ�,�*��LX�um�O�4��Y?��o��p���.�7�d����bJ	�$Dpe�����rL��%>Z^�.�я����<���L�__����.kȸ��m2��-��(0 �2��k��\���[��*x؉��py���
ׯ���?�M��C�P��2���M����W)��?�B��Z��z�x�obX����J #�62��)I��F��>k4@"����߃7�hs��w_敀��L*kE�)�ƄJxG����?�u�\y�@�������E"�F$�q�G�0���5\_���i.@u��h��s�H���!6k]hT�kW�
A����_B���1+9� �z��E�P�*5�SсU'XLz���uyu���R��m��:������f��>8�����pـ<��Z]���E-�P5ye�b������t�8�*ƒs�Ȯ>H�e�x׍=��Y��[��I�N�9K`yW:EJ���ʊ��f�4%��ꚼG�o��t-�,�B�l'�o�4~��F��U	�o�\��3�|%�K�g�hxJ�~���x��FvH3Uמe�i�M-J�s����I�Ή�m�o�s_-{���o�y^� �0��M�
Z�WMȼ���	L#��[zi�`����[� 5QϠQ�]$�4gh7��DP����
�Jv�g�g*�S�2�6�Y�ц�l+����6˫_�w��=eѼq�5"3�e#���=�ʜQy�-`�0ɐ��b6[����X�Lޥ��D�cuFѴ3�� hc��1\���\t�#Ic簶��H�A
� j����y;�/��*�ii�F6�İL��NI%�:�O�#�O9�Ek)FEy6�9�Q9���Ń���)��x2%�˂���#j qUn7q��3��^LcQ�����@m�iQ���C�>֫�Ƚ�{�J�J��mC�A wj�7����� ��5�w8=)w8�S�ӛ�m&ʆ����-��Ȏx�O�aM���|�<�t�hD\U3*�"
����CtG`�x�1���x�� �t�|���Q�G�����Di�u����7�,D����x�Y� J&�u0DE�K�p���G�����Q�/�DF���Dp��6Bu+��Iב�hw��`�R�K���p9�Ҷ���j�L(�
�e�yg��p^�57�j]�f1�|1X�mp�@�a�h����j���������랼�:�o�]0ە��#�����vЊ�\�ȋRE���Xֶ���[A��,^��!R��rq��~�̐'Z�7� 3{�$3�%�eF����;��U�/��t�#�G�㋀�ץo/��/nn������j�i52�A�S2�%�K��5�x�y���o�'�^=�H*�|����M6�~A�%���}���x�7��7<;"�9�ig�f    +��V�_U~�l����G�=|�+���	���&9�W����ӀMO��㞦S�u�<��L�AE+Z��7ϻ�&~.�]M��'�q��o���d6�V������l<0�7��R��W�(}BY�d��=/�+�i�9>5Q�XK��,�ze�����~����0ݐ>T����*��2���TOvBGN tО�ג�TM�Y���g\%D��1)��x�(:�BkX�ݠ��/�D���ҁ����f��x^!����a�q�Zѡ��9���ׯ�� ��ԍL��d�B�jy{ф��ս���^؊�  /�DJ V[3oɪ�2�6�M��� ���W�l[l��Jg[r��/9�t�2TݸSNC��|!3�3��D�q�z��0�,, (#ҫLV����<�`�F�p���	�s4CR�U����"��I3�v�с�	 s��pHX�h�*��ޢ㟷�B[?ɡ�q���r�/�k�{��]S�uk}�tC4�3Yf$� b��b��hJnz0��A��ǂz�/g�a΃O�#�&�TL�H�i��
"�D'��e��^]�y륿\�m�7�.`�����G�b��!;8O�׿U�����7��=U&H�{)2Z����U�9��*���D[� �� ��E:/~,?׸'��`wωVֵP]���it�j�{4�4�wk��L�� ���z��nu}��_��_��k��ν+ę���
�e�������*�M����:�c�Qw6fG�j���YȠ�d���q�C4�Hxh���ǊieϽ9ۡy�5�/8
�׫O	#?5j�m�㙗��3�Y�p��6����<��)rl�Ay*7*A!쨈��oN��o�����aʠ:�XJ����	 �U��EQ�)k�4�����~���s._��v)�v9�v�u0�����M����3�4[Ɇe��ў� yx�����1�I�"uC���K������ϑΡ�J��H��W=-�V8D����(WlB��E{C�RĊ`��]��3{`b��Q��eD��]T�߯��J�-s$@�T���X��Mk󺶶m}2|���љ̡��	�������!_(VAkT��������X �T��h��0�7O"�~�g}]�l����]�K��\Dʭ��p����6�*Paߪ����q�2`���&��m��\x_.2�[�M�Ȯ�! ��1��u�/'~ف�kI���k�����H�-̈�e��������^�X�و&��s����q�su:����P�V.7�Ҁ�N���k<��I�eϼ�g�� ���W�.���]�������š~��_ߓ#�S�˫��k�b��|-�z�֦6�r4<���������P@��D�쌋5��FrF8�@���q�{�"�Ǘ>��w���շ�2��pC[�����/=OF+eh�΀h�[�!D��o�j�OA�Fe,6�'����AtM�
�OQ�Rњ:��L�Uw6����;;�(�ӿ��.���e�&��<L��Co.��ӕ��6<����4�y]�L�`����H�p9vΐ�#/�L{kH$�c�&r��h^��@�(X� x�n��ĐXȸ],�43�ܔ@އ�D�I��i��fЃ�A�A�|�R��1�@Y�$덑�o|06�Z�tN��CZ��&
CAXo0V�ڀ >�}O�j[��M�����G�}�I%�g�2/o��_��5��{�Tk�@N�7PN�CM�M�:��,�u?�R�śȘ�RbF�
ĝ_�&�r31���CUՕ�l$V�-��q�	qvC��^��l��G5HA�7���-�|���C9��U���&.'P���3mF��x�*5�Ju- ��y>I$�ʖL6��@}��>��>`�������;�a�rq�j���iD<łv��+�$�A��$�hВ�P���hCZEä�<�k�3-ғbzLlo�VK��"N��,c[�����-�?�eEԁ](�\V�J��:��F�:���6t��J�<�����&.�LS\�K _���7�z.����5>�Y�ӗ�˖���o�x��G'u�q6!��˴3�%���}t� RD�y������?�&�}��{�3R���c��\[z��`h��̭�c�u2����Z"_e<T��/;���Ќ%�G�8ܐKJ��� ��D��� �lA׫_C���SB2gu�P�$i)ٔW���L�`�6ur4��R�0޽z�J�Ò�^}:��~�[c�#�Ǣ�4�]�r7���E|�`�]�����:��|T�9��ð7��Y�ۜUp���?+Z
j����b
�J��z�X~. �ҧw�rե�y~M(R,�N�v �qIy����K�Ӵ�8�۶�Y���jywq�����o���#�Q^FC����G�jmf*�y�c�<9����vtf ��~�0�s3��J��ˡt�����M�n��ud��e��b��>̾���z������b�x� �=$U[�< �4��Dx�T�+s-z�(owe����[�C��UZu�-�lS�mģ�+�W�hҌ�0���� ���۬֣������i�FZ��Ѱ�bN�F?�;�wL�Q��"V����:��H�(b����Z��i�c;�QUgG4�@C�n<9��iY���"G��~s�Z�}G5����針*u�v�bB�߳,�����L�Y�ba�
�Y��n9l�8���q�s���iz��ĥ�@c��iYn$F)��P8`���&�Ղ╳]��!���}u	W��M�p,�������[�J�n���r��=��+`Q�d����&sN�,/M[1_�]��MY��{0o�5��,=9M����
gg �_c�V-zD@a���Yj�K��L]&R1�Y�l����R4�����Jԕb�Cɑrby�k��7�Hm#r6�(���eP�l���"Q|E!�JlD|�}z]��#w�[[�jN�2D�	�ei؃4'���������md�T!_�۫�4�>żN��UrJ�1�v/��+C�7��S��qk�2�Պ��ʘ,�/��nZ��c�"�N�*3�
��	l�DD��%y$�o<�o��V��*<||�j������Y��4��,��iyDc�u�֖[���U��AR��2y+��a�ne�@c�͵a
=N�f�t3��W�?���f7>hb�����:(�Y$ޑT��\M���i��tw�k����˽�7
m��*�lA���:CXvY�sQ+ �fxTN7���!y�]���MM<:ť	�ӽ	"�@��3�k�i��p���w�,7�	�is�����P-o7�m���#r˒�sW�I�ZoCK47'� �E�>N!���/X>%R)~LALn9l�#�Dy+�s�dws�����[��c��D+t�\|X���y�ܵ.N��y����\�ef�6PR�R%��l^�g�yu�Z/#�8p���@S�J�_��}�M�q������ r��""o��͌�Q«'b;�#㦛#3I������*�L}���_Q�W��Bڗ�S���[�t��2]>��y�{��.% Hzw�ͥ��f���7��W�7ч㧟�׫�u�����ݨxP)���������.hj���3����뜨�����j���&�r0���al~N�qMG��?<��4����HJ�9BO$m�$�@��`-�F���E{�"Jqj\~@�u�眬kD[�h��&��3�?'ӭL9-��b���+=���$¤S�3*=��/P�2��_�~G!�T��Jb@j�\A�.��8�N��կ��)-��~�'z9������ַ]E��jՄ�}��3��t�[7��F@UE�!+�$�!p򣏝0%4#S�E���+�Snӏ��ど��&N��Ab����J*Zk�c�nK��D�yr#��%������:��KW7�s��w}ߪ��w��,,uc������|]~������Gb�s�!K�:T����*<���$e�&m~J��H⺲��HL�ڟ���"-�ǈ��,0>���d�&���I�TL���B5�]M��A*�    o�@�����M��ZT%i�`rq��E\'ߣ�5�\:�@g�o2g,dVW��w�"�������> ��~$"��uQtw/˟��S�}e�K�M�y:��a�O�8��v�.�4�V�e���(��I=�≊���o3���tL�cFۡBق�����0Vv�^]�zuI�[>O��ײ9T�7Yp4�W�yH)NP��u0m�J'��SU>"@�]�"tv�j0���U��q]E�N�۳�M+�����'7�	�m��	��\�tҤ�&ȳ��r���R	Bc��F��)���x��Y�?8�O��pH�N�~\kעo�@xFr�u"r�$tE�'����f���nb';=�Ӊ��Z����)�;�Q�&���bA�/,��R��]�;��)�ySL˳���y�-';+�g���%�wS8�rq�^��D��EG���� Ii#�<�C�?*�E�?��C~a�
׿�����{��a�)i��8WJ��m+�ܫ�d��|2-���o���N�	�A:��x��]�_t:��ۋ��(�qЏD*��9�<l�!|̇�t\��N�Wwu`cR�_�WmW���_��ܧ���	��]������|F�vN8��Ɉ`e����g��,e{G��0ݴ��:�t���R��+q�)��ѐh!���iw]�� _۵�w1���u��n�K3T}��x�@�^�96�Ef]���ʻ�U.�u�j���FX��Ŵ�l�~�����n]�^��ߣO'��P��&wn#�:>���=���h&�%�0�n{��J��{(`��U�B��8w�7��8�M�=A�M,t�h"�{��}-��qx��)y#s��@֤�ߨn_ꞩ<zGs"{N^xd#5��o1������x�PW*O ��I��S�_���9g�[������2�^rkU�g����vk����}�?��V�Ў��#[�Ϝn�,�J�坶����gi��s������f$���e���m��]�J屮�+������h���Y ���!k2���	ͳ��D��w?=9?�:u�Ѣ���N�F�@m�@~H�*���A~��QՎ���i��ж�����k��.�cF�G��p"9�,'�x�f��V׾���Yq6�+;�������.Q޻�_L�4�J`^ө��i�kgi������?�����K��t����^׾���k������D���W�{Ð9���{2�@���p�v!@���\�)~*�6�`׭1�&n�r+�RǑ�x�����f����������+J��.xq@u-ok���Qӄ�TݳYÌgMcZ��]��i#���PL��o��4��n�Ńm�8��H�0�-���-rq`Ќv�F[_\��_-l�������=@��&�mK�!�>V+
��ݵ���!�y��hr����v(�&/������A��9�O�-�W[��Rn �(�y��w��yk�i(1ԙ�l n�<4������ [*�Y�٣�����5Н*��fb�S.��Y*`#T�^������N'(��8LR~kn��U�ø�<LS��V"��������9R��줣�/���Z�Enjl���ĝT���
�)9w[�r_]�&��ON9��szO��5�����}��v<E�5��B�0-����A����r"�٬�v�!S}o�dgb*�T!<H�g�h~�7 ��A���]���T��ؿl�YUKdT4>���� ?|��|� .���	�"ws$46��X��Jg���^p��S
_�Ծ�O�.�7{fmm*�j���7�E�XP��ڳ�
U�&4�HǼz��GM��A�W�Ζd/��Ӟ�EF���5� �o� ���/B#�� چ^�=�.T7g��\E.�:��bY�骏@f��$� �M~:��uK,�>�B�xO�F{�P2�"i�t-�W5����h�0'����v�����������ӭW�D�2�Y��f�iQp"8.����b���p�����$�� /��ؚ���:B"z���S���>�啿�o�����w�ٶY���Jd���/�<��2�7��7�ڤ�mF��%Rǩ�����шն	I�ݭ	E�*��+1t4�����[�R�������2�˓E4��G\�����i9<pf�CHS��|M����:'��9�O����v��^0�/F�{.F��g爚ŀR�������(}���뎄4n$���__���-u�Z��W�*s��m*U�ZH������#����#�!㉄���n�}Kl�Se���b���|g��KDT��l��ԓ/���^R��y1i(��i����=���{BK7��&>y�mFd�F�6�9��g��*��J���x��j��t�SJ�>�0���Q���QD��'�B��Z�O6�w����S�vu�^^�Y�h��mfdKJB��.����
�ړD��l�#}��l"C�-)��x�<I�>���@�X����Hg�����0죰	M�3�i�ظL6��\+y�X`:QK���&��	Y������Kf��Ϛ3������]�<Rw� ���rPC\�t�hu蒸�;#/�;|ݭ
�����+��J��V�R砂�@$!���H�������ttڑ$&މd,���-�3��L���jA4�]Ȕ�mp�d�IX:������T���o?�>-_�����\�g獻_�뮴}���,�4�u1�Ԙ����%��Ŝ��!}a�:�F*���vH���_�d��pVx!
Db-s�|S��YM���"�k'2�w��8��;aZDg*�9 �����u�!:��U���8{������B���u�n}~������Q���D[�-�"P>ŵ���ޙnc�8*g�~~�Y�}��*D�� l4��`V�;9��1�g9�]$58�E���Z���]�f�d��:��x��5�qH�����<����8���'�+���='��.�#��޶���e3D���X�ӄf��?{����IU"Ӗ�7�s>^7�m�H�6	�p0,SZmzx�1��v�j>D�މ��7�]d�9`���]x�:i��6���F$��B�@=�j5`
k(�:�Ӱ�iI��<�(Tz���O�[��Ż�l����Qq���C��,h�#څ�fH�Y��$vd�\������rx��\'�q8*�4��~��I��f�`8d}C���M�[��s���,p`o5��5<G<jdf|_@W������D�q9�FVĮgTA�/1�a[K��lk<�G� ,)��.����	���U����͇����z��lP��"N�ɪ��Ix�^Ƽ͸V�e��mk�A9w2��ٴ ��k<�v� ��;o�
����AI�ď�(�`	r�xH@�[��,^x-y<.�w���f�����2���Z	 k$�A�BD�2K����A��T*)�"(��7��O��M�|4x!r���9��q�SU.�@f�r)~M1��-����*�=/���ns�7�Z��4��T���>�<�-������h��.���ǒ!�."�	A��
�בq���Tڎ.�O!�T��nw�;I\~��� &%�i����VT�Y5�g�7Pw�&��H�Oi�U�e���[��zd���z���^��_���K���3P�oA�����Y,�4�6!��;৭4u����o�.�G��M>�5<� ��J_2�	�[Xb��s��	0*i��ݏ3������[!�o=��zy��uߑ��:NM��"s��*b�`-LFT�'��#B�_d9D�S
�Hl���Sń�m�(����-�!N�
�������r�e^� t����X��BF;����A���$W���'�-I�G���ZC+��Ê�FX�@�G�����y/��k���ǯ��g���FVU�%�c-|��Y��>SB��g����:C ,'_� ��r�)A�/�&��t�D���"�Z���:p8O�Q�[�7��:R	��:5�R�|�[�2��Mkj��~�I��T���Xh�1�hL��F�    Fҧh���G������'.�d�>h"$&�4�1���1gd�Ī��`@�>����`<��@���}���i�@F��]!s�i�Y�1��A�p*T�Ы�t�]<���^��	HbۨP��.bk�o^@1��[�b!k��,����G�8`$o'|sZ����+���X���H'0���h�����V|ϭ�~v��� @�4�2��#n}d;T�˃O��irq�e"q��7�u$ƻە��¡�
d�/;�C��p�D��)�IOk�
���T"��6��P����Y�I����Xѕ�Y���!���r��r�p��
�問Km��������G��@?�̶
���U���2���"$O(�>P7~1�۶U��uHD����߬�_ B(,?�9���W�TY��t˕	�׷�nr�T����G���N�؟v�<�Gi��N�'%��N6_L&����<�	}�#�*��TN�x�gU^��7���2If09�b[QV����Vӊ=L�K{ƄF�tvj���N�j^��>�Cb��p�e��T��C���y�K��H"�x=k�u='�,�^�-�_��Ju5�.e��S9�Ift.�lܫ��K}�$*�7bum��n����}�a�|*#[5*�%P"�S�O�P�������"�K6d�}�B9|s�j�BF���|2y#Ln��&,&Ȓ�*@/�J�q�m�1I<=9?ߜ@����j��{>���[�{�Ќ�]���+�m��*��4mXȫ*$�QIT9�#��l���.�>V��j$z}�1�ϒ 1'�%�����c�=��OF3Y~��_�U����1-D�\f7K�f�ͫ��j�i�b<�3�B��|=f�.�2x:�v��2��-���ۄ�S�;�
�� �l��p*��:d�UH
�T�m�o鼏V*���7�������/�EI۱NI�瞑���N�	lL���u^�U]�k�1�X����=�-�ղ5T���tK�5�h?�@��;��d
��iH׆~����"VJK
��"��φG�åD��H�$�:9"qQ�N@,\�H����M.���,&Qx1t6�ŜS1��1�!@���d��8�S��G��TfC%3�u�%�im�/�mC�}0!٤?g>���M���?/���CU��7<�e)*l&VkM��$�t|�a����%�+_�.�^:1����,�4�XI�e(`M�7�4D�Q%�r:η3M\��8�y8}3� ���R��.�m�џ�Z�4��2�]&���V�u�x���#1�i`���}�m���Y$C�[�t�q7�o�=h��l�����c��p2&jke>��D曦�L��j�hjn�����<Oѹ}ʪ�d$����{���Ƿ�8Jc_��?�u��K[�7~�w77�{|J]W9���&�E��g�s��QH3r����8-�ߖ����V�t�h[�ju���w��v�������ad��VSN/��W�Ã�q���ơ�^̐��0'K�YȒJ94E�p�?�J#�?�Ю��zǊk�hs!�Vx���h�X��!��n+���l6����ע"]�2�J�����bGL���M����~͒�"�v��v��}���[���d_�vNO����1�v��zѴf�jI|�q�:/`��)ͷ�o�I�O�'��$�	��!<��q���e�\���]�p����uz�����4�T��f�݁7(��Eh�k�^��]��.�w���M^��`@�R((�����v���"XV99�	���m����t������Yz�񿯗���V�����{X���Ir��Th`v����x2҇͜C��:t�"`�AVC�(Y����<���N����/��E�M=Ҹ�Q��:\�p%n�c"�֫V�m퓱u�c�R�\�iF3��W9T�{F�p�>ySu��2�*R1>Sn�8_ 3!-��)&�2��G�л��bsq�&���PP��ˉP2w���eļI̭n������Q�9�+��x�b_5T֡m{h3I$Б�	��aݴ��E�ri���J��h8��QF�^�Χ�JG�'h�6"PF2��L*K�L� [�����2��֩�Wʆ(�|]�M]�DrE��ē�Guk��t]��E�|�י���������$��D3:e2����@�b�k��^q <��ؔ�vBB�\pDL��1:���Ϧ�]���i��}:,�e�b��c�3y�g�	ʶm���U��6�R!gϑ����s�}`�-��O#ӟ(HgT@����}��~\+sN�"+@�t,M��`�?t3�,�@�D�${�������7h�O�'x�)4�-͏��d��ܑf
w�9�K��6���~�v�
@�I���K�������j !�t�-��W#?2�%�d�{�����)�b	5Ȑq��4�
���Cl�1���p2��҄�S���47ձ�b\�%�����Z)DBj$]
�����6��[�J�ϫ̊�UЭ��D��M�b0O���lsշx]��cvR�xʤ�Ҧ2�Whu�k�F�b:�ڑu)���.���?�og��hZ����ͩ~s�T�Z�x`�̵u���T�hUȽ�7~��~���Z��y�<҆�p<b�p�<�e)�͒2�%�C���9�e�'m���qtX���XCT�J���\�
��i�g3|���G
�14�1��I���)tyY� ��8Ab��DCc߸:��2�=��T�{�*�:u�l<k�tK[g���Dk�B+��%Ǔ�<�b=!���l�P�нDd�Vq�X�J�Ԟ�D��%����cz��"U�uGͪ^�4��'��T�#|��)�� �Y�ټUok�j�?���IB��g��K�[:�\����Aa��#18�ww�:}��{����X�g�,���,T��GVQ|����g�?�X_G�b����P��"�t߈�m�[z�N��a2�����#�����L�f
����J:�_�:dJ�_����lǨ�3*r��Ut+�yh�֖%go��1*N���{-��~���W���t���0[6K���
��Q�N�AB�7�SZ9�~�O��v��*M=ݚ�;D9�x_@�9�+2Bu��1�.�nC�q�u{X����/W�΄_ԫۛ�틧��.�"�5RMFǒZ��*o%]Lj�G
�|6!���� ��:�5��w���#��y��~@��1�ͳ��jr+�[O�.~��}���w��X�.����P��	�m�3e�j�U��oj�]o-ҁJf݈ݡm��ir>/��Ӂ��ԑjF���|�ב��q��i��n���g�2_���f�����f<���iǚ.cW��*<��[<�w2��|s��y�����%7:�2�e����	���ݤA�1a�I�-�� ���|[6[raЛ�H��&�4BJF./���i��{��.���\����rٵŻ͙OGB�&�4j� �ˤ4Ի�ְV�3[U�!���䔜x1?S�|Bo��b���ha&q�Vot�.�J��i�=k���=j���R�7��#������o�_��n�����G*����b�o�*��3|A�/7	�1/ҿ( �)f� d�T' j�w���w5,�%d�Lk����~o�e:��ꦉ]K�9���eX�B�Lgg�eC����DM(�H�xdK:��^(_��d��Ć�l9�]��H���qyfT��-�oY�&��
ӣr��z�� ��hB:�,���TwO���P1���1]�ݹ��໻�J��4jc /C�_cwIBli}��Q���cʎ����d�U*������D�|N���[�Z̞�-�Hs��jvC�����7��%��C�� K����I���j���(�e�frR���%z֘�� Sl�Z����n����þi�w���y���/����PYad�N�*�&B&�3+���>yWL����?=���d��@��9�$$�dhj����I& �w�>u��Kʛ��v'��#H�~~��o�#���7Y]	"Z5��#�ݗ1�T��HV�>T?RFD���������H���:� ^G�x���#���1]é�^#�ϗT^AI�>�NJ�m������x��I�Dz��C�\�� ��O�0�g\���?� ]  �V��������p����,�hM�+��!�dE#ŵ��u��M�h��@ẳ�.�BS;-���� k�9�"3�x�=�]�+O�î�g���i-�e���I���p��v1���+��H=%�{ј^4BnD�q���u�d������:��W4l������;[�BG�i���X���A�∈�GqD�_$��А�'��2�t8?�:���
ΤQݠ��4� ew8_k�# �:�P��Q�6қ���I~='[����A�	 �����9=�R���Ni9��4nB����#�i~���t�XtT���h؏�ʏ��?��=1ºi��mr}�au��6"����(s�UNȌf�⵩�̋�I��\L��y�
�H��(C���.7��y���ڥT�I+��l���bJj� ���}���#�{hj�� �n2�j�a����&�I�b;Ѳ�e��}XB.��J�ad�t���%i�0l	�W�9;��_ppGw�����#�/���I��) L'�DC���2��6ktÀoj��<y��>���Y[LT�"y)�/\@��΂�.���[�Kx~��of�&�!�F�/*�'���; M�������/��F��"(��$��h���I��y	�����w��-ޥ5�%���W�	>Fq���L���qy\$�T�NZ1{]FFj���>ػ�Vtg�D��1Z8Q-=G�	b�()ȑ<��u�C���[-/}sѮV�E����o�M7m�����m^����u�={�xF��1��܊䨘-�?�=9����uJ�n.��lN<T��!sD�,ELz ��}����0����?\�!3�h����x@�Ll�J�\�mr\Z�gD�G��9P�hۨ��a?yD�0����|�^&]6f�N�$�����g�A��G���[q��{9��D��	�����ړ��Ȓ�3�"H�h�G�V ��ڻ(��Y2�i�O����Ν|B:G}��;������IB���[ǿ��pS��F�!B�/:�[2�UN��	�N& �!Ff� �(�R�%\h2���d"]�n)��*�	����S?�E1������xi�������`�2Zo2dp��W0`| � ke �.�#�H:\S�v��(:�@��Շ���d���������|6ǿb-B����nMP۷Q�R�����6C�g�
?�I��<���{X�R6�D�o�����=�Q���=������sjCAIa�j�T)u�Y{�
vf�)�o����J}�4�x�U����xs��S̞j�2�	��h��&޼!���6/atؑ�?���Y�πS���ZK^�}�;l�e> �e)9���eKzH4�倒9�!�^\E��@�x��_�Q�r������;_`�q�cڂ^.Sk����%'Kk�P5��t�;���/���U��Lp<oP��VX;�q�pID�Y�����L�t��i$q���5�`w�v?L�/��*A*{9݈�&��T5����u�	��#�5�I�N�4��M{?.H�Ӏ�)?"H�)�P��
O�Q�\$F�KS��k�b�r�69|D���c�s��t{7ջ��d��݅a�p���      �      x������ � �      �   �  x�m�ˮ����ͧ�r����l�}��H��d댄l����cǀ�A~?�y�|��q���o�u����R���';/zJ�b��ۗ��]H��%eU)=�a�"�����m[�����LR�j���yϭ��w�N�<1�!.r��ޘe��~:�Tm��5��1~@������F��{k�Y��م+����"�+��D�Z��a�� i>�i��j�����Ƈ�x{8��my~3~���t/@�j��z���+E���M�b�ݙ���X%Y�3����rY��-�d�d��M?�N��UjtA�]�l��|�g1���c���Wn���!�lo���L�.�~Q��2?�I{3�!��t&c�N�n=�TbPz-�+
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
,@��3����g�����{L�)DI8���U	 g��7����*�F�0�t�8��������0RC12q8�s��(o�7}5ɍXޣ��n����&5��P;,<��b傁�iH�K���u���5������{�t���q���W-)�MM������2���cv͌k�S&8�a�cP"�`WTIfg�~Iv�ð N��Bx���	~�c����_�~�?���ϟ����O}T��]��dɮ�f��C�;vE3����Z�a�ш+�]���)�3��5�|��I�>t����?����o��'�i	�'�E{��Z:)o�Ee��l:Mi���MZ�sQ)�x��(�Slk���sDe��dcl�(�Fd������bZ��}�ʜ�PT�r?�R��X�A����&G�m�L��3l[�MR�J��S?l�;�1p�����boƟ�8F���{90]mp :�)�uO(�nM���$f-P���lC3���B��Ǽ���E���;�#ճ(��s�M��:�u�2���Sf�<u�L�{�Ƥ{dǼMsJ�z�~��#�	�����I�֣�{Lh��['@v4��\��/Qa��R�Co�,��i@��4h��v�RvA�9�b����c��+�=E��Gn�}{zz����1      �   P   x�3�t�wqu��uu��2�(�8���q�r�x:9*8���z�p#T�:�9������p�q���r��b���� bC�      �      x������ � �      �      x������ � �      �      x������ � �      �   ^   x�ȱ�0��La��> $Ag��@�A��6�G�A�N(-�����՜2��7!a� ���&�EN�?� ޖ����
�(a��<�E�,�YJ� �#�      �      x������ � �      �      x������ � �      �   a   x����0���˸� r�������S�I�97|y"x�YMai=��8���}C�
q���ѫ!J��ܪ��l�>�[	i6M����m?�      �   �   x�E�;�1��:��F$�)�s'����D��ʲ��QA�	Z8A�r��l{I���P��mvk��E����u�����*yù'|��-��܉2�6A!u��jY����P��W����l���<��r�V������J)}�1�      �      x��}ے]���s�+N�aB�TH\�V�(5;$�A���`��	^�UE����y����~lV��a�gc�.ǌ#Z�&��@�̕��δ�JH/�>h�@�֟;g�s'�YoՔ��T�0�k��&�=�f]�����~���JW�����w������U;|�������<�����O�|u��÷_}������nR�|uy��O�vsx�.ۯ���̨3�+��'o�3S���Ԍ��ck1E%R�-h+����Y{�߾��n�ۛ�
}NWh������T3Z�D��xoD�����JI�d�px^\]�n�7W������+,�V|�ԋF� ��I�"�h�[c����E��v��T�s�r"[��n��F��2:����Z�e�owr�>�e�Ŗ\<�ք��	V��B�մ�>�A�h��mVMU�L���F"��D�$�W�����2�|nE[]Dn�S�ds�H"�����X�A����zL�Hd�0Iy�1|£3�3��}�I�A����[xUl���J�.�"�����Ԡc~�vS$�,%��#�N�Uߍ7&��c����zXC��J+o��UW�RUD�����5�L�!�STW����/�Q��_�1��,Ru��a�Qr����� ����E�VT��&������-��z�+_<{���'�������/?��������?���nފ�tP���Ȝ{Bܞ���v{q��~��/ʿ�7j����|��P���߽��>������*�J7�����˛�����?��}p�}0�<Ĩ�}�S����Σ��ع����t��i�@��@V�ޢ�����^&������߮����is@
�g� ������~�����n�ҟ��5w�^�A��n}n�12��n��Ԇ�xN��<�Z����n��ͽ|���UW:ׁ�[Z��G\��:�jׇ���w�7ׇ�?�Je���U���yw}��}y�����\���j參���p�-��ҍ�z}He� D�����m�L�c_~u��emo�SSgݽt֜vV��H�.��Ͼ�|��џ߾`��K?Nb�~`�9��D&��S��^^\c�қ���=��I���>�t��������=���'�� �s�b�qnQ�}��f�~�D'}�R爎��ܾ:{������~}x~�Fw?�J�Iz�	à�j��O_~������nҏ	����cz��e�:|i�t4�!���ѱ������WWo/o8��\��W�{p/I'q���U��s����/_�?����Տ��]��_�{����;r/�J'��Xy���Q<CS?�^������f��~܄N�*:Ε��Nh12����Uz����뷯�M��%��^�?	�=8�N.�	�ti�[$�˚��ý4��������gO�4��}�{�����tg�'X�I�4�R�����w�b�hO�tv Hpk���ī���x?�=���IO�����o/�a���חo�?�)W� �c7]3w�^X��_è�>��L�I�H��* ��2��$$[�U��������I��Gm�,�2��O�`�Kf�d������sj�_�����L�p/i��Dc�@�s��[G����w?�T[�|3u�^��9���ѹ�Q~��G5�v���8�uI�o�,%����aNb�}`f���R���?������o_~��m�h-��^�p���M4`	sԱ�ӫtyŠ���K�'q�!̜{�p��u9g��I}/͟�`.�ϭ�O����[\��dos+֚��i%����Ƹ�Ǽ���/Z�y��.M ՠ�xڄ1�R�(�=�a��mL5�3����mȥ�Մ�0A�u�����	}jBé�C*���-�`2�S��^Ρ�������W�?a%��a2�ג��%T�fd��9;�ew���:p�̫NrJ�?����7�#4�t�_�~�ˉ?���i��-{~���jϞ=~S��Kw����o��oc,�����_߾i���'����,��_�~�k�hnY��t��/J���Wk:��#�ٿ^<�,�{�N,�c_?�7y{ޜ:�ecy�m�����܍�e-��U��[�.��s�Z"~ڊ��j�V�v���h潩^��$a��"w�E�F*.I��>{��}?>���P�	R��nsu��=�bD�)�����j2��]|�����7�}���G(����ţ�����o�|�/��7' ��:W��4�XP�Λ�w6C1�,JČ��+��{�д�Nl���I�?S��&dY|5��`�S��F�l��k��G&O�����:�i&�Z��%�cLJ"��ͥI]d���^�`u1��*M��uE�RI�y�e!уͲ&Y\�Y���xP0��:�y	����W)�ʘ��/(S�s���"�y�Z-��\��^/䉝����]������%��6���	�?�|��n^��E�d��4ޜQRݒ�E��l���ٓ�^<��1�����R��
��{FޘV)"0Ԃi.
�c(�躁+FG�-��_���!�A�ܴ�#���߃Bm���g/h���<̷�1�y�ibb�i�VÚmѩ����>~�=3�Gk�����6��ҷځA��-�S��rkP�57��(7��+복��/�>zZ��.}�Sws�~�˰$�ٰv1�ٰ]��cX}wu�ˍHG�.˜������Mp�VaЂ�����?�����l�����ߵ���'=L���g��^8����s3�}�=�7&w�ߚ� 7+�q������8_���E�۫��`{�&?�;��S{z�ɗ�&?l��k�l�9z��\�Ts�g��t���]��n����E�/��	�+<�5�������6z���=�=X���p��m�(i�����w���A����ϝ�ci�hoJ�h�q����_�Jla�&˷[����Z/�V�o��6Pn�5���B�j,����h1v���� �hSo�ֈ��8�
,�����κ��� #
أu����b� �3@����Uxo�t!�hf ��u�v>u��hw e�4�����~�:豭��=�e���Yм^V4�m ����z��Ⳗ4��І�C����ݍ|�6��G�4 v�,1�Oi��r�5�ۀQr E��w�����q��{�8j�ò�?kl��\^���@x�
���O�z��m�Tj}4���g�"~�vc�QKc�����_��� �,��s+�SZ��t�x#����SX����>��v:�u��w��[ S��5��7X�>�Q�頃YW�ag�����kQGZׅahY����H��''t�x������?�>p�#hy:�����,"j�_sk�Q�(���v�@k�.�����pj��9F���68/<~�����f���C���t��ON0�][eu�ǂ��W����۰Qؐ���V�I$�q;�����۩A�ZhY�Nh٘��J��nD B.,[;��_:ѷa��a���ۘ`���T^�b�E_vX0�6oCH D����h������w/IJ��b.�_��� ��=��c�b0�����ܞ=����b3tj��\� �:��lF���=�z �[f�Q@ԇV>�,@A�l�C�s�uG��6䭟b1����h0t4���i[0����w���ʾ���{�cs�#0�'����`��n�_���E�c�4���ƆUjʍ~�6}����h�[��K��į� �JѪUR��5T�75��U�<2�y��e�d�úJ}0=4@���.�s;Y���N�����J���> ��e��1Nƶ5�'ũ�pZ��@z\5�;��om�/k1��v�Io����M0f����&�h �;�������99���v�+d�I��:Ya}i�5*����9��l�cp�SmT[+^��=	�]�� �)W"��)�<��bS˙�diZ.5��&�*��m��[��6O��dv�6�c�t"tK���Cs����=���,6�b3�*��QT�3l�$��R��d�؞��6O ��D9>�dp&�ɂ�x�$��J�Q�h��c�'8Zlz9�i_�׮;��l�)	��U.[U����	tV�q��]�Iv|�ӥ	�e�� z5I��}�'�~��f��֩�%Ve�%b85�(��    D�J�իS�'Zl��&\�6F|����E��D�2u�|��d�0
r�i�-R;�i�E�z���>�n�w��G6� FG�k�!H�;������.�GA���1ls ��k	S��*Hױ`i�� �.V�K����Zl�$F�'�͵��
^Oj	G�~ls ���Hf̼��M*Ӧ�|V(]m�9��ϑ=��}��y���	F)��[h�iy��4�<
C�5���=��:� �������=]�>5K"D><*1�9UxyvH��\�m��/?�vK�ﺲN�3W�s�Fp�������7�SE$��gw�<���foq�#y�c����#mD�h��!�_ �r��>�|����0wqx���~75��&M�٢#�'�D0�r��Edv�&�[P��=~��������O���A�뗧�kw�ʇ^���R(�$QM�R?���&~b��T*6i��/�(}(FԐ:'s4��.dW!�Xď�|����ų'?�U5h��L!��!%�U,j��kO*�&����Ë������x��ѧO�-�ˇ��3�������h�#d�@Q4'���;t�͓��.�~!.~��ϟ?ydzhЃ���[��RoH'�:�\H�B �Ϟ>{�GG�=���ܲ�n٨��L� .U	��E"��G�;�6�����'�}����� __<y�/�ڸ4��Y'D��H{@1-X%!	 /!�t���_��q���Y>B5V�� e�}й��������Us���f�2�l�k�T�l� �R ���T��E�4wg�@8+5f݀����Y>g�P�i�C	
FgO������g�{����Om�$�>*��gND�Ӿ��Nd<�y.>�[�kX֔�4�'m6�"�,�9"�f2�EM`�A��aU�=?�[�q�HVs��QBk0 <� a�ہ��?�K�q:�Q #�V�{(�MT��������I�Y��ոU(y�!;/T�(j#�>U�C�'Qe1�V�7�%��|�|�.M�t�C�I�]���Z/�MF͜ď���Ml!���``%"$�O$��J��t�a��@a��4�Q�������t�L�[����϶�\:�q�x%��+#b-w��
߁�]��	�s�%��)��9E�f���T�jdV8|-�j��yw�2@o���8�;��<�34_̎58*���;�	����֐."�^&;u%rĬcP�jŚ�ф������7�C� �T����fDBz�t�9������t�&��D/d�T�t�ɹ�Nr�[K'��dug�^����|���q�m�1ع��c�
E]V�&jf����ZQ���ؑ�}i�l4aΥ��&P*vk���U�+N@
�u@�K����6�۶��������"bQ�W�*�h�v�b���M����DA�8pT�1��XvfB]Vc}��Q>�n�m�~`޹Y��]׾"��It�w�e�^��&1Ѣ�a`~��B�A$A��+��)Ї�eJ�Ԋ�{ev�+nG�(i6�@L�$?g��J��c�|��N�9�Q�V�ס&!ƍ�ˇ��0-�g6�Խ��s�V��)�G@�A��`e���c��f�@�j�$>1ָؼ��R$�L��@3��������\�^�;u�
܄s4�eĖ>��<�B?AnT�F��u:�|� $ �KP��%+a��5$Ǳ38]Jˈ�;N�W1���_�V�!����Ұh�)S-��������r���l5؏��@;��T%�[�;� ^k?o�t�����'rD��7i����n���v.:�DtɊ�z_��Ak�-PCz�y�� �ڙy��Kc�� țS3�E�l>U�pl���8*<�7,��
�Z&��o�{������WG;KZ&˦E��c�FL� /�k�l������ ��粵qp�F�F�i-ʊ`�3�'�m��<��x��%ZbCk�TJ(��^�4,Cd��;� ���[���n��q��7��ȩ�"+J-d������r#Zk2������ rR�7���M�_&�3@�RX��V�:�As���JQt9"ᬮM��[�����Z� ��W��'�Df:�T��ݤ�5��M@lhS7��������e)<�� �sm;c4 1�4s�G����G����J	���y�1YXW54� Fp�BD��[�C'��R���@EBMޡ�[�ת%�4�#�f�2ߣ?EE���f�1��1?�/���z�a�?vDMdb5_*j[�H^Ҧj� S�Z�>���7�'�_r���%�:��c���yҾ��-
�yE�W��1,�r�zN6�܋���� ���9 o��\QV�x݁9XdH�{��l���ur�*��]>V��c�o<��UTy�qr�j ]���Ik�8�#[1!N�M��P�}��.�`�l�#p(7`Aw�Os�l�g�_k���B���,j�Z��\�4��# ڭ���ȍ^��..jd��]P뼝�S5$��r�p̩�V���!����ː�G��`�E&�U{Q�](d	�\f@>J�eʠھ�8�`گ9�6�B�AN�SE���u���s?m x��,�I? ���5�F�x���X]���}��དa��."(Go��w3���)�x�j�3z�{���)��o�&��"��x<���{�fY`�%J�=p��̳�"��}A-T���z�x�\WMs� 8��'T:lFp$�94#�a������Q���Q"g+xZ�y��f�:�� �A��ʂjLi]AW��C0�I؂A��LϥA@�P��M@L`}�ļT�(K��5�G�tP��� ��.Ƕ+�*s$KA�d�#�I�%L�ki<14�|pa�	URmu�"Z�խ���O��q	�i �<b捃ڐn`/��5<B���'=��%X�N��a9=X%t�#L�[��*��sp��:pl~ i�>M-h�u@օ������+\�#��ׅ4 �AXp:R	��!w�T����d�K5�1������Ȓ=/�I�mMsH)�����%�����#�"��+9.e�2_�nj�.��CX2��E�ڱ>@u4�}S%ZՔF��q,��NP���^�1;�i��³�Dj��(\�Z�,�*4-@F_6��p��6�S�m�n���Gr-q�� k,�
k�EʜCO�+�= �)�C�C���UpNO{4 /03�.X���&%\s��W�� J-Uݫ�;L�l�WI����"	����`b�
���k�Îo�m�*�.�T��R�γZπfJ��� �E������l#�O�.Ȧ��qN�b8@:���&�lj ���6�����Tq	̟��x�W�QZגw�eӠDkTBgP��r�Ψc�,͈���,<�mP���LcfJ&x͞�o���-�����KWv�J��Q.�VV4����/d!݌��~���m�+��������H�!�k(���U�����F�R ��pN�9�4>�[T E�y�C'���l�Q�X�0� Q'�|���$ȯ@%��j�"����05; �B�ͧ��C
5��D���AV�� ��@��}��,��a@�*		� �^��S���ZE?�����Č�H�w�d��ȋ�U��Kl{u��Z�1�hRo��#e�Xysl��ީ�����a�ֳB+G�B1!z�i2�x�M)�[��z�;�v�k��y-.���U���PA4��:O.��~�3� ��2�sD9��T~6� n�����t�.'�o=e��Fb���K�}�#��)q�1� � ��%'p�.�i�5�V��x�>Ș\�� ��@�s`��ռll�\�|��D�_j'���ri]�˞@X��7z�����
���9֐?3���ɬ��
�5,���"Y^���j{FE����� ִ\J�Zk(���V�[W��D�O�E.�v*k7 5�8_����$�,�	��Y/.'�W9!0��j7 5/�Ϡ�T�(�Լ. �W�"4d��rq'�����1��Fe-A]z�,r�	C���~�����^�U����k�"o�D    3-�@ 4�J=v�`mV�z�6q�ցif�h����P�]�β� ��d��=]}k��Ɗ&����N���6.Η{!�0�$�N���!QV�
Ǥjj�c��F�5��%�Q�R�՛F50����SQ;Զ.?��Ϛ,X]4�;�=�y�y��Dfh{K�~�\���T��b�=�x��$�������J� �R���[l�&d�	���� ���l�%�L� ��.g�Q(��6O��N��h��0�� k��U� �ˊX"�BT�ěo|�a(�:kǄ�Ѐ�ό�a h>#3��I&>�Xhd�yT��4�r�>�vK���+IH�G�Y�,�vB�$���%�܏��;?�b�r�)b�v�r�����EY߬b��pֶ�hlށ�M��S`K�'��F�mQ=T���%B�̃U��s� ��f����I`8=y6)�;�f�܄W˵�1Ֆ"yB�f�t��|�!SM:Q����ҙM��h>���,aDhAC^��7�.Iw��-��ԄӋ$6���ޔ�op/������h����l�~2�
p�}��u�E۴�*'"����.����=�R��<?�����vD\ל����ٰ�
kKP6��w�g[�K(���{P�7D_��κ�%�~KcI��ҌM�<�d��d��{6�ׇ�3�d����llni�&�A�d,:$$>蹮2%�(u`��Xd�vvŷ�bl>�v���IV�uS."��]��z�F�.��,��fljB/+����L�cE�Yj�/�svW��w��8�C�����) kX[�T���t�bghK16G�������2`��嬁�Ȇ����Yq�R�M����
��\��3�:�C�E�Zn*�~��oc7J�ј� ���(f��
�^l��N���lc7J��W�"�e�m��ʚ���?�i��eL�hK66��0/N�O��|D���5.K�Ε�OV4�c~����7t_�b��o��n,�$��=`rk���(ڒ�MM��B!0FC�żB���"&�7k�/�4�~ڒ�M��j>'���PL�I�B��k5�0>M���Җl���y�żr�j"���k��XM��!�b�Ҍ+Mڒ�M���= ?����5q��y��c�kDZA��z����76/�y�1�>���ʧ]X�^,��\����m��Fi��-������6�7eP)L֘�ЖTl6�R!Ԋ(fb0rXOY�b�$�|'u�ҊM��r��)텴�q\ ^�PH���n��q緤b���ܯ��	>�
��|���JV�ql�۰�hvhK+���ՂC4s��0_��ZO^^A�B�H�Uc�mi�&�Z-7�:�Q�o�N#�� 'u�(�����ҊM�iy� �1��pq�G@#&��E-@d�0-�~ Zm��1�.5�p�fu"�t�.)�C/q��F[:�ɼ��%qH^,�OX�� �"e�֙�
Z;�S�%�̯d3h�۵�b�XҼ��x��i���5�N��E��	��^5��!���r����� ֞�h��3�Dǧ�z
���,�#� ���im�2�-��d~M�>i�D�(>1��v��R�f���F��oI�&�V�~�=p_L����Q�� ��b��9GR��Sڒ�Mm���|� H��80t�]1�6��.;�zK*6��K����鼯�yYG�AT��${��<���������Bo��|��\����7���+u�κ	m��f�˛�0O|�H���y"�����f5�8�%�̃�/w�f�JL�fe:/>�;�A��S�q�-��d~�x�XI�x�>n��D���&�ɿ���ѱept WI|WF6�:7�R��S#O=~���2{4�Ϝ�=�ͼ9�2.����Ǉ�~�%!c�V.��W
>�+��oO��oy!�6��%)˸*�-��d��f����#�M���J���c�?�D[J��	�T��x��#J����7��i�h`��� F9�b���9� �|
��ބ�4V�\������������/#�\���F>�P�Jv�m	��:��4_O���|��{,���А�{v.&��{zi��M���:�Q V����.����6�֍�n�,��M��j�)7�o�M�k$�2�P:
RU�N0��M���9Sli�������'�t�Ð���iK$6��q^�r���*4brXTb)]�<r}�����u1���)�< jo{�ʣ�^�oz�*�jw��J��{y|��֪�J.���pɠo����e9V�ЖJl2�央��	GiV�%��F^�6=[7|Jkib \���|�l��=F�x	��@AM�P�Rm���R�M��@��M%݅���R@���X)|���ڱ> nXK>#��߅�|0����LBXF��aD��I�["�ɼ^f��%
�m:V�yY:���?
��gn�ЖHlj{9`gK�>S����L�{��5U��y�'�hK'6��NMi,y3���#�GL��� 4�Lw�-��e�_�'bF�[	|,��$2r� *��&K1�����q�X��eg�}bIE���oA�{�;1}KE6��u���TaV���"��$�ND)ɽ��%�̻�l���܅�|�
�Wx�� �-��d����O��Vqw���>����cPrg$+~�n�� �1.d \U��R�/�r��j��z�Hh�S�����9|oE�CL$��,l奦�������t���-��Ԅ>6�2���bʩ��N��c+`m�w4�pnb]9�����*߃dx�y��l���ɴ�⊶�b��U`�f�T�/0���1Pu3Iy��]��on��g,ܸ�u!J��E�N��t�;h�N�ޒ��u%���u�4��.�I��e�P=W��d��a�[r����x�j�A�Q�#3�H`֔@��;+��{�%�̯7ah@�Xi��N�B&>9�����Q;�iK06�7˪�U�LeR��y�/��@ȳ�=(D��[ f�6���x���E�:�vc���u�	�A��piK065����d��<��@2{�1��ԝ,of�|� �*��B��%_H��s��2̀�-:7s�x�҅qz�~�w�q�r�kB�w���a;ˉ`,��-e�d^/�G��ݶi�v�2��O5��jgR��3��̯K��A|W9<��R���ŋS;�[[ʰɼY�D0�ΏJ���b&U���R�1��
��{5_�aJ�ȼQ�I�K�@^��>e�_6wL�2lj"��_,*�'��P�M��,|�§�#B����Z�R�MM�E�Ȅ^I�f���y���8Hd���(�wv��al��LQLVűx��]��O�V��u��wPf���Z��$q��7�_&�8᪏E����M捞�s|k��,	%�z�n�B��'�0���gK"65�n�K�#��q�����G�]��P�eG;J["��|X��B����I�T�#��O��!�5�)���ĶDbl�W#�@\����1�8�r��XR9k���� �F�4����i�=�A�SIiC-��~g�sK6��Eh\5O]��Dh��%��ԛ���p���`�y����"����2āNp��3��T�ܩn7�^l�-����*K<�V�$1�a�,\�;`S��փZ�F"y�����[@,�i�q:y5e����rynˢ��Ly�		��1�R���L�;,}S��V.o��鸑�B��f�	F&����c�{{K�J/6��Gj�������̢
C��f���Ty�yZ�K���Ē`���P3��QWf�3>~F�*/6o���D=�y��8�k
�(���d�w��M�7�n���54|���o]����8�	���{S�M�EyK�I>_�	g��uG�By%K�����m��<_o���r�dS��Xd<��$�Ϯ���e����&�rvM��x�R�jF>2�[Ȥ�5>�J�J06t^b���d�N�T�װI]{uz'-l����ZZ�
T'Z=]&�7['��?���FN\�4@�s�V�F�t_e�)���X�~Ҷ����Y�)c�kq@2[�� d�-��*9�!֢�<��śM)�_����� ͷt��J3�,/�x��:?ڔ �  ���qQ�_5��>�&כ�����E�'��-�R0n����N(���˘�t�+�*D|G>����l�ĸmp��9"��R�9��59ϼ�Pz֔1�{�ҙM���Ki�#�E3\�i@݉��$U�K�w\ښM���4?�C.!JL��p��tp{���R���&�l�ĸ�U'�D6���W�S|�dU��&w�D3�:1Ϸe��P�xN�"�k��R������x����{
��_n%y�����%��ǉ�l���<�yYG{�<�G�u���
f�4?�?��w���#-�U��3p
%P#��(8@��lPGh�jNҘl�M��n˘7�'0I<^q��%y�	��6W���x��l��<_�0�M�V>Y�-�w������������O�/��Q���E��qD�iφu���d6Edl>,;�Z�6���ċ%MrJRB��bW���ۇݦ���c�k�վ�>)�Y���g>[�Y���ji�q7�dl~�P���SDp���s�R�hI�P�.��	̦��O�����[vv�O�Ɣ�R,��
������܈��2�W��R�|��i�5�� 	��M�Q3���fSi�M�1QU�G���i8ė���SkU��H���4�|�^�ޫ��������j>H�6��F�3_�:4��l�ֹW��|DI�1�3,L|�j�E�ձ��l*����ה.����N��C��7��@遀9�#ͦҌ�/[����U��Pp�T����B��Fj�rg��lj����l^��������V�j�AD*�	��Tr�4P@��3f;����	_p�,[	n\��M��|��%���/����D�xߍ�)Kସ�L7�bl��T�*�w��I;�Ť\ ��V�t�c�ٔ����������|i��|� �d��:?�c~ Z����/�Uh~!����B��J%�%r,�5�r16�N�,���9�F�=����R)��	ι���T��/k>@������?;�'�,A>(�%�@k�`z��0?��;��9*|W����.��,���*Z����e6ea�KA�.I���*��x�!Jlr^e~%a''oJ�ؼ_n���<LP"Sa����QEn��A���MI?v�,?�����+2+(���]U�&��;�ͦ"lzPfu6Q�*��UH`m��
�GAP���MI��p�"]��7O��;]I�h���$��N�OD��f \��ޣ�|4�3����!	�l�� F1�c~ \�|ZBR�0>$�koڳ��i�Y"�s��;n̦^���eڕ�GE�
�o�o��|��lR#U����3�r1�n�\|J�
����~i/#��yGT����d,��&��I5����������������\������E����O�~���/:��^㏿����}wӮ��;�?�J���M�������|Վ�r��������@�m���E�8��%(�����U��i//���]�7�q��Է�����_�_���      �   �  x�u�ۖ� �����%�=�˾a0��"q쬾����8{�͗�o���cH*�	S���rV�r��}��<�}sF�NyJE��m�\�S�켾�^�P$�~�A9�iNE��Bt}��-��C�ѕ{�nV���$�h�&��0S1��@�[��\hD�FC���5�qrI`�����pf���+���@<�>T8-����w�4�#��b�x�1��SD�I�a��UrL��g�x��#ǐ.`�1��=�K�	���誋�������W���0Ǎނ}��Q��}P#�s�p���j�ʗ��e�%���
^)��������[a�R_ۿW��ȅ	� ��`�=>�|�@=��i�O��i}�e���.�`�m��k��ꤗ3�R�ۆV�]����v�FW���b��}(˟ٓ�1�=�a&\t���2@� ��Oz�      �   q  x��V�n�8}N���1DQW���Q[c;c˝��/%_d��&(�m�!yxHNu�߆�q�É1�i��T�g~0���gP��%�B3��a��O���#������SU��؆� k��#����j.�Z�u߾R��`Q0����[4:J�s�Z�C<7��2V�zBw��]id��2<I�O]���)��1fI����!�cO��ڴ�!J,��ew����_�w?IT���$O�90s�Uuh�ֽ\�WW�uMM2rY4��A��3��ſ����C.�՜��䮺߻���0Ĝ"���#Cޙ��r��5���F��Sur�[����n�X!c��dCP+��r\�!D��m�7�2m�&��(�������Iye;&��Ǭ$zN彺4�*t��������C��M�-�R�]�̡:wt�J���le�_4z�ʈ9)������4���R�uC��Fyw뻿O�Cv�j54�mU/M�PY� ��lpq��κ �0K�44��.#L�ńQ��}�hnZ7����h�	o�קP���A+����~W/q��z��W7�cG�%`!P�Da�x�x�����3G�3��F�)p3]��D�����{���H3���7_��w��W�Nӝ?��b(��&�P��Gl� ѷ��g�%�B).X�Y��,�|���Û�i��h'1D�Q_�P�pcW��p���J��m�<F3H[�)h�U��]d�g�N]LF�\ȹ���\8��p���P�9ci�ЬpZ )�v���m��<a�)9/�Ϊ��A���9��|��yl�ԒcZ]"��DN�{���?e�4�,Lb:YDv�.�����W��p0��G��|w�pw�3T/y΁l�cP� kT�Y�}��r&��jz���IN�b��O��Z�_]Z�C���Rp���%�	%���+B�R����'%�v\��-��`�sN=�Lg��50k ����f���uw�K1���JN��yfsi.��C��i>z��HgJ��"�d*ec?s�#;Rs�}�Ɓv�;���^2�<3[J�ъ~�!�I�F
��#D,��l������=CZ�ZY���K<�s�!	�'t!�F6��|8Ta�h�ܦ��-����\�\      �   a  x���Kr�0  �u=E��$�;4��[�E�t��~�(!�N�v�;t���a/��Z���^���4���y���}��M��u�2�vX�@)1Aܘb�\��$t�C�Gzti���u��$n�*��N�^ZٯX0%{	+5�T��B����踋�uT;���4���]Ǿ�}�l�r9�̑6���|%��S�~�T�w��U;�j�3�e����	��j�]�p�����R��V�/c���-u��-�A� ��I@�� ������!�"�P�Gj>���A+���_/���f�@��z�\»������P��鿮}���&�y�|ҿ"�!4dl�`�BMA�C_��d�m4��      �      x�3�L�H�-�I�K��Efs��qqq �<	�      �      x������ � �      �      x������ � �      �      x������ � �      �      x�u�K�$;�dǑ{�j�?�v�
j��
Z���G�h��R�%�3�Ż�a$�* �s�����W�n^m�z��v�s�m������Y[���-��I�����?揙-�<�բ7W��_�.�[;V����k��S1�Ɏ+�ȟ\uW�����=�J����m+��JȽ�0��_���ju��Ѷ��ȡ��V2ۏ���*?\nW{_{�l��1�g]��?�<�X�}m9SGl+_lOe]c^5�~�i���������#b�^q5�0�r���v�,����r�r��p�x��wm\#�py6�ǭ���k��C�ll���j{�f����P�}�R�=�=���}���6�����Bj���紮P|����c�1l��?��cv3�kDVVXWɱ�ع�fM���b�޶�u��c˵���W���W�5�2}i��scݶ�++G��4�|#���X/n�m-)<�8 }��c�����w��ݱ5�iۙ���c�i��sw�p��+xܝ�lW4i��L�[��h]&ɖ5[3�6�q9���W7�lr>��s^s;~�"�M����]ݬe���糇����֕W,f�y��W�)3lM��=��c�m啭�-]�yb8�6[�|Kv�>����
��V��[�Ҍ>���U�����>�*�Q���U����z;X����A�כ���?�ܶ,{�^߈x�\���n̶�j*'��hq�0B~��5kyc�!D֕�L�5c�v�c+����>�Jln�{ϑ�4/�S������9<>��n���ێ-�q��6d)%/l�?�<��F�aBד��FF���1а��J\���U6?������DH`[p��|-�V���e.���k����5GH�{��7[Ssȹ��˽.����9b�ĉj��z,%�hB]�-0��Ep���6�M�vˉ=GK	H��yM#�i�u9ﻩ���d��� "����9/+�3�-���f����,g"9��jqe�v�Z�{|�fA�{�s�+\��t��͹���-�a��F��V��W
�պ�p��|s������ٰ�[���4R�)~��\���%��?9�w]��h<�˝qF�طH:JyΫ����"u~�{6TO��Vk,��7�6�ŖO{������b���N�r)���|J5�P�`h8c�y\=�l�r�c+*S��aO&k9A0������S��go?�gq�2�Z�B��Z���g���/~A�������m�N��R؀5��W��3���!�bYW&�a�ŕH������}l�6[�7��T�
0C��Y�^23�:M��g]�t|�M%���F���o�t��<�����7/~�V@wM�Hqȕix-@��\�1�9�@4<`f�ռ'st�o_�[U�:��j��x�CVR`�ĩ	 ��ۘ��J�	�l�5	+��x�����΃������6������-T$�������<4��G��K����?\��dű ]�yٹ����9r�k��X\2 �n�����^������^G�K<+��z�'����������\��s�-	B�����<���V��V%p� 2&X��������_lyk��p��7p�˽��ǆY���mJ�CN!a�}B��-��@�[Ĳ�[@ȱ�I�>8v;lٙ�إ���,x�{��,ij��u�p��P������ұ�d�,���� l�T!8h 9"��M�����J!N ��<q�I5gkH_֋�$}>�>����Tg��Qت�>���f���/���ׄz�ϋ��$bE�;�����Ĳ+����{�Α��7��7L���Oi�B[��7Zs��ϊr
O���Օ��=>������Ũ�P+�K�&aT�H.�2����=O�НB�1� fy�,�^͙E�n��e�>���J6�i;����� K^jȑ����m�[������p��l��;�^[Ĳc���}��/	�"fB����n�nzٜó�m�DKNAN�p��6��A�}_��|l���������!�/�{�;���h�.�ML�����6qX~�o`&.A4v��D�q����Ĳ(�}c��D4�ZQ��%��p��S��m˥%�����f�1�'G�s���p O,���_��g�3�f gH"��A��#��s^q��{H�[�}M2�����Cb٧���&�"���� W�I�-q:XX!��y�er��҅�*�گ]�޾7g���Ĳ�G���`��MhAv'���"�,�3����O�![����K;� 
���$����e_>���/nL"�t�����(�Ǝ�e��?�����ck-#���i�o�1vsp�ñ}=��8���D9!�b���/�U�KM��B���Q+¬DR,����B�Ci�� n��>�k�DO
�{#|���_��x�W��%`eO�,L\�$�hAjP0ٵzp>��~m}�S�u/�7H�ɕ��0)v��#?�
�@��L�\	F�2�8ZC~�^��������+�I|���Y4��y|��3�<�;n�Tv㡬+Y9 �"=���u�<6�![h���H���^�*8/��Z;&�j�=�y�ſ�<��BE4%p�&R`_- ��"�C<��n��ZK�S�XW1U�����d��֚)��8rP&+���T3�w@S�-b9��֣�^ l���D����IW�� {�V�����v�Z�ˤ�6
T��"����܆��M,��8`�J6@S�, Á����9pO�nTgK�B��(e���漵/b9�c�oQ�!��K��[��q҄31������z�2� /�*g�,�#��.b9�c����F!@õq4�-X�]��0'<ԁ�Ϻ8*_}Rū��*�F~ �g��{Ѳ�|l}�0{؝Õ{&�"_����S�GW�U1�_��Q?8��	<��gY�>�-���7@���-2���&����O^F��+L�֕&��MW�Xnd���<dH��V����&�Xk�-鿻i��f� �����P@���V��JR��V+6S9>��迶>�
9�(��*iA�I�ز}��G�=5��C�A9"�p( f�Yg�l��g]�F�V�����X퍼�,�Z�a
�P�1��Ց�;��k��a�<��Hڅ*t��E#��E�����-d)a��ʝI{8�yS�N��NG;���JR%/��.N�5�lzm�1��z�M�b!�]J��
`5�"F�plkO��U-�.emvS5X|**ՒD����_�(?|Ï=L�7H�������%Pi��|ɰ~�iR��Rއ�X�������X��>�7Zo�ٙ/n��Z�����ݧ�b�N-s��e�� &N!����e���7b�����œ�WR�j�Vd�>��`o�sɼu'Q���N�w.���J|k:�aͅdy�6i:�t'�7\9�n[d�\�8�)�s^��-�[�uu�IW"�uC�g��n���G��Q9@�3�]򙿮�B2����$ͤ&�[TP��-�l��r7������r��=�FBy�!�Z�[��*=ܸ�uP�kG�'�H؇
�F>���7��{�ʏv�"�&rK�)_5*�Qpk�y���K�*UU�)�� \�c�Nf�Hxk)	�H�c���bH)brip���_0Fr�?Z/��&\W#o�� q��V��R���_	�H7n���?��L�ɒ��G��+񷨥��}օa�%`�U�H������o`T^���ұź>��g��ǩ���7c����S�?<��8F��#�l�=��ڸ�A�O�J�F�ǖ��q�YUs���*!��Gp��hP8��-{H�t]5}Q�[%ٜ��{b��7R���	ȑ�q/~��9���K�Ύ�怄���|�ԕ|�(������I�.���籥R��:����S5��	�%�=w�oY����g�D��g#��(բ�p�כS2��ͱ��B,�#�����|�!�FDN�$��O�y���!I/��[��8���YW7��������&V�tνU$Iz�r�H�j0x��-�����k�	�����>    �܇cC�-HI�ب��ʝ�xW�f��?�����1���

��۞�7���7�?�D9>�I�v�z\գ�*�H��)ɑ���_�(tBǖ�]�k�x��~��O���籕Շ}��p-�� �ծ����i;4�/���7f� 8��r��^wE��i����6}^[_�b��
�X[u�1׀����{��8�7�ſ��(��I��#���z/1��cKu�O}#P���K�喂� *�*>��RQ��]J��w�:�Cm�y����/nԟ���Ey�8f��I��aFW�dc�3��䯛�X�L\�c �D�B��&��������W��	��h���������p�H����9�U/ɫM���<ܜ����y�Q����|r�_�K�w"��Ϫ�G�ײ~]	"��TX��VPX��Sh$���qp����o��g�zz�#2�U'+T��%��lc:���y�L��X�ARF��8�Q��b��>�lw���%V4q	��+��Z�����`���n�r���F��T�ƃ�p����h="��J�E���:�V�(.�:���/?��pS���ؕÒ���(7�H<���rp����PW� Q�r%le�����(e��f�P-��4(����QݹS3/�r�[�[���8Md�xI~8���5����w���lI���ۤ�rB'���
�\ҙ#�?��J��\Y�P�-,��J��,�z�޶`�(a����t���R6A{����F!�K>�~뢤�~�Te&Bth �9�6=|���PC5=R)�4���
i��(�r)_[��e	A�t�8�&q/u�*&��=Y�P�*�L(8���f{�����(Ȣc�X.�c�ۻq�8����j�2
]��	mZ�<�a�L	*x��)E�)dV(�o6�����X��w���B����jC�C=���;'�NӀ���U��"��k�h���|+�\��ַ�k+�٣��=!����;���.�<���F�f�7	�!���R�o|Ub�����	T^��ý�e])(�����?ultK�֐���Q2���ˣw�Y9|���o� �)�q%�{�nώ�k������r9K�'��񴑩����f�V8@g����T�W�-��e���`�,����X2���ӓ��X@��	��{�!����G�\K�S�$�!��y܀4�m���c���B@v��0
������7D"�:v7j��^���	x[J����[�oR���2gʟ ?�{�R��l�1#@z�mP�5�/��p�
n���ï�C�Ɩ�U@�˟:Xze4���$Td�V��� ��Lw�:7����=/p� ���ldDg��Rv���+aBy2X۳�3hHJ�]30�](�$ٲ���O�����9���W�S�3kt� ���x�Tf(�Ὦ����U`ߵ�	��(�Y^kqrk��~�ro=���yw#����y��6̩�HjT���1!<��vB���C+�������O�GG۩���R۸��/�.ل����i��!��{(2öſ!{�1,��[ �=�'[�`���ZM 	k)�����U�S;%���J�y��`��[M!̪:��.8ұ��2o,���o�YB���_C����H��p��yfY`��	�j��R�0d@oʱX������q�#�� �b���δ5=d߿�e��
D�i�5�DBР#�&pl�?��ӻ9۷~���	��7$RA�~���}+��,�3��.40����|�˭�z�gnY�k��?|��M
	�Q�t'yO#DW0!Q̛������alq B� .�f[��=�g����h�r�'"�3�U���(�?�;�\�!�mI�{س�1�Ü\B����|�c�9=�i�"}��J�r�0�O����n,:��橢vI0R�*�n6`��#���Z��~����yy��B3f���^%�����^5ʦ[����w�$p�P�@o���:ZD��/n��t15�(�����.��Afs�ٺ��� �^�(�t�H��YN����7~g*> �i�Es_�i�[MBB4�`ܳ.hM�"N�0�U=|��`���-�an�cFz��Q��J멿8������7n�2�KM9q�0 �PU!��s|����k��և��@Z�*��w��g�H��3�S�)��k��뭗N�� ,���|l�6~l�oM�C�Kh�� �I`@�d�=�&�Y���X�fH��*��X��y�ܰ�w�����M����`δ�\�l�}l	Ȭ�=!T��'4|TC���܂[��7������o��ow�>jK^���K:����>~�-�3Z$h ���Ƒ���9�H��ֿ�W�� ��ԗq�R�&�c-g ��r=f|ɤ͆�\M��^�O��=�:b��	��v���t~6m�jAf#!���E�[^dRszm����T�Wӌ�L�hIC��ю-6�	|l}4��$�7�
��s_w1��O���8�#k]�k�蚶�PO~��8�g&��Օ�[uQ	n�����0���g]�C����V�y��EV�)F�#��3����mJ�N}z�S�]�I%;\�d3�G/���.�zm���V�pA��
�g&���|�A!�vp�Ǿs%��ѓe�|�7?�rK+�I">A��S�b�a=aS�~JA;���?429r����f��N���O-�XU��S��gE�ck�n�Ϸ7�h�՘�2��m��$`w��X��ƴ�C8W������z pO�b�U��1W1�@�ؗ���6�l6N˖_fh]�
�"M-�tμ˙��S5"��N�V�/[1k�y�^����^��>���ְUco�=��Q>�HE�d���9�qJ"�%�>_t1�^=�����T|�.m}�X����M�����߃ FR�f|z��������fG]���{P�j���O�,�>��Ϝ�;A8�\>t�B97mH�]3�;�4x���:��k�xM%�Q�<�����c�㇚��a��Q�l][�8/�S8���ã"��u�bk5+��d�(da<{=+�/�� ��-�� ���PjdY����OO߁t�*�>�b��2���T�Z���J���VA�+-\�m�Ұ�kX͜�f�93f�'�[S�mJ��@� ��v]�;yك��}l��^��Q*��x����#�{��<5"o�ѽ����$��x%�t�m��/���9/�V��qu>�<S7����Sӻ��	dR�9�`G\�*|��[���}���V$ܐwIn���@*�Hf�I͏��A	K,�@a�C%�ⴚ�<���g��������nI�ѣ�nC�Y<�Vr��׵F.%h~�#�u�.&&��k~�w]�q#�^�����N�s���M���&��:�S/ۑSvP�!�A�����@��m$�|���|0
~��ښ��wYp+ݒ��9<��Ί�h��j^��M�ԈE��2r<8��t��F����I`AM��7n��)ݷX`k�=����٪��1T�Dvh�tG��w�pC�SXs�Ce��NR�fP9B�|eW|8[��F�6g9�O�y��U���a��Fx�V��a7� U��f|X.[�"��:ӄ���Np�Q���n�	��g?{���3W��u}� vh��!un>� ��x�L��jI���i�\#lD�/}iE�R�<���p���ppC��oN��Q���-d$oI�����}��jrP�E������\UEOO�B�l�����*
�ٜ�^�,MT�F4�@�Cq�������]�{8�D���	ɝB城-p������zt*�_�
	���e�/��o[z�05L]��V�K\V�Z�������hf 5e�5�Ln"�m�t�B�_����$!'؝Z!ڈ�!\8������S����ꇷ+�	l��$�ǩ�D���y�$��"H�H�<H�j=5��N��؟�(g<�kd~놬�@D��.ti�{��
7�A�h�Gۢ�y�K�K�<���w8�a��=D�/V�OY*�{(fQe
���d����H�T�o �  �Y�~�*�&�}���̒�F�_[�=�oј�h{ZQ��	0iT���Ա��,�����3K���S�"g�JlD�uE/mDU�TyHu�˷��Y�J��I�4݀��&��F�WH��>�z�@-ڏ�o]t���ӈ��fjyޘ�� {z�_���vgҥ�ڻ���#����.�D��e?�l	mO����7��65Za��j<~�u�p�Kd|����� �Բ���;��b����7/��C]�J�M�w3tV�W����e�dDȝ�XXTM����S���7b���{��؋CYc���ٷi�b#����aI�|�#���V�Ш2�J]9�XF���������Ȫ!��w�QGB�{C�����wӛH��f{&��a��:9E ��ؚ���x�*�j`���v��ɱ�� ��x�(��i��3�&������Z������� �Ј���5o��ν�I��r����l*�h��^Մc܈�����sk"xNql'?���F%ef���L��6�|��9dw6�xR�|�g�_��r6��;C"Ѫ��+=H=.k	lR�?��K�\1	<܁�w#h��[��o�����d�r^�x~R���:�{dG7�uh��B9�l갑�t3�ְ�\�d`z��ʩ���m���غ���-I`E1>iS �tz���|uo�Uu�e�+�ɳ����7��"g�rL4��������g�!>�L���ﻷ�sԇ��5;��y�z�6�7"H�4��Z�{��*���f�3�`�% f�dݯ���
��͖4d����¯o|���:�Cj��iӝ�,��֠�5��~��z9��*A&I��#��fQ[�F���NTu� ��=������[���;;hZ}�ܳ" �n�.�7j��F7�7�ڜh����d���n	�%v�n���i�Ҿh�"MxtS�D�$��&����^�)�{у1;%,]�$-O�#"2�lA�xf�{Lٱ���Q7~�ޒ�Ø�=/pC������JB�(i�E�u65�f��<��`	�9n%$��E�s��V�t���ΣՅ���c��A@�D��ax��TD�ȴ߃�&x�P��q����S�=DB`�|���c+����ݳ=/?ܩ�����u�ID7]�j,����������{H��6E&�W��~�q�l�£�"��f*���`9M�5���9\9�F�]#i�8�.|F�iW)��e6"�ﷱ?}�1`�-h���+�U�UT`N���jsj][�Rb��%nJ��+�C���p6	�{�S����61�8�^e��	5���P*�$r��&�n�z��uA���^M uUՅ$v|^/"�_��c�AJ$qM�I����BBT́��S�]S
�J�#|�o�-Ɍv�/[]�˧.��XN�>�T�K�{�~���
����C�T�u��%$�j�l
+�_�8�-���*?�Ax��ߕ�J$z��5D\��"����M#]�ںKr&��^&��7�S�jte��ϒU�{�!Z�{@�ãV.��V�	�^�1�M7�_��8n.���͕���޺�[�a+��^��Π9��W­����gN�u��/2v�v��n�7�t��E'iiC���z�Q�u%8o�f,]K��#� �u��2���&�!8}���}Y���3��~��y�FS7��5AWS*'��D��z���Cߛq�(�^��Nq>3�ڢ�gf�p���F�ϝ,"��4A�T���'��I�a�Y��F�B��V��%{�-~�u���7�N�������f�^vӬ��G�Q��8�l��ʹfM�z�ZwA��=fØ�T���{7����?9E����!��$�u�b���nȅ��j���T��YЄ^ii�ӻ���|{7��<
���'bY�%�%�f�wA|����6�g��eH��7*A̞b�Й˅X�g8���gVd�j������MM!D��K�8�+)��.i^�O�[��٩���r�:������_�z�<�|؋
�mаzJEw|��Wħ\7�ɨB�QIDE��t+n�Ss��wJ���^��W�����N�����ۣ�����%D�n(�)'���������"���w����<J��Kw���-7Gڣ��f�l�}�	k���i��\��zk����X���Ï-��]�f�a�����b�ѣ��=>g��ZckH�{��;�.��k����*w�p:{fn�JM� 'W�}�P�Kn`nL&r��[���<}�w]�˥f���>������H?~�����~Q��~�Рn���V���F�~J4�`��sT�GS��_[�=�y��ɕ8�
����+��8��� ��p���j�n�E� {BYs+�=�{f[��=���׷�P4��: LY�A��G�~�Ь����V�8'��'*BG�o�P���`�'iH���|����m�.�����{�S������{0
2nR��5c�~��if!&�)��STܼg8M9�o|5�Vs��4�ﾞ��v �ahD�� ծ�B0]��Q#��Lku�A�������zmi�u � ��{[ugmwXX��y�G�)�t8U@�M��WI��^F���E�p��c����s�(�?�۪����`�����p�Pj��ޓ�A��A�^��^��Z�Q���}"��7���  �T�լ2}�U̙��V��[�Pzǝ��S�N-H�m��?o��>�(�UW����da�S����
7Uup��.�F��vW~u��d���b���F[H�����u]Eͻ����5ޗD�����I��;�s�Y��r������?i�o@�ڵmT��
n���ϻL�l���)��h�A6���kZܻ�w��W�����@�Ѩ�$39���e��H��O���	}q�����-aƋ�wG�k�ui%iLMZ��}����&p|�HJPޤ9��Vq��l�缧���f��~y����[G�;-!n����g�B���I��U��n�kDǎe��Nwϊ�Ϻ����<n��d�D���±,7�Y�pl�&y�(dD�^z�{�*P�g��=+��{���iV�
^�}��#���|��=|��MW/�=r������}������%��nĪ�@;d��K��u�=@�ne_�830[��I]Ť}�7����<�y����Y��]��j=�� ��U��������L��9�\�(N�l��+E�Z���
�u|^��ϼ��gM�M]���h�}1��A2C�L��O_/��u���MI�gz푘=������f���H��Ö�1 A�;��w�j���P���5�JA�C �t�K��*��לԱ���w^�Z�B��^�cɮ�z���Ѐǔumn>���E��dl�8��/�Z�F/�dbo[����[����C����R[���yxUS����De�=_���T�B�RNac5�=����V	x��T�3��t�yv�c������?����?3���      �   h   x�3�t��-(IL���,9�R!�D! 13�ˈL�Js�p^Y�Y����e��X��Y�e��UZ���YX�
Ҟ�Y����eԙW����ef��$�����qqq �(      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �   �   x�E��
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
/�*�"���Y��k(ѳ#�_Z��Fՙ�{�8ooL�H�e-uE4������tUY�醐�$!���k���n��!���N��� �[^��AL�{��-M�I�k �(F5WewNA/Q��M�i��8c��l>�N�O�t	���+!����������N�������@���`�g�5�6wz�%8�S��������q��g�5�RO�OT���N%D����k��=D��.�����}���&�RՌYV�֥�]Ζ�{͟���C��\�=����"��nu���q���K=eTd�K|CEZ�@XF/��X�V��u�ޅ���,ʫ�5c��8`��r�ݣnaFfv5�gћ�U6�T!\��4���w�$�@p����1�-�We�P~�t�>oT� �  ����ygN�Pd87	:���U��~��#iQ�t��<֣�$K��`��W�*������.Kʗh�;�n�8��y��~��H���5���>*�L�;���AK��o�����/C0YڢZ	��.�.�=u}oǣ��p���m|���j��^6�?4s��{���k���b��<eI���~�;�s�t�U{�~�\�V��4];+�7ת�-�����Κ���4O�N��c��4J�F}6����e�^sb��lԈ�k�6��*>����A�4@��4��~YA��ƲQ��:٨��]��_S�g����:���Y�iŴ����no��;�!�(�e�u�To����1��-���bd�O�B��Y�a:���^�ܻv�n��\�z=���z`���H���k���Sxu��]A�{L�,�L��!�hRu���3B�./^����$CK7B fM�m�W'���`�!sn�8�>K�W\�=Z�8O����_T�*8t����Y�ۑ�#�lH��'ȇ�tzKz�W�F] )�����4ʙ%�����ϻ���`���y�A���)��>�f�����q�X���x�S/o�2[OS�4��W�L��6=y��eU��s���n�Տ�zEM�3��Y�@mBY�D�����!=C�*w�]��Ad���ௐ�����V&T`:�T���\��W鵄��ح3�W�F�U�Q�p����r�O5 0c:��yˇ��GA�S�7+�F��T��&����Ջ_z�I؋l�)�bϻ�8ƻ����ðja5$xȲ$`�j�rx���~M�����AIo�f�T,�%�����j��8O���S��BĀ�K�5��]�Uu�~��4��M�;A���h _�n�xH�+!��Q�y/Y5u�m0*6��6����S�7<C@�;��s��u|�ɟچZ��$��*H#&hw���R���z�YԄ&���d�ĀY��L�^j!ѭ���x^Y���&M�a~��n<��kܵ�����&]FW�_�='�<�����!�I�t~C���-����Ҽ�ѺW�T�a�/�/*���*pD��k�����4)3���﷓�`�z�b�;̂AP���{%�|z.OP�.���GT�9�׫8�.Ƒ2�G�+A��4B��1�w(��ݯ�\#��"����c��Hl+��UY�{���w55���Z�k�_'tI���ʂ����������a�      �      x�5�Y�&������ ct`ZA�0�	�Ο-�v[U����j�k�g~��|9w��B�+�yB]!����o��z�����:u�����ѭ���i-g�Z㡞��OO��,��]��\�����e��{{ӯpo,�ܶ˩��^��k�������;�:����m1�i~�k|.��3����k�|��ߎ�}���ro�ü���Ll��/�y3��3���[�ɇ�/��nv}�ZON~��|�Dl�k��=��F�g9O�)nB�����W��^e��
��K������������k�k��%�7�}�t�Z�)*7�؍<G��"?~��;bN��h��O��#,&U�|��ŏY�_V[[;���;���>֗Hp'��Es�3��
_쭥c����R�]�>�6#	Z'l�r]u�DZ:ozk��/���w�?~6����o�9�^F��9F�)��F�EV�F��Dn���;j�.rg6J��x��&_��[m���.֫+<�����Q�� $">�j�����t:i	/W_�fw���W�:�VsaǗ/o��
�+l�[����8�b�X��7śXX_���J?�ߡ�����#c�~ٛF�T�I�!����r��}�{(�J)�ƟN���V8�D����u�2*	�7���E�%���^c�*y�4��REqg�{X�ɵ��~���jM�F����������S㪞l�<��}�o��ޮ![u�����L��	~��w����[���4�UmP�fN�[\��8����w2�T}M�YԜ�-�d���pʗG���Km���Y��"�ލ�/*��3Z�|՜�B�d~QR��F�@�OQ�d
`��@�K��;�f�D�c�DU�d�za�x�9Ӱ���d���>�ڽ���r���by�IKU!U2����|��ηˌ�q�!��K����h ��+��n�-����G�cV��3��V⬠V�o�I��\�N��FNa>7oMR����C0z�Bmݶ���vR����� z��']R�9����#+�%D��;�`��j ��ʘx�J��:k�ܩL�9���)&����h����+f���o(��r?vy�����
`���4��'7:��dZT���An�x���{̠-s�B�%���E0kv�Κ���S�T&��k�k���g�Vm �h���(�)�����@�H��0~@	@ϩ��Jt�Ǟ�,/	aRO����Ѧ���n��Ƥ�����[/�
HQZ1��g�N��1+�P��j ي�t[�q� �;���G�×f!���� ڕ���&-�+"���:I_�D��~��(�u	�C��Xb_�fm��=�T�sY��`�.��K�} =����Q�%�T��ts���BFC�s՛`їxn�;��1J|�A� Ts�����.k*\�V�������$�����^����0ޝ{ʫli����7�֒�A�W�*�	�R�*�=xh��#�Ɗ������0�
"ڔ2�R (�� �t���	� s�IKvw,W_��Ilk��Pp|�ӹ"ȫ}�����1b!	�%�7��t(�"i7"0C�����/MT�A�
��m����範K�xꉧ�?�PXI0�Df]���,���!}����V�pN����Tq��q:���"h��+��u�֯AF�����lʟ��Ba��5 �g����Da�0u0�杓��&�H���-��E�_���)�f��mF~Ƀ%PmY�t��+T\Ab�tk���f��� ��1AW������VǓ�zŢ���̟*iF)׾[pbO��MB���� �����I@3 E��H-��`���l��~�� =D| xhv�5�g[��4��\R�t&,+5q0U�M{��D��Ӊ��-����Ի�Z�rG�&��ٖ��C�>}�̖�.�ѯ��`�%��}��8N�6��2��r�I\�k$������4�}�`Op�����pYA_��?�f��h|Z8�({���+B}gu��m_D�y�tp/U� .���b��%qB3�7�� �@й��۔�C೟��i�� ���9�$M�fV�8�%s��0!�P6�t�V"��ft=����%��v� ?��˛'Dn@������]�S�T�-�%TD��C�HX�] 6��R_ ��دBAٝx�_b�� w#>^���.:���t&�F��X���@Gt2�LI9ٳ`(��ې�i��H�V�qЌF�e��p���z[	)��[(�]G)� �/T��h��Ѯ�����`~�"��q��_e<S=�n�;��dD����.���vv#4	�����V����.!A�Cr
7��`v��	��bzl��D���Bmڄ٧|EK������K-����Xl*�Hc�Mk=6�6<k���[��	���^A�!�{�� )���L��&Fߝ�Ɗ���a��z��g5��fEp��> ��1~w_;���D F�X'���+����0sS�G ��k�|vP~��F	_�b��.,Ӗ����%Vf�}#�02a�1_`)���2�H�T*��Dژ�ψ�/$D�A��$�>�����%����H>�Q㕾�>t��9��ui�%�q���W��|7hdO�"&p��K��0�Z�|]���y�P m�TӚ�^��
�~)��p�����d7,�/�T3�[LZwM�t��n1k����G�VY��]�0F&�"j����6l^�`�߃�T�d񥒵��)��k�@���Okj� �S*�K�O�}���ԯ�4�� �R!��	͙*1I��DԚy��Kp�$:t�Q����`�I�:?�e�x�uD0����μ(���D���]�ɬ�쯌M���A���	��kT*nM�8t�28���~��=?�
����TK��8�m�!�`P!]p@�d��ty�4'ꓴ��1�p$���q]�w#�@bϿQ*iSm�閕O���ݳ�<E��f�>m�-[�� �?�>�Q�c*:Ζ6�������M[I�|E����"����Տ�#1�îq�H�(�'FrY�v�k����>�-8��2��W��ќ��㏀�j���������on@�V��su0rL�� k�cZ_M�%�=�n*�9�[�4/�W5p!��[�X@����+	n/끙9!�N1Md8:OaPC��t�����ŋ?�Ee&dL���_=it	���F:�ʈ� ��4�6��� �C�/���'5J�ӡ��c��OB
��՛��؎��puMI {�%̵�(�AT���d��M1����[5d0Š���U�/� ؚ�S5������J �*^	�Ԡx�i,v89oL)������|h���?ȸ�@����Q*�~mM2q"�շl��fhϡ�S�TvDD�p�S��'DS~p�}�W|<ېM�(�����Rs��|�mޟ���^� ��g���&P��X��ܼ)����f"�ܖ�GU��� ���ƀ�<:7GQ|�ʑ�o9����-M��Џ��o���9��_����;�-H�E|=n��, v�E��aN�F���c��O���S�=�;�̭_�&Fx��MQͫ$���lN#�wB�L$�+���L�(�k<R���������E�3ϵc��-'Oe�J<z�ğo�Q��[4|�:'駨R�-���փ`�c9{4�մ8gB�1�u����<��R!1ҩ��9Ϗ�h\-��h�>]��Q>�C�j���%��zH7�vI+=�r#����o��h�� V��b��m�C�&M`�]A����Ptg���m=J}��[���	.����e��ݐ^W~+�g0؜b/�؋_eᲓ��G��i2�h���QW)�9".L!�	��o���hX>�H�E�=9�$�x��.����:}��OdJ$�p!�DMPM��6�I����x�ks��*�eX�R�r���:�|�a8E�"gG޼�����t�Ŕ�����5�Qg
q�;4���jb����N0�NL�$�܍<��ރ{�:#CS���t����4�"}���}t H���>*��mdMr����x�L6�_E�	� U  &��2�߳�/7h0f.*3�K�hiv�H�C�c��4��JK(�����|��_��� Y�B�sm�7U0���W8�(+��Q��2��>�.�**�]��8p�Fp�Ԅ/������.�9&�
2ȶ�:ţdM�P�Uv��
��lW\�Є�X�ޏ�Q��Q���{�y��(b󒆃q8vAHD�qH��/:�T���2�1"y t,�8�~��|&S�NC6�Iy�����r�54+�+7%��$<�o�����IU�E#i :���kdh�'��#Q��gw#�/6��M
M���4+/*��hiB]}f��2��lC���増A�5\T��#�Y��-�	�W��ZT�U;��K�	��%�Î�tr��{H2up
*�-�=�z��~"�N����5�S�����-H<zu�.^
K&;*)�CǾ?OH�p�V�3��b�F�2*��H������z-Z:
�^��+LnŌ㚴T��K��e� o�Z�蕏2L���'@k|Z3͙�u&H�M�>U�F&S�kn	Hѝ��;���67=\R�R��i�I�](wĮ�nH����4J�7R����L,.�ױJ�$���X6�I��X?�~oz&iS���Ź?G��<��~�J#�!^%��ۂ0���R�M���x;BK3o�JG���&aE�eh8��i}$z�-���e
��'F5�!N��>��"���^�DgA�]2\N�F?���׆�h��u���@ӌ(�M��>�e�R�)���O��� ���;�W�%M�7�Uv׬����s�:�~P�(�S5@�Jh�`���T�p�;��u��� �o�]{�h�Cm��#�U���B�'h�����@J�}�7���G�
*����[(�����A/���td!�{E���t���[I���įh��aU���Ӈ̈	s��%�NqL$�� ̈́G(��<W!Z?�]�"�,�j�1Xw����Ғ���[@�t�y�K��d`����B�`p:�kL�|y~(���o&zչױ��+C��ZYn=̦�܀r7�����"FD��c��fNI4�J{����*ci��~�&	�VF?�6n��}���5(1ӑ�s��VhP�.!��@���߹~O:��
'q������o��#���\T~AG���$]í�JRL�'�P�o=��/u�Ӱ���nwh�o�|Sq��/��H�}2�:� ����W���C�
��=MsqPh�u��N�]�=xC�!cI�7
��y�r��MﺦBE���X��0��eRr�����,g:J1��Ss���sMW��9�:Q��G|��hp�޼���(���I`$�l3��w4�3|*O�Z|,v��1t������W�!��A{�P�;��X`�"�I�m�3�a��7�Oq\�$rOD��󻸡[0����.�m��?�n�@Z5�м��З�U`��a+�e���|��l�$�u���t�L�A�tM�����V���'\��G�BR,<�wVF��|�]QG��NZV�h���ہ�ݝ��mS0�I;z��} &(	HX({��F\t%�-*�W��+�c�sQ§!�(�җP�G�w�KFŉ��e���n��I�@�Zể�{9�%����Z�\O�c�RB�ׅ��?G����J�����L&f6C[��UuR�sh�����:Cg�����$�9�٫E�S��h���X2�0����t��>����m�G>��x�`�/��СD�`7�E�nT�luY����T�K�k�A��A�~�b4�֍�y:�;6��钄���F�a~*��(��wR�14X�o�/���3��2�OO�~�z�q[cG��=_2tҡ4���ڀq@���]����t��p]EXt6}�b@�O�A0�?ҙ8�	�ьG��H��2`^�f�����?�HF�7�k�1?���� �>U-�w���^�C��!�	+�߬��tY�Ӡ;F����������c�2�+�9�KH1��5�{���a���P��;���M���wxu���LCd�+�t�G����@<���Mx:��8E�v�):��߼@��@�Aڧ=;F�:�\sT��lV�b{j8>���x�3u�D�nL=�;W#�M��P[��O�Ut��A!�)	k}�IJ��t��J�9�9]�Z��DSC�H�|&����m���@Tf�mD�wI��D�x[�,	�&U�UO �^��Z@4��M:[E�"P�X4���T�Re�\g<Y��['w8�4;��=
䡾��UY�EM:U�[ +���;�ݹ)�\u�!q��S��E~"KlN�5�$�mY��q	EԒ�k� o�/p�l=��t�`V��Ț2�W�;�� �`����H�>����`t�(�ь�긯� �	Xq��D�]��X���I�Λ����w����f�Ia�W�B����ʒ�;2D7���g���%�GY���Z>��޴8uN�:�H��:h�ñ��Xy>BKm]B-[i�O_ﺎ����N(���ٯ2�7]�+�tb�N�l�n�+�{r�UƵ4l
�ݸ	���}5MA=]Gp6���񅘑��_~nEcA�j@��RvĤd���6���F	}2�"���6RXE;��~��Y�~�{��zok�W!*�u"�u���	���j՟���8�ƿSؚ��s.2�9]+˿˙]��&H�(�m>���o�G:��w!)��)`���6ta/%�#��qW��|y���x�%�5_�O}�^r����[
p���B���5>�KJ�u ����gT���;�Ԥ��Ӂ��Yg��d�.-��h��wM)�x>dv��޼��-2Wҁ���v�~?�PZ�z�i�C�1_���6m�@Pk���]?[Y޹&��8�*c�~眺�"ژ�8!Q�@��k��-�G����C���۱���+�Bw��.�2t�����O[�~-"���q�: �LC	� o����ȼ���*`��	�� �3�OT�A5��ρ��-�+�[##c�� �C��b��/ ��\����;6�c�k�#1�.� �<V�S�W��"A5��4����NͶ�Ȥ|��%Q�&�Xt��,h7��(V@�"]�w��K�P:��t�\�=�ؼ�����਎��Ab�A7jN�u�?�	�-�
T�w��UV���M��e��\<h<P�M�mm �{:rza�s$xg�\v~�0}��rj�\Uㄽ�9�����--�L�J��,����	 ���ᖞи&|��w���R��v(�>�dt9��MT֔���?=�ZDgN��7��G�T5�:�k�H�P�/�Pm��Z��ਬ�Q�ھ��I�z���N��5E�C�W����s���܇      �      x������ � �      �      x������ � �      �   [   x�M˱C!��r~:		����	�3'ͮǹ��������qc�ѳ������/p���,Ы��*�6��ܝ�����&��~���Oe      �   �  x����n�8���S��Ҋ��8G��^ĉ!�
�Ld�%)��6{���z�R�l}8��H��7�g���7�o��cuL3*��E�,�%�2v�o\���ß��[�Cd%��I%�F,���1������mߋRH�e�2D�!���pOs���'���	{*nm|~��١ȫcm�h��6�i�� S&�Q%�\�"+[�8]t��i���.�o)���1:e�2j��Q����B�����4�ds
<h�e�gIոY�1+K�2&�N�+� �]FS�g�۳��h� ��s���U�����v%�i�?ShG|)��S-���{�f���r��{m.$����f�E&y�y���aWes�>�+�O^��$�:�fc��L�y�´�����as�.䲯�Js�dD��W���F�pZOjny�H��8ɹ��*=x��S��DL�z�2�
�~�#�zP��G�q[�F�=Thu�tV���W�)�O���q�R�_��]c#��Du����C� /\*���ŞSk�0 +5�=n/����C�#X�7/ �Dd[(%����w߱�<�����~���D����������{ުZ��I|����D������dL�$�(����݃�����v�?��DW��X{L��8�q��=�tN���4^H�z}���7f�
�G��(zΊw�������LWu^�����
�:b�R�S�tF��y�5�Y�B�����I��$>h���%1}o�6�h�\5:�jr~խ�5w�I\��NVR'��f�K��=���5��=����k���A�]�F��k{��#��ױ���j���%`e����^�+����e:A����+��[���i}b�Ğ�LB�m!��<���g9��<��+�h(�}��v�����"��y��#��\�f{)Ԏ� <�����45� ;+`<C*%C1�D���~�������[��5L�<���z��w �z��N=B��J�b!�� �@᳎uW�R���Y�g�_ �}wLt߬��i��z�ϒ�r���F�7���9\w)�-;�.�i��$T��S��|���ah=~��i�	�	p�ZV���������c4C�"�_#]���)�KyC�ݛ,�I*����vT�����BE�Gϧ؎��4qliӞ?�Pu���2N&�z���)3xN�7������%���N���i�1v�x�W�u������� �%      �      x������ � �      �      x���[r,�ф�>k�%i�_&�Gp^p����ϳ���$=de5%����bD�<��e��G�f!Us����6�u�L��r����Û����_��:��úc��`M:�����fs�!�9ﻩ;!�|���Q}]�
�[�\�����'�%��wy�y���ѫ�J����>�����}�����j9�(������i��3���R�G0���p������V����&�Q��,|��G_9�쐳	#��#Eof)��hj>Zby���XF����%`G�;��ⱜe=ZtG3a���[m9���";Z���dW������=���7m�X�};.��m����i_��G�+�o\-���#�վ$�ivW[9�I����18k�k�}ێ��";r�nc��M�Kw>��eu��$�G����Ev��g�lI[�/��Սx�=������_���~:��OG������?�I��P�����}�!�<�,X������۱��[F�[�_�ّd�{�R��#��~���Go��/3�q̜B<�������n�\v��/������gt���h��1r���X��b=.��iGN5�����q}��i_lե=�.�a?��Eyn�<���O��Uۄ��ݮ��n�m;.��i�md?��:"�BJG 5?"v���qm_d���r������R�R��8���b/'dr���/^~Z �����������<K@���3߶��Ȏ�S*YY%'��ŀ`�0�bi�S�����/��<;���q^�v�Ub�-���cؑ�j_�?\�ɷ������?5��:ڶ��k�m��}��v j��ϥ�}�l(�1�a�����qm_N<�2Y����򑼿6q�����9�yΚ�ڗ(����%ƃ�C�ӳ��~lp���v\ܗx�B��b᰽��-�\w���.��f,{�_�k�";X|LY�p	2���+.΋��!�o�~0�s�;�z�~P�X�O$�h�U�^�}\xi_vT&*�1�q�Uݱ�8���b=�����S�����儵IŁ�vGw�g_��9���C�<����%��_��(Żaٗ	Î��8��b��UA�z_��X9��>��!>�k���k�ɸ_������=����Z����Q&��K�������.~,�{�(2o�'ٱX�[��������Bp�ᶅ7�(����F��6���/�s�H��� ���G�e�uQ��Ǐ��";����y�ߟ��_�k/�w�q�/���Ev�<98��e3��N�ɡy��I������<gw1��)<�����<fι�f"L��Ev��M*��%vsJA�D�:`�����}�	�T�8RȀ���+c��nd9�b��}Q=(�T��)�`\�FX�Ŵ�v\��Q!Ҥ}��R�����&���J��/��5��� 
$:Vƅ������z_��9u��avX2^�wڵ,�e7��_�K>�\��zL�Z?  ���F�d�:��]ۗӎ�I��f[LfF���]�l����o���y΅��@>`�~N?me�#�4�"˅}ߎK��Ø�����˶ZU����Z�����/;bO �b�\X��+��dփ?����^��F]�ٖ#���b�/���X��<ɩ�����f3���V]�X�28��eA,}�퀐������!2�/X�= �k����#1t�{�+����O���]�ܶv���:�X:�d�>c=0h�--<���'2Zօ�&��1�g���޿����D��$[,����J��O;f�{e�Ɲ���9�X����/�_���֖8���[H^�=|A�c�i�v�F�l\��뜻�뼴�	n�������#�8�ؓˑ��s�"��&�<����b��v�w"C��I��~3T�a�>��c�c�� H�pP�!}��b��ߋ���,�o�A�:C���R�L�:/ido1ӂ7@��L���3$[��n}6pV��ˇ�y��]���g�1�{_��	�0�Ҏ��[�å��_ɻ_�����bY�n("�����%�z�����c�L��|
��z�������;E����\��!�JjY{�����Ƨ����R]7���t�������]�=�x�? uc.˾��"�6�Hqf�׮���`-yn�ɬG��F��M/�A��8�	���9/U*��@k����{�G$��(�^ų;NU �ǆf��b�����1�u�Yk�1p���=C(m���vgJ�GM�IL�g�H�ޓp�]i���aF�YT���` 	��:�-�-��xK���@q�2��=�*6��煣Ҁ:�H9+���{r�p�y��/���Lӫ#�v�<H]m�cÊ7_��Q��f�/V�0��c ���Iޟv���h�X�G�<�Q�t��mv����#A �èKY� i��c�@�3D��_�v�dPm�8@�G@��M��VG��m�Ԃ7��UQtD;�Su���>��}�>� ���09� �8�9y]���X�k��U�9�B��gTY�,�_�9����q��=D~�%���>>%ǩ���.�D-�L|�|�d�k_��M��Tǭ�j��t8[��{��W��|e�0��ZK�Awq�'^y��2TE&��oe���!��_����8��b�*j�%�>J��B~�y����7�tR��`��4��m��ql�A��VE2�̦ghtZ��0���Z��PT�^���6�[<P���P��=asT4��C�ހ��Q��4j����aV�g����~?�5\�I2�&��jH-p�gD���%�*W7�9�"���±�0%p�m;�S演��q��8�s �y�1��i{��8���0��ǗL��O���B��*�����T;a����-ӱu�l�uK*")A*���~<%j<�v�7l���Y� y���^���	�j�pSԯ��U��Y�������96��D\���I����Fm(�/�h)q�9⳪���<X�|���k���
���Nv�Y:0��@�ڑ~��\{WN������s�}�X����:uЦ���Ax]���#G����I��@Y���c�W��v<D���ä���&+�%�Sd����ݽ�>����^���-��\�iLv���O�� o �&�rb�����o��y�թ�����/$i<z��|�_�}ߔɼ9�w|�Ӧ�hy�i61�:~yT������}�%�:�G[��l[��y���Ȝ��?b�G����8@bie��W��Vz,K�k\�t8 ��N��li�a\���W��vD ��D2���-6sT�p�'��H�^Uߕ��m����=y�]�Z��&d��v8���ĖRe-��9N
��x����p�e��$��)��N<���Ғa�-�95l{�M��͹��}�Qv�-���˝�������%p͗��	n����تzڪeka���)U�#[�x|�9Q0k�87<�//��2�t�qU!(�p�F!�Ϸ%x�9�F���I_�"�w�����Än;'�8�W��Pb��ޚ��)���w�)q��ǴN$I���r'X�׾�2<�)����#�|��ۘ�-o�X7n�}��k�ֆ�Y/9�J@[9�~~	���_TL��K�<��s$6�_���������Td�ܘ��3p��vt��H~�*W� ��f�<���z ��9B�7>�� �HKjͺ	?��=.�����8-�/�A���
��eG�q�ꑥZ(KH?�\�1��|���r�!��N�A��4}�Z�iG,�?ر���-KvЗ��i��~~�B��[ �� 7e&ω�O$ӇW�$����:@�m��߁�0��8 �ΰn�b�XE�I�l�6�Qg�ӎ���w�w��Z�㡙��wL-�ǧf���*�Nx3 �Pl9҆y�ǆ����P�&#ݧ\��ZK��mN�Tȇ.�A�G^���z8��[�vL'[����-�a����h��s�
zJ�X���U7u�����^���J�lM<����m]贋�����8    F��kl�7pf3a�TN�~��GBj�ᅓU�l�`��v��v��o���n��	�i�)���ˉ)�sۂ q����ţ�J*s?��S�|v��EI���bG�-��Ho~�-�(���گ�N�!=�	W���y�oS�vx�n�3��I~�Ӧ����yg�72�g���;������:� DIdk ^�c'J���O;R���J�kO]!{B��@@F���e���HMM������|~A����y�� =�)|:�穏�˥��Ն���,rX�k��1sK?�����H�"�yz�#��H̸v������c��l�>������d�q��_�>vV"�H��)/%���b��ϳ�>֪o��j?X��#B�z�䄀��y���sW<%�M��} ��P������	�t��"��Moc���׾L�0��-�ς�x�/j?M�yP����i�ĥA(�^~�3|?J}�ė���!�ȁ�`5L��Q�ĪE�tY�m;j�`_���}�7�Q��6�������<������9]���g���z���s�9���:�)ɮ�l�� �Φ���T3g�H�FbO��J���q�.�[]d��"��¾���}�)٬�������L��0��nw'��Qa�YK�?�~I0Ic�E�G:��8V���:����&�֥K@I�n�j���V�� ��&�i���o�ݺ4Y��z�cM>
��R���V6Ǌ?bU﯇�i_��%�Xgr2��Q�ڿ|N�m9�{BvHW�&�V�e�/��	�@�+�-�+Q��фF�z�_u�]�Rw��+#Wu�q�Zq���j_�6�/Bij�^��8llm�Y܋�v��>����p�%h�S���������$آ��a���8ƶ��6>�ȚG��q��
 ��y������]��=�:ș�R�~*��΄ו��~�w�?�������޺�h	��F �z��{�q@�R 9��za�=�%���ے�͖Y�@��*�#��Ww���b1"MQ8���U�;�ݵ/���J�?��Z@"����s�c�F�������-���u�-�+>��:�P%�v��4����x�=�ԙil�~I������x��Vv�XD��UP����i��:P�X���8�g�����oK+�ǲ.�u�٤ _���Q��~\�(� Y�1%N����q�ҫ1���Q�����_��w�m�P��W�C���$񨢤A0[=�͘~��%ˏ�����ꒊ5�x�z']�r?��nm\m��!v�$�- ��e���/d�pJ> %�҆����쿩k������bf8�?0�C��3����x&�ҡ�q�P,�x��9�q޿�����0�~:&���=nu�c�!���V�)FC�3E뱠y��$$���}�RB�Jp4�'��~B�Ƀ~-����ީM� �Y�ҥD
|Z$T�s� V	��ØԔ�x� �v+t��'�l�DI�~��t�T��s�#��>�w�9���s琂$ei���8I���oZB��Z��U���k
����~��˃.��Z��H7�^��6�=9��m3v���Lv"�2�D�P����a�y:�������#@�vh�����}!��@�=��'�5��,޲W ����բ%�d9kPGk����ؠ#��Ƃ�D0���#�V��n"Ŕd��Ӕ����I�U%��h�_�nr��y�q0�j#��%�l1k�2��/xTmˁk`��j#�+itp�%����{��:�Us7|�K�t�^f�a��]��;��ZW���@�bFK��_/\8��UWs^�p��u���9�D��>��;"!i�S�3O��<`ӇXV�8�S�~���DhSҙ�h�O�p������I��8k~IY#4�������t�S�Tp�nGZ�����״����nd39*�Kd�T��{Ե�����e�!��,���$��t���X�����d��,�-m��^Jۇk)��u
kN�Gl��$�0+I�u������Rҏ��a苖���J���`�mkG�'%������h'����_�Ncg�q��h�QQbζB�W�D�_|��F�q��ɳu�=Td/�|'4pEz,�j3A�9�7R�С���}Y��8��h%53��i����B�B|Xpk�nQ�<٧Q�8�'��	V�feQP�4�.�ڡ[�}���y�:��
�n�|�QS�^�d�x�#�tι����T�ZD��}�o�a3��rX�P����n8Dj���QN#@ɩ'�d!}g|��'3��s$�aC;|��,W��d�cG�w�H�[_��)�]4j�L��2T.�������]��@j�y$��c٥9�œ���8oឮAhUv��6��z*.����[ w�({�?���s3{_��?^y�F�� ��l�H��gD�)���0�N_:�gpZ��Ěk��ʋ�C2�L	`<�!�L��yZδ��ݏ���x}
���Y@d����";���i4�M!���D�"�V�4"go�_�uS[��D�:u}��#�r�d���{��H�y�^��x'$0�ÚX  ����/j
��G��4V`�8�n*��unk�nM�S"��ov�^�����;HQ��*��&�e���k�܀�863L���ZT?�PK�c��}Q��$@-+�\�g���aM�����w=�q!xb�t�K-�~�����r�0� �C7�!7�\�ؼ��&�^���7$U�e�?�5	e����B��ꐘ���~_�E)�]Y>X	�U���
Kv��qFGԾ8�EPp�,:����|Au�"��5��\"�n����-��c3��G3�����K��)�Ú�E2zX#5����k_��@�H]�s����|� $�/t}�#��a��z)E���_���E�h_���F "�%_����)�eL��x��YU�Z1���x0`S4�2�e~�K)Nu!��T�[���@�v�B7W#o��P�����uPFii�����%�u�Xm�V���lo��7��F5�H�"�q	j� ������ $�Lz�%=�Zv�����?Vح��F��1�)�8BlJ�t`�+�vM��p
�~�P�op��d<y?�%Cz ����[�P��q�p���X-��e���$����9GQC/&h�S���kO�<��Ĝ";kJ�� ��{�RAj���B����$L�~MM���N�gl��HűR�C* �W�� ^�øSR��G"�ۉe�e��-w���$��N=G8�HBY���c󭞼!K���"�Q�m0�;�����f�h��y);���MGԕ�^~J�^����@�#�Z��3f���╣`�`5q�_:�նд ����/�8�90��������_|��0���j��g�H9�K���.���/dc{�=�dBo���7�b���Z���#�K��8�Ð9F���Z��T�2����p����S���Q��+�m�S��e�K����plg~q�A��C�(�"^g���?����սw�q�.?�'H�w%N���5��ԋj�T�ՖC���/毯��"P�e��Y)��L�Ls���VBU�r�<�F������w��~�P$u弜�`\�q�]���5�n��=Kî��ur��ɽn�о�'�$�`����ɭa����fO���˦��5�tB7])j�8P��b��>.������f��ķ��.q�_&qn^��aYV�߽�cW*
�36!�p�/��8��$��>\�S�0��T9]j�xv��ƺI�5�RU���~���?��uH��H�R�=P<�	���cY$�W\w�p;5ZgB������Z��ѝ_�����rB�N�줎Z�o��D�V�(�(��k��4q/ ��"�m��\���e�v���s6��}�5�"6 �d��:��{�*D�/��u$��K�>&=�l�������X ��D�hk��}�:���Ħ)���c��G�D�����%^Լ�u�\�o�eK�]���T�]c�����j���B�� G�    Y)nQ�b��99ܤ�_�b�v���W�m���a%3����Ԇ�Wq@�����t�/����_�6�rāJ��Q&|N#�_������c\N���k�-����;0�'���Pz�5�_RTK�Y�_h�5�a�ܷ#ϰ���� �cN�z)߲Y&.5��ꅰ�d���jS�?p
�����Y���׎�Ct�'Ə��yF���~�ޢ4w�uFG]�dj��El_̉�2��a�V� �L��z�$r>4/KB��ovX�����=���-'ќ�S9uD��S�Y���0�һ+ckv�a\�M�>�v�5S��ՙ��W��4��a�q<�w&��>����GA@0��tsi\��`��j~��%k�:Vp+��,�G�o��y���Ǜ�����sV�W��Ȧ]� ,N ��z��\ai��|t�/�{�R�9��N�y+���֕�7}��I&����\����z�֩6:G�$��4骪M˷����j��g[ue��Ø���ge�ֳ���\����g���O-�����{�� y�4N�{�-� ���A��0Ӿ�%X$��CݠF����3,UH&�^���?�g�mu�v�QT*a��A+��|�K��|?�pcz�\�u6Cf�ǳ�l��0����~���<D�J�zo��/w=dc�3�c��?�O;���|�Wi �t�mT�-۱s�sJ����Q<;&�2��r���PQe��ߖ/�]�����2%! P������6�>�B�p)�?�şR_�W��S '�h��pi��7�i��}&/{��b�9�+Pa/$�ɒ4[lz��Ƅ��?���z"1mu��)�x�2\Ԙ�(Ĥ�Rj����kv<�0��|�*��!�a=�V�1����H{�e"B���ҥַ'�܋8��g뛮���V�/BJ`��r�?����\��	p���Rl�i{�LgC�ļ�ގ��6:�!ξԎ�X�с����']��m=u���yo��ʏ�h��Ys�N�mJ��TA��N��%���$�jн����`v����˨K#:e�?�����z������NQkS)c��92���W����X�L�1���S�����5E�kp�?��yz\P���EC͈�$e҆��p�:�x#�Aڏ����4��I��Q��k?,�8©;m���̯��x��`5�y�����Z�[;�����^��zp>cӌWsj�"d�mT�9�~�^��\I|5�D��J�� Қ�:NL�=��9�^C���:�r��$ $9�L]����f�#���xqLř�4��� ����~M���~�s.�,>�+���iJ[����΁w��95)!� ��A?�|͚sq�!��4L�T��7{%!�$�7�bj	?���+m�O��Ns��P�ߞ�[=��s�|~{;�I��7摎���9�
��x�AXa5g+���F�p����ӽ�O|KP�Kw.�jg�I7,f� ��^�M?%��Ƽ��B4��a�94#����@(��}�zi0�37��$��aYۣ�6�487g�*�.ş��]��|��M�Q�s�0�`��ǁ�x3\m����R�	���+���@\H�៚i����g�I9;�����)����ҕ���m�1{�W`�^�i��:|7�.���6�|�S��>��J�B��o�|���	ێ���P2杈�j~�G��K�l�LI��E�M�}ERBOX�F����׊��k��öX8��]q����t��ǭn2�����\j�zL �L%^C�cMv<�&`��'A�v���<��JN�eu���1z��Y�3;�C��T�E����)�ޚ�=r�x�iN���C㣦����`���W�����.=06�X��Ô��]��5�����0������g���B��Q�Qg�ە��(b_��RƳ�O�I��ln���4 t�.G����Y���D���NsYW�ܔ���1� EImM/��i�?�Ga��X�g@i�vM�g�U�ek�!k�XN���}�O�(�^O����HV=5��� s�|F���.{&��� ԥ��'��e�$��	�a�p�V� �j��7" ߷����%	��q��Ec��V���n�D�V�Nfm{KB��~�G~|I�<TZV�ps~]=[u��5����K%|W?�b�!�L9�S?����	i@=^g0�Ў�Ɠ?:Y��?sA�����$	[&�)$cK����\ �0��Dj/���nD��bi�绘�%w�!��8�y���ba��G���x����Jj�8�&5�5����n��v�ϔ�ƻ?KB����E��KM���d�{�U.!����˗��'<�n$utKM.��f� �v����2~��4�R�Ԗ� �����H��@v����\��X��;Hd�1dUs@�H	�&����l�Ϗ?��tI�����#Xu�s+7���S�`8{�^[�T�K.I�_��� ui8�R&��X�Y�=�d��\(���D�e};���
gO�$��=��s{�f��he.����Wi,��#Z���� k�:z���/�/G�+��gЍ�M���G����.����^ d�1�]�^yR�Qje��{%V�|
8��.mp���#a��a����q�+~�QJ�Ċ3U�0��1΃Q�)[��C��5�}<�w!%��j^�lL\��W�������c?Z�kҟ�>%p`R���f�H��]Z�4)�v��S>�U����ڻ�s��9Drb`M?�R�v���r@��'|V�"J/�W�^.���
�$�Ԁ��9���])�R�O�(�]R=��M��hz�WGj���]�k��U�G�@�Y��j�*�z�n�e@w
U���LY�G�@;lv�+�d]��uJ��W�����d��'�1/I��dG^P��4�F�a��N������{��X��|D�.	��=�����=�l�ir����e<1)|e.�`���Q�R�9���k�'k�m�� �W��?ڬK��ʊ��T��>��h=�v6�Z�>��L��n�%���dCVlV��id�d�T����B��?�G�G%;�,�h���!Ҵ��D�9�2��v\�6<�'��wb�ViS�}YN��~�����H��}D�.i
��b\)�s��9��ԃf	ΓU�����6E��1�.����n��^%ub�iVu��x�6I����� X}���t������k��V*��jV>����{2���S?ʑ�.��'�bB׋rY/�M������f\��>q��ɏ��o�����>:�N�kդ�>����w|�������>�0&��3�ޖ^��Պ�X������^��}hEٸ�ɶ�s��FH�I��Kٰ�C�Kv<֣YҶ��7��N�݆.^4�>۠�}Qʥ��'��&H�7��tgc��8&��o�þ�%�~�G��5O/�0�@v��޲��9��X>4'v���k>̍������l�����fK��at���ߍ	�'}F	�X�X��7Q#b�9�z@��,JS)e�TK�߹w��\����5�n��Z�4�'�:��J&5��t���]���PO��%�nE �?*T΀i�~�*��Yq��m�C����٨j``p ��
a���<rho�H�ҧ9�=��&��%p�w�=���V�Z�o.l����j��4E�)�}[=�2�kE�KUt�y�-���^��^\2˸$)�n��(Н�9�wO�/�+\�Y<�I�lI�F�fд^��дͰIr���Z3��1�%k�g(Iz�l��p �$]A�Fqa������>���z�m4Ɋ�����=D�P/�[�+5|X�d�?eX�X��8���9�ܴ�;A�u�����*���䑣��u!p�Ŗ蚬�� �����j�Y�ɣ��5�2?�5�xJ��T��\ �vM��ͺb�so� � ����h�p�H�o`���o����y3c��K7+8��[�Mmn���6��蘅!��=�d�3ڛ���0Ehank2P<���-��,�QJ]�`?4�Q��V�8��
f��kǳZX	�e��Q=j��T�n0드��އ���Aݷᛖ���|S;�5Y�3������<�    ᮬ�2��m@+t���n�nw���ׯ)�aD�B��˭P��UqXm�\Mc���qM��7N/�㢻��y]�H�T+H�����B����k���mH�˫�Ev��_����H�ԭ:\�_4�^=��4������
P�Llk�#�"o�՚b�g7V��@�PBއQǃo=;��bYi�Z� ��|����ɒ+;7�j2�6�ah�l����}�~M��pY3a�+ň���XH@��Iþ�Pz�l�hw�i7����3�K�Z��������Y����������� ���4T,Y��dw}���?�pM���[�)�ت����N�8��UULε���V����ޜ�#=Z	��'�,��D�P,��|�b��~��O��ÒV�����R��w�=2��U�<[�}
R��ODEx^�\�u�Շj����Q^j����AW�A��}]�J��|�{!�r��
�i~e�E�wjs��T���21�g����AY��>��ՍJ��'=���L�<����a��B���<q�T�4q��V
� x�p�zǣ�_�k�ǩI i�u �?Si&[������E�����Q�1�5��~�������K���w�^>�^�<#{8��:g,,��?؁��\.I�����a����Hc�=꧷�Z��[�c�/�)����kM��/	}�L0Њj�$@�cr%���wBߧ�+6�O+闤>O{�iq����6ģNH�̳�+5����5�L��ǵ>�{Lr̝D��s׍t,�e�Y�_�@��w@�T>�pB��W�Ͷ�9����~���ی�[.>��b�?�e���9g$�=�X�P�:T�V�����%����rQ�s�|����:�ϲ��>�h�|a�
�U>�K�x=���=�ف����:�_��v\��G�`B�X�Y�z��~�[ᱤ S��Ei��&Q�i2V?IPP�ب��HgP���� �%����Ei�c檁��F�� �5z;h���M���F��Qн(�9GZ�i��Tz7T#Ē�� Dt��a���g�ڴ�G�\��<F8ۅ��� h��h�;��s3����s��(�y<�����kfH����^�-�t�}/J{�Q�6�5��	�O�t�
����eo�#��z����%�p�mX��
�W7�"-�0�D�\�t?�^T�<�l4�hm��甼N�$�>�B
Îrێ�z�s=����!P�W��x��Ѡ3���p{Q�s�P&r�
:�^�m=(P��,g�&��߳2G�|H�.
yd�ik=rМ.�S��(ǲ��V\2�m{��Z	+!�y�@���p U~�$	7���S�5�+4�K
���JW�Z:�,�M~t�*
u�].JV/�X��y>����9D�D��RU��/��X�k����Ͷ� �b��yKù}����~��v\Td���[U�E�6�5�^J��T"zk����Թk�����u@�l��ӛ D��kgW��}w�(=x�';6?�M��1��T�����3���Y��e��=��!�LP�$�5�=蔍_.�k��q�~��jH��=�)P�[.@-s��d�V���v�=����I�e�N\#ש����3�5s{Y.^m���X�����UO�Ðȗ�����ʑ��`���c�Gǔ~�m�F:�.���Դ������pOp2��#�a
�K�ѓ���#�U��;W���Z�4���i��6O�bs��2����h���ǆI�1{:+��:u|��|���Q���7M���j`�9��p�;<�Qٶ�LR��m��� ]�����t)��AZt�.U���Լk�B���w\��~,�&�e`���u�
Q�ۜ>��>��p��Y�Jim����<��«�e�&����v�z]���5���L^Ԑ.u��:�.u���_1�zv0|6l��U�Sz=K��܂�&��]W��,6�!�t>���|���<Vg��>�kP��,�
E0-�v��S���^ �NvI%�,�Cj[�ŃRx��7Iju��h̓��U�3�GXzڤ(w͓d�h4$���Ͽ�Gx��w��[{����� ?��}��4���@�`k>l �h�	��(N}��Fţ��AԴ�Q��s���o\��糓uI&��\�d}=���f1�T5���a�}y |����*,�yN+�j;��[����;a+�X���$��l>��]o<��ɭ����$Қ��szZ��&��}�}ю3�L?g��+�$��z>6 '=�>���7 �??B�q&HNrN LVɷ�my0����Np�7�q8M�ރ\��+�������hc�X�G^��p���l˧�t-ώ�	 L�qJtf�K|zq��n��&ޘI�}x�wњ����8�}2���ڻ��I2�������?/�l��ݶ�v�+f�8��Qkr��9�>�p��z͎3�䘺�f��Yp�Vpi�R�����z�'M��|���s=��`G�]�sSw6�?&��T~�gc׮H~^ݴ��p���7nÚ���%2H�o%?�t1P$>E�M=|9��QJ�i4���[�ϓ�@����QŞ;)YL"	�����#�#f�I�󴧻�L�K�^
���B�慕�������1�M2���y��l��,vإ��)r��ݡs���#�lyr?�#4sI�\k,�I�מR$6�zM���Pz��<���	_=}��-Nu5�K/%M�s�5��s�����S6�*Q�i��.�&DnBN�
�����E�y!1�^"*�G�s�����@����Q��&�9+e����@;�G���K='Hg����}�}Q��@u$񪗶{*0{wdr�\���y[t���O�yn���˥#�H"Q?/[�jr�9>Ū!����{�s�{p=��.�F�l~#M'L��6y�fU��h�%��������4n��.b]�ʦ/��ətm�#�,���������#n�bη������k+���D6�zkl��"Ϋ{���kM�?�G�`���T�^�l4�ѵ
�t��#J�"�5.5Y2ǧav��(����x	��n
�\��yQ�un9a~��轰��F���i�v����t׍�MJ������\�p3�GMd�v_vQ%;J�y�=�zx>/�B�h|��}!V����ӎ�]���(t���=_S�*#��o.#_�b���S� ��mzWx��f�e�����Kv@?۞�hQ��(�Ʀ�R�ś�fG�1��ax�(�:�M^6��1��T��.��/�}�rQ�u��l:������UOqk��������(�:�lɞ�L<��p2!���6����8rQ|u�kX�5��9��Y=�\�kVx�_8�&���N�������Er�S�����d�^|u��n.�^����������۾p����׀�Y�-�9�щנ��
i/�Ѱ���Wg�a3����wb�(�9����2�w������G�|��T!ej�_/
��4C�B�~Mtu�Ik{e�֕P�R4p�	Pw�]��+ف����y�	� �l�˩!"���Jv�y����b9�^��<)3G�\]��eل!�)�jA�<\��`VR������L��ۀ�Z>X�L"�Y�]'����p����S�$�.sj8��\�hY6=����s��?�6&Bq4	QZE�84m�aj�;a�5�ՙf��2�§�Yu&}�u/rĒ/��E��i��5�O�[EQ_896a��π��Œ�2��?�W�
&%����n��fW�x{��^�Y�p����f�J\��rb�\�m���ә�2��F�>f�BT�k�|�g}\�>;����a�Ey�숸Er�`f���z�dhz0�C��}�EY�yn+���
"*\lM�	�5�ϯj4��\Μ�T�N������O%.p�-�������<�a��=������KTY��4M+�����(���ڤ�"�-��T�o��;�����sQ~qfv���9�J�R�6���v+�du�����s8ף�1�6
3Iv���$?[������T��؇p���c��8ٟ�iI��&���������E�ժm��dPu����k:�ᣏ �/Z�]�?�V{��֟��    ���Ű��am��%/�R�Y�;x����W\�.�dC±����xK}���:�4��-՜A���TX��M���8׃_ڟ��z�c'���������,��5�)8��Dz��C�����A��y�A�
�gv�ن�J��^�ځV�&�E	�^������u��{������#U���GF3���Կ@���8׃O�NWUE3Q1x�<v��4�c��Ż����Չ �=�������k�����q�'z�ԾT��c�Cq�|N�x�5��g�e�z�u"��J�
jA�+�q�`#0�8����z�ҵJ�ϫ�	I*���=:�4����\�M��,c�םs�*fB�8�$_R���}�}ю�͌9�F�q�\u��
7!�.g��� ׄgK^
=��L"��K��z�K�Nu���ß�����JEz릋���EwF���rQ:r��jd\C��"��c�'}��<��ԋv<X�܉�z���.��4p Ml�_�̋��U2I*}�6�U V�B���(n����f��v+�z�}��'��=G���$����pΞ|HO��/�M	��6wV?�V��d�s��Ao�tA������g|�_Kz��6F��z��������qy��%����?l;=iKC��!�ڙ�0~�Z�/��{ӹ�̩p����>������E;©c��w�~�5���x�Or�-�A��Z�tV�;h��ylת
�F���R��l��'�̏�,�#�HbKU�H��bV|�>�8��c_�k%�%�^�/ �1u�"8P_<����a��
:�G�� w{m�Z�fێK��\���Cnz����$�d���M[���n�qI���C/n���+�ut5�nMˎ�ş��v�4w�]-�"I���6�DBL��?���v)�m����B���QaCf�F&ܰ÷0�.6�=_�-�/�V��Y	0Nj)O;�7�w��)��5�HOHB9w��a�%��Î��>�vd=44���U0[y�
�}?�X�1=��W ^k��T/��x�a�b�&ۺ35FM�ɩ��U��.~ێV�p�x�����Gѐa�f�5 w}�np*�|�A�ROi��N]�u�}?M���޻uM�fV�}#��R�O;����E��J��*=��;����%���x��B��z�f��B~l���X�����������+]�zV���7����}��T<LOg)L�e��bǪ�c|z��(���j�|^�d��W�)J�|����K�"5:M�����$[7{٧`G�V$=����P��n��mՔf=gz=�����,�b�O��lj�>�H����e�D�����Iq�z;�}D���������`8�a� �X�sr�����"�]��ս&��?�/���$�§���[>�ƹ�_��(��A3�9�G��,(.(%������;��!O�v�I��^����X���#n{�ͿC��%J~J����7�p���&6�	���e���c�/j"OZE�g�Kz�sma��5ӱ�/$�5���`�8㌑N@��������|�Ow/j���1�#Y����V2��:�<Y�= �OY�5)���� pYd?��S�;g�l�ٴ?�"�Q�D@2�~)��5Q�v58��Q�W�.J�S��<�ʌ�:J�V����%��N�~z����_HO��f
�ɘ�MSQ3�'�p���qQ�x�K&��l.�M�Ge���o�����z��/j����jx��8��i�I��1���侹��DD�.�=�����c��ҙ�R�3	����K�*z��P�&0�5e싢�5)��p #�q 4�C�V-���ۉ:����i�ܖ4]R�9]f�8"Ζ�Yg��e�E)�	J��e�F0�e��$� F�a���b�R�3��QےsT�
�������x�O/JOPb�r%�^�'�@Z��T�>��)�5)�F�jуLлDD��u��2���L��d��<��A�N���ui��^�K.�z�u��ķ�x���^�Y�Rc��Pw�����������D��Lw>G�toac�Fx���I�s��*���G�f�6&;=��a����E)�5'�/ux�Ҍ�J�eyH��n�!�E޿&E<�7���w� |'�i��f��l�i���f'<$�y��Q�^K�-8h$��N�6�Zy���qj�T!d�L����(���>-&&��("N��L �g� ��CP7/�T[�
����n8e�W9�e�1�~��D#�H^�_4�_SD��=�	�u9�ʎ���>�4�.�����"�!�5���4m�Vy���kg}���g͇��_"�������MV����S�� {.
O7�2Nwl^�C����*� ��3.
ã�������������}2C�W��.
 �ޭ!��R�!��j_0�����_Ĵk»s_�'�AB��t]'inن[p��C.x;Kq�Cd��Q�/ʰSϏJ��v��B��˴��ޯ	^�nU�l���kÅ�c���3�m�>��W�6���Cd)C8师�~Q�&�:�#��8��u��K5ze�a��a|1s����</��٬�����-L�6�Q�d��{�����"Z�%3�.x���rD��d���_ďk���,�4IO��Ձ�C-����gMl��g����3�X��v�X��:�F:a4�܎?�%���L��ؤ�_ᤶJU�
�W5���� =��f��`�4�h����"g��;����<��]խ�wI�|��vq��iG4K�2��?죕"νi�W�V �s��Y7���"g�iF�YTESp��cM�3s�O��*@E"�a�AtY-)��c՜�H߭��r�V�f	n�jK`	�?b�jO�o}��VdsM���C�%���NM�3�ey������:���i���r��]響�R*�0a$m�c���F(B����V�Ԙ��6��I�Y���AT��6~�t�F܇nz�F��0a��R�GR�YQՊk]�������_��w����s�c/CvV+ir-�\�����)�[;e��j�-�X4W].A��[�K��;�/ֵR����'��$U���_�`�?/KV�Z�M�E	Ϊ~�8��<|l~���j�s;�I&�'�]�G�l��ì���lU+AC���~T�z�0����0]��V�������$��7A��z4��+�Ԩ��(^ݏ�� ���?��L��*_��������ƚ�W�\��}�1K.��$�H�Kd�j���1���}�'�Y�qخ��םbDm���g~��5	�e)l�j\|�g���u=ư�.$�- n_����y>X���:^�KQ��D�	���G���9���]��P^$(��)Gݺ4�I� c��~��p���F�ΖԳ��%�~<5�քW�$�S ^o���Ze��_���W܈l���N~��f�lJ��h���9�3��m�X��
��E%,�.��ȿ8�q�����xj�>�n�Qqە �����8�[]�#)YT� ^H�[ �|3�}��;� ��eN�F��}�|���}����Q�%K*�����8v���؟W<�����z��Q$�z8�.`WH�U����K��f��쀍�Dw��>��y��a��v�u�E�ono������s^��4�*ͲaW~Io_�tzJ����.s��ȷW�����B6:0]���;%�Z섊��Y��*�2�A�Ίa�o���ζ��Lܯ*ѻ���Τ.@	�J �����K����%A���uz5J+`qnu�v�!�#~qn/	"��A�_�ۥy��s�>�h G�%=Iz�?.	"�y�o
�`�ToxT�����+�����L�z�$2��|�����$3y�K�#%}Ԑ�N���p������K��'>����繦ǧ��;Q�	�5&�ﾏ?"i�c��;�$��$0���&ΠP��z>�)5�FzX_�7�����%!³�guT�x���Z�]��-�9<���y���>F8���t>�~�bt)��F4i�l�sª�R�z�M��|O�"���5�5x��5�猕�0��'���    4���VCb��1���.a���미���
R��$X���#>�`���m�b�sE�;a�ղN\WBA�*oܛ��G0[�]`�����|.k���׭c3�3���<)T��ח'����W]|��A�,��ĕJ�o�%a�3��d8�$���nݠ�A鈵���+���2C�+���\I�'�mm�T���/	3^�Ч�<�����\�$`�����/xC�)�;U{����h���$��\���(t.�/|i9#�v��������丣7���&\��{I�}�'��m�F!�
� Rs��B�I����%�ʫ+b���(*h狀��A�o���h�'���ms+����O&���W�U���.�s����gCzK�����<*��_қ&�������m%	���Ѹ�A��L�`F���A��{�?,?l��7���Y� ���C$�!���k@��z�����.ޛ�}��_�mX�KQS��EԲ�V���`��[PH���Sm��=~b�"v�{���Q�9es�������dw��� �W},�Fnm|�������B�_aC��_�+��'ߟ]C;� ��]җ�cv0s�Rd��ٗU��ᛛ�ѓpk�AL:�c%[gl��h�� ���,6��:?�0�c���O� ��٥�՛AKo�M�52^���}1�պ4$�S�1��F�g�����]��9�O�K�hhu4=�V3,=�Z��)~�L7`O���2P8�z��w_�bC�]4�U�%�u�Ss�u@n9K_���J������w���=��Κ��� ��$�dϺ��_"�r��$��E抶�u���vv�k�z2+�T̬���/i˞�!i�y�C+����|Ӏ��A���m����'͚��i�6��W�ɵW7��v���1�"H�^='x̼�J�����1��K[)թF�U��ϰR�֎W\��_mW�eGn��}���<����?�&��U��Nm��(@���l�v���1aa�i�����Jj�v�� �$.���U1 �1e�b���~(����D��6�R܃�qz��Ǯ��I��Ő͒��4��7���	�󸃨��� ��ĺ/&�3UDS��N[{�
!QA��e�*EXѵ8ZVX��h�K
� 4~.��Í?�����j��"4~4�`pf��I��+���Ӟ!���8�T~0Jًx�����Mm#�"�����V�L�Q��k��Q�ݾ�ݡ��s�gs^k��}� rm_�v]Td���K(��mf�f�F΀g`�T����~��b|Ɗk���T��j�����s�-*�ۼ��a�Œ�c#�Z� |p��`�d��q�-sZ��5��D>���ύ�-���R���d)j� 5�YF��|?D�~���ФaO�&֊��%����+�y<o��Q�x���"2LokMz�Q�p`��J�UA�Ø�ٚ���L[��'��?�@7�^-f\
8�4po�s~��
պ�{q�`b�YhI�3�iMz��߫A����`B�j�}�$z��d�����T�U�������5�B���nrf�
��d��O���88jew���kl����?�WE�"q(��-
��N��	B2`v���9��������>�	�jAj����k�/�s,g8���"4���:%�U�O��|@�z�_�.��U:e֍e+����H)�sQ���*%fA���[�u�zW��l�/S���
5E��*ӤĪ.� Fd<�q�g�TrQ���f�:Ο��~U�+��x�&b�o���s�-uU��8�Z	�������{����{nٲ&!,N�^� B��!����:������F]S�q�A���,\j�P|���9qh�LLO�F���%?4��烕E��}M bV�N�G��h I�`ycL34����6d���saO/�gdQ��X@I�¸..��p�
#�^I^���P�[�YUJ;��e!�㚄�x�hł	��4"�b^���%ʴVG=^�p0�{C��E�����ŏj�M����q��!\kNDWۥ�7�[�\�_Ce��Ae�I��s�-� 8�ly�,�Pr T(��l<X����A�u��؂G���؛<�k�*= ����:D��]��§`G�izΌ ������W{~."-�}.yV˒"�"`ԋ��>����hW�~BAϵܷ�P�\C�쳲��9�ןR��u=�*	�o	��T�K9deI9�O���:���z�~�R{�B)/���k���T��w+�\�Xq6x�i�%C�d`��f����v����y�!	�n�T'�������[~�F�~B�u?�螹X�B"q���c�S��s8_�P8R�%g�:|�mE$�����zq�yn?d\nAK�j\���U�KX�U��������p$�X�ê�`j���V�,�>���������K(�0�iX4���g?Leq1�3�]�`:�[����sٝ����i���@i�y�dM+����4�z�j�s{�Koy�k~	@��^,��e��|ڏ�!Fjf�$�}��H��)�h����i�z�-�[�O@���}x��n�E�fY��:�M�
��1�j�`�񇰕I��<i��<x����)k�ږ1&�>�"���c.�ئ%�v���#�Q9��u}����C}A��øW�G����)X�Uʳ�){/�|K���;�����y~OE���~�����R�j����h������F�LQ0\�	��d�|��C���xհ�@{feqHxZ�=��@,��V��ED���8����Ma�z�z�!Ex G<�s� �J��3있�)\F�AR�>�M����~���"<����E�
v-��>�C4���!�ea�e�@a�i�:_�H�m� �ű;^UV�v��� �[�9��:��߃���9�[e�����?8�Ϙ�c��"���r��"k�^�����}.,p/��+�Y�<l{,�������}�6Ҿ�x��2��#�N�źc��	�a��a��
a*v+.tv��f@#�#N����0��`H��@[i���~`����I���D")�)�)k�����!,Y��g���g
5�%��k;H�J��3�1��-8Xo�YD+UU��F��ͣ�g媂&+pt�p7�.����l��϶�.�+�S�60*6L�.�g��V����1 ��,x1Y�g����mn<�4���ť�0j��f����gn]�1e�@��zqOEq)��Gtpp��n�O��~�a���y��H)�
����9 ����,RXj��]��d9���L?��*��`�:��n�H�&��]?���xл�{=)	�J�q��%i6E�aJeP���w9��53�̱��^�*�g�c����z���df�&w*g�3��9��� ]�*]1��J���0Q��Z�1��~\Y��}R3�3�ɮ9������ү�ą�/&2U�L��!�U�1���(�iw�]���xj�Bv>�ٖ@q�߇�0����)��ͩ�p��qt����1S���e�VS�߰(V��1�=���ƌ�g���^{�	TН�(V��#ul+��z;�9R������-���E�C�:,ڒ|њz�n	�B?�>'����B�u8�4��Y���.#�\����?�3ߊ�lo����Y|l'R�f����b���1LQb�ޤ�4��:B�p���Ñn��P�wT�nf(���%$�(����]o����Ia�cˑ��[���U4�VիsL$���eVn��&va����Z&�af����N���ȇ��R9�6&�/ &�Icbb:��IJ �u�V�i5lY�w�C������ob!"�wgU�XcLs�s����6�_��ն͕�)�9�@�}��|/��)�L/��h�Ⱦ�I�s�^Y�AB)�M1�h����ƈl�K8�캧�� 1,�q`�U�>��~H�2�~xVƸ�_�	���9�ˍcI>�s{*���vl.�~9��!�&�-��6�Ç���D.c��%1�+�]3��S�O��Z�8�<"�����Ð    ���U��8����	{���1]�dD��ϕ�D�?���&�T">V�.�8H$۱��go�z�6Qr�}xj�b��|?$sL>1� �1Dj�tS�k�XY�G:�c���/3�îkgf����66��Τa�k0D�!��܏�5�r�,�R������u��E^����؏��̎�%�aOՌ1�Tڐ�ߋh��g?`�}�4FB��3|�pٺ �����1��#M�_R�����o�#�x�O\�p�^D5���U*zY��?ԥ~��c
`;���elqy�Qڗ��b!
)>�w�z�_Dreer��r$Pl)�PAQm>�+Ou��<���1�IE�w��`[֯�{�=�s�!j��v�7t>�6���2�=�Ή�3CrnO%m��\h�0�	�5~�O05�0�yS������-�N�H�,��Fo���^������~t�������2TXv��ك}�?D���6�Y�AK�`�_�Zq)������6�w�}z�X���Q�*8� |4+���!j��q��acL��?�*$`I"(a���/jt$�̟u�԰h��jz<f0M������no|ZY��#�����TsR5����f�y�����_b`��P��(��(I'g��qKI�rg�j�l���n*W�ԑU5H�O��k�D��ͣ@���C�,u,{�^Q����]�n�ڪ��� ����B\Ț�ʪ+��2����Hڪ��Ԑ
O��k����D��	*�3�y���z۱ڱ=kɷgn"����0��z~.���ͣf���x!��>�S-M9�B���I[���?�:�s0��c�=����1�<�!jg������`�w�2eLtf<(�2x.p���x�1�DQn�g9�+󷺖t��g�C2�dK�� ��J?�ޘLgԦ�5¿Ȟ���dyp_e�5���������yͣ��a��+ �{
{��BY�Ba�@���*��TV����9����5���L���=��ҟ�_�/{�@o��]�?����*�ܞ�j�:爽��7R�M��,�����_�}x��!q�OXr*�v`����l9k�|�|�{. o+��*S�c)�2Ŋ'�@���E�l��l��8��������Xk�-��ӹ���:��kaE��!r6�|X�˓<�Ghn��dY>{��@A3��]��L)r| �!�ͽ������Ц"��B7ʸ��
5���ކ����,����B�L9����z�@t��*�����,��y/=���x26���5ND��u���u��f)ڶ�k"�Ndυ�xa6X_/�!�g���U� �.;{����#����@MkL��V��~��\�ʶ5k�<�l�������,��߼�Ԛ�s=3>��T/�:%�G���V��~��O�Y6�� ��e��4<<^��r>���`����k�%2��"�|�{�t9������U���g�2
)F��&U������'����~ �(Ɠ�V�R�
�τ?͋�qY>�}/p�A���ux�If�����+������_����)!+ê�BW(�`�C���E�C��^�І�Q9��P��;|��E�;�����~�\i��J�9NG1d �{Qs����^�}Q>�}/=<u���<�й$.K��T�E�R��~�#bG(�7Jf���鸹0f�-5p�s�-�g��Ti\Z��-g�r���s�\���ٛG�sgBn�*j���TT穑��|�֣ftk2�����ˉx�$�֋�qY>{����w����g�2ac�a��;��|�k�]�0��3^���i���I`\c���,��q��Γ����DFB8�S\��{���s>�Տ�y���=��)�]g����<�,�g�8K���B��>�cM8�.��\��,���B���/æ%^e�n<!�}�]�9Q>��c!��Y@�����'8�	�(śo�E�쵎��s�c�85[v�g6Y��z��F��u�	�� �p�R`����Yv��:}9���p��-Dm�����g�B���8�,����qÏ���fB��i��6�����\d�l�v�p<sD����3��5��a��������o<�2o����G�x_���1:�q�����H��q�l(k;���l�أ���C��~q2���42�:��`'�y�3�v���_��2�o�$K�]���/�3H̗���{	�TX�cSF�t�=冣������uY>{��} y �L/'C��:XN�(6�s�/�g�~���f�9ߗ5�`;ǌdʜ�{������b�@�"��l0��<,�J9�o�_��5�t[yu�Zb�>E���iY>��/5PV ؕMy�����e0Ω����_>�K��;�s�'�4��R�>ͅ]�峷��&�>G
:����*PPK��^�BY>�����ўj��T�u�@�� ��NZ��~�cv�+NU�ӕ��0Ek����<.%�g�<���25�4S4�V]WPp�/4D��O<�O��i��u�x(x>X�������ߚ\O��=;�"���ʞ"��������:
�*����V�6]����Μ3C�˽��:�g6T���������*�K���~�B F����j��L��ɧr����������!���=8��ueyERG�g�W�"�!�g��Ы������0�@|�9����s��=���|4��f=���!Y�������}.p�c(B��w�<��<I0oW��.�g��H�EWae��L�i���(�ߞ�ME���n�+UcCi�
.���0���.�|v�u�Z��j�;��R�����i]�r>{ߏ�9O����xJ=s,`b�TD�r>{�����F�b����6Zc�ח��}Q>{�9��X^�~0�i�䟵�l�E��/�ᕥ�p��;ދ��sp��<���|��cp�}�>�S��yzM��J�����u�0{R���p��4"ꠋ�G�n>�]G����2+��U��ʦd�5�;��.�E����#g�Hp<��F VD�
�ݫ��������@=�3��5'*�嘥F�C���>Y����C��Xwʄ%C�^�*c�ngJ��ߊ��{?Zx�����}	F�����ԅޅ(���Åj
�yd�L��1�H�ſ$�v�+�g�uL�LO	�����i�f�QgJ�'w�_$���om�cR�� ����G/.�#X�w��[�H�V���X���e\�M�� �E?�(����7pژ�Ä쇶�NO�ŷ��y�R�����j�a����v�����ě��$���Gm�Sv��Ƭ���Ԥ(gS]�x/�|�^����L�5;�3Rc����rQ�'�g��JXRgH�4���&O���V���Q>{ߏ�u$�Ԗ2���O���p��T����ç��7X����1�[o�+����(���m(�2������,��'�����b&� wiKg­1�M1.��������R����d2{��c|5б3��$�}�D���_2W����5�قx.�)�'rnOE��?2?p"F|�#ቀޑ�Q�mGI>{��L'�oL���8�b�����E=�(����X�R �
�<\\*�D0���x@�q�̢ţ@�x�3��f�a�/>�d� �����9ƴi�H���\>�C�Pv�pnOE��m?z�� �:4]���t5�0`����۞�P� ��ʾ�l�0I�]s=�q�_D���o}�K�	�qN|8(�\�~�u33@����#{�q9d2QW��I3�7�}�^��g�uhcJ�0��Ё�7,�6��#�]ԟ����~���>Ζd
��������n7�c�|������rf�^��@ 0)�aF�9�.�<%���̓����x�Gc�@8/�~0����}.�tUA��j�W��{:�E��$���ɍ���0�>��9�Z�/�?���O��I��t`NX��\[�7}�|����7�d@��H��2��J�ZWX��.�>%��mO��q��n��	#a �-��.�R�|�^�l'~5� 'p$.C��$� `   m�8H�����˂#���`@�7�1�Z�/�!�go�_g(�����6q��ik׬I�|����l���b^�y�5��4�L��ϸ������/`c�     