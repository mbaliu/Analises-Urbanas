# -*- coding: utf-8 -*-
# Código de Verificação Módulo de 11

def cv(SQL):
    SQL = str(SQL)

    nSQL = ''.join(SQL.split('.'))
    fator =  [n+2 for n in range(len(nSQL))][::-1]

    produtos = []
    for i in range(len(nSQL)):
        produto = int(nSQL[i]) * fator[i]
        produtos.append(produto)
        
    somatorio = 0
    for i in produtos:
        somatorio += i
        
    nresto = somatorio%11
    if 11-nresto in (0,1):
        cv = 0
    else:
        cv = 11-nresto

    return cv
