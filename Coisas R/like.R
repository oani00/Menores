#plot likelihood curve----------------
n<-10 #set total trials
x<-0 #set successes
theta<- seq(0,1,len=100) #create theta variable, from 0 to 1
like <- dbinom(x,n,theta) #create likelihood function
plot(theta,like,type='l',xlab=expression(theta), ylab='Likelihood', main="Likelihood Curve")

#S Daniel Lakens, 2016. 
# This work is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License. https://creativecommons.org/licenses/by-nc-sa/4.0/




x <- c(62,60,58,46,45)

r <- rnorm(1e5,mean(x), sd(x))
plot(density(r))
abline(v=mean(x))
abline(v=(mean(x)+2*sd(x)),col="blue")
abline(v=62.24,col="red")




summary(x)
boxplot(x)
abline(54.2,0)
mean(x)
