

library(rvest)
library(data.table)
library(xml2)
library(plyr)


get_b_detail <- function(url) {
  # url<-"https://www.boatinternational.com/yachts-for-sale/blue-sky-feadship-2013"
  boat<- read_html(url)
  
  data_list<-list()
  
  boat_name<-boat %>% html_nodes(".heading--large") %>% html_text()
  
  data_list[["boat_name"]]<-gsub(" for sale","",boat_name)
  
  boat_stat<-boat %>% html_nodes(".stats__heading span") %>% html_text()
  
  data_list[["boat_type"]]<-boat_stat[1]
  data_list[["boat_price"]]<-boat_stat[2]
  
  data_list[["url"]]<-url
  
  data_list$boat_name
  
  keys<-boat %>% html_nodes(".spec-block__title") %>% html_text()  
  
  values<-boat %>% html_nodes(".spec-block__data") %>% html_text()
  
  if (length(keys)==length(values)) {
    for (i in 1:length(keys)) {
      print(i)
      print(keys[i])
      print(values[i])
      data_list[[keys[i]]]<-values[i]
    }
  }
  df<-data.frame(data_list)
  return(df)
}


df<-get_b_detail("https://www.boatinternational.com/yachts-for-sale/the-great-escape-sanlorenzo-2020")

my_links<-c("https://www.boatinternational.com/yachts-for-sale/the-great-escape-sanlorenzo-2020",
            "https://www.boatinternational.com/yachts-for-sale/emocean-rosetti-2021",
            "https://www.boatinternational.com/yachts-for-sale/blue-sky-feadship-2013",
            "https://www.boatinternational.com/yachts-for-sale/lucy-tecnomar-2022")


#first solution
dfr<-data.frame()

for (i in my_links) {
  print(i)
  df<-get_b_detail(i)
  dfr<-rbind.fill(dfr,df)
}

#second solution

list_of_df<-lapply(my_links, get_b_detail)
df<-rbindlist(list_of_df,fill=T)
