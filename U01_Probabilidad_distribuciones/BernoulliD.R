# Header
library("Rlab")
rango=seq(-5,5)
distribucion=dbern(rango,prob=3/12)
datos=data.frame(rango,distribucion)

# Graph
library("ggplot2")
grafico=ggplot(data=datos,aes(x=rango,y=distribucion)) +
  geom_bar(stat="identity",fill="lightblue3") +
  theme_bw() +
  ggtitle("Distribucion de probabilidades") +
  xlab("Rango")+ylab("Probabilidad")
plot(grafico)

prob_BSV=dbern(1,3/12,log=FALSE)
prob_CC=dbern(0,3/12,log=FALSE)