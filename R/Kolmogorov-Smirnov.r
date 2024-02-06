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

# Se plantean dos maneras de calcular esta métrica, con R base y con la librería ROCR.
# La segunda forma está aterrizada a un contexto de evaluación de un modelo de clasificación binario con
# respecto a la respectiva probabilidad de pertenecer a una clase.

############# Código

# Importar librerías
library(dplyr)

# Se crean dos muestras con distribuciones normal y uniforme
muestra1 <- rnorm(100, mean = 0, sd = 0.45)
muestra2 <- runif(100, min = 0, max = 1)

### 1ra forma ###
object_ks <- ks.test(muestra1, muestra2)

ks1 <- object_ks$statistic # Captura estadístico D
p_value1 <- object_ks$p.value # captura p-valor

### 2da forma ###

# Se construye con las muestras anteriores un DataFrame de dos columnas. Una de ellas contendrá 2 clases (1 y 0),
# y la otra probabilidades de obtener una clase positiva (1) entregadas por un modelo de clasificación binario.

df <- data.frame(Prob = abs(muestra1),
                 Clases = ifelse(muestra2 >= 0.5, 1, 0))

library(ROCR)

# Se crea instancia de predicción
performance <- ROCR::prediction(df$Prob, df$Clases)

perf <- performance(performance, "tpr", "fpr")
ks2 <- max(abs(attr(perf, "y.values")[[1]] - attr(perf, "x.values")[[1]]))


################################################################################################################
