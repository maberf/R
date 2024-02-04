# Disciplina: Programação em R
# Aula 02 - Manipulação de dados no R: da carga ao processo de transformação

#Limpando o ambiente e o console
rm(list = ls())

cat("\014")

#Setup do diretório
setwd("/home/maber/R/Aula2")
getwd()
#
# Carregando arquivo.txt
# Importando arquivo com read.table()


df1 <- read.table("alunos.txt")
df1
dim(df1)
# obs: o cabeçalho foi considerado como dado

df1 <- read.table("alunos.txt", 
                  header = TRUE, 
                  sep = ',')
df1
dim(df1)
# obs: o cabeçalho não foi considerado como dado
# nomeando as colunas
df1 <- read.table("alunos.txt", 
                  header = TRUE, 
                  sep = ',', 
                  col.names = c("var1", "var2", "var3"))
df1

#substitui os valores por NA
df1 <- read.table("alunos.txt", 
                  header = TRUE, 
                  sep = ',', 
                  col.names = c("var1", "var2", "var3"),
                  na.strings = c('Cristina', 'João')) 
df1

str(df1)
#especificando que as colunas texto serão criadas como strings
df1 <- read.table("alunos.txt", 
                  header = TRUE, 
                  sep = ',', 
                  col.names = c("var1", "var2", "var3"),
                  na.strings = c('Pedro', 'Maria'),
                  stringsAsFactors = TRUE)
df1

str(df1)


# Importando arquivo com read.csv() pacote utils- separação por vírgula e ponto como separador decimal
df2 <- read.csv("alunos.txt")
df2
dim(df2)

#Sepação por ponto e vírgula e vírgula como separador decimal
df3 <- read.csv2("alunos.csv")
df3
dim(df3)


# Gerando arquivo
write.table(df3, file = 'df3.txt')
dir()

#Lendo arquivo gerado
df3_df3 <- read.table("df3.txt")
View(df3_df3)
dim(df3_df3)

write.table(df3_df3, file = "df3_df3_v2.txt", sep = "|", col.names = NA)
list.files()

df3_df3_v2 <- read.table("df3_df3_v2.txt") # inserir o separador
View(df3_df3_v2)



# Carregando arquivo.csv usando o pacote readr
install.packages("readr")
library(readr)


# Carregando o arquivo

df_iris <- read_csv("iris.csv", 
                    col_types = list(
                      Sepal.Length = col_double(),
                      Sepal.Width = col_double(),
                      Petal.Length = col_double(),
                      Petal.Width = col_double(),
                      Species = col_factor(c("setosa", "versicolor", "virginica"))
                    ))
#No caso de data o tipo é col_date()
View(df_iris)
dim(df_iris)
str(df_iris)


# Usando o pacote utils 
df_iris2 <- read.csv("iris.csv")
View(df_iris2)
dim(df_iris2)
str(df_iris2)

df_iris2 <- read.csv("iris.csv", stringsAsFactors = TRUE)
dim(df_iris2)
str(df_iris2)


# Carregando planilha excel

# Instalando o pacote
install.packages("readxl")

# Pacote readxl
library(readxl)

# Lista as worksheet no arquivo Excel
excel_sheets("PopUrbana.xlsx")

# Lendo a planilha do Excel
read_excel("PopUrbana.xlsx")
View(read_excel("PopUrbana.xlsx"))
read_excel("PopUrbana.xlsx", sheet = "Period2") #  sheets são as abas
read_excel("PopUrbana.xlsx", sheet = 3)
read_excel("PopUrbana.xlsx", sheet = 4)  #não existe

# Importando uma worksheet para um dataframe
df <- read_excel("PopUrbana.xlsx", sheet = 3)
View(df)

# Importando todas as worksheets - o objeto criado é uma lista
df_todas <- lapply(excel_sheets("PopUrbana.xlsx"), read_excel, path = 'PopUrbana.xlsx')
class(df_todas)
View(df_todas)
df_todas[[2]]
# Juntando vários dataframes em um só
install.packages("plyr")
library(plyr)
dft=join_all(df_todas, by = "country")
View(dft)


