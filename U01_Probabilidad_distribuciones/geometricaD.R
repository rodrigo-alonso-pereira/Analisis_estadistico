# Header
library("Rlab")
meses=seq(0,12)
distribucion=dgeom(x=meses, prob=0.25)
datos=data.frame(meses,distribucion)

# Graph
library("ggplot2")
grafico=ggplot(data=datos,aes(x=meses,y=distribucion)) +
  geom_bar(stat="identity",fill="lightblue3") +
  theme_bw() +
  ggtitle("Distribucion de probabilidades") +
  xlab("Meses") +
  ylab("Probabilidad")
plot(grafico)

# Body
cat("Pregunta 1:", dgeom(x=4,prob=0.25))

