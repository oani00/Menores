#####Lição 10#####
#1###

b0 <- 1.5
b1 <- -0.3
b2 <- 1
a <- 0.8
b <- 1.2
  
E <- exp(b0+b1*a+b2*b)
E


#2---


#install.packages("COUNT")
library("COUNT")

data("badhealth")

head(badhealth)

any(is.na(badhealth))


hist(badhealth$numvisit, breaks=20)


###Modelo original###

library("rjags")


mod_string = " model {
    for (i in 1:length(numvisit)) {
        numvisit[i] ~ dpois(lam[i])
        log(lam[i]) = int + b_badh*badh[i] + b_age*age[i] + b_intx*age[i]*badh[i]
    }
    
    int ~ dnorm(0.0, 1.0/1e6)
    b_badh ~ dnorm(0.0, 1.0/1e4)
    b_age ~ dnorm(0.0, 1.0/1e4)
    b_intx ~ dnorm(0.0, 1.0/1e4)
} "

set.seed(102)

data_jags = as.list(badhealth)

params = c("int", "b_badh", "b_age", "b_intx")

mod = jags.model(textConnection(mod_string), data=data_jags, n.chains=3)
update(mod, 1e3)

mod_sim = coda.samples(model=mod,
                        variable.names=params,
                        n.iter=5e3)
mod_csim = as.mcmc(do.call(rbind, mod_sim))

## convergence diagnostics
plot(mod_sim)

gelman.diag(mod_sim)
autocorr.diag(mod_sim)
autocorr.plot(mod_sim)
effectiveSize(mod_sim)

## compute DIC
dic = dic.samples(mod, n.iter=1e3)
dic

#Mean deviance:  5630 
#penalty 4.022 
#Penalized deviance: 5634 

###Modelo do exercicio###

library("rjags")


mod_string = " model {
    for (i in 1:length(numvisit)) {
        numvisit[i] ~ dpois(lam[i])
        log(lam[i]) = int + b_badh*badh[i] + b_age*age[i]
    }
    
    int ~ dnorm(0.0, 1.0/1e6)
    b_badh ~ dnorm(0.0, 1.0/1e4)
    b_age ~ dnorm(0.0, 1.0/1e4)
    b_intx ~ dnorm(0.0, 1.0/1e4)
} "

set.seed(102)

data_jags = as.list(badhealth)

params = c("int", "b_badh", "b_age", "b_intx")

mod = jags.model(textConnection(mod_string), data=data_jags, n.chains=3)
update(mod, 1e3)

mod_sim = coda.samples(model=mod,
                        variable.names=params,
                        n.iter=5e3)
mod_csim = as.mcmc(do.call(rbind, mod_sim))

## convergence diagnostics
plot(mod_sim)

gelman.diag(mod_sim)
autocorr.diag(mod_sim)
autocorr.plot(mod_sim)
effectiveSize(mod_sim)

## compute DIC
dic = dic.samples(mod, n.iter=1e3)
dic

#Mean deviance:  5635 
#penalty 2.944 
#Penalized deviance: 5638 


#resposta:
#The original model with interaction has a lower value of DIC than the simpler model, so we retain the original model.


#3###

#Being in bad health is associated with a 1.56 increase in the log of the expected number of doctor visits.



#4###

probabilidade <- ppois(21, 30) #por que é menor que 22, logo 21
1-probabilidade  
#0.08056902




#5###

#resp: calls vs. \tt isgroup2 isgroup2


setwd("F:/Dropbox/code/R/Curso")
dat <- read.csv(file="caller.csv",head=TRUE,sep=",")
pairs(dat)

boxplot(dat)
boxplot(dat$calls, xlab="calls")
hist(dat$calls, 30, xlab="calls")
boxplot(dat$isgroup2)





plot(dat$calls/dat$days_active, dat$isgroup2)
plot(dat$calls, dat$isgroup2)

#resp
#calls vs. \tt isgroup2 isgroup2



#6###

