###
# Métrica: Kolmogorov-Smirnov (KS)
###

###

# La métrica consiste en una prueba no paramétrica que mide la bondad de ajuste de dos distribuciones
# de probabilidad (usualmente empíricas), es decir, determina si dos muestras provienen de la
# misma distribución de probabiliodad. La prueba calcula la distancia máxima entre dos distribucines
# de probabilidad acumuladas.

#   D = sup_x |F_1(x) - F_2(x)|. 

# La hipótesis nula de la prueba plantea que ambas muestras provienen de la misma distribución.
###

############ Código

# Importar librerías
import numpy as np
from scipy.stats import ks_2samp

# Se crean dos muestras con distribuciones normal y uniforme
muestra1 = np.random.normal(0, 0.45, 100)
muestra2 = np.random.uniform(0, 1, 100)

# Se obtiene el estadístico D y el valor p.
ks, p_valor = ks_2samp(muestra1, muestra2)

# Se muestran resultados
print(f"Estadístico de KS: {ks}")
print(f"Valor p de KS: {p_valor}")


