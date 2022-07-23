data("longley")
attach(longley)
y = longley$GNP
x1 = longley$Unemployed
x2 = longley$Population
x3 = longley$Armed.Forces
mydata = data.frame(y,x1,x2,x3)
fit = lm(y~x1+x2+x3, data=mydata)
summary(fit)
fit1 = lm(y~x1+x2+x3, data=mydata)
fit2 = lm(y~x1+x2)
anova(fit1,fit2)
#단계별 회귀
library(MASS)
fit = lm(y~x1+x2+x3, data=mydata)
step = stepAIC(fit, direction = "both")
step$anova
#모든 가능한 회귀
library(leaps)
ls = regsubsets(y~x1+x2+x3, data=mydata,nbest=7)
summary(ls)
x = cbind(x1,x2,x3)
lp = leaps(x,y, method="Cp")
lp

