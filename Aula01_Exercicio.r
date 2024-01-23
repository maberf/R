# Exercicio da Aula 1

# Crie um data frame com 3 colunas
df1 <- data.frame()
df1 <- data.frame(
  coluna1 = as.integer(1:3),
  coluna2 = c(1.0, 2.0, 3.0),
  coluna3 = as.character(1:3)
)
print(df1)

print(typeof(df1$coluna1))
#typeof(df1$coluna2)
# typeof(df1$coluna3)

# Operações
# Soma da Coluna 1 com a Coluna 1
# somacol1 <- (df1$coluna1+df1$coluna1)
# typeof(somacol1)

# somacol2 <- (df1$coluna1+df1$coluna2)# 
# typeof(somacol2)

# somacol3 <- (df1$coluna2+df1$coluna3)
# typeof(somacol2)
# Crie um data frame com 3 colunas