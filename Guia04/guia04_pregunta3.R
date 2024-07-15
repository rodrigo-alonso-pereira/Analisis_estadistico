#================
# 3.- En el lenguaje de programación r existe un conjunto de datos llamados “iris” 
#     el cual tiene diversos datos de esta planta. 
#================

head(iris, 10)

#================
# a)  Su objetivo es analizar dicho conjunto de datos y explicar la información contenida. Posteriormente, 
#     gráfica en R un gráfico que represente las características de los pétalos 
#     de la planta iris, en específico, su largo y el ancho del pétalo del conjunto 
#     “iris” el gráfico realizado debe ser como los vistos en clases.
#================

grafico = ggplot(iris, aes(x = Petal.Width, y = Petal.Length, colour = Species)) + 
  geom_point(aes(shape = Species)) + 
  xlab("Petal Width") + ylab("Petal Length") + ggtitle("Petal Length vs Width") + 
  theme(plot.title = element_text(hjust = 0.5))
plot(grafico)

#================
# b)  Luego, ajuste el modelo lineal según lo visto en clases, obtenga las características 
#     del mismo, tales como residuos, coeficientes, entre otros, y finalmente grafique la 
#     regresión lineal simple.
#================

# Calculando la regresion (Dependiente ~ Independiente)
regresion = lm(Petal.Width ~ Petal.Length, iris)

# Imprime datos de regresion
print(regresion)

# Imprime un resumen de la regresion
summary(regresion)

# Imprime el valor del r^2 del modelo
print(summary(regresion)$r.squared)

grafico = ggplot(iris, aes(x = Petal.Width, y = Petal.Length, colour = Species)) + 
  geom_point(aes(shape = Species)) + 
  xlab("Petal Width") + ylab("Petal Length") + ggtitle("Lineal Regression: Petal Length vs Width") + 
  geom_smooth(method = "lm", formula = y ~ x, level=0.95, color="black", size=0.5, se = FALSE) +
  theme(plot.title = element_text(hjust = 0.5))
plot(grafico)

#================
# c)  Una vez realizado lo anterior, explique con sus palabras de forma clara lo que se observa 
#     en los gráficos, si los modelos son representativos o no, el significado de los valores 
#     obtenidos en R, etc.
#================

# Intervalo de confianza
confianza = confint(regresion, level=0.95)
print(confianza)

grafico = ggplot(iris, aes(x = Petal.Width, y = Petal.Length, colour = Species)) + 
  geom_point(aes(shape = Species)) + 
  xlab("Petal Width") + ylab("Petal Length") + ggtitle("Confidence Interval: Petal Length vs Width") + 
  geom_smooth(method = "lm", formula = y ~ x, level=0.95, color="black", size=0.5) +
  theme(plot.title = element_text(hjust = 0.5))
plot(grafico)

