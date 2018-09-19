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
<sub>Residencial horizontal - padrão A</sub>
<sub>Residencial horizontal - padrão B</sub>
<sub>Residencial horizontal - padrão C</sub>
<sub>Residencial horizontal - padrão D</sub>
<sub>Residencial horizontal - padrão E</sub>
<sub>Residencial horizontal - padrão F</sub>
<sub>Residencial vertical - padrão A</sub>
<sub>Residencial vertical - padrão B</sub>
<sub>Residencial vertical - padrão C</sub>
<sub>Residencial vertical - padrão D</sub>
<sub>Residencial vertical - padrão E</sub>
<sub>Residencial vertical - padrão F</sub>
<sub>Comercial horizontal - padrão A</sub>
<sub>Comercial horizontal - padrão B</sub>
<sub>Comercial horizontal - padrão C</sub>
<sub>Comercial horizontal - padrão D</sub>
<sub>Comercial horizontal - padrão E</sub>
<sub>Comercial vertical - padrão A</sub>
<sub>Comercial vertical - padrão B</sub>
<sub>Comercial vertical - padrão C</sub>
<sub>Comercial vertical - padrão D</sub>
<sub>Comercial vertical - padrão E</sub>
<sub>Barracão/Telheiro/Oficina - padrão A</sub>
<sub>Barracão/Telheiro/Oficina/Posto de serviço/Armazém/Depósito/Indústria - padrão B</sub>
<sub>Oficina/Posto de serviço/Armazém/Depósito/Indústria - padrão C</sub>
<sub>Oficina/Posto de serviço/Armazém/Depósito/Indústria - padrão D</sub>
<sub>Indústria - padrão E</sub>
<sub>Templo/Clube/Ginásio ou Estádio esportivo/Museu/Hipódromo/Cinema/Teatro/Aeroporto/Estações/etc. - padrão B</sub>
<sub>Templo/Clube/Ginásio ou Estádio esportivo/Museu/Hipódromo/Cinema/Teatro/Aeroporto/Estações/etc. - padrão C</sub>
<sub>Templo/Clube/Ginásio ou Estádio esportivo/Museu/Hipódromo/Cinema/Teatro/Aeroporto/Estações/etc. - padrão D</sub>
<sub>Edifício de garagens - padrão A</sub>
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
0,0
Lote de fundos
De esquina
Normal
Lote de esquina em ZER
Terreno interno
De duas ou mais frentes
