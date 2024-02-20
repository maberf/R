# Disciplina: Programação em R
# Aula 04 - Criando um projeto completo no R

#Limpando o ambiente
rm(list = ls())
cat("\014")
setwd("/home/maber/R/Aula4")

# Estruturas de Controle


# If - verifica se uma condição é verdadeira. A condição é colocada e depois o que deve ser feito.
x = 5
if (x < 10)
{"Este número é menor que 10"}

# Colocando resultado do if em uma variavel
a= if (x < 10)
{"Este número é menor que 10"}


# If-Else - verifica se uma condição é verdadeira ou falsa
if (x < 7) {
  "Este número é menor que 7"
} else {
  "Este número não é menor que 7"
}

# If-Else (encadeando vários ifs)
ano = 2021
  if(ano == 2014){
  print("2014 longe da pandemia")
  }else if (ano == 2020) {
  print("2020 e o 1o ano da pandemia")
  } else if (ano > 2020) {
  print("Ainda nao sabemos se havera pandemia do COVID-19")
# o último else não precisa de if, pode ser omitido  
  } else {
  print("Ano sem COVID-19")
}


# Outro exemplo de If-Else aninhado/encadeado
x = 4

if (x < 5) {
  "Este número é menor que 5"
} else if(x == 7) {
  "Este é o número 7"
} else if(x == 6) {
  "Este é o número 6"
}else{
  "Este número não é menor que 5"
}

# Ifelse (outra forma de escrever) = excel
x = 5
ifelse (x < 6, "Correto!", NA)

x = 11
ifelse (x < 6, 'Correto!', ifelse(x == 10,"ok","ok2"))


# Repetição - repete algo uma quantidade de vezes
rep(1:5, 5)


# Repeat - repete algo até que uma condição seja satisfeita
x = 1
repeat {
  x = x + 2
  if (x > 99)
    break
  print(x)}


# Loop For - repete algo uma quantidade de vezes(outra forma)
for (i in 1:20) {print(i+3)}
for (q in rnorm(10)) {print(q)}


# Ignora alguns elementos dentro do loop
for(i in 1:22){
  if(i == 13 | i == 15)
    next
  print (i)}


# Interromper o loop
for(i in 1:22){
  if(i == 13)
    break
  print (i)}



# Loop que faz a soma dos números de 1 a 42.

for(numero in 1:42){
  if(numero == 1){
    soma = numero
  } else {
    soma = soma + numero
  }
}
print(soma)

# Crie um vetor com 5 nomes. Loop que imprime os elementos do vetor.

nomes = c("a", "b", "c", "d ", "e")

for(j in nomes){
  print(j)
}

# Crie um vetor com os numeros de 1 a 10. Loop que imprima o valor exponencial de cada numero.

vetor <- 1:10
for(numero in vetor){
  print(exp(numero))
}


# Loop While - repete algo até que uma condição seja satisfeita
x = 1
while(x < 4){
  x = x + 1
  print(x)
}


# Loop while que faz a soma dos numeros de 1 a 42.
number = 1
soma=0
while (number <= 42)
{
  print(number)
  soma = soma + number
  number = number + 1
}
soma
number

# O loop while não será executado, pois a condição é falsa
y = 6
while(y < 5){
  y = y+10
  print(y)
}


# Funções Built-in, já existem no R
abs(-43)
sum(c(1:5))
mean(c(1:5))
round(c(1.1:5.8))
seq(1:5)


# Função reversa
v1 <- c(1.5, 2.5, 8.4, 3.7, 6.3)
v2 <- rev(v1)
v2


# Funções dentro de funções

mean(c(abs(v1), abs(v2)))


# Criando funções

# Função que soma dois números. Toda função definimos primeiro os parâmetros e depois o que ela faz.
myfunc <- function(x) { x + x }
myfunc(2)
class(myfunc)

# Função que calcula a potência
myfunc2 <- function(a, b) {
  valor = a ^ b
  print(valor)
}
myfunc2(2, 3)

# Função Media notas

CalculaMedia <- function(P1, P2, TR, LT){
# Primeiro foi feita a validação dos dados
    if(is.na(P1)){
      P1 = 0}
    if(is.na(P2)){
      P2 = 0}
      
    if(is.na(TR)){
     TR = 0}
    if(is.na(LT)){
      LT = 0}
  media=(0.3*P1) + (0.4*P2) + (0.2*TR) + (0.1*LT)

return(media)

}
CalculaMedia(NA,NA,9,6)

# Função Raizes Quadraticas
RaizesQuadratica <- function(A, B, C){

  # Total de linhas nos vetores
  N = length(A)

  # ToDo: FAZER VALIDACAO DO TAMANHO A=B=C
  if(N != length(B)){
    stop("Erro: Vetores de tamanhos diferentes")
  }

  if(N != length(C)){
    stop("Erro: Vetores de tamanhos diferentes")
  }

  # print("Tamanho do vetor")
  print(N)

  # Variavel de retorno da funcao
  ret <- matrix(NA, ncol = 2, nrow = N)
  # Pegado os valores dos coeficientes
  for (linha in 1:N) {
    a <- A[linha]
    b <- B[linha]
    c <- C[linha]
    
    if(a == 0){
      print("Warning: 'a' tem que ser diferente de zero")
      next()
    }

    # Calcula o delta
    Delta = b^2 -4*a*c

    # print(Delta)

    # Avalia o delta e calcula as respectivas raizes
    if(Delta > 0){
      # Se Delta maior do que zero

      x1 = (-b + sqrt(Delta))/(2*a)
      x2 = (-b - sqrt(Delta))/(2*a)

      raiz_1 = min(x1, x2)
      raiz_2 = max(x1, x2)

    } else if (Delta == 0) {
      # Se Delta for igual zero

      raiz_1 = -b/(2*a)
      raiz_2 = NA

    } else if (Delta < 0) {
      # Se Delta for menor do que zero
      # NESTE CASO NAO TEMOS RAIZ REAL
      raiz_1 = NA
      raiz_2 = NA
    }

    # Coloco o resultado das contas na matriz de retorno
    ret[linha, 1] <- raiz_1
    ret[linha, 2] <- raiz_2


  } # FIM DO FOR (INTERACAO POR LINHA)


  return(ret)
}
RaizesQuadratica (1,5,6)
RaizesQuadratica (1,0,-4)

# Chamando uma função escrita previamente em um arquivo .R 
rm(list = ls())
setwd("/home/maber/R/Aula4")

source("RaizesQuadratica.r")
RaizesQuadratica (1,5,6)

# Chamando um script .R
source("Script_p1.R")

# Criando um projeto novo (pode ser feito pelo menu principal)
install.packages('ProjectTemplate')
library('ProjectTemplate')
# Template para criar um projeto: full e miminal (esqueleto com pastas já é criado)
create.project('Projetoteste_aula4')

#Diretório tem que ser especificado para carregar o projeto

setwd("C:/Users/adria/OneDrive/Documents/Arquivos_asus/Licenciatura/2024/Programacao_R/Aula4/Projetoteste1")

# Carregando o projeto todo de uma vez
load.project()

# Carregando somente as configurações do projeto
# Colocar TRUE em load_libraries para carregar os pacotes no arquivo config/global.dcf
load.project(translate.dcf("config/global.dcf"))
# Trazer as configurações do projeto
get.project()
  
# Não foi necessário carregar os pacotes, pois o projeto já carrega automaticamente
# library(ggplot2) # para teste
x=2:4
y=4:6
df2=data.frame(x,y)

ggplot(df2,aes(x=x, y=y)) + geom_line()
