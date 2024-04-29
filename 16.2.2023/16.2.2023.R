library(nycflights13)

nycflights13::airlines

View(nycflights13::airports)

airlines<- nycflights13::airlines
airports<- nycflights13::airlines
flights<- nycflights13::flights
planes<-nycflights13::planes
weather<-nycflights13::weather

library(dplyr)
str(flights)
flights %>%
  filter(dep_delay>10, month==1) %>% 
  summarise(num_of_rows=n())


flights %>% 
  filter(origin=="LGA" ) %>% 
  summarise(nu_of_flight=n(),
            average_arrive= mean(arr_delay, na.rm = T),
            max_delay=max(arr_delay, na.rm = T))

df<-
flights %>% 
  filter(origin=="EWR"| origin=="JFK") %>%
  group_by(tailnum) %>% 
  summarise(average_arr_delay= mean(arr_delay, na.rm = T)) %>% 
  arrange(average_arr_delay) %>% 
  mutate(abs_avrege_delay=abs(average_arr_delay)) %>% 
  arrange(abs_avrege_delay) %>% 
  head(1)

df  
