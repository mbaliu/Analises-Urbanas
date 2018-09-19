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

|TIPO_PADRAO|
|---------|
Residencial horizontal - padrão A
Residencial horizontal - padrão B
Residencial horizontal - padrão C
Residencial horizontal - padrão D
Residencial horizontal - padrão E
Residencial horizontal - padrão F
Residencial vertical - padrão A
Residencial vertical - padrão B
Residencial vertical - padrão C
Residencial vertical - padrão D
Residencial vertical - padrão E
Residencial vertical - padrão F
Comercial horizontal - padrão A
Comercial horizontal - padrão B
Comercial horizontal - padrão C
Comercial horizontal - padrão D
Comercial horizontal - padrão E
Comercial vertical - padrão A
Comercial vertical - padrão B
Comercial vertical - padrão C
Comercial vertical - padrão D
Comercial vertical - padrão E
Barracão/Telheiro/Oficina - padrão A
Barracão/Telheiro/Oficina/Posto de serviço/Armazém/Depósito/Indústria - padrão B
Oficina/Posto de serviço/Armazém/Depósito/Indústria - padrão C
Oficina/Posto de serviço/Armazém/Depósito/Indústria - padrão D
Indústria - padrão E
Templo/Clube/Ginásio ou Estádio esportivo/Museu/Hipódromo/Cinema/Teatro/Aeroporto/Estações/etc. - padrão B
Templo/Clube/Ginásio ou Estádio esportivo/Museu/Hipódromo/Cinema/Teatro/Aeroporto/Estações/etc. - padrão C
Templo/Clube/Ginásio ou Estádio esportivo/Museu/Hipódromo/Cinema/Teatro/Aeroporto/Estações/etc. - padrão D
Edifício de garagens - padrão A
TERRENO
Normal

TIPO DE PADRAO TERRENO (aka iptu_cat_terreno)
  
(Processado em 50 sec)
```sql
SELECT DISTINCT "TIPO DE TERRENO"
INTO iptu_cat_terreno
FROM "IPTU_2016_id"
```
