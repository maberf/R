# FGV Curso Masters - 1o SEMESTRE 2024
# Disciplina Programação em R
# Professora Adriana Bezerra Bessa
# Aluno MABER ATHAYDE FERNANDES
# Exercício 4 - Criação de um projeto Completo em R
#
# Grupo:
# XXX
# MABER ATHAYDE FERNANDES
# XXX
#
# 1. CRIANDO UM PROJETO NO R
#
# MAIN - 4. CAMADA DE LÓGICA
#
#Limpando o ambiente e o console
rm(list = ls())
cat("\014")
#
# Definida pasta raiz do projeto
# Setup do diretório
setwd("/home/maber/R/Aula4")
# getwd()
#
# Carregamento de pacotes
library(dplyr)
library(cellranger)
library(lubridate)
library(tidyr)
library(ggplot2)
library(scales)
#
# Criados dois diretorios, "Database" e "Graficos" na pasta raiz do projeto
#
# Baixado arquivo de dados owid-covid-data.xlsx na pasta Databse
# ReferrerUrl=https://github.com/owid/covid-19-data/tree/master/public/data
# HostUrl=https://covid-19.nyc3.digitaloceanspaces.com/public/owid-covid-data.xlsx
#
#
# 2. CAMADA DE DADOS (DATA LOADER) no script dataloader.r
#
# Carrega os dados lidos pelo dataloader em um df tibble
# Retorna umavariável de nome "df" com os dados lidos
source("dataloader.r")
head(df)
#
# Gerado um df apenas com a coluna de datas, excluindo datas duplicadas
dfweek <- unique(df$date)
# head(dfweek)
#
# 3. FUNÇÔES no script function.r
#
# Construção do df semanalizado - acrescenta colunas em dfweek
source("function.r")
# Adição da variável do dia da semana - weekday
dfweek <- wek(dfweek)
print(n = 50, dfweek)
#
# Join para juntando df e dfweek com id por date
# Agora se tem um df completo com as colunas das semanas
# relationship = "many-to-many" necessário para inibir mensagem do sistema - pipe tira última semana
dff <- inner_join(df, dfweek, by = "date", relationship = "many-to-many") %>% filter(week != 6 & year!=2024)
print(n = 50, dff)
# agrupamento por semana
dfd <- summarise(group_by(dff, date), sum(total_cases))
print(n = 50, dfd)
# 5. CAMADA DE USUÁRIO
#
# Criação dos gráficos!
#
# Tratamento do df para os gráficos
# head(dff)
# tail(dff)
#
# Gráfico 1
# investigar como fazer mesma com cruzamento de vairaveis pais x casos.
# investigar como por os nomes em cada linha.
#
png("Graficos/totalcasos.png", units = "in", res = 300, width = 10.4, height = 5.85)
plot <- ggplot(data = dff, aes(x = date, y = total_cases, color = location, group_by(location))) +
  geom_line() +
  scale_y_continuous("Milhões de Casos", labels = label_number(accuracy = 1, unit = "", scale = 1e-6)) +
  labs(title = "Semana vs Total de Casos",
       x = "Semana",
       y = "Total de Casos",
       subtitle = "owid-covid-data.xlsx",
       caption = "Fonte: https://github.com/owid/covid-19-data/tree/master/public/data")
plot
dev.off()