#### Lição 9 ####


library("rjags")
library("coda")
library("MASS")
data("OME")
?OME # background on the data
head(OME)

any(is.na(OME)) # check for missing values
dat = subset(OME, OME != "N/A") # manually remove OME missing values identified with "N/A"
dat$OME = factor(dat$OME)
str(dat)

plot(dat$Age, dat$Correct / dat$Trials )
plot(dat$OME, dat$Correct / dat$Trials )
plot(dat$Loud, dat$Correct / dat$Trials )
plot(dat$Noise, dat$Correct / dat$Trials )

#Next, we'll fit a reference logistic regression model with ####
#noninformative prior in R.

mod_glm = glm(Correct/Trials ~ Age + OME + Loud + Noise, 
              data=dat, weights=Trials, family="binomial")
summary(mod_glm)

plot(residuals(mod_glm, type="deviance"))
plot(fitted(mod_glm), dat$Correct/dat$Trials)


#Next, we will fit a similar model in JAGS.####

X = model.matrix(mod_glm)[,-1] # -1 removes the column of 1s for the intercept
head(X)

#Use 
#3 chains 
#at least 5,000 iterations in each.


mod1_string = " model {
	for (i in 1:length(y)) {
		y[i] ~ dbin(phi[i], n[i])
		logit(phi[i]) = b0 + b[1]*Age[i] + b[2]*OMElow[i] + b[3]*Loud[i] + b[4]*Noiseincoherent[i]
	}
	
	b0 ~ dnorm(0.0, 1.0/5.0^2)
	for (j in 1:4) {
		b[j] ~ dnorm(0.0, 1.0/4.0^2)
	}
	
} "

data_jags = as.list(as.data.frame(X))
data_jags$y = dat$Correct # this will not work if there are missing values in dat (because they would be ignored by model.matrix). Always make sure that the data are accurately pre-processed for JAGS.
data_jags$n = dat$Trials
str(data_jags) # make sure that all variables have the same number of observations (712).

params = c("b0", "b") #mudei p/ b0

mod1 = jags.model(textConnection(mod1_string), 
                  data=data_jags, 
                  n.chains=3)

update(mod1, 1e3)

mod1_sim = coda.samples(model=mod1,
                        variable.names=params,
                        n.iter=5e3)
mod1_csim = as.mcmc(do.call(rbind, mod1_sim))

summary(mod1_sim)
summary(mod1_csim)


## convergence diagnostics
plot(mod1_sim, ask=TRUE)

gelman.diag(mod1_sim)
autocorr.diag(mod1_sim)
autocorr.plot(mod1_sim)
effectiveSize(mod1_sim)
raftery.diag(mod1_sim) #incluido


## calculate DIC
dic1 = dic.samples(mod1, n.iter=1e3)

#Parte da predicao

pm_coef = colMeans(mod1_csim)

pm_coef[5]

prob <- 1/(1+exp(-(pm_coef[5]+pm_coef[1]*60 + pm_coef[2]*0 + pm_coef[3]*50 + pm_coef[4]*0)))
prob



#### Lição 11 B ####

library("rjags")
library("coda")
library("MASS")
data("OME")

dat = subset(OME, OME != "N/A")
dat$OME = factor(dat$OME) # relabel OME
dat$ID = as.numeric(factor(dat$ID)) # relabel ID so there are no gaps in numbers (they now go from 1 to 63)

## Original reference model and covariate matrix
mod_glm = glm(Correct/Trials ~ Age + OME + Loud + Noise, data=dat, weights=Trials, family="binomial")
X = model.matrix(mod_glm)[,-1]

## Original model (that needs to be extended)------
mod_string = " model {
	for (i in 1:length(y)) {
		y[i] ~ dbin(phi[i], n[i])
		logit(phi[i]) = b0 + b[1]*Age[i] + b[2]*OMElow[i] + b[3]*Loud[i] + b[4]*Noiseincoherent[i]
	}
	
	b0 ~ dnorm(0.0, 1.0/5.0^2)
	for (j in 1:4) {
		b[j] ~ dnorm(0.0, 1.0/4.0^2)
	}
	
} "

data_jags = as.list(as.data.frame(X))
data_jags$y = dat$Correct
data_jags$n = dat$Trials
data_jags$ID = dat$ID

#rodar

params = c("b0", "b") 

mod = jags.model(textConnection(mod_string), 
                  data=data_jags, 
                  n.chains=3)

update(mod, 1e3)

mod1_sim = coda.samples(model=mod,
                        variable.names=params,
                        n.iter=5e3)
mod1_csim = as.mcmc(do.call(rbind, mod1_sim))

summary(mod1_sim)
summary(mod1_csim)

#conv diags

plot(mod1_sim)

gelman.diag(mod1_sim)
autocorr.diag(mod1_sim)
effectiveSize(mod1_sim)

#dic, chamei de dic2 para comparar
dic2 = dic.samples(mod, n.iter=1e3)
dic2


## referencia ------

mod_string = " model {
  for (i in 1:length(y)) {
    y[i] ~ dnorm(mu[i], prec)
    mu[i] = a[region[i]] + b[1]*log_income[i] + b[2]*is_oil[i]
  }
  
  for (j in 1:max(region)) {
    a[j] ~ dnorm(a0, prec_a)
  }
  
  a0 ~ dnorm(0.0, 1.0/1.0e6)
  prec_a ~ dgamma(1/2.0, 1*10.0/2.0)
  tau = sqrt( 1.0 / prec_a )
  
  for (j in 1:2) {
    b[j] ~ dnorm(0.0, 1.0/1.0e6)
  }
  
  prec ~ dgamma(5/2.0, 5*10.0/2.0)
  sig = sqrt( 1.0 / prec )
} "

## modelo meu ------

mod2_string = " model {
	for (i in 1:length(y)) {
		y[i] ~ dbin(phi[i], n[i])
		logit(phi[i]) = a[ID[i]] + b[1]*Age[i] + b[2]*OMElow[i] + b[3]*Loud[i] + b[4]*Noiseincoherent[i]
	}
	
	for (j in 1:max(ID)) {
    a[j] ~ dnorm(a0, prec_a)
  }
  
  a0 ~ dnorm(0.0, 1.0/1.0e6)
  prec_a ~ dgamma(1/2.0, 1*10.0/2.0)
  tau = sqrt( 1.0 / prec_a )




	for (j in 1:4) {
		b[j] ~ dnorm(0.0, 1.0/4.0^2)
	}
	
} "


data_jags = as.list(as.data.frame(X))
data_jags$y = dat$Correct
data_jags$n = dat$Trials
data_jags$ID = dat$ID

#rodar####

params = c("a", "b")

mod2 = jags.model(textConnection(mod2_string), 
                  data=data_jags, 
                  n.chains=3)

update(mod2, 1e3)

mod2_sim = coda.samples(model=mod,
                        variable.names=params,
                        n.iter=5e3)
mod2_csim = as.mcmc(do.call(rbind, mod2_sim))

summary(mod2_sim)
summary(mod2_csim)

#conv diags

plot(mod2_sim)

gelman.diag(mod2_sim)
autocorr.diag(mod2_sim)
effectiveSize(mod2_sim)

#dic, chamei de dic3 para comparar
dic3 = dic.samples(mod2, n.iter=1e3)
dic3
dic2
