data("PlantGrowth")

library("rjags")
library("coda")

#-------JAGS com mudanças####
#-------Mudanças:
#Re-fit the JAGS model on plant growth from the lesson with 
#a separate variance for each of the three groups. 
#To do so, modify the model code to index the precision in 
#the normal likelihood by group, just as we did with the mean.
#Use the same priors as the original model (except in this 
#case it will be three independent priors for the variances).



mod_string = " model {
    for (i in 1:length(y)) {
        y[i] ~ dnorm(mu[grp[i]], prec[grp[i]])
    }
    
    for (j in 1:3) {
        mu[j] ~ dnorm(0.0, 1.0/1.0e6)
    }
    
    for (k in 1:3) {
        prec[k] ~ dgamma(5/2.0, 5*1.0/2.0)
    }

    
    sig = sqrt( 1.0 / prec )
} "

set.seed(82)
str(PlantGrowth)
data_jags = list(y=PlantGrowth$weight, 
              grp=as.numeric(PlantGrowth$group))

params = c("mu", "sig")

inits = function() {
    inits = list("mu"=rnorm(3,0.0,100.0), "prec"=rgamma(3,1.0,1.0))
}

mod2 = jags.model(textConnection(mod_string), data=data_jags, inits=inits, n.chains=3)
update(mod2, 1e3)

mod_sim = coda.samples(model=mod2,
                        variable.names=params,
                        n.iter=5e3)
mod_csim = as.mcmc(do.call(rbind, mod_sim)) # combined chains



summary(mod_sim)

dic2 <- dic.samples(mod2, n.iter=1e5)

#\/\/\/\/\/\/\/\/\/modelo novo\/\/\/\/\/\/\/\/






#-------original####



mod_string = " model {
    for (i in 1:length(y)) {
        y[i] ~ dnorm(mu[grp[i]], prec)
    }
    
    for (j in 1:3) {
        mu[j] ~ dnorm(0.0, 1.0/1.0e6)
    }
    
    prec ~ dgamma(5/2.0, 5*1.0/2.0)
    sig = sqrt( 1.0 / prec )
} "

set.seed(82)
str(PlantGrowth)
data_jags = list(y=PlantGrowth$weight, 
              grp=as.numeric(PlantGrowth$group))

params = c("mu", "sig")

inits = function() {
    inits = list("mu"=rnorm(3,0.0,100.0), "prec"=rgamma(1,1.0,1.0))
}

mod = jags.model(textConnection(mod_string), data=data_jags, inits=inits, n.chains=3)
update(mod, 1e3)

mod_sim = coda.samples(model=mod,
                        variable.names=params,
                        n.iter=5e3)
mod_csim = as.mcmc(do.call(rbind, mod_sim)) # combined chains



summary(mod_sim)

dic1 <- dic.samples(mod, n.iter=1e5)

#\/\/\/\/\/\/\/\/\/modelo velho\/\/\/\/\/\/\/\/

HPDinterval(mod_csim[,3]-mod_csim[,1])



#####Anova 2 way(licao)####

data("warpbreaks")
?warpbreaks
head(warpbreaks)


table(warpbreaks$wool, warpbreaks$tension)


boxplot(breaks ~ wool + tension, data=warpbreaks)

boxplot(log(breaks) ~ wool + tension, data=warpbreaks)


#----One-way model----

library("rjags")

mod1_string = " model {
    for( i in 1:length(y)) {
        y[i] ~ dnorm(mu[tensGrp[i]], prec)
    }
    
    for (j in 1:3) {
        mu[j] ~ dnorm(0.0, 1.0/1.0e6)
    }
    
    prec ~ dgamma(5/2.0, 5*2.0/2.0)
    sig = sqrt(1.0 / prec)
} "

set.seed(83)
str(warpbreaks)

data1_jags = list(y=log(warpbreaks$breaks), 
                  tensGrp=as.numeric(warpbreaks$tension))

params1 = c("mu", "sig")

mod1 = jags.model(textConnection(mod1_string), 
                  data=data1_jags, 
                  n.chains=3)

update(mod1, 1e3)

mod1_sim = coda.samples(model=mod1,
                        variable.names=params1,
                        n.iter=5e3)

## convergence diagnostics
plot(mod1_sim)

