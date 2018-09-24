Repositório de SQL


Conexão entre a geometria de lotes (terrenos) com o sqlc (sql condominial) [obs: filtrado na região central]
```sql
DROP TABLE qlayer_1;
SELECT lotes_centro.geom, lotes_centro.id, lotes_centro.sqlc AS sqlc_s,
	tbl_sqlc_centro.dominio, tbl_sqlc_centro.n_contribuintes, tbl_sqlc_centro."FRACAO_IDEAL", tbl_sqlc_centro.sqlc
	INTO qlayer_1
	FROM lotes_centro FULL JOIN tbl_sqlc_centro
ON lotes_centro.sqlc = tbl_sqlc_centro.sqlc
```
