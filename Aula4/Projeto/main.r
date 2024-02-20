# FGV Curso Masters - 1o SEMESTRE 2024
# Disciplina Programação em R
# Professora Adriana Bezerra Bessa
# Aluno MABER ATHAYDE FERNANDES
# Exercício 4 - Criação de um projeto Completo em R
#
# Grupo: Sala 2
#
# BEATRIZ SANTOS
# EDUARDO KOIKE
# FELIPE GENUINO DA SILVA
# GABRIEL MALTEZ DA SILVA
# MABER ATHAYDE FERNANDES
# PEDRO FEITOSA DA SILVA NETO
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
setwd("/home/maber/R/Aula4/Projeto")
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
#head(df)
#
# 3. FUNÇÔES no script function.r
#
# Construção do df semanalizado - acrescenta colunas em dfweek
source("function.r")
# Roda a função wek, acresce os campos em dfweek, um df semanalizado - dfweek
dfweek <- wek(df$date)
#head(dfweek)
#
# Join para juntando df e dfweek com id por date
# Agora se tem um df completo com as colunas das semanas
# "many-to-many", mesma semanas para mais de uma data, pois há vários países
# inner_join para considerar todos os registros dos dfs
dff <- inner_join(df, dfweek, by = "date", relationship = "many-to-many")
head(dff)
#
# 5. CAMADA DE USUÁRIO
#
# Gráfico 1
# Total de Casos
png("Graficos/totalmortes.png", units = "in", res = 300, width = 10.4, height = 5.85)
plot <- ggplot(data = dff, aes(x = week, y = total_deaths, color = location, group_by(location))) +
  geom_line() +
  scale_y_continuous("Milhares de Mortes", labels = label_number(accuracy = 1, unit = "", scale = 1e-3)) +
  labs(title = "Semana vs Total de Mortes",
       x = "Semana",
       y = "Total de Mortes",
       subtitle = "owid-covid-data.xlsx",
       caption = "Fonte: https://github.com/owid/covid-19-data/tree/master/public/data")
plot
dev.off()
#
# Gráfico 2
# Novos Casos
png("Graficos/novasmortes.png", units = "in", res = 300, width = 10.4, height = 5.85)
plot <- ggplot(data = dff, aes(x = week, y = new_deaths, color = location, group_by(location))) +
  geom_line() +
  scale_y_continuous("Milhares de Mortes", labels = label_number(accuracy = 1, unit = "", scale = 1e-3)) +
  labs(title = "Semana vs Novas Mortes",
       x = "Semana",
       y = "Novas Mortes",
       subtitle = "owid-covid-data.xlsx",
       caption = "Fonte: https://github.com/owid/covid-19-data/tree/master/public/data")
plot
dev.off()