#다중회귀
data("airquality")
airquality[1:2, ]
pairs(airquality[,1:4], panel=panel.smooth) #산점도행렬
lm.a = lm(Ozone~Solar.R+Wind+Temp,data=airquality) #회귀모형
  summary(lm.a)
lm.ab = lm(log(Ozone)~Solar.R+Wind+Temp,data=airquality) #log(반응변수) 회귀모형
  summary(lm.ab)
op=par(mfrow=c(1,2))
plot(fitted(lm.a),residuals(lm.a), xlab="fitted", ylab="residual") # 잔차분포
plot(fitted(lm.ab),residuals(lm.ab), xlab="fitted", ylab="residual")
  abline(h=0)
par(op)  
shapiro.test(residuals(lm.a))  # 잔차정규성 검정
shapiro.test(residuals(lm.ab))

library(lmtest) #잔차 독립성 검정(durbin-watson검정)
dwtest(Ozone~Solar.R+Wind+Temp,data=na.omit(airquality))
dwtest(log(Ozone)~Solar.R+Wind+Temp,data=na.omit(airquality))
#신뢰영역역
lm.ab = lm(log(Ozone)~Solar.R+Wind+Temp, data=airquality)
confint(lm.ab) #95%
coef(lm.ab) #parameter coeff
library(ellipse)
op=par(mfrow=c(1,3))
plot(ellipse(lm.ab,c(1,3)),type="l") # 95%tlsfhlduddur
  points(coef(lm.ab)[2], coef(lm.ab)[3],pch=18)
  abline(v=confint(lm.ab)[2,],lty=2)
  abline(h=confint(lm.ab)[3,],lty=2)
plot(ellipse(lm.ab,c(2,4)), type="l")  
  points(coef(lm.ab)[2], coef(lm.ab)[4],pch=18)
plot(ellipse(lm.ab,c(3,4)), type="l")  
  points(coef(lm.ab)[3], coef(lm.ab)[4],pch=18)
par(op)  
x0 = data.frame(Solar.R=17.0, Wind=8, Temp=70, Month=0, Day=0)
x0
predict(lm.ab, x0, interval="confidence")
predict(lm.ab, x0, interval="prediction")
conf = predict(lm.ab, airquality, interval="confidence")
#다항회귀모형
library(faraway)
data(corrosion)
attach(corrosion)
gF = lm(loss~Fe, corrosion) #1차 선형회귀모형
summary(gF)
plot(Fe, loss)
gp3 = lm(loss~Fe+I(Fe^2)+I(Fe^3),corrosion) #3차 다항회귀모형
summary(gp3)
grid = seq(0,2,length=50)
plot(loss~Fe, ylim=c(60,150))
lines(grid, predict(gp3, data.frame(Fe=grid)))

gp5 = lm(loss~Fe+I(Fe^2)+I(Fe^3)+I(Fe^4)+I(Fe^5),corrosion) #5차 다항회귀모형
summary(gp5)
grid = seq(0,2,length=50)
plot(loss~Fe, ylim=c(60,150))
lines(grid, predict(gp5, data.frame(Fe=grid)))
