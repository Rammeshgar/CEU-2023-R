
library(ggplot2)

mtcars

ggplot(mtcars, aes(x=mpg, y=hp, color=am))+
  geom_point()

ggplot(mtcars, aes(x=mpg, y=hp, color=as.factor(am)))+
  geom_point()

ggplot(mtcars, aes(x=mpg, y=hp, color=as.factor(am)))+
  geom_point()+
  labs(x="Miles per our", y="horse power", color="automata", title = "Mtcars", subtitle = "General data")

ggplot(mtcars, aes(x=mpg, y=hp, color=as.factor(am), shape=as.factor(gear)))+
  geom_point()+
  labs(x="Miles per our", y="horse power", color="automata", title = "Mtcars",
       subtitle = "General data", shape= "gear")+
  theme_dark()
