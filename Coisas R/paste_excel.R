#sssssss---------------------

read.excel <- function(header=TRUE,...) {
  read.table("clipboard",sep="\t",header=header,...)
}
 
dat=read.excel()

dat
summary(dat)
