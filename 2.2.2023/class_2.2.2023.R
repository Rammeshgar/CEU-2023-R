a<-10
if (a>11) {
  print('bigger than 5')
  
}
a<-"hello"
typeof(a)
if (typeof(a)=='double') { 
  print("a is number")
} else{
  print("a is string")
}
a<-50.1
if (a>50) {
 print("very big") 
}else if (a>40) {
  print("big")
}else if (a>20) {
  print("medium")
}else{
  print("small")
}

mtcars
df<-mtcars
str(df)
nrow(df)

if (nrow(df)>40) {
  print("is bigger than 40")
}else if (nrow(df)>30) {
  print("is bigger than 30")
}
for (i in 1:10) {
  print(i)
}
for (letter in letters) {
  print(letter)
}
length(letters)
seq(1,length(letters),2)
for (i in seq(1,length(letters),2)) {
  print(letters[i])
}
















