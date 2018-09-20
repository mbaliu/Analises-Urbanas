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

|TIPO_USO_PADRAO|PADRAO|
|-------------|--------|
<sub>Residencial horizontal|<sub>-</sub>
<sub>Residencial vertical|<sub>padrão A</sub>
<sub>Comercial horizontal|<sub>padrão B</sub>
<sub>Comercial vertical|<sub>padrão C</sub>
<sub>Barracão/Telheiro/Oficina|<sub>padrão D</sub>
<sub>Barracão/Telheiro/Oficina/Posto de serviço/Armazém/Depósito/Indústria|<sub>padrão E</sub>
<sub>Oficina/Posto de serviço/Armazém/Depósito/Indústria|<sub>padrão F</sub>
<sub>Indústria </sub>
<sub>Templo/Clube/Ginásio ou Estádio esportivo/Museu/Hipódromo/Cinema/Teatro/Aeroporto/Estações/etc. </sub>
<sub>Edifício de garagens </sub>
\-
<sub>TERRENO</sub>
<sub>Normal</sub>


TIPO DE PADRAO TERRENO (aka iptu_cat_terreno)
  
(Processado em 50 sec)
```sql
SELECT DISTINCT "TIPO DE TERRENO"
INTO iptu_cat_terreno
FROM "IPTU_2016_id"
```
|TIPO DE TERRENO|
|---------------:|
<sub>0,0</sub>
<sub>Lote de fundos</sub>
<sub>De esquina</sub>
<sub>Normal</sub>
<sub>Lote de esquina em ZER</sub>
<sub>Terreno interno</sub>
<sub>De duas ou mais frentes</sub>



### SQLC
Construção da coluna contendo o SQLC (SQL condominial).

<sub>"Linguagem Access"</sub>
```sql
SELECT  switch( 
(mid(IPTU_Minhocao.Cond,1,2))  <> '00', left(IPTU_Minhocao.[NUMERO DO CONTRIBUINTE],6)&'0000'&(mid(IPTU_Minhocao.Cond,1,2)),
(mid(IPTU_Minhocao.Cond,1,2))  = '00', left(IPTU_Minhocao.[NUMERO DO CONTRIBUINTE],10)&(mid(IPTU_Minhocao.Cond,1,2))
) AS SQLC
cond = [NUMERO DO CONDOMINIO]
```



