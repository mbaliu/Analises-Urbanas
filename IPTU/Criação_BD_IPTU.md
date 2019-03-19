# Criação do Banco de Dados de IPTU
Após a observação dos dados contidos no arquivo CSV, a análise de cada coluna por meio do __tipo de dado__ e __tamanho máximo__ em cada coluna (processo feito manualmente e não foi verificado), obtemos o código para criação da tabela base e posteriormente para a importação dos dados com o COPY.
__CRIAÇÃO DA TABELA__
```sql
-- Criação da tabela contendo as colunas e sua estrutura
CREATE TABLE IF NOT EXISTS {schema}.{table} (
    id integer,
    "NUMERO DO CONTRIBUINTE" varchar(12),
    "ANO DO EXERCICIO" integer,
    "NUMERO DA NL" integer,
    "DATA DO CADASTRAMENTO" date,
    "TIPO DE CONTRIBUINTE 1" varchar(40),
    "CPF/CNPJ DO CONTRIBUINTE 1" varchar(20),
    "NOME DO CONTRIBUINTE 1" varchar,
    "TIPO DE CONTRIBUINTE 2" varchar(40),
    "CPF/CNPJ DO CONTRIBUINTE 2" varchar(20),
    "NOME DO CONTRIBUINTE 2" varchar,
    "NUMERO DO CONDOMINIO" varchar(5),
    "CODLOG DO IMOVEL" varchar(8),
    "NOME DE LOGRADOURO DO IMOVEL" varchar,
    "NUMERO DO IMOVEL" integer,
    "COMPLEMENTO DO IMOVEL" varchar,
    "BAIRRO DO IMOVEL" varchar,
    "REFERENCIA DO IMOVEL" varchar,
    "CEP DO IMOVEL" varchar(9),
    "QUANTIDADE DE ESQUINAS/FRENTES" integer,
    "FRACAO IDEAL" real,
    "AREA DO TERRENO" integer,
    "AREA CONSTRUIDA" integer,
    "AREA OCUPADA" integer,
    "VALOR DO M2 DO TERRENO" numeric(8,2),
    "VALOR DO M2 DE CONSTRUCAO" numeric(8,2),
    "ANO DA CONSTRUCAO CORRIGIDO" integer,
    "QUANTIDADE DE PAVIMENTOS" integer,
    "TESTADA PARA CALCULO" numeric(6,2),
    "TIPO DE USO DO IMOVEL" varchar,
    "TIPO DE PADRAO DA CONSTRUCAO" varchar,
    "TIPO DE TERRENO" varchar,
    "FATOR DE OBSOLESCENCIA" numeric(3,2),
    "ANO DE INICIO DA VIDA DO CONTRIBUINTE" integer,
    "MES DE INICIO DA VIDA DO CONTRIBUINTE" integer,
    "FASE DO CONTRIBUINTE" integer
    )
```
__IMPORTAÇÃO DO SQL__
````sql
-- Importação dos dados para a nova tabela
SET client_encoding TO WIN1252;
COPY {schema}.{table} FROM {path_csv} DELIMITER ';' CSV HEADER;
```
