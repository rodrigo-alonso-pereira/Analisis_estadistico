# Respuesta pregunta 2.

# Header
library("Rlab")
goles=seq(0,10)
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

#================
# Pregunta a)
#================
# Body
k1=0
cat((exp(-lambda*0.5)*(lambda*0.5)^k1)/factorial(k1))
cat(dpois(k1,lambda*0.5))

#================
# Pregunta b)
#================
# Body
k2=3
cat((exp(-lambda*3)*(lambda*3)^k2)/factorial(k2))
cat(dpois(k2,lambda*3))

