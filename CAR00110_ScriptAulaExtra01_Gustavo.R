### CAR00110 – Aula Extra 01 – 07/09/2023 ###

#Loading required packages

library(pacman)
pacman::p_load(
  tidyverse,
  ggplot2,
  gt)

#Angina prevalence
prevAngEst <- as.numeric(0.94)
llAngEst <- as.numeric(0.90)
ulAngEst <- as.numeric(0.99)

#Stroke prevalence
prevAve <- as.numeric(1.12)
llAve <- as.numeric(1.06)
ulAve <- as.numeric(1.18)

### Criando dataset

#Definindo variável
varCVD <- c("Angina", "Ave")
varRP <- c(prevAngEst, prevAve)
varLL <- c(llAngEst, llAve)
varUL <- c(ulAngEst, ulAve)

#Definindo estruturas CVD, RP, LL, UL
dtPrevalencia <- cbind(varCVD, varRP, varLL, varUL) #Constroi colunas (rbind linhas)
dtPrevalencia <- as.data.frame(dtPrevalencia)
glimpse(dtPrevalencia)

#Transformação variáveis numéricas

dtPrevalencia$varCVD <- as.character(dtPrevalencia$varCVD)
dtPrevalencia$varRP <- as.numeric(dtPrevalencia$varRP)
dtPrevalencia$varLL <- as.numeric(dtPrevalencia$varLL)
dtPrevalencia$varUL <- as.numeric(dtPrevalencia$varUL)

###################################

p <- 
  dtPrevalencia |>
  ggplot(aes(y = varCVD)) +
         theme_classic()
p <- p +
  geom_point(aes(x = varRP), shape = 15, size = 1.1) +
  geom_linerange(aes(xmin = varLL, xmax = varUL))
p

p <- p +
  geom_vline(xintercept = 1, linetype = "dashed", linewidth = 0,6, color = "red") +
  labs(x = "RP", y = "")
p

p <- p +
  theme(axis.line.y = element_blank(),
        axis.ticks.y = element_blank(),
        axis.text.y = element_blank(),
        axis.title.y = element_blank()
        )
p
