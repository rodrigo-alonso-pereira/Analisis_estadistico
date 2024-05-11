#================
# 1era Pregunta: 
# Para ser entrenador Pokémon profesional en Chile usted debe ganar 150 batallas durante el año 2025,
# donde solo puede salir como ganador o perdedor de ella y la condición de empate no existe. Si sus
# probabilidades de ganar cada batalla son de un 53%, determine:
#================

# Header
library("Rlab") # Llamado a Liberia Rlab

#================
# Pregunta:
# a) ¿Cuál es la probabilidad de que usted gane a lo menos 40 batallas y máximo 100? (6 puntos).
#================
# Calculo de suma acumulada de probabilidad con distribucion binomial entre 40 y 100 batallas
pregunta_a = sum(dbinom(40:100,size=100,prob=0.53)) 
cat("Pregunta_a:", pregunta_a) # Se imprime respuesta


#================
# Pregunta:
# b) ¿Cuál es la probabilidad de que usted gane más de 130 batallas? (7 puntos).
#================
# Calculo de suma acumulada de probabilidad con distribucion binomial entre 131 y 150 batallas
pregunta_b = sum(dbinom(131:150,size=150,prob=0.53)) 
cat("Pregunta_b:", pregunta_b) # Se imprime respuesta


#================
# Pregunta:
# c) Grafique la distribución de probabilidad asociada a las batallas Pokémon durante el 2025 (7 puntos).
#================

rango = seq(0,150) # Define rango entre 0 y 150
distribucion = dbinom(rango,size=150,prob=0.53) # Se usa funcion de distribucion binomial
datos = data.frame(rango,distribucion) # Se crea dataframe y se asigna a datos

# Graph
library("ggplot2") # Llamado a libreria
grafico=ggplot(data=datos,aes(x=rango,y=distribucion)) + # Asigna dataframe a ggplot y define eje x e y
  geom_bar(stat="identity",fill="lightblue3") + # Se define grafico de barras
  theme_bw() + # Tema
  ggtitle("Distribucion de probabilidades Binomial de ganar batallas Pokemon") + #Titulo
  xlab("Batallas Pokemon") + # Label eje x
  ylab("Probabilidad") # Label eje y
plot(grafico) # Ploteo de grafico
