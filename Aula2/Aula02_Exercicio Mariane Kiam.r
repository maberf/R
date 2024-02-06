
# Exercício 2 - Manipulação de dados no R: da carga ao processo de transformação


# Grupo:
# Gustavo Mazzotti - gmazzotti@mztsolutions.com
# Maber Fernandes - maberf@gmail.com - maber.fernandes@fgv.edu.br
# Mariane Kiam - mariane.itocazu@gmail.com




#Limpando o ambiente e o console
rm(list = ls())

cat("\014")

#Setup do diretório
getwd()
setwd("C:/Users/maria/OneDrive/Área de Trabalho/Mariane/Master data Science/Nivelamento/Programação/aula 2/exercício 2")

dir()


# Carga de Dados

library(readxl)

GER_PI<- read_excel("DEUPROINDMISMEI.xls",
                    sheet = 1,
                    range = "A11:B741",
                    col_types = c("date", "numeric"))
head(GER_PI)

colnames (GER_PI) <- c ("data", "prodInd")
head(GER_PI)


library(readr)


GER_Price = read_csv("FPCPITOTLZGDEU.csv", 
                     col_types = list(
                       DATE = col_date(),
                       FPCPITOTLZGDEU = col_double()
                     ))

head(GER_Price)

colnames (GER_Price) <- c ("data", "price")

GER_Price

#Agrupamento de base


install.packages("lubridate")
library(lubridate)

ano <- year(GER_PI$data)
GER_PI_2 = cbind(ano, GER_PI)


library(dplyr)


GER_PI.anual <- GER_PI_2 %>%
  group_by(ano) %>% 
  summarise(PRODINd_anual = mean(prodInd))

head(GER_PI.anual)



#Transformação de dados

GER_PI.anual = mutate(GER_PI.anual, IN_PROD = log(PRODINd_anual))

head(GER_PI.anual)

GER_Price = mutate(GER_Price, IN_price = log(price))

# mensagem de erro : In argument: `IN_price = log(price)`.
 #Caused by warning in `log()`:
 #! NaNs produzidos
 # este erro se dá pois há números negativos

summary(GER_Price)

#data                price            IN_price      
#Min.   :1960-01-01   Min.   :-0.1294   Min.   :-1.3867  
#1st Qu.:1974-10-01   1st Qu.: 1.4652   1st Qu.: 0.3970  
#Median :1989-07-02   Median : 2.0707   Median : 0.7300  
#Mean   :1989-07-02   Mean   : 2.6084   Mean   : 0.7509  
#3rd Qu.:2004-04-01   3rd Qu.: 3.4709   3rd Qu.: 1.2503  
#Max.   :2019-01-01   Max.   : 7.0320   Max.   : 1.9505  
#                                       NA's   :1 

#há sim valores negativos na coluna de price (valor mínimo)

filter(GER_Price,  price < 0)

# A tibble: 1 × 3
#data        price IN_price
#<date>      <dbl>    <dbl>
#1 1986-01-01 -0.129      NaN
















               

