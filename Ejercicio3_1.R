"________Construir un vector numerico con 10 entradas de los numeros 5:14"
vector_numerico <- c(5:14)

"__________Obtenga la longitud del vector"

length(vector_numerico)

"______Uso del [] para acceder a la primera posicion"

vector_numerico[1]

"_______Uso de la funcion length para acceder a la ultima posicion del vector"
vector_numerico[length(vector_numerico)]

"______Agregue una nueva entrada con el numero 23 al vector"

vector_numerico <- append(x = vector_numerico,values = 23,after = length(vector_numerico))

