#0.데이터 불러오기
install.packages("readxl")
library(readxl)
getwd()
setwd("C:/Users/LENOVO/Documents/R_project")
A<-read_excel("data_drill.xlsx")
A
attach(A)
#1.find variance-covariance matrix for 4 variables
Cov1=cov(A)
Cov1
#2.get correlation matrix from covariance matrix
Cor1=cor(A)
Cor1
#3.reduce variables to 3(remove last variables)
A2 = A[,-1]
A2
#4.find variance-covariance matrix ofr 3 variables
Cov2 = cov(A2)
Cov2
#5.get correlation matrix from covariance matrix
Cor2 = cor(A2)
Cor2
#6.perform PCA(princomp) by using covariance matrix
Eigen =eigen(Cov2)
Eigen
Eigen$vectors %*% diag(Eigen$values) %*% t(Eigen$vectors)
A2_pca = princomp(A2, cor=F)
A2_pca
summary(A2_pca)
A2_pca$sdev
A2_pca$loadings
A2_pca$center
A2_pca$scale
A2_pca$n.obs
A2_pca$scores
A2_pca$call
#7.perform PCA(pricomp) by using correlation matrix
A2_pca2 = princomp(A2, cor=T)
A2_pca2
summary(A2_pca2)
#9.perform PCA(prcomp) by using covariance matrix
A2.pca=prcomp(A2, center=T, scale. = T)
A2.pca
summary(A2.pca)
A2.pca$sdev
A2.pca$rotation
A2.pca$center
A2.pca$scale
#10.perform PCA(prcomp) by using correlation matrix
A2.pca2=prcomp(Cor2, center = T, scale. = T)
A2.pca2
summary(A2.pca2)
