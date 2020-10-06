#### Code ####


library("rjags")
library("rjson")
library("jsonlite")
library("coda")

setwd("F:/Dropbox/code/R")

json <- stream_in(file("cards.collectible.json"))
DB <- as.data.frame(json)
DB2 <- DB[,c(2,4,8,10,11:18,20,22,23)]
hs <- subset(DB2, type == "MINION")
hs$race[is.na(hs$race)] <- "NEUTRAL"
hs$text[is.na(hs$text)] <- "NOTEXT"
names(DB)
names(DB2)
str(hs)
names(hs)
head(hs)
hs[20:30,]
DB3 <- hs[hs$text == "NOTEXT", ]
hs2 <- DB3[c(2,9,10)]
hs2$rarity <- as.factor(hs2$rarity)
names(hs2)
str(hs2)

pairs(hs2)




#### fit normal ####

#exploratorio


#FIT
#cost ~ rarity" "set"  "type" "mechanics" "attack" "health" "race"  "targetingArrowText" "overload" "spellDamage"

l <- lm(hs2$cost ~ + hs2$attack + hs2$health)
summary(l)
plot(l)
coeffs <- coefficients(l)
coeffs
cost <- coeffs[1] + coeffs[3]*0 +  coeffs[4]*1 + coeffs[6]*1
cost


# Simple Scatterplot

plot(hs$cost, hs$attack, main="Fit linear da mana da carta por ataque", 
  	xlab="custo ", ylab="ataque ", pch=19)


# Add fit lines
abline(l, col="red") # regression line (y~x) 
lines(lowess(hs$cost,hs$attack), col="blue") # lowess line (x,y)

length(hs$rarity)
str(hs$rarity)
r <- factor(hs$rarity)
str(r)
summary(r)


#string ------------------------------------

mod_string = " model {
  for (i in 1:length(y)) {
    y[i] ~ dnorm(mu[i], prec)
    mu[i] = b[1] + b[2]*attack[i] + b[3]*health[i]
  }
  
    for (j in 1:3) {
    b[j] ~ dnorm(0.0, 1.0)
  }
  
  prec ~ dgamma(1/2.0, 1)
  
} "

set.seed(666)
data_jags = list(y=hs2$cost, 
                 attack=hs2$attack,
                 health=hs2$health,
                 rarity=hs2$rarity)


params = c("b")

mod = jags.model(textConnection(mod_string), data=data_jags, n.chains=3)



#Run------------------------------------


mod = jags.model(textConnection(mod_string), data=data_jags, n.chains=3)

update(mod, 2e3)

mod_sim = coda.samples(model=mod,
                       variable.names=params,
                       n.iter=8000)

mod_csim = as.mcmc(do.call(rbind, mod_sim))



## convergence diagnostics--------------------

par(mar=c(1,1,1,1))
plot(mod_sim)

gelman.diag(mod_sim)
coda::gelman.plot(mod_sim)

autocorr.diag(mod_sim)
autocorr.plot(mod_sim)

effectiveSize(mod_sim)


set.seed(666)
post3 = mh(n=n, ybar=ybar, n_iter=500, mu_init=10.0, cand_sd=0.3)
coda::traceplot(as.mcmc(post3$mu))

summary(mod_csim)


#Check resids-------------------------

set.seed(666)

pm_params = colMeans(mod_csim) 
out <- pm_params[1] + pm_params[2]*hs2$attack + pm_params[3]*hs2$health
diff <- out - hs2$cost

summary(diff)
par(mfrow=c(1,2))
plot(diff)
hist(diff)



#### Referencias ####

###Data
#https://hearthstonejson.com/

###Agradecimentos
#https://stackoverflow.com