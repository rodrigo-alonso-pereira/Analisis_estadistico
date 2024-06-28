#================
# 3.- Toda la sección de Análisis estadístico en vespertino, incluyendo a la profesora (10 personas), se encuentra
# haciendo fila en un banco para retirar dinero, a ellos se unieron otras 20 autoridades de la Universidad de
# Santiago. El tiempo de espera en la fila sigue un una distribución normal con una media μ = 15 minutos y una
# desviación estándar de σ = 5 minutos.
#================

#Datos
media = 15
desviacion_estandar = 5


#================
# Pregunta:
# a) Calcular la probabilidad de que la media de tiempo de espera de la muestra sea menor a 14 minutos.
#================
total_personas_a = 30
media_tiempo_a = 14
z_a = (media_tiempo_a - media)/(desviacion_estandar/sqrt(total_personas_a))
probabilidad_a = pnorm(z_a)
cat("La probablidad de que la media de tiempo de espera de la muestra sea menor a 16 minutos con 30 clientes es de:", probabilidad_a)


#================
# Pregunta:
# b) Calcular la probabilidad de que la media de tiempo de espera de la muestra sea menor a 14 minutos
# si el tamaño de la muestra es de 10 clientes. ¿Qué se observa?
#================
total_personas_b = 10
media_tiempo_b = 14
z_b = (media_tiempo_b - media)/(desviacion_estandar/sqrt(total_personas_b))
probabilidad_b = pnorm(z_b)
cat("La probablidad de que la media de tiempo de espera de la muestra sea menor a 14 minutos con 10 clientes es de:", probabilidad_b)


#================
# Pregunta:
# c) Calcular la probabilidad de que la media de tiempo de espera de la muestra sea mayor a 16 minutos.
#================
total_personas_c = 30
media_tiempo_c = 16
z_c = (media_tiempo_c - media)/(desviacion_estandar/sqrt(total_personas_c))
probabilidad_c = 1 - pnorm(z_c)
cat("La probablidad de que la media de tiempo de espera de la muestra sea mayor a 16 minutos con 30 clientes es de:", probabilidad_c)