# Importando um range de uma planilha
df <- read_excel("PopUrbana.xlsx", sheet = 3,range = "A1:H30")
dim(df)

# Importando um range de uma planilha e definindo o tipo de dado de cada coluna
df <- read_excel("PopUrbana.xlsx", sheet = 3,range = "A1:H30", col_types = c("text","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
df


# Manipulação de dados

# Instalando pacotes de manipulação
install.packages("readr")
install.packages("dplyr")
library(readr)
library(dplyr)

x <- c(2, 5, 6)

y <- c(8, 5, NA)

df <-tibble(x, y)
df

#Aplicando o mutate (cria novas variáveis em função das variáveis existentes)
df2=df %>% mutate(z = (x+y)/2)
df2

# Carregando o dataset: Notas trabalho, lista, prova1 e prova2

rm(list = ls())

# O objeto criado pelo read_csv -e um tibble
alunos_df <- read_csv("AlunosNotas.csv")
View(alunos_df)
head(alunos_df)
class(alunos_df)
str(alunos_df)


# Função glimpse() pode ser usada no lugar da função str()
glimpse(alunos_df)

# Limpeza, Transformação e Modelagem de Dados

# Aplicando mutate 
glimpse(mutate(alunos_df, mediaprova = (P1+P2)/2))

# A aplicação do mutate não alterou o objeto original

#Incluindo a coluna mediaprova

alunos_df2 = mutate(alunos_df, mediaprova = (P1+P2)/2)
head(alunos_df2)
glimpse(alunos_df2) # tem a mesma funcionalidade do str


# select()
alunos_notas <- select(alunos_df2, id, mediaprova)
head(alunos_notas)
class(alunos_notas)
select(alunos_df2, id)

#select com range de colunas (sem especificar o nome de cada coluna)
select(alunos_df2, id:LT)
select(alunos_df2, id:P1)


# filter()
#1 condição
alunos_df2[alunos_df2$mediaprova >= 7,]
filter(alunos_df2, mediaprova >= 7)

# 2 condições
filter(alunos_df2,  mediaprova >= 7 & TR >= 5)

# pode usar a vírgula para separar as condições
filter(alunos_df2,  mediaprova >= 7 , TR >= 5, LT >=3)

# Ou
filter(alunos_df2,  mediaprova >= 7 | TR >= 5)
# Ou com  in
filter(alunos_df2, id %in% c("C026318", "C378625"))

#select() e filter() juntos
select(filter(alunos_df2, mediaprova >= 7 & TR >= 5), id, mediaprova, TR)

# Operador pipe: %>% (código mais limpo e sem ter colocar o nome do dataframe várias vezes)
head(select(alunos_df, id, P1,P2))

alunos_df %>% 
  select(id, P1,P2) %>% 
  head

# arrange() - organizar
#o padrao é a ordem crecente

# código sem o pipe
head(arrange(alunos_df2, desc(mediaprova)))

#codigo com pipe
alunos_df2 %>% arrange(desc(mediaprova)) %>% head


alunos_df2 %>% 
  select(id, TR, mediaprova) %>%
  arrange(mediaprova, TR) %>% 
  head

alunos_df2 %>% 
  select(id, mediaprova) %>%
  arrange(desc(mediaprova)) %>% 
  filter(mediaprova >= 7) %>%
  head

# mutate() - criar novas variáveis em tempo de execução (não inclui definitivamente)
head(alunos_df2)
alunos_df2 %>% 
  mutate(mediafinal = TR*0.3+ LT*0.3 + mediaprova*0.4)%>%
  head

#incluir coluna mediafinal
alunos_df2 = mutate(alunos_df2,mediafinal = TR*0.3+ LT*0.3 + mediaprova*0.4)
head(alunos_df2)

# summarize()

alunos_df2 %>% 
  summarise(media_total= mean(mediafinal))
#não fez o cálculo porque tem NA


alunos_df2 %>% filter(!is.na(mediafinal)) %>%
  summarise(media_total= mean(mediafinal))

alunos_df2 %>% filter(!is.na(mediafinal))%>% # exclaamação é negação
  summarise(media_total= mean(mediafinal), 
            min_media = min(mediafinal), 
            max_media = max(mediafinal),
            total = n())

#Summarise é diferente de summary (outras medidas descritivas)
summary(alunos_df2)

#join()

alunos_info <- data.frame(read_excel("AlunosInfo.xlsx", sheet = "dados"))
alunos_df3 <- left_join(alunos_df2, alunos_info, by = "id")
head(alunos_df3)

# group_by()
#A função group_by() não altera a aparência dos dados do dataframe e apenas retorna o tbl agrupado (tabela tibble) onde podemos realizar o resumo
alunos_grouped=group_by(alunos_df3,Cidade)
alunos_resumo= summarise(alunos_grouped,avg_mediafinal = mean(mediafinal), 
            min_mediafinal = min(mediafinal), 
            max_mediafinal = max(mediafinal),
            total = n())
head(alunos_resumo)

#Código com pipe
alunos_df3 %>%group_by(Cidade) %>%
  summarise(avg_mediafinal = mean(mediafinal), 
            min_mediafinal = min(mediafinal), 
            max_mediafinal = max(mediafinal),
            total = n())%>%
            head

#Remodelagem de dados (mudar o shape)

# Instalando os pacotes
install.packages("tidyr")
library(tidyr)


df3 <- data.frame(
  aluno= c("a1", "a2", "a3", "a4", "a5", "a6"), 
  turma_turno = c("t1m", "t1m", "t1t", "t2m", "t2m", "t2t"),
  prova1= rnorm(n = 6, mean = 7, sd = 1), 
  prova2 = rnorm(n = 6, mean = 8, sd = 0.5)
)

print(df3)

# Reshape dos dados
#gather() - transforma as colunas em linhas
#gather(df, key="avaliação", value="nota", colunas)
df3 %>%gather(avaliação, nota, c(prova1, prova2))

#outra forma escrever o código usando o gather para selecionar as colunas:
df3 %>%gather(avaliação, nota,prova1:prova2)

#spread() - transforma as linhas em colunas
#spread(df, key="avaliação", value="nota")
df3 %>%gather(avaliação, nota, c(prova1, prova2)) %>%spread(avaliação, nota)

#separate()
#separar uma coluna em duas ou mais colunas
#sep = número: número de caracteres que serão separados
#sep = caracter: especifica o caracter que será usado para separar
df3 %>%
  gather(avaliação, nota, c(prova1, prova2)) %>%
  separate(col = turma_turno, into = c("turma", "turno"), sep = 2)

#unite()
df4 <- df3 %>%
  gather(avaliação, nota, c(prova1, prova2)) %>%
  separate(col = turma_turno, into = c("turma", "turno"), sep = 2)%>%
  unite(turma_turno2, turma,turno, sep = "-")
head(df3)

#pivot_longer() e pivot_wider() outras funções também para remodelar dados entre o formato longo e o formato largo.
# pivot_longer() equivalente a gather() e pivot_wider() equivalente a spread()

alunos_df4 <- select( alunos_df, id, TR, LT, P1, P2)
head(alunos_df4)
# pivot_longer() - colunas que serão transformadas em linhas
alunos_reduzida= pivot_longer(alunos_df,
                              cols = c("TR", "LT", "P1", "P2"), 
                              names_to = "Avaliacao", # nome da coluna que será criada
                              values_to = "Nota") # nome da coluna que será criada

head(alunos_reduzida)

# pivot_wider() - linhas que serão transformadas em colunas
alunosdf_original=pivot_wider(alunos_reduzida,
                              id_cols = id, # coluna que será mantida como identificador
                              names_from = Avaliacao, # coluna que será transformada em mais colunas
                              values_from = Nota) # coluna que será transformada em valores
head(alunosdf_original)

# Reshape2
install.packages("reshape2")
library(reshape2)

# Criando um dataframe
df = data.frame(nome = c("Zico", "Pele"), 
                chuteira = c(40, 42),
                idade = c(34,NA),
                peso = c(93, NA),
                altura = c(175, 178))
df

# "Derretendo" o dataframe - Função melt() 
df_wide = melt(df, id = c("nome", "chuteira"))
df_wide

# Removendo NA
#Percebam qwu as observações NA não foram criadas
df_wide = melt(df, id = c("nome", "chuteira"), na.rm = TRUE)
df_wide


# "Esticando" o dataframe
dcast(df_wide, formula = chuteira + nome ~ variable)
dcast(df_wide, formula = nome + chuteira  ~ variable)



# Mais um exemplo de aplicação do  reshape2

head(airquality)
dim(airquality)

# Função melt() - transforma as colunas em linhas
# Colocou todas as variáveis em uma única coluna
df_wide <- melt(airquality, value.name = "valores") 
class(df_wide)
df_wide



# Função dcast() - transforma linhas em colunas
#id.vars = variáveis que não serão modificadas

df_wide <- melt(airquality, id.vars= c("Month", "Day"))
View(df_wide)
df_long <- dcast(df_wide, Month + Day ~ variable)
View(df_long)
head(airquality)

# Substituindo valores

# Criando dataframe

pais = c("Portugal", "México", "Irlanda", "Egito", "Brasil")
nome = c("Bruno", "Tiago", "Amanda", "Bianca", "Marta")
altura = (c(1.88, 0, NA, 1.69, 1.68))
nfilhos=c(0, 2, 1, NA, 0)
df_teste = data.frame(pais, nome, altura,nfilhos)
df_teste



# Substituindo todos os valores zero por 1
df_teste2=replace(df_teste, df_teste == 0, 1)
df_teste2
# Substituindo todos valores NA por 1

#Nunca =='NA' para encontrar os valores faltantes. Use is.na().
df_teste2=replace(df_teste2, is.na(df_teste2) , 1)
df_teste2

# Substituindo valores NA por 1 somente de uma coluna específica
#Incluindo primeiro valores NA
df_teste2[2,4]=NA
df_teste2
df_teste2["nfilhos"][is.na(df_teste2["nfilhos"])] <- 0
print(df_teste2)


# Substituindo valores NA com mutate e replace
#Incluindo primeiro valores NA
library(dplyr)
df_teste2[2,4]=NA
df_teste2
df_teste2 <- mutate_all(df_teste2, ~replace(., is.na(.), "teste"))
print(df_teste2)


#Substituindo valores na com a media da coluna
#Incluindo primeiro valores NA
df_teste2$altura=c(1.88, 1.2, NA, 1.69, 1.68)
df_teste2
df_teste2$altura[is.na(df_teste2$altura)] <- mean(df_teste2$altura, na.rm = TRUE)
df_teste2
#Ajustando ´para 2 casas decimais
df_teste2$altura=round(df_teste2$altura,2)
df_teste2


# Mudar formato data

#https://www.geeksforgeeks.org/how-to-use-date-formats-in-r/
data1=as.Date("2019-01-01")
print(data1)
data2=format(data1,'%b-%Y')
print(data2)
data3=format(data1,format="%d/%m/%y")
print(data3)
data4=format(data1,format="%d/%b/%Y")
print(data4)
data5=format(data1,format="%d/%B/%y")
print(data5)
data6=format(data1,format="%D")
print(data6)
data7=format(data1,format="Dia %d do mês %B do ano %y")
print(data7)


# Trabalhando com datas - pacote lubridate
?lubridate
install.packages("lubridate")
library(lubridate)
# Lê a data no formato ano mês dia
ymd("20180604") 
# Lê a data no formato mês dia ano
mdy("06-04-2018") 
# Lê a data no formato dia mês ano
dmy("04/06/2018")

chegada <- ymd_hms("2016-06-04 12:00:00", tz = "Pacific/Auckland")
partida <- ymd_hms("2011-08-10 14:00:00", tz = "America/Sao_Paulo")


chegada
partida

second(chegada)
year(chegada)
second(chegada) <- 23
chegada
wday(chegada)
wday(chegada, label = TRUE)
class(chegada)

# Criando um intervalo de tempo
intervalo=interval(chegada, partida)
intervalo
class(intervalo)



# Subconjuntos - fatiamento de dados

## Vetores
x <- c("A", "E", "D", "B", "C")
x[]
x
x[1,3] # temos somente um vetor, forma de indexação errada

# Índices Positivos - Elementos em posições específicas
x[c(1, 3)]
x[c(1, 1)]
x[order(x)]


# Índices Negativos - Ignora elementos em posições específicas
x[-c(1, 3)]
x[-c(1, 4)]



## Matrizes
mat <- matrix(1:9, nrow = 3)
colnames(mat) <- c("A", "B", "C")
mat
mat[1:2, ]
mat[1:2, 2:3]
mat[1:2, c("A", "C")]


## Dataframes
df <- data.frame(x = 1:3, y = 3:1, z = letters[1:3])
df
df$x
df[df$x == 2, ]
df[c(1, 3), ]
df[c("x", "z")]



# Mais um exemplo de dataframe

numeros=c(1,2,3,4,5,6)
letras <- c("a", "b", "c", "d", "e", "f")
teste <- c("T1", "T2", "T3", "T4", "T5", "T6")
dados <- data.frame(numeros, letras,teste)
dados

#Selecionando elementos. Vale destacar que a seleção não altera o dataframe original
# Valor da linha 2 e coluna 1
dados[2, 1]

# Linhas 1 e 4 das colunas 2 e 3
dados[c(1,4), 2:3]

# Linha 2 com todas as colunas
dados[2,]

# Coluna 2 com todas as linhas
dados[, 2]
dados$letras
dados["letras"]

# Coluna 2 com todas as linhas, mantendo a estrutura de tabela e não transforma em vetor
dados[, 2, drop = FALSE]

# Seleciona tudo, exceto a segunda linha
dados[-2,]

# Seleciona a coluna chamada letras
dados[, "letras"]

# Seleciona colunas a partir de uma variável
vars=c("letras","teste")
dados[,vars]



# Removendo colunas de dataframes
df <- data.frame(x = 1:3, y = 3:1, z = letters[1:3])
df
df$z <- NULL
df

# Detalhe na remoção de colunas
df <- data.frame(x = 1:3, y = 3:1, z = letters[1:3])
df
df <- df[,-(2:3)]             # retorna como vetor]
df
df <- data.frame(x = 1:3, y = 3:1, z = letters[1:3])
df <- df[,-(2:3),drop=FALSE]  # continua como um data.frame
df


#Seleciona linhas do dataframe que sejam diferentes de NA em qualquer coluna
pais = c("Portugal", "México", "Irlanda", "Egito", "Brasil")
nome = c("Bruno", "Tiago", "Amanda", "Bianca", "Marta")
altura = (c(1.88, 0, NA, 1.69, 1.68))
nfilhos=c(0, 2, 1, NA, 0)
df_teste = data.frame(pais, nome, altura,nfilhos)
df_teste
df_teste3=df_teste[complete.cases(df_teste), ] # traz as linhas do df que nao tem NA. 
# na.omit faz a mesma coisa que complete.cases
df_teste3
# Seleciona linhas do dataframe que sejam diferentes de NA em coluna específica
df_teste$altura=c(1.88, 1.2, NA, 1.69, 1.68)
df_teste
df_teste3=df_teste[!is.na(df_teste$altura), ] # olha a negação ! na frente
df_teste3
