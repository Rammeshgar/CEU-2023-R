


winner <- function() {
  
  your_score<- 0
  bot_score<-0
  game<- T
  while (game) {
    my_list<-c("rock","paper","csissors")
    your_choise<-readline("wellcom in the game!\nplease choose\nrock=1, paper=2, scissors=3\nwhat is your choise?")
    #c(1,2,3)
    your_choise<-as.integer(your_choise)
    computers_choise<-sample(c(1,2,3),1)
    print(paste("your choise was", my_list[your_choise],",", "computers choise was", my_list[computers_choise]))
    
    result<-""
    
    if (your_choise==1 & computers_choise==1) {
      print("this round is draw")
      result="draw"
    } else if (your_choise==1 & computers_choise==2) {
      print("you lose this round")
      result="you lose"
    } else if (your_choise==1 & computers_choise==3) {
      print("you won this round")
      result="you won"
    }  else if (your_choise==2 & computers_choise==1) {
      print("you won this round")
      result="you won"
    } else if (your_choise==2 & computers_choise==2) {
      print("this round is draw")
      result="draw"
    } else if (your_choise==2 & computers_choise==3) {
      print("you lose this round")
      result="you lose"
    } else if (your_choise==3 & computers_choise==1) {
      print("you lose this round")
      result="you lose"
    } else if (your_choise==3 & computers_choise==2) {
      print("you won this round")
      result="you won"
    } else if (your_choise==3 & computers_choise==3) {
      print("this round is draw")
      result="draw"
    }
    
   if (result=="you won") {your_score=your_score+1} 
    else if (result=="you lose") {bot_score=bot_score+1}
    
    if (your_score==3) {
      print("digger winner")
      game<-F
    }else if (bot_score==3) {
      print("Such a loser")
      game<-F
    }
  }
}
winner()
