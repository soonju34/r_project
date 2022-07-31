# 막대그래프
library(ggplot2)
month <- c(1,2,3,4,5,6)
rain <- c(55,40,45,50,60,80)
df <- data.frame(month, rain)
df
ggplot(df, aes(x=month, y=rain))+  
  geom_bar(stat='identity',  #y축에 해당하는 열의 값
           width = 0.7,  # 폭지정
           fill = 'steelblue')  #색지정

#히스토그램
library(ggplot2)
iris
ggplot(iris, aes(x=Petal.Length))+
  geom_histogram(binwidth = 0.5)
## 그룹별 히스토그램 작성
library(ggplot2)
ggplot(iris, aes(x=Sepal.Width, fill=Species, color=Species))+
  geom_histogram(binwidth=0.5, position='dodge')+
  theme(legend.position = 'top')

# 산점도
library(ggplot2)
ggplot(data = iris, aes=(x=Petal.Length, y=Petal.Width))+
  geom_point()
## 그룹이 구별되는 산점도
library(ggplot2)
data("iris")
head(iris)
ggplot(data=iris, aes=(x=Petal.Length, y=Petal.Width,color=Species)) +
  geom_point(size=3) +
  ggtitle("꽃잎의 길이 폭")+
  theme(plot.title = element_text(size=25, face="bold", colour = "steelblue"))

# 선그래프
library(ggplot2)
year <- 1937: 1960
cnt <- as.vector(airmiles)
df <- data.frame(year, cnt)
head(df)
ggplot(data=df, aes(x=year,y=cnt))+
  geom_line(col="red")
