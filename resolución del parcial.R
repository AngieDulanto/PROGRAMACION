install.packages("tidyverse")
library(tidyverse)
install.packages("ggplot2")
library(ggplot2)
install.packages("sf")
library(sf)
install.packages("raster")
library(raster)
library(rgdal)

#PARTE 1
#Pregunta N°1
x<- c(seq(from= -10,to=10,by = 0.5))
x
tanh<-function(m){
  r<-(exp(2*m)-1)/(exp(2*m)+1)
  return(r)
}
sol<-tanh(x)
plot(x,sol,type="l")

#Pregunta N°2
ERP<-function(v1,v2){
  Xp<-c()
  Yp<-c()
  for(i in 1:length(v1)){
    x<-log10(v1[i])
    y<-log10(v2[i])
    Xp<-c(Xp,x)
    Yp<-c(Yp,y)
  }
  prod<-Xp*Yp
  Xp_cuadrado<-Xp^2
  m<-length(v1)
  B<-(((m*sum(prod))-(sum(Xp)*sum(Yp)))/((m*sum(Xp_cuadrado))-(sum(Xp))^2))
  A<-10^(mean(Yp)-B*mean(Xp))
  return(c(A,B))
}
x<-c(2.5,3,4,5,5.5,6,7)
y<-c(12.5,10,7,4.5,4,3,3.5)
ERP(x,y)

#Pregunta N°3
Areayperi<-function(b,a,h){
  area<- b*a/2
  p<- b+a+h
  return(c(area,p))
}
Areayperi(3,4,5)

#Pregunta N°4
Tc<-function(L,CN,S){
  solucion<-(0.0136*(L^0.8)*(((1000/CN)-9)^0.7))/S^0.5
  return(solucion)
}

#Pregunta N°5
CSSE<-function(v,r){
  m<-matrix(v,ncol = 3)
  ds<-det(m)
  for (n in 1:length(r)) {
    if(n==1){
      m<-matrix(v,ncol = 3)
      m[,n]<-r
      dx<-det(m)
    }else if(n==2){
      m<-matrix(v,ncol = 3)
      m[,n]<-r
      dy<-det(m)
    }else{
      m<-matrix(v,ncol = 3)
      m[,n]<-r
      dz<-det(m)
    }
  }
  x<-dx/ds
  y<-dy/ds
  z<-dz/ds
  r<-c(x,y,z)
  return(r)
}
xyz<-c(2,5,1,1,-4,-1,3,1,-4)
SE<-c(7,-19,4)
CSSE(xyz,SE)

