  library(psych)
  
  #================
  # Primera pregunta (35 puntos)
  # Para su ramo de análisis de algoritmos y estructura de datos le solicitaron crear un algoritmo que sea
  # capaz de analizar bases de datos de una empresa con el objetivo de clasificar en percentiles los sueldos de
  # los empleados de manera gráfica y a través de un listado con cada nombre, sueldo y cuartil del empleado.
  # El día que presentaron los resultados, el profesor los organizo en parejas, les entrego los computadores de
  # la Universidad (todos con misma marca, modelo y año) y diversas bases de datos para analizar con sus
  # algoritmos elaborados. Los resultados de rendimiento de los algoritmos (suyo y de su pareja) fueron los
  # siguientes:
  #================
  
  #================
  # a) Genere en R una representación grafica para los datos entregados, calcule los parámetros básicos (media,
  #    desviación estándar y coeficientes de variación) y explique a que conclusión puede llegar con los
  #    resultados obtenidos. (10 puntos).
  #================
  
  alg_1 = c(3.2, 3.0, 2.9, 3.5, 2.7, 3.1, 3.2, 2.9, 3.0, 2.8, 
            3.1, 3.1, 3.5, 3.0, 2.7, 2.9, 3.0, 3.5, 3.0, 2.7, 
            2.9, 3.2, 3.4, 3.1)
  alg_2 = c(2.2, 2.7, 2.6, 2.5, 2.3, 2.0, 2.5, 2.2, 2.1, 2.7, 
            2.6, 2.1, 2.5, 2.0, 2.3, 2.2, 2.2, 2.1, 2.6, 2.4, 
            2.0, 2.6, 2.8, 2.5)
  df = data.frame(alg_1, alg_2)
  
  boxplot(alg_1,alg_2,names=c("algoritmo 1","algoritmo 2"))
  
  valores = describe(df, IQR=T, quant=c(.25,.50,.75))
  print(valores)
  
  medias = valores$mean
  medias
  
  desviaciones_estandar = valores$sd
  desviaciones_estandar
  
  coef_variacion = (desviaciones_estandar/medias)*100
  coef_variacion
  
  #================
  # b) Evalué la normalidad de los datos entregados para cada algoritmo, con los diversos test revisados
  #    en clases, determine que test puede utilizar para comparar ambos algoritmos. Fundamente su
  #    respuesta en detalle. (10 puntos)
  #================
  library("nortest")
  
  # Test alg_1 
  shapiro.test(datos$alg_1)$p.value
  lillie.test(datos$alg_1)$p.value
  ad.test(datos$alg_1)$p.value
  cvm.test(datos$alg_1)$p.value
  pearson.test(datos$alg_1)$p.value
  sf.test(datos$alg_1)$p.value
  
  # Test alg_2
  shapiro.test(datos$alg_2)$p.value
  lillie.test(datos$alg_2)$p.value
  ad.test(datos$alg_2)$p.value
  cvm.test(datos$alg_2)$p.value
  pearson.test(datos$alg_2)$p.value
  sf.test(datos$alg_2)$p.value
  
  #================
  # c) Aplique un test correspondiente a este ejercicio que le permita determinar y comparar los
  #    rendimientos de ambos algoritmos, explique los resultados obtenidos y compare con los resultados
  #    obtenidos en la parte a (10 puntos).
  #================
  t.test(alg_1, alg_2)
  
  #================
  # d) Dentro de los dos grupos presentados, determine mediante algún test si los datos presentan o no
  #   homocedasticidad y explique los resultados y conclusiones obtenidas. (5 puntos)
  #================
  library(car)
  
  datos_test = data.frame(grupos=c(rep("alg_1", 24), rep("alg_2", 24)), valores=c(alg_1, alg_2))
  leveneTest(valores ~ grupos, data=datos_test)
  