# Header
library("Rlab")
rango=seq(0,30)
distribucion=dbinom(rango,size=30,prob=0.02)
datos=data.frame(rango,distribucion)

# Graph
library("ggplot2")
grafico=ggplot(data=datos,aes(x=rango,y=distribucion)) +
  geom_bar(stat="identity",fill="lightblue3") +
  theme_bw() +
  ggtitle("Distribucion de probabilidades") +
  xlab("Rango")+ylab("Probabilidad")
plot(grafico)

# Body
pregunta1=dbinom(1,size=30,prob=0.02)
cat("Pregunta 1:", pregunta1)

todos=dbinom(30,size=30,prob=0.02)
cat("Prob. de que todos nos accidentemos:" ,todos)