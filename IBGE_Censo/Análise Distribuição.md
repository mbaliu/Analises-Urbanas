Para a avaliação da distribuição dos dados do Censo 2010, segue-se alguns rascunhos de análises.

```python
import matplotlib.pyplot as plt

v = []
for f in iface.activeLayer().getFeatures():
    try:
        value = float(f['EV005'])
        # Limita o universo para até 40 SM
        if value <= 40:
            v.append(value)
        
    except:
        continue

# Separa em classes de 1 SM
plt.hist(v, bins=40)
# Separa em classes de 0,5 SM
plt.hist(v, bins=80)

plt.show()
```
![Renda][mapa1]




[mapa1]: https://github.com/mbaliu/Analises-Urbanas/blob/master/IBGE_Censo/Reposit%C3%B3rio/Grafico_Distribuicao%20Renda%20em%20MSP%20_%2040%20e%2080%20bins.png "Distribuição da Renda Média para 40 e 80 bins"