#resp
#for (i in 1:length(calls)) {#
#		calls[i] ~ dpois( lam[i] )
#		lam[i] = b0 + b[1]*age[i] + b[2]*isgroup2[i]
#	}	}



#7###

library("rjags")

mod_string = " model {
	for (i in 1:length(calls)) {
		calls[i] ~ dpois(lam[i])
		log(lam[i]) = b0 + b1*age[i] + b2*isgroup2[i]
	}

    b0 ~ dnorm(0.0, 1.0/1e2)
    b1 ~ dnorm(0.0, 1.0/1e2)
    b2 ~ dnorm(0.0, 1.0/1e2)
} "


data_jags = as.list(dat)

params = c("b0", "b1", "b2")

mod = jags.model(textConnection(mod_string), 
                 data=data_jags, 
                 n.chains=3)

update(mod, 1e3)

mod_sim = coda.samples(model=mod,
                        variable.names=params,
                        n.iter=5e3)
mod_csim = as.mcmc(do.call(rbind, mod_sim))

## convergence diagnostics
plot(mod_sim)

gelman.diag(mod_sim)
autocorr.diag(mod_sim)
autocorr.plot(mod_sim)
effectiveSize(mod_sim)

## compute DIC
dic = dic.samples(mod, n.iter=1e3)
dic

summary(mod_sim)

head(mod_csim)

mean(mod_csim[,"b0"]>0)

m <- (mod_csim[,"b0"]>0)/(mod_csim[,"b0"])
mean(m)

#8###


####Honnors11####

library("rjags")

setwd("F:/Dropbox/code/R/Curso")
dat <- read.csv(file="caller.csv",head=TRUE,sep=",")
head(dat)

#pairs(dat)
#boxplot(dat)
#boxplot(dat$calls, xlab="calls")
#hist(dat$calls, 30, xlab="calls")
#boxplot(dat$isgroup2)
#plot(dat$calls/dat$days_active, dat$isgroup2)
#plot(dat$calls, dat$isgroup2)

#modelo original-------------------

mod_string = " model {
	for (i in 1:length(calls)) {
		calls[i] ~ dpois(lam[i])
		log(lam[i]) = b0 + b1*age[i] + b2*days_active[i] + b3*isgroup2[i]
	}

    b0 ~ dnorm(0.0, 1.0/1e2)
    b1 ~ dnorm(0.0, 1.0/1e2)
    b2 ~ dnorm(0.0, 1.0/1e2)
    b3 ~ dnorm(0.0, 1.0/1e2)
} "


data_jags = as.list(dat)

params = c("b0", "b1", "b2", "b3")

mod = jags.model(textConnection(mod_string), 
                 data=data_jags, 
                 n.chains=3)

update(mod, 1e3)

mod_sim = coda.samples(model=mod,
                        variable.names=params,
                        n.iter=5e3)
mod_csim = as.mcmc(do.call(rbind, mod_sim))

## convergence diagnostics
#plot(mod_sim)

#gelman.diag(mod_sim)
#autocorr.diag(mod_sim)
#autocorr.plot(mod_sim)
#effectiveSize(mod_sim)

## compute DIC
dic = dic.samples(mod, n.iter=1e3)
dic

#summary(mod_sim)
#head(mod_csim)
#mean(mod_csim[,"b0"]>0)
#m <- (mod_csim[,"b0"]>0)/(mod_csim[,"b0"])
#mean(m)

#modelo deste-------------------

#ex 1

pm_coef = colMeans(mod_csim)
#log(lam[i]) = b0 + b1*age[i] + b2*days_active[i] + b3*isgroup2[i]
pm_coef
pm_coef[4]
#prob <- 1/(1+exp(-(pm_coef[1]+pm_coef[2]*29 + pm_coef[3]*30 + pm_coef[4]*1)))

lam <- exp(pm_coef[1]+pm_coef[2]*29 + pm_coef[3]*30 + pm_coef[4]*1)
lam
l <- 30*lam
l

1-ppois(3, l)

r <- density(rpois(1e3,40))
plot(r)
