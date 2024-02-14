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
weekday <- function(x) {
    return(wday(x))
}
#
# Cálculo da contagem das semanas do ano
wek <- function(x) {
    return(week(x))
}