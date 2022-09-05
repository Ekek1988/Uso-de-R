source(file = 'D:/CURSO RSTUDIO_FINANZAS/Librerias.R')

hoy <- today()

acciones <- getSymbols("TSLA", from = "2017-01-01", to = hoy, src = "yahoo",
                       auto.assign = F)[,6]

plot(acciones)

acciones <- as.data.frame(acciones)
acciones$Fecha <- rownames(acciones)
rownames(acciones) <- NULL
names (acciones) = c("Precio", "Fecha")
acciones$Fecha = as.Date(acciones$Fecha)

rango_fecha = (hoy + 1) : (hoy+30)
Precio = as.numeric(NA)
rango_fecha = as.data.frame(cbind(Precio,rango_fecha))
rango_fecha$Fecha = as.Date(rango_fecha$rango_fecha)
rango_fecha$rango_fecha = NULL

acciones <- rbind(acciones,rango_fecha)

acciones$Fecha_dup = acciones$Fecha
acciones <- acciones %>% separate(Fecha, c("Año", "Mes", "Dia"))
acciones$Año = as.numeric(acciones$Año)
acciones$Mes = as.numeric(acciones$Mes)
acciones$Dia = as.numeric(acciones$Dia)

set.seed(1994)
acciones.sc <- as.data.frame(cbind(acciones$Precio,acciones$Fecha_dup, scale(acciones[ ,c(2:4)])))
names(acciones.sc)[1] = "Precio"
names(acciones.sc)[2] = "Fecha"
acciones.sc$Fecha = as.Date(acciones.sc$Fecha)

set.seed(1994)
train = createDataPartition(na.omit(subset(acciones, acciones$Fecha_dup  < today()))$Precio, 
                            p = 0.7, list = F)
test = rbind(acciones[-train, ] , subset(acciones, acciones$Fecha_dup >= today()))
test.sc = as.data.frame(cbind(test$Precio,test$Fecha_dup, scale(test[,c(2,3,4)])))

names(test.sc)[1] = "Precio"
names(test.sc)[2] = "Fecha"
test.sc$Fecha = as.Date(test.sc$Fecha)

#Construir la red neuronal

mod = neuralnet(formula = Precio ~ Año + Mes + Dia, data = acciones.sc[train,], hidden = 2,
                threshold = 0.01, stepmax = 1e+08, rep = 1, linear.output = TRUE) 

pred <- compute(mod, test.sc)

#Requiere escalado
#Tiempo requiere procesamiento
#Sensible a las variables
