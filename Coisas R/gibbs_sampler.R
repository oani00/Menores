#The full conditional for ??, given ??2 and data is

update_mu = function(n, ybar, sig2, mu_0, sig2_0) {
  sig2_1 = 1.0 / (n / sig2 + 1.0 / sig2_0)
  mu_1 = sig2_1 * (n * ybar / sig2 + mu_0 / sig2_0)
  rnorm(n=1, mean=mu_1, sd=sqrt(sig2_1))
}

#The full conditional for ??2 given ?? and data is

update_sig2 = function(n, y, mu, nu_0, beta_0) {
  nu_1 = nu_0 + n / 2.0
  sumsq = sum( (y - mu)^2 ) # vectorized
  beta_1 = beta_0 + sumsq / 2.0
  out_gamma = rgamma(n=1, shape=nu_1, rate=beta_1) # rate for gamma is shape for inv-gamma
  1.0 / out_gamma # reciprocal of a gamma random variable is distributed inv-gamma
}

#With functions for drawing from the full conditionals, 
#we are ready to write a function to perform Gibbs sampling.

gibbs = function(y, n_iter, init, prior) {
  ybar = mean(y)
  n = length(y)
  
  ## initialize
  mu_out = numeric(n_iter)
  sig2_out = numeric(n_iter)
  
  mu_now = init$mu
  
  ## Gibbs sampler
  for (i in 1:n_iter) {
    sig2_now = update_sig2(n=n, y=y, mu=mu_now, nu_0=prior$nu_0, beta_0=prior$beta_0)
    mu_now = update_mu(n=n, ybar=ybar, sig2=sig2_now, mu_0=prior$mu_0, sig2_0=prior$sig2_0)
    
    sig2_out[i] = sig2_now
    mu_out[i] = mu_now
  }
  
  cbind(mu=mu_out, sig2=sig2_out)
}

## Now we are ready to set up the problem in R.(do curso) ####

y = c(1.2, 1.4, -0.5, 0.3, 0.9, 2.3, 1.0, 0.1, 1.3, 1.9)
ybar = mean(y)
n = length(y)

## prior
prior = list()
prior$mu_0 = 0.0
prior$sig2_0 = 1.0
prior$n_0 = 2.0 # prior effective sample size for sig2
prior$s2_0 = 1.0 # prior point estimate for sig2
prior$nu_0 = prior$n_0 / 2.0 # prior parameter for inverse-gamma
prior$beta_0 = prior$n_0 * prior$s2_0 / 2.0 # prior parameter for inverse-gamma

hist(y, freq=FALSE, xlim=c(-1.0, 3.0)) # histogram of the data
curve(dnorm(x=x, mean=prior$mu_0, sd=sqrt(prior$sig2_0)), lty=2, add=TRUE) # prior for mu
points(y, rep(0,n), pch=1) # individual data points
points(ybar, 0, pch=19) # sample mean

#Finally, we can initialize and run the sampler!

set.seed(53)

init = list()
init$mu = 0.0

post = gibbs(y=y, n_iter=1e3, init=init, prior=prior)

head(post)

#deveria dar ###

##             mu      sig2
## [1,] 0.3746992 1.5179144
## [2,] 0.4900277 0.8532821
## [3,] 0.2536817 1.4325174
## [4,] 1.1378504 1.2337821
## [5,] 1.0016641 0.8409815
## [6,] 1.1576873 0.7926196


library("coda")
plot(as.mcmc(post))
summary(as.mcmc(post))

#deveria dar ###
## 
## Iterations = 1:1000
## Thinning interval = 1 
## Number of chains = 1 
## Sample size per chain = 1000 
## 
## 1. Empirical mean and standard deviation for each variable,
##    plus standard error of the mean:
## 
##        Mean     SD Naive SE Time-series SE
## mu   0.9051 0.2868  0.00907        0.00907
## sig2 0.9282 0.5177  0.01637        0.01810
## 
## 2. Quantiles for each variable:
## 
##        2.5%    25%    50%   75% 97.5%
## mu   0.3024 0.7244 0.9089 1.090 1.481
## sig2 0.3577 0.6084 0.8188 1.094 2.141

## Agora nosso exercício (ex 7!####

y = c(-0.2, -1.5, -5.3, 0.3, -0.8, -2.2)
ybar = mean(y)
n = length(y)