gelman.diag(mod1_sim)
autocorr.diag(mod1_sim)
effectiveSize(mod1_sim)

#Here are the results.

#summary(mod1_sim)


#Iterations = 1001:6000
#Thinning interval = 1 
#Number of chains = 3 
#Sample size per chain = 5000 

#1. Empirical mean and standard deviation for each variable,
#   plus standard error of the mean:

#        Mean      SD  Naive SE Time-series SE
#mu[1] 3.4998 0.13373 0.0010919      0.0010920
#mu[2] 3.2141 0.13652 0.0011147      0.0010664
#mu[3] 3.0116 0.13615 0.0011117      0.0011166
#sig   0.5732 0.05481 0.0004476      0.0004638

#2. Quantiles for each variable:

#        2.5%    25%    50%    75%  97.5%
#mu[1] 3.2334 3.4110 3.5003 3.5907 3.7632
#mu[2] 2.9429 3.1237 3.2137 3.3038 3.4796
#mu[3] 2.7405 2.9216 3.0111 3.1021 3.2784
#sig   0.4778 0.5344 0.5693 0.6083 0.6902


#---Two-way additive model------

X = model.matrix( ~ wool + tension, data=warpbreaks)
head(X)

#jags

mod2_string = " model {
    
    for( i in 1:length(y)) {
        y[i] ~ dnorm(mu[i], prec)
        mu[i] = int + alpha*isWoolB[i] + beta[1]*isTensionM[i] + beta[2]*isTensionH[i]
    }
    
      int ~ dnorm(0.0, 1.0/1.0e6)

      alpha ~ dnorm(0.0, 1.0/1.0e6)

      for (j in 1:2) {
         beta[j] ~ dnorm(0.0, 1.0/1.0e6)
      }
    
    prec ~ dgamma(3/2.0, 3*1.0/2.0)
    sig = sqrt(1.0 / prec)
} "

data2_jags = list(y=log(warpbreaks$breaks), isWoolB=X[,"woolB"], isTensionM=X[,"tensionM"], isTensionH=X[,"tensionH"])

params2 = c("int", "alpha", "beta", "sig")

mod2 = jags.model(textConnection(mod2_string), data=data2_jags, n.chains=3)
update(mod2, 1e3)

mod2_sim = coda.samples(model=mod2,
                        variable.names=params2,
                        n.iter=5e3)

## convergene diagnostics
plot(mod2_sim)

gelman.diag(mod1_sim)
autocorr.diag(mod1_sim)
effectiveSize(mod1_sim)

#Let's summarize the results, collect the DIC for this model, and compare it to the first one-way model.

summary(mod2_sim)












#####Anova 2 way(quiz)####

library("car")
data("Anscombe")
head(Anscombe)
?Anscombe

Xc = scale(Anscombe, center=TRUE, scale=TRUE)
str(Xc)

data_jags = as.list(data.frame(Xc))

library("JAGS")
library("rjags")
library("coda")
#library("rmutil")

head(data_jags)

#----modelo do outro quiz----

mod_string = " model {
    for (i in 1:length(education)) {
        education[i] ~ dnorm(mu[i], prec)
        mu[i] = b0 + b[1]*income[i] + b[2]*young[i] + b[3]*urban[i]
    }
    
    b0 ~ dnorm(0.0, 1.0/1.0e6)
    for (i in 1:3) {
        b[i] ~ dnorm(0.0, 1.0/1.0e6)
    }
    
    prec ~ dgamma(1.0/2.0, 1.0*1500.0/2.0)
    	## Initial guess of variance based on overall
    	## variance of education variable. Uses low prior
    	## effective sample size. Technically, this is not
    	## a true 'prior', but it is not very informative.
    sig2 = 1.0 / prec
    sig = sqrt(sig2)
} "

data_jags = as.list(Anscombe)

params1 = c("b", "sig")

inits1 = function() {
    inits = list("b"=rnorm(3,0.0,100.0), "prec"=rgamma(1,1.0,1.0))
}

mod1 = jags.model(textConnection(mod_string), data=data_jags, inits=inits1, n.chains=3)
update(mod1, 1000) # burn-in


#dic1 <- dic.samples(mod1, n.iter=1e5)
#dic1

