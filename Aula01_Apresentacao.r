# Disciplina: Programação em R
# Aula 01 - A Linguagem R: uma introdução e seus fundamentos

# Diretório de trabalho
# Setar diretório
#Podemos fazer diretamente na barra-Session ou por linha de comando
setwd("C:/Users/adria/OneDrive/Documents/Arquivos_asus/Licenciatura/2024/Programacao_R/Aula1")
# Obter diretório
getwd()

# Incluir Comentários
# O caracter sustenido (#) é utilizado para fazer comentários
# teste1
#aula1

# Imprimir na tela
print('Estou iniciando meus estudos na linguagem R')
print(2)

# Instalar pacotes

install.packages('ggplot2')
install.packages("dplyr")


# Carregar o pacote
library(ggplot2)


# Ajuda sabendo o nome da função
help(mean)
?mean


# Outra opção de ajuda: pacote SOS
install.packages("sos")
library(sos)
findFn("fread")


# Ajuda para procurar em todo R (nome da função desconhecido)

help.search('ggplot')
??ggplot
RSiteSearch('ggplot')
example('mean')


# Listar objetos
x=1
ls()
objects()


# Remover objetos
rm(x)
x


# Limpar todo o ambiente


rm(list=ls())


#Limpar o console

cat("\014")
#########################################################################
# Operadores Básicos

# Soma
1+2
x=1+4
x
# Subtração
4-1

# Multiplicação
5 * 5

# Divisão
10/2

# Potência
3^2
3**2

# Módulo
20 %% 6

# Logaritmo

log(10)

#Exponencial
exp(2)

# Operadores Relacionais

# Atribuindo variáveis
a = 1
b = 5
c=a+b
c
# Operadores
a > 3
a < 3
a <= 3
a >= 3
a == 1
a != 3


# Operadores Lógicos

# And
(a==1) & (a==6)
(a==1) & (a>=1)
(a==1) & (a==7)

# Or
(a==1) | (a<0)
(a==0) | (a>=5)

# Not
a > 8
print(!a > 1)



# Operadores de atribuicao 
x=5
y=6
x<-1
print(x)
x<-y

x <- 5
x

x = 9
x

# Diferença entre <- (atribuição) e = 

vec1 = 1:4
vec1=c(1,2,3,4)
vec2 <- 1:4

class(vec1)
class(vec2)

typeof(vec1)
typeof(vec2)

mean(x = 1:5)
x   

mean(x <- 1:5)
x 
#########################################################################

# Criando Variáveis
var1 = 10
var1



# Definir o valor de uma variável a partir de outra variável
var2 =as.integer( var1)
var2
typeof(var2)
help("typeof")


# Variável como  uma lista de elementos
var3 = c("a","e","i","o","u")
var3
typeof(var3)


# Uma variável pode ser uma função
x=30
var4 = function(x) {x+1}
var4

#Chamando a função
var4(5)


# Podemos também mudar o modo do dado
var5 = as.character(var1)
var5



#########################################################################

# Tipo de Dados
# Numeric - Todos os números criados em R são do modo numeric e como decimais (double, float) por default

num1 <- 8
num1
class(num1)
typeof(num1)

num2 = 20.02
num2
typeof(num2)

#Criando um objeto como numérico
num3='8'
typeof(num3)
num3=as.numeric(num3)
num3
typeof(num3)

# Integer

is.integer(num2)
y = as.integer(num2)
y
class(y)
typeof(y)

#Outra forma de criar o número como inteiro
y=20L


# Character
char1 = 'A'
char1
typeof(char1)

char2 = "aula"
char2
typeof(char2)

char3 = c("Machine", "Learning")
char3
typeof(char3)


# Logic
x = 1; y = 3
z = x > y
z
class(z)

v1 = TRUE; v2 = FALSE
class(v1)
v1 & v2
v1 | v2
!v1

#Date
data1='2024-01-01'
class(data1)
typeof(data1)
data2=as.Date('2024-01-02')
typeof(data2)
class(data2)


#Criando uma sequencia de data

vsequencia=seq(from=as.Date("2000-01-01"), to=as.Date("2023-12-01"), by="month")
vsequencia

