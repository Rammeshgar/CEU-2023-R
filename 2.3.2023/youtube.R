height <- 2

height 

width <- 4

width 

TRUE
class(TRUE)

FALSE
class(FALSE)


T
F

2
2.5
2L
class(2)
class(2L)

is.numeric(2)
is.numeric(2L)

is.integer(2)
is.integer(2L)

as.numeric(TRUE)

as.numeric(FALSE)

as.character(4)

as.character("4.5")
as.numeric("4.5")

as.integer("4.5")

as.numeric("Hello")

c("hearts", "spades", "diamonds", "spades")

drawn_suits <- c("hearts", "spades", "diamonds", "spades")
drawn_suits

is.vector(drawn_suits)

remain <- c(11, 12, 11, 13)
suits <- c("hearts", "spades", "diamonds", "clubs")
names(remain) <- suits
remain

str(remain)

my_apples<- 5
my_oranges<- "six"

is.vector(my_apples)
is.vector(my_oranges)

length(my_apples)
length(my_oranges)

length(drawn_suits)

drawn_ranks<- c(7, 4, "A", 10, "K", 3, 2, "Q")
drawn_ranks
class(drawn_ranks)
my_apples+ my_oranges
is.numeric(my_oranges)
is.numeric(my_apples)

earnings<- c(50, 100, 30)
earnings*3
earnings/10
earnings-20
earnings+100
earnings^2
expences<- c(30, 40, 80)
earnings-expences
earnings+c(10, 20, 30)
earnings*c(1, 2, 3)
earnings/c(1, 2, 3)
bank <- earnings - expences
bank
sum(bank)
earnings>expences

remain_black<- remain[c(2, 4)]
remain_black

remain[-2]
remain[-c(1, 3, 4)]

selection_vector<- c(FALSE, TRUE, FALSE, TRUE)
remain[selection_vector]

remain[c(TRUE, FALSE)]
remain[c(TRUE, FALSE, TRUE)]
 
matrix(1:3, nrow =2, ncol = 3)

