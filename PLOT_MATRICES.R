source(file = 'D:/CURSO RSTUDIO_FINANZAS/Librerias.R')


nombres_productos <- c('Tortas', 'Jugos', 'Yogurt con Cereal','Molletas')
nombres_cafeterias <- c('Cafeteria A', 'Cafeteria B', 'Cafeteria C')
valores <- c(20,22,18,10,9,12,15,15,17,13,12,10)

"_____________-Construir la matriz"
matriz_precios <- matrix(data = valores,nrow = 4,byrow = TRUE,dimnames = list(nombres_productos,nombres_cafeterias))

"___________Obtener las dimensiones de la matriz"
dim(matriz_precios)

"_____Col_names y row_names"

nombre_columnas <- colnames(matriz_precios)
nombre_filas <- rownames(matriz_precios)

nombre_columnas[3]
nombre_filas[1]

"_____Operaciones con matrices"

matriz_precios
t(matriz_precios) #Con la funcion t, se pasan columnas a filas

matriz_precios * 2
matriz_precios + 2
matriz_precios ^ 2
matriz_precios * matriz_precios

"__________Crear segunda matriz"

matriz_precios2 <- matrix(data =c(1:12),nrow =4)

matriz_precios + matriz_precios2

"_________Agregar una nueva columna a la matriz"

'Cafeteria D' <- c(21,15,13,15)


matriz_precios <- cbind(matriz_precios,`Cafeteria D`)

"_________Graficar con matplot"

matplot(matriz_precios,type = 'o',pch = NULL, col = c('red','black','blue','orange'),xlab = 'Distintos productos',ylab = 'Valor del producto',xlim = c(1,4),ylim = c(9,22))

matriz_precios[c('Tortas','Molletas'),c('Cafeteria A')]

matriz_precios[c(1:3)]












