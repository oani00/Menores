#######trazer a data
## Set the working directory

setwd("E:/BACKUPS_E/Dropbox/Textos/MESTR/3Defesa/R")
data <- read.csv(file="coleta.csv",header=TRUE,sep=",")

names(data)
head(data)
data$Alternancia

jogador <- data[ which(data$jog_njog=='jogador'), ]
n_jogador <- data[ which(data$jog_njog=='n_jogador'), ]

#subset idade------------------------

data7 <- data[ which(data$Idade=='7'), ]
data8 <- data[ which(data$Idade=='8'), ]
data9 <- data[ which(data$Idade=='9'), ]
data10 <- data[ which(data$Idade=='10'), ]

#Comparacao idade--------------------

#Inibicao 

wilcox.test(data8$Inibicao,data7$Inibicao)
wilcox.test(data9$Inibicao,data7$Inibicao)
wilcox.test(data9$Inibicao,data8$Inibicao)
wilcox.test(data10$Inibicao,data7$Inibicao)
wilcox.test(data10$Inibicao,data8$Inibicao)
wilcox.test(data10$Inibicao,data9$Inibicao)

#Flexibilidade

wilcox.test(data8$Flexibil,data7$Flexibil)
wilcox.test(data9$Flexibil,data7$Flexibil)
wilcox.test(data9$Flexibil,data8$Flexibil)
wilcox.test(data10$Flexibil,data7$Flexibil)
wilcox.test(data10$Flexibil,data8$Flexibil)
wilcox.test(data10$Flexibil,data9$Flexibil)

#Memoria de trab

t.test(data8$WM,data7$WM)
t.test(data9$WM,data7$WM)
t.test(data9$WM,data8$WM)
t.test(data10$WM,data7$WM)
t.test(data10$WM,data8$WM)
t.test(data10$WM,data9$WM)

#Flex Cog

t.test(data8$CF,data7$CF)
t.test(data9$CF,data7$CF)
t.test(data9$CF,data8$CF)
t.test(data10$CF,data7$CF)
t.test(data10$CF,data8$CF)
t.test(data10$CF,data9$CF)

#Controle Inibitorio

t.test(data8$IC,data7$IC)
t.test(data9$IC,data7$IC)
t.test(data9$IC,data8$IC)
t.test(data10$IC,data7$IC)
t.test(data10$IC,data8$IC)
t.test(data10$IC,data9$IC)

#Aversao ao atraso

t.test(data8$DA,data7$DA)
t.test(data9$DA,data7$DA)
t.test(data9$DA,data8$DA)
t.test(data10$DA,data7$DA)
t.test(data10$DA,data8$DA)
t.test(data10$DA,data9$DA)

#Regulação de estado

t.test(data8$StR,data7$StR)
t.test(data9$StR,data7$StR)
t.test(data9$StR,data8$StR)
t.test(data10$StR,data7$StR)
t.test(data10$StR,data8$StR)
t.test(data10$StR,data9$StR)



#Comparacao idade2-------------------

jogador7 <- data7[ which(data7$jog_njog=='jogador'), ]
n_jogador7 <- data7[ which(data7$jog_njog=='n_jogador'), ]
jogador8 <- data8[ which(data8$jog_njog=='jogador'), ]
n_jogador8 <- data8[ which(data8$jog_njog=='n_jogador'), ]
jogador9 <- data9[ which(data9$jog_njog=='jogador'), ]
n_jogador9 <- data9[ which(data9$jog_njog=='n_jogador'), ]
jogador10 <- data10[ which(data10$jog_njog=='jogador'), ]
n_jogador10 <- data10[ which(data10$jog_njog=='n_jogador'), ]

#7------------------------#

shapiro.test(jogador7$Inibicao)
shapiro.test(n_jogador7$Inibicao)
shapiro.test(jogador7$Flexibil)
shapiro.test(n_jogador7$Flexibil)
shapiro.test(jogador7$WM)
shapiro.test(n_jogador7$WM)
shapiro.test(jogador7$CF)
shapiro.test(n_jogador7$CF)
shapiro.test(jogador7$IC)
shapiro.test(n_jogador7$IC)
shapiro.test(jogador7$DA)
shapiro.test(n_jogador7$DA)
shapiro.test(jogador7$StR)
shapiro.test(n_jogador7$StR)


t.test(jogador7$Inibicao,n_jogador7$Inibicao)

wilcox.test(jogador7$Flexibil,n_jogador7$Flexibil)
t.test(jogador7$Flexibil,n_jogador7$Flexibil)

