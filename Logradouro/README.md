# Estudos de Logradouros
Estudo sobre a largura das calçadas e das vias públicas.

## Largura das Calçadas (em elaboração)
O cálculo da largura das calçadas podem ser calculadas a partir de pontos amostrais que possuirão o atributo da largura.

O processo de trabalho é constituído por:
1. Criação dos pontos amostrais;
    Considerando uma métrica de preferencia constante, como por exemplo um ponto a cada 25m
2. Cálcula da distância entre o ponto e a linha da quadra viária;
    De preferencia também desenhar a linha entre o ponto e o local calculado, para verificação do método.


<br>
__________________
##### 2. [Teste obtenção da medida (via SQL)](https://github.com/mbaliu/Analises-Urbanas/blob/master/Logradouro/SQL_distanciaPontoLinha.sql)
```sql
-- Retorna os ponto acrescentados da distância entre o ponto e uma linha
SELECT p.*, st_distance(l.geometry, p.geometry) AS distancia
FROM DESENHO_pontos AS p, DESENHO_linhas AS l
```
