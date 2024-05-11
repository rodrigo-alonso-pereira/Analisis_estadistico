# Header
library("Rlab")
proveedorA=10 # exitos
proveedorB=20 # fracasos
ventas=4 # experimentos
exitos=seq(0:10) #Exitos
distribucion=dhyper(x=exitos,m=proveedorA,k=ventas,n=proveedorB)
datos=data.frame(exitos,distribucion)

# Graph
library("ggplot2")
grafico=ggplot(data=datos,aes(x=exitos,y=distribucion)) +
  geom_bar(stat="identity",fill="lightblue3") +
  theme_bw() +
  ggtitle("Distribucion de probabilidades") +
  xlab("Productos de A") +
  ylab("Probabilidad")
plot(grafico)

# Body
exitos=3
cat("Exitos: ",dhyper(x=exitos,m=proveedorA,k=ventas,n=proveedorB))
