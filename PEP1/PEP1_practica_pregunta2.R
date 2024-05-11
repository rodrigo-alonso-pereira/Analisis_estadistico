#================
# 2da Pregunta: 
# Entre el año 2018 y 2020, el número de personas fallecidas por cáncer de mama fue de 4.876 personas.
#================

#================
# Pregunta:
# a. Calcule la probabilidad de que hoy no muera nadie por cáncer de mama (6 puntos).
#================
lambda_1 = 4876 / (365*3) 
k1 = 0
pregunta_a = dpois(k1,lambda_1)
cat("Pregunta_a:", pregunta_a)


#================
# Pregunta:
# b. Calcule la probabilidad de que ocurran como máximo dos muertes esta semana (7 puntos).
#================
lambda_2 = lambda_1 * 7
k2 = 1
k3 = 2
pregunta_b = dpois(k1,lambda_2) + dpois(k2,lambda_2) + dpois(k3,lambda_2)
cat("Pregunta_b: ", pregunta_b)


#================
# Pregunta:
# c. Grafique la distribución de probabilidad asociada (7 puntos).
#================

# DISTRIBUCION DIARIA

# Header
library("Rlab")
muertes = seq(0,15)
lambda_diario = 4876/1095
distribucion = dpois(muertes,lambda_diario)
datos = data.frame(muertes,distribucion)

# Graph DIARIO
library("ggplot2")
grafico = ggplot(data=datos,aes(x=muertes,y=distribucion)) +
  geom_bar(stat="identity",fill="lightblue3") +
  theme_bw() +
  ggtitle("Distribucion de Poisson para muertes diarias por cancer de mama") +
  xlab("Muertes") +
  ylab("Probabilidad")
plot(grafico)

# DISTRIBUCION SEMANAL

muertes = seq(0,50)
lambda_semanal = (4876/1095) * 7
distribucion = dpois(muertes,lambda_semanal)
datos = data.frame(muertes,distribucion)

# Graph SEMANAL
library("ggplot2")
grafico=ggplot(data=datos,aes(x=muertes,y=distribucion)) +
  geom_bar(stat="identity",fill="lightblue3") +
  theme_bw() +
  ggtitle("Distribucion de Poisson para muertes semanales por cancer de mama") +
  xlab("Muertes") +
  ylab("Probabilidad")
plot(grafico)
