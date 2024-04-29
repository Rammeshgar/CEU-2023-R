df <- read.csv('http://bit.ly/CEU-R-heights')
str(df)
nrow(df)
length(df)
dim(df)
dim(df)[2]
dim(df)[1]
row.names(df)
colnames(df)

cars<- mtcars
View(mtcars)
cars$name<-row.names()
nrow(cars)
1:nrow(cars)
View(mtcars)
row.names(cars)<-1:nrow(cars)

df$heightIn

df$heightIn<-df$heightIn*2.54
round(df$heightIn)
df$heightIn<-round(df$heightIn,0)

df$weightLb<- round(df$weightLb* 0.45, 0)

colnames(df)[4]<- 'height_cm'

colnames(df)[5]<-'weight_kg'

length(c('col1', 'col2', 'col3', 'col4', 'col5'))

paste0('col_',1:ncol(df))


mtcars
mean(mtcars$hp)

min(mtcars$hp)
max(mtcars$hp)

paste0("hello","gollo")
paste("hello","gollo")

paste("mtcars data set has", nrow(mtcars), "the average hp is",
      min(mtcars$hp), "the minimum hp is", max(mtcars$hp), "the max hp is")

summary(mtcars)
mtcars[5:10, "cyl"]

mtcars[mtcars$cyl == 8,]

mtcars[mtcars$hp > 200,]
nrow(mtcars[mtcars$hp > 200,])
mtcars$hp>200
sum(mtcars$hp>200)
mtcars[mtcars$hp > 200,"mpg"]

mean(mtcars[mtcars$hp > 200,"mpg"])

summary(mtcars$qsec)
mtcars[mtcars$hp< 200, "qsec"]
min(mtcars[mtcars$hp< 200, "qsec"])
max(mtcars[mtcars$hp< 200, "qsec"])