#########################################################################

# Tipo de Estrutura de Dados

# Vetor: possui 1 dimensão e 1 tipo de dado

vetor1 <- c(1:4)
vetor1
length(vetor1)
class(vetor1)


# No vetor a classe retornará o tipo de dado (atomic modes): logical, integer, real, complex, string (or character) e raw.Não vai retornar como vetor 
typeof(vetor1)
names(vetor1) = c("v1", "v2", "v3","v4")
vetor1

# Se misturamos tipos de dados, tudo vira character (coerção, o vetor só pode ter um tpo de dado e permanece a classe mais forte)
vetor2 <- c(1,2,3,4,"a")
vetor2
class(vetor2)
typeof(vetor2)

# Fator: vetor de variável categórica
# Internamente, o R armazena valores inteiros e faz um mapeamento para as strings (em ordem alfabética)
# e agrupa as estatísticas por níveis.

# Variáveis categóricas nomimal
vec1 <- c("Macho","Femea","Femea","Macho","Macho")
vec1
fac_vec1 <- factor(vec1)
fac_vec1
class(vec1)
class(fac_vec1)



# Variáveis categóricas ordinais
# Possuem uma ordem natural
grad <- c("Mestrado", "Doutorado", "Bacharelado", "Mestrado", "Mestrado")
grad
fac_grad <- factor(grad, order = TRUE, levels = c("Doutorado", "Mestrado", "Bacharelado"))
fac_grad
levels(fac_grad)

# Sumarizar os dados
summary(fac_grad)
summary(grad)




# Matriz: possui 2 dimensões e 1 tipo de dado

matriz1 <- matrix(1:10, nrow = 2)
matriz1
length(matriz1)
class(matriz1)
typeof(matriz1)
dim(matriz1)
nrow(matriz1)
ncol(matriz1)
rownames(matriz1)=c('n1','n2')
colnames(matriz1)=c('c1','c2','c3','c4','c5')
matriz1

# Array: possui 2 ou mais dimensões e 1 tipo de dado
# Toda matriz é um array, mas nem todo array é uma matriz
#Enquanto em uma matrix os elementos são organizados em duas dimensões (linhas e colunas), em um array os elementos podem ser organizados em um número arbitrário de dimensões.
array1 <- array(1:64, dim = c(4,4,4))
array1
length(array1)
class(array1)
typeof(array1)


# Data Frames: dados de diferentes tipos
# Maneira mais fácil de explicar data frames: é uma matriz com diferentes tipos de dados

View(iris)
length(iris)
class(iris)
typeof(iris)
df1 = data.frame(numero=c(1,2,3,4,5,6,7), string=c('a','b','c','d','e','f','g'))
df1
str(df1)
dim(df1)
head(df1)
tail(df1)
#Nomeando as linhas e colunas
rownames(df1)=c('n1','n2','n3','n4','n5','n6','n7')
colnames(df1)=c('vnumero','vstring')
df1

# Tiblle: é um data frame melhorado, mais performatico, amigável e com mais funcionalidades
install.packages("tibble")
library(tibble)

dat <- tibble(id = letters[1:25], x = 1:25, y = 1:25)
dat

# Listas: coleção de diferentes objetos (diferentes tipos de dados são possíveis)

lista1 <- list(a = matriz1, b = vetor1)
lista1
length(lista1)
class(lista1)
typeof(lista1)
str(lista1)
length(lista1)
names(lista1)=c('matriz','vetor')
lista1


# Tipo TS (Time Series):  é um tipo de estrutura de dados para amarmazenar dados de séries temporais
AirPassengers
class(AirPassengers)


  
#########################################################################

# Operações com Vetores


# Vetor de strings
vetor_car = c("Machine", "Learning")
vetor_car


# Vetor de números decimais (float)
vetor_num = c(1.90, 45.3, 300.5)
vetor_num


# Vetor de valores lógicos
vetor_log= c(TRUE, FALSE, FALSE, FALSE)
vetor_log


# Vetor de números inteiros
vetor_int  = c(1, 2, 3)
vetor_int


# Utilizando seq()
v1 = seq(1:5)
v1
is.vector(v1)


