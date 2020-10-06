#### Trazer a data ####

# Set the working directory
setwd("F:/Dropbox/code/R")

###Se quiser trazer do excel instale:
#instalar o xlsx
#install.packages("rJava")
#install.packages("xlsxjars")
#install.packages("xlsx")
#library("rJava")
#library("xlsxjars")
#library("xlsx")

# read in the worksheet named mysheet
res <- read.xlsx(file, 1) # read the 1st sheet
#ou use data <- read.xlsx("F:/Dropbox/code/R/pesquisa_bases_concluida.xlsx", sheetName = "Tabela_Geral")


#### Trazer a data do csv

# Set the working directory
setwd("F:/Dropbox/code/R")

# Trazer a data
revisao <- read.csv(file="bases.csv",head=TRUE,sep=",")

names(revisao)

plot(1)
barplot((table(revisao$Categoria)), 
        srt       = 45,
        adj       = 1,
        xpd       = TRUE,
        col       = c("#3CA0D0"),
        main      = "MAIN",
        ylab      = "Normalized Difference",
        cex.names = 0.65,
        cex.lab   = 1,
        las=2)

revisao$Categoria


#### Trazer a data do excel

#install.packages("manipulate")
library(manipulate)
#manipulate(plot(1:x), x = slider(1, 100))


jogadores <- rnorm(60, 3, 3)
n_jogadores <- rnorm(60, 1, 0.5)

#e <- data.frame(jogadores, n_jogadores)

manipulate(
  plot(density(0.2000*rnorm(60, m, s)), ylim=c(0,2)), m = slider(1, 10), s = slider(1, 10))



plot(density(jogadores), ylim=c(0,2))
lines(density(n_jogadores), col="red")

t.test(jogadores,n_jogadores)






#### Dados ####

#ferramentas para gerar os graficos
#https://homepage.divms.uiowa.edu/~luke/classes/STAT4580/histdens.html#superimposing-a-density
library(UsingR)

#---------------------gerador rand


n <- seq(1:60)
fdt <- rnorm(60,55,25)
digitos <- rnorm(60,13,3)
critbr <- rnorm(60,40,5) 

for(i in 1:5){
  assign(paste("ifera", i, sep = ""), sample(seq(from = 1, to = 5, by = 1), size = 60, replace = TRUE))
}

dat <- data.frame(n,fdt,digitos,ifera1,ifera2,ifera3,ifera4,ifera5,critbr)
dat

jogadores <- dat[1:30,]
njogadores <- dat[31:60,]

#boxplot(dat)
#boxplot(jogadores$fdt,njogadores$fdt)

#### FDT ####




#*total e norma---------------------------------------------

hist(dat$fdt, freq = FALSE,
    main="Histograma FDT",
    border="white", 
    xlim=c(-100,200), 
    ylim=c(0,0.02), 
    ylab="Densidade", 
    xlab="Scores")
x <- seq(-100, 200, length.out=100)
#fdtn1 <- rnorm(1e4,44.0,19.5)
#fdtn2 <- rnorm(1e4,58.3,20.8)
fdtn1 <- dnorm(x,44.0,19.5)
t <- with(dat, dnorm(x, mean(fdt), sd(fdt)))
j <- with(jogadores, dnorm(x, mean(fdt), sd(fdt)))
n <- with(njogadores, dnorm(x, mean(fdt), sd(fdt)))
lines(x, fdtn1, col = "purple")
lines(x, t, col = "black")
#lines(x, j, col = "blue")
#lines(x, n, col = "red")

fdtrdm <- rnorm(1e4,44.0,19.5)

#com a norma
t.test(dat$fdt,fdtrdm)

 57.08661 - 44.10760 


# Legenda
#http://www.sthda.com/english/wiki/add-legends-to-plots-in-r-software-the-easiest-way

legend(150, 0.02, legend=c("Total", "Norma"),
       col=c("black", "purple"), lty=1:1, cex=0.7)


#*grupos---------------------------------------------

hist(dat$fdt, freq = FALSE,
    main="Histograma FDT",
    border="white", 
    xlim=c(-100,200), 
    ylim=c(0,0.02), 
    ylab="Densidade", 
    xlab="Scores")
x <- seq(-100, 200, length.out=100)
#fdtn1 <- rnorm(1e4,44.0,19.5)
#fdtn2 <- rnorm(1e4,58.3,20.8)
fdtn1 <- dnorm(x,44.0,19.5)
t <- with(dat, dnorm(x, mean(fdt), sd(fdt)))
j <- with(jogadores, dnorm(x, mean(fdt), sd(fdt)))
n <- with(njogadores, dnorm(x, mean(fdt), sd(fdt)))
#lines(x, fdtn1, col = "purple")
lines(x, t, col = "black")
lines(x, j, col = "blue")
lines(x, n, col = "red")

fdtrdm <- rnorm(1e4,44.0,19.5)

