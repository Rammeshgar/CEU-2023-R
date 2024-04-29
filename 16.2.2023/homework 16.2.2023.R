

#Filter the flights data where departure delays was over 1000.
flights %>% 
  filter(dep_delay>1000)

#Filter the flights data where departure delays was over 500 and 
#destination was MIA and carrier either EV, AA, US .
flights %>% 
  filter(dep_delay>500, dest=="MIA", carrier=="EV"| carrier=="AA"| carrier=="US")

#Merge the result with the airlines datasets.
flights %>% 
  filter(dep_delay>500, dest=="MIA", carrier=="EV"| carrier=="AA"| carrier=="US") %>% 
  merge(airlines)

#Create a new column in the flights dataset of the first three column which 
#will be a string like 2015-01-15
flights<-
flights %>% 
  mutate(my_date=paste(year,month,day))

flights %>% 
  cbind(my_date=paste(year,month,day))

my_date<- paste('col_',1:ncol(flights))

my_date<- abs(year,months,day)  

#Create a new column delays which will indicate the delays, sum of 
#absolute values of two delays
newflight<-flights
newflight$new_col= paste(newflight$year, "_", newflight$month,"_",newflight$day)

newflight %>% 
  select(year, month, day, new_col)
  

#What is the carrier name of the flights which had the most departure delay.
flights %>% 
  group_by(carrier) %>% 
  arrange(-dep_delay) %>% 
  head(1)

