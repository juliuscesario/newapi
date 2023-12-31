PGDMP     -    /                {         	   starlight    15.3 (Debian 15.3-1.pgdg100+1)    15.3 (Debian 15.3-1.pgdg100+1)      k           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            l           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            m           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            n           1262    16389 	   starlight    DATABASE     u   CREATE DATABASE starlight WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF-8';
    DROP DATABASE starlight;
                juliuscesario    false            �            1259    16466 
   activities    TABLE     c  CREATE TABLE public.activities (
    id bigint NOT NULL,
    activity character varying(255) NOT NULL,
    event character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    browser character varying(255),
    platform character varying(255),
    "ipAddress" character varying(255)
);
    DROP TABLE public.activities;
       public         heap    juliuscesario    false            �            1259    16465    activities_id_seq    SEQUENCE     z   CREATE SEQUENCE public.activities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.activities_id_seq;
       public          juliuscesario    false    221            o           0    0    activities_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.activities_id_seq OWNED BY public.activities.id;
          public          juliuscesario    false    220            �            1259    16459    cities    TABLE     �   CREATE TABLE public.cities (
    id bigint NOT NULL,
    city character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.cities;
       public         heap    juliuscesario    false            �            1259    16458    cities_id_seq    SEQUENCE     v   CREATE SEQUENCE public.cities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.cities_id_seq;
       public          juliuscesario    false    219            p           0    0    cities_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.cities_id_seq OWNED BY public.cities.id;
          public          juliuscesario    false    218            �            1259    16391 
   migrations    TABLE     �   CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);
    DROP TABLE public.migrations;
       public         heap    juliuscesario    false            �            1259    16390    migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.migrations_id_seq;
       public          juliuscesario    false    215            q           0    0    migrations_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;
          public          juliuscesario    false    214            �            1259    16450    pii_data    TABLE     �  CREATE TABLE public.pii_data (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    phone character varying(255) NOT NULL,
    instagram character varying(255) NOT NULL,
    school character varying(255) NOT NULL,
    city character varying(255) NOT NULL,
    lomba character varying(255) NOT NULL,
    event character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.pii_data;
       public         heap    juliuscesario    false            �            1259    16449    pii_data_id_seq    SEQUENCE     x   CREATE SEQUENCE public.pii_data_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.pii_data_id_seq;
       public          juliuscesario    false    217            r           0    0    pii_data_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.pii_data_id_seq OWNED BY public.pii_data.id;
          public          juliuscesario    false    216            �           2604    16469    activities id    DEFAULT     n   ALTER TABLE ONLY public.activities ALTER COLUMN id SET DEFAULT nextval('public.activities_id_seq'::regclass);
 <   ALTER TABLE public.activities ALTER COLUMN id DROP DEFAULT;
       public          juliuscesario    false    221    220    221            �           2604    16462 	   cities id    DEFAULT     f   ALTER TABLE ONLY public.cities ALTER COLUMN id SET DEFAULT nextval('public.cities_id_seq'::regclass);
 8   ALTER TABLE public.cities ALTER COLUMN id DROP DEFAULT;
       public          juliuscesario    false    219    218    219            �           2604    16394    migrations id    DEFAULT     n   ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);
 <   ALTER TABLE public.migrations ALTER COLUMN id DROP DEFAULT;
       public          juliuscesario    false    214    215    215            �           2604    16453    pii_data id    DEFAULT     j   ALTER TABLE ONLY public.pii_data ALTER COLUMN id SET DEFAULT nextval('public.pii_data_id_seq'::regclass);
 :   ALTER TABLE public.pii_data ALTER COLUMN id DROP DEFAULT;
       public          juliuscesario    false    217    216    217            h          0    16466 
   activities 
   TABLE DATA           q   COPY public.activities (id, activity, event, created_at, updated_at, browser, platform, "ipAddress") FROM stdin;
    public          juliuscesario    false    221   �#       f          0    16459    cities 
   TABLE DATA           B   COPY public.cities (id, city, created_at, updated_at) FROM stdin;
    public          juliuscesario    false    219   	�       b          0    16391 
   migrations 
   TABLE DATA           :   COPY public.migrations (id, migration, batch) FROM stdin;
    public          juliuscesario    false    215   &�       d          0    16450    pii_data 
   TABLE DATA           r   COPY public.pii_data (id, name, phone, instagram, school, city, lomba, event, created_at, updated_at) FROM stdin;
    public          juliuscesario    false    217   ��       s           0    0    activities_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.activities_id_seq', 2068, true);
          public          juliuscesario    false    220            t           0    0    cities_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.cities_id_seq', 1, false);
          public          juliuscesario    false    218            u           0    0    migrations_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.migrations_id_seq', 11, true);
          public          juliuscesario    false    214            v           0    0    pii_data_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.pii_data_id_seq', 17, true);
          public          juliuscesario    false    216            �           2606    16473    activities activities_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.activities
    ADD CONSTRAINT activities_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.activities DROP CONSTRAINT activities_pkey;
       public            juliuscesario    false    221            �           2606    16464    cities cities_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.cities DROP CONSTRAINT cities_pkey;
       public            juliuscesario    false    219            �           2606    16396    migrations migrations_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.migrations DROP CONSTRAINT migrations_pkey;
       public            juliuscesario    false    215            �           2606    16457    pii_data pii_data_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.pii_data
    ADD CONSTRAINT pii_data_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.pii_data DROP CONSTRAINT pii_data_pkey;
       public            juliuscesario    false    217            h      x�����m��x]�)��Y�����]�@� ݍ�h 7�OŮ��e�N'��"5�OҤH� ����4�DQE����������������_�����	��_��/��n�W�Cc���_��矿���������?�����?�d����}��D��j�!���׿�����������ߪ�/���~���?��l��>w��~�����?���������?�'�q��/�������o�_2?������_�Gp?�Ebo�������?�w�D������o����g�[P�?��$������&1}��q�}��Y��0��d����$��7������۟�����ǿl�Y��J$��p�
