data("stackloss")
stackloss
attach(stackloss)
#1.find variance-covariance matrix for 4 variables
V1 = var(stackloss)
V1
Cov1=cov(stackloss)
Cov1
#2.get correlation matrix from covariance matrix
Cor1 = cor(stackloss)
Cor1
#3.reduce variables to 3(remove stack.loss)
stackloss_2 = stackloss[,-4]
stackloss_2
#4.find variance-covariance matrix for 3 variables
Cov2=cov(stackloss_2)
Cov2
#5.get correlation matrix from covariance matrix
Cor2=cor(stackloss_2)
Cor2
#6.perform PCA(princomp) by using covariance matrix
Eigen = eigen(Cov2)
Eigen
Eigen$vectors %*% diag(Eigen$values) %*% t(Eigen$vectors)
stackloss_2_pca = princomp(stackloss_2, cor=F)
stackloss_2_pca
stackloss_2_pca$sdev
stackloss_2_pca$loadings
stackloss_2_pca$center
stackloss_2_pca$scale
stackloss_2_pca$n.obs
stackloss_2_pca$scores
stackloss_2_pca$call
summary(stackloss_2_pca)
#7.perform PCA(princomp) by using correlation matrix
stackloss_2_pca2 = princomp(stackloss_2, cor=T)
stackloss_2_pca2
summary(stackloss_2_pca2)
#8.compare the two results
#9.perform PCA(prcomp) by using covariance matrix
stackloss_2.pca = prcomp(stackloss_2, center = T, scale. = T)
stackloss_2.pca
stackloss_2.pca$sdev
stackloss_2.pca$rotation
stackloss_2.pca$center
stackloss_2.pca$scale
summary(stackloss_2.pca)
#10.perform PCA(prcomp) by using correlation matrix
stackloss_2.pca2=prcomp(Cor2, center = T, scale. = T)
stackloss_2.pca2
summary(stackloss_2.pca2)
#11.compare the two results
#12.compare the results of 6&9
#13.compare the results of 7&11
