




```sql
-- Avaliação do tamanho de tabelas
SELECT pg_size_prettY(pg_relation_size('iptu.sql'));
SELECT pg_size_prettY(pg_relation_size('iptu._2019'));
```
_Referencial:_ [Tamanho no Postgres](https://wiki.infolink.com.br/Como_verificar_o_tamanho_da_base_de_dados_no_PostgreSQL)


## Limpeza de Espaço Ocupado

```sql
-- VACCUM completo, incluindo o remanejo dos dados. É mais eficiente na compactação dos dados.
VACUUM full iptu._2019;

-- VACCUM somente deleta os dados removidos (inúteis)
VACUUM iptu._2019;

VERBOSE ANALYSE  -- Atualiza as estatísticas para executar de forma mais eficiente.
