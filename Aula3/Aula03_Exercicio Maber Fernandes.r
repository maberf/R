# FGV Curso Masters - 1o SEMESTRE 2024
# Disciplina Programação em R
# Professora Adriana Bezerra Bessa
# Aluno MABER ATHAYDE FERNANDES
# Exercício 3 - Construção de gráficos com a linguagem R
#
# Grupo:
# Gustavo Mazzotti - gmazzotti@mztsolutions.com
# Maber Fernandes - maberf@gmail.com - maber.fernandes@fgv.edu.br
# Mariane Kiam - mariane.itocazu@gmail.com
#
#
#Limpando o ambiente e o console
rm(list = ls())
cat("\014")
#
#Setup do diretório
setwd("/home/maber/R/Aula3")
getwd()
#
# Carregamento de pacotes, foi previamente verificada a instalação deles
# library(readxl)
library(readr)
# library(lubridate)
# library(dplyr)
library(ggplot2)
#
# Carregamento da base de dados iris
iris <- read_csv("iris.csv",
                 col_types = list(
                   Sepal.Length = col_double(),
                   Sepal.Width = col_double(),
                   Petal.Length = col_double(),
                   Petal.Width = col_double(),
                   Species = col_character()
                 ))
head(iris)
#
# Criação do gráfico de dispersão
