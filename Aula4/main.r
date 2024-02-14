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
# head(df)
#
# Gerado um df apenas com a coluna de datas
dfweek <- (data.frame(df$date))
dfweek <- as_tibble(rename(dfweek, date = df.date))
# head(dfweek)
#
# 3. FUNÇÔES no script function.r
#
# Construção do df semanalizado
source("function.r")
# Adição da variável do dia da semana - weekday
dfweek$weekday <- weekday(dfweek$date)
# print(n = 20, dfweek)
# Adição da variável semana do ano - wek
# Obs: Não pode usar week como função, pois dá conflito com o lubridate!
dfweek$week <- wek(dfweek$date)
# print(n = 20, dfweek)
#
# Join para juntando df e dfweek com id por date
# Agora se tem um df completo com as colunas das semanas
# relationship = "many-to-many" necessário para inibir mensagem do sistema
dff <- left_join(df, dfweek, by = "date", relationship = "many-to-many")
# print(n = 50, dff)
#
# Exclusão da última semana
# Uso de if else https://stackoverflow.com/questions/11865195/using-if-else-on-a-data-frame
# dff<- filter(dff, week > 0 & weekday < 7 )
# Count the number of observations per week
# week_counts <- dff %>%
#  group_by(week) %>%
#  summarise(observations = n())
# head(week_counts)
# Filter out incomplete weeks (those with less than 7 observations)
# complete_weeks <- week_counts %>%
#   filter(observations == 7) %>%
#  select(week)
# head(complete_weeks)
# Filter the original dataframe to keep only the complete weeks
# dff_filtered <- dff %>%
#  filter(week %in% complete_weeks$week)
 tail(dff)
# head(dff_filtered)
#
# 5. CAMADA DE USUÁRIO
#
# Criar os gráficos!