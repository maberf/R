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
# Converter o banco de dados “AirPassengers” para um data.frame.

#	O nome do banco convertido será “data”.
# Vamos nomear a coluna do banco “data” de “Passengers”.
#	Vamos criar uma nova coluna chamado “date” com as datas associadas.
# Vamos converter os dados da coluna “Passengers” para o tipo “numeric”.
