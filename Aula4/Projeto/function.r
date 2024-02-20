# 3. FUNÇÕES
#
library(lubridate)
#
# Cálculo do dia da semana
wek <- function(datelist) {
  # Converte o vetor de datas para o formato Date
  # Mais de uma pais, uma data para cada. Unique só deixa 1 data
  datesvector <- unique(as.Date(datelist))
  # Determina o dia da semana
  weekdaysvector <- as.double(wday(datesvector))
  # Montagem inicial do df de retorno - dfret
  dfret <- as_tibble(data.frame(date = datesvector, weekday = weekdaysvector, week = as.double(NA)))
  # Colocação das datas em ordem crescente
  dfret <- arrange(dfret, date)
  # Contador de semanas, conta todos os domingos e joga em ncont
  ncont = 0
  for (row in 1:nrow(dfret)) {
    if (dfret$weekday[row] == 1) {
      ncont <- ncont + 1
    }
    # Atribui o número da semana no campo week de cada registro de data do dfret
    dfret$week[row] <- ncont
  }
  #
  return(dfret)
}