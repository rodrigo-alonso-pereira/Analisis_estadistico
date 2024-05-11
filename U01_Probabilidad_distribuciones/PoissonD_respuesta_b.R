# Respuesta pregunta B

# Header
library("Rlab")
goles=seq(0:10)
lambda=2.689
distribucion=dpois(goles,lambda)
datos=data.frame(goles,distribucion)

# Graph
library("ggplot2")
grafico=ggplot(data=datos,aes(x=goles,y=distribucion)) +
  geom_bar(stat="identity",fill="lightblue3") +
  theme_bw() +
  ggtitle("Distribucion de probabilidades") +
  xlab("Goles") +
  ylab("Probabilidad")
plot(grafico)

# Body
cat(exp(-lambda)*lambda^k/factorial(k))
cat(dpois(k,lambda))
