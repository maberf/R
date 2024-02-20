# 2. CAMADA DE DADOS (DATA LOADER)
#
# Carregamento dos pacotes previamente instalados
library(readxl)
library(dplyr)
library(readr)
library(cellranger)
library(lubridate)
library(tidyr)
#
# df <- read_excel("Database/owid-covid-data.xlsx", sheet = 1, range = "A1:BO99999")
# head(df)
# Código acima quebra para mais de 100.000 linhas!
# https://github.com/tidyverse/readxl/issues/614
# Work around é o pacote cellranger referenciando o quadro excel de outra forma
# https://readxl.tidyverse.org/reference/cell-specification.html
#
# Carregamento do df usando cellranger
df <- read_excel("Database/owid-covid-data.xlsx", sheet = 1, range = anchored("A1", dim = c(376690, 67)))
# head(df)
#
# Determinando o campo date no formato date
df$date <- ymd(df$date)
# glimpse(df$date)
#
# Filtrando o df para os paises desejados
df <- filter(df, location %in% c("Brazil","United States","Mexico","Germany","France","United Kingdom"))
# head(df)
#
# Selecionando apenas as variáveis desejadas
df <- select(df, location, date, total_cases, new_cases, total_deaths, new_deaths)
# Substituição dos registros NAs por zero.
df <- mutate_all(df, replace_na, 0)
# head(df)