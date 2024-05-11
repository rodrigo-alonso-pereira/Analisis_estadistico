# Header
paquetes = as.character(seq(2,8,by=2))
ventas = c(5,10,8,2)
#Cálculo de probabilidades
probabilidades=ventas/sum(ventas)
datos=data.frame(paquetes,ventas,probabilidades)
#Gráfico
library("ggplot2")
grafico = ggplot(data=datos,aes(x=paquetes,y=ventas))
grafico = grafico + geom_bar(stat="identity",fill="lightblue3")
grafico = grafico + theme_bw() + ggtitle("Distribución de probabilidades")
grafico = grafico + xlab("Paquetes de baterias") + ylab("Número de
ventas")
plot(grafico)