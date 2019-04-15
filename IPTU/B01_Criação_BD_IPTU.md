# Criação do Banco de Dados de IPTU
Após a observação dos dados contidos no arquivo CSV, a análise de cada coluna por meio do __tipo de dado__ e __tamanho máximo__ em cada coluna (processo feito manualmente e não foi verificado), obtemos o código para criação da tabela base e posteriormente para a importação dos dados com o COPY.

```sql
-- Criação da tabela contendo as colunas e sua estrutura
CREATE TABLE IF NOT EXISTS {schema}.{table} (
    --id integer,
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

## Tratamento dos dados
Temos que ter o cuidado que os dados fornecidos possuem como divisor decimal a vírgula ','. Por tanto, temos que fazer a substituição das vírgulas por ponto.

* Ou fazemos a __substituição__
* Ou carregamos como _varchar_ e depis convertemos para numéric ou real.

```sql
-- Importação dos dados para a nova tabela
SET client_encoding TO WIN1252;
COPY {schema}.{table} FROM {path_csv} DELIMITER ';' CSV HEADER;
```
__SUBSTITUIÇÃO__
```sql
regexp_replace(varchar_field, ',', '.') :: numeric AS numeric_field
```
### Remoção dos dígistos verificadores

É recomendado a remoção do dígito verificador, tanto para a diminuição do tamanho da base, quanto para facilitar as operações.

```sql
-- NUMERO DO CONTRIBUINTE
UPDATE iptu.table
SET "NUMERO DO CONTRIBUINTE" :: varchar(10)
--"NUMERO DO CONDOMINIO"
UPDATE iptu.table
SET "NUMERO DO CONDOMINIO" :: varchar(2)
--...

```

https://stackoverflow.com/questions/18707393/postgres-copy-importing-an-integer-with-a-comma
## AJUSTE DOS CAMPOS
Para a execução dos trabalhos é necessário a criação de novos campos, tais como SQLC e SQLCond

__SQLC:__ É o SQL concatenado com o número de condomínio

__SQLCond:__ É a representação da identificação dos TERRENOS.

__SQLC:__
```sql
-- ADICIONA A COLUNA SQLC
ALTER TABLE iptu._2019
ADD COLUMN IF NOT EXISTS "SQLC" varchar(12);

UPDATE iptu._2019
SET "SQLC"   =   left("NUMERO DO CONTRIBUINTE", 10)  ||  left("NUMERO DO CONDOMINIO", 2);
```

__SQLCond:__ 
```sql
-- ADICIONA A COLUNA SQLC
ALTER TABLE iptu._2019
ADD COLUMN IF NOT EXISTS "SQLCond" varchar(12);

UPDATE iptu._2019
SET "SQLCond"  = CASE
                    WHEN right(iptu._2019."SQLC",2)  <> '00'
                    --SQ
                    THEN concat(left(iptu._2019."SQLC",6),
                        '0000', 
                        --L Condominio 
                        right(iptu._2019."SQLC",2)) 
                        -- Condominio
                    ELSE "SQLC"
                  END
```


Alterar a ordem das colunas


## CODIFICAÇÃO DAS CATEGORIAS
# TIPO DE CONTRIBUINTE
Para o tipo de contribuinte, por só permitir 3 tipos de dados, podemos codifica-los, de forma a ser mais eficiente e mais econômico. 

Pode-se criar uma nova coluna ou alterar a já existente.

A equivalência dos códigos é:
|TIPO DE CONTRIBUINTE|
|----------------------|
|None|0|
|PESSOA FISICA (CPF)|1|
|PESSOA JURIDICA (CNPJ)|2|

```sql
UPDATE iptu._2019
SET "TIPO DE CONTRIBUINTE 1" = CASE WHEN "TIPO DE CONTRIBUINTE 1" is Null THEN 0
															WHEN "TIPO DE CONTRIBUINTE 1" like 'PESSOA FISICA (CPF)' THEN 1
															WHEN "TIPO DE CONTRIBUINTE 1" like 'PESSOA JURIDICA (CNPJ)' THEN 2
															END
```

