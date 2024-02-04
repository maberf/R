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
# Carregamento de pacotes, foi previamente verificada a instalação deles
library(readxl)
library(readr)
library(lubridate)
library(dplyr)
#
# 1. DOWNLOAD DE ARQUIVOS DAS BASES DE DADOS
#
# Site do Federal Reserve Bank of St. Louis (https://fred.stlouisfed.org/)
# Download das series:
# Production of Total Industry in Germany (DEUPROINDMISMEI) em formato XLS.
# Inflation, consumer prices for Germany (FPCPITOTLZGDEU) em formato CSV.
#
# 2. CARGA DE DADOS
#
# Carregamento dos dados da base excel em um df tibble GER_PI
GER_PI <- read_excel("DEUPROINDMISMEI.xls", sheet = 1, range = "A11:B741")
head(GER_PI)
# Troca dos nomes das colunas da base GER_PI para data e prodInd
colnames(GER_PI) = c("data", "prodInd")
head(GER_PI)
# Carregamento dos dados da base csv em um df tibble GER_Price
GER_Price <- read_csv("FPCPITOTLZGDEU.csv",
                     col_types = list(
                       DATE = col_date(),
                       FPCPITOTLZGDEU = col_double()
                     ))
# Alteração dos nomes das colunas de GER_PI
colnames(GER_Price) <- c("data", "price")
head(GER_Price)
#
# 3. AGRUPAMENTO DE BASE
#
# Transformação da coluna com registros apenas por ano em GER_PI
GER_PI$data <- year(GER_PI$data)
head(GER_PI)
#Criando a Ger_PI_Anual a partir das médias anuais de GER_PI
GER_PI_Anual <- summarise(group_by(GER_PI, data), prodIndAnual = mean(prodInd))
head(GER_PI_Anual)
# Opcionalimente preferiu-se deixar o mesmo formato de datas nos dois dataframes
GER_Price$data <- year(GER_Price$data)
head(GER_Price)
#
# 4. TRANSFORMAÇÃO DE DADOS
#
# Criação da variável "ln Prod" em GER_PI_Anual
GER_PI_Anual <- mutate(GER_PI_Anual, lnprod = log(prodIndAnual))
head(GER_PI_Anual)
#
# Criação da variável "ln Price" em GER_Price
GER_PI_Price <- mutate(GER_Price, lnprice = log(price))
head(GER_PI_Price)
# print(n = 62, GER_PI_Price) # para ver todo o df se desejado
# É mostrado alguma mensagem? Caso afirmativo, por que a mensagem aparece?
# RESPOSTA:
# SIM, é informado que NaNs foram produzidos na operação do mutate.
# Por definição matemática, não existe logaritmo neperiano de número negativo.
# Se apresenta um valor negativo no registro do ano 1986, gera-se um NaN.
#
# Demonstração das estatísticas descritivas
summary(GER_PI_Price)
# Existe valores negativos?
# RESPOSTA: SIM, o valores mínimos das variáveis price e lnprice.
#
# Filtragem das linhas com valores negativos em GER_PI_Price
GER_PI_Price %>% filter(price < 0)
# Confirmou a resposta anterior, registro do ano 1986.