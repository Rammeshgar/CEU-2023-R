

library(rvest)
library(data.table)
library(xml2)
library(plyr)
library(purrr)

url<-"https://www.boat24.com/en/secondhandboats/?page=20"

t<-read_html(url)

my_links<- t%>%
  html_nodes(".blurb__title a") %>% 
  html_attr("href")

#link of pages
my_num<-seq(from=0,to=19740,by=20)
my_urls<-paste0("https://www.boat24.com/en/secondhandboats/?page=",my_num)

html_list<-map(my_urls,read_html)

link<- my_urls %>% map_df(~read_html(.x) %>% html_table())

all_links<-html_list %>%
  html_nodes(".blurb__title a") %>% 
  html_attr("href")

###
url<-"https://www.boat24.com/en/powerboats/fairline/fairline-sprint-21/detail/530403/"
t<-read_html(url)

boat_list<-list()

Bname<-t %>% html_nodes(".heading__title") %>% html_text()
boat_list[["name"]]<-Bname

Bprice<-t %>% html_nodes("#contact strong") %>% html_text()
Bprice<-gsub(",-","",Bprice)
boat_list[["price"]]<-Bprice

Bloc<-t %>% html_nodes("#location .text") %>% html_text()
boat_list[["location"]]<-Bloc

Bstat<-t %>% html_nodes(".heading__title-header") %>% html_text()
boat_list[["status"]]<-Bstat

Blink<-url
boat_list[["link"]]<-url

boat_info<-data.frame("Name"=Bname,"Status"=Bstat,"Location"=Bloc,"Price"=Bprice,"Link"=Blink)


get_info <- function(url) {
  t<-read_html(url)
  
  boat_list<-list()
  
  Bname<-t %>% html_nodes(".heading__title") %>% html_text()
  boat_list[["name"]]<-Bname
  
  Bprice<-t %>% html_nodes("#contact strong") %>% html_text()
  Bprice<-gsub(",-","",Bprice)
  boat_list[["price"]]<-Bprice
  
  Bloc<-t %>% html_nodes("#location .text") %>% html_text()
  boat_list[["location"]]<-Bloc
  
  Bstat<-t %>% html_nodes(".heading__title-header") %>% html_text()
  boat_list[["status"]]<-Bstat
  
  Blink<-url
  boat_list[["link"]]<-url
  
  boat_info<-data.frame("Name"=Bname,"Status"=Bstat,"Location"=Bloc,"Price"=Bprice,"Link"=Blink)
  return(boat_info)
}

we<-get_info("https://www.boat24.com/en/sailingboats/frauscher/frauscher-trias/detail/440736/")
wr<-get_info(my_links[7])


df_list<-lapply(my_links, get_info)
df<-rbindlist(df_list,fill=T)
