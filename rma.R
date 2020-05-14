rma.df<-read.csv("./분산분석/분산분석/반복측정분산분석/반복측정분산분석.csv", header=TRUE, na.strings= "."); str(rma.df) 
rma.matrix <- as.matrix(rma.df[-1]); rma.matrix
rma.model.lm<-lm(rma.matrix~ 1) 
time.f<-factor(c("사전","3개월","6개월"))
options(contrasts=c("contr.sum", "contr.poly"))
rma.result.mt <-Anova(rma.model.lm,
                      idata=data.frame(time.f), 
                      idesign=~time.f, type="III") 
summary(rma.result.mt, multivariate=F)

rma.df <- data.frame(id = c(1:18), time = rep(1:3, each = 6),concentration = c(rma.df$pre, rma.df$after3M, rma.df$after6M)); str(rma.df)
rma.df$time<-factor(rma.df$time, levels=c(1:3), labels=c("사전","3개월","6개월")); str(rma.df)
library(multcomp)
result.lm<-lm(concentration ~ time, data=rma.df)
tukey.result<-glht(result.lm, linfct=mcp(time='Tukey'))
summary(tukey.result) 
plot(tukey.result)
                           