wilcox.test(jogador7$WM,n_jogador7$WM)
t.test(jogador7$WM,n_jogador7$WM)

t.test(jogador7$CF,n_jogador7$CF)

wilcox.test(jogador7$IC,n_jogador7$IC)
t.test(jogador7$IC,n_jogador7$IC)

t.test(jogador7$DA,n_jogador7$DA)
t.test(jogador7$StR,n_jogador7$StR)

library(effsize)
c <- cohen.d(jogador7$Flexibil,n_jogador7$Flexibil,na.rm=TRUE)
c <- cohen.d(jogador7$CF,n_jogador7$CF,na.rm=TRUE)

#8------------------------#

shapiro.test(jogador8$Inibicao)
shapiro.test(n_jogador8$Inibicao)
shapiro.test(jogador8$Flexibil)
shapiro.test(n_jogador8$Flexibil)
shapiro.test(jogador8$WM)
shapiro.test(n_jogador8$WM)
shapiro.test(jogador8$CF)
shapiro.test(n_jogador8$CF)
shapiro.test(jogador8$IC)
shapiro.test(n_jogador8$IC)
shapiro.test(jogador8$DA)
shapiro.test(n_jogador8$DA)
shapiro.test(jogador8$StR)
shapiro.test(n_jogador8$StR)


wilcox.test(jogador8$Inibicao,n_jogador8$Inibicao)
t.test(jogador8$Inibicao,n_jogador8$Inibicao)

wilcox.test(jogador8$Flexibil,n_jogador8$Flexibil)
t.test(jogador8$Flexibil,n_jogador8$Flexibil)

t.test(jogador8$WM,n_jogador8$WM)

wilcox.test(jogador8$CF,n_jogador8$CF)
t.test(jogador8$CF,n_jogador8$CF)

t.test(jogador8$IC,n_jogador8$IC)
t.test(jogador8$DA,n_jogador8$DA)
t.test(jogador8$StR,n_jogador8$StR)

#9------------------------#

shapiro.test(jogador9$Inibicao)
shapiro.test(n_jogador9$Inibicao)
shapiro.test(jogador9$Flexibil)
shapiro.test(n_jogador9$Flexibil)
shapiro.test(jogador9$WM)
shapiro.test(n_jogador9$WM)
shapiro.test(jogador9$CF)
shapiro.test(n_jogador9$CF)
shapiro.test(jogador9$IC)
shapiro.test(n_jogador9$IC)
shapiro.test(jogador9$DA)
shapiro.test(n_jogador9$DA)
shapiro.test(jogador9$StR)
shapiro.test(n_jogador9$StR)


t.test(jogador9$Inibicao,n_jogador9$Inibicao)
t.test(jogador9$Flexibil,n_jogador9$Flexibil)

wilcox.test(jogador9$WM,n_jogador9$WM)
t.test(jogador9$WM,n_jogador9$WM)

t.test(jogador9$CF,n_jogador9$CF)
t.test(jogador9$IC,n_jogador9$IC)
t.test(jogador9$DA,n_jogador9$DA)
t.test(jogador9$StR,n_jogador9$StR)

#10-----------------------#

shapiro.test(jogador10$Inibicao)
shapiro.test(n_jogador10$Inibicao)
shapiro.test(jogador10$Flexibil)
shapiro.test(n_jogador10$Flexibil)
shapiro.test(jogador10$WM)
shapiro.test(n_jogador10$WM)
shapiro.test(jogador10$CF)
shapiro.test(n_jogador10$CF)
shapiro.test(jogador10$IC)
shapiro.test(n_jogador10$IC)
shapiro.test(jogador10$DA)
shapiro.test(n_jogador10$DA)
shapiro.test(jogador10$StR)
shapiro.test(n_jogador10$StR)


wilcox.test(jogador10$Inibicao,n_jogador10$Inibicao)
t.test(jogador10$Inibicao,n_jogador10$Inibicao)
wilcox.test(jogador10$Flexibil,n_jogador10$Flexibil)
t.test(jogador10$Flexibil,n_jogador10$Flexibil)

t.test(jogador10$WM,n_jogador10$WM)
t.test(jogador10$CF,n_jogador10$CF)
t.test(jogador10$IC,n_jogador10$IC)
t.test(jogador10$DA,n_jogador10$DA)
t.test(jogador10$StR,n_jogador10$StR)

#Dados descritivos-------------------

idade <- data$Idade
table(idade)

sexo <- data$Sexo
table(sexo)

#install.packages("psych")
library(psych)

describe(data$Inibicao)
describe(data$Flexibil)
describe(data$WM)
describe(data$CF)
describe(data$IC)
describe(data$DA)
describe(data$StR)

