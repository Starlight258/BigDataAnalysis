install.packages(dplyr)
library(dplyr)

#dim(cough)
#cat(cough[1,3])

#파일 읽기
cough22<-read.table("/Users/mae/Desktop/archive/4-1/bigdata/20221031/cough.csv", header=FALSE, sep=',', encoding="UTF-8", skip=1) #1행을 제외하고 파일 불러오기
asthma22<-read.table("/Users/mae/Desktop/archive/4-1/bigdata/20221031/asthma.csv", header=FALSE, sep=',', encoding="UTF-8", skip=1) #1행을 제외하고 파일 불러오기
dermatitis22<-read.table("/Users/mae/Desktop/archive/4-1/bigdata/20221031/dermatitis.csv", header=FALSE, sep=',', encoding="UTF-8", skip=1) #1행을 제외하고 파일 불러오기

#변수 만들기
new_cough2022 <- cough22 %>%
  mutate(V2 = as.numeric(V2)) %>% #V2열의 데이터타입을 숫자로
  group_by(V2) %>% #V2 열값을 기준으로 데이터를 그룹화
  summarise(V3 = sum(V3)) %>% #그룹화된 데이터의 V3열값을 합산하여 새로운 열로 만들기
  rename(시군구 = V2, 감기발생건수= V3)
print(new_cough2022, n=300)


new_asthma2022 <- asthma22 %>%
  mutate(V2 = as.numeric(V2)) %>% #V2열의 데이터타입을 숫자로
  group_by(V2) %>% #V2 열값을 기준으로 데이터를 그룹화
  summarise(V3 = sum(V3)) %>% #그룹화된 데이터의 V3열값을 합산하여 새로운 열로 만들기
  rename(시군구 = V2, 천식발생건수= V3)
print(new_asthma2022, n=300)


new_dermatitis2022 <- dermatitis22 %>%
  mutate(V2 = as.numeric(V2)) %>% #V2열의 데이터타입을 숫자로
  group_by(V2) %>% #V2 열값을 기준으로 데이터를 그룹화
  summarise(V3 = sum(V3)) %>% #그룹화된 데이터의 V3열값을 합산하여 새로운 열로 만들기
  rename(시군구 = V2, 피부염발생건수= V3)
print(new_dermatitis2022, n=300)

#csv 파일로 저장하기
write.csv(new_cough2022, file="cough2022.csv", row.names = TRUE, fileEncoding = 'cp949')
write.csv(new_asthma2022, file="asthma2022.csv", row.names = TRUE, fileEncoding = 'cp949')
write.csv(new_dermatitis2022, file="dermatitis2022.csv", row.names = TRUE, fileEncoding = 'cp949')