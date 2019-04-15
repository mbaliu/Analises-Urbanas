
```sql
-- Deleta a tabela sql
DROP TABLE iptu.sql

-- Cria a tabela SQL
SELECT "NUMERO DO CONTRIBUINTE", "NUMERO DO CONDOMINIO"
INTO iptu.sql
FROM iptu._2019

-- Cria a coluna SQL
ALTER TABLE  iptu.sql
ADD COLUMN "SQL" char(10)

-- Preenche a coluna
UPDATE iptu.sql
SET "SQL" = "NUMERO DO CONTRIBUINTE" :: char(10)

-- Trata o dado de condominio
UPDATE iptu.sql
SET "NUMERO DO CONDOMINIO" = "NUMERO DO CONDOMINIO" :: char(2)

```