#Testar normalidade------------------

#nao normais
shapiro.test(jogador$Inibicao)
shapiro.test(n_jogador$Inibicao)
shapiro.test(jogador$Flexibil)
shapiro.test(n_jogador$Flexibil)

#normais
shapiro.test(jogador$WM)
shapiro.test(n_jogador$WM)
shapiro.test(jogador$CF)
shapiro.test(n_jogador$CF)
shapiro.test(jogador$IC)
shapiro.test(n_jogador$IC)
shapiro.test(jogador$DA)
shapiro.test(n_jogador$DA)
shapiro.test(jogador$StR)
shapiro.test(n_jogador$StR)

hist(jogador$Inibicao)
hist(n_jogador$Inibicao)
hist(jogador$Flexibil)
hist(n_jogador$Flexibil)

#Mann Whitney-------------------------

wilcox.test(jogador$Inibicao,n_jogador$Inibicao)
wilcox.test(jogador$Flexibil,n_jogador$Flexibil)

#TTest(apenas para IFERA)-----------------

t.test(jogador$WM,n_jogador$WM)
t.test(jogador$CF,n_jogador$CF)
t.test(jogador$IC,n_jogador$IC)
t.test(jogador$DA,n_jogador$DA)
t.test(jogador$StR,n_jogador$StR)

#Fit Linear------------------------------

linearMod <- lm(Inibicao ~ Mins_jogo_dia, data=data)  # build linear regression model on full data
summary(linearMod)

linearMod <- lm(Flexibil ~ Mins_jogo_dia, data=data)  # build linear regression model on full data
summary(linearMod)

linearMod <- lm(WM ~ Mins_jogo_dia, data=data)  # build linear regression model on full data
summary(linearMod)

linearMod <- lm(CF ~ Mins_jogo_dia, data=data)  # build linear regression model on full data
summary(linearMod)

linearMod <- lm(IC ~ Mins_jogo_dia, data=data)  # build linear regression model on full data
summary(linearMod)

linearMod <- lm(DA ~ Mins_jogo_dia, data=data)  # build linear regression model on full data
summary(linearMod)

linearMod <- lm(StR ~ Mins_jogo_dia, data=data)  # build linear regression model on full data
summary(linearMod)

#http://r-statistics.co/Linear-Regression.html

#Testar normalidade Socioeconom----------

jogador <- data[ which(data$jog_njog=='jogador'), ]
n_jogador <- data[ which(data$jog_njog=='n_jogador'), ]

shapiro.test(jogador$Socioec)
shapiro.test(n_jogador$Socioec)

#Mann Whitney Socioeconom----------------

t.test(jogador$Socioec,n_jogador$Socioec)

#Subset sexo-------------------------

jogador <- data[ which(data$jog_njog=='jogador'), ]
jogadoro <- jogador[ which(jogador$Sexo=='M'), ]
jogadora <- jogador[ which(jogador$Sexo=='F'), ]

n_jogador <- data[ which(data$jog_njog=='n_jogador'), ]
n_jogadoro <- n_jogador[ which(n_jogador$Sexo=='M'), ]
n_jogadora <- n_jogador[ which(n_jogador$Sexo=='F'), ]

#Mann Whitney sexo-------------------

# independent 2-group Mann-Whitney U Test

wilcox.test(jogadoro$Inibicao,n_jogadoro$Inibicao)
wilcox.test(jogadora$Inibicao,n_jogadora$Inibicao)
wilcox.test(jogadoro$Flexibil,n_jogadoro$Flexibil)
wilcox.test(jogadora$Flexibil,n_jogadora$Flexibil)

wilcox.test(jogadoro$Inibicao,jogadora$Inibicao)
wilcox.test(n_jogadoro$Inibicao,n_jogadora$Inibicao)
wilcox.test(jogadoro$Flexibil,jogadora$Flexibil)
wilcox.test(n_jogadoro$Flexibil,n_jogadora$Flexibil)


#Descobrir os df

t.test(jogadoro$Inibicao,n_jogadoro$Inibicao)
t.test(jogadora$Inibicao,n_jogadora$Inibicao)
t.test(jogadoro$Flexibil,n_jogadoro$Flexibil)
t.test(jogadora$Flexibil,n_jogadora$Flexibil)

t.test(jogadoro$Inibicao,jogadora$Inibicao)
t.test(n_jogadoro$Inibicao,n_jogadora$Inibicao)
t.test(jogadoro$Flexibil,jogadora$Flexibil)
t.test(n_jogadoro$Flexibil,n_jogadora$Flexibil)

