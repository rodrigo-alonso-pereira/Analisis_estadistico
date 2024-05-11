#================
# Preambulo
#================
library("Rlab")
hijas = seq(0,10)
intentos_fallidos=2
distribucion = dnbinom(x=hijas, size=intentos_fallidos, prob=0.5)
datos = data.frame(hijas,distribucion)

#Grafico
library("ggplot2")
grafico = ggplot(data=datos, aes(x=hijas,y=distribucion))
grafico = grafico + geom_bar(stat="identity", fill="lightblue3")
grafico = grafico + theme_bw() + ggtitle("Distribucion de probabilidades")
grafico = grafico + xlab("Hijas") + ylab("Probabilidad")
plot(grafico)

#================
# Pregunta 1
#================
print(dnbinom(x=2, size=2, prob=0.5))

