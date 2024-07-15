#================
# 1.- Chi-cuadrado fue una de las pruebas no paramétricas vistas en clases, 
#     busque y desarrolle un ejercicio donde se utilice chi-cuadrado siguiendo 
#     el paso a paso proporcionado al inicio de esta guía. (20 puntos)
#================

# Datos del ejercicio
observado = c(43, 53, 39) # Produccion observada
esperado = c(45, 45, 45)  # Produccion esperada

# Normalizacion
# Calculo del estadistico chi-cuadrado
chi_cuadrado = sum((observado - esperado)^2 / esperado)
chi_cuadrado

# Nivel de significancia
alfa = 0.05

# Grados de libertad
df = length(observado) - 1

# Aplicacion del test: Valor critico
valor_critico = qchisq(1 - alfa, df)
valor_critico

# Conclusion de la prueba
result = ifelse(chi_cuadrado > valor_critico, 
                "Rechazamos H0: Las máquinas no producen en cantidades similares.", 
                "No podemos rechazar H0: Las máquinas producen en cantidades similares.")
print(result)
