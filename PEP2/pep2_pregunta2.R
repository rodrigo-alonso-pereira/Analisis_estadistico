#================
# Primera pregunta (35 puntos)
# En este ejercicio, usted analizará un conjunto de datos que reflejan la relación que existe entre la
# expectativa de vida en años de las personas en algunos países del mundo y el gasto percápita en salud
# (Datos correspondientes al año 2015 recolectados desde → https://ourworldindata.org/grapher/life-
# expectancy-vs-health-expenditure ).
# Los datos se han organizado y se encuentran en el archivo “.csv” disponible junto al enunciado.
# Los datos se pueden graficar de la siguiente manera:
#================

library(ggplot2)

datos = read.csv("Datos_pregunta2.csv",sep = ";", header = T)

grafico=ggplot(datos,aes(Gasto_salud_dolares ,expectativa_anual,,label=Pais)) +
  geom_point(aes(Gasto_salud_dolares,expectativa_anual),datos,color="red",alpha=1) +
  theme_bw() + xlab("Gasto percápita en salud ($US)") + ylab("Expectativa de vida en años") +
  ggtitle("Expectativa de vida vs Gasto percápita en salud") +
  theme(plot.title = element_text(hjust = 0.5)) + geom_text(hjust=0.1, vjust=0.1, size=3)
plot(grafico)

#================
# a) Con los datos presentados previamente, proponga un modelo de regresión lineal que relacione las
#    variables presentadas (la expectativa de vida en años (variable dependiente) con el gasto en salud
#    per cápita (variable independiente)). Evalué el modelo creado en base a los criterios que fueron
#    revisados en clases. (10 puntos)
#================

# Calculando la regresion
regresion = lm(expectativa_anual ~ Gasto_salud_dolares, datos)

# Imprime datos de regresion
print(regresion)

# Imprime un resumen de la regresion
summary(regresion)

# Imprime el valor del r^2 del modelo
print(summary(regresion)$r.squared)

grafico=ggplot(datos,aes(Gasto_salud_dolares ,expectativa_anual,,label=Pais)) +
  geom_point(aes(Gasto_salud_dolares,expectativa_anual),datos,color="red",alpha=1) +
  theme_bw() + xlab("Gasto percápita en salud ($US)") + ylab("Expectativa de vida en años") +
  ggtitle("Regresion Lineal: Expectativa de vida vs Gasto percápita en salud") +
  geom_smooth(method = "lm", formula = y ~ x, level=0.95, color="blue", size=0.5, se = FALSE) +
  theme(plot.title = element_text(hjust = 0.5)) + geom_text(hjust=0.1, vjust=0.1, size=3)

plot(grafico)

#================
# b) Con los datos obtenidos previamente, grafique el intervalo de confianza asociado a los datos y el
#    modelo de regresión, analice los resultados a lo largo del ejercicio y explique si el modelo de
#    regresión se ajusta a los datos. Según lo visto en clases, ¿Qué otro tipo de regresión lineal se
#    adaptaría de mejor manera a los datos?¿Por qué?. (15 puntos)
#================

# Intervalo de confianza
confianza = confint(regresion, level=0.95)
print(confianza)

grafico=ggplot(datos,aes(Gasto_salud_dolares ,expectativa_anual,,label=Pais)) +
  geom_point(aes(Gasto_salud_dolares,expectativa_anual),datos,color="red",alpha=1) +
  theme_bw() + xlab("Gasto percápita en salud ($US)") + ylab("Expectativa de vida en años") +
  ggtitle("Intervalo de Confianza: Expectativa de vida vs Gasto percápita en salud") +
  geom_smooth(method = "lm", formula = y ~ x, level=0.95, color="blue", size=0.5) +
  theme(plot.title = element_text(hjust = 0.5)) + geom_text(hjust=0.1, vjust=0.1, size=3)

plot(grafico)


# Ajustar el modelo de regresión logarítmica
r_log = lm(expectativa_anual ~ log(Gasto_salud_dolares), data = datos)

# Imprime el valor del r^2 del modelo
print(summary(r_log)$r.squared)

# Resumen del modelo
summary(r_log)

grafico=ggplot(datos,aes(Gasto_salud_dolares ,expectativa_anual,,label=Pais)) +
  geom_point(aes(Gasto_salud_dolares,expectativa_anual),datos,color="red",alpha=1) +
  theme_bw() + xlab("Gasto percápita en salud ($US)") + ylab("Expectativa de vida en años") +
  ggtitle("Regresión Logarítmica: Expectativa de vida vs Gasto percápita en salud") +
  geom_smooth(method = "lm", formula =  y ~ log(x), level=0.95, color="blue", size=0.5) +
  theme(plot.title = element_text(hjust = 0.5)) + geom_text(hjust=0.1, vjust=0.1, size=3)

plot(grafico)



