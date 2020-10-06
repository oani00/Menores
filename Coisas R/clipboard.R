read.excel <- function(header=TRUE,...) {
  read.table("clipboard",sep="\t",header=header,...)
}
 
dat <- read.excel()
dat
dat[-c(1:6,9), ]

dat2 <- as.data.frame(dat[-c(1:6,8,9,14,15), , drop=FALSE])
dat2


dat3 <- as.numeric(as.character(dat2$N.de.participantes))

boxplot(dat3)

mean(dat3)
sd(dat3)


mean(dat3)


boxplot(dat2$N.de.participantes)
boxplot(as.integer(dat2))

