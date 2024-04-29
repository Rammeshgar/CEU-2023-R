

library(rvest)
library(xml2)

t<- read_html("https://www.boatinternational.com/yachts-for-sale")

write_html(t, "boat.html")

t %>% html_nodes(".card__title--sponsored a") %>% html_text()

########

my_links<-t %>% html_nodes(".card__title--sponsored a") %>% html_attr("href")

my_links<-paste0("https://www.boatinternational.com",my_links)

url<-"https://www.boatinternational.com/yachts-for-sale/emocean-rosetti-2021"
boat<- read_html(url)


boat_name<-boat %>% html_nodes(".heading--large") %>% html_text()

boat_name<-gsub(" for sale","",boat_name)

boat_stat<-boat %>% html_nodes(".stats__heading span") %>% html_text()

boat_type<-boat_stat[1]
boat_price<-boat_stat[2]

#data.frame("a"=3,"b"=5,"c"=7)
data.frame("url"=url,"boat name"=boat_name, "boat type"=boat_type, "boat price"=boat_price)

####

url<-"https://www.boatinternational.com/yachts-for-sale/blue-sky-feadship-2013"
boat<- read_html(url)

data_list<-list()

boat_name<-boat %>% html_nodes(".heading--large") %>% html_text()

data_list[["boat_name"]]<-gsub(" for sale","",boat_name)

boat_stat<-boat %>% html_nodes(".stats__heading span") %>% html_text()

data_list[["boat_type"]]<-boat_stat[1]
data_list[["boat_price"]]<-boat_stat[2]

data_list[["url"]]<-url

get_boat_detail <- function(url) {
  boat<- read_html(url)
  
  
  boat_name<-boat %>% html_nodes(".heading--large") %>% html_text()
  
  boat_name<-gsub(" for sale","",boat_name)
  
  boat_stat<-boat %>% html_nodes(".stats__heading span") %>% html_text()
  
  boat_type<-boat_stat[1]
  boat_price<-boat_stat[2]
  
  #data.frame("a"=3,"b"=5,"c"=7)
 my_df<- data.frame("url"=url,"boat name"=boat_name, "boat type"=boat_type, "boat price"=boat_price)
 return(my_df)
}

d<-get_boat_detail("https://www.boatinternational.com/yachts-for-sale/fortitude-intermarine-usa-1998")

get_boat_detail(my_links[2])
df<-data.frame()

for (link in my_links) {
  tdf<-get_boat_detail(link)
  df<-rbind(df,tdf)
}
