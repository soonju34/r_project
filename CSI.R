install.packages("readxl")  #엑셀 읽어옴
install.packages("psych")   # 기술통계량 구축
install.packages("GPArotation")  # 
install.packages("MAtrix")   # 행렬
install.packages("read.csv")  # csv파일 읽어오기
install.packages("ade4")   
install.packages("nFactors")  #요인 수 (>1)
install.packages("gplots")  # 그래프
install.packages("RColorBrewer")  # 다양한 색구현
install.packages("semPlot")
install.packages("stringi")
install.packages("OpenMx")
library(readxl)
library(psych)
library(GPArotation)
library(Matrix)
library(nFactors)
library(gplots)
library(RColorBrewer)
library(OpenMx)
library(semPlot)
library(ade4)
CPI <- read.csv(file ="c:/data/CSI2.csv")
CPI
summary(CPI)
dim(CPI)
scree(CPI, factors = FALSE)
ml.factor <- factanal(CPI, factors = 3, rotation = "varimax", scores = "Bartlett")
ml.factor
names(ml.factor)
str(ml.factor)
ml.factor$correlation
ml.factor$loadings
ml.factor$converged
ml.factor$factors
ml.factor$scores
plot(ml.factor$scores)

#-----------------------------------------------------------------------------------
str(CPI)
names(CPI)
CPI
library(psych)
scree(CPI)

?nfactors
?nScree
nScree(CPI)
str(nScree(CPI))
?factanal

fa = factanal(CPI,factors=3,score="regression")
fa

fa$loadings

factor.plot(fa,labels = colnames(CPI),pos=4,title = "factor plot")
install.packages("gplots")
library(gplots)
library(RColorBrewer)
heatmap.2(abs(fa$loadings),col =brewer.pal(9,"Blues"),trace = "none",key = FALSE,dendrogram = "none",cexCol = 1.2,main = "Factor loadings")
?loadings
fa.scores =fa$scores
colnames(fa.scores) = c("Run","Throw"," 55")
names(fa)
fa.scores
CPI$score
factor.plot(fa)
heatmap.2(fa.scores,col=brewer.pal(9,"GnBu"),trace = "none",key =FALSE,dendrogram = "none",cexCol = 1.2,main = "Factor scores" )
#히트맵은 부차적인 것이며 그릴수 있다. 비쥬얼적 비쥬얼적

semPaths(fa,what="est",residuals=FALSE,cut=0.3,posCol=c("white","blue"),negCol=c("white","red"))