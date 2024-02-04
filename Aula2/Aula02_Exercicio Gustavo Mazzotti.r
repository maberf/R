# Gustavo Mazzotti - gmazzotti@mztsolutions.com
# Maber Fernandes - maberf@gmail.com - maber.fernandes@fgv.edu.br
# Mariane Kiam - mariane.itocazu@gmail.com

#Limpando o ambiente e o console
rm(list = ls())

cat("\014")

#Setup do diretório
getwd()

setwd("D:\\OneDrive - MZTAD\\coursera\\FGV\\Programacao R\\Aula 2") #Acertar o diretório para o que contém os arquivos "DEUPROINDMISMEI.xls" e "FPCPITOTLZGDEU.csv"

dir()

library(readxl)
library(readr)
library(lubridate)
library(dplyr)

GER_PI <- read_excel("DEUPROINDMISMEI.xls", 
                     sheet=1, 
                     range = "A11:B741", 
                     col_types = c("date", "numeric")
                     ) #Utilize a biblioteca readxl para fazer a importação do da base de dados da Produção Industrial da Alemanha. Informe o range de dados (ex: “A11:B741”), bem como o tipo de dado de cada coluna observation date: date e DEUPROINDMISMEI: numeric). Chame a base de GER PI.
head(GER_PI)

colnames(GER_PI) = c("data", "prodInd") # Troque o nome das colunas da base GER PI para data e prodInd.
head(GER_PI)

GER_Price = read_csv("FPCPITOTLZGDEU.csv", 
                     col_types = list(
                       DATE = col_date(),
                       FPCPITOTLZGDEU = col_double()
                     )) #Utilize a biblioteca readr para fazer a importação do da base de dados da Inflação e preços do consumidor da Alemanha. Informe o tipo de dado de cada coluna DATE: date e FPCPI- TOTLZGDEU: double). Chame a base de GER Price.
head(GER_Price)

colnames(GER_Price) = c("data", "price") #Troque o nome das colunas da base GER Price para data e price.
head(GER_Price)

ano <- year(GER_PI$data) #Crie uma coluna com a informação do “ano” de cada registro (dica: para isso utilize a biblioteca lubridate).
GER_PI.Anual <- cbind(ano, GER_PI) #Crie um data frame com a informação de agrupamento
head(GER_PI.Anual)

GER_PI.Anual <- group_by(GER_PI.Anual, ano)
GER_PI.Anual <- summarise(GER_PI.Anual, ProdIndAnual = mean(prodInd)) #Agrupe os dados da base GER PI por ano, tirando a média da variável “prodInd” (dica: para isso utilize o summarise do pacote dplyr)
head(GER_PI.Anual) #Salve os resultados do agrupamento em um data frame com nome “GER PI.Anual”

Inprod <- log(GER_PI.Anual$ProdIndAnual) #Utilizando a base GER PI.Anual, crie uma nova variável que é o logaritmo neperiano da variável “ProdIndAnual” (chame a variável de “ln prod”).

Inprice <- log(GER_Price$price) #Utilizando a base GER Price, tente criar uma nova variável que é o logaritmo neperiano da variável “price”. É mostrado alguma mensagem? Caso afirmativo, por que a mensagem aparece?
#Aparece a mensagem de aviso "In log(GER_Price$price) : NaNs produzidos"
#Isso acontece pq a função f(x) = ln(x) só existe para x > 0

summary(GER_Price) #Utilizando a base GER Price, mostre as “Estatisticas descritivas” das colunas, utilizando a função summary. Existe valores negativos?
# Sim, existem valores negativos na coluna "price" pois o valor mínimo é -0.1294

GER_Price[GER_Price$price < 0, ] #Utilizando a base GER Price, filtre as linhas que tem valores de preço abaixo de zero.
# Valor price < 0 na data de 01/01/1986


