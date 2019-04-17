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
    "FRACAO IDEAL" varchar,
    "AREA DO TERRENO" integer,
    "AREA CONSTRUIDA" integer,
    "AREA OCUPADA" integer,
    "VALOR DO M2 DO TERRENO" varchar,
    "VALOR DO M2 DE CONSTRUCAO" varchar,
    "ANO DA CONSTRUCAO CORRIGIDO" integer,
    "QUANTIDADE DE PAVIMENTOS" integer,
    "TESTADA PARA CALCULO" varchar,
    "TIPO DE USO DO IMOVEL" varchar,
    "TIPO DE PADRAO DA CONSTRUCAO" varchar,
    "TIPO DE TERRENO" varchar,
    "FATOR DE OBSOLESCENCIA" varchar,
    "ANO DE INICIO DA VIDA DO CONTRIBUINTE" integer,
    "MES DE INICIO DA VIDA DO CONTRIBUINTE" integer,
    "FASE DO CONTRIBUINTE" integer
    );


-- Importação dos dados para a nova tabela
	-- OS DADOS DEVEM ESTAR NA PASTA \\spurbsp163\xampp\htdocs\qgis\IPTU_load
	-- Somente o SUPERUSER pode fazer esta operação
SET client_encoding TO WIN1252;
COPY {schema}.{table} FROM '\\spurbsp163\xampp\htdocs\qgis\IPTU_load{CSV}' DELIMITER ';' CSV HEADER;


-- TRATAMENTOS
-- Conversão dos números decimais
ALTER TABLE {schema}.{table}
	ALTER COLUMN  "TESTADA PARA CALCULO" TYPE numeric USING regexp_replace("TESTADA PARA CALCULO", ',', '.') :: numeric,
	ALTER COLUMN  "FRACAO IDEAL" TYPE numeric USING regexp_replace("FRACAO IDEAL", ',', '.') :: numeric,
	ALTER COLUMN  "VALOR DO M2 DO TERRENO" TYPE numeric(8,2) USING regexp_replace("VALOR DO M2 DO TERRENO", ',', '.') :: numeric(8,2),
	ALTER COLUMN  "VALOR DO M2 DE CONSTRUCAO" TYPE numeric(8,2) USING regexp_replace("VALOR DO M2 DE CONSTRUCAO", ',', '.') :: numeric(8,2),
	ALTER COLUMN  "FATOR DE OBSOLESCENCIA" TYPE numeric USING regexp_replace("FATOR DE OBSOLESCENCIA", ',', '.') :: numeric;

-- Remoção dos dígitos de verificação
ALTER TABLE {schema}.{table}
	ALTER COLUMN  "NUMERO DO CONTRIBUINTE" TYPE char(10)USING left("NUMERO DO CONTRIBUINTE" , 10),
	ALTER COLUMN  "NUMERO DO CONDOMINIO" TYPE varchar(2) USING left("NUMERO DO CONDOMINIO" , 2);

-- Remoção de Colunas desnessárias
ALTER TABLE {schema}.{table}
	DROP COLUMN "DATA DO CADASTRAMENTO",
	DROP COLUMN "NUMERO DA NL";

--Cria o SQLC e SQLCond
ALTER TABLE {schema}.{table}
	ADD COLUMN IF NOT EXISTS "SQLC" varchar(12);
UPDATE {schema}.{table}
	SET "SQLC"   =   left("NUMERO DO CONTRIBUINTE", 10)  ||  left("NUMERO DO CONDOMINIO", 2);

-- ADICIONA A COLUNA SQLC
ALTER TABLE {schema}.{table}
	ADD COLUMN IF NOT EXISTS "SQLCond" varchar(12);
UPDATE {schema}.{table}
	SET "SQLCond"  = CASE
                    WHEN right({schema}.{table}."SQLC",2)  <> '00'
                    --SQ
                    THEN concat(left({schema}.{table}."SQLC",6),
                        '0000', 
                        --L Condominio 
                        right({schema}.{table}."SQLC",2)) 
                        -- Condominio
                    ELSE "SQLC"
                  END;



-- FINALIZAÇÃO
-- Reordena as colunas do IPTU
SELECT
	"NUMERO DO CONTRIBUINTE" as "SQL",
	"SQLC",
	"SQLCond",
	"NUMERO DO CONDOMINIO",
	"ANO DO EXERCICIO",
	"CEP DO IMOVEL",
	"CODLOG DO IMOVEL",
	"NOME DE LOGRADOURO DO IMOVEL",
	"NUMERO DO IMOVEL",
	"COMPLEMENTO DO IMOVEL",
	"BAIRRO DO IMOVEL",
	"REFERENCIA DO IMOVEL",
	"ANO DA CONSTRUCAO CORRIGIDO",
	"QUANTIDADE DE PAVIMENTOS",
	"AREA DO TERRENO",
	"AREA OCUPADA",
	"FRACAO IDEAL",
	"AREA CONSTRUIDA",
	"QUANTIDADE DE ESQUINAS/FRENTES",
	"TIPO DE TERRENO",
	"TESTADA PARA CALCULO",
	"TIPO DE USO DO IMOVEL",
	"TIPO DE PADRAO DA CONSTRUCAO",
	"FATOR DE OBSOLESCENCIA",
	"VALOR DO M2 DO TERRENO",
	"VALOR DO M2 DE CONSTRUCAO",
	"TIPO DE CONTRIBUINTE 1",
	"CPF/CNPJ DO CONTRIBUINTE 1",
	"NOME DO CONTRIBUINTE 1",
	"TIPO DE CONTRIBUINTE 2",
	"CPF/CNPJ DO CONTRIBUINTE 2",
	"NOME DO CONTRIBUINTE 2",
	"ANO DE INICIO DA VIDA DO CONTRIBUINTE",
	"MES DE INICIO DA VIDA DO CONTRIBUINTE",
	"FASE DO CONTRIBUINTE"
INTO iptu."TEMP_2019"
FROM {schema}.{table};

-- Remove a tabela antiga e renomeia a tabela temporária
DROP TABLE {schema}.{table};
ALTER TABLE iptu."TEMP_2019" RENAME TO {schema}.{table};
