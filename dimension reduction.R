#2차원축소
library(Rtsne)
library(ggplot2)
ds <- iris[,-5]
##중복제거
dup = which(duplicated(ds))
dup
ds <- ds[-dup,]
ds.y <- iris$Species[-dup]
##실행
tsne<-Rtsne(ds, dims=2, perplexity=10)  # (데이터, 차원, 샘플수)
## 축소결과 시각화
df.tsne <- data.frame(tsne$Y)
head(df.tsne)
ggplot(df.tsne, aes(x=X1, y=X2, color=ds.y))+
  geom_point(size=2)

tsne<-Rtsne(ds, dims=3, perplexity=10)  # (데이터, 차원, 샘플수)
## 축소결과 시각화
df.tsne <- data.frame(tsne$Y)
head(df.tsne)
ggplot(df.tsne, aes(x=X1, y=X2, color=ds.y))+
  geom_point(size=2)

# 3차원으로 축소
library("car")
library(Rtsne)
library("rgl")
library("mgcv")
tsne <- Rtsne(ds, dims=3, perplexity=10)
df.tsne <- data.frame(tsne$Y)
head(df.tsne)
## 회귀면이 있는경우
scatter3d(x=df.tsne$X1, y=df.tsne$X2, z=df.tsne$X3)
## 회귀면이 없는경우
points <- as.integer(ds.y)
color <- c('red', 'green', 'blue')
scatter3d(x=df.tsne$X1, y=df.tsne$X2, z=df.tsne$X3,
          point.col = color[points],
          surface=FALSE)
