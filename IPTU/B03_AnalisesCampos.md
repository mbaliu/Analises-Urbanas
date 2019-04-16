
```sql
-- Cria a coluna para o ano
ALTER TABLE iptu.sql
	ADD COLUMN "2019" integer,
	ADD COLUMN "2018" integer
  
-- ANO - Verifica se os SQL existem nas 

```


## VALORES DE CATEGORIAS

```sql
SELECT "TIPO DE CONTRIBUINTE 1"
FROM iptu._2019
GROUP BY "TIPO DE CONTRIBUINTE 1"
```

Retorna uma tabela de todos os valores possíveis para aquela variável.

|TIPO DE CONTRIBUINTE 1|
|----------------------|
|PESSOA FISICA (CPF)|
|PESSOA JURIDICA (CNPJ)|
|None|



