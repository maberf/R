# FGV Curso Masters - 1o SEMESTRE 2024
# Disciplina Programação em R
# Professora Adriana Bezerra Bessa
# Aluno MABER ATHAYDE FERNANDES
# Exercício 4 - Criação de um projeto Competo em R
#
# 3. FUNÇÕES
#
library(lubridate)
#
# Cálculo do dia da semana
wek <- function(datelist) {
   # Converte o vetor de datas para o formato Date
  datas <- as.Date(datelist)
  # Determina o dia da semana
  dias_semana <- weekdays(datas)
  # Calcula o número da semana
  semanas <- week(datas)
  # Cria o data.frame
  dfd <- as_tibble(data.frame(date = datas, weekday = dias_semana, week = semanas))
  return(dfd)
}