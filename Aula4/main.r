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
# Roda a função wek, acresce os campos em dfweek
dfweek <- wek(dfweek)
# print(n = 50, dfweek)
#
# Join para juntando df e dfweek com id por date
# Agora se tem um df completo com as colunas das semanas
# "many-to-many", mesma semanas para mais de uma data, pois há vários países
# inner_join para considerar todos os registros dos dfs
dff <- inner_join(df, dfweek, by = "date", relationship = "many-to-many") %>% filter(week != 6 & year!=2024)
print(n = 50, dff)
# agrupamento por semana ? verificar
# dfd <- summarise(group_by(dff, date), sum(total_cases))
# print(n = 50, dfd)
#
# 5. CAMADA DE USUÁRIO
#
# Gráfico 1
# Total de Casos
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
#
# Gráfico 2
# Novos Casos
png("Graficos/novoscasos.png", units = "in", res = 300, width = 10.4, height = 5.85)
plot <- ggplot(data = dff, aes(x = date, y = new_cases, color = location, group_by(location))) +
  geom_line() +
  scale_y_continuous("Milhões de Casos", labels = label_number(accuracy = 1, unit = "", scale = 1e-6)) +
  labs(title = "Semana vs Total de Casos",
       x = "Semana",
       y = "Total de Casos",
       subtitle = "owid-covid-data.xlsx",
       caption = "Fonte: https://github.com/owid/covid-19-data/tree/master/public/data")
plot
dev.off()