# Utilizando rep() primeiro coloca o que deve ser repetido e depois quantas vezes, o padrão é 1 se não colocar o número de vezes
v2 = rep(1:5,2)
v2 = rep(1:5)
v2
is.vector(v2)


# Indexação de vetores
a <- c(1,2,3,4,10)
a
a[1]
a[6]

b <- c("Data", "Science")
b
b[1]
b[2]
b[3]


numeros <- c(2, 5, 6, 78, 2, 233)
numeros

# Seleciona o segundo, quinto e primeiro valor do vetor

numeros[c(2, 5, 3)]

# Seleciona os primeiros três valores do vetor

numeros[1:3]


# Seleciona tudo, exceto o terceiro valor
numeros[-3]


# Combinação de vetores
v1 = c(2, 3, 5)
v2 = c("ab", "cd", "de")
c(v1, v2)


# Operações com vetores
x = c(1, 2, 3)
y = c(4, 5, 6)

x * 5
x + y
x - y
x * y
x / y


# Soma de vetores com quantidade diferentes de elementos
a1 = c(10, 20, 30)
a2 = c(1, 2, 3, 4, 5, 6, 7, 8, 9)
a1 + a2


# Vetor Nomeado
v = c("Rua", "Itapeva","474")
v
names(v) = c("Logradouro", "Nome da Rua", "Número")
v
v["Logradouro"]


#########################################################################

# Operações com Matrizes


# Criando Matrizes

# Número de Linhas
matrix (c(1,2,3,4,5,6,7,8), nr = 2)
matrix (c(1,2,3,4,5,6), nr = 4)
matrix (c(1,2,3,4,5,6), nr = 8)


# Número de Colunas
matrix (c( 1,2,3,4,5,6,7,8), nc = 2)



# Matrizes precisam ter um número de elementos que seja múltiplo do número de linhas
matrix (c(1,2,3,4,5), nc = 3)


# Criando matrizes a partir de vetores e preenchendo a partir das linhas
m1 = c(1:10)
matrix(data = m1, nrow = 5, ncol = 2, byrow = T)
matrix(data = m1, nrow = 5, ncol = 2)


# Indexação de matrizes
mat <- matrix(c(1,3,4,5), nr = 2)
mat
mat[1,2]
mat[2,2]
mat[2,4]
mat[,2]


# Matriz transposta
mt <- matrix (c(2,4,8,12 ), nr = 2, ncol = 2)
mt
t(mt)
U <- t(mt)
U


# Matriz inversa
solve(mt)


# Multiplicação de Matrizes
mat1 <- matrix(c(1,2,3,4), nr = 2)
mat1
mat2 <- matrix(c(2,4,6,8), nr = 2)
mat2
mat1 * mat2
mat1 / mat2
mat1 + mat2
mat1 - mat2


# Multiplição de matriz com Vetor
a = c(1:4)
a
b <- matrix(c(10,20,30,40), nr = 2)
a * b


# Nomeando a Matriz
mat3 <- matrix(c('America', 'África', 'Asia', 'Europa', 'Oceania','Antartida'), nr = 2)
mat3
dimnames(mat3) = (list( c("Linha1", "Linha2"), c("Coluna1", "Coluna2","Coluna3")))
mat3


# Nomeando linhas e colunas no momento de criação da matriz
matrix (c(1,2,3,4), nr = 2, nc = 2, dimnames = list(c("Linha 1", "Linha 2" ), c( "Coluna 1", " Coluna 2") ))


# Unindo matrizes
m4 <- matrix(c(1,2,3,4), nr = 2)
m4
m5 <- matrix(c(5,6,7,8), nr = 2)
m5
cbind(m4, m5)
rbind(m4, m5)


# Transformando uma matriz em um vetor
c(m4)

#########################################################################

# Operações com Listas
# Use list() para criar listas

# Lista de strings
lista_caracter1 = list('A', 'B', 'C')
lista_caracter1
lista_caracter2 = list(c("A", "A"), 'B', 'C')
lista_caracter2
lista_caracter3 = list(matrix(c("A", "A", "A", "A"), nr = 2), 'B', 'C')
lista_caracter3


