

library(rvest)
library(xml2)

data_receiver <- function(mlinks) {
  
  url2<-"https://www.imdb.com/list/ls569089867/"
  
  mt<-read_html(url2)
  
  mnames<-mt %>% html_nodes(".lister-item-header a") %>% html_text()
  
  mlinks<-mt %>% html_nodes(".lister-item-header a") %>% html_attr("href")
  
  mlinks<-paste0("https://www.imdb.com",mlinks)
  
  mscore<-mt %>% html_nodes(".ipl-rating-star.small .ipl-rating-star__rating") %>% html_text()
  
  mgenre<-mt %>% html_nodes(".genre") %>% html_text()
  mgenre<-gsub("\n","",mgenre)
  
  data.frame("Movie's Name"=mnames,"Movie's Score"=mscore,"Movie's Genre"=mgenre,"Movie's Links"=mlinks)
}

Sci_Fi_movies<-data.frame()

mdf<-data_receiver(links)
Sci_Fi_movies<-rbind(Sci_Fi_movies,mdf)




