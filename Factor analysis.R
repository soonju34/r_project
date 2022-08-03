#데이터 읽기
med.data <- read.table("C:/Users/user/medFactor.txt", header=T)
head(med.data)
summary(med.data)
library(psych)
library(GPArotation)
med.factor <- principal(med.data, rotate="none")
names(med.factor)
#values, call, loadings, residual, factors, scores중요
med.factor$values
plot(med.factor$values, type="b")
#1 이상인값이 3개이므로 3개 선택
med.Varimax = principal(med.data, nfactors = 3, rotate="varimax")
med.Varimax
# h2-> 공통성(>0.3) u2-> 고유분산 
# proportion var -> 0.22+0.19+0.14 -> 55%설명한다고 해석
# RC1->  lung, liver, kidney, heart
# RC2-> stamina, stretch, blow, urine
# RC3-> skeleton, muscle
## RC1-> 신체장기 RC2-> 인체기능 RC3-> 근육골계
biplot(med.Varimax)
med.Varimax = principal(med.data, nfactors = 2, rotate = "varimax")
biplot(med.Varimax)
