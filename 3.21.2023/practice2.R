

library(rvest)
library(xml2)

url<-"https://www.imdb.com/search/name/?match_all=true&start=1&ref_=rlm"
t<- read_html(url)
t %>% html_nodes(".lister-item-header a") %>% html_text()
pnames

"https://www.imdb.com/search/name/?match_all=true&start=1&ref_=rlm"
"https://www.imdb.com/search/name/?match_all=true&start=51&ref_=rlm"
"https://www.imdb.com/search/name/?match_all=true&start=101&ref_=rlm"
"https://www.imdb.com/search/name/?match_all=true&start=151&ref_=rlm"

my_num<-seq(from=1,to=151,by=50)
paste0("https://www.imdb.com/search/name/?match_all=true&start=",my_num,"&ref_=rlm")
