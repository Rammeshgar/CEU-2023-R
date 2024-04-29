

library(nycflights13)
nycflights13::airlines
nycflights13::airports
nycflights13::flights
nycflights13::planes
library(ggplot2)
library(dplyr)
View(airports)
data(airlines)
#show me a bar chart which show me the top ten destination.
View(flights)
top_dest<-
flights %>% 
  group_by(dest) %>% 
  summarise(num_flight= n()) %>% 
  arrange(-num_flight) %>% 
  head(10)

ggplot(top_dest, aes(reorder(dest, num_flight, decreasing=T), num_flight))+
  geom_col()+
  theme_bw()+
  labs(x= "Destination", y= "Number of flights", title = "Top Ten Destination")

best_carrier<-
flights %>% 
  group_by(carrier) %>% 
  summarise(my_mean=mean(arr_delay, na.rm=T)) %>% 
  arrange(my_mean)

ggplot(best_carrier, aes(x=reorder(carrier, my_mean, decreasing=F),y=my_mean))+
  geom_col(color="limegreen", fill="cyan4")+
  theme_bw()+
  labs(title= "Best Carrier On Arriving", x= "Carrir", y= "Average Arrival Delay")

ave_del<-
flights %>% 
  filter(month==8) %>% 
  group_by(dest) %>% 
  summarise(average_arrival_delay=mean(arr_delay,na.rm = T)) %>% 
  arrange(average_arrival_delay) %>% 
  head(10)

df<-
merge(x= ave_del, y = airports, by.x ="dest" , by.y = "faa") %>% 
  select(average_arrival_delay, name)
 

ggplot(df, aes(reorder(name, average_arrival_delay, decreasing=F), average_arrival_delay))+
  geom_col()+
  theme_bw()+
  labs(x= "Destination",y= "Average Delay", title="Average arrival delay")+
  theme(axis.text.x = element_text(angle = 60, vjust = 0.5, hjust=0.5))

#For this exercise, we are going to visualize the distribution the of on time departure rate 
#across all the three major NYC airports. We consider any flight delayed for 5 minutes or more to be delayed:

my_flight<-
flights %>% 
  group_by(origin) %>% 
  summarise(my_mean=mean(flight, na.rm=T)) %>% 
  arrange(-my_mean) %>% 
  head(3)

top_port<-
flights %>%
  group_by(origin) %>% 
  filter(origin=="EWR", origin=="LGA", origin=="JFK") %>% 
  summarise(dep_mean=sum(dep_time, na.rm = T)) %>% 
  arrange(-dep_mean)


