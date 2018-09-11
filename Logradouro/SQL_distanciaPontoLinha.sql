-- Retorna os ponto acrescentados da distância entre o ponto e uma linha
SELECT p.*, st_distance(l.geometry, p.geometry) AS distancia
FROM DESENHO_pontos AS p, DESENHO_linhas AS l
