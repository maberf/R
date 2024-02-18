#Limpando o Ambiente
rm(list = ls())
cat("\014")
setwd("/home/maber/R/Aula3")
#
# Importando as bibliotecas & Dados
library(ggplot2)
ggplot(data=iris)
ggplot(iris, aes(y = Sepal.Width, x = Sepal.Length,color=Species)) +
geom_point()+
labs(title = "Sepal Length vs Sepal Width",
     subtitle = "Iris Database",
     caption = "Fonte: Iris database (R-Studio)",
     x="Sepal Length",
     y="Sepal Width")