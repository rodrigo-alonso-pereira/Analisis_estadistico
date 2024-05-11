# Distribucion normal
x=seq(0,100,by=0.1)
y=dnorm(seq(0,100,by=0.1),50,10)
z=y
z[which(x>60)]=0
datos=data.frame(x,y,z)

# Grafico
library("ggplot2")
p = ggplot(data.frame(x = x, y = y)) + aes(x = x, y = y) +
  geom_line(color="darkblue") + labs(x = "Dist. normal", y = "Densidad") +
  theme_classic() +
  geom_area(data = datos, aes(x=x,y=z), fill="lightblue", alpha=0.4) +
  scale_x_continuous(breaks = c(0,50,60,100))
plot(p)

