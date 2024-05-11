# Header
library("Rlab")
hijas=seq(0,10)
intentosFallidos=2
distribucion=dnbinom(x=hijas,size=intentosFallidos, prob=0.5)
datos=data.frame(hijas,distribucion)

# Graph
library("ggplot2")
grafico=ggplot(data=datos,aes(x=hijas,y=distribucion)) +
  geom_bar(stat="identity",fill="lightblue3") +
  theme_bw() +
  ggtitle("Distribucion de probabilidades") +
  xlab("Hijas") +
  ylab("Probabilidad")
plot(grafico)

# Body
cat("Pregunta 1:", dnbinom(x=2,size=2,prob=0.5))

