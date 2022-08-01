library(ggmap)
register_google(key = 'AIzaSyBoOWhu4pcgkadYeWZ6C2KARNI626aNbkQ')
# 경도 위도 
gc <- geocode(enc2utf8(" 창원시 성산구"))
gc
cen <- as.numeric(gc)
gc
#cenet -> 지도 중심의 좌표값 지정
#zoom -> 확대크기 3(대륙)~21(건물), 기본값(10)도시
#maptype -> 'terrain(기본값)', 'roadmap', 'satellite', 'hybrid'
map <- get_googlemap(center=cen, zoom = 15, maptype = 'hybrid')
ggmap(map)

#경도 위도 입력 지도
library(ggmap)
register_google(key = 'AIzaSyBoOWhu4pcgkadYeWZ6C2KARNI626aNbkQ')
cen <- c(-118.245768, 34.0531)
map <- get_googlemap(center = cen)
ggmap(map)

#지도 위 중심에 마커 표시
library(ggmap)
register_google(key = 'AIzaSyBoOWhu4pcgkadYeWZ6C2KARNI626aNbkQ')
gc <- geocode(enc2utf8("서울"))
gc
cen <- as.numeric(gc)
map <- get_googlemap(center = cen, maptype = 'roadmap', marker = gc)
ggmap(map)

# 지도위 여러지점 마커
library(ggmap)
register_google(key = 'AIzaSyBoOWhu4pcgkadYeWZ6C2KARNI626aNbkQ')
names <- c("북한산국립공원","설악산국립공원","오대산국립공원","치악산국립공원","태백산국립공원")
gc <- geocode(enc2utf8(names))
df <- data.frame(name = names, lon = gc$lon, lat = gc$lat) # 지명이름, 경도, 위도가 포함된 데이터프레임 생성
cen <- c(mean(df$lon), mean(df$lat))
map <- get_googlemap(center = cen,
                     maptype = 'roadmap',
                     zoom = 8,
                     markers = gc)                # 지도 위에 각 위치마다 마커 표시
gmap <- ggmap(map)
gmap +                                            # '+' 기호를 이용하여 geom_text() 함수를 추가
  geom_text(data = df,
            aes(x = lon, y = lat),
            size = 5,
            label = df$name)                    # 지명 이름으로 라벨링
##(2)
library(ggmap)
register_google(key = 'AIzaSyBoOWhu4pcgkadYeWZ6C2KARNI626aNbkQ')
library(ggplot2)
names <- c("용두암", "성산일출봉", "정방폭포", "중문관광단지", "한라산1100고지")
addr <- c("제주시 용두암길 15",
          "서귀포시 성산읍 성산리",
          "서귀포시 동홍동 299-3",
          "서귀포시 중문동 2624-1",
          "서귀포시 색달동 산1-2")
gc <- geocode(enc2utf8(addr))
gc
df <- data.frame(name=names, lon=gc$lon, lat=gc$lat)
df
cen <- c(mean(df$lon), mean(df$lat))
map <- get_googlemap(center = cen, maptype = "roadmap",
                     zoom=10,
                     markers = gc)
gmap <- ggmap(map)
gmap +
  geom_text(data = df,
            aes(x=lon,y=lat),
            size=5,
            label=df$name)
##(3) 창원 가로수길 맛집(순피셜)
library(ggmap)
register_google(key = 'AIzaSyBoOWhu4pcgkadYeWZ6C2KARNI626aNbkQ')
library(ggplot2)
names <- c("홍콩집", "길촌어머니밥상", "토도스", "모리텐","돌돌솥", "하이파이브 아메리칸 다이너")
gc <- geocode(enc2utf8(names))
df <- data.frame(name=names, lon=gc$lon, lat=gc$lat)
df
cen <- c(mean(df$lon), mean(df$lat))
map <- get_googlemap(center=cen, maptype = "roadmap",
                     zoom=13, markers = gc)
gmap <- ggmap(map)
gmap + 
  geom_text(data=df,
            aes(x=lon,y=lat),
            size=3, label=df$name)
