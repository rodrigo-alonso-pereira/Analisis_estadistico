#================
# Preambulo
#================
library("Rlab")
rango = seq(-5,5)
distribucion = dbern(rango, prob = 3/2)
datos = data.frame(rango, distribucion)

#Graficos
library("ggplot2")
grafico = ggplot(data=datos,aes(x=rango,y=distribucion))
grafico = grafico + geom_bar(stat="identity",fill="lightblue3")
grafico = grafico + theme_bw() + ggtitle("Distribucion de probabilidades")
grafico = grafico + xlab("Rango") + ylab("Probabilidad")
plot(grafico)

#================
# Pregunta 1
#================
prob_BSV = dbern(1,3/12,log=FALSE)
prob_CC = dbern(0,3/12,log=FALSE)

print(prob_BSV)
print(prob_CC)


