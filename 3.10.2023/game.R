

# this file gonna be rock paper scissors game!

game <- function() {
  my_list<-c("rock","paper","csissors")
  your_choise<-readline("wellcom in the game!\nplease choose\nrock=1, paper=2, scissors=3\nwhat is your choise?")
  #c(1,2,3)
  your_choise<-as.integer(your_choise)
  computers_choise<-sample(c(1,2,3),1)
  print(paste("your choise is ", my_list[your_choise], "computers choise", my_list[computers_choise]))
  
  if (your_choise==1 & computers_choise==1) {
    print("draw")
  } else if (your_choise==1 & computers_choise==2) {
    print("you lose")
  } else if (your_choise==1 & computers_choise==3) {
    print("you won")
  }  else if (your_choise==2 & computers_choise==1) {
    print("you won")
  } else if (your_choise==2 & computers_choise==2) {
    print("draw")
  } else if (your_choise==2 & computers_choise==3) {
    print("you lose")
  } else if (your_choise==3 & computers_choise==1) {
    print("you lose")
  } else if (your_choise==3 & computers_choise==2) {
    print("you won")
  } else if (your_choise==3 & computers_choise==3) {
    print("draw")
  }
}
game()



###computer think about a number 1:100 guess the number 