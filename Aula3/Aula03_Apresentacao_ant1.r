#
#Limpando o ambiente e o console
rm(list = ls())
cat("\014")
#
#Setup do diretório
setwd("/home/maber/R/Aula3")
getwd()
#

# Disciplina: Programação em R
# Aula 03 - A construção de gráficos com a linguagem R



# Demo
demo("graphics")


# Plot 1
x = 4:12
y = 2:10
plot(x,y)
?plot

comprimento <- c(145, 167, 176, 123, 150)
largura <- c(51, 63, 64, 40, 55)

plot(comprimento, largura)


# Plotando um Dataframe
# preview da cor no código habilitar em code>diysplay>syntax>enable preview color

?lynx
plot(lynx)
plot(lynx, ylab = "Plots com Dataframes", xlab = "")
plot(lynx, ylab = "Plots com Dataframes", xlab = "Observações")
plot(lynx, main = "Plots com Dataframes", col = 'red')
plot(lynx, main = "Plots com Dataframes", col = 'red', col.main = 52, cex.main = 1.5)#cex.main = tamannho da fonte do titulo



# Parâmetros do plot

# col - cor do plot
# lty - tipo de linha
# lwd - largura de linha
# pch - símbolo no plot
# xlab - label do eixo x
# ylab - label do eixo y
# las - como os labels dos eixos são orientados (axis (padrão, las = 0), horizontal (las = 1), perpendicular (las = 2), vertical (las = 3).
# bg - background color
# mfrow - número de plots por linha
# mfcool - número de plots por coluna

# Funções Básicas de Plot

# plot() - scatterplots
# lines() -  adiciona linhas ao gráfico
# points() - adiciona pontos ao gráfico
# text() - adiciona label ao gráfico
# title() - adiciona título ao gráfico

# Ver Parâmetros dos Gráficos
?par
par()
par('pch')
par('lty')

x = 2:4
plot(x, pch = "*")

# Função par: permite configurar formato, tamanho, subdivisões, margens, etc
par(mfrow = c(2,2), col.axis = "green")

plot(1:8, las = 0, xlab = "xlab", ylab = "ylab", main = "LAS = 0")
plot(1:8, las = 1, xlab = "xlab", ylab = "ylab", main = "LAS = 1")
plot(1:8, las = 2, xlab = "xlab", ylab = "ylab", main = "LAS = 2")
plot(1:8, las = 3, xlab = "xlab", ylab = "ylab", main = "LAS = 3")
legend("topright", pch = 1, col = c("blue", "green"), legend = c("Var1","Var2"))

# Voltando para o padrão de somente um gráfico

par(mfrow = c(1,1))

# Cores disponíveis
colors()


# Salvando os gráficos

# png
png("Grafico01.png", width = 500, height = 500, res = 72)

plot(iris$Sepal.Length, iris$Petal.Length,
     col = iris$Species,
     main = "Gráfico gerado a partir do Iris")

dev.off()


# pdf
pdf("Grafico02.pdf")

plot(iris$Sepal.Length, iris$Petal.Length,
     col = iris$Species,
     main = "Gráfico gerado a partir do Iris")

dev.off()






# Plots a partir de carga de arquivo
par(mfrow = c(1,1), col.axis = "black")
df <- read.csv('pibpercap.csv', stringsAsFactors = F)
df_1982 <- subset(df, ano == 1982)
View(df_1982)
plot(expectativa ~ pibpercap, data = df_1982)
# Aplicando log no eixo x
plot(expectativa ~ pibpercap, data = df_1982, log='x')
View(df)

# Nomes para as colunas
mycol <- c(Asia = "tomato", Europe = "chocolate4", Africa = "dodgerblue2",
           Americas = "darkgoldenrod1", Oceania = "green4")


plot(expectativa ~ pibpercap, data = df_1982, log = "x", col = mycol[continente])


# Tipos de gráficos

# Gráfico de Dispersão


# Define os dados

x = c(1:10)
y = c(4:13)
z = c(5:14)
t = c(2:11)


plot(x, y, col = 123, pch = 10, main = "Multi Scatterplot",
     col.main = "red", cex.main = 1.5, xlab = "Variável Independente",
     ylab = "Variável Dependente")


# Adiciona outros dados
points(z, t, col = "blue", pch = 4)

# Adiciona outros dados
points(y, t, col = 777, pch = 9)

# Inclui legenda
legend(1,10, legend = c("Nível 1", "Nível 2", "Nível 3"),
       col = c(123, "blue", 777), pch = c(10,4,9),
       cex = 0.65, bty = "n")# bty - tipo de borda da legenda


