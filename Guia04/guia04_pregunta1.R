#================
# 1.- Con lo anterior, busque o cree un ejercicio donde deba aplicar la prueba t, 
#     pero para una sola cola. (20 puntos)
#================

library(ggplot2)

grafico_densidad = ggplot(data = data.frame(x = c(48, 192)), aes(x)) + 
  stat_function(fun = dt, n = 101, args = list(x = 120, df = 29)) + 
  ylab("") + scale_y_continuous(breaks = NULL) + xlab("Puntaje") + ylab("Densidad") + 
  ggtitle("funcion de densidad (Distribucion t)") + theme_bw() + 
  geom_vline(xintercept = 115, cex = 1.2, colour = "darkred", linetype = "longdash") + 
  geom_text(aes(x = 105, label = "xbar", y = 0.0), colour = "darkred", size=5) + 
  geom_vline(xintercept = 120, cex = 1.2, colour = "coral3", linetype = "longdash") +
  geom_text(aes(x = 128, label = "mu", y = 0.001), colour = "coral3", size=5)

grafico_densidad

# Datos del ejercicio
mu = 120     # Valor hipotetico bajo Ho ([mmHg] presion arterial grupo control)
s = 10       # Desviacion estandar muestral ([mmHg] presion arterial)
x_bar = 115  # Media muestral ([mmHg] presion arterial)
n = 25       # Tamaño de la muestra

# Normalizacion
# Calculo del estadistico t
t = (x_bar - mu) / (s / sqrt(n))
t

# Nivel de significancia
alfa = 0.05

# Confianza
confianza = 1-alfa
confianza

# Calculo de intervalo una cola
t_alfa = qt(alfa, df = n-1)
t_alfa

set.seed(100)

# Creacion de muestra artificial
datos = rnorm(n, x_bar, s)

# Aplicacion del test
t = t.test(x = datos, mu = mu, conf.level = confianza)
print(t)

dnorm_limit = function(x) {
  y = dnorm(x)
  y[x < t_alfa | x > -t_alfa] = NA
  return(y)
}

grafico_densidad = ggplot(data = data.frame(x = c(-3, 3)), aes(x = x)) + 
  stat_function(fun = dnorm_limit, geom = "area", fill = "blue", alpha = 0.2) + stat_function(fun = dnorm) + 
  xlab("Remuneraciones") + ylab("Densidad") + ggtitle("funcion de densidad (Distribucion t)") + theme_bw() + 
  geom_vline(xintercept = (x_bar - mu) / (s/sqrt(n)), cex = 1.2, colour = "darkred") + 
  geom_text(aes(x = (x_bar - mu) / (s/sqrt(n)) + 0.2, label = "t", y = 0.0), colour = "darkred", size=6)
  
plot(grafico_densidad)
