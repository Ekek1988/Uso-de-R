variable_numerica <- 5
variable_caracter <- 'Mi primer  variable caracter'
variable_fecha <- as.Date('2021-05-08',format = '%Y-%m-%d')

str(variable_fecha)


"_____________________Trabajar con variable numerica"

variable_numerica1 <- 7
variable_numerica2 <- variable_numerica + variable_numerica1

"___________________Trabajar con variable Caracter"

variable_caracter <- paste(variable_caracter,'en 2021', sep = ' ')

"___________________Trabajar con la variable fecha"

variable_fecha2 <- as.Date('2021-04-08')
variable_fecha3 <- as.numeric(variable_fecha - variable_fecha2)
