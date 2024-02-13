# FGV Curso Masters - 1o SEMESTRE 2024
# Disciplina Programação em R
# Professora Adriana Bezerra Bessa
# Aluno MABER ATHAYDE FERNANDES
# Exercício 3 - Construção de gráficos com a linguagem R
#
# Grupo:
# DOMINGOS NETO ISHII RODRIGUES DE MORAES
# MABER ATHAYDE FERNANDES
# VICTOR FERNANDO CORDEIRO LOPES
#
#
#Limpando o ambiente e o console
rm(list = ls())
cat("\014")
#
#Setup do diretório
setwd("/home/maber/R/Aula3")
getwd()
#
# Carregamento de pacotes, foi previamente verificada a instalação deles
library(ggplot2)
#
# Carregamento da base de dados iris
df <- iris
df
png("IrisDatabase.png", width = 800, height = 600)
plot <- ggplot(data = df, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  geom_point() +
  labs(title = "Sepal Length vs Sepal Width",
       x = "Sepal Length",
       y = "Sepal Width",
       subtitle = "Iris Database",
       caption = "Fonte: Iris database (R-Studio)")
plot
dev.off()