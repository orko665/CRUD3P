PGDMP                      |            postgres    16.1    16.1     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    5    postgres    DATABASE     ~   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Paraguay.1252';
    DROP DATABASE postgres;
                postgres    false            �           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    4806                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                pg_database_owner    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   pg_database_owner    false    5            �            1255    16430 �   actualizarcliente(integer, integer, character varying, character varying, character varying, character varying, character varying, character varying, character varying) 	   PROCEDURE     (  CREATE PROCEDURE public.actualizarcliente(IN idin integer, IN id_bancoin integer, IN nombrein character varying, IN apellidoin character varying, IN documentoin character varying, IN direccionin character varying, IN mailin character varying, IN celularin character varying, IN estadoin character varying)
    LANGUAGE plpgsql
    AS $$
begin
	UPDATE public.cliente
SET id_banco=id_bancoIN, nombre=nombreIN, apellido=apellidoIN, documento=documentoIN, direccion=direccionIN, mail=mailIN, celular=celularIN, estado=estadoIN
WHERE id=idIN;
end; $$;
 1  DROP PROCEDURE public.actualizarcliente(IN idin integer, IN id_bancoin integer, IN nombrein character varying, IN apellidoin character varying, IN documentoin character varying, IN direccionin character varying, IN mailin character varying, IN celularin character varying, IN estadoin character varying);
       public          postgres    false    5            �            1255    16433 �   actualizarfactura(integer, integer, character varying, timestamp without time zone, numeric, numeric, numeric, numeric, character varying, character varying) 	   PROCEDURE     �  CREATE PROCEDURE public.actualizarfactura(IN idin integer, IN id_clientein integer, IN nro_facturain character varying, IN fecha_horain timestamp without time zone, IN totalin numeric, IN total_iva5in numeric, IN total_iva10in numeric, IN total_ivain numeric, IN total_letrasin character varying, IN sucursalin character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE public.factura
    SET id_cliente = id_clienteIN, 
        nro_factura = nro_facturaIN, 
        fecha_hora = fecha_horaIN, 
        total = totalIN, 
        total_iva5 = total_iva5IN, 
        total_iva10 = total_iva10IN, 
        total_iva = total_ivaIN, 
        total_letras = total_letrasIN, 
        sucursal = sucursalIN
    WHERE id = idIN;
END; 
$$;
 I  DROP PROCEDURE public.actualizarfactura(IN idin integer, IN id_clientein integer, IN nro_facturain character varying, IN fecha_horain timestamp without time zone, IN totalin numeric, IN total_iva5in numeric, IN total_iva10in numeric, IN total_ivain numeric, IN total_letrasin character varying, IN sucursalin character varying);
       public          postgres    false    5            �            1255    16431    borrarcliente(integer) 	   PROCEDURE     �   CREATE PROCEDURE public.borrarcliente(IN idin integer)
    LANGUAGE plpgsql
    AS $$
begin
	DELETE FROM public.cliente
WHERE id=idIN;
end; $$;
 6   DROP PROCEDURE public.borrarcliente(IN idin integer);
       public          postgres    false    5            �            1255    16434    borrarfactura(integer) 	   PROCEDURE     �   CREATE PROCEDURE public.borrarfactura(IN idin integer)
    LANGUAGE plpgsql
    AS $$
begin
	DELETE FROM public.factura
WHERE id=idIN;
end; $$;
 6   DROP PROCEDURE public.borrarfactura(IN idin integer);
       public          postgres    false    5            �            1255    16429 �   insertarcliente(integer, character varying, character varying, character varying, character varying, character varying, character varying, character varying) 	   PROCEDURE       CREATE PROCEDURE public.insertarcliente(IN id_bancoin integer, IN nombrein character varying, IN apellidoin character varying, IN documentoin character varying, IN direccionin character varying, IN mailin character varying, IN celularin character varying, IN estadoin character varying)
    LANGUAGE plpgsql
    AS $$
begin
INSERT INTO public.cliente
( id_banco, nombre, apellido, documento, direccion, mail, celular, estado)
VALUES(id_bancoIN, nombreIN,apellidoIN,documentoIN, direccionIN, mailIN, celularIN, estadoIN );
end; $$;
   DROP PROCEDURE public.insertarcliente(IN id_bancoin integer, IN nombrein character varying, IN apellidoin character varying, IN documentoin character varying, IN direccionin character varying, IN mailin character varying, IN celularin character varying, IN estadoin character varying);
       public          postgres    false    5            �            1255    16450 �   insertarfactura(integer, character varying, timestamp without time zone, numeric, numeric, numeric, numeric, integer, character varying) 	   PROCEDURE     �  CREATE PROCEDURE public.insertarfactura(IN id_clientein integer, IN nro_facturain character varying, IN fecha_horain timestamp without time zone, IN totalin numeric, IN total_iva5in numeric, IN total_iva10in numeric, IN total_ivain numeric, IN total_letrasin integer, IN sucursalin character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO public.factura (
        id_cliente, nro_factura, fecha_hora, total, total_iva5, total_iva10, total_iva, total_letras, sucursal
    ) VALUES (
         id_clienteIN, nro_facturaIN, fecha_horaIN, totalIN, total_iva5IN, total_iva10IN, total_ivaIN, total_letrasIN, sucursalIN
    );
END;
$$;
 ,  DROP PROCEDURE public.insertarfactura(IN id_clientein integer, IN nro_facturain character varying, IN fecha_horain timestamp without time zone, IN totalin numeric, IN total_iva5in numeric, IN total_iva10in numeric, IN total_ivain numeric, IN total_letrasin integer, IN sucursalin character varying);
       public          postgres    false    5            �            1255    16443 ~   insertarfactura(integer, character varying, character varying, numeric, numeric, numeric, numeric, integer, character varying) 	   PROCEDURE     �  CREATE PROCEDURE public.insertarfactura(IN id_clientein integer, IN nro_facturain character varying, IN fecha_horain character varying, IN totalin numeric, IN total_iva5in numeric, IN total_iva10in numeric, IN total_ivain numeric, IN total_letrasin integer, IN sucursalin character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO public.factura (
        id_cliente, nro_factura, fecha_hora, total, total_iva5, total_iva10, total_iva, total_letras, sucursal
    ) VALUES (
         id_clienteIN, nro_facturaIN, fecha_horaIN, totalIN, total_iva5IN, total_iva10IN, total_ivaIN, total_letrasIN, sucursalIN
    );
END;
$$;
 "  DROP PROCEDURE public.insertarfactura(IN id_clientein integer, IN nro_facturain character varying, IN fecha_horain character varying, IN totalin numeric, IN total_iva5in numeric, IN total_iva10in numeric, IN total_ivain numeric, IN total_letrasin integer, IN sucursalin character varying);
       public          postgres    false    5            �            1259    16407    cliente    TABLE     p  CREATE TABLE public.cliente (
    id integer NOT NULL,
    id_banco integer NOT NULL,
    nombre character varying NOT NULL,
    apellido character varying NOT NULL,
    documento character varying NOT NULL,
    direccion character varying NOT NULL,
    mail character varying NOT NULL,
    celular character varying NOT NULL,
    estado character varying NOT NULL
);
    DROP TABLE public.cliente;
       public         heap    postgres    false    5            �            1259    16406    clientes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.clientes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.clientes_id_seq;
       public          postgres    false    217    5            �           0    0    clientes_id_seq    SEQUENCE OWNED BY     B   ALTER SEQUENCE public.clientes_id_seq OWNED BY public.cliente.id;
          public          postgres    false    216            �            1259    16416    factura    TABLE     P  CREATE TABLE public.factura (
    id integer NOT NULL,
    id_cliente integer NOT NULL,
    nro_factura character varying NOT NULL,
    fecha_hora timestamp without time zone NOT NULL,
    total numeric,
    total_iva5 numeric,
    total_iva10 numeric,
    total_iva numeric,
    total_letras integer,
    sucursal character varying
);
    DROP TABLE public.factura;
       public         heap    postgres    false    5            �            1259    16415    factura_id_seq    SEQUENCE     �   CREATE SEQUENCE public.factura_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.factura_id_seq;
       public          postgres    false    5    219            �           0    0    factura_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.factura_id_seq OWNED BY public.factura.id;
          public          postgres    false    218            '           2604    16410 
   cliente id    DEFAULT     i   ALTER TABLE ONLY public.cliente ALTER COLUMN id SET DEFAULT nextval('public.clientes_id_seq'::regclass);
 9   ALTER TABLE public.cliente ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216    217            (           2604    16419 
   factura id    DEFAULT     h   ALTER TABLE ONLY public.factura ALTER COLUMN id SET DEFAULT nextval('public.factura_id_seq'::regclass);
 9   ALTER TABLE public.factura ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218    219            �          0    16407    cliente 
   TABLE DATA           n   COPY public.cliente (id, id_banco, nombre, apellido, documento, direccion, mail, celular, estado) FROM stdin;
    public          postgres    false    217   2       �          0    16416    factura 
   TABLE DATA           �   COPY public.factura (id, id_cliente, nro_factura, fecha_hora, total, total_iva5, total_iva10, total_iva, total_letras, sucursal) FROM stdin;
    public          postgres    false    219   {2       �           0    0    clientes_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.clientes_id_seq', 2, true);
          public          postgres    false    216            �           0    0    factura_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.factura_id_seq', 5, true);
          public          postgres    false    218            *           2606    16414    cliente clientes_pk 
   CONSTRAINT     Q   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT clientes_pk PRIMARY KEY (id);
 =   ALTER TABLE ONLY public.cliente DROP CONSTRAINT clientes_pk;
       public            postgres    false    217            ,           2606    16423    factura factura_pk 
   CONSTRAINT     P   ALTER TABLE ONLY public.factura
    ADD CONSTRAINT factura_pk PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.factura DROP CONSTRAINT factura_pk;
       public            postgres    false    219            -           2606    16424    factura factura_clientes_fk    FK CONSTRAINT        ALTER TABLE ONLY public.factura
    ADD CONSTRAINT factura_clientes_fk FOREIGN KEY (id_cliente) REFERENCES public.cliente(id);
 E   ALTER TABLE ONLY public.factura DROP CONSTRAINT factura_clientes_fk;
       public          postgres    false    217    4650    219            �   P   x�3�4��*M��H-J��4426153� 1�srR�s�9��j�
@jR+srR���s��-9�K2��b���� 	*2      �   [   x���1
�0D�z�^ �d6�b'Oaca'��1z��o^�](�RAG�)�KHcI����$`!c��$dX��]�q=�~j�~����T��&0y     