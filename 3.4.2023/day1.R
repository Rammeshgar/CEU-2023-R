

#calculate the sum of each section and separate the highest value

#step 1 = read the data

my_data <- readLines("day1.txt")


group_colories<-c()
sum_1<-0

for (i in my_data) {
  print(i)
  if (i=="") {
    group_colories<-c(group_colories, sum_1)  
    sum_1<-0
  }else{
    sum_1<- sum_1+ as.numeric(i)
  }
}

group_colories

max(group_colories)
sum(head(sort(group_colories,decreasing = T),3))




# group_colories <- c(group_colories, a)