#um com o outro
t.test(jogadores$fdt,njogadores$fdt)



# Legenda
#http://www.sthda.com/english/wiki/add-legends-to-plots-in-r-software-the-easiest-way

legend(150, 0.02, legend=c("Total", "Jogadores", "N Jogadores"),
       col=c("black", "blue", "red"), lty=1:1, cex=0.7)



#### WISC ####

#*total e norma---------------------------------------------

hist(dat$digitos, freq = FALSE,
    main="Histograma sobreposto Dígitos",
    border="white", 
    xlim=c(-20,50), 
    ylim=c(0,0.20), 
    ylab="Densidade", 
    xlab="Scores")
x <- seq(-20,50, length.out=100)
digitosnorm <- dnorm(x,13,5)
t <- with(dat, dnorm(x, mean(digitos), sd(digitos)))
j <- with(jogadores, dnorm(x, mean(digitos), sd(digitos)))
n <- with(njogadores, dnorm(x, mean(digitos), sd(digitos)))
lines(x, digitosnorm, col = "purple")
lines(x, t, col = "black")
#lines(x, j, col = "blue")
#lines(x, n, col = "red")

digitosrdm  <- rnorm(1e4,13,5)
#com o total
t.test(jogadores$digitos,dat$digitos)
#com a norma
t.test(dat$digitos,digitosrdm)



# Legenda
#http://www.sthda.com/english/wiki/add-legends-to-plots-in-r-software-the-easiest-way

legend(30, 0.20, legend=c("Total", "Norma"),
       col=c("black", "purple"), lty=1:1, cex=0.7)


#*grupos---------------------------------------------

hist(dat$digitos, freq = FALSE,
    main="Histograma sobreposto Dígitos",
    border="white", 
    xlim=c(-20,50), 
    ylim=c(0,0.20), 
    ylab="Densidade", 
    xlab="Scores")
x <- seq(-20,50, length.out=100)
digitosnorm <- dnorm(x,13,5)
t <- with(dat, dnorm(x, mean(digitos), sd(digitos)))
j <- with(jogadores, dnorm(x, mean(digitos), sd(digitos)))
n <- with(njogadores, dnorm(x, mean(digitos), sd(digitos)))
#lines(x, digitosnorm, col = "purple")
lines(x, t, col = "black")
lines(x, j, col = "blue")
lines(x, n, col = "red")

digitosrdm  <- rnorm(1e4,13,5)
#com o total
t.test(jogadores$digitos,dat$digitos)
#um com o outro
t.test(jogadores$digitos,njogadores$digitos)



# Legenda
#http://www.sthda.com/english/wiki/add-legends-to-plots-in-r-software-the-easiest-way

legend(30, 0.20, legend=c("Total", "Jogadores", "N Jogadores"),
       col=c("black", "blue", "red"), lty=1:1, cex=0.7)




#### IFERA-I ####

#*grupos---------------------------------------------

#----------------------------------1

boxplot(dat$ifera1,
        jogadores$ifera1,
        njogadores$ifera1,
        main="Boxplot IFERA-I Memória de trabalho",
        ylab="Respostas",
        names = c("total","jogadores", "nao jogadores"))

#um com o outro
t.test(jogadores$ifera1,njogadores$ifera1)

#----------------------------------2

boxplot(dat$ifera2,
        jogadores$ifera2,
        njogadores$ifera2,
        main="Boxplot IFERA-I Controle inibitório",
        ylab="Respostas",
        names = c("total","jogadores", "nao jogadores"))

#um com o outro
t.test(jogadores$ifera2,njogadores$ifera2)

#----------------------------------3

boxplot(dat$ifera3,
        jogadores$ifera3,
        njogadores$ifera3,
        main="Boxplot IFERA-I Flexibilidade",
        ylab="Respostas",
        names = c("total","jogadores", "nao jogadores"))

#um com o outro
t.test(jogadores$ifera3,njogadores$ifera3)

#----------------------------------4

boxplot(dat$ifera4,
        jogadores$ifera4,
        njogadores$ifera4,
        main="Boxplot IFERA-I Aversão ao atraso",
        ylab="Respostas",
        names = c("total","jogadores", "nao jogadores"))

#um com o outro
t.test(jogadores$ifera4,njogadores$ifera4)

#----------------------------------5

boxplot(dat$ifera5,
        jogadores$ifera5,
        njogadores$ifera5,
        main="Boxplot IFERA-I Regulação",
        ylab="Respostas",
        names = c("total","jogadores", "nao jogadores"))

#um com o outro
t.test(jogadores$ifera5,njogadores$ifera5)


#### Socioecon ####

#*total e norma---------------------------------------------

hist(dat$critbr, freq = FALSE,
    main="Histograma Critério BR",
    border="white", 
    xlim=c(-100,200), 
    ylim=c(0,0.02), 
    ylab="Densidade", 
    xlab="Scores")
