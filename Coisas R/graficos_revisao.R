   #install.packages('plyr')
   #install.packages('diagram')
#Ler do excel------------

read.excel <- function(header=TRUE,...) {
  read.table("clipboard",sep="\t",header=header,...)
}
 
dat=read.excel()

dat



#importar base----------
library(plyr)
setwd("F:/Dropbox/Textos/MESTR/Revisao_sistematica_FES")
reading <- read.csv(file="basesemcsv.csv",head=TRUE,sep=",")

bases <- data.frame(reading)
teo <- bases[0:7,]
expe <- bases[8:18,] 

names(bases)
bases$concl_autores
bases$pais

#Pais de origem----


count(teo, 'pais')
count(expe, 'pais')

#Método Utilizados----

count(bases, 'Tipo.de.metodo')
count(expe, 'Tipo.de.metodo')



#Frequencia dos tipos de jogos----

count(teo, 'tipo_jogo')
count(expe, 'tipo_jogo')

#cob <- table(bases$construtos)
#cot <- table(teo$concl_autores)
jogoexperiment <- table(expe$tipo_jogo)

#dev.off()
#par(mfrow=c(1, 1), oma=c(5,4,0,0))
barplot(jogoexperiment, 
        main = "Tipos de jogos usados \nnos trabalhos experimentais", 
  	    xlab = "",
  	    col = c("#3CA0D0"),
  	    ylab = "Número de trabalhos",
  	    cex.names = 0.80,
  	    cex.lab   = 1,
  	    las=1)


#N de articipantes---------------

njogadores <- as.numeric(as.character(bases$N.de.participantes))
njogadoresnormais <- njogadores[-c(9,12)]
outliersjogadores <- njogadores[c(9,12)]

par(mfrow=c(1, 2), oma=c(0,0,3,0))
plot(njogadores,
     main = "Todos os trabalhos",
     xlab = "Trabalhos",
     ylab = "Participantes",
     ylim = c(0,15000),
     pch = 19,
     frame = FALSE)
hist(njogadoresnormais, 
        col  = c("#3CA0D0"),
        main = "Trabalhos sem os outliers",
        xlab = "Faixa de participantes",   
        ylab = "Quantidade de trabalhos",
        breaks = 3,
        las=2)

mean(njogadoresnormais[8:16]) #média
sd(njogadoresnormais[8:16]) #SD


#N de sessoes e tempo------------

nsessoesa <- as.numeric(as.character(expe$n_sessoes))
nsessoes <- nsessoesa[8:11]

par(mfrow=c(1, 2), oma=c(0,0,0,0))

avg <- mean(nsessoes)
sdev <- sd(nsessoes)
x <- 2.5 #até o n de observacoes no caso uma, uma media e um stdev

plot(nsessoes, 
     ylim=range(c(0,60)),
     xlab="", ylab="Sessões",
     main="Média \ndas sessões")
points(x, avg,
    ylim=range(c(0,60)),
    pch=18, xlab="", ylab="Sessões",
    cex = 2,
        main="Média \ndas sessões"
)
# hack: we draw arrows but with very special "arrowheads"
arrows(x, avg-sdev, x, avg+sdev, length=0.05, angle=90, code=3)


#-----------------------------------------#

temposessaoa <- as.numeric(as.character(expe$tempo_sessao_mins))
temposessao <- temposessaoa[8:11]

avg <- mean(temposessao)
sdev <- sd(temposessao)
x <- 2.5 #até o n de observacoes no caso uma, uma media e um stdev

plot(temposessao, 
     ylim=range(c(0,60)),
     xlab="", ylab="Minutos",
     main="Média do tempo \npor sessão")
points(x, avg,
    ylim=range(c(0,60)),
    pch=18, xlab="", ylab="Minutos",
    cex = 2,
    main="Média do tempo \npor sessão"
)
# hack: we draw arrows but with very special "arrowheads"
arrows(x, avg-sdev, x, avg+sdev, length=0.05, angle=90, code=3)


#sexohist----------------------------






sexojogads <- as.numeric(as.character(expe$sexo_p_masc))

hist(sexojogads, 
        col  = c("#3CA0D0"),
        main = "Proporção entre os sexos",
        xlab = "% meninos",   
        ylab = "Quantidade de trabalhos",
        xlim = (0:1),
        breaks = 5,
        las=2)

#sexopontos----------------------------

sexojogads <- as.numeric(as.character(expe$sexo_p_masc))
sexojogadss <- sexojogads[-c(2)]

par(mfrow=c(1, 1), oma=c(0,0,0,0))

avg <- mean(sexojogadss)
sdev <- sd(sexojogadss)
x <- 5.5 #até o n de observacoes no caso uma, uma media e um stdev

plot(sexojogadss, 
     ylim=range(c(0,1)),
     xlab="", ylab="Porcentagem",
     main="Proporção \nde meninos")
points(x, avg,
    ylim=range(c(0,1)),
    pch=18, xlab="", ylab="Sessões",
    cex = 2,
        main="Média \ndas sessões"
)
# hack: we draw arrows but with very special "arrowheads"
arrows(x, avg-sdev, x, avg+sdev, length=0.05, angle=90, code=3)



#Construtos----------------------

cob <- table(bases$construtos)
cot <- table(teo$concl_autores)
coe <- table(expe$construtos)

par(mfrow=c(1, 1), oma=c(0,0,0,0))
barplot(coe, 
        main = "Resultados reportados \npelos os autores", 
  	    xlab = "Construtos",
  	    col = c("#3CA0D0"),
  	    ylab = "Número de trabalhos",
  	    cex.names = 0.80,
  	    cex.lab   = 1,
  	    las=1)


#criterios----------------------

