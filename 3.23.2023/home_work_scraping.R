

library(rvest)
library(data.table)
library(xml2)

url<-"https://www.yachtworld.co.uk/boats-for-sale/?page=2"

my_boat1<-read_html(url)

boat_names<-my_boat1 %>% html_nodes(".listing-card-title") %>% html_text()

my_links<-my_boat1 %>% html_nodes(".regular") %>% html_attr("href")

###
url2<-"https://www.yachtworld.co.uk/yacht/1996-custom-boutique-cruise-ship-minerva-8588637/"
my_boat<-read_html(url2)

boat_size<-my_boat %>% html_nodes(".heading") %>% html_text()

boat_price<-my_boat %>% html_nodes(".payment-total") %>% html_text()

boat_area<-my_boat %>% html_nodes(".summary .location") %>% html_text()

df<-data.frame("Name and Size"=boat_size,"Price"=boat_price,"Area"=boat_area,"Links"=url2)


try2<-read_html("https://www.yachtworld.co.uk/boats-for-sale/?page=3") %>% html_nodes(".listing-card-title") %>% html_attr("href")
