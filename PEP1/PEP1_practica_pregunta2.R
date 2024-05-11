#================
# 2da Pregunta: 
# Entre el año 2018 y 2020, el número de personas fallecidas por cáncer de mama fue de 4.876 personas.
#================

# Header
library("Rlab") # Llamada a libreria Rlab

#================
# Pregunta:
# a. Calcule la probabilidad de que hoy no muera nadie por cáncer de mama (6 puntos).
#================
lambda_1 = 4876 / (365*3) # Lamba son ocurrencia de muertes en dias
k1 = 0 #0 muertes
pregunta_a = dpois(k1,lambda_1) # Aplica distribucion de poisson para obtener probabilidad
cat("Pregunta_a:", pregunta_a) # Imprime el resultado


#================
# Pregunta:
# b. Calcule la probabilidad de que ocurran como máximo dos muertes esta semana (7 puntos).
#================
lambda_2 = lambda_1 * 7 # Lamba son ocurrencia de muertes por semana
k2 = 1 # 1 muerte
k3 = 2 # 2 muestres
# Suma de la distribucion de poisson con ocurrencias de 0, 1 y 2 muertes
pregunta_b = dpois(k1,lambda_2) + dpois(k2,lambda_2) + dpois(k3,lambda_2) 
cat("Pregunta_b: ", pregunta_b) # Imprime resultado


#================
# Pregunta:
# c. Grafique la distribución de probabilidad asociada (7 puntos).
#================

# DISTRIBUCION DIARIA

muertes = seq(0,15) # Rango de muertes
lambda_diario = 4876/1095 # lamda de muertes por dias
distribucion = dpois(muertes,lambda_diario) # Distribucion de poisson diario
datos = data.frame(muertes,distribucion) # Creacion y asignacion de dataFrame

# Graph DIARIO
library("ggplot2") # Llamado a libreria ggplot2
grafico = ggplot(data=datos,aes(x=muertes,y=distribucion)) + # Funcion de ggplot para crear grafico
  geom_bar(stat="identity",fill="lightblue3") + # Grafico de barras
  theme_bw() + # Tema
  ggtitle("Distribucion de Poisson para muertes diarias por cancer de mama") + # Titulo
  xlab("Muertes") + # Label eje x
  ylab("Probabilidad") # Label eje y
plot(grafico) # Ploteo de grafico

# DISTRIBUCION SEMANAL

muertes = seq(0,50) #Rango de muertes
lambda_semanal = (4876/1095) * 7 # lamda de muertes por semana
distribucion = dpois(muertes,lambda_semanal) # Distribucion de poisson semanal
datos = data.frame(muertes,distribucion) # Creacion y asignacion de dataFrame

# Graph SEMANAL
grafico=ggplot(data=datos,aes(x=muertes,y=distribucion)) + # Funcion de ggplot para crear grafico
  geom_bar(stat="identity",fill="lightblue3") + # Grafico de barras
  theme_bw() + # Tema
  ggtitle("Distribucion de Poisson para muertes semanales por cancer de mama") + # Titulo
  xlab("Muertes") + # Label eje x
  ylab("Probabilidad") # Label eje y
plot(grafico) # Ploteo de grafico
