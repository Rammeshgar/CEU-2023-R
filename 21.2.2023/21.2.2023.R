
library(dplyr)
#Which airplane was in the air the most time?

flights<-nycflights13::flights

flights %>% 
  group_by(tailnum) %>% 
  summarise(in_air=sum(air_time, na.rm = T)) %>% 
  arrange(-in_air) %>% 
  head(1)

flights %>%
  filter(!is.na(tailnum)) %>% 
  group_by(tailnum)%>%
  summarise('in_air'= sum(air_time) ) %>%
  arrange(-in_air)%>%
  head(1)

#What is the name of the airline company which had the most arrival delay on average in August?
mostlate<-
flights %>% 
  filter(month==8) %>%
  group_by(carrier) %>% 
  summarise(my_mean=mean(arr_delay, na.rm=T)) %>% 
  arrange(-my_mean) %>% 
  head(1)

merge(x = mostlate, y = airlines, by.x = "carrier", by.y = "carrier") %>% 
  select(name)

#Who is the manufacturer of the flights that flow the most times from 
#EWR and how much times it flow?
num_flights<-
flights %>% 
  filter(is.na(tailnum)==F) %>% 
  filter(origin=="EWR") %>% 
  group_by(tailnum) %>% 
  summarise(num_flights=n()) %>% 
  arrange(-num_flights) %>% 
  head(1)

merge(x = num_flights, y = planes, by.x = "tailnum", by.y = "tailnum") %>% 
  select(tailnum, num_flights, manufacturer)
  
#How many seats does the airplane have which flow the most times from JFK to MCO?
amount_flights<-
  flights %>% 
  filter(origin=="JFK", dest=="MCO") %>% 
  group_by(tailnum) %>% 
  summarise(amount_flights=n()) %>% 
  arrange(-amount_flights) %>% 
  head(1)


