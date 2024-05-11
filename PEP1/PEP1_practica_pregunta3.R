#================
# 3ra Pregunta: 
# Un estudiante está analizando el tiempo que tarda en completar una serie de problemas matemáticos como
# parte de un experimento sobre métodos de estudio. Se registran los tiempos que el estudiante tarda en
# completar cada problema, y se asume que estos tiempos siguen una distribución uniforme entre 0 y 10
# minutos.
#================

library("extraDistr") # Llamado a libreria extraDistr
minutos = seq(0,10,by=1) # Se define la secuancia de minutos con rango de 1 min
distribucion = dunif(minutos, min = 0, max = 10) # Aplica distribucion continua


#================
# Pregunta:
# a. Grafique la función de densidad y masa correspondiente (6 puntos).
#================

# GRAFICO FUNCION DE DENSIDAD

library("ggplot2") # Llamado a libreria ggplot2
#Extraído de https://dk81.github.io/dkmathstats_site/rmath-uniform-plots.html
uniform_Plot = function(a, b){
  xvals <- data.frame(x = c(a, b)) #Range for x-values
  ggplot(data.frame(x = xvals), aes(x = x)) + xlim(c(a, b)) + ylim(0, 1/(b - a)) +
    stat_function(fun = dunif, args = list(min = a, max = b), geom = "area",
                  fill = "green", alpha = 0.35) +
    stat_function(fun = dunif, args = list(min = a, max = b)) +
    labs(x = "\n u", y = "f(u) \n",
         title = paste0("Distribucion Continua Uniforme \n Con Min = ", a, " & Max = ", b, " \n")) +
    theme(plot.title = element_text(hjust = 0.5),
          axis.title.x = element_text(face="bold", colour="blue", size = 12),
          axis.title.y = element_text(face="bold", colour="blue", size = 12)) +
    geom_vline(xintercept = a, linetype = "dashed", colour = "red") +
    geom_vline(xintercept = b, linetype = "dashed", colour = "red")
}
grafico=uniform_Plot(0,10)
plot(grafico) # Plotea el grafico


# GRAFICO FUNCION DE MASA

datos_masa=data.frame(minutos,distribucion,masa=1/10) # Se define dataFrame para funcion de masa

grafico=ggplot(data=datos_masa,aes(x=minutos,y=distribucion)) + # Funcion de ggplot para crear grafico
  geom_bar(stat="identity",fill="lightblue3") + # Grafico de barras
  theme_bw() + # Tema
  ggtitle("Funcion de masa") + # Titulo
  xlab("minutos") + # Label eje x
  ylab("Probabilidad") #Label eje y
plot(grafico) # Ploteo grafico


#================
# Pregunta:
# b. ¿Cuál es la probabilidad de que el estudiante tarde más de 3 minutos en completar un problema
# matemático? (7 puntos).
#================

# Calculo de probabilidad acumulada con distribucion uniforme entre 4 y 10 min.
pregunta_b = sum(dunif(4:10, min = 0, max = 10))
cat("Pregunta_b: ", pregunta_b) # Impresion de respeusta

#================
# Pregunta:
# c. Calcule la media y la desviación estándar de la variable estudiada (7 puntos).
#================

cat(" media =",(0+10)/2,"\n", # Calculo e impresion de media
    "desviacion estandar =",sqrt((10-0)^2/12),"\n") # Calculo e impresion de desviacion estandar
