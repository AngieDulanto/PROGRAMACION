#PARTE 1

#Pregunta N�1

#a
0.3*0.15/(0.3*0.15+0.2*0.8+0.5*0.12)

#b
(5^6/factorial(6))*exp(-5)

#c
(factorial(20)*(0.4)^7*(0.6)^13)/(factorial(7)*factorial(13))

#Pregunta N�2

#a
sum(1:1000)

#b
sum((1:512)*2)+1

#Pregunta N�3

load("C:/Users/angie/Downloads/ei1012-1516-la-s1-datos (3).RData")
grupo

#a
length(grupo)

#b
which(grupo == "A")

#Pregunta N�4

#a
nota
sum(nota)

#b
mean(nota)

#c
which(nota> 7.0)

#d
sort(nota,decreasing = T)

#e
which(nota == max(nota))

#Pregunta N�5

#a
sum(nota[1:10])

#b
length(grupo[grupo == "C"])

#c
length(nota[nota>=5])

#d
length(nota[grupo == "B" & nota >= 5])

#e
length((nota [grupo == "C" & 
                nota >= 5])/(length(nota[
                  grupo == "C"])*100))

#f
grupo[nota == max(nota)]
grupo[nota == min(nota)]

#g
library(dplyr)
notasTota <- dplyr::tibble(grupAyB = grupo,notAyB = nota)
notasTota %>%
  dplyr::filter((grupAyB == "A" & notAyB >= 5)|(grupAyB == "B" & notAyB >= 5)) %>%
  dplyr::summarise(mean(notAyB))

#Pregunta N�6

#a
#cuantil 66 de todos
quantile(nota, probs = 0.66)

#cuantil 66 del grupo "C" 
quantile(nota[grupo == "C"], probs = 0.66)

#Pregunta N�7

#Porcentaje del total de alumnos que tienen una nota menor o igual que 4.9 
((length(nota[nota <= 4.9 ]))/(length(nota)))*100

#porcentaje mayor o igual que 4.9
((length(nota[nota >= 4.9]))/(length(nota)))*100

#Pregunta N�8

#Gr�fico de diagramas de caja de las notas de cada grupo, para poder comparar el nivel de cada uno de ellos.

library(ggplot2)
notasTota <- dplyr::tibble(grupo, nota)
notasTota %>% ggplot(mapping = aes(x = grupo, y = nota)) +
  geom_boxplot()


#Pregunta N�9

#Si la variable conc recoge la concentraci�n de plomo (en ppm) en el aire de cierta zona durante un d�a completo

#a. La concentraci�n m�xima
load("C:/Users/angie/Downloads/ei1012-1516-la-s1-datos (3).RData")
max(conc)

#b. Cantidad de muestreo que ha superado la concentraci�n de 40.0 ppm
length(conc[conc > 40.0])

#c. La concentraci�n media del d�a
mean(conc)

#d. Las 10 mediciones m�s bajas del d�a 
sort(conc)[1:10]

#e. Hora del d�a que se alcanz� la m�xima concentraci�n
fecha <- seq(
  as.POSIXct("2021-01-01 00:00"),
  length.out = length(conc),
  by = "10 min"
)

#PARTE 2

#Pregunta N�1
#Gr�fico de un plano utilizando Rstudio de los siguientes puntos:
x<-c(1,2,3,4,5,6,7,8,9,10)
y<-c(1,4,6,8,25,36,49,61,81,100)
plot(x,y)

#Pregunta N�2

#Matriz A en Rstudio
i<-c(1,2,3,4,2,4,6,8,3,6,9,12)
A<-matrix(i,ncol = 3,nrow = 4)

#Pregunta N�3

#Matriz identidad de tama�o 3I
3*diag(3)

#Pregunta N�4
#Crea una funci�n que cree una matriz nula ingresando las dimensiones
matrizN<-function(f,c){
  P<-matrix(0,nrow = f,ncol = c)
  return(P)
}
matrizN(5,4)

#Pregunta N�5
B<-diag(4)
B[1,1]<-0
B[2,2]<-2
B[3,3]<-3
B[4,4]<-4
B

#Pregunta N�6

#La matriz transpuesta de A del ejercicio 2
t(A)

#Pregunta N�7

#Las dimensiones son incompatibles.
A+B 

#Las dimensiones son incompatibles.
A-B 

# La matriz de la pregunta 5 por tres
3*B

#Filas y columnas diferentes
A%*%B 

#Pregunta N�8

m<-function(e){
  d<-c(1,-2,1,2,4,0,3,-2,1)
  m<-matrix(d,ncol = 3)
  r<-m^e
  return(r)
}
m(6)