# Lista de floats
lista_numerico = list(1.90, 45.3, 300.5)
lista_numerico


# Listas Compostas
lista_composta1 = list("A", 3, TRUE)
lista_composta1

lista1 <- list(1:5, c("a1", "a2", "a3"),c(TRUE,FALSE))
lista1


# Indexação de listas
lista1[1]
lista1[2]
lista1[[2]][1]
lista1[[2]][1] = "Teste"
lista1

# Para nomear os elementos - Listas Nomeadas
names(lista1) <- c("numericos", "caracteres", "logicos")
lista1

v_num <- 1:4
v_char <- c("A", "B", "C", "D")

lista2 <- list(Numeros = v_num, Letras = v_char)
lista2


# Criando listas e nomeando no momento da criacao
l2 <- list(elemento1 = 3:5, elemento2 = c(7.2,3.5))
l2


# Trabalhando com elementos específicos da lista
names(lista1) <- c("inteiros", "caracteres", "numéricos")
lista1

lista1$caracteres
length(lista1$inteiros)
lista1$inteiros


# Comprimento da lista
length(lista1)


# Seleção de um elemento específico da lista
lista1$caracteres[2]



# União de 2 listas
lista3 <- c(lista1, lista2)
lista3


# Transformando um vetor em lista
v = c(1:5)
v
l  = as.list(v)
l


# Unindo 2 elementos em uma lista
mat = matrix(1:4, nrow = 2)
mat
vet = c(1:9)
vet
lst = list(mat, vet)
lst

#########################################################################

# Operações com Dataframes


# Criando um dataframe vazio
df <- data.frame()
class(df)
df


# Criando vetores para depois criar um DF
pais = c("Portugal", "México", "Irlanda", "Egito", "Brasil")
nome = c("Bruno", "Tiago", "Amanda", "Bianca", "Marta")
altura = c(1.88, 1.76, 1.53, 1.69, 1.68)
nfilhos=c(0, 2, 1, 3, 0)


# Criando um dataframe de diversos vetores
df_teste = data.frame(pais, nome, altura,nfilhos)
df_teste

#Transformando um vetor em dataframe
vetor_teste=c(1,2,3,4,5)
df_testev=as.data.frame(vetor_teste)

# Inclusão de uma nova coluna no dataframe
signo = c("peixes", "escorpiao", "gemeos", "aries","peixes")
df_teste = cbind(df_teste, signo)



# Inclusão de uma nova linha no dataframe
linha_df = data.frame(pais="Argentina", nome="Maria", altura=1.65, signo="touro", nfilhos=2)
df_teste = rbind(df_teste, linha_df)
df_teste

# Informações sobre o dataframe
str(df_teste)
dim(df_teste)
length(df_teste)

#Operações com colunas em um dataframe
calculo1=df_teste$altura+df_teste$nfilhos
calculo1
typeof(calculo1)

#Inclusão de uma nova coluna no dataframe com o resultado de uma operação
df_teste$calculo1=calculo1

# Obter um vetor de um dataframe
df_teste$pais
df_teste$nome


# Indexação do dataframe
df_teste[1,1]
df_teste[3,2]

# Convertendo uma coluna em variável categórica. Isso criará um fator não-ordenado
df_teste
str(df_teste)
df_teste$signocat <- factor(df_teste$signo)
df_teste
str(df_teste)




# Filtro para um subset de dados que atendem a um critério
df_teste[df_teste$altura > 1.80,]
df_teste
df_teste[df_teste$altura > 1.70, c('nome', 'signo')]


#Criando mais um dataframe
cidade = c("Porto", "Cidade do Mexico", "Irlanda", "Cairo", "Sao Paulo", "Lisboa")
idade = c(30, 22 ,25,40,60,22)
nome = c("Bruno", "Tiago", "Amanda", "Bianca", "Marta", "Maria")


df_teste2 = data.frame(nome,cidade,idade)
df_teste2

# Combinando dataframes (se as colunas tiverem nomes diferentes o merge não funcionará como esperado)
dataset_final <- merge(df_teste, df_teste2)
dataset_final