��HL���o����~�U��1����+��CWL������[�"�i4�\��4�I0ԍ�Z�H���hL��]?��w���#XՏ`�\�j���f�+ڭV�b���~��/���~��_8�wv���Js���~���sQ��YaE�6�����D��6|�?R�f���R���d����`_$v #lוҾF�+3���2J��XSL/'lە+����\�*$��g�����c~aˮ\���������W���_���i�����W,���ILïX���W���_�~=a��>x���'��q�i���[Nh6��~��2.�nݢ+v #�fs/Nk�4_+�~q�s����FB^��Ec~yA�3���ʿ?��^�4b~yAۼ�:� -���7��VC^؅�e�*�Ր�+�~5�j�+���u�j���V#U1���Q>OcZym1bl��ĝy�L����Jw�}�؁���!M����0�h�	�c��v�+�ǈ��E^�8MT�@F�����؁�b黷	�؁�b��%��11���[Z�6�+��bӺ���\s��c~i�#�$��9��:ry���(-u��c�;��{���i�WJOb2�b7xI���;��;Rα���H�)��TÔ�pT���l��P�������j(V}Z]��)5�b��ֳcZŲ�kĳa����>��b�d�>/�p;�Q,��\�u�@F���r'ݱy��k=q5L��ߒ���릠a2��/��}�b2����ݗ���I&�& .-�����}�>�Hɖ�u}ڱ���\F�|�g����>�)����;�
��)�lŔr����-ˆ����ъ�)E��1.w:�$]�V^��ފ�i�v"nuػ���aʎ,FH5ᐆ�C��ɮ�+�b�ZV94󚍈�ʉW���~ĭ5d�$?Z���hA��S�_牊�
ޚO��.�{~8��(������S&)˥2���B�TMaH���\�C-#��<̯��ة�dB+hUcl�S$�i#K`�a�C��2o�S5ɎXȍ�4v��)����a�j�'Ry=��jE��^3�S5�b��z}E�=3ZY3��Lc�jV:� �y�f��a��t@�-��%�S-����z�Ӱ3�U�U++�&�5��l����ء��)�y��l��/w+N���)��3SHn;��M�	?�uh;��$g�Үêؙ��d���PJ�"�a��cCυ����!)���YQ��1Iqx��c�E�:���I������Ę`����v����b�L��qC��}l(�������m��|=5���>�Rё+w�@b��EH�H��6;��B!��]h؉���XI�	I6I/�aGB�M�eZ7��in��������6l�F��X�[D$CP_Y�S�H� 	��Z��"����%��ZD6@Hcj�  �.+��«�Db��&F�p����47L��b�,Gp��#Yô�p����:��Sx�i"1Q�lg���Y�)i&1�����ZBh����tb����r��1������K�q�t�Y*:��8���& 8�䷎��@)�-���`Q0���b��ݎ)z)���;�U�bJ+#�<Z���Db�������-�/�	'�?`ڕ�g<��
�CӀ��0�H�-�Η���rL
� ���q�I�v��.���i�D�]�����ǩ����3!�0\��0�|~�����-ˆO���v���2E�.��93�i�S�2�Y9ݔs7`B�a��$C� �bA�����eT�̷(�_J����aIVY�%�3�Ȼ��� 쀉6;�O1���2�i@��5�HH����&�`�N��|�J:'K��)����'���LzH����Lb�R6��! h�ciu���c�;�/�*o�}"1���ԼHw������6��'Jv�u�j����iIL�!��w^�i5�E_S.�uSj�ɑ�o��+�Րֺ��U&1&rb�1��_���*�[ldǴ2�RG�Ŝ4L�!/up+�%R1��bﯜ�ƴ:B�?	��k4~��ĩ���CbZ!S�1�����K�YE^���.Ǌ�4�%-y�w�IL�!-�z�}��VCp���Z����D��O���Ǝ���NI�HJ��-\,�LbڟH��_1��� �Ր�]l8��|�����hH��������0�8������|h�R�/X���Le����O����o9������o���+[ 1����#���NA��ᠳn��)H�;�Z�Or��֠brY����3.fS�+���HL�Bh����!��CC�8�[NW7��O**Y�㩬�s�S+񩃝ѓ�^�H[c崄�.��Ա�-\�]�A��R�گ�s��czv���P�v�Q0e��Z��/�cl��t�0��,X� ks���������B�n��8�+"�h�!������ ��!�ܐ_� c��O�C2k������]�qE%���Yw��1����H����'�v/wB�֏��iL�l�|� �v��$�nj�S,��.3�O�X:����)ˊ:��/;1)�IL�s�@e�˺�j���%J{g��K3;����|��y7a0��/���:�j���2��Y)~����������E���a*�>`ja�a�R#L�����زf����+;�k@Y��j>��h��ٰ#)�xH_�:o��o ����tL����[��:��3� IːQp������'|�!����$&��~�j.�2`
zi�#ղ�����|�zͦ�)��~cj�!1���d���	�SeS����I�v��0��pQ��<�)�����?��O�f��ߺa
%iW*��o�1q#���B���fS�K��k"�}�^Zȕ*���^���׷w�o/<�d�Xg^�����N�Ze^���<��a�k������/)�:��xs���Iw�`q��:/��8)WjO�����U[),�I����\,B�ꭔ��t2pc���F�ݫnz<�zN�.��kȅ�j�K9�ߎO�댑Ķ����Z��7��oT���H>scD�Hl��+��T��+�[���m�ti��J$�f���<�SGY|v\�s?L 1����!{}	quL����*���2L%"-a$34�P�+�Mb*���d�W2ʯ$��K��,�,��]��T��lk�Ob*a)c2���J@X��(),��c�|I��J�iL%!,里ö1�"`��������b}��/�(��N*�傡c*)aa�J�J������������?q딭�J@X����57i+P��?��{���W����������+��_�p��J*�L���:���C�z�cX6��f��&1�X\�O�c����TRF�3$�b�?�l,U%�1����@b*v��~�"��7^�V�I$��"t�Xjg���RL-'�����~nD8`��|w	��.S�Z��Ujh��|�M��L3�x�����bHLwW��d�����0z �*��*7�(7vd�aJ~0>�2��U�G(����œ�^G��w�u<ۧm����c��RD؍��\�x����r}��>��4u���*8��3��Ń���5ŀ��dK���"1���W�9�9`�J�
\s����s|�?O//���V6z��:�+ƤWa����*�1V,��X�    ��_�����
�X��4�W�W~�{c�^�=�w��PVL�9}��[*e �r��2YcU\3`������R��MЀ)��=N�LAo��w�+X���鎍�������n��En^A�S/��]g�$�Wn���'1>��|qW?�*:�2���"1����M�_�bza[��L��W�댙��ۯr�+�jU:���ׇ��i�kプ��u��I�ȉ�><�֩�0�{毄f9!u��W 38�_	~�p����2��Ǵ�u��WCL���U깐ʀ���(~%t�'�1��$ل��HL���p��9��S1��lt>���'=�B`pP���ρk���{����s�bJ�^�g�'1��x�(�Ce�dA�umT��Dz�@�`I��|)�R�[�Wö?C��?w�*&������2�jGBGcZȋ�b��/S+�C��V|�m�ָ�V����W��?����Ɏ9�ZB��ƺ
)N H�.�ɋݯ��L�s���h�(oǔ�[ܭ����k=>5��B�bml������Y��?��5�d��g��D�����k[ns,|)�o��V��&�M������y9�wl��^�7��3ےz�τ
�Ķ��I	A*�̽����ک�)��U���O��xA�4���	�a��D�^=����u ��5�9��Z�	���������d[,�],~R�m}�mI��Y��,����j����a��7�I�s|L��־��ĄG�М�38K�g����ttL;.��e����c��l1x���^�o�'���W+���d�Ӝ�3�*�0��n���i(�_�R�)3n�d�����"��X�wBR��P*�%$�@�+���]��,����<��:��s���ކ^�,*�%譊�>��aI����!t��Đ�jH±�Ryb�hb�CjIL���u*Ob
z#ߖ?t�/������A%M$��M�Ա���!ڎ)F$�`��%��c
z�^�1�� |�^v�^����|�^�������'91�ҙ��@L!!^�?d��^S�h��]��/��bm蹃��HL�}���%��1��>���$b��2�;w�8�V��-�rt�Z�k���>����!��HLC.�lm�������W��UV����(�N;0~�U�b��p狎fe[�^�S�X�Ir:��:+&���'���H����k�����������B*X���rk��֘���
v���"11a.�La��N��bj�Dh��O���"Jk��~��9`���d!g?������=_�.~�j�S|����o][��:�_4Ni
����x5`��w��Q	�w�q����J���"�����.�<�c2��w���hL5��kIF _�S�e���EH�\�Lb���W�R����:[G�麦T��. ���F�ޞ�>(Z<��EC0�730�����2�i5���A��i5,�j|��e��º��߼bZ��-`#s���|�K`��72�Ψ��b@�t�y�H���:�:�*�� W����� {��|s��~'y�>��T��$�hd�utP<`�Z�}%���!9���Ay���`�#�1��j2�uP��*����"�ˌn-����ϗ��7�����΀�%�y��{v;����xO�7F�mWz�
��C��)��OW��0��d�{�T�,*������i#�I�M�wu6��ҋ����L�z��o�i�]�1�[$�f \ųM $9��:�o��?R{��҆��� ��
w��Ԯ�؁���?b��{��0椓j���|�I��CB�N$�In0o���������1^^��1z�*ʂ�m�g��������/�8?§�ZQ�"v�uېiZ���mH�p ��m؆T:@E�%r�1�m�ʫ�J�=�a��<�hCY|�`#���"B8{.?pǔ���^�KK��c�6�c)�5}L���y�w�DD8�C)+;�>����q\�,�>ٿ�[W�4��%���&�A{ �V��)������v ��ۻ��
2T�,s=y���Ȳkv�d�ܡ�:���HL�¯ƚ��zl�^�{��9�Hqԛ�T!bQ��H�$��φvl(��֤���.2s��1����m���2�8A���O��)O)�!]��a��r���(�A�!1����*a���L��w�Eʥ�߀�τV���_�a�_��]���=�iou�n�	�K�PĀmELΰd>���P>/HOɤ1Ob��q��|]P��t�4`Z��������S��ga����EOSh܁��z�s&����2;:�W�|`�q�@bz����P����^EG���9`��zB���.��W�ѓ�^E�C|��S�!��8ǢE��a� �ͽ�g^�*r'̈́����׀饜Z�Xc�o��͇�w�un�I(��8-1���pK����+E��s��cO��T�4��_$�Wɢ���aP/BV�1�X���v��\���vL/�LLn��e�씏zn�4����s��
��d�vS�Ȁ��$���]CL��w�;��"���'6�][�^E��윑��:z��c��'165.|,4���[p�3F���'11��l�EO������7=`z�|�V�㺖��70.��a�@Apz�7�S�ˀ1���C�K<��Ĕw4A��X��4�c.��ay�����Dnw�m��_Q�����S�	o ��$�����d��m��i�E���8�U�!1]04��z�ӳ�Q1e,,𙎕0��W���oS��wxPm&7|�t�à�_��P�ْ���g�exm���0e9��|��hS���q"�s�<-�S�B�1d�F���&�|ؚ���B�����;Qb���Bǀ�OP-���i0�B�O�Q��̍�^$v���` ��<؉��F��5M�DD�����۱E�������#����5�.�O*k9�������l�x�s3e8����l~�9`��}��~N�ΘF�j5�][WV�m�xP��Ĕ:�{P��T`���� *�y}����	a�?t�Ĕ�ү\�혒_y<hĎ�^��O/�}a����U���_X��SJ���=`:�(/s�[gUŔ��o|,B�OR��F9�L���C@�[�{U�f$���F���+��nlt~5�SJ��K��N��c7���P������1�p��t�Ū�RB��=��M��9�hd�	�����pc��U�[Uͤ�EB�[����G�Lhl�/'�bz�}��J�{��K(;�k2���6z�Lo>^tL����hL/�^#t���~U��U�`�/��U�oTZ�Ҕ�5`�m���_��7_��ؘ7�����W���B����ZAv������"�%��Q��
���/������������������z���y�Jȩ�@�gav��B=�κN��.)�Ã�f���bz�[������k�rն�­bg��%!g��F�w�g��=�:�n0+�\Xb�N$e��z�lN�N^}	� ��)%�D�{M�1��R���龊��.7�+ب2Ls�.[�k�&�����ـ��'� :��^B�$���OA��VZ1�Y�� &2�/�s+�I� Ǘ�w��.[����&dfkB����N�r�l��\Z�ȵ����&4�@h�K�!-Y�u^?@\�n�������^?C�t�|IHG������,���4�u�>�0��֫\�G2��d�V]N@�((�r�2yL��m����%���M#�l��ݣ+��B��Vu�,�~�eFL��#$��7�7���!{Ĕ���y��q+1�۸�oKQ�%� ��So�1��n��zW�H���e;�"�7[ٰ�y;n*#Fm�n	3�Z�\���l�eȈ�
ܑ��(��H�=�w��爉���"7泎�H�K�ʀ����9��u.z|1�Ӎ90#��������{I�1�7t
M��L���y��Ķwa�;�{Gjy���p���j��hz�-y%�'�Ĕ�PwY���-4�IT    �EC���0O��F�M��8&�2�ʒ�j@w���0�x@�g�\��eWz(�mI�HRp�ד��F�.��E<xAwYʞ;�Ӟ�'SOw�, �n�5;`��ɛ-{|������K��7Lx�L�PNɾ#��	�3��p��T�-�W�[`��;�Pha�dj�u�������:{���)#&S+�{㴯_��I�l�_4�tu��4M�<tΛ�d�#����3��v]�cZ,+*�ڲ/�m���Aq�)b�����[�e�vLS'.&����P�	M&1������r�u�yw�@p[���ybP�hP�:��<�
G����?�qr�Ln o��E� TB�؉��r��uU���	��CIc2��$_��N>^�a?�il��~pl�_�4��
�.<�)g��c2lt�����ȹ�a�mxm�"rd�X7a�N��@�|Y�,��Ϳ��m���ec�&�hi�c��ݽ���F���\�,D&,_>�|ʞ�_�Ĵ�SvD��aza5b3Q��k��Eb�=9�!@#�S δ����u�	 ��]�N�0� xl����*��iω��*B��ر����QG8;����Z&9VX&�TK�jFY�rC�Lb�h��l��3��
�7��,��qe��p"16PWD|._�ɭ�MD$�	��@��"��c%t�{$���;��3��z����#FLc��Sld��`'�a�Q��V�C%��d���w��gv7����	w���X�z� {���SF � ����&�׆I��)�&k�����ʈ�o��
�[�P��[d� �Y$���g��vw*�ezp� �o>-wL�!�������n.��NCp *�'F!5��
AH�錳��1����k�y�ޯ�{��Ǻ7vL�"\ <l�qD���{�w��vL���B�b�$�SP���:��P��8�2��NaWo�)�����x��1wl�t�^���Cn���t��=_/��G�{�)�9��]�T�8��~b�� ����wl5��L����O�#w��5ڈ�HY��N?N�;�T��ޅ�,6`G��Q���B��t�ȑ�5�|��uBFLL�x4���/�ݴ��3�.�
�V��Թ3������.�_�aʧ䑭D��1�{Ķ?U|� ��[TX�@P��cevC'px��$��/����7��Ȭ���AX���4Ly��Q ��Ο��Z�F*c\,R�x��	�L�Pf!!���d��cR&!Y��;u�1)'� �cO
H��a$&�]�&�$_tX�9m�b�����N�pu�y�>1�J<S�����]Ѐy�8ʊ��o`�Wl�s�@b~6й2�)�����e@��DbTR���X�Xl�W;�x:��Y59��)�S��X���π1�d���z�|9�N�_��5ZF8DTʼl>�=i�#�4Li����0{�d7�1��)$ R*�¹�����;R�,�Ǡ�%1��%�	�3S�e�<>1���D��=�I�HYj(1Mw1c������AO���,Ĉ1�joS�Բ�iS����$�.bL�?�8�AW��P[��$��ݎA�,>��_ǔ>�3�������	��x�@_yS6[���C8����8o>�-�[�R��aIU3mK�=@([/WjM����=�I��q��2η|��P��U}�buƛ�ӞZo6��Z�)��2��!�|a�-0nN�r��ϯ�*��W} aH�}�g��'�ɭ�Iؙ��b��j���������q��7�iՔO�O&1�k��Y����ʙ��#ƝZ��g}����EG�����*ƿ�Y�� dg%F�kһUR���Ԓ�`��X�(���_"�G-Tj}����F�	j�C�Ȗ/&�ֻ����c�c>j~�;�\Sq�ӽ
H�?`�~QF�c[��S��kw��y�?<���}}�/�Lbri9���ǀi��vg�pL�0���t+�'1?�x�Ƚ~�{�/ؑ����iL��O5�D4�!O�
��4��pKK�&��+��!�S;���=�{F����������xT���t�4䒫^�hLÿ-!T���#�!g�z�k����ߛ_jH��ܺh+�ѐ���F|%�1y+�oo�!������(�Ë���V:�9��o���C>���F�.�� �3�B�m��3���[���qq�:��2\��K���&�:��3UL�Il=��s��>b���TdSDԛ2\d�)�c�Ę)\~�\��`�p�tL%z(��J�<�k<QHJ_��5���PaK-*��]Z<�K�+�fׯc��^�ދ��l��{p}�e�GL?�9�r��)��{�Y:��SG�L-A���~czJ1u�4�i�؆ �������?Me����d�㳗��7ި$m� RC��&1�c�1�nԱ9�7�Gձ#M+y�"&�y>�'���3j��j Y�{9����*z�3���� �ב	dt4�W��	�]�3��U$o�aլHb����O�^�f瘖??���ma�܆�Ћ`�����xxV���ғ�
���`�HNC���7�1���Ղ�X���%�|�^E��#����;&��[&�Ծ��;�^w��q��l��WvX����x/����{"�2�������^:��3,,�W>](ǉ��jK"���d��[ �/�0��\��S6��p�ILxW`��-r��HK�c^n>¡�\ #����@b2��H��`I���n�O�,�oi�d��l��o������3E��5$���Hl��/�&�a
s�r3�}��De�|�������V���͛���L�-w�����n�HPr�$�W�r<Xטg��J�z�� ��U����6��w��קO,3 \�[�ʙ�hE��:A����j��בVe�$�W����|혐A�H��l����l���
����cj��/��9��uĻ��<fǩcj���ùf�tL�#,��0��V����ec���!Ɨ��r9�
�vl�0bj!a�W�yK�Z��F�{ǎ�����!�$��*��Q����bc�/-�]`%�S��	�����U<��)�ǘ��I��*���؁�d�ֲ�4L//م��浈^�u)!DP)}"1�D(�������/4�@Kx�H7؁��2�a���h-Úbѱ-�P)��a�z��T�"÷ �vR�cRY��E:v $<�/�-T-Y��E*�{�(�J��Ir�����Q.:i)��Ll����!�.*�A����:*��q\�j��~ #QG-ޅ-�xÈ`BoH���B����YǾ�_�6ܒ��Rɯ�S�K��a�N�#�>�����2^$���׽[_7�Z'���H|�x������1�>ܮ��F��V���IL�#�|�H�%1���B̀�MQ�\|I}�c��~,A�̀3��^G2�hhL�";�i���2�tJG>����^E()�8������R��ØIL��� �'�4״�$� �������լ��bz%�-�� k��*A�!�gi�^H �'~��x�ڂ���������l�^Ee"aw���F�8��~ݯ+�ב�K����Ȇ{FP�^�����LD�NKzD��zB��9��vL���#���h���ۗ4:O�-y�Jȧ��Ը��U�B�1/?ӫH�Cd|��S�X�5��d�G�M�U��]���r�N�V�U�Q�Oz��7�>�+3�>���EP���C������.A������1T�<y��(i*7Vm�|�!2�k�jc��DH�s+��N@����`��IL/��TҸ����S6*i�v�S�����(����L�E��*�=7`��d��!R.m5�`4NpN��$v�$�����d$c����~���P��tg1`�w	����,����;�k�Y���K�u�x�7`z/��4�؁�l`�������V*wLi	���t.�5`B
��������F��*v $�
�Z�z�d��Be�K؁Qh��y�b(�}����h�����Q:b(l!엌���H�EbB
�`~�4`2B��NH�@    Ha���v #6,i������@����)O|�d�XB��7؁L�Rw�yM��.B����2��E�빤aB�PN�n��*v $ۄB�WW���
�z/W�z�'H�V�N�?tJ��_�;�n:�k2x���KH�!�����MOa�����z�K;�����cBѓ,C-YHL��(G�,��|~x�Il?�֋�A��T���C����}����|IAd�Jǉ�T߬�0�j�R�!������Pߡ@���π��U&�S}��&s�.#m ��"�o)�0Tֹ[ƀ�(I�F)���[*�5� ����|(���%:�kF��s�Y���D�K<�G�0s�|<��tEE�,T�LH�3)!��8�Ebz�����Rl��2���ɀ�U�'N�iv<��L��'�S�b's���w��O_��Ć~3�",�>��0�P��9�IL�#�`���L�bU�m~�=`z!6��1����*��`j
q$1q�<.cVv-@�r8q����z
�g�����9�]�vW�W}EwjYy��p�)V;`�;<c`P�9ˎ�g4V¹�Ài�)�J�8�\sɬ�Qs]�j�H�W��c���$;��TҘ�����-H)S�@�R�L\��h"9t\�J���v��S.ע�l��هY�Վ)�u��l�X���*��{���.#ʠ {��ӘND����t�	�l��TA��d� ݔ 1`*�Ircs��t
BT��>��Q�^Cx���<���P��b�t
^��WF?]��NE���tG?`:�[q�y(#��d��ac{/�_�<�NE|'��N�ģ�K|,��Xھ�ߪ�Yh��<t���n 9#Z`,�yeS˰1�F�iL-">\��n���b� 7�����0�SA�]�7v����0�k��"��>3O9T�	�ke����
�sQ�S_Pv���U��|���X����I�xa �9�I�5Y��+������Z��|᧮�r�$�)�7^��Oltj/�q��x瑦K�S�\��@G�P켉�N�cP8�yb�v;���k�H�DI2
�3�؉�X���ɍ�-�ޠ���b'J�b�4���u��t��ι�uAU�DLp:k ���������?��y+&�a�N$�C���Nt�f�U��DI� �rO��;ѹ%����)�g�N��XAc��׫؉R:����Dc'��� ���V�@�l�,�m��:t�Z�SQ9�eU��#�����Iev���gO�c{��iL���Z8q�Ɍ��/���)s.��`6j!=cIL{���Jۼ�tL������Od���w�IrƇ�1����[%#'�&1eQQ�XFoJF0U � __��5;`�7�8��Z�>�"9B~�R�p��s�V�6D�%l椥ۧX�Np6A�a@�r�D����y��e��t�On�1G���ȂV���چ�i��K�杤�j	%��KI���X�%�%��R#Ͼv"��SU��;1`ZQt'�{�\��hᖥю����H	���&f;W��Tb��3�V�a�%(\�G*G���0��|~I�Mo��5х�h/!eg�Q�k>����WD1����e}E��e�I�vz�[���Zg{��c����`V��A���6`���ψO�گ_�b�����)����B�N�eǵ�Ęu\{):���j?��炆&l��Q��&#_�9��^f���o��$��+�W>;]�؁��K'_?��S߂Bbt#��|	��J�Sۀ��o?;_"�e��Fn^3�)�-�Rd'�$v d��ʞ�'��Wl	����3{�)_?Yb<&J�	�"-Ǐ�h(+�v��\O|5���p�<EP�@f_���Y;Ј���N��ۙ� ^­G#}/"�`)�OQ���L�h�ꎍ2�!�a/!)������؁�l�y���
D�8�Q��Lx�����CH�@F�m������K��\vJ;��^Su�u�����1a.�3`BR�de���p�M�>n<i,4�D��������B�`F��I��R�ر΀�������0��t�@FHL�"\�6�9�1���,TFb4�d4�%hg�$�W�@�ӯ�X�눍��}};�Ub�=;c$1��U�)���5�O����V{���eK���W=����PٛĘWBO{�|I4�V���47kHL{e��\���~5���2<oAN��Ԇ�����j���4�(�.񕆝iɆ��fSFe����Hb��w��.��'��D�GQ� +��v`)n����m�˥m��y�W��"`t������@�0�B~n,K����p�M�a�)�6CA�"(�^^~�����+��S��I�@LmH !s�a=`���.nN�t3}/�i�6��Y�w�Bl�������'������e)�W�&^���\`J�����DI�0�p�)r��xʀi�8l�T� !��h���I)�Iz./G�g�����?�m@�9U�Hl+h�O����+.\%�8U�0qp�ǁ��J{��	ƓH�u�ʚ���5��|&'2�9?z���������Z�� g#	�I�Q;��@b�
{?�<��4a�:>��5��'�ޗ��t�ov9�D��LfWc4�G���6*l��3fӫ�a�����ۙ�%�*�U_c��qd��]�,� 4�h��"1���������{,X0��`���0��L�"�F�L}�H&|��_�crJ�]|�%2.��ӫHv�AA���4L��v �1��0��Ƙ��B���H⺳5�7t�G���ˍg���tkjv�E�Z\��jL�#��t���2�*�6�jO&:k�:�b�	� �)h��'�J�#���p߬� �L�]m؉JT^rT���$:v$)< 봑Ď�$I=!$剭B�	d���ө��QY���uV�Dq������Ҁ��Q���&�ɋ@ΰN����H~D-`�.����H7���M�E�@��*�9_��ηbx���<�;��B�����$\pt����r�YIr �ӽf6b':A8]f8}m��E��=�b':QO$f\<�q
���E�Nt�!��i�D�u��5jҰE�*�)�r�N�p>���z;b��u�շ�ؑ�`�U罄�;�y�f>�2��C�$&�L4� d���k��z$��!l/X"������!^��u$�8��@Fh��H��뀩�,�=�)-��ٓ�4Mե�@���ҿƓ6�S;��T��I�@���22t	���a謯%��z�/%�Dl��	��2;){Y�|�%�&����I�����V-2l�1c5�{�
�6q���%����8<`|.
����Gc�7�o�b�:����H �F�����IL10�=���f5d̶��L�.#�ܐ12�I��U��̣O$�,�v��,!s�@dL�	Ӎ�) X�}c�d~�L�~a�2Ș�o�|I0`\�yIz�F����n%؉��*e��S^�I��H
�=�q�}�8X�0	�ڔ�t��:&��9�+d%됰���Cy!�]�^#�u ��c��^�����/
�ܦJ=�6�ZNp*aX�Z��"�Fٕ-MIv�Ty�>�L�+�Ò�1��-
Dق����5ÒX�h�V�XEe��Q�cZwbh���k@�d@n��lĀ�Z���^���%���-�}.m����p����{�[D��H} 1��lX�Ҫ�BXDw
�t>���e�SH�����*�!�u16L<Ru�fBuʛ�d$�)��W�d$�)�Ȉ�n�'>�&(�%%$B��>{>�v�@H8�@v���������'��4[/����s��S���!L$�I��Xb0���Y'KS�RαЎie��ڍ�c�"�"����ES+&�b��YD�����߀�e�W����ˇ�_^���b5;�٧>7�9$�1��2�Q��ˎ���5`*�M�.\+����	F��1�4�f���S+(�j6���~\�ᷜ�θ�;��N@����S�p���f_{sbޚ�ԑ���5���o9�LG�S+����sA��    r�=���yVL� 	�uTL+��t���v]1��� ۺ-TL� 9�Ә������(��d	�v�v(%D,�Χ��۟
�����"�c��s|�cj]UI{�U���x��'P���Uh�G�L�������|\�E�-E�S������A��-�g��8\R��o,|��} 1*�Z�:���@@� T�p�.܈��^��?w���ցq`��n�Ǜ��O����MR�C;52�)�0t��g�d�P_������a����d� �Sc�c�,�N�%�6�cy���N��܃%�2,�E,���It6����ؙِ�誥2
�ME�2��I/�S�ݲy�����Æ;b��{��b���Kv,L��L1�S������ѹ�KuL}?�u�]����
ӨL��-&p���@j�c�2<��n�.a_��I��#&�.*�u�?je���������a,3a�<��ijAKb�y_˴���˝ Z4��i|�XC���ܥ4D��1N$�O�B7�{���mTNx�ILz��o	D,l�֒�Z�;�t�!�e��"^*����i[0�w���5�]� Z���EI��d
�mC�������zJW�͔�:b���}�]zC�F�#&]_P;�X>�,\�p��gĶz�YJ�;��X~3=݃��]��!x��z��࿝��0L�i�"1�Fꬕ*.rF���Fz|���9�}GL��}f�N Fl��Tm�9p�.\0�� xӪ�-\�L��_�*��o��R_����:ʂ��Cr#�d;�ѯS�bz�׸�5��$��x��U���Y�X1��J$�ݟ���@� +�SF��ݟ=:�'1�����:��Zn��Y�ܘ2bj�U@��l�V��F)G�aj��Q	_?����"���ƈ������c*Ω�Ĉ�f�p>����?��M�bA�뼯焔ڷ�`�p]E;�R����ȱ�lI-!��v�vl7[RJj��Ż�&�ۊvZe{��e;�2\H�qz�bHo�P�+�C�ѐJR�e���c��Zl��<�Q�:!*v�#;~�u���z9FQYW[�.1���uG'���\�����Jc'J\���i�����>[�fr�-�F�DK��T'`�Nt4�X_��N� ;�]�����(��iވ��	��f�yKb�}F����=8Pb���u���c�R��\�
�<�S舝)	���V�sy�Δ� �����n��{K�4V?�D�ј؂�k\�';Sb�;t��z؍���-���1�3ƀ�jx�UNM��QI�����#&�K���dm�}*�[ƀ�E����w����c��S�눱)nXp8��^?(KW~�<2&"���!-��G=�dا��H��7�j����8G�	�Q��E����/����f,|5b�VT^sX,�4��1Z1B��|��<;�P�5!�;�zMe FL4!���c3;���~�m3'L�L�X��{�ųi���Ԥ�����^�L@�ulb�C9�%��}T��m����S&;�ه)ߘ�5`�+�)��e�����b����4��!%Y��a��,��I���#d���`���bFv$$xJ�P�����,�˲oމB"1��&��N��FL�$�a"�1��l�F!*��ܳq�u0�H�r��.��M.��p�?6�z�l^�������1�bR��:J��C##8�co���c�{`3����N9�t1��2�R��ꀉצ��[�㟄g�>��ĄD���a�k�81���c���*c��̟T�������e�ul�������O�"��;@��L�BֲP�����ش�X\YJ���G���w" ���L��,��=V�0���r�⧬�c�t�� �؞-n�����Q��|��֋���t9`LR��ˀ��G�aO��ߥ�,v{���yr�L
@J�	�b���,=f;^�,h���,{eP���UKb���1�1��|H�X�{Ąte�	.�׶�Tg�Ĵ
lY�/Bb��E�=OT�����q?J��kI��˄��Ť�{�Y�3�Q��k��RYз�d4�4��E�.���l7[۲s�Hb�N�sj8��,`�5���I����fo@J��Lb���>��f�����_���l���7�a ����V6��pF�p=�p��gKYVZ���^�Q��C�@/\lV�0��L! 9�k�b��*g��On-�&��:��4��bR}��.�WJ�B����u�VL! ���>i?��DVL!���M��FLW���禞m������l�8q�_*�x_H�ru *v&cu鰍߿�"bg��Ɤ�ևR���ࢯ��^=[����Nӗ�W^�sG����>@����^E2
���0��>���˷k�^���S�u��Z�K����I��o[ڿ�>��ٳ5'ּnmӅk�٢�������0Vz��f}����Kv�C�ٰ~;��&��G�
�tC<`
z�dD%3S�~���ǧQ׺F*���;D�X�ez��$���4GL1����qD��~X��s���c�׳�T$!�U���4l�����>�k�&+#D���_^�G��3�������Ul?��A3���l�I`�0�t4`������,�7�^�|��k��aB�O��ť����]�z��g�Z���t)�A}� �i5�;��H�i�@H����g�d��6�Y~���6��8G��2�uYg;P�/�o���ҰIɄTNOb':VL�jĆ�N�$�9�Mb':�#�fw#v��/�w(;����܋b�EI�	/2nS�����\l�2�BJ�gkWkƂ��Ą\v��e�ە���5��,d��T��I�3E�B@&�]b�c��m
���c(�t-WPn��KE <��X����cZ/G�*�L�VG�p�|���cZ�}jc#���iv}��H �@�/T�p��VMX�s��1���RR�� ED��ب�k��:FRC*���T��IL+�X�y9gtL�!�DNO�bf�ꔝo�a*�����#��^*� 2b��,/�u�t�@�:�˲��J��9\1���Ⱥ���f���K��e��f�=4`ju:P�%��cʙ������y����c|��E���e�0H�O�;���67����c'"�r���G;Q���|��z�	g��Fd�ء��)�~��
���zN��R.\���-����
z��壯��c���帴��f_s��ONW��������+��ޒ��r�+���Әz�P�V�i�\����s ~v�N�2�� +�^/;�����cA���^�#�}�$�wL�ʹ�;��S�5��rⳆJ��C+��Q_:Tj�2ў�]�� �hL�p�̍�FL-w��bᆓ�k�eW*ۚ��1����m�6��zS�r\.Be{O9.��R�j����ۛ�~��q	K����WL� ���E��[D*����/����X	ߞ!�|�	BA����i��Z3�(ij0`j�$b��v-
R� 	�;O:�y���AJ��g|Y�EFJU�����"F7��Z+�OFXd+?//;��˨4VGcj%��τc-4[D�8!R�g@>����(S�D�X��i��S���߾�S��}EV�U�'��ec��r�����O�u��C��S�ɁBg�땆�W�Ҭ(%Yw��ڎIw��c��Ƀ�/���V���0^�>�N�-�$�����#�����Gՠ	�Ђ�=Cb�+2�t�A]�Ě��jI�L� +d�ИT�)�w��!��XX���I$�]DCI!�K�I�H��t�3`�܋�q������;�����q�E�K�I����A�,H'�E�MS�~r��PTx�Ј�K�;c���.���S�i�� ]6m^U�< |f���#\XB����I�DI2P�i:�؁4�G���x؉�2ʈ��^-GØ2#��i��`��ʌ����-B��|F"2B��HbZw�$#��Vr�'Z�UKbL��:��Ν4�؁�d �e�?0&u�@�"�{���e�W    ����v*���%��d��|l�4���%��Gl�c�t����t��U1�2���-C�荁���\y��������KP>��m����_�?<�|�ŀe��e�wL��\*�_,��H�ڐ�����$�v��6)N����B���j�H�盕[^xaq%�0�9L�4`���i���$��E�=�l��?�OWl�!��V�)e�f6�L��)�1`ԧ��C3�/�ب��Kvs�Ҁ_��Ll|�"��s
{<5�;�@}O݂L�-�|�������Mo1�?e��^Cڧ&4BGc'"�;�ΞI�DQ2 	���QO<g��1�X�ۼ$®��,!�jj\�&1���O�L��tLf7R����\�zާ�5����%1�]�����=��1�A\m"�.��Oh��x͗Q�Co���FA󍔙y�3��W"��(����Aƚ`��d�jz�Q��Z�^B���X���+�Z5��7ǯ��݀i"�7)wF��3l 1&"����£�s����l�s��0�[���?��01��~$vC����X(j�ępյ�z�7(˱��ب��t<=b�z9r_b�~#��4"|��N�HL%`ԣ�$�a��J���S	���ؘ�Mb*ve��Ӿ�TX�m��O��ңW��ɡ�Wb�Q�����ǖ�c
�,	��nE3����؁�2v��>���za���9�Lb�;g�s�T��.gכ/��a.�0`l�w�\�D�o�0��'v�N��P9�б�S u�㲀;&���� ���p9W;,��p3��˕ίS�az	�0�w]$6v�� ����(A�Za�<�mI٘W%0����H��հ��@b[b#W�Y �ѱ-��J� ��VĶ��;vV�����mI����5|Ķ�R6l㰉Ķ�B�F�Z��
�5����ؖT�1u������BK������|E�F`�����V�����$�%V�0?��lKʆ�*A��WؖT�\�T>/^wǄ��֮w�'{+�]�Q1���Ӆ{�MtLy	~{峵�J.��+�.v�a�O6�;^�g��Y�\�T�[����n>��"�s�̀���W��2se��ᩧ!1�؂]X�fǃ�d 81��0F:E@��͛@H��5_$v$���wX?`ŘHc-�1��!�$v (o��ýF7Sc'$m�2�؁��Gto�Q�o߳���w`O�+4S���j7��/q̎J�g����h1�Ӑ�_�7��P�0��0��FϨ�����Doj���ׯ�vC�Vr�6o>�	!��"1E
�~G�e�y	�B�J��k���_I�����YX@U�e�-�$6��b�=)66>����J����`n>���1�)ƀ�|��.�˩�aj�*
��3���L"���R�e���E�o�8���iu�e���$�ո��dZ&1����ji�ĴB����K�c�Ӫ��ĔI���I=�i�������cܑ��!��\�FŶ+�_�7N��Ɋiu�p��HL�!G��uEVL+#l���C��F�C��ϭke{(#5�m��1�FV�$��]\��Y&_�.�0�k�bZy�{����jȩ�4�>Wqt�7|�1��W�+�,�iU��ޛ%e�cZ�[g&�TZ}��:�n|4��H�����a�S��c��~�e����Յ��2j��v�btv�(�w��[��"&���(g�E|c����}�����O��p����a�d��ـ�2P��40&~ۻ+f�n�2��L-�:��L%�L-��um�c�a��r���������M�v�|����?/�݈�h�M��k��@Nj=������"!B�#�$11��s� ��9)��4�I]���Gd$���u�'�w��6Љ���$�o幧��I�B��ʔ�t���%��1�)����z�|�|p0q�dl�����.&�c�]�Y����f)h���t����֌1�S޷Fkt׻��������z�Z���7��<d����߀�E�5/;u$1��`��8-�N��"�ekٯa�.�t���s[�;В�Rz;�j�5���v��4&���wH��	��9z��`Z�B'$v $x �O�_�\�d��B%��mh�,E�Wǆ~C�VEg�$v�$���,���]�;/���{BK�<��
�o�v����/*qZ�܎��������x�o9�ֱR4��>`b�椖�>�)/{�Nt�un���b+���"O��;�Q�Ή�%a���S����g��<��;Q�\�����Y�����Wǋ��NI���"�1|,���|2b�\�^�Nt$�p���v�#-�{�;ёl���~��*��:B�.|k�t��!b�.�j�Ƈ�~�k��HG	�4�Ո��r$�L���H ��i5�f�F���e�/i�Vc�q���aǴʂ���5�#�g�j����_*Ӫ�;iT�<m0I�{�
���F��Yc	�ܾ�N��6x��HL��|�Ш����PL#��Aä{J 1=����D��MDB��1EV�I�0a��(�-<�p}�0T��D�Jf����
�2KbZ5�J ��$��N���k�ϋY4n� ����뗱b��AF
*T�LbZ��a#��y�ń_B�?��jR/�/5��]Ē>הB:`|�H�XA�{>cY͜~9`gJ�%���e�5�LFo�?�C�ؙ�t�Ȑm��)ɕ0�ڽlD�������*�v��N`��YLG��݌p���	Rsݲct�-��2�*C1e.g3bFS��p���+�7�p�Η�K�!������i@ ���	��x6�i�R=�֋ؽ�ƤhP��5廧��fz�0`�D1p���g��C��״�����B���.5�>�jYx�X9�2;:��Q��.���1av����Qy�HXG%/��cB4�6.��dzJ=������������2).� �煿�HlKʺ��&�-��ch��Hl˨t*�\w����� 3��Y�N�J������5<�@Iy���>L�Nl������������Ĩ���YL/5��=��ȧɓ0�2b���}e���9iS3=i��XD��ߏ�H�\s��S\*�K�:N^?a�a7`��H� /�|"1�|���=�J�ډ��	��M����w�	��}����Aj�T�oݘ�;�p�U��SL��	&�,j�~��3<��}���6wS0��2a�Q����r���2���^�6���{�X)��t9`2ʧH�ӺPƺ����~�(j*�Rc��K_�=%��2��Y�c�|�O�$�"z��}&1�"@Fw���a�\��'��ʗ��q�C0����(ߣ��ј��I�vZv�����g�� �1�����z)�̾xp�K$v�!x�r�
;v #<kh���ձ!�y���1�c2B��NJ�g�RB�!x(#��HO�+k�r�L��@씯�ƭQJF,��i_K(�-!�Hb��ćc��_2bq�NKcR
���m�c2�c�x4�{;�5���n`��Y0$&(}��=1��ր1��9C�"�F��Č�`��4���<�nuX�pr���$�G'>K1c��k��0�l�|�bƲ���O��b�X2x�|�b�LS�;�a�s<�؉�>�B�m��	?�PG�ΗH�Dc���	3����M�������(
�T똥6`'J�Y9��k؁�}I�\�}�֊�h�V����D�
{Q�uS��;��p�؉�`�|�=`'"ʸBc��)�؉��	_cw�
����b��b�@=`'����_S�ԑ:�ɡӾV뫏� ��*v�ՊK�D�:F9�@c'R����.��}(���C���������J���H#��v4ެ+�W�c[����p�:7�2�+���LŶ�����i��ZX�1�KmI���$��W�!�1��k��a>pgT�)A���k�m�^�rS�uYRr�F���i�cz��_�t�1`zv�Z�JY�D�K�7n�6���zl�@�,��y&�=�$vJ� �	  ��<��n���(~��eR��2���Y�L��%
���$&�}.���f��\�؎��c���&T�Ny�QT)���u�LFp���^Nh;S��a�y}u�L�VִL���)����a��v����'E� "Q�+�s~�5`j�A�����"Yz��!�z]S��)�2�{�]H���6bR
@����l&��h�J
#�W����8T�1�
g�ɰ��^��Ʃ7Ԉ�7�`�M�<���e�䄂��Έ�����IL��8��3Be_2s�f�<��6��5��_�;�R1�X�|X���S���2��yo�&=��\�/Fӏű��_��7c{�:
p��و�����l~����#��b�h@�{[�{c17Iu��&&�>^F��(>܉X�\垷[2�3�׆��Rr�I�LA��~M�$&�N��:�#���I�^!|q�VTҬ�/=�u�cv��I'�l��md���ׂ�|�b��2�1�6bz�2��CЈ�%N,p�.B��z����{K��v����{{;S�n[�䡛^���^BW��{�8��ɧ?%b���ׁ<֐>��D8��������^"1���"$L��$ƫ@Vx�sM��ۼ�i�d�cR.�[�d�sBZJd��^�ܠ+X� "Pf�A������r��)谉��Ә�7Ո1wN�sa�OlM��J�c^�f���H.�� !wO����b5�c���d~:�L 0���dĈ�6+=_��S�Y�@f�u~"1��E'������T�v��Skj��/,|xrf�c̯�<���S\�l"a儴Cb����C@GX�<���� ����8�J䠻B(�o��Mb����g���\B���J$��W�l�3���$&Mlx�
�/9𷌿��.3 ����hrl�g-,�� �K���h3��LA���b�{�������A�b�A��Y�<��[��
��f;-�c>_����	_�];>�n̛1��n�A�c$1�����ȆWi#�Х$<�yr�L�㾬(�/[٠��kg<�	U���K[������r؉���Be/��	���A��dA��(����"n�2�b����͚���0�YAh�Γ�(�7e��:j���3 �'6��RBh|M���a��Y��.��a�*��2���u�v�k��vyz4�`�������W�&t:�.���%�+�rCb�T�z���-TP����0�ĉ1�3ʺJ+��S^44noHL���u:] >�W(!��e��n�1�^Oc4O&�5l�����A(?�|�9`�����e6w�!�ӵɀQ�8W&؈n؅�����N�#�?�\�7���F �%�$��ut�������q�bM�KXZ8+�+7����]��p8>��pc@.��e+�8p�����<�3$�Gn[������7w��v�0���=Gѯs�a��j�(�}�����U�V�굔�-'ʆ�����2L�sGL>��+FO�r�Xm�H�DIo/�z�2`'�j��Ş���cb2����B��a���`od�uX�����ɳ��X���ј�lQD4Y͕:B(��c�V�ޤ�W������q����������^n��xcm��QQ�{�'u�y�1�{���آ"TQh��i��R�Wύ��c#��5ABc&7t��HL��������I!���3�v�����)���Om�tCB��F0
���$��:|���(���;
�#�I��E��0�d4��z���Ԍ)�7�I#��z�ϫ�mH�#Տ��"t���jh�܊E|/֩c
�}�N�ܾ��,đ��q�A��7���e~���0G�Db
z�T�@g	��P���u��1��z#a�6q��> 8R�S���$�Je�K�S�k|�F�όq��,xe��u����}��Zً�n�Ԯ�5i��K����z�ؙ��{�ܕ��֌�.��BREOZ��4f��;������ĸbі.���tJ���fƔ2�	 �Ĕ"��\ᫌ��)�5����qh�RLs?Љ�W;�S�	'�J�		��$�$6:Ȑ�1���>` �������'����8���-��D��5�.�������k�b'����N84Л1�7d��;�ATL�/�
pv^��ɛ���a%�Vޫ��0m�\�{i�~:c�`/�,ʱŉ*g���`IL�Q=^��a'����0��>��u.4��j�k!���*�᫼��$� s������
k ��y�Kh�	;w�*d9cz=��q�P���j�u�!-f��:z����ɨa�=���"&e��^��e�o��M.�@�_?W*��D�+����o*��3)�ua���1�/��@,�o�Ҁ	z�A���"����q�q��j�	����� �3���_-5J(IL�䂗�C��h����`���i��?�wR�HfGo���Q�z��'�=��I�@>��&�U^��7���o߾��p+��      f      x������ � �      b   �   x����
�@��y���KaHuEC�o�j��z��7��JY��V(׵X�c�o�|����ˣx�ܮC�5�!
pS��l�1����v�]��P�ۊJ:lW��qK�Hx�ѭ'I�x����O|���r"�D
L�      d   �  x��U�n�F}^~�<����^H.����ذbHJ���ĘkI��K��;+����@�� g;G�̜Eqݯ|ߊX������D���G�EK��Ŕ�ַ��Mݑ���:1�<�(�T�D&'R�R����!,R?���2��!,҇Npv���Ý\�PhFK�<7B1.}�5����˦�L�k_=�
8�j^�Y��h����2����L2�2#��Ȉ�M�j��	mznh9��K�Ē;=�/D�br{F�|�?M��\��-��E��RqО	X;�E�瓚�˺^�US��j�):
o���rCX�۾+=A����A f4��1j1Y/�}�x������%�״�;*�<�[
�$�L�!,JĻ~ၠ�;Z{x/�db�MŌ��i���T^�sZSG3�q{,ֳ�z)Mρ�r��CX��|׿p�*a7��{���Pw��ַL�=�v�~�����d������ENL�Z4���0c�4֡m�U3.��S֫�ؒ0.~k�o�7�n����b@N���WX�R4�y�����#��6��v/��C͚��W��x���/��ˤ�"� ߲�h˿�R��st}{��_t䏄&�(�f*�"T��lv��K��+$����uN9+6�E�+�n��h�8��da���_���ߛ�yo�Ke,�\=?|������3�EhĶ�}n�Dǉ�Ex�vm���f.�=��n�7Zͨ-~�RR��L�!,B+��d��T��i�T��_�k�H���o��4�;��)�0Ǧ�Ҁ&C��t�0�9�Z^ǋ�%��\��5��|YA�5o��d����9�q����.9*,�	/�6��a"�.F�|����/��ϟ�l|qH~� ;�Ģx����7�v�������XA�5΁e ���9p1>N��D"(�I�i5�E��FQ��n�!     