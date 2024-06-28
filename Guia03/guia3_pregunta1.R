#================
# 1era Pregunta: 
# 1.- Diariamente los estudiantes de la Universidad de Santiago deben dedicar tiempo para estudiar y aprobar
# cada uno de sus ramos. El tiempo dedicado se puede aproximar por una variable aleatoria con distribución
# normal de desviación típica 15 minutos. Explique su desarrollo paso a paso.
#================

#Datos
desviacion = 15
n = 3000;
tiempo_medio = 120
alpha = 0.05

#================
# Pregunta:
# a) Para una muestra aleatoria de 3000 estudiantes de esa ciudad se ha obtenido un tiempo medio de
# dedicación al estudio de 120 minutos. Calcule el intervalo de confianza al 95 %.
#================

#Calculo de intervalo de confianza
error = desviacion/sqrt(n)
z = qnorm(1 - alpha/2)
ic_inf = (tiempo_medio - z*error)
ic_sup = (tiempo_medio + z*error)
cat("El intervalo de confinza al 95% es: [",ic_inf, ";",ic_sup, "]")