## prior
prior = list()
prior$mu_0 = 0.0
prior$sig2_0 = 1.0
prior$n_0 = 2.0 # prior effective sample size for sig2
prior$s2_0 = 1.0 # prior point estimate for sig2
prior$nu_0 = prior$n_0 / 2.0 # prior parameter for inverse-gamma
prior$beta_0 = prior$n_0 * prior$s2_0 / 2.0 # prior parameter for inverse-gamma

hist(y, freq=FALSE, xlim=c(-1.0, 3.0)) # histogram of the data
curve(dnorm(x=x, mean=prior$mu_0, sd=sqrt(prior$sig2_0)), lty=2, add=TRUE) # prior for mu
points(y, rep(0,n), pch=1) # individual data points
points(ybar, 0, pch=19) # sample mean

#Finally, we can initialize and run the sampler!

set.seed(53)

init = list()
init$mu = 0.0


#Do exemplo
#post = gibbs(y=y, n_iter=1e3, init=init, prior=prior)
post = gibbs(y=y, n_iter=5000, init=init, prior=prior) #Note que para esse exerciico n_iter = 5000

##Se quiser saber o inicio dos valores
#head(post)


library("coda")
plot(as.mcmc(post))
summary(as.mcmc(post))

## Agora (ex 8)####

y = c(-0.2, -1.5, -5.3, 0.3, -0.8, -2.2)
ybar = mean(y)
n = length(y)

## prior
prior = list()


prior$mu_0 = 1.0 #########Mudei aqui
prior$sig2_0 = 1.0 #########Aqui não Mudei


prior$n_0 = 2.0 # prior effective sample size for sig2
prior$s2_0 = 1.0 # prior point estimate for sig2
prior$nu_0 = prior$n_0 / 2.0 # prior parameter for inverse-gamma
prior$beta_0 = prior$n_0 * prior$s2_0 / 2.0 # prior parameter for inverse-gamma

hist(y, freq=FALSE, xlim=c(-1.0, 3.0)) # histogram of the data
curve(dnorm(x=x, mean=prior$mu_0, sd=sqrt(prior$sig2_0)), lty=2, add=TRUE) # prior for mu
points(y, rep(0,n), pch=1) # individual data points
points(ybar, 0, pch=19) # sample mean

#Finally, we can initialize and run the sampler!

set.seed(53)

init = list()
init$mu = 0.0


#Do exemplo
#post = gibbs(y=y, n_iter=1e3, init=init, prior=prior)
post = gibbs(y=y, n_iter=5000, init=init, prior=prior) #Note que para esse exerciico n_iter = 5000

##Se quiser saber o inicio dos valores
#head(post)


library("coda")
plot(as.mcmc(post))
summary(as.mcmc(post))

## Agora dados da bolsa####

#######trazer a data
## Set the working directory

setwd("F:/Dropbox/code/R")
data <- read.csv(file="ibov_mensal_1990.csv",head=TRUE,sep=",")

#######Fazer um subset para o range desejado

close <- data[161:301, c("Close")]

y = close
ybar = mean(y)
n = length(y)

## prior
prior = list()


prior$mu_0 = 1.0 #########Mudei aqui
prior$sig2_0 = 1.0 #########Aqui não Mudei


prior$n_0 = 2.0 # prior effective sample size for sig2
prior$s2_0 = 1.0 # prior point estimate for sig2
prior$nu_0 = prior$n_0 / 2.0 # prior parameter for inverse-gamma
prior$beta_0 = prior$n_0 * prior$s2_0 / 2.0 # prior parameter for inverse-gamma

hist(y, freq=FALSE, xlim=c(-1.0, 3.0)) # histogram of the data
curve(dnorm(x=x, mean=prior$mu_0, sd=sqrt(prior$sig2_0)), lty=2, add=TRUE) # prior for mu
points(y, rep(0,n), pch=1) # individual data points
points(ybar, 0, pch=19) # sample mean

#Finally, we can initialize and run the sampler!

set.seed(53)

init = list()
init$mu = 0.0


#Do exemplo
#post = gibbs(y=y, n_iter=1e3, init=init, prior=prior)
post = gibbs(y=y, n_iter=5000, init=init, prior=prior) #Note que para esse exerciico n_iter = 5000

##Se quiser saber o inicio dos valores
#head(post)


library("coda")
plot(as.mcmc(post))
summary(as.mcmc(post))

summary(as.mcmc(post))$mu

curve(dnorm(x, median(mean(post$mu), sd(sqrt(post$sig2)) ), col="blue", add=TRUE)
#####veja como nao ter que copiar na mao