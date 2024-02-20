# 3. FUNÇÕES
#
library(lubridate)
#
# Cálculo do dia da semana
wek <- function(datelist) {
  # Converte o vetor de datas para o formato Date
  datas <- as.Date(datelist)
  # Determina o dia da semana
  dias_semana <- as.double(wday(datas))
  # Calcula o número da semana
  semanas <- week(datas)
  
  #
  dfd <- as_tibble(data.frame(date = datas, weekday = dias_semana, week = semanas))
  return(dfd)
}