# Boxplots



?boxplot


# Carregando os dados

sleep=read.table("sleep.txt")

# Construção do boxplot
#Considerando a separação por grupo
sleep_boxplot = boxplot(data = sleep, extra ~ group,
                        main = "Duração do Sono",
                        col.main = "red", ylab = "Horas", xlab = "Droga")

# Cálculo da média
medias = by(sleep$extra, sleep$group, mean)


# Adiciona a média ao gráfico
points(medias, col = "red")


# Boxplot horizontal
horizontalboxplot = boxplot(data = sleep, extra ~ group,
                            ylab = "", xlab = "", horizontal = T)

horizontalboxplot = boxplot(data = sleep, extra ~ group,
                            ylab = "", xlab = "", horizontal = T,
                            col = c("blue", "red") )



# Histograma



# Dados
?cars
View(cars)
dados = cars$speed

# Construindo um histograma
?hist
hist(dados)


hist(dados, breaks = 10, main = "Histograma das Velocidades")
hist(dados, labels = T, breaks = c(0,5,10,20,30), main = "Histograma das Velocidades")
hist(dados, labels = T, breaks = 10, main = "Histograma das Velocidades")
hist(dados, labels = T, ylim = c(0,10), breaks = 10, main = "Histograma das Velocidades")


# Atribuindo o gráfico a um objeto
grafico <- hist(dados, breaks = 10, main = "Histograma das Velocidades")

#Gráfico de Barras

?barplot

# Preparando os dados - número de casamentos em uma igreja de SP
dados <- matrix(c(652,1537,598,242,36,46,38,21,218,327,106,67), nrow = 3, byrow = T)
dados

# Nomeando linhas e colunas na matriz
colnames(dados) <- c("0","1-150","151-300",">300")
rownames(dados) <- c("Jovem","Adulto","Idoso")
dados

# Barplot
barplot(dados)
barplot(dados, beside = T)

# Gráfico de linhas
#type -  tipo de gráfico que será construído. Vários valores são aceitos, os principais são “p” (pontos), “l” (linhas) e “b” (gpontos e linhas)
plot(AirPassengers, type = "l", col = "red", lwd = 2, lty = 2, xlab = "Data", ylab = "Quantidade de Passageiros", main = "Evolução da Quantidade de Passageiros")

# lwd:largura da linha
# Gráfico de Pizza




?pie

# Criando as fatias
fatias = c(40, 20, 40)

# Nomeando os labels
paises = c("Brasil", "Argentina", "Chile")

# Unindo paises e fatias em um vetor
paises = paste(paises, fatias)

# Incluindo mais detalhes no label
paises = paste(paises, "%", sep = "")


# Construindo um gráfico
pie(fatias, labels = paises,
    col = c("darksalmon", "gainsboro", "lemonchiffon4"),
    main ="Distribuição de Vendas")


# Gráfico de Pizza em um dataframe
?iris
#attach: permite utilizar as colunas sem especificar o nome do dataset
attach(iris)
Values = table(Species) #função table faz uma tabela de frequência por categoria
labels = paste(names(Values))
pie(Values, labels = labels, main = "Distribuição de Espécies")

##Ggplot2

# Com o pacote `ggplot()` o gráfico é construído a partir a partir de um conjunto de camandas, como vimos na gramática dos dados
#ggplot(data= dados) +  # Basics: conjuntos dados que serão utilizados
#ggplot(aesthetics()) + # Aes: mapeamento de variáveis para atributos visuais, isto é, indicação das variáveis serão mapeadas no gráfico, seja um conjunto de variáveis ou apenas uma. Além da especificaçãoeixos x e y,
# é possível também tratar de cores, formas e textos:
#geometries(statistics()) + Geoms: tipo de gráfico
#facets() + # Facets: subdivisão dos dados em subgráficos
#themes() + # Themes: ajustes do layout visual do gráfico
#coord() + # Coord: ajustes do sistema de coordenadas, que o padrão é o sistema cartesiano, mas pode ser o sistema polar
#statistcs() + # Statistics: ajustes estatísticos, sendo possível incluir resumos estatísticos como a média, linhas de tendência, etc.Sem ter que fazer isto previamente.

# Outros ajustes que não são camadas, porém são importantes para a construção do gráfico
#position() + # Position: ajustes de posição dos elementos do gráfico
#scale() + # Scale: ajustes de escala dos eixos
#labs() + # Labs: adiciona legendas, títulos e subtítulos
# As camadas obrigatórias de qualquer gráfico são: dados, mapeamostos estéticos e objetos geométricos
#dados %>%
#ggplot(aesthetic) +
#geometries()
# Aplicando somente a primeira camada de dados no gpplot, vemos a construção de um painel em branco
# Gapminder é um subconjuntde dados do site (http://gapminder.org). Para 142 países, o pacote oferece valores da expectativa de vida, pib per capita e população a cada 5 anos de 1952-2007.


