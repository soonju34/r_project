#상관계수
data(cars)
attach(cars)
cor(speed, dist)   # 상관계수
cor.test(speed, dist)  # 상관성 검정
#단순 선형회귀분석
library(lmtest)
x = c(1.9,0.8, 1.1, 0.1, -0.1, 4.4, 4.6, 1.6, 5.5, 3.4)
y = c(0.7,-1.0, -0.2,-1.2,-0.1,3.4,0.0,0.8,3.7,2.0)
out = lm(y~x) 
summary(out) # 회귀분석 결과 출력
plot(x,y) # 산점도
abline(out) # 추정된 회귀직선
#새로운 x값에서의 추정량 구하기
pred_y = predict(out, newdata=data.frame(x=2.3))
pred_y
pred_1 = predict(out, newdata=data.frame(x=c(1,2.2,5.7)))
pred_1
#simple linear regression
library(readxl)
book=read_xlsx("book.xlsx")
book.lm = lm(weight ~ 0+volumn, data=book)
summary(book.lm)
par(mfrow=c(2,2))
plot(book.lm)
#attributes()
attributes(book.lm)
book.lm$coefficients
book.lm$residuals
book.lm$fitted.values
#cars data
library(ggplot2)
data(cars)
head(cars)
a = lm(dist~speed,data=cars)
summary(a)
broom::glance(a)
broom::tidy(a)
ggplot(cars, aes(x=speed, y=dist))+
         geom_point(color='darkblue', size=3)+
         geom_smooth(method=lm, se=FALSE, fullrange=TRUE, color='black', size=1.2)+
         labs(x="speed(mph)", y="stopping distance(ft)")
par(mfrow=c(2,2))         
plot(a)         
#적합결여검정
getwd()
data = read_xlsx("ship.xlsx")
data
attach(data)
par(mfrow=c(1,2))
plot(X,Y,pch=19)
abline(lm(Y~X))
Reduced = lm(Y~X)
  summary(Reduced)
  anova(Reduced)  
Full= lm(Y~0+as.factor(X))
  summary(Full)
anova(Reduced, Full)  
