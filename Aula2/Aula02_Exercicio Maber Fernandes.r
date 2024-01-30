# FGV Curso Masters - 1o SEMESTRE 2024
# Disciplina Programação em R
# Professora Adriana Bezerra Bessa
# Aluno MABER ATHAYDE FERNANDES
# Exercício 2 - Manipulação de dados no R: da carga ao processo de transformação
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
setwd("/home/maber/R/Aula2")
getwd()
#
# Carregamento de bibliotecas
library(readxl)
library(readr)
#
GER_PI <- read_excel("DEUPROINDMISMEI.xls", sheet=1, range = "A11:B741")
head(GER_PI)

colnames(GER_PI) = c("data", "prodInd") # Troque o nome das colunas da base GER PI para data e prodInd.
head(GER_PI)

GER_Price = read_csv("FPCPITOTLZGDEU.csv", 
                     col_types = list(
                       DATE = col_date(),
                       FPCPITOTLZGDEU = col_double()
                     ))
head(GER_Price)
colnames(GER_PI) = c("data", "price")
