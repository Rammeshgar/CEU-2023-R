#How many seats does the airplane have which flow the most times from JFK to MCO?
amount_flights<-
  flights %>% 
  filter(origin=="JFK", dest=="MCO") %>% 
  group_by(tailnum) %>% 
  summarise(amount_flights=n()) %>% 
  arrange(-amount_flights) %>% 
  head(1)

merge(x = amount_flights, y = planes, by.x = "tailnum", by.y = "tailnum") %>% 
  select(tailnum, amount_flights, seats)

#What is the name of the airport(not the id) which was the most visited 
#destination from June to September?
most_visit<-
  flights %>% 
  filter(month==6:9) %>% 
  group_by(carrier) %>% 
  summarise(most_visit=n()) %>%
  arrange(-most_visit) %>% 
  head(1)

merge(x = most_visit,y = airports, by.x = "carrier", by.y = "carrier" ) %>% 
  select(name)

#What was the average temperature in the EWR airport in June by year
#(every year June average temperature)?

weather %>% 
  filter(month==6, origin=="EWR") %>% 
  group_by(year) %>% 
  summarise(June_temp=mean(temp))
June_temp<-
#How many engines has the plane who made the JFK to MIA distance the fastest on average?
fastest__<-
  flights %>% 
  filter(origin=="JFK", dest=="MIA") %>% 
  group_by(tailnum) %>% 
  summarise(fastest__=mean(air_time)) %>% 
  arrange(-fastest__) %>% 
  head(1)
merge(x = fastest__,y = planes,by.x = "tailnum", by.y = "tailnum") %>% 
  select(engines)

#give the date and the type of engine used in plane which had highest arrival delay?
my_flight<-
flights %>% 
  group_by(tailnum) %>% 
  summarise(my_flight=max(arr_delay,na.rm=T)) %>% 
  arrange(-my_flight) %>% 
  head(1)
merge(x = my_flight,y = planes,by.x = "tailnum",by.y = "tailnum") %>% 
  select(tailnum,year,engine)
  


#what was the pressure of weather for the airplane with the longest hour in air in august(one flight)?
my_hour<-
flights %>% 
  filter(month==8) %>% 
  group_by(origin) %>% 
  summarise(my_hour=max(hour,na.rm=T)) %>% 
  arrange(-my_hour) %>% 
  head(1)
my_pressure<-
weather %>% 
  filter(origin=="JFK", month==8) %>% 
  summarise(my_pressure=mean(pressure, na.rm = T))
paste(my_hour,my_pressure)
       