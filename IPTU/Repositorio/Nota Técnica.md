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


REGIAO|SETORES_FISCAIS
--------|---------
Centro|<sub>'35','33','6','9','8','11','34','10','5','4','20','7','1','19','18'</sub>
Leste 1|<sub>'153','129','44','55','29','148','155','154','30','156','116','102','58','57','31','32','56','61','53','130','113','196','17','25','28','3','2','52','27','26','51','54','303','117','110','59','118','100','62','60','142','143'</sub>
Leste 2|<sub>'152','115','136','150','114','137','135','133','141','131','144','132','195','194','193','192','134','111','239','252','229','247','234','253','251','250','249','246','245','244','243','241','240','238','237','236','248','151','139','112','235','233','232','230','231','242','149','147','146','145','140','138'</sub>
Norte 1|<sub>'108','124','307','305','126','104','125','127','215','214','213','212','211','208','106','205','105','78','76','75','74','190','189','77','107','308','210','209','207','206','204','203','202','218','217','216','191','188','187','306'</sub>
Norte 2|<sub>'71','68','70','198','64','128','304','73','109','69','228','225','63','227','226','224','223','222','221','220','219','66','67','65','72'</sub>
Oeste|<sub>'79','84','300','98','80','24','13','22','200','199','101','99','82','123','186','185','171','12','85','83','14','16','81','21','15','96','23','160','159','201','97','299','197'</sub>
Sul 1|<sub>'157','302','158','309','48','42','38','49','50','91','36','45','46','40','119','310','41','39','43','37','47'</sub>
Sul 2|<sub>'168','165','164','162','161','121','167','122','293','87','95','94','93','90','89','88','184','173','183','182','181','180','179','178','177','176','175','174','172','170','169','103','298','261','86','292','256','262','120','297','296','295','294','291','273','272','270','269','265','254','255','257','258','259','260','263','264','266','267','268','290','289','288','287','286','285','284','283','282','281','279','277','276','275','274','301','163','166','280','278','271'</sub>
