# FGV Curso Masters - 1o SEMESTRE 2024
# Disciplina Programação em R
# Professora Adriana Bezerra Bessa
# Aluno MABER ATHAYDE FERNANDES
#
# Exercicio da Aula 1
#
# 1. Tipos de Variáveis
# Crie um data frame com 3 colunasaonde:
#	coluna1: números inteiros de 1 a 3.
#	coluna2: números (float) de 1 a 3.
# coluna3: caracteres 1 a 3.
df1 <- data.frame()
df1 <- data.frame(
  coluna1 = as.integer(1:3),
  coluna2 = c(1.0, 2.0, 3.0),
  coluna3 = as.character(1:3)
)
df1
typeof(df1$coluna1)
typeof(df1$coluna2)
typeof(df1$coluna3)
#
# 2. Operações
# Soma da Coluna 1 com a Coluna 1. Qual resultado? (inteiro, float ou caractere)
somacol11 <- (df1$coluna1+df1$coluna1)
typeof(somacol11)
# Soma da Coluna 1 com a Coluna 2. Qual resultado? (inteiro, float ou caractere)
somacol12 <- (df1$coluna1+df1$coluna2)#
typeof(somacol12)
# Soma da Coluna 2 com a Coluna 3. Qual resultado? (inteiro, float ou caractere)
# Dá erro se somarmos diretamente, pois é soma de float com caractere!
# Necessário converter a coluna em numérico antes.
# Como coluna 2 é float, na soma integer e float, prevalece float (double)
somacol23 <- (df1$coluna2+as.integer(df1$coluna3))
typeof(somacol23)
#
# 3. Navegando no Dataframe
# Converter o banco de dados “AirPassengers” para um dataframe.
#	O nome do banco convertido será “data”.
# Antes verificar AirPassengers digitando o código.
# Notar que AirPassengres é uma tabela mensal de Jan/1949 até Dec/1960.
rm(list=ls()) # Primeiro limpa-se o ambiente
data <- data.frame(AirPassengers) #
# Vamos nomear a coluna do banco “data” de “Passengers”.
colnames(data)[1] = "Passengers"
#	Vamos criar uma nova coluna chamado “date” com as datas associadas.
data$date <- seq(from=as.Date("1949/01/01"), to=as.Date("1960/12/01"), by="month")
# Vamos converter os dados da coluna “Passengers” para o tipo “numeric”.
as.double(data$Passengers)
# Confirmação dos tratamentos feitos no dataframe
typeof(data$Passengers)
typeof(data$date)
data
#
# 4. Funções Básicas
# Utilizando o banco de dados iris, crie uma cópia chamado de data(base).
database <- iris
#No banco de dados “data(base)” crie 2 novas variáveis:
# variável 1 (ln Sepal.Length): logaritmo neperiano da variável “Sepal.Length”.
database$lnSepalLenght <- log(database$Sepal.Length)
# variável 2 (exp Sepal.Length): exponencial neperiano da variável “Sepal.Length”.
database$expSepalLength <- exp(database$Sepal.Length)
database
#
# FIM