# Instalando e carregando o pacote
install.packages("ggplot2")
library(ggplot2)

# Adicionando a primeira camada, a de dados
install.packages("gapminder")
library (gapminder)
View(gapminder)
ggplot(data=gapminder)


# Adicionando a camadas aesthetics
# O gráfico passou a apresentar as variáveis nos eixos x e y, porém mais nada foi adicionado
ggplot(data=gapminder, aes(x = gdpPercap, y = lifeExp))
# Escreva o código acima sem o pipe


# Adicionando a camada de geometria
ggplot(data=gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point()

# Algumas variações
# 1) Adicionando uma cor
ggplot(data=gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(color = "blue")

# 2) Adicionando uma cor pela variável continente
# Perceba que neste caso a cor é incluída na camada aesthetics e não é fixa, varia conforme a variável especificada
ggplot(data=gapminder, aes(x = gdpPercap, y = lifeExp, color=continent)) +
  geom_point()

# Colocando color como um parâmetro da camada geom_point só vai ficar nesta camada da geometria

ggplot(data=gapminder, aes(x = gdpPercap, y = lifeExp))  +
  geom_point(aes(color = continent), alpha = 0.1) +
  geom_smooth()

# 3) Adicionando o parêmetro alpha: transparência (ver nível de concentração de pontos)
ggplot(data=gapminder, aes(x = gdpPercap, y = lifeExp, color=continent)) +
  geom_point(alpha = 0.1,color = "blue")

# 4) Adicionando um tamanho
ggplot(data=gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(size = 2)

# 5) Adicionando uma forma
#http://www.sthda.com/english/wiki/ggplot2-point-shapes (formas disponíveis)
ggplot(data=gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(shape = 3)

# 6) Adicionando uma cor, um tamanho e uma forma e um título e  títulos nos eixos
ggplot(data=gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(color = "blue", size = 2, shape = 3) +
  labs(title = "Expectativa de vida x PIB per capita",
       x = "PIB per capita",
       y = "Expectativa de vida")

# 7)Incluindo uma tendência
ggplot(data=gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(alpha=0.2,color = "black", size = 2, shape = 3) +
  labs(title = "Expectativa de vida x PIB per capita",
       x = "PIB per capita",
       y = "Expectativa de vida") +
  geom_smooth()
# Demora mais um pouco para rodar


# Outro exemplo de Gráfico de dispersão com as seguintes caracteristicas:
# 1) variavel "class" no eixo x
# 2) variavel "drv" no eixo y
# 3) utiliza o banco mpg
?mpg
View(mpg)
ggplot(data=mpg) +
  geom_point(mapping = aes(x=class, y = drv))


# Outra forma de escrever
ggplot(data=mpg, aes(x=class, y = drv)) +
  geom_point()

# Gráfico de dispersão com as seguintes caracteristicas
# 1) variavel "displ" no eixo x
# 2) variavel "hwy" no eixo y
# 3) utiliza o banco mpg
# 4) Colorindo pela variavel "class"
ggplot(data=mpg) +
  geom_point(mapping = aes(x=displ, y=hwy, colour=class))

# Gráfico de dispersão com as seguintes caracteristicas:
# 1) variavel "displ" no eixo x
# 2) variavel "hwy" no eixo y
# 3) utiliza o banco mpg
# 4) Colorindo de azul com transparencia de 30%
ggplot(data=mpg) +
  geom_point(mapping = aes(x=displ, y=hwy),
             colour="blue",
             alpha = 0.3)


# Gráfico de dispersão com as seguintes caracteristicas
# 1) variavel "displ" no eixo x
# 2) variavel "hwy" no eixo y
# 3) utiliza o banco mpg
# 4) Dividindo por facetas de acordo com a variavel "class"
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap( ~ class, nrow = 3)

# Gráfico de linhas com as seguintes caracteristicas
# 1) variavel "date" no eixo x
# 2) variavel "uempmed" no eixo y
# 3) utiliza o banco economics
ggplot(data = economics) +
  geom_line(mapping = aes(x = date, y = uempmed))

# Mudnado o tipo de linha:
# linetype:“blank”, “solid”, “dashed”, “dotted”, “dotdash”, “longdash”,
ggplot(data = economics) +
  geom_line(mapping = aes(x = date, y = uempmed), linetype = "dotted")

# Gráfico de barras com as seguintes caracteristicas
# 1) variavel "class" no eixo x
# 2) no eixo y sera a frequencia absoluta da variavel
# 3) utiliza o banco mpg
# 4) Colorindo com contorno azul e preenchimento branco
ggplot(data=mpg) +
  geom_bar(mapping = aes(x=class),color="blue",fill="white")


# Histograma com as seguintes caracteristicas
# 1) variavel "hwy" no eixo x
# 2) No eixo y sera mostrado a densidade
# 3) utiliza o banco mpg
ggplot(data=mpg) +
  geom_histogram(mapping = aes(x=hwy, y = ..density..))



# Outro exemplo de Histograma
ggplot(data = diamonds) +
  geom_histogram(mapping = aes(x = carat))

# Boxplot com as seguintes caracteristicas
# 1) variavel "class" no eixo x
# 2) variavel "hwy" no eixo x
# 3) utiliza o banco mpg
ggplot(data=mpg) +
  geom_boxplot(mapping = aes(x=class, y=hwy))




# Gráfico com duas camadas
#     Ambas as camadas utilizam o banco mpg
# CAMADA 1 (Grafico de linha)
#     1) variavel "displ" no eixo x
#     2) variavel "hwy" no eixo x
# CAMADA 2 (Grafico de pontos)
#     1) variavel "displ" no eixo x
#     2) variavel "hwy" no eixo x
#     2) Colorido por "class"
#
# O comando labs() informa os titulos, subtitulos e nome dos eixos, etc
ggplot(data=mpg) +
  geom_line(mapping = aes(x=displ, y=hwy)) +
  geom_point(mapping = aes(x=displ, y=hwy, colour=class)) +
  labs(title = "Titulo do meu grafico",
       subtitle = "Subtitulo do Grafico",
       caption = "Fonte: banco de dados mpg",
       x="NOME DO EIXO X",
       y=NULL)

# Outro exemplo de gráfico com duas camadas

ggplot(data = economics) +
  geom_line(mapping = aes(x=date, y=uempmed )) +
  geom_point(mapping = aes(x=date, y=uempmed, colour=unemploy), alpha=0.3) +
  labs(title = "Titulo do meu grafico",
       subtitle = "Subtitulo do Grafico",
       caption = "Fonte: banco de dados mpg",
       x="NOME DO EIXO X",
       y=NULL)

# Gráfico de correlação
install.packages("ggcorrplot")
library(ggcorrplot)
# Matriz de correlação
data(mtcars)
corr <- round(cor(mtcars), 1)
# Gráfico de correlação
ggcorrplot(corr,
           hc.order = TRUE,
           type = "upper",
           lab = TRUE,
           lab_size = 3,
           show.diag = TRUE,
           method="circle",
           colors = c("tomato2", "white", "springgreen3"),
           title="Correlogram of mtcars",
           ggtheme=theme_bw)

# Gráfico com eixo secundário

ggplot(data = economics) +
  geom_line(aes(x=date, y=pce, colour= "PIB")) +
  geom_line(aes(x=date, y=uempmed, colour="Desemprego")) +
  labs(title = "Pib e desemprego")

ggplot(economics) +
  geom_line(aes(x=date, y=pce, colour= "PIB")) +
  geom_line(aes(x=date, y=uempmed*1000, colour="Desemprego")) +
  labs(title = "Pib e desemprego")

ggplot(economics) +#
  geom_line(aes(x=date, y=pce, colour= "PIB")) +
  geom_line(aes(x=date, y=uempmed*1000, colour="Desemprego")) +
  scale_y_continuous(sec.axis = sec_axis(~ . / 1000, name = "Desemprego") ) +# eixo secundário
  labs(title = "Pib e desemprego") + theme(legend.position="bottom")

# Incluindo um tema
#https://r-charts.com/ggplot2/themes/
ggplot(economics) +
  geom_line(aes(x=date, y=pce, colour= "PIB")) +
  geom_line(aes(x=date, y=uempmed*1000, colour="Desemprego")) +
  scale_y_continuous(sec.axis = sec_axis(~ . / 1000, name = "Desemprego") ) +
  labs(title = "Pib e desemprego") + theme(legend.position="bottom")+
  theme_minimal() # Tema minimalista

# Salva o ultimo grafico criado
ggsave(filename = "./graficos/Aula 1.png",
       units = "in",
       width = 8, height = 6,
       dpi = 100)


# Pacote para faciliar a criação de gráficos de froma iterativa

install.packages("esquisse")
library(esquisse)
esquisser()
