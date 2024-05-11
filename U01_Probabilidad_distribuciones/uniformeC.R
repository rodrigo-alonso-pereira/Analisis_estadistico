  # Header
  library("extraDistr")
  min=seq(0,35,by=1)
  distribucion=dunif(min, min = 0, max = 35)
  #datos=data.frame(min,distribucion,acumulado=cumsum(distribucion))
  datos_masa=data.frame(min,distribucion,masa=1/35)
  
  # Body
  #================
  # Pregunta a)
  #================
  
  # Graph
  library("ggplot2")
  #Extraído de https://dk81.github.io/dkmathstats_site/rmath-uniform-plots.html
  uniform_Plot = function(a, b){
    xvals <- data.frame(x = c(a, b)) #Range for x-values
    ggplot(data.frame(x = xvals), aes(x = x)) + xlim(c(a, b)) + ylim(0, 1/(b - a)) +
      stat_function(fun = dunif, args = list(min = a, max = b), geom = "area",
                    fill = "green", alpha = 0.35) +
      stat_function(fun = dunif, args = list(min = a, max = b)) +
      labs(x = "\n u", y = "f(u) \n",
           title = paste0("Distribucion Continua Uniforme \n Con Min = ", a, " & Max = ", b, " \n")) +
      theme(plot.title = element_text(hjust = 0.5),
            axis.title.x = element_text(face="bold", colour="blue", size = 12),
            axis.title.y = element_text(face="bold", colour="blue", size = 12)) +
      geom_vline(xintercept = a, linetype = "dashed", colour = "red") +
      geom_vline(xintercept = b, linetype = "dashed", colour = "red")
  }
  grafico=uniform_Plot(0,35)
  plot(grafico)
  
  #================
  # Pregunta b)
  #================
  
  # Graph
  library("ggplot2")
  grafico=ggplot(data=datos_masa,aes(x=min,y=distribucion)) +
    geom_bar(stat="identity",fill="lightblue3") +
    theme_bw() +
    ggtitle("Funcion de masa") +
    xlab("min") +
    ylab("Probabilidad")
  plot(grafico)
  
  #================
  # Pregunta c)
  #================
  
  cat(" media =",(0+35)/2,"\n",
      "varianza =",(35-0)^2/12,"\n")
  
