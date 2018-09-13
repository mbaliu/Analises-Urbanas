# Estudos de Logradouros
Estudo sobre a largura das calçadas e das vias públicas.

## Largura das Calçadas (em elaboração)
O cálculo da largura das calçadas podem ser calculadas a partir de pontos amostrais que possuirão o atributo da largura.

##### [Teste obtenção da medida (via SQL)](https://github.com/mbaliu/Analises-Urbanas/blob/master/Logradouro/SQL_distanciaPontoLinha.sql)
```sql
-- Retorna os ponto acrescentados da distância entre o ponto e uma linha
SELECT p.*, st_distance(l.geometry, p.geometry) AS distancia
FROM DESENHO_pontos AS p, DESENHO_linhas AS l
```
