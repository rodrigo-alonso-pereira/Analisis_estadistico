#================
# 2.- Supongamos que un científico afirma que la temperatura media de cierta región es al menos 25 grados
# Celsius en verano. Se toma una muestra de 36 días de verano y se encuentra que la temperatura media
# muestral es de 24 grados Celsius, con una desviación estándar muestral de 2 grados Celsius. Además, se
# conoce que la desviación estándar poblacional es de 3 grados Celsius. Con un nivel de significancia de 0.05,
# ¿podemos rechazar la afirmación del científico?
#================

#Datos
temperatura_media = 25
temperatura_media_muestra = 24
n = 36
desviacion_estandar_muestra = 2
desviacion_estandar_poblacional = 3
nivel_significancia = 0.05
z_alpha = qnorm(nivel_significancia)
cat("z_alpha =", z_alpha)

#================
# Pregunta:
# a) Para responder a la pregunta evalué con el test t. Argumente
#================

muestra_t = rnorm(n, mean=temperatura_media_muestra, desviacion_estandar_muestra)
t = t.test(muestra_t, mu=temperatura_media, conf.level=0.95, alternative="less")
print(t)

#================
# Pregunta:
# b) Para responder a la pregunta evalué con el test z. Argumente
#================
muestra_z = rep(temperatura_media_muestra, n)
z = z.test(muestra_z, mu=temperatura_media, sigma.x=desviacion_estandar_poblacional, conf.level=0.95, alternative="less")
print(z)