#TTest(apenas para IFERA) Sexo-----------

t.test(jogadoro$WM,n_jogadoro$WM)
t.test(jogadora$WM,n_jogadora$WM)
t.test(jogadoro$WM,jogadora$WM)
t.test(n_jogadoro$WM,n_jogadora$WM)


t.test(jogadoro$CF,n_jogadoro$CF)
t.test(jogadora$CF,n_jogadora$CF)
t.test(jogadoro$CF,jogadora$CF)
t.test(n_jogadoro$CF,n_jogadora$CF)


t.test(jogadoro$IC,n_jogadoro$IC)
t.test(jogadora$IC,n_jogadora$IC)
t.test(jogadoro$IC,jogadora$IC)
t.test(n_jogadoro$IC,n_jogadora$IC)


t.test(jogadoro$DA,n_jogadoro$DA)
t.test(jogadora$DA,n_jogadora$DA)
t.test(jogadoro$DA,jogadora$DA)
t.test(n_jogadoro$DA,n_jogadora$DA)


t.test(jogadoro$StR,n_jogadoro$StR)
t.test(jogadora$StR,n_jogadora$StR)
t.test(jogadoro$StR,jogadora$StR)
t.test(n_jogadoro$StR,n_jogadora$StR)

#contagem jogador e n jogador---------

jognjog <- data$jog_njog

countjognjog <- table(jognjog)

#contagem genero jogo-----------------

genero <- data$Genero_m_jog
genero

countgenero <- table(genero)

#contagem sexo-----------------------

sexo <- table(data$Sexo, data$Idade)
sexo

#Correlacao--------------------------

a <- data$Socioec
b <- data$Inibicao
c <- 
d <-cor.test(a,b)

hist(b)


res <- cor(data)
round(res, 2)


#http://www.sthda.com/english/wiki/correlation-test-between-two-variables-in-r

#correlação scores tempo-------------

cor1 <- cor.test(data$Mins_jogo_dia, data$Inibicao, 
                method = "pearson")
cor2 <- cor.test(data$Mins_jogo_dia, data$Flexibil, 
                 method = "pearson")
cor3 <- cor.test(data$Mins_jogo_dia, data$WM, 
                 method = "pearson")
cor4 <- cor.test(data$Mins_jogo_dia, data$CF, 
                 method = "pearson")
cor5 <- cor.test(data$Mins_jogo_dia, data$IC, 
                 method = "pearson")
cor6 <- cor.test(data$Mins_jogo_dia, data$DA, 
                 method = "pearson")
cor7 <- cor.test(data$Mins_jogo_dia, data$StR, 
                 method = "pearson")

#correlação Socioeconom--------------

cor1 <- cor.test(data$Socioec, data$Inibicao, 
                 method = "pearson")
cor2 <- cor.test(data$Socioec, data$Flexibil, 
                 method = "pearson")
cor3 <- cor.test(data$Socioec, data$WM, 
                 method = "pearson")
cor4 <- cor.test(data$Socioec, data$CF, 
                 method = "pearson")
cor5 <- cor.test(data$Socioec, data$IC, 
                 method = "pearson")
cor6 <- cor.test(data$Socioec, data$DA, 
                 method = "pearson")
cor7 <- cor.test(data$Socioec, data$StR, 
                 method = "pearson")

#Cohen`s d---------------------------

a <- cohen.d(jogador$WM,n_jogador$WM,na.rm=TRUE)

#Jogadores de ação e nao ação-------


jogadorac <- data[ which(data$AVGP=='s'), ]
n_jogadorac <- data[ which(data$AVGP=='n'), ]

#nao normais
shapiro.test(jogadorac$Inibicao)
shapiro.test(n_jogadorac$Inibicao)
shapiro.test(jogadorac$Flexibil)
shapiro.test(n_jogadorac$Flexibil)

#normais
shapiro.test(jogadorac$WM)
shapiro.test(n_jogadorac$WM)
shapiro.test(jogadorac$CF)
shapiro.test(n_jogadorac$CF)
shapiro.test(jogadorac$IC)
shapiro.test(n_jogadorac$IC)
shapiro.test(jogadorac$DA)
shapiro.test(n_jogadorac$DA)
shapiro.test(jogadorac$StR)
shapiro.test(n_jogadorac$StR)

#testes-----------------------#

wilcox.test(jogadorac$Inibicao,n_jogadorac$Inibicao)
wilcox.test(jogadorac$Flexibil,n_jogadorac$Flexibil)

