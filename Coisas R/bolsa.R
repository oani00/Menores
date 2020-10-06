################### notas ###################

#####para fazer boxplots por data
#https://www.r-bloggers.com/box-plot-with-r-tutorial/

#####fazer histogramas pela mesma data

################### Code ###################

#######trazer a data
## Set the working directory

setwd("F:/Dropbox/code/R")
data <- read.csv(file="ibov_mensal_1990.csv",head=TRUE,sep=",")

#######Fazer um subset para o range desejado

close <- data[161:301, c("Close")]

##Tem que converter para numerico?
#bolsa <- as.numeric(unlist(data))

#######Plot normal
plot(close)


#######histograma com bloxplot

#hist(close,main='fechamento desde xxxx',xlab='xlab',ylim=c(0,16))

hist(close,density = 5, breaks = 5, main='fechamento mensal desde 2006',xlab='valor de fechamento', ylim = c(0,35))
hist(close,density = 30, breaks = 50, main='fechamento mensal desde 2006',xlab='valor de fechamento', ylim = c(0,35), add=TRUE)
boxplot(close,horizontal=TRUE,at=34,add=TRUE,axes=FALSE, varwidth = TRUE)
abline(v=mean(close), col="purple", lwd = 5)

#Uma comparacao boba com uma media e stdev

curve(200500*dnorm(x, median(close), sd(close) ), col="blue", add=TRUE)

#hist(theta, freq=FALSE)
#curve(dgamma(x=x, shape=a, rate=b), col="blue", add=TRUE)

###qqplot

#dev.new()
#qqnorm(bolsa); qqline(bolsa, col = 2)
qqnorm(data$Close); qqline(bolsa, col = 2)

####Simulacaozinha legal####

#set.seed(34)

n = 1000
x = numeric(n)

for (i in 2:n) {
  x[i] = rnorm(1, mean=x[i-1], sd=1.0)
}

plot.ts(x, ylim = c(-50,50))