x <- seq(-100, 200, length.out=100)

#distribuição da norma
critbr1 <- dnorm(x,50,20)
t <- with(dat, dnorm(x, mean(fdt), sd(fdt)))
j <- with(jogadores, dnorm(x, mean(fdt), sd(fdt)))
n <- with(njogadores, dnorm(x, mean(fdt), sd(fdt)))
lines(x, critbr1, col = "purple")
lines(x, t, col = "black")
#lines(x, j, col = "blue")
#lines(x, n, col = "red")

critdm <- rnorm(1e4,50,20)

#com a norma
t.test(dat$critbr,critdm)


# Legenda
#http://www.sthda.com/english/wiki/add-legends-to-plots-in-r-software-the-easiest-way

legend(150, 0.02, legend=c("Total", "Norma"),
       col=c("black", "purple"), lty=1:1, cex=0.7)


#*grupos---------------------------------------------

hist(dat$critbr, freq = FALSE,
    main="Histograma Critério BR",
    border="white", 
    xlim=c(-100,200), 
    ylim=c(0,0.02), 
    ylab="Densidade", 
    xlab="Scores")
x <- seq(-100, 200, length.out=100)
#fdtn1 <- rnorm(1e4,44.0,19.5)
#fdtn2 <- rnorm(1e4,58.3,20.8)
fdtn1 <- dnorm(x,44.0,19.5)
t <- with(dat, dnorm(x, mean(critbr), sd(critbr)))
j <- with(jogadores, dnorm(x, mean(critbr), sd(critbr)))
n <- with(njogadores, dnorm(x, mean(critbr), sd(critbr)))
#lines(x, fdtn1, col = "purple")
lines(x, t, col = "black")
lines(x, j, col = "blue")
lines(x, n, col = "red")



#um com o outro
t.test(jogadores$critbr,njogadores$critbr)



# Legenda
#http://www.sthda.com/english/wiki/add-legends-to-plots-in-r-software-the-easiest-way

legend(150, 0.02, legend=c("Total", "Jogadores", "N Jogadores"),
       col=c("black", "blue", "red"), lty=1:1, cex=0.7)

#*grupos SIGNIF---------------------------------------------


hist(dat$critbr, freq = FALSE,
    main="Histograma Critério BR",
    border="white", 
    xlim=c(-100,200), 
    ylim=c(0,0.02), 
    ylab="Densidade", 
    xlab="Scores")
x <- seq(-100, 200, length.out=100)

jog <- rnorm(x,20,30)
t <- with(dat, dnorm(x, mean(critbr), sd(critbr)))
j <- dnorm(x, mean(jog), sd(jog))
n <- with(njogadores, dnorm(x, mean(critbr), sd(critbr)))
#lines(x, fdtn1, col = "purple")
lines(x, t, col = "black")
lines(x, j, col = "blue")
lines(x, n, col = "red")

23.93201 - 42.27547 

#um com o outro
t.test(jog,njogadores$critbr)



# Legenda
#http://www.sthda.com/english/wiki/add-legends-to-plots-in-r-software-the-easiest-way

legend(150, 0.02, legend=c("Total", "Jogadores", "N Jogadores"),
       col=c("black", "blue", "red"), lty=1:1, cex=0.7)

#------------------Checar normalidade---------

ks.test(dat$jtest1,dat$ntest1)

qqplot(dat$jtest1, dat$ntest1)
abline(c(0,1))
boxplot(dat$jtest1, dat$ntest1, dat$jtest2, dat$ntest2)
boxplot(dat$jtest1, dat$ntest1)

panel.qq <- function(x, y, ...) {
  usr <- par("usr"); on.exit(par(usr))
  par(usr = c(0, 1, 0, 1), new = TRUE)
  qqplot(x, y, xlab = deparse(substitute(x)), ylab = deparse(substitute(y)))
  abline(c(0,1), ...)
}

pairs(dat, lower.panel = panel.qq)





#### Agradecimentos ####

#https://stackoverflow.com/questions/10286473/rotating-x-axis-labels-in-r-for-barplot

#https://d3c33hcgiwev3.cloudfront.net/_657845dfacd2af9732fea59a8178482c_priorSensitivity.html?Expires=1526860800&Signature=PlyN2-te756dg4bkUNARWCbruVHRn-qOE3PxjJ4ilFlbqOtfjGJEdd1aeqkQdlRU19AIIVWu2qo2Tt0JAMkocnYJm0ikbjci9334iJqvWLXDXIfg8tr1C4b29b~FIGM6g88s~hkLK-OhD9DRwhE671BGQpcSaVI0zfUJn9tVyEs_&Key-Pair-Id=APKAJLTNE6QMUY6HBC5A

#https://stackoverflow.com/questions/26874669/pairs-matrix-with-qq-plots

#https://www.r-bloggers.com/box-plot-with-r-tutorial/