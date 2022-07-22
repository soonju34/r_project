A = matrix(c(3,1, -1,5, 2,4), nc=3)
A
#전치행렬
tA=t(A)
tA
#두벡터 사이의 각 구하기기
a = c(1,-2,3)
b = c(2,2,4)
t(a) *b
t(a) %*% b
la = sqrt(t(a)%*%a) # a길이
la
lb = sqrt(t(b)%*%b) # b길이
lb
cos_theta = t(a)%*%b/(la*lb)
cos_theta
#행렬의 계수
library(Matrix)
a = matrix(c(3,1, -1,5, 2,4), nc=3)
a
rankMatrix(a)
#행렬 결정식
a = matrix(c(1,3, 3,5), nc=2)
det(a)
#역행렬
library(MASS)
A = matrix(c(1,3, 2,5), nc=2)
ginv(A)
solve(A)
#고유값 고유벡터
a = matrix(c(4,2, -5,-3),nc=2)
lambda = eigen(a)
lambda
lambda$values
lambda$vectors[,1]
sum(diag(a))
#스펙트럼 분해
a = matrix(c(4,0,-2, 0,1,0, -2,0,1), nc=3)
a
eig = eigen(a)
eig
u = eig$vectors
d = eig$values
u %*% diag(d) %*% t(u)   # == a
