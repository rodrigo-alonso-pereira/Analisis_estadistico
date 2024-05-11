#================
# 3ra Pregunta: 
# Un estudiante está analizando el tiempo que tarda en completar una serie de problemas matemáticos como
# parte de un experimento sobre métodos de estudio. Se registran los tiempos que el estudiante tarda en
# completar cada problema, y se asume que estos tiempos siguen una distribución uniforme entre 0 y 10
# minutos.
#================

library("extraDistr")
minutos = seq(0,10,by=1)
distribucion = dunif(min, min = 0, max = 10)


#================
# Pregunta:
# a. Grafique la función de densidad y masa correspondiente (6 puntos).
#================

# GRAFICO FUNCION DE DENSIDAD

library("ggplot2")
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
plot(grafico)


# GRAFICO FUNCION DE MASA

datos_masa=data.frame(min,distribucion,masa=1/10)

library("ggplot2")
grafico=ggplot(data=datos_masa,aes(x=minutos,y=distribucion)) +
  geom_bar(stat="identity",fill="lightblue3") +
  theme_bw() +
  ggtitle("Funcion de masa") +
  xlab("minutos") +
  ylab("Probabilidad")
plot(grafico)


#================
# Pregunta:
# b. ¿Cuál es la probabilidad de que el estudiante tarde más de 3 minutos en completar un problema
# matemático? (7 puntos).
#================

pregunta_b = sum(dunif(4:10, min = 0, max = 10))
cat("Pregunta_b: ", pregunta_b)

#================
# Pregunta:
# c. Calcule la media y la desviación estándar de la variable estudiada (7 puntos).
#================

cat(" media =",(0+10)/2,"\n",
    "desviacion estandar =",sqrt((10-0)^2/12),"\n")