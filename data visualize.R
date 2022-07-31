# data visuallize
## treemap  -> 두개 변수
library(treemap)
data("GNI2014")
head(GNI2014)
treemap(GNI2014,
        index=c("continent", "iso3"), #계층구조 설정(대륙-국가)
        vSize = "population",  # 타일크기
        vColor = "GNI",  # 타일 컬러
        type = "value",  # 타일 컬러링 방법
        bg.labels = "yellow",  # 레이블 배경색
        title = "world's GNI")

library(treemap)
st <- data.frame(state.x77)
st<- data.frame(st, stname = rownames(st))
head(st)
treemap(st,
        index = c("stname"),
        vSize="Area",
        vColor = "Income",
        type = "value",
        title="usa states area and income")
### 알래스카가 가장 넓으면서 소득도 가장 높다
treemap(st,
        index = c("stname"),
        vSize="Income",
        vColor = "Life.Exp",
        type = "value",
        title="usa states income and Life.Exp")
### 알레스카가 가장 소득이 높으나 삶 만족도가 높은편이다
## bubble chart  -> 3개 변수
st <- data.frame(state.x77)
symbols(st$Illiteracy, st$Murder,  # 원의 x,y좌표의 열
        circles = st$Population,  # 원의 반지름 열
        inches = 0.3,  # 원의 크기 조절값
        fg="white",  # 원의 테두리 색
        bg = "lightgray",  # 원의 바탕색
        lwd=1.5,  # 원의 테두리 두께
        xlab = "rate of Illiteracy",
        ylab = "murder rate",
        main = "Illiteracy and Crime")
text(st$Illiteracy, st$Murder,  # 출력될 x,y 좌표
     rownames(st),  # 출력할 텍스트
     cex = 0.6,  # 폰트 크기
     col="brown")  # 폰트 컬러
### 원의 위치를 관찰했을때 문맹률이 높아질수록 범죄율이 높아진다
### 원의 크기를 보았을때 인구수가 많은 주가 대체로 범죄율이 높다
## mosaic plot
head(mtcars)
mosaicplot(~gear+vs, data=mtcars, color=TRUE,  #x축y축 
           main= "gear and vs")