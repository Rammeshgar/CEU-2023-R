year<- 2400

if(year%%4 !=0){
  print('not leap year' )
} else{
  if(year%%100 !=0){
    print('it is leap year')
  } else{
    if(year%%400 !=0){
      print("its not a leap year")
    }else{
      print("its a leap year")
    }
  }
}
year<- 3400
leap_year_check <- function(year) {
  if(year%%4 !=0){
    return('not leap year' )
  } else{
    if(year%%100 !=0){
      return('it is leap year')
    } else{
      if(year%%400 !=0){
        return("its not a leap year")
      }else{
        return("its a leap year")
      }
    }
  }
}
leap_year_check(year=5400)
for (e in 2000:2020) {
  t<-leap_year_check(e)
  
  print(t)
}
i<-12
for (i in 1:100) {
   if(i%%3==0&i%%5==0){
    print('fizz buzz')
  }else if (i%%3==0) {
    print("fizz")
  }else if(i%%5==0){
    print("buzz")
  }else{
    print(i)
  }
}
