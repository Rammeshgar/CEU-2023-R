library(dplyr)
  
mtcars[mtcars$hp>200,]

#dplyr
mtcar %>% 
  filter(hp>200)  

mtcars %>%
  filter(hp<200 & qsec>15 & gear == 3)

mtcars %>%
  filter(hp<200 & qsec>15 & gear == 3) %>% 
  arrange(-hp, -qsec)

mtcars$power<- mtcars$hp*mtcars$cyl


mtcars %>% 
  mutate(power2 = hp*cyl, col_2 = qsec/gear)

iris %>% 
  filter(Sepal.Length>5) %>% 
  mutate(sum_lenght=Sepal.Length+Sepal.Width+Petal.Length+Petal.Width) %>% 
  arrange(-sum_lenght)

iris %>% 
  filter(Sepal.Length>6) %>% 
  mutate(mean_lenght=(Sepal.Length+Sepal.Width+Petal.Length+Petal.Width)/4) %>% 
  arrange(-mean_lenght)

df<-starwars

df$films  

df %>% 
  summarise(num_of_row=n())
