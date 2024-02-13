# FGV Curso Masters - 1o SEMESTRE 2024
# Disciplina Programação em R
# Professora Adriana Bezerra Bessa
# Aluno MABER ATHAYDE FERNANDES
# Exercício 4 - Criação de um projeto Competo em R
#
# Grupo:
# XXX
# MABER ATHAYDE FERNANDES
# XXX
#
# 1. CRIANDO UM PROJETO NO R
#
#Limpando o ambiente e o console
rm(list = ls())
cat("\014")
#
# Definida pasta raiz do projeto
# Setup do diretório
setwd("/home/maber/R/Aula4")
getwd()
#
# Criados dois diretorios, "Database" e "Graficos" na pasta raiz do projeto
#
# Baixado arquivo de dados owid-covid-data.xlsx na pasta Databse
# ReferrerUrl=https://github.com/owid/covid-19-data/tree/master/public/data
# HostUrl=https://covid-19.nyc3.digitaloceanspaces.com/public/owid-covid-data.xlsx
#
# 2. CAMADA DE DADOS (DATA LOADER)
#
# Carregamento dos pacotes previamente instalados
library(readxl)
library(readr)
library(cellranger)
library(lubridate)
library(tidyr)
#
# dl1 <- read_excel("Database/owid-covid-data.xlsx", sheet = 1, range = "A1:BO99999")
# head(dl1)
# Código acima quebra para mais de 100.000 linhas!
# https://github.com/tidyverse/readxl/issues/614
# Work around é o pacote cellranger referenciando o quadro excel de outra forma
# https://readxl.tidyverse.org/reference/cell-specification.html
#
# Carregamento do df usando cellranger
df <- read_excel("Database/owid-covid-data.xlsx", sheet = 1, range = anchored("A1", dim = c(376690, 67)))
head(df)
#
# Determinando o campo date no formato date
df$date <- ymd(df$date)
str(df$date)
#
# Filtrando o df para os paises desejados
df <- filter(df, location %in% c("Brazil","United States","Mexico","Germany","France","United Kingdom"))
head(df)
#
# Selecionando apenas as variáveis desejadas
df <- select(df, location, date, total_cases, new_cases)
head(df)
#
# 3. FUNÇÃO
#