#cob <- table(bases$criterio_para_jogadores)
#cot <- table(teo$concl_autores)
crite <- table(expe$criterio_para_jogadores)


#par(mfrow=c(1, 1), oma=c(0,0,0,0))
barplot(crite, 
        main = "Criterios de enquadramento \nusados pelos os autores", 
  	    xlab = "",
  	    col = c("#3CA0D0"),
  	    ylab = "Número de trabalhos",
  	    cex.names = 0.80,
  	    cex.lab   = 1,
  	    las=1)


#Texto conclusoesrev-------------

## ===
## R-Code to make figure 1.7 from the book:
## K. Soetaert  and  P.M.J. Herman, 2009.  
## A practical guide to ecological modelling - 
## using R as a simulation platform. Springer, 372 pp. 
## http://www.springer.com/life+sciences/ecology/book/978-1-4020-8623-6 .
## implemented by Karline Soetaert
## ===

#require(diagram)
par (mar = c(0, 0, 0, 0))
openplotmat()

# position of boxes
elpos <- coordinates (c(1, 2, 3, 6), mx = 0)

pin   <- par ("pin")         # size of plotting region, inches
xx  <- 0.1
yy  <- xx*pin[1]/pin[2]*0.15  # used to make circles round

textround(elpos[1,], xx, yy*2, 
  lab = c("Curso desenvolvimental"))
textround(elpos[2,], 0.15, yy*2, 
  lab = c("Interação com midias digitais"))
textround(elpos[3,], 0.02, yy*2, 
  lab = c("Biológico"))
textround(elpos[4,], xx, yy*2, 
  lab = c("TEXTO"))



#Conclusoes---------------------

cb <- table(bases$concl_autores)
ct <- table(teo$concl_autores)
ce <- table(expe$concl_autores)

par(mfrow=c(1, 1), oma=c(0,0,0,0))
barplot(ce, main = "Resultados reportados \npelos os autores", 
  	        xlab = "Resultado",
  	        col = c("#3CA0D0"),
  	        ylab = "Número de trabalhos",
  	        cex.names = 0.80,
  	        cex.lab   = 1,
  	        las=1)

cct <- data.frame(teo$concl_autores)
result <- rbind(baskets.df, "7th" = c(7, 4))

cce <- data.frame(expe$concl_autores)

fin <- data.frame(cct,cce)
barplot(ce, main = "Resultados reportados \npelos os autores", 
  	        xlab = "Resultado",
  	        col = c("#3CA0D0"),
  	        ylab = "Número de trabalhos",
  	        cex.names = 0.80,
  	        cex.lab   = 1,
  	        las=1)



#Método Utilizados----

cb <- table(bases$concl_autores)
ct <- table(teo$concl_autores)
ce <- table(expe$concl_autores)

par(mfrow=c(1, 1), oma=c(0,0,0,0))
barplot(cb, main = "Resultados reportados \npelos os autores", 
  	        xlab = "Resultado",
  	        col = c("#3CA0D0"),
  	        ylab = "Número de trabalhos",
  	        cex.names = 0.80,
  	        cex.lab   = 1,
  	        las=1)


#Boxplot-------------------

boxplot(expe$N.de.participantes, 
        col       = c("#3CA0D0"),
        main      = "Tipo.de.metodo",
        ylab      = "Normalized Difference",
        cex.names = 0.65,
        cex.lab   = 1,
        las=2,
        horizontal=TRUE)


boxplot(NUMS ~ GRP, data = ddf, lwd = 2, ylab = 'NUMS')
stripchart(NUMS ~ GRP, vertical = TRUE, data = ddf, 
    method = "jitter", add = TRUE, pch = 20, col = 'blue')


#Plotnparticipantes----------------------

njogadores <- as.numeric(as.character(bases$N.de.participantes))
njogadoresnormais <- njogadores[-c(8,14,15)]
outliersjogadores <- njogadores[c(8,14,15)]

par(mfrow=c(1, 2), oma=c(0,0,3,0))
boxplot(njogadoresnormais,
     main="Numero de jogadores sem outliers",
     xlab="XXX trabalhos",
     ylab = "Participantes",
     pch=19)

stripchart(njogadoresnormais,
           vertical = TRUE,
           method = "jitter",
           add = TRUE,
           pch = 20,
           col = 'blue')

boxplot(outliersjogadores,
     main="Outliers",
     xlab="3 trabalhos",
     ylab = "Participantes",
     pch=19)

stripchart(outliersjogadores,
           vertical = TRUE,
           method = "jitter",
           add = TRUE,
           pch = 20,
           col = 'blue')





  




#FONTES:

#https://www.r-bloggers.com/identify-describe-plot-and-remove-the-outliers-from-the-dataset/



#Instrumentos----


reading2 <- read.csv(file="instrumentoscsv.csv",head=TRUE,sep=",")
instr <- data.frame(reading2)

testesusados <- table(instr$testes)

count(instr, 'testes')
count(instr, 'subtestes')

par(mfrow=c(1, 1), oma=c(0,8,0,0))
barplot(testesusados, 
        main = "Testes usados", 
  	    xlab = "Número de trabalhos",
  	    col = c("#3CA0D0"),
  	    ylab = "",
  	    cex.names = 0.80,
  	    cex.lab   = 1,
        horiz=TRUE,
  	    las=1)




#formasplots--------------

#ponto com stdev

avg <- mean(temposessao)
sdev <- sd(temposessao)
x <- 1:1 #até o n de observacoes no caso uma, uma media e um stdev

plot(x, avg,
    ylim=range(c(avg-sdev, avg+sdev)),
    pch=19, xlab="", ylab="Sessões",
    main="Número médio de sessões"
)
# hack: we draw arrows but with very special "arrowheads"
arrows(x, avg-sdev, x, avg+sdev, length=0.05, angle=90, code=3)