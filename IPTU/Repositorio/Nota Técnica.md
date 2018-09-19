# Criação das Categorias de Classificação dos Imóveis
Esta etapa consiste inicialmente na obtenção das tipologias de classificação utiliziadas pela SF para os imóveis, por meio da análise de todo o universo do bd_iptu e obtenção dos valores únicos.
## Obtenção dos valores únicos
TIPO DE PADRAO DA CONSTRUCAO (aka iptu_cat_padrao)
  
(Processado em 1,1 min)
```sql
SELECT DISTINCT "TIPO DE PADRAO DA CONSTRUCAO"
INTO iptu_cat_padrao
FROM "IPTU_2016_id"
```

TIPO DE PADRAO TERRENO (aka iptu_cat_terreno)
  
(Processado em 50 sec)
```sql
SELECT DISTINCT "TIPO DE TERRENO"
INTO iptu_cat_terreno
FROM "IPTU_2016_id"
```