mod1_sim = coda.samples(model=mod1,
                        variable.names=params1,
                        n.iter=5000)

summary(mod1_sim)


#         Mean      SD  Naive SE Time-series SE
#b[1]  0.08244 0.01082 8.837e-05       0.001119
#b[2]  0.82354 0.19801 1.617e-03       0.034694
#b[3] -0.11190 0.03830 3.128e-04       0.003095
#sig  27.60017 3.07363 2.510e-02       0.113111




#----modelo agora----

#Fit the model in JAGS using the 
   #Laplace prior with OK
   #variance 2 OK
   #for each of the three coefficients, and an OK
   #inverse gamma prior for the observation variance with 
   #effective sample size 1 
   #and prior guess 1.

#aliás
  #ddexp = laplace
  #dgamma(1/2, 1/2) (inverse gamma)

#definindo o laplace

ddexp = function(x, mu, tau) {
  0.5*tau*exp(-tau*abs(x-mu)) 
}
curve(ddexp(x, mu=0.0, tau=1.0), from=-5.0, to=5.0, ylab="density", main="Double exponential\ndistribution") # double exponential distribution
curve(dnorm(x, mean=0.0, sd=1.0), from=-5.0, to=5.0, lty=2, add=TRUE) # normal distribution
legend("topright", legend=c("double exponential", "normal"), lty=c(1,2), bty="n")


#https://d3c33hcgiwev3.cloudfront.net/_788f56b413be4c89c5a13d4b1faa2891_lesson_09.html?Expires=1526688000&Signature=LS8m4PqcWMj0f9xc0K6w0E-slY4gDOk9N~m~kdOfxrv2f~smZKKIJFbNJodUKxWQ~TKF~xxb~kN-9A16Whb3NQvmOxWH7ijzsM4~Z61a8jqz1r8-IG4atYLo~hZ4PDqrd403bAguLHRO6GcveHMdBbgUJFzvL0~K266Ytpx5KhM_&Key-Pair-Id=APKAJLTNE6QMUY6HBC5A

mod_string = " model {
    for (i in 1:length(education)) {
        education[i] ~ dnorm(mu[i], prec)
        mu[i] = b0 + b[1]*income[i] + b[2]*young[i] + b[3]*urban[i]
    }
    
    b0 ~ dnorm(0.0, 1.0/1.0e6)
    for (i in 1:3) {
        b[i] ~ ddexp(0.0, sqrt(2.0)) # has variance 1.0
    }
    
    prec ~ dgamma(1.0/2.0, 1.0*1500.0/2.0)
    	
    sig2 = 1.0 / prec
    sig = sqrt(sig2)
} "

data_jags = as.list(data.frame(Xc))

params1 = c("b", "sig")

inits1 = function() {
    inits = list("b"=rnorm(3,0.0,100.0), "prec"=rgamma(1,1.0,1.0))
}

mod1 = jags.model(textConnection(mod_string), 
                  data=data_jags, 
                  inits=inits1, 
                  n.chains=3)
update(mod1, 1000) # burn-in


#dic1 <- dic.samples(mod1, n.iter=1e5)
#dic1

mod1_sim = coda.samples(model=mod1,
                        variable.names=params1,
                        n.iter=5000)

summary(mod1_sim)

#        Mean     SD Naive SE Time-series SE
#b[1]  0.6253 0.8695 0.007100       0.012487
#b[2]  0.3060 0.7079 0.005780       0.007491
#b[3] -0.1026 0.8355 0.006822       0.012275
#sig   5.6653 0.5896 0.004814       0.005185

###############anterior
#         Mean      SD  Naive SE Time-series SE
#b[1]  0.08244 0.01082 8.837e-05       0.001119
#b[2]  0.82354 0.19801 1.617e-03       0.034694
#b[3] -0.11190 0.03830 3.128e-04       0.003095
#sig  27.60017 3.07363 2.510e-02       0.113111

## convergence diagnostics
plot(mod1_sim, ask=TRUE)

gelman.diag(mod1_sim)
autocorr.diag(mod1_sim)
autocorr.plot(mod1_sim)
effectiveSize(mod1_sim)
raftery.diag(mod1_sim) #incluido


r <- r?dexp(5e4, 0.0, 1.0/2.0)
lines(r)