a<- 11

if (a%%2==0) {
 print('even') 
} else{
  
  print('odd')
}
checknumber <- function(x) {
  if (x%%2==0) {
    return('even') 
  } else{
    
    return('odd')
  }
  return("hello")
}

checknumber(25)

multi <- function(a, b) {
  return(a*b)
}
multi(6, 7)

ifelse(1:10%%2==0,yes = 'even', no = 'odd')

for (x in 1:20) {
  print(paste(x, 'is a', checknumber(x), 'number'))
}

height<- 170
weight<-53
height<- height/100

bmi<- weight/(height^2)

# If your BMI is less than 18.5, it falls within the underweight range.
# If your BMI is 18.5 to <25, it falls within the healthy weight range.
# If your BMI is 25.0 to <30, it falls within the overweight range.
# If your BMI is 30.0 or higher, it falls within the obesity range.
# w\h(m)2
if (bmi>30) {
  print('obesity')
}else if(bmi>25){
  print("overweight")
}else if(bmi>18.5){
  print("normal")
}else{
  print("underweight")
}
  
calcu_bmi <- function(height, weight) {
  height<- height/100
  
  bmi<- weight/(height^2)
  
  if (bmi>30) {
    return('obesity')
  }else if(bmi>25){
    return("overweight")
  }else if(bmi>18.5){
    return("normal")
  }else{
    return("underweight")
  }
}
calcu_bmi(height = 190, weight = 90)

for (tem_weight in 90:100) {
 print(calcu_bmi(height = 190, weight = tem_weight))
}

