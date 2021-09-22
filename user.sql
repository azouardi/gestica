PGDMP     7                    y           Office    12.2    12.3     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    52635    Office    DATABASE     �   CREATE DATABASE "Office" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'French_France.1252' LC_CTYPE = 'French_France.1252';
    DROP DATABASE "Office";
                postgres    false            �            1259    52683 	   auth_user    TABLE     �  CREATE TABLE public.auth_user (
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
       public         heap    postgres    false            �            1259    52694    auth_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.auth_user_id_seq;
       public          postgres    false    217            �           0    0    auth_user_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;
          public          postgres    false    220            b           2604    52894    auth_user id    DEFAULT     l   ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);
 ;   ALTER TABLE public.auth_user ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    217            �          0    52683 	   auth_user 
   TABLE DATA           �   COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    public          postgres    false    217   �       �           0    0    auth_user_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.auth_user_id_seq', 16, true);
          public          postgres    false    220            d           2606    52955    auth_user auth_user_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
       public            postgres    false    217            g           2606    52961     auth_user auth_user_username_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);
 J   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
       public            postgres    false    217            e           1259    53146     auth_user_username_6821ab7c_like    INDEX     n   CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);
 4   DROP INDEX public.auth_user_username_6821ab7c_like;
       public            postgres    false    217            �   �  x���[������_Q�uו�0��(�
^�INPP�����VU�˲Om�!��1ƘsBP9�#����=D�*AyUCo�i7������t�iP����Y����I��agSH���j]�`ƛMc�� �?���W���e� U��u��H7�J����,N�]
�����e����|3�]�W���18��Z/�s���[{8k"�)�ɢ��Z���R���D��@�3Z5�ZqV]�y)`L:�__?��G�Cȍ�n�	 ������0�ʁ^!�cVP�\"w�s�3S�v�vh��Mִ�@�YM�b��#��%C�`�Xd����P���r�c<z�@�N��)C��q8r��H����(��@�L�a���"f�l]��r秩�w�Nuw�7���G�E[�u�E�PV8糩��1��Ӱ����?1x���w��J���"�N����������$�8�����_�m|@�x�=�ܶt��*�6�XI����b�&�M�z0+�v��kŦ/i�=�̔|QKu�J��[�|�}@���q��"��N�De�^�F����-_�LchT��6���e?�
72�}���;��|0fxm��zj�T�"p	pF�dC6����I���	0� �w�Aqi�$��\�`�-0R��%������1���LMu�]���dM!�����v(����^�	)!o�>K/�Ç8��{��\|�}N2��'63G�p�L���Fy��*� 2X+���{���X�'a�8��,X����X��V��aK#���u�K	�w;���)�מ���w(�ˀ���[�xa�Q��������N�byF�mRE���0 6�G�ˤ{��90K����r����{"˿>5F�4�-�b�$��4MS�>4(�"�0(������c��26{�빒��쪨,����E�k�JV��n��Xx�9�D�H�T�ZSQ�4<bP|���g����!�������%ћ�/�s p�]�c�>�:a�&vO9?T2�|�R?RC�*���Pϗ���*�a��XO4/| �E$��up%�m�	y��;1(�*P��헼�%��{������~q.��-2^���4������֭��[f8������5�w�9�?��Z�mto��L|oU�H�U�"�nSUu���`�y'?|%} ������s��\���H	�먭7��N�[�� m5
]#�c]�Mj�ؾ�{s�S[7WQm��۽u��P�� ��>�ӊ�o�]��W�z�-�Áٽ1�:a��rZ�{��_�&�ئ�t��*�i�X�2��
%BF�n�J��C�#ͱ�L����c���4��ݏ�uPn"�{LY�ok_�2�Qo(��?v��1x/SnL���(�w��Wxyy����     