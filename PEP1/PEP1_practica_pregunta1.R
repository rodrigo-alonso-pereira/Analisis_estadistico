#================
# 1era Pregunta: 
# Para ser entrenador Pokémon profesional en Chile usted debe ganar 150 batallas durante el año 2025,
# donde solo puede salir como ganador o perdedor de ella y la condición de empate no existe. Si sus
# probabilidades de ganar cada batalla son de un 53%, determine:
#================

# Header
library("Rlab")
rango=seq(0,150)
distribucion = dbinom(rango,size=150,prob=0.53)
datos=data.frame(rango,distribucion)

#================
# Pregunta:
# a) ¿Cuál es la probabilidad de que usted gane a lo menos 40 batallas y máximo 100? (6 puntos).
#================
# Body
pregunta_a = dbinom(40,size=100,prob=0.53)
cat("Pregunta_a:", pregunta_a)


#================
# Pregunta:
# b) ¿Cuál es la probabilidad de que usted gane más de 130 batallas? (7 puntos).
#================
# Body
pregunta_b = dbinom(131,size=150,prob=0.53)
cat("Pregunta_b:", pregunta_b)


#================
# Pregunta:
# c) Grafique la distribución de probabilidad asociada a las batallas Pokémon durante el 2025 (7 puntos).
#================
# Graph
library("ggplot2")
grafico=ggplot(data=datos,aes(x=rango,y=distribucion)) +
  geom_bar(stat="identity",fill="lightblue3") +
  theme_bw() +
  ggtitle("Distribucion de probabilidades Binomial de ganar batallas Pokemon") +
  xlab("Batallas Pokemon") +
  ylab("Probabilidad")
plot(grafico)