t.test(jogadorac$WM,n_jogadorac$WM)
t.test(jogadorac$CF,n_jogadorac$CF)
t.test(jogadorac$IC,n_jogadorac$IC)
t.test(jogadorac$DA,n_jogadorac$DA)
t.test(jogadorac$StR,n_jogadorac$StR)


#Atividades dados descritivos-------

atividade <- table(data$Ativid_ex_curr)
outros <- table(data$Outrs)

write.table(atividade, "clipboard", sep="\t", row.names=FALSE)
write.table(outros, "clipboard", sep="\t", row.names=FALSE)


#Correlacoes extracurriculares-------
extracur <- data[ which(data$algum_ex_curr=='s'), ]

cor1 <- cor.test(extracur$Mins_atv_dia, extracur$Inibicao, 
                 method = "pearson")
cor2 <- cor.test(extracur$Mins_atv_dia, extracur$Flexibil, 
                 method = "pearson")
cor3 <- cor.test(extracur$Mins_atv_dia, extracur$WM, 
                 method = "pearson")
cor4 <- cor.test(extracur$Mins_atv_dia, extracur$CF, 
                 method = "pearson")
cor5 <- cor.test(extracur$Mins_atv_dia, extracur$IC, 
                 method = "pearson")
cor6 <- cor.test(extracur$Mins_atv_dia, extracur$DA, 
                 method = "pearson")
cor7 <- cor.test(extracur$Mins_atv_dia, extracur$StR, 
                 method = "pearson")

#Correlacoes lazer-------------------

assistir_tv <- data[ which(data$Outrs=='Assistir TV'), ]

cor1 <- cor.test(assistir_tv$Mins_outrs_dia, assistir_tv$Inibicao, 
                 method = "pearson")
cor2 <- cor.test(assistir_tv$Mins_outrs_dia, assistir_tv$Flexibil, 
                 method = "pearson")
cor3 <- cor.test(assistir_tv$Mins_outrs_dia, assistir_tv$WM, 
                 method = "pearson")
cor4 <- cor.test(assistir_tv$Mins_outrs_dia, assistir_tv$CF, 
                 method = "pearson")
cor5 <- cor.test(assistir_tv$Mins_outrs_dia, assistir_tv$IC, 
                 method = "pearson")
cor6 <- cor.test(assistir_tv$Mins_outrs_dia, assistir_tv$DA, 
                 method = "pearson")
cor7 <- cor.test(assistir_tv$Mins_outrs_dia, assistir_tv$StR, 
                 method = "pearson")

#-----------------------------------------------------------------#

brinc_brinc <- data[ which(data$Outrs=='Brincar (brinquedos)'), ]

cor1 <- cor.test(brinc_brinc$Mins_outrs_dia, brinc_brinc$Inibicao, 
                 method = "pearson")
cor2 <- cor.test(brinc_brinc$Mins_outrs_dia, brinc_brinc$Flexibil, 
                 method = "pearson")
cor3 <- cor.test(brinc_brinc$Mins_outrs_dia, brinc_brinc$WM, 
                 method = "pearson")
cor4 <- cor.test(brinc_brinc$Mins_outrs_dia, brinc_brinc$CF, 
                 method = "pearson")
cor5 <- cor.test(brinc_brinc$Mins_outrs_dia, brinc_brinc$IC, 
                 method = "pearson")
cor6 <- cor.test(brinc_brinc$Mins_outrs_dia, brinc_brinc$DA, 
                 method = "pearson")
cor7 <- cor.test(brinc_brinc$Mins_outrs_dia, brinc_brinc$StR, 
                 method = "pearson")

#-----------------------------------------------------------------#


brinc_mov <- data[ which(data$Outrs=='Brincar (moviementos)'), ]

cor1 <- cor.test(brinc_mov$Mins_outrs_dia, brinc_mov$Inibicao, 
                 method = "pearson")
cor2 <- cor.test(brinc_mov$Mins_outrs_dia, brinc_mov$Flexibil, 
                 method = "pearson")
cor3 <- cor.test(brinc_mov$Mins_outrs_dia, brinc_mov$WM, 
                 method = "pearson")
cor4 <- cor.test(brinc_mov$Mins_outrs_dia, brinc_mov$CF, 
                 method = "pearson")
cor5 <- cor.test(brinc_mov$Mins_outrs_dia, brinc_mov$IC, 
                 method = "pearson")
cor6 <- cor.test(brinc_mov$Mins_outrs_dia, brinc_mov$DA, 
                 method = "pearson")
cor7 <- cor.test(brinc_mov$Mins_outrs_dia, brinc_mov$StR, 
                 method = "pearson")
