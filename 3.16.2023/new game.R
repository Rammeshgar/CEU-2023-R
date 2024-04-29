
guess_me_game<-function() {
  maxnum<- as.integer(readline("What shoud be the Max Number")) 
  your_chancess<- as.integer(readline("How many chances woud you have?"))

  bot_choise<- sample(0:maxnum,1)
  new_game<-T
  new_game<-while (your_chancess>=0) {
  
    your_guess<-as.integer(readline("guess me:"))
    result<-""
    if (your_guess==bot_choise) {result="damn right"}
    else if (your_guess>bot_choise) {result="higher than the answer"}
    else if (your_guess<bot_choise) {result="lower than the answer"}
    else(print("write a number with the limitation that you choosed"))
  
    print(paste("your choise is:", result,",","Chancess left:", your_chancess))
  
    your_chancess<-your_chancess-1
    
    if (your_chancess<0) {print("Such a loser")
     new_game=F }
  }
}

guess_me_game()
