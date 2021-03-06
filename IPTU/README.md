
### Join entre os resultados dos anos
```sql
SELECT resul_1995.NOME_1995, resul_2010.*, 
  switch(resul_1995.NOME_1995 = resul_2010.NOME_2010,'mesmo',
  true, 'outro') AS aval
FROM resul_1995  
RIGHT JOIN resul_2010 
ON resul_1995.[NUMERO DO CONTRIBUINTE] = resul_2010.[NUMERO DO CONTRIBUINTE];
```

### Consulta de SQLs
```sql
SELECT EG1995.[NUMERO DO CONTRIBUINTE], EG1995.[NOME DO CONTRIBUINTE 1] AS NOME_1995
    INTO resul_1995
FROM EG1995
WHERE ( ( ( 
    Left([EG1995].[NUMERO DO CONTRIBUINTE],10) ) 
In ("0970050009","0970060016","0970060022","0970060031","0970100002","0970100005",
"0970100008","0970100010","0970100011","0970100013","0970100014","0970110005","0970110006",
"0970110007","0970120003","0970120004","0970120007","0970160002","0970160003","0970160004",
"0970160005","0970160006","0970170007","0970170008","0970170009","0970180013")));

```

### Avaliação de Mudança de Proprietário
```sql
SELECT resul_2018.[NUMERO DO CONTRIBUINTE],
		resul_2018.NOME_2018, 
		resul_2015.NOME_2015, 
		switch(resul_2018.NOME_2018 = resul_2015.NOME_2015,'mesmo',
		resul_2018.NOME_2018 <> resul_2015.NOME_2015, 'outro',
		true, '-') AS aval_2015

FROM resul_2018 
	RIGHT JOIN resul_2015 
	ON resul_2018.[NUMERO DO CONTRIBUINTE] = resul_2015.[NUMERO DO CONTRIBUINTE];
```

#### Avaliação de Mudança de Proprietário - versão multiplas tabelas
```sql	
SELECT qry04.*, resul_1995.NOME_1995,
	switch(resul_2018.NOME_2018 = resul_1995.NOME_1995,'mesmo',
		resul_2018.NOME_2018 <> resul_1995.NOME_1995, 'outro',
		true, '-') AS aval_1995

FROM (SELECT qry03.*, resul_2000.NOME_2000,
		switch(resul_2018.NOME_2018 = resul_2000.NOME_2000,'mesmo',
			resul_2018.NOME_2018 <> resul_2000.NOME_2000, 'outro',
			true, '-') AS aval_2000

	FROM (SELECT qry02.*, resul_2005.NOME_2005,
			switch(resul_2018.NOME_2018 = resul_2005.NOME_2005,'mesmo',
				resul_2018.NOME_2018 <> resul_2005.NOME_2005, 'outro',
				true, '-') AS aval_2005

		FROM (SELECT qry01.*, resul_2010.NOME_2010,
				switch(resul_2018.NOME_2018 = resul_2010.NOME_2010,'mesmo',
					resul_2018.NOME_2018 <> resul_2010.NOME_2010, 'outro',
					true, '-') AS aval_2010

				FROM (SELECT resul_2018.[NUMERO DO CONTRIBUINTE],
							resul_2018.NOME_2018, 
							resul_2015.NOME_2015, 
							switch(resul_2018.NOME_2018 = resul_2015.NOME_2015,'mesmo',
							resul_2018.NOME_2018 <> resul_2015.NOME_2015, 'outro',
							true, '-') AS aval_2015

						FROM resul_2018 
							LEFT JOIN resul_2015 ON resul_2018.[NUMERO DO CONTRIBUINTE] = resul_2015.[NUMERO DO CONTRIBUINTE]) AS qry01

				LEFT JOIN resul_2010 ON qry01.[NUMERO DO CONTRIBUINTE] = resul_2010.[NUMERO DO CONTRIBUINTE]) AS qry02
		LEFT JOIN resul_2005 ON qry02.[NUMERO DO CONTRIBUINTE] = resul_2005.[NUMERO DO CONTRIBUINTE]) AS qry03
	LEFT JOIN resul_2000 ON qry03.[NUMERO DO CONTRIBUINTE] = resul_2000.[NUMERO DO CONTRIBUINTE]) AS qry04
LEFT JOIN resul_1995 ON qry04.[NUMERO DO CONTRIBUINTE] = resul_1995.[NUMERO DO CONTRIBUINTE]

;
```
