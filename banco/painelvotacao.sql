PGDMP         )                {            painelvotacao    15.2    15.2 H   �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16394    painelvotacao    DATABASE     �   CREATE DATABASE painelvotacao WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.utf8';
    DROP DATABASE painelvotacao;
                postgres    false            %           1255    24707     updateaccessusers(text, integer) 	   PROCEDURE     �  CREATE PROCEDURE public.updateaccessusers(IN query_command text, IN rows_alterar integer)
    LANGUAGE plpgsql
    AS $$
declare row_access varchar;
declare new_string text;
declare id_acessos int;
declare fk_itens_susp int;
declare id_usuario int;
declare col_acesso char;
declare col_alterar char;
declare col_novo char;

declare controle varchar;
declare cont int;
begin

	cont = 1;
	
	while cont <= rows_alterar loop
	
		row_access = split_part(query_command, '|', 1);
		new_string = substr(query_command, strpos(query_command, '|') + 1, length(query_command));
		query_command = new_string;


		controle = split_part(row_access,';', 1); -- id_acessos=1500
		id_acessos = substr(controle, strpos(controle, '=') + 1, length(controle)); -- 1500
		controle = substr(row_access, strpos(row_access, ';') + 1, length(row_access)); -- fk_menu_itens_suspensos=1;id_usuario=2;acesso=1;alterar=1;novo=1;
		row_access = controle;	

		controle = split_part(row_access,';', 1); 
		fk_itens_susp = substr(controle, strpos(controle, '=') + 1, length(controle));
		controle = substr(row_access, strpos(row_access, ';') + 1, length(row_access)); 
		row_access = controle;

		controle = split_part(row_access,';', 1);
		id_usuario = substr(controle, strpos(controle, '=') + 1, length(controle));
		controle = substr(row_access, strpos(row_access, ';') + 1, length(row_access));
		row_access = controle;

		controle = split_part(row_access,';', 1);
		col_acesso = substr(controle, strpos(controle, '=') + 1, length(controle));
		controle = substr(row_access, strpos(row_access, ';') + 1, length(row_access));
		row_access = controle;

		controle = split_part(row_access,';', 1);
		col_alterar = substr(controle, strpos(controle, '=') + 1, length(controle));
		controle = substr(row_access, strpos(row_access, ';') + 1, length(row_access));
		row_access = controle;

		controle = split_part(row_access,';', 1);
		col_novo = substr(controle, strpos(controle, '=') + 1, length(controle));
		controle = substr(row_access, strpos(row_access, ';') + 1, length(row_access));
		row_access = controle;

		update acessos set acesso = col_acesso, alterar = col_alterar, novo = col_novo where fk_menu_itens_suspensos = fk_itens_susp and id = id_acessos;

		cont = cont + 1;
	end loop;
	
commit;
end;$$;
 Y   DROP PROCEDURE public.updateaccessusers(IN query_command text, IN rows_alterar integer);
       public          postgres    false            	           1259    16774    acessos    TABLE     �   CREATE TABLE public.acessos (
    id integer NOT NULL,
    acesso character(1) NOT NULL,
    alterar character(1) NOT NULL,
    novo character(1) NOT NULL,
    fk_menu_itens_suspensos integer,
    fk_usuarios integer
);
    DROP TABLE public.acessos;
       public         heap    postgres    false                       1259    16773    acessos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.acessos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.acessos_id_seq;
       public          postgres    false    265            �           0    0    acessos_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.acessos_id_seq OWNED BY public.acessos.id;
          public          postgres    false    264                       1259    16918    autor_proposicao    TABLE     �   CREATE TABLE public.autor_proposicao (
    id integer NOT NULL,
    fk_pessoa character varying(14),
    fk_proposicoes integer
);
 $   DROP TABLE public.autor_proposicao;
       public         heap    postgres    false                       1259    16917    autor_proposicao_id_seq    SEQUENCE     �   CREATE SEQUENCE public.autor_proposicao_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.autor_proposicao_id_seq;
       public          postgres    false    281            �           0    0    autor_proposicao_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.autor_proposicao_id_seq OWNED BY public.autor_proposicao.id;
          public          postgres    false    280            �            1259    16463    bloco_proposicao    TABLE     �   CREATE TABLE public.bloco_proposicao (
    id integer NOT NULL,
    nome character varying(300) NOT NULL,
    resultado_status character varying(60)
);
 $   DROP TABLE public.bloco_proposicao;
       public         heap    postgres    false            �            1259    16462    bloco_proposicao_id_seq    SEQUENCE     �   CREATE SEQUENCE public.bloco_proposicao_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.bloco_proposicao_id_seq;
       public          postgres    false    229            �           0    0    bloco_proposicao_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.bloco_proposicao_id_seq OWNED BY public.bloco_proposicao.id;
          public          postgres    false    228            �            1259    16396    cargo_politico    TABLE     j   CREATE TABLE public.cargo_politico (
    id integer NOT NULL,
    nome character varying(100) NOT NULL
);
 "   DROP TABLE public.cargo_politico;
       public         heap    postgres    false            �            1259    16395    cargo_politico_id_seq    SEQUENCE     �   CREATE SEQUENCE public.cargo_politico_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.cargo_politico_id_seq;
       public          postgres    false    215            �           0    0    cargo_politico_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.cargo_politico_id_seq OWNED BY public.cargo_politico.id;
          public          postgres    false    214            �            1259    16619    cargo_politico_pessoa    TABLE     �   CREATE TABLE public.cargo_politico_pessoa (
    id integer NOT NULL,
    fk_pessoa character varying(14),
    fk_cargo_politico integer
);
 )   DROP TABLE public.cargo_politico_pessoa;
       public         heap    postgres    false            �            1259    16618    cargo_politico_pessoa_id_seq    SEQUENCE     �   CREATE SEQUENCE public.cargo_politico_pessoa_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.cargo_politico_pessoa_id_seq;
       public          postgres    false    255            �           0    0    cargo_politico_pessoa_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.cargo_politico_pessoa_id_seq OWNED BY public.cargo_politico_pessoa.id;
          public          postgres    false    254            �            1259    16424    cargos_mesa_diretora    TABLE     p   CREATE TABLE public.cargos_mesa_diretora (
    id integer NOT NULL,
    nome character varying(100) NOT NULL
);
 (   DROP TABLE public.cargos_mesa_diretora;
       public         heap    postgres    false            �            1259    16423    cargos_mesa_diretora_id_seq    SEQUENCE     �   CREATE SEQUENCE public.cargos_mesa_diretora_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.cargos_mesa_diretora_id_seq;
       public          postgres    false    219            �           0    0    cargos_mesa_diretora_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.cargos_mesa_diretora_id_seq OWNED BY public.cargos_mesa_diretora.id;
          public          postgres    false    218            �            1259    16593    chapas    TABLE     �   CREATE TABLE public.chapas (
    id integer NOT NULL,
    nome character varying(500) NOT NULL,
    fk_periodo_mesa_diretora integer
);
    DROP TABLE public.chapas;
       public         heap    postgres    false            �            1259    16592    chapas_id_seq    SEQUENCE     �   CREATE SEQUENCE public.chapas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.chapas_id_seq;
       public          postgres    false    251            �           0    0    chapas_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.chapas_id_seq OWNED BY public.chapas.id;
          public          postgres    false    250                       1259    16702    chapas_pessoa    TABLE     �   CREATE TABLE public.chapas_pessoa (
    id integer NOT NULL,
    fk_pessoa character varying(14),
    fk_chapas integer,
    fk_cargos_mesa_diretora integer
);
 !   DROP TABLE public.chapas_pessoa;
       public         heap    postgres    false                       1259    16701    chapas_pessoa_id_seq    SEQUENCE     �   CREATE SEQUENCE public.chapas_pessoa_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.chapas_pessoa_id_seq;
       public          postgres    false    259            �           0    0    chapas_pessoa_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.chapas_pessoa_id_seq OWNED BY public.chapas_pessoa.id;
          public          postgres    false    258            �            1259    16536 	   coligacao    TABLE     �   CREATE TABLE public.coligacao (
    id integer NOT NULL,
    nome character varying(500) NOT NULL,
    fk_legislatura integer
);
    DROP TABLE public.coligacao;
       public         heap    postgres    false            �            1259    16535    coligacao_id_seq    SEQUENCE     �   CREATE SEQUENCE public.coligacao_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.coligacao_id_seq;
       public          postgres    false    244            �           0    0    coligacao_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.coligacao_id_seq OWNED BY public.coligacao.id;
          public          postgres    false    243                       1259    16901    composicao_bloco_proposicao    TABLE     �   CREATE TABLE public.composicao_bloco_proposicao (
    id integer NOT NULL,
    fk_proposicoes integer,
    fk_bloco_proposicao integer
);
 /   DROP TABLE public.composicao_bloco_proposicao;
       public         heap    postgres    false                       1259    16900 "   composicao_bloco_proposicao_id_seq    SEQUENCE     �   CREATE SEQUENCE public.composicao_bloco_proposicao_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.composicao_bloco_proposicao_id_seq;
       public          postgres    false    279            �           0    0 "   composicao_bloco_proposicao_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.composicao_bloco_proposicao_id_seq OWNED BY public.composicao_bloco_proposicao.id;
          public          postgres    false    278            �            1259    16470    conclusao_proposicao    TABLE     p   CREATE TABLE public.conclusao_proposicao (
    id integer NOT NULL,
    nome character varying(300) NOT NULL
);
 (   DROP TABLE public.conclusao_proposicao;
       public         heap    postgres    false            �            1259    16469    conclusao_proposicao_id_seq    SEQUENCE     �   CREATE SEQUENCE public.conclusao_proposicao_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.conclusao_proposicao_id_seq;
       public          postgres    false    231            �           0    0    conclusao_proposicao_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.conclusao_proposicao_id_seq OWNED BY public.conclusao_proposicao.id;
          public          postgres    false    230                       1259    16636    endereco    TABLE     \  CREATE TABLE public.endereco (
    id integer NOT NULL,
    rua character varying(500) NOT NULL,
    numero character varying(20),
    complemento character varying(1000),
    bairro character varying(500) NOT NULL,
    cep character varying(20),
    cidade character varying(100) NOT NULL,
    uf character(3) NOT NULL,
    fk_entidade integer
);
    DROP TABLE public.endereco;
       public         heap    postgres    false                        1259    16635    endereco_id_seq    SEQUENCE     �   CREATE SEQUENCE public.endereco_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.endereco_id_seq;
       public          postgres    false    257            �           0    0    endereco_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.endereco_id_seq OWNED BY public.endereco.id;
          public          postgres    false    256            �            1259    16445    entidade    TABLE       CREATE TABLE public.entidade (
    id integer NOT NULL,
    nome_camara character varying(300) NOT NULL,
    image character varying(300) NOT NULL,
    home_page character varying(300),
    email character varying(300),
    telefone character varying(20) NOT NULL
);
    DROP TABLE public.entidade;
       public         heap    postgres    false            �            1259    16444    entidade_id_seq    SEQUENCE     �   CREATE SEQUENCE public.entidade_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.entidade_id_seq;
       public          postgres    false    225            �           0    0    entidade_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.entidade_id_seq OWNED BY public.entidade.id;
          public          postgres    false    224                       1259    16848    expediente_bloco_proposicao    TABLE     �   CREATE TABLE public.expediente_bloco_proposicao (
    id integer NOT NULL,
    fk_expedientes integer,
    fk_bloco_proposicao integer
);
 /   DROP TABLE public.expediente_bloco_proposicao;
       public         heap    postgres    false                       1259    16847 "   expediente_bloco_proposicao_id_seq    SEQUENCE     �   CREATE SEQUENCE public.expediente_bloco_proposicao_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.expediente_bloco_proposicao_id_seq;
       public          postgres    false    273            �           0    0 "   expediente_bloco_proposicao_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.expediente_bloco_proposicao_id_seq OWNED BY public.expediente_bloco_proposicao.id;
          public          postgres    false    272                       1259    16884    expediente_proposicao    TABLE        CREATE TABLE public.expediente_proposicao (
    id integer NOT NULL,
    fk_expedientes integer,
    fk_proposicoes integer
);
 )   DROP TABLE public.expediente_proposicao;
       public         heap    postgres    false                       1259    16883    expediente_proposicao_id_seq    SEQUENCE     �   CREATE SEQUENCE public.expediente_proposicao_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.expediente_proposicao_id_seq;
       public          postgres    false    277            �           0    0    expediente_proposicao_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.expediente_proposicao_id_seq OWNED BY public.expediente_proposicao.id;
          public          postgres    false    276                       1259    16828    expedientes    TABLE     �   CREATE TABLE public.expedientes (
    id integer NOT NULL,
    hora_inicio time without time zone NOT NULL,
    duracao interval NOT NULL,
    fk_tipo_expediente integer,
    fk_reuniao integer
);
    DROP TABLE public.expedientes;
       public         heap    postgres    false                       1259    16827    expedientes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.expedientes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.expedientes_id_seq;
       public          postgres    false    271            �           0    0    expedientes_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.expedientes_id_seq OWNED BY public.expedientes.id;
          public          postgres    false    270            �            1259    16512    legislatura    TABLE       CREATE TABLE public.legislatura (
    id integer NOT NULL,
    data_inicial timestamp without time zone NOT NULL,
    data_final timestamp without time zone NOT NULL,
    numero_cadeiras integer NOT NULL,
    quorum_abertura integer NOT NULL,
    fk_entidade integer
);
    DROP TABLE public.legislatura;
       public         heap    postgres    false            �            1259    16511    legislatura_id_seq    SEQUENCE     �   CREATE SEQUENCE public.legislatura_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.legislatura_id_seq;
       public          postgres    false    240            �           0    0    legislatura_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.legislatura_id_seq OWNED BY public.legislatura.id;
          public          postgres    false    239            �            1259    16485    maioria_qualificada    TABLE     �   CREATE TABLE public.maioria_qualificada (
    id integer NOT NULL,
    divisor integer NOT NULL,
    dividendo integer NOT NULL,
    fk_tipo_quorum integer
);
 '   DROP TABLE public.maioria_qualificada;
       public         heap    postgres    false            �            1259    16484    maioria_qualificada_id_seq    SEQUENCE     �   CREATE SEQUENCE public.maioria_qualificada_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.maioria_qualificada_id_seq;
       public          postgres    false    235            �           0    0    maioria_qualificada_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.maioria_qualificada_id_seq OWNED BY public.maioria_qualificada.id;
          public          postgres    false    234                       1259    16759    menu_itens_suspensos    TABLE       CREATE TABLE public.menu_itens_suspensos (
    id integer NOT NULL,
    numero integer NOT NULL,
    nome character varying(500) NOT NULL,
    label character varying(500) NOT NULL,
    menu_rapido character(1) NOT NULL,
    fk_menu_nomes integer,
    menu_rapido_ordem integer
);
 (   DROP TABLE public.menu_itens_suspensos;
       public         heap    postgres    false                       1259    16758    menu_itens_suspensos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.menu_itens_suspensos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.menu_itens_suspensos_id_seq;
       public          postgres    false    263            �           0    0    menu_itens_suspensos_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.menu_itens_suspensos_id_seq OWNED BY public.menu_itens_suspensos.id;
          public          postgres    false    262            �            1259    16503 
   menu_nomes    TABLE     �   CREATE TABLE public.menu_nomes (
    posicao_menu integer NOT NULL,
    nome character varying(500) NOT NULL,
    label character varying(500) NOT NULL
);
    DROP TABLE public.menu_nomes;
       public         heap    postgres    false            �            1259    16607    mesa_diretora    TABLE     �   CREATE TABLE public.mesa_diretora (
    id integer NOT NULL,
    mandato_inicial date NOT NULL,
    mandato_final date NOT NULL,
    fk_chapa integer
);
 !   DROP TABLE public.mesa_diretora;
       public         heap    postgres    false            �            1259    16606    mesa_diretora_id_seq    SEQUENCE     �   CREATE SEQUENCE public.mesa_diretora_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.mesa_diretora_id_seq;
       public          postgres    false    253            �           0    0    mesa_diretora_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.mesa_diretora_id_seq OWNED BY public.mesa_diretora.id;
          public          postgres    false    252            �            1259    16431    partido    TABLE     �   CREATE TABLE public.partido (
    id integer NOT NULL,
    sigla character varying(10) NOT NULL,
    nome character varying(150) NOT NULL
);
    DROP TABLE public.partido;
       public         heap    postgres    false            �            1259    16550    partido_coligacao    TABLE     u   CREATE TABLE public.partido_coligacao (
    id integer NOT NULL,
    fk_coligacao integer,
    fk_partido integer
);
 %   DROP TABLE public.partido_coligacao;
       public         heap    postgres    false            �            1259    16549    partido_coligacao_id_seq    SEQUENCE     �   CREATE SEQUENCE public.partido_coligacao_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.partido_coligacao_id_seq;
       public          postgres    false    246            �           0    0    partido_coligacao_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.partido_coligacao_id_seq OWNED BY public.partido_coligacao.id;
          public          postgres    false    245            �            1259    16430    partido_id_seq    SEQUENCE     �   CREATE SEQUENCE public.partido_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.partido_id_seq;
       public          postgres    false    221            �           0    0    partido_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.partido_id_seq OWNED BY public.partido.id;
          public          postgres    false    220            $           1259    24709    partido_vereador    TABLE        CREATE TABLE public.partido_vereador (
    id integer NOT NULL,
    fk_partido integer,
    fk_pessoa character varying(14)
);
 $   DROP TABLE public.partido_vereador;
       public         heap    postgres    false            #           1259    24708    partido_vereador_id_seq    SEQUENCE     �   CREATE SEQUENCE public.partido_vereador_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.partido_vereador_id_seq;
       public          postgres    false    292            �           0    0    partido_vereador_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.partido_vereador_id_seq OWNED BY public.partido_vereador.id;
          public          postgres    false    291            �            1259    16524    periodo_mesa_diretora    TABLE     �   CREATE TABLE public.periodo_mesa_diretora (
    id integer NOT NULL,
    periodo_inicial timestamp without time zone NOT NULL,
    periodo_final timestamp without time zone NOT NULL,
    fk_legislatura integer
);
 )   DROP TABLE public.periodo_mesa_diretora;
       public         heap    postgres    false            �            1259    16523    periodo_mesa_diretora_id_seq    SEQUENCE     �   CREATE SEQUENCE public.periodo_mesa_diretora_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.periodo_mesa_diretora_id_seq;
       public          postgres    false    242            �           0    0    periodo_mesa_diretora_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.periodo_mesa_diretora_id_seq OWNED BY public.periodo_mesa_diretora.id;
          public          postgres    false    241            �            1259    16566    pessoa    TABLE     �  CREATE TABLE public.pessoa (
    cpf character varying(14) NOT NULL,
    nome character varying(500) NOT NULL,
    apelido_exibicao character varying(500) NOT NULL,
    data_nascimento date NOT NULL,
    deficiente_visual character(1) NOT NULL,
    sexo character varying(10) NOT NULL,
    email character varying(200),
    celular character varying(20),
    imagem character varying(300),
    status character(1),
    fk_entidade integer
);
    DROP TABLE public.pessoa;
       public         heap    postgres    false                       1259    16981    pessoa_presenca_reuniao    TABLE     �   CREATE TABLE public.pessoa_presenca_reuniao (
    id integer NOT NULL,
    fk_reuniao_habilitada integer,
    fk_pessoa character varying(14)
);
 +   DROP TABLE public.pessoa_presenca_reuniao;
       public         heap    postgres    false                       1259    16980    pessoa_presenca_reuniao_id_seq    SEQUENCE     �   CREATE SEQUENCE public.pessoa_presenca_reuniao_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.pessoa_presenca_reuniao_id_seq;
       public          postgres    false    287            �           0    0    pessoa_presenca_reuniao_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.pessoa_presenca_reuniao_id_seq OWNED BY public.pessoa_presenca_reuniao.id;
          public          postgres    false    286            �            1259    16497    prioridade_proposicao    TABLE     q   CREATE TABLE public.prioridade_proposicao (
    id integer NOT NULL,
    nome character varying(100) NOT NULL
);
 )   DROP TABLE public.prioridade_proposicao;
       public         heap    postgres    false            �            1259    16496    prioridade_proposicao_id_seq    SEQUENCE     �   CREATE SEQUENCE public.prioridade_proposicao_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.prioridade_proposicao_id_seq;
       public          postgres    false    237            �           0    0    prioridade_proposicao_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.prioridade_proposicao_id_seq OWNED BY public.prioridade_proposicao.id;
          public          postgres    false    236                       1259    16865    proposicoes    TABLE     �   CREATE TABLE public.proposicoes (
    id integer NOT NULL,
    numero integer NOT NULL,
    data date NOT NULL,
    hora time without time zone NOT NULL,
    ementa text NOT NULL,
    fk_conclusao_proposicao integer,
    fk_tipo_proposicao integer
);
    DROP TABLE public.proposicoes;
       public         heap    postgres    false                       1259    16864    proposicoes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.proposicoes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.proposicoes_id_seq;
       public          postgres    false    275            �           0    0    proposicoes_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.proposicoes_id_seq OWNED BY public.proposicoes.id;
          public          postgres    false    274                       1259    16947    responsavel_reuniao    TABLE     �   CREATE TABLE public.responsavel_reuniao (
    id integer NOT NULL,
    fk_reuniao_habilitada integer,
    fk_pessoa character varying(14)
);
 '   DROP TABLE public.responsavel_reuniao;
       public         heap    postgres    false                       1259    16946    responsavel_reuniao_id_seq    SEQUENCE     �   CREATE SEQUENCE public.responsavel_reuniao_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.responsavel_reuniao_id_seq;
       public          postgres    false    285            �           0    0    responsavel_reuniao_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.responsavel_reuniao_id_seq OWNED BY public.responsavel_reuniao.id;
          public          postgres    false    284                       1259    16724     resultados_votacao_mesa_diretora    TABLE     �   CREATE TABLE public.resultados_votacao_mesa_diretora (
    id integer NOT NULL,
    voto character varying(5) NOT NULL,
    fk_votacao_chapa_mesa_diretora integer,
    fk_chapas integer,
    fk_pessoa character varying(14)
);
 4   DROP TABLE public.resultados_votacao_mesa_diretora;
       public         heap    postgres    false                       1259    16723 '   resultados_votacao_mesa_diretora_id_seq    SEQUENCE     �   CREATE SEQUENCE public.resultados_votacao_mesa_diretora_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public.resultados_votacao_mesa_diretora_id_seq;
       public          postgres    false    261            �           0    0 '   resultados_votacao_mesa_diretora_id_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE public.resultados_votacao_mesa_diretora_id_seq OWNED BY public.resultados_votacao_mesa_diretora.id;
          public          postgres    false    260                       1259    16811    reuniao    TABLE     �   CREATE TABLE public.reuniao (
    id integer NOT NULL,
    data date NOT NULL,
    hora time without time zone NOT NULL,
    status character varying(50) NOT NULL,
    fk_entidade integer,
    fk_tipo_reuniao integer
);
    DROP TABLE public.reuniao;
       public         heap    postgres    false                       1259    16935    reuniao_habilitada    TABLE     �   CREATE TABLE public.reuniao_habilitada (
    id integer NOT NULL,
    hora_iniciada time without time zone NOT NULL,
    status character varying(100) NOT NULL,
    fk_reuniao integer
);
 &   DROP TABLE public.reuniao_habilitada;
       public         heap    postgres    false                       1259    16934    reuniao_habilitada_id_seq    SEQUENCE     �   CREATE SEQUENCE public.reuniao_habilitada_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.reuniao_habilitada_id_seq;
       public          postgres    false    283            �           0    0    reuniao_habilitada_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.reuniao_habilitada_id_seq OWNED BY public.reuniao_habilitada.id;
          public          postgres    false    282                       1259    16810    reuniao_id_seq    SEQUENCE     �   CREATE SEQUENCE public.reuniao_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.reuniao_id_seq;
       public          postgres    false    269            �           0    0    reuniao_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.reuniao_id_seq OWNED BY public.reuniao.id;
          public          postgres    false    268            �            1259    16454    tipo_expediente    TABLE     �   CREATE TABLE public.tipo_expediente (
    id integer NOT NULL,
    nome character varying(500) NOT NULL,
    permite_proposicao character(1) NOT NULL,
    ordem integer NOT NULL
);
 #   DROP TABLE public.tipo_expediente;
       public         heap    postgres    false            �            1259    16453    tipo_expediente_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tipo_expediente_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.tipo_expediente_id_seq;
       public          postgres    false    227            �           0    0    tipo_expediente_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.tipo_expediente_id_seq OWNED BY public.tipo_expediente.id;
          public          postgres    false    226                       1259    16791    tipo_proposicao    TABLE     �   CREATE TABLE public.tipo_proposicao (
    id integer NOT NULL,
    nomenclatura character varying(700) NOT NULL,
    quantidadeturno integer NOT NULL,
    interticio integer NOT NULL,
    fk_prioridade_proposicao integer,
    fk_tipo_quorum integer
);
 #   DROP TABLE public.tipo_proposicao;
       public         heap    postgres    false            
           1259    16790    tipo_proposicao_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tipo_proposicao_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.tipo_proposicao_id_seq;
       public          postgres    false    267            �           0    0    tipo_proposicao_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.tipo_proposicao_id_seq OWNED BY public.tipo_proposicao.id;
          public          postgres    false    266            �            1259    16477    tipo_quorum    TABLE     �   CREATE TABLE public.tipo_quorum (
    id integer NOT NULL,
    maioria_absoluta character(1) NOT NULL,
    maioria_qualificada character(1) NOT NULL,
    maioria_simples character(1) NOT NULL
);
    DROP TABLE public.tipo_quorum;
       public         heap    postgres    false            �            1259    16476    tipo_quorum_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tipo_quorum_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.tipo_quorum_id_seq;
       public          postgres    false    233            �           0    0    tipo_quorum_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.tipo_quorum_id_seq OWNED BY public.tipo_quorum.id;
          public          postgres    false    232            �            1259    16438    tipo_reuniao    TABLE     �   CREATE TABLE public.tipo_reuniao (
    id integer NOT NULL,
    nome character varying(150) NOT NULL,
    numero integer NOT NULL
);
     DROP TABLE public.tipo_reuniao;
       public         heap    postgres    false            �            1259    16437    tipo_reuniao_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tipo_reuniao_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.tipo_reuniao_id_seq;
       public          postgres    false    223            �           0    0    tipo_reuniao_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.tipo_reuniao_id_seq OWNED BY public.tipo_reuniao.id;
          public          postgres    false    222            "           1259    24701    tmp_dev    TABLE     �   CREATE TABLE public.tmp_dev (
    retorno1 integer,
    retorno2 integer,
    retorno3 integer,
    retorno4 character(1),
    retorno5 character(1),
    retorno6 character(1)
);
    DROP TABLE public.tmp_dev;
       public         heap    postgres    false            �            1259    16579    usuarios    TABLE     �   CREATE TABLE public.usuarios (
    id integer NOT NULL,
    login character varying(300) NOT NULL,
    senha character varying(1000) NOT NULL,
    fk_pessoa character varying(14)
);
    DROP TABLE public.usuarios;
       public         heap    postgres    false            �            1259    16578    usuarios_id_seq    SEQUENCE     �   CREATE SEQUENCE public.usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.usuarios_id_seq;
       public          postgres    false    249            �           0    0    usuarios_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuarios.id;
          public          postgres    false    248            �            1259    16417    votacao_chapa_mesa_diretora    TABLE     �   CREATE TABLE public.votacao_chapa_mesa_diretora (
    id integer NOT NULL,
    data timestamp without time zone NOT NULL,
    hora_inicio time without time zone,
    hora_termino time without time zone
);
 /   DROP TABLE public.votacao_chapa_mesa_diretora;
       public         heap    postgres    false            �            1259    16416 "   votacao_chapa_mesa_diretora_id_seq    SEQUENCE     �   CREATE SEQUENCE public.votacao_chapa_mesa_diretora_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.votacao_chapa_mesa_diretora_id_seq;
       public          postgres    false    217            �           0    0 "   votacao_chapa_mesa_diretora_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.votacao_chapa_mesa_diretora_id_seq OWNED BY public.votacao_chapa_mesa_diretora.id;
          public          postgres    false    216            !           1259    16998    votacao_proposicao    TABLE     �   CREATE TABLE public.votacao_proposicao (
    id integer NOT NULL,
    voto character varying(5) NOT NULL,
    fk_reuniao_habilitada integer,
    fk_proposicoes integer,
    fk_pessoa character varying(14)
);
 &   DROP TABLE public.votacao_proposicao;
       public         heap    postgres    false                        1259    16997    votacao_proposicao_id_seq    SEQUENCE     �   CREATE SEQUENCE public.votacao_proposicao_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.votacao_proposicao_id_seq;
       public          postgres    false    289            �           0    0    votacao_proposicao_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.votacao_proposicao_id_seq OWNED BY public.votacao_proposicao.id;
          public          postgres    false    288            C           2604    32900 
   acessos id    DEFAULT     h   ALTER TABLE ONLY public.acessos ALTER COLUMN id SET DEFAULT nextval('public.acessos_id_seq'::regclass);
 9   ALTER TABLE public.acessos ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    264    265    265            K           2604    32901    autor_proposicao id    DEFAULT     z   ALTER TABLE ONLY public.autor_proposicao ALTER COLUMN id SET DEFAULT nextval('public.autor_proposicao_id_seq'::regclass);
 B   ALTER TABLE public.autor_proposicao ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    281    280    281            2           2604    32902    bloco_proposicao id    DEFAULT     z   ALTER TABLE ONLY public.bloco_proposicao ALTER COLUMN id SET DEFAULT nextval('public.bloco_proposicao_id_seq'::regclass);
 B   ALTER TABLE public.bloco_proposicao ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    229    228    229            +           2604    32903    cargo_politico id    DEFAULT     v   ALTER TABLE ONLY public.cargo_politico ALTER COLUMN id SET DEFAULT nextval('public.cargo_politico_id_seq'::regclass);
 @   ALTER TABLE public.cargo_politico ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214    215            >           2604    32904    cargo_politico_pessoa id    DEFAULT     �   ALTER TABLE ONLY public.cargo_politico_pessoa ALTER COLUMN id SET DEFAULT nextval('public.cargo_politico_pessoa_id_seq'::regclass);
 G   ALTER TABLE public.cargo_politico_pessoa ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    255    254    255            -           2604    32905    cargos_mesa_diretora id    DEFAULT     �   ALTER TABLE ONLY public.cargos_mesa_diretora ALTER COLUMN id SET DEFAULT nextval('public.cargos_mesa_diretora_id_seq'::regclass);
 F   ALTER TABLE public.cargos_mesa_diretora ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218    219            <           2604    32906 	   chapas id    DEFAULT     f   ALTER TABLE ONLY public.chapas ALTER COLUMN id SET DEFAULT nextval('public.chapas_id_seq'::regclass);
 8   ALTER TABLE public.chapas ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    250    251    251            @           2604    32907    chapas_pessoa id    DEFAULT     t   ALTER TABLE ONLY public.chapas_pessoa ALTER COLUMN id SET DEFAULT nextval('public.chapas_pessoa_id_seq'::regclass);
 ?   ALTER TABLE public.chapas_pessoa ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    258    259    259            9           2604    32908    coligacao id    DEFAULT     l   ALTER TABLE ONLY public.coligacao ALTER COLUMN id SET DEFAULT nextval('public.coligacao_id_seq'::regclass);
 ;   ALTER TABLE public.coligacao ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    244    243    244            J           2604    32909    composicao_bloco_proposicao id    DEFAULT     �   ALTER TABLE ONLY public.composicao_bloco_proposicao ALTER COLUMN id SET DEFAULT nextval('public.composicao_bloco_proposicao_id_seq'::regclass);
 M   ALTER TABLE public.composicao_bloco_proposicao ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    278    279    279            3           2604    32910    conclusao_proposicao id    DEFAULT     �   ALTER TABLE ONLY public.conclusao_proposicao ALTER COLUMN id SET DEFAULT nextval('public.conclusao_proposicao_id_seq'::regclass);
 F   ALTER TABLE public.conclusao_proposicao ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    231    230    231            ?           2604    32911    endereco id    DEFAULT     j   ALTER TABLE ONLY public.endereco ALTER COLUMN id SET DEFAULT nextval('public.endereco_id_seq'::regclass);
 :   ALTER TABLE public.endereco ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    256    257    257            0           2604    32912    entidade id    DEFAULT     j   ALTER TABLE ONLY public.entidade ALTER COLUMN id SET DEFAULT nextval('public.entidade_id_seq'::regclass);
 :   ALTER TABLE public.entidade ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    224    225            G           2604    32913    expediente_bloco_proposicao id    DEFAULT     �   ALTER TABLE ONLY public.expediente_bloco_proposicao ALTER COLUMN id SET DEFAULT nextval('public.expediente_bloco_proposicao_id_seq'::regclass);
 M   ALTER TABLE public.expediente_bloco_proposicao ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    272    273    273            I           2604    32914    expediente_proposicao id    DEFAULT     �   ALTER TABLE ONLY public.expediente_proposicao ALTER COLUMN id SET DEFAULT nextval('public.expediente_proposicao_id_seq'::regclass);
 G   ALTER TABLE public.expediente_proposicao ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    277    276    277            F           2604    32915    expedientes id    DEFAULT     p   ALTER TABLE ONLY public.expedientes ALTER COLUMN id SET DEFAULT nextval('public.expedientes_id_seq'::regclass);
 =   ALTER TABLE public.expedientes ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    271    270    271            7           2604    32916    legislatura id    DEFAULT     p   ALTER TABLE ONLY public.legislatura ALTER COLUMN id SET DEFAULT nextval('public.legislatura_id_seq'::regclass);
 =   ALTER TABLE public.legislatura ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    240    239    240            5           2604    32917    maioria_qualificada id    DEFAULT     �   ALTER TABLE ONLY public.maioria_qualificada ALTER COLUMN id SET DEFAULT nextval('public.maioria_qualificada_id_seq'::regclass);
 E   ALTER TABLE public.maioria_qualificada ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    234    235    235            B           2604    32918    menu_itens_suspensos id    DEFAULT     �   ALTER TABLE ONLY public.menu_itens_suspensos ALTER COLUMN id SET DEFAULT nextval('public.menu_itens_suspensos_id_seq'::regclass);
 F   ALTER TABLE public.menu_itens_suspensos ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    262    263    263            =           2604    32919    mesa_diretora id    DEFAULT     t   ALTER TABLE ONLY public.mesa_diretora ALTER COLUMN id SET DEFAULT nextval('public.mesa_diretora_id_seq'::regclass);
 ?   ALTER TABLE public.mesa_diretora ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    253    252    253            .           2604    32920 
   partido id    DEFAULT     h   ALTER TABLE ONLY public.partido ALTER COLUMN id SET DEFAULT nextval('public.partido_id_seq'::regclass);
 9   ALTER TABLE public.partido ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    221    221            :           2604    32921    partido_coligacao id    DEFAULT     |   ALTER TABLE ONLY public.partido_coligacao ALTER COLUMN id SET DEFAULT nextval('public.partido_coligacao_id_seq'::regclass);
 C   ALTER TABLE public.partido_coligacao ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    246    245    246            P           2604    32922    partido_vereador id    DEFAULT     z   ALTER TABLE ONLY public.partido_vereador ALTER COLUMN id SET DEFAULT nextval('public.partido_vereador_id_seq'::regclass);
 B   ALTER TABLE public.partido_vereador ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    291    292    292            8           2604    32923    periodo_mesa_diretora id    DEFAULT     �   ALTER TABLE ONLY public.periodo_mesa_diretora ALTER COLUMN id SET DEFAULT nextval('public.periodo_mesa_diretora_id_seq'::regclass);
 G   ALTER TABLE public.periodo_mesa_diretora ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    242    241    242            N           2604    32924    pessoa_presenca_reuniao id    DEFAULT     �   ALTER TABLE ONLY public.pessoa_presenca_reuniao ALTER COLUMN id SET DEFAULT nextval('public.pessoa_presenca_reuniao_id_seq'::regclass);
 I   ALTER TABLE public.pessoa_presenca_reuniao ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    287    286    287            6           2604    32925    prioridade_proposicao id    DEFAULT     �   ALTER TABLE ONLY public.prioridade_proposicao ALTER COLUMN id SET DEFAULT nextval('public.prioridade_proposicao_id_seq'::regclass);
 G   ALTER TABLE public.prioridade_proposicao ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    237    236    237            H           2604    32926    proposicoes id    DEFAULT     p   ALTER TABLE ONLY public.proposicoes ALTER COLUMN id SET DEFAULT nextval('public.proposicoes_id_seq'::regclass);
 =   ALTER TABLE public.proposicoes ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    274    275    275            M           2604    32927    responsavel_reuniao id    DEFAULT     �   ALTER TABLE ONLY public.responsavel_reuniao ALTER COLUMN id SET DEFAULT nextval('public.responsavel_reuniao_id_seq'::regclass);
 E   ALTER TABLE public.responsavel_reuniao ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    284    285    285            A           2604    32928 #   resultados_votacao_mesa_diretora id    DEFAULT     �   ALTER TABLE ONLY public.resultados_votacao_mesa_diretora ALTER COLUMN id SET DEFAULT nextval('public.resultados_votacao_mesa_diretora_id_seq'::regclass);
 R   ALTER TABLE public.resultados_votacao_mesa_diretora ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    261    260    261            E           2604    32929 
   reuniao id    DEFAULT     h   ALTER TABLE ONLY public.reuniao ALTER COLUMN id SET DEFAULT nextval('public.reuniao_id_seq'::regclass);
 9   ALTER TABLE public.reuniao ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    268    269    269            L           2604    32930    reuniao_habilitada id    DEFAULT     ~   ALTER TABLE ONLY public.reuniao_habilitada ALTER COLUMN id SET DEFAULT nextval('public.reuniao_habilitada_id_seq'::regclass);
 D   ALTER TABLE public.reuniao_habilitada ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    283    282    283            1           2604    32931    tipo_expediente id    DEFAULT     x   ALTER TABLE ONLY public.tipo_expediente ALTER COLUMN id SET DEFAULT nextval('public.tipo_expediente_id_seq'::regclass);
 A   ALTER TABLE public.tipo_expediente ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    226    227    227            D           2604    32932    tipo_proposicao id    DEFAULT     x   ALTER TABLE ONLY public.tipo_proposicao ALTER COLUMN id SET DEFAULT nextval('public.tipo_proposicao_id_seq'::regclass);
 A   ALTER TABLE public.tipo_proposicao ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    266    267    267            4           2604    32933    tipo_quorum id    DEFAULT     p   ALTER TABLE ONLY public.tipo_quorum ALTER COLUMN id SET DEFAULT nextval('public.tipo_quorum_id_seq'::regclass);
 =   ALTER TABLE public.tipo_quorum ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    232    233    233            /           2604    32934    tipo_reuniao id    DEFAULT     r   ALTER TABLE ONLY public.tipo_reuniao ALTER COLUMN id SET DEFAULT nextval('public.tipo_reuniao_id_seq'::regclass);
 >   ALTER TABLE public.tipo_reuniao ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    223    223            ;           2604    32935    usuarios id    DEFAULT     j   ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);
 :   ALTER TABLE public.usuarios ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    249    248    249            ,           2604    32936    votacao_chapa_mesa_diretora id    DEFAULT     �   ALTER TABLE ONLY public.votacao_chapa_mesa_diretora ALTER COLUMN id SET DEFAULT nextval('public.votacao_chapa_mesa_diretora_id_seq'::regclass);
 M   ALTER TABLE public.votacao_chapa_mesa_diretora ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216    217            O           2604    32937    votacao_proposicao id    DEFAULT     ~   ALTER TABLE ONLY public.votacao_proposicao ALTER COLUMN id SET DEFAULT nextval('public.votacao_proposicao_id_seq'::regclass);
 D   ALTER TABLE public.votacao_proposicao ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    288    289    289            �          0    16774    acessos 
   TABLE DATA           b   COPY public.acessos (id, acesso, alterar, novo, fk_menu_itens_suspensos, fk_usuarios) FROM stdin;
    public          postgres    false    265   ��      �          0    16918    autor_proposicao 
   TABLE DATA           I   COPY public.autor_proposicao (id, fk_pessoa, fk_proposicoes) FROM stdin;
    public          postgres    false    281   ��      p          0    16463    bloco_proposicao 
   TABLE DATA           F   COPY public.bloco_proposicao (id, nome, resultado_status) FROM stdin;
    public          postgres    false    229   ԩ      b          0    16396    cargo_politico 
   TABLE DATA           2   COPY public.cargo_politico (id, nome) FROM stdin;
    public          postgres    false    215   �      �          0    16619    cargo_politico_pessoa 
   TABLE DATA           Q   COPY public.cargo_politico_pessoa (id, fk_pessoa, fk_cargo_politico) FROM stdin;
    public          postgres    false    255   �      f          0    16424    cargos_mesa_diretora 
   TABLE DATA           8   COPY public.cargos_mesa_diretora (id, nome) FROM stdin;
    public          postgres    false    219   +�      �          0    16593    chapas 
   TABLE DATA           D   COPY public.chapas (id, nome, fk_periodo_mesa_diretora) FROM stdin;
    public          postgres    false    251   H�      �          0    16702    chapas_pessoa 
   TABLE DATA           Z   COPY public.chapas_pessoa (id, fk_pessoa, fk_chapas, fk_cargos_mesa_diretora) FROM stdin;
    public          postgres    false    259   e�                0    16536 	   coligacao 
   TABLE DATA           =   COPY public.coligacao (id, nome, fk_legislatura) FROM stdin;
    public          postgres    false    244   ��      �          0    16901    composicao_bloco_proposicao 
   TABLE DATA           ^   COPY public.composicao_bloco_proposicao (id, fk_proposicoes, fk_bloco_proposicao) FROM stdin;
    public          postgres    false    279   ֪      r          0    16470    conclusao_proposicao 
   TABLE DATA           8   COPY public.conclusao_proposicao (id, nome) FROM stdin;
    public          postgres    false    231   �      �          0    16636    endereco 
   TABLE DATA           f   COPY public.endereco (id, rua, numero, complemento, bairro, cep, cidade, uf, fk_entidade) FROM stdin;
    public          postgres    false    257   �      l          0    16445    entidade 
   TABLE DATA           V   COPY public.entidade (id, nome_camara, image, home_page, email, telefone) FROM stdin;
    public          postgres    false    225   -�      �          0    16848    expediente_bloco_proposicao 
   TABLE DATA           ^   COPY public.expediente_bloco_proposicao (id, fk_expedientes, fk_bloco_proposicao) FROM stdin;
    public          postgres    false    273   v�      �          0    16884    expediente_proposicao 
   TABLE DATA           S   COPY public.expediente_proposicao (id, fk_expedientes, fk_proposicoes) FROM stdin;
    public          postgres    false    277   ��      �          0    16828    expedientes 
   TABLE DATA           _   COPY public.expedientes (id, hora_inicio, duracao, fk_tipo_expediente, fk_reuniao) FROM stdin;
    public          postgres    false    271   ��      {          0    16512    legislatura 
   TABLE DATA           r   COPY public.legislatura (id, data_inicial, data_final, numero_cadeiras, quorum_abertura, fk_entidade) FROM stdin;
    public          postgres    false    240   ͫ      v          0    16485    maioria_qualificada 
   TABLE DATA           U   COPY public.maioria_qualificada (id, divisor, dividendo, fk_tipo_quorum) FROM stdin;
    public          postgres    false    235   �      �          0    16759    menu_itens_suspensos 
   TABLE DATA           v   COPY public.menu_itens_suspensos (id, numero, nome, label, menu_rapido, fk_menu_nomes, menu_rapido_ordem) FROM stdin;
    public          postgres    false    263   0�      y          0    16503 
   menu_nomes 
   TABLE DATA           ?   COPY public.menu_nomes (posicao_menu, nome, label) FROM stdin;
    public          postgres    false    238   ٮ      �          0    16607    mesa_diretora 
   TABLE DATA           U   COPY public.mesa_diretora (id, mandato_inicial, mandato_final, fk_chapa) FROM stdin;
    public          postgres    false    253   ��      h          0    16431    partido 
   TABLE DATA           2   COPY public.partido (id, sigla, nome) FROM stdin;
    public          postgres    false    221   ��      �          0    16550    partido_coligacao 
   TABLE DATA           I   COPY public.partido_coligacao (id, fk_coligacao, fk_partido) FROM stdin;
    public          postgres    false    246   ��      �          0    24709    partido_vereador 
   TABLE DATA           E   COPY public.partido_vereador (id, fk_partido, fk_pessoa) FROM stdin;
    public          postgres    false    292   �      }          0    16524    periodo_mesa_diretora 
   TABLE DATA           c   COPY public.periodo_mesa_diretora (id, periodo_inicial, periodo_final, fk_legislatura) FROM stdin;
    public          postgres    false    242   �      �          0    16566    pessoa 
   TABLE DATA           �   COPY public.pessoa (cpf, nome, apelido_exibicao, data_nascimento, deficiente_visual, sexo, email, celular, imagem, status, fk_entidade) FROM stdin;
    public          postgres    false    247   /�      �          0    16981    pessoa_presenca_reuniao 
   TABLE DATA           W   COPY public.pessoa_presenca_reuniao (id, fk_reuniao_habilitada, fk_pessoa) FROM stdin;
    public          postgres    false    287   �      x          0    16497    prioridade_proposicao 
   TABLE DATA           9   COPY public.prioridade_proposicao (id, nome) FROM stdin;
    public          postgres    false    237   )�      �          0    16865    proposicoes 
   TABLE DATA           r   COPY public.proposicoes (id, numero, data, hora, ementa, fk_conclusao_proposicao, fk_tipo_proposicao) FROM stdin;
    public          postgres    false    275   F�      �          0    16947    responsavel_reuniao 
   TABLE DATA           S   COPY public.responsavel_reuniao (id, fk_reuniao_habilitada, fk_pessoa) FROM stdin;
    public          postgres    false    285   c�      �          0    16724     resultados_votacao_mesa_diretora 
   TABLE DATA           z   COPY public.resultados_votacao_mesa_diretora (id, voto, fk_votacao_chapa_mesa_diretora, fk_chapas, fk_pessoa) FROM stdin;
    public          postgres    false    261   ��      �          0    16811    reuniao 
   TABLE DATA           W   COPY public.reuniao (id, data, hora, status, fk_entidade, fk_tipo_reuniao) FROM stdin;
    public          postgres    false    269   ��      �          0    16935    reuniao_habilitada 
   TABLE DATA           S   COPY public.reuniao_habilitada (id, hora_iniciada, status, fk_reuniao) FROM stdin;
    public          postgres    false    283   ��      n          0    16454    tipo_expediente 
   TABLE DATA           N   COPY public.tipo_expediente (id, nome, permite_proposicao, ordem) FROM stdin;
    public          postgres    false    227   ײ      �          0    16791    tipo_proposicao 
   TABLE DATA           �   COPY public.tipo_proposicao (id, nomenclatura, quantidadeturno, interticio, fk_prioridade_proposicao, fk_tipo_quorum) FROM stdin;
    public          postgres    false    267   ��      t          0    16477    tipo_quorum 
   TABLE DATA           a   COPY public.tipo_quorum (id, maioria_absoluta, maioria_qualificada, maioria_simples) FROM stdin;
    public          postgres    false    233   �      j          0    16438    tipo_reuniao 
   TABLE DATA           8   COPY public.tipo_reuniao (id, nome, numero) FROM stdin;
    public          postgres    false    223   .�      �          0    24701    tmp_dev 
   TABLE DATA           ]   COPY public.tmp_dev (retorno1, retorno2, retorno3, retorno4, retorno5, retorno6) FROM stdin;
    public          postgres    false    290   K�      �          0    16579    usuarios 
   TABLE DATA           ?   COPY public.usuarios (id, login, senha, fk_pessoa) FROM stdin;
    public          postgres    false    249   ��      d          0    16417    votacao_chapa_mesa_diretora 
   TABLE DATA           Z   COPY public.votacao_chapa_mesa_diretora (id, data, hora_inicio, hora_termino) FROM stdin;
    public          postgres    false    217   �      �          0    16998    votacao_proposicao 
   TABLE DATA           h   COPY public.votacao_proposicao (id, voto, fk_reuniao_habilitada, fk_proposicoes, fk_pessoa) FROM stdin;
    public          postgres    false    289   1�      �           0    0    acessos_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.acessos_id_seq', 92, true);
          public          postgres    false    264            �           0    0    autor_proposicao_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.autor_proposicao_id_seq', 1, false);
          public          postgres    false    280            �           0    0    bloco_proposicao_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.bloco_proposicao_id_seq', 1, false);
          public          postgres    false    228            �           0    0    cargo_politico_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.cargo_politico_id_seq', 1, false);
          public          postgres    false    214            �           0    0    cargo_politico_pessoa_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.cargo_politico_pessoa_id_seq', 1, false);
          public          postgres    false    254            �           0    0    cargos_mesa_diretora_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.cargos_mesa_diretora_id_seq', 1, false);
          public          postgres    false    218            �           0    0    chapas_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.chapas_id_seq', 1, false);
          public          postgres    false    250            �           0    0    chapas_pessoa_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.chapas_pessoa_id_seq', 1, false);
          public          postgres    false    258            �           0    0    coligacao_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.coligacao_id_seq', 3, true);
          public          postgres    false    243            �           0    0 "   composicao_bloco_proposicao_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.composicao_bloco_proposicao_id_seq', 1, false);
          public          postgres    false    278            �           0    0    conclusao_proposicao_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.conclusao_proposicao_id_seq', 1, false);
          public          postgres    false    230            �           0    0    endereco_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.endereco_id_seq', 1, false);
          public          postgres    false    256            �           0    0    entidade_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.entidade_id_seq', 1, true);
          public          postgres    false    224            �           0    0 "   expediente_bloco_proposicao_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.expediente_bloco_proposicao_id_seq', 1, false);
          public          postgres    false    272            �           0    0    expediente_proposicao_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.expediente_proposicao_id_seq', 1, false);
          public          postgres    false    276            �           0    0    expedientes_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.expedientes_id_seq', 1, false);
          public          postgres    false    270            �           0    0    legislatura_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.legislatura_id_seq', 2, true);
          public          postgres    false    239            �           0    0    maioria_qualificada_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.maioria_qualificada_id_seq', 1, true);
          public          postgres    false    234            �           0    0    menu_itens_suspensos_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.menu_itens_suspensos_id_seq', 31, true);
          public          postgres    false    262            �           0    0    mesa_diretora_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.mesa_diretora_id_seq', 1, false);
          public          postgres    false    252            �           0    0    partido_coligacao_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.partido_coligacao_id_seq', 2, true);
          public          postgres    false    245            �           0    0    partido_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.partido_id_seq', 12, true);
          public          postgres    false    220            �           0    0    partido_vereador_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.partido_vereador_id_seq', 1, true);
          public          postgres    false    291            �           0    0    periodo_mesa_diretora_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.periodo_mesa_diretora_id_seq', 1, false);
          public          postgres    false    241            �           0    0    pessoa_presenca_reuniao_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.pessoa_presenca_reuniao_id_seq', 1, false);
          public          postgres    false    286            �           0    0    prioridade_proposicao_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.prioridade_proposicao_id_seq', 1, false);
          public          postgres    false    236            �           0    0    proposicoes_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.proposicoes_id_seq', 1, false);
          public          postgres    false    274            �           0    0    responsavel_reuniao_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.responsavel_reuniao_id_seq', 1, false);
          public          postgres    false    284            �           0    0 '   resultados_votacao_mesa_diretora_id_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public.resultados_votacao_mesa_diretora_id_seq', 1, false);
          public          postgres    false    260            �           0    0    reuniao_habilitada_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.reuniao_habilitada_id_seq', 1, false);
          public          postgres    false    282            �           0    0    reuniao_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.reuniao_id_seq', 1, false);
          public          postgres    false    268            �           0    0    tipo_expediente_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.tipo_expediente_id_seq', 1, false);
          public          postgres    false    226            �           0    0    tipo_proposicao_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.tipo_proposicao_id_seq', 1, false);
          public          postgres    false    266            �           0    0    tipo_quorum_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.tipo_quorum_id_seq', 1, false);
          public          postgres    false    232            �           0    0    tipo_reuniao_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.tipo_reuniao_id_seq', 1, false);
          public          postgres    false    222            �           0    0    usuarios_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.usuarios_id_seq', 3, true);
          public          postgres    false    248                        0    0 "   votacao_chapa_mesa_diretora_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.votacao_chapa_mesa_diretora_id_seq', 1, false);
          public          postgres    false    216                       0    0    votacao_proposicao_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.votacao_proposicao_id_seq', 1, false);
          public          postgres    false    288            �           2606    16779    acessos acessos_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.acessos
    ADD CONSTRAINT acessos_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.acessos DROP CONSTRAINT acessos_pkey;
       public            postgres    false    265            �           2606    16923 &   autor_proposicao autor_proposicao_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.autor_proposicao
    ADD CONSTRAINT autor_proposicao_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.autor_proposicao DROP CONSTRAINT autor_proposicao_pkey;
       public            postgres    false    281            `           2606    16468 &   bloco_proposicao bloco_proposicao_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.bloco_proposicao
    ADD CONSTRAINT bloco_proposicao_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.bloco_proposicao DROP CONSTRAINT bloco_proposicao_pkey;
       public            postgres    false    229            ~           2606    16624 0   cargo_politico_pessoa cargo_politico_pessoa_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.cargo_politico_pessoa
    ADD CONSTRAINT cargo_politico_pessoa_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.cargo_politico_pessoa DROP CONSTRAINT cargo_politico_pessoa_pkey;
       public            postgres    false    255            R           2606    16401 "   cargo_politico cargo_politico_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.cargo_politico
    ADD CONSTRAINT cargo_politico_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.cargo_politico DROP CONSTRAINT cargo_politico_pkey;
       public            postgres    false    215            V           2606    16429 .   cargos_mesa_diretora cargos_mesa_diretora_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.cargos_mesa_diretora
    ADD CONSTRAINT cargos_mesa_diretora_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.cargos_mesa_diretora DROP CONSTRAINT cargos_mesa_diretora_pkey;
       public            postgres    false    219            �           2606    16707     chapas_pessoa chapas_pessoa_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.chapas_pessoa
    ADD CONSTRAINT chapas_pessoa_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.chapas_pessoa DROP CONSTRAINT chapas_pessoa_pkey;
       public            postgres    false    259            z           2606    16600    chapas chapas_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.chapas
    ADD CONSTRAINT chapas_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.chapas DROP CONSTRAINT chapas_pkey;
       public            postgres    false    251            p           2606    16543    coligacao coligacao_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.coligacao
    ADD CONSTRAINT coligacao_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.coligacao DROP CONSTRAINT coligacao_pkey;
       public            postgres    false    244            �           2606    16906 <   composicao_bloco_proposicao composicao_bloco_proposicao_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public.composicao_bloco_proposicao
    ADD CONSTRAINT composicao_bloco_proposicao_pkey PRIMARY KEY (id);
 f   ALTER TABLE ONLY public.composicao_bloco_proposicao DROP CONSTRAINT composicao_bloco_proposicao_pkey;
       public            postgres    false    279            b           2606    16475 .   conclusao_proposicao conclusao_proposicao_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.conclusao_proposicao
    ADD CONSTRAINT conclusao_proposicao_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.conclusao_proposicao DROP CONSTRAINT conclusao_proposicao_pkey;
       public            postgres    false    231            �           2606    16643    endereco endereco_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.endereco
    ADD CONSTRAINT endereco_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.endereco DROP CONSTRAINT endereco_pkey;
       public            postgres    false    257            \           2606    16452    entidade entidade_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.entidade
    ADD CONSTRAINT entidade_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.entidade DROP CONSTRAINT entidade_pkey;
       public            postgres    false    225            �           2606    16853 <   expediente_bloco_proposicao expediente_bloco_proposicao_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public.expediente_bloco_proposicao
    ADD CONSTRAINT expediente_bloco_proposicao_pkey PRIMARY KEY (id);
 f   ALTER TABLE ONLY public.expediente_bloco_proposicao DROP CONSTRAINT expediente_bloco_proposicao_pkey;
       public            postgres    false    273            �           2606    16889 0   expediente_proposicao expediente_proposicao_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.expediente_proposicao
    ADD CONSTRAINT expediente_proposicao_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.expediente_proposicao DROP CONSTRAINT expediente_proposicao_pkey;
       public            postgres    false    277            �           2606    16833    expedientes expedientes_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.expedientes
    ADD CONSTRAINT expedientes_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.expedientes DROP CONSTRAINT expedientes_pkey;
       public            postgres    false    271            l           2606    16517    legislatura legislatura_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.legislatura
    ADD CONSTRAINT legislatura_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.legislatura DROP CONSTRAINT legislatura_pkey;
       public            postgres    false    240            f           2606    16490 ,   maioria_qualificada maioria_qualificada_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.maioria_qualificada
    ADD CONSTRAINT maioria_qualificada_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.maioria_qualificada DROP CONSTRAINT maioria_qualificada_pkey;
       public            postgres    false    235            �           2606    16766 .   menu_itens_suspensos menu_itens_suspensos_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.menu_itens_suspensos
    ADD CONSTRAINT menu_itens_suspensos_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.menu_itens_suspensos DROP CONSTRAINT menu_itens_suspensos_pkey;
       public            postgres    false    263            j           2606    16509    menu_nomes menu_nomes_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.menu_nomes
    ADD CONSTRAINT menu_nomes_pkey PRIMARY KEY (posicao_menu);
 D   ALTER TABLE ONLY public.menu_nomes DROP CONSTRAINT menu_nomes_pkey;
       public            postgres    false    238            |           2606    16612     mesa_diretora mesa_diretora_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.mesa_diretora
    ADD CONSTRAINT mesa_diretora_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.mesa_diretora DROP CONSTRAINT mesa_diretora_pkey;
       public            postgres    false    253            r           2606    16555 (   partido_coligacao partido_coligacao_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.partido_coligacao
    ADD CONSTRAINT partido_coligacao_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.partido_coligacao DROP CONSTRAINT partido_coligacao_pkey;
       public            postgres    false    246            X           2606    16436    partido partido_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.partido
    ADD CONSTRAINT partido_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.partido DROP CONSTRAINT partido_pkey;
       public            postgres    false    221            �           2606    24714 &   partido_vereador partido_vereador_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.partido_vereador
    ADD CONSTRAINT partido_vereador_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.partido_vereador DROP CONSTRAINT partido_vereador_pkey;
       public            postgres    false    292            n           2606    16529 0   periodo_mesa_diretora periodo_mesa_diretora_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.periodo_mesa_diretora
    ADD CONSTRAINT periodo_mesa_diretora_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.periodo_mesa_diretora DROP CONSTRAINT periodo_mesa_diretora_pkey;
       public            postgres    false    242            t           2606    16572    pessoa pessoa_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.pessoa
    ADD CONSTRAINT pessoa_pkey PRIMARY KEY (cpf);
 <   ALTER TABLE ONLY public.pessoa DROP CONSTRAINT pessoa_pkey;
       public            postgres    false    247            �           2606    16986 4   pessoa_presenca_reuniao pessoa_presenca_reuniao_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.pessoa_presenca_reuniao
    ADD CONSTRAINT pessoa_presenca_reuniao_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.pessoa_presenca_reuniao DROP CONSTRAINT pessoa_presenca_reuniao_pkey;
       public            postgres    false    287            h           2606    16502 0   prioridade_proposicao prioridade_proposicao_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.prioridade_proposicao
    ADD CONSTRAINT prioridade_proposicao_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.prioridade_proposicao DROP CONSTRAINT prioridade_proposicao_pkey;
       public            postgres    false    237            �           2606    16872    proposicoes proposicoes_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.proposicoes
    ADD CONSTRAINT proposicoes_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.proposicoes DROP CONSTRAINT proposicoes_pkey;
       public            postgres    false    275            �           2606    16952 ,   responsavel_reuniao responsavel_reuniao_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.responsavel_reuniao
    ADD CONSTRAINT responsavel_reuniao_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.responsavel_reuniao DROP CONSTRAINT responsavel_reuniao_pkey;
       public            postgres    false    285            �           2606    16729 F   resultados_votacao_mesa_diretora resultados_votacao_mesa_diretora_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.resultados_votacao_mesa_diretora
    ADD CONSTRAINT resultados_votacao_mesa_diretora_pkey PRIMARY KEY (id);
 p   ALTER TABLE ONLY public.resultados_votacao_mesa_diretora DROP CONSTRAINT resultados_votacao_mesa_diretora_pkey;
       public            postgres    false    261            �           2606    16940 *   reuniao_habilitada reuniao_habilitada_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.reuniao_habilitada
    ADD CONSTRAINT reuniao_habilitada_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.reuniao_habilitada DROP CONSTRAINT reuniao_habilitada_pkey;
       public            postgres    false    283            �           2606    16816    reuniao reuniao_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.reuniao
    ADD CONSTRAINT reuniao_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.reuniao DROP CONSTRAINT reuniao_pkey;
       public            postgres    false    269            ^           2606    16461 $   tipo_expediente tipo_expediente_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.tipo_expediente
    ADD CONSTRAINT tipo_expediente_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.tipo_expediente DROP CONSTRAINT tipo_expediente_pkey;
       public            postgres    false    227            �           2606    16798 $   tipo_proposicao tipo_proposicao_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.tipo_proposicao
    ADD CONSTRAINT tipo_proposicao_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.tipo_proposicao DROP CONSTRAINT tipo_proposicao_pkey;
       public            postgres    false    267            d           2606    16482    tipo_quorum tipo_quorum_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.tipo_quorum
    ADD CONSTRAINT tipo_quorum_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.tipo_quorum DROP CONSTRAINT tipo_quorum_pkey;
       public            postgres    false    233            Z           2606    16443    tipo_reuniao tipo_reuniao_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.tipo_reuniao
    ADD CONSTRAINT tipo_reuniao_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.tipo_reuniao DROP CONSTRAINT tipo_reuniao_pkey;
       public            postgres    false    223            v           2606    24677    usuarios unq_login 
   CONSTRAINT     N   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT unq_login UNIQUE (login);
 <   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT unq_login;
       public            postgres    false    249            x           2606    16586    usuarios usuarios_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_pkey;
       public            postgres    false    249            T           2606    16422 <   votacao_chapa_mesa_diretora votacao_chapa_mesa_diretora_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public.votacao_chapa_mesa_diretora
    ADD CONSTRAINT votacao_chapa_mesa_diretora_pkey PRIMARY KEY (id);
 f   ALTER TABLE ONLY public.votacao_chapa_mesa_diretora DROP CONSTRAINT votacao_chapa_mesa_diretora_pkey;
       public            postgres    false    217            �           2606    17003 *   votacao_proposicao votacao_proposicao_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.votacao_proposicao
    ADD CONSTRAINT votacao_proposicao_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.votacao_proposicao DROP CONSTRAINT votacao_proposicao_pkey;
       public            postgres    false    289            �           2606    16780 ,   acessos acessos_fk_menu_itens_suspensos_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.acessos
    ADD CONSTRAINT acessos_fk_menu_itens_suspensos_fkey FOREIGN KEY (fk_menu_itens_suspensos) REFERENCES public.menu_itens_suspensos(id);
 V   ALTER TABLE ONLY public.acessos DROP CONSTRAINT acessos_fk_menu_itens_suspensos_fkey;
       public          postgres    false    265    263    3462            �           2606    16785     acessos acessos_fk_usuarios_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.acessos
    ADD CONSTRAINT acessos_fk_usuarios_fkey FOREIGN KEY (fk_usuarios) REFERENCES public.usuarios(id);
 J   ALTER TABLE ONLY public.acessos DROP CONSTRAINT acessos_fk_usuarios_fkey;
       public          postgres    false    3448    249    265            �           2606    16924 0   autor_proposicao autor_proposicao_fk_pessoa_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.autor_proposicao
    ADD CONSTRAINT autor_proposicao_fk_pessoa_fkey FOREIGN KEY (fk_pessoa) REFERENCES public.pessoa(cpf);
 Z   ALTER TABLE ONLY public.autor_proposicao DROP CONSTRAINT autor_proposicao_fk_pessoa_fkey;
       public          postgres    false    281    3444    247            �           2606    16929 5   autor_proposicao autor_proposicao_fk_proposicoes_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.autor_proposicao
    ADD CONSTRAINT autor_proposicao_fk_proposicoes_fkey FOREIGN KEY (fk_proposicoes) REFERENCES public.proposicoes(id);
 _   ALTER TABLE ONLY public.autor_proposicao DROP CONSTRAINT autor_proposicao_fk_proposicoes_fkey;
       public          postgres    false    281    3474    275            �           2606    16630 B   cargo_politico_pessoa cargo_politico_pessoa_fk_cargo_politico_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cargo_politico_pessoa
    ADD CONSTRAINT cargo_politico_pessoa_fk_cargo_politico_fkey FOREIGN KEY (fk_cargo_politico) REFERENCES public.cargo_politico(id);
 l   ALTER TABLE ONLY public.cargo_politico_pessoa DROP CONSTRAINT cargo_politico_pessoa_fk_cargo_politico_fkey;
       public          postgres    false    255    215    3410            �           2606    16625 :   cargo_politico_pessoa cargo_politico_pessoa_fk_pessoa_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cargo_politico_pessoa
    ADD CONSTRAINT cargo_politico_pessoa_fk_pessoa_fkey FOREIGN KEY (fk_pessoa) REFERENCES public.pessoa(cpf);
 d   ALTER TABLE ONLY public.cargo_politico_pessoa DROP CONSTRAINT cargo_politico_pessoa_fk_pessoa_fkey;
       public          postgres    false    3444    255    247            �           2606    16601 +   chapas chapas_fk_periodo_mesa_diretora_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.chapas
    ADD CONSTRAINT chapas_fk_periodo_mesa_diretora_fkey FOREIGN KEY (fk_periodo_mesa_diretora) REFERENCES public.periodo_mesa_diretora(id);
 U   ALTER TABLE ONLY public.chapas DROP CONSTRAINT chapas_fk_periodo_mesa_diretora_fkey;
       public          postgres    false    3438    242    251            �           2606    16718 8   chapas_pessoa chapas_pessoa_fk_cargos_mesa_diretora_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.chapas_pessoa
    ADD CONSTRAINT chapas_pessoa_fk_cargos_mesa_diretora_fkey FOREIGN KEY (fk_cargos_mesa_diretora) REFERENCES public.cargos_mesa_diretora(id);
 b   ALTER TABLE ONLY public.chapas_pessoa DROP CONSTRAINT chapas_pessoa_fk_cargos_mesa_diretora_fkey;
       public          postgres    false    259    219    3414            �           2606    16713 *   chapas_pessoa chapas_pessoa_fk_chapas_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.chapas_pessoa
    ADD CONSTRAINT chapas_pessoa_fk_chapas_fkey FOREIGN KEY (fk_chapas) REFERENCES public.chapas(id);
 T   ALTER TABLE ONLY public.chapas_pessoa DROP CONSTRAINT chapas_pessoa_fk_chapas_fkey;
       public          postgres    false    251    259    3450            �           2606    16708 *   chapas_pessoa chapas_pessoa_fk_pessoa_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.chapas_pessoa
    ADD CONSTRAINT chapas_pessoa_fk_pessoa_fkey FOREIGN KEY (fk_pessoa) REFERENCES public.pessoa(cpf);
 T   ALTER TABLE ONLY public.chapas_pessoa DROP CONSTRAINT chapas_pessoa_fk_pessoa_fkey;
       public          postgres    false    259    247    3444            �           2606    16544 '   coligacao coligacao_fk_legislatura_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.coligacao
    ADD CONSTRAINT coligacao_fk_legislatura_fkey FOREIGN KEY (fk_legislatura) REFERENCES public.legislatura(id);
 Q   ALTER TABLE ONLY public.coligacao DROP CONSTRAINT coligacao_fk_legislatura_fkey;
       public          postgres    false    240    244    3436            �           2606    16912 P   composicao_bloco_proposicao composicao_bloco_proposicao_fk_bloco_proposicao_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.composicao_bloco_proposicao
    ADD CONSTRAINT composicao_bloco_proposicao_fk_bloco_proposicao_fkey FOREIGN KEY (fk_bloco_proposicao) REFERENCES public.bloco_proposicao(id);
 z   ALTER TABLE ONLY public.composicao_bloco_proposicao DROP CONSTRAINT composicao_bloco_proposicao_fk_bloco_proposicao_fkey;
       public          postgres    false    3424    229    279            �           2606    16907 K   composicao_bloco_proposicao composicao_bloco_proposicao_fk_proposicoes_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.composicao_bloco_proposicao
    ADD CONSTRAINT composicao_bloco_proposicao_fk_proposicoes_fkey FOREIGN KEY (fk_proposicoes) REFERENCES public.proposicoes(id);
 u   ALTER TABLE ONLY public.composicao_bloco_proposicao DROP CONSTRAINT composicao_bloco_proposicao_fk_proposicoes_fkey;
       public          postgres    false    275    3474    279            �           2606    16644 "   endereco endereco_fk_entidade_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.endereco
    ADD CONSTRAINT endereco_fk_entidade_fkey FOREIGN KEY (fk_entidade) REFERENCES public.entidade(id);
 L   ALTER TABLE ONLY public.endereco DROP CONSTRAINT endereco_fk_entidade_fkey;
       public          postgres    false    225    3420    257            �           2606    16859 P   expediente_bloco_proposicao expediente_bloco_proposicao_fk_bloco_proposicao_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.expediente_bloco_proposicao
    ADD CONSTRAINT expediente_bloco_proposicao_fk_bloco_proposicao_fkey FOREIGN KEY (fk_bloco_proposicao) REFERENCES public.bloco_proposicao(id);
 z   ALTER TABLE ONLY public.expediente_bloco_proposicao DROP CONSTRAINT expediente_bloco_proposicao_fk_bloco_proposicao_fkey;
       public          postgres    false    3424    273    229            �           2606    16854 K   expediente_bloco_proposicao expediente_bloco_proposicao_fk_expedientes_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.expediente_bloco_proposicao
    ADD CONSTRAINT expediente_bloco_proposicao_fk_expedientes_fkey FOREIGN KEY (fk_expedientes) REFERENCES public.expedientes(id);
 u   ALTER TABLE ONLY public.expediente_bloco_proposicao DROP CONSTRAINT expediente_bloco_proposicao_fk_expedientes_fkey;
       public          postgres    false    3470    273    271            �           2606    16890 ?   expediente_proposicao expediente_proposicao_fk_expedientes_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.expediente_proposicao
    ADD CONSTRAINT expediente_proposicao_fk_expedientes_fkey FOREIGN KEY (fk_expedientes) REFERENCES public.expedientes(id);
 i   ALTER TABLE ONLY public.expediente_proposicao DROP CONSTRAINT expediente_proposicao_fk_expedientes_fkey;
       public          postgres    false    3470    271    277            �           2606    16895 ?   expediente_proposicao expediente_proposicao_fk_proposicoes_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.expediente_proposicao
    ADD CONSTRAINT expediente_proposicao_fk_proposicoes_fkey FOREIGN KEY (fk_proposicoes) REFERENCES public.proposicoes(id);
 i   ALTER TABLE ONLY public.expediente_proposicao DROP CONSTRAINT expediente_proposicao_fk_proposicoes_fkey;
       public          postgres    false    277    275    3474            �           2606    16839 '   expedientes expedientes_fk_reuniao_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.expedientes
    ADD CONSTRAINT expedientes_fk_reuniao_fkey FOREIGN KEY (fk_reuniao) REFERENCES public.reuniao(id);
 Q   ALTER TABLE ONLY public.expedientes DROP CONSTRAINT expedientes_fk_reuniao_fkey;
       public          postgres    false    269    271    3468            �           2606    16834 /   expedientes expedientes_fk_tipo_expediente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.expedientes
    ADD CONSTRAINT expedientes_fk_tipo_expediente_fkey FOREIGN KEY (fk_tipo_expediente) REFERENCES public.tipo_expediente(id);
 Y   ALTER TABLE ONLY public.expedientes DROP CONSTRAINT expedientes_fk_tipo_expediente_fkey;
       public          postgres    false    3422    271    227            �           2606    16518 (   legislatura legislatura_fk_entidade_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.legislatura
    ADD CONSTRAINT legislatura_fk_entidade_fkey FOREIGN KEY (fk_entidade) REFERENCES public.entidade(id);
 R   ALTER TABLE ONLY public.legislatura DROP CONSTRAINT legislatura_fk_entidade_fkey;
       public          postgres    false    3420    240    225            �           2606    16491 ;   maioria_qualificada maioria_qualificada_fk_tipo_quorum_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.maioria_qualificada
    ADD CONSTRAINT maioria_qualificada_fk_tipo_quorum_fkey FOREIGN KEY (fk_tipo_quorum) REFERENCES public.tipo_quorum(id);
 e   ALTER TABLE ONLY public.maioria_qualificada DROP CONSTRAINT maioria_qualificada_fk_tipo_quorum_fkey;
       public          postgres    false    233    235    3428            �           2606    16767 <   menu_itens_suspensos menu_itens_suspensos_fk_menu_nomes_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.menu_itens_suspensos
    ADD CONSTRAINT menu_itens_suspensos_fk_menu_nomes_fkey FOREIGN KEY (fk_menu_nomes) REFERENCES public.menu_nomes(posicao_menu);
 f   ALTER TABLE ONLY public.menu_itens_suspensos DROP CONSTRAINT menu_itens_suspensos_fk_menu_nomes_fkey;
       public          postgres    false    263    238    3434            �           2606    16613 )   mesa_diretora mesa_diretora_fk_chapa_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.mesa_diretora
    ADD CONSTRAINT mesa_diretora_fk_chapa_fkey FOREIGN KEY (fk_chapa) REFERENCES public.chapas(id);
 S   ALTER TABLE ONLY public.mesa_diretora DROP CONSTRAINT mesa_diretora_fk_chapa_fkey;
       public          postgres    false    3450    251    253            �           2606    16556 5   partido_coligacao partido_coligacao_fk_coligacao_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.partido_coligacao
    ADD CONSTRAINT partido_coligacao_fk_coligacao_fkey FOREIGN KEY (fk_coligacao) REFERENCES public.coligacao(id);
 _   ALTER TABLE ONLY public.partido_coligacao DROP CONSTRAINT partido_coligacao_fk_coligacao_fkey;
       public          postgres    false    3440    246    244            �           2606    16561 3   partido_coligacao partido_coligacao_fk_partido_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.partido_coligacao
    ADD CONSTRAINT partido_coligacao_fk_partido_fkey FOREIGN KEY (fk_partido) REFERENCES public.partido(id);
 ]   ALTER TABLE ONLY public.partido_coligacao DROP CONSTRAINT partido_coligacao_fk_partido_fkey;
       public          postgres    false    221    246    3416            �           2606    24715 1   partido_vereador partido_vereador_fk_partido_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.partido_vereador
    ADD CONSTRAINT partido_vereador_fk_partido_fkey FOREIGN KEY (fk_partido) REFERENCES public.partido(id);
 [   ALTER TABLE ONLY public.partido_vereador DROP CONSTRAINT partido_vereador_fk_partido_fkey;
       public          postgres    false    292    221    3416            �           2606    24720 0   partido_vereador partido_vereador_fk_pessoa_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.partido_vereador
    ADD CONSTRAINT partido_vereador_fk_pessoa_fkey FOREIGN KEY (fk_pessoa) REFERENCES public.pessoa(cpf);
 Z   ALTER TABLE ONLY public.partido_vereador DROP CONSTRAINT partido_vereador_fk_pessoa_fkey;
       public          postgres    false    247    3444    292            �           2606    16530 ?   periodo_mesa_diretora periodo_mesa_diretora_fk_legislatura_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.periodo_mesa_diretora
    ADD CONSTRAINT periodo_mesa_diretora_fk_legislatura_fkey FOREIGN KEY (fk_legislatura) REFERENCES public.legislatura(id);
 i   ALTER TABLE ONLY public.periodo_mesa_diretora DROP CONSTRAINT periodo_mesa_diretora_fk_legislatura_fkey;
       public          postgres    false    242    3436    240            �           2606    16573    pessoa pessoa_fk_entidade_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pessoa
    ADD CONSTRAINT pessoa_fk_entidade_fkey FOREIGN KEY (fk_entidade) REFERENCES public.entidade(id);
 H   ALTER TABLE ONLY public.pessoa DROP CONSTRAINT pessoa_fk_entidade_fkey;
       public          postgres    false    247    3420    225            �           2606    16992 >   pessoa_presenca_reuniao pessoa_presenca_reuniao_fk_pessoa_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pessoa_presenca_reuniao
    ADD CONSTRAINT pessoa_presenca_reuniao_fk_pessoa_fkey FOREIGN KEY (fk_pessoa) REFERENCES public.pessoa(cpf);
 h   ALTER TABLE ONLY public.pessoa_presenca_reuniao DROP CONSTRAINT pessoa_presenca_reuniao_fk_pessoa_fkey;
       public          postgres    false    287    3444    247            �           2606    16987 J   pessoa_presenca_reuniao pessoa_presenca_reuniao_fk_reuniao_habilitada_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pessoa_presenca_reuniao
    ADD CONSTRAINT pessoa_presenca_reuniao_fk_reuniao_habilitada_fkey FOREIGN KEY (fk_reuniao_habilitada) REFERENCES public.reuniao_habilitada(id);
 t   ALTER TABLE ONLY public.pessoa_presenca_reuniao DROP CONSTRAINT pessoa_presenca_reuniao_fk_reuniao_habilitada_fkey;
       public          postgres    false    283    3482    287            �           2606    16873 4   proposicoes proposicoes_fk_conclusao_proposicao_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.proposicoes
    ADD CONSTRAINT proposicoes_fk_conclusao_proposicao_fkey FOREIGN KEY (fk_conclusao_proposicao) REFERENCES public.conclusao_proposicao(id);
 ^   ALTER TABLE ONLY public.proposicoes DROP CONSTRAINT proposicoes_fk_conclusao_proposicao_fkey;
       public          postgres    false    231    275    3426            �           2606    16878 /   proposicoes proposicoes_fk_tipo_proposicao_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.proposicoes
    ADD CONSTRAINT proposicoes_fk_tipo_proposicao_fkey FOREIGN KEY (fk_tipo_proposicao) REFERENCES public.tipo_proposicao(id);
 Y   ALTER TABLE ONLY public.proposicoes DROP CONSTRAINT proposicoes_fk_tipo_proposicao_fkey;
       public          postgres    false    275    267    3466            �           2606    16958 6   responsavel_reuniao responsavel_reuniao_fk_pessoa_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.responsavel_reuniao
    ADD CONSTRAINT responsavel_reuniao_fk_pessoa_fkey FOREIGN KEY (fk_pessoa) REFERENCES public.pessoa(cpf);
 `   ALTER TABLE ONLY public.responsavel_reuniao DROP CONSTRAINT responsavel_reuniao_fk_pessoa_fkey;
       public          postgres    false    285    247    3444            �           2606    16953 B   responsavel_reuniao responsavel_reuniao_fk_reuniao_habilitada_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.responsavel_reuniao
    ADD CONSTRAINT responsavel_reuniao_fk_reuniao_habilitada_fkey FOREIGN KEY (fk_reuniao_habilitada) REFERENCES public.reuniao_habilitada(id);
 l   ALTER TABLE ONLY public.responsavel_reuniao DROP CONSTRAINT responsavel_reuniao_fk_reuniao_habilitada_fkey;
       public          postgres    false    3482    283    285            �           2606    16730 `   resultados_votacao_mesa_diretora resultados_votacao_mesa_diret_fk_votacao_chapa_mesa_direto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.resultados_votacao_mesa_diretora
    ADD CONSTRAINT resultados_votacao_mesa_diret_fk_votacao_chapa_mesa_direto_fkey FOREIGN KEY (fk_votacao_chapa_mesa_diretora) REFERENCES public.votacao_chapa_mesa_diretora(id);
 �   ALTER TABLE ONLY public.resultados_votacao_mesa_diretora DROP CONSTRAINT resultados_votacao_mesa_diret_fk_votacao_chapa_mesa_direto_fkey;
       public          postgres    false    261    217    3412            �           2606    16735 P   resultados_votacao_mesa_diretora resultados_votacao_mesa_diretora_fk_chapas_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.resultados_votacao_mesa_diretora
    ADD CONSTRAINT resultados_votacao_mesa_diretora_fk_chapas_fkey FOREIGN KEY (fk_chapas) REFERENCES public.chapas(id);
 z   ALTER TABLE ONLY public.resultados_votacao_mesa_diretora DROP CONSTRAINT resultados_votacao_mesa_diretora_fk_chapas_fkey;
       public          postgres    false    3450    261    251            �           2606    16740 P   resultados_votacao_mesa_diretora resultados_votacao_mesa_diretora_fk_pessoa_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.resultados_votacao_mesa_diretora
    ADD CONSTRAINT resultados_votacao_mesa_diretora_fk_pessoa_fkey FOREIGN KEY (fk_pessoa) REFERENCES public.pessoa(cpf);
 z   ALTER TABLE ONLY public.resultados_votacao_mesa_diretora DROP CONSTRAINT resultados_votacao_mesa_diretora_fk_pessoa_fkey;
       public          postgres    false    261    3444    247            �           2606    16817     reuniao reuniao_fk_entidade_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.reuniao
    ADD CONSTRAINT reuniao_fk_entidade_fkey FOREIGN KEY (fk_entidade) REFERENCES public.entidade(id);
 J   ALTER TABLE ONLY public.reuniao DROP CONSTRAINT reuniao_fk_entidade_fkey;
       public          postgres    false    225    3420    269            �           2606    16822 $   reuniao reuniao_fk_tipo_reuniao_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.reuniao
    ADD CONSTRAINT reuniao_fk_tipo_reuniao_fkey FOREIGN KEY (fk_tipo_reuniao) REFERENCES public.tipo_reuniao(id);
 N   ALTER TABLE ONLY public.reuniao DROP CONSTRAINT reuniao_fk_tipo_reuniao_fkey;
       public          postgres    false    223    269    3418            �           2606    16941 5   reuniao_habilitada reuniao_habilitada_fk_reuniao_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.reuniao_habilitada
    ADD CONSTRAINT reuniao_habilitada_fk_reuniao_fkey FOREIGN KEY (fk_reuniao) REFERENCES public.reuniao(id);
 _   ALTER TABLE ONLY public.reuniao_habilitada DROP CONSTRAINT reuniao_habilitada_fk_reuniao_fkey;
       public          postgres    false    3468    269    283            �           2606    16799 =   tipo_proposicao tipo_proposicao_fk_prioridade_proposicao_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tipo_proposicao
    ADD CONSTRAINT tipo_proposicao_fk_prioridade_proposicao_fkey FOREIGN KEY (fk_prioridade_proposicao) REFERENCES public.prioridade_proposicao(id);
 g   ALTER TABLE ONLY public.tipo_proposicao DROP CONSTRAINT tipo_proposicao_fk_prioridade_proposicao_fkey;
       public          postgres    false    267    3432    237            �           2606    16804 3   tipo_proposicao tipo_proposicao_fk_tipo_quorum_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tipo_proposicao
    ADD CONSTRAINT tipo_proposicao_fk_tipo_quorum_fkey FOREIGN KEY (fk_tipo_quorum) REFERENCES public.tipo_quorum(id);
 ]   ALTER TABLE ONLY public.tipo_proposicao DROP CONSTRAINT tipo_proposicao_fk_tipo_quorum_fkey;
       public          postgres    false    267    233    3428            �           2606    16587     usuarios usuarios_fk_pessoa_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_fk_pessoa_fkey FOREIGN KEY (fk_pessoa) REFERENCES public.pessoa(cpf);
 J   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_fk_pessoa_fkey;
       public          postgres    false    247    249    3444            �           2606    17014 4   votacao_proposicao votacao_proposicao_fk_pessoa_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.votacao_proposicao
    ADD CONSTRAINT votacao_proposicao_fk_pessoa_fkey FOREIGN KEY (fk_pessoa) REFERENCES public.pessoa(cpf);
 ^   ALTER TABLE ONLY public.votacao_proposicao DROP CONSTRAINT votacao_proposicao_fk_pessoa_fkey;
       public          postgres    false    3444    247    289            �           2606    17009 9   votacao_proposicao votacao_proposicao_fk_proposicoes_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.votacao_proposicao
    ADD CONSTRAINT votacao_proposicao_fk_proposicoes_fkey FOREIGN KEY (fk_proposicoes) REFERENCES public.proposicoes(id);
 c   ALTER TABLE ONLY public.votacao_proposicao DROP CONSTRAINT votacao_proposicao_fk_proposicoes_fkey;
       public          postgres    false    275    289    3474            �           2606    17004 @   votacao_proposicao votacao_proposicao_fk_reuniao_habilitada_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.votacao_proposicao
    ADD CONSTRAINT votacao_proposicao_fk_reuniao_habilitada_fkey FOREIGN KEY (fk_reuniao_habilitada) REFERENCES public.reuniao_habilitada(id);
 j   ALTER TABLE ONLY public.votacao_proposicao DROP CONSTRAINT votacao_proposicao_fk_reuniao_habilitada_fkey;
       public          postgres    false    289    283    3482            �     x�M�Ar�0ϫǤ�-�����Y��=��#��X�|~|�-��lʏ��jN-T����K�Tɣc�T.U�$�_B��a�4D�&����p�r���&Z.Ga�o��|q��U���<����VOQ�^�#��Z͘��ś���!n�����2���2,��/��D/�gL	�D.$���XJ�j|�pp���-:~����E�Y�Mqr5�G;����d���c<�����������P�U��Y=�z������\�x=�6�������j�      �      x������ � �      p      x������ � �      b      x������ � �      �      x������ � �      f      x������ � �      �      x������ � �      �      x������ � �         D   x�3���L�/V(H��Wp*J,���4�2�)JLJ���WHU �8�8(j������_�i����� n��      �      x������ � �      r      x������ � �      �      x������ � �      l   9   x�3�t>�(7�(Q��4/39� 1G!%U�+S7 (�wx!'����p��qqq ���      �      x������ � �      �      x������ � �      �      x������ � �      {   6   x�3�4202�50"+0����#��r�srA$15X������ ���      v      x������ � �      �   �  x�]TKn�0]���	
��w�&mQ n��* �J�K@R�}�.��*�	|���(�.��7|�I�`��U��̎���
�=�X����W2���/�b�7���UKV��	�i`��77�!��-�ޕ���ֲf���5���;2�/`��;\�m)S�s0�ѝ�#�t�n��ǃ�e�񬚤�����w�v�稓l�����?�LҨWl��J�Bd&�d�t���o�G�a$~��%b
�����2�\�!�&��+�v^�Mۛ��袛�B��\����|t���)���AD��#Ί�¼���k+*#Rȗߞ��)v��5�[d���,�]��g����g������hă�C����%�+*�G����
΋�
��� ���B�R��v8�|n������՗ת����	���yPCrUP�O����/+g�'�3�S�
}L�dCq�dv�Ӗ&��<"AwF����}D�	MĂ��vWw0Ľ��⛋�m�"�Kt��F.�Z#K�����s̃*ѠI�f0QW\��O���Po���J�|۷��L�=:M���+�6\��I�Jw���ڵ��%g~�k�Z�G��	����2B�I�w��O^*�ޢ��;�����p��PZ��3���s��A��      y   �   x��K
�0 ���)<��ߏm,��Hڂ��4�Hi$i�x �D����ۼDS^HZ�*���$K�d�4v�P��\��&�k`g��r��ىx�R0O{���\�P�3-n ف'���5~X�u7�^ignOJ����?��w�:�˘@݇Z�e��_�73�      �      x������ � �      h     x�e�Mn� F�p
NP���r �E�0͢��H����U=G�⋕Ʃ�*+F��ތ�
��c�Hx��v��R�F�F���k?%�o���\�:���iI �߅��]��Hq���
UVN^*����ӄZ��,��M�w�8�X'�&��$j��{dX�@��su���0Sy9ڤ��5 �m�%�Ga3�<�(r��%	�9<�d��Q���@��B��?3@*`BW q6�����.6�P������M����8}�Z������,|�      �      x�3�4�4�2�4�4����� !      �      x�3�4�4SSS ����� %�Q      }      x������ � �      �   �   x��Խ
�@ �9}�����9�m��`,n.Q[9�T��ӫ��N�-?|�dFVQ�p �j�֧*ܧaR5y\Fƌz�z�!�$��|�XB�ƇBl��U�1
G�(�v�֬b���{	�6?�Kot�t����@q�s����\wƋ�^m�����&6��ɟM�ɫM�l�d���&��t��]-e�S������ ��J�      �      x������ � �      x      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      n      x������ � �      �      x������ � �      t      x������ � �      j      x������ � �      �   +   x�3450�4�4b �2�4��b\���Pq.C���qqq �I
      �   ~   x�͎K
1C��]T����t3�.�(������cK�Y���?g��&wʡ0���K`a�CaI��e��;0k �0�TZ�r�`��#$�h)5��1�/M"$��Ļ���_ǿ�ʌ�~��޿h<�      d      x������ � �      �      